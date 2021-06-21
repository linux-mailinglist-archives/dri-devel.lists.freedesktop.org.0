Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE03AF546
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434396E3CE;
	Mon, 21 Jun 2021 18:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2E36E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:42:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 6585b9ef-d2c0-11eb-a36f-0050568cd888;
 Mon, 21 Jun 2021 18:42:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 95A4D194B7E;
 Mon, 21 Jun 2021 20:42:03 +0200 (CEST)
Date: Mon, 21 Jun 2021 20:41:57 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [v7 5/5] drm/panel-simple: Add Samsung ATNA33XC20
Message-ID: <20210621184157.GB918146@ravnborg.org>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-6-git-send-email-rajeevny@codeaurora.org>
 <20210620100147.GB703072@ravnborg.org>
 <CAD=FV=VP8hLHtpZ8F5KVGWoKiJBxyQVufg7V9A2CC0rwcAX-aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VP8hLHtpZ8F5KVGWoKiJBxyQVufg7V9A2CC0rwcAX-aw@mail.gmail.com>
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

Hi Doug,

On Mon, Jun 21, 2021 at 08:34:51AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sun, Jun 20, 2021 at 3:01 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Rajeev
> > On Sat, Jun 19, 2021 at 04:10:30PM +0530, Rajeev Nandan wrote:
> > > Add Samsung 13.3" FHD eDP AMOLED panel.
> > >
> > > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v4:
> > > - New
> > >
> > > Changes in v5:
> > > - Remove "uses_dpcd_backlight" property, not required now. (Douglas)
> > >
> > > Changes in v7:
> > > - Update disable_to_power_off and power_to_enable delays. (Douglas)
> > >
> > >  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index 86e5a45..4adc44a 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -3562,6 +3562,36 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
> > >       .connector_type = DRM_MODE_CONNECTOR_LVDS,
> > >  };
> > >
> > > +static const struct drm_display_mode samsung_atna33xc20_mode = {
> > > +     .clock = 138770,
> > > +     .hdisplay = 1920,
> > > +     .hsync_start = 1920 + 48,
> > > +     .hsync_end = 1920 + 48 + 32,
> > > +     .htotal = 1920 + 48 + 32 + 80,
> > > +     .vdisplay = 1080,
> > > +     .vsync_start = 1080 + 8,
> > > +     .vsync_end = 1080 + 8 + 8,
> > > +     .vtotal = 1080 + 8 + 8 + 16,
> > > +     .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> > > +};
> > > +
> > > +static const struct panel_desc samsung_atna33xc20 = {
> > > +     .modes = &samsung_atna33xc20_mode,
> > > +     .num_modes = 1,
> > > +     .bpc = 10,
> > > +     .size = {
> > > +             .width = 294,
> > > +             .height = 165,
> > > +     },
> > > +     .delay = {
> > > +             .disable_to_power_off = 200,
> > > +             .power_to_enable = 400,
> > > +             .hpd_absent_delay = 200,
> > > +             .unprepare = 500,
> > > +     },
> > > +     .connector_type = DRM_MODE_CONNECTOR_eDP,
> > > +};
> >
> > bus_format is missing. There should be a warning about this when you
> > probe the display.
> 
> Sam: I'm curious about the requirement of hardcoding bus_format like
> this for eDP panels. Most eDP panels support a variety of bits per
> pixel and do so dynamically. Ones I've poked at freely support 6bpp
> and 8bpp. Presumably this one supports both of those modes and also
> 10bpp. I haven't done detailed research on it, but it would also
> surprise me if the "bus format" for a given bpp needed to be specified
> for eDP. Presumably since eDP has most of the "autodetect" type
> features of DP then if the format needed to be accounted for that you
> could query the hardware?
> 
> Looking at the datasheet for the ti-sn65dsi86 MIPI-to-eDP bridge chip
> I see that it explicitly calls out the bus formats that it supports
> for the MIPI side but doesn't call out anything for eDP. That would
> tend to support my belief that there isn't variance on the eDP side...
> 
> Maybe the right fix is to actually change the check not to give a
> warning for eDP panels? ...or am I misunderstanding?

I have never dived into the datasheets of eDP panels so I do not know.
The checks were added based on what we had in-tree and it is no suprise
if they need an update or are just plain wrong.
I expect you to be in a better position to make the call here - but we
should not add panels that triggers warnings so either fix the warnings
or fix the panel description.

	Sam
