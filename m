Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073FFA3D7F6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF32310E944;
	Thu, 20 Feb 2025 11:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u51D0B4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942B110E942
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5439e331cceso895913e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050100; x=1740654900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v2FT69grsgtQGwodtPuDBrmjAJehPRULckabnrzgeOM=;
 b=u51D0B4uEAQCa1B2ZUIF5Wsj1bc6dT5lj5QB5id6JWOhdek2oT75zn6AS8E1EvVyv+
 iywuoiRjrrryAP9U3nF/RJu01zmRY1+OkwWYe70fgIf4wvklxWMT+V3iFhQPisK6Eu1x
 MDE652wtOQoh0U8SC7xrWzT+QFY6mlU/I6J+SBBcuLrFJIziASMNOh2IFFFGFUmYa6j9
 YPKqL5XGNU+q34P70xx6H5WeNpVqenGxbr71fa6Vq30SbzQlHUugjo8Uoavgn1yFRWQ0
 BmX+3sB1AqbyADB9tIGiXa/H2hAY6NQa3SoF+nYeQ5Dyc7y9u7EKMIgfoRuhTsSbqs9x
 HnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050100; x=1740654900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2FT69grsgtQGwodtPuDBrmjAJehPRULckabnrzgeOM=;
 b=btmwW2RzGTcGczTxbxbPY5qgludBf/TdboEkmeRdIGbcOgRnHxvtV/isM5Mx+H82UH
 xHiGSrEB8aUYu0f6Gysw3YmkEekywhU3jbGZVyBUsJllooBykYsSVOQ+GZaGkipI/fwE
 C7MTyuz9T1rSq3RB2DEpgDACc2IqBnJe1xeJPmerKMve67Dyz3JjV1tUP5+Vekud5Dws
 3yE0YbAK+LPAqT2pzq9q1Gnx4QcT6v6hritWitoVXGn9XZq+7zLExXBbq7N5s3UHXgSj
 Z9ME7/RLABpdSU34Fg35wOOHPJlvgawdkCKFL0pon7R4ZGgSGBfWX1BYmjTe7KhHk6ru
 3E7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1S5BqaK1PydHvK23MG6x/Fc6aj5TkFd+HH627F76W1IP73bLzDmi+oL8MSpAN6iudakJQMJjK7JU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWZ36pIbrxfFlcfDLPHT0KPAlCNwJbNqQEpwGB8vwmhRPUNFEO
 q2DORK+67sZ707klidnijziFX3VEGZ342TRx84FDZlBCGEdIhRhj0gJn/NeGxos=
X-Gm-Gg: ASbGnctoPToZBEWMdQUWiT8DtTRxqQ9Iw7P4HpjsySTrzD12jAddGGx45MRFW3hcFG1
 vT9saK/hCXyit1eiLSVlTiDf47wgFr+qUZYPha/DEa+EhjkFlsurThd6+J0/6pdIycQBvuRfKWi
 nCoAOGWt604rPOcs3QKablaGCKuJqJrf0ISQNRZ8T8R8jXQ+4rX+qYqUmZklRtV7ccg4xFyzvBJ
 mfULtFLB5cCmlZUgEBaSdbehzfv9G5HTD8mgp4yLqVSUpmaIJYGVTMkuDw1rMJMAt0dK+j+/qL8
 G76oT+JfcFeVcSkD8ZTopVg=
X-Google-Smtp-Source: AGHT+IEK5YepgQWPALUfLRJKi3C8erOz++2sLryCYJu3ofhHXWr7LbJxyrpPkJIZbnwDfcXCA7dAIw==
X-Received: by 2002:a05:6512:1189:b0:545:bda:f17 with SMTP id
 2adb3069b0e04-5462ef201a0mr3010127e87.44.1740050099792; 
 Thu, 20 Feb 2025 03:14:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:14:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:44 +0200
Subject: [PATCH v2 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Iuu/rih2gTkZKK6Ghs6dsVuCdf8xwLg/vMhkHtsubTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rBhceXrSdx0nb7uB53zSoFWDO1AkbXhVhq
 +gcl/EdOZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1YGzB/0Xno3UiIYTOdud4CEcJfrYiPKQ+eDCZMrq2/oZ3IKWU8zODmyCDhFLUcbZQ0C04pdG40O
 rYOSy2Jg8WQNkxq444ypAAVL3fV3LD466bkbnE84alabWsqUc95eCsbpatXcR1zt5C0SXGXZiZc
 Md04vbC4VX36PjRWVJigYfHQbbINZ7pG28jzX3Sk3GzjQ4frPc8PlEI7NBw+0T9gPcqfovjJp4a
 j+JLYqZ2LQFVh4CThB5jajAT1whTWnjZZNxaUgEld9idFUVCoLrRLazh8ADiIT3oMEBF9UbJt2J
 FY1lN1Ofmnmmuw+OeJcGqDv8RkS5ZlbAx+7roaozkAtlnVV3
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

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5

