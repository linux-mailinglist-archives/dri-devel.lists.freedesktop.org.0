Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8DA389A2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8952E10E561;
	Mon, 17 Feb 2025 16:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vQ7HCelN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6890A10E55A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:42:00 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-abad214f9c9so53959966b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810519; x=1740415319; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8/r1XMPHjuDO1kyhnte017ae1OCKgAX0b3pXvaRphac=;
 b=vQ7HCelNgjDX8gXFdx7JV6azJiiQ4xEYke6NlW/SgzXrb5+co8DqbfEHJn/c0Xm3A7
 n9IWV4JLTA70qLT4mPy+sKu4rLpCGR7u92cmtkXzjkrqZ6qv8YtJIymTik01dW+vLjFp
 3aFyb/8jHsCvz/MqkjDV23r8qu9XGezXypMIrmu1Mbyw+ZllJ5qLoOR39iFa3/9CrMPO
 ja8Me14g7bVv95DNvS51V1RiRRV1NDoAhCq3xe+AiNeo9jbsWU0H7wuz+9oxK4SHpwEe
 9gbVuWobCwYYPcuPrBOC9sHEX6MB1orfgGylYpxd3bO2WMe4aIhptaZf8PEROpkfULgy
 Bj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810519; x=1740415319;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/r1XMPHjuDO1kyhnte017ae1OCKgAX0b3pXvaRphac=;
 b=TjrbysH0BiQES2+KPMCOtcycbcNtoBKxmJrVzO3W0c4LI2JHnKxY2Dm/VVYTxfHFwA
 ZqPHmjiKZ+Gr7fKRfHVaMjmRbqy7IZHjwJ3d2MInnFuQ6q+q3pSyVObleZ3Du8A6eZIz
 ZWQzeH4hN4ci6iA1YxPzBCHAC6rDLTsfjK9StPWQ0Cv7P7zPA8QfE4NPmWrAahSpPrhk
 420VTqUEj3WqgvpX7sXkejAcY5VRuUCza2sXtc3eb0yiwOcH571DmFIKlsPQeei6gyy5
 4bdKb7Br+0PtzXJcsALNZJzLUxiWfvk0tcDVbqkhV3e3Di+fKHMlPfQDtNuzzOlkfbrd
 V43g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/1BN0EGA0ClW0PJEdDPH1kkm6ZvWka7PWYnPRtetFavoMUeHn3aJ0tGIEff9XrNDX80TQHzGlOVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqxweMQ1CH3nRxm9NIAb23tttHf4ZnLeymrITEgVr6t7ZWXeL2
 S2xo62f+v/zKZQTzCDqhXd0+sgzEVb45v1B4FlKQWRPTdRs/7bcXrL0j9qHbHnM=
X-Gm-Gg: ASbGnctokfUggif37AfaiipHynQ3/MWf8Yo2biD81jVf5xE87eRi8T8etenbVXEeow/
 OGMObAT6qpkVGrfH9GWZUJFqMIm0EvEbSDPFtuDd6Lea/R3txgey9I7/EIUo+1fivtyNpw8lnDs
 KDhvjcScyBfmv+WIJhL/4WDeXnS+1Sb1EN635VBk/YN1OvbQSbHXIAtGpd24X7vPBRKOsjN9TjL
 CEcx2XnrcgFRek4nVPirVa8f8J6ScxSpW+lfmGyQPbs2/Pq4q91yzj6WkG8EitVmAyyVyp3B9sk
 80A3d87vkicBxq6/Mcv1HtKAojja+ss=
X-Google-Smtp-Source: AGHT+IEWfnRL5i+VB7DrmpOwOnQj0z5hxTupC/1RGdp+N2SQOMPBNAMglWHyaypBczdPiq5cMcXAtA==
X-Received: by 2002:a17:906:4794:b0:ab7:6259:870 with SMTP id
 a640c23a62f3a-abb70d51d82mr372691666b.10.1739810518930; 
 Mon, 17 Feb 2025 08:41:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:29 +0100
Subject: [PATCH v2 08/16] drm/msm/dpu: Drop useless comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gjDcijeIK+Nbvl4pp10G9LcIQXqKrKmuCKSb2tjPXgo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a+KYCS7p4X/NziV91PDzLks/UqjmtIPffMm
 KiE7JFAIyyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvgAKCRDBN2bmhouD
 19hMEACZWaTCupbLJoR/1UEEcwXP2fpQ9ZCltQvfOK05lJoEJpbIQkdqn063y9cv4as2AJxB9Qn
 oAiyOtlRVecKPf0SuRecxBl2oEkjilHBoWAwadGMKmq7SphEFVbPQ1fucrSBLyTIfN6dJ8yqZbN
 9vhF/4v6bL3CHOvoNmq8NbMTQMLBlwBa90mbgjpVSo8WBamcBouxIYtJoUBlWaIqg93L2wF3YH+
 CwEhivw6yHQ6aG6JHtWXwMH/jVeLKfi3/nxwhcS9q28uP8K1J+EzfcuPsMkHhMnn26T5LxX+xPi
 4DsOHY9c7nJbYZOcKbZiFb+KywjjkjRzxoKK6QttsppNoB8DHanUqGgAwMpB0s3ddj7pOqtLLX6
 XV7iPLgoBGtkf/JnPIdP3xEbEy1iiVCSvq+Xgs5xgYtwQuArF28NNsO5yb4GrtRBBlMO0mVOXR6
 hJFvUDVCxiQyM39RrsPGHIxk/U+KNYyGYSofYZxw+T8I8eXt2sz6fPduNLLKh9cxDnv35aMmDuA
 ODmwSLP5hRhll+E5j07H4zQiXFsCQOI34ehfo2bNIcC9hQB2VWpsmiH4imWCWPyZG9wA8JQXeyV
 wBOszpX8tGEWzwI6dc8TlJKWHAcm7Nd05l5TOsYnrj5kHIhBx/m92WTdNT28dKwDAXSWl8+xaFD
 5H5WiASBjP2KhgQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
SoC because it's duplicating the actual name of structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.43.0

