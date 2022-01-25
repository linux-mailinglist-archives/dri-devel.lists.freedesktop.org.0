Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B349ADE8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1BB10EC0B;
	Tue, 25 Jan 2022 08:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E038810EC0B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:22:28 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id m131so11851292vkm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 00:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tXOmEJHiGgVVYZSnc2W+chCWjA/cqBei0ztCaTs/W8=;
 b=xNLWDxZm7k9vhvu6qVNmP9RqaRwbdibCsJaloQSPRE4t69nxx9gtmAtcXYQIiwxyfa
 8jW1qDvoAZpttS+I/RgDS2DckVYYHNoQWbvMlR4bJgq0/Y6Qn3VB856qEycfL/DtXIye
 uej3wJYwwMHnvZwAmAv5MUHPsO/SuRiqkOHdg7ng/xcAwsDQ2Ygkyg/GV2E+IKOGKnw6
 ZggZzyKASrqteV6hEFKiXUUVmzZgGzF/jsLcHrvZvzxsqrlvyCSihEro1YgLU4k2gaqk
 SXJ/P9QwMN0SEGzXYcG8scMiLpHDn8mNcyD6lYeqGKhm41bgcj7+GVCRBcL3lr1cuzGL
 J6CA==
X-Gm-Message-State: AOAM532Ty9eYeJHbIjNMQPcSluUcUdZIH74PFlov26+SVPLU2Q1zOQW9
 /XRrpVTehoiSTG89rm1qsRaw34Adt+OowQ==
X-Google-Smtp-Source: ABdhPJyFEumuDeI/jMD7Xl4XLzeI4MtxWSkdNBTkPcIHPX0iZDvHtRZUikTjhvaFBtVNLNzkPcrDhA==
X-Received: by 2002:a05:6122:91f:: with SMTP id
 j31mr1947395vka.2.1643098947761; 
 Tue, 25 Jan 2022 00:22:27 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id v22sm821956vsf.13.2022.01.25.00.22.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 00:22:27 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id d189so11920800vkg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 00:22:27 -0800 (PST)
X-Received: by 2002:a1f:1b46:: with SMTP id b67mr4212932vkb.20.1643098947197; 
 Tue, 25 Jan 2022 00:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20220124221633.952374-1-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 09:22:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPqpw53LTs0Z6sCdrdT_uk4JOwq7rw_gkxwXmAd=EG+Q@mail.gmail.com>
Message-ID: <CAMuHMdXPqpw53LTs0Z6sCdrdT_uk4JOwq7rw_gkxwXmAd=EG+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for your patch!

On Mon, Jan 24, 2022 at 11:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
> Also add notes that for atomic drivers it's really somewhere else and
> no longer in struct drm_crtc.
>
> Maybe we should put a bigger warning here that this is confusing,
> since the pixel format is a plane property, but the GAMMA_LUT property
> is on the crtc. But I think we can fix this if/when someone finds a
> need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> also not sure whether even hardware with a CLUT and a full color
> correction pipeline with degamm/cgm/gamma exists.

IIRC (it's been a looong time) some set-top-box hardware did support
this.  It made sense, as the CLUT is per-plane, while the gamma value
is a property of the display output device.
At that time, desktop hardware supported only a single plane, so
hardware complexity could be reduced by letting software handle
that through a single clut (for "pseudocolor") or gamma table (for
"directcolor").
For hardware with multiple alpha-blended planes (some CLUT, some
ARGB, some (A)YCbCr), doing it in software is either very complicated
or impossible, especially if you have two heads needing different
gamma values.
Whether such hardware still exists, and needs to be supported,
I do not know...

> Motivated by comments from Geert that we have a gap here.
>
> v2: More names for color luts (Laurent).

+1, that would help for sure!

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -82,6 +82,10 @@
>   *     driver boot-up state too. Drivers can access this blob through
>   *     &drm_crtc_state.gamma_lut.
>   *
> + *     Note that for mostly historical reasons stemming from Xorg herita=
ge,
> + *     this is also used to store the color map (also sometimes color lu=
t, CLUT
> + *     or color palette) for indexed formats like DRM_FORMAT_C8.
> + *
>   * =E2=80=9CGAMMA_LUT_SIZE=E2=80=9D:
>   *     Unsigned range property to give the size of the lookup table to b=
e set
>   *     on the GAMMA_LUT property (the size depends on the underlying har=
dware).
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 4d01b4d89775..a70baea0636c 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -285,6 +285,10 @@ struct drm_crtc_state {
>          * Lookup table for converting pixel data after the color convers=
ion
>          * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if n=
ot
>          * NULL) is an array of &struct drm_color_lut.
> +        *
> +        * Note that for mostly historical reasons stemming from Xorg her=
itage,
> +        * this is also used to store the color map (also sometimes color=
 lut,
> +        * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
>          */
>         struct drm_property_blob *gamma_lut;
>
> @@ -1075,12 +1079,18 @@ struct drm_crtc {
>         /**
>          * @gamma_size: Size of legacy gamma ramp reported to userspace. =
Set up
>          * by calling drm_mode_crtc_set_gamma_size().
> +        *
> +        * Note that atomic drivers need to instead use
> +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
>          */
>         uint32_t gamma_size;
>
>         /**
>          * @gamma_store: Gamma ramp values used by the legacy SETGAMMA an=
d
>          * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_siz=
e().
> +        *
> +        * Note that atomic drivers need to instead use
> +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
>          */
>         uint16_t *gamma_store;

This is indeed what I ended up using, as
drivers/gpu/drm/drm_fb_helper.c:setcmap_atomic() fills in
drm_crtc.gamma_store[].  But as I understand it, I should instead
use the gamma_lut above?

BTW, to check if the CLUT changed, I look at
drm_crtc_state.color_mgmt_changed.  This works reasonably well,
but I still see more CLUT reloads than expected.
Who clears drm_crtc_state.color_mgmt_changed again?
Is there a better check?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
