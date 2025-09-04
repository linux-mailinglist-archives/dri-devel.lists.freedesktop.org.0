Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D349FB43415
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091D510E995;
	Thu,  4 Sep 2025 07:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="VQCh6Vix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F4410E995;
 Thu,  4 Sep 2025 07:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756971210; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=chm57lNvJ9riBqQbo0LKStfYeAL1ujNx1RZ+faJKURC2EDz6dVAkX0mXCT+g2GNotQ/FJCSDO4Oiv8rfYrQ1zNOVlwl6oUeM+xUJg9HryRRvtd3HjpV9N0svGgWIDiNW+qk2ALOb57skhobci2jXzZhnCzNzrJNqkTe6ucUZWUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756971210;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fCwqZzYjFLFE1aXsxQ6a7vK/RQ+fI8vudZin6LlNzRI=; 
 b=HqDTvMckkf/GLYlTyjCzQWYziLJjW6+slf1Ah/GdRIOHWQpjjGBCpGdo8DfO2FNkCB25i81be7tQju29hoFjyEIilOBmlZoA9B7c1R2QZFVg0RNcs4RvAHwSaVxz++Nr7hi8Kuo8MXirRlNk0X+uT2Ufs96d4hfAlCxTSbHusP8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971210; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fCwqZzYjFLFE1aXsxQ6a7vK/RQ+fI8vudZin6LlNzRI=;
 b=VQCh6Vixphv4lpAxB9jBHVDb+fd2IxbakryIb2MoVcRIvySAz51xU+xPhI7JZM99
 Lxy2/zYQGTgKOrUNmGpOKZbjHelaqaEGc8OPf/C0L68RYiZ62ue4r95PGn100+q4GJG
 bn38YlzuMKCy2n9WKHH7mOABx/rmvPC6YjdmME5UHLItSXa5MVch+a2ACzCTmJHQdyo
 7iPv7KattTZNujvZ38YdKMdP3+d4+fRRsc4FEAmMuX5+5QRcwgc0NWeJj/OLLiqGyAj
 AGczcdtAIZyO1wcxV908ns2M41kbGFBzkaw5ObhftFFgc2KLr7OISZwj01foQO3A6GU
 QjvELnvkxA==
Received: by mx.zohomail.com with SMTPS id 175697120750530.399496796533526;
 Thu, 4 Sep 2025 00:33:27 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 7/7] [NOT FOR UPSTREAM] riscv: dts: thead: enable GC620 G2D
 on TH1520
Date: Thu,  4 Sep 2025 15:31:51 +0800
Message-ID: <20250904073151.686227-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904073151.686227-1-uwu@icenowy.me>
References: <20250904073151.686227-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

The T-Head TH1520 SoC contains a GC620 2D graphics accelerator.

Enable it in the devicetree to allow using etnaviv driver with it.

This patch is currently very dirty because it relies on the bootloader
leaving the clocks enabled, and the core clock is a fake one.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 arch/riscv/boot/dts/thead/th1520.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 03f1d73190499..bc7dd7ee59dd5 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
 		#clock-cells = <0>;
 	};
 
+	gc620_cclk: clk-gc620-fake {
+		compatible = "fixed-clock";
+		clock-frequency = <264000000>;
+		clock-output-names = "gc620_cclk";
+		#clock-cells = <0>;
+	};
+
 	stmmac_axi_config: stmmac-axi-config {
 		snps,wr_osr_lmt = <15>;
 		snps,rd_osr_lmt = <15>;
@@ -495,6 +502,18 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		/* Vivante GC620, 2D only */
+		g2d: gpu@ffecc80000 {
+			compatible = "vivante,gc";
+			reg = <0xff 0xecc80000 0x0 0x40000>;
+			interrupt-parent = <&plic>;
+			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gc620_cclk>;
+			clock-names = "core";
+			status = "okay";
+		};
+
 		clk: clock-controller@ffef010000 {
 			compatible = "thead,th1520-clk-ap";
 			reg = <0xff 0xef010000 0x0 0x1000>;
-- 
2.51.0

