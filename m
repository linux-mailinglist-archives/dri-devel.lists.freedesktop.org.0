Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A78A412E3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 02:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8372210E123;
	Mon, 24 Feb 2025 01:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="QTYVaGFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950B10E121;
 Mon, 24 Feb 2025 01:56:36 +0000 (UTC)
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
 by mail.mainlining.org (Postfix) with ESMTPSA id A51DDBB83C;
 Mon, 24 Feb 2025 01:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1740362195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3WiKNi0MIshObrUkPnMHrbIdV3GvCNsZBMA8goXVDc=;
 b=QTYVaGFdXT/fa75dfqHX1JxHPKmXxL4yUxRdNntTKwsIZ+4nC3/8d+PfI4tsYp/t7YL8bG
 Rv/dxVgJgaxy5XNVrBG8j881iDqf27wahVou23AkxivqKgocWh8LBMPl1aezFELbscQu8O
 3rN3YVQpL1AUEZ5hENgBuP+rbAO6H1aLJmwknqxY6gtWnvMVxan28YF5/Lf0skpKEmYw5Q
 f1IlSKfyRYQaQmV8g+mE/R/nEoI5UdIz6u5FAe5EkGq8kKtsepVZSNAk9EZDzILDrtcj+C
 kUnCMQlT/8uhP2nT9kjPvlDadEJHhC7pOFdFHm4ukQTYqrAsBuc9cWCKV4csoA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Mon, 24 Feb 2025 02:56:20 +0100
Subject: [PATCH v3 5/8] dt-bindings: drm/msm/gpu: Document AON clock for
 A505/A506/A510
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-msm8937-v3-5-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740362181; l=1421;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JwsrQQ1h4foaqssnMVZ2dfrZxb+bgTSu50bLlQR5yv0=;
 b=RCsJKsH4OapMutoK9pfPNKYER6Zs5gC2KpQEgCTJ0KM+ZF/InlYisjN0cpVia3UtHoq242Hx+
 DlNg280xWXRCpRJImRGYC1zv5WEW4/Lo6EhHnog6UbdqkMVk5fx+yA+
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

From: Adam Skladowski <a39.skl@gmail.com>

Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
require Always-on branch clock to be enabled, describe it.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[reword commit, move alwayson on the first place]
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b04537ea270754a897b4e7eb269641..5028398cc3b517e404a92a2c30688f72eab4c1b3 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -152,11 +152,13 @@ allOf:
       properties:
         clocks:
           minItems: 2
-          maxItems: 7
+          maxItems: 8
 
         clock-names:
           items:
             anyOf:
+              - const: alwayson
+                description: GPU Always-On clock
               - const: core
                 description: GPU Core clock
               - const: iface
@@ -174,7 +176,7 @@ allOf:
               - const: rbcpr
                 description: GPU RB Core Power Reduction clock
           minItems: 2
-          maxItems: 7
+          maxItems: 8
 
       required:
         - clocks

-- 
2.48.1

