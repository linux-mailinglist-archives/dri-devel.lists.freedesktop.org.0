Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B08218FE0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 20:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD476E916;
	Wed,  8 Jul 2020 18:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140F6E915
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594234024;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9pqKjGAJ1Dyw4JqOTzfkM6CMs7zc3q3vFrnjkTR0Ok=;
 b=AMieHLx4MUeHwy8wt/8gRjf06te3/5XYtX1d35mNIV306dCb+b/7sgN5aRYMsPgc3JWAbr
 490R1jxDrehJ5LL+Mmpl2dS0s2b+B6OCbqcj0sEM8KBDuUx45F089WQB8QpnrZw1LOrVVy
 RD7yMhNTfkWk4/XMZUOu0oeEbCgoqh8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-X6YFuSl_Nlqx8kKOEJxagg-1; Wed, 08 Jul 2020 14:46:58 -0400
X-MC-Unique: X6YFuSl_Nlqx8kKOEJxagg-1
Received: by mail-qt1-f198.google.com with SMTP id h30so33757302qtb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 11:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=N9pqKjGAJ1Dyw4JqOTzfkM6CMs7zc3q3vFrnjkTR0Ok=;
 b=T9HyXdTeyS68w1UZu6F4LGZpdgvlMDlAlhqeXTo4KbtUMr6F9+ZXsBfkfFltFt2QJq
 BxmetG6PQLEFfUMtU+dsGBGnG9ie9WBW+vs4/IyMsBdqB9Tw5nH0o7tfNhWL/KGTy+Mu
 0NZ7A4caLLFdqy4375173tMBSfiMbQ2P3DjmCtmFu9D41p+jPUMyca5cw4Ioi9wAnM/v
 BNmowT2Ojfez6ibZc8qVN/TcKMt4BfsZWdjUWqO1mexxgOJH8ZsoYsNtkkE9CEWabxZj
 0uTCmvzuUlD0aOx7gvljcyI/Qwxy5XM4g/YStQ1sA2JrE0Zu/cXKjbcC+A9IRY+dFLgr
 UwUg==
X-Gm-Message-State: AOAM532gciD9XrWXAgbAacKCGkvyS60uHsTccOaifhbHGw6K9BBp7J/j
 MNwUvUTymUUW1JYOkcEIH9ZJHAYAvxElY2W6pMKGxAALY3by9zwEmWxH9mBNlxyV98wRLjTd4Io
 P+yd/BCDPdQS/OtFyFz7W/iD55s0C
X-Received: by 2002:a37:af82:: with SMTP id
 y124mr58996941qke.254.1594234017660; 
 Wed, 08 Jul 2020 11:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6uKIgYaUvse4KRV1MJ7utE9PqjWWMO3PAzRaKWQJrW2fLUkiWTy9VBt7KMuiKp8R0qux/wg==
X-Received: by 2002:a37:af82:: with SMTP id
 y124mr58996901qke.254.1594234017150; 
 Wed, 08 Jul 2020 11:46:57 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id o20sm637191qtk.56.2020.07.08.11.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 11:46:56 -0700 (PDT)
Message-ID: <1b6c5646a4bd7810386163e4b6f1c5f3f1ac122b.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/probe_helper: Add
 drm_connector_helper_funcs.mode_valid_ctx
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com
Date: Wed, 08 Jul 2020 14:46:55 -0400
In-Reply-To: <20200708184521.GC21536@ideak-desk.fi.intel.com>
References: <20200526182313.4005-1-lyude@redhat.com>
 <20200526182313.4005-2-lyude@redhat.com>
 <20200707224036.GA22747@ideak-desk.fi.intel.com>
 <b8d176ed8838ea0d63b794f5fd5d54b71afc0d69.camel@redhat.com>
 <20200708184521.GC21536@ideak-desk.fi.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Shawn C <shawn.c.lee@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-07-08 at 21:45 +0300, Imre Deak wrote:
> On Wed, Jul 08, 2020 at 01:25:14PM -0400, Lyude Paul wrote:
> > JFYI - found an issue with this patch that wouldn't have shown up on i915,
> > info
> > down below: 
> > 
> > On Wed, 2020-07-08 at 01:40 +0300, Imre Deak wrote:
> > > Sorry for the delay, the review as I promised:
> > > 
> > > On Tue, May 26, 2020 at 02:23:09PM -0400, Lyude Paul wrote:
> > > > This is just an atomic version of mode_valid, which is intended to be
> > > > used for situations where a driver might need to check the atomic state
> > > > of objects other than the connector itself. One such example is with
> > > > MST, where the maximum possible bandwidth on a connector can change
> > > > dynamically irregardless of the display configuration.
> > > > 
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > Cc: Lee Shawn C <shawn.c.lee@intel.com>
> > > > Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_crtc_helper_internal.h |  6 +-
> > > >  drivers/gpu/drm/drm_probe_helper.c         | 65 ++++++++++++++--------
> > > >  include/drm/drm_modeset_helper_vtables.h   | 41 ++++++++++++++
> > > >  3 files changed, 88 insertions(+), 24 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h
> > > > b/drivers/gpu/drm/drm_crtc_helper_internal.h
> > > > index f0a66ef47e5ad..ca767cba6094d 100644
> > > > --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> > > > +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> > > > @@ -73,8 +73,10 @@ enum drm_mode_status drm_crtc_mode_valid(struct
> > > > drm_crtc
> > > > *crtc,
> > > >  					 const struct drm_display_mode
> > > > *mode);
> > > >  enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder
> > > > *encoder,
> > > >  					    const struct
> > > > drm_display_mode
> > > > *mode);
> > > > -enum drm_mode_status drm_connector_mode_valid(struct drm_connector
> > > > *connector,
> > > > -					      struct drm_display_mode
> > > > *mode);
> > > > +enum drm_mode_status
> > > > +drm_connector_mode_valid(struct drm_connector *connector,
> > > > +			 struct drm_display_mode *mode,
> > > > +			 struct drm_modeset_acquire_ctx *ctx);
> > > >  
> > > >  struct drm_encoder *
> > > >  drm_connector_get_single_encoder(struct drm_connector *connector);
> > > > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > > > b/drivers/gpu/drm/drm_probe_helper.c
> > > > index 466dfbba82564..3132784736841 100644
> > > > --- a/drivers/gpu/drm/drm_probe_helper.c
> > > > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > > > @@ -86,16 +86,17 @@ drm_mode_validate_flag(const struct drm_display_mode
> > > > *mode,
> > > >  	return MODE_OK;
> > > >  }
> > > >  
> > > > -static enum drm_mode_status
> > > > +static int
> > > >  drm_mode_validate_pipeline(struct drm_display_mode *mode,
> > > > -			    struct drm_connector *connector)
> > > > +			   struct drm_connector *connector,
> > > > +			   struct drm_modeset_acquire_ctx *ctx)
> > > >  {
> > > >  	struct drm_device *dev = connector->dev;
> > > > -	enum drm_mode_status ret = MODE_OK;
> > > >  	struct drm_encoder *encoder;
> > > > +	int ret = MODE_OK;
> > > >  
> > > >  	/* Step 1: Validate against connector */
> > > > -	ret = drm_connector_mode_valid(connector, mode);
> > > > +	ret = drm_connector_mode_valid(connector, mode, ctx);
> > > >  	if (ret != MODE_OK)
> > > >  		return ret;
> > > >  
> > > > @@ -196,16 +197,23 @@ enum drm_mode_status drm_encoder_mode_valid(struct
> > > > drm_encoder *encoder,
> > > >  	return encoder_funcs->mode_valid(encoder, mode);
> > > >  }
> > > >  
> > > > -enum drm_mode_status drm_connector_mode_valid(struct drm_connector
> > > > *connector,
> > > > -					      struct drm_display_mode
> > > > *mode)
> > > > +int
> > > > +drm_connector_mode_valid(struct drm_connector *connector,
> > > > +			 struct drm_display_mode *mode,
> > > > +			 struct drm_modeset_acquire_ctx *ctx)
> > > >  {
> > > >  	const struct drm_connector_helper_funcs *connector_funcs =
> > > >  		connector->helper_private;
> > > >  
> > > > -	if (!connector_funcs || !connector_funcs->mode_valid)
> > > > +	if (!connector_funcs)
> > > >  		return MODE_OK;
> > > >  
> > > > -	return connector_funcs->mode_valid(connector, mode);
> > > > +	if (connector_funcs->mode_valid_ctx)
> > > > +		return connector_funcs->mode_valid_ctx(connector, mode,
> > > > ctx);
> > > > +	else if (connector_funcs->mode_valid)
> > > > +		return connector_funcs->mode_valid(connector, mode);
> > > > +	else
> > > > +		return MODE_OK;
> > > >  }
> > > >  
> > > >  #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
> > > > @@ -375,8 +383,9 @@ EXPORT_SYMBOL(drm_helper_probe_detect);
> > > >   *      (if specified)
> > > >   *    - drm_mode_validate_flag() checks the modes against basic
> > > > connector
> > > >   *      capabilities
> > > > (interlace_allowed,doublescan_allowed,stereo_allowed)
> > > > - *    - the optional &drm_connector_helper_funcs.mode_valid helper can
> > > > perform
> > > > - *      driver and/or sink specific checks
> > > > + *    - the optional &drm_connector_helper_funcs.mode_valid or
> > > > + *      &drm_connector_helper_funcs.mode_valid_ctx helpers can perform
> > > > driver
> > > > + *      and/or sink specific checks
> > > >   *    - the optional &drm_crtc_helper_funcs.mode_valid,
> > > >   *      &drm_bridge_funcs.mode_valid and
> > > > &drm_encoder_helper_funcs.mode_valid
> > > >   *      helpers can perform driver and/or source specific checks which
> > > > are
> > > > also
> > > > @@ -507,22 +516,34 @@ int drm_helper_probe_single_connector_modes(struct
> > > > drm_connector *connector,
> > > >  		mode_flags |= DRM_MODE_FLAG_3D_MASK;
> > > >  
> > > >  	list_for_each_entry(mode, &connector->modes, head) {
> > > > -		if (mode->status == MODE_OK)
> > > > -			mode->status = drm_mode_validate_driver(dev,
> > > > mode);
> > > > +		if (mode->status != MODE_OK)
> > > > +			continue;
> > > > +
> > > > +		mode->status = drm_mode_validate_driver(dev, mode);
> > > > +		if (mode->status != MODE_OK)
> > > > +			continue;
> > > >  
> > > > -		if (mode->status == MODE_OK)
> > > > -			mode->status = drm_mode_validate_size(mode,
> > > > maxX, maxY);
> > > > +		mode->status = drm_mode_validate_size(mode, maxX, maxY);
> > > > +		if (mode->status != MODE_OK)
> > > > +			continue;
> > > >  
> > > > -		if (mode->status == MODE_OK)
> > > > -			mode->status = drm_mode_validate_flag(mode,
> > > > mode_flags);
> > > > +		mode->status = drm_mode_validate_flag(mode, mode_flags);
> > > > +		if (mode->status != MODE_OK)
> > > > +			continue;
> > > >  
> > > > -		if (mode->status == MODE_OK)
> > > > -			mode->status = drm_mode_validate_pipeline(mode,
> > > > -								  connec
> > > > tor);
> > > > +		ret = drm_mode_validate_pipeline(mode, connector, &ctx);
> > > > +		if (ret == -EDEADLK) {
> > > > +			drm_modeset_backoff(&ctx);
> > > > +			goto retry;
> > > > +		} else if (WARN_ON_ONCE(ret < 0)) {
> > > > +			mode->status = MODE_BAD;
> > 
> > This check is wrong actually. We define negative values for drm_mode_status
> > (MODE_BAD, MODE_ERROR, MODE_STALE) which, at least with how drivers
> > currently
> > seem to use them, are something we want to treat as not-unexpected errors
> > and
> > not WARN_ON.
> 
> Ah, yes, missed that.
> 
> > This is a bit annoying because it does mean there's some overlap between
> > drm_mode_status and some legitimate errno values (EPERM, ENOENT, ESRCH).
> > Luckily
> > I can't see any reason why drivers would want to return those, but I think
> > we
> > should probably print a debugging message when we get any errno values just
> > so
> > developers don't get confused (also going to add a IS_ERR() equivalent for
> > drm_mode_status, but with a different name)
> 
> Maybe I'm missing something, but having negative values in
> drm_mode_status doesn't make sense to me, as all the non-zero values
> there just mean the mode is incorrect for some reason and should be
> pruned.
> 
> Would it make sense to better separate the mode-status value and any
> error return value from mode_valid_ctx(), by adding a drm_mode_status *
> parameter to the hook and drm_mode_validate_pipeline()?

yeah-that would probably make more sense. I will go ahead and do that
> 
> > > > +		} else {
> > > > +			mode->status = ret;
> > > > +		}
> > > >  
> > > > -		if (mode->status == MODE_OK)
> > > > -			mode->status = drm_mode_validate_ycbcr420(mode,
> > > > -								  connec
> > > > tor);
> > > > +		if (mode->status != MODE_OK)
> > > > +			continue;
> > > > +		mode->status = drm_mode_validate_ycbcr420(mode,
> > > > connector);
> > > >  	}
> > > >  
> > > >  prune:
> > > > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > > > b/include/drm/drm_modeset_helper_vtables.h
> > > > index 421a30f084631..8f020c3424b2b 100644
> > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > @@ -968,6 +968,47 @@ struct drm_connector_helper_funcs {
> > > >  	 */
> > > >  	enum drm_mode_status (*mode_valid)(struct drm_connector
> > > > *connector,
> > > >  					   struct drm_display_mode
> > > > *mode);
> > > > +
> > > > +	/**
> > > > +	 * @mode_valid_ctx:
> > > > +	 *
> > > > +	 * Callback to validate a mode for a connector, irrespective of
> > > > the
> > > > +	 * specific display configuration.
> > > > +	 *
> > > > +	 * This callback is used by the probe helpers to filter the mode
> > > > list
> > > > +	 * (which is usually derived from the EDID data block from the
> > > > sink).
> > > > +	 * See e.g. drm_helper_probe_single_connector_modes().
> > > > +	 *
> > > > +	 * This function is optional, and is the atomic version of
> > > > +	 * &drm_connector_funcs.mode_valid.
> > > > +	 *
> > > > +	 * To allow for accessing the atomic state of modesetting
> > > > objects, the
> > > > +	 * helper libraries always call this with ctx set to a valid
> > > > context,
> > > > +	 * and &drm_mode_config.connection_mutex will always be locked
> > > > with
> > > > +	 * the ctx parameter set to @ctx. This allows for taking
> > > > additional
> > > > +	 * locks as required.
> > > > +	 *
> > > > +	 * Even though additional locks may be acquired, this callback
> > > > is
> > > > +	 * still expected not to take any constraints into account which
> > > > would
> > > > +	 * be influenced by the currently set display state - such
> > > > constraints
> > > > +	 * should be handled in the driver's atomic check. For example,
> > > > if a
> > > > +	 * connector shares display bandwidth with other connectors then
> > > > it
> > > > +	 * would be ok to validate a mode uses against the maximum
> > > > possible
> > >                                      ^mode against?
> > > 
> > > Reviewed-by: Imre Deak <imre.deak@intel.com>
> > > 
> > > > +	 * bandwidth of the connector. But it wouldn't be ok to take the
> > > > +	 * current bandwidth usage of other connectors into account, as
> > > > this
> > > > +	 * would change depending on the display state.
> > > > +	 *
> > > > +	 * Returns:
> > > > +	 *
> > > > +	 * Either &drm_mode_status.MODE_OK, one of the failure reasons
> > > > in
> > > > +	 * &enum drm_mode_status, or -EDEADLK if a deadlock would have
> > > > +	 * occurred and we need to backoff.
> > > > +	 *
> > > > +	 */
> > > > +	int (*mode_valid_ctx)(struct drm_connector *connector,
> > > > +			      struct drm_display_mode *mode,
> > > > +			      struct drm_modeset_acquire_ctx *ctx);
> > > > +
> > > >  	/**
> > > >  	 * @best_encoder:
> > > >  	 *
> > > > -- 
> > > > 2.26.2
> > > > 
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
