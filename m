Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F305A05BA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44399D073D;
	Thu, 25 Aug 2022 01:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A5ED06CA;
 Thu, 25 Aug 2022 01:34:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87701B825ED;
 Thu, 25 Aug 2022 01:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF0BC433D7;
 Thu, 25 Aug 2022 01:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391277;
 bh=vHQgJ625Aopds3oZUxvzwvo6i5AMT1ganc+thx9nkzo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDVfrTMdmBwy3BTtOLNkH9VnLDKcEc5wUDzcOuK72yqPPKtOyxd8VCh0ODbprW5/X
 +jUaC4KmPp5fhF11mm5mP1rQ7L4Xi8bUfNrK9NcH6HdyzsuThRYuPo9BbHksmXD+mF
 uVvp4tD5Vf1HOUDY1YTkMGWbiaS3peKFo4CZNCqjXqvDwWzU5qloofuTf4FkWEXUWu
 PLP0+MYJmf3joxa0zgdauuY/w1og8zFmMqTMMkPEozEqMmMVM5xmK4VKo1hEwmAyDC
 W+g+MfapWdFvasaKMH3Io/7MU6J5+pK4cwGGuhWSdmxDT1/+sPmv9Zx1WcGDbVLvQ7
 zzJOnQpaSbDUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 05/38] drm/amd/display: Add a missing register
 field for HPO DP stream encoder
Date: Wed, 24 Aug 2022 21:33:28 -0400
Message-Id: <20220825013401.22096-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 Nicholas.Kazlauskas@amd.com, airlied@linux.ie, Jerry.Zuo@amd.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit 37bc31f0e7da4fbad4664e64d906ae7b9009e550 ]

[Why&How]
Add the missing definition to set the register field
HBLANK_MINIMUM_SYMBOL_WIDTH

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h
index 7c77c71591a0..82c3b3ac1f0d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.h
@@ -162,7 +162,8 @@
 	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_AUDIO_CONTROL0, AIP_ENABLE, mask_sh),\
 	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_SDP_AUDIO_CONTROL0, ACM_ENABLE, mask_sh),\
 	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL, CRC_ENABLE, mask_sh),\
-	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL, CRC_CONT_MODE_ENABLE, mask_sh)
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_VID_CRC_CONTROL, CRC_CONT_MODE_ENABLE, mask_sh),\
+	SE_SF(DP_SYM32_ENC0_DP_SYM32_ENC_HBLANK_CONTROL, HBLANK_MINIMUM_SYMBOL_WIDTH, mask_sh)
 
 
 #define DCN3_1_HPO_DP_STREAM_ENC_REG_FIELD_LIST(type) \
-- 
2.35.1

