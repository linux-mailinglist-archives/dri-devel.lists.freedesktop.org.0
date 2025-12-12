Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2FECB8FCB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 15:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310FF10E7FD;
	Fri, 12 Dec 2025 14:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="WEURroe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D494510E248;
 Fri, 12 Dec 2025 14:45:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765550718; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mLYsCPIEoEc8Cr72RwqmUED2y0IXBvLk3iq9bbiio6n2klgz6hEBIjz3kpqd7wHuZ1YcxGGeQqUFqba6E2wOQcQ0M8Rgk4paK7ECbcW9QBMJ4ywUee3U/WxHzRfjNuGcJ79pi5vf6nZKpSzvCn6BsHTi2aBvt3oAH3vjdPB/cy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765550718;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yLCbjxHd3JePZY9d0bk2dJVpott5rtOluFwDLG0JMHY=; 
 b=Pw0qhXc+MK5uCnO8utL49AHHfFeDH/mN7oFHwYjWNA8NY/s7/oDtaJdZhYdFEm65T3KtvOf2afds8WXu2hEEGVBeFfzk8XYskr5oPbgxuX54KM0JJp9Y3Z/21IbOO8AVLW0SvFZv8Ye0ad2TOM5S4kI5IZ0drHpvh8MDFJUnyvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765550718; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=yLCbjxHd3JePZY9d0bk2dJVpott5rtOluFwDLG0JMHY=;
 b=WEURroe4KzFmp3qtxUJtYQ2//qLd5ebc0POtVGlpLyhvI+2Ddi4KiJCUnFY8q9Me
 Ge2SGeJTmZkER1OsM1YUb2VMBkAN4a829RqFOmBWG/WYSSOu97vwoWQ7oURVV1Yqg2Q
 ousABi9E/4SBqBnjXpfnbZSmw3bsoWCXUFHXAw4Q=
Received: by mx.zohomail.com with SMTPS id 17655507158241002.007523871685;
 Fri, 12 Dec 2025 06:45:15 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 04/17] drm/bridge: Act on the DRM color format property
Date: Fri, 12 Dec 2025 15:45:05 +0100
Message-ID: <2747638.atdPhlSkOF@workhorse>
In-Reply-To: <20251212-hidden-armored-mule-66dd32@penduick>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <3772903.e9J7NaK4W3@workhorse> <20251212-hidden-armored-mule-66dd32@penduick>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, 12 December 2025 10:50:26 Central European Standard Time Maxime Ripard wrote:
> On Thu, Dec 11, 2025 at 08:34:22PM +0100, Nicolas Frattaroli wrote:
> > On Tuesday, 9 December 2025 15:27:28 Central European Standard Time Maxime Ripard wrote:
> > > On Fri, Nov 28, 2025 at 10:05:40PM +0100, Nicolas Frattaroli wrote:
> > > > The new DRM color format property allows userspace to request a specific
> > > > color format on a connector. In turn, this fills the connector state's
> > > > color_format member to switch color formats.
> > > > 
> > > > Make drm_bridges consider the color_format set in the connector state
> > > > during the atomic bridge check. Specifically, reject any output bus
> > > > formats that do not correspond to the requested color format.
> > > > 
> > > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_bridge.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 45 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > > index 8f355df883d8..8aac9747f35e 100644
> > > > --- a/drivers/gpu/drm/drm_bridge.c
> > > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > > @@ -1052,6 +1052,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> > > >  	return ret;
> > > >  }
> > > >  
> > > > +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_color_format fmt)
> > > > +{
> > > > +	if (fmt == DRM_COLOR_FORMAT_AUTO)
> > > > +		return true;
> > > > +
> > > > +	switch (bus_fmt) {
> > > > +	case MEDIA_BUS_FMT_FIXED:
> > > > +		return true;
> > > > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > > > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > > > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > > > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > > > +		return fmt == DRM_COLOR_FORMAT_RGB444;
> > > > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > > > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > > > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > > > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > > > +		return fmt == DRM_COLOR_FORMAT_YCBCR444;
> > > > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > > > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > > > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > > > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > > > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > > > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > > > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > > > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > > > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > > > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > > > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > > > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > > > +		return fmt == DRM_COLOR_FORMAT_YCBCR422;
> > > > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > > > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > > > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > > > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > > > +		return fmt == DRM_COLOR_FORMAT_YCBCR420;
> > > > +	default:
> > > > +		return false;
> > > > +	}
> > > > +}
> > > > +
> > > >  /*
> > > >   * This function is called by &drm_atomic_bridge_chain_check() just before
> > > >   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> > > > @@ -1137,6 +1178,10 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> > > >  	}
> > > >  
> > > >  	for (i = 0; i < num_out_bus_fmts; i++) {
> > > > +		if (!bus_format_is_color_fmt(out_bus_fmts[i], conn_state->color_format)) {
> > > > +			ret = -ENOTSUPP;
> > > > +			continue;
> > > > +		}
> > > 
> > > Sorry, I'm struggling a bit to understand how this would work if a bridge both supports the bus
> > > format selection and HDMI state helpers? Can you expand on it?
> > 
> > I have very little idea of whether this makes conceptual sense.
> 
> .. I wasn't asking you if it makes sense, I was asking you to explain
> how you wanted it to work.
> 
> > The hope is that by working backwards from the last bridge and only
> > accepting either fixed formats or something that corresponds to the
> > target color format, we don't claim that a setup can do a colour
> > format if the whole bridge chain isn't able to do it.
> > 
> > Of course, format conversions along the bridge chain where one
> > input format can be converted to a set of output formats by some
> > bridge will throw a massive wrench into this. And this is all
> > assuming that the bus format is in any way related to the color
> > format that will be sent out on the wire.
> 
> I'm not really concerned about this. As we move more and more bridges to
> the state helpers, we can always fix it, but it needs at the very least
> to document how you envision the whole thing to work, and ideally have
> bunch of tests to make sure it still does.

Where should I document the intended behavior? A code comment here is
probably not visible to people implementing new bridge drivers, so I
imagine there's a place in the docs?

On the drm-kms docs page, I see:

  Note that currently the bridge chaining and interactions with
  connectors and panels are still in-flux and not really fully
  sorted out yet.

Which means maybe adding a sub-heading for DRM bridge there might
make sense.

For a complete solution, it should probably do a graph traversal
starting from the last bridge's output format, and then looking
to reach the first bridge output format in the chain in any way
possible over a DAG where edges connect from input formats of
the next bridge to the output formats of the previous bridge,
and the output format of each bridge connects to whichever
of its input formats can convert to this output format.

Here's a diagram of what I mean:

    .-----------------------------------.
    |       SoC Video Processor         |
    |-----------------------------------|
    | out rgb | out yuv444 | out yuv420 |
    '---------|------------|------------'
        ^
        |
    .---------|------.
    | in  rgb |      |
    |---------| MIPI |
    |    ^    | DSI  |
    |    |    | TX   |
    |---------|      |
    | out rgb |      |
    '---------|------'
        ^
        |
        '----------.
                    |
    .----------|---------|-----------|----------------------------.
    |          | in  rgb | in yuv444 |               |            |
    |----------|---------|-----------|---------------|   BOB'S    |
    |              ^   ^    ^  ^                     |  BARGAIN   |
    |              |   |    |  '--------------.      |  MIPI DSI  |
    |    .---------'   |    '----.            |      |  TO HDMI   |
    |    |          .--'         |            |      |  BRIDGE    |
    |---------|------------|------------|------------|            |
    | out rgb | out yuv444 | out yuv422 | out yuv420 |            |
    '---------|------------|------------|------------|------------'
        ^           ^            ^
        |           |            |
    .---------|------------|------------.
    | in  rgb | in  yuv444 | in  yuv422 |
    |-----------------------------------|
    |          HDMI CONNECTOR           |
    '-----------------------------------'

In this case, the MIPI DSI to HDMI bridge isn't very good so it can
only convert YUV444 to YUV422 and YUV420, despite being able to
convert RGB to YUV444 as well. The important bit is that there is
a path back from "out yuv444" on the "HDMI CONNECTOR" all the way
to the "SoC Video Processor", even though the processor's only going
to be outputting RGB. So setting color_format to yuv444 should be
possible in this case.

My current code doesn't handle this case. It only works if bridges
that convert can convert to any of their output formats regardless
of the input format. Additionally, I don't think I'd have a good
time if the SoC's video output processor sets the bus format to
"fixed", because if everyone along the chain says they can do
fixed formats then the output is going to claim it can do anything,
which isn't the case.

> 
> > In practice, I don't have any hardware where whatever counts as
> > a "bridge" is an actually more involved setup than just the TX
> > controller. I tried looking into getting a board with one of the
> > supported DSI-to-HDMI bridge chips so I can at least test how it
> > would work in such a scenario, and I got one, but I'd need to make
> > my own flat flex PCB to adapt it to the pinout of my SBC's DSI
> > port.
> > 
> > So yeah I don't know how it's supposed to work, I just know this
> > works for the case I'm working with, and any more complex case
> > is literally unobtanium hardware which I'm not going to bother
> > blowing days on maybe making a cable for when I'm already touching
> > three different GPU drivers here and the intel-gfx-ci is screaming
> > into my inbox about vague failures in unrelated codepaths in its
> > native language, Klingon.
> 
> That's uncalled for.
> 
> > Which is all to say: is there a virtual drm bridge driver that
> > exists, where I can set what formats it supports on the input
> > and on the output, so that I can actually get a feel for how this
> > is conceptually supposed to work without needing special hardware?
> 
> If your question is "do we have a way to replicate and test an arbitrary
> setup to check how it behaves?", then yes, we do, it's what we're doing
> in kunit. But you don't seem too fond of those.

Okay, I will look into virtual bridge tests in kunit.

> 
> > Better yet: do you have a specific setup in mind where you know
> > this approach does not work?
> 
> Look. I was asking a genuine question. If you want to get all defensive
> about it, go ahead. But sending a series implementing something with a
> lot of history, complex interactions, etc. and then expecting it to be a
> breeze that will get merged in a few revisions is not going to work.
> 
> Pushing back when asked to follow our documented rules, or being
> dismissive when asked design questions is not going to help you push
> this forward. If anything, and because it's complex, the more tests you
> add the better because we A) know it works in a specific set of cases,
> and B) know it will still work going forward.
> 
> I'm sure you know what you're doing, but so do we.

I worked under the assumption that the general vagueness of the
questions were part of some elaborate dt-bindings-esque hazing
ritual, and not that I was literally the first person to try and
specify how drm bridge bus format selection should work. I apologise
for my tone in light of that.

I'm not convinced unit tests that test whether a single pre-defined
mode is valid, as the existing mode_valid one does, have any value
though. I'll comply however and add another with a yuv420-only mode,
and another with a yuv420-also mode. My criticism is that in a
scenario like this where "working" vs "broken" is highly dependent
on the result based on the input data, the coverage of taken code
branches is mostly irrelevant, and the real information comes from
comprehensive testing of a wide set of inputs with attention paid
to edge cases, verifying that they match the expected outputs.

Kind regards,
Nicolas Frattaroli

> 
> Maxime
> 




