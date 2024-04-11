Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60378A16E3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 16:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921CC10F101;
	Thu, 11 Apr 2024 14:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA90jp1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C3210F0FE;
 Thu, 11 Apr 2024 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712844856; x=1744380856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DJwdimLm9rCaUQifcZV58NFjlFt4JCL99Pd5nIllDzQ=;
 b=CA90jp1Mp5TMEiRfl4mFI159MaN8QqZrphv2dMIrYjhK+MxyUha8BP7Q
 /7fGt7bQwupLVN+7Ro79590K5MIYDc1OKiW+bs+Q5m4V47yWIEgKoOv1N
 +S/dOe8qbDQA3iMwhEo5XiUtgbj9df+fpZo7xEPUG/OnWSCIAjLC03k/H
 sQhvvIEmK4hyB3R7QUdyrzOoKP1kN1ltCxc5fvYeWIFdmpReMSKhq1rop
 1n+k4+PUNvFvP4V9Fyom7l73jdPIPabimUPbKPFDUqvWjSIFfS/XZ6chQ
 nyUTOt3efilwzEIrnjww6L87RKjHkGcxzzrWFba81wxGo8u8i2Rzr1O2k g==;
X-CSE-ConnectionGUID: ii230wRBR7CBj02ZUbA6Tg==
X-CSE-MsgGUID: 1pAyeO7hTSG5DbUIV+8KBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11220138"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="11220138"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:14:16 -0700
X-CSE-ConnectionGUID: G+U+/qdZSCKW7anTZ5c9PA==
X-CSE-MsgGUID: HjGPwMVlTPGTJCl/kRwd/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20963020"
Received: from unknown (HELO intel.com) ([10.247.119.2])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:14:09 -0700
Date: Thu, 11 Apr 2024 16:14:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 04/10] drm: move i915_component.h under include/drm/intel
Message-ID: <ZhfwK9SW3CLXqSMk@ashyti-mobl2.lan>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <3ec9dfb58154d95e98afe03048a8f31cbbe1659e.1712743191.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ec9dfb58154d95e98afe03048a8f31cbbe1659e.1712743191.git.jani.nikula@intel.com>
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

On Wed, Apr 10, 2024 at 01:05:11PM +0300, Jani Nikula wrote:
> Clean up the top level include/drm directory by grouping all the Intel
> specific files under a common subdirectory.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c   | 2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c    | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c | 2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     | 2 +-
>  drivers/gpu/drm/xe/xe_gsc_proxy.c            | 2 +-
>  drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c   | 2 +-
>  drivers/misc/mei/hdcp/mei_hdcp.c             | 2 +-
>  drivers/misc/mei/pxp/mei_pxp.c               | 2 +-
>  include/drm/{ => intel}/i915_component.h     | 0
>  include/sound/hdaudio.h                      | 2 +-

Please update also Documentation/gpu/i915.rst.

Andi
