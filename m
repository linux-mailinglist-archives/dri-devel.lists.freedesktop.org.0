Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B203BC794
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD9189A34;
	Tue,  6 Jul 2021 07:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C17899DC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1625558364; x=1628150364;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UOUTgJ8RahJkBeCcIbg9erq0mOjJVyHTXXxvfhdSYjs=;
 b=ISgn0sLJHEdy0ExaQ5/1sI/rfvUwaRnn6+ZVJKWPxDyzsKPdpbMDQrWirmb8kJSM
 SOxE4/q6MCH5eo9GWFqpgVFaq/VpJrqIKd/JZxuNjT+vIzKbPOsPHLPkoLHARWXQ
 dvQaKeZ9dPr0Qlj+uwgKlVg54TyA6qclkRv3Hb/qxlY=;
X-AuditID: c39127d2-a9fbd70000001c5e-58-60e40d5c7881
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 4C.25.07262.C5D04E06;
 Tue,  6 Jul 2021 09:59:24 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021070609592372-1097775 ;
 Tue, 6 Jul 2021 09:59:23 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/panel: simple: Add support for EDT ETM0350G0DH6
 panel
Date: Tue, 6 Jul 2021 09:59:08 +0200
Message-Id: <20210706075908.907659-2-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210706075908.907659-1-y.bas@phytec.de>
References: <20210706075908.907659-1-y.bas@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 06.07.2021 09:59:23,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 06.07.2021 09:59:24
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWyRoCBSzeG90mCwaTbzBa9504yWfzfNpHZ
 4srX92wWnROXsFtc3jWHzWLFz62MFj93zWNxYPfY+20Bi8fOWXfZPWZ3zGT12P7tAavH/e7j
 TB5Lpl1l8/i8SS6APYrLJiU1J7MstUjfLoEr49/KI6wF2wQr/l29ztTAeISvi5GDQ0LARGLX
 ducuRk4OIYFtjBILp5tB2OcZJSY95gKx2QQUJc7ffsvaxcjFISIwgVGidfFdFpAEs4CqxMun
 U8FsYYFAies9d5lAbBYBFYmurlY2kPm8AqYSV/5zg4QlBOQlTq49zAQS5hQwk7h3NQpilanE
 numnWEFsXgFBiZMzn7CArJIQuMIo8fXZVGaIXiGJ04vPMkOs1ZZYtvA18wRGgVlIemYhSS1g
 ZFrFKJSbmZydWpSZrVeQUVmSmqyXkrqJERjWhyeqX9rB2DfH4xAjEwfjIUYJDmYlEV6RKY8S
 hHhTEiurUovy44tKc1KLDzFKc7AoifNu4C0JExJITyxJzU5NLUgtgskycXBKNTB2imZtZ4l8
 lTPH5bT20w3Ldplr9XG2rFf3eD/Lq0jxmCinosMc6YWeL298cLzM/lv17cFFH09wJkve2rbg
 E4u/skL85UT3J4xP1z44p7w867mYsd2jed8itS6qMc59m8fwd1L5qQeLV3r7PI2SWySyIia+
 /UGS2UyrCWw/VaT3d+aXTHGKUfJUYinOSDTUYi4qTgQAkKPrq1kCAAA=
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

This patch adds support for the EDT ETM0350G0DH6 3.5" (320x240) lcd
panel to DRM simple panel driver.

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
index 07433bff6c2b..8aba473a7592 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1929,6 +1929,32 @@ static const struct panel=5Fdesc edt=5Fet035012dm6 =
=3D {
 	.bus=5Fflags =3D DRM=5FBUS=5FFLAG=5FDE=5FLOW | DRM=5FBUS=5FFLAG=5FPIXDATA=
=5FSAMPLE=5FPOSEDGE,
 };
=20
+static const struct drm=5Fdisplay=5Fmode edt=5Fetm0350g0dh6=5Fmode =3D {
+	.clock =3D 6520,
+	.hdisplay =3D 320,
+	.hsync=5Fstart =3D 320 + 20,
+	.hsync=5Fend =3D 320 + 20 + 68,
+	.htotal =3D 320 + 20 + 68,
+	.vdisplay =3D 240,
+	.vsync=5Fstart =3D 240 + 4,
+	.vsync=5Fend =3D 240 + 4 + 18,
+	.vtotal =3D 240 + 4 + 18,
+	.flags =3D DRM=5FMODE=5FFLAG=5FNVSYNC | DRM=5FMODE=5FFLAG=5FNHSYNC,
+};
+
+static const struct panel=5Fdesc edt=5Fetm0350g0dh6 =3D {
+	.modes =3D &edt=5Fetm0350g0dh6=5Fmode,
+	.num=5Fmodes =3D 1,
+	.bpc =3D 6,
+	.size =3D {
+		.width =3D 70,
+		.height =3D 53,
+	},
+	.bus=5Fformat =3D MEDIA=5FBUS=5FFMT=5FRGB888=5F1X24,
+	.bus=5Fflags =3D DRM=5FBUS=5FFLAG=5FDE=5FHIGH | DRM=5FBUS=5FFLAG=5FPIXDAT=
A=5FDRIVE=5FNEGEDGE,
+	.connector=5Ftype =3D DRM=5FMODE=5FCONNECTOR=5FDPI,
+};
+
 static const struct drm=5Fdisplay=5Fmode edt=5Fetm043080dh6gp=5Fmode =3D {
 	.clock =3D 10870,
 	.hdisplay =3D 480,
@@ -4355,6 +4381,9 @@ static const struct of=5Fdevice=5Fid platform=5Fof=5F=
match[] =3D {
 	}, {
 		.compatible =3D "edt,et035012dm6",
 		.data =3D &edt=5Fet035012dm6,
+	}, {
+		.compatible =3D "edt,etm0350g0dh6",
+		.data =3D &edt=5Fetm0350g0dh6,
 	}, {
 		.compatible =3D "edt,etm043080dh6gp",
 		.data =3D &edt=5Fetm043080dh6gp,
--=20
2.30.0

