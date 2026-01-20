Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLkOM/6mb2lDEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B646FBA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899D310E60D;
	Tue, 20 Jan 2026 14:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEBCC10E617
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:46:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0AA61476
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 06:45:59 -0800 (PST)
Received: from e142607.local (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 0C6CF3F694
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 06:46:05 -0800 (PST)
Date: Tue, 20 Jan 2026 14:45:03 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 08/15] drm/arm: komeda: Switch private_obj
 initialization to atomic_create_state
Message-ID: <aW-U7-kc3QKtfInt@e142607>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
 <20260119-drm-private-obj-reset-v3-8-b931abe3a5e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-drm-private-obj-reset-v3-8-b931abe3a5e3@redhat.com>
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RSPAMD_URIBL_FAIL(0.00)[arm.com:query timed out];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[liviu.dudau.arm.com:query timed out,mripard.kernel.org:query timed out];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email]
X-Rspamd-Queue-Id: 707B646FBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 01:50:04PM +0100, Maxime Ripard wrote:
> The ARM komeda driver relies on a number of drm_private_objs, that are
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   2 +
>  .../drm/arm/display/komeda/komeda_private_obj.c    | 208 ++++++++++++++-------
>  2 files changed, 146 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
> index ac8725e248537e5737d16cd36860401c42073500..37b9e92202443cc72adc0666ed047d4f77d79782 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
> @@ -126,10 +126,12 @@ struct komeda_component {
>  	 * @funcs: chip functions to access HW
>  	 */
>  	const struct komeda_component_funcs *funcs;
>  };
>  
> +#define to_component(o)	container_of(o, struct komeda_component, obj)
> +
>  /**
>   * struct komeda_component_output
>   *
>   * a component has multiple outputs, if want to know where the data
>   * comes from, only know the component is not enough, we still need to know
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> index 914400c4af73824e52dda76425a73a74e681a146..4994b69c6595637ea832b97629b052e3aea97ee7 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> @@ -38,26 +38,36 @@ komeda_layer_atomic_destroy_state(struct drm_private_obj *obj,
>  	struct komeda_layer_state *st = to_layer_st(priv_to_comp_st(state));
>  
>  	kfree(st);
>  }
>  
> +static struct drm_private_state *
> +komeda_layer_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_layer_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
> +	komeda_component_state_reset(&st->base);
> +	st->base.component = to_component(obj);
> +
> +	return &st->base.obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_layer_obj_funcs = {
> +	.atomic_create_state	= komeda_layer_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_layer_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_layer_atomic_destroy_state,
>  };
>  
>  static int komeda_layer_obj_add(struct komeda_kms_dev *kms,
>  				struct komeda_layer *layer)
>  {
> -	struct komeda_layer_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->base.component = &layer->base;
> -	drm_atomic_private_obj_init(&kms->base, &layer->base.obj, &st->base.obj,
> +	drm_atomic_private_obj_init(&kms->base, &layer->base.obj, NULL,
>  				    &komeda_layer_obj_funcs);
>  	return 0;
>  }
>  
>  static struct drm_private_state *
> @@ -80,27 +90,37 @@ komeda_scaler_atomic_destroy_state(struct drm_private_obj *obj,
>  				   struct drm_private_state *state)
>  {
>  	kfree(to_scaler_st(priv_to_comp_st(state)));
>  }
>  
> +static struct drm_private_state *
> +komeda_scaler_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_scaler_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
> +	komeda_component_state_reset(&st->base);
> +	st->base.component = to_component(obj);
> +
> +	return &st->base.obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_scaler_obj_funcs = {
> +	.atomic_create_state	= komeda_scaler_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_scaler_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_scaler_atomic_destroy_state,
>  };
>  
>  static int komeda_scaler_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_scaler *scaler)
>  {
> -	struct komeda_scaler_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->base.component = &scaler->base;
>  	drm_atomic_private_obj_init(&kms->base,
> -				    &scaler->base.obj, &st->base.obj,
> +				    &scaler->base.obj, NULL,
>  				    &komeda_scaler_obj_funcs);
>  	return 0;
>  }
>  
>  static struct drm_private_state *
> @@ -123,26 +143,36 @@ komeda_compiz_atomic_destroy_state(struct drm_private_obj *obj,
>  				   struct drm_private_state *state)
>  {
>  	kfree(to_compiz_st(priv_to_comp_st(state)));
>  }
>  
> +static struct drm_private_state *
> +komeda_compiz_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_compiz_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
> +	komeda_component_state_reset(&st->base);
> +	st->base.component = to_component(obj);
> +
> +	return &st->base.obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_compiz_obj_funcs = {
> +	.atomic_create_state	= komeda_compiz_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_compiz_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_compiz_atomic_destroy_state,
>  };
>  
>  static int komeda_compiz_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_compiz *compiz)
>  {
> -	struct komeda_compiz_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->base.component = &compiz->base;
> -	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj, &st->base.obj,
> +	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj, NULL,
>  				    &komeda_compiz_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -166,27 +196,37 @@ komeda_splitter_atomic_destroy_state(struct drm_private_obj *obj,
>  				     struct drm_private_state *state)
>  {
>  	kfree(to_splitter_st(priv_to_comp_st(state)));
>  }
>  
> +static struct drm_private_state *
> +komeda_splitter_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_splitter_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
> +	komeda_component_state_reset(&st->base);
> +	st->base.component = to_component(obj);
> +
> +	return &st->base.obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_splitter_obj_funcs = {
> +	.atomic_create_state	= komeda_splitter_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_splitter_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_splitter_atomic_destroy_state,
>  };
>  
>  static int komeda_splitter_obj_add(struct komeda_kms_dev *kms,
>  				   struct komeda_splitter *splitter)
>  {
> -	struct komeda_splitter_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->base.component = &splitter->base;
>  	drm_atomic_private_obj_init(&kms->base,
> -				    &splitter->base.obj, &st->base.obj,
> +				    &splitter->base.obj, NULL,
>  				    &komeda_splitter_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -209,27 +249,37 @@ static void komeda_merger_atomic_destroy_state(struct drm_private_obj *obj,
>  					       struct drm_private_state *state)
>  {
>  	kfree(to_merger_st(priv_to_comp_st(state)));
>  }
>  
> +static struct drm_private_state *
> +komeda_merger_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_merger_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
> +	komeda_component_state_reset(&st->base);
> +	st->base.component = to_component(obj);
> +
> +	return &st->base.obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_merger_obj_funcs = {
> +	.atomic_create_state	= komeda_merger_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_merger_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_merger_atomic_destroy_state,
>  };
>  
>  static int komeda_merger_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_merger *merger)
>  {
> -	struct komeda_merger_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->base.component = &merger->base;
>  	drm_atomic_private_obj_init(&kms->base,
> -				    &merger->base.obj, &st->base.obj,
> +				    &merger->base.obj, NULL,
>  				    &komeda_merger_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -253,26 +303,36 @@ komeda_improc_atomic_destroy_state(struct drm_private_obj *obj,
>  				   struct drm_private_state *state)
>  {
>  	kfree(to_improc_st(priv_to_comp_st(state)));
>  }
>  
> +static struct drm_private_state *
> +komeda_improc_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_improc_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
> +	komeda_component_state_reset(&st->base);
> +	st->base.component = to_component(obj);
> +
> +	return &st->base.obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_improc_obj_funcs = {
> +	.atomic_create_state	= komeda_improc_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_improc_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_improc_atomic_destroy_state,
>  };
>  
>  static int komeda_improc_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_improc *improc)
>  {
> -	struct komeda_improc_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->base.component = &improc->base;
> -	drm_atomic_private_obj_init(&kms->base, &improc->base.obj, &st->base.obj,
> +	drm_atomic_private_obj_init(&kms->base, &improc->base.obj, NULL,
>  				    &komeda_improc_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -296,26 +356,36 @@ komeda_timing_ctrlr_atomic_destroy_state(struct drm_private_obj *obj,
>  					 struct drm_private_state *state)
>  {
>  	kfree(to_ctrlr_st(priv_to_comp_st(state)));
>  }
>  
> +static struct drm_private_state *
> +komeda_timing_ctrlr_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_timing_ctrlr_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->base.obj);
> +	komeda_component_state_reset(&st->base);
> +	st->base.component = to_component(obj);
> +
> +	return &st->base.obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_timing_ctrlr_obj_funcs = {
> +	.atomic_create_state	= komeda_timing_ctrlr_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_timing_ctrlr_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_timing_ctrlr_atomic_destroy_state,
>  };
>  
>  static int komeda_timing_ctrlr_obj_add(struct komeda_kms_dev *kms,
>  				       struct komeda_timing_ctrlr *ctrlr)
>  {
> -	struct komeda_compiz_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->base.component = &ctrlr->base;
> -	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj, &st->base.obj,
> +	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj, NULL,
>  				    &komeda_timing_ctrlr_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -340,26 +410,36 @@ komeda_pipeline_atomic_destroy_state(struct drm_private_obj *obj,
>  				     struct drm_private_state *state)
>  {
>  	kfree(priv_to_pipe_st(state));
>  }
>  
> +static struct drm_private_state *
> +komeda_pipeline_atomic_create_state(struct drm_private_obj *obj)
> +{
> +	struct komeda_pipeline_state *st;
> +
> +	st = kzalloc(sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &st->obj);
> +	st->active_comps = 0;
> +	st->pipe = container_of(obj, struct komeda_pipeline, obj);
> +
> +	return &st->obj;
> +}
> +
>  static const struct drm_private_state_funcs komeda_pipeline_obj_funcs = {
> +	.atomic_create_state	= komeda_pipeline_atomic_create_state,
>  	.atomic_duplicate_state	= komeda_pipeline_atomic_duplicate_state,
>  	.atomic_destroy_state	= komeda_pipeline_atomic_destroy_state,
>  };
>  
>  static int komeda_pipeline_obj_add(struct komeda_kms_dev *kms,
>  				   struct komeda_pipeline *pipe)
>  {
> -	struct komeda_pipeline_state *st;
> -
> -	st = kzalloc(sizeof(*st), GFP_KERNEL);
> -	if (!st)
> -		return -ENOMEM;
> -
> -	st->pipe = pipe;
> -	drm_atomic_private_obj_init(&kms->base, &pipe->obj, &st->obj,
> +	drm_atomic_private_obj_init(&kms->base, &pipe->obj, NULL,
>  				    &komeda_pipeline_obj_funcs);
>  
>  	return 0;
>  }
>  
> 
> -- 
> 2.52.0
> 
