Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E3D9398DA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 06:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C783810E343;
	Tue, 23 Jul 2024 04:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XjWadY0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F338A10E260;
 Tue, 23 Jul 2024 04:24:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B00A60A23;
 Tue, 23 Jul 2024 04:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859FDC4AF0C;
 Tue, 23 Jul 2024 04:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721708662;
 bh=b+/UhKRdO01MBVJflNIZgGIuDWT+kECWlSkFyJLs79A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XjWadY0khbOna8w6igG13xlZMKf2O7B0W8Fe5DjLqlD5gO4ZH3+Kd1UANiK5YqMC5
 8n56bI2axfzSSjbRLP8pVtsJemUJW7OHvKQIFUeS0jGzS/hWrQ7yY7BedSgUNd5Z1U
 4WfAIefuMGM4qqKrhiXucn0m4QETSoONnIjRVL1uBKHJFuuFae9st1buKRguaMH79X
 oF5KZMlJf0kSAMXOTGHBR38et6zlwU9Va/qVIJksbtPqS8aW0S4m+/GJzg+teaBPOI
 4TFy/gsHfJ8G0+4k/iF4FJAza/AAHsQ7DmQNPOjQ/mlmALzkVcsx0IGXxBSTCFarrx
 JcPugYkkwM/Kg==
Date: Mon, 22 Jul 2024 21:24:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and
 120Hz
Message-ID: <20240723042420.GA1455@sol.localdomain>
References: <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
 <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
 <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
 <CABXGCsOsfP2SToiDhRAS51nPJ+Qr2v7B3Kjr+yVeP4G7zFZpMA@mail.gmail.com>
 <CADnq5_Mjxna+aqhWT49YLmXGH+piittc4FUSyCDEJ8s7G-Rb3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_Mjxna+aqhWT49YLmXGH+piittc4FUSyCDEJ8s7G-Rb3Q@mail.gmail.com>
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

On Tue, Jul 16, 2024 at 01:10:37PM -0400, Alex Deucher wrote:
> From 8aaf8da07a8b542c0a0f4da2601da07beddfdeb0 Mon Sep 17 00:00:00 2001
> From: Alex Deucher <alexander.deucher@amd.com>
> Date: Tue, 16 Jul 2024 12:49:25 -0400
> Subject: [PATCH] drm/amd/display: fix corruption with high refresh rates on
>  DCN 3.0
> 
> This reverts commit bc87d666c05a13e6d4ae1ddce41fc43d2567b9a2 and the
> register changes from commit 6d4279cb99ac4f51d10409501d29969f687ac8dc.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3478
> Cc: mikhail.v.gavrilov@gmail.com
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  .../drm/amd/display/dc/optc/dcn10/dcn10_optc.c    | 15 +++------------
>  .../drm/amd/display/dc/optc/dcn20/dcn20_optc.c    | 10 ++++++++++
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> index 4f82146d94b1..f00d27b7c6fe 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
> @@ -950,19 +950,10 @@ void optc1_set_drr(
>  				OTG_FORCE_LOCK_ON_EVENT, 0,
>  				OTG_SET_V_TOTAL_MIN_MASK_EN, 0,
>  				OTG_SET_V_TOTAL_MIN_MASK, 0);
> -
> -		// Setup manual flow control for EOF via TRIG_A
> -		optc->funcs->setup_manual_trigger(optc);
> -
> -	} else {
> -		REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
> -				OTG_SET_V_TOTAL_MIN_MASK, 0,
> -				OTG_V_TOTAL_MIN_SEL, 0,
> -				OTG_V_TOTAL_MAX_SEL, 0,
> -				OTG_FORCE_LOCK_ON_EVENT, 0);
> -
> -		optc->funcs->set_vtotal_min_max(optc, 0, 0);
>  	}
> +
> +	// Setup manual flow control for EOF via TRIG_A
> +	optc->funcs->setup_manual_trigger(optc);
>  }
>  
>  void optc1_set_vtotal_min_max(struct timing_generator *optc, int vtotal_min, int vtotal_max)
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> index 43417cff2c9b..b4694985a40a 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> @@ -453,6 +453,16 @@ void optc2_setup_manual_trigger(struct timing_generator *optc)
>  {
>  	struct optc *optc1 = DCN10TG_FROM_TG(optc);
>  
> +	/* Set the min/max selectors unconditionally so that
> +	 * DMCUB fw may change OTG timings when necessary
> +	 * TODO: Remove the w/a after fixing the issue in DMCUB firmware
> +	 */
> +	REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
> +				 OTG_V_TOTAL_MIN_SEL, 1,
> +				 OTG_V_TOTAL_MAX_SEL, 1,
> +				 OTG_FORCE_LOCK_ON_EVENT, 0,
> +				 OTG_SET_V_TOTAL_MIN_MASK, (1 << 1)); /* TRIGA */
> +
>  	REG_SET_8(OTG_TRIGA_CNTL, 0,
>  			OTG_TRIGA_SOURCE_SELECT, 21,
>  			OTG_TRIGA_SOURCE_PIPE_SELECT, optc->inst,
> -- 
> 2.45.2

This patch fixes the bug for me too.  I am using a Radeon RX 6400, and I've been
encountering the bug when using 1920x1080 resolution on a monitor whose native
resolution is 2560x1440.  Feel free to add:

    Tested-by: Eric Biggers <ebiggers@kernel.org>

Thanks,

- Eric
