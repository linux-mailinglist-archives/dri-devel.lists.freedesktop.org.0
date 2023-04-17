Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195666E4F75
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 19:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EAE10E0D4;
	Mon, 17 Apr 2023 17:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16AE10E58D;
 Mon, 17 Apr 2023 17:42:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso6328315e9.1; 
 Mon, 17 Apr 2023 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681753359; x=1684345359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oIDH6QLW9GMl0SUIgFXpcL60wep3vko9cwbetNFih7Q=;
 b=hnZdPQ4bSnn7IM8OzetvjfY2BXRKa7KvAD32v0r1j4vHr6zQ/fo3vz25ufxSghM4FK
 TGiF9r8hUN3SJJxjj1v+CEteYAcnl5jtnABWOmagTdog0heWPB6OpJHpH5OOwFSj48+1
 IvLFwyylUzEuV/qqJGUF/i0plTiLfnFiw7ZppVPYaBqkUPJiEvd7M2wq05v3e8L+uOyf
 qN16CUGNuettXdrR5t0SHdfyZGuIV4Yizs/zfk1brEtR2cO+DNnQJyjVlUXikNvRQHGO
 LmVz54SWxenhz0ItD8BndOOMKVMN2ZGpM7xpQTuSRTs8yUoHTRHM1CrJ8mPR1E8f1Vsp
 OfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681753359; x=1684345359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIDH6QLW9GMl0SUIgFXpcL60wep3vko9cwbetNFih7Q=;
 b=OuicAMzOuiX28sjFB5aGZryedWz9br58PUYY0iISSjfxHh8mYfaJU8sPZYvyof7lCL
 5GauLLCU40g7f48iqPhm1hobLdhEtj2/jvgwrqDiACisAcPJ5Xd8z9gdrjDN48TRTLBv
 eJR2y12+kMPEzdHcKpVZZq1jibp4ItWcXoijKfbdAh0qYFz3pGCOaYyo4w784n4vu9P6
 J5TyzkuikMAyf60fC9lqiGhvPZpGvMbpInYLeUc7Mq8YpcRQTNrHPtdBbT98q9ozbopy
 Py+W8xbs/8PnAgvsPg7pcoq8d7nWwkVaCcmKRpKg/Q8bWPbvEKVBT10bYoq+MIBVgd/j
 nH7g==
X-Gm-Message-State: AAQBX9cN8f7dWsdUaDMEHyOR1ep5neepBXLdjeUx02yCbqUKPgJUmxMp
 v1eI4kR27Wfqaw60i+7F1/U=
X-Google-Smtp-Source: AKy350aIJeioHbqYsZwsjs2wu7mqk/RIk0YjL7wRrWriUPu2VJKeMsMLs0JBPaKIE17WoXikYfOlwA==
X-Received: by 2002:adf:f5c3:0:b0:2fb:be8b:133b with SMTP id
 k3-20020adff5c3000000b002fbbe8b133bmr912525wrp.25.1681753359042; 
 Mon, 17 Apr 2023 10:42:39 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d4911000000b002e55cc69169sm11024585wrq.38.2023.04.17.10.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 10:42:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/pm: Fix spelling mistake "aquire" -> "acquire"
Date: Mon, 17 Apr 2023 18:42:37 +0100
Message-Id: <20230417174237.52638-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in the smu_i2c_bus_access prototype. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
index 5ce433e2c16a..f1580a26a850 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
@@ -359,7 +359,7 @@ struct pp_hwmgr_func {
 	int (*set_ppfeature_status)(struct pp_hwmgr *hwmgr, uint64_t ppfeature_masks);
 	int (*set_mp1_state)(struct pp_hwmgr *hwmgr, enum pp_mp1_state mp1_state);
 	int (*asic_reset)(struct pp_hwmgr *hwmgr, enum SMU_ASIC_RESET_MODE mode);
-	int (*smu_i2c_bus_access)(struct pp_hwmgr *hwmgr, bool aquire);
+	int (*smu_i2c_bus_access)(struct pp_hwmgr *hwmgr, bool acquire);
 	int (*set_df_cstate)(struct pp_hwmgr *hwmgr, enum pp_df_cstate state);
 	int (*set_xgmi_pstate)(struct pp_hwmgr *hwmgr, uint32_t pstate);
 	int (*disable_power_features_for_compute_performance)(struct pp_hwmgr *hwmgr,
-- 
2.30.2

