Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4DAA4C56
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F2610E7C0;
	Wed, 30 Apr 2025 13:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kKdUagYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842E10E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:39 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39ab85402c9so244434f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018098; x=1746622898; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UlgW31bMSvJHQr/+7FLD6mAl+2mcjre5T4tLb0NZhIc=;
 b=kKdUagYoHZ7tSn0g0V+5UFeefT7ZuCM7bbbbC7fER0LxbJFh7sw9kZ878aloEzBa32
 aM1EC1qScjU9xlei4J7Ir3lwkXktULWd91t2eIef6al5B0V7qCDBt87gwselGp4WMvYD
 xM0U7tKLSvEA8vdxm8XwlMdngrevNAXYQ5QSREn2xqk4BcdaElgB8C27krEbXHE8QVRr
 F/gMAayhoViHODoxujmummKVtJ7MCFEzhsnrYpdUKjCw7uBKXjyPdkIIAzD02Z3wHWM5
 biR7Yre8dAjQ/2axljKy7axNqmV+UnwAliS97NpO/HiFEsrc4EW66gwmdAc8yKnue/Ns
 h1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018098; x=1746622898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UlgW31bMSvJHQr/+7FLD6mAl+2mcjre5T4tLb0NZhIc=;
 b=PdT1wMeC1exseQiuc8TQ7RKAL4LbKub0pJn+hoRF5HAbF2MCjuixaiOztW0CjDhrXu
 qPnaCK+Z0OY5ZnZDqo+trEmYVlurf1ugUQGz8gFL8x+4u1zHp14ZLkx7zzDIzo9QlUUp
 LSX5dH7ZpnDyaP85TEsy31tKvICO2Konq1Uiri0aT07leTE550hTnRTeJG4foQkNy5ws
 ePQlmGZLE/GU4QsVYSZqHDtTvou7kRbrxGgWZStOu0jPkS+5ReN5BnXDbcAa1xAyxdqq
 O+kQd5SLt2LG0CUgA1QZOiCQNg6gmEcGufWIY0qcgpeDDho2aOGAoih4EjaHIrkw0jpM
 SnSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJxTnTLkDcJb7d5grpDOzJfAH2khG7UDPTbyQpXKax0DzeVAVVeAIj0fy2hwzniWmuNCuQQRwkc04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWNnFMZvRPqEmas+1wqbuXs4qkuIDvVY2XHkhLw/sAejA5HosP
 zv3GSjLF83pMaMyImkBNh+uBO3mwBKbTEYKUFqMBEgvBNUdkprkPuTJ6dMGYc/A=
X-Gm-Gg: ASbGncu/mFyky/cNM1rjpRY+jdYz3IDxfnurYpMaDJdH9exUzwfXqqVuKjoVbgafVui
 tU1DQYiIoJykEazUOCiwqMHalSJUpU2/aNIgxdriH2YHgVtFT99fj8dd70f9ONVGDfm8tKPe5aP
 H2V+MvsNSZjRki2YS6EESvbOxhXQiGIl6iIF8/3VMKNUXPGmo3I1CDJUKcHmAnsTshN36j0SZHf
 j6R6a1ozdRrdZlZGva+lTHC1AIqR6meuIfpDNOPTv6mWWfgMdXtEx5B3ir6Scv788/VGOor76qJ
 7OqyrPVOtL9M0fG+7Hpz5GGcC/TQNPCbu71JVuAZHL0JzOpSSSKOodzd2hg=
X-Google-Smtp-Source: AGHT+IHmxoUPURdmmgQHz7Jfj8+u8t0c/VIE/4vq98Yg1gd3UGcNqtyKVvz0Ufit6P2ua3jO7/u+tg==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id
 ffacd0b85a97d-3a08ff35f51mr816557f8f.0.1746018097648; 
 Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:44 +0200
Subject: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync after
 preparing PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
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
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ie++luqCCOkUIqplEYfGoj3PyvDBiGZnnE2vPE0q2fs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8DPK+FwfYxZwhAaHV3AlW+BD3qudeCMCqz3
 OYe9MuARDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAwAKCRDBN2bmhouD
 1+V6D/48DkbGSx3PoiTDnUJsqlJggDdfcZuoUZnjxl4PJSz/rktRaRaay/hiT4JNAAsLHB+dC0S
 KJ7ZpYI4zG52UiNG7o7KJoPFFlH1SLeRgs0PuHfx58n+ZKbogI2WWIiQ++0CfuMm484s0F0E48a
 QU5wjbF0TuVEZ4gG3ud+8p7xPetF1YduSekNRPw2MRkOUV3+0857Z9eFfbVgaHPSEJNEA1rNO3K
 TmRs2D3EoX9qi+ZIvvDJ5BxYa9MjCAb39D/7XuVj3X20DYvTTyv3a46kEI08haCjxbkXFJj3axF
 MP6cXSL1fdt7Bo2TPFV0OBzPMI+AOmnwPdizhelzDbjd9vfwaUCqgeLYAWKKEjpDrrxUcGM3Gnx
 rvQ6lhr3SQjkbr6vdPkJ3VgBO2wdRLfkhvMn6UMY3j9znH0a9CX9AGKocVMq6YjqmG6ILiY/7jR
 QozLeOjqymN7TJzz1UCaCyHiPUHih5BxcO78BDTFScr40NLnLcl9zD4w/gJ6bCUi8ZGpBlB8ipk
 hx9yPNd//qGfUMCjhOrPakJ56GJOInTiey2NcrqoBCdEfROozCncSpMRDL8jADOn7U5ATEDtzmz
 PNfhEvYfXWo6F1cjAcoxwMYfZ7xPm34odoidWGhs6JERWO2+G0IdQQNy6RFaNNKflFC6SHjaROi
 zIojsRSRHDWoh0g==
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

According to Hardware Programming Guide for DSI PHY, the retime buffer
resync should be done after PLL clock users (byte_clk and intf_byte_clk)
are enabled.  Downstream also does it as part of configuring the PLL.

Driver was only turning of the resync FIFO buffer, but never bringing it
on again.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index a92decbee5b5433853ed973747f7705d9079068d..ca1a120f630a3650bf6d9f9d426cccea88c22e7f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -467,6 +467,10 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 	if (pll_7nm->slave)
 		dsi_pll_enable_global_clk(pll_7nm->slave);
 
+	writel(0x1, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+	if (pll_7nm->slave)
+		writel(0x1, pll_7nm->slave->phy->base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL);
+
 error:
 	return rc;
 }

-- 
2.45.2

