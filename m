Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D92B3D2E5
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 14:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6A210E106;
	Sun, 31 Aug 2025 12:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="YZUZWrvF";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jpVy4kkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C5110E106;
 Sun, 31 Aug 2025 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756643375; bh=wgWRM7BQ2S1MdE+x3zCI91i
 GEv2041rAFiG5+GHHb0g=; b=YZUZWrvFO8h8xTRF7rCIWFSSiJeyFzroHeQmEtY0cVVELBjzn+
 2Mb78UeKC3HH05rump6PLJ4ZdGR8FZ625P+KkSdyYTUtBeKo3tjHTUhr31l56kVVcxkwbTpI0Px
 QfgcvQyNs53gyEwmwhWn17+Hq3YRZPMsTx8/oNT2A/pcwPFjbN/i5UjIJpjuX0aObA72tz3oppl
 XVIHwsQr23OawlyTX7Jib98W4Rm2KkwcsLwW1jnI5tZMK12SVl6To+7rTZQCc+ssN4lPHpooZH6
 BDIWzm7i+HY7euT8NEK1Q2030CVwZR6qRC5yX9Id6H5dhpriZQ/pn/exUWY0544kASg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756643375; bh=wgWRM7BQ2S1MdE+x3zCI91i
 GEv2041rAFiG5+GHHb0g=; b=jpVy4kkM3hye1WvwxCQSsdMd1+hFCzYUNmqgsZ8M5ahHfv2R0m
 bNNbra7FPdHzO9RquWSKRuduEn9WB/N3u4Cg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 14:29:26 +0200
Subject: [PATCH v8 3/7] dt-bindings: firmware: qcom,scm: Add MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-msm8937-v8-3-b7dcd63caaac@mainlining.org>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
In-Reply-To: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756643366; l=1371;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=PqGAymhItUAgrgLZjol3iWiJiDIeiqJdNfuxcC9G7II=;
 b=icUF8qZT338mue8tXjQf6slJOUElsNDHI/eMCObmeOE38Do4iEb8qUs6DP3NlV1T691XnIetW
 /GK/rG5JZ4pDYQXC6CqC187I3KcpAGurNu98W+HRtv9ikoosd0hCE6E
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

Add compatible for MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index b913192219e40324c03f4ff1dce955881e7fb3d2..ef97faac7e47c1483f9758d2bb2a13f9c3664177 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,scm-msm8226
           - qcom,scm-msm8660
           - qcom,scm-msm8916
+          - qcom,scm-msm8937
           - qcom,scm-msm8953
           - qcom,scm-msm8960
           - qcom,scm-msm8974
@@ -134,6 +135,7 @@ allOf:
               - qcom,scm-msm8226
               - qcom,scm-msm8660
               - qcom,scm-msm8916
+              - qcom,scm-msm8937
               - qcom,scm-msm8953
               - qcom,scm-msm8960
               - qcom,scm-msm8974
@@ -177,6 +179,7 @@ allOf:
               - qcom,scm-mdm9607
               - qcom,scm-msm8226
               - qcom,scm-msm8916
+              - qcom,scm-msm8937
               - qcom,scm-msm8953
               - qcom,scm-msm8974
               - qcom,scm-msm8976

-- 
2.51.0
