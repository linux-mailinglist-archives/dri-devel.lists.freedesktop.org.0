Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F69BE481E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C41010E0C7;
	Thu, 16 Oct 2025 16:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b0BZpY+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF4F10EA39
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B6244589A;
 Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35AE7C4CEF1;
 Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760631420;
 bh=v+q+jUnQBuk3tLdWUct2g8Ando3+sIKtmiW+8PGGVHA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=b0BZpY+dFpEKtkRKJPo+9UqtMKGlnawQ8kQpXBvWRCQJDioLlGbXKoCPD91z8DzWZ
 kxDWa3MUjInytgJIUfr1k1rBEKueULwggGLQyJHmTyUkCwrjm1evHvm2yAGP19OnLj
 ZDCXkmLUvULJ2ns41HDwbaT+lS8gbOvnEsrAM8GFprTnckBUwWtR9/OCi7lJJPRWWz
 X6bFtaZ4MH2F7FmGUHo8MoDq5W3geSmGMKz9B/ob9D1aCbm5aGcyIqOCeY1+PVDzZB
 TKYVxMUTwafwT1ikOrawHH0/zpvU/BFv6iLxNNirxGPVxe6Y/ejojb306nGEqiHeXD
 6/2BtsVSwUFcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 286ABCCD199;
 Thu, 16 Oct 2025 16:17:00 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 16 Oct 2025 18:17:02 +0200
Subject: [PATCH v3 7/8] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-s6e3fc2x01-v3-7-ce0f3566b903@ixit.cz>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
In-Reply-To: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
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
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+89dIAb307+D766iUEdy+zPCpNwpfjUMxJzd8fVjBoI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo8Rp5q2dOvtsknUbjUNwSHcaNLRNWN+FecCpIt
 o82OFlYPC6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPEaeQAKCRBgAj/E00kg
 cn/QEACGgswW/P0zslsiphemBB0c6BW1Vy6E1tvxtQnoJBav+EVs0JadpTeE5PetRiOUEvqsGQb
 HghwyTCcVqgp2O0jwICNjHvQQ8gySMY1VCsC1YAwPZceB6HZ82KTb5dOayiANi1gFXUyxVNR7SZ
 phzAPO+o6jOhbcdIKIGWF5Erblk7sMQ3BjFRRpAW7PxbybKql4YIlX9nJ5F/bI7w5E0Kz/Dcg47
 Y0A/fdj4ZwuV7zHK+NvxhFTa0EbgL0SlqGnhl5iWtXXG6GXImmaka7lnzoSanZsKHcFy7L09UzM
 mBSwyjLAsPv2p4ablgaiub2nUEZOk8rjMCPp8Or6WDEcs7Q6kvVqTcbmZ2Iuser7jASNfMvvEc5
 PZG0M3x6TFVaUTnNX+nUnOCpn7n6DTCR1HWdrmBoEgY7hUvk0kpMio4W5PRqHK15n1cIdejWWwE
 iYBcrjthD8LE2M6e440JXw8gI3b8q8dDxfqcoCNm1dh/oAj7qVbdXtbmOQCmgKp4ccGf/HsJz8M
 vpBuH618ZRW1R3Ve72J2Y7dM4V8fXT8EMXUdrIe7YZLw4NVRNBDOw0aLLhsG5w4sDbKZlDf7uF8
 3C9PNCo9itZYeZQrys8fb0gfoTGVqN1n4qppakNwO9496U7KpoJH0n5VzslMPVKUqHWTdolyvxP
 UekX+jkJNo//+Sw==
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index a8e87507d667b..b663345de0214 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -460,6 +460,7 @@ display_panel: panel@0 {
 		vci-supply = <&panel_vci_3v3>;
 		poc-supply = <&panel_vddi_poc_1p8>;
 
+		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		pinctrl-0 = <&panel_default>;

-- 
2.51.0


