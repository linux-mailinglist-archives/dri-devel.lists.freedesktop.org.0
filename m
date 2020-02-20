Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B241669F8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5034A6EE75;
	Thu, 20 Feb 2020 21:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFB36EE75
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:37:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t83so5084033qke.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtH2MLidwl9++wyo68VivOeVZ1eKeqRlT2z3fduTibk=;
 b=r2fzHkSmmhSOpPfv60LemDTCouA+wqlfydNS58a7/9b6oAvY7dvlVy0m1X9qfp6GFO
 f8E4BulhWJ1JfqyMWvEnqCzi+E+mm+IjnNRN8kwLQaQiT9H+EvvnG/RhhzXYfJm7/1vG
 xXgnpVsIPdwy1iPX/czKlk6DJtKpuMkcby6F3bYuSSj67Xe3d2tJM+maIgbKPxiF8Rxe
 0qmU0XioEhfpkCjkSMaWNsAzW7rbkRERdPsFzUYmcbsAnXMnJZiF75GLubTl1qR6RRn0
 Rc5Bky5Lyws72PzUbnl8udHa/xLeqLCTmPnIJbo3yEXex3g6FU/60garybwdad8FNYGg
 f5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtH2MLidwl9++wyo68VivOeVZ1eKeqRlT2z3fduTibk=;
 b=GtvWXkOWNtZEuiIyV7FaSRH+FYvPA4IL5LfOCJPu+g8eqa39fHr8QqEKRw4Bnie8ZZ
 +ox6grOv4RL3gz7f/AzV2b/3T07FY+WODiXylQ+h2kBE8b82C3nqcIKlqlWzDti/zYSa
 CakTopBafC1C5EXeWX+v9/OBxZhMnUkzWFQXLnmHyM+5RM7m/F7CnZEeIX2gkje7rwsp
 KTjPV9+lesRdayPx5IGRAABUutfgZDXSCgN0oqBwDPi0gwhrtWFoydxI0GPuacKcanVG
 20sOxhyQ4JUp0yfiZmVnbQblBMDq3F1mbBZ6e53uVOYAE7GYjZIxWmK9hUAlpH7hE8VW
 WsGw==
X-Gm-Message-State: APjAAAVKVwIOZipfBC4MfZLTnFPW49mZsB6jyxW547uHx8PUxVZU5G/v
 s6Iz/myjAogwTF2GmGsz5xu87PysQ8Lqzi+r5rI=
X-Google-Smtp-Source: APXvYqzC17jJf8WSEQarDVhinql9TAMsf5KB/vSzhkgDO/I0O9wFO00fmXTLO3jktl0H/mpFHoh4KIlD6179zJYx+90=
X-Received: by 2002:a37:b285:: with SMTP id b127mr3343845qkf.413.1582234673672; 
 Thu, 20 Feb 2020 13:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-6-anarsoul@gmail.com>
 <20200220135929.GF4998@pendragon.ideasonboard.com>
In-Reply-To: <20200220135929.GF4998@pendragon.ideasonboard.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 20 Feb 2020 13:37:40 -0800
Message-ID: <CA+E=qVcNuYDHaz1WEbDqosEdwqtpte7hzL405LOw0rmraWCzWw@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/panel: simple: Add NewEast Optoelectronics CO.,
 LTD WJFH116008A panel support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 5:59 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Vasily,

Hi Laurent,

>
> Thank you for the patch.
>
> On Thu, Feb 20, 2020 at 12:35:07AM -0800, Vasily Khoruzhick wrote:
> > This commit adds support for the NewEast Optoelectronics CO., LTD
> > WJFH116008A 11.6" 1920x1080 TFT LCD panel.
> >
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 47 ++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index e14c14ac62b5..aa04afaf3d26 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2224,6 +2224,50 @@ static const struct panel_desc netron_dy_e231732 = {
> >       .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> >  };
> >
> > +static const struct drm_display_mode neweast_wjfh116008a_modes[] = {
> > +{
> > +     .clock = 138500,
> > +     .hdisplay = 1920,
> > +     .hsync_start = 1920 + 48,
> > +     .hsync_end = 1920 + 48 + 32,
> > +     .htotal = 1920 + 48 + 32 + 80,
> > +     .vdisplay = 1080,
> > +     .vsync_start = 1080 + 3,
> > +     .vsync_end = 1080 + 3 + 5,
> > +     .vtotal = 1080 + 3 + 5 + 23,
> > +     .vrefresh = 60,
> > +     .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > +}, {
> > +     .clock = 110920,
> > +     .hdisplay = 1920,
> > +     .hsync_start = 1920 + 48,
> > +     .hsync_end = 1920 + 48 + 32,
> > +     .htotal = 1920 + 48 + 32 + 80,
> > +     .vdisplay = 1080,
> > +     .vsync_start = 1080 + 3,
> > +     .vsync_end = 1080 + 3 + 5,
> > +     .vtotal = 1080 + 3 + 5 + 23,
> > +     .vrefresh = 48,
> > +     .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > +} };
>
> This should be indented one step to the right, see boe_nv101wxmn51_modes
> for instance.

Will do.

> The only different between the two modes is the clock, leading to
> different refresh rates. Are only those two clock frequencies supported,
> or does the panel support anything in-between as well ? In the latter
> case, would it make sense to use display_timing instead of
> drm_display_mode ? See dlc_dlc0700yzg_1_timing for an example.

These are coming from EDID. The datasheet [1] says typical frequency
is 138.5MHz and min/max are not specified, so I'm not sure whether it
supports anything in between. I did check that both modes work though.

[1] http://files.pine64.org/doc/datasheet/pinebook/11.6inches-1080P-IPS-LCD-Panel-spec-WJFH116008A.pdf



> > +
> > +static const struct panel_desc neweast_wjfh116008a = {
> > +     .modes = neweast_wjfh116008a_modes,
> > +     .num_modes = 2,
> > +     .bpc = 6,
> > +     .size = {
> > +             .width = 260,
> > +             .height = 150,
> > +     },
> > +     .delay = {
> > +             .prepare = 110,
> > +             .enable = 20,
> > +             .unprepare = 500,
> > +     },
> > +     .bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > +};
> > +
> >  static const struct drm_display_mode newhaven_nhd_43_480272ef_atxl_mode = {
> >       .clock = 9000,
> >       .hdisplay = 480,
> > @@ -3399,6 +3443,9 @@ static const struct of_device_id platform_of_match[] = {
> >       }, {
> >               .compatible = "netron-dy,e231732",
> >               .data = &netron_dy_e231732,
> > +     }, {
> > +             .compatible = "neweast,wjfh116008a",
> > +             .data = &neweast_wjfh116008a,
> >       }, {
> >               .compatible = "newhaven,nhd-4.3-480272ef-atxl",
> >               .data = &newhaven_nhd_43_480272ef_atxl,
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
