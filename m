Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FFD63D75F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC4510E45C;
	Wed, 30 Nov 2022 13:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10E10E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 13:58:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g7so27082499lfv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 05:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/IkgJhGlC2jakl2mEql5tWtZmP6qrQiICZlujfOmWc=;
 b=qeI5DGC7HVu7dL1ljYAK70PykFG9IlTdEiF+RN4EhqN+g45Vwfb0ZYUgY30IcuUq1v
 IV1dR+9CViyrU70Ec/JtxkG8vbmJ9DUibs57hRzRMWRhm+b+BWeQqtMAlNk3vcj5vFiG
 dNVaLLdvj6Hx3mzzDZszjzXd06PV4+zwPffdOIlaYUjPb1fdyVTsbB8OcGz6YK70hPFP
 ZfJIWvXt8VFoqdXTPOKHzktLJCAu5zw/lWf4s38du6xHZA6/sbhephVAediUlGN+PIwP
 fwvmp8iMn7N/u3w9zv7nl6VgkDr03TsXtZnrPjhtdBZMbefGO0ouDX9wYea6vX/QqU9Z
 bsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z/IkgJhGlC2jakl2mEql5tWtZmP6qrQiICZlujfOmWc=;
 b=Bl7k2Fj+Zja8gt1ALdOCRyR8u/XtFVp3MfBa0rpHi9XgLHwUenbBpnBCNWcc5Ow+NY
 RJp/r8Q1xryvHQIMSk365z+UFqtzZLZGnf3KdPHn+FDKJ8YtQjohhNwY+sknqqmDq7bB
 aE5p1ABXLFkH1Y5OOgzQG2NFU7dvfAkkiptbPS8mm7aaJ+tCupABA/yrIRZEiQF7Qqca
 AkqAOveYlgNkPFArDh3U0x3OXDkBGw4KhPjLqiRwMOA3Wvh4CEIh9qblVY2ylFiVOaMP
 a0UA9qSBT6GZeJ73EkqNnBW1yKlPKoDrfOXaF5HKvjsyvDbJrARe9eg3GrcSqAGxCOlF
 Jb6A==
X-Gm-Message-State: ANoB5pmtmzTSqSrrXs9Z/JIGFXs6SKWNQtxlkYUBXNQRZNbcHRw77gSS
 U3W9Kxg595U351EYzv/Z4+W9zg==
X-Google-Smtp-Source: AA0mqf4mhUxGdxDyd1aKC1Sf0nP8jRR+iC9NP6I0ui600XlVx0c7uo//PmdFxfl+aNiow/+mVRXJDA==
X-Received: by 2002:a05:6512:3153:b0:4a2:da6:d969 with SMTP id
 s19-20020a056512315300b004a20da6d969mr17496716lfi.671.1669816712596; 
 Wed, 30 Nov 2022 05:58:32 -0800 (PST)
Received: from localhost.localdomain (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 6-20020ac25f06000000b00498fbec3f8asm269889lfq.129.2022.11.30.05.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 05:58:28 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply on 14nm PHY
Date: Wed, 30 Nov 2022 14:58:07 +0100
Message-Id: <20221130135807.45028-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
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
Cc: freedreno@lists.freedesktop.org, patches@linaro.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
or rpmh regulator, but instead powered by the VDD_MX line, which is
voted for in the DSI ctrl node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 819de5ce0bc9..a43e11d3b00d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -39,7 +39,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - vcca-supply
 
 unevaluatedProperties: false
 
-- 
2.38.1

