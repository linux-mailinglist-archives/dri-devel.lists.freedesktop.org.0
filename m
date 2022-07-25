Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817E58088E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3D10F867;
	Mon, 25 Jul 2022 23:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0C110F7A8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793301;
 bh=cWc+P/N292JSMbgctME39wsxDyYDadG6TsLkg7Un5Gw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ND2R+1b9iDwURqYH3hffnFbKtI3XU8GTTXLV9R+rS7GA7QWeLGgx7EiAT+YIKdS65
 qEeSdnwq1/trxOHP8W95w+LfDMRXi/kUE2/fVK3WPex+cq3epRGNMd6NhmVVwEayu2
 8vWN42VjE5tS0O8qr/85ut2+HsvCVYz6dYbLMqlM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N1wll-1nVojK3zrt-012D56; Tue, 26 Jul 2022 01:55:01 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 30/32] drm/via: Add Kconfig
Date: Mon, 25 Jul 2022 16:53:57 -0700
Message-Id: <20220725235359.20516-11-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C0AoNCAC7HApVTVBQWwYwk/bLRAQE8xN5j2KUX1Csrj8jDzesR5
 ofo7DJpLHuGtYCuXnfVxKehhKCbiVtYtzDNyQc5klr6yb2EwYZ8zt8K1iVtMgPPOAN9nK97
 ugb5DxRWpFocNO9qhY7+Y+1jxQogRKgv5Dq+RGKP1G7mxMCgaaQLec0aBILvIUdjq9Ww1wO
 DG2vW1ujTR3Z8JhUpmLTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QSehRYhltn0=:VUl7ERVT2teCfxyc46op45
 xR0eiFqP1PHAlQhLQU1y2w2CnvQOk/b8DNmxSy9SM7alCCaw3jEP6GL9NdZWFjFWi03pLSXDF
 El47bFrS7Gdi4Ym2KXr1xDApL+GR6qVR/Rv/zci/3p6u9iOMHSvapdMoeJ19MHDCa6YDobfqT
 oPgaxIvzJAxI64gF00biSlQUdIn+9O4ChtN4PJNpJjLyUFMathShfbOezzmukcfSZ2ggihBD1
 TQk+Y9YAS16a+e4xfympNoXopXCDZKCe/i64G3nRL+wu1npO7i4YfHpMbfc4VvrrfkJ6WCQGA
 EW4Qvmq6jUAeZVeD453Lep/nIxqtNrlFdQfdknd5xw5br667DQtEx0YBqqGcGMzAxiQTWmV9H
 7a9Iu4WXPPyiGuuoxb3jTcCQoVqOSTAXwPdxKLN0ZVkIpUE/7H50QaBwfj9ijw3c31DajAsav
 JGiw2V1kXLK6Mf1pqmsgIjQTHAtfG/WBTn1k5pieNVyFWRaO75hSjns0TnPyDiPlfXZYp+AEg
 6QzPVCrBGFemMBuNJ9C4YapB/lGpMCwHP3iIFNwDbUFpF+852jp+icBR6rT5UVqAT07aep6Hl
 Y7PF/MRlbk6j3u2BjqjY2B+6d/EaC1oOLa5jAcEMn5h61/wu5UdBodYMrDn6F3IIoUGnROD5l
 uEm91sUlBnXm8vIZmoGgDT9ncyXaDHES3QUAq97ouGW5WMd/utbGB312YBG1VcPUZIK2UDPPT
 0N5WixjHDva85m+YUw7TIAzk5xG4+7Z1lq4zQvFIQHUNUcVUcfOemCfnVd49Rgsjcd3h9MYXG
 9qf5HPDn3ze0iNrNJU3dj+R+8n4j8MzyJS6E/U4B3lcTPRSTLlZdLi9GoNV05AyxdRaFw0ZgC
 VH8+/JSC/x6l+x0BPYf79aNDqOs3mF84WouLsDb2pEvMH1WTj40iQWbG0WhBacsZuL4lQvvNI
 auiyVnfH/oHJjtxoXaPxvhzM/Eor9BqfJwNf5MjZVf4P75YtIStMS3ihCkh+Htew51iPGTiCA
 b8bSX4iFeg6Cbyk7XiOvlYnhnJiJR0OQjCt+Hzn7/BJPS/j9DrIqIHQUWRcQs6VWOmZo1C6kM
 Gj7runkkchiYGuluNmamXByCCAidybCZJLvpHft3SXMzvfJRa4AN5+D+Q==
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
 drivers/gpu/drm/via/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 drivers/gpu/drm/via/Kconfig

diff --git a/drivers/gpu/drm/via/Kconfig b/drivers/gpu/drm/via/Kconfig
new file mode 100644
index 000000000000..7c4656a1d473
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/Kconfig
@@ -0,0 +1,9 @@
+config DRM_OPENCHROME
+	tristate "OpenChrome (VIA Technologies Chrome)"
+	depends on DRM && PCI && X86
+	select DRM_KMS_HELPER
+	select DRM_TTM
+	help
+	  Choose this option if you have VIA Technologies UniChrome or
+	  Chrome9 integrated graphics. If M is selected the module will
+	  be called via.
=2D-
2.35.1

