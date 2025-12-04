Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B5CA3422
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 11:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5E610E8D8;
	Thu,  4 Dec 2025 10:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q9XxsW4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCF910E8D8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 10:41:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 38D77601B0;
 Thu,  4 Dec 2025 10:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D062DC4CEFB;
 Thu,  4 Dec 2025 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764844892;
 bh=8y4xGFFun6h+N78w3IWAvbtXt554lZWi6EwAe2EaVbg=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=Q9XxsW4KokpEpwbgZeZSAWCHd/pTa56r4gvELLNNJgdEpGmZ19PHZLILI2+8IUFmX
 rQ334rIydcf4PzLtWjc0AZqYoZHbQLOdEHNxnleNDkrTCkWBL1Pb4e1uzJ5uW3Kzx0
 rbc87wnZAUKBA15Yb9gwNYu8Bup8KtbqEQ8YhhZ8tpSBLTWYb1KLAC2igoWFkDe/Hx
 zLJ8AOsGcz8/T8n7cmPDESZd/5Ol0E2n0zF23DLKLpL9DPw1jCtvoWEHq85cfDfHPv
 5u4gqZ43FbYhMe/aG7LM7hR9jkfEbvDJaElhQkclPsjHl6BzyPOoB9OUFm4M58Hskh
 t8FHBlK9gSxfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BDBADD1CDA6;
 Thu,  4 Dec 2025 10:41:32 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 04 Dec 2025 11:41:24 +0100
Subject: [PATCH v4] arm64: qcom: sdm845-oneplus-enchilada: Specify panel
 name within the compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAFNlMWkC/3XNzQ6CMBAE4FchPVvThf6gJ9/DeICy1U2MaAsEJ
 by7BQ9gjMeZ5JsZWEBPGNg+GZjHjgLVtxjkJmH2UtzOyKmKmaUiVQBC8lA7dEJwj2VL14oLaZ3
 VqHM0wKK6e3TUz4vH0yd7fLRxuFnKC4Wm9s/5tYOp/X/QARe8ctYVYLAEow/UU7O1LzYtdelKQ
 /ar06gRjBIqExrQfutsrXe/Oota20opaQBziYsex/EN6JY/bT0BAAA=
X-Change-ID: 20251104-sofef00-rebuild-04cfc6e68e71
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
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gj0lInF8ociikTF3j/Wy5V0sdCoAD93LYDKcUIGln5I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMWVb9zK5trkln88z1jaFj44tBGnJQgnvtzvJK
 caiHY++boWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTFlWwAKCRBgAj/E00kg
 crfLD/9TX7X7yRxP/Wum7g46+lTMZ0chXFYuXJ0IPcbteaRDkRkUf1twwxaHIY8TQGlSwgk96BB
 pOIH6PYnw1mfd7ooLpsW6/6iwKkDeOqKSRizGH60JnJ9tBIs8ek5chquIvwpZVY+6M+CWCmYewI
 Pj0BcvNX3uU6p9oltQ8sCnccFRAjKk6taUOEko8Jvdux5lTlR84yYHh+zxN4eS9c58mVkNnNwpD
 f3Xhtxk6bVAnkddIsBvpqES5pxYodSzw+bpsko3qPOXyRvd0PAX25N2VZdEb+SaymqefL/1JaPb
 Kd5JiggOvnJfbQFYcQVkNo4XXMSqaSzp2TvVoym7eH+9gjH/YbXNFVtxLaZ8mtLq7y0/yPWRon7
 BhgRuLrdOZDBPobPp/dtvCIV7IqxmPcNbkv6dJ7c5M06UQ0U/ZrGsqS9z6zA+clkxCVUetkVQY/
 F/2Ki9aComJLw1a5V2uke4Ws0LzRGmHDm/HrFTCRdOocww5Ihrx1BoHO+IrhZJe7ViGdA1QX5ye
 RxGBrD9qUsnImDzeDKtYt7PjNNTHKJ5GlCZCEQ0+VVCCErKqsbnkBiP5gQEhlrPflj8SHjWHkuD
 E4BvBCr0uGectZq4ZbY9MX20isfmh/J6TASxpF7odzGZiPrw2sb58PWWBVjd97v3+vdBkTnSZZO
 ngekh7S334pjW7A==
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
(SDC variant). With proper support, all downstream patches in
sdm845-mainline and sdm670-mainline can be dropped.

The mainline driver was broken so far, and with my recent introduction
of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
common device-tree changes which defined all the regulators and
corrected properties.

At this moment the first version of the patchset will not include
Pixel 3a XL (SDC) as no testers yet volunteered.

The code, including the Pixel 3a XL enhancement can be found at
  https://gitlab.com/sdm845/sdm845-next/-/commits/b4%252Fsofef00-rebuild
---
Changes in v4:
- adjust commit msg s/enchilada/enchilada-oneplus/
- no code changes, just resend as all other commits got reviewed and merged in -next.
- Link to v3: https://lore.kernel.org/r/20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz

Changes in v3:
- Drop arch prefix from the commit. (Bjorn)
- Added Casey into MAINTAINERS file. (Casey)
- Moved compatible legacy comment inline.
- Link to v2: https://lore.kernel.org/r/20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz

Changes in v2:
- General fixes to device-tree binding (Krzysztof)
- Add myself as a maintainer
- Updated commits wording
- Link to v1: https://lore.kernel.org/r/20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz
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

---
base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
change-id: 20251104-sofef00-rebuild-04cfc6e68e71

Best regards,
-- 
David Heidelberg <david@ixit.cz>


