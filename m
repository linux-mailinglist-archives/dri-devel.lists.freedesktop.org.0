Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BFC8C7E14
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 23:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3EA10E0FA;
	Thu, 16 May 2024 21:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Lx/VUXV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2418 seconds by postgrey-1.36 at gabe;
 Thu, 16 May 2024 14:17:47 UTC
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A89310ED3A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 14:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=zqiddJDPtoHIu0oZ8yctrj4tnb0n+qoaibljudxr+uE=; b=Lx/VUXV+8oIP1NeN
 fvLk7t+T8WwUqKHypprgU1b/JapMZp7DNA2CQaTCEGdNq/qPQNtH+Fa7o/rQWOoP3rxI/ereBkKZK
 wOHVmVMLVsyFpQt1I+e1qb1/ZjKDCUsW9bQwMkgfQKOUH1WAun4PMNGqwU6SuNQslfQuLvOGvz3Lr
 UjuRqzt9kStW7NeEIxko78Rtv/sHPq2EiRVIOwSMOmvYzIvNF8Ma064eFA/WY8+ZKS+jEdlJe64X1
 xbne+6VdXOogMSA2jbJXfSpmaNm78E7sYL6M3nqHQB8quXs6StDOvjoy0C7C0oMsNDc43+o1tXcpn
 aTDJZvJ7qUnSUmFfJA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s7bIS-001Eq6-34;
 Thu, 16 May 2024 13:37:25 +0000
From: linux@treblig.org
To: liviu.dudau@arm.com,
	mripard@kernel.org,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/komeda: remove unused struct 'gamma_curve_segment'
Date: Thu, 16 May 2024 14:37:24 +0100
Message-ID: <20240516133724.251750-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 May 2024 21:36:01 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'gamma_curve_segment' looks like it has never been used.
Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c b/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c
index d8e449e6ebda..50cb8f7ee6b2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c
@@ -72,11 +72,6 @@ struct gamma_curve_sector {
 	u32 segment_width;
 };
 
-struct gamma_curve_segment {
-	u32 start;
-	u32 end;
-};
-
 static struct gamma_curve_sector sector_tbl[] = {
 	{ 0,    4,  4   },
 	{ 16,   4,  4   },
-- 
2.45.0

