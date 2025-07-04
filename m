Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB1AF9079
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569010E9EE;
	Fri,  4 Jul 2025 10:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNhYGVXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0A810E9EB;
 Fri,  4 Jul 2025 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751625111; x=1783161111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7ZhPaokqQKx9RyejQP5ufZJMRn93ulHyJSYxNyEPkmo=;
 b=VNhYGVXqD6T652rgLvRvYIUOdOnujhSbZcuzrSXQ7cJf1j06YIn05TvD
 yncYk20SBAIuVpgvO1FwnL2fA8e5z1PMYfMV+dYGH6vtbSaUcHw1y0qdW
 lF/bmfsFh8YeuEj27nhpz5jCfWUkKUufeSj87CQJteqPxa/SLvR3p7i/K
 O64LYbFE4Q+l1pTEZZyd7Uhr8pZ9oFURYo1MptZh6nlYqar88COthFPkF
 8ethsOJEtx57hUPBdYhgxkKf1jJDrWIAt68X2tS6kDRzaglRbA7b5n4fA
 appmIwuwNNFD9HN6Hoo5+tnVMJ5HcvMiYqqFkYOob2dQ8+wFU3DWqsuby w==;
X-CSE-ConnectionGUID: g0yQ0aEVS6etk58ixlgFyg==
X-CSE-MsgGUID: 2a+k/y8GSlC+UDcGgPT4Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64560729"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64560729"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:31:50 -0700
X-CSE-ConnectionGUID: QijFhPPHRoWUcAZuOVGOnw==
X-CSE-MsgGUID: /CHKchKzTMSUA6AaxsPPfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="160286147"
Received: from johunt-mobl9.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.106])
 by orviesa005.jf.intel.com with SMTP; 04 Jul 2025 03:31:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Jul 2025 13:31:44 +0300
Date: Fri, 4 Jul 2025 13:31:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH resend] drm/i915/bios: Apply vlv_fixup_mipi_sequences()
 to v2 mipi-sequences too
Message-ID: <aGetkP3IZ0FYHzAz@intel.com>
References: <20250703143824.7121-1-hansg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703143824.7121-1-hansg@kernel.org>
X-Patchwork-Hint: comment
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

On Thu, Jul 03, 2025 at 04:38:24PM +0200, Hans de Goede wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> It turns out that the fixup from vlv_fixup_mipi_sequences() is necessary
> for some DSI panel's with version 2 mipi-sequences too.
> 
> Specifically the Acer Iconia One 8 A1-840 (not to be confused with the
> A1-840FHD which is different) has the following sequences:
> 
> BDB block 53 (1284 bytes) - MIPI sequence block:
> 	Sequence block version v2
> 	Panel 0 *
> 
> Sequence 2 - MIPI_SEQ_INIT_OTP
> 	GPIO index 9, source 0, set 0 (0x00)
> 	Delay: 50000 us
> 	GPIO index 9, source 0, set 1 (0x01)
> 	Delay: 6000 us
> 	GPIO index 9, source 0, set 0 (0x00)
> 	Delay: 6000 us
> 	GPIO index 9, source 0, set 1 (0x01)
> 	Delay: 25000 us
> 	Send DCS: Port A, VC 0, LP, Type 39, Length 5, Data ff aa 55 a5 80
> 	Send DCS: Port A, VC 0, LP, Type 39, Length 3, Data 6f 11 00
> 	...
> 	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 29
> 	Delay: 120000 us
> 
> Sequence 4 - MIPI_SEQ_DISPLAY_OFF
> 	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 28
> 	Delay: 105000 us
> 	Send DCS: Port A, VC 0, LP, Type 05, Length 2, Data 10 00
> 	Delay: 10000 us
> 
> Sequence 5 - MIPI_SEQ_ASSERT_RESET
> 	Delay: 10000 us
> 	GPIO index 9, source 0, set 0 (0x00)
> 
> Notice how there is no MIPI_SEQ_DEASSERT_RESET, instead the deassert
> is done at the beginning of MIPI_SEQ_INIT_OTP, which is exactly what
> the fixup from vlv_fixup_mipi_sequences() fixes up.
> 
> Extend it to also apply to v2 sequences, this fixes the panel not working
> on the Acer Iconia One 8 A1-840.

Do we have the full VBT for this machine already in some bug? If not,
please file a new issue with the VBT attached for posterity.

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index ba7b8938b17c..166ee11831ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1938,7 +1938,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
>  	int index, len;
>  
>  	if (drm_WARN_ON(display->drm,
> -			!data || panel->vbt.dsi.seq_version != 1))
> +			!data || panel->vbt.dsi.seq_version >= 3))
>  		return 0;
>  
>  	/* index = 1 to skip sequence byte */
> @@ -1961,7 +1961,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
>  }
>  
>  /*
> - * Some v1 VBT MIPI sequences do the deassert in the init OTP sequence.
> + * Some v1/v2 VBT MIPI sequences do the deassert in the init OTP sequence.
>   * The deassert must be done before calling intel_dsi_device_ready, so for
>   * these devices we split the init OTP sequence into a deassert sequence and
>   * the actual init OTP part.
> @@ -1972,9 +1972,9 @@ static void vlv_fixup_mipi_sequences(struct intel_display *display,
>  	u8 *init_otp;
>  	int len;
>  
> -	/* Limit this to v1 vid-mode sequences */
> +	/* Limit this to v1/v2 vid-mode sequences */
>  	if (panel->vbt.dsi.config->is_cmd_mode ||
> -	    panel->vbt.dsi.seq_version != 1)
> +	    panel->vbt.dsi.seq_version >= 3)
>  		return;
>  
>  	/* Only do this if there are otp and assert seqs and no deassert seq */
> -- 
> 2.49.0

-- 
Ville Syrjälä
Intel
