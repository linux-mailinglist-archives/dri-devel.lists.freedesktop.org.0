Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241028D29AA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 02:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0824A10E177;
	Wed, 29 May 2024 00:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SLi6d67P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642BD10E177
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 00:52:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28ECA9CA;
 Wed, 29 May 2024 02:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716943968;
 bh=1q+t0/VxxVLsjDI0GbCm3LqcOzQUbDeFhtPcR4Xj4hE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLi6d67PaQcDxO1ehYHD27ul03jDSkQfe+aeYaHbmw+zBrIbFAbDeraihzTh3VqUx
 BQgdc7XK1n2LXjwZ5XW0ipdDqf2A9llXm7kMLsUW9sHjx+zCJAptRjt56EdoBykfU4
 IQytp29wMllcifqLKAMkh2TLYfPeXR8NHnO3BbTc=
Date: Wed, 29 May 2024 03:52:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 8/8] fbdev: omapfb: use
 of_graph_get_remote_port()
Message-ID: <20240529005239.GH1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <877cfd4hkg.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877cfd4hkg.wl-kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:59PM +0000, Kuninori Morimoto wrote:
> We already have of_graph_get_remote_port(), Let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> index 14965a3fd05b7..4040e247e026e 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
>  	return reg;
>  }
>  
> -static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
> -{
> -	struct device_node *np;
> -
> -	np = of_graph_get_remote_endpoint(node);
> -	if (!np)
> -		return NULL;
> -
> -	np = of_get_next_parent(np);
> -
> -	return np;
> -}
> -
>  struct omap_dss_device *
>  omapdss_of_find_source_for_first_ep(struct device_node *node)
>  {
> @@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
>  	if (!ep)
>  		return ERR_PTR(-EINVAL);
>  
> -	src_port = omapdss_of_get_remote_port(ep);
> +	src_port = of_graph_get_remote_port(ep);
>  	if (!src_port) {
>  		of_node_put(ep);
>  		return ERR_PTR(-EINVAL);

-- 
Regards,

Laurent Pinchart
