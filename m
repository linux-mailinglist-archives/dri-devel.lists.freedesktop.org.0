Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2643386F5F0
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 16:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D287610F533;
	Sun,  3 Mar 2024 15:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lYtziz4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D810F533
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 15:44:15 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1dc13fb0133so27257335ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 07:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709480654; x=1710085454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eS5rXsUD0/yP0O/b336cGPihzWh42DmpRxXHDyRlWmk=;
 b=lYtziz4RYbM+U5t0dgBTjctiIgm12jVW9/2Ej0D0rPO9S9nXnVM6NidXcn79fynukP
 vYeRB8nG1nHTjOnYbSQeJwEBWiTvejy+VCF4kVqaD8Ak1QYKYl1WYGAt3vfY0eJQknja
 hrPZpaIY9gCwsbnvZZJ2Y8XfUMGcglNsFhc+k2ZRBTsf1KbwlI7VH/ZifX/Cp77zZmHw
 X81O+S1I3GW3XbcV3y+asDvCFE9SeNFJxQViABnaqXnaBq7kzO31WhqhCtzg3iggkZW/
 0W/iiBu0rm8LHS0ZeJI4B4utrw0J+eyoInw20zWMigtBIfto3iMl5YQbrDMY7SEwjMAi
 bfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709480654; x=1710085454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eS5rXsUD0/yP0O/b336cGPihzWh42DmpRxXHDyRlWmk=;
 b=i50x76w4TaqZ2GrWq4K9IcQyR8Te3KtsKJZfcP77HFZokhzj1uaaJZcwgB1C2PTUNC
 yLA9oSeY7PG0JPPAqp4zzjZW/ahhuwA61z8eK5Nr0FZQ5pRxfxSfMA7MWWlguM91Pi6T
 xnTzridPiSr9Q4PFPtAPtFVg4i2aQbZcwV3XhgC9r+Ne7MXFzmli4jJzYmiHdG+WqXqS
 naf6tKwVO191ugYrftsGJtPrNpXnAXtKPq3PEIZ4prpnRsKEN55fc48MN+vil9QNOi7b
 WgCw8GVqOm19gsqKMXp1/U8iOHzboMwZAvu1Zzrv4wNYxomUV/Ap1Mtg1OuWTLQp11jW
 n6qA==
X-Gm-Message-State: AOJu0YzqkUSo8U9L8eSHVn5mfBasPSgWIlVa1pk9/zPn7HJ2l+v+Fa42
 Jn2s0SItwgJBPMd/aMF3ZWm3AOyk5/1ka0cJ9mb0D3UW+GQ65NiX70zevhC7YmkyAct6PMXbcJJ
 YQh/g4aMYWqcGvstpJER0IxRig6g=
X-Google-Smtp-Source: AGHT+IGS6ew4nXt5BAU7Sc1tW8kxz61GMLFbWf8a7QA3VlraCLCBHo9R/O9Y4HzIfJGI2oHtZRtm2+wi4R98LC4v56A=
X-Received: by 2002:a17:902:db0e:b0:1dc:524:6da4 with SMTP id
 m14-20020a170902db0e00b001dc05246da4mr6348460plx.8.1709480654469; Sun, 03 Mar
 2024 07:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20240228113737.43434-1-aford173@gmail.com>
 <20240228163153.GH9863@pendragon.ideasonboard.com>
In-Reply-To: <20240228163153.GH9863@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 3 Mar 2024 09:44:03 -0600
Message-ID: <CAHCN7xLGL5gMhd7Fo907gPScdD15KW==BHSorQMjbd-=k-E9OA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 aford@beaconembedded.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 28, 2024 at 10:31=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> Thank you for the patch.
>
> On Wed, Feb 28, 2024 at 05:37:35AM -0600, Adam Ford wrote:
> > The IRQ registration currently assumes that the GPIO is
> > dedicated to it, but that may not necessarily be the case.
> > If the board has another device sharing the IRQ, it won't be
> > registered and the hot-plug detect fails.  This is easily
> > fixed by add the IRQF_SHARED flag.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index b5518ff97165..21f08b2ae265 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -1318,7 +1318,8 @@ static int adv7511_probe(struct i2c_client *i2c)
> >
> >               ret =3D devm_request_threaded_irq(dev, i2c->irq, NULL,
> >                                               adv7511_irq_handler,
> > -                                             IRQF_ONESHOT, dev_name(de=
v),
> > +                                             IRQF_ONESHOT | IRQF_SHARE=
D,
> > +                                             dev_name(dev),
>
> This looks fine, but the IRQ handler doesn't.

Thanks for the review.

>
> static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
> {
>         unsigned int irq0, irq1;
>         int ret;
>
>         ret =3D regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
>         if (ret < 0)
>                 return ret;
>
>         ret =3D regmap_read(adv7511->regmap, ADV7511_REG_INT(1), &irq1);
>         if (ret < 0)
>                 return ret;

If I did a check here and returned if there was no IRQ to handle,
would that be sufficient?

--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -477,6 +477,11 @@ static int adv7511_irq_process(struct adv7511
*adv7511, bool process_hpd)
        if (ret < 0)
                return ret;

+       /* If there is no IRQ to handle, exit indicating no IRQ handled */
+       if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
+          !(irq1 & ADV7511_INT1_DDC_ERROR))
+               return -1;
+
        regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
        regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);

With this, I would expect adv7511_irq_handler to return IRQ_NONE.  If
you're OK with that approach, I can do that.  If you want me to merge
adv7511_irq_handler, and adv7511_irq_process, I can do that too to
make the return codes a little more intuitive.

adam

>
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
>         regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
>
>         if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.enc=
oder)
>                 schedule_work(&adv7511->hpd_work);
>
>         if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERR=
OR) {
>                 adv7511->edid_read =3D true;
>
>                 if (adv7511->i2c_main->irq)
>                         wake_up_all(&adv7511->wq);
>         }
>
> #ifdef CONFIG_DRM_I2C_ADV7511_CEC
>         adv7511_cec_irq_process(adv7511, irq1);
> #endif
>
>         return 0;
> }
>
> static irqreturn_t adv7511_irq_handler(int irq, void *devid)
> {
>         struct adv7511 *adv7511 =3D devid;
>         int ret;
>
>         ret =3D adv7511_irq_process(adv7511, true);
>         return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> }
>
> The function will return IRQ_HANDLED as long as the registers can be
> read, even if they don't report any interrupt.
>
> >                                               adv7511);
> >               if (ret)
> >                       goto err_unregister_audio;
>
> --
> Regards,
>
> Laurent Pinchart
