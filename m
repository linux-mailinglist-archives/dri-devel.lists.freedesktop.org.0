Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C419155F0BA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0AB112DF7;
	Tue, 28 Jun 2022 21:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3148112DF7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453377;
 bh=pxfy+UT5l42VA4LcXStAT+CB2mhSf7GSjL3dBox/1nk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MYCjxdj/62B3lw1k8COAweRk1MtH/bHTIQ7ja8cBM7gEMri5ciyNqI/uTcV3vyLHd
 OMy+w4Y9EjJdRCqwrgKrvmZtXTiEucYDgDo5tl6koBcUo7WNxfzse2cY/BALGLvxo8
 p3nnD6zAPkpA+sADMi6YBwtkBJk8eCfqqb/GsQl4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M9nxn-1o2iok2Lqv-005tX7; Tue, 28
 Jun 2022 23:56:16 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 31/32] drm/via: Add Makefile
Date: Tue, 28 Jun 2022 16:55:19 -0500
Message-Id: <20220628215520.20674-12-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b91dMSDKskVyGXSnTbfav8Un379QJPZz27B8jntBz5PeKMubzPq
 Wl6Ec4rcpbyY3hR8NaT7VKwo3dTbeNgO5zAwAQyN+xZs1Gc4kcH1g6azNpLakq7I/ZgoWss
 hOSFhW+ujJO527h/J9w38co/7xUvbEjtFcBW40AKJZN74hR+1zmFv+yY8RFcGPcZwWcs7Ov
 PLCSTBg0iFtMv6Zch5oEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vEjrKG8HMWY=:ADfldzNWD2qc5qzkYy1k70
 Vgui5vowEgzMyNPjlATzwX8nTYmp5J1lROW6WQ0UyOoWUgl07D8UEdKZhnDTx1E/8l+ZGFDXx
 ias1Yvip52c4Xn2gFQy5hmTApp4aa8GOgwic7hLCswL3VM01X1qyFMAdX3V5v8/oCgi4SuVay
 ZQZqA+N3VzOVPGenRvvtKQ2Ol7h+i0Qo45/3Xw4sqLxuC6BYaf3I9qmZxNUavvO70lrO8bZc6
 3nOqROFK+TLcYLf0vIOi7SHMDYL0RhQdsOymCXJHhUr9rXg1c3gDsUluuEElnvnNwIUGPpgT/
 tzqJ07yppyjMFvFlLPeTmyJv5d2uM8bSWl9zU8nbAU+iWZZQDiqk+Obn3Hn7HmZnldvgi677v
 /dEfZ52m4QYlctVx8LZPes2Buz3J83z+HvpqmSq88j27GMTTkH4/Sdby3uoYrF2dXgw2LBRmk
 Y/kSRkGn7yulnoqhKgfFdr6Q+yljYOoNTMMtJO71B+CgYYg/l1ozEzpPgRN/VH5D15hsIt6qf
 6xPA/SPM2wPkCYiG/l4IHJ6NEH/i5RS8L7Q0a3tgrMC32dMq/SEWc2WE0rvYOdIi9O9Z96H2S
 GY9dKh8/OdK3SHJzaCHPmzyhyl+/ZkzmQ2oIUM2EQWuo2VAbgsfuh8vgn/nGDmycAx25xnsZk
 AXX/zkK4YjSbfsXaimh3LCXEyhKWMA2xMv3eDvGXxEWyNIYevgT+BkO5gzFjUGG1I7mxz8gGU
 f/x4Ou4fQVGeLZqGRfUgzrtHlhBOwO1InG1bE81QG61mh9cJW9bAROPp46goca6Y+kkjLTmSo
 SYDyage/P3YADIatDNzE36cY5fAUAlaqmWlfsZtiObtEoU/sgb5H4cSbziSQfU1IGOESQQSfc
 lTXGp3jDgDW6OO+KRb5XbHUdNyw4CyDrKovsWURCAaJqdbyeGyiAfix/DlThlJ6TDgY3kUXjV
 QMw5frAy0MGja/5Br2lSuwsCk1xCs0LLg+hGbeAPKxQh0fA+MA8cZ4bRakbfh+Jhc0hsD++68
 dS3190OfrAVHbvFCI3W0/hze6kB9eOOZiV1Kj0fPRjkEd/hmYDaFGGtu3fUMxsTY+JbFk2GrD
 yCciDMdCDohiS/9MR3VVgzHuNp1H9E8RNu+vdOU9cORQjCAX5vpqXorow==
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

