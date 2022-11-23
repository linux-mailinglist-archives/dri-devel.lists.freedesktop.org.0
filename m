Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287206366FB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B37310E5C7;
	Wed, 23 Nov 2022 17:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E91D10E5C5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:27:45 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v8so14757428edi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rHvQh85PXTq9nu+2NPV2qnJbgQhD1nlG3nFWFbSA6I8=;
 b=J75+IkDOuP2o1LMnBnQHP/YplxyuL0vDte/HlAId3Pn692PPVysC5KZle6Mk/Kkjhk
 jJSMn+NaAsiJFkOfJXOy7BOGX2mXkgu0eQyiPnfYPo4hQYn3aDdWEgYswKEaYgBwW8l5
 VOX75mMl71FmPJyaH46yG/sRk1ZtUpJ0t/r/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rHvQh85PXTq9nu+2NPV2qnJbgQhD1nlG3nFWFbSA6I8=;
 b=k14ibV4SL/JRjl16T8htj3z3ZYVnGQ3yKjEEMPZQgkzXfn53pCVu02r0omvYBvtqng
 qo5NX8Bbtchb5JxZxXYv0nzln9QVazxwJ8K2n/u+WRT1h07KqhzuOYC8809xrjOkMnb2
 F4nD0O8DPhMapWNXQO8FOaI/KxZJJczt9w6akQi25xceUz1ZqhJQVcietXSuQkwr4tgr
 npVnXTCbHnlErH7d8nvc+MbzDbS85bB0yBBkMGP8HPrrQrtHPyK4+PVmYgK78jbLt2t2
 iax5BRTkAkOXJ5TQBWFXIUc0nRCzLGYPpAgU5rSAQTaP5lA13LHxo0x1jYK7S1dY764t
 +qGQ==
X-Gm-Message-State: ANoB5pneDIBBfxTvdOLHffOX3L1EcKSVXSaBRrGyx8mxvRR7V9NC/83s
 TifPwLfp5UavvxO7mAkXd6NExA==
X-Google-Smtp-Source: AA0mqf4LmK7tWSeZw5i2AMw96igUq28nzNOVIwqKmf54LW+KfQPJO1sajslBB/G2fotybF8YrE7hvQ==
X-Received: by 2002:a05:6402:380b:b0:462:7b99:d3b2 with SMTP id
 es11-20020a056402380b00b004627b99d3b2mr26437699edb.248.1669224463883; 
 Wed, 23 Nov 2022 09:27:43 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u8-20020aa7d548000000b00459cd13fd34sm7892266edr.85.2022.11.23.09.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 09:27:43 -0800 (PST)
Date: Wed, 23 Nov 2022 18:27:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Li <ranl@synaptics.com>
Subject: Re: [PATCH v4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Message-ID: <Y35YDXZ5G7l2EWRa@phenom.ffwll.local>
Mail-Followup-To: Randy Li <ranl@synaptics.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Hsia-Jun Li <randy.li@synaptics.com>,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 ezequiel@vanguardiasur.com.ar, helen.koike@collabora.com,
 laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mripard@kernel.org, nicolas@ndufresne.ca,
 ribalda@chromium.org, sakari.ailus@linux.intel.com,
 sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 tzimmermann@suse.de
References: <Y35Nbhd/fhESOFeU@phenom.ffwll.local>
 <48867317-C751-4339-ADA6-6AF88A7FB9AC@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48867317-C751-4339-ADA6-6AF88A7FB9AC@synaptics.com>
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
Cc: mchehab@kernel.org, airlied@linux.ie, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nicolas@ndufresne.ca, Hsia-Jun Li <randy.li@synaptics.com>,
 helen.koike@collabora.com, sakari.ailus@linux.intel.com,
 ezequiel@vanguardiasur.com.ar, Jisheng Zhang <jszhang@kernel.org>,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 01:14:48AM +0800, Randy Li wrote:
> 
> > On Nov 24, 2022, at 12:42 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > 
> > ﻿On Wed, Nov 23, 2022 at 10:58:11PM +0800, Jisheng Zhang wrote:
> >>> On Wed, Nov 23, 2022 at 05:19:57PM +0800, Hsia-Jun Li wrote:
> >>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> >>> Memory Traffic Reduction(MTR) is a module in Synaptics
> >>> VideoSmart platform could process lossless compression image
> >>> and cache the tile memory line.
> >>> Those modifiers only record the parameters would effort pixel
> >>> layout or memory layout. Whether physical memory page mapping
> >>> is used is not a part of format.
> >>> We would allocate the same size of memory for uncompressed
> >>> and compressed luma and chroma data, while the compressed buffer
> >>> would request two extra planes holding the metadata for
> >>> the decompression.
> >>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> >>> ---
> >>> include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++
> >>> 1 file changed, 75 insertions(+)
> >>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >>> index bc056f2d537d..ca0b4ca70b36 100644
> >>> --- a/include/uapi/drm/drm_fourcc.h
> >>> +++ b/include/uapi/drm/drm_fourcc.h
> >>> @@ -407,6 +407,7 @@ extern "C" {
> >>> #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> >>> #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> >>> #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> >>> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
> >> Any users in the mainline tree?
> Not yet. I believe a V4L2 codec would be the first one.
> Still there are many patches are requested for v4l2 which currently does
> not support format modifier. You could find discussion in linux media
> list.
> 
> This does need the agreement from drm maintainers, three of us tend to
> drop the pixel formats in video4linux2.h only keeping those codec
> formats in new extended v4l2 format negotiation interface. All the pixel
> formats should go to drm_fourcc.h while we can’t decide how to present
> those hardware requests contiguous memory.

Uh no.

These enums are maintained in drm_fourcc.h, by drm maintainers. You
_cannot_ mix them up with the fourcc enums that video4linux2.h has, that's
a completely different enum space because fourcc codes are _not_ a
standard.

Please do not ever mix up drm_fourcc format modifiers with v4l2 fourcc
codes, that will result in complete chaos. There's a reason why there's
only one authoritative source for these.

> We don’t bring those NV12M into drm_fourcc.h, we hate that.
> > Note that drm_fourcc.h serves as the vendor-neutral registry for these
> > numbers, and they're referenced in both gl and vk extensions. So this is
> > the one case where we do _not_ require in-kernel users or open source
> > userspace.
> > 
> The first user for these pixel formats would be the software pixel reader for Gstreamer, I am planning to add the unpacker for the two uncompressed pixel formats.
> > If there is someone interested in an in-kernel or open userspace driver
> > though it would be really great to have their acks before merging. Just to
> > make sure that the modifiers will work with both upstream and downstream
> > driver stacks.
> This patch have been reviewed internally, it is good enough to describe our pixel formats.
> > 
> > I just realized that we've failed to document this, I'll type up a patch.
> 
> About the format itself, I have sent the document to the mesa, you could find a MR there.

Please include the link to that MR in the patch description.
-Daniel

> > -Daniel
> > 
> > 
> >>> /* add more to the end as needed */
> >>> @@ -1507,6 +1508,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >>> #define AMD_FMT_MOD_CLEAR(field) \
> >>>   (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
> >>> +/*
> >>> + * Synaptics VideoSmart modifiers
> >>> + *
> >>> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
> >>> + * within a tile. GOT size and layout varies based on platform and
> >>> + * performance concern. When the compression is applied, it is possible
> >>> + * that we would have two tile type in the GOT, these parameters can't
> >>> + * tell the secondary tile type.
> >>> + *
> >>> + * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to store
> >>> + * some compression parameters for a compression meta data plane.
> >>> + *
> >>> + *       Macro
> >>> + * Bits  Param Description
> >>> + * ----  ----- -----------------------------------------------------------------
> >>> + *
> >>> + *  7:0  f     Scan direction description.
> >>> + *
> >>> + *               0 = Invalid
> >>> + *               1 = V4, the scan would always start from vertical for 4 pixel
> >>> + *                   then move back to the start pixel of the next horizontal
> >>> + *                   direction.
> >>> + *               2 = Reserved for future use.
> >>> + *
> >>> + * 15:8  m     The times of pattern repeat in the right angle direction from
> >>> + *             the first scan direction.
> >>> + *
> >>> + * 19:16 p     The padding bits after the whole scan, could be zero.
> >>> + *
> >>> + * 20:20 g     GOT packing flag.
> >>> + *
> >>> + * 23:21 -     Reserved for future use.  Must be zero.
> >>> + *
> >>> + * 27:24 h     log2(horizontal) of bytes, in GOTs.
> >>> + *
> >>> + * 31:28 v     log2(vertical) of bytes, in GOTs.
> >>> + *
> >>> + * 35:32 -     Reserved for future use.  Must be zero.
> >>> + *
> >>> + * 36:36 c     Compression flag.
> >>> + *
> >>> + * 55:37 -     Reserved for future use.  Must be zero.
> >>> + *
> >>> + */
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED        fourcc_mod_code(SYNAPTICS, 1)
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
> >>> +    fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
> >>> +                 ((__u64)((m) & 0xff) << 8) | \
> >>> +                 ((__u64)((p) & 0xf) << 16) | \
> >>> +                 ((__u64)((g) & 0x1) << 20) | \
> >>> +                 ((__u64)((h) & 0xf) << 24) | \
> >>> +                 ((__u64)((v) & 0xf) << 28) | \
> >>> +                 ((__u64)((c) & 0x1) << 36)))
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
> >>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
> >>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
> >>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
> >>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
> >>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
> >>> +
> >>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
> >>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
> >>> +
> >>> #if defined(__cplusplus)
> >>> }
> >>> #endif
> >>> --
> >>> 2.17.1
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
