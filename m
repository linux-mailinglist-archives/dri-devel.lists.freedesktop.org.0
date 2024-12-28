Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE79FDBDA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 19:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999D010E081;
	Sat, 28 Dec 2024 18:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="knDEfBmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2778910E081
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nBlPYUAfJE99prwgl1RwOc9LFZC3mnK2dVfyXf1Y5l4=; b=knDEfBmAo4iqovMBoT4w5yHZbU
 Ky08vorJm64O2z1rIvDky0lTMU+8TyVZfWsV2wO2ilqE8D/hOB7GWHxVRYuwNGhN2AGV3/79qXDko
 sFicTp/rDSp99YzjmdLtfe/T7k7/7HHgdAZ6JOGqxNYSpnkrlItRJE9oaXb8Ii0fcHoNAhqPkWLji
 g/fynF3ShxX2b3S0pbJn7W33TnqqN6yqVDCqrDvZEgIDyKliPFCmF10c+pxgkhSSF6oUs3bTO4ZP1
 Qns3DUv7+tyhT2EUuLQGA0v2JTSh00BqXkineWPlBfncxZIQ3g0NMOZZlVhzNdyOB5rVqz3GUikyn
 oOfuSUtQ==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tRbfx-000866-Po; Sat, 28 Dec 2024 19:36:37 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: krzk+dt@kernel.org, joro@8bytes.org, Andy Yan <andyshrk@163.com>
Cc: cl@rock-chips.com, robh@kernel.org, hjc@rock-chips.com, vkoul@kernel.org, 
 devicetree@vger.kernel.org, detlev.casanova@collabora.com,
 cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 0/8] Add display subsystem dt node on rk3576
Date: Sat, 28 Dec 2024 19:36:36 +0100
Message-ID: <4950097.GXAFRqVoOG@diego>
In-Reply-To: <20241228122155.646957-1-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Andy,

Am Samstag, 28. Dezember 2024, 13:21:43 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> As the VOP[0] and HDMI[1] driver have already been submitted for review.
> This series send all display related device tree part together.
> [0] https://lore.kernel.org/linux-rockchip/20241219073931.3997788-1-andyshrk@163.com/T/#t
> [1] https://lore.kernel.org/linux-rockchip/20241225103741.364597-1-andyshrk@163.com/T/#t

not to confuse you too much, I mainly meant that we were missing the
"arm64: dts: rockchip:" patches from this series.

The dt-binding patches are (already) part of the driver changes and
should stay part of those series, to prevent confusion of what part goes
where :-) .


Heiko


> Changes in v2:
> - Wrap commit message according to Linux coding style
> - Make "rockchip,rk3588-hdptx-phy" const for "rockchip,rk3576-hdptx-phy"
> - Make declare phy/ropll/lcpll reset line are not exit on rk3576
> - describe constraint SOC by SOC for vop2 binding, as interrupts of rk3576
>   is very different from others
> - Drop Krzysztof's Reviewed-by for vopp2 bindings, as this version changed a lot.
> 
> Changes in v1:
> - ordered by soc name
> - Add description for newly added interrupt
> 
> Andy Yan (8):
>   dt-bindings: soc: rockchip: add rk3576 hdptxphy grf syscon
>   dt-bindings: phy: Add rk3576 hdptx phy
>   dt-bindings: display: rockchip: Add rk3576 hdmi controller
>   dt-bindings: iommu: rockchip: Add Rockchip RK3576
>   dt-bindings: display: vop2: Add rk3576 support
>   arm64: dts: rockchip: Add vop for rk3576
>   arm64: dts: rockchip: Add hdmi for rk3576
>   arm64: dts: rockchip: Enable hdmi display on sige5
> 
>  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   1 +
>  .../display/rockchip/rockchip-vop2.yaml       |  70 ++++++++--
>  .../bindings/iommu/rockchip,iommu.yaml        |   1 +
>  .../phy/rockchip,rk3588-hdptx-phy.yaml        |  62 ++++++---
>  .../devicetree/bindings/soc/rockchip/grf.yaml |   1 +
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  47 +++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 126 ++++++++++++++++++
>  7 files changed, 276 insertions(+), 32 deletions(-)
> 
> 




