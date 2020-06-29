Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90EF20CD56
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 10:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7A16E17C;
	Mon, 29 Jun 2020 08:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7469E6E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:34:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o11so15620680wrv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=m1iLBqzd5JET/4+7q0bkqySBB/VEXvt/QPf9pQZxD4I=;
 b=ioALFefxtWjpUGVv9aHBdWR6XYQ5mUGOiLyBKcCwX93YpoWp3xtVYvb6n6RB2S8Ckz
 u3QFELzJpaqBiFOqrnUVJ2Wq7mtXuxbjmoKGKF4tV6Wn0jSwpXHOXITn+H14U5jKSdGf
 DiIL0Vq9MDiO8em2RGk+86Hl1UFagXnZvgL9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=m1iLBqzd5JET/4+7q0bkqySBB/VEXvt/QPf9pQZxD4I=;
 b=cmqQJXSqELQ7Gqxs7NKX84cFYr3zxcad/wNlN078S4LvMB7d3K8n4s4E/9J71r3era
 0Q68D5zvrHIdPE2KmFkB8O2jFXPK/CHUxgVCGDGdO7srDnUOsuO0KSbGU/ww3CAUh2CW
 sg2ggKcNIjmVRoO2M5f5nGiVT/thSHoUqKO4WzqNeWVDgyA+GowCg9d+LYmbRLds8cC3
 u+X9dmgwbT8Mt/EhXEF0+l05bpbPMpjlFCsl+uBGSCygBdh2OLcKdqvj+n5IPFDNSq0m
 Ak6GK4W4Ps7YCUuGbBx0MXnkmDEJPcxibJ/zs2qvKGJdCqsr4UZ1ZpCeHTKWGr2z3ALN
 BeeA==
X-Gm-Message-State: AOAM533nt4hZ/veQF4baPPqeAQg5HdWLbPveOXARGp35VYneNKqVXeVq
 B0KqqQ9r8Ky2EmNlTj4rs24sgPI8Oxs=
X-Google-Smtp-Source: ABdhPJxoly9GEBebPkgfgZdpyDBicJrcaP5lLqpFp2lEkUI/aykgWwPjNusQB+uOOnfme7Z0sEXChg==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr15246966wrp.234.1593419641020; 
 Mon, 29 Jun 2020 01:34:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y20sm4657035wmi.8.2020.06.29.01.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:34:00 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:33:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Antonio Borneo <antonio.borneo@st.com>
Subject: Re: [PATCH] drm/connector: fix minor typos in comments
Message-ID: <20200629083358.GK3278063@phenom.ffwll.local>
Mail-Followup-To: Antonio Borneo <antonio.borneo@st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200626204252.44565-1-antonio.borneo@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626204252.44565-1-antonio.borneo@st.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 10:42:52PM +0200, Antonio Borneo wrote:
> Some of these comments are part of the Linux GPU Driver Developer's
> Guide.
> Fix some minor typo in the comments and remove a repeated 'the'.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>

Queued up for 5.9 in drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_connector.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d877ddc6dc57..cb62fb8e594e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -38,7 +38,7 @@
>   * DOC: overview
>   *
>   * In DRM connectors are the general abstraction for display sinks, and include
> - * als fixed panels or anything else that can display pixels in some form. As
> + * also fixed panels or anything else that can display pixels in some form. As
>   * opposed to all other KMS objects representing hardware (like CRTC, encoder or
>   * plane abstractions) connectors can be hotplugged and unplugged at runtime.
>   * Hence they are reference-counted using drm_connector_get() and
> @@ -129,7 +129,7 @@ EXPORT_SYMBOL(drm_get_connector_type_name);
>  
>  /**
>   * drm_connector_get_cmdline_mode - reads the user's cmdline mode
> - * @connector: connector to quwery
> + * @connector: connector to query
>   *
>   * The kernel supports per-connector configuration of its consoles through
>   * use of the video= parameter. This function parses that option and
> @@ -991,7 +991,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   * 	DP MST sinks), or high-res integrated panels (like dual-link DSI) which
>   * 	are not gen-locked. Note that for tiled panels which are genlocked, like
>   * 	dual-link LVDS or dual-link DSI, the driver should try to not expose the
> - * 	tiling and virtualize both &drm_crtc and &drm_plane if needed. Drivers
> + * 	tiling and virtualise both &drm_crtc and &drm_plane if needed. Drivers
>   * 	should update this value using drm_connector_set_tile_property().
>   * 	Userspace cannot change this property.
>   * link-status:
> @@ -1131,7 +1131,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *
>   *	It will even need to do colorspace conversion and get all layers
>   *	to one common colorspace for blending. It can use either GL, Media
> - *	or display engine to get this done based on the capabilties of the
> + *	or display engine to get this done based on the capabilities of the
>   *	associated hardware.
>   *
>   *	Driver expects metadata to be put in &struct hdr_output_metadata
> @@ -1614,7 +1614,7 @@ EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
>   * variable refresh rate capability for a connector.
>   *
>   * Returns:
> - * Zero on success, negative errono on failure.
> + * Zero on success, negative errno on failure.
>   */
>  int drm_connector_attach_vrr_capable_property(
>  	struct drm_connector *connector)
> @@ -1759,7 +1759,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>   * HDMI connectors.
>   *
>   * Returns:
> - * Zero on success, negative errono on failure.
> + * Zero on success, negative errno on failure.
>   */
>  int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
>  {
> @@ -1788,7 +1788,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>   * DP connectors.
>   *
>   * Returns:
> - * Zero on success, negative errono on failure.
> + * Zero on success, negative errno on failure.
>   */
>  int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
>  {
> @@ -1840,7 +1840,7 @@ EXPORT_SYMBOL(drm_mode_create_content_type_property);
>   * drm_mode_create_suggested_offset_properties - create suggests offset properties
>   * @dev: DRM device
>   *
> - * Create the the suggested x/y offset property for connectors.
> + * Create the suggested x/y offset property for connectors.
>   */
>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev)
>  {
> @@ -1963,7 +1963,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  		size = EDID_LENGTH * (1 + edid->extensions);
>  
>  	/* Set the display info, using edid if available, otherwise
> -	 * reseting the values to defaults. This duplicates the work
> +	 * resetting the values to defaults. This duplicates the work
>  	 * done in drm_add_edid_modes, but that function is not
>  	 * consistently called before this one in all drivers and the
>  	 * computation is cheap enough that it seems better to
> @@ -2076,7 +2076,7 @@ void drm_connector_set_vrr_capable_property(
>  EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>  
>  /**
> - * drm_connector_set_panel_orientation - sets the connecter's panel_orientation
> + * drm_connector_set_panel_orientation - sets the connector's panel_orientation
>   * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   *
> @@ -2131,7 +2131,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>  
>  /**
>   * drm_connector_set_panel_orientation_with_quirk -
> - *	set the connecter's panel_orientation after checking for quirks
> + *	set the connector's panel_orientation after checking for quirks
>   * @connector: connector for which to init the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   * @width: width in pixels of the panel, used for panel quirk detection
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
