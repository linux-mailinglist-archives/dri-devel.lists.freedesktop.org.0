Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E2887E77
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 19:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD49310E30B;
	Sun, 24 Mar 2024 18:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S2BRX4y8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6461610E09F
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 18:57:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-515a81928a1so884661e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 11:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711306631; x=1711911431; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tVN8D/5N0Uyspg/EOqzGv8QkQMu3D3Z6cYgiWKzgOIk=;
 b=S2BRX4y83IgQLZnoADsFg0YHc9Nr/GxK9Q4JYlwzCypttLY1l8OLdI3wUqM4kJYRws
 GHLbYPZW9EpgT+Lr7wPbV/oYndZeFmSbBaB49fQ6sjmwAsHwjD+z8c0RB3cdzsvTv/mn
 LFt0wiWRgvgpF7hOKcqcJ72zghN2i/L4LHNxDzxfZ87V44HszLCBJ5AeCRDWvyFoiMq4
 vNK6WDFm9vXUnHmYKmclIl6vVcfRscGQUF20ovZRv4+8ZRFKotq94skcb+jsVJeXOKnz
 XfyxOmaHSOjPl0PMKEEAJqCFuYgGIM/4i03luSmi+nG/JZd0de2D/3klZjKznq5k51gq
 Tb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711306631; x=1711911431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVN8D/5N0Uyspg/EOqzGv8QkQMu3D3Z6cYgiWKzgOIk=;
 b=emZ6irf4YxKHGHfJ1aHOL//UcwAmKVEf3KmrsieyTUaL96hsQo6QN8dETJ8g7HihUY
 tQauPuLBCzK1pWwXQuccxXeI2knvn6jCWTsRfNaVJv0XiHwJQLF8Q3c0G2scBCG0j6dy
 1npxdYo9QHrNxoLtRuD7edY4It6CRARuhna75ZLSDG+2q7UhgJPWDHOQCVOpN4PEF1tY
 YzM9TLZqL0I9jLypA+jD/fDeszvNstvhOSuWUH5F8rXNGRHgPCHoPt0vcWGWxy/F+cjU
 YYiAviCFCBOenD8y0Ue+6JiKkMyqosy/ihvAXWhwxvE5ekKgEhbK60VqbpIsLgTpitcS
 P8Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA95dIFj5/3DDnm92xoZ/0Epr2bchjt79a/x3Ict28X8A3X4qodFL7I8lP/nMb51kAU+tRbOhHxsp3ozjwBNVLZHTR0s54pet9F/lsPkZN
X-Gm-Message-State: AOJu0Yw9dyW5Vu3gLqlGcqIb74sEBrM/+ipnmYkDgeD/ayiCTqzl+7td
 jbqolWbZTLR7tslODwvBF/L+j/khgXGiTAlkNP+/ZvGYHlvMoYBFP1rTqDfpUVY=
X-Google-Smtp-Source: AGHT+IHGpqFZdzuNs12HTt42MK5CsHqzalyY4AxaKVvVmNTAOVCX41+QspypOu+I1cPNmWlJn5NyHA==
X-Received: by 2002:a05:6512:12cc:b0:515:acbd:3ec4 with SMTP id
 p12-20020a05651212cc00b00515acbd3ec4mr473886lfg.16.1711306631252; 
 Sun, 24 Mar 2024 11:57:11 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194]) by smtp.gmail.com with ESMTPSA id
 m19-20020a1709060d9300b00a45c9945251sm2194008eji.192.2024.03.24.11.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 11:57:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 24 Mar 2024 20:56:51 +0200
Subject: [PATCH v4 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=W+ixrxB17oBlZR5+q98FI6rFAsGuYD9iSG3AVEjJDtQ=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAHeBsZIpB8Uauni+2TSikC5QzjLlvF5qYFr3A
 ygziovcZrmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgB3gQAKCRAbX0TJAJUV
 VsOWEACL930zCGaf6kuqdiBz5yYmZIV/rq1f+Qv/7ml/Hn7PXQEVdDyv+BLdW4gG5F2aYeMtMCu
 aa4iaXRl2bb71L50VPo8M6xDlgRVakNwln3QqkA5LVytVRjez/hHAU5mNxpWRVWCNkk5gziLzmw
 d/+hLQqusEqfP1XAiQf+GIPqBz5opAV3sXsfa+KevOzrHN8Hu5t28Awqv+m5KXcNF9pIoEnQd7D
 UYgaYjLd819IQ9ApYzHAPk5iZv8NK9Owu5NspjIt7tnFgjMKwRSbfUzIkMWkum4kC64BIlscVJ4
 9KxD5g9isZZVkcqY8oZHKsnG92GLWztm4CJVzWd+W0IsRACmYRK8fYHkXWAtl0CVfT1vRT0peQj
 5OnxyTN/dx00cdFWxkiV6Ayn3kKtCw5cZHtega1yQrwIOqSOsuPFQlGj3ZmBp/YFp3AGJc6CLPg
 B0dYlGXsMZbOYDuQun5xPsiFMRtGFzCVT6DakS6m+6nGR4xT/ovtNjrT1Q6Kpx18SyOVgh6PRnt
 loUF9+eT3aH7+xxKs1KN8zqfq3UZULQ0i0IJ/6eYicKXmgWjBliLt9Hx/tsTG445lOuYnTHhmvs
 VC9hTp8TMyoJiC1lwTfdvbEocdUDuUnsDVv8mIRQv9EgRyU2isT2by45OZ4L9tDYOmrxxmwtzO2
 a+/VR6wqrv1VVzQ==
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

Instead of relying on different compatibles for eDP and DP, lookup
the panel node in devicetree to figure out the connector type and
then pass on that information to the PHY. External DP doesn't have
a panel described in DT, therefore, assume it's eDP if panel node
is present.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c4cb82af5c2f..9169a739cc54 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -726,6 +726,14 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
+	rc = phy_set_mode_ext(phy, PHY_MODE_DP,
+			      dp->dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
+	if (rc) {
+		DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
+		dp->catalog = NULL;
+		goto error;
+	}
+
 	dp->catalog = dp_catalog_get(dev);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
@@ -1241,6 +1249,25 @@ static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
 	return dp_display_probe_tail(aux->dev);
 }
 
+static int dp_display_get_connector_type(struct platform_device *pdev,
+					 const struct msm_dp_desc *desc)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct device_node *aux_bus = of_get_child_by_name(node, "aux-bus");
+	struct device_node *panel = of_get_child_by_name(aux_bus, "panel");
+	int connector_type;
+
+	if (panel)
+		connector_type = DRM_MODE_CONNECTOR_eDP;
+	else
+		connector_type = DRM_MODE_SUBCONNECTOR_DisplayPort;
+
+	of_node_put(panel);
+	of_node_put(aux_bus);
+
+	return connector_type;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1263,7 +1290,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->dp_display.pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
-	dp->dp_display.connector_type = desc->connector_type;
+	dp->dp_display.connector_type = dp_display_get_connector_type(pdev, desc);
 	dp->wide_bus_supported = desc->wide_bus_supported;
 	dp->dp_display.is_edp =
 		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);

-- 
2.34.1

