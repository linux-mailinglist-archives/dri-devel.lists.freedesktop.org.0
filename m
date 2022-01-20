Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98007494EAC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F409910E533;
	Thu, 20 Jan 2022 13:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAC710E533
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:12:21 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id t9so8733894oie.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UPT9oSQ7vTyO18IljvbXmCdLvD6uLB3X/2dwfF49JVc=;
 b=JDxjOWvBKrUH5zL1esupE6Dfs0jeDyvn92YzfMoWrNhq8q1ck+HUzeh+lxFI93xxj7
 uWTJ8OL6wXoykDvRa+Uty7HptyQli+VdiTPZdq8CQcWrr8TEqYAqGcXF7uDNCGcwpl/t
 QgPVHbfDhG3RMK2okUo5rY8pkri5B+Pn6BRsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UPT9oSQ7vTyO18IljvbXmCdLvD6uLB3X/2dwfF49JVc=;
 b=6+zJKguOfAylSoj6ihyCIGjy7PCx4upavpjl9GAITzrKU6q8jv705G6RJ+U7cyaw9R
 VaNWCeAL0oaAMedtCsgGkeKOVgPTp2+aNGkXmsqtEnO12dQqMhwL0bcygcPJmyA0IKRB
 ILELO+sVd9mIpxBGblOLmxcaWl/OQ7/BweRnY5o1siTFH9RTb+W9sswa5UsnKByIMm/n
 Y38aXlRnS1ZZf8Um0HuUb8GpNoQ9jnUb2A8tgCCPK+vzRjcM6j88Lbs7MKZyBkiCb3m+
 vykYZf7Od6r1YqsV4oTArWSQgTT7fa8BaamSl521AObFhTU3NuIZKhB7JOU4fyUtg0hK
 rLfQ==
X-Gm-Message-State: AOAM532VNDVojTaLi7++P/8dbxw6rKxnDeB7i2UOsn3Eq1VThKHQjZ/7
 9WeUr9ojJ5e77IAgLn5H7RWYunI48pbhIzi33txnlw==
X-Google-Smtp-Source: ABdhPJw9NbrClGNlCx1nESRHyD+HpFNdiiT0B0jUj4qAqU3rOGRiq+dY76Ha4x1Fl8dikSpX+RTnYox3VqOkTYzJTtM=
X-Received: by 2002:a05:6808:1188:: with SMTP id
 j8mr7334091oil.101.1642684339344; 
 Thu, 20 Jan 2022 05:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20220120124416.82202-1-contact@emersion.fr>
In-Reply-To: <20220120124416.82202-1-contact@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 Jan 2022 14:12:08 +0100
Message-ID: <CAKMK7uF9XXzYJRiz4uvv5c40GX_XW7q2rOdDxKQzOezB2Y9kBw@mail.gmail.com>
Subject: Re: [PATCH] drm: document struct drm_mode_fb_cmd2
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 1:48 PM Simon Ser <contact@emersion.fr> wrote:
>
> Follow-up for the DRM_IOCTL_MODE_GETFB2 docs.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Stone <daniels@collabora.com>

Thanks for pushing our docs forward!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm_mode.h | 83 ++++++++++++++++++++++++-------------
>  1 file changed, 55 insertions(+), 28 deletions(-)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index e1e351682872..5dbbe1393bff 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -663,41 +663,68 @@ struct drm_mode_fb_cmd {
>  #define DRM_MODE_FB_INTERLACED (1<<0) /* for interlaced framebuffers */
>  #define DRM_MODE_FB_MODIFIERS  (1<<1) /* enables ->modifer[] */
>
> +/**
> + * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
> + *
> + * This struct holds frame-buffer metadata. There are two ways to use it:
> + *
> + * - User-space can fill this struct and perform an &DRM_IOCTL_MODE_ADDFB2
> + *   ioctl to register a new frame-buffer. The new frame-buffer object ID will
> + *   be set by the kernel in @fb_id.
> + * - User-space can set @fb_id and perform a &DRM_IOCTL_MODE_GETFB2 ioctl to
> + *   fetch metadata about an existing frame-buffer.
> + *
> + * In case of planar formats, this struct allows up to 4 buffer objects with
> + * offsets and pitches per plane. The pitch and offset order is dictated by the
> + * fourcc, e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
> + *
> + *     YUV 4:2:0 image with a plane of 8 bit Y samples followed by an
> + *     interleaved U/V plane containing 8 bit 2x2 subsampled colour difference
> + *     samples.
> + *
> + * So it would consist of Y as ``offsets[0]`` and UV as ``offsets[1]``. Note
> + * that ``offsets[0]`` will generally be 0 (but this is not required).
> + *
> + * To accommodate tiled, compressed, etc formats, a modifier can be specified.
> + * For more information see the "Format Modifiers" section. Note that even
> + * though it looks like we have a modifier per-plane, we in fact do not. The
> + * modifier for each plane must be identical. Thus all combinations of
> + * different data layouts for multi-plane formats must be enumerated as
> + * separate modifiers.
> + */
>  struct drm_mode_fb_cmd2 {
> +       /** @fb_id: Object ID of the frame-buffer. */
>         __u32 fb_id;
> +       /** @width: Width of the frame-buffer. */
>         __u32 width;
> +       /** @height: Height of the frame-buffer. */
>         __u32 height;
> -       __u32 pixel_format; /* fourcc code from drm_fourcc.h */
> -       __u32 flags; /* see above flags */
> +       /**
> +        * @pixel_format: FourCC format code, see ``DRM_FORMAT_*`` constants in
> +        * ``drm_fourcc.h``.
> +        */
> +       __u32 pixel_format;
> +       /**
> +        * @flags: Frame-buffer flags (see &DRM_MODE_FB_INTERLACED and
> +        * &DRM_MODE_FB_MODIFIERS).
> +        */
> +       __u32 flags;
>
> -       /*
> -        * In case of planar formats, this ioctl allows up to 4
> -        * buffer objects with offsets and pitches per plane.
> -        * The pitch and offset order is dictated by the fourcc,
> -        * e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
> -        *
> -        *   YUV 4:2:0 image with a plane of 8 bit Y samples
> -        *   followed by an interleaved U/V plane containing
> -        *   8 bit 2x2 subsampled colour difference samples.
> -        *
> -        * So it would consist of Y as offsets[0] and UV as
> -        * offsets[1].  Note that offsets[0] will generally
> -        * be 0 (but this is not required).
> -        *
> -        * To accommodate tiled, compressed, etc formats, a
> -        * modifier can be specified.  The default value of zero
> -        * indicates "native" format as specified by the fourcc.
> -        * Vendor specific modifier token.  Note that even though
> -        * it looks like we have a modifier per-plane, we in fact
> -        * do not. The modifier for each plane must be identical.
> -        * Thus all combinations of different data layouts for
> -        * multi plane formats must be enumerated as separate
> -        * modifiers.
> +       /**
> +        * @handles: GEM buffer handle, one per plane. Set to 0 if the plane is
> +        * unused.
>          */
>         __u32 handles[4];
> -       __u32 pitches[4]; /* pitch for each plane */
> -       __u32 offsets[4]; /* offset of each plane */
> -       __u64 modifier[4]; /* ie, tiling, compress */
> +       /** @pitches: Pitch (aka. stride), one per plane. */
> +       __u32 pitches[4];
> +       /** @offsets: Offset into the buffer, one per plane. */
> +       __u32 offsets[4];
> +       /**
> +        * @modifier: Format modifier, one per plane. See ``DRM_FORMAT_MOD_*``
> +        * constants in ``drm_fourcc.h``. All planes must use the same
> +        * modifier. Ignored unless &DRM_MODE_FB_MODIFIERS is set in @flags.
> +        */
> +       __u64 modifier[4];
>  };
>
>  #define DRM_MODE_FB_DIRTY_ANNOTATE_COPY 0x01
>
> base-commit: 37e0321ab2569b44f8a94339bf47653493ac864e
> --
> 2.34.1
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
