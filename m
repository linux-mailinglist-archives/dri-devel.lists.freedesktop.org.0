Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D78986B1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 14:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809F111B51A;
	Thu,  4 Apr 2024 12:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="emPv/ETV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A1911B51A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 12:01:02 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1e2b137d666so3788145ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712232061; x=1712836861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wL4i2rxVSO4Dx2Z9A/DMCu9nioCZUVI1YGXCUgVZyec=;
 b=emPv/ETVgcBE1XBoc9RASXRvDav3XsCCu6MUpNVJngSnMPS0lFgcllsQ5JRdA6d+sG
 ci9C1NszM/5qXcqjgrV9dcUDZLYQrbI1YaQtODicaRPULwv2b4n3rGU7DVZd+jt9FOu3
 OjT1oTQRwnvUHjZ7En272Qjqg5HSqNiVuJ4WOduHDiC/7vKilvMrA3MP2JR1JQHJbKUW
 Z5E3fRLrPX3jLkAar4FdsN91E4yeVZArVPTJi0xxU+dNfEuNBQOO5XRWOaM8Cg/UTFx9
 Efracvg9O4tf+/5bqrdJwjZtD6yf4cX8B91rHjUeS+TJ5dfvRcOxQbTL4LwVZrAK8t6a
 RdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712232061; x=1712836861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wL4i2rxVSO4Dx2Z9A/DMCu9nioCZUVI1YGXCUgVZyec=;
 b=LD5ZNjtjAVwoYnQJeYY//bPNv4VLgI/sVY6PXZQ6ExaWHAU6RlowXFocMKkaLMcpMg
 s/4dhfMokhcweB+rBHrOCVoWT35ekcU8Tnz/dOP2ZVVf5hxB25y0cmHNRxaVn73v+BRI
 IfhSCYy/myWf7ti3KsYSCjcGMlkrNu6UakZCdm20Q8AlPHbYaslLaeBAPPl/XAfoVFRn
 jTxfHN9eKh5ODMx7Ya/h7751PGWupkwwZZK4lK34bg0iYuCwVg9n47ksE6pdiK6bQLTf
 bVx2ca4YEQ7xOFEDFuDorkzU2TRflNAZRkTYYXEyFb3LZ/0cxnnCMyl+aq3zadVtxc9i
 7ZtQ==
X-Gm-Message-State: AOJu0Yym1KCG/KBbG3bN+2q0kh02Pm40sLVz/7pIQsv/eoR9GQTQnNsm
 s9vGt8RcFOumFGB436W/C9JeX905BeZwE+pXji5WGJqTLOkFY3OxbLffUG3lOg/q/PZh9CWqlwJ
 hBz2hb6V+qBKBFz7VVrn0RW6qna0=
X-Google-Smtp-Source: AGHT+IGcM7phzQ4a6LWlb+ZbUy46QOrWqPtD6hZ2VF2T8uxuZk2nkBNtUNgHlEIleOyY0tflROY1ahFFF1Z2hTRU4SA=
X-Received: by 2002:a17:902:7282:b0:1e2:7356:aa31 with SMTP id
 d2-20020a170902728200b001e27356aa31mr1882050pll.34.1712232061199; Thu, 04 Apr
 2024 05:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240305004859.201085-1-aford173@gmail.com>
 <20240305081816.GF12503@pendragon.ideasonboard.com>
In-Reply-To: <20240305081816.GF12503@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 4 Apr 2024 07:00:49 -0500
Message-ID: <CAHCN7xKwScoXouUHyH=dPZ0fgibmEUXRFwFPUF8mdKMf8YNA2g@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com, 
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Tue, Mar 5, 2024 at 2:18=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Adam,
>
> Thank you for the patch.
>
> On Mon, Mar 04, 2024 at 06:48:57PM -0600, Adam Ford wrote:
> > The IRQ registration currently assumes that the GPIO is dedicated
> > to it, but that may not necessarily be the case. If the board has
> > another device sharing the GPIO, it won't be registered and the
> > hot-plug detect fails to function.
> >
> > Currently, the handler reads two registers and blindly
> > assumes one of them caused the interrupt and returns IRQ_HANDLED
> > unless there is an error. In order to properly do this, the IRQ
> > handler needs to check if it needs to handle the IRQ and return
> > IRQ_NONE if there is nothing to handle.  With the check added
> > and the return code properly indicating whether or not it there
> > was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>


Gentle nudge on this one.   It's been about a month, and without it,
it is preventing hot-plug detection on one board for me.

Thanks

adam

>
> > ---
> > V2:  Add check to see if there is IRQ data to handle
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index b5518ff97165..f3b4616a8fb6 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -477,6 +477,11 @@ static int adv7511_irq_process(struct adv7511 *adv=
7511, bool process_hpd)
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* If there is no IRQ to handle, exit indicating no IRQ data */
> > +     if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> > +         !(irq1 & ADV7511_INT1_DDC_ERROR))
> > +             return -ENODATA;
> > +
> >       regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
> >       regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
> >
> > @@ -1318,7 +1323,8 @@ static int adv7511_probe(struct i2c_client *i2c)
> >
> >               ret =3D devm_request_threaded_irq(dev, i2c->irq, NULL,
> >                                               adv7511_irq_handler,
> > -                                             IRQF_ONESHOT, dev_name(de=
v),
> > +                                             IRQF_ONESHOT | IRQF_SHARE=
D,
> > +                                             dev_name(dev),
> >                                               adv7511);
> >               if (ret)
> >                       goto err_unregister_audio;
>
> --
> Regards,
>
> Laurent Pinchart
