Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5ED128401
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 22:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E006E159;
	Fri, 20 Dec 2019 21:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3676E159
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 21:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576878084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wljEDLQblov4l0mmb6ZvDHLhjxactWCRTqDqVyTkNSQ=;
 b=deEonKwANbCAETxcFRhWK1xhV9nFjAwtknU+B+XQIf4TzGAWpFMFEEWoChX1nTDVICqDAP
 CUjLRmLzs4trtl/O9KjWupoGmMUCGbk2KFBvX3X0gqR5pwvCOdSduCghOyhqHmr96bNeGo
 GgUpu/I968mfIJsg0+PEuz6hsCzTKYM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-OQ96rGksP2SZzO5ytnK5JA-1; Fri, 20 Dec 2019 16:41:21 -0500
Received: by mail-qt1-f199.google.com with SMTP id r9so6882855qtc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 13:41:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=wljEDLQblov4l0mmb6ZvDHLhjxactWCRTqDqVyTkNSQ=;
 b=lqGGchS3JAvRXarxWUX7oUkALZg1UEFXkY6JralHMEdvcj8AdzMvRy0h97s/i/m/3R
 Cq3ZGLDXvi+lgWhUaZ4LWJbAiD4QIbCWeCuxzZKIire0qfjLpiFBy0N5Map9nIRSUcdx
 8wm1meE33T8EfSutXIuDJJ+uQTjh7niN/mxAPuBpCO7/ihJQCDV5U0Fv1BzHcm9C/3ok
 U62sxbrMRNnjbudJa+VJ9OZ1t10hlUhyht1nldWg+xZsgSTzXAW0YYhZRBdBO9LvAQ4Q
 eiiPNbtH6woZfmCnsU8d1BVT4QAfg0ydO0vwPQHiJV7JGzbhd77zcWZblhSsa2KxzaHf
 PsAQ==
X-Gm-Message-State: APjAAAXeKtTXk9Ms8RUiue85fi8a2EQl4fMcJFngmv5LDsxS1OFbfe4J
 9zMr6ABYclHcVQgpY+S6rB2xkWx7wxMzkntZaltr6LaFTRTlYRTNST3tH7BOZaZP9oe9i4ScYwa
 okaWPFyRwfZ/k9lYuYWywokpdlVx2
X-Received: by 2002:ac8:4a97:: with SMTP id l23mr12543050qtq.231.1576878080636; 
 Fri, 20 Dec 2019 13:41:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6j2WyKIB3vmdUfoi1n/E3XmBMUyYUUbnpf7PSfZNnClUzLhyG/T4KC6YpZLyTM3ypRQYSwA==
X-Received: by 2002:ac8:4a97:: with SMTP id l23mr12543035qtq.231.1576878080407; 
 Fri, 20 Dec 2019 13:41:20 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id y184sm3183137qkd.128.2019.12.20.13.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 13:41:19 -0800 (PST)
Message-ID: <08a2b34d55043c9be603d739211c39702a760e97.camel@redhat.com>
Subject: Re: [PATCH v9 16/18] drm/amd/display: Recalculate VCPI slots for
 new DSC connectors
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Fri, 20 Dec 2019 16:41:18 -0500
In-Reply-To: <20191213200854.31545-17-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-17-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: OQ96rGksP2SZzO5ytnK5JA-1
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So I reviewed this already but realized I made a very silly mistake, comments
down below:

On Fri, 2019-12-13 at 15:08 -0500, mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> [why]
> Since for DSC MST connector's PBN is claculated differently
> due to compression, we have to recalculate both PBN and
> VCPI slots for that connector.
> 
> [how]
> The function iterates through all the active streams to
> find, which have DSC enabled, then recalculates PBN for
> it and calls drm_dp_helper_update_vcpi_slots_for_dsc to
> update connector's VCPI slots.
> 
> v2: - use drm_dp_mst_atomic_enable_dsc per port to
> enable/disable DSC
> 
> v3: - Iterate through connector states from the state passed
>     - On each connector state get stream from dc_state,
> instead CRTC state
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++--
>  1 file changed, 71 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 93a230d956ee..2ac3a2f0b452 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4986,6 +4986,69 @@ const struct drm_encoder_helper_funcs
> amdgpu_dm_encoder_helper_funcs = {
>  	.atomic_check = dm_encoder_helper_atomic_check
>  };
>  
> +static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
> +					    struct dc_state *dc_state)
> +{
> +	struct dc_stream_state *stream = NULL;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_con_state, *old_con_state;
> +	struct amdgpu_dm_connector *aconnector;
> +	struct dm_connector_state *dm_conn_state;
> +	int i, j, clock, bpp;
> +	int vcpi, pbn_div, pbn = 0;
> +
> +	for_each_oldnew_connector_in_state(state, connector, old_con_state,
> new_con_state, i) {
> +
> +		aconnector = to_amdgpu_dm_connector(connector);
> +
> +		if (!aconnector->port)
> +			continue;
> +
> +		if (!new_con_state || !new_con_state->crtc)
> +			continue;
> +
> +		dm_conn_state = to_dm_connector_state(new_con_state);
> +
> +		for (j = 0; j < dc_state->stream_count; j++) {
> +			stream = dc_state->streams[j];
> +			if (!stream)
> +				continue;
> +
> +			if ((struct amdgpu_dm_connector*)stream-
> >dm_stream_context == aconnector)
> +				break;
> +
> +			stream = NULL;
> +		}
> +
> +		if (!stream)
> +			continue;
> +
> +		if (stream->timing.flags.DSC != 1) {
> +			drm_dp_mst_atomic_enable_dsc(state,
> +						     aconnector->port,
> +						     dm_conn_state->pbn,
> +						     0,
> +						     false);
> +			continue;
> +		}
> +
> +		pbn_div = dm_mst_get_pbn_divider(stream->link);
> +		bpp = stream->timing.dsc_cfg.bits_per_pixel;
> +		clock = stream->timing.pix_clk_100hz / 10;
> +		pbn = drm_dp_calc_pbn_mode(clock, bpp, true);
> +		vcpi = drm_dp_mst_atomic_enable_dsc(state,
> +						    aconnector->port,
> +						    pbn, pbn_div,
> +						    true);
> +		if (vcpi < 0)
> +			return vcpi;
> +
> +		dm_conn_state->pbn = pbn;
> +		dm_conn_state->vcpi_slots = vcpi;
> +	}
> +	return 0;
> +}
> +
>  static void dm_drm_plane_reset(struct drm_plane *plane)
>  {
>  	struct dm_plane_state *amdgpu_state = NULL;
> @@ -8022,11 +8085,6 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>  	if (ret)
>  		goto fail;
>  
> -	/* Perform validation of MST topology in the state*/
> -	ret = drm_dp_mst_atomic_check(state);
> -	if (ret)
> -		goto fail;
> -
>  	if (state->legacy_cursor_update) {
>  		/*
>  		 * This is a fast cursor update coming from the plane update
> @@ -8098,6 +8156,10 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>  		if (!compute_mst_dsc_configs_for_state(state, dm_state-
> >context))
>  			goto fail;
>  
> +		ret = dm_update_mst_vcpi_slots_for_dsc(state, dm_state-
> >context);
> +		if (ret)
> +			goto fail;
> +
>  		if (dc_validate_global_state(dc, dm_state->context, false) !=
> DC_OK) {
>  			ret = -EINVAL;
>  			goto fail;
> @@ -8126,6 +8188,10 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>  				dc_retain_state(old_dm_state->context);
>  		}
>  	}
> +	/* Perform validation of MST topology in the state*/
> +	ret = drm_dp_mst_atomic_check(state);
> +	if (ret)
> +		goto fail;

I realized that we actually should make it so that we actually expose a
version of drm_dp_mst_atomic_check() which allows you to manually specify a
drm_dp_mst_topology_state, because otherwise we're checking the bandwidth caps
of _ALL_ enabled topologies which could cause us to fail just because another
topology's new state doesn't meet the bandwidth requirements yet because we
haven't readjusted it for the fair share compute algorithm.

Also, I think we should probably differentiate in the atomic check functions
between failing an atomic check for a topology state because it doesn't meet
the bandwidth requirements we set, vs. a topology state failing atomic check
for other reasons (temporary deadlock, too many payloads, etc.). So basically-
we should return -ENOSPC when we fail because of a bandwidth (including VCPI
slot allocation) issue.

>  
>  	/* Store the overall update type for use later in atomic check. */
>  	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
