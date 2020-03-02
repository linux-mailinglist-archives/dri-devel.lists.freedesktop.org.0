Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4F177129
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3546EA05;
	Tue,  3 Mar 2020 08:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F756E550
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 16:28:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a5so11960725wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZUd/Div/Te/3bRQgmH3YEsXKnQcbUcpguyRKLSpxNRQ=;
 b=Lsg+52eWcC89f3lIuRvPAF3AR8KUI89Rwy0zf4GFj4oJo2V2+P2MJRrvstxx+bZIpe
 v6QeEYN+OX6zN9iI4NcBGTUUfYlwK0JuGRjO8elK8eW7RuSyQvhHtgEVe27wYKbCOKDx
 ureNAk+pyJmNGVZWrdOK7HbJEAxk5K3e+Fb5EtbeyjSPC4MZeKNObnBW9MzAL+qMzEPd
 A/fkoQn1G8PfALnJLdF9YWpSkvs+pr07A6p2DtMo0Guqd8TmrnerkBTqjfhaRc+f8BK3
 RUKSVmaBQN7Pp5En76rnSKCsDcQwawIaLIqIMiClnEbDwJK68mlfC0kI3gfSqrhUoJo/
 LhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUd/Div/Te/3bRQgmH3YEsXKnQcbUcpguyRKLSpxNRQ=;
 b=GMUKcxwblJrgcwHbslVzKqDtXBufFpz9PdZIz/ew3cw3BrUIxFPp6L2b8wjKDP5QaK
 WHIFdoVlxRdTo0qIlzIcWPSuOt11KBt9GPZSn2PPEjvFcoYeOYanZ2ksGaQpjvD6XXyQ
 YEA9die7ZvHK537Ba/HBCWLXFmQ9+97qZbIQLGX7a8p2nW339GfckTlT/8/38uPxmeHb
 IKnsmYUH4ZL6g5P1xFRKj9A8Ci+YeMbiqc/kKQIuP9VvxpEF+rwFB2WX13GEiRykYwkb
 D8W1rBCyOMdamkevfnfiRYmmnxGvyC7tOCejguJM93fiwenm6pDnrwSoWm5sWBBtaf1t
 CutA==
X-Gm-Message-State: ANhLgQ2Svx4iwyouPxj/o8olueHfFbGpagRASHJuoI3fj9zvLPeqBbmE
 k/O1RAcEPP9d+HMEmQyNxNb/U7HFaT/YQ2H/SLSB6g==
X-Google-Smtp-Source: ADFU+vtgykJMdwMoKZl8rgU+WTQDv1XCjvm8XxyPIKNq2gxNvI3sJHV0y+M8KB4Tps+/2PYqPRz/EHCEvF0HkKHUiTs=
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr213294wmk.83.1583166528840;
 Mon, 02 Mar 2020 08:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
In-Reply-To: <20200221090845.7397-2-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 2 Mar 2020 17:28:38 +0100
Message-ID: <CAMO6nayj8NK1Ete+XcSsiN5R7NNDjG+opxhxTM9pArbRRwcjgw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 10:09 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
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
> At least two options are supported :
> - Scatter mode: the buffer is filled with a IOMMU scatter table referring
>   to the encoder current memory layout. This mode if more efficient in terms
>   of memory allocation but frames are not dumpable and only valid during until
>   the buffer is freed and back in control of the encoder
> - Memory saving: when the pixel bpp is 8b, the size of the superblock can
>   be reduced, thus saving memory.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 56 +++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..8a6e87bacadb 100644
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
> @@ -804,6 +805,61 @@ extern "C" {
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
> + * Implementation details may be platform and SoC specific, and shared
> + * between the producer and the decoder on the same platform.
> + *
> + * The underlying storage is considered to be 3 components, 8bit or 10-bit
> + * per component YCbCr 420, single plane :
> + * - DRM_FORMAT_YUV420_8BIT
> + * - DRM_FORMAT_YUV420_10BIT
> + *
> + * The classic memory storage is composed of:
> + * - a body content organized in 64x32 superblocks with 4096 bytes per
> + *   superblock in default mode.
> + * - a 32 bytes per 128x64 header block
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_DEFAULT fourcc_mod_code(AMLOGIC, 0)
> +
> +/*
> + * Amlogic Video Framebuffer Compression Options
> + *
> + * Two optional features are available which may not supported/used on every
> + * SoCs and Compressed Framebuffer producers.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC(__modes) fourcc_mod_code(AMLOGIC, __modes)
> +
> +/*
> + * Amlogic FBC Scatter Memory layout
> + *
> + * Indicates the header contains IOMMU references to the compressed
> + * frames content to optimize memory access and layout.
> + * In this mode, only the header memory address is needed, thus the
> + * content memory organization is tied to the current producer
> + * execution and cannot be saved/dumped.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER     (1ULL << 0)
> +
> +/*
> + * Amlogic FBC Memory Saving mode
> + *
> + * Indicates the storage is packed when pixel size is multiple of word
> + * boudaries, i.e. 8bit should be stored in this mode to save allocation
> + * memory.
> + *
> + * This mode reduces body layout to 3072 bytes per 64x32 superblock and
> + * 3200 bytes per 64x32 superblock combined with scatter mode.
> + */
> +#define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING  (1ULL << 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.22.0
>
>

I'm the main developer of the V4L2 video decoder (H264, VP9..) on
amlogic platforms, which is a producer of such compressed frames.

Those modifiers suit well the combinations of options that can be
applied to the frames when created. I also helped testing the
following scenarios of decode+display on various SoCs:

- SM1: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER (10-bit & 8-bit video)
- SM1: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER +
DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING (8-bit video)
- G12A: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER (10-bit & 8-bit video)
- G12A: DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER +
DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING (8-bit video)
- GXL: DRM_FORMAT_MOD_AMLOGIC_FBC_DEFAULT (10-bit & 8-bit video)
- GXL: DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING (8-bit video)

Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
