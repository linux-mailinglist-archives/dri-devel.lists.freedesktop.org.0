Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF073605BC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 11:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BF66EA1B;
	Thu, 15 Apr 2021 09:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5634E6EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1618478182; x=1621070182;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UH0l6OtV3y5PpWVjnpuCZWgWNUmGuC2qvPr+2FpJkP4=;
 b=Wx/Zl/CwSQfWD0S6+75AzHNgIdywQVe8NkxJsgxEJ+eN1jnOA3pTXCuw44HzNC7P
 kHo8iwOD7Y0p710WHnZAnMTncNevmghNG3GZfhhGV3Cv33itxqrVPl/4IWktQwrj
 mc9uYGtxxGguokleGrmfHm1YaHGtYSQoHZABhQw7+0w=;
X-AuditID: c39127d2-330b970000001c53-42-607804662726
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id BE.53.07251.66408706;
 Thu, 15 Apr 2021 11:16:22 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021041511162169-136035 ;
 Thu, 15 Apr 2021 11:16:21 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 3/3] drm/panel: Add bus_format and bus_flags for EDT
 ETM0430G0DH6
Date: Thu, 15 Apr 2021 11:16:16 +0200
Message-Id: <20210415091616.53415-3-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415091616.53415-1-s.riedmueller@phytec.de>
References: <20210415091616.53415-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 15.04.2021 11:16:21,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 15.04.2021 11:16:22
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHLMWRmVeSWpSXmKPExsWyRoCBSzeNpSLBYP8aJovecyeZLP5vm8hs
 ceXrezaLy7vmsFms+LmV0eLnrnksDmwee78tYPHYOesuu8f2bw9YPe53H2fyWDLtKpvH501y
 AWxRXDYpqTmZZalF+nYJXBkbb8xnLNjOVtH5ZCdTA+Nh1i5GTg4JAROJO+2bmUFsIYFtjBJd
 E+wg7GuMEr8+moDYbAJGEgumNTJ1MXJxiAhMYJSYdvcrE0iCWSBfYm7vC7BmYYFAiT0LL7J1
 MXJwsAioSuycyggS5hWwkfjyfg8jxC55iZmXvrOD2JwCthJtb9YyQuyykfg3cS8zRL2gxMmZ
 T1hAdkkIXGGUOP26FepQIYnTi88yQ+zVlli28DXzBEaBWUh6ZiFJLWBkWsUolJuZnJ1alJmt
 V5BRWZKarJeSuokRGMaHJ6pf2sHYN8fjECMTB+MhRgkOZiURXrcpJQlCvCmJlVWpRfnxRaU5
 qcWHGKU5WJTEeTfwloQJCaQnlqRmp6YWpBbBZJk4OKUaGL1Utxqnm27718FSvutai82iFKVr
 DNcyf5TZO6gpSwTs8TXbav7onviqq76fDHgC1v7eu+a5VIF5rHn/96f9ipx31jxe6WV5Sqfv
 NZeE74TNWi/b+dn9yxWj616+3/dxj5OtpvsD0ffbnLi5A/Iq/vQu68mZdzfcMSllbvCr+W8M
 y6IVl5qyKLEUZyQaajEXFScCAEPOw0xRAgAA
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

Add corresponding bus_format and bus_flags for the EDT ETM0430G0DH6
display.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 723c09a82c4c..1bbb205a3b81 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1900,6 +1900,8 @@ static const struct panel_desc edt_etm0430g0dh6 = {
 		.width = 95,
 		.height = 54,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
