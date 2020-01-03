Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550412FD3C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 20:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431B5895B5;
	Fri,  3 Jan 2020 19:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78870895B5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 19:47:50 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c26so42473694eds.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 11:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZOZVHTb+3h6BOMb+3kqKp315cgiSfb0pLuDtSxBQBM=;
 b=i3r00vQHBL2sDAI4dtuZ/zsg+OhlwmfLKu1EbtUfmBblRf30KdraxcjZ5+9veNm9+r
 VXPC3GqUBlyAZ2xaezE8Z6qR+NXMthbazKJgnZFCBVaJXKn6Pc8UUk9iMLC+RLcPevva
 xISwU6UG214McmTcnRcRYScHJo4U/JMBIVddPkryu6S2q/4RLbaaux28wruieZHpq8Ds
 NlkXomCh4PiKX71W4UzU2WEFksc1CG6x+oS3eAUGn6nDdGR9WdrwKWNmcEFrAaayXduY
 UGlw7GHvFnPbPYChG2Uld3vGf47M7GMTPvcZ79CQ+uSkYaRr2L1tMZ/X4l282KKuzGBG
 Wspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZOZVHTb+3h6BOMb+3kqKp315cgiSfb0pLuDtSxBQBM=;
 b=i5R/UklkFNFV1OqVXGcS0Zi+T4BMkkE856IlKjdQeEef3sxnWEda7hLu0cQvY8r3Hk
 pkshxsB9k7rarOjmI5bXqckB5zOupKHPdStpyZqI2QGvQrse5roKjqk7yP2x05HwiPAz
 0u4a6Ys0lqrzWv1wwY2pw3/HstyZ0prRSP8SUIqaScJ2H9UMZkVy45ehjQCuXNIA7i7S
 uJzNHVp50KMyv66WDwOea1q2uHbseKUh/o1NAEs8TO5QdbYmD/SwghDqmza/GmNYXUTU
 WXphO4uYG68EAVihgDC8ZGwKSKry2ismLrSZCxIRvYYkBodazWq6R4qHsEQD9i8eLuwF
 ChpQ==
X-Gm-Message-State: APjAAAXT39SD0qJbqOL/bztdv4SlByUm1mwhK4fJbClVCIxhYPi8F2qz
 RXU2H/A/cVSRLzCmoE/cSsXWxJuY8AabGL45YOQ=
X-Google-Smtp-Source: APXvYqzm/Ay3X26OiUyZcxYr2sA8q0KNwmLg0kGhYCUvD0jASZvMzylVMe6yq9epmuFVENGUaj3upvLcAFe5N1iieeg=
X-Received: by 2002:a17:906:34d7:: with SMTP id
 h23mr17921481ejb.90.1578080869160; 
 Fri, 03 Jan 2020 11:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20200103183025.569201-1-robdclark@gmail.com>
 <20200103183025.569201-2-robdclark@gmail.com>
 <20200103193135.GA21515@ravnborg.org>
In-Reply-To: <20200103193135.GA21515@ravnborg.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jan 2020 11:47:38 -0800
Message-ID: <CAF6AEGtdFA7XzSq3w3N6_TRLWQY+zumU2mahbsPY=pc0r_x6fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add support for AUO B116XAK01 panel
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 11:31 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Fri, Jan 03, 2020 at 10:30:24AM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 5d487686d25c..895a25cfc54f 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -680,6 +680,35 @@ static const struct panel_desc auo_b116xw03 = {
> >       },
> >  };
> >
> > +static const struct drm_display_mode auo_b116xak01_mode = {
> > +     .clock = 69300,
> > +     .hdisplay = 1366,
> > +     .hsync_start = 1366 + 48,
> > +     .hsync_end = 1366 + 48 + 32,
> > +     .htotal = 1366 + 48 + 32 + 10,
> > +     .vdisplay = 768,
> > +     .vsync_start = 768 + 4,
> > +     .vsync_end = 768 + 4 + 6,
> > +     .vtotal = 768 + 4 + 6 + 15,
> > +     .vrefresh = 60,
> > +     .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > +};
> > +
> > +static const struct panel_desc auo_b116xak01 = {
> > +     .modes = &auo_b116xak01_mode,
> > +     .num_modes = 1,
> > +     .bpc = 6,
> > +     .size = {
> > +             .width = 256,
> > +             .height = 144,
> > +     },
> > +     .delay = {
> > +             .hpd_absent_delay = 200,
> > +     },
> > +     .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > +};
> Entries in alphabetical order - check.
> .connector_type specified - check.
> .flags and .bus_format specified - check.
> .bus_flags not specified but optional - OK.
>
> > +
> >  static const struct drm_display_mode auo_b133xtn01_mode = {
> >       .clock = 69500,
> >       .hdisplay = 1366,
> > @@ -3125,6 +3154,9 @@ static const struct of_device_id platform_of_match[] = {
> >       }, {
> >               .compatible = "auo,b133htn01",
> >               .data = &auo_b133htn01,
> > +     }, {
> > +             .compatible = "auo,b116xa01",
> > +             .data = &auo_b116xak01,
> This entry most also be in alphabetical order.
>
> >       }, {
> >               .compatible = "auo,b133xtn01",
> >               .data = &auo_b133xtn01,
>
> Please fix and resend.
>
> I am in general holding back on patches to panel-simple.
> I hope we can reach a decision for the way forward with the bindings
> files sometimes next week.

I've fixed the sort-order and the couple things you've pointed out in
the bindings.  Not sure if you want me to resend immediately or
hang-tight until the bindings discussion is resolved?

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
