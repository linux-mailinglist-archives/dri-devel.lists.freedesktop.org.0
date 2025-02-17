Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A44A38671
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:33:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629AA10E266;
	Mon, 17 Feb 2025 14:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="X49o8xJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2648A10E266
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j4YfzZyj7vkcD3SCN4L4GGNfCjFE9FR8KFVGORtDRkQ=; b=X49o8xJyLo64xwkvS3Z0DwKYKI
 MUbiT1h0JiTIFhstAoG3Ep6byovmYPCT8L5LdMCvkdD81fEuLDXm+P2IF0/Dr3zcj2CoMAS5+j/rM
 m5jKvicEr40u8rmgJHkGr1QdNxfHDqTRb14csicnrpOQYMSujOidVAB1ynFHh7oZRiaZDW59JQlCn
 +vlGm/kcOpA+BH36UsB09DVEZA7hz5xc4fsUbdpXyje8yv/62IoUz96xcxpHiJbu/MJyR/fefFwhP
 7ljxtm+2Y3ESwyJSysFh/Wye3fks7ENaPmGahpS7qPRGN+f7claxKzF3MzVeHx6tWEFG9Gyh0lIL6
 KjuxCP/w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tk2Bq-0003zV-DR; Mon, 17 Feb 2025 15:33:42 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: cristian.ciocaltea@collabora.com, Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kernel@collabora.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Date: Mon, 17 Feb 2025 15:33:41 +0100
Message-ID: <5190979.MSiuQNM8U4@diego>
In-Reply-To: <20250217024437.35155-1-liujianfeng1994@gmail.com>
References: <20250215-vop2-hdmi1-disp-modes-v1-3-81962a7151d6@collabora.com>
 <20250217024437.35155-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Am Montag, 17. Februar 2025, 03:44:37 MEZ schrieb Jianfeng Liu:
> Hi Cristian,
> 
> On Sat, 15 Feb 2025 02:55:39 +0200, Cristian Ciocaltea wrote:
> >The HDMI1 PHY PLL clock source cannot be added directly to vop node in
> >rk3588-base.dtsi, along with the HDMI0 related one, because HDMI1 is an
> >optional feature and its PHY node belongs to a separate (extra) DT file.
> >
> >Therefore, add the HDMI1 PHY PLL clock source to VOP2 by overwriting its
> >clocks & clock-names properties in the extra DT file.
> 
> There are boards that only use hdmi1 such as ROCK 5 ITX. So there are two
> choices for this board:
> 
> 1, Enable hdptxphy0 as dependency of vop although it is not really used.
> 
> 2, Overwrite vop node at board dts to make it only use hdptxphy1 like:
> 
> &vop {
> 	clocks = <&cru ACLK_VOP>,
> 		 <&cru HCLK_VOP>,
> 		 <&cru DCLK_VOP0>,
> 		 <&cru DCLK_VOP1>,
> 		 <&cru DCLK_VOP2>,
> 		 <&cru DCLK_VOP3>,
> 		 <&cru PCLK_VOP_ROOT>,
> 		 <&hdptxphy1>;
> 	clock-names = "aclk",
> 		      "hclk",
> 		      "dclk_vp0",
> 		      "dclk_vp1",
> 		      "dclk_vp2",
> 		      "dclk_vp3",
> 		      "pclk_vop",
> 		      "pll_hdmiphy1";
> };
> 
> What do you think of these two method?

Going by the code in patch1 (+drm-misc) we have:
  vop2->pll_hdmiphy0 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy0");
+
  vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");

So the clock-reference to hdptxphy0 should just result in vop2->pll_hdmiphy0
being NULL and thus ignored further on?


