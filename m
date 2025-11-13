Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB1C594B2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 18:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A0710E10A;
	Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sqBgScq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF9010E1DF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C4834468B;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ED12C113D0;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763056663;
 bh=RCFsjUix1XQ76jxISlR0S+cS2leVOmgzdskYmMSCvic=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=sqBgScq29bnowgvQ38/PLeX6P2J3e7wicY1LCMI5OXYjPFa3I7X6z3xugLkXLvz+S
 rYXWhFd3dV+Dn8EqfyE50RWl/1S9RoSXs7nuGHOaHaSgzlYcJJeObU4BCOainSy9yR
 6lv09kIeQT3ERrmr4Q4RTwVy5NtsckfqvVzi3hWcTJewfFAu2IyzHsooSpXi9KkLtv
 aCXnDr1oLvQNU35WiZ0reV/XaS6zdrAlD/UTuq0K5l6YjEbwylPSVwYM9KuVQ1lXub
 M8WgZFHOVAK5mO7hh7TJu6MMdwxzYxVYm652bfFjhV4VMkM/ZsRzBQWLIQ5VqW048B
 dMSGXtvm+ngPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3271FCD8CAF;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:36 +0100
Subject: [PATCH v2 02/12] arch: arm64: qcom: sdm845-enchilada: Specify
 panel name within the compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-2-e175053061ec@ixit.cz>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
In-Reply-To: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XdEJMzUlqHmVFvRkb119Ya6neFS+DHA5Y7GV7B5h8w4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwUx5fxhZW3ru/k/CW3PaGg7zjqBNcd1dxuy
 WwS+gVUg/6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 ciOeD/94fR70j8mcyMtewNc7kRaVyQ+Uf9kvO5pfU7PAvyoGj6eaIMNgCZmw5d3CuDkjm1LlqRN
 KANBySbzAKuH3t+0rayZBiMjWPV72E2PuqMRYKk1/JnD6W9+GGaX0boMH+WbgdQjOTIxfgwMAcT
 VNXfgmsksZcsX+UM4XJXXFb3HHvd8r0gR7U1Fvz+gzT7fDlAE790cSJOnQ2YC4xHNQbqLSED1te
 5aac+sYU2kkbfbLJ3IsTGqRuxhltvmzE8daMEkekpyBqnFJnvc1FWTdjz/mg7c8aPGOyYyyMv3N
 4D7HDbVEuZ1b8m3De/F9WT/p9LO2Tx7k2YmTQZZ8QvIO+mu0QydnW6BsWxoJpIXb2cUOvD2r442
 T1KeNz2tJaTIN2e5jDeJ9ci8OVIStlFtY2m0HY3N4Tir/zZsu9NNxamFO9OHjjVu25EdZU/HWEw
 f6fE81aL2NV7HJ/8hAuAzqacp5NXMij3PwWUk2RnzBVixtSsiux181tt4R0HTZhVozMLeX7165/
 3IYWscFVeLGMY3QOoDCm9YzGfUE1K03YcJMCOyQZAe29mVkIw8HkhMa/GdbEQW/V5vCfwaRqCAe
 6ZmfmZgsuUzmWaAS6k8qrrEJh0PszMU1CL19KmfjgmpaPbUR3V/h5ORHylvpOXki0dZqD5zKYvO
 IyDko+cwq5UXTvQ==
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

sofef00 is name of the DDIC, it doesn't contain name of the panel used.
The DDIC is also paired with other panels, so make clear which panel is
used.

New device-tree will work with old driver as expected, due to secondary
compatible.

cosmetic: sort the node.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index a259eb9d45ae0..8aead6dc25e00 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -31,9 +31,9 @@ battery: battery {
 };
 
 &display_panel {
-	status = "okay";
+	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";
 
-	compatible = "samsung,sofef00";
+	status = "okay";
 };
 
 &bq27441_fg {

-- 
2.51.0


