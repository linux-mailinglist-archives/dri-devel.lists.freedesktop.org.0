Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD521BFF1
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CD36ED2E;
	Fri, 10 Jul 2020 22:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1A16ED2E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:35:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8D052C0;
 Sat, 11 Jul 2020 00:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420517;
 bh=VOPUfQeIdM/nJoqfrieb80+nAqp1j8F1QLlpRH4+T80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uRfydTmPbr+WjAyHAkv0/nw2kU0T1dMBR36XdaeIyO+uTiOKrBa4TpQYwSu5lT1kh
 Bdefg8+A7xEpDwEmxw74vCoQQacGlYOsXLzcJfFuEGD1ggEevnt0H8KFRBZyL9tczp
 jaQX9wf1tqknqrp0GzJSIz3J54m0DxVK+mNcii2A=
Date: Sat, 11 Jul 2020 01:35:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 14/21] drm/bridge: megachips: get drm_device from bridge
Message-ID: <20200710223510.GR5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-15-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:10PM +0200, Sam Ravnborg wrote:
> Fix so drm_device is read from the bridge.
> This is a preparation for the connector being optional.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 258e0525cdcc..cf1dfbc88acf 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -226,8 +226,8 @@ static irqreturn_t ge_b850v3_lvds_irq_handler(int irq, void *dev_id)
>  				  STDP4028_DPTX_IRQ_STS_REG,
>  				  STDP4028_DPTX_IRQ_CLEAR);
>  
> -	if (ge_b850v3_lvds_ptr->connector.dev)
> -		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->connector.dev);
> +	if (ge_b850v3_lvds_ptr->bridge.dev)
> +		drm_kms_helper_hotplug_event(ge_b850v3_lvds_ptr->bridge.dev);
>  
>  	return IRQ_HANDLED;
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
