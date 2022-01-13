Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA248D3A0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C8410E739;
	Thu, 13 Jan 2022 08:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BA410E739
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 08:30:46 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id v6so7482045iom.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 00:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y5adlxntEYi2bnudQTucURekR8+PW27N0Rz8bbantH4=;
 b=jb7FRwDCCwtlzdLBCME9hmSLl6t7/jrRvUs1KMP4s2xtHys/g1zhAKVvFhafLd1MEf
 gqGDsX1bWdGx6ZF0ePXExEcMJ7tFz+5LAyXjBd7hCpx4gRUoxc4DCkZRhD4V9sKPWT6k
 FquTEMFAWvmQ+r/J7JsjlbXmLTwevYe+dYn5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y5adlxntEYi2bnudQTucURekR8+PW27N0Rz8bbantH4=;
 b=z9xyDdDd37+6+ryDo36n0srD1EyzoAnM6m/FcaLWjdqIwsct2r3koZCMqkaejMRwoV
 1T/1ulp/zHnp+C8A3Bmk01Hmdo9z/WV5MCajrhYdfgq/hn7h/5VwBhP54TI/lbFEm+m9
 NuQdOL1J+wOdtVIU0dXtmYE1l9fS1b7CixAXl5/DizV/28dwkrasSgtNkdx/5EWmirlk
 hmOtbxHR2aCPJNwvirRno/lauecmmzvHk+eS/QlM+8eT4C245zBUoWgonNSSz81ZH4G7
 lolliaPz2tG12TzdiEO+gFIv1sSOwZubspaPcCu/yTjEwVaXAGIo2qXl1l8oKcXBtNj3
 vDdQ==
X-Gm-Message-State: AOAM531e5ilrbTq9xylHcTJePaXA7jzTiwR34Ni9a7pZvkjE9ew2n7VJ
 JgMtkpZ+jKf0yWbKJpiJFT104dttaR9X9gvDAuHwsQ==
X-Google-Smtp-Source: ABdhPJzxd5OkVm/ge397TAbNMmK+9iaTRpcp6F/fGx99WpqbPLJMhgOV7b8m/VuiIwqFY4GBST05XnrVQezh3f0Nqbo=
X-Received: by 2002:a6b:7b49:: with SMTP id m9mr415723iop.204.1642062646094;
 Thu, 13 Jan 2022 00:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20220113073158.2171673-1-hsinyi@chromium.org>
 <2e676870-11f2-b5fa-faf1-d6633e801a5a@wanadoo.fr>
In-Reply-To: <2e676870-11f2-b5fa-faf1-d6633e801a5a@wanadoo.fr>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 13 Jan 2022 16:30:20 +0800
Message-ID: <CAJMQK-jZgw0Kw0ON8sY=+FFf_Z_Pys48DN+r+g6cCUqcw_7-8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 4:04 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 13/01/2022 =C3=A0 08:31, Hsin-Yi Wang a =C3=A9crit :
> > Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
> > handled by driver detach.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >   drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/dr=
m/bridge/analogix/anx7625.c
> > index 0b858c78abe8b6..dbe708eb3bcf11 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *c=
lient,
> >               return -ENODEV;
> >       }
> >
> > -     platform =3D kzalloc(sizeof(*platform), GFP_KERNEL);
> > +     platform =3D devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
> >       if (!platform) {
> >               DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
> >               return -ENOMEM;
> > @@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *c=
lient,
> >       if (ret) {
> >               if (ret !=3D -EPROBE_DEFER)
> >                       DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret=
);
> > -             goto free_platform;
> > +             return ret;
> >       }
> >
> >       platform->client =3D client;
> > @@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *c=
lient,
> >       if (!platform->hdcp_workqueue) {
> >               dev_err(dev, "fail to create work queue\n");
> >               ret =3D -ENOMEM;
> > -             goto free_platform;
> > +             return ret;
> >       }
> >
> >       platform->pdata.intp_irq =3D client->irq;
> > @@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *c=
lient,
> >       if (platform->hdcp_workqueue)
> >               destroy_workqueue(platform->hdcp_workqueue);
> >
> > -free_platform:
> > -     kfree(platform);
> > -
> >       return ret;
> >   }
> >
>
> Hi,
>
> you also need to update anx7625_i2c_remove() accordingly, otherwise you
> introduce a double free.
>
Hi,

Updated in v3.
> CJ
>
>
