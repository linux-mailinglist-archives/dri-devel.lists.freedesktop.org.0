Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B89E14111E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA376F8BF;
	Fri, 17 Jan 2020 18:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C33D6F8BF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:50:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A6FBE20028;
 Fri, 17 Jan 2020 19:50:13 +0100 (CET)
Date: Fri, 17 Jan 2020 19:50:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 0/5] Add support for Pine64 PineTab
Message-ID: <20200117185012.GC14298@ravnborg.org>
References: <20200116033636.512461-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116033636.512461-1-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=E4uMMbyC_ska1DofYlAA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy

On Thu, Jan 16, 2020 at 11:36:31AM +0800, Icenowy Zheng wrote:
> This patchset tries to add support for the PineTab tablet from Pine64.
> 
> As it uses a specific MIPI-DSI panel, the support of the panel should be
> introduced first, with its DT binding.
> 
> Then a device tree is added. Compared to v1 of the patchset, the
> accelerometer support is temporarily removed because a DT binding is
> lacked (although a proper driver exists).
> 
> Icenowy Zheng (5):
>   dt-bindings: vendor-prefix: add Shenzhen Feixin Photoelectics Co., Ltd
>   dt-bindings: panel: add Feixin K101 IM2BA02 MIPI-DSI panel
>   drm/panel: Add Feixin K101 IM2BA02 panel
>   dt-bindings: arm: sunxi: add binding for PineTab tablet
>   arm64: dts: allwinner: a64: add support for PineTab

Thanks for the updates.
I have applied the first three patches to drm-misc-next.
The remaining two patches shall most likely go in via another tree.

	Sam

> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../display/panel/feixin,k101-im2ba02.yaml    |  55 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   6 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../boot/dts/allwinner/sun50i-a64-pinetab.dts | 460 +++++++++++++++
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-feixin-k101-im2ba02.c | 526 ++++++++++++++++++
>  9 files changed, 1065 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/feixin,k101-im2ba02.yaml
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
>  create mode 100644 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> 
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
