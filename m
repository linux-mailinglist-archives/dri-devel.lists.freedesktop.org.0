Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD8430B0C
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDEF6E804;
	Sun, 17 Oct 2021 17:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60F36E42E
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 10:19:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so5004140wmd.5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 03:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PD0s3T2MF4tv5g6N8cuPkBbaR24IP6h58wcesesEz1I=;
 b=bdHNHDe6KhfZGIHBJ0K8gpOwmvEokrAKTCe4AcVR0+y1JvewOW5A0DcWD4Zw1D8xMh
 6/R3/6onxPPUQoyaZZxZjKY61WywyM+vXZ+fxPUCGkY0GGUNZS7SZU4j7qe4kucn32DB
 h4zbJdyYeDeLvXnlZuwrJvAo+n0fef6yMSDP/vkvsSdBWwnCgJbvHFEipKqDNM21KV4Z
 pxI+mXnjDsB1M/6fM1135u/n5e25MN2lWmxvqXtN0XUaMHCmFX9VJ7fSoEc47eD0or3d
 G3Qss7kgZSWFr/VfjACOIOqymvLGH2efhFVg1HBJbrp/qTsoXMDzg0vLR7b3I8NXAyFs
 1WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PD0s3T2MF4tv5g6N8cuPkBbaR24IP6h58wcesesEz1I=;
 b=rYMe/msSA3EsmcBFxfr0BTqgT9tlRPSk3lUxgZS1VKeJDy+SyCtOGMHnfYt4Ec6bVm
 CoxWnGv60N6a6hdm/HDwpTMY8nqvHyNkmasIW2JVjdv+0of/Lny6699sn1/vNf+5OAGG
 N/56ePlcYMOoh/RG9Sa89wjmnJAdp4brLJGmzcoIqNHGIl9dfFihBMVkMtVlBVxuI327
 +a3Ym8n0DIH7dsQIfq6ZUShevPbdsB6QLcehbpG+/siCVb+n6A/eDCwArQt4VBZ3+G2k
 HIqbL+83pbpd01ri7zMjh3OStBZKQjRjnf7Cuz1D2GGT7kz7s8pIcCjaXAqguPEGL3Ec
 vl4w==
X-Gm-Message-State: AOAM532spQqn2mLCA2CzMTPn0tbb4fIiH05T9Nqz8lhlTtP/3qAniPI5
 MWSOVQN/P3Af8S6jONJ5oxQ=
X-Google-Smtp-Source: ABdhPJw+GVvUgKi17WEmCspLSun09rZRATLc7ZBCNj7KRvi1bwBcl+AnoSzFHhdV6UMZ3G6W2ePP1Q==
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr32809108wmf.61.1634379574312; 
 Sat, 16 Oct 2021 03:19:34 -0700 (PDT)
Received: from apple.sigmaris.info (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id k13sm2920926wrp.86.2021.10.16.03.19.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 16 Oct 2021 03:19:33 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Hugh Cole-Baker <sigmaris@gmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: enable gamma control on RK3399
Date: Sat, 16 Oct 2021 11:18:52 +0100
Message-Id: <a66b1e07390d002ca39f06f5cded8f34a564c0c0.1634378097.git.sigmaris@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1634378097.git.sigmaris@gmail.com>
References: <cover.1634378097.git.sigmaris@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 17 Oct 2021 17:06:15 +0000
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

Define the memory region on RK3399 VOPs containing the gamma LUT at
base+0x2000.

Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 3871c7fd83b0..9cbf6ccdd256 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1619,7 +1619,7 @@ i2s2: i2s@ff8a0000 {
 
 	vopl: vop@ff8f0000 {
 		compatible = "rockchip,rk3399-vop-lit";
-		reg = <0x0 0xff8f0000 0x0 0x3efc>;
+		reg = <0x0 0xff8f0000 0x0 0x2000>, <0x0 0xff8f2000 0x0 0x400>;
 		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
 		assigned-clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
 		assigned-clock-rates = <400000000>, <100000000>;
@@ -1676,7 +1676,7 @@ vopl_mmu: iommu@ff8f3f00 {
 
 	vopb: vop@ff900000 {
 		compatible = "rockchip,rk3399-vop-big";
-		reg = <0x0 0xff900000 0x0 0x3efc>;
+		reg = <0x0 0xff900000 0x0 0x2000>, <0x0 0xff902000 0x0 0x1000>;
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
 		assigned-clocks = <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
 		assigned-clock-rates = <400000000>, <100000000>;
-- 
2.24.3 (Apple Git-128)

