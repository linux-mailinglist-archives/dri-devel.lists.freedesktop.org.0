Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47144165F3F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 14:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8B26ED92;
	Thu, 20 Feb 2020 13:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FE06ED92
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:54:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B11C0E7C;
 Thu, 20 Feb 2020 14:54:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582206864;
 bh=F8M+8/bvGBDpaLEWtPUpT7cWpYWV2PjhtbCfde8TQkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aAV/sQ1S2bRXdyxMQKd7Xhnopq2eBnDtfKKEtJdIOi36sLNMAE3Fhwu39bR3mmUk4
 BjhuJMhjgWLnFvquPxL3LUjnwhoYBRBt0RmNWwuzmOE1Q3B7Wd+ppXh/4r0CF8FocO
 l/nmTzyX4UGYsatpFc+I7ihQLnsgctPexKiNdl6c=
Date: Thu, 20 Feb 2020 15:54:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: display: simple: Add NewEast
 Optoelectronics WJFH116008A compatible
Message-ID: <20200220135406.GD4998@pendragon.ideasonboard.com>
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-5-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220083508.792071-5-anarsoul@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 12:35:06AM -0800, Vasily Khoruzhick wrote:
> This commit adds compatible for NewEast Optoelectronics WJFH116008A panel
> to panel-simple binding
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 8fe60ee2531c..721de94cc80a 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -43,6 +43,8 @@ properties:
>        - satoz,sat050at40h12r2
>          # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
>        - sharp,ls020b1dd01d
> +        # NewEast Optoelectronics CO., LTD WJFH116008A eDP TFT LCD panel
> +      - neweast,wjfh116008a

Please keep the entries alphabetically sorted. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>    backlight: true
>    enable-gpios: true

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
