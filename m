Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE5CD00E61
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEF010E66E;
	Thu,  8 Jan 2026 03:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="DC03F6fI";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8gHCVHFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE2910E66E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 03:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843805; bh=MK0zzzE2lE+4Jx9GbkeC4aj
 RUdNEAQHKz+y/Jux6iaE=; b=DC03F6fIqERbue3vrdi+d1K7F+X6KcIh8RDyXWbgQFU8u644wj
 IgjvIZVB5UI9Z1ue0265ybHn+yjPfRfCxJHg6V5Y5cxpLnM8oDdUs76gQb+C/f9v1NoXozSApz2
 vf+J5sVVP+6gsdaxYGuwNmGpsIF15eRQ1b2zceiRFLQgMGmMHuqwYIazLD+c4/y5aueV5NFQPDF
 gTdYb3XXrPpdvVDX4IJIwG9WZfeLUogEBd6sewLjL1XH1Sb4CTDYwzSAbERIa9CjF4/VhDR9AGW
 Gnv73gHsFZKIJVBLlEyiskGbpnzwdzN28XHUzTRqIh19AWNN9IMY0SU4mUyoHLKS04A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1767843805; bh=MK0zzzE2lE+4Jx9GbkeC4aj
 RUdNEAQHKz+y/Jux6iaE=; b=8gHCVHFDrCIXL2rbdbJbDlMqsWKpbs/PnF0+FH19XQA+dT5MXB
 U7V2B8hOMSUe5CwT1C5x0kBbatxYNxib9NAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Thu, 08 Jan 2026 04:43:21 +0100
Subject: [PATCH v2 3/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-pmi8950-wled-v2-3-8687f23147d7@mainlining.org>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
In-Reply-To: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767843800; l=858;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=jPvvXTMG7MMfp8bDN1jFPOpjLS4qHCTr3b5PhyRoe2A=;
 b=Nb7O1/TveujH9gwbe5eSg2nphf6Vpt7xziedHz600OgyK9Brx6CjqWQYfpzgqYLt0qb9Uwu87
 6xRqySY8jPzCGemqbCHyGS7m4YteZJScApknbL8pWMVLAYkrKSnmXUO
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
