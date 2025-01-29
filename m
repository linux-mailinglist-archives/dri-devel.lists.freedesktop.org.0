Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB55A21CB3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D7D10E7D4;
	Wed, 29 Jan 2025 11:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n+fnwQnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE3F10E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:55:08 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa659775dd5so88788566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738151707; x=1738756507; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoxYub/fGhny5IvUZRt39jPFGsJ2Xpyd6lgEIHUfGX0=;
 b=n+fnwQnXWDGOvJRNVxjCq01eCYuJkwe2VY1mEU3dTK8Mwv4rMYqd/xy5Si/ICHvimU
 Pz7f+33IlRe6H2drVMhXJ9GU7dJYi3VtliR8cf2rjIJice+dXqqhkgG5O6vU558y7unK
 Ov3lYF+tzyDjt6h6eDXhQm8TlmEHptTjUZrq/CPlo7DketdHqPfaQRzF1GwZ7eTi5Ck0
 1mOWGpEMqZ8rvxLJmN1NdiJsooxi0FGXa3rQH8tXG31L8bqMqb5ULOagobMA/jaXnFbR
 uL68SEJ7kgUUMzhNxWb2Ah6M1sn0/JvHor5hbTF12QtAiKbpGC9/wGK6RTVLnm5chaDY
 g2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151707; x=1738756507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZoxYub/fGhny5IvUZRt39jPFGsJ2Xpyd6lgEIHUfGX0=;
 b=ciPy+7MOKluah8HQsf3GJlpfsz0CXt5N42jP3OP9y6qnrVc9bXkMmnmVEuCbrmEjim
 zf6Bd46fpNvpPK/zrF9u3wOIqB7ZvRSFCd627msl3EWUN26oLTd6SZq09CXY6xt0QQ+R
 ywa9Pp2IE7EYFKE8bULllFK7VYmZ7a/WgWKB/nrO3Fd4LH858ncuweZeaPDBqkoRIEyz
 /Z81LL8P/NrCw6AeAii1KihBzXAPYDSr6zh5kG2WrOVDJD6a1ie7GOgpAbg9deeVKn0b
 IP73Wd5xm+RfK87cBZ7LS8LwTKWHjtz2IpZhUmGTzstDqWLayyBeDz2jb6Mw7ojEKnOA
 +YdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW2qEweI5N0Nbdgtt6yfiTbPqp/XH5tvniLEkDwYHRUJUH0FQ5Sk0DFSHqIkBrzA4K7MTkIPA1LWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEUqkCthhq/AVIM7XdnzJ8QTwsjmcfTkFsIdqYU0VpF05KRKj6
 K+dt6V93oX8vaS1ZB3qMlns1vTmeMpXtJixfYp4E1iyhKongFE4ohc7Q54f8/V8=
X-Gm-Gg: ASbGncvwG9nIy8nPDXZHTNNDfwX6yHC6RHLHKvOKxcahEfG6A1hMrcaYH6tG0QaLLaP
 wWjk2g63tqxjy5/tvyvzmjGbapzrJXJ5ofkmSf3WIW7CXQf0weaMY2UhG1Pp+gTWHZyR5TjhbRI
 vFWSaddKyTXIjTG1LJeX3tFF689M5dBf2iDjSRv8UtOxRx0oPg1iXsrKfJcBdsukxZE4HVcRqjg
 VX5epjNYX6w0V/eoW3/1ui9haboCrJGhjwrIA9XXc2qBqLLZvSFCOUJxIcjXDKD41P5Dai1vX+8
 1Ea9xD+CzOnP53/R/50yoa0K2Umh
X-Google-Smtp-Source: AGHT+IFjZKfgMNqMS3717CUskta9AgMI7HC+LrfGMh5w6tDILVjhok1zF479wv7ce8XTERnEEpq/Tg==
X-Received: by 2002:a17:906:b2d6:b0:ab6:db64:b040 with SMTP id
 a640c23a62f3a-ab6db64b2d7mr7832066b.12.1738151707153; 
 Wed, 29 Jan 2025 03:55:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab26asm949981866b.111.2025.01.29.03.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:55:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct
 register
Date: Wed, 29 Jan 2025 12:55:04 +0100
Message-ID: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since SM8250 all downstream sources program clock inverters in
PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested except my work-in-progress oon SM8750. Not sure what is the
impact, so also no Fixes tag.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 7f6fb2a840d2..6646f8dbe457 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -326,7 +326,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
 	writel(pll->phy->cphy_mode ? 0x00 : 0x10,
 	       base + REG_DSI_7nm_PHY_PLL_CMODE_1);
 	writel(config->pll_clock_inverters,
-	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS);
+	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1);
 }
 
 static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.43.0

