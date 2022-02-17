Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E034B9753
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD0010E7A2;
	Thu, 17 Feb 2022 03:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A639310E789
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:54:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p22so7576300lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TB5gV/5sjwk2KpDc6LqRsCf8QAe1Jc0ZykwfWMWBIy0=;
 b=NEkeyH1AK3AiRscVBVwxQydnYnI103BFdWInRv0N2AdXNqA53V2TwmqG+DjWxmhPX2
 Zfy/AoF9vLVRDP0HvY/qXu/290VDBdfr+EO7pHabrNOFgotcQyBL48Bf3QXhpJ17aJOe
 EcDJY14VgmbnP42HhxA6GxR05FAm4A3ETm7EnxvkUIEGAS8BEN6SL3LHQ3ns101W6lqq
 oYZmIvxLJV0zDlRwH/EqnS+7dzmPp/uc0g4KMzGRUISQ/KSiKrsz6QRTbaCKBDENztZd
 1umaFB6p2lkohTyg9PSGAyh7UfjLkpQGhgV1jLU8f/pYiKWQlm+dNtUBNocLmpIH+uXx
 AhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TB5gV/5sjwk2KpDc6LqRsCf8QAe1Jc0ZykwfWMWBIy0=;
 b=sTYZGSsuzDFRhTlEfSSn3SXjfnA0QGkLYUX3l5jIUnass91jvaUQJ+hYGKGKAuaugH
 DxwYorK1s67ZRVcyNZFzJUyAIWOWrj9avQnF4ifJiIKNt2Qbn92PfvaMT3mPKA9u06Qk
 vtnhDjQBWB4+b/B2MVIG3pARP78C2pV8FF7b2BgPIGBfyk1U/aMJbSEAt3eTTu4ov3cg
 /a2WS1xMzFz5ZRGkqPLPjUr2j6lMlXxYZ1KiyTrus0d4pggt41gFhlQyo0y+LLREkHCa
 tua10d0yL0U4PdF/yz4YEcqChlYmF7Wu6rPPA4j05+jS52hidekKa9f++kQ/xiJ+d2LQ
 iMgg==
X-Gm-Message-State: AOAM531XT6gikgUBO5gCEXGBqdzJK07GoB0Y0hf8r6nWpTXLe+F8+xSz
 zuIVcD17KrB5i/TfUw5OgVmlHA==
X-Google-Smtp-Source: ABdhPJwtyA5gG/LksjFEdbfLRT1Nr6ZbF8L/cuqKCgPctlNiAUIq77doptloSxqL2BIN5sNaqxExIA==
X-Received: by 2002:a05:6512:31cf:b0:443:7eb6:3440 with SMTP id
 j15-20020a05651231cf00b004437eb63440mr772193lfe.367.1645070043961; 
 Wed, 16 Feb 2022 19:54:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:54:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 4/7] drm/msm/dpu: drop bus_scaling_client field
Date: Thu, 17 Feb 2022 06:53:55 +0300
Message-Id: <20220217035358.465904-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We do not use MSM bus client, so drop bus_scaling_client field from
dpu_encoder_virt.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 16ae0cccbbb1..f5bc15b2e56e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
  *	Virtual encoder registers itself with the DRM Framework as the encoder.
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
- * @bus_scaling_client:	Client handle to the bus scaling interface
  * @enabled:		True if the encoder is active, protected by enc_lock
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
@@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
 struct dpu_encoder_virt {
 	struct drm_encoder base;
 	spinlock_t enc_spinlock;
-	uint32_t bus_scaling_client;
 
 	bool enabled;
 
-- 
2.34.1

