Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED7D2CF7D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B430310E7FE;
	Fri, 16 Jan 2026 07:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="jq0DgXC6";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QyLhnFtR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A19910E7FE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547279; bh=Yj3R3LSXDIKMIRJ4s80qRXc
 cHrtpbMjXCkt9lKktnz8=; b=jq0DgXC6xSypmYksl+WVs7NotZVYiM+yV802jyfjaVTFnipHvc
 8+9z6tCTYlP7dEqOwGqSaYI5/ttPtT6anMgQGf2vG4UkZ698pN0L/OiNNGvszFgSMILJnQmDGys
 McMhTUYcYzAiMURyvNQqJn67yn3fxI/E0QwYnoCqW3ULc5SizagPpq+wg4jH0MziLwVI3IcNkQY
 Ux30Ft8Ai0qolr8qFen13KM5cwzv7HCgSLz2Vkk5fgqZzKHnsUwC7DZ4E0XlTMQl5HnAtCDAyEn
 XnRpribPpC7wUnX+6Guxa4tG/0FrrvvTHH6q0xN664O+CTGrn6TIn0QKhYrgBo7R5IQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1768547279; bh=Yj3R3LSXDIKMIRJ4s80qRXc
 cHrtpbMjXCkt9lKktnz8=; b=QyLhnFtRqcso5qNbQhH+SH7V33ZbcLSIcMQ5Up5gEcG9k+M+aE
 0bp8F+h1sHcM1eRGmlinurHrndd9Sl2oq9DA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:35 +0100
Subject: [PATCH v3 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-3-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=989;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+Z+7Ue/bQvJDRGQtEfV4EMexSZzq4Mmr/AfR4LmNRJs=;
 b=GsU6er1FmH6yqzdsXoCg+LFLlsU+cRar5sXphkj4GZcsAG0lfvwJ4tUpVPBSi19DHNfY4FMgU
 o8mF1DkMfj9DD80melNoEsI56Y3LPv5WAVSDxfedvH05CbKhgasbYoL
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Document ovp values supported by wled found in PMI8950.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 19166186a1ff..a54448cfdb38 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -243,7 +243,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,pmi8994-wled
+            enum:
+              - qcom,pmi8950-wled
+              - qcom,pmi8994-wled
 
     then:
       properties:

-- 
2.52.0
