Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1F56C7A5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 09:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823CE10FD6A;
	Sat,  9 Jul 2022 07:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF14C10EB0D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 21:03:33 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e15so19981edj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 14:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9D1dMV/wl41srQTjtMRnPPYS9ui9XJnIPQ6Za9rlFlg=;
 b=Mlj28zlSyiapgPsOC25mOdGjceagThnpsZDNvLIpB7QkJW/z+m4J3T6Vk8spQtLuNB
 2eWAunXuB/JvF8RbkQfVwtJSh49Ok/ziOZisiRDpFnXJpR0JdPBUL7U0IW0PPf9T7vgv
 NV5gxcEPQV45UetlaHVv3DZIizscOXMC80vExiOL93YMySdvKLSnu0hLum2XqRQl/xOw
 Rz4bevfs/GtrIiMAGs14zhOXpTGOH9YD1qXnW8gqMEeP55u4atRTA2lxBgVPGwvAqSZo
 2zbeWe5zWAAZgfSIcEMZPZp3Qho6vrLkSmuR/FRN2l/2QZVLb9UtfTL356262LScfrma
 fA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9D1dMV/wl41srQTjtMRnPPYS9ui9XJnIPQ6Za9rlFlg=;
 b=n+It0ghWEuAGa7xD6JWiXc0Uke6+md25yKoQo36uUw9t9DROwmWiVx/N0WP3D0NAW0
 v6+/1L+4tCo/0Bw20z8IZYaGBBNLO/oYOdmVZOmrEeyCeKluhDCZH5DKJB50XdHGSzGK
 9GbFWrFoOhX26+VThRtA/R6qZUraMlrHd+M66dvLjG6gRel9R7Uqa/b+lJmEUxPlNHlX
 wdXc6v31wAe2qsbulRtNETc1uXRY/YR/q46zbW00rHbwvL0y0VJLs7C1OmFU8R9T7Jgc
 fZ8rNrGaxRPyMkWJDbBnQagkf3evppLnYrSSYFSu5OP8RuC1MMGdZWT4XqQ9DfqjhIm3
 ePjQ==
X-Gm-Message-State: AJIora+wT5+aGlVjGRTazIvbYacGWc2/LYbRXRLaCjy+YkOR2iBJDyQ/
 Gim7okpLR5m+vCgoSFzaf4F1Dz2sL+U3NXchYVVdZw==
X-Google-Smtp-Source: AGRyM1tbbwYUYYk8XsfwFscqxkdupkHc0W0XT3xF1BJa3FD/cJrFY8UDnnp5VugaDFT3MkN/EHCuTvnbkg4NIYarsF4=
X-Received: by 2002:a05:6402:5306:b0:437:8bbd:b313 with SMTP id
 eo6-20020a056402530600b004378bbdb313mr7426246edb.123.1657314212044; Fri, 08
 Jul 2022 14:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184133.210888-1-ezequiel@vanguardiasur.com.ar>
 <2ae24b07-92ae-8bdb-8b2d-f90a4a9557a9@redhat.com>
In-Reply-To: <2ae24b07-92ae-8bdb-8b2d-f90a4a9557a9@redhat.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 8 Jul 2022 18:03:21 -0300
Message-ID: <CAAEAJfCwmdJEoayanWLodd9mj3hx0Y_4BME10SeTu4MF7pvWyw@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Fix pre-charge period setting
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 09 Jul 2022 07:09:37 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 7, 2022 at 5:37 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Hello Ezequiel,
>
> Thanks a lot for your patch.
>
> On 7/6/22 20:41, Ezequiel Garcia wrote:
> > Fix small typo which causes the mask for the 'precharge1' setting
> > to be used with the 'precharge2' value.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > ---
> >  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> > index 08394444dd6e..f4886e66ff34 100644
> > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > @@ -350,7 +350,7 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
> >
> >       /* Set precharge period in number of ticks from the internal clock */
> >       precharge = (SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep1) |
> > -                  SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep2));
> > +                  SSD130X_SET_PRECHARGE_PERIOD2_SET(ssd130x->prechargep2));
>
> It's a typo indeed. Nice catch!
>
> I wonder how did you notice this. Or was it just looking at the code ?
>

Indeed, I was just reviewing the code while getting a SH1106 display to work.

> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
> I'll push it to drm-misc (drm-misc-fixes).
>

Thanks!
Ezequiel

> --
> Best regards,
>
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
>
