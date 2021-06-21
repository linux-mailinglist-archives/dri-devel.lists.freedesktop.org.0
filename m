Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA9A3AEC0C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A616E1BE;
	Mon, 21 Jun 2021 15:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802F56E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1624288171; x=1626880171;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hqxxz8DavTlzSN+vdYSPKHKpShpPvAqh6ibisbs7Xj4=;
 b=alRt0elReCaMn5yN5EhXwdc8+TB7uT5GEwW2cniQe79PggBeJxFTx4Kb9ZsrTQRB
 1R6Hb7sWDs3ehzJmsSEJllk/GTKnC46af92fIZ8Tvr43hbXrxEy9gmnfItLUWwvE
 mPCzRvaMDXzig+BtkuKd8+XJ4iFWgRAdiz/1zTl8BiA=;
X-AuditID: c39127d2-a77bc70000001c5e-aa-60d0abab26ff
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id B5.77.07262.BABA0D06;
 Mon, 21 Jun 2021 17:09:31 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021062117093118-1007633 ;
 Mon, 21 Jun 2021 17:09:31 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Subject: [RESEND PATCH 2/3] drm/panel: Add connector_type for some EDT displays
Date: Mon, 21 Jun 2021 17:09:29 +0200
Message-Id: <20210621150930.86617-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621150930.86617-1-s.riedmueller@phytec.de>
References: <20210621150930.86617-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 21.06.2021 17:09:31,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 21.06.2021 17:09:31
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsWyRoCBS3f16gsJBjMOyFj0njvJZPF/20Rm
 iytf37NZdE5cwm5xedccNosVP7cyWvzcNY/Fgd1j77cFLB47Z91l95jdMZPVY/u3B6we97uP
 M3ksmXaVzePzJrkA9igum5TUnMyy1CJ9uwSujP1ty1kKznJWPOn6ydbAOI2ji5GTQ0LAROLQ
 5ENsILaQwDZGiQvnorsYuYDs64wS/9suMoMk2ASMJBZMa2QCSYgITGCUaDwwmwkkwSxQLtG+
 9BSQzcEhLOAvMe0+2CAWAVWJ9RfOgJXwCthINHdOYoVYJi8x89J3dhCbU8BW4u3TnewQi20k
 pi38AVUvKHFy5hMWkF0SAlcYJd7ePM8M0SwkcXrxWWaIvdoSyxa+Zp7AKDALSc8sJKkFjEyr
 GIVyM5OzU4sys/UKMipLUpP1UlI3MQKD+/BE9Us7GPvmeBxiZOJgPMQowcGsJMJ7M+VCghBv
 SmJlVWpRfnxRaU5q8SFGaQ4WJXHeDbwlYUIC6YklqdmpqQWpRTBZJg5OqQZGprYlTrXLJlkJ
 pWRmGq4wmW3FvefsUpM/SuL/zbhemVVPCd+ybknP8pnRj724JG5c6Nzo8ODoHz4lpYjVE4Mf
 3tms8Ujn7eHcwCIPVy9L9VbxH6UlHmfCb91smSu36nnci4opudnWSrP2/vPP0iu4v3viXHu7
 O/rTVr6rYPuoYKAUOCtw1taNSizFGYmGWsxFxYkAz+45l1wCAAA=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The connector=5Ftype for following two EDT displays is missing:
 - EDT ETM0430G0DH6
 - EDT ETM0700G0BDH6

Both are parallel displays thus add the corresponding connector=5Ftype.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index 99edd640d700..109dc8c85947 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1940,6 +1940,7 @@ static const struct panel=5Fdesc edt=5Fetm0430g0dh6 =
=3D {
 		.width =3D 95,
 		.height =3D 54,
 	},
+	.connector=5Ftype =3D DRM=5FMODE=5FCONNECTOR=5FDPI,
 };
=20
 static const struct drm=5Fdisplay=5Fmode edt=5Fet057090dhu=5Fmode =3D {
@@ -2004,6 +2005,7 @@ static const struct panel=5Fdesc edt=5Fetm0700g0bdh6 =
=3D {
 	},
 	.bus=5Fformat =3D MEDIA=5FBUS=5FFMT=5FRGB666=5F1X18,
 	.bus=5Fflags =3D DRM=5FBUS=5FFLAG=5FDE=5FHIGH | DRM=5FBUS=5FFLAG=5FPIXDAT=
A=5FDRIVE=5FPOSEDGE,
+	.connector=5Ftype =3D DRM=5FMODE=5FCONNECTOR=5FDPI,
 };
=20
 static const struct display=5Ftiming evervision=5Fvgg804821=5Ftiming =3D {
--=20
2.25.1

