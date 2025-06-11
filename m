Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6080AD5546
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAF410E644;
	Wed, 11 Jun 2025 12:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Yat2uFwF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDBA10E64C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:18:47 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 6FB426002407;
 Wed, 11 Jun 2025 13:18:46 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id IuhmtmC9y_TL; Wed, 11 Jun 2025 13:18:44 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id AC43C600231F;
 Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749644323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=caItnQseM7jUl17RpSfQgqCHqKWQly3zbEi1LRHqMW4=;
 b=Yat2uFwFKvlaArNh4sVjczx9sBZGJuLdKnENicEF3md36TlvmJSOdsQ6BYY+6aujHdgQu6
 XEpG05llRmeBp6Cnm7Cb+uI+7krxj62Zj1eAm6DPL3SC2f5F/eaUEITtDNyrDonyhmu2Rg
 2vIk1dHA1+Vhdb1mM9u4N4I/drVnGZ0=
Received: from [192.168.1.151] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 882FA360092;
 Wed, 11 Jun 2025 13:18:43 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 13:18:03 +0100
Subject: [PATCH v2 3/3] arm64: tegra: Add NVJPG node for Tegra210 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-diogo-nvjpg-v2-3-01f8c76ea90f@tecnico.ulisboa.pt>
References: <20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt>
In-Reply-To: <20250611-diogo-nvjpg-v2-0-01f8c76ea90f@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749644321; l=1266;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=JVD0QnQ3fH6fknvuzPpR26nJeyTlDpQGPKgijvosEWY=;
 b=nX1+bm2O8YN9G2bPlhqaKJN7WJlbDxhqI+A3r6pj8PonDW1cYhgcGV8hxb8ZyLZ/ckII2/Qzf
 yFVjtmE80V2DH0WI8Whjbj+eGNUlAaKyV0ViQYvDkXj0KyqrDVumHkG
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
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

The Tegra X1 chip contains a NVJPG accelerator capable of
encoding/decoding JPEG files in hardware. Complete its DT node
and enable it.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

---
v1->v2:
- Collect R-b from Mikko
- Explicitly mention Tegra210 in commit subject
- Be more precise in commit message about filling in an already existing
  DT node.
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 6f8cdf012f0f12a16716e9d479c46b330bbb7dda..087f38256fd40f57c4685e907f9682eb49ee31db 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -253,7 +253,13 @@ vic@54340000 {
 		nvjpg@54380000 {
 			compatible = "nvidia,tegra210-nvjpg";
 			reg = <0x0 0x54380000 0x0 0x00040000>;
-			status = "disabled";
+			clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
+			clock-names = "nvjpg";
+			resets = <&tegra_car 195>;
+			reset-names = "nvjpg";
+
+			iommus = <&mc TEGRA_SWGROUP_NVJPG>;
+			power-domains = <&pd_nvjpg>;
 		};
 
 		dsib: dsi@54400000 {

-- 
2.49.0

