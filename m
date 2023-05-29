Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4567145FE
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 10:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C831B10E228;
	Mon, 29 May 2023 08:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1BE10E222;
 Mon, 29 May 2023 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685347587; x=1716883587;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MFgq1cmYBpxJ6c4Q4/KeMmfcD10/N5tccL1870amklU=;
 b=C0xFyYN03KPtbIKlp6Txf5MIGkIqKRtA4jzzCRHBJRo0MMgWpbHhcUoh
 LTrswGRHreL1cYkET0eoJmgMoeewrl/qVneCgyUdkdmk62hEbZHNnAw9h
 QlAd7LyKwsDOx3ReovBwFfyurDwsy9e7b95X7zunQoOytnFY/E5Tab1p7
 FK0Z84OEZFcgrSDBZjAjHMKOmCe7ELnJ1sv/IWwF+GNYpQ0mfHGm6mEdC
 ZBXxyrcVKShgIDrIGDoWdyEoNoV8zf7jp0I3rxuqYObK+NGYSneBF0IAL
 4YjPmOUqRZREDTaxvvPnl8G4zHdDYxWNxhhyIlUliUFBJQGM7sPtf1XIP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="418131660"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="418131660"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="775848200"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="775848200"
Received: from iswiersz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.191])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:06:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915_drm.h: fix a typo
In-Reply-To: <20230529074912.2070902-1-suijingfeng@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230529074912.2070902-1-suijingfeng@loongson.cn>
Date: Mon, 29 May 2023 11:06:20 +0300
Message-ID: <874jnvimtf.fsf@intel.com>
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
>  'rbiter' -> 'arbite'

Should be arbiter.

>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  include/drm/i915_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/i915_drm.h b/include/drm/i915_drm.h
> index 7adce327c1c2..3dcb1db519ae 100644
> --- a/include/drm/i915_drm.h
> +++ b/include/drm/i915_drm.h
> @@ -42,7 +42,7 @@ extern struct resource intel_graphics_stolen_res;
>   * The Bridge device's PCI config space has information about the
>   * fb aperture size and the amount of pre-reserved memory.
>   * This is all handled in the intel-gtt.ko module. i915.ko only
> - * cares about the vga bit for the vga rbiter.
> + * cares about the vga bit for the vga arbite.
>   */
>  #define INTEL_GMCH_CTRL		0x52
>  #define INTEL_GMCH_VGA_DISABLE  (1 << 1)

-- 
Jani Nikula, Intel Open Source Graphics Center
