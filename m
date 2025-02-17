Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B684A38992
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B37510E55D;
	Mon, 17 Feb 2025 16:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IkMvRtAh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5FB10E553
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:47 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ab7c4350826so81821766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810506; x=1740415306; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+HIMnT9rKv4LCAVxaSh3oPZatx/4n8myKrr5hHdkG+0=;
 b=IkMvRtAhiLyFiuUdpClh3wiKN0e46s6OWTWCegDHrEYkk0W0E2MnMr8zz99uSh0m73
 mo5otPieJDcQeIiEQK2/IxUP0pGba5wkEdIkTIOE6UlofZKfRgzjtu+JcPF8mw0/wohX
 pYnm+0/DXqTkLNVUP1nR+fe2b2VbPqboHzn+iJItx9+np7P+IkdVYBgLa3VB2bA6x4ym
 EJkNcoIAt0254RvHPy27pUzCaplGsl7JVENwfWGEmsXpV2mPDOb+j/UyWB/din+YDFmI
 ZnWH1Fht1ozZLC/znpXoF/L4hNk821SAsk674W8RdYIOa8HD8T84YOz01iwdD64d+dBX
 vw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810506; x=1740415306;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HIMnT9rKv4LCAVxaSh3oPZatx/4n8myKrr5hHdkG+0=;
 b=XeosRt8dy/xjfMPCzKKKPj92hhMgJ+b0HWyqzn7WGTwDPda9sanLKT3dwx5Pq155Sf
 IO0wZLEpG9QpPBtEkvNSjqeU1SLr+Fh3iZAuNKBjODqSfmGrN692ziPamG3CamrasrKK
 gl9mTS+kyQdg/cxiYl+Q+Q7Rx3/VX7JMo5qH0MbP1APHG0z52AAMCwpFmWJkkv0fY2oQ
 Tt4dDbfHR+EN7WB7xLywOpLNCGJ6G8/lwdOIBOhrEToPY7LVW2fU352wc17QQGvqpWJa
 Fm1FozFDYaEWvntAyMq5wIGPp38Ca7MJ+MO+vRMziFlDMnjTwYRL8i1j+rgymjqpRDqG
 zUrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5otojtOb14Tpq6I2UrXDu4ckCAIMerrRMu1No/5lAYSZFt7P2sxJvjMfA/PC4h3fvGiaW232mHiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxPJGjGtUVSHIOzAcGXCYRm4DeoZASUi6SUA5z6PJsUgYmL2f/
 n/h27qj/0GaSd342YXIKbKfqDOAbbX/hHgIqRGfhxVedkPV7vW2jtqKV+k/dqzM=
X-Gm-Gg: ASbGncsmVqqpm/9uaKyVAsqBD43I3/3bWZVB78U/vpHO72M5HKn2GjDN/IIXXzUjkCd
 wTCkgkcdeGdqlKH0K4PL8WWdpGyyGjbn5KNTaxWgT0XqHurr5DDHwl9PiXds2/lXRWhMoHql3Q2
 A1O5wIhTz7cSPogUjsAh+tHIxNIamp5vJJzFJ76wWdZFJuQbSs/yRxWbeqPg8Z4CCwfdzJpv/s8
 Ks+xkgNDRrPhUrUtHDF5/jOLOxAG7RffiDXi7owLqQVIMZeLym1BmX4jKJ9dQ3yDIrXM+SZ8DbJ
 IIAHooOy1TkUMYdPqKc00M5ksdBc+8k=
X-Google-Smtp-Source: AGHT+IEMfXo/1P/9UYQHC3e4J5DzVdKeBm+BuRvLq/xydTH5+v3FpRTaZKjeAkbTmfhV8o4C7+4PuQ==
X-Received: by 2002:a17:907:6ea2:b0:ab7:cd83:98bb with SMTP id
 a640c23a62f3a-abb70ab8b30mr419577166b.5.1739810505740; 
 Mon, 17 Feb 2025 08:41:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:22 +0100
Subject: [PATCH v2 01/16] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-1-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t9jBaBbsgCUGUQ0dJnl72yICwDZwrY2+JH7Y+sjJKLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a3eoHBJ+jjXaJULfToRoRxUsUMaBW5Ys/jo
 U799xiyo4yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmtwAKCRDBN2bmhouD
 14QREACVuShwzN0vR3smx44d434stxSRMVaGDxzlczeq4W0Z9RJuMB0L30ODQlbS3QVEhKXPV+x
 LdhIUZ8IAO12urnhjUvT8gfgb6VOA/i5+CmHghGoxRmwki/EWfNz7F50+EwvUXEUg2eNeei6vz8
 x783VLK726ULU2HTSExHiYmo82eKUIImXEss+Eowl9tDhgy4kFUJUL4sGOnuQJ193UqDAioCLk1
 jlR50aqn831Yg/g6ZFoKxj9jOje85ROJWg5IS3EVEed+gIzwvlSPjgHWHYj2R5wAiWI4V3l+dFe
 VTo/JW2u59rmpH9hgw7c+d8t3yQjwB32i4GTqRf2s23bDAilIDIe0Af8rUijRMRU4ad00kGrMYO
 JlXFtFWTpt5Yrg+zKQY3Av2CNhMV1B0WzTvHlS84iK9w2hNVW5EC06cT7FbJDEa4VVSS/uzPMB1
 +f4mFbFMhPttSFVQC3iDrmtMrhyltXOEUhPsKfQvYrhYsAsdlViEGPilwMTrnZTEU0ZDrNC+va2
 TolTmSLKsckgsAJZbttVdcOtgdW5MfeDacbB2v5HjeSHWlg/vZ1ZabdWFTn3e0pslIzqNV02/zu
 oSxb+f5HiUUps3CcMeHOs0YisBr0i7fYCBcwmzBLubpnWHabms11FB54Sbj4AO2ftJIsmPT18h6
 wnysOcvNcrwpHAw==
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

Several devices have the same clock inputs, thus they can be in the same
if:then: clause, making everything smaller.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
 1 file changed, 5 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ffbd1dc9470e2091b477b0c88392d81802119f48..e496e5430918d54b2f07f1d5b64de85d29256951 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -248,24 +248,6 @@ allOf:
           contains:
             enum:
               - qcom,msm8916-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: mdp_core
-            - const: iface
-            - const: bus
-            - const: byte
-            - const: pixel
-            - const: core
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,msm8953-dsi-ctrl
               - qcom,msm8976-dsi-ctrl
     then:
@@ -328,28 +310,13 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
-              - qcom,sm6125-dsi-ctrl
-              - qcom,sm6350-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
+              - qcom,sm6125-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
@@ -393,27 +360,6 @@ allOf:
             - const: pixel
             - const: core
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdm845-dsi-ctrl
-              - qcom,sm6115-dsi-ctrl
-              - qcom,sm6375-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0

