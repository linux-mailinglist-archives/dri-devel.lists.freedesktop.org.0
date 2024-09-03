Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D096940A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 08:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA03010E3BB;
	Tue,  3 Sep 2024 06:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="R0FTTo49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19FD10E148
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 04:58:52 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5df998d7a44so2832797eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725339532; x=1725944332;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sPhZdW35wA0lKARiWkZjmf+aWFeCFp2ESl8o+4bQ7rQ=;
 b=R0FTTo49kn1U+3eGiTNHetXGno20cL5ijDDyMXGulQLJdaCav0yU5F6iWNzxUp3jGV
 jCwFbspEAE9LtLga+BI5ECFWxf6xTE79yz6Pjs6Hp2RKkFzJ3JWonHwoaSliT2lssWWn
 esrVM3q6dRcTOezOsOIbwprKpzhCh+LqxNw9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725339532; x=1725944332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sPhZdW35wA0lKARiWkZjmf+aWFeCFp2ESl8o+4bQ7rQ=;
 b=mm8l7Rkmqk8V0qZYN5sAH/SKiTmIlbLuahPmu7QHQKdoijOITEnZW7xf/pg9iby6Pb
 t39jngGSEL+bDC5dqu3CTTVeh90+MNHNJ2jr5cPNQLbEADwGgxhV8xWK+uj688S2wGk1
 dKQ9e63iB0rMdKnU9tKC3hbGMQ9vZD8CTM7/lRjoWv6Fgvmh2lirMyP39Ge8o1G76crI
 gpnbJLyaTfxKCfSDXMv+FNa0dnLfm7ijO7juhN33Sk8amVb2tMIW1i48bNuHAZUtLLhP
 Ltu2zaG8Znleab3Yb/c2LlvoDcVXTDdYqJ/KYUDuuQu0RtOuDifjUFy5lhhKv16NQX8Z
 rQqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS702/eR9qnPrODEZlHhUrf7KFX5hsSg7XgAZ13mjfdrfXsvhRDXcvob0LeftvRLDhTEL093wmMRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ9OHA/S0RggGQGEgcGIhogjDKC0EkxEg/ddFF+ZCc+T4OhxqT
 1NDfuiw+IneQTqV+EBznrL+hVnoqUCayf5+IBr4fJIhsCAMtRS03+8ByKbOU0w==
X-Google-Smtp-Source: AGHT+IG8me1bSENR4wRx/OKAQejDcXWKY5+HZ/AzEltyhw/WRh8aAe2pXkZG/Vr0P7/zTKqlGwLNxQ==
X-Received: by 2002:a05:6358:4429:b0:1aa:b9f2:a0c4 with SMTP id
 e5c5f4694b2df-1b8117bccf4mr268303755d.11.1725339531470; 
 Mon, 02 Sep 2024 21:58:51 -0700 (PDT)
Received: from photon-a190c64c6e7e.. ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8d06c9340sm3599334a91.22.2024.09.02.21.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 21:58:51 -0700 (PDT)
From: sikkamukul <mukul.sikka@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Jun.Ma2@amd.com, kevinyang.wang@amd.com,
 sashal@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 vasavi.sirnapalli@broadcom.com, Bob Zhou <bob.zhou@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Mukul Sikka <mukul.sikka@broadcom.com>
Subject: [PATCH v5.15-v5.10] drm/amd/pm: Fix the null pointer dereference for
 vega10_hwmgr
Date: Tue,  3 Sep 2024 04:58:09 +0000
Message-Id: <20240903045809.5025-1-mukul.sikka@broadcom.com>
X-Mailer: git-send-email 2.39.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Sep 2024 06:45:28 +0000
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

From: Bob Zhou <bob.zhou@amd.com>

[ Upstream commit 50151b7f1c79a09117837eb95b76c2de76841dab ]

Check return value and conduct null pointer handling to avoid null pointer dereference.

Signed-off-by: Bob Zhou <bob.zhou@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Mukul Sikka <mukul.sikka@broadcom.com>
---
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 10678b519..304874cba 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -3391,13 +3391,17 @@ static int vega10_find_dpm_states_clocks_in_dpm_table(struct pp_hwmgr *hwmgr, co
 	const struct vega10_power_state *vega10_ps =
 			cast_const_phw_vega10_power_state(states->pnew_state);
 	struct vega10_single_dpm_table *sclk_table = &(data->dpm_table.gfx_table);
-	uint32_t sclk = vega10_ps->performance_levels
-			[vega10_ps->performance_level_count - 1].gfx_clock;
 	struct vega10_single_dpm_table *mclk_table = &(data->dpm_table.mem_table);
-	uint32_t mclk = vega10_ps->performance_levels
-			[vega10_ps->performance_level_count - 1].mem_clock;
+	uint32_t sclk, mclk;
 	uint32_t i;
 
+	if (vega10_ps == NULL)
+		return -EINVAL;
+	sclk = vega10_ps->performance_levels
+			[vega10_ps->performance_level_count - 1].gfx_clock;
+	mclk = vega10_ps->performance_levels
+			[vega10_ps->performance_level_count - 1].mem_clock;
+
 	for (i = 0; i < sclk_table->count; i++) {
 		if (sclk == sclk_table->dpm_levels[i].value)
 			break;
@@ -3704,6 +3708,9 @@ static int vega10_generate_dpm_level_enable_mask(
 			cast_const_phw_vega10_power_state(states->pnew_state);
 	int i;
 
+	if (vega10_ps == NULL)
+		return -EINVAL;
+
 	PP_ASSERT_WITH_CODE(!vega10_trim_dpm_states(hwmgr, vega10_ps),
 			"Attempt to Trim DPM States Failed!",
 			return -1);
@@ -4828,6 +4835,9 @@ static int vega10_check_states_equal(struct pp_hwmgr *hwmgr,
 
 	psa = cast_const_phw_vega10_power_state(pstate1);
 	psb = cast_const_phw_vega10_power_state(pstate2);
+	if (psa == NULL || psb == NULL)
+		return -EINVAL;
+
 	/* If the two states don't even have the same number of performance levels they cannot be the same state. */
 	if (psa->performance_level_count != psb->performance_level_count) {
 		*equal = false;
@@ -4953,6 +4963,8 @@ static int vega10_set_sclk_od(struct pp_hwmgr *hwmgr, uint32_t value)
 		return -EINVAL;
 
 	vega10_ps = cast_phw_vega10_power_state(&ps->hardware);
+	if (vega10_ps == NULL)
+		return -EINVAL;
 
 	vega10_ps->performance_levels
 	[vega10_ps->performance_level_count - 1].gfx_clock =
@@ -5004,6 +5016,8 @@ static int vega10_set_mclk_od(struct pp_hwmgr *hwmgr, uint32_t value)
 		return -EINVAL;
 
 	vega10_ps = cast_phw_vega10_power_state(&ps->hardware);
+	if (vega10_ps == NULL)
+		return -EINVAL;
 
 	vega10_ps->performance_levels
 	[vega10_ps->performance_level_count - 1].mem_clock =
@@ -5239,6 +5253,9 @@ static void vega10_odn_update_power_state(struct pp_hwmgr *hwmgr)
 		return;
 
 	vega10_ps = cast_phw_vega10_power_state(&ps->hardware);
+	if (vega10_ps == NULL)
+		return;
+
 	max_level = vega10_ps->performance_level_count - 1;
 
 	if (vega10_ps->performance_levels[max_level].gfx_clock !=
@@ -5261,6 +5278,9 @@ static void vega10_odn_update_power_state(struct pp_hwmgr *hwmgr)
 
 	ps = (struct pp_power_state *)((unsigned long)(hwmgr->ps) + hwmgr->ps_size * (hwmgr->num_ps - 1));
 	vega10_ps = cast_phw_vega10_power_state(&ps->hardware);
+	if (vega10_ps == NULL)
+		return;
+
 	max_level = vega10_ps->performance_level_count - 1;
 
 	if (vega10_ps->performance_levels[max_level].gfx_clock !=
@@ -5451,6 +5471,8 @@ static int vega10_get_performance_level(struct pp_hwmgr *hwmgr, const struct pp_
 		return -EINVAL;
 
 	ps = cast_const_phw_vega10_power_state(state);
+	if (ps == NULL)
+		return -EINVAL;
 
 	i = index > ps->performance_level_count - 1 ?
 			ps->performance_level_count - 1 : index;
-- 
2.39.4

