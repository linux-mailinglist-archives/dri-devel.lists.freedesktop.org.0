Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045DA3A7A0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 20:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9CE10E74D;
	Tue, 18 Feb 2025 19:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31DF10E74B;
 Tue, 18 Feb 2025 19:32:45 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-4be5b33ff91so631775137.1; 
 Tue, 18 Feb 2025 11:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739907163; x=1740511963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yb7jRjd6uguB9cG41rTvHpSN+ZVtgW/KmSvyau5JmeE=;
 b=FQc8FP+6XTrTwwOksZwZkHjN1zaCoQFzrDYto+jBCCr3VeWsLbvdqpKlrHr7O4Wj6u
 g7Uvf5q7N2QJTbXrhfV5n9gzWBLz5SVj279eOzgKLidvbAwunr0hs237VMYvyx+tOWcJ
 fQJrVC5/RjxUAp1U9obGlaxZHqm1ZYtHvsBNtlW6eAlhAibY7QV3I5XBlimG7p1b5Bmy
 mrspHCC5qpuCcYfrT641hRZdjVclOpfkh7eQO/dsWFDXiAfnVzYO0+ES8TyPXrhGoE4x
 z1PYz/18Jz9QDyXPwnI+tvTArmepUfq3wRSnR+PYYvPQzkzT0TiJsDagoGfq+HIQrwD9
 oqyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvH6SWfIO/utpymYxvZKQ3gOp6NVrrk3q/TIT2lA0P7gnRxpC1rTDiUAszWq6NOySzj3P9o+VlH/E=@lists.freedesktop.org,
 AJvYcCVaO7Hh8mlWcb7DWHvB3MYL21LBh3w206YvJWQmdY6WSWaUS/Di47NNxj0FcME+I9QYlwMfv+IFDg==@lists.freedesktop.org,
 AJvYcCVkExXp875JTcTx9wne51a9WQSaLodxVPiSgMouPqdYrvAZMnXjchqUQx97+2yKpFMrDwY5Gwf7ylA=@lists.freedesktop.org,
 AJvYcCWh72u5gKD4Fd8vZUerygv95B4xiR4Gc+Gh9mWFKt4aR+ECvkBCCRL59lD6Pfq9TTY4Mk4NAOvMLL66@lists.freedesktop.org,
 AJvYcCXh9CRAmgIhS7j9QB7p6d8zJnHDtBrEX/Cv3wYBTcjc68LsLRIpuw+bKfolNdnK4VS/5ihdHRxOTQIwwJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi2IzmYDQBNUCzR+0R+jTX34w2ufbXe5H9CK0sfYM3sDsichTo
 pcPNYfezZNnwYaCV949ExQoV2GOJ2j8NGtELFR0emogu2wIrmX60dykqSn5f
X-Gm-Gg: ASbGncvQatqGViAs7rSlXVfaPRC2ajfC0nVLJHdQtIQsHr/zB8XJa/hu7kbPrjz6r3B
 hTlOFbiSBVI0bJ/JADAUdfly6PVOuKvnSEc2Icel+KA7l6wpxDGIgkXslv3jXtZqI1bNX6nwOIi
 8aBOOqanr4nFWcXbeyaw7R/iX1/4SrOXrNXEdLy5r0IaLAzAnKYnIqq8ixliS+Rgc/yajNdSNTJ
 Z4Yxd+b52QmtUWjL7ltRCkXbXJNGqFMH/j2WMbUTxy8cqZo/qMnQ34jr4tzoKWiVwolH7j2mp/Q
 LciUJb7uC6FRzJmzAuqGznpJC6lNzIU8sV6lTV8OZ91VtgwoGuBTxg==
X-Google-Smtp-Source: AGHT+IEDPxqRETVowx9o0L2xfyCCCVaPWhyN34UyZndc/5oNf/lOU19FA8O4l1otgYvu5pbGICZ4zw==
X-Received: by 2002:a05:6102:dd1:b0:4bb:baa0:371d with SMTP id
 ada2fe7eead31-4be85cedc05mr615638137.24.1739907161561; 
 Tue, 18 Feb 2025 11:32:41 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4bd3b4fe4a6sm2140575137.14.2025.02.18.11.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 11:32:40 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4be633cacbbso688026137.3; 
 Tue, 18 Feb 2025 11:32:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWMKxIe42Vp7tg1OYuchWQ900PPwh4JCdSVq6c/XIMtoA0/PHHZkCH8EZ7VzaFSlq4vVu+vdi8nHk=@lists.freedesktop.org,
 AJvYcCWCBqr2+xkX9aYwwXWMML0ZimFB0LenP4PbRt5G2PmzsPBTWY4sHlTY9J88uuOc0geC7/prPTyrvw==@lists.freedesktop.org,
 AJvYcCWJOHTvy1XmA1mnUhcqWVrxkRSxX1HRjIn5zIln08CjezVOSXKPUIuF1ZDmwy9+q55ER1Uk+flliWI=@lists.freedesktop.org,
 AJvYcCWY9T/MXqC7nSR/Fts0mmr70ctTvMcIJT7sHZRWWidc40/Vytibt3XbIKgMpWNa8CDD6tSAg1ZvlqCg@lists.freedesktop.org,
 AJvYcCXKBEjhjJKiJfpYZ7fNAJmgEWzp0kaN82TjcHvUe8Bs2zKOGQX9DqOIpjb4z79sG1EBXqdcqO5O5oZCCr8=@lists.freedesktop.org
X-Received: by 2002:a05:6102:b10:b0:4bb:d394:46c5 with SMTP id
 ada2fe7eead31-4be85bb8970mr656557137.9.1739907160582; Tue, 18 Feb 2025
 11:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
In-Reply-To: <20250218142542.438557-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 20:32:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
X-Gm-Features: AWEUYZnARFSxvjPUxC-uDBDfMGz-IvL-HNvEMBPwKo8soOA7GylWEHj75pA7v34
Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 xen-devel@lists.xenproject.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, 18 Feb 2025 at 15:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> scanline pitch and allocation size. Implementations of struct
> drm_driver.dumb_create can call the new helper for their size
> computations.
>
> There is currently quite a bit of code duplication among DRM's
> memory managers. Each calculates scanline pitch and buffer size
> from the given arguments, but the implementations are inconsistent
> in how they treat alignment and format support. Later patches will
> unify this code on top of drm_mode_size_dumb() as much as possible.
>
> drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> the given color mode. This makes the dumb-buffer interface behave
> similar the kernel's video= parameter. Current per-driver implementations
> again likely have subtle differences or bugs in how they support color
> modes.
>
> The dumb-buffer UAPI is only specified for known color modes. These
> values describe linear, single-plane RGB color formats or legacy index
> formats. Other values should not be specified. But some user space
> still does. So for unknown color modes, there are a number of known
> exceptions for which drm_mode_size_dumb() calculates the pitch from
> the bpp value, as before. All other values work the same but print
> an error.
>
> v3:
> - document the UAPI semantics
> - compute scanline pitch from for unknown color modes (Andy, Tomi)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> +/**
> + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> + * @dev: DRM device
> + * @args: Parameters for the dumb buffer
> + * @pitch_align: Scanline alignment in bytes
> + * @size_align: Buffer-size alignment in bytes
> + *
> + * The helper drm_mode_size_dumb() calculates the size of the buffer
> + * allocation and the scanline size for a dumb buffer. Callers have to
> + * set the buffers width, height and color mode in the argument @arg.
> + * The helper validates the correctness of the input and tests for
> + * possible overflows. If successful, it returns the dumb buffer's
> + * required scanline pitch and size in &args.
> + *
> + * The parameter @pitch_align allows the driver to specifies an
> + * alignment for the scanline pitch, if the hardware requires any. The
> + * calculated pitch will be a multiple of the alignment. The parameter
> + * @size_align allows to specify an alignment for buffer sizes. The
> + * returned size is always a multiple of PAGE_SIZE.
> + *
> + * Returns:
> + * Zero on success, or a negative error code otherwise.
> + */
> +int drm_mode_size_dumb(struct drm_device *dev,
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align)
> +{
> +       u64 pitch = 0;
> +       u32 fourcc;
> +
> +       /*
> +        * The scanline pitch depends on the buffer width and the color
> +        * format. The latter is specified as a color-mode constant for
> +        * which we first have to find the corresponding color format.
> +        *
> +        * Different color formats can have the same color-mode constant.
> +        * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> +        * It is possible to use different formats for dumb-buffer allocation
> +        * and rendering as long as all involved formats share the same
> +        * color-mode constant.
> +        */
> +       fourcc = drm_driver_color_mode_format(dev, args->bpp);
> +       if (fourcc != DRM_FORMAT_INVALID) {
> +               const struct drm_format_info *info = drm_format_info(fourcc);
> +
> +               if (!info)
> +                       return -EINVAL;
> +               pitch = drm_format_info_min_pitch(info, 0, args->width);
> +       } else if (args->bpp) {
> +               /*
> +                * Some userspace throws in arbitrary values for bpp and
> +                * relies on the kernel to figure it out. In this case we
> +                * fall back to the old method of using bpp directly. The
> +                * over-commitment of memory from the rounding is acceptable
> +                * for compatibility with legacy userspace. We have a number
> +                * of deprecated legacy values that are explicitly supported.
> +                */
> +               switch (args->bpp) {
> +               default:
> +                       drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",

%u

> +                                args->bpp);
> +                       fallthrough;
> +               case 12:
> +               case 15:
> +               case 30: /* see drm_gem_afbc_get_bpp() */
> +               case 10:

Perhaps keep them sorted numerically?

> +               case 64: /* used by Mesa */
> +                       pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> +                       break;
> +               }
> +       }
> +
> +       if (!pitch || pitch > U32_MAX)
> +               return -EINVAL;
> +
> +       args->pitch = pitch;
> +
> +       return drm_mode_align_dumb(args, pitch_align, size_align);
> +}
> +EXPORT_SYMBOL(drm_mode_size_dumb);
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>                          struct drm_mode_create_dumb *args,
>                          struct drm_file *file_priv)
> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> new file mode 100644
> index 000000000000..6fe36004b19d
> --- /dev/null
> +++ b/include/drm/drm_dumb_buffers.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DRM_DUMB_BUFFERS_H__
> +#define __DRM_DUMB_BUFFERS_H__
> +
> +struct drm_device;
> +struct drm_mode_create_dumb;
> +
> +int drm_mode_size_dumb(struct drm_device *dev,
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align);
> +
> +#endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..eea09103b1a6 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
>   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>   * @height: buffer height in pixels
>   * @width: buffer width in pixels
> - * @bpp: bits per pixel
> + * @bpp: color mode
>   * @flags: must be zero
>   * @handle: buffer object handle
>   * @pitch: number of bytes between two consecutive lines
> @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
>   *
>   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>   * the kernel fills @handle, @pitch and @size.
> + *
> + * The value of @bpp is a color-mode number describing a specific format
> + * or a variant thereof. The value often corresponds to the number of bits
> + * per pixel for most modes, although there are exceptions. Each color mode
> + * maps to a DRM format plus a number of modes with similar pixel layout.
> + * Framebuffer layout is always linear.
> + *
> + * Support for all modes and formats is optional. Even if dumb-buffer
> + * creation with a certain color mode succeeds, it is not guaranteed that
> + * the DRM driver supports any of the related formats. Most drivers support
> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> + * plane.
> + *
> + * +------------+------------------------+------------------------+
> + * | Color mode | Framebuffer format     | Compatibles            |
> + * +============+========================+========================+
> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> + * |            |                        |  * DRM_FORMAT_BGRX8888 |
> + * +------------+------------------------+------------------------+
> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> + * +------------+------------------------+------------------------+
> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> + * +------------+------------------------+------------------------+
> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> + * |            |                        |  * DRM_FORMAT_BGRX1555 |
> + * +------------+------------------------+------------------------+
> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |

+ DRM_FORMAT_D8? (and 4/2/1 below)

And DRM_FORMAT_Y8, if/when Tomi's series introducing that is accepted...

> + * +------------+------------------------+------------------------+
> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
> + * +------------+------------------------+------------------------+
> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
> + * +------------+------------------------+------------------------+
> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
> + * +------------+------------------------+------------------------+
> + *
> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> + * legacy user space. Please don't use them in new code. Other modes
> + * are not support.
> + *
> + * Do not attempt to allocate anything but linear framebuffer memory
> + * with single-plane RGB data. Allocation of other framebuffer
> + * layouts requires dedicated ioctls in the respective DRM driver.
>   */
>  struct drm_mode_create_dumb {
>         __u32 height;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
