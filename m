Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366763D4A0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AED10E06F;
	Wed, 30 Nov 2022 11:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDD610E06F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:30:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id bg10so58151wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4abusOcnTWcYiz6maXQH1YPT40DZgw56TQZW9VHybd4=;
 b=WKj0j4jysik5wdQCAkoDKJVQYX0buM/n4Na0EISlg4QBBP16I4eeLkFYpQg+lGdZMS
 oavTPa1L42D3PnFuKD2jGCHHXdcKJKSolowcVXn9G/7QNV+a8N/CCOLF+F5xRPFytN9F
 rPBIFfp+nOphNHBnGg/ONF7IsIU8XicSU6x6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4abusOcnTWcYiz6maXQH1YPT40DZgw56TQZW9VHybd4=;
 b=T55bZOOcm1GXxJ70P4bqxUzIOurOtkar/3Hab1IXwNoMzFh29QiISfAfLKhsc25Jq1
 qFkTaeJZWXj9wWQE2wEkie3d3WhWdGHDBPywoM7e60OUkC6Y1rk0jOuy+zaptQpW6Yvg
 X7rmfZ5yMtJHydIDrBYPSFiX13DUAWDWhvBA2zTZ146smPt1QBedbtQzI94tsM8HMhHx
 KGVrFTDAG5NeHHIERwtmDWCRpnQ69VEex8Ss0AMfHLdtT4jZmJC9hsU/wZOTX0zWTLsl
 zSEpkqEngb7TS9QB85Zg1hCcbFMjTifVdX/jrIoTWu1BG9r9teUQln7Ag85eZ7Q/Ct/q
 ePtg==
X-Gm-Message-State: ANoB5pn05W1iVWu/c4FOnIufzwr0LRRNGlUv8AsmFIj/XK8Rc/bQiEyK
 xBtwfM+isEA/h2HhfvCg4uVLAQ==
X-Google-Smtp-Source: AA0mqf5/6pFEpEVZ8cuAHWpWi5MJb0amF7qqtIA6StIT+vCHu8WQLwRuihsmdXUccFqoI5K6zStKsw==
X-Received: by 2002:a05:600c:4a9a:b0:3c6:d811:6cff with SMTP id
 b26-20020a05600c4a9a00b003c6d8116cffmr48907043wmp.43.1669807847926; 
 Wed, 30 Nov 2022 03:30:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u16-20020adff890000000b0024165454262sm1323268wrp.11.2022.11.30.03.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:30:47 -0800 (PST)
Date: Wed, 30 Nov 2022 12:30:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hsia-Jun Li <randy.li@synaptics.com>
Subject: Re: [PATCH v5 1/2] drm/fourcc: Add Synaptics VideoSmart tiled
 modifiers
Message-ID: <Y4c+5f3qZd6Epd1C@phenom.ffwll.local>
Mail-Followup-To: Hsia-Jun Li <randy.li@synaptics.com>,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 sakari.ailus@linux.intel.com, airlied@linux.ie, ayaka@soulik.info,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 helen.koike@collabora.com, linux-media@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, tzimmermann@suse.de,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
References: <20221130092149.102788-1-randy.li@synaptics.com>
 <20221130092149.102788-2-randy.li@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130092149.102788-2-randy.li@synaptics.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 airlied@linux.ie, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 helen.koike@collabora.com, ezequiel@vanguardiasur.com.ar,
 sakari.ailus@linux.intel.com, ribalda@chromium.org,
 sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 05:21:48PM +0800, Hsia-Jun Li wrote:
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> 
> Those modifiers only record the parameters would effort pixel
> layout or memory layout. Whether physical memory page mapping
> is used is not a part of format.
> 
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 76 +++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index bc056f2d537d..e0905f573f43 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -407,6 +407,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>  
>  /* add more to the end as needed */
>  
> @@ -1507,6 +1508,81 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>  
> +/*
> + * Synaptics VideoSmart modifiers
> + *
> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
> + * within a tile. GOT size and layout varies based on platform and
> + * performance concern.
> + *
> + * Besides, an 8 length 4 bytes arrary (32 bytes) would be need to store
> + * some compression parameters for a compression metadata plane.
> + *
> + * Further information can be found in
> + * Documentation/gpu/synaptics.rst
> + *
> + *       Macro
> + * Bits  Param Description
> + * ----  ----- -----------------------------------------------------------------
> + *
> + *  7:0  f     Scan direction description.
> + *
> + *               0 = Invalid
> + *               1 = V4, the scan would always start from vertical for 4 pixel
> + *                   then move back to the start pixel of the next horizontal
> + *                   direction.
> + *               2 = Reserved for future use.
> + *
> + * 15:8  m     The times of pattern repeat in the right angle direction from
> + *             the first scan direction.
> + *
> + * 19:16 p     The padding bits after the whole scan, could be zero.
> + *
> + * 20:20 g     GOT packing flag.
> + *
> + * 23:21 -     Reserved for future use.  Must be zero.

Can you pls fold all the future use reservations into the top end? Also I
think it'd be good to at least reserve maybe the top 8 bits or so for a
synaptics specific format indicator, so that it's easier to extend this in
the future ...
-Daniel


> + *
> + * 27:24 h     log2(horizontal) of pixels, in GOTs.
> + *
> + * 31:28 v     log2(vertical) of pixels, in GOTs.
> + *
> + * 35:32 -     Reserved for future use.  Must be zero.
> + *
> + * 36:36 c     Compression flag.
> + *
> + * 55:37 -     Reserved for future use.  Must be zero.
> + *
> + */
> +
> +#define DRM_FORMAT_MOD_SYNA_V4_TILED		fourcc_mod_code(SYNAPTICS, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
> +	fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
> +				 ((__u64)((m) & 0xff) << 8) | \
> +				 ((__u64)((p) & 0xf) << 16) | \
> +				 ((__u64)((g) & 0x1) << 20) | \
> +				 ((__u64)((h) & 0xf) << 24) | \
> +				 ((__u64)((v) & 0xf) << 28) | \
> +				 ((__u64)((c) & 0x1) << 36)))
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
> +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.37.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
