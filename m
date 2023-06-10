Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADCF72AE89
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 22:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6637710E073;
	Sat, 10 Jun 2023 20:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981EF10E073
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 20:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=iH+26ZNMWYQSWoD8Ag9dkbysaqy0tgMTIlgGE6/lJts=;
 b=FCpAJeCwiYBnq13yYREebtgDyeOsQcKBTroiJ27ACcXzG4kPfwthfl74bAEavyZ7iaFUWMBXfk/sX
 IwqACbVijaYO6eUl4qvq2YQhgVnR/5+gY1RkUBUQpfrmhX/DDlAcFAuwJ9QjA4vKHS7mGdzbDQCbf5
 nf72zDimuYwFm2vESECcMqzpM3ME+XX48ak4ly0Fi0DFiMa0aXLRMHMJZZwW4FZHLomWySTUYaeLfT
 9l3EUW2VxC5uZgbTzij/PoTM4Aj6YL9G7gMFITzwnKOdzDHWUoteR0L6JwpgfX7otql6wwadAOF8h5
 45sbHOHkCGc7f2GZ6W90qzS6SxA3DKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=iH+26ZNMWYQSWoD8Ag9dkbysaqy0tgMTIlgGE6/lJts=;
 b=EMlgJ90xUhI7PaLCQB6Wwzg6J6Gf4AeFXn1FuaJADN9hFNsbHufCsihOawktIduSv0zBwm7L0hy7y
 QTtfs1LAw==
X-HalOne-ID: 1ca7a7de-07ca-11ee-b3a9-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 1ca7a7de-07ca-11ee-b3a9-99461c6a3fe8;
 Sat, 10 Jun 2023 20:05:16 +0000 (UTC)
Date: Sat, 10 Jun 2023 22:05:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230610200515.GA1041001@ravnborg.org>
References: <20230609144843.851327-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609144843.851327-1-miquel.raynal@bootlin.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 04:48:43PM +0200, Miquel Raynal wrote:
> On the SoC host controller, the pixel clock can be:
> * standard: data is launched on the rising edge
> * inverted: data is launched on the falling edge
> 
> Some panels may need the inverted option to be used so let's support
> this DRM flag.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Hi Miquel,

the patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I hope someone else can pick it up and apply it to drm-misc as
my drm-misc setup is hopelessly outdated atm.

	Sam


> ---
> 
> Hello, this change was tested on a Sama5d36 based custom board with a
> panel not behaving correctly if the pixel clock was not inverted.
> Cheers, Miquèl
> 
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 58184cd6ab0b..cc5cf4c2faf7 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -68,7 +68,11 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
>  	struct regmap *regmap = crtc->dc->hlcdc->regmap;
>  	struct drm_display_mode *adj = &c->state->adjusted_mode;
> +	struct drm_encoder *encoder = NULL, *en_iter;
> +	struct drm_connector *connector = NULL;
>  	struct atmel_hlcdc_crtc_state *state;
> +	struct drm_device *ddev = c->dev;
> +	struct drm_connector_list_iter iter;
>  	unsigned long mode_rate;
>  	struct videomode vm;
>  	unsigned long prate;
> @@ -76,6 +80,23 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  	unsigned int cfg = 0;
>  	int div, ret;
>  
> +	/* get encoder from crtc */
> +	drm_for_each_encoder(en_iter, ddev) {
> +		if (en_iter->crtc == c) {
> +			encoder = en_iter;
> +			break;
> +		}
> +	}
> +
> +	if (encoder) {
> +		/* Get the connector from encoder */
> +		drm_connector_list_iter_begin(ddev, &iter);
> +		drm_for_each_connector_iter(connector, &iter)
> +			if (connector->encoder == encoder)
> +				break;
> +		drm_connector_list_iter_end(&iter);
> +	}
> +
>  	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
>  	if (ret)
>  		return;
> @@ -134,6 +155,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  
>  	cfg |= ATMEL_HLCDC_CLKDIV(div);
>  
> +	if (connector &&
> +	    connector->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		cfg |= ATMEL_HLCDC_CLKPOL;
> +
>  	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(0), mask, cfg);
>  
>  	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
> -- 
> 2.34.1
