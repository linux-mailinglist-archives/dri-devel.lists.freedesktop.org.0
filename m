Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F11AE07C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7AA6E4A6;
	Fri, 17 Apr 2020 15:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7610A6E4A6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:07:33 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r26so3370439wmh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rUsEOWcAvFI1LhmxsMY2a1aelPmLjYCMdOuX/AykuqQ=;
 b=W8XbGSMaun0zeoA8+/rTue3oyunGjJ8y8t1sqAjRYfl2ZjbJu7x1v8CbcoQ2PXclqN
 jHizuTlK37ShCu5D3pAd9a2PZ6tX7bUa7Sm/9v5VHQKGkMpfm/wFbGc0IUPQdVXgEus7
 6L0SjeWPa0EFheYB0mTYZ9OWzgz479sg+VgK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rUsEOWcAvFI1LhmxsMY2a1aelPmLjYCMdOuX/AykuqQ=;
 b=JWdznxZfoyMKT319sEiryoKiPMLY/DjlJCDCDiGlHupN3Qaj8PzKZN0iDkUYZryK1M
 Y3WTeVGTy+/+bH7nRD9dx8gQ2SgHBoDqMGjW7jAEJIHSZ31re9zHaiZvJe7+WGskmTg9
 HwlT/Z/KoVkzS9ET4kp2T+0te9SCAbgW0txjuThffYUIsasTefHy0sn+zNJULr9NxvXB
 zPWil8HpWeUojoVZNPKkFUnaieot3alusEaNOK8pRZbjh+5n04IjV93uUn2Pn7K6/MXH
 b9BCIRq7cW8BinAJfg+WCIb0gtGUwAvr0kPrFHfMKT/nEvlMIWcH+o1vNe154b2NN7gb
 i1sg==
X-Gm-Message-State: AGi0Puam522mrKyQ7QUmnNQnmWhmLOexB2R2YzZMFS66KxXis04ibkvV
 Cfho2Ta1W7hUrzl3/54LP58lQA==
X-Google-Smtp-Source: APiQypItQkdmBtoPoPH/+hxfLHTGNVt03vOKK3QD/jt5bfi7N0gV8HkoQH1eX+9YKTT2bj2qlCwvYg==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr3795237wml.20.1587136052084; 
 Fri, 17 Apr 2020 08:07:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y18sm8934564wmc.45.2020.04.17.08.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:07:31 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 1/8] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <20200417150729.GP3456981@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
 <20200416152500.29429-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416152500.29429-2-narmstrong@baylibre.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 05:24:53PM +0200, Neil Armstrong wrote:
> Amlogic uses a proprietary lossless image compression protocol and format
> for their hardware video codec accelerators, either video decoders or
> video input encoders.
> 
> It considerably reduces memory bandwidth while writing and reading
> frames in memory.
> 
> The underlying storage is considered to be 3 components, 8bit or 10-bit
> per component, YCbCr 420, single plane :
> - DRM_FORMAT_YUV420_8BIT
> - DRM_FORMAT_YUV420_10BIT
> 
> This modifier will be notably added to DMA-BUF frames imported from the V4L2
> Amlogic VDEC decoder.
> 
> This introduces the basic layout composed of:
> - a body content organized in 64x32 superblocks with 4096 bytes per
>   superblock in default mode.
> - a 32 bytes per 128x64 header block
> 
> This layout is tranferrable between Amlogic SoCs supporting this modifier.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 39 +++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..a1b163a5641f 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -309,6 +309,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> +#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>  
>  /* add more to the end as needed */
>  
> @@ -804,6 +805,44 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
>  
> +/*
> + * Amlogic Video Framebuffer Compression modifiers
> + *
> + * Amlogic uses a proprietary lossless image compression protocol and format
> + * for their hardware video codec accelerators, either video decoders or
> + * video input encoders.
> + *
> + * It considerably reduces memory bandwidth while writing and reading
> + * frames in memory.
> + *
> + * The underlying storage is considered to be 3 components, 8bit or 10-bit
> + * per component YCbCr 420, single plane :
> + * - DRM_FORMAT_YUV420_8BIT
> + * - DRM_FORMAT_YUV420_10BIT
> + *
> + * The first 8 bits of the mode defines the layout, then the following 8 bits
> + * defines the options changing the layout.

None of the modifiers you're doing seem to have these other 8 bits
defined anywhere. And it's not encoded in your modifiers. Can't we just
enumerate the ones we have/need and done?

> + *
> + * Not all combinations are valid, and different SoCs may support different
> + * combinations of layout and options.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
> +
> +/* Amlogic FBC Layouts */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK		(0xf << 0)
> +
> +/*
> + * Amlogic FBC Basic Layout
> + *
> + * The basic layout is composed of:
> + * - a body content organized in 64x32 superblocks with 4096 bytes per
> + *   superblock in default mode.
> + * - a 32 bytes per 128x64 header block
> + *
> + * This layout is transferrable between Amlogic SoCs supporting this modifier.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)

This is kinda confusing, since this isn't actually the modifier, but the
mode of the modifer. Generally what we do is only define the former, with
maybe some macros to extract stuff.

To make this more mistake-proof I'd only define the full modifier code.
Definitely don't add a #define with the DRM_FORMAT_MOD_ prefix which isn't
actually a full modifier code.
-Daniel

> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.22.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
