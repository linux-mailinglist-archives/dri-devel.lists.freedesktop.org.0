Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1EFB9E3AB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 11:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5038B10E8A2;
	Thu, 25 Sep 2025 09:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pvg8NFO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A614410E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:12:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0A0BF44F66;
 Thu, 25 Sep 2025 09:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7D4CC2BC9E;
 Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758791571;
 bh=PAuAU86bHBUoEapGclmmQ1vuyJEHrcJaVMKNCQ9N/zg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Pvg8NFO0pgIhAOAC7MC8oaZUYJT9FiwKDFaE1ioD6RO0JNkvfY6P05CkE6//oiQOh
 +K0fLF35rjAuJaj3Cw6K3+DG2QI2rEU3Ma3/4QsC2r5X8QrU05oNvjRug+hZSQf+Km
 IZ7BekiG1ULFHI5nxp/zt2BWa1Yey3YLolG9Zikr8lwsE7gD+KA7e0Lg7il0tJwzCY
 Ee9aSP8/Im0ddYdfnvI0kx/mpEAazMO4a7Gul8GNRNKAuXp1v49wkpFsAdBfDsQYPv
 91NEgF9yPtuzZQivNA4U883f/S34WPl2cba3Dy8P3QGPnBMaot5cmF53c9uZrLwhCR
 briZipACFPujQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CCA28CAC5A5;
 Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 25 Sep 2025 11:12:52 +0200
Subject: [PATCH 6/8] arm64: dts: qcom: sdm845-oneplus: Document TE gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9T4Q0ww4g2eijV97RS6Xs4lqrXb5AowCRGsAQv1muHM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo1QeRSud1jtDCR8KN+IdAYvFVcE+/8OksxpI87
 BpwBz+AfBuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNUHkQAKCRBgAj/E00kg
 cs5jEACfdMDrsJqio/HPDoeB9WaYG1RnfD2Oqf+42dbVvOHvpJgzwx4laMFz0CzI+/5IpH5HM9M
 vtn+7FDc8Eu5SBDSK/OrscrKv5N3g7IOe9AM8CzEjm8rtyhvZIzUGURaL6nuzIybo+GagiL+ImI
 b51Hj/uQIRMetYEx4DJxqAcNfpOIUdTRZbqfrHUGHCUpg4/KZ1fbkpqINYPFOO/5mWE8KOf2MeE
 De3mNtbNyqnR3rcbbxNIv1Ong2HLOyPLyFpXPKDVOf0sMjEYdB4lsx+qpKfE8gCegL7LyMKlUru
 esSSzM/oKxoC4HhA0NgCSibMY9co625wt8QCsIZHzmymjO/tb/QqePCf4YVlQWQRWyJmUVUG4/2
 uXPc7sm6OBTYu3VJXou9OYqOrD/ZnyXmRO8W44CarhZQHksbZdmN/yvW/Aq2Il76csAHjFitl4Q
 yZ6Nvtauyo6deCqXJ/6M71ZnF2CvNc853itXFqd/L69mbdCnDTvk0zQd6Ip2py/RtB71+ClYHvl
 bgX22G5DaN14KflSQQwA26Vj4IZiCkY5/Yn6hXKkjiSs9C/ou7adT3QEeRaup1cT3rOVjp+hei3
 271bCZCqOy+smfOJWQvlC3Dq8GO3UbQIrOZ0zzviJOkNimnJVrq3yXKlQvMytDawnHMDrqnQMa2
 bBxYmecIjJ6uwng==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Document panel Tearing Effect (TE) GPIO line.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 7f968f90a83b869395bedd5de510ba96de3c4e94..857702919084778e93da7c49afcfa6a0489d709e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -456,6 +456,7 @@ display_panel: panel@0 {
 		vci-supply = <&panel_vci_3v3>;
 		poc-supply = <&panel_vddi_poc_1p8>;
 
+		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";

-- 
2.51.0


