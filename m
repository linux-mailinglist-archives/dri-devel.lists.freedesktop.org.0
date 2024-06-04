Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F08FB332
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 15:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EB910E150;
	Tue,  4 Jun 2024 13:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tGChBq6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E2A10E150
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 13:11:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42121d27861so10326695e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717506693; x=1718111493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jPJonIEuGmGlQs1GGHFwUCHmwPCfTUCdx095z5ehb0s=;
 b=tGChBq6WihaCtVyNBrrm/s06+0amaxSKJzUJKg5elM0IENxu7kNRp2gAe0SRYuheob
 gcnUPh+ddtcCM6SiRrq1wk1Yv23D1XTLm29AN2mRsVeJ1/zS9XCJk8NXn2KfEwVCRnrk
 lYZmHrvgU82uKqbXX6O9n5FhyPdV2fwOKC7X0E8PU6DKXrcYqIehQnUk5Z4E68C/8mKV
 Qq3CFyiNTR+A/2ekbpZPvPrFPE8+bmuKtSRSGmlmGCp1fkZKoGFApeAWLL49Qh8JQCob
 72b2rTD+Sz17oIcIFj1+rsJ6G4GdEhEwsyCeusCnxPZpUCHifWd+O2cWA6mufUioUfT/
 veIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717506693; x=1718111493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jPJonIEuGmGlQs1GGHFwUCHmwPCfTUCdx095z5ehb0s=;
 b=OXtGpFM25UH9HhEI767fj0m+sXnR5inn0sJF24pirqPO8kqxQzM+wEbVicBBsRri6K
 VJTt0TY2RswKIWpgf4pKraHLknnuXnRcpBT5Ooxfyl9Szny1SxP/yTuIXHZ3UtZJ3xcT
 gC0RflHwfdzjfr99t+yE9SvnUmozTJt/I89VqqNTi8f3Frr2UzFwBArdMboKI25vGhel
 zDRTxVOF48dzjnzCJVcEUr5bUeOGuBPgkv4Z66svVLNMPiie4kGI6nri6hkQ1CkIAiTg
 +NiGRD/yPt/u/aK3vaDA4gAyUnRQmGvnVUC7jxHuRm/CzMIenK/RPhSqi/Hi27hBXcbB
 9Aww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMgaKxL6utiOOcTuu57SPgSfQzNrIRWCEt1TI/Fp5hFki57JQVXnYpR7MxcZe6yHEPwvIwpHWKPnIfTICJuX2A6tVE/GBqdvugFgiBwZ16
X-Gm-Message-State: AOJu0YwwOj+XDnEVt7ANEXdQYF3ZrysDAmaXDe3zgxjqp2GTyfh7W7DZ
 W+BH67PjB+l9VFuGpPN4eO00LTcvkEZm9Bx7ijiPAURf1EZW9Kjb07z/ZxAW23A=
X-Google-Smtp-Source: AGHT+IH+/usVFBeoh+wIT79xCMgURUIgCCMPyCo4UNbGGkw4O8nLArXyKvbDCf5Fohur20sHLnXY9g==
X-Received: by 2002:a5d:6a92:0:b0:351:d9a1:503 with SMTP id
 ffacd0b85a97d-35e0f271624mr8835715f8f.20.1717506693247; 
 Tue, 04 Jun 2024 06:11:33 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd062fe96sm11495387f8f.67.2024.06.04.06.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 06:11:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] drm/exynos: dp: drop driver owner initialization
Date: Tue,  4 Jun 2024 15:11:29 +0200
Message-ID: <20240604131129.193972-1-krzysztof.kozlowski@linaro.org>
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f48c4343f469..3e6d4c6aa877 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -285,7 +285,6 @@ struct platform_driver dp_driver = {
 	.remove_new	= exynos_dp_remove,
 	.driver		= {
 		.name	= "exynos-dp",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&exynos_dp_pm_ops),
 		.of_match_table = exynos_dp_match,
 	},
-- 
2.43.0

