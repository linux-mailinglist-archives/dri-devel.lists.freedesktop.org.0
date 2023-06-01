Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC571EFFF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6904710E247;
	Thu,  1 Jun 2023 17:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F321C10E247;
 Thu,  1 Jun 2023 17:00:23 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 3DD5BCFC91;
 Thu,  1 Jun 2023 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685638822; bh=u5Pebo6nZ9QZwWZHlwTcKLHf8y3TFQkR66oBJVT1aM0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=qv2YZ8znYq1IcODOJwK/zFcSnVmgt7tYuII4dKSP3nuBZeuMtDoqaMBc2GeEPwx10
 hTs8mQuv66cNBs5BVFVSHKEG0Tqw1xchkQGac/0i96jwDoFJeBTU/MSAh9cQt7Y9l7
 OZxtLuBjsY8oda/RiDORQR2gCSUmhWP0Ac8ZiSwk=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 01 Jun 2023 19:00:10 +0200
Subject: [PATCH v3 3/7] dt-bindings: display/msm: qcom,mdp5: Add msm8226
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v3-3-b6284145d67a@z3ntu.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=u5Pebo6nZ9QZwWZHlwTcKLHf8y3TFQkR66oBJVT1aM0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkeM6efGQ0BIg2q8eurvW7D4x7buZEuenq22o52
 ab4WF5e5kiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHjOngAKCRBy2EO4nU3X
 VmqREACinz8LWg598lYRVLWSHTQl+HIIR2HIAedEms+PS/+o7vIjPJXMqpgSI9YBWlDgsZc6iS2
 q+UIJrMttaOnhP8B59SZolCCrsEDeE6GGOaL+4QnMhbHeN1hKisKlIOIkkcympl2NqL76LN+StZ
 a3vLQ1xGCA7cCa0NUjjtdsvkE367TDgItt43hlF7x1YKvGIQ6RWQLUAp75RYqmJlJbG2EmF/oqX
 1MZVQ+zAvCWC962UvuUrLrDLDcO1U9yZNSJVAn6DGBDS47RwTNKHZQdgKIwY4HEHp+Hz95oDdeT
 Ht3KJYMtfQ/gXEB9ZtahSWDsjp33I3fGliFhfVtpg7EtXI8zIvkv98ggAMaXFZmeWIsYZiTA2NF
 4wxiut+7c6vYYo3iJZThQtPmjEM9jedLrmnKYsi0uh0pYrH1lquNPLLfsjyg/UEXOD+2R16UD64
 5xtJi6/BCsXMpoDh+4e4s9noQ6gxDxNjVbK8EfHGXIZPp84DkKAIblQUNurkEZBc8wv6cwNrltt
 qt9a+PI2xo/jZdwtdcPin37tYhjDZnMZ+1PLLpXnSmzcCGPW3iN9syxCWn2g1dFUSqsY8htRifv
 962emdsXUc5ZYE9HcNGbLraZ/IsN0sYn4DxFOaqKVA67gF6qGXY70jqilpeO8z/rW3q83athuOV
 28WYLYIftXoOxJQ==
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

