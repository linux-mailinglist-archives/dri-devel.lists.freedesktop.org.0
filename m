Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD255AD0C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED21010E430;
	Sat, 25 Jun 2022 22:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9310E350;
 Sat, 25 Jun 2022 22:55:03 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so6043495pjz.1; 
 Sat, 25 Jun 2022 15:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HUhJyEOgZ2z2SZ5h3XBUNWhKpL54GfHjGG/MbTrPVdE=;
 b=Ck3KdhjbNQUeHJG/pVcofv5UB/TZ3zQDCn+W9qGKvwHN7L/lty9zDtudp8d2kriG4a
 cbG84Xdm8NjzqR8nFyTfhwJrlzLlPVZv44se9PFgsF+18+rK9gACM3d+/WHBFs1IQyax
 9pIDiHAaoD+g3g07UHQQpozFUl5HGG6Y2AU9xF8HSVaKX5DQpzsByYUBNZEKJx9BqKEh
 4fnwX4jdmPZ1Y5VLrMuCwdQ+zkraPnWmMlUBpXcHGBzjSfmPBeELKTY+bVCw21klQ+YI
 /nn5yiAuiyGICbUf23zK13C3zEb/BDw2qwEqfyYqEQZqUFJe+0D3ERzpcE/qbmj3u5pA
 Pr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HUhJyEOgZ2z2SZ5h3XBUNWhKpL54GfHjGG/MbTrPVdE=;
 b=2a7PLEYdKvx2mHY4AyNchs6XbuGo06OH6yJTi+r2aOkhpIWc0teu7nv2BdwwfGySH6
 WCiaC6PAZQmiudhM7y8nSgg79bYQOnzks6Sx/IY0PEQaDPymJsFr5eCrHWM+74/uZ3gt
 NmJFNiMBFzqynEJUSuXMXMF01ZjtczeZoi2KejiVaM+PFYKezZfHXc9LhHELCBzQwGZm
 mSCDxeBVbS6qVySSwh+f0U+15kLWwiYTdNe8vvPTtk8yzCfPKTDJUA67511dh03UvpPI
 NXjwoL+MDvLXzw/2sWZnUwx91pIqTtqlX8QaPG55HQSNU4T7toXuvccFzcWOSdZItxeh
 Gutw==
X-Gm-Message-State: AJIora/buht6GVcdOY5IBcVBgggBT9/9F6PPfUYHIV+6rNhni6Eq+vuW
 f/J1RV4hAk1d5bDQaAZ7dcPRPJAdF/A=
X-Google-Smtp-Source: AGRyM1s877XF18gurlXU6S2PYXHqKvW6MpxQeLmMO0u6/ZWCl66vnnSMWEGjsEuEu6yzK4qqJ6m5vg==
X-Received: by 2002:a17:902:c2ce:b0:16a:1aba:9f69 with SMTP id
 c14-20020a170902c2ce00b0016a1aba9f69mr6558518pla.67.1656197702509; 
 Sat, 25 Jun 2022 15:55:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a17090a7c0c00b001eac661025fsm4120994pjf.29.2022.06.25.15.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/15] drm/msm: Make enable_eviction flag static
Date: Sat, 25 Jun 2022 15:54:37 -0700
Message-Id: <20220625225454.81039-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No need for it to be visible outside of this one src file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 086dacf2f26a..6e39d959b9f0 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -15,7 +15,7 @@
 /* Default disabled for now until it has some more testing on the different
  * iommu combinations that can be paired with the driver:
  */
-bool enable_eviction = false;
+static bool enable_eviction = false;
 MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
 module_param(enable_eviction, bool, 0600);
 
-- 
2.36.1

