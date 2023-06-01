Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF36171F002
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444EF10E586;
	Thu,  1 Jun 2023 17:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1277E10E585;
 Thu,  1 Jun 2023 17:00:23 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 5E65ECFC90;
 Thu,  1 Jun 2023 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685638821; bh=5WHPkyvk4StYMkcwb4dHhrbj0F9n7jmIYVJjvJu7XrI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=g1h4SGg6jLrQKsf7dBGdwKpSaOjiCWrLK9MF6xRZ2UY0dYHaROEG28MxYDrW9+P4t
 TsYf4FUF24cYLNMcKXFMXb4UQ/3wEOJ4YtlQnV5w2rObAPFn2PA0hG3a3cPtX/tncr
 6ACOA/0ZnGPltI1K2QQlIYyIDD+cEAYlEo+7x+L4=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 01 Jun 2023 19:00:09 +0200
Subject: [PATCH v3 2/7] dt-bindings: display/msm: dsi-controller-main: Add
 msm8226 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v3-2-b6284145d67a@z3ntu.xyz>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=5WHPkyvk4StYMkcwb4dHhrbj0F9n7jmIYVJjvJu7XrI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkeM6d88QPY84BJrJS1MOopM6cc6EnFLuxfLGMs
 A1Mm2N7hg2JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHjOnQAKCRBy2EO4nU3X
 Vj1uEADZ9MzzvOg6cssb2m+khXt/QvEhFRpqib9jb8iBlt08Oyb4O8UWIoJNKDCR+HIyoFFc+i7
 o3NdEGVflpzzeGCTU8sJZeFB/x7qd5lmT0v/qvzgTgRiqK8DeOs/EtgzjkE8i+oa4cu/0yo/+oB
 QdW68MO/B4ZeXxQZAArHMmBnPoidM7xL2rIb5DQg7ofAFjzIROgm5BTe1QmTZVxHGm5pDMF74+q
 ZIErHOKdC8xO7KhRnSerssRUA2o5VqHlZjkgbFL+RhgI3n3dsUkOOyb3cI6BfleSVz2seqhU1sH
 bUGXfV2K+Uv9Srrv7qhLkN5vdSMk8YWOJgBA175yAJILJkVHJXd17iK5eqoM2uYxYTYHV7Rh1Md
 HiEuZpyTWLgDZ06c1gaJRkyrzx0vXthZiTDH6skrrnEqr26f6uiDOT3ND0biyDg8WY8LDhWlUzq
 igouSEVcKFbZWItOjLsydZN2/AgAhwHq5165jRrQ6ai3R8y1NjhZAE2Vg35q/Vum3RhT+VmnA4c
 tjUOm90QPkelYm0jyrYme1eviJr+woscJqXEMS3jxp7VkxInsNWhlw79PXjjlcRpoGo1wQ1N868
 ZC5g0E+mtnGb7LgKR93PyU4GSlMLyPghOBYMSXQO3hK9Gox1nKWjb2mgHNpUZAtsQDIO9rbqK0R
 0p/YtXsXwo1DyvQ==
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
 Luca Weiss <luca@z3ntu.xyz>, Conor Dooley <conor.dooley@microchip.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the compatible for the DSI found on MSM8226.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

