Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA1484F83
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 09:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FB610E82E;
	Wed,  5 Jan 2022 08:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95310E82E;
 Wed,  5 Jan 2022 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641372321; x=1672908321;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=riHgiHH3txI3gRT2luKsKqbMrT9muPYRCFRqvqUVq0s=;
 b=iMA7yEhTSm/GkdCpQPaPev6+iHmhu5DmpYNhy1VEhw3CgJA6iYuKZnA8
 VG2Pfzi520ZZjqHdeVzeqsp/ta/rCJrremOgsX3RFeuyW4NXGFMfbg3DJ
 Qes95UHqYQXijRMPiQqZuOM6JkGrW0/M5K19z+tM4VgLvfK9U6h5KYAKc
 FtEM6Igzley5muOpokSzmuLm6CMi+EN6orOb10ayl0Yesyr6WygfWhEpA
 SgaRNd3bgHCT6j1OOHyJscrKWM/NBTWPHA0TAcG2Vb59ygbN+JkWNficp
 L7mrcX3ewYIvdfibMwN0i0zY1kR52/1RAOKd2F9d2URmwMdYerhWq+rXi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="305750606"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="305750606"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 00:45:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="472408073"
Received: from menright-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.25.244])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 00:45:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@linux.ie
Subject: Re: [PATCH -next] drm/i915/fbc: replace DEFINE_SIMPLE_ATTRIBUTE
 with DEFINE_DEBUGFS_ATTRIBUTE
In-Reply-To: <20220105003929.16971-1-yang.lee@linux.alibaba.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220105003929.16971-1-yang.lee@linux.alibaba.com>
Date: Wed, 05 Jan 2022 10:45:14 +0200
Message-ID: <87bl0qtvtx.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 05 Jan 2022, Yang Li <yang.lee@linux.alibaba.com> wrote:
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/i915/display/intel_fbc.c:1757:0-23: WARNING:
> intel_fbc_debugfs_false_color_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 160fd2bdafe5..a43f5b74d6ac 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -1754,7 +1754,7 @@ static int intel_fbc_debugfs_false_color_set(void *data, u64 val)
>  	return 0;
>  }
>  
> -DEFINE_SIMPLE_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
> +DEFINE_DEBUGFS_ATTRIBUTE(intel_fbc_debugfs_false_color_fops,
>  			intel_fbc_debugfs_false_color_get,
>  			intel_fbc_debugfs_false_color_set,
>  			"%llu\n");

Please fix the indentation on the continuation lines.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
