Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25142986F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 22:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DA4895EE;
	Mon, 11 Oct 2021 20:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDD0895EE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 20:53:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E30C1FD3;
 Mon, 11 Oct 2021 22:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1633985591;
 bh=nCb8Pc9naD2hvMjfW8POZXXVTuH3lwEik2nOAUzxErs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UlB6Wf+qefW7KJvFUnr+gFvcPuYsv2t1/hswzV3aznYW3IaGpfFroFBRohPEWX+8q
 7lnIl8l1T2w+XgdS7KZrga9ft08+VJCMp2YvePTWFNM9gjkN8y/VsExqEZwC8Njp6V
 2eGC1/0eR4ZP76xdLjn2WbSSb1VClAzGJEG0DWVU=
Date: Mon, 11 Oct 2021 23:52:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Ondrej Jirman <megous@megous.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/5] drm: mxsfb: Print failed bus format in hex
Message-ID: <YWSkKSBnqTMGq/s7@pendragon.ideasonboard.com>
References: <cover.1633959458.git.agx@sigxcpu.org>
 <c84b34855abbb85cd25bbb5126db302f88327640.1633959458.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c84b34855abbb85cd25bbb5126db302f88327640.1633959458.git.agx@sigxcpu.org>
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

Hi Guido,

Thank you for the patch.

On Mon, Oct 11, 2021 at 03:41:26PM +0200, Guido Günther wrote:
> media-bus-formats.h has them in hexadecimal as well so matching with
> that file saves one conversion when debugging.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index af6c620adf6e..d6abd2077114 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -89,7 +89,7 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
>  		ctrl |= CTRL_BUS_WIDTH_24;
>  		break;
>  	default:
> -		dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
> +		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);

I may have gone for 0x%04x as current media bus formats all hold in 16
bits, but it's not big deal.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		break;
>  	}
>  

-- 
Regards,

Laurent Pinchart
