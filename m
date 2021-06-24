Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3A3B35DE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8406EC78;
	Thu, 24 Jun 2021 18:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FA46EC78
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:37:28 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lwUEB-000109-9v; Thu, 24 Jun 2021 20:37:27 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 02/12] arm64: dts: rockchip: Add panel orientation to
 Odroid Go Advance
Date: Thu, 24 Jun 2021 20:37:26 +0200
Message-ID: <3249046.u6TykanW85@diego>
In-Reply-To: <20210624182612.177969-3-ezequiel@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-3-ezequiel@collabora.com>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Ezequiel Garcia <ezequiel@collabora.com>,
 Alex Bee <knaerzche@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 24. Juni 2021, 20:26:02 CEST schrieb Ezequiel Garcia:
> The Odroid Go Advance panel is rotated, so let's reflect this
> in the device tree.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

similar patch already applied for 5.14:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts?id=edb39de5d731f147c7b08c4a5eb246ae1dbdd947

> ---
>  arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> index 49c97f76df77..cca19660e60a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> @@ -240,6 +240,7 @@ panel@0 {
>  		iovcc-supply = <&vcc_lcd>;
>  		reset-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_LOW>;
>  		vdd-supply = <&vcc_lcd>;
> +		rotation = <270>;
>  
>  		port {
>  			mipi_in_panel: endpoint {
> 




