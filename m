Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D3DC6E95D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 13:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1385B10E240;
	Wed, 19 Nov 2025 12:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="iTWTuAU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BC710E5E0;
 Wed, 19 Nov 2025 12:51:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763556663; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AyRIM5Y8RIGa5LyOoq0ccUAqnmzs53sijHthacfrKaiSLAm9MaxJZ5oRJSI52Zc0jAQq2DzhM9uZW043CZztPNGRiHbPCuKIkRmfeBgaBrzIRvpPbgLVM8un06SMTnxKPWkDPYr3h0v/NZIlUMRzfDM9lGeimvaV33AnO2KbiOI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763556663;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PjuIE5XQCboZaBC3kZXhkSfHggXBEuTBZO5PYZyfkLI=; 
 b=Ct/N8eh9hNemhqXrIJKdvoisgw1Z0eA98iQMGiynN9RZdQ0MEgjFU2CS9kZCb+Cro/LxUk6AXgfjkNXG2QnydB4MKt/WjhKKlSti8yR5M6TEkRd7SfHAa34OwP1zIqVsJanOcqeD6uN2G02lxdJGIpXPqREUfQlSfyQvFs+IpC0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763556663; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=PjuIE5XQCboZaBC3kZXhkSfHggXBEuTBZO5PYZyfkLI=;
 b=iTWTuAU6cKXXC5+qEq7RmZPcbx7yn2KLD3qIr5NdhMeNoNFTO2slMNjxIcO8BYgi
 aP2NKf8/uhyI1L0zYuxbhohbtSnjqRXh0iZBXu4am5SToLWSKJi+xyiOP1R8K9Y+77b
 7PmmIrjQJX8rKaeOAenKpSMrKpkDmgdlZMF4VeNE=
Received: by mx.zohomail.com with SMTPS id 1763556660590486.6645799254244;
 Wed, 19 Nov 2025 04:51:00 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 04/10] drm/bridge: Act on the DRM color format property
Date: Wed, 19 Nov 2025 13:50:51 +0100
Message-ID: <3210678.irdbgypaU6@workhorse>
In-Reply-To: <20251119043246.GY10711@pendragon.ideasonboard.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-4-0ded72bd1b00@collabora.com>
 <20251119043246.GY10711@pendragon.ideasonboard.com>
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

On Wednesday, 19 November 2025 05:32:46 Central European Standard Time Laurent Pinchart wrote:
> On Mon, Nov 17, 2025 at 08:11:48PM +0100, Nicolas Frattaroli wrote:
> > The new DRM color format property allows userspace to request a specific
> > color format on a connector. In turn, this fills the connector state's
> > color_format member to switch color formats.
> > 
> > Make drm_bridges consider the color_format set in the connector state
> > during the atomic bridge check. Specifically, reject any output bus
> > formats that do not correspond to the requested color format.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 57 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 8f355df883d8..b7df5cbad832 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1052,6 +1052,59 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> >  	return ret;
> >  }
> >  
> > +static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_color_format fmt)
> > +{
> > +	if (bus_fmt == MEDIA_BUS_FMT_FIXED)
> > +		return true;
> > +
> > +	switch (fmt) {
> > +	case DRM_COLOR_FORMAT_NONE:
> > +	case DRM_COLOR_FORMAT_AUTO:
> > +		return true;
> > +	case DRM_COLOR_FORMAT_RGB444:
> > +		switch (bus_fmt) {
> > +		case MEDIA_BUS_FMT_RGB888_1X24:
> > +		case MEDIA_BUS_FMT_RGB101010_1X30:
> > +		case MEDIA_BUS_FMT_RGB121212_1X36:
> > +		case MEDIA_BUS_FMT_RGB161616_1X48:
> > +			return true;
> > +		default:
> > +			return false;
> > +		}
> > +	case DRM_COLOR_FORMAT_YCBCR444:
> > +		switch (bus_fmt) {
> > +		case MEDIA_BUS_FMT_YUV8_1X24:
> > +		case MEDIA_BUS_FMT_YUV10_1X30:
> > +		case MEDIA_BUS_FMT_YUV12_1X36:
> > +		case MEDIA_BUS_FMT_YUV16_1X48:
> > +			return true;
> > +		default:
> > +			return false;
> > +		}
> > +	case DRM_COLOR_FORMAT_YCBCR422:
> > +		switch (bus_fmt) {
> > +		case MEDIA_BUS_FMT_UYVY8_1X16:
> > +		case MEDIA_BUS_FMT_UYVY10_1X20:
> > +		case MEDIA_BUS_FMT_UYVY12_1X24:
> > +			return true;
> > +		default:
> > +			return false;
> > +		}
> > +	case DRM_COLOR_FORMAT_YCBCR420:
> > +		switch (bus_fmt) {
> > +		case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > +		case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > +		case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > +		case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > +			return true;
> > +		default:
> > +			return false;
> > +		}
> > +	}
> 
> I'd find this more readable:
> 
> 	if (fmt == DRM_COLOR_FORMAT_NONE || fmt == DRM_COLOR_FORMAT_AUTO)
> 		return true;
> 
> 	switch (bus_fmt) {
> 	case MEDIA_BUS_FMT_RGB888_1X24:
> 	case MEDIA_BUS_FMT_RGB101010_1X30:
> 	case MEDIA_BUS_FMT_RGB121212_1X36:
> 	case MEDIA_BUS_FMT_RGB161616_1X48:
> 		return fmt == DRM_COLOR_FORMAT_RGB444:
> 
> 	case MEDIA_BUS_FMT_YUV8_1X24:
> 	case MEDIA_BUS_FMT_YUV10_1X30:
> 	case MEDIA_BUS_FMT_YUV12_1X36:
> 	case MEDIA_BUS_FMT_YUV16_1X48:
> 		return fmt == DRM_COLOR_FORMAT_YCBCR444;
> 
> 	case MEDIA_BUS_FMT_UYVY8_1X16:
> 	case MEDIA_BUS_FMT_UYVY10_1X20:
> 	case MEDIA_BUS_FMT_UYVY12_1X24:
> 		return fmt == DRM_COLOR_FORMAT_YCBCR422;
> 
> 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> 	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> 	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> 	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> 		return fmt == DRM_COLOR_FORMAT_YCBCR420;
> 
> 	default:
> 		return false;
> 	}
> 
> but it could be a matter for personal preference ?

I agree, that is nicer.

> 
> I'm also a bit concerned about the 
> 
> 	if (fmt == DRM_COLOR_FORMAT_NONE || fmt == DRM_COLOR_FORMAT_AUTO)
> 
> test. What's the difference between NONE and AUTO ? Is it meaningful, or
> should the two enumerators be merged into a single one ?

I've noticed that as well but didn't act on it before sending out v4.
I think we should try to make them the same yes. I don't see a valid
reason why anything would ever set "NONE" when it means "AUTO". If
there is a non-AUTO "NONE" case to describe an invalid format, then
this code is wrong anyways. I'll do some digging.

> > +
> > +	return false;
> > +}
> > +
> >  /*
> >   * This function is called by &drm_atomic_bridge_chain_check() just before
> >   * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> > @@ -1137,6 +1190,10 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> >  	}
> >  
> >  	for (i = 0; i < num_out_bus_fmts; i++) {
> > +		if (!bus_format_is_color_fmt(out_bus_fmts[i], conn_state->color_format)) {
> > +			ret = -ENOTSUPP;
> > +			continue;
> > +		}
> >  		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
> >  					       conn_state, out_bus_fmts[i]);
> >  		if (ret != -ENOTSUPP)
> 
> 




