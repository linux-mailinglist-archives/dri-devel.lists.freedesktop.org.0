Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F33249B0B5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6968410F0AA;
	Tue, 25 Jan 2022 09:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EB610F0AA;
 Tue, 25 Jan 2022 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643103976; x=1674639976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Bews4lBuVZO2mA+qEsZmOq3kp4a5aAW6TcZZtJKsARI=;
 b=E7V/5sG3H9pilh8S+vPSTRzxtLb9FhiBH7ylEOenp5sXy4EgtZNO0BRZ
 Q3YHDUpNhXbF2uHw+2MzS19OOLovtLWoNFR8+JHZ8OswPLLn0hD9FOP23
 sz5N8OKY28+7wGN4xJJzxuqV468FduhTVLq9HkJ8QEcIDNyWW1oXuqERk
 BJ/vxvofNdfMc2WT+TW9Xdqkm+uJdSIraT5kl0HWo4zMIBYVTrd0uk94e
 N0CiAVuCWtmu2HIG9e5SfZ3G0v+0a3UZjPwGIbfFCeRmZJOg0I4spiDnX
 zGUIIRvWDxYZ675XAcatDFQaqD5uMhjXBLTSfAWstIjd3FkZzx5br1pnd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="229840844"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="229840844"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:46:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="534657780"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:46:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/i915_hdmi: Fix the definition of
 intel_hdmi_dsc_get_bpp
In-Reply-To: <20220125085801.1025521-2-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
 <20220125085801.1025521-2-ankit.k.nautiyal@intel.com>
Date: Tue, 25 Jan 2022 11:45:57 +0200
Message-ID: <87fspc173e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jan 2022, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Fix the data-type of the argument output_format to enum, for the
> function intel_hdmi_dsc_get_bpp.

The subject prefix should be "drm/i915/hdmi:".

>
> Fixes: 6e6cb758e035 ("drm/i915: Add helper functions for calculating DSC
> parameters for HDMI2.1")

The Fixes: tag should not be wrapped.

>

Superfluous blank line.

> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: "Ville Syrj_l_" <ville.syrjala@linux.intel.com>
> Cc: "Jos_ Roberto de Souza" <jose.souza@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Werner Sembach <wse@tuxedocomputers.com>
> Cc: Aditya Swarup <aditya.swarup@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Please consider trimming the Cc lines manually, this is quite excessive
for a patch this simple.

> Cc: <stable@vger.kernel.org> # v5.12+

No, we don't really want to backport this stuff to stable. There's no
functional impact here.

>

Superfluous blank line.

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
>  drivers/gpu/drm/i915/display/intel_hdmi.h | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 45cf0ab04009..381a9de3a015 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3126,8 +3126,8 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
>   */
>  int
>  intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
> -		       int output_format, bool hdmi_all_bpp,
> -		       int hdmi_max_chunk_bytes)
> +		       enum intel_output_format output_format,
> +		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
>  {
>  	int max_dsc_bpp, min_dsc_bpp;
>  	int target_bytes;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index b577c38fa90c..fe40e49d2962 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -10,6 +10,7 @@
>  #include <linux/types.h>
>  
>  #include "i915_reg.h"
> +#include "intel_display_types.h"

Please avoid including headers from other headers if at all possible.

Here we can forward declare

enum intel_output_format;

along with the other forward declarations below. Strictly speaking it's
not standards compliant to forward declare enums but it does work and we
use it all over the place.

BR,
Jani.

>  
>  struct drm_connector;
>  struct drm_encoder;
> @@ -49,8 +50,8 @@ bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
>  bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
>  			     int bpc, bool has_hdmi_sink, bool ycbcr420_output);
>  int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
> -			   int num_slices, int output_format, bool hdmi_all_bpp,
> -			   int hdmi_max_chunk_bytes);
> +			   int num_slices, enum intel_output_format output_format,
> +			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
>  int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
>  				  int src_max_slices, int src_max_slice_width,
>  				  int hdmi_max_slices, int hdmi_throughput);

-- 
Jani Nikula, Intel Open Source Graphics Center
