Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EAA716C41
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1905210E3EF;
	Tue, 30 May 2023 18:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3830C10E3EB;
 Tue, 30 May 2023 18:24:30 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 02884CFC40;
 Tue, 30 May 2023 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685471068; bh=u5Pebo6nZ9QZwWZHlwTcKLHf8y3TFQkR66oBJVT1aM0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=dP29WC2jWAw3eDkq3YlsuCZFMJvF57n8gz81zEyHwTOotNI2JuX1KFxiX5BwXZ0ay
 mKQxYm6OKnkttZLZJx7V79s54hvdL8b1hLdbaN/CKApMGGsY2tgayUvf+dhCERKfYN
 Ep72QgIpzw82sKX5/tMpBg3pK0hbl0JtsMDk6t2Q=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Tue, 30 May 2023 20:24:13 +0200
Subject: [PATCH v2 3/7] dt-bindings: display/msm: qcom,mdp5: Add msm8226
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v2-3-e005b769ee28@z3ntu.xyz>
References: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=u5Pebo6nZ9QZwWZHlwTcKLHf8y3TFQkR66oBJVT1aM0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdj9T0sIy4PC26+ocSl2cCiDuQP8enClPj2cu3
 GlK3REl2cyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHY/UwAKCRBy2EO4nU3X
 Viu4EAC8XjDFE158iyAWLz7x8ymaKvqDWnbUbPslUOJWlp/g/UjcYwLCcDMsIsTUHxVpc1k06iV
 +3OJZRfvdbvCmqJdNF15Zn+lCa5NxBgzZQvhVjsNZzyNJIGm9riLjltgFvgc6POZ2gTHyTA2KVS
 dntLbCXXOjvs/+dxfVLcAbM1hige+n/U/iYwIsltE9hJ0M5HaRHx3rzR+xVT7mX9UTAmN8m1U2j
 5KHoSfkZqgINHc33E2IksDT5nRGg1Os8Mw11gPhipvmUPelVc0bcd3DkwjXWAdndSHe1yNO+J+0
 Ckug5MBSAlSdPcVMmKULZ+PqQig1I6qSu5IXvVjLH2OVKMHD44AdgkhDYPmdbSSMF45S+86gpfp
 hcyFF7JiFllC/s4RWkgDitHxGgMIu0Vl3ztT4ciFk8agaKS4rjmgzdWxZu7z0YOS7hR4BvAq1oU
 l2rKE+/gJyfpTc6j6HqmKVnZTCPRUOY3k+4EjZcFBXzjl6fPuFMmbQiEahAfwq82M+WKWwQvCmw
 C3SYYKD28NlyrNwpHhGFKdwOwR4PZtkiVKCWkEQuGAdk/BI4DAo2f4eLxsVljzuPR8I04mtzKVc
 WrFyShZWE/S1XkIB6p06BtoVe2KsmtgqyKCRsIajFaIVkjlPWvFWP3bGSJ2lSvVrmWK7PqSwWpc
 ucFaMaVnUxD34RQ==
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

Add the compatible for the MDP5 found on MSM8226.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index a763cf8da122..2fe032d0e8f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8084-mdp5
+              - qcom,msm8226-mdp5
               - qcom,msm8916-mdp5
               - qcom,msm8917-mdp5
               - qcom,msm8953-mdp5

-- 
2.40.1

