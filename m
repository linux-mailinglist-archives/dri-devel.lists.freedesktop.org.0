Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9745955A0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 10:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E107BC4E5A;
	Tue, 16 Aug 2022 08:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A48C3F98;
 Tue, 16 Aug 2022 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660640002; x=1692176002;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=K6Og00L1IjRsIWgGWRQD8kVwArgaWlic4/wfGISF5fQ=;
 b=DE0LYbKjehhUE3A4voSSpqWJu2fIh1i85k5BPrKyBcfQzfc8azDkIieb
 c14Y5yx99K1NtMZgPFfTAS1BZ60YS79vBGujGZPY7RaU4O4BZerofcOxK
 tT9Xh8RWP3jRbFkz00huefs+yPlIxWGXzjm7CnHlmUt5+54Ij7cdQtO24
 xnjSpInO65C9M7ZW6lmSoIxDtoipnkX7s5LUSA4fpf0NAKiJ0nofRB3xq
 58OGIQv5M2ONWk4XjMOSoEyCMTCFjDiHFNfky8rKT8yqJnMLQ/XPp1qWJ
 ePv1vRJJ6/dv36vED4LC8C9S2wXrSPaQeWrlCekYOVRsWEwNmiv+3c351 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="275219719"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="275219719"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 01:53:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="583220366"
Received: from kinzelba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 01:53:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bo Liu <liubo03@inspur.com>, airlied@linux.ie, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, linus.walleij@linaro.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Subject: Re: [PATCH] drm: Fix all occurences of the "the the" typo
In-Reply-To: <20220816083759.4382-1-liubo03@inspur.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220816083759.4382-1-liubo03@inspur.com>
Date: Tue, 16 Aug 2022 11:53:14 +0300
Message-ID: <87edxgr2md.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Bo Liu <liubo03@inspur.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Aug 2022, Bo Liu <liubo03@inspur.com> wrote:
> There are double "the" in messages in file drm_dp_helper.c,
> i915_irq.c and panel-novatek-nt35510.c, fix it.

Please split to three patches.

BR,
Jani.

>
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 2 +-
>  drivers/gpu/drm/i915/i915_irq.c               | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e5bab236b3ae..32b295003f49 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct drm_dp_aux_msg *msg)
>  
>  /*
>   * Calculate the length of the i2c transfer in usec, assuming
> - * the i2c bus speed is as specified. Gives the the "worst"
> + * the i2c bus speed is as specified. Gives the "worst"
>   * case estimate, ie. successful while as long as possible.
>   * Doesn't account the "MOT" bit, and instead assumes each
>   * message includes a START, ADDRESS and STOP. Neither does it
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 73cebc6aa650..783a6ca41a61 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -65,7 +65,7 @@
>  
>  /*
>   * Interrupt statistic for PMU. Increments the counter only if the
> - * interrupt originated from the the GPU so interrupts from a device which
> + * interrupt originated from the GPU so interrupts from a device which
>   * shares the interrupt line are not accounted.
>   */
>  static inline void pmu_irq_stats(struct drm_i915_private *i915,
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index 40ea41b0a5dd..4085822f619a 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -231,7 +231,7 @@ struct nt35510_config {
>  	 * bits 0..2 in the lower nibble controls HCK, the booster clock
>  	 * frequency, the values are the same as for PCK in @bt1ctr.
>  	 * bits 4..5 in the upper nibble controls BTH, the boosting
> -	 * amplification for the the step-up circuit.
> +	 * amplification for the step-up circuit.
>  	 * 0 = AVDD + VDDB
>  	 * 1 = AVDD - AVEE
>  	 * 2 = AVDD - AVEE + VDDB

-- 
Jani Nikula, Intel Open Source Graphics Center
