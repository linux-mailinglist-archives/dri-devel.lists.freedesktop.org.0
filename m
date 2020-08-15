Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F5F245119
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 16:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BC46E373;
	Sat, 15 Aug 2020 14:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504866E373
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 14:53:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B462F20021;
 Sat, 15 Aug 2020 16:53:30 +0200 (CEST)
Date: Sat, 15 Aug 2020 16:53:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 0/4] Add support for Feixin K101-IM2BYL02 panel
Message-ID: <20200815145329.GA1201814@ravnborg.org>
References: <20200719170411.275812-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719170411.275812-1-icenowy@aosc.io>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=8R4CpP16fAPwfkrXZjwA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Icenowy

On Mon, Jul 20, 2020 at 01:04:06AM +0800, Icenowy Zheng wrote:
> The controller chip of Feixin K101-IM2BA02 is going to be discontinued,
> so Feixin start to provide K101-IM2BYL02 panel as a replacement, which
> utilizes Ilitek ILI9881C controller.
> 
> Add support for K101-IM2BYL02 panel.
> 
> By the way, is there a way that can try both kind of panels in the same
> kernel/DTB combo? K101-IM2BYL02 has the same pinout with K101-IM2BA02,
> and PineTab schedule to switch to it w/o modifying the mainboard.
> 
> Icenowy Zheng (4):
>   drm/panel: ilitek-ili9881c: prepare for adding support for extra
>     panels
>   dt-bindings: ili9881c: add compatible string for Feixin K101-IM2BYL02
>   drm/panel: ilitek-ili9881c: add support for Feixin K101-IM2BYL02 panel
Thanks, applied the above patches to drm-misc-next.

	Sam

>   [DO NOT MERGE] arm64: allwinner: dts: a64: enable K101-IM2BYL02 panel
>     for PineTab
> 
>  .../display/panel/ilitek,ili9881c.yaml        |   1 +
>  .../boot/dts/allwinner/sun50i-a64-pinetab.dts |  10 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 273 ++++++++++++++++--
>  3 files changed, 265 insertions(+), 19 deletions(-)
> 
> -- 
> 2.27.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
