Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252123C29EE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 22:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B05A6EA86;
	Fri,  9 Jul 2021 20:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E01E6EA84
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1625861047; x=1628453047;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hN3B2iUtsaUB4wrw7FnFk8mkFYheDwTuy7ON+pFBpn0=;
 b=LrB9/LW1SPz8LYSFSQscqFYXg5200vPXZFBe5GJ0CofF7X6975qy3P+d0/7G/W82
 ve+o2pfkx0Vmrn184q9Jt6bhuOPNdaq0rAoZsI5xRq26IZT8jCwrYRmIcaFNaRwF
 dEStYLMgk1O5uLjudHetVZIhEbExjYQJwJOMxwIXXQU=;
X-AuditID: c39127d2-1e4f970000001daf-8c-60e8abb75080
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 09.04.07599.7BBA8E06;
 Fri,  9 Jul 2021 22:04:07 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021070922040752-1123522 ;
 Fri, 9 Jul 2021 22:04:07 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: sam@ravnborg.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/panel: simple: Add support for EDT ETM0350G0DH6
 panel
Date: Fri, 9 Jul 2021 22:03:49 +0200
Message-Id: <20210709200349.2665205-2-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210709200349.2665205-1-y.bas@phytec.de>
References: <20210709200349.2665205-1-y.bas@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 09.07.2021 22:04:07,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2021 22:04:07
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsWyRoCBS3f76hcJBs96zCx6z51ksvi/bSKz
 xZWv79ksLu+aw2ax4udWRoufu+axOLB57P22gMVj56y77B7bvz1g9bjffZzJY8m0q2wenzfJ
 BbBFcdmkpOZklqUW6dslcGVMP3OLsWCnQEXbud+MDYz3ebsYOTkkBEwk7jSdZO1i5OIQEtjG
 KPH79kNmCOc8o8TbZweZQKrYBBQlzt9+ywpiiwjkSvy48xgszixgJ3G+8RgjiC0sECjx4NBK
 dhCbRUBFonneZ7AaXgEzidbHf1ggtslLnFx7GCzOKWAusXnPGzYQWwio5t2zD8wQ9YISJ2c+
 YQE5QkLgCqPEj9af7BDNQhKnF59lhlisLbFs4WvmCYwCs5D0zEKSWsDItIpRKDczOTu1KDNb
 ryCjsiQ1WS8ldRMjMJQPT1S/tIOxb47HIUYmDsZDjBIczEoivEYzniUI8aYkVlalFuXHF5Xm
 pBYfYpTmYFES593AWxImJJCeWJKanZpakFoEk2Xi4JRqYAx7tHkCi2CGMNe5xGBGtkOz5134
 x3R7ms79E4VxaZcvnq8NnW88oWPycffW/dXcCUZMry79jfrv67J8VYCa0sNHK47PUvPP5Mms
 7GuZqCGwa+5h5YdWj37e+3Vyh5B4dsiW+9/inpsobDxus+vdzH3cD5JWZb29O/mllFNutqWg
 +PQWT27hdaFKLMUZiYZazEXFiQAZkMwWUwIAAA==
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

This patch adds support for the EDT ETM0350G0DH6 3.5" (320x240) lcd
panel to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index 7f3918fee250..1b34338d346a 100644
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

