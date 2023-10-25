Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34E7D6349
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8A010E56F;
	Wed, 25 Oct 2023 07:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7981F10E56E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:35:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso797157866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 00:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698219309; x=1698824109; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z4zOtiipUT8sw701OMgXZHG72ZF/cn8D9ojdqcZ+I6M=;
 b=fbnsL+qnLV9trP3M8wzRhOWWAUJlNNL+b9ia43o7tjghePBbKuIALMG8pYCGTulSoS
 UV02s75N47VphjSevecWbYeQfSpTVreQ+8lh4RGrIOUgrwdWGsSZiCVGE/vouvK6kOPC
 QRxnO1nTvS20Egw2s2R+Jz23D7PjB2cPSjIJ0sBuiCiSFCkX/6L+HeH9vikjUS8Y3Mth
 MYSdtVWzHs/3pWCFv3f6YdiDYB5nP5fuUWjheljbplfeyZX1fB35kLfD7c3Rkz6ixCM6
 kP1pmoGkcizhZXmlGGdKnsud489OEm5I03hYZZ7fqn83S41Ji2gYGeoq8RgP35ZgY+Rh
 7iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698219309; x=1698824109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4zOtiipUT8sw701OMgXZHG72ZF/cn8D9ojdqcZ+I6M=;
 b=YUq6BEY3U7wsLg/izvaA2R1XUrjXYJxYt74UARN8e5gW6WiH2d12I+3+w6ph/BtbJZ
 02Ppfhk2+9t19AJZHan29E+udqR7xNJ4XGGKh0ES8vuJZd+3yNONWAwwokl3npVD3Tt6
 /v2W9ahJT645ONqrykgF1rOVNFVUqWH493sRfv+9nI+Hrc3ZrckJvvIsRtJARJl4JEGT
 XN7VMoWvyJdztmwVDqpZ8plnNXVpJPqRzWRT4or7EerVbVA7Dtaad6eV9HhK56d3xdqB
 YBA6tGOKvUEooYtVCOTUqCl5J8wg6TgbGFp0ja6TutfaEUqGa22oL/S9POkiwLO8X73X
 Bk9Q==
X-Gm-Message-State: AOJu0Yxx7beJZhI/5otQKTJgRSILTy+DeXmXeXxYhR8r2UP2eMZfKBTu
 R79VOvRXmo3u8bS1p7kfkS/+bw==
X-Google-Smtp-Source: AGHT+IEWIlRxJHjlqkDhPQzwZYLZEGQw2y+NFgK0dXdjyK25j8sEgY+p48QN/rjnemCH40nSMuXAxw==
X-Received: by 2002:a17:907:940a:b0:9bf:2ddf:1bca with SMTP id
 dk10-20020a170907940a00b009bf2ddf1bcamr10284265ejc.62.1698219308901; 
 Wed, 25 Oct 2023 00:35:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a5d60d2000000b003248a490e3asm11449058wrt.39.2023.10.25.00.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:35:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Oct 2023 09:35:00 +0200
Subject: [PATCH 2/8] dt-bindings: display: msm-dsi-controller-main:
 document the SM8650 DSI Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-mdss-v1-2-bb219b8c7a51@linaro.org>
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RmyjIW0lZguWP9hWwmPF3DabpwwT0EuPrdA5wtaVnxE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUmE/hLSdAHnisyVX6XnsRoZy11MItZW/udDqz5
 NGspU5iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFJgAKCRB33NvayMhJ0T8BD/
 4gJS5f7QwonEjarJZE7rXHRj4qWZe2gJ9BUxjXRBaFYLeFFwEBAtOyOMAiE1dRXilnJj0TUDZcKC3A
 BHhMD5VsCXzEmta/5kPIGS9OZjZvJkdVzPkp8vyiyokQfUiUdv8sjD0NwOVWNTC8xIlCYK7P6pPE+J
 UHY1JOLMIHJierdDgTpHfyM8PSR7rCb1luhfelsmTRIL3BIWULwiTfdvPBNGjluXLOPCizkxqLTWJF
 wk669lsH26PKp8pmWCDHke6OIU//IVF2fy7AwyLJLMNhhIij0w+O2Ry97rDoEcQyOshJNS1C3lvu9j
 WB6iwaBu7RtVOwde9E8BNjBtktEbR5ZTX1kLd6l0Ah/5u+NGOKMCNKmVecubQmnGGuLg+XQk+AKzPq
 7sD8RBXk/CNJGqz0Q8YuQJN2gMP5MxiIZo+kBq20Bo3EHGHSFc97ZcakRDdM0bq4bwQAZdROJrtxvA
 vv//I9Ouq8Xzl4gCBLnKZUYXjS74zdtNRYh+cmwl/NzFuABX5PfioTJFRvb86YkMrCxP74m8lqBz94
 LfL4eMGRk2Hy2l2v13+2J5tKHzOndjb32BTfS3to35Khyt4tpf490OPG877c5TskAPKyiuiN+ueHBf
 u/G9qOnRMDygT+Y0Ltuk/YSvUH68+AoLeHTAfWaD6KQtSu4O4cfaXZSxquZg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the DSI Controller on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c6dbab65d5f7..24944979d500 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sm8350-dsi-ctrl
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
+              - qcom,sm8650-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -333,6 +334,7 @@ allOf:
               - qcom,sm8350-dsi-ctrl
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
+              - qcom,sm8650-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.34.1

