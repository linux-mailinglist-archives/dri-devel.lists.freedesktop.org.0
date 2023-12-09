Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBCD80B6FA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 23:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DE210E263;
	Sat,  9 Dec 2023 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B074B10E263
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 22:58:00 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33338c47134so3079869f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 14:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702162679; x=1702767479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QAIlBevUevXrKEyLl8WmeuOwp9gUqiZZAn2K412EKIM=;
 b=dNuDume5FQcnTpQLilSyfW8yV00rNuOE8DWtR0q42+igl8tJTU3zT7uDs4I2zSRZYN
 iFhmbeFOkVuXSgQKeO3EDXNVJ6z+C4DaXckNVD8hO9caQYin6//iiwTIC/FISyKyavdg
 lMhHBjVse/ng5Ee2F60ur8G0GlEeWULAxL6mM3Hdk6szkudV/nYrY5mEspVJmC1ELICm
 YPS8XxAtUYnaWHn8w670mau4vD2zua42Cmr6zNfoCoTP+eCpNZkRso9WteTodGf40BTq
 xbL1i3T3DZ0IM/9N+T1IS7umzXDzBVmm7FR/Go87SfXnf0/UEpNdxgJ6xKYg/yIxTDzY
 5xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702162679; x=1702767479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAIlBevUevXrKEyLl8WmeuOwp9gUqiZZAn2K412EKIM=;
 b=PtqZn/dbBOTHoK3ZxnneFjf+r3gapl61fyPPtg60x2CcSwDNOZXraLJPl84mDy6/6T
 AA2xYvLdkpYyLPHhIyH5wreVoUDzgSY9gLGNtG+tiw/JwfwgHQCrREgYXlR7pHHDf7hf
 TD5zAKmpUE6StEMirLj/LgOtEp+ryA3CKIE3PaHMg0Z/Jlaa1xuej5bM9omzKnwJa5kv
 fN7dRM8K7hKQPbO9H2FoFxWzaQ5bTUBZ+PHVTML3wHpcikoDy55hZAYL8cQxwc2H4yIV
 XD+Tt3a0+IXFyfBVqnxKxmrHW6OmphysoK0rwoJawA/7B+LlbxwIB8YVDRihmUNmABb7
 9Y1w==
X-Gm-Message-State: AOJu0YxvUIRx479tbTZ2SxtZMWEdHdsTvzNDO0hqz2pC5+uDVTqTyZnb
 8rZlemwXc68EvKuwir1EHtw=
X-Google-Smtp-Source: AGHT+IFt/dBTIsv2RLCWFXFYS2R03MC1rIRuWdn7TJMPqHYH/7C4VL61To6xzKEvyIR6M/UPChvjUA==
X-Received: by 2002:adf:e98e:0:b0:333:218b:cc88 with SMTP id
 h14-20020adfe98e000000b00333218bcc88mr1239905wrm.68.1702162678871; 
 Sat, 09 Dec 2023 14:57:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 a9-20020a5d5709000000b003332aa97101sm5179380wrv.38.2023.12.09.14.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 14:57:58 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/gma500: Fix spelling mistake "patter" -> "pattern"
Date: Sat,  9 Dec 2023 22:57:57 +0000
Message-Id: <20231209225757.4055520-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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

There is a spelling mistake in a DRM_DEBUG_KMS message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 8992a95076f2..2c7d0416e623 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1548,7 +1548,7 @@ cdv_intel_dp_start_link_train(struct gma_encoder *encoder)
 	}
 
 	if (!clock_recovery) {
-		DRM_DEBUG_KMS("failure in DP patter 1 training, train set %x\n", intel_dp->train_set[0]);
+		DRM_DEBUG_KMS("failure in DP pattern 1 training, train set %x\n", intel_dp->train_set[0]);
 	}
 
 	intel_dp->DP = DP;
-- 
2.39.2

