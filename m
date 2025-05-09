Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756AAB0E07
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F60210E9DF;
	Fri,  9 May 2025 08:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jNryoBHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0185210E9DB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:59:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso20053175e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746781189; x=1747385989; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DRBK55taPvQMwljJYM7ckCWG6RHvCfzlKygUDbNUXwo=;
 b=jNryoBHc4yrB8lb37FhQubyoR/gv0uvL8KNtQ4WPphmoDklRkOl3LvNs16oy/tpgQg
 TK/XI8yRAmyUOMwXPZ62opDOthSuyTVjgzK1DUiaGTzk1s343FcW4DCx0n9tHts9Pm5m
 26IYL9M546eEgx3Id2mMH/Rhvq+oWSwE9cH3LgHpMSAk3WsLJWP2+XxW4xAiO1tHeBr8
 D+HYtsiDjJKb5DSNsLcbe4Apkr6EcNX4OnCzVdTw699ub6jY9smZsfTU9PmKc/r7ARkA
 ycDNSbX8xn0hDsdW/SS/u9t7bQ5hs9SKb3ReGybJnqXt6Ij70ZRRESyycow/XfmF7+Ml
 SCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746781189; x=1747385989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DRBK55taPvQMwljJYM7ckCWG6RHvCfzlKygUDbNUXwo=;
 b=otCKugfzYojspxJOti86lX+31iFkgN3IPy3zXYqTJMIGopzac5QFTbyWXDcXwQhSsV
 iIxdCh75Qi1vP7OVb0qEEkkDGe0CvvX2tbJPGHKC49LJrKvP6hLtQIabMyZZdYIU9vni
 MFuA3NnZNIRZ62YrANEMK6vsK+fbPgvpZP6kj5CUmPqD1rn2Y/6qlWyksMkYIbdR5yBx
 KiwuGzm1OQnQg9P40Sx/QP5rXhlSDr1mY6kqsIcu1f6dr0ejVVWzxEhVFTgJSC7Np61F
 kCG+dneCBp7KyJOmeT4j+YAsyHvWJ1xeUmHNBC6amT99qsv+Mj7tjykvOqVkuRBSdOiJ
 ecQA==
X-Gm-Message-State: AOJu0YzcGKmYHbJYySfm+nGlrsD3mEdLRUHOyvm7+Sjyjl1j+BHmx0po
 SJp12u592Mp94XzpWISDSWGmZr34P+b0XAJ/gsF3QMPyjfr1ywNs9mq7A9xkiR8=
X-Gm-Gg: ASbGncvs7rvkSPnzCZoeL9Z2rm2AZeeKXUBfz0IQxWWCvp0za0SaW8D+oW/DL2StYG+
 M6UkYGdDhKF4TFQYvNSNwWG401+jPwDzpEQESXLrEnADqIWKBHhDxXBy6rLrkl9Bn1YmZhuylk3
 k/ALLCzy0Zgdxb+ayXWDkbJvIvPf+O5EXosJK8rH2AsFj/jlCQ19K97S5HmVvebgncukOYaqNrr
 3CrGmPZiEeZsPJxgiibNIUbqti+1yDj+0Yi22wdo8ykiglLXm1JGf62B9bPCOsmYdm5ey79wLox
 R6WC3G0Qeuq1kmsofDJUkZ+Fh7IbYZNXHRRnZkA3zC1ArIoi1Qwcgri2QGeSrA==
X-Google-Smtp-Source: AGHT+IEi4oRGxvf3rarJ4EA34gWNHMfrrN3mGvf0JwgmZirlDAUM4wqDJEk8pEjPJG5QidQ9TfqiKA==
X-Received: by 2002:a05:600c:6819:b0:442:cab1:e092 with SMTP id
 5b1f17b1804b1-442d6d1fadamr18291925e9.11.1746781189468; 
 Fri, 09 May 2025 01:59:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:59:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:43 +0200
Subject: [PATCH v2 5/6] drm/panel: visionox-rm69299: switch to
 devm_drm_panel_alloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-5-c2c2d52abd51@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GPxpgXymGfi30tTTYrQvSmgXs57nzI13TRxUFomOKfg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP+ecnzg5DmaJYJHRyGNTCk0On8akQmyvH8H1be
 11j4ZFaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/gAKCRB33NvayMhJ0c3FD/
 90n/oSSx9N6qgcfjfwzf3awcAVX8BUxaNhrnpe4bmiMausPmc3BqGPj87mkqFXAw8/Rfp5oBo/u4Ws
 vPFbeuKBxR/SMNztQWHNFFshE9gbxGFbixJjSEQDWKjyTaMliok2L8aejsXgMIcn8ju46cPMYDb/BE
 YsN9NslV0VKPdtk00S+KnOa2nUjD3P3BSlO8qrmu1XMa69mBdbzDawflXr8cPabkW6x4gQAPHD6ceZ
 O1B00P07Rbkuf3W1mcJ/RjRZ/m5BcvOxicEf9EqW3j9rhbtUC15w/b4HJh7HK7u0riRbJC7Y4Q5f8I
 PKSRM1guQeN9nzrLn3E8Y1k007qRaJH4MAFu0rXjs7fHIWeiyt8Ut3v2t5tJJ2S772qVP08tIPqzbW
 6zu/SaWn+X8AkRFNSUli4LaEJL5PLdg+G4ieM6VPzPHR6i8/T5CN/cdIlZLARbTWmbtGDCJTkpAvvT
 lyElkXPnGjg9CsXUufTmcje9dB8rGchodRfuV+njvMav8v/9g5xyBAmwPsiF2m4ZhmdYcHCLDf4joy
 CEnFXw7GvGbGEyq2ks9+s7TpUC1NzvKSHIywxlyYtXfhlx5RdYdhqFwhHTNS1NZ3mnKiuhGUYw5aZN
 ZayrLHIexYn6NZHRExd2Tj7QBRyLlTbhphll2fAewTprlWnXOFE7//48MJeA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to devm_drm_panel_alloc() to add panel refcounting.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index fe921d5fb1942c47c5b849e827c244d7fbde25a3..fda1caa9052dd1c61c2dc23934d5faa8a52a6e31 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -167,7 +167,9 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	struct visionox_rm69299 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_drm_panel_alloc(dev, struct visionox_rm69299, panel,
+				   &visionox_rm69299_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
 	if (!ctx)
 		return -ENOMEM;
 
@@ -190,8 +192,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->reset_gpio);
 	}
 
-	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	drm_panel_add(&ctx->panel);
 
 	dsi->lanes = 4;

-- 
2.34.1

