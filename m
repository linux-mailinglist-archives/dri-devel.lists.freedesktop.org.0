Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EEBB3D020
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 00:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C6510E346;
	Sat, 30 Aug 2025 22:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="hL2Chxyh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tT7ol6Wt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF72410E290;
 Sat, 30 Aug 2025 22:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756593506; bh=wcjl887H9qoorQWShXf6Wly
 U3a8kHxCqn+dkIRbrhsg=; b=hL2ChxyhRdniLom09pKkh4h7FKi6j0NprbC4D+EnJ2tLP2lj8r
 uOnbX6DF2zaISq9+xkSBEEzVUSJboZ4Oy2w4tzCyjB3pbxvD3Yp3J92zQGsB/UvtvnzdB2jh8ZU
 uQr/5Js20FOwFH/NhZdcShUhNWYwJH9VPPc6eEQO862RBBBuxrsa9pQx3ogKWNUpkV6fuv8KqJD
 koCUVPFlAbmyCsdHmqtDXuuyRz3/3gPkkO0Ae1KS8lKZ/dHf7B7rsLCblJ/X5Vk4RyXFUYVWtG2
 sh8g3UkZWh5eA92B2DKbfRMQivNFHjOK4FdShIpPlvvib9GEsvz25yPPy+tl1R3uA6Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756593506; bh=wcjl887H9qoorQWShXf6Wly
 U3a8kHxCqn+dkIRbrhsg=; b=tT7ol6WtYcbrZw79RVar6JEuFPLCwlRfVYZ9X2w45sotPlS3NS
 0f1Ju5Eo4Ud+LEdAki+O4LNIMZf2LUa1WiBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 00:38:15 +0200
Subject: [PATCH v7 3/6] dt-bindings: display/msm/gpu: describe A505 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-msm8937-v7-3-232a9fb19ab7@mainlining.org>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
In-Reply-To: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756593498; l=919;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=wmw2TX8XeI2jwe+eIPMA5Br3dVaIT7iuD5zo+71Kf2U=;
 b=0bW6t37nwGQN6Xctt1VDRSoReDzeMnqijOb2AFbXMExAWxblZ9tb1RKfrRo4i+XXuddw0CtKd
 6ksgHAMo/oBBSP4Q7CYbvdYXxCXnUMuc7OHS/EzzfWNHTbF5Fc3kVRA
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

Descirbe A505 clocks it is using same clocks like A506.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 7ef80f9fac8b2927b2a69100a7f6c729d9d188ab..3696b083e353031a496a1f299d8f373270ca562d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -252,7 +252,7 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-506\.[0-9]+$'
+            pattern: '^qcom,adreno-50[56]\.[0-9]+$'
     then:
       properties:
         clocks:

-- 
2.51.0
