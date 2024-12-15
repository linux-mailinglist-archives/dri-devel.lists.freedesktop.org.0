Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0249F26AE
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8317A10E3CF;
	Sun, 15 Dec 2024 22:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ueRJhv8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C641810E4F9
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:26 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso37248781fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302665; x=1734907465; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s3aML7gxQK4Qe9FGAs5JaPzifxEP7lddSGDpHtcNIOE=;
 b=ueRJhv8kf0RlzJ5fcYJclb6Oca6GhjlWfPc61yUwiFIJWdPJDOtgqaWZvkjcqUFTlc
 piYSXTWOpnbu//ADFA0nG9ZGNk9M5+WFWq4O1OM5rhjRJ/w1O1ZZuJtlwONqnpuvDFAe
 8TuxZ+dn5LUlfjgCqFDCXWyoXALQj4HfycuvQS4cGRhABOjzvsrfpt5wQNEgSSZJjNln
 mc2gb1qrZq8pJJRVfvfTJ5s+Yq+mosdyc0ONoG6Y5c2pHkzW+TypeWpZW9q6tOTBUqjk
 pAr42KJaKa9WbEMYm+HHVjWRINOnXNzwHnfSkEjg2FnrQ9Sdos9z5b8o+oiLX4ikc+Lb
 qZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302665; x=1734907465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3aML7gxQK4Qe9FGAs5JaPzifxEP7lddSGDpHtcNIOE=;
 b=G3HO0Kb+4W9SHipaofO29BSkF9663jUkkR/xa3s3jZZAULlpfmjzdVABRnweODZt+E
 eoeWxnHfGkDb43h1PnASwAieifvIXYf5JASj4CfvEIHHUgDNu3MIkrEOr+SeRu5FAUY5
 OYb3uqJnUVemZunxb/wy4y7sIMtXHxh7V47bLYHvuw5NX3hI+TJIbyp0eMvDSQsvftci
 k18d7nn9g3P9aTIMsT6G5NEt3BasJBKm8btb5IGTD25G2sl5ZueovW5jrEM1FHVHtYMw
 O+Szyj/V6yqr5MpVxoN0rK344RDoSLWQT7sIPa9e98Mr9hMW8YnAIxwVzKr9auXYG/WQ
 t7hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX20Y4snifvgu2wbir83mqLU9Dyjyju76MtvIWMqUBgbLeT6qdjYluKw7C6i2ys+uy3o9SEsS9KUHY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmAspv3sJhG+UgivpzRFdvu2tYjU34nUkptpIPRmyhYNfsQfAM
 hjlqfDkLfBSsMbmuvmrqXRBp6i6p1Epe7t1dbQK1ZPGWwKXq45mX580QjwwJ4q0=
X-Gm-Gg: ASbGnctWA+bmePExrko3Fh2zMzOPUeovCMUrs9sXgaMX0k7epfz5a6QU3Ng+lIT2i3v
 jd+NwtMQkd+FpuJifWJLZffuFOGhXIZWNYGp2VqR/hLM1kDROx18EzT752WiJr/M74A2bdKd9Dm
 xo3uW1EzdYGEMWi0U+cXinBbtYUFxteoheZ2QTcBxSVODqxXv0CFwY74O0ILvnV35yxiNqiAurx
 JlQ3a0sq9hPiPkA3GGrPEzOQOWhLMHTFqZHK9fF/4GvaZUR0tlPh+Z64N9hxKmR
X-Google-Smtp-Source: AGHT+IHgYBQaQkAuEBIaZvjJII0xL145HHOwqROw1fcPzfz0MJlC5cSUx988XIfEN/8HldbDDvn61g==
X-Received: by 2002:a2e:a994:0:b0:300:2524:84f2 with SMTP id
 38308e7fff4ca-30254444a38mr36489511fa.2.1734302665117; 
 Sun, 15 Dec 2024 14:44:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:10 +0200
Subject: [PATCH v4 05/16] drm/msm/dp: stop passing panel to msm_dp_audio_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2659;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y//bbM3DWYF3HEdpfuzV0aVuaH3FmLoVHehWOxlGh/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u5kb1ZbcWlfFkv2I2FNncdtStLPvZRzeZjR
 7RfWc9OeMGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buQAKCRCLPIo+Aiko
 1WrjCACQCw3XmlmJHS23smdMsgQID06rTdcFDYjo83IbnI92bERW3cq/yFiAwL7CVi9r9NiKhmU
 Cf4TQstar+Sj7PjNZ22jmKF7o2tZXN2N97ssGkzA/pK9i0PhHgY3zCXGUM+ciEUS3iq5ZQI2I73
 3M5U5PSShg0YSv71XpT6csm6UCXmYgIO7LoUQLYiDtrZExSEgnCXS25bQ/BJgLOSnwvBwQGOYyi
 y8zV55Ofp1TADHr4HBdw/muO6KBejAnuFbbZKq1XJXSU03dOSS9uf/NBnURt0Wd/lpxit59ZSWf
 Ydiq3bEssfRJaeVsFBkwJa9aaRBrCMg9kH04+bLvEupZ7iUV
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

The dp_audio module doesn't make any use of the passed DP panel
instance. Drop the argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 3 +--
 drivers/gpu/drm/msm/dp/dp_audio.h   | 3 ---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 9e402d71b9761f640f1a8733e10e09477ff675cb..a4b792624ccc444f8912eb967d722cb94f6d4087 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -351,14 +351,13 @@ int msm_dp_register_audio_driver(struct device *dev,
 }
 
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
-			struct msm_dp_panel *panel,
 			struct msm_dp_catalog *catalog)
 {
 	int rc = 0;
 	struct msm_dp_audio_private *audio;
 	struct msm_dp_audio *msm_dp_audio;
 
-	if (!pdev || !panel || !catalog) {
+	if (!pdev || !catalog) {
 		DRM_ERROR("invalid input\n");
 		rc = -EINVAL;
 		goto error;
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index 1c9efaaa40e5879e54c1ed4a3d04a39a85c9402f..beea34cbab77f31b33873297dc454a9cee446240 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -8,7 +8,6 @@
 
 #include <linux/platform_device.h>
 
-#include "dp_panel.h"
 #include "dp_catalog.h"
 #include <sound/hdmi-codec.h>
 
@@ -28,14 +27,12 @@ struct msm_dp_audio {
  * Creates and instance of dp audio.
  *
  * @pdev: caller's platform device instance.
- * @panel: an instance of msm_dp_panel module.
  * @catalog: an instance of msm_dp_catalog module.
  *
  * Returns the error code in case of failure, otherwize
  * an instance of newly created msm_dp_module.
  */
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
-			struct msm_dp_panel *panel,
 			struct msm_dp_catalog *catalog);
 
 /**
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8d428bc633a9f2165651194797b027dbe8655e06..24dd37f1682bf5016bb0efbeb44489061deff060 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -780,7 +780,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->panel, dp->catalog);
+	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
 	if (IS_ERR(dp->audio)) {
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);

-- 
2.39.5

