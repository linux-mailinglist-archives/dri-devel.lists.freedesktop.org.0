Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E185F378C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 23:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190AC10E4DA;
	Mon,  3 Oct 2022 21:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C66810E4DA;
 Mon,  3 Oct 2022 21:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664831913; x=1696367913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W5ktSIXhzy/XlJEAIhWRzO7M1dFIO9XfN3vvhR8jSVQ=;
 b=SJOHWES42dNC34NCSQ2sxSxmFcz4YVslU3ZYbBXDIMaYmptLIdUfEayN
 e+tQoaUJt7btw4KkLqGqamTpzUa6ThUYWD1yDhvN1taTfpYjW685HfyKu
 3wtnc3/vPmJ2SeJNnTzxIKpE1aKyUlV+IBWBcWR1Pmb5TI/kDhFhyB9lx
 dX0QYgVY1H7sdWSISilzjvNYGwOEY1FXVDcogMlrMDBM4oE7TW+YBzJhn
 8EsgP9u9IAx5CQwKKLYeFSi/46SU7sX/uSJS+qyQTVyVrNNgn6kk3j8Cq
 KPVrbVHqsh70SB8Y+9yeo8Fg0OVF8wH9BEk9Ziqo0xVqU880PM6ZNf8pE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="301482834"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="301482834"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:18:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="618888983"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="618888983"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:18:19 -0700
Date: Mon, 3 Oct 2022 23:18:16 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/hwmon: Expose card reactive
 critical power
Message-ID: <YztRmDRnabDpxTaD@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-6-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927055020.3499420-6-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

[...]

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 7525db243d74..f9d6d3b08bba 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,32 @@ Description:	RO. Card default power limit (default TDP setting).
>  
>  		Only supported for particular Intel i915 graphics platforms.
>  
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		February 2023
> +KernelVersion:	6.2
> +Contact:	dri-devel@lists.freedesktop.org

same question here, why dri-devel and not intel-gfx?

Andi

> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>  What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
>  Date:		February 2023
>  KernelVersion:	6.2
