Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B965A5DE
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 18:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C5A10E139;
	Sat, 31 Dec 2022 17:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288010E139;
 Sat, 31 Dec 2022 17:06:01 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f34so35908356lfv.10;
 Sat, 31 Dec 2022 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iZuN1LxRja9IoziQ4hYPuG+gUEYeFJZkai3EMlidSdQ=;
 b=SV6Csk5E1lUiIDAMmVJfmyHpbAQHwX+TweuEANl2e7fapdY8E9goESoL3uqWiX3MUN
 v/qD/iEphEPD3n2Tq3iB4jLssDgCKP4Eco+BvkHarEWE5+PoIEMRZm7df9cLruqY4iUR
 PHnhSHIP54ST0ZDZI8euujFt4sNNQbCb7EO40rTH9e1CeIZTIAKHnWCXqf6YnOw00GkK
 rP2Hd18vHcCSurM1K44qMOPz3ED/otcQs5Ra3XRpCBhEdITr2H7y4TKU2MVRyTVNBM87
 QGo5/B5OXNu2zn3Z1ZiH8hWXA2A8oOPDincCNIQDi2AWsSiygL9BhJ1JMXW/AodpdKlu
 Mg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iZuN1LxRja9IoziQ4hYPuG+gUEYeFJZkai3EMlidSdQ=;
 b=yfV/gEdlTG4sRr1TUzt5CDZQFMmsE1Ux0qY2e3qhH7XWEl6tpPSyBPu6Qa2KwzDIC+
 7dJ+FaMHFHkzQKNECN27sGrsW45FRT0rcvK2iRIUEoRCxvjl9yLYRac8KYffw6dUp4Uu
 OKk49J5ZikDwmhR4YauFogFnXQsl+wEKkrHPG9cXXCXeRrV9P4R0c3BgajknzWnPNK72
 V5jliV3oZdlZHWzLF0BJ0sRg8q7OIiiqWfdk5lOpDmvLOGByYObFd85bVH6Mud8YwkA6
 fMhfhi+4olKawSl+VAX0he399PsOA5wbQ9fHbCusrAGgfnFbJIBl8nuFBFnYokQePDkM
 nDow==
X-Gm-Message-State: AFqh2krVgVnkdxUx2+RhpoZs0X6HiSyZqUGJXZqDZHGw+jcxDrcubZCf
 b2iy/BdftaPlR1T4gA1PDk4=
X-Google-Smtp-Source: AMrXdXs8Ll20pQVgnasU5JAgrg+bBenDu1rLCUUTtnOKPIxt8IoLCOU8Y7pbjnv4yTDLUROw7waFmA==
X-Received: by 2002:a05:6512:695:b0:4b5:8502:efb4 with SMTP id
 t21-20020a056512069500b004b58502efb4mr12391854lfe.69.1672506360068; 
 Sat, 31 Dec 2022 09:06:00 -0800 (PST)
Received: from localhost.localdomain (byx211.neoplus.adsl.tpnet.pl.
 [83.30.43.211]) by smtp.gmail.com with ESMTPSA id
 i3-20020a2ea223000000b0027dd8627ad2sm2868088ljm.69.2022.12.31.09.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 09:05:59 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH] dt-bindings: msm: dsi-phy-28nm: Document fam-b compatible
Date: Sat, 31 Dec 2022 18:05:32 +0100
Message-Id: <20221231170532.77000-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document omitted 28nm compatible which will be used on MSM8976 SoC.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe2..b237abe859f0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,dsi-phy-28nm-hpm
+      - qcom,dsi-phy-28nm-hpm-fam-b
       - qcom,dsi-phy-28nm-lp
       - qcom,dsi-phy-28nm-8960
 
-- 
2.25.1

