Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449859BF77B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 20:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549B110E0F4;
	Wed,  6 Nov 2024 19:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SDcVDBwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F0410E0F4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 19:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730922570;
 bh=Yu+Js0pvY+mQCpw821Z7viaJMGNXO8zV2+RCODcAxV4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=SDcVDBwKKR/Ln5OrXvDm4a+d2ZqpMxgg2+5OMdKRoJ4UJfYd/zv/OAaiUTWyTkNLI
 5D+wuczkeZc+xCr9/DVbCiWjvXUYcX9dWArB//aHrpFMCjRffcQXYOj5SGNDEkS2sU
 x0bSaSBMgfALh/ZqDY9m8MQ1+AllIu1qhB0nyfEejiAZLcu1XSQtL6Wr3lNe3EhBfM
 a2Bc5pBpW8e35Cgp+eO58wa+ilC2MNU3AaGSkkHi+k/4cECgjAgx4FYcwiiP2CXUMn
 XWgD/ymQ/EFIhN9NDyhzkpHraECVQc57ww83doXn1N8RAuPIKpKBKboh4wubOszBY+
 1rHKRxuADHrXQ==
Received: from nicolas-tpx395.localdomain (unknown
 [IPv6:2606:6d00:15:862e::580])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nicolas)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FC2717E3777;
 Wed,  6 Nov 2024 20:49:26 +0100 (CET)
Message-ID: <a8e06d9dcc664918d91fb6e7dd80692230df9b68.camel@collabora.com>
Subject: Re: [PATCH] drm/fourcc: Add modifier definition for describing
 Verisilicon video framebuffer
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, laurentiu.palcu@nxp.com,
 aisheng.dong@nxp.com,  Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Collabora
 Kernel ML <kernel@collabora.com>
Date: Wed, 06 Nov 2024 14:49:24 -0500
In-Reply-To: <e5b0252f-f097-4e47-ad07-701cadd965fb@collabora.com>
References: <0102019301ab1b2d-5539e1c7-e026-47bc-8692-b3335f6f7584-000000@eu-west-1.amazonses.com>
 <e5b0252f-f097-4e47-ad07-701cadd965fb@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mercredi 06 novembre 2024 à 16:53 +0100, Benjamin Gaignard a écrit :
> + nicolas

Thanks for the CC, I'm obviously watching kernel@collabora.com, I don't know why
it didn't make it to my mailbox.

I'm adding explicitly Lucas and Philipp, as I believe they can provide relevant
information here.

> 
> Le 06/11/2024 à 14:30, Benjamin Gaignard a écrit :
> > Verisilicon hardware video decoders can produce tiled (8x4 or 4x4)
> > and compressed video framebuffers.
> > It considerably reduces memory bandwidth while writing and reading
> > frames in memory.

I've seen for years this 8x4 references, but in reality, and I've implemented
software converters that works on all the VSI/Hantro drivers we have mainline,
there is no such thing as 8x4 tiled coming out of these chips.

Unless we have new evidence, and V4L2 patches enabling these formats, I don't
see any point of bringing what I believe is a TRM mistake, or an historical
format.

> > 
> > The underlying storage in NV12 (for 8-bit) or NV15 (for 10-bit).
> > 
> > Display controllers, like imx DCSS, could use these modifier definition
> > as input for overlay planes.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > ---
> > The original code comes from:
> > https://github.com/nxp-imx/linux-imx/commit/ab01b7fe82d5a11dfb533cfbd08c4dfa140815de
> > I have port it and modify DRM_FORMAT_MOD_VENDOR_VSI value.
> > 
> >   include/uapi/drm/drm_fourcc.h | 27 +++++++++++++++++++++++++++
> >   1 file changed, 27 insertions(+)
> > 
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 78abd819fd62..31d09a98d0d7 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -421,6 +421,7 @@ extern "C" {
> >   #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
> >   #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
> >   #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> > +#define DRM_FORMAT_MOD_VENDOR_VSI     0x0b
> >   
> >   /* add more to the end as needed */
> >   
> > @@ -1607,6 +1608,32 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >   #define AMD_FMT_MOD_CLEAR(field) \
> >   	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
> >   
> > +/* Verisilicon framebuffer modifiers */
> > +
> > +/*
> > + * Verisilicon 8x4 tiling layout
> > + *
> > + * This is G1 VPU tiled layout using tiles of 8x4 pixels in a row-major
> > + * layout.
> > + */
> > +#define DRM_FORMAT_MOD_VSI_G1_TILED fourcc_mod_code(VSI, 1)

I have code in GStreamer mainline that handle the tiled G1 output in software
and its 4x4, no doubt here ... 

> > +
> > +/*
> > + * Verisilicon 4x4 tiling layout
> > + *
> > + * This is G2 VPU tiled layout using tiles of 4x4 pixels in a row-major
> > + * layout.
> > + */
> > +#define DRM_FORMAT_MOD_VSI_G2_TILED fourcc_mod_code(VSI, 2)

... Meaning this split make no sense, G2 shares the same format in V4L2 and
works well in GStreamer software converters. In fact, in the NXP TRM, you should
notice that in the G1 section, they document G2 tile and G1 tile is ignored.
Perhaps the DCSS do implement some 8x4 tiling, but considering we don't have
evidence of anything producing that, we should probably not have it.

From the documentation from NXP, G2 Tile is identical to
DRM_FORMAT_MOD_VIVANTE_TILED, so we really should reuse the existing definition.
If not, I'd really like to know in the text why. Running Etnaviv patched with
NV12 support (which I think got merged now), I can see that the combination is
supported (but haven't tested it though since its not mapped properly in
GStreamer yet):


| NV12         | NV12                    | external only |
|              | NV12:0x0600000000000001 | external only |
|              | NV12:0x0600000000000002 | external only |

Having a GL path is very efficient, but also gives compositors a composition
fallback which is needed to enable a format and guarantee it can be rendered at
all time.

> > +
> > +/*
> > + * Verisilicon 4x4 tiling with compression layout
> > + *
> > + * This is G2 VPU tiled layout using tiles of 4x4 pixels in a row-major
> > + * layout with compression.
> > + */
> > +#define DRM_FORMAT_MOD_VSI_G2_TILED_COMPRESSED fourcc_mod_code(VSI, 3)

This one needs definition, but the doc provided does not seem to match what I
can see in IMX8M TRM (see 14.2.2.3 Compressed format), here's a snippet, I don't
yet fully understand it. They only explain the storage, not the compression
technique, but this should be enough to understand its not a simple row-major
4x4 tiling.

   When compression is enabled, the picture is divided into CBS rows, which is
   further divided into continuous CBS groups. Each CBS group is composed of 16
   CBS. The luminance CBS is composed of 1 8x8 coded block (CB), which one
   chrominance CBS is composed of two 8x4 coded blocks, with cb CB first then cr
   CB following. The compression is performed to each CB in the CBS. The first
   CB's compressed data saved from the same offset of that CBS in raster scan
   buffer. And the compressed output of following CBs in the CBS row is saved
   continuously. That means there may be gaps between the compressed data of
   each CBS row.

Nicolas

> > +
> >   #if defined(__cplusplus)
> >   }
> >   #endif

