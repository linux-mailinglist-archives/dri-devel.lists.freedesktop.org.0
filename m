Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7B5171FD
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE74110F0B9;
	Mon,  2 May 2022 14:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9C10F0B8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:52:25 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 15so11866420pgf.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BBG2ILGkJ92p9VECWvvWCJ7Ibpu89EQ+1rUwITUOrTY=;
 b=ltbv20WhVsdoqcSh4ZZWp26Bwv1400rOc1UGKY/LaX7tIJhjw6auR/t+Vz2PeR16Sp
 9qIM3P+jKrD6ztP8y9QYEuNZ8MefUIJIVAHohKBjHE9EcGIVOWBEknNNF8lhIeq5nsMa
 jBorxa8SWfDqEGo86I1CK8pwFD2EglAhS2SM4Gu2nFDdbZQqd8AJt9x7nv7sEYSLbBSQ
 EpLIDaybv27YEpt6+in2onthC87NtWUlsTSeddNdurxiqZnpbfTR8ePCJW6X89qJDHZ7
 kQyypdGw0oO/vEEvMJVQG/ifsqgNDibVzEVU3185BbgtEzNJNtOGUhoUaAP5LZ88oi13
 GmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BBG2ILGkJ92p9VECWvvWCJ7Ibpu89EQ+1rUwITUOrTY=;
 b=6wtRAVNbgmI5KTAcIrTRlE6B2M1kC1OXJZhlkss55SeMTbtUO2xf9KAYIXcvWjNBF3
 Zgc+pdtwi4uvFslZvPa+xUv5UjIIod36ti9+T6NwzKej/mpm7uxzfdTiA9bZzyFkpEAC
 ZoNYnbaGT8kdK0CDN74qa189/6W/Kj/IDtZ8mjpZi0weL5nG2Jmk4peEyfVfvhSar18d
 tmJsokWCwYNGpperBIX4gQcBOo4AoqUoblgHVPyW011jZPTM/Vrl9tGTvgXJP+4S96NQ
 32uANELK151RTSHBQ9ioKXoRGt7QAOh2gs/1hATgm54MNAw9N8BBsreBw2/NXx2Z3Snr
 0cJg==
X-Gm-Message-State: AOAM5330ECPJndQsMgOhS+ZK0BnO8HQzNljpEEF5XFFToGAaLxY0pFj9
 37pxzBeRQVCcz8iQYE742fwrjoA7yKDfk1JUb2AuIIyKaJ8=
X-Google-Smtp-Source: ABdhPJw2EDXi+cKh8Jwf5zfSJQuCKKutusV1Jmer7TGMBP44C34yJPLQPa0w1GC023klV8EmEnEGUWN0OYdIg5tRGfA=
X-Received: by 2002:a65:6047:0:b0:3c1:43c9:a4d9 with SMTP id
 a7-20020a656047000000b003c143c9a4d9mr10130615pgp.324.1651503145403; Mon, 02
 May 2022 07:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220428162803.185275-1-u.kleine-koenig@pengutronix.de>
 <YmrYAwNqDDOd26Jn@pendragon.ideasonboard.com>
In-Reply-To: <YmrYAwNqDDOd26Jn@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 2 May 2022 16:52:14 +0200
Message-ID: <CAG3jFysBQoG=Y_R=RRCCb5CYfvKD+6=QGTc+qXPh68rpio3apA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tfp410: Make tfp410_fini() return void
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Apr 2022 at 20:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Uwe,
>
> Thank you for the patch.
>
> On Thu, Apr 28, 2022 at 06:28:03PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > tfp410_fini() always returns zero. Make it return no value which makes =
it
> > easier to see in the callers that there is no error to handle.
> >
> > Also the return value of i2c and platform driver remove callbacks is
> > ignored anyway. This prepares making i2c and platform remove callbacks
> > return void, too.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  drivers/gpu/drm/bridge/ti-tfp410.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridg=
e/ti-tfp410.c
> > index ba3fa2a9b8a4..756b3e6e776b 100644
> > --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> > +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> > @@ -341,13 +341,11 @@ static int tfp410_init(struct device *dev, bool i=
2c)
> >       return 0;
> >  }
> >
> > -static int tfp410_fini(struct device *dev)
> > +static void tfp410_fini(struct device *dev)
> >  {
> >       struct tfp410 *dvi =3D dev_get_drvdata(dev);
> >
> >       drm_bridge_remove(&dvi->bridge);
> > -
> > -     return 0;
> >  }
> >
> >  static int tfp410_probe(struct platform_device *pdev)
> > @@ -357,7 +355,9 @@ static int tfp410_probe(struct platform_device *pde=
v)
> >
> >  static int tfp410_remove(struct platform_device *pdev)
> >  {
> > -     return tfp410_fini(&pdev->dev);
> > +     tfp410_fini(&pdev->dev);
> > +
> > +     return 0;
> >  }
> >
> >  static const struct of_device_id tfp410_match[] =3D {
> > @@ -394,7 +394,9 @@ static int tfp410_i2c_probe(struct i2c_client *clie=
nt,
> >
> >  static int tfp410_i2c_remove(struct i2c_client *client)
> >  {
> > -     return tfp410_fini(&client->dev);
> > +     tfp410_fini(&client->dev);
> > +
> > +     return 0;
> >  }
> >
> >  static const struct i2c_device_id tfp410_i2c_ids[] =3D {
> >
> > base-commit: 3123109284176b1532874591f7c81f3837bbdc17
>
> --
> Regards,
>
> Laurent Pinchart

Applied to drm-misc-next.
