Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC780218E2E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 19:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAC96E8FE;
	Wed,  8 Jul 2020 17:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506896E8FE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594229127;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PCbbzVisIhr1KPzrpNlYgZylablGP1kms5umra293M=;
 b=CsOsllkGwo+OrLhtZri5ggsJ+677D8n59UnmeIaSMwLtP0O9qwCZybvKJkPFdkHzbLc4Fi
 gs2oqMrYcLHrbd9UMVO3dZWgc7eEiPEIU48DHW4ollaEiWlNpRAa2f5Xb7mU5Sw6ho6fsB
 sxuds6xy+gyvsn39zee17lkirsfCd2E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-dqdlCd33NHqPY_dgGTrJ0Q-1; Wed, 08 Jul 2020 13:25:17 -0400
X-MC-Unique: dqdlCd33NHqPY_dgGTrJ0Q-1
Received: by mail-qk1-f197.google.com with SMTP id i6so31384561qkn.22
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 10:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=8PCbbzVisIhr1KPzrpNlYgZylablGP1kms5umra293M=;
 b=JrFFt0YEyGVxx2P4IXyAjEs3DUuNKASy5Q+XqTQLF+61gzz3TH64JENN7HeBInCQBM
 sPX3lytHf2m9LmWAfiXSCzzj4far0Z+Lv8xqZmbMy+LOAoYGy9Aoiswm4mi5ik6Ek8F1
 J3hQ4U1QFFeoCiaN1i/bzEMlSD6TXfwn+Q+B+A8tnQPM7tlDsLIl0NKn6/P5wlKUqa+i
 nxGog2Zdv5/QOq1YtaS87nvBFwYQlhy7vkYQMcns2Z/0ONj/mDxymVHsSZnlQBafRZqe
 N/oivMGKvZP1DifVcuylp+u60NIR+dCXDPLN1edoZDtTFLxFL2K9ShmgBawF5jR0Q4VW
 S5SQ==
X-Gm-Message-State: AOAM530WrvLO8BhqyUAzqCW94yLbJ4ck0KVfr/uq7N5JxgeFDZIcnLbb
 eJI2FXarGiCPOctRlHveYl6MP+OJk+ZgREsxRv5k6cL9q3Oa0vBsvKc6H2E+Ug+tLGK3cXK6qR2
 8uLbQ+sehOHCjzpZCrAy7TGGMlsTQ
X-Received: by 2002:a37:9ed6:: with SMTP id
 h205mr56839327qke.384.1594229116327; 
 Wed, 08 Jul 2020 10:25:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl/XksMb0RSfvYaf4zucZwc2ys1sjnbTDpimEgAnoPLgdZ+PPqNjSFY/L+rjmqiFP0gjQoJw==
X-Received: by 2002:a37:9ed6:: with SMTP id
 h205mr56839308qke.384.1594229115992; 
 Wed, 08 Jul 2020 10:25:15 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id u27sm449611qkm.121.2020.07.08.10.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 10:25:15 -0700 (PDT)
Message-ID: <b8d176ed8838ea0d63b794f5fd5d54b71afc0d69.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/probe_helper: Add
 drm_connector_helper_funcs.mode_valid_ctx
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com
Date: Wed, 08 Jul 2020 13:25:14 -0400
In-Reply-To: <20200707224036.GA22747@ideak-desk.fi.intel.com>
References: <20200526182313.4005-1-lyude@redhat.com>
 <20200526182313.4005-2-lyude@redhat.com>
 <20200707224036.GA22747@ideak-desk.fi.intel.com>
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


JFYI - found an issue with this patch that wouldn't have shown up on i915, info
down below: 

On Wed, 2020-07-08 at 01:40 +0300, Imre Deak wrote:
> Sorry for the delay, the review as I promised:
> 
> On Tue, May 26, 2020 at 02:23:09PM -0400, Lyude Paul wrote:
> > This is just an atomic version of mode_valid, which is intended to be
> > used for situations where a driver might need to check the atomic state
> > of objects other than the connector itself. One such example is with
> > MST, where the maximum possible bandwidth on a connector can change
> > dynamically irregardless of the display configuration.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Lee Shawn C <shawn.c.lee@intel.com>
> > Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
> > ---
> >  drivers/gpu/drm/drm_crtc_helper_internal.h |  6 +-
> >  drivers/gpu/drm/drm_probe_helper.c         | 65 ++++++++++++++--------
> >  include/drm/drm_modeset_helper_vtables.h   | 41 ++++++++++++++
> >  3 files changed, 88 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h
> > b/drivers/gpu/drm/drm_crtc_helper_internal.h
> > index f0a66ef47e5ad..ca767cba6094d 100644
> > --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> > +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> > @@ -73,8 +73,10 @@ enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc
> > *crtc,
> >  					 const struct drm_display_mode *mode);
> >  enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
> >  					    const struct drm_display_mode
> > *mode);
> > -enum drm_mode_status drm_connector_mode_valid(struct drm_connector
> > *connector,
> > -					      struct drm_display_mode *mode);
> > +enum drm_mode_status
> > +drm_connector_mode_valid(struct drm_connector *connector,
> > +			 struct drm_display_mode *mode,
> > +			 struct drm_modeset_acquire_ctx *ctx);
> >  
> >  struct drm_encoder *
> >  drm_connector_get_single_encoder(struct drm_connector *connector);
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > b/drivers/gpu/drm/drm_probe_helper.c
> > index 466dfbba82564..3132784736841 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -86,16 +86,17 @@ drm_mode_validate_flag(const struct drm_display_mode
> > *mode,
> >  	return MODE_OK;
> >  }
> >  
> > -static enum drm_mode_status
> > +static int
> >  drm_mode_validate_pipeline(struct drm_display_mode *mode,
> > -			    struct drm_connector *connector)
> > +			   struct drm_connector *connector,
> > +			   struct drm_modeset_acquire_ctx *ctx)
> >  {
> >  	struct drm_device *dev = connector->dev;
> > -	enum drm_mode_status ret = MODE_OK;
> >  	struct drm_encoder *encoder;
> > +	int ret = MODE_OK;
> >  
> >  	/* Step 1: Validate against connector */
> > -	ret = drm_connector_mode_valid(connector, mode);
> > +	ret = drm_connector_mode_valid(connector, mode, ctx);
> >  	if (ret != MODE_OK)
> >  		return ret;
> >  
> > @@ -196,16 +197,23 @@ enum drm_mode_status drm_encoder_mode_valid(struct
> > drm_encoder *encoder,
> >  	return encoder_funcs->mode_valid(encoder, mode);
> >  }
> >  
> > -enum drm_mode_status drm_connector_mode_valid(struct drm_connector
> > *connector,
> > -					      struct drm_display_mode *mode)
> > +int
> > +drm_connector_mode_valid(struct drm_connector *connector,
> > +			 struct drm_display_mode *mode,
> > +			 struct drm_modeset_acquire_ctx *ctx)
> >  {
> >  	const struct drm_connector_helper_funcs *connector_funcs =
> >  		connector->helper_private;
> >  
> > -	if (!connector_funcs || !connector_funcs->mode_valid)
> > +	if (!connector_funcs)
> >  		return MODE_OK;
> >  
> > -	return connector_funcs->mode_valid(connector, mode);
> > +	if (connector_funcs->mode_valid_ctx)
> > +		return connector_funcs->mode_valid_ctx(connector, mode, ctx);
> > +	else if (connector_funcs->mode_valid)
> > +		return connector_funcs->mode_valid(connector, mode);
> > +	else
> > +		return MODE_OK;
> >  }
> >  
> >  #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
> > @@ -375,8 +383,9 @@ EXPORT_SYMBOL(drm_helper_probe_detect);
> >   *      (if specified)
> >   *    - drm_mode_validate_flag() checks the modes against basic connector
> >   *      capabilities (interlace_allowed,doublescan_allowed,stereo_allowed)
> > - *    - the optional &drm_connector_helper_funcs.mode_valid helper can
> > perform
> > - *      driver and/or sink specific checks
> > + *    - the optional &drm_connector_helper_funcs.mode_valid or
> > + *      &drm_connector_helper_funcs.mode_valid_ctx helpers can perform
> > driver
> > + *      and/or sink specific checks
> >   *    - the optional &drm_crtc_helper_funcs.mode_valid,
> >   *      &drm_bridge_funcs.mode_valid and
> > &drm_encoder_helper_funcs.mode_valid
> >   *      helpers can perform driver and/or source specific checks which are
> > also
> > @@ -507,22 +516,34 @@ int drm_helper_probe_single_connector_modes(struct
> > drm_connector *connector,
> >  		mode_flags |= DRM_MODE_FLAG_3D_MASK;
> >  
> >  	list_for_each_entry(mode, &connector->modes, head) {
> > -		if (mode->status == MODE_OK)
> > -			mode->status = drm_mode_validate_driver(dev, mode);
> > +		if (mode->status != MODE_OK)
> > +			continue;
> > +
> > +		mode->status = drm_mode_validate_driver(dev, mode);
> > +		if (mode->status != MODE_OK)
> > +			continue;
> >  
> > -		if (mode->status == MODE_OK)
> > -			mode->status = drm_mode_validate_size(mode, maxX, maxY);
> > +		mode->status = drm_mode_validate_size(mode, maxX, maxY);
> > +		if (mode->status != MODE_OK)
> > +			continue;
> >  
> > -		if (mode->status == MODE_OK)
> > -			mode->status = drm_mode_validate_flag(mode, mode_flags);
> > +		mode->status = drm_mode_validate_flag(mode, mode_flags);
> > +		if (mode->status != MODE_OK)
> > +			continue;
> >  
> > -		if (mode->status == MODE_OK)
> > -			mode->status = drm_mode_validate_pipeline(mode,
> > -								  connector);
> > +		ret = drm_mode_validate_pipeline(mode, connector, &ctx);
> > +		if (ret == -EDEADLK) {
> > +			drm_modeset_backoff(&ctx);
> > +			goto retry;
> > +		} else if (WARN_ON_ONCE(ret < 0)) {
> > +			mode->status = MODE_BAD;

This check is wrong actually. We define negative values for drm_mode_status
(MODE_BAD, MODE_ERROR, MODE_STALE) which, at least with how drivers currently
seem to use them, are something we want to treat as not-unexpected errors and
not WARN_ON.

This is a bit annoying because it does mean there's some overlap between
drm_mode_status and some legitimate errno values (EPERM, ENOENT, ESRCH). Luckily
I can't see any reason why drivers would want to return those, but I think we
should probably print a debugging message when we get any errno values just so
developers don't get confused (also going to add a IS_ERR() equivalent for
drm_mode_status, but with a different name)

> > +		} else {
> > +			mode->status = ret;
> > +		}
> >  
> > -		if (mode->status == MODE_OK)
> > -			mode->status = drm_mode_validate_ycbcr420(mode,
> > -								  connector);
> > +		if (mode->status != MODE_OK)
> > +			continue;
> > +		mode->status = drm_mode_validate_ycbcr420(mode, connector);
> >  	}
> >  
> >  prune:
> > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > b/include/drm/drm_modeset_helper_vtables.h
> > index 421a30f084631..8f020c3424b2b 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -968,6 +968,47 @@ struct drm_connector_helper_funcs {
> >  	 */
> >  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> >  					   struct drm_display_mode *mode);
> > +
> > +	/**
> > +	 * @mode_valid_ctx:
> > +	 *
> > +	 * Callback to validate a mode for a connector, irrespective of the
> > +	 * specific display configuration.
> > +	 *
> > +	 * This callback is used by the probe helpers to filter the mode list
> > +	 * (which is usually derived from the EDID data block from the sink).
> > +	 * See e.g. drm_helper_probe_single_connector_modes().
> > +	 *
> > +	 * This function is optional, and is the atomic version of
> > +	 * &drm_connector_funcs.mode_valid.
> > +	 *
> > +	 * To allow for accessing the atomic state of modesetting objects, the
> > +	 * helper libraries always call this with ctx set to a valid context,
> > +	 * and &drm_mode_config.connection_mutex will always be locked with
> > +	 * the ctx parameter set to @ctx. This allows for taking additional
> > +	 * locks as required.
> > +	 *
> > +	 * Even though additional locks may be acquired, this callback is
> > +	 * still expected not to take any constraints into account which would
> > +	 * be influenced by the currently set display state - such constraints
> > +	 * should be handled in the driver's atomic check. For example, if a
> > +	 * connector shares display bandwidth with other connectors then it
> > +	 * would be ok to validate a mode uses against the maximum possible
>                                      ^mode against?
> 
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> 
> > +	 * bandwidth of the connector. But it wouldn't be ok to take the
> > +	 * current bandwidth usage of other connectors into account, as this
> > +	 * would change depending on the display state.
> > +	 *
> > +	 * Returns:
> > +	 *
> > +	 * Either &drm_mode_status.MODE_OK, one of the failure reasons in
> > +	 * &enum drm_mode_status, or -EDEADLK if a deadlock would have
> > +	 * occurred and we need to backoff.
> > +	 *
> > +	 */
> > +	int (*mode_valid_ctx)(struct drm_connector *connector,
> > +			      struct drm_display_mode *mode,
> > +			      struct drm_modeset_acquire_ctx *ctx);
> > +
> >  	/**
> >  	 * @best_encoder:
> >  	 *
> > -- 
> > 2.26.2
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
