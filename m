Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B63C29ED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 22:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BCF6EA84;
	Fri,  9 Jul 2021 20:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8336EA84
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1625861047; x=1628453047;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XV8GUB1yZekpzPAfQ6CG6JnFBlMCyThdbC55A0W06x8=;
 b=SSGkjj+PSFprq2RqHX1lbnBcsJqQPpsGOES+bzcoWQhOjU6qogCPD/xPqWmFoDXE
 9mfch9uy+zkzpdmjgK4GAVMvzCbvxq03PMjLpC9pVqJI5+a819wPhYJN5/Q8JUWu
 vW1oCJ2EowKEE11N7fuDa39RAUtTpn6wer14zHVtifI=;
X-AuditID: c39127d2-1d8f870000001daf-8a-60e8abb7bbc3
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 78.04.07599.7BBA8E06;
 Fri,  9 Jul 2021 22:04:07 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021070922040729-1123521 ;
 Fri, 9 Jul 2021 22:04:07 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: sam@ravnborg.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm/panel: simple: Add support for EDT ETMV570G2DHU
 panel
Date: Fri, 9 Jul 2021 22:03:48 +0200
Message-Id: <20210709200349.2665205-1-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 09.07.2021 22:04:07,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2021 22:04:07
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOLMWRmVeSWpSXmKPExsWyRoCBS3f76hcJBt/eaVj0njvJZPF/20Rm
 iytf37NZXN41h81ixc+tjBY/d81jcWDz2PttAYvHzll32T22f3vA6nG/+ziTx5JpV9k8Pm+S
 C2CL4rJJSc3JLEst0rdL4Mr40H2YseCAYEXvp8lMDYxn+boYOTkkBEwkbh7rYuti5OIQEtjG
 KPF8Wx8LSEJI4DyjxOO5SSA2m4CixPnbb1lBbBGBXIkfdx4zgdjMAnYS5xuPMYLYwgKBEvuv
 dIP1sgioSNxduBisnlfATGLO9R+MEMvkJU6uPcwEEReUODnzCQvIYgmBK4wSP1p/skMUCUmc
 XnyWGWKBtsSyha+ZJzDyzULSMwtJagEj0ypGodzM5OzUosxsvYKMypLUZL2U1E2MwMA8PFH9
 0g7GvjkehxiZOBgPMUpwMCuJ8BrNeJYgxJuSWFmVWpQfX1Sak1p8iFGag0VJnHcDb0mYkEB6
 YklqdmpqQWoRTJaJg1OqgXGZ1e+XMaHdl4Js+Q5X+Fe9PHW1/bmp4737F1a3L50Wxl1Xr6ax
 rf/xpXKviVUse7+wpXNczDXt8Dx7rMRy/z7BmxMPSTc3WPge+Z94L5QtTDNy39vpbDy2W7eF
 /ctSLEp5+e9CFI9C/Fc+l4nN536LxSconLJ5XjhHoqxhar7X+in8yV+SVJVYijMSDbWYi4oT
 AW7LVag6AgAA
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
Cc: airlied@linux.ie, s.riedmueller@phytec.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Riedmueller <s.riedmueller@phytec.de>

This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
Changes in v4:
- Moved code to proper place to keep alphabetic order
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index 21939d4352cf..7f3918fee250 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2046,6 +2046,32 @@ static const struct panel=5Fdesc edt=5Fetm0700g0bdh6=
 =3D {
 	.bus=5Fflags =3D DRM=5FBUS=5FFLAG=5FDE=5FHIGH | DRM=5FBUS=5FFLAG=5FPIXDAT=
A=5FDRIVE=5FPOSEDGE,
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
 static const struct display=5Ftiming evervision=5Fvgg804821=5Ftiming =3D {
 	.pixelclock =3D { 27600000, 33300000, 50000000 },
 	.hactive =3D { 800, 800, 800 },
@@ -4350,6 +4376,9 @@ static const struct of=5Fdevice=5Fid platform=5Fof=5F=
match[] =3D {
 	}, {
 		.compatible =3D "edt,etm0700g0edh6",
 		.data =3D &edt=5Fetm0700g0bdh6,
+	}, {
+		.compatible =3D "edt,etmv570g2dhu",
+		.data =3D &edt=5Fetmv570g2dhu,
 	}, {
 		.compatible =3D "evervision,vgg804821",
 		.data =3D &evervision=5Fvgg804821,
--=20
2.30.0

