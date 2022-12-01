Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A91E63ECA5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8129C10E582;
	Thu,  1 Dec 2022 09:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AD610E582
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:38:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z92so1632653ede.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7t9ZrLLQSDRq9AIwJu2BnegciMpPDsrwOM0+JjQaOx4=;
 b=iYjBDHGhNsgUIDWZGS0eXyNBSD8Mbuho5BHya7TYoNRdWarQxDVa89hNx8hCWauYNR
 eDFqfyrt9/RVUkpvqB+HP5TX9TGl6V0PiJfXMm+4236qMirCRSfDWI1FTU0A9wuOK3Nc
 rZFlcDIyT2i57NTyuT6M5CKeHkjxQ6vt2MpDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7t9ZrLLQSDRq9AIwJu2BnegciMpPDsrwOM0+JjQaOx4=;
 b=scvxymTLC9O9g9PhuPmPkEyrYn/x9dCXGQXNqq4XzY0xRzsTd39b5HkRaoL0FdM735
 255mLwoXXM3mjoP2E/80tdyRALyaFTnkGRgUUfL8aT9+DmgTZXfXVX/VN/fsY4s9Kvy6
 7LBOCqxFuj/NI4wd0CXbg1yoWk58w5ocn4FMBxVlaHoTN0iREbhOC0L9JSzVaj9Ske8N
 L3SDTTdCm82TM3KyC3afJ4wXz3uCZhG76Uqco203qKKWwQ5uMi+fEguwcxG9owpLT5Lx
 +/Fxxv5ODvUp4ywqeYHwDIIe0nzwrYV+X8FG64HljKbtH5tb/8M7YoifoSbbTbEtr/C9
 IZQw==
X-Gm-Message-State: ANoB5pkSdd4h1N96ojN/P4T6aDcGRfR9jDR8UkygfLI9lbxRtUu34iuh
 dAGTLWNajFLOAlkDg9KuDjk0kQ==
X-Google-Smtp-Source: AA0mqf4VXxeyQi4gb01ntcYKaFqwkjzYT1Z7Koygl2V0WNI6eZBrixP7Xx5zTR3IBO8OneObHs3zmA==
X-Received: by 2002:a05:6402:f91:b0:469:82f7:5013 with SMTP id
 eh17-20020a0564020f9100b0046982f75013mr47621369edb.234.1669887536443; 
 Thu, 01 Dec 2022 01:38:56 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 oz36-20020a1709077da400b0078d21574986sm1566185ejc.203.2022.12.01.01.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:38:54 -0800 (PST)
Date: Thu, 1 Dec 2022 10:38:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Li <ranl@synaptics.com>
Subject: Re: [PATCH v5 1/2] drm/fourcc: Add Synaptics VideoSmart tiled
 modifiers
Message-ID: <Y4h2LFfDLZjC+JVc@phenom.ffwll.local>
Mail-Followup-To: Randy Li <ranl@synaptics.com>,
 Hsia-Jun Li <randy.li@synaptics.com>,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 sakari.ailus@linux.intel.com, airlied@linux.ie, ayaka@soulik.info,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 helen.koike@collabora.com, linux-media@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, tzimmermann@suse.de,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
References: <Y4c+5f3qZd6Epd1C@phenom.ffwll.local>
 <0D62976C-77E2-4748-AA90-C50D5E2CA48C@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0D62976C-77E2-4748-AA90-C50D5E2CA48C@synaptics.com>
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
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 Hsia-Jun Li <randy.li@synaptics.com>, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, sakari.ailus@linux.intel.com,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 01, 2022 at 12:49:16AM +0800, Randy Li wrote:
> 
> 
> Sent from my iPad
> 
> > On Nov 30, 2022, at 7:30 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > 
> > ﻿CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> >> On Wed, Nov 30, 2022 at 05:21:48PM +0800, Hsia-Jun Li wrote:
> >> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> >> 
> >> Those modifiers only record the parameters would effort pixel
> >> layout or memory layout. Whether physical memory page mapping
> >> is used is not a part of format.
> >> 
> >> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> >> ---
> >> include/uapi/drm/drm_fourcc.h | 76 +++++++++++++++++++++++++++++++++++
> >> 1 file changed, 76 insertions(+)
> >> 
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index bc056f2d537d..e0905f573f43 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -407,6 +407,7 @@ extern "C" {
> >> #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> >> #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> >> #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> >> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
> >> 
> >> /* add more to the end as needed */
> >> 
> >> @@ -1507,6 +1508,81 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >> #define AMD_FMT_MOD_CLEAR(field) \
> >>      (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
> >> 
> >> +/*
> >> + * Synaptics VideoSmart modifiers
> >> + *
> >> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
> >> + * within a tile. GOT size and layout varies based on platform and
> >> + * performance concern.
> >> + *
> >> + * Besides, an 8 length 4 bytes arrary (32 bytes) would be need to store
> >> + * some compression parameters for a compression metadata plane.
> >> + *
> >> + * Further information can be found in
> >> + * Documentation/gpu/synaptics.rst
> >> + *
> >> + *       Macro
> >> + * Bits  Param Description
> >> + * ----  ----- -----------------------------------------------------------------
> >> + *
> >> + *  7:0  f     Scan direction description.
> >> + *
> >> + *               0 = Invalid
> >> + *               1 = V4, the scan would always start from vertical for 4 pixel
> >> + *                   then move back to the start pixel of the next horizontal
> >> + *                   direction.
> >> + *               2 = Reserved for future use.
> >> + *
> >> + * 15:8  m     The times of pattern repeat in the right angle direction from
> >> + *             the first scan direction.
> >> + *
> >> + * 19:16 p     The padding bits after the whole scan, could be zero.
> >> + *
> >> + * 20:20 g     GOT packing flag.
> >> + *
> >> + * 23:21 -     Reserved for future use.  Must be zero.
> > 
> > Can you pls fold all the future use reservations into the top end?
> You see we could put more related flag in each of reserved area.
> Here is for the group of tiles flag.
> Bit 35 to 32 could be used for describing the dimension of the group of tiles.

Oh also on the dimension thing, this is the tile size and has nothing to
do with the overall buffer size, right? Because the overall buffer size is
meant to be carried in separate metadata (like the drm_framebuffer
structure or ADDFB2 ioctl data). drm fourcc/modifier assume that height,
width, offset and stride are specified per plane already (unless the
auxiary plane has a fixed layout and is not tracked as a separate plane
for this format).

> > Also I
> > think it'd be good to at least reserve maybe the top 8 bits or so for a
> > synaptics specific format indicator, so that it's easier to extend this in
> > the future ...
> I think the  bit 56 to 63 are used for storing the vendor id. That is why I didn’t include them below. Or you mean the bit 7 to 0?
> Do yo

Yeah there's 8 bit vendor id, but you could reserve another 8 bit at the
top (so 48:55 or something like that) to enumerate within the synaptics
space. Just to future proof the schema, because experience says that hw
engineers absolutely do love to change this stuff eventually.
-Daniel

> > -Daniel
> > 
> > 
> >> + *
> >> + * 27:24 h     log2(horizontal) of pixels, in GOTs.
> >> + *
> >> + * 31:28 v     log2(vertical) of pixels, in GOTs.
> >> + *
> >> + * 35:32 -     Reserved for future use.  Must be zero.
> >> + *
> >> + * 36:36 c     Compression flag.
> >> + *
> >> + * 55:37 -     Reserved for future use.  Must be zero.
> >> + *
> >> + */
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_V4_TILED         fourcc_mod_code(SYNAPTICS, 1)
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
> >> +     fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
> >> +                              ((__u64)((m) & 0xff) << 8) | \
> >> +                              ((__u64)((p) & 0xf) << 16) | \
> >> +                              ((__u64)((g) & 0x1) << 20) | \
> >> +                              ((__u64)((h) & 0xf) << 24) | \
> >> +                              ((__u64)((v) & 0xf) << 28) | \
> >> +                              ((__u64)((c) & 0x1) << 36)))
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> >> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> >> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
> >> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
> >> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
> >> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
> >> +
> >> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
> >> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
> >> +
> >> #if defined(__cplusplus)
> >> }
> >> #endif
> >> --
> >> 2.37.3
> >> 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__blog.ffwll.ch&d=DwIBAg&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=d1mgHWc-ItDXK9dSnz0WGYs9xoXTTk9LqbifMtn2LOxmaHHsc4ieCoE78BFkHI1i&s=8ptqPzTUwb3X3fBSyQA6nVAA6DchubUUsMRgmLIp1lY&e=

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
