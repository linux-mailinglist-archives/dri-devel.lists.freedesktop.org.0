Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6748B502FF8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 23:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9767010E451;
	Fri, 15 Apr 2022 21:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8128710E451
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 21:17:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s25so10641023edi.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EfZB9gZ26i32vvI5wBO459/sXHKxXquhYVeMgZP1nIY=;
 b=MNDq7I+E+p6wsMtvTjH7DSkPLNzz2b6A6JAJCsbbgqxQyaGG5VKeOkbWnr407BBF8Y
 RRBhruC/M9VHiKDKPpJusoMXXIncG/YrsiTBGRIWnV8PMV4q2bD3ABWklQVcne2p9q47
 ShfAUu/vn20kTQM02/YkUxqyhfoPZFVoPqCOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EfZB9gZ26i32vvI5wBO459/sXHKxXquhYVeMgZP1nIY=;
 b=SgvrrPbvzDGCK0E/gtztyRMP8Gq6qqAz3cNUxKpx2Hfi4Xaa/z8eY4tFHiLW5HF3tR
 dpmGfZlsAe/22mx2QTysbI+TxRpEW2dDZh+B7vuBBokuixQtH0KYZt6/+EAV+K2a35mx
 O6eypzexhcSTbS4fxayl+l6yAdXzMXkfhLx6KOhOxI+U0cHT77yVIPGtEHKbzp+Pgn4X
 R3qvBg1ASs0THRJOpWan+/DwIrXEGdkaVhypYPUAGPf+A4rJ3EQpS8fXaoDZosdJ1408
 faZsye+vkZALmA4i53B9v1HkgApL3zplpuF6FMocfNjBm0pADRqiX+OuRtHn0pDATznI
 vwmA==
X-Gm-Message-State: AOAM531nJdHOt7e4Pc5TJAgmDmnc3+P8kZ19PKmpJeRPVzVgiZzkj1tw
 Q4w9W9kYNAFwOK6xVXOs1xIVlwhGh3WhXg==
X-Google-Smtp-Source: ABdhPJy4Rao4/y6JmXuZwoRkLEQ+qAdLTVHMel6ozJorwoc0/4a9QvEJlEcixVw+6aoVkzOflUySYA==
X-Received: by 2002:aa7:d543:0:b0:416:13eb:6fec with SMTP id
 u3-20020aa7d543000000b0041613eb6fecmr1038477edr.348.1650057458627; 
 Fri, 15 Apr 2022 14:17:38 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 u6-20020a17090626c600b006e74ef7f092sm2031047ejc.176.2022.04.15.14.17.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 14:17:37 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5626506wml.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:17:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr4734068wmb.29.1650057456890; Fri, 15
 Apr 2022 14:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.4.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
 <027b3ca1-fbd3-7bce-1ca0-ec92a5f23fee@linaro.org>
In-Reply-To: <027b3ca1-fbd3-7bce-1ca0-ec92a5f23fee@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Apr 2022 14:17:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xu7b=t1C4JHF4U9BsD9wFy_x_GseJFNytHdCKvnS9DoA@mail.gmail.com>
Message-ID: <CAD=FV=Xu7b=t1C4JHF4U9BsD9wFy_x_GseJFNytHdCKvnS9DoA@mail.gmail.com>
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

On Thu, Apr 14, 2022 at 5:51 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 09/04/2022 05:36, Douglas Anderson wrote:
> > Let's add support for being able to read the HPD pin even if it's
> > hooked directly to the controller. This will allow us to get more
> > accurate delays also lets us take away the waiting in the AUX transfer
> > functions of the eDP controller drivers.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/gpu/drm/panel/panel-edp.c | 37 ++++++++++++++++++++++++++-----
> >   1 file changed, 31 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 1732b4f56e38..4a143eb9544b 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -417,6 +417,19 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
> >       return 0;
> >   }
> >
> > +static bool panel_edp_can_read_hpd(struct panel_edp *p)
> > +{
> > +     return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->is_hpd_asserted));
> > +}
> > +
> > +static bool panel_edp_read_hpd(struct panel_edp *p)
> > +{
> > +     if (p->hpd_gpio)
> > +             return gpiod_get_value_cansleep(p->hpd_gpio);
> > +
> > +     return p->aux->is_hpd_asserted(p->aux);
> > +}
> > +
> >   static int panel_edp_prepare_once(struct panel_edp *p)
> >   {
> >       struct device *dev = p->base.dev;
> > @@ -441,13 +454,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
> >       if (delay)
> >               msleep(delay);
> >
> > -     if (p->hpd_gpio) {
> > +     if (panel_edp_can_read_hpd(p)) {
> >               if (p->desc->delay.hpd_absent)
> >                       hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
> >               else
> >                       hpd_wait_us = 2000000;
> >
> > -             err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
> > +             /*
> > +              * Extra max delay, mostly to account for ps8640. ps8640
> > +              * is crazy and the bridge chip driver itself has over 200 ms
> > +              * of delay if it needs to do the pm_runtime resume of the
> > +              * bridge chip to read the HPD.
> > +              */
> > +             hpd_wait_us += 3000000;
>
> I think this should come in a separate commit and ideally this should be
> configurable somehow. Other hosts wouldn't need such 'additional' delay.
>
> With this change removed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

What would you think about changing the API slightly? Instead of
is_hpd_asserted(), we change it to wait_hpd_asserted() and it takes a
timeout in microseconds. If you pass 0 for the timeout the function is
defined to behave the same as is_hpd_asserted() today--AKA a single
poll of the line.

-Doug
