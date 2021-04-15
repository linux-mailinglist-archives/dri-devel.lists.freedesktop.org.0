Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D893605BB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 11:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2F16EA1A;
	Thu, 15 Apr 2021 09:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78F66EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1618478180; x=1621070180;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tte0Rh052e0z9AFEgquZJNa0elDAoXdTbOtgA+HK81k=;
 b=DXKmbmG9nTQedVnP38rToqDTcUDAYTwZdrwp3+LZ8VJ9YN8fKVvJtdZPbzlVdGae
 2p6gQe4sperhFXRSIS6IwIhlG2o7IFgBnU/rQcwtKEX1B1Rmgfseq7qTy+d+2XEI
 j5pIXNK3uiDcSqaz2uWscCuIs8o/DWc/AeLgR7SyPA4=;
X-AuditID: c39127d2-324b870000001c53-3f-607804649830
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1E.53.07251.46408706;
 Thu, 15 Apr 2021 11:16:20 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021041511162033-136034 ;
 Thu, 15 Apr 2021 11:16:20 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/3] drm/panel: Add connector_type for some EDT displays
Date: Thu, 15 Apr 2021 11:16:15 +0200
Message-Id: <20210415091616.53415-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415091616.53415-1-s.riedmueller@phytec.de>
References: <20210415091616.53415-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 15.04.2021 11:16:20,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 15.04.2021 11:16:20
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWyRoCBSzeFpSLB4OYfdYvecyeZLP5vm8hs
 ceXrezaLy7vmsFms+LmV0eLnrnksDmwee78tYPHYOesuu8f2bw9YPe53H2fyWDLtKpvH501y
 AWxRXDYpqTmZZalF+nYJXBlLZpxiKTjLWbHwzTv2BsZpHF2MnBwSAiYS11YvZupi5OIQEtjG
 KPH6/F9mCOcao0RHy0pGkCo2ASOJBdMawapEBCYwSky7+5UJJMEskC8xt/cFM4gtLOAhMXnW
 NnYQm0VAVWLSwYlsIDavgI3E0tcTGCHWyUvMvPQdrIZTwFai7c1asLgQUM2/iXuZIeoFJU7O
 fMICskxC4AqjxJt9b6CahSROLz7LDLFYW2LZwtfMExgFZiHpmYUktYCRaRWjUG5mcnZqUWa2
 XkFGZUlqsl5K6iZGYDAfnqh+aQdj3xyPQ4xMHIyHGCU4mJVEeN2mlCQI8aYkVlalFuXHF5Xm
 pBYfYpTmYFES593AWxImJJCeWJKanZpakFoEk2Xi4JRqYFyVNft8de9Hrqq5B64I3HVmUpi6
 9fQJcbZ3bv8/yt1mVmyb+WTHqmWGGi7nZz14c9eaxT2+pDI2Ia3ulPgt26nbpnrPunNyB3vh
 NO1cqxcpO/ZncSzZ/imz4OK+vA/f2i+aOqya1arY1faS0WyfXKn6mvf1inFzZqovdLq1+bgL
 q8GRWUwnelyVWIozEg21mIuKEwHGHdKHVAIAAA==
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
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The connector_type for following two EDT displays is missing:
 - EDT ETM0430G0DH6
 - EDT ETM0700G0BDH6

Both are parallel displays thus add the corresponding connector_type.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 44583d0ed902..723c09a82c4c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1900,6 +1900,7 @@ static const struct panel_desc edt_etm0430g0dh6 = {
 		.width = 95,
 		.height = 54,
 	},
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct drm_display_mode edt_et057090dhu_mode = {
@@ -1964,6 +1965,7 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct display_timing evervision_vgg804821_timing = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
