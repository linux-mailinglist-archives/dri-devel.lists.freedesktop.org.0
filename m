Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89EF5031FD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 02:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEFD10E51F;
	Sat, 16 Apr 2022 00:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1BE10E51F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 00:12:26 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c6so11509433edn.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 17:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mEfZQ7sh46e4BCqZ+u0nu8S8W6NzsVlQxblVYVMyAI0=;
 b=nMqyfMNyP0mFIWiOnHm2qjsizdjmYnQERx8vP1aRYxhgEuIW5CNZQray6vswaha8Wb
 hvqUho5Yw3VFj7Wyrgsd8wrWoRPQ21scvhZxdnZPptEAVGxdx/ouGIAM/ExiMkjhGhoE
 vN5/Xz7OoCTz9W9O09YUdH8vgBFooaaTLOx04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mEfZQ7sh46e4BCqZ+u0nu8S8W6NzsVlQxblVYVMyAI0=;
 b=p0pOZF4RZTee+eRgKv7bn4xkxs136ESnAc4mGRygZiW7//wNvKcEbTVF2e/jh5gxXI
 02V9VlH5BoQd7mu3U2VgItMJyI0j/a1hfdgxTguLIewys1j+M+9QSzalpbIGhiS2reC2
 iE8ru2UnHIIS9At+IuUXH91VqCMODNlMoR4GF0h2KTc7agxeHOL/RlMybxpvlcYPWEd0
 4lTO47b9L1MCbPkro3D/3bd1H2JqHwpYK/1neexBnbzIaeTqOslhmEa2Vs2Nnk94ULF+
 nMR0WyddUwvRRHjeN6W4NON/lxtjqUHGYtDHJFBXHSMYAXv4TyILyiYO0P9+OKtusZpa
 QkWg==
X-Gm-Message-State: AOAM532vLcYEoANBjaW42wMJKQhxIPMWIFlO+IiowGL2APXeYKe15Ub0
 t0pJOPjQLUNBNQqfp+9JqjVv9OONnUiKiA==
X-Google-Smtp-Source: ABdhPJw11/YQhKifFq0J7IZGD7B8rGzWQqwZvbuwSEzg4uRnnVgiX+sfV6Kx+cXlMtnuJmebeeoTUg==
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr1562694edv.94.1650067944410; 
 Fri, 15 Apr 2022 17:12:24 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 kx5-20020a170907774500b006e1382b8192sm2136835ejc.147.2022.04.15.17.12.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 17:12:23 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 i82-20020a1c3b55000000b0038ccb70e239so3915876wma.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 17:12:23 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr5121467wmb.29.1650067942637; Fri, 15
 Apr 2022 17:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.4.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
 <027b3ca1-fbd3-7bce-1ca0-ec92a5f23fee@linaro.org>
 <CAD=FV=Xu7b=t1C4JHF4U9BsD9wFy_x_GseJFNytHdCKvnS9DoA@mail.gmail.com>
 <CAA8EJppyBTDeFVztS2rTihAwEjJdmJf1Md-Qa3x3MijVvbzSUQ@mail.gmail.com>
In-Reply-To: <CAA8EJppyBTDeFVztS2rTihAwEjJdmJf1Md-Qa3x3MijVvbzSUQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Apr 2022 17:12:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbCggB6kVwE8jj3DO3GWXj=_LeXatST3S9h91kh32nEw@mail.gmail.com>
Message-ID: <CAD=FV=XbCggB6kVwE8jj3DO3GWXj=_LeXatST3S9h91kh32nEw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] drm/panel-edp: Take advantage of
 is_hpd_asserted() in struct drm_dp_aux
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 15, 2022 at 3:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 16 Apr 2022 at 00:17, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Apr 14, 2022 at 5:51 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 09/04/2022 05:36, Douglas Anderson wrote:
> > > > Let's add support for being able to read the HPD pin even if it's
> > > > hooked directly to the controller. This will allow us to get more
> > > > accurate delays also lets us take away the waiting in the AUX transfer
> > > > functions of the eDP controller drivers.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > >   drivers/gpu/drm/panel/panel-edp.c | 37 ++++++++++++++++++++++++++-----
> > > >   1 file changed, 31 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > > > index 1732b4f56e38..4a143eb9544b 100644
> > > > --- a/drivers/gpu/drm/panel/panel-edp.c
> > > > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > > > @@ -417,6 +417,19 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
> > > >       return 0;
> > > >   }
> > > >
> > > > +static bool panel_edp_can_read_hpd(struct panel_edp *p)
> > > > +{
> > > > +     return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->is_hpd_asserted));
> > > > +}
> > > > +
> > > > +static bool panel_edp_read_hpd(struct panel_edp *p)
> > > > +{
> > > > +     if (p->hpd_gpio)
> > > > +             return gpiod_get_value_cansleep(p->hpd_gpio);
> > > > +
> > > > +     return p->aux->is_hpd_asserted(p->aux);
> > > > +}
> > > > +
> > > >   static int panel_edp_prepare_once(struct panel_edp *p)
> > > >   {
> > > >       struct device *dev = p->base.dev;
> > > > @@ -441,13 +454,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
> > > >       if (delay)
> > > >               msleep(delay);
> > > >
> > > > -     if (p->hpd_gpio) {
> > > > +     if (panel_edp_can_read_hpd(p)) {
> > > >               if (p->desc->delay.hpd_absent)
> > > >                       hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
> > > >               else
> > > >                       hpd_wait_us = 2000000;
> > > >
> > > > -             err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
> > > > +             /*
> > > > +              * Extra max delay, mostly to account for ps8640. ps8640
> > > > +              * is crazy and the bridge chip driver itself has over 200 ms
> > > > +              * of delay if it needs to do the pm_runtime resume of the
> > > > +              * bridge chip to read the HPD.
> > > > +              */
> > > > +             hpd_wait_us += 3000000;
> > >
> > > I think this should come in a separate commit and ideally this should be
> > > configurable somehow. Other hosts wouldn't need such 'additional' delay.
> > >
> > > With this change removed:
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > What would you think about changing the API slightly? Instead of
> > is_hpd_asserted(), we change it to wait_hpd_asserted() and it takes a
> > timeout in microseconds. If you pass 0 for the timeout the function is
> > defined to behave the same as is_hpd_asserted() today--AKA a single
> > poll of the line.
>
> This might work. Can you check it, please?

Cool. I'll spin with this. Hopefully early next week unless my inbox
blows up. ...or my main PC's SSD like happened this week. ;-)


> BTW: are these changes dependent on the first part of the patchset? It
> might be worth splitting the patchset into two parts.

Definitely not. As per the cover letter, this is two series jammed
into one. I'm happy to split them up. The 2nd half seems much less
controversial.

-Doug
