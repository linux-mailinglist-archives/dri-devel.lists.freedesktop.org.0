Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE69BAAEB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 03:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA94E10E351;
	Mon,  4 Nov 2024 02:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="HzXpKMIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAD110E351;
 Mon,  4 Nov 2024 02:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=iC0KoFsoUwEupIq9bReRkUd3v81AvDNZ/2McalaaoAQ=; b=HzXpKMISgp+8Ux5K
 NCAFaXSozpOHcc/QJq0z2Cknk9Wiy3eyNXoQAAvgCxxAMc7voKAUeb2ZDupWN7Ef+dqx3hN5k80E7
 REvMBymtQM5CLK0RMXNs1rSVmvr+NF9qgo6ow78vbhA5sPei41zsnhXrANxCzEsAIw6lg5c+OT6YG
 jkQMTQyO+/yfAOcxgL0wXpRUtR7ZPlN+bXRi9M6KLKrtaSHv2UsbKqAqT/yE5mkQZwbNmab3DmaYT
 MgrmZngTiOVCkernUwHFbyuS5wSE+aIyXXlS/OKgl08s8aFq045Xu29VOb16QIZO9dvIvBjO9bM/h
 21TtEFr5ZOkQRC9ouQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t7mzp-00FECw-0A;
 Mon, 04 Nov 2024 02:39:13 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 chaitanya.dhere@amd.com, jun.lei@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/5] drm/amd/display: Remove unused
 dwb3_set_host_read_rate_control
Date: Mon,  4 Nov 2024 02:38:49 +0000
Message-ID: <20241104023852.492497-3-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104023852.492497-1-linux@treblig.org>
References: <20241104023852.492497-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

dwb3_set_host_read_rate_control() has been unused since it was added by
commit 8993dee0de2a ("drm/amd/display: Add DCN3 DWB")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c    | 13 -------------
 .../gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h    |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c
index fae98cf52020..bc058f682438 100644
--- a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c
+++ b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c
@@ -270,16 +270,3 @@ void dcn30_dwbc_construct(struct dcn30_dwbc *dwbc30,
 	dwbc30->dwbc_shift = dwbc_shift;
 	dwbc30->dwbc_mask = dwbc_mask;
 }
-
-void dwb3_set_host_read_rate_control(struct dwbc *dwbc, bool host_read_delay)
-{
-	struct dcn30_dwbc *dwbc30 = TO_DCN30_DWBC(dwbc);
-
-	/*
-	 * Set maximum delay of host read access to DWBSCL LUT or OGAM LUT if there are no
-	 * idle cycles in HW pipeline (in number of clock cycles times 4)
-	 */
-	REG_UPDATE(DWB_HOST_READ_CONTROL, DWB_HOST_READ_RATE_CONTROL, host_read_delay);
-
-	DC_LOG_DWB("%s dwb3_rate_control at inst = %d", __func__, dwbc->inst);
-}
diff --git a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h
index 0f3f7c5fbaec..7f053f49ec6a 100644
--- a/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h
+++ b/drivers/gpu/drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h
@@ -914,7 +914,6 @@ bool dwb3_ogam_set_input_transfer_func(
 	struct dwbc *dwbc,
 	const struct dc_transfer_func *in_transfer_func_dwb_ogam);
 
-void dwb3_set_host_read_rate_control(struct dwbc *dwbc, bool host_read_delay);
 #endif
 
 
-- 
2.47.0

