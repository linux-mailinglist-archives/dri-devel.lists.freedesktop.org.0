Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197B27FA0C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 09:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A776E851;
	Thu,  1 Oct 2020 07:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB7B6E84E;
 Thu,  1 Oct 2020 07:17:48 +0000 (UTC)
IronPort-SDR: AXoGyvV5sidbqoMJxUksGNNkNyrtUo3u6kwHGkC35bHASEFAgNKx/iqCNmQjhoKHkyww3QKxpL
 QBpMEfd3TApg==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="142052871"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="142052871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 00:17:47 -0700
IronPort-SDR: hQAnFbHrggiNVBl/HoBC3opMLY2zRyjfFl5LSVDrrgjsbmHbQtlYBmz0TJCei/TsPZ/MpBtnX7
 msTS//YjxLvA==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="458010142"
Received: from liammcl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.11.248])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 00:17:40 -0700
MIME-Version: 1.0
In-Reply-To: <20200928233102.24265-11-paulmck@kernel.org>
References: <20200928233041.GA23230@paulmck-ThinkPad-P72>
 <20200928233102.24265-11-paulmck@kernel.org>
To: paulmck@kernel.org, rcu@vger.kernel.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH tip/core/rcu 11/15] drm/i915: Cleanup PREEMPT_COUNT
 leftovers
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160153665673.4398.6268028176406103680@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 01 Oct 2020 10:17:37 +0300
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
Cc: peterz@infradead.org, fweisbec@gmail.com, jiangshanlai@gmail.com,
 dri-devel@lists.freedesktop.org, oleg@redhat.com, dhowells@redhat.com,
 edumazet@google.com, joel@joelfernandes.org, mingo@kernel.org,
 David Airlie <airlied@linux.ie>, kernel-team@fb.com,
 "Paul E . McKenney" <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 josh@joshtriplett.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, tglx@linutronix.de, mhocko@kernel.org,
 mgorman@techsingularity.net, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting paulmck@kernel.org (2020-09-29 02:30:58)
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> CONFIG_PREEMPT_COUNT is now unconditionally enabled and will be
> removed. Cleanup the leftovers before doing so.

Change looks fine:

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Are you looking for us to merge or merge through another tree?

If us, did the base patch always enabling PREEMPT_COUNT go into 5.9 or is
it heading to 5.10? We can queue this earliest for 5.11 as drm-next closed
for 5.10 at week of -rc5.

Regards, Joonas

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> ---
>  drivers/gpu/drm/i915/Kconfig.debug | 1 -
>  drivers/gpu/drm/i915/i915_utils.h  | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 1cb28c2..17d9b00 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -20,7 +20,6 @@ config DRM_I915_DEBUG
>         bool "Enable additional driver debugging"
>         depends on DRM_I915
>         select DEBUG_FS
> -       select PREEMPT_COUNT
>         select I2C_CHARDEV
>         select STACKDEPOT
>         select DRM_DP_AUX_CHARDEV
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 5477337..ecfed86 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -337,8 +337,7 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>                                                    (Wmax))
>  #define wait_for(COND, MS)             _wait_for((COND), (MS) * 1000, 10, 1000)
>  
> -/* If CONFIG_PREEMPT_COUNT is disabled, in_atomic() always reports false. */
> -#if defined(CONFIG_DRM_I915_DEBUG) && defined(CONFIG_PREEMPT_COUNT)
> +#ifdef CONFIG_DRM_I915_DEBUG
>  # define _WAIT_FOR_ATOMIC_CHECK(ATOMIC) WARN_ON_ONCE((ATOMIC) && !in_atomic())
>  #else
>  # define _WAIT_FOR_ATOMIC_CHECK(ATOMIC) do { } while (0)
> -- 
> 2.9.5
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
