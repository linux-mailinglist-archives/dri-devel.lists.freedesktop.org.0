Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2508B01DA9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0D10EA5C;
	Fri, 11 Jul 2025 13:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSujT4Iu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFE810E252
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 03:58:54 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32b7123edb9so18614351fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 20:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752206333; x=1752811133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
 b=PSujT4IuJxVaMpxG920EPvaEp5zcX1QL/QjdifCxq899gRFGyBJQS5pioi8b5QbM8S
 dZ4UT2OGby+L5RLNvI/S5ofq2SrTPOQojN1ExWmP8DoUCo7l44CxnljwdR5R3fHD4k/f
 M4k3HdpHFXWO8owAvYRHkk/fWf3cbYZEI+wTS9v9wADCve1No8/Zxfmk66cMC8GpFj9y
 v8t3GApXDgIYSidD3f4FTLMXgJ69VIKInR1GGASZDWeMpzZiw2371ng9RR1GGQvLiONB
 GiTFzMbWPonL9rNHC4goYPNx4EhKZ5TGFQ4d/9g+Ah/Cc2aNT7E0vrdd7cJVFC8JmcTp
 2A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752206333; x=1752811133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
 b=p4Cb1Ww1oomW8MFSH96fqenxLQrPNTQPeTZFV11E0MuGnqy2VvPfOKwfY5dBZpmeMk
 c5PoRaSxQ1yNi89punCGGGJTESRyrUPuwPfFJDa2Z/DLTDMg/KCgQdy/dsqZN/w5eOAl
 NTLswVQ6/g1G9+5Bp7bcUk1unZT1eH/NfjjTdhk7YRYeiT3XKEa8c6TNzgEIq+1OmI0H
 iU/Rcd7QUnMcZoQ69kxSOMVtQxKGmpCN+/Itd7EoPV45b/UogA+8rH1xuhH/qOHyKJ/c
 f1tBIjeKXi1t0kkBOzwvfkJ4zdZi52pbDJVc7lFkN0RTU6TtTgvD6PMbY8/ScXXNNB/u
 tsJQ==
X-Gm-Message-State: AOJu0YyJX4oK95VCiSba/IhNpgiy7xEp5rFshUZVCj9cqJgBd9bEdFP0
 x/myB+T3PaHi+GNl8MyMiikqMiEjqzfKqN24EPvZ+l68w2HnGSzHC5W9
X-Gm-Gg: ASbGncvHHtPHfy5WzKTnjzNDgomer+o4NAtnls4BvdgDHS9V3PeeC+do+pHjTtrFldf
 p1+J4JktrqeTW/oVBL4n0MOk/R18Oy8bJRVIbOKyB3AI1+3gezri+2O0VrK/s+KaBuEjTsrfU+M
 u6oriixpDKoBGLRnc8y8YRH9ltjE9d4JbIMU86AQStpb3BVOKuixjEk0O5v80uO2yGhqwKxGtgE
 3BrMo3/gV9T6ArtUXCsuBdORQhR8V+AUUWaoDqqNDXY69cPyuckvqFjZYy6zoneUk2TGPsqVa96
 uqTLpW1ypZaPEVKnRfMJ4i97DCqfTt1SM4Ldmrml0OCFdJGgW57pDFpkkaya3sErHBjilwXdKJL
 FHMo8+luY7mc=
X-Google-Smtp-Source: AGHT+IGkeSBXm/EW3UWMspIGCG+IQIIuepjGaDlwWyIf9NR5Xr+PDLCyR3s4y1gsKiBc5fqAWrIf5A==
X-Received: by 2002:a2e:be0e:0:b0:32a:8297:54e3 with SMTP id
 38308e7fff4ca-33053293f75mr4620471fa.6.1752206332869; 
 Thu, 10 Jul 2025 20:58:52 -0700 (PDT)
Received: from junAIR ([212.192.12.80]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 20:58:52 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add Mali GPU node
Date: Fri, 11 Jul 2025 11:57:28 +0800
Message-ID: <20250711035730.17507-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Jul 2025 13:35:21 +0000
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
to the Mali Valhall (v9) family. There is a power domain specifically
for this GPU that needs to be enabled to utilize it.

To enable in a specific device, we need to enable the gpu node and specify
the “mali-supply” regulator additionally in the device tree.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index dd6fa22f9..d3528d498 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -108,6 +108,21 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		gpu: gpu@1800000 {
+			compatible = "allwinner,sun55i-a523-mali",
+				     "arm,mali-valhall-jm";
+			reg = <0x1800000 0x10000>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
+			clock-names = "core", "bus";
+			power-domains = <&pck600 PD_GPU>;
+			resets = <&ccu RST_BUS_GPU>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-- 
2.50.0

