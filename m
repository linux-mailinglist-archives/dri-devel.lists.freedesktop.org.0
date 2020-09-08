Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6CC260A93
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 08:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299296E165;
	Tue,  8 Sep 2020 06:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C09E6E165
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 06:07:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA16C3B;
 Tue,  8 Sep 2020 08:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599545242;
 bh=rLcOKNFolAeqHFmi606DjXA9kF2Yb9XrI87axxyQmgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnXDB66pnPwI4gcASIS5HJbDfv3i4Pz30eckTT08bs0SDb0LRUcBj2ZiPth9Dk9qr
 hb9hcDmU2CspRj92QOmka3tgCIc5LCdc6BdZyu/d5lFbpAsuL2Wm4ERorkLUr5EPCu
 h4o+Dk3zUCNol3L0D+L0HgenCuH1O/Y2ZbWfhDI0=
Date: Tue, 8 Sep 2020 09:06:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: r8a77961-salvator-xs: add
 HDMI Sound support
Message-ID: <20200908060657.GU6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87a6y1rtun.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6y1rtun.wl-kuninori.morimoto.gx@renesas.com>
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Morimoto-san,

Thank you for the patch.

On Tue, Sep 08, 2020 at 09:35:25AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch enables HDMI Sound on R-Car M3-W+ Salvator-XS board.
> 
> This reverts commit b997613fad58a03588f0f64a3d86db6c5bd76dd2.

Which tree can this commit be found in ?

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../boot/dts/renesas/r8a77961-salvator-xs.dts | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> index ca21a702db54..1e7603365106 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
> @@ -51,9 +51,38 @@ rcar_dw_hdmi0_out: endpoint {
>  				remote-endpoint = <&hdmi0_con>;
>  			};
>  		};
> +		port@2 {
> +			reg = <2>;
> +			dw_hdmi0_snd_in: endpoint {
> +				remote-endpoint = <&rsnd_endpoint1>;
> +			};
> +		};
>  	};
>  };
>  
>  &hdmi0_con {
>  	remote-endpoint = <&rcar_dw_hdmi0_out>;
>  };
> +
> +&rcar_sound {
> +	ports {
> +		/* rsnd_port0 is on salvator-common */
> +		rsnd_port1: port@1 {
> +			reg = <1>;
> +			rsnd_endpoint1: endpoint {
> +				remote-endpoint = <&dw_hdmi0_snd_in>;
> +
> +				dai-format = "i2s";
> +				bitclock-master = <&rsnd_endpoint1>;
> +				frame-master = <&rsnd_endpoint1>;
> +
> +				playback = <&ssi2>;
> +			};
> +		};
> +	};
> +};
> +
> +&sound_card {
> +	dais = <&rsnd_port0	/* ak4613 */
> +		&rsnd_port1>;	/* HDMI0  */
> +};

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
