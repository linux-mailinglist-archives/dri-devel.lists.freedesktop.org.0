Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E631B7D6344
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0C710E571;
	Wed, 25 Oct 2023 07:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BA310E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:35:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40853c639abso38960425e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698219307; x=1698824107; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pe4SRUofU2WFm2fmN823Um+mIBdgfTseC5LX2TC6qmk=;
 b=Q9gIX6316QW3iHeNhOeNX1VkTac6QSXZ9TPClWD04Ph6s1KwjTtn2bRYMJZrOa7W5a
 gQjKODwua7o3hNdpjGIqJY6oEr/5o8E4EIQFQhdvvDk+KOJLrvI/LEVdfaX720+1e5eo
 qZbWA7I+JxV9RcDfiA+qlNLbVdByJcxLLdl0BvL913nTMJdd5J3vOsQ19BuoWE7QUfWs
 04lOVOol+xgbPcbpHQlv8pB6pY7kDU6VOGxXZfFyDAOfj10PsdCWae4f41EZJb4Uc2/K
 m1ZDGNYhS2NwtUw9/u83hWEr7Skqj+uqz1tegyCh52LXIU2PhSjKpuSNj+JFZru/XY2r
 8QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698219307; x=1698824107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pe4SRUofU2WFm2fmN823Um+mIBdgfTseC5LX2TC6qmk=;
 b=BXHOdpQqZJIUsek6Xbiv2Ui27+gQBXtBNKQYa1SB2LGcsQNU5Tax6YVUrHOK1Rm+58
 Z/fvW5otAZyasWxz5A2CuMh401NHzQaxLOCFejY/zYErQnq/yaEPJ9qbuxl25oe4diHu
 yn2577m/IfDzpuSr+uaMhbm1TIPqA3k7mlepJmp2BGhhog8f2jrozUHtFYtCs4oYBHDm
 JCoF02qAHxSQnEg03y8g+pMAl8KqCAzzeedNL2dZWfy1f+3TUjF3bKndc6yFCUNTTqzs
 IQCgGntpr+zGnNEQsvCwPiy8Qjn9Wn4hxnpJBxcCfcxKLWaFNvHqLMZk/tOzkkHTxxn3
 yutQ==
X-Gm-Message-State: AOJu0YwQb3j9Xr5ZmvDs2xuRiOQU7DjNi3t+1lrNuv0SlR2ye5027yT7
 WEgvMFVzDKTC+xSvnnygk6no7w==
X-Google-Smtp-Source: AGHT+IEiQvJPZXUSoJ+rvGAVwkMDv40zmLqfwbPBtb7KlNbEPmm3TB9RLLv1bPNuVdvy0rjD8U7C4A==
X-Received: by 2002:a05:600c:1c29:b0:408:3d91:8251 with SMTP id
 j41-20020a05600c1c2900b004083d918251mr10926835wms.5.1698219307607; 
 Wed, 25 Oct 2023 00:35:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a5d60d2000000b003248a490e3asm11449058wrt.39.2023.10.25.00.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:35:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Oct 2023 09:34:59 +0200
Subject: [PATCH 1/8] dt-bindings: display: msm-dsi-phy-7nm: document the
 SM8650 DSI PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-mdss-v1-1-bb219b8c7a51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=748;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LjEsqHAGp+UfualC/tIMljUQuvkQEZ5WI4NYmB6cs2o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUlzhTUsc4upScdy9doWeeZ8Av0tdD3FxQMALDK
 w6zzprCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFJQAKCRB33NvayMhJ0QJqEA
 CUt/Fq2kgT90yTup1XhV+j3NhHGt6q7dqGEjHB+5YL+39c+RYWVhJ8fq+9zDhTot7kYVsS8nJZlrbn
 JhZ44Zf77PWDphzIjLmVzSgW9QHZbzsIlNCX5Z2NyFVhbm3q/OcJKY9bRA8addCLKdo4ublGUg0Gsy
 EOMNZpc20cA0Ujl3WGyU/m3vdVRI/2J2YiEATw3d+MueFgm7w4DJnjEmnkSuwmDnuwahIlNPK++/M8
 20I32mfmeIhUe4eRUn8bnM6fSuOOqrHXxNhRHdzFIh4bCrSpJEk0QVj+pBs2nmtkczf/fK2+wpsbFs
 5sOKycIN2dIVv8mIi2w8w44dTpVT7d+VL6XrvetdsSqO9iMMy8/nrhvSJGFRt2RCQZRnYmaW8GoRWI
 zUNt4XdlIrnkdY0RovJdvaLHLGO7vw7KHd3nr0P3uKwnb0sCdnbsisxvHE6zZb5twIU1ojpsru0owQ
 vk0iBMrK4HoGvQuAC0iVoXnSip+GE1hcS/S9ULjhFqQBzYc1oTqmi6gxpkOeMYHJobJnFJFJuSwQLo
 piFfPx9T2CsDrGFIK2/A5aKSEufirnWnpd4Hpnj8blFh5MDV9rEpvEsoyBv4kxKTDwFfyLEPuqg3+W
 WegGC7+fkK1/ViVzn2uEywsilYnlcYXkeBMoT8WtERZBXQs5XMfrMBABJqPA==
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

Document the DSI PHY on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index dd6619555a12..7e764eac3ef3 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,sm8350-dsi-phy-5nm
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
+      - qcom,sm8650-dsi-phy-4nm
 
   reg:
     items:

-- 
2.34.1

