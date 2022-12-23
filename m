Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F66654AEC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 03:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA6910E5EA;
	Fri, 23 Dec 2022 02:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6610E59B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id y8so3362974wrl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxzU/4Isx5Bw7i+FyAwZduonpplLHnY+yx6NVoxUWos=;
 b=ZzZyLbcSq/M0cWx42qPkbcS/ao1WzWXn/J1DdHQgME8hoeLXngmdQq/1z9O5FHYe7k
 rQSl2dkRf8ZF4dmPrIJGkmJU9x/kTxa0hymsbNIy+4z2QqeXTtoQh8nUpu38C7YgwXBo
 uyk8rvqJbT7YnAoVRBDQihYG3wd/lCRsy8zv9TErd6MuV7xyj2Oescfyy02hiPobGU1A
 wgfI57NBT9/C1ZTMpHNVQ5uRii6RWTQcDJggXHxsAcfBqrgcrPGDfUh9N+TbTVBO3dVv
 RYOxOnM4AqZG7UyUlOJkmJPXj0NQIfOA8h8c6Uo1d5VojHgejtwayWregAnRI+dgYWHp
 GEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxzU/4Isx5Bw7i+FyAwZduonpplLHnY+yx6NVoxUWos=;
 b=faCHOLxhfWBj8bPQR5mBup2XVJALVdtdsOuwV9wkcDL9OjHLWYOOmq0UzvPCbGxrqC
 UBlsbjDWkVvF8HKnN1PmkbeChM7DT7imtKKCUcYErf5dH/l47HOkeIlHB5zWKEw7AHXM
 +2EvG0i0koA3A/r8+ppbESucn1muqygiFk6ol5x2JkHEUWLwuiUCIkeYjPFQmOb886HA
 6gVnnET90k0Fww5TMjDTE/EoyC4diBEWrcrJCeaC31Gjj1skb+m7GYyLV2UZp5SD/Nzj
 Nc/h+mwD/mtegNJ1LaANTPx+h4zr/yodKBWpdni5s3tcIf+nc9xpUCHZWjnx5TjwiCwv
 1iVw==
X-Gm-Message-State: AFqh2kqdEuDZQSX/2OZecmVgnyEvykgU/F1pRG3AsnYhEbqF+ryf1LVl
 EOwiVPrZyMCIqcdJIA/iKEZpKw==
X-Google-Smtp-Source: AMrXdXsVIHJHohtOxRkzSsfV8ryOczF4edTTSfyWsjbBy+eH9RYuWuy4UYavNQ90Y93ylGDk2YmOCA==
X-Received: by 2002:a5d:670b:0:b0:242:509a:ad4e with SMTP id
 o11-20020a5d670b000000b00242509aad4emr4273598wru.27.1671761435282; 
 Thu, 22 Dec 2022 18:10:35 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:34 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v6 06/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Date: Fri, 23 Dec 2022 02:10:13 +0000
Message-Id: <20221223021025.1646636-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. In the .txt description we marked these regulators as required,
however, that requirement appears to have been in error.

Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
come from GPIO controlled external regulators, not the SoC and in this case
there's no need for vddio to power an I/O bus. Similarly the regulators for
the LCD are controlled by the panel driver not by the dsi-ctrl driver.

It would be possible to connect a different type of panel to the DSI bus
here in which case we may or may not want to make use of vdd, vdda or
vddio.

This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
regulators in the dsi-ctrl block are helpers not dependencies.

Add the description of vdd, vdda and vddio back in for the existing
upstream dts where vdd, vdda or vddio are already declared but, don't
declare those regulators required - they are not SoC requirements.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4b79b31123515..3144699e20a08 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -143,6 +143,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      VDD regulator
+
+  vddio-supply:
+    description:
+      VDD-IO regulator
+
+  vdda-supply:
+    description:
+      VDDA regulator
+
 required:
   - compatible
   - reg
-- 
2.38.1

