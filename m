Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14F8CBF89
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7BB10F4C1;
	Wed, 22 May 2024 10:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NV2s1AOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F4810F4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:00 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e72224c395so36420821fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375059; x=1716979859; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=03lZtK/lY1XEVDdKgvI8NPNMNTf3HunLZingl7OzXps=;
 b=NV2s1AOtMVEIuV6Lr4jHYiUM/rKYxXH9Oj+PxgJCVQ6t4b+wM8S4Qs+FlkYNy5ZxG5
 J6WDH7yaqGY0rFXdhotSo6M3jLUwPXmAciSd28LRWKtncuVRpopTtNYUS0L5J3Yy85Kk
 xbyGMhxc50K39oP8Zr3Hd57NOZ74yzm99OGRbqh9B3GC6ETE1LzIxWI66scSEj4WuI0K
 uC9iSHTKj87zMivM+C5tnQOYriMI4tGyWmE2E8/HJ35MxJaqiTc8Yq7pZ1IWVjQigMkL
 x/NiS7b/d1uLhpo69bpcMFd+0u0SEDtUB5dO7JbnOloEpeSeOUPepgS78Bow2ikcnDxV
 /9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375059; x=1716979859;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03lZtK/lY1XEVDdKgvI8NPNMNTf3HunLZingl7OzXps=;
 b=SMc/Jw1AdWwjH8ae8a1nqzU5vhW3UtnMDoHxMJYV0yS9RuqqMcRMljCL2gFjdHK/Y+
 Rck3opGyahllYRdMl83Er2T0t35Twt7CnlcGHjBHEPd/ofMu+M/mf+Ei0X/vDYiSpPqZ
 qaEthNBmMQc7uwDeByeGyOyRnU4qRnWQltmZ7p1UwtJwpyZHgN0IqVnBMsxGy7ToBonr
 qFVPYbv1/3JmWsTH/b6zXElcQ0NxujA/JaiN6hNqNvKTBRJxgdUkhFndLOh9pma2UHhb
 NibX57aM7kIJetGS5pVIpS5TwOV35UEOmI2Hry97BMJMsPMmJOekQU5Sl3tQv+C+hGmI
 mtbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1WpGXTwjRVQvvo4STEPOYbBnen4NS6fj/v9ZBWlcAobndkr3Nca1OTfZAQu/5sTFfXARCSi64ntbTnFqb7YSxuVyFTF40+53V1Q8TgTtQ
X-Gm-Message-State: AOJu0YzoyJ0k8NM0DKCMWSQY2FRd5tLOQBx2MkhtBOkx+FatpAYQp7R2
 wRSmvdzY6QPUBeQb+egubGQeqkFPksAqW2N0qDvpw4xOKvRauLk/DhVv+VG+Ze8=
X-Google-Smtp-Source: AGHT+IFjZBlFB63a+RCudEv/MwFQ9Q2bCole0thkPnhyzMY0Oy8BRRlACoKsAdrqd0TOgwhv6ucLQQ==
X-Received: by 2002:a19:ca05:0:b0:51d:8159:598 with SMTP id
 2adb3069b0e04-526bf35cb35mr855189e87.19.1716375058977; 
 Wed, 22 May 2024 03:50:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:50:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:53 +0300
Subject: [PATCH v2 01/14] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-1-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GHqYh/OpnADzbIGNQTWljjAqbsvOTUqyL6NzDNpzFls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4P+BDWacbqmwW114/XMonajf8PabUyuJ9lv
 2ys/6u9ObSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1e3eB/9uYYVb14/WnhhBPj+AyebWjWRnP0iG8FjY7dT+zHqyaHXAWZqh22kKOrvTdAFImY8ih1Z
 Lgk5naB5PAau9KARHCmo4xvSVORJHkEmzse2OCD3YJpxoS/3fZb9pqaQabxdi6zrbj2t6rksnwi
 vtvaSz0tlomAzHIpdZIAxeU6XnxshDfgfnf+44edFQ29Tb658R4vIir+ysKkGeI1qTta+6HQUlB
 EUZc/mqgBdxzKfBc0YlF+Xz0SayBG8YJC0DtMpEDdBJ4uZjmR45AZ7ihrMm57eZ5P1bkEoS4Chs
 91rAubNr/uUXsHn4+bZ3HmPH4dnNKqIfyMAvTS3WyHxqrxzv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 24abcb7254cc..108c86925780 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -235,9 +235,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.2

