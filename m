Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC9395935
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC6D6E849;
	Mon, 31 May 2021 10:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453166E849
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:47:43 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so1751642pjq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wasp0hV3FSKw8dKXyCQtyABnrM0/MsUV4lyiwadF4tU=;
 b=elrKJiegq6gFznafUVUWbmGavHh0iVZntQAhHSPKWv5mSWsWDhCcPNL07fcGW1SqbH
 lAdmE+xi33Bm1/bUT5MhEkVOQ5E9WwWy2HW4q8nSTCT4QDcARKSzZe7ZgJvTzMK6gev3
 Tb8Gtl7YuwNzW9Mc78xWJRipPWjdhoU+UeGF4Ib+M3C5dAINPN9DbuLg5xCDmvewp1al
 BDFY3xz5wtqKtGlcgwjWKAH8VuBtWFb+3GdmXqt7pSofiTdUkP4DE03xc7nAXwWFxuUM
 6aC2H0T+pOYLBuaZ802E8sqUynT+kyeLhwwS3VI1PO8hyzoWZqc8KLiYKL5FkVuDppFy
 a0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wasp0hV3FSKw8dKXyCQtyABnrM0/MsUV4lyiwadF4tU=;
 b=JbuKCP9LKF4u3g6br47kI+aoZ18hSh1N1rjDoa21kWpw1o1fCVGypgI5MZaKk4OFto
 WfRf66IvmMhSC6GQHNGpzI/TEOOn4tMeOkgVIAvULIDbygfx5/iT5/2gMvZFvtR7/FWn
 zdhP4Kzp0cGUybTKc8QI1UoqFXpWHcv7NjVqwg+cLHYPiybPHnGJfBkDNzWF/Qy1SFoI
 P3ps3pQLmZH9y4KGEUR2VH/Hn4qW2WpFjXozeiLX7RErbKPe6wEltPpKqkK1lesFP9fz
 jJZl2wEw9QGRi7WxgdMCakK7K+gaStff914/jXEN7l0EhYA5IP8kL2jy5wjeLNw2jzux
 9+IQ==
X-Gm-Message-State: AOAM531yhp3mToKPxjt+9G1m4isQbpuG6sTvtuJlnHmqVXZapScbWLRj
 RIhv1x3XV9FxQjm2SGLQiZYFNiCppwoPmZwpiWzvAO+gj5Bmyw==
X-Google-Smtp-Source: ABdhPJzlHE6akvwbVekdGmHvSrNEMkLnAXiBf1mdnqq5Q/9dMYEy99Jssb5hsZg3Dd363P5CQ886i/OQmE9vAop3R+M=
X-Received: by 2002:a17:90a:43a6:: with SMTP id
 r35mr10420107pjg.222.1622458062779; 
 Mon, 31 May 2021 03:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210529002759.468964-1-linus.walleij@linaro.org>
 <CABkfQAHcuee=1beNsP-EKHS7jjO02NcMkF2gNt0Lapppn1_s=A@mail.gmail.com>
In-Reply-To: <CABkfQAHcuee=1beNsP-EKHS7jjO02NcMkF2gNt0Lapppn1_s=A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 May 2021 12:47:31 +0200
Message-ID: <CAG3jFyvRn4iQ+61LzDb3t0-2_hiwFiu3WPbT+-iNm376Ofo8fA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt8912b: Drop unused includes
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next.

On Sat, 29 May 2021 at 23:10, Adrien Grassein <adrien.grassein@gmail.com> w=
rote:
>
> Reviewed-by: Adren Grassein <adrien.grassein@gmail.com>
>
> Le sam. 29 mai 2021 =C3=A0 02:30, Linus Walleij <linus.walleij@linaro.org=
> a =C3=A9crit :
> >
> > The Lontium bridge is including legacy header files for GPIO
> > but not using them. Delete the includes.
> >
> > Cc: Adrien Grassein <adrien.grassein@gmail.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm=
/bridge/lontium-lt8912b.c
> > index 443f1b47e031..4ff091ecd8b4 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > @@ -7,8 +7,6 @@
> >  #include <linux/delay.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> > -#include <linux/gpio.h>
> > -#include <linux/of_gpio.h>
> >  #include <linux/regmap.h>
> >
> >  #include <drm/drm_probe_helper.h>
> > --
> > 2.31.1
> >
