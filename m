Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B3855A2BF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FFB89AB5;
	Fri, 24 Jun 2022 20:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7D10F4A6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102825;
 bh=pxfy+UT5l42VA4LcXStAT+CB2mhSf7GSjL3dBox/1nk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PmkTezfKl7J8QoKJmtU4O996Koju6aQ8ryCGaIitwQv9Mr0uLxc4cpHGDRgfOhigH
 9LC8hWF9wRqiE2eZQHdQCfm3kGq6PLfQFDLDmzpnzrWh3wDyryCU3l36ZOsbps55P6
 qcsv5/lr+KqggJuX0t1z3ftZnT3nlH06EUNHLCOI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mk0JW-1nPCe71nKK-00kOGU; Fri, 24 Jun 2022 22:33:44 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 27/28] drm/via: Add Makefile
Date: Fri, 24 Jun 2022 15:32:58 -0500
Message-Id: <20220624203259.4051-8-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624203259.4051-1-kevinbrace@gmx.com>
References: <20220624203259.4051-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pIc8GqjudkrXo/F2MmhRSPjXkbqICwqdpkfr2d95bkxm3jD/Oi3
 El1Kb3iF9LATsHjziUAy4S6VC9+7YdyMePWUZY+Jf8lGcq5uRPPNfWQv9WFe5q429d9cH2V
 sv9bjG6L7Dyya3WXuOUetgqlZYSqDeXJzklqWrH5KBnC+JFIIL6bXy5ChRbAI7KGFBuRELx
 XU51KMXm+xWN5LP8XL26g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rJCSzhnnVnM=:PmERX5NNoS1xpnvx3UTYr8
 W7gfUudAkaTMQiLSHhCLgb1O+KwlYWd6Uk4hIWNuG8sQRw0i8db8Xsy3LJ/FF+WWmFlZ0hMAF
 FsS/fE9gQSB2CbWcM94jh8J4MlbGeMErwQnl5CvN+7DC4Su/ndUiW5jDV9F+A0VeT680+jURd
 lQfIuzUKRkbVUZNf58a9TQ9AjuzxqAtKLYb+V4jM4dG+jrSK1cqRdZVxv7jTqi9kM0wYsWCsL
 ORUGEA3zCKSJlQBlFH/MeB796yhWH8qRxNB3jepl2b3IHs7g50sLuy9LXfmJYYBVr135vsE7I
 ducrSBjM8bByFqTc3BcE88Un1TnBAldFZQuVTWycV5jt11H5oiyZ9fk4cCTOHjwlIkPBOIN18
 6tNWyjvbJtgm/+8GD2vjZunixXvcGWf71rvAbWPS0lN9dghkudZBPPQf8NcRZKAxtsnMX5Jb5
 Mg94cW0Ij8hYiFcdK8bqIyAH6n7i07LohZcQMGMOjLwGip7gM0TDb0teXThQhCEnSaOiLlNMM
 mjFUTdnmCCUvZEufzo53qFvdgaTJ+Xf9YgGglE4z+okNBeajdpQjTiNSoPbvoJyVvqpY09A+/
 hP4/QBsvxcXF79q1EE20+AdDs2W65qOF1uLdkMFSCyv411u8a6Q/Kv/NtbOY7UW4ZIkyoKcJu
 1n36ZGJrp7TF/IvX46lzSQIceceSOYLtdNuR2MzosVw20fIN2SaccmEi2tTuJ7M/dKC+Yz07K
 MXC/mgfwuM6GMKt0YK66dn8Wvv1nr10Clg8vfhnzaJyW8YJ8GXSw5n49iF4oWdV1FvDjNBHLC
 0Pai2gSsoQRVDf1wSz1oDc5gpXXe3ARwIMfVRzz6f+Xo1n61LjceX2swjbComb46WX1wL8OLD
 jU/xRCUn5hB6V2dFg0645jhAfvfyIL7qcG6uXSWcVxdRxAjwNEOynwokeKlIMLdExqltWPxi/
 xlF6iXkiSzL2M9YKKL4fPjI2BuixkXojyK0Y171xhzOFrCp6Tl1KE682ywLsZ7seG0zfEbwZY
 o411ToF649RotiEvn9+/LMlbq068BU+LwMhFc9xZGALyCgRZ2iQ+bJba6/UhMZctY2OKQranx
 U+At7CDg6y8V1yUCfDxZ6GVRSsV7lukTt7qoEptBMrq+HCPiMu11z360g==
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

