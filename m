Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB05128410
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 22:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0216E170;
	Fri, 20 Dec 2019 21:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9818B6ECB8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 21:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576878303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRj91UpE8ExfpVXZpBb1TE7aJOXywQTXcB9+04f7eK8=;
 b=fkebS0kl5S/kwSiSX7+YBJjOkIYQkvfSrn9SdJkQbwYUJVTNBHLl6v3R13vpqoyn4okNnH
 lHob/R5zmvLN+DKibbhgsSJb8pZEx7v7LSk2dJYR6AJI+uoSSHjx6xtTk00irrS6+Mbk7J
 GVP8VYFwo/HrdXHUtNunkWnwibeu0kA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-y5JhmnYqP12dKI9H2ZWkXQ-1; Fri, 20 Dec 2019 16:45:02 -0500
Received: by mail-qv1-f70.google.com with SMTP id g15so6777253qvq.20
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 13:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=cRj91UpE8ExfpVXZpBb1TE7aJOXywQTXcB9+04f7eK8=;
 b=euURDSKSPPUgYLODbbz+KIO3/91S3PAevEm3bgc9W0HG7yr5plSw7AJlVXrIxK5Qt3
 9aG/ONm4amAUwfRl8m4MZPycbdaa+aI5GYoKovEnPDSL6FOljWItO7oySPNDu0GfOzE3
 VXwxh4kEtft+PeXApzKOLuf+K903zzBM2Juh3cQOaYJROwS5yzQftMAfA+4I2Hmdw5UN
 9Js/vwGSrTLknQvJJHImqvg4JitXWkGwvcF85EmCN0a+KsuJBF6ujai0pI7UOPPsNJru
 04kGiGKn09ONyc5N7fDhEgftXmd1vmaSuyuYZTVknZXXMlcxjIwSSR6vF7I2gGzyxCVw
 Ysqg==
X-Gm-Message-State: APjAAAU2deeUKBEpVNM4Jv0JsGlT4eYp09bTS3/WcRUNgOOiNVuyclZa
 UD9Qxx23CfTOe0uUvGdC4Gmzc88mt+yaliF1Etb9VQJIcmsaXkEkgh5TGlB8sooew/wClmx6eO9
 i5BISEB7bV7yFj5D/CiqmHE/tvall
X-Received: by 2002:ac8:5343:: with SMTP id d3mr13357844qto.198.1576878301652; 
 Fri, 20 Dec 2019 13:45:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqztEFUm/bZbiFPpjNqzBwUPtsbNtJ9XpezJKYbx7w833VD/a6gDXQEKmqucmGBfp+bGQ9f6Sg==
X-Received: by 2002:ac8:5343:: with SMTP id d3mr13357826qto.198.1576878301225; 
 Fri, 20 Dec 2019 13:45:01 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id t15sm3213153qkg.49.2019.12.20.13.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 13:45:00 -0800 (PST)
Message-ID: <605f51665c3142a61c58fafb4ecdea7eff12d962.camel@redhat.com>
Subject: Re: [PATCH v9 15/18] drm/amd/display: MST DSC compute fair share
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Fri, 20 Dec 2019 16:44:59 -0500
In-Reply-To: <20191213200854.31545-16-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
 <20191213200854.31545-16-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: y5JhmnYqP12dKI9H2ZWkXQ-1
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Lyude Paul <lyude@redhat.com>

On Fri, 2019-12-13 at 15:08 -0500, mikita.lipski@amd.com wrote:
> From: David Francis <David.Francis@amd.com>
> 
> If there is limited link bandwidth on a MST network,
> it must be divided fairly between the streams on that network
> 
> Implement an algorithm to determine the correct DSC config
> for each stream
> 
> The algorithm:
> This
>      [                   ]          ( )
> represents the range of bandwidths possible for a given stream.
> The [] area represents the range of DSC configs, and the ()
> represents no DSC. The bandwidth used increases from left to right.
> 
> First, try disabling DSC on all streams
>      [                  ]          (|)
>      [                     ]            (|)
> Check this against the bandwidth limits of the link and each branch
> (including each endpoint). If it passes, the job is done
> 
> Second, try maximum DSC compression on all streams
> that support DSC
>      [|         ]        ( )
>      [|                ]         ( )
> If this does not pass, then enabling this combination of streams
> is impossible
> 
> Otherwise, divide the remaining bandwidth evenly amongst the streams
>      [        |  ]         ( )
>      [        |      ]        ( )
> 
> If one or more of the streams reach minimum compression, evenly
> divide the reamining bandwidth amongst the remaining streams
>      [    |] ( )
>      [       |]   ( )
>      [                 |   ]               ( )
>      [                 |      ]                  ( )
> 
> If all streams can reach minimum compression, disable compression
> greedily
>      [      |]  ( )
>      [        |]    ( )
>      [                 ]                                (|)
> 
> Perform this algorithm on each full update, on each MST link
> with at least one DSC stream on it
> 
> After the configs are computed, call
> dcn20_add_dsc_to_stream_resource on each stream with DSC enabled.
> It is only after all streams are created that we can know which
> of them will need DSC.
> 
> Do all of this at the end of amdgpu atomic check.  If it fails,
> fail check; This combination of timings cannot be supported.
> 
> v2: Use drm_dp_mst_atomic_check to validate bw for certain dsc
> configurations
> 
> v3: Use dc_dsc_policy structure to get min and max bpp rate
> for DSC configuration
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 +
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 364 ++++++++++++++++++
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |   3 +
>  .../drm/amd/display/dc/dcn20/dcn20_resource.c |   7 +-
>  .../drm/amd/display/dc/dcn20/dcn20_resource.h |   1 +
>  5 files changed, 376 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 753a79734817..93a230d956ee 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8095,6 +8095,9 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>  		if (ret)
>  			goto fail;
>  
> +		if (!compute_mst_dsc_configs_for_state(state, dm_state-
> >context))
> +			goto fail;
> +
>  		if (dc_validate_global_state(dc, dm_state->context, false) !=
> DC_OK) {
>  			ret = -EINVAL;
>  			goto fail;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index c376c8ccd391..6d13d1c33530 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -40,6 +40,10 @@
>  #if defined(CONFIG_DEBUG_FS)
>  #include "amdgpu_dm_debugfs.h"
>  #endif
> +
> +
> +#include "dc/dcn20/dcn20_resource.h"
> +
>  /* #define TRACE_DPCD */
>  
>  #ifdef TRACE_DPCD
> @@ -499,3 +503,363 @@ int dm_mst_get_pbn_divider(struct dc_link *link)
>  	return dc_link_bandwidth_kbps(link,
>  			dc_link_get_link_cap(link)) / (8 * 1000 * 54);
>  }
> +
> +struct dsc_mst_fairness_params {
> +	struct dc_crtc_timing *timing;
> +	struct dc_sink *sink;
> +	struct dc_dsc_bw_range bw_range;
> +	bool compression_possible;
> +	struct drm_dp_mst_port *port;
> +};
> +
> +struct dsc_mst_fairness_vars {
> +	int pbn;
> +	bool dsc_enabled;
> +	int bpp_x16;
> +};
> +
> +static int kbps_to_peak_pbn(int kbps)
> +{
> +	u64 peak_kbps = kbps;
> +
> +	peak_kbps *= 1006;
> +	peak_kbps /= 1000;
> +	return (int) DIV_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
> +}
> +
> +static void set_dsc_configs_from_fairness_vars(struct
> dsc_mst_fairness_params *params,
> +		struct dsc_mst_fairness_vars *vars,
> +		int count)
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++) {
> +		memset(&params[i].timing->dsc_cfg, 0, sizeof(params[i].timing-
> >dsc_cfg));
> +		if (vars[i].dsc_enabled && dc_dsc_compute_config(
> +					params[i].sink->ctx->dc->res_pool-
> >dscs[0],
> +					&params[i].sink-
> >sink_dsc_caps.dsc_dec_caps,
> +					params[i].sink->ctx->dc-
> >debug.dsc_min_slice_height_override,
> +					0,
> +					params[i].timing,
> +					&params[i].timing->dsc_cfg)) {
> +			params[i].timing->flags.DSC = 1;
> +			params[i].timing->dsc_cfg.bits_per_pixel =
> vars[i].bpp_x16;
> +		} else {
> +			params[i].timing->flags.DSC = 0;
> +		}
> +	}
> +}
> +
> +static int bpp_x16_from_pbn(struct dsc_mst_fairness_params param, int pbn)
> +{
> +	struct dc_dsc_config dsc_config;
> +	u64 kbps;
> +
> +	kbps = (u64)pbn * 994 * 8 * 54 / 64;
> +	dc_dsc_compute_config(
> +			param.sink->ctx->dc->res_pool->dscs[0],
> +			&param.sink->sink_dsc_caps.dsc_dec_caps,
> +			param.sink->ctx->dc-
> >debug.dsc_min_slice_height_override,
> +			(int) kbps, param.timing, &dsc_config);
> +
> +	return dsc_config.bits_per_pixel;
> +}
> +
> +static void increase_dsc_bpp(struct drm_atomic_state *state,
> +			     struct dc_link *dc_link,
> +			     struct dsc_mst_fairness_params *params,
> +			     struct dsc_mst_fairness_vars *vars,
> +			     int count)
> +{
> +	int i;
> +	bool bpp_increased[MAX_PIPES];
> +	int initial_slack[MAX_PIPES];
> +	int min_initial_slack;
> +	int next_index;
> +	int remaining_to_increase = 0;
> +	int pbn_per_timeslot;
> +	int link_timeslots_used;
> +	int fair_pbn_alloc;
> +
> +	for (i = 0; i < count; i++) {
> +		if (vars[i].dsc_enabled) {
> +			initial_slack[i] =
> kbps_to_peak_pbn(params[i].bw_range.max_kbps) - vars[i].pbn;
> +			bpp_increased[i] = false;
> +			remaining_to_increase += 1;
> +		} else {
> +			initial_slack[i] = 0;
> +			bpp_increased[i] = true;
> +		}
> +	}
> +
> +	pbn_per_timeslot = dc_link_bandwidth_kbps(dc_link,
> +			dc_link_get_link_cap(dc_link)) / (8 * 1000 * 54);
> +
> +	while (remaining_to_increase) {
> +		next_index = -1;
> +		min_initial_slack = -1;
> +		for (i = 0; i < count; i++) {
> +			if (!bpp_increased[i]) {
> +				if (min_initial_slack == -1 ||
> min_initial_slack > initial_slack[i]) {
> +					min_initial_slack = initial_slack[i];
> +					next_index = i;
> +				}
> +			}
> +		}
> +
> +		if (next_index == -1)
> +			break;
> +
> +		link_timeslots_used = 0;
> +
> +		for (i = 0; i < count; i++)
> +			link_timeslots_used += DIV_ROUND_UP(vars[i].pbn,
> pbn_per_timeslot);
> +
> +		fair_pbn_alloc = (63 - link_timeslots_used) /
> remaining_to_increase * pbn_per_timeslot;
> +
> +		if (initial_slack[next_index] > fair_pbn_alloc) {
> +			vars[next_index].pbn += fair_pbn_alloc;
> +			drm_dp_atomic_find_vcpi_slots(state,
> +						      params[next_index].port-
> >mgr,
> +						      params[next_index].port,
> +						      vars[next_index].pbn,
> +						      dm_mst_get_pbn_divider(d
> c_link));
> +			if (!drm_dp_mst_atomic_check(state)) {
> +				vars[next_index].bpp_x16 =
> bpp_x16_from_pbn(params[next_index], vars[next_index].pbn);
> +			} else {
> +				vars[next_index].pbn -= fair_pbn_alloc;
> +				drm_dp_atomic_find_vcpi_slots(state,
> +						      params[next_index].port-
> >mgr,
> +						      params[next_index].port,
> +						      vars[next_index].pbn,
> +						      dm_mst_get_pbn_divider(d
> c_link));
> +			}
> +		} else {
> +			vars[next_index].pbn += initial_slack[next_index];
> +			drm_dp_atomic_find_vcpi_slots(state,
> +						      params[next_index].port-
> >mgr,
> +						      params[next_index].port,
> +						      vars[next_index].pbn,
> +						      dm_mst_get_pbn_divider(d
> c_link));
> +			if (!drm_dp_mst_atomic_check(state)) {
> +				vars[next_index].bpp_x16 =
> params[next_index].bw_range.max_target_bpp_x16;
> +			} else {
> +				vars[next_index].pbn -=
> initial_slack[next_index];
> +				drm_dp_atomic_find_vcpi_slots(state,
> +						      params[next_index].port-
> >mgr,
> +						      params[next_index].port,
> +						      vars[next_index].pbn,
> +						      dm_mst_get_pbn_divider(d
> c_link));
> +			}
> +		}
> +
> +		bpp_increased[next_index] = true;
> +		remaining_to_increase--;
> +	}
> +}
> +
> +static void try_disable_dsc(struct drm_atomic_state *state,
> +			    struct dc_link *dc_link,
> +			    struct dsc_mst_fairness_params *params,
> +			    struct dsc_mst_fairness_vars *vars,
> +			    int count)
> +{
> +	int i;
> +	bool tried[MAX_PIPES];
> +	int kbps_increase[MAX_PIPES];
> +	int max_kbps_increase;
> +	int next_index;
> +	int remaining_to_try = 0;
> +
> +	for (i = 0; i < count; i++) {
> +		if (vars[i].dsc_enabled && vars[i].bpp_x16 ==
> params[i].bw_range.max_target_bpp_x16) {
> +			kbps_increase[i] = params[i].bw_range.stream_kbps -
> params[i].bw_range.max_kbps;
> +			tried[i] = false;
> +			remaining_to_try += 1;
> +		} else {
> +			kbps_increase[i] = 0;
> +			tried[i] = true;
> +		}
> +	}
> +
> +	while (remaining_to_try) {
> +		next_index = -1;
> +		max_kbps_increase = -1;
> +		for (i = 0; i < count; i++) {
> +			if (!tried[i]) {
> +				if (max_kbps_increase == -1 ||
> max_kbps_increase < kbps_increase[i]) {
> +					max_kbps_increase = kbps_increase[i];
> +					next_index = i;
> +				}
> +			}
> +		}
> +
> +		if (next_index == -1)
> +			break;
> +
> +		vars[next_index].pbn =
> kbps_to_peak_pbn(params[next_index].bw_range.stream_kbps);
> +		drm_dp_atomic_find_vcpi_slots(state,
> +					      params[next_index].port->mgr,
> +					      params[next_index].port,
> +					      vars[next_index].pbn,
> +					      0);
> +
> +		if (!drm_dp_mst_atomic_check(state)) {
> +			vars[next_index].dsc_enabled = false;
> +			vars[next_index].bpp_x16 = 0;
> +		} else {
> +			vars[next_index].pbn =
> kbps_to_peak_pbn(params[next_index].bw_range.max_kbps);
> +			drm_dp_atomic_find_vcpi_slots(state,
> +					      params[next_index].port->mgr,
> +					      params[next_index].port,
> +					      vars[next_index].pbn,
> +					      dm_mst_get_pbn_divider(dc_link))
> ;
> +		}
> +
> +		tried[next_index] = true;
> +		remaining_to_try--;
> +	}
> +}
> +
> +static bool compute_mst_dsc_configs_for_link(struct drm_atomic_state
> *state,
> +					     struct dc_state *dc_state,
> +					     struct dc_link *dc_link)
> +{
> +	int i;
> +	struct dc_stream_state *stream;
> +	struct dsc_mst_fairness_params params[MAX_PIPES];
> +	struct dsc_mst_fairness_vars vars[MAX_PIPES];
> +	struct amdgpu_dm_connector *aconnector;
> +	int count = 0;
> +
> +	memset(params, 0, sizeof(params));
> +
> +	/* Set up params */
> +	for (i = 0; i < dc_state->stream_count; i++) {
> +		struct dc_dsc_policy dsc_policy = {0};
> +
> +		stream = dc_state->streams[i];
> +
> +		if (stream->link != dc_link)
> +			continue;
> +
> +		stream->timing.flags.DSC = 0;
> +
> +		params[count].timing = &stream->timing;
> +		params[count].sink = stream->sink;
> +		aconnector = (struct amdgpu_dm_connector *)stream-
> >dm_stream_context;
> +		params[count].port = aconnector->port;
> +		params[count].compression_possible = stream->sink-
> >sink_dsc_caps.dsc_dec_caps.is_dsc_supported;
> +		dc_dsc_get_policy_for_timing(params[count].timing,
> &dsc_policy);
> +		if (!dc_dsc_compute_bandwidth_range(
> +				stream->sink->ctx->dc->res_pool->dscs[0],
> +				stream->sink->ctx->dc-
> >debug.dsc_min_slice_height_override,
> +				dsc_policy.min_target_bpp,
> +				dsc_policy.max_target_bpp,
> +				&stream->sink->sink_dsc_caps.dsc_dec_caps,
> +				&stream->timing, &params[count].bw_range))
> +			params[count].bw_range.stream_kbps =
> dc_bandwidth_in_kbps_from_timing(&stream->timing);
> +
> +		count++;
> +	}
> +	/* Try no compression */
> +	for (i = 0; i < count; i++) {
> +		vars[i].pbn =
> kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
> +		vars[i].dsc_enabled = false;
> +		vars[i].bpp_x16 = 0;
> +		drm_dp_atomic_find_vcpi_slots(state,
> +					      params[i].port->mgr,
> +					      params[i].port,
> +					      vars[i].pbn,
> +					      0);
> +	}
> +	if (!drm_dp_mst_atomic_check(state)) {
> +		set_dsc_configs_from_fairness_vars(params, vars, count);
> +		return true;
> +	}
> +
> +	/* Try max compression */
> +	for (i = 0; i < count; i++) {
> +		if (params[i].compression_possible) {
> +			vars[i].pbn =
> kbps_to_peak_pbn(params[i].bw_range.min_kbps);
> +			vars[i].dsc_enabled = true;
> +			vars[i].bpp_x16 =
> params[i].bw_range.min_target_bpp_x16;
> +			drm_dp_atomic_find_vcpi_slots(state,
> +					      params[i].port->mgr,
> +					      params[i].port,
> +					      vars[i].pbn,
> +					      dm_mst_get_pbn_divider(dc_link))
> ;
> +		} else {
> +			vars[i].pbn =
> kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
> +			vars[i].dsc_enabled = false;
> +			vars[i].bpp_x16 = 0;
> +			drm_dp_atomic_find_vcpi_slots(state,
> +					      params[i].port->mgr,
> +					      params[i].port,
> +					      vars[i].pbn,
> +					      0);
> +		}
> +	}
> +	if (drm_dp_mst_atomic_check(state))
> +		return false;
> +
> +	/* Optimize degree of compression */
> +	increase_dsc_bpp(state, dc_link, params, vars, count);
> +
> +	try_disable_dsc(state, dc_link, params, vars, count);
> +
> +	set_dsc_configs_from_fairness_vars(params, vars, count);
> +
> +	return true;
> +}
> +
> +bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> +				       struct dc_state *dc_state)
> +{
> +	int i, j;
> +	struct dc_stream_state *stream;
> +	bool computed_streams[MAX_PIPES];
> +	struct amdgpu_dm_connector *aconnector;
> +
> +	for (i = 0; i < dc_state->stream_count; i++)
> +		computed_streams[i] = false;
> +
> +	for (i = 0; i < dc_state->stream_count; i++) {
> +		stream = dc_state->streams[i];
> +
> +		if (stream->signal != SIGNAL_TYPE_DISPLAY_PORT_MST)
> +			continue;
> +
> +		aconnector = (struct amdgpu_dm_connector *)stream-
> >dm_stream_context;
> +
> +		if (!aconnector || !aconnector->dc_sink)
> +			continue;
> +
> +		if (!aconnector->dc_sink-
> >sink_dsc_caps.dsc_dec_caps.is_dsc_supported)
> +			continue;
> +
> +		if (computed_streams[i])
> +			continue;
> +
> +		mutex_lock(&aconnector->mst_mgr.lock);
> +		if (!compute_mst_dsc_configs_for_link(state, dc_state, stream-
> >link)) {
> +			mutex_unlock(&aconnector->mst_mgr.lock);
> +			return false;
> +		}
> +		mutex_unlock(&aconnector->mst_mgr.lock);
> +
> +		for (j = 0; j < dc_state->stream_count; j++) {
> +			if (dc_state->streams[j]->link == stream->link)
> +				computed_streams[j] = true;
> +		}
> +	}
> +
> +	for (i = 0; i < dc_state->stream_count; i++) {
> +		stream = dc_state->streams[i];
> +
> +		if (stream->timing.flags.DSC == 1)
> +			dcn20_add_dsc_to_stream_resource(stream->ctx->dc,
> dc_state, stream);
> +	}
> +
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> index a553ea046185..d451ce9cecc0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
> @@ -34,4 +34,7 @@ int dm_mst_get_pbn_divider(struct dc_link *link);
>  void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  				       struct amdgpu_dm_connector
> *aconnector);
>  
> +
> +bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> +				       struct dc_state *dc_state);
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 47adcd4555ec..b1935f5d9cb8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -1564,7 +1564,7 @@ static void release_dsc(struct resource_context
> *res_ctx,
>  
>  
>  
> -static enum dc_status add_dsc_to_stream_resource(struct dc *dc,
> +enum dc_status dcn20_add_dsc_to_stream_resource(struct dc *dc,
>  		struct dc_state *dc_ctx,
>  		struct dc_stream_state *dc_stream)
>  {
> @@ -1579,6 +1579,9 @@ static enum dc_status
> add_dsc_to_stream_resource(struct dc *dc,
>  		if (pipe_ctx->stream != dc_stream)
>  			continue;
>  
> +		if (pipe_ctx->stream_res.dsc)
> +			continue;
> +
>  		acquire_dsc(&dc_ctx->res_ctx, pool, &pipe_ctx->stream_res.dsc, 
> i);
>  
>  		/* The number of DSCs can be less than the number of pipes */
> @@ -1627,7 +1630,7 @@ enum dc_status dcn20_add_stream_to_ctx(struct dc *dc,
> struct dc_state *new_ctx,
>  
>  	/* Get a DSC if required and available */
>  	if (result == DC_OK && dc_stream->timing.flags.DSC)
> -		result = add_dsc_to_stream_resource(dc, new_ctx, dc_stream);
> +		result = dcn20_add_dsc_to_stream_resource(dc, new_ctx,
> dc_stream);
>  
>  	if (result == DC_OK)
>  		result = dcn20_build_mapped_resource(dc, new_ctx, dc_stream);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> index 840ca66c34e1..f5893840b79b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
> @@ -157,6 +157,7 @@ void dcn20_calculate_dlg_params(
>  
>  enum dc_status dcn20_build_mapped_resource(const struct dc *dc, struct
> dc_state *context, struct dc_stream_state *stream);
>  enum dc_status dcn20_add_stream_to_ctx(struct dc *dc, struct dc_state
> *new_ctx, struct dc_stream_state *dc_stream);
> +enum dc_status dcn20_add_dsc_to_stream_resource(struct dc *dc, struct
> dc_state *dc_ctx, struct dc_stream_state *dc_stream);
>  enum dc_status dcn20_remove_stream_from_ctx(struct dc *dc, struct dc_state
> *new_ctx, struct dc_stream_state *dc_stream);
>  enum dc_status dcn20_get_default_swizzle_mode(struct dc_plane_state
> *plane_state);
>  
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
