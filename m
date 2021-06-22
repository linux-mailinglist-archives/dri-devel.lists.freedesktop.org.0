Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78653B0D1B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 20:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276D489CAA;
	Tue, 22 Jun 2021 18:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A16589CAA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 18:43:06 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id t40so417706oiw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 11:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hHHpcbuGzfoV+GfFLB8z1cKhHoFMqWAiFyD3G6YAko=;
 b=SqgfTNdOPOEae4ycnm65VuiFolDjL75QzhVcNDAYaB18+y6gC/dR2FGFGIRRYu1pnO
 6G/9w/gHa9kP4JXdIkgngJVl7pR9Q1k1pW/6bgLGCYUR69Fnfa/Go4hs4E81apxFVeYM
 CknYzB21+ZhhBxq4HsfpOUobGYuws4uDgpVZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hHHpcbuGzfoV+GfFLB8z1cKhHoFMqWAiFyD3G6YAko=;
 b=CxzO5lu9DpBaXHC4O1fAIzqdn5EoXReE0rstj0i3d9y4bxf3jQ3TuCaWEAW3aBJYRG
 1fXc5aZXEtjpw2g69SQE8ubzzyQkKf9pBS409Nd7UuOXPXNXG6v3b7ux69J9j4dwISj+
 OQ9RukPVxEe4z/E8AKyANHYt40hcjfhTnzj5qMq+N2DbK+lmwZYf/IrQt9j8hpmzxynE
 QljyHADaSD2WKqa1HmWFJmxir/xZv+OwLkWQdlc+ExPGbSzf8hheRByK7orMEgjslrdw
 nnkK3+XgexZ1UvHGbsdzJCXpp4JJ8jY6OfhMMBlb7HROCJPQwPNL4/l0HDCJgPO+Xb1z
 pNjQ==
X-Gm-Message-State: AOAM531+OoHp97/P2hbLyPjXMzT3jBT0sAwiPL71alutE1yJYNyu4b7C
 n0lduzgeI5KHzixnID3L7YjD7d751e7AhA==
X-Google-Smtp-Source: ABdhPJxgTdM0GI8+YJBfltwY817/xZQHuHr0A+N8/nJ8Bms6NOeZl2rLzLGYBbwGr+rUWvvIcSNRCg==
X-Received: by 2002:aca:38c1:: with SMTP id f184mr120140oia.101.1624387384899; 
 Tue, 22 Jun 2021 11:43:04 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
 [209.85.210.50])
 by smtp.gmail.com with ESMTPSA id o26sm41447otk.77.2021.06.22.11.43.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 11:43:04 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so22223787otl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 11:43:04 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id u184mr5281625ybb.343.1624387020330; 
 Tue, 22 Jun 2021 11:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-6-git-send-email-rajeevny@codeaurora.org>
 <20210620100147.GB703072@ravnborg.org>
 <CAD=FV=VP8hLHtpZ8F5KVGWoKiJBxyQVufg7V9A2CC0rwcAX-aw@mail.gmail.com>
 <20210621184157.GB918146@ravnborg.org>
In-Reply-To: <20210621184157.GB918146@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jun 2021 11:36:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzz0yW8FPxSFRBQ+y0+PbO__g-fPU64kXwqBmi6zT6RA@mail.gmail.com>
Message-ID: <CAD=FV=Wzz0yW8FPxSFRBQ+y0+PbO__g-fPU64kXwqBmi6zT6RA@mail.gmail.com>
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

On Mon, Jun 21, 2021 at 11:42 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Doug,
>
> On Mon, Jun 21, 2021 at 08:34:51AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Sun, Jun 20, 2021 at 3:01 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Rajeev
> > > On Sat, Jun 19, 2021 at 04:10:30PM +0530, Rajeev Nandan wrote:
> > > > Add Samsung 13.3" FHD eDP AMOLED panel.
> > > >
> > > > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - New
> > > >
> > > > Changes in v5:
> > > > - Remove "uses_dpcd_backlight" property, not required now. (Douglas)
> > > >
> > > > Changes in v7:
> > > > - Update disable_to_power_off and power_to_enable delays. (Douglas)
> > > >
> > > >  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
> > > >  1 file changed, 33 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > > index 86e5a45..4adc44a 100644
> > > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > > @@ -3562,6 +3562,36 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
> > > >       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> > > >  };
> > > >
> > > > +static const struct drm_display_mode samsung_atna33xc20_mode = {
> > > > +     .clock = 138770,
> > > > +     .hdisplay = 1920,
> > > > +     .hsync_start = 1920 + 48,
> > > > +     .hsync_end = 1920 + 48 + 32,
> > > > +     .htotal = 1920 + 48 + 32 + 80,
> > > > +     .vdisplay = 1080,
> > > > +     .vsync_start = 1080 + 8,
> > > > +     .vsync_end = 1080 + 8 + 8,
> > > > +     .vtotal = 1080 + 8 + 8 + 16,
> > > > +     .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> > > > +};
> > > > +
> > > > +static const struct panel_desc samsung_atna33xc20 = {
> > > > +     .modes = &samsung_atna33xc20_mode,
> > > > +     .num_modes = 1,
> > > > +     .bpc = 10,
> > > > +     .size = {
> > > > +             .width = 294,
> > > > +             .height = 165,
> > > > +     },
> > > > +     .delay = {
> > > > +             .disable_to_power_off = 200,
> > > > +             .power_to_enable = 400,
> > > > +             .hpd_absent_delay = 200,
> > > > +             .unprepare = 500,
> > > > +     },
> > > > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > > > +};
> > >
> > > bus_format is missing. There should be a warning about this when you
> > > probe the display.
> >
> > Sam: I'm curious about the requirement of hardcoding bus_format like
> > this for eDP panels. Most eDP panels support a variety of bits per
> > pixel and do so dynamically. Ones I've poked at freely support 6bpp
> > and 8bpp. Presumably this one supports both of those modes and also
> > 10bpp. I haven't done detailed research on it, but it would also
> > surprise me if the "bus format" for a given bpp needed to be specified
> > for eDP. Presumably since eDP has most of the "autodetect" type
> > features of DP then if the format needed to be accounted for that you
> > could query the hardware?
> >
> > Looking at the datasheet for the ti-sn65dsi86 MIPI-to-eDP bridge chip
> > I see that it explicitly calls out the bus formats that it supports
> > for the MIPI side but doesn't call out anything for eDP. That would
> > tend to support my belief that there isn't variance on the eDP side...
> >
> > Maybe the right fix is to actually change the check not to give a
> > warning for eDP panels? ...or am I misunderstanding?
>
> I have never dived into the datasheets of eDP panels so I do not know.
> The checks were added based on what we had in-tree and it is no suprise
> if they need an update or are just plain wrong.
> I expect you to be in a better position to make the call here - but we
> should not add panels that triggers warnings so either fix the warnings
> or fix the panel description.

Agreed. I'd support a patch that removes this warning for eDP panels
unless someone knows that it makes sense. I haven't been able to find
anything indicating that it does.

-Doug
