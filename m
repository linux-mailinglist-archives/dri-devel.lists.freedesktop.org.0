Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F13887E7A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 19:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF3010E303;
	Sun, 24 Mar 2024 18:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cEDy5m+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0877710E2B7
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 18:57:14 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56b8e4f38a2so4749308a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 11:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711306633; x=1711911433; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9tVdKnRbHolCy0YCQM9W1+uOdyw8nD9ks6qcNg/Gsxw=;
 b=cEDy5m+8Jcro61TihJ9cByw6EPIhTFVkNL1ThokMKpE5RSC7ouuJAAGCfY6rW2UwG9
 84qaNW4wqJegkJThboeNjzUUfPAt/4hYclk3+zx5JzLaA8OBCSGNSh0VgjkR6t1TGpdz
 KaPSNYP+qOyQdIQMeys/kwdxU309Sgpm8Z9qTu9+cwEtdejZFsVkenal9fvjimX6KrI8
 1lKk/s2un16FCJc5iKDkzrP89yMYpMpPQAprtD/bVirFOxGmT4pMvEhfSaFtXaWl0cDL
 oE7258mU160/HdyKPp0iAzMUBNyDj9BmaMfkDlMyFgQJ1+T8uWcXD7YHUXbHS6xG2yJS
 /irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711306633; x=1711911433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9tVdKnRbHolCy0YCQM9W1+uOdyw8nD9ks6qcNg/Gsxw=;
 b=WDrgOJRYVBU6n7ig+D+ayVbO60dSb2tqVPPRCtlDtd+t/ENQpLxr+FsGLG8pOgfNfo
 l9Wr90C8Vz4a5Wlcwp53ryTVeGElW+AeZRFHChQY8okZwj6Zcmx7M6es+SB+ZUxgOyp4
 +E74uwwhmINDaI05ZNueFOBriRiJt+Gnxo521p4DwlPMXXfEG7oiJ5Etw/hvyhjbEsuF
 Eu9ryfrA0aMOasLF2T8yWCacXTuWRP7FgfgaqfWnURRf33ExnFJFnc7UqJhf44KvL8BC
 /nIqeVFjtmC9SLGgB96oYk9vb4e4TyvF9jhMwB4oQmatS3/fi7o6Iq8k9eVV6OPOQm9Y
 WQ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxlw/CYQbIrBPWeurHnYv1gWuooGMQnNZl8ulTgMBRdhot4/T4lBqOjRz6Yks+YYAhCmVqc5TUgrFyMl0a5PUDffngF/uqKjUQE3s+6BZx
X-Gm-Message-State: AOJu0YxemCC4Wz/Bx00Lwtc69sOA5HcehjpPF5dQb/0HhPysRYVRQ+xO
 QxUwqS+JUJnz2tNImnDx0ltTbn9iECaDrackrphzOuLywbfp03U6mbSMGtyhoVc=
X-Google-Smtp-Source: AGHT+IFlYd+N1SyUJACbQyzR/wjIo0WO1tpDaoNq3dpNT1n+rRamvALgE4pqCFDWWqICzw6XTh9dvg==
X-Received: by 2002:a17:907:7e9a:b0:a47:a340:c9c1 with SMTP id
 qb26-20020a1709077e9a00b00a47a340c9c1mr1428858ejc.27.1711306632877; 
 Sun, 24 Mar 2024 11:57:12 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 m19-20020a1709060d9300b00a45c9945251sm2194008eji.192.2024.03.24.11.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 11:57:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 24 Mar 2024 20:56:52 +0200
Subject: [PATCH v4 2/2] drm/msm/dp: Add support for the X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240324-x1e80100-display-refactor-connector-v4-2-e0ebaea66a78@linaro.org>
References: <20240324-x1e80100-display-refactor-connector-v4-0-e0ebaea66a78@linaro.org>
In-Reply-To: <20240324-x1e80100-display-refactor-connector-v4-0-e0ebaea66a78@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=PkLbbZIwmrZ4R8j4F93QwuHkzPwVCdYCtB3RljpFxJA=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAHeCsdSOdvDkDbPs2pH76+yTRro3YCA8q9GcP
 YnUm/UMdjaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgB3ggAKCRAbX0TJAJUV
 Vv47D/0bPwjqwBogmWH/gMYQiaOjOdd6oFTtCgEga2cRuC8pRUc/ojjgmMIeVDB38fOLJBWEU17
 p2QOOJKSWkeing/ZZqf883t2nfmg65Td2WSPkzyAc4l+y/joHDet+X9pigoK8ooI/g3/u+ZJrhL
 msjRbA4jbqtzUY1i31gywnPC6b/Na+fWtoD7ESMIfP89pn7ayOi+bkdgjcLLARvR6Je1f6RFkoP
 WOeAbwh42Ntxp9NdelGpTMn0qUMqmV/IhmtHPZkQNGWYIgC8HpI8NkZB4nINR42edrAgwmXmpnG
 Ww8KVz4SVaJakO4LqGpB/fjZB+tKlnqxhQfbWufuyAgL3Ny33wIz5v1ENIaV10CP76uTm1YDLo9
 bPLjNC97jnrRRCZ313O8TAKgVJ+SiynpC/yCPp/djnEB8bv5a3sNvDJNn1ZG44DuOeAgRzOFe7d
 /mVEZM20uyNkTMntw8BTyao/mVvHZ8KVekyVYb2e9IBuF8f8T3FoyZ95ZK9ID8WLSAGMJlIQ8gH
 2mNj/S8CzrQYd3NPuz9VAPaJq25EVGJBBk8iugr7DViW6IDzQHDv07z/mB8s0+EUDyKFZbxmSH1
 62rlNUJ4GrUCNXiF46OaRkmxqVnjYcI+bstOWoP6HeMmiI5kb7V7OeKt0QjIedIjhH2U+ac9cZs
 LSkgE4FXQkBq1vg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add the X1E80100 DP descs and compatible. This platform will be using
a single compatible for both eDP and DP mode. The actual mode will
be set based on the presence of the panel node in DT.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9169a739cc54..521cba76d2a0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -171,6 +171,14 @@ static const struct msm_dp_desc sm8650_dp_descs[] = {
 	{}
 };
 
+static const struct msm_dp_desc x1e80100_dp_descs[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{}
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
@@ -182,6 +190,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
+	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
 	{}
 };
 

-- 
2.34.1

