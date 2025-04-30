Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C33AA4C34
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26B610E79D;
	Wed, 30 Apr 2025 13:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yrE9kZMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6942910E799
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:11 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3912b75c0f2so535211f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018070; x=1746622870; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
 b=yrE9kZMVgghP+fEMJ29xwFX4wLupxZHWEcQ9ZgKX2PBWiXoeI9lG8YG1IFw9oJzTCY
 3WIiyI2TvmAJ8wK62da/KdomRW+DR1inApSaK1f094+tG7ft0lop0tGD9nGmaapgu0K5
 UGfo4dM2NDwrengx5/SKfD4AV8yVsNvQUGHvwUysg8CbOWfLDgI2Q1rOtHnYIf6Cu3pt
 uisu1TcwEL5RW+vLE79ysd4derMP4/vDrryvVlvxP47Tu0hcAgVJ1gsWkVj/NmKtXzE8
 xJnjpyMivIEXjlz3rPt0AaAO0Rl2kDum2R4H2L2+uqkUA+YXrNRs7dCF97o3dVLQi9KN
 7oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018070; x=1746622870;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
 b=mKNQO7hE+EDmel4eZKeqiNjSAwyYGJWKnEPhlyj6N6rP3sghwPwKVs+FQR2CRFnzXB
 DA/1P2aNGdhmi+RiujKSjKYXgfiOnorQmbTq4uSDKsY3/+7YBb/Ma4GRDQT4lwFQzDib
 T5gy69+lIeqkR34Gb0dGBMNAn1PPtKQ480flnA8p7kk/weN20gYvj93+5uAZBnHFHJTQ
 78L2FQ83M9IUjzhSuluBNhV9nfWYejbAvnJSetkj+qXsUYTfQG/VWfFbs92G7QUPP49r
 Hs5gFygOXEaGBXphMqP3R6zc1R6Ka5X57qbNFeU2KXPatBhH+/QUKvSChifAfrVk7BBz
 d0uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRuSqxpv1NIgEAq+2gU0ST9Nhj1Ir5ZZ4vP0nGib7LRlFe9PKrAHHifBxfcV7gkdbuVYMvLWQL+Ho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze0ia1GKkWgCtb+W0ZBbUe9TlV7Xf0Wp4LF5/U29S6po69HqFL
 /azgBwfZy4gWozAp1Be4BE611m4FS1IQej12CEkt9bEYwpqUo2uc47cPBmWzhdg=
X-Gm-Gg: ASbGncuolicO/actCjos1l3hkZtW/JLJFkLd+R/mWnQCcvTiayXEA/5eN+cCrwHRmSs
 kwofzFwDFOe6k3GmWZ2gmKf7rI/q+oDlaMbYxtBwWhQG81C4hYUz3dJrnL9/F4HhQBtDJqZ7+zh
 3vj5jDbJdiHt6A6SvyqyxAAz8icfnxIXrT4+u21i5s07vkxiNatU3aR4ZQOXxaVFX/S57LcHBs7
 YjUjyC+lHxfiraiFALn+uUm+03CxshLhi9s3ixMK2iw2Kn/7Exn6oOoQV7T1qkirax13tBrApxI
 CcBKVyAxrWX90wkC1AqdURMjji0vFlcObwNnYQbclYRBn8PnGV3a323goQQ=
X-Google-Smtp-Source: AGHT+IEVgUlmrLBnvxqbwa/LUtoMOM3hDEY1L7MbBEMnMdxIfLiTgCeXpDac1Fk21Uc5r+CcXiaKsg==
X-Received: by 2002:a5d:64a3:0:b0:3a0:7d47:8d7e with SMTP id
 ffacd0b85a97d-3a08ff7216dmr710931f8f.8.1746018069194; 
 Wed, 30 Apr 2025 06:01:09 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:31 +0200
Subject: [PATCH v5 01/24] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-1-8cab30c3e4df@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h4KR3WnX0MpzZeRbCF4d1eyLafzyThDf4gmxGutr8Tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7zKshEp4Q5qZHFef+w5ypkEzUmWV7dVpRJZ
 ewDM8XJrw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe8wAKCRDBN2bmhouD
 1z71EACbQ2OraW+4hnjm9Npk2+TB5ZWYJCsNSLyybCHA5phKCLlCGfHFgtY62sFOaFj/RU4ew5n
 xyP3rTZO73eGfUICcmPUFTtlQD9C58INJxLSrYwXXE6MXx/HCE/pkjwC5n6jO4iZrv2UshJbiK1
 i7rznCiMAUPiH35rDDhWG/PCaGfQjsGB2pkgL05axN5RUDqvs7owv9o7aJPGkm9vF2jkWu6xpCn
 //2jfRn6N3RJI8xCsH262B+7hpU1gqkTv8tvRVARpIph+fnqtRIl/UgAwJD16TfWUO/ESa97t5U
 Fq0AJChbIEtWGIv0CSheWLDVkGlGeYt/dFpBfM1Dc1YPXcPq1TiFybcCGHWsPEbnZUpCF0l2Uk5
 bmAb+vlIOlJFzQOPQbl8en+XxBz2tNIWLy07aINr0SyxGXY+9iGXj668LBCUxA6b/sa2v/F/WsT
 el9tAU+N8Kcr/lLTri1EN5A8bnvyKvW8971lbI3JxrN4pJChWeIPlgAw94VFYDmK6+qqpMe9GTv
 /sJcc35uAQDfbnJZM3t3UAxRDQGBQU8DOcwMa2pthlck9xds3XNBAPlo3ep5BciZayeoKNpQKJ4
 GoH73cOa+Md7U2TxqEls0p9VxxgUMgnGX2seqfJPcOb3ximzCf8eTr2CjgeJilIumv+WBA/phIM
 jcwslAE4AOUFjnw==
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

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.45.2

