Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A653AEC89
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DD86E1EE;
	Mon, 21 Jun 2021 15:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1219A6E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:35:05 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id y11so5381794qvv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0uexkxIgdtHcO0ywotPaMOdh8zJX+zJKl2s1rN2kxP4=;
 b=Vb0tHd5FNrMGZngLgPioQ5Lf5mzLJ1TAl80ByD4WgWO2DdFh+ZrfYmQIySSmJVozbK
 RLeGWHe7LS62+BRz59Ieu0NlqiSGStoq4hbQWMoSGCpk8oTwERzt9iHDgY+LX3n8TVZj
 +FNUtZTkqzGDUvY3Mdz6FUgSV9JQxIVcAO5G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0uexkxIgdtHcO0ywotPaMOdh8zJX+zJKl2s1rN2kxP4=;
 b=edpgBwN5LqKaMIQWe56S106/NaKQVUNVXXapOtA2N/vPykACSJWPpm9PNNPlm8azZB
 DHejMJt1O66SHerVeJ2bY7neC/NQT8flc+djSraefpipBJiinlowhQ6p/xSsp0Xw0GFU
 iQxB0zqDGGjT7dUAdd8rO6ApRrvlUL9t963Z3eEYu4KsUHPPReulm1ix/khrrEDXrhrn
 ShhN5b8HygKiup7iMn/2JUbOrcalCXoTw+UD7a/f1+G1kf1y92UBt+yLMhkrtaEMEKym
 Fdf8lhNYa+oQnWtmpk9jyv1W1nymUJ4TnzZUpHaTbAUHknK+fx1risMraHeIfrqnwICy
 JvQg==
X-Gm-Message-State: AOAM530lDneTfX9dMe2LT6zAY+6Xe45Vgvi7jQWKyUXN4UD7GOY1Rhbr
 /m6gn9lHVEvnCvMowC0xOGLKqf3wI8qWmw==
X-Google-Smtp-Source: ABdhPJwypB1MyKQo1+tOpC+pCAGJUml66A4ZKZ0wOme+l3SN5en2C46osN1Rgzq+azrxr659bHqU0w==
X-Received: by 2002:ad4:4bc9:: with SMTP id l9mr7091530qvw.36.1624289704463;
 Mon, 21 Jun 2021 08:35:04 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182])
 by smtp.gmail.com with ESMTPSA id v5sm10069159qkh.39.2021.06.21.08.35.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:35:04 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id c138so31553433qkg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:35:04 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr32287432ybp.476.1624289703701; 
 Mon, 21 Jun 2021 08:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-6-git-send-email-rajeevny@codeaurora.org>
 <20210620100147.GB703072@ravnborg.org>
In-Reply-To: <20210620100147.GB703072@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jun 2021 08:34:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VP8hLHtpZ8F5KVGWoKiJBxyQVufg7V9A2CC0rwcAX-aw@mail.gmail.com>
Message-ID: <CAD=FV=VP8hLHtpZ8F5KVGWoKiJBxyQVufg7V9A2CC0rwcAX-aw@mail.gmail.com>
Subject: Re: [v7 5/5] drm/panel-simple: Add Samsung ATNA33XC20
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jun 20, 2021 at 3:01 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rajeev
> On Sat, Jun 19, 2021 at 04:10:30PM +0530, Rajeev Nandan wrote:
> > Add Samsung 13.3" FHD eDP AMOLED panel.
> >
> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v4:
> > - New
> >
> > Changes in v5:
> > - Remove "uses_dpcd_backlight" property, not required now. (Douglas)
> >
> > Changes in v7:
> > - Update disable_to_power_off and power_to_enable delays. (Douglas)
> >
> >  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 86e5a45..4adc44a 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -3562,6 +3562,36 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
> >       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> >  };
> >
> > +static const struct drm_display_mode samsung_atna33xc20_mode = {
> > +     .clock = 138770,
> > +     .hdisplay = 1920,
> > +     .hsync_start = 1920 + 48,
> > +     .hsync_end = 1920 + 48 + 32,
> > +     .htotal = 1920 + 48 + 32 + 80,
> > +     .vdisplay = 1080,
> > +     .vsync_start = 1080 + 8,
> > +     .vsync_end = 1080 + 8 + 8,
> > +     .vtotal = 1080 + 8 + 8 + 16,
> > +     .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +};
> > +
> > +static const struct panel_desc samsung_atna33xc20 = {
> > +     .modes = &samsung_atna33xc20_mode,
> > +     .num_modes = 1,
> > +     .bpc = 10,
> > +     .size = {
> > +             .width = 294,
> > +             .height = 165,
> > +     },
> > +     .delay = {
> > +             .disable_to_power_off = 200,
> > +             .power_to_enable = 400,
> > +             .hpd_absent_delay = 200,
> > +             .unprepare = 500,
> > +     },
> > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > +};
>
> bus_format is missing. There should be a warning about this when you
> probe the display.

Sam: I'm curious about the requirement of hardcoding bus_format like
this for eDP panels. Most eDP panels support a variety of bits per
pixel and do so dynamically. Ones I've poked at freely support 6bpp
and 8bpp. Presumably this one supports both of those modes and also
10bpp. I haven't done detailed research on it, but it would also
surprise me if the "bus format" for a given bpp needed to be specified
for eDP. Presumably since eDP has most of the "autodetect" type
features of DP then if the format needed to be accounted for that you
could query the hardware?

Looking at the datasheet for the ti-sn65dsi86 MIPI-to-eDP bridge chip
I see that it explicitly calls out the bus formats that it supports
for the MIPI side but doesn't call out anything for eDP. That would
tend to support my belief that there isn't variance on the eDP side...

Maybe the right fix is to actually change the check not to give a
warning for eDP panels? ...or am I misunderstanding?


> The bpc of 10 in unusual, the current code warns if bpc is neither 6 nor
> 8. If 10 is correct then update the code to accept bpc=10.

I'm pretty sure it's 10 based on this panel's datasheet, though this
panel also accepts 8 bpc. Fixing the warning seems like a good idea to
me--I wasn't aware of it.

-Doug
