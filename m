Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DF6580891
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DAE10F979;
	Mon, 25 Jul 2022 23:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23D710F7A8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793303;
 bh=pxfy+UT5l42VA4LcXStAT+CB2mhSf7GSjL3dBox/1nk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NViUf9mK7MLywzR87+K/RROVZ17I0JT8QtCFs+yIe/iODFO+pIXSxUkXOU/cWlLZ3
 3/HZj4nf/5BWJVWLiTaxz6Imch0dR6PRoqHdZ4yXLhXpmwXWWBs6GbOc880qUjdU0v
 wHQwRe0ypW3hovAOPDu5x0iaUGkPHgNRMITvD9GU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1M9nxt-1oAMc44BjZ-005uSC; Tue, 26 Jul 2022 01:55:02 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 31/32] drm/via: Add Makefile
Date: Mon, 25 Jul 2022 16:53:58 -0700
Message-Id: <20220725235359.20516-12-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zp45rOzWaXPq8iVW+btgELcefZPSNQKOAGxRJtomlG1ojfluuWm
 jixskiNiAvbaA7DHTTk8W7qqwUvcUbHTl/TPr2sDbBaaTF3b8uSVXcVAnINMUZoknj+biqc
 ZqnnKVegKjmeKyoss95TEotLjWKD85eQV2tdwojZhNEl8quHJCqW5PWgJ7RsKyRBeBlpjMX
 qJ97Wx3gEg7dZ77PQP6Ug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U7lt3Y9eGHM=:VGF7IXiTabf8u+CMQ4jFX2
 BC3myMW2dC8YGazjbtNfRZHTw61EWIy3RO6xdFAEzLC99StPlO6IOnZvR5dID/UDhGt1VxLvy
 RuI+t4UI0DIYi9fcr8aLheG0Eu4UNCjyY2jfAQIvcGTKdu3w1HRy9B5rqK6ez9OxNgK8Jeu2j
 CwtRKIUEiugBC8GNLakT22Xtm+UfHP3D8Amy7Ev0q9eTnFGHMNHbC1GAuhTUSY9G0tPH39pgr
 c5C7FRffdL46cUUm6bSLJ4/JalLX0rnPxy5zfPANNkF9Yoq+aUEvgZm9A9m1WbXCygqlgNCqU
 wJSL0ieIVPbVPcKHroifV4ju8g7LrJ3LNM2gmdXa6WSExu+FYett8PJaoJTmDp9p6mbr1V2JT
 O0ZYzcVR9PjzKxPtyi4ZnqJ8m4tlylP9tixUsle+cFlk+XRfg3rciReelrCI1SUM9i1WHIP15
 OH9Amfjfm2XK4l8VJyUS0xXA3unpbe6E2fEafmMFSQb3lJ+6jZA0DzjALZxAErnos6enXRB4w
 yNvze5ayYC16q/8mD4CKSdSzQbsS6KRTo7dIyJSKc8pQS3Pxxnb2bWLMuH+YsQffnNqBtr8+V
 p6ayKk1CFpF8XYHhUuPyCWkHcVXNZDmbmIWM+fPLlSUJaQJJ9H9PpdQbVDQaeJttECPaxMcTC
 v4idBEOJF7yF2+IEfYPTvDijZYKTRBlfzKF2O4/to6dSsrEnoJgRrFhfCxNhO6nT/D0c8ze1V
 mKtqwWV99ltCe0UbXGE+mhEqTgROPkRUWe9W9l5Wymqlu27da2eSSwKnuEMfGnCO3QyJVQtxr
 yF7FgSyxQ8DIWgsyrAl5qb1ltQnAUI4QqWj7iwSpRm0yQqdNXokc9go8EUDbvIFOM0nwqh5h/
 GPHcvjEozirKTwCXC+KAlYj7IGALkEzBWnhUCR1J7xXcxr4LMBYVIGgKs1pWyLBlM+9Xoecl6
 Uh10/ZSzPsHPTC/RfYr3MTf8E93YBpKEYDv9yMTBI7lv5stJ7FznP59mO4SHE3QfTFAxqbINz
 4wiQ2MazVqD88/OJiBXlxP1kh/GpULSZ/NpV8seF0bsc/itEB5SFSN8vghq4OaDStnsLV3VQ0
 bGjzHgrtId8iS2Niuuh0pR6mdvYKfaXjrDJqV4EFV0rMURqgkdoJSTOkA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/Makefile | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 drivers/gpu/drm/via/Makefile

diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/via/Makefile
new file mode 100644
index 000000000000..73ccacb4cd11
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/Makefile
@@ -0,0 +1,26 @@
+#
+# Makefile for the drm device driver.  This driver provides support for t=
he
+# Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
+
+ccflags-y :=3D -Iinclude/drm
+via-y :=3D via_crtc.o \
+		via_crtc_hw.o \
+		via_cursor.o \
+		via_dac.o \
+		via_display.o \
+		via_drv.o \
+		via_encoder.o \
+		via_hdmi.o \
+		via_i2c.o \
+		via_init.o \
+		via_ioctl.o \
+		via_lvds.o \
+		via_object.o \
+		via_pll.o \
+		via_pm.o \
+		via_sii164.o \
+		via_tmds.o \
+		via_ttm.o \
+		via_vt1632.o
+
+obj-$(CONFIG_DRM_OPENCHROME)	+=3D via.o
=2D-
2.35.1

