Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3732B58D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 08:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DC789E06;
	Wed,  3 Mar 2021 07:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5AD89E59
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 07:40:19 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9366ED;
 Wed,  3 Mar 2021 08:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614757217;
 bh=66EoJnJQTBk9s3G5RxIxlLMB8d54u78Ylq/9v3jzsA0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jXp2QWM9uopUOhK9SUVHJ0yfhEJuyl81/bx1yicqkCPjwDJrytPDEvbk2BoEQ57Rf
 sXBZE8Ebn0y/92f6Tg+fFHRcluRvhZ1zKGzewa6r5Vg4h8SgBTyS6Jx9X8Vd3pYgVp
 v3t8LRh1SOJqA/LEp6VK/BzwwUwkbVbz4289blgk=
Subject: Re: [PATCHv2 4/6] dt-bindings: display: ti: ti, omap5-dss.txt: add cec
 clock
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <b835ae4f-f23b-e378-9992-6f0511f12550@ideasonboard.com>
Date: Wed, 3 Mar 2021 09:40:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2021 18:24, Hans Verkuil wrote:
> The cec clock is required as well in order to support HDMI CEC,
> document this.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
> index 20861218649f..c321c67472f0 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
> +++ b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
> @@ -89,8 +89,8 @@ Required properties:
>   - interrupts: the HDMI interrupt line
>   - ti,hwmods: "dss_hdmi"
>   - vdda-supply: vdda power supply
> -- clocks: handles to fclk and pll clock
> -- clock-names: "fck", "sys_clk"
> +- clocks: handles to fclk, pll and cec clock
> +- clock-names: "fck", "sys_clk", "cec"
>   
>   Optional nodes:
>   - Video port for HDMI output
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
