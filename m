Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF785CD959A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 13:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E76710E216;
	Tue, 23 Dec 2025 12:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NbcY4pX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6683210E216
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 12:48:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E67E443A9;
 Tue, 23 Dec 2025 12:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8E4C113D0;
 Tue, 23 Dec 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766494082;
 bh=B3xjfPRKFS0qoDeFoIRFLfaayzMur0aXjaMmej6M+fY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NbcY4pX7UDRBAH4ABtafnWNjBiGs15KK27AUjeMprV6VHlaJScb+kc0gkP4pq9L64
 BnExPDBzCuUh4NNdaojK6q9d+2HvCjUKfhxmXNUCdPkP+/KI3dSk0KfB9ZpP4+xQPI
 6+aBqjJh5BBnRhixRWoVMjer4IH+31iJXIta72hIW+FGgJdn/97wLG3cumHLXPvLtt
 nzugW7B58tBFoaO4W8iCsxOCpo8GKnunDulQoMUCuzjDlg+EdQgbHieFvJ4zT4VGPo
 FXcaVYmCJjWYzWcw4/vJbqqNiRYs3ZWm6gohw3+3z49F7IwWLQKvxpKRSCSsVDuRAg
 oi9eh0bpFPHnQ==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Andrew Davis <afd@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Randolph Sapp <rs@ti.com>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 4/4] arm64: dts: ti: sa67: set the GPU clock to 800MHz
Date: Tue, 23 Dec 2025 13:47:16 +0100
Message-ID: <20251223124729.2482877-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223124729.2482877-1-mwalle@kernel.org>
References: <20251223124729.2482877-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The board is running with a core voltage of 0.85V and therefore we can
clock the GPU at 800MHz.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index 7169d934adac..0c7f3e10a150 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -292,6 +292,12 @@ &cpsw_port1 {
 	status = "okay";
 };
 
+&gpu {
+	/* The VCORE is 0.85V, thus we can use a faster GPU clock. */
+	assigned-clocks = <&k3_clks 237 3>;
+	assigned-clock-rates = <800000000>;
+};
+
 &main_gpio0 {
 	gpio-line-names =
 		"", "", "", "", "", "", "", "SOC_SDIO_PWR_EN", "VSD_SEL",
-- 
2.47.3

