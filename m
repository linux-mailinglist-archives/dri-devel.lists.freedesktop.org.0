Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4258A16FE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 16:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F7410F103;
	Thu, 11 Apr 2024 14:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLqmpnZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803BE10EFBB;
 Thu, 11 Apr 2024 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712845181; x=1744381181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WGQd7aVRbKoRNEBP/YfDyFHdzvJSCsSH6PI+Cmh01wQ=;
 b=RLqmpnZ6E1yykvFukQP6dxY6PrgN+iHtkxf2LybKJaKUUYRaQQI4Ztn3
 mdzBHmd081FPrA5jKYBlkm+eLL0moZ96ZuTNMSeTz1DNdjgY/6PNxFW3S
 S/8Z/TV1KuzEEBI41tJKfkYr2ui3iByc/B+8h8jL0y1HNy9okNtL73/uT
 V/21faauWv7EdT92Yx2aB/tHLHGli0EJNQTIB+YEDye9GY+1xfNL++FbW
 4xEv0viqTaHGHEaUYLsCQMb9OsKl1vFu54dO1HyAswn40hkhZWKg8Ub0R
 56u5JAPlmr1N8av3Tt7tPB0bZTdnox6BRoPw4j/l5vBHh+meCEKCro40X Q==;
X-CSE-ConnectionGUID: k9X5DQPPQG2Znc9G+Ij0dw==
X-CSE-MsgGUID: y/o/YIV8RXKn1n7HzA/zVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8112668"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8112668"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:19:41 -0700
X-CSE-ConnectionGUID: XK56ZgNxR2eXGttRX3hCYQ==
X-CSE-MsgGUID: spbwNuM/S1mhEL6GlTQzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="51883931"
Received: from unknown (HELO intel.com) ([10.247.119.2])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:19:35 -0700
Date: Thu, 11 Apr 2024 16:19:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 05/10] drm: move intel_lpe_audio.h under include/drm/intel
Message-ID: <Zhfxb2TWL_Cdh5sW@ashyti-mobl2.lan>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <bf584e79e13001b962370a26e3b93c1c57ac6a1e.1712743191.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf584e79e13001b962370a26e3b93c1c57ac6a1e.1712743191.git.jani.nikula@intel.com>
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

Hi Jani,

On Wed, Apr 10, 2024 at 01:05:12PM +0300, Jani Nikula wrote:
> Clean up the top level include/drm directory by grouping all the Intel
> specific files under a common subdirectory.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c      | 2 +-
>  drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
>  include/drm/{ => intel}/intel_lpe_audio.h      | 0

strange thing here is that we have two different
intel_lpe_audio.h. Can't they be merged?

And, perhaps, we could also think of dropping the intel_ prefix
for the files inside drm/intel/.

In any case,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
