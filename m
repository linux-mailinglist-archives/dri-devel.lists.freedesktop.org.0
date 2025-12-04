Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645CCA335C
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 11:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2093410E90E;
	Thu,  4 Dec 2025 10:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXHuvwVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAFD10E8D8;
 Thu,  4 Dec 2025 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764844003; x=1796380003;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CDuXg1gR8PMLq7Xf2ggOf7LFWCQJhOqps2N6L7CvgV4=;
 b=EXHuvwVw9UcSw9rv3ZCFyHXhx7dC4EMeTHIbzL3eK7NBQmKsiJ1aoA//
 k5XDvKleWK51LbjeTF18MTkcNO27XkmjPA8T1LFEe2hl+z12VasgW3LB5
 s6PgVZ54ZYBVXv803VVFCdA87gXLJhcqsP7ePawu8+FZezsmrWqdjiLle
 gUCSOCGW6z+jCltv1TWiJ2/k9vqSAQPTsSFUqt6bl2zSKxkifYPjg6vcc
 ZJ76Hh6Do59Et/8V9H4YjnMWVriTPkRG97C/tuayHxvnjzxyXQjulYeK6
 UUSTAGMbfnCSpjt2sJvYJrq5DKCw4Rjj8R9nm9DAHjJa3Uqp8wGgpOU4F w==;
X-CSE-ConnectionGUID: +vM0ULWNS/mnqiw2t9naig==
X-CSE-MsgGUID: AQ5kl0dgSi24/bbfbUhMTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84460994"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="84460994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 02:26:42 -0800
X-CSE-ConnectionGUID: ArnHlBx8TNWiwclw+gR6Xw==
X-CSE-MsgGUID: jhRM3qpMTZyXwb4u64Z0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="225906223"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 02:26:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Mika Kahola <mika.kahola@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/display: Avoid nonliteral printf format string
In-Reply-To: <20251204094401.1029917-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251204094401.1029917-1-arnd@kernel.org>
Date: Thu, 04 Dec 2025 12:26:34 +0200
Message-ID: <7579ed96424f51f171bee13f387f68c96f2d8a62@intel.com>
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

On Thu, 04 Dec 2025, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> pipe_config_mismatch() takes a printf-style format string and arguments,
> not a constant string, so this trigers -Wformat warnings when they are
> not disabled:
>
> drivers/gpu/drm/i915/display/intel_display.c: In function 'pipe_config_cx0pll_mismatch':
> drivers/gpu/drm/i915/display/intel_display.c:4997:9: error: format not a string literal and no format arguments [-Werror=format-security]
>  4997 |         pipe_config_mismatch(p, fastset, crtc, name, chipname);
>       |         ^~~~~~~~~~~~~~~~~~~~
>
> drivers/gpu/drm/i915/display/intel_display.c: In function 'pipe_config_lt_phy_pll_mismatch':
> drivers/gpu/drm/i915/display/intel_display.c:5027:9: error: format not a string literal and no format arguments [-Werror=format-security]
>  5027 |         pipe_config_mismatch(p, fastset, crtc, name, chipname);
>       |         ^~~~~~~~~~~~~~~~~~~~
>
> Use either the string literal or the trivial "%s" format so the compiler can
> prove this to be used correctly.
>
> Fixes: 45fe957ae769 ("drm/i915/display: Add compare config for MTL+ platforms")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Unfortunately, this no longer applies to
drm-intel-next. pipe_config_cx0pll_mismatch() no longer exists. The 2nd
hunk is still valid, though, want to send a rebased version?

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 7b4fd18c60e2..83025d5a4aa9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4987,7 +4987,7 @@ pipe_config_cx0pll_mismatch(struct drm_printer *p, bool fastset,
>  	struct intel_display *display = to_intel_display(crtc);
>  	char *chipname = a->use_c10 ? "C10" : "C20";
>  
> -	pipe_config_mismatch(p, fastset, crtc, name, chipname);
> +	pipe_config_mismatch(p, fastset, crtc, name, "%s", chipname);
>  
>  	drm_printf(p, "expected:\n");
>  	intel_cx0pll_dump_hw_state(display, a);
> @@ -5022,9 +5022,8 @@ pipe_config_lt_phy_pll_mismatch(struct drm_printer *p, bool fastset,
>  				const struct intel_lt_phy_pll_state *b)
>  {
>  	struct intel_display *display = to_intel_display(crtc);
> -	char *chipname = "LTPHY";
>  
> -	pipe_config_mismatch(p, fastset, crtc, name, chipname);
> +	pipe_config_mismatch(p, fastset, crtc, name, "LTPHY");
>  
>  	drm_printf(p, "expected:\n");
>  	intel_lt_phy_dump_hw_state(display, a);

-- 
Jani Nikula, Intel
