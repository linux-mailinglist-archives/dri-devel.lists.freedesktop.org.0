Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A840A568B5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073FC10EB56;
	Fri,  7 Mar 2025 13:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dCvWuutQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612E710EB51
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:19:17 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac202264f9cso345293066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741353556; x=1741958356; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GmXXr/GHvAGv2swMlIkbl+Www19HcX8d7ze1AMoIM9w=;
 b=dCvWuutQZLqU9eRlZRslZf6caIRvChiK0SwJ/1z3lE493UTQEUUO2f63X5r/ehdGPF
 RIaDpEhjLfIV5egJ6GpfrupLUs9SmNyp2Kp7xIC6MByyT8g4pfH8aThjJPufbOD8TFMK
 qoYxFwADc6DunqpeQk/IXk0bxuudWpNyJuJKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741353556; x=1741958356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmXXr/GHvAGv2swMlIkbl+Www19HcX8d7ze1AMoIM9w=;
 b=d1bAgL1n8pZfii6hhu1QoYxsAbJITiZQucFOotRk2E6zQW0UvGDxMluOFkFqDg1iXx
 8jNek8XklKHjty1VtoMr+tXyB9vPg7sGU/fXTvtF1DhF97i7AThqR0Yf5d0f+XsiKnfB
 b4wNWw2YNxWIYyFJn2FdNCZvsLSF9QeoW7mXhMZRSwDdphxwpt6CF7b3/8cTATzb5Rdm
 SJSIpJe8ZTvLlyr7YlrYg8W9lW8u906f4g5EQT8wuVUxuyHxJmM0LZ8d04I8N3Dy3D5p
 /K8/fIJNrLfMJnqLB71gHJ4y1soUTf1SgrB0hd3PPHN1h4IauSxLbaHccgk6YPlFSwJP
 OfDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLvMmdVb2CjSaWLI2gfTL/pt9PnWheSg32HZnlMw7u2juagO/pyWBePx7jhbGggzVJ/hW1FMnjfys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGrHnm4YQgmZQRIOw+l6LqqEb7v3MeDKtWINxTxWNwBL/tDWZj
 59Y7hSy2dSscHIPIUn9gXHEsxktIJBbH7fIRNWsE3f2RWYW9CgDrBhxSvMR4OIY=
X-Gm-Gg: ASbGncs3vdJXznMWrXbycrNmodVnhjdZ3DJyO4+6/ylzOE0plK691AQoSjHtba+hOGn
 YtPCTb5rSP1Y7WoRWUSxrehOS6m0cUKMVebMpI9Zry1a/oJfZRDyEpQnasdL9lV42Ij0TH95Imy
 MnVTryewQ/gxe3yTW2Hp7KCdElZ6SypYYHAX3BMxa56IbMg+G6j+DvqG9LbUa+HfvTvWfKZ0OJ6
 f3befC94jDlRTA2foMVakC6ZxiNqayWcg5KSIsv7Zlt1NiDY47dh37cMKv5oW4PqHo8m+mHJFkA
 Ip8r8A9PPh9ht7G5kuJ/IzxrxiUzBdkzZ1p/o5KorgDr18vT6m+AtWib
X-Google-Smtp-Source: AGHT+IGWJEXpT4oFObUhXEX1baZSA5ka+RDW0BObeZF31pqEHYIrQhNdRsTwmr/EHhhCwd6ldgP0tQ==
X-Received: by 2002:a17:907:7ea9:b0:abf:6b30:7a94 with SMTP id
 a640c23a62f3a-ac252f4c9eamr387695566b.45.1741353555414; 
 Fri, 07 Mar 2025 05:19:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2399d2dd8sm272788966b.166.2025.03.07.05.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:19:14 -0800 (PST)
Date: Fri, 7 Mar 2025 14:19:12 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
Message-ID: <Z8ryUGgxqVTEw9pe@phenom.ffwll.local>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Fri, Mar 07, 2025 at 09:42:25AM +0100, Simona Vetter wrote:
> On Tue, Feb 18, 2025 at 03:23:25PM +0100, Thomas Zimmermann wrote:
> > Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> > scanline pitch and allocation size. Implementations of struct
> > drm_driver.dumb_create can call the new helper for their size
> > computations.
> > 
> > There is currently quite a bit of code duplication among DRM's
> > memory managers. Each calculates scanline pitch and buffer size
> > from the given arguments, but the implementations are inconsistent
> > in how they treat alignment and format support. Later patches will
> > unify this code on top of drm_mode_size_dumb() as much as possible.
> > 
> > drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> > the given color mode. This makes the dumb-buffer interface behave
> > similar the kernel's video= parameter. Current per-driver implementations
> > again likely have subtle differences or bugs in how they support color
> > modes.
> > 
> > The dumb-buffer UAPI is only specified for known color modes. These
> > values describe linear, single-plane RGB color formats or legacy index
> > formats. Other values should not be specified. But some user space
> > still does. So for unknown color modes, there are a number of known
> > exceptions for which drm_mode_size_dumb() calculates the pitch from
> > the bpp value, as before. All other values work the same but print
> > an error.
> > 
> > v3:
> > - document the UAPI semantics
> > - compute scanline pitch from for unknown color modes (Andy, Tomi)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/gpu/drm/drm_dumb_buffers.c | 116 +++++++++++++++++++++++++++++
> >  include/drm/drm_dumb_buffers.h     |  14 ++++
> >  include/uapi/drm/drm_mode.h        |  46 +++++++++++-
> >  3 files changed, 175 insertions(+), 1 deletion(-)
> >  create mode 100644 include/drm/drm_dumb_buffers.h
> > 
> > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> > index 9916aaf5b3f2..600ab281712b 100644
> > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > @@ -25,6 +25,8 @@
> >  
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_dumb_buffers.h>
> > +#include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_mode.h>
> >  
> > @@ -57,6 +59,120 @@
> >   * a hardware-specific ioctl to allocate suitable buffer objects.
> >   */
> >  
> > +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
> > +			       unsigned long pitch_align,
> > +			       unsigned long size_align)
> > +{
> > +	u32 pitch = args->pitch;
> > +	u32 size;
> > +
> > +	if (!pitch)
> > +		return -EINVAL;
> > +
> > +	if (pitch_align)
> > +		pitch = roundup(pitch, pitch_align);
> > +
> > +	/* overflow checks for 32bit size calculations */
> > +	if (args->height > U32_MAX / pitch)
> > +		return -EINVAL;
> > +
> > +	if (!size_align)
> > +		size_align = PAGE_SIZE;
> > +	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
> > +		return -EINVAL;
> > +
> > +	size = ALIGN(args->height * pitch, size_align);
> > +	if (!size)
> > +		return -EINVAL;
> > +
> > +	args->pitch = pitch;
> > +	args->size = size;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> > + * @dev: DRM device
> > + * @args: Parameters for the dumb buffer
> > + * @pitch_align: Scanline alignment in bytes
> > + * @size_align: Buffer-size alignment in bytes
> > + *
> > + * The helper drm_mode_size_dumb() calculates the size of the buffer
> > + * allocation and the scanline size for a dumb buffer. Callers have to
> > + * set the buffers width, height and color mode in the argument @arg.
> > + * The helper validates the correctness of the input and tests for
> > + * possible overflows. If successful, it returns the dumb buffer's
> > + * required scanline pitch and size in &args.
> > + *
> > + * The parameter @pitch_align allows the driver to specifies an
> > + * alignment for the scanline pitch, if the hardware requires any. The
> > + * calculated pitch will be a multiple of the alignment. The parameter
> > + * @size_align allows to specify an alignment for buffer sizes. The
> > + * returned size is always a multiple of PAGE_SIZE.
> > + *
> > + * Returns:
> > + * Zero on success, or a negative error code otherwise.
> > + */
> > +int drm_mode_size_dumb(struct drm_device *dev,
> > +		       struct drm_mode_create_dumb *args,
> > +		       unsigned long pitch_align,
> > +		       unsigned long size_align)
> > +{
> > +	u64 pitch = 0;
> > +	u32 fourcc;
> > +
> > +	/*
> > +	 * The scanline pitch depends on the buffer width and the color
> > +	 * format. The latter is specified as a color-mode constant for
> > +	 * which we first have to find the corresponding color format.
> > +	 *
> > +	 * Different color formats can have the same color-mode constant.
> > +	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> > +	 * It is possible to use different formats for dumb-buffer allocation
> > +	 * and rendering as long as all involved formats share the same
> > +	 * color-mode constant.
> > +	 */
> > +	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> > +	if (fourcc != DRM_FORMAT_INVALID) {
> > +		const struct drm_format_info *info = drm_format_info(fourcc);
> > +
> > +		if (!info)
> > +			return -EINVAL;
> > +		pitch = drm_format_info_min_pitch(info, 0, args->width);
> > +	} else if (args->bpp) {
> > +		/*
> > +		 * Some userspace throws in arbitrary values for bpp and
> > +		 * relies on the kernel to figure it out. In this case we
> > +		 * fall back to the old method of using bpp directly. The
> > +		 * over-commitment of memory from the rounding is acceptable
> > +		 * for compatibility with legacy userspace. We have a number
> > +		 * of deprecated legacy values that are explicitly supported.
> > +		 */
> > +		switch (args->bpp) {
> > +		default:
> > +			drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",
> > +				 args->bpp);
> > +			fallthrough;
> 
> We cannot let userspace trigger dmesg warnings (or anything else really
> that spams logs). Also I think for future proofing it would be good if we
> just reject anything we don't currently know about instead of silently
> letting this mess become worse. Hence my vote is to reject unknown bpp
> hack values.
> 
> > +		case 12:
> > +		case 15:
> > +		case 30: /* see drm_gem_afbc_get_bpp() */
> 
> This is a bit too cryptic to me, I think if you want to do comments I'd
> just put a long-form one above each value that explains where we've found
> it and why it happens. I'm also assuming these all have depth = 0, which I
> guess is something we should check just to keep this as strict as
> possible? Or do they have matching depth?

Correction from irc: Thomas pointed out that there's no depth in the
create_dumb ioctl, I was mixing this up with addfb and failed to check. So
please disregard this part, I was fabricating stuff out of some very thin
air (and probably not enough coffee in the brain too).
-Sima

> 
> Cheers, Sima
> 
> > +		case 10:
> > +		case 64: /* used by Mesa */
> > +			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!pitch || pitch > U32_MAX)
> > +		return -EINVAL;
> > +
> > +	args->pitch = pitch;
> > +
> > +	return drm_mode_align_dumb(args, pitch_align, size_align);
> > +}
> > +EXPORT_SYMBOL(drm_mode_size_dumb);
> > +
> >  int drm_mode_create_dumb(struct drm_device *dev,
> >  			 struct drm_mode_create_dumb *args,
> >  			 struct drm_file *file_priv)
> > diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> > new file mode 100644
> > index 000000000000..6fe36004b19d
> > --- /dev/null
> > +++ b/include/drm/drm_dumb_buffers.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: MIT */
> > +
> > +#ifndef __DRM_DUMB_BUFFERS_H__
> > +#define __DRM_DUMB_BUFFERS_H__
> > +
> > +struct drm_device;
> > +struct drm_mode_create_dumb;
> > +
> > +int drm_mode_size_dumb(struct drm_device *dev,
> > +		       struct drm_mode_create_dumb *args,
> > +		       unsigned long pitch_align,
> > +		       unsigned long size_align);
> > +
> > +#endif
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index c082810c08a8..eea09103b1a6 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
> >   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
> >   * @height: buffer height in pixels
> >   * @width: buffer width in pixels
> > - * @bpp: bits per pixel
> > + * @bpp: color mode
> >   * @flags: must be zero
> >   * @handle: buffer object handle
> >   * @pitch: number of bytes between two consecutive lines
> > @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
> >   *
> >   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
> >   * the kernel fills @handle, @pitch and @size.
> > + *
> > + * The value of @bpp is a color-mode number describing a specific format
> > + * or a variant thereof. The value often corresponds to the number of bits
> > + * per pixel for most modes, although there are exceptions. Each color mode
> > + * maps to a DRM format plus a number of modes with similar pixel layout.
> > + * Framebuffer layout is always linear.
> > + *
> > + * Support for all modes and formats is optional. Even if dumb-buffer
> > + * creation with a certain color mode succeeds, it is not guaranteed that
> > + * the DRM driver supports any of the related formats. Most drivers support
> > + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> > + * plane.
> > + *
> > + * +------------+------------------------+------------------------+
> > + * | Color mode | Framebuffer format     | Compatibles            |
> > + * +============+========================+========================+
> > + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
> > + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> > + * |            |                        |  * DRM_FORMAT_BGRX8888 |
> > + * +------------+------------------------+------------------------+
> > + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> > + * +------------+------------------------+------------------------+
> > + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> > + * +------------+------------------------+------------------------+
> > + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
> > + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> > + * |            |                        |  * DRM_FORMAT_BGRX1555 |
> > + * +------------+------------------------+------------------------+
> > + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |
> > + * +------------+------------------------+------------------------+
> > + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
> > + * +------------+------------------------+------------------------+
> > + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
> > + * +------------+------------------------+------------------------+
> > + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
> > + * +------------+------------------------+------------------------+
> > + *
> > + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> > + * legacy user space. Please don't use them in new code. Other modes
> > + * are not support.
> > + *
> > + * Do not attempt to allocate anything but linear framebuffer memory
> > + * with single-plane RGB data. Allocation of other framebuffer
> > + * layouts requires dedicated ioctls in the respective DRM driver.
> >   */
> >  struct drm_mode_create_dumb {
> >  	__u32 height;
> > -- 
> > 2.48.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
