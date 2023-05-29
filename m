Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F139714752
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE7810E270;
	Mon, 29 May 2023 09:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5298A10E26D;
 Mon, 29 May 2023 09:45:31 +0000 (UTC)
Received: from [192.168.122.1] (217-149-172-244.nat.highway.telekom.at
 [217.149.172.244])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 36AE0CFC26;
 Mon, 29 May 2023 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685353499; bh=WzMfGipgNDWNsOYbbUolxDAl9asoBs643I4DWeuO5wg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=xsCTIVZ2XydPj4aTPBhFmEov3jF00sHQPwOFpcUWAa5xQWH6V7MK6Cmlz98kWAGzT
 BR/acMHLVbBqf6dKPAv+E8BJh7+Gb9F1kBxNoWZ+mHhJT45Wqp+mZQH+WY0y1CIv+6
 MQdEbSoiwk6Vr70nPzTOxQUxsB5YVDEGWXE207hc=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Mon, 29 May 2023 11:43:59 +0200
Subject: [PATCH 2/7] dt-bindings: display/msm: dsi-controller-main: Add
 msm8226 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v1-2-679f335d3d5b@z3ntu.xyz>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=WzMfGipgNDWNsOYbbUolxDAl9asoBs643I4DWeuO5wg=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdHQUzO1mR9BwKnPmS8ocLKymVBUj1cJ4J6vHR
 9Fmkuw+9CqJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHR0FAAKCRBy2EO4nU3X
 VrvmEACG9nQBxjvX7hJykfZ4TC2iWDL/e/P3QD0g54i/5noyQc+SwwPSH2XedmFuQ0Iu9iCebPM
 VBp9IE0U+oNbZSx1A1dhVNm56mAmVEJizEfs5fhtBfnXC92oUYZbN4lM3P7PIb+boRm1qCcuHAz
 /errQCUMKcOytKA16SBFJHXJZCVPNUgVcr/0C29dMEa7AKB6GMk1AOzjBTnIYL3r+MH9bQ22VWS
 IJVSKrpPKoEysaLUMiO9MFSm7PizXMZeEBQHCOaAfKFRGhPqMIubSFcmPVsEc7Qr+u0EjhZITeq
 XTyC7JJvtqNHz/Bd77Lly8a13zg/yCsE1opWxT0dBHHfoCAC5moRElTimNXnpZX5vas9eU2TRD2
 aDW/j8h1AqxuHtWQGV+F4eDpth1t/CtHqy9d+aR4gctlsxP/KYcMYvs4lJxt75GcuEIliAe2MgQ
 I3LZ73lAWVYeRx+8D5hdyixsk96X8OyKAsonK2izV3qCzWVHhoQ3kkRLKFLHduOnE5pUMqyvDWh
 10dBmKSKel2dW8ZcQ10uJsHGXGPACOPriiScJ9AMkahPuIzqcFTa1ACPAkXIqjpU1yGhWQVq+pz
 /4IyBlF1e3pFD6A6o77XNY1uV91E0iRbhADdiAJTzSZA5foJoJlL7h7iLkN7HavLd/psanLxZA2
 qwXHLt+GKHLj82g==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the compatible for the DSI found on MSM8226.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 130e16d025bc..660e0f496826 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
               - qcom,msm8974-dsi-ctrl
@@ -256,6 +257,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8226-dsi-ctrl
               - qcom,msm8974-dsi-ctrl
     then:
       properties:

-- 
2.40.1

