Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABAAF8E7F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6287E10E9C3;
	Fri,  4 Jul 2025 09:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuMU54HK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B2A10E9C7;
 Fri,  4 Jul 2025 09:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751621230; x=1783157230;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ma9eUAQnWCEc01GdL2V8DgdY1WZYS8Tdi+oAOCu1qg0=;
 b=OuMU54HK8tRqi/xxUeerQyU+7jYky0r+xC4cZ1gWZSTFKu8CTe+BKTJQ
 dT5cbcy66wnJRPT2tAq7YFeuzt120fweYB1vJ+0T8zCLhdu3opb9u6id5
 9uYwcbArGwaxp0hQ+8ATJ00ljqboHT3giS9Yoh/W/TO9mBjPjQuMMvJJ/
 2FH94H1qEgj0ai+qzUt7XudNqVo13c036PywR9ixiAas9gv3+lZmDbhzB
 xfZ5yw8FtI0shkZb7MPB/hQI0+73qRac5CESLtZPWtx+HhsILE9xWJgZM
 RVpkx6Lhw4LSTxsFTDKWL6i7vSMTkiCz8k/XDFhoEWZjou5TOCMwqLl8F Q==;
X-CSE-ConnectionGUID: wEi8HmwOTf66F0VXDiSTig==
X-CSE-MsgGUID: nth8adoRSsSmrpmfgQCBfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53177442"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="53177442"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 02:27:10 -0700
X-CSE-ConnectionGUID: kudKHLgkRMibSf8+o0frog==
X-CSE-MsgGUID: lnNbT7pEQsugJ/7Fmmbw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154241692"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 02:27:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, Hans
 de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH resend] drm/i915/bios: Apply vlv_fixup_mipi_sequences()
 to v2 mipi-sequences too
In-Reply-To: <20250703143824.7121-1-hansg@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250703143824.7121-1-hansg@kernel.org>
Date: Fri, 04 Jul 2025 12:26:59 +0300
Message-ID: <6e0bd049b2c64430c3ac87344f405868801edbbf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Jul 2025, Hans de Goede <hansg@kernel.org> wrote:
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

I believe you have the most extensive collection of VLV/CHV DSI
machines, and I basically take your word for what works and what
doesn't.

Acked-by: Jani Nikula <jani.nikula@intel.com>

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

-- 
Jani Nikula, Intel
