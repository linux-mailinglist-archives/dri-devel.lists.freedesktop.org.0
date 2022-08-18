Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05540597E60
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 08:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B159D10F131;
	Thu, 18 Aug 2022 06:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7C4B7BF0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 06:07:55 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id m17so551030qvv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=eovCU3oefLwCBarQm+zizJfd/x3OzrHww+wVE0aIUzY=;
 b=YZvfA4w6b0yxhmcJjPM0vvBl5yh0tgeZWxLd38TYifeI2pI1kLX74JOxwA5uqKeUWL
 ptrGDD1wgRfU7rrjwNpdMsXLhq1fF+9HF6l0uaIWi22ZrELxl+9YWdxlJl8L4V8Bg8By
 GgElj1pry7Bv7InBM5xwJ716YHcz6/sf3hYLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=eovCU3oefLwCBarQm+zizJfd/x3OzrHww+wVE0aIUzY=;
 b=SOHGa+NG0ghsWtjHPlXc1jMHpeeKaYs8K40iTg/A54Qtvlrr/RuLX4k0eV8V3cEO5t
 GqGI9m7gcLtBR+wGfsaKHSUlWWFQ/+crqA3n+sWcEKqfdXtEnmEFpiDx2z9Hm0Lq/Mjr
 DokyogpmvrUM5JjojoWxPX9MvP/IqN1/w7Pq9ESoQKGr6ssjnD7RXeoQwMYJiALwh2vK
 j5khii+Asq54D2Fgjf9+OWvpZxDC4dZNRr4gJttVDwKC+8Z+RNmnieEbcfmMfFnce0G/
 FYycXefBCNcjBg9E/8Uw5d54rLXFxkK31NTGJb8wWtdcoonGEJRxdXmPdSgzHk0+MMiJ
 hEGw==
X-Gm-Message-State: ACgBeo1S13m9F/CtA8f7mesX5x128dj3N7JrTM33A3QVam4fy9yKiA9v
 XU0Il3kRRtCljxYEZ+yoEMxxxEKpA8dRQ6FR
X-Google-Smtp-Source: AA6agR7ZvwudMnbqBLewJrFJ5HfUormA+sTium0DlBLGT/3s/4L0UGvcFEeWc2HHCPAs1eeXf2YGNA==
X-Received: by 2002:a05:6214:ac3:b0:496:31f9:1877 with SMTP id
 g3-20020a0562140ac300b0049631f91877mr1438009qvi.12.1660802874421; 
 Wed, 17 Aug 2022 23:07:54 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 de39-20020a05620a372700b006b999c1030bsm831876qkb.52.2022.08.17.23.07.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 23:07:52 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-32a09b909f6so16105637b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:07:51 -0700 (PDT)
X-Received: by 2002:a81:2596:0:b0:329:da3a:e1d3 with SMTP id
 l144-20020a812596000000b00329da3ae1d3mr1383846ywl.41.1660802871136; Wed, 17
 Aug 2022 23:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-2-randy.li@synaptics.com>
In-Reply-To: <20220808162750.828001-2-randy.li@synaptics.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Aug 2022 15:07:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A+ueaiW8=cZZLomBLVtSNd8k89FUhYRp23yayQfXnT9A@mail.gmail.com>
Message-ID: <CAAFQd5A+ueaiW8=cZZLomBLVtSNd8k89FUhYRp23yayQfXnT9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
To: Hsia-Jun Li <randy.li@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-kernel@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wrote:
>
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>
> Memory Traffic Reduction(MTR) is a module in Synaptics
> VideoSmart platform could process lossless compression image
> and cache the tile memory line.
>
> Those modifiers only record the parameters would effort pixel
> layout or memory layout. Whether physical memory page mapping
> is used is not a part of format.
>
> We would allocate the same size of memory for uncompressed
> and compressed luma and chroma data, while the compressed buffer
> would request two extra planes holding the metadata for
> the decompression.
>
> The reason why we need to allocate the same size of memory for
> the compressed frame:
> 1. The compression ratio is not fixed and differnt platforms could
> use a different compression protocol. These protocols are complete
> vendor proprietaries, the other device won't be able to use them.
> It is not necessary to define the version of them here.
>
> 2. Video codec could discard the compression attribute when the
> intra block copy applied to this frame. It would waste lots of
> time on re-allocation.
>
> I am wondering if it is better to add an addtional plane property to
> describe whether the current framebuffer is compressed?
> While the compression flag is still a part of format modifier,
> because it would have two extra meta data planes in the compression
> version.
>
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 49 +++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 0206f812c569..b67884e8bc69 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -381,6 +381,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>
>  /* add more to the end as needed */
>
> @@ -1452,6 +1453,54 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>         (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>
> +/*
> + * Synaptics VideoSmart modifiers
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

I guess 2..255 are all reserved for future use?

> + *
> + * 15:8  m     The times of pattern repeat in the right angle direction from
> + *             the first scan direction.
> + *
> + * 19:16 p     The padding bits after the whole scan, could be zero.

What is the meaning of "scan" and "whole scan" here?

Best regards,
Tomasz

> + *
> + * 35:20 -     Reserved for future use.  Must be zero.
> + *
> + * 36:36 c     Compression flag.
> + *
> + * 55:37 -     Reserved for future use.  Must be zero.
> + *
> + */
> +
> +#define DRM_FORMAT_MOD_SYNA_V4_TILED           fourcc_mod_code(SYNAPTICS, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, c) \
> +       fourcc_mod_code(SYNAPTICS, (((f) & 0xff) | \
> +                                (((m) & 0xff) << 8) | \
> +                                (((p) & 0xf) << 16) | \
> +                                (((c) & 0x1) << 36)))
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H1_COMPRESSED \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1)
> +
> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_COMPRESSED \
> +       DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.17.1
>
