Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D274340F7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 23:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B026E03A;
	Tue, 19 Oct 2021 21:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7B26E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 21:59:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o24so7262668wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCZAM1vvyZIsuTswhisB5UCt6gNS7FCdaVGaaFS3YV4=;
 b=N9x2DcoC3Zq7l+EXYxzzDvYTGb6e0oKBL/owgOeCIM34js4lC6qA/TCA1k1opUXEUK
 iJyLxAfyGd/1irS6OFaK6/VaWbkuhUSrXcg5VejFWZOTCNEheBAERgim9vZebgpODSTB
 0zfpE8VREGwYumyR5wQB7OI+ZVttjvlGw4zUdGt1trfhORiUkTkmFI/a6PYbJB9TlFRb
 I4/WknNvC/do0cuW/idOQdbadmwvcobJTrlHbgf+cZmrX4RxL7vwtJjMvYku0e8WGnjY
 iS38SlU6UOMwxnLaCRBqu8RVDT19yUl9mcbSU9vrJpfbI91HZeeKpD3RKOsshqR4E+dm
 lwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCZAM1vvyZIsuTswhisB5UCt6gNS7FCdaVGaaFS3YV4=;
 b=yAL0agpcBmcAyqrbko+AVK8uzkxLHOSkPfArOyi9FbCXrGLLg1kTCtt9NgwZBQUEa9
 LxOJ2AdExREBbRwpgsn1meGtZvASWLB0bGSLpBFH4vkWx7jOldPHKzfRpy48Rrvem7Dl
 Tgn+jej6HWz6/7+z5ELX8R3Ubr2IxF6AOJSp5RDTKUr0trFpFgZMP9SEtwMjLH6hMGZC
 5WXXD9U5yCeoCRFveu/PJauexMlg6roCvy0sy2LpxpdlnfRAiO39ZMM0/brAIpJJ17Hj
 3HUJOYbDyDg791S8JII6Z9v6FVPKXfO+Aj84xXh3TGP91KkYkoPWglPBHyHOt4L8QN1r
 ckYw==
X-Gm-Message-State: AOAM532SMEJr8MUy7CHYGivPUcVRrrO+ogyxHlKap5/C6KLJS4IOH4rt
 YXwPPJDWl6Uq9rGkp7F+OME=
X-Google-Smtp-Source: ABdhPJxx3QAL6lyP35xXPqTB47LPyaFAa19cRinJBEnDBpBQBMv+2xmSW5ECPRIbVOY9Eer57KphDw==
X-Received: by 2002:adf:a413:: with SMTP id d19mr48203915wra.246.1634680739774; 
 Tue, 19 Oct 2021 14:58:59 -0700 (PDT)
Received: from apple.sigmaris.info (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id s3sm178540wrm.40.2021.10.19.14.58.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 14:58:59 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
 Hugh Cole-Baker <sigmaris@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: enable gamma control on RK3399
Date: Tue, 19 Oct 2021 22:58:43 +0100
Message-Id: <20211019215843.42718-4-sigmaris@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211019215843.42718-1-sigmaris@gmail.com>
References: <20211019215843.42718-1-sigmaris@gmail.com>
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

Define the memory region on RK3399 VOPs containing the gamma LUT at
base+0x2000.

Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
---

Changes from v1: no changes in this patch

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

