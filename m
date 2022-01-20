Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B1494F98
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725B510E38F;
	Thu, 20 Jan 2022 13:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF1D10E3BD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:53:45 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id p5so17863196ybd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5P2k5ENZWYEeBIMHoJxpdZPQQbo2CfWbSd7/X1AGsQo=;
 b=lECY8HqM/G96S8iQ6OopOyzNHVFV8URBxelKiGMpKegnQKu8fQ1jwaHO7kYstDYqtU
 vn+iegJRfNjwfSLRXlSFDcJf1g8iGLo8ofrcnm94mFbvf/3frdXnv7q62s0ghSLb+qtX
 riiR3iDtIJn+T6xcJwEasGy1Bqmr6onNJyIOSS6KNVvsXe6SkzQynClHwXZUYZD+GI9O
 cJLZgEXOfXdJNYrASweI6JVQrzXtauqBvRr78SpZvXwtQZn8mPEH84vH1kknnhHk7hnP
 hnh2GwYv/tFEsD1jzJTkoDHEEFNAzd4IhKbfB7x30XVhd9zWAUiKMR+UNCiDc26vQLC4
 HsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5P2k5ENZWYEeBIMHoJxpdZPQQbo2CfWbSd7/X1AGsQo=;
 b=FmmqeVLBtPJ+Yd+2Us8DHPdBKP0Lkt/pRS+XcFATPeiNdOqRoDmKYPcFzEv0i4THcW
 tbEzLU9UiCV0+j9SRSfn+RFtFmKnU3pMYF32MTJisdARIM3v7j5W8cRL+U5OtNhbnu1O
 GUAY5mXUeXiChjcz1YP/V2WHXApGkDSq9bpXSSDPBpnOFpcjhBJemK8lVyU83f+DzObx
 f5UPYdOk/LHfybN3FEuGu0x8r2RtqZpXrOn3xycDb8bEneJ0VC7Rz6fc9d4UuL7jgFB2
 c6wQ25rUZL8RpWVXH8BtQ/IlPOK8jt5DSjg3i1Ufkny7SqEDe7iLq2C/Fsq/qKi822fJ
 DeCg==
X-Gm-Message-State: AOAM530057aBDNm9snXNA80fIl5Nd2xjj8jy3JYmAf3MTPIODJykMcPs
 sHJrsVt5tiFLTWDah5RsQXqZ5lEEZvIklsMKtLx7BQ==
X-Google-Smtp-Source: ABdhPJy/r8p3SpTVjWslZP9i0mTuagqPkBLvWG4zUSI8REbqt+CQEgSV1S7EMGnLkgAy02tiwKrY2kVTo9WiOgR5vdU=
X-Received: by 2002:a25:3b89:: with SMTP id
 i131mr46513945yba.449.1642686824821; 
 Thu, 20 Jan 2022 05:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20220120124416.82202-1-contact@emersion.fr>
In-Reply-To: <20220120124416.82202-1-contact@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 20 Jan 2022 13:53:33 +0000
Message-ID: <CAPj87rN-sY3JfEK1kSs+vJjzVhTqJXU8hFiE-7i2Cc5-2996GA@mail.gmail.com>
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

On Thu, 20 Jan 2022 at 12:48, Simon Ser <contact@emersion.fr> wrote:
> Follow-up for the DRM_IOCTL_MODE_GETFB2 docs.

Yeah, thanks a lot for doing this, it's really awesome. <3

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

I think the note about offsets[0] usually being zero should be
dropped. Equally, rather than referring to fourcc.org, why don't we
just refer to drm_fourcc.h and maybe note in there that fourcc.org can
be helpful for some formats, but others are missing or mismatching.

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

All these fields MBZ (not INVALID!) if the plane is unused.

Cheers,
Daniel
