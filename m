Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D61C8E60
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 16:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D2C6E9BF;
	Thu,  7 May 2020 14:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D6D6E9BE;
 Thu,  7 May 2020 14:28:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE83220B1F;
 Thu,  7 May 2020 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588861693;
 bh=MDZdmsagPKCRha5QAA/DRBmtg2TCG7A+Bwmwop+1W9Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZdlGP+YX9H9e9Y6HQRIeVB1JDFJ0DNhGW2nXhnuR6pxSU2sMu/0JBRllluu63MvEj
 zwRcxhkNFfa3g+/aVhDFRb6+kmjI1UnMAGlwid2LVHJbDe238SLOee96RoH1zCJkjz
 oaT+V37ZKPeKI2zOPRwPMzRseUhPckEMnpktViaE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 37/50] drm/amd/display: Update downspread percent
 to match spreadsheet for DCN2.1
Date: Thu,  7 May 2020 10:27:13 -0400
Message-Id: <20200507142726.25751-37-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507142726.25751-1-sashal@kernel.org>
References: <20200507142726.25751-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Sung Lee <sung.lee@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sung Lee <sung.lee@amd.com>

[ Upstream commit 668a6741f809f2d15d125cfe2b39661e8f1655ea ]

[WHY]
The downspread percentage was copied over from a previous version
of the display_mode_lib spreadsheet. This value has been updated,
and the previous value is too high to allow for such modes as
4K120hz. The new value is sufficient for such modes.

[HOW]
Update the value in dcn21_resource to match the spreadsheet.

Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Yongqiang Sun <yongqiang.sun@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 33d0a176841a5..122d3e734c59a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -250,7 +250,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
 	.dram_channel_width_bytes = 4,
 	.fabric_datapath_to_dcn_data_return_bytes = 32,
 	.dcn_downspread_percent = 0.5,
-	.downspread_percent = 0.5,
+	.downspread_percent = 0.38,
 	.dram_page_open_time_ns = 50.0,
 	.dram_rw_turnaround_time_ns = 17.5,
 	.dram_return_buffer_per_channel_bytes = 8192,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
