Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB28AA4C44
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D40610E7BF;
	Wed, 30 Apr 2025 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="samyk1yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE6610E795
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3912a28e629so248882f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018091; x=1746622891; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6W8PiSICnArGlEy5suIco/UFspl13NFPEnygazXjjlY=;
 b=samyk1yqYNM+EPUvET8L2HyR2DJ1U4LhHOpxjZppAfcYPGoG1wVYvp3a2e8C+hgSHh
 prwIhvxVpDOXMcK0VzxcCtY8nU/gvucZzc0JFlUDVFw9UszidEgzy5uyf5fLuNkte7rK
 AuuawdMl9tiv+ZjqXIsycckAoeiyUVtQj5YABpOiXgyKpZaTVFYQ+V9jqNLrLzwGRuTR
 nykIDSylRTj2xEemT1cXpQp7K8nTfI9ajN5oB1U2yyFfkBA6DcPjAmL6h7hTNhRZkOTO
 RInmofupC4QLJ0EpskKdSWrudLcHf1iONOIfOfRC2kRuJJwSHFpLi5brfmMHBx5855Gn
 46mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018091; x=1746622891;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6W8PiSICnArGlEy5suIco/UFspl13NFPEnygazXjjlY=;
 b=MyBbNb+j1YaaUcaDuSux+ZZ2BFbQtQzhluN94UAZuWJhhw6FXG+gGZJzKWZyW3xbLC
 xr6tEBRvdVWvGA7NGt+DM9O4j+Uo0OwEQibIvn7lWu/KFKhYXsd5iusFrK61fspI/9go
 bnmN/LDiZGxmV1cFBdzVIrcArZyzKQNM3HrvpzeCt3qtZB+sR4LEcRKAlmXYfAjsjKGT
 L2xojQ49zGSvfx0lTCp6h10UgQ2edXkEnaVPzc1PffnMB9u3Ie4HW4G/0tK0Y5iBR4mZ
 Xj4JuLdGHOmKy3M4lhqzb/SHL8r4WEJXW7jrpFRbs0ZOSaQ/saezdu7mOOsQYFWZGQ4F
 GbeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvRTDIkjSiOhrEGLne+bcndcHwjKaxUpMGAHe6qPdC4iAjwydLggjom0phF8PYX4G6BEu5YdPUC6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOjvjIQF+zTAZ+jtNo/HOsVA7KGLTnQ0S2oK/0/28ACm5JYj3d
 cdPyd3hzuClWdpBVISHZa+kYGZddecwOkAi3G79/E3yfwEgu/e6ZGNgNTGZ/zQ0=
X-Gm-Gg: ASbGnct+RGmhE8WQvrSOOBGArrTLgZ8sC+gufWRIzFl/Xa8SFPHr/NutSjVJRLk7Whg
 lj3MjP2Y29FjsjJ+LQMDjEs7jDx/y2XofLD7eHt8lmlVAz12jsDk3HWIoXLVPHHuMRUEBpdpLXc
 pNl+JSi/52bOj3dNnq860Jgr38YTmBhSlA0Sb1eVTXz85IcFgYSi0dS/DkKnUTrumlUIu40WuDw
 EtsDvYcgkeK5K4buyHLjwG0mDS+TLlvI1eR5VVMCvgAH5oRRmefSdGqlH6pw4FXxjaHXsNPM/2J
 VpH9220fwOvCm+rV4r5YDDNlBMN3Ig5DkcYqgFv2XQRA82LexI9s5ObpK1o=
X-Google-Smtp-Source: AGHT+IEzCVJSZiNy03fnea/6PddfMije0Ez6+H5H/3q7+6IeMV2wmIColAuFLdNMOykqDCe1ho59RQ==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id
 ffacd0b85a97d-3a08ff35f51mr816355f8f.0.1746018091363; 
 Wed, 30 Apr 2025 06:01:31 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:41 +0200
Subject: [PATCH v5 11/24] drm/msm/dpu: Drop useless comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-11-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EgQvRIwsoBEOkUVe8WeaPf0nvrRgE3ViQnu5z4RaG84=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7/hjxULANnZsDBXQ9N4MIbAkaAFea1m4jPi
 E+UFb7/NniJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe/wAKCRDBN2bmhouD
 1w72D/49TEEa+O1HXIvMk8OwZyiFgnoDx2yoNXTIZm8QQFkLIQxNbY1WHWkL6uu/mqeglbwGJ/N
 K7XZjzF5yIY+UuBv0lHDqbU1HYoXoJlQhQjkL7/PC95TiF9JxhizGNa0DPvS2DfVIoEVJAwZwZX
 LZQjyTeUPP4K5hD47QA1+Z5mq9+FuuyRna3P2I04PREAfWCJ7XKpE5aREGGvjL6YH178pdUdK6c
 8MdFYwjGYIDNnUdh1g5ouNoRJg2wLpOvTQXx3TfPoC9Y934tngeSHhhKiXyLo12hcd9x6bcNW1c
 +nXr08JZYQjE8yyEbxVspdObll9D/qoj192GAytqqplPK8LWYvJzxmP9zuXfAVCkduPooy0fzx5
 vQByLDEsyWU28Z0+m6Kp0ov+ozQnu7pTZfsTjl0/dbi1WsGam1FWGxGhrddBUDiyug4eAKMjEba
 c3BhvLd9pgNJXy5i6AUoF5hP9tfYbjd12FUGlg8CY3dLZxLDk1W7vA0ve8IO+QSuiEr4ZJ3SA6j
 NVBaR/FTwWi1ATtoR7KPs6gbVupFmCjRp/oB1UfFrzjDpaxNx1lIJpup6L3zM/P+fAD2bciZV3R
 9WW+JZbsiYa80I6x0Gx4PAl6+IYDEL+LZ5JoiRxC2VK74YizWNiWfXfuZ++A7FzfC6QVVVQMG9e
 E1s4mNyiNLcYCjQ==
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2db27c55787791309962acf796d5c49aaf018fc1..a310a5234e99ea4886e82ac2100c4099e6a1841e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -331,8 +331,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
  * MIXER sub blocks config
  *************************************************************/
 
-/* MSM8998 */
-
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -342,8 +340,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 	},
 };
 
-/* SDM845 */
-
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
@@ -353,8 +349,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 	},
 };
 
-/* SC7180 */
-
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
@@ -363,8 +357,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 	},
 };
 
-/* QCM2290 */
-
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
 	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */

-- 
2.45.2

