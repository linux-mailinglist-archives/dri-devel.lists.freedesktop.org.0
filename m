Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A43BC793
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9A8899DC;
	Tue,  6 Jul 2021 07:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C46899DC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1625558363; x=1628150363;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYZQ4XHqFRha5FbaPTOYOPLxGoGdc+lHk/Ilb+Zz+fs=;
 b=SgCzIEryc+YlpK/3S2NdX2TUOZNio9444rTTF/jOyPyixS52OCvLq3QpP5b0nQGf
 1SHyOU9Wdtsic2CeUtZhYH1NC7WSBnjplqmTweb+wct3Ls+bZd/zyt/+FPKdZ/Fg
 Yv0DDqen33F4Udstej627XvFp1Nss1YZvtOQRCBvgaQ=;
X-AuditID: c39127d2-a77bc70000001c5e-57-60e40d5ba677
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id CB.25.07262.B5D04E06;
 Tue,  6 Jul 2021 09:59:23 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021070609592347-1097774 ;
 Tue, 6 Jul 2021 09:59:23 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/panel: simple: Add support for EDT ETMV570G2DHU
 panel
Date: Tue, 6 Jul 2021 09:59:07 +0200
Message-Id: <20210706075908.907659-1-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 06.07.2021 09:59:23,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 06.07.2021 09:59:23
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWyRoCBSzea90mCwf5mPYvecyeZLP5vm8hs
 ceXrezaLzolL2C0u75rDZrHi51ZGi5+75rE4sHvs/baAxWPnrLvsHrM7ZrJ6bP/2gNXjfvdx
 Jo8l066yeXzeJBfAHsVlk5Kak1mWWqRvl8CVMW3uFJaCNsGKfR8bmRoYZ/B1MXJwSAiYSBw7
 rt3FyMUhJLCNUWLe7T2sEM55Rolvd7+zdzFycrAJKEqcv/0WLCEiMIFRonXxXRaQBLOAqsTL
 p1PBbGGBQImG+U3MIDaLgIrEpqddjCAbeAVMJTbeqgQJSwjIS5xce5gJxOYVEJQ4OfMJC0T8
 CqPEhnWxELaQxOnFZ5khxmtLLFv4mnkCI98sJC2zkKQWMDKtYhTKzUzOTi3KzNYryKgsSU3W
 S0ndxAgM1cMT1S/tYOyb43GIkYmD8RCjBAezkgivyJRHCUK8KYmVValF+fFFpTmpxYcYpTlY
 lMR5N/CWhAkJpCeWpGanphakFsFkmTg4pRoYre20z4RtzFV5x6HFuzvdQ5iv3Xfvtq+i28W5
 pk1UUsxaXuI1f3an5NczUza4CW2f/dIx/t4HG6WlHSdT3u5ReRnJn3py9vmN74SdHpTNdBWQ
 kdmerhl4ee75FzvyAo2vvttwfe5HdtkcEXZZG4Nv+xQLRP/ymq7o9eiJ/sKY9Vi7dH/tyW2S
 SizFGYmGWsxFxYkAS5YEY0MCAAA=
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
Cc: airlied@linux.ie
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Riedmueller <s.riedmueller@phytec.de>

This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
Changes in v3:
- No changes in general, added additional maintainers and also sending
to general kernel mailing list
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index 21939d4352cf..07433bff6c2b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2008,6 +2008,32 @@ static const struct panel=5Fdesc edt=5Fet057090dhu =
=3D {
 	.connector=5Ftype =3D DRM=5FMODE=5FCONNECTOR=5FDPI,
 };
=20
+static const struct drm=5Fdisplay=5Fmode edt=5Fetmv570g2dhu=5Fmode =3D {
+	.clock =3D 25175,
+	.hdisplay =3D 640,
+	.hsync=5Fstart =3D 640,
+	.hsync=5Fend =3D 640 + 16,
+	.htotal =3D 640 + 16 + 30 + 114,
+	.vdisplay =3D 480,
+	.vsync=5Fstart =3D 480 + 10,
+	.vsync=5Fend =3D 480 + 10 + 3,
+	.vtotal =3D 480 + 10 + 3 + 35,
+	.flags =3D DRM=5FMODE=5FFLAG=5FPVSYNC | DRM=5FMODE=5FFLAG=5FPHSYNC,
+};
+
+static const struct panel=5Fdesc edt=5Fetmv570g2dhu =3D {
+	.modes =3D &edt=5Fetmv570g2dhu=5Fmode,
+	.num=5Fmodes =3D 1,
+	.bpc =3D 6,
+	.size =3D {
+		.width =3D 115,
+		.height =3D 86,
+	},
+	.bus=5Fformat =3D MEDIA=5FBUS=5FFMT=5FRGB888=5F1X24,
+	.bus=5Fflags =3D DRM=5FBUS=5FFLAG=5FDE=5FHIGH | DRM=5FBUS=5FFLAG=5FPIXDAT=
A=5FDRIVE=5FNEGEDGE,
+	.connector=5Ftype =3D DRM=5FMODE=5FCONNECTOR=5FDPI,
+};
+
 static const struct drm=5Fdisplay=5Fmode edt=5Fetm0700g0dh6=5Fmode =3D {
 	.clock =3D 33260,
 	.hdisplay =3D 800,
@@ -4338,6 +4364,9 @@ static const struct of=5Fdevice=5Fid platform=5Fof=5F=
match[] =3D {
 	}, {
 		.compatible =3D "edt,et057090dhu",
 		.data =3D &edt=5Fet057090dhu,
+	}, {
+		.compatible =3D "edt,etmv570g2dhu",
+		.data =3D &edt=5Fetmv570g2dhu,
 	}, {
 		.compatible =3D "edt,et070080dh6",
 		.data =3D &edt=5Fetm0700g0dh6,
--=20
2.30.0

