Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8F91D320
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 20:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5D310E2BA;
	Sun, 30 Jun 2024 18:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="sWFrK6Ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D428E10E2B7
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 18:36:45 +0000 (UTC)
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719772604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iJWQP8kPoI5Jy7lwZwh3ljZEa5X8ygkgrRafMpTwQM=;
 b=sWFrK6EvGqQjzfhIH+d3HuwM64C8jMYpZXbThqT6mwgbXL3LBzBWFLhfgujTosu0PDC9T2
 +Is41jz5Qd4Gd9EJ6t5Q/WTlpc9QhJ2azvVkfWUZQ5jjguCfveEIHqQu1NzH0Tv/RzriSY
 3fZ7CfMpEmfTJhkWQkHVFsy1/j4wKfxQfkwA35Sax9SDKbS9aTXsCbWMX+yUeAuhCwUE6I
 OeUlScL3G62IUWNNzHnAEet1Jhefaxf/3eMqJoICPpRA7Rt5stnTj6dm0YEnEdLQMeNN2y
 JQJs1T9Ihx06yQdG/Q+73BNPvPR/qZ5aJ/odusKHgxxaLkUvfIIA+xf53hZ+xQ==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: krzysztof.kozlowski@linaro.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:26 +0200
Subject: [PATCH v2 3/8] dt-bindings: arm: qcom: add OnePlus 8 series
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-3-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=sfqCkFm4ffKdXhUh0QxIxVfly9k+wO7sdo7kIj8rVGc=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWzMisY6NFhaBX5y45OFWOoYcH6nbzOrBWKG
 2VA5vgpxKKJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 tpQMD/4uFmj2FlllhUvvBi7GnoQiMBjL2V/XwzG7SFGjFuujMRiY4vEqGxG8XUtpOUlbY/hOqev
 2Mby/K0V/TjJAaLQAm3XTC4Vnhl8zZjbWNLqmhvaN/YLSV7X9hNhwv6MS1+vnDDvTnHI4TPj9RL
 o+MO9u/PrMN+lD0cI+WF24lQm87pR4hJWccugcdBTJjAJ3pPyPYa0wOHsbuae00vA+fy0e0WKam
 pq8kP/Nh5Tl+7eGYf317Kb4K7il8TTmQr799njGNVBCrw8va2oQwO6FzCU9HMZLH2aX3tZXhdg+
 zc2V/gGx3NUzj7Op/HyXHgbo0e8mnK+Xq3lhkVCxLw3cvsVdkWSionpGZtEOF2Hk4XTY6S2r1ON
 uWv63pD2W6nERquMDN/EgYBdfi3gWB9l70f4NUShXAZuT61bFNmrecq/dFyy1DaUlK26fl5+jOW
 zOyIHyEjbjTT3hGP7En2HTTYcAeMYoQbcQYshI78laLJSlnJe5Ds2EbiWIYK/7/jZ+XJlLw+Uvh
 NWRN92tm+DMT3uTZcCjtQ5lsFP3al1XKthSenkKUEXBAf5UnH2GqgQu+9WJ20QItHyAis5BmzQE
 J3SP/GmbZVN5jdJDTBjD6x/2byLoJ9aWfK192usEFWeAsFCpRvjn4F6wPUVfrK9v+fWztq6/2w5
 QfENbPK/iHBsp5Q==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
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

Add bindings for the OnePlus 8, 8 Pro, and 8T devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d839691a900c..3687b65cc6f0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -986,8 +986,11 @@ properties:
           - enum:
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
+              - oneplus,kebab # OnePlus 8T
+              - oneplus,instantnoodle # OnePlus 8
+              - oneplus,instantnoodlep # OnePlus 8 Pro
               - sony,pdx203-generic
               - sony,pdx206-generic
               - xiaomi,elish
               - xiaomi,pipa

-- 
2.45.0

