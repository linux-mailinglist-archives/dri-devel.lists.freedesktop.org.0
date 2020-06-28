Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18520CA64
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3A96E3AE;
	Sun, 28 Jun 2020 20:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853FD6E1D2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 10:27:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w3so781270wmi.4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=HX9zsID4xDkoTbF7QMsuLwahPked0sla9KNAi1P429Q=;
 b=o7Msf6X4bTte/iOxZizcwex/KSQ6Z+IgDv8QHswDjLgabE8fWH9Lka4nkLQ3VRc9jn
 5fseIFJuJFb7EOzfEaCiN3mRIxARvnxCrwx9vX3YefIviXseVqh4kJRfnknXENrTbHzv
 s4IQD8P873mAbn3XvSnzxWSXORyuMataEDuIqNg0nWFW4eYKvAayydVgHPjow9RJBWN5
 xu7RckfWRv2OSZKiOU/K1pCznFTwQs1JiGTOZStUSI7yPl6RLZveNt1PQnxMbKDN+0Kp
 OA9Ct+uep0uQSqDN4GzjCinkwideSgsRiHFbKYrUGH4ml6Zr2cjUl3TZGf5VbslwLvSf
 iIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=HX9zsID4xDkoTbF7QMsuLwahPked0sla9KNAi1P429Q=;
 b=sRWAaogKYRUmLrnOeVY7BSTckdX7kjOl7xuPbbQmg8rJXRrP+r6Ol8TuZpOALG8gw7
 C9G17iauf511IL8wKB+yioPmmOHaz9UWb+1ujvQa2yE6z4eCFB6c3zgjEcgimPNphrzr
 icpAaq4mSCO+Ap7z0JkQnN9hcFkrpnb0xKXN9sp2ouaESvPkpFBrAc1fXn7v3gzEbOeL
 XCuxDmHFtz191ZuR2in5GYUiBEUU6l9CHH54+2lA3KEjHSQWYiOxcNZFgmmgc7yu/q3I
 x73zMy+5xOlnN/limMbx8nYcPXXsyp1FaVgNnbQLiue8WOvjppPt8iGdRRICvSk5J/6F
 dQNw==
X-Gm-Message-State: AOAM532y9NJ7kGvSvoOjZAZ2BxPMvsM5lyhTvIz0X1qLKcTfsRQQaqvi
 qdlq/P2VqcUksureKfMgJ/nTFvg/axk=
X-Google-Smtp-Source: ABdhPJxUKhRAz/PWM+GFDl1UQIjQP4LpKNYDiN3NwmDD+jAQRTeXC1cWCNMa8C0aDGTDiuvKHp6WUA==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr12557150wmh.159.1593340057139; 
 Sun, 28 Jun 2020 03:27:37 -0700 (PDT)
Received: from rolandryzen (cpe90-146-109-250.liwest.at. [90.146.109.250])
 by smtp.gmail.com with ESMTPSA id d13sm33470596wrq.89.2020.06.28.03.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 03:27:36 -0700 (PDT)
Message-ID: <a6614e8e7cea68afc183c653dfe040035bbc36d6.camel@gmail.com>
Subject: Re: amdgpu freezes kernel after kernel 5.7.6 changes
From: roland.rucky@gmail.com
To: harry.wentland@amd.com
Date: Sun, 28 Jun 2020 12:27:35 +0200
In-Reply-To: <a99ef2e90d61552e7a81e4983e4dcff601f725f9.camel@gmail.com>
References: <a99ef2e90d61552e7a81e4983e4dcff601f725f9.camel@gmail.com>
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Cc: nicholas.kazlauskas@amd.com,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I narrowed it down even more. When reverting 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b5232e2ee8df85891514c73472cac09921e5d51d everything is stable. I have an uptime of 4+ hours while actively
trying to reproduce the bug (gaming).

Here is a bug report: 
https://gitlab.freedesktop.org/drm/amd/-/issues/1191

Added Nicholas Kazlauskas, author of the mentioned commit.

Am Samstag, den 27.06.2020, 18:03 +0200 schrieb roland.rucky@gmail.com:
> Not sure if I am contacting the correct person,
> 
> Since I updated to kernel 5.7.6, my system started to freeze
> randomly.
> After a couple of freezes, I noticed, that they always happen when
> playing games, or during videoplayback in e.g. firefox.
> 
> I reverted to the previous kernel 5.7.5, and all issues are gone.
> Next
> I started to revert and test single commits between the two kernel
> versions, which affect amdgpu. If I revert the changes listed below,
> the kernel does not freeze any more.
> 
> Sadly I can`t get any crash reports / logs. Even the magic sysrq key
> does not work, when the system is frozen.
> 
> I will also attach a patch, which includes all reverted commits.
> 
> 
> List of changes I reverted:
> -------------------------------------------------------------------
> ----
> 
> commit 6674508ba1a2ea6caca5de2bcb25bc00a050fd0a
> Author: Harry Wentland <harry.wentland@amd.com>
> Date:   Thu May 28 09:44:44 2020 -0400
> 
>     Revert "drm/amd/display: disable dcn20 abm feature for bring up"
> 
>     commit 14ed1c908a7a623cc0cbf0203f8201d1b7d31d16 upstream.
> 
>     This reverts commit 96cb7cf13d8530099c256c053648ad576588c387.
> 
>     This change was used for DCN2 bringup and is no longer desired.
>     In fact it breaks backlight on DCN2 systems.
> 
>     Cc: Alexander Monakov <amonakov@ispras.ru>
>     Cc: Hersen Wu <hersenxs.wu@amd.com>
>     Cc: Anthony Koo <Anthony.Koo@amd.com>
>     Cc: Michael Chiu <Michael.Chiu@amd.com>
>     Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>     Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>     Reported-and-tested-by: Alexander Monakov <amonakov@ispras.ru>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7fc15b82fe48..f9f02e08054b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1334,7 +1334,7 @@ static int dm_late_init(void *handle)
>  	unsigned int linear_lut[16];
>  	int i;
>  	struct dmcu *dmcu = adev->dm.dc->res_pool->dmcu;
> -	bool ret = false;
> +	bool ret;
> 
>  	for (i = 0; i < 16; i++)
>  		linear_lut[i] = 0xFFFF * i / 15;
> @@ -1350,13 +1350,10 @@ static int dm_late_init(void *handle)
>  	 */
>  	params.min_abm_backlight = 0x28F;
> 
> -	/* todo will enable for navi10 */
> -	if (adev->asic_type <= CHIP_RAVEN) {
> -		ret = dmcu_load_iram(dmcu, params);
> +	ret = dmcu_load_iram(dmcu, params);
> 
> -		if (!ret)
> -			return -EINVAL;
> -	}
> +	if (!ret)
> +		return -EINVAL;
> 
>  	return detect_mst_link_for_all_connectors(adev->ddev);
>  }
> 
> commit fba8f9ef7e1405ee6f422beb874791e8a5eb489c
> Author: Alex Deucher <alexander.deucher@amd.com>
> Date:   Tue Jun 2 17:22:48 2020 -0400
> 
>     drm/amdgpu/display: use blanked rather than plane state for sync
> groups
> 
>     commit b7f839d292948142eaab77cedd031aad0bfec872 upstream.
> 
>     We may end up with no planes set yet, depending on the ordering,
> but we
>     should have the proper blanking state which is either handled by
> either
>     DPG or TG depending on the hardware generation.  Check both to
> determine
>     the proper blanked state.
> 
>     Bug: https://gitlab.freedesktop.org/drm/amd/issues/781
>     Fixes: 5fc0cbfad45648 ("drm/amd/display: determine if a pipe is
> synced by plane state")
>     Cc: nicholas.kazlauskas@amd.com
>     Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c
> b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 4a619328101c..4acaf4be8a81 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -1011,9 +1011,17 @@ static void program_timing_sync(
>  			}
>  		}
> 
> -		/* set first pipe with plane as master */
> +		/* set first unblanked pipe as master */
>  		for (j = 0; j < group_size; j++) {
> -			if (pipe_set[j]->plane_state) {
> +			bool is_blanked;
> +
> +			if (pipe_set[j]->stream_res.opp->funcs-
> > dpg_is_blanked)
> +				is_blanked =
> +					pipe_set[j]->stream_res.opp-
> > funcs->dpg_is_blanked(pipe_set[j]->stream_res.opp);
> +			else
> +				is_blanked =
> +					pipe_set[j]->stream_res.tg-
> > funcs->is_blanked(pipe_set[j]->stream_res.tg);
> +			if (!is_blanked) {
>  				if (j == 0)
>  					break;
> 
> @@ -1034,9 +1042,17 @@ static void program_timing_sync(
>  				status->timing_sync_info.master =
> false;
> 
>  		}
> -		/* remove any other pipes with plane as they have
> already been synced */
> +		/* remove any other unblanked pipes as they have
> already been synced */
>  		for (j = j + 1; j < group_size; j++) {
> -			if (pipe_set[j]->plane_state) {
> +			bool is_blanked;
> +
> +			if (pipe_set[j]->stream_res.opp->funcs-
> > dpg_is_blanked)
> +				is_blanked =
> +					pipe_set[j]->stream_res.opp-
> > funcs->dpg_is_blanked(pipe_set[j]->stream_res.opp);
> +			else
> +				is_blanked =
> +					pipe_set[j]->stream_res.tg-
> > funcs->is_blanked(pipe_set[j]->stream_res.tg);
> +			if (!is_blanked) {
>  				group_size--;
>  				pipe_set[j] = pipe_set[group_size];
>  				j--;
> 
> commit b5232e2ee8df85891514c73472cac09921e5d51d
> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Date:   Tue Jun 2 20:42:33 2020 -0400
> 
>     drm/amd/display: Revalidate bandwidth before commiting DC updates
> 
>     [ Upstream commit a24eaa5c51255b344d5a321f1eeb3205f2775498 ]
> 
>     [Why]
>     Whenever we switch between tiled formats without also switching
> pixel
>     formats or doing anything else that recreates the DC plane state
> we
>     can run into underflow or hangs since we're not updating the
>     DML parameters before committing to the hardware.
> 
>     [How]
>     If the update type is FULL then call validate_bandwidth again to
> update
>     the DML parmeters before committing the state.
> 
>     This is basically just a workaround and protective measure
> against
>     update types being added DC where we could run into this issue in
>     the future.
> 
>     We can only fully validate the state in advance before applying
> it
> to
>     the hardware if we recreate all the plane and stream states since
>     we can't modify what's currently in use.
> 
>     The next step is to update DM to ensure that we're creating the
> plane
>     and stream states for whatever could potentially be a full update
> in
>     DC to pre-emptively recreate the state for DC global validation.
> 
>     The workaround can stay until this has been fixed in DM.
> 
>     Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>     Reviewed-by: Hersen Wu <hersenxs.wu@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c
> b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 47431ca6986d..4a619328101c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2517,6 +2517,12 @@ void dc_commit_updates_for_stream(struct dc
> *dc,
> 
>  	copy_stream_update_to_stream(dc, context, stream,
> stream_update);
> 
> +	if (!dc->res_pool->funcs->validate_bandwidth(dc, context,
> false)) {
> +		DC_ERROR("Mode validation failed for stream
> update!\n");
> +		dc_release_state(context);
> +		return;
> +	}
> +
>  	commit_planes_for_stream(
>  				dc,
>  				srf_updates,
> 
> Details:
> 
> * Kernel: 5.7.6
> * GPU: radeon 5700XT
> * CPU: ryzen 3800X
> * running on swaywm(wayland)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
