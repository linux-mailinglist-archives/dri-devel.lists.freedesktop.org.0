Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED4748AC5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 19:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2B410E3A0;
	Wed,  5 Jul 2023 17:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD6910E185
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=uX1KxxDBhiVzU9ji2kzcp/Y9e3VFw+X4GIkq8uU2bbU=;
 b=F5wP4GaD2OeQcLZCchJTXLTRkr0vmE7y7CKsxYuClzsRDNJ+3yyY7cEprDx7f/FhtN8Z33tJsusRX
 mVakIqrhR1bEcfPpxboAERlKmb+NSF0ARG+NFKBxjvALdajSBXT1WlcaT2vGeq2CGlSonASxqHZrnm
 KzmQw1g6dN3QSzKHYudGwh1LIgVmJ53dQAWtGDDyQ1QcEVCZQkOm0Rdy+bUVn7PRVrW4xQpGWCVwlQ
 YSoWRXNNvAjnYgnE5qYBRcB+piSPngd0oBGvijCU4i+UpH4eHsZY2EmcnHVtW9aSOYM2PU6hqFBJG+
 9JIGfzE8uVI7USi5+cVtXYGUdCffx8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=uX1KxxDBhiVzU9ji2kzcp/Y9e3VFw+X4GIkq8uU2bbU=;
 b=Do9skGeypNLVI7zeveYEQqKi0JsTReyLIbwKr68clQyyQMJ3aNfdzB7vvRM2FtMtLRQ9Oo10dibXO
 VHe/CPDAQ==
X-HalOne-ID: f076bdb9-1b5a-11ee-97e5-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id f076bdb9-1b5a-11ee-97e5-592bb1efe9dc;
 Wed, 05 Jul 2023 17:39:50 +0000 (UTC)
Date: Wed, 5 Jul 2023 19:39:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
Message-ID: <20230705173949.GA106478@ravnborg.org>
References: <20230703214715.623447-1-paul@crapouillou.net>
 <20230703214715.623447-3-paul@crapouillou.net>
 <194ac047-b20e-04c1-1d96-67cc483bb4a1@linaro.org>
 <8e81dd5d9f62139e740ea123aa2087cb1bbcb04b.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e81dd5d9f62139e740ea123aa2087cb1bbcb04b.camel@crapouillou.net>
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
Cc: neil.armstrong@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Wed, Jul 05, 2023 at 04:38:05PM +0200, Paul Cercueil wrote:
> Hi Neil,
> 
> Le mercredi 05 juillet 2023 à 15:57 +0200, Neil Armstrong a écrit :
> > On 03/07/2023 23:47, Paul Cercueil wrote:
> > > Register a backlight device to be able to switch between all the
> > > gamma
> > > levels.
> > > 
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > ---
> > >   drivers/gpu/drm/panel/panel-samsung-ld9040.c | 40
> > > ++++++++++++++++++++
> > >   1 file changed, 40 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > > b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > > index 7fd9444b42c5..b4f87d6244cb 100644
> > > --- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > > +++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> > > @@ -8,6 +8,7 @@
> > >    * Andrzej Hajda <a.hajda@samsung.com>
> > >   */
> > >   
> > > +#include <linux/backlight.h>
> > >   #include <linux/delay.h>
> > >   #include <linux/gpio/consumer.h>
> > >   #include <linux/module.h>
> > > @@ -311,8 +312,40 @@ static int ld9040_parse_dt(struct ld9040 *ctx)
> > >         return 0;
> > >   }
> > >   
> > > +static int ld9040_bl_update_status(struct backlight_device *dev)
> > > +{
> > > +       struct ld9040 *ctx = dev_get_drvdata(&dev->dev);
> > > +
> > > +       ctx->brightness = dev->props.brightness;
Use backlight_get_brightness(dev);

> > > +       ld9040_brightness_set(ctx);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int ld9040_bl_get_intensity(struct backlight_device *dev)
> > > +{
> > > +       if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
> > > +                       dev->props.power == FB_BLANK_UNBLANK)
> > > +               return dev->props.brightness;
> > > +
> > > +       return 0;
> > > +}
> > 
> > You can totally drop the _get_brightness.
> 
> The current behaviour is to return 0 when the framebuffer is blanked. A
> few drivers do that so I thought it was the norm; and the backlight
> core doesn't do that by default (and just uses dev->props.brightness).
> 
> It is not clear to me if that's the preferred behaviour. The
> "backlight_get_brightness" function in backlight.h seems to suggest
> that the current behaviour is correct, unless it is not supposed to be
> used in the backlight_ops.get_brightness() callback. Then in that case
> some other drivers get it wrong too.
Several drivers get it wrong.
You are supposed to provide get_brightness only when you read back a
value from the HW, which is not the case here so just drop it is the
right choice.

	Sam
