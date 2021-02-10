Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4463164B9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 12:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E266EC5A;
	Wed, 10 Feb 2021 11:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750E6EC5A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 11:11:32 +0000 (UTC)
Received: from [95.90.166.74] (helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l9nP8-0003gY-PH; Wed, 10 Feb 2021 12:11:30 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/6] Support second Image Signal Processor on rk3399
Date: Wed, 10 Feb 2021 12:11:29 +0100
Message-ID: <110045238.nniJfEyVGO@diego>
In-Reply-To: <20210210111020.2476369-1-heiko@sntech.de>
References: <20210210111020.2476369-1-heiko@sntech.de>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, sebastian.fricke@posteo.net, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 10. Februar 2021, 12:10:14 CET schrieb Heiko Stuebner:
> The rk3399 has two ISPs and right now only the first one is usable.
> The second ISP is connected to the TXRX dphy on the soc.
> 
> The phy of ISP1 is only accessible through the DSI controller's
> io-memory, so this series adds support for simply using the dsi
> controller is a phy if needed.
> 
> That solution is needed at least on rk3399 and rk3288 but no-one
> has looked at camera support on rk3288 at all, so right now
> only implement the rk3399 specifics.
> 
> changes in v2:
> - enable grf-clock also for init callback
>   to not break if for example hdmi is connected on boot
>   and disabled the grf clock during its probe
> - add Sebastian's Tested-by
> - add Rob's Ack for the phy-cells property
> 
> Heiko Stuebner (6):
>   drm/rockchip: dsi: add own additional pclk handling
>   dt-bindings: display: rockchip-dsi: add optional #phy-cells property
>   drm/rockchip: dsi: add ability to work as a phy instead of full dsi
>   arm64: dts: rockchip: add #phy-cells to mipi-dsi1
>   arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
>   arm64: dts: rockchip: add isp1 node on rk3399

of course everything was meant to be v2 in the subject.


Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
