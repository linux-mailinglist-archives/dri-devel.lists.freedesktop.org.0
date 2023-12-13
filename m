Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786D810E2E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 11:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD8510E753;
	Wed, 13 Dec 2023 10:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C73C10E753
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702462590; x=1733998590;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=UgBHuHhN27f7c5lwf0W1o7zajxok2OK8HlN/9DmDPaU=;
 b=BHtihujPg79QTBKUFYo54JSmPpdbGaprz+Iq0CIixpXfPlx2elBY+iiJ
 fCof7R0EFenBpr6cJFj8cO2F7l5TK5MYwiTGBbuQD/vNnjJLxRFo8Vc5C
 i1vGpRFsqyy9s/1xEoRgo9X53UToplbTm4f0oe22tKcotLO688K5hZTwa
 xmnPYu+FWFyw5jihxvapHaf+DPd1geN6n8DPE+YnWSLdgw0HBxJS3W2te
 1pU9XZZHW2l7IKVUBOh30C/vr1/WJkvhKbWSD+VOYDd8+FIp7wUkdbRaK
 SybxmahaHHQq5zw7m16Sy/OmIEVgLVGYvz1iaixIgjdwfqwvjAocmx3IJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374448933"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="374448933"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 02:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773894214"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="773894214"
Received: from oostoia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.15])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 02:16:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/fourcc: fix spelling/typos
In-Reply-To: <20231213043925.13852-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231213043925.13852-1-rdunlap@infradead.org>
Date: Wed, 13 Dec 2023 12:16:24 +0200
Message-ID: <87il52wgp3.fsf@intel.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023, Randy Dunlap <rdunlap@infradead.org> wrote:
> Correct spelling mistakes that were identified by codespell.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/uapi/drm/drm_fourcc.h |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff -- a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -54,7 +54,7 @@ extern "C" {
>   * Format modifiers may change any property of the buffer, including the number
>   * of planes and/or the required allocation size. Format modifiers are
>   * vendor-namespaced, and as such the relationship between a fourcc code and a
> - * modifier is specific to the modifer being used. For example, some modifiers
> + * modifier is specific to the modifier being used. For example, some modifiers
>   * may preserve meaning - such as number of planes - from the fourcc code,
>   * whereas others may not.
>   *
> @@ -79,7 +79,7 @@ extern "C" {
>   *   format.
>   * - Higher-level programs interfacing with KMS/GBM/EGL/Vulkan/etc: these users
>   *   see modifiers as opaque tokens they can check for equality and intersect.
> - *   These users musn't need to know to reason about the modifier value
> + *   These users mustn't need to know to reason about the modifier value
>   *   (i.e. they are not expected to extract information out of the modifier).
>   *
>   * Vendors should document their modifier usage in as much detail as
> @@ -540,7 +540,7 @@ extern "C" {
>   * This is a tiled layout using 4Kb tiles in row-major layout.
>   * Within the tile pixels are laid out in 16 256 byte units / sub-tiles which
>   * are arranged in four groups (two wide, two high) with column-major layout.
> - * Each group therefore consits out of four 256 byte units, which are also laid
> + * Each group therefore consists out of four 256 byte units, which are also laid
>   * out as 2x2 column-major.
>   * 256 byte units are made out of four 64 byte blocks of pixels, producing
>   * either a square block or a 2:1 unit.
> @@ -1103,7 +1103,7 @@ drm_fourcc_canonicalize_nvidia_format_mo
>   */
>  
>  /*
> - * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
> + * The top 4 bits (out of the 56 bits allotted for specifying vendor specific
>   * modifiers) denote the category for modifiers. Currently we have three
>   * categories of modifiers ie AFBC, MISC and AFRC. We can have a maximum of
>   * sixteen different categories.
> @@ -1419,7 +1419,7 @@ drm_fourcc_canonicalize_nvidia_format_mo
>   * Amlogic FBC Memory Saving mode
>   *
>   * Indicates the storage is packed when pixel size is multiple of word
> - * boudaries, i.e. 8bit should be stored in this mode to save allocation
> + * boundaries, i.e. 8bit should be stored in this mode to save allocation
>   * memory.
>   *
>   * This mode reduces body layout to 3072 bytes per 64x32 superblock with

-- 
Jani Nikula, Intel
