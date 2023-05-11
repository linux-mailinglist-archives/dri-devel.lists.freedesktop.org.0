Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E99D6FF8E8
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 19:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1F10E5BD;
	Thu, 11 May 2023 17:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E933010E5C8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 17:54:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc3088b7aso16840891a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683827689; x=1686419689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3dlq4sG4E5pm3IY25Wn3oaOLMVxj4Utoc+XwNq0SQeU=;
 b=zcF1/Ws/4OoXcXk4fyWJoA+pbPzNn3xXFNF4A413OtzkLWT5PZ8gZwpLZ9jODIBrui
 4eTCb2LdiYr0snJDq06pgsGHfZg0pNINWFo6wTn44LrmXXtRccq9jhq5WkSyKn8zz/Gj
 jP7ZnlTVVHF5ecKGBI8yX0AchTpPBgNamj4qfDepR8Yi8PnZ8bQ/uMLon7Op/XxgAIfI
 GhasOTJW0jKy/ByTZ8d7D42hCrkbp9pitXSturWxC7EbvyPGtzZTB4ltLQu/55Zyujhn
 c4bUTF8L6wchp1WLjH09rwm4uvtdlKoBwhEs73KMxxTSE8/BNSG6o6UPk+ttqRinUn1E
 Q+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683827689; x=1686419689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dlq4sG4E5pm3IY25Wn3oaOLMVxj4Utoc+XwNq0SQeU=;
 b=KlaeInFA5qQ8GrxmdoCjEgnRGuqIaqdqaptQXRTZvNva/BnxaYtOxS2Txxs2uggLvl
 dD8Oc98VpBeOe1v5pLE3vqfZG5raaOJTOV43+Vb304vzizPcBLPtj702ye0kDDsFnMgr
 Vj9e1yPSILiCHZmJK4a/9I/YdL+5PKvv4ibsYA3FqS+uoQwqCtUpCYwV4+bLbYmI//hR
 UX9wPgydtPeDKxGa3t2uCofd4GsSDbNY3OqgnUeajnp01mWiVqh9GHqWro4Cq71oc0UC
 9bfxn4QsxTRyRvz2bvgTSIgw3LFSYi6V2yMP93ccJpRBSYOqTAK2I/3JCvGmxxQ0Zei8
 2OVA==
X-Gm-Message-State: AC+VfDwrZgiOo5Gu8E8/QOg4vTMPUax/85S6zNDooAZ5KRPfOivRIgpJ
 TtjAr5iQ+ZMMB4q9EbE26+sP1A==
X-Google-Smtp-Source: ACHHUZ6VoNaYXYwmtaJVqGTE2wbH3xSQkdxOFLD4+Wgd02+VwN425gTuigk39B2BJgNqhyiz3/j2DQ==
X-Received: by 2002:a17:907:5c5:b0:959:af74:4cf7 with SMTP id
 wg5-20020a17090705c500b00959af744cf7mr19074641ejb.70.1683827688874; 
 Thu, 11 May 2023 10:54:48 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a1709067a5800b00965aee5be9asm4392763ejo.170.2023.05.11.10.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 10:54:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/i915: constify pointers to hwmon_channel_info
Date: Thu, 11 May 2023 19:54:46 +0200
Message-Id: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Statically allocated array of pointers to hwmon_channel_info can be made
const for safety.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 8e7dccc8d3a0..e99e8c97ef01 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -267,7 +267,7 @@ static const struct attribute_group *hwm_groups[] = {
 	NULL
 };
 
-static const struct hwmon_channel_info *hwm_info[] = {
+static const struct hwmon_channel_info * const hwm_info[] = {
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
@@ -275,7 +275,7 @@ static const struct hwmon_channel_info *hwm_info[] = {
 	NULL
 };
 
-static const struct hwmon_channel_info *hwm_gt_info[] = {
+static const struct hwmon_channel_info * const hwm_gt_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
 	NULL
 };
-- 
2.34.1

