Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE578D65E5
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 17:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF78B10E10C;
	Fri, 31 May 2024 15:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="mB1YfGVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEE110E10C;
 Fri, 31 May 2024 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=BK0lac02MNaStyn+3Zy8cAwlufhllQe54r3zrUsXI1M=; b=mB1YfGVFyFVWCtPAGvOyLQLQUA
 ZQXOmYELgdul8Go9nJYOtWA4sAYG5BCcfKcultVk7arYl4pkXCwXblTWNEFoRhJjNUH61cbdKT8qm
 yk5XfX/j6Prz0MtAFaWDmSbeuJIDXp7ZnREJvAMaFBsBwo6oGFaSoUVcTLQmr0sL0UsIIgAh3gJ0o
 kufgW6LN1Vk1F3AbP3/XD5L/RwHidE6lONY0rGfp7H+hgoG9nebL2Pt/jk0DOB8cqPKA8lsinrZPa
 KZE0CNKo8njhBwTe5yqghny425aB9ft+O4NKAaQ4wSxDHqssWwiU3ZGg5LeaR+29tEGkdJokDpHZs
 Y4jKFG7Q==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sD4KA-0000000AiH7-3OIG; Fri, 31 May 2024 15:37:47 +0000
Message-ID: <833fac2c-91f9-4e9a-9b9e-da2db955a488@infradead.org>
Date: Fri, 31 May 2024 08:37:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amd/display: Fix a handful of spelling mistakes
To: Colin Ian King <colin.i.king@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240531093211.498880-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240531093211.498880-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/31/24 2:32 AM, Colin Ian King wrote:
> There are a few spelling mistakes in dml2_printf messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
>  .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c  | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> index 8062144a5a6d..e7e6751f4477 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> @@ -5731,7 +5731,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
>  		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
>  		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
>  		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
> -		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
> +		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
>  		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
>  		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
>  		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
> @@ -8268,7 +8268,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
>  	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
>  	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
>  	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
> -	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
> +	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
>  #endif
>  
>  	mode_lib->ms.support.OutstandingRequestsSupport = true;
> @@ -11089,7 +11089,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
>  				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
>  					mode_lib->mp.ImmediateFlipSupported = false;
>  #ifdef __DML_VBA_DEBUG__
> -					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
> +					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
>  #endif
>  				}
>  			}
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> index f2e2250d28d3..6eb3fec87ec1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
> @@ -1988,7 +1988,7 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
>  	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
>  	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
>  	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
> -	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
> +	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
>  #endif
>  
>  	mode_lib->ms.support.OutstandingRequestsSupport = true;
> @@ -8131,7 +8131,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
>  		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
>  		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
>  		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
> -		dml2_printf("DML: To: %fus - time for propogation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
> +		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
>  		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
>  		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
>  		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
> @@ -10959,7 +10959,7 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
>  				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
>  					mode_lib->mp.ImmediateFlipSupported = false;
>  #ifdef __DML_VBA_DEBUG__
> -					dml2_printf("DML::%s: Pipe %0d not supporing iflip!\n", __func__, k);
> +					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
>  #endif
>  				}
>  			}

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
