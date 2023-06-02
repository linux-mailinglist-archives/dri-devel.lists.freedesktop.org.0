Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E0A720854
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 19:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054CC10E5D9;
	Fri,  2 Jun 2023 17:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1014210E5D9;
 Fri,  2 Jun 2023 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685726658; x=1717262658;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KE+as3H7u1LdHKfriftsu8T7yzvJ4/Tz3dDvVlcxVLI=;
 b=IzA7RyxjDseCJ+hbZUTv7saL4ioamaYDoq5zMfLbM0hVzcHm4M9WIMIU
 EvcggAmMizMkr43ZE7DWDb0/MN4U839I04bUaC6SKngQTjcUXFnaA/nW4
 2Fznv6RsuaF+onNB3acs/bDvjacfQMbvcB3lcLT+rDnx/YCffhJ4Ika1W
 /gSfTjwtwPaBEkBNfwUr2LelSWxLkGLMWlJdmcZkJFybZkle4qp+sTAtr
 ucjXNAs2GMp68JpSCPOulG3FCq9Vb/4lKkWCAZl+v0tGiantOURtYUTb/
 h9WCHaVJkUWK9YaDHjQZXEbSH2/m71klSjuGvCPZnwAooQGHIjFlc+RGl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358352776"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="358352776"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="740890801"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="740890801"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:24:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/i915_drm.h: fix a typo
In-Reply-To: <20230529112956.2083389-1-suijingfeng@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230529112956.2083389-1-suijingfeng@loongson.cn>
Date: Fri, 02 Jun 2023 20:24:11 +0300
Message-ID: <87edmtdbgk.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 May 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>  'rbiter' -> 'arbiter'
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

> ---
>  include/drm/i915_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/i915_drm.h b/include/drm/i915_drm.h
> index 7adce327c1c2..adff68538484 100644
> --- a/include/drm/i915_drm.h
> +++ b/include/drm/i915_drm.h
> @@ -42,7 +42,7 @@ extern struct resource intel_graphics_stolen_res;
>   * The Bridge device's PCI config space has information about the
>   * fb aperture size and the amount of pre-reserved memory.
>   * This is all handled in the intel-gtt.ko module. i915.ko only
> - * cares about the vga bit for the vga rbiter.
> + * cares about the vga bit for the vga arbiter.
>   */
>  #define INTEL_GMCH_CTRL		0x52
>  #define INTEL_GMCH_VGA_DISABLE  (1 << 1)

-- 
Jani Nikula, Intel Open Source Graphics Center
