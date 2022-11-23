Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231E636601
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 17:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7710E5B2;
	Wed, 23 Nov 2022 16:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ECD10E5B2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:42:26 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x102so25692542ede.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z8JZOcUu6HJ6CYG3/kMUGO8YebOiQSwKW0GWNGGl19Y=;
 b=ADDEafqnLTCuv/1hHN90tRHtZ2Js3zcTCuaBMGMkbqvScSkBlGqnqBfT0wnc0LII80
 rDrcEHGNfHSMVJfmN26WsEdKKGwJYmzOaAvHE8ov7L+D01YMoweg/cBXtXUV4dLF35/+
 jF7QmEj/+Yd1KFcp4m5j7acTPPd6auvLVpCqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8JZOcUu6HJ6CYG3/kMUGO8YebOiQSwKW0GWNGGl19Y=;
 b=PDZh6LkrfDkF1q5JzT0Wkppw1mH3X7dgNt0Yj6CczzQ6cbA4jlWqgS1AtgNx64GMfe
 gTNwibPJjmQiu6azWK3D3vWgfZpEa3LXzqHlPmrArT9TV/F9aSuWXjJWrDsLH1sEjfU+
 ZvlZNdv9ZWiU4eXMnmlN0S6N1iO8e9r7+keJYjbnx83Py/FBpbZKPKepegk4fWKjzfG6
 L9VQgLH0PT1E9VFvejF19lk8bLAZhHoli0cNXMY83EJjUVzZzpXJuTu20oTr/AQsl8cc
 K2UimTdlSDEl2EDBotiO2o7cjn3ar59YrzrrnYIHSjpYeQPW5I+S6aMa1a1imlKeGOoN
 7T7w==
X-Gm-Message-State: ANoB5pnpXhnjN+9UnyLwvZqBHFKaW9ZTMVBq+mz8pEqC30gRJ8Kos32d
 JXoWsKPd3+5lea0w2NV3BBjVvA==
X-Google-Smtp-Source: AA0mqf6saUw2/dQuCbDeoGg7vK7k8Waf7Fx1BKirG8RmWJKZnwiw3hrYjy5Kryf4LcK8MTrhTAmczw==
X-Received: by 2002:a05:6402:181:b0:461:ea0c:e151 with SMTP id
 r1-20020a056402018100b00461ea0ce151mr12144745edv.376.1669221745500; 
 Wed, 23 Nov 2022 08:42:25 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05640210c300b00463c367024bsm7691898edu.63.2022.11.23.08.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:42:24 -0800 (PST)
Date: Wed, 23 Nov 2022 17:42:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Message-ID: <Y35Nbhd/fhESOFeU@phenom.ffwll.local>
Mail-Followup-To: Jisheng Zhang <jszhang@kernel.org>,
 Hsia-Jun Li <randy.li@synaptics.com>,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 ezequiel@vanguardiasur.com.ar, helen.koike@collabora.com,
 laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mripard@kernel.org, nicolas@ndufresne.ca,
 ribalda@chromium.org, sakari.ailus@linux.intel.com,
 sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 tzimmermann@suse.de, ayaka@soulik.info
References: <20221123091957.75967-1-randy.li@synaptics.com>
 <Y341AxDwqRC/0eep@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y341AxDwqRC/0eep@xhacker>
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
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, airlied@linux.ie,
 tzimmermann@suse.de, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 Hsia-Jun Li <randy.li@synaptics.com>, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, ribalda@chromium.org,
 sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 10:58:11PM +0800, Jisheng Zhang wrote:
> On Wed, Nov 23, 2022 at 05:19:57PM +0800, Hsia-Jun Li wrote:
> > From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> > 
> > Memory Traffic Reduction(MTR) is a module in Synaptics
> > VideoSmart platform could process lossless compression image
> > and cache the tile memory line.
> > 
> > Those modifiers only record the parameters would effort pixel
> > layout or memory layout. Whether physical memory page mapping
> > is used is not a part of format.
> > 
> > We would allocate the same size of memory for uncompressed
> > and compressed luma and chroma data, while the compressed buffer
> > would request two extra planes holding the metadata for
> > the decompression.
> > 
> > Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index bc056f2d537d..ca0b4ca70b36 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -407,6 +407,7 @@ extern "C" {
> >  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> >  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> >  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> > +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
> 
> Any users in the mainline tree?

Note that drm_fourcc.h serves as the vendor-neutral registry for these
numbers, and they're referenced in both gl and vk extensions. So this is
the one case where we do _not_ require in-kernel users or open source
userspace.

If there is someone interested in an in-kernel or open userspace driver
though it would be really great to have their acks before merging. Just to
make sure that the modifiers will work with both upstream and downstream
driver stacks.

I just realized that we've failed to document this, I'll type up a patch.
-Daniel


> 
> >  
> >  /* add more to the end as needed */
> >  
> > @@ -1507,6 +1508,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >  #define AMD_FMT_MOD_CLEAR(field) \
> >  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
> >  
> > +/*
> > + * Synaptics VideoSmart modifiers
> > + *
> > + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
> > + * within a tile. GOT size and layout varies based on platform and
> > + * performance concern. When the compression is applied, it is possible
> > + * that we would have two tile type in the GOT, these parameters can't
> > + * tell the secondary tile type.
> > + *
> > + * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to store
> > + * some compression parameters for a compression meta data plane.
> > + *
> > + *       Macro
> > + * Bits  Param Description
> > + * ----  ----- -----------------------------------------------------------------
> > + *
> > + *  7:0  f     Scan direction description.
> > + *
> > + *               0 = Invalid
> > + *               1 = V4, the scan would always start from vertical for 4 pixel
> > + *                   then move back to the start pixel of the next horizontal
> > + *                   direction.
> > + *               2 = Reserved for future use.
> > + *
> > + * 15:8  m     The times of pattern repeat in the right angle direction from
> > + *             the first scan direction.
> > + *
> > + * 19:16 p     The padding bits after the whole scan, could be zero.
> > + *
> > + * 20:20 g     GOT packing flag.
> > + *
> > + * 23:21 -     Reserved for future use.  Must be zero.
> > + *
> > + * 27:24 h     log2(horizontal) of bytes, in GOTs.
> > + *
> > + * 31:28 v     log2(vertical) of bytes, in GOTs.
> > + *
> > + * 35:32 -     Reserved for future use.  Must be zero.
> > + *
> > + * 36:36 c     Compression flag.
> > + *
> > + * 55:37 -     Reserved for future use.  Must be zero.
> > + *
> > + */
> > +
> > +#define DRM_FORMAT_MOD_SYNA_V4_TILED		fourcc_mod_code(SYNAPTICS, 1)
> > +
> > +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
> > +	fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
> > +				 ((__u64)((m) & 0xff) << 8) | \
> > +				 ((__u64)((p) & 0xf) << 16) | \
> > +				 ((__u64)((g) & 0x1) << 20) | \
> > +				 ((__u64)((h) & 0xf) << 24) | \
> > +				 ((__u64)((v) & 0xf) << 28) | \
> > +				 ((__u64)((c) & 0x1) << 36)))
> > +
> > +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> > +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
> > +
> > +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> > +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
> > +
> > +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
> > +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
> > +
> > +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
> > +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
> > +
> > +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
> > +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
> > +
> > +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
> > +	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > -- 
> > 2.17.1
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
