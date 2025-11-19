Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A6BC6E933
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 13:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC1D10E029;
	Wed, 19 Nov 2025 12:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bcd1jJVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D6710E029;
 Wed, 19 Nov 2025 12:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763556504; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lGobB1qzJH7GzM6uI4HVkLOh1I8pze/y3j2P/PELoKydjwc5GfaMuw/8BCAe0HLK++VNtQlqzj9efmuG5+NNKhL+gyi2ygvlZuemgfuv2Md3+wMH0dacCKqc8Lk3P9mcxSgJHo99P/1gyvd3gjqKhhWlBK59ib36dJhrviZhSBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763556504;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Uq6952CT/UldDXXHAirV2OkWzCY9Znw+41wgffkpeTY=; 
 b=if/xx65+ObdoqBB2lsNN1N4+4YNqAMP+VFa6FpQ/bGv7q6FHapta/xqEHArWftd45ruq4dSHSRNOEYJrRqGBnLDr5ideAZxu1LJn0jZWH5xltlpA8wOHXz+b55xDImQkcuPfGqVFC6Tqdq8SgHNgMqLabGBL5WgZIPmrUR0L++w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763556504; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Uq6952CT/UldDXXHAirV2OkWzCY9Znw+41wgffkpeTY=;
 b=bcd1jJVY9PbUn0eoEylRY9GWSd38DpOpFitmJI2vpk1U6RvTBVZ0FUvhhkbFBncg
 n5i1ZsU3Ehq+ls857IUCPH5VjIjU7yC61XvEHXT1vGtswiEtoKU3+thvnl86IXwRl3q
 c1Bjd+TkP3B9aOgqQMYCJqIAV2icQ3WaatJlraG0=
Received: by mx.zohomail.com with SMTPS id 1763556502200169.8816814936023;
 Wed, 19 Nov 2025 04:48:22 -0800 (PST)
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
 intel-xe@lists.freedesktop.org, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v4 03/10] drm: Add enum conversion from/to HDMI_COLORSPACE
 to DRM_COLOR_FORMAT
Date: Wed, 19 Nov 2025 13:48:13 +0100
Message-ID: <3356228.ElGaqSPkdT@workhorse>
In-Reply-To: <20251119041648.GD10711@pendragon.ideasonboard.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-3-0ded72bd1b00@collabora.com>
 <20251119041648.GD10711@pendragon.ideasonboard.com>
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

On Wednesday, 19 November 2025 05:16:48 Central European Standard Time Laurent Pinchart wrote:
> On Mon, Nov 17, 2025 at 08:11:47PM +0100, Nicolas Frattaroli wrote:
> > From: Marius Vlad <marius.vlad@collabora.com>
> > 
> > This would please the compiler to have a enum transformation from one to
> > another even though the values are the same. It should also make things
> 
> The hdmi_colorspace enumerators are defined as (with comments added to
> make the values explicit)
> 
> enum hdmi_colorspace {
> 	HDMI_COLORSPACE_RGB,			/* 0 */
> 	HDMI_COLORSPACE_YUV422,			/* 1 */
> 	HDMI_COLORSPACE_YUV444,			/* 2 */
> 	HDMI_COLORSPACE_YUV420,			/* 3 */
> 	HDMI_COLORSPACE_RESERVED4,		/* 4 */
> 	HDMI_COLORSPACE_RESERVED5,		/* 5 */
> 	HDMI_COLORSPACE_RESERVED6,		/* 6 */
> 	HDMI_COLORSPACE_IDO_DEFINED,		/* 7 */
> };
> 
> and the DRM color formats as (after patch 02/10)
> 
> enum drm_color_format {
> 	DRM_COLOR_FORMAT_NONE			= 0,		/* 0 */
> 	DRM_COLOR_FORMAT_RGB444			= (1 << 0),	/* 1 */
> 	DRM_COLOR_FORMAT_YCBCR422		= (1 << 1),	/* 2 */
> 	DRM_COLOR_FORMAT_YCBCR444		= (1 << 2),	/* 4 */
> 	DRM_COLOR_FORMAT_YCBCR420		= (1 << 3),	/* 8 */
> 	/* auto case, driver will set the color_format */
> 	DRM_COLOR_FORMAT_AUTO			= (1 << 4),	/* 16 */
> };
> 
> Contrary to what is stated in the commit message, the values are not the
> same. Maybe you confused DRM_COLOR_FORMAT_* with DRM_MODE_COLOR_FORMAT_*
> ?

It's possible the equality got lost during my refactor, but I think
the needless enum conversions between like 4 different things should
be minimised anyway, so I'll look into getting rid of as much of this
as possible.

> 
> > obvious that we use different enums.
> > 
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 18 ++++++++++++++++++
> >  include/drm/drm_connector.h     |  3 +++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 0ad7be0a2d09..61c077b67ac3 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1384,6 +1384,24 @@ drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum)
> >  	}
> >  }
> >  
> > +enum hdmi_colorspace
> > +color_format_to_hdmi_colorspace(enum drm_color_format fmt)
> > +{
> > +	switch (fmt) {
> > +	default:
> > +	case DRM_COLOR_FORMAT_AUTO:
> > +	case DRM_COLOR_FORMAT_RGB444:
> > +		return HDMI_COLORSPACE_RGB;
> > +	case DRM_COLOR_FORMAT_YCBCR444:
> > +		return HDMI_COLORSPACE_YUV444;
> > +	case DRM_COLOR_FORMAT_YCBCR422:
> > +		return HDMI_COLORSPACE_YUV422;
> > +	case DRM_COLOR_FORMAT_YCBCR420:
> > +		return HDMI_COLORSPACE_YUV420;
> > +	}
> > +}
> > +EXPORT_SYMBOL(color_format_to_hdmi_colorspace);
> > +
> >  /**
> >   * drm_get_color_format_name - return a string for color format
> >   * @colorspace: color format to compute name of
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index a071079fd3ad..e044976c8d76 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -2586,6 +2586,9 @@ drm_color_format_to_color_format_enum(enum drm_color_format fmt);
> >  u32
> >  drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum);
> >  
> > +enum hdmi_colorspace
> > +color_format_to_hdmi_colorspace(enum drm_color_format fmt);
> > +
> >  /**
> >   * drm_for_each_connector_iter - connector_list iterator macro
> >   * @connector: &struct drm_connector pointer used as cursor
> 
> 




