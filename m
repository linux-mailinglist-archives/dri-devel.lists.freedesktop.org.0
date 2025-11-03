Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089A3C2B7BB
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9329C10E3BB;
	Mon,  3 Nov 2025 11:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lvvCyU7S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C902D10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8508B4360F;
 Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 662F8C19425;
 Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762170352;
 bh=qQ/WEdPqrvPC/4CXxlAU3VuHJH/rNzhNQl/2gT3uV84=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=lvvCyU7SM7EKBul3nJp7Deor7z2Bx22WieV641fIS17vlXXonJZWoQdXig65FMvAR
 sQbwiuTPchNWEkVV/JucRnosj6Hyzc6I6V8ED/8ASule/DM0mq5BPs+2N/QxHjUecB
 OsBkqQlp95OszjTjkBwN5RuKpvWLCriTHn7dMjoprDdMVcJNQRPZBzz0FXyeHz1TPL
 gMaNFwNClx1cL/pt8lE4lLMec6Rxt7eYQYLGw9Dis4dr1AYy3lBh7P7iA+7SO/M8u7
 swdoccsvQ8WQ51gVQXG+mZ0oA19TB6+q5H3QKfm9uQHMhk4ZjfRa7R0t2YqbKkKP69
 0jScmG0ISHBkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5E883CCFA05;
 Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 03 Nov 2025 12:45:53 +0100
Subject: [PATCH v6 4/4] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-s6e3fc2x01-v6-4-d4eb4abaefa4@ixit.cz>
References: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
In-Reply-To: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=QDFx8txawxUA4NQVuvt5zOeKxx/QkLilb2g7UEm0IH0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCJXuEzEiUcskISWH6ZZ4EhzYICTEATVcbv9Mu
 m1e+qHI4xaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQiV7gAKCRBgAj/E00kg
 cj0jD/98YZnd6jOSxFHP/wV2DBx01s/B68H3a8riT2SeM/CG3+1MqkXzjIGumzwIjI296JN0D3n
 X4Dfxl+JTY5JOglHv59/9YqbNfiQyyzxAqfK9n+jfWFi0mv9GRpfgHqSKoQ0TTUiMUPZtntDyc1
 L+BobYGnNTM00oY5RhMo/y5eAJP6/glAlGonw7M8ligK2FWrRfJWEM9HDYVBYyLjWHTt7eymBSO
 nBW5dVrZgc0Bj6JdqkF5oqF4IWzDVQ9STD5Bq0krpQSSJPC8RdMm+fK8TFKA/QAIfQGDFr3Waf/
 uogDcwdMkR6lQ36LhW9puguJOHyLwdaawhf/LjegKxKCMW2SZ2Jd+aynqYPcjVabSxhpcubCtBE
 sAkFhWZ1TlwH77pOORx+416iMXWnT7CCU+La+CUPOWqV2FKalp+0nzgDsiHCXR1wSe+wNaEPYbW
 GLomUrkg961mJgDp6SZc1dxyBAcz9LBL45Hk/+GOv40yzGHX4+8Y/47iSi12/l0oC7ROh/d0Vrm
 rSQj+QfXjEL0nAmZ0YJKBe/Ngq9q6F4Lfz4mRGb1yp6ybCAWNyM4PKE2pOLIsvqsWEBVXe8yE/g
 OJ84f+AyQIIgmlH+ywGj2P+gKN/G3nUF4lr5ja8mK1/fqcJpvqYCz7G25N2dUMrudSFQaMfK7ck
 QGyY/BofAZDIBUQ==
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

Describe panel Tearing Effect (TE) GPIO line.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index f00dbc0fff3d4..db6dd04c51bb5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -447,6 +447,7 @@ display_panel: panel@0 {
 		vci-supply = <&panel_vci_3v3>;
 		poc-supply = <&panel_vddi_poc_1p8>;
 
+		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-0 = <&panel_default>;

-- 
2.51.0


