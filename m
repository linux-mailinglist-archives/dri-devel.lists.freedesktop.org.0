Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A075BDD61
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 08:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA6010E2A5;
	Tue, 20 Sep 2022 06:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDEF10E2A5;
 Tue, 20 Sep 2022 06:36:05 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id w13so1443888plp.1;
 Mon, 19 Sep 2022 23:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=DcE48FGDHv0yOSzbYjt1rNc9RDHXJDR1T2QYo0htzd4=;
 b=WfeSzzwjMlC1h/a8WfNvTmDa7ZVJvLPJO0rI2MnM0B5LsKfBrO7f7AfHe3L6gj0REV
 SagG+yVOhfjjKM8Y8I/9UnLYJNTWBIbNjo3LhfNA/69g7+k0PyRa2JWiSz9Howjc8BqQ
 cXTF60pxTFPfH1ivPQUBfdvqTJzuBQY7tBRwNOgGcabhmNrDBKzXQk+f5bxlwQoJx/gg
 H19nu/PHjwtk3VR6nDqM5fQ73dYzbhJyxWr9yRgdHoZAomNqcsTxNNqJ08KJshfC5AAt
 D3Fh9GTelOxInr1eevycB2gmafxEEZTMx/gdYo/6tUqBycmQamYBKTR+cJ78oPImHXnf
 W5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=DcE48FGDHv0yOSzbYjt1rNc9RDHXJDR1T2QYo0htzd4=;
 b=O6zyYdBpTWblVEAq6xPcwrg4xrYMCQM24YVlPNYOMfKkvmy5LI78AFQMaeAIE5exWV
 mpHnkHrCOjms5PpooYjPs2AEqFVLM6SyM09imnKGSI60eAMRQN1dYluJG/MKoUuyRwU1
 MAxrHA1A2020lxI3steOdIElD9+t2oNgTv1IjzUAIsrzM2AUBCIDXBnmdD60ICdiD1QC
 WajsyGhcDTiTBTkfteQ/g21eknGABIl3i5sQxKGHvlZEqg4CXQIC+8uViRU5JHVOQbjo
 i1bXgOI0/xibWXz8e6iThWwDnqMy02BKXmrB/2UY1vI9hZUT8STJvd7o5xaF6CsUPfLQ
 Q5GA==
X-Gm-Message-State: ACrzQf1lmARZrZCHGQLGzuBrVrjwVeDUFxJmncjuRLMDqcdSj/IUWz7z
 Xg/xNPW0TSQqVvYM4VPI3W0=
X-Google-Smtp-Source: AMsMyM4qpv+0B2J9/SDVZwkIT7eEtZIA5rLG3v1vSQ1E5LYdzYonEiVCQe3nrzq/M+cjqfWD0br5Nw==
X-Received: by 2002:a17:90b:2bd3:b0:203:1a03:6b1b with SMTP id
 ru19-20020a17090b2bd300b002031a036b1bmr2203013pjb.58.1663655765249; 
 Mon, 19 Sep 2022 23:36:05 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a63220d000000b0042c0ffa0e62sm611172pgi.47.2022.09.19.23.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 23:36:04 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH linux-next] drm/amd/pm: Remove unneeded result variable
Date: Tue, 20 Sep 2022 06:36:00 +0000
Message-Id: <20220920063600.215257-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value atomctrl_initialize_mc_reg_table_v2_2() directly instead
of storing it in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
index 45214a364baa..e7ed2a7adf8f 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
@@ -2567,15 +2567,13 @@ static uint8_t polaris10_get_memory_modile_index(struct pp_hwmgr *hwmgr)
 
 static int polaris10_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
 {
-	int result;
 	struct polaris10_smumgr *smu_data = (struct polaris10_smumgr *)(hwmgr->smu_backend);
 	pp_atomctrl_mc_reg_table *mc_reg_table = &smu_data->mc_reg_table;
 	uint8_t module_index = polaris10_get_memory_modile_index(hwmgr);
 
 	memset(mc_reg_table, 0, sizeof(pp_atomctrl_mc_reg_table));
-	result = atomctrl_initialize_mc_reg_table_v2_2(hwmgr, module_index, mc_reg_table);
 
-	return result;
+	return atomctrl_initialize_mc_reg_table_v2_2(hwmgr, module_index, mc_reg_table);
 }
 
 static bool polaris10_is_dpm_running(struct pp_hwmgr *hwmgr)
-- 
2.25.1
