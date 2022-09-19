Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8B5BD7C6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 01:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE1810E1CE;
	Mon, 19 Sep 2022 23:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF9210E1B7;
 Mon, 19 Sep 2022 23:02:28 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MWgDg5B7ZzDqyC;
 Mon, 19 Sep 2022 23:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1663628548; bh=Ng+B7Gs072RWl3tC9QXLgNF+qBt0++YpuTftF9HTbYI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F6tvqREWSqmt2Z8/1FXzRNugc3GRzfs2/HRxrNARq0mKmfmzbhqTkCO3umkQth10L
 RMyVx5/p1pdcSp9YpaAD0MLGWF7kXWTwYRQA5d+gz0/3uixZVYSI0KRyJxr6phliqz
 lxvNaRNJHG/eGoiU1DKgq6rFuuBCfOP+y8964T7c=
X-Riseup-User-ID: 6B0B42472D53A10BC3B362BD7EDEAD4DA729B8CA4F727E7E52A2328E8F50C1E3
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MWgDX55xCz1y9N;
 Mon, 19 Sep 2022 23:02:20 +0000 (UTC)
Message-ID: <e2d2c79a-42f0-f445-f206-100568c236cf@riseup.net>
Date: Mon, 19 Sep 2022 20:02:18 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: remove redundant CalculateTWait's
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, aric.cyr@amd.com, Nevenko.Stupar@amd.com,
 Pavle.Kotarac@amd.com, aurabindo.pillai@amd.com, Bing.Guo@amd.com,
 hamza.mahfooz@amd.com, nicholas.kazlauskas@amd.com,
 agustin.gutierrez@amd.com, nathan@kernel.org, mdaenzer@redhat.com,
 Charlene.Liu@amd.com
References: <20220919023709.3447570-1-trix@redhat.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220919023709.3447570-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom,

On 9/18/22 23:37, Tom Rix wrote:
> There are several copies of CalculateTwait.
> Reduce to one instance and change local variable name to match common usage.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Although, it would be nice to put this function on the
display_mode_vba.h file, as all DCNs use this function.

Best Regards,
- Maíra Canal

> ---
>  .../dc/dml/dcn20/display_mode_vba_20.c        | 16 +++++++-------
>  .../dc/dml/dcn20/display_mode_vba_20v2.c      | 21 ++-----------------
>  .../dc/dml/dcn21/display_mode_vba_21.c        | 19 +----------------
>  .../dc/dml/dcn30/display_mode_vba_30.c        | 18 +---------------
>  .../dc/dml/dcn31/display_mode_vba_31.c        | 13 +-----------
>  .../dc/dml/dcn314/display_mode_vba_314.c      | 13 +-----------
>  6 files changed, 14 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index 6e9d7e2b5243..4ca080950924 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -153,10 +153,10 @@ static unsigned int CalculateVMAndRowBytes(
>  		bool *PTEBufferSizeNotExceeded,
>  		unsigned int *dpte_row_height,
>  		unsigned int *meta_row_height);
> -static double CalculateTWait(
> +double CalculateTWait(
>  		unsigned int PrefetchMode,
>  		double DRAMClockChangeLatency,
> -		double UrgentLatencyPixelDataOnly,
> +		double UrgentLatency,
>  		double SREnterPlusExitTime);
>  static double CalculateRemoteSurfaceFlipDelay(
>  		struct display_mode_lib *mode_lib,
> @@ -2892,20 +2892,20 @@ static void dml20_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  	}
>  }
>  
> -static double CalculateTWait(
> +double CalculateTWait(
>  		unsigned int PrefetchMode,
>  		double DRAMClockChangeLatency,
> -		double UrgentLatencyPixelDataOnly,
> +		double UrgentLatency,
>  		double SREnterPlusExitTime)
>  {
>  	if (PrefetchMode == 0) {
>  		return dml_max(
> -				DRAMClockChangeLatency + UrgentLatencyPixelDataOnly,
> -				dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly));
> +				DRAMClockChangeLatency + UrgentLatency,
> +				dml_max(SREnterPlusExitTime, UrgentLatency));
>  	} else if (PrefetchMode == 1) {
> -		return dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly);
> +		return dml_max(SREnterPlusExitTime, UrgentLatency);
>  	} else {
> -		return UrgentLatencyPixelDataOnly;
> +		return UrgentLatency;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> index b02dda8ce70f..2b4dcae4e432 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> @@ -177,10 +177,10 @@ static unsigned int CalculateVMAndRowBytes(
>  		bool *PTEBufferSizeNotExceeded,
>  		unsigned int *dpte_row_height,
>  		unsigned int *meta_row_height);
> -static double CalculateTWait(
> +double CalculateTWait(
>  		unsigned int PrefetchMode,
>  		double DRAMClockChangeLatency,
> -		double UrgentLatencyPixelDataOnly,
> +		double UrgentLatency,
>  		double SREnterPlusExitTime);
>  static double CalculateRemoteSurfaceFlipDelay(
>  		struct display_mode_lib *mode_lib,
> @@ -2967,23 +2967,6 @@ static void dml20v2_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  	}
>  }
>  
> -static double CalculateTWait(
> -		unsigned int PrefetchMode,
> -		double DRAMClockChangeLatency,
> -		double UrgentLatencyPixelDataOnly,
> -		double SREnterPlusExitTime)
> -{
> -	if (PrefetchMode == 0) {
> -		return dml_max(
> -				DRAMClockChangeLatency + UrgentLatencyPixelDataOnly,
> -				dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly));
> -	} else if (PrefetchMode == 1) {
> -		return dml_max(SREnterPlusExitTime, UrgentLatencyPixelDataOnly);
> -	} else {
> -		return UrgentLatencyPixelDataOnly;
> -	}
> -}
> -
>  static double CalculateRemoteSurfaceFlipDelay(
>  		struct display_mode_lib *mode_lib,
>  		double VRatio,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> index 6be14f55c78d..a3ef3638d979 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> @@ -205,7 +205,7 @@ static unsigned int CalculateVMAndRowBytes(
>  		unsigned int *DPDE0BytesFrame,
>  		unsigned int *MetaPTEBytesFrame);
>  
> -static double CalculateTWait(
> +double CalculateTWait(
>  		unsigned int PrefetchMode,
>  		double DRAMClockChangeLatency,
>  		double UrgentLatency,
> @@ -2980,23 +2980,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  	}
>  }
>  
> -static double CalculateTWait(
> -		unsigned int PrefetchMode,
> -		double DRAMClockChangeLatency,
> -		double UrgentLatency,
> -		double SREnterPlusExitTime)
> -{
> -	if (PrefetchMode == 0) {
> -		return dml_max(
> -				DRAMClockChangeLatency + UrgentLatency,
> -				dml_max(SREnterPlusExitTime, UrgentLatency));
> -	} else if (PrefetchMode == 1) {
> -		return dml_max(SREnterPlusExitTime, UrgentLatency);
> -	} else {
> -		return UrgentLatency;
> -	}
> -}
> -
>  static double CalculateRemoteSurfaceFlipDelay(
>  		struct display_mode_lib *mode_lib,
>  		double VRatio,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index 229548733177..74f5d9742f59 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -216,7 +216,7 @@ static unsigned int CalculateVMAndRowBytes(
>  		unsigned int *PTERequestSize,
>  		unsigned int *DPDE0BytesFrame,
>  		unsigned int *MetaPTEBytesFrame);
> -static double CalculateTWait(
> +double CalculateTWait(
>  		unsigned int PrefetchMode,
>  		double DRAMClockChangeLatency,
>  		double UrgentLatency,
> @@ -3191,22 +3191,6 @@ void dml30_CalculateBytePerPixelAnd256BBlockSizes(
>  	}
>  }
>  
> -static double CalculateTWait(
> -		unsigned int PrefetchMode,
> -		double DRAMClockChangeLatency,
> -		double UrgentLatency,
> -		double SREnterPlusExitTime)
> -{
> -	if (PrefetchMode == 0) {
> -		return dml_max(DRAMClockChangeLatency + UrgentLatency,
> -				dml_max(SREnterPlusExitTime, UrgentLatency));
> -	} else if (PrefetchMode == 1) {
> -		return dml_max(SREnterPlusExitTime, UrgentLatency);
> -	} else {
> -		return UrgentLatency;
> -	}
> -}
> -
>  double dml30_CalculateWriteBackDISPCLK(
>  		enum source_format_class WritebackPixelFormat,
>  		double PixelClock,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index 58dc4c046cf4..4563342275f1 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -230,7 +230,7 @@ static unsigned int CalculateVMAndRowBytes(
>  		unsigned int *PTERequestSize,
>  		int *DPDE0BytesFrame,
>  		int *MetaPTEBytesFrame);
> -static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
> +double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
>  static void CalculateRowBandwidth(
>  		bool GPUVMEnable,
>  		enum source_format_class SourcePixelFormat,
> @@ -3323,17 +3323,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
>  			&dummysinglestring);
>  }
>  
> -static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
> -{
> -	if (PrefetchMode == 0) {
> -		return dml_max(DRAMClockChangeLatency + UrgentLatency, dml_max(SREnterPlusExitTime, UrgentLatency));
> -	} else if (PrefetchMode == 1) {
> -		return dml_max(SREnterPlusExitTime, UrgentLatency);
> -	} else {
> -		return UrgentLatency;
> -	}
> -}
> -
>  double dml31_CalculateWriteBackDISPCLK(
>  		enum source_format_class WritebackPixelFormat,
>  		double PixelClock,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> index 7024412fe441..89a80eef42f4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> @@ -244,7 +244,7 @@ static unsigned int CalculateVMAndRowBytes(
>  		unsigned int *PTERequestSize,
>  		int *DPDE0BytesFrame,
>  		int *MetaPTEBytesFrame);
> -static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
> +double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime);
>  static void CalculateRowBandwidth(
>  		bool GPUVMEnable,
>  		enum source_format_class SourcePixelFormat,
> @@ -3547,17 +3547,6 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
>  	return true;
>  }
>  
> -static double CalculateTWait(unsigned int PrefetchMode, double DRAMClockChangeLatency, double UrgentLatency, double SREnterPlusExitTime)
> -{
> -	if (PrefetchMode == 0) {
> -		return dml_max(DRAMClockChangeLatency + UrgentLatency, dml_max(SREnterPlusExitTime, UrgentLatency));
> -	} else if (PrefetchMode == 1) {
> -		return dml_max(SREnterPlusExitTime, UrgentLatency);
> -	} else {
> -		return UrgentLatency;
> -	}
> -}
> -
>  double dml314_CalculateWriteBackDISPCLK(
>  		enum source_format_class WritebackPixelFormat,
>  		double PixelClock,
