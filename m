Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8F46145D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 12:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB186F987;
	Mon, 29 Nov 2021 11:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF4E6F987
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 11:54:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c4so36154707wrd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 03:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ErpD005K8iYixCtXraaf0qKEe8O3SNQDyjJIUDV6siU=;
 b=sz6qmi73IBNvhpaO4YHKBnBXARvKCUbm8dNQk5j6KuVJdYLMhRdzXX+t5VeHFR1N1L
 9NU1W7sus0J7kXLpOzuywoISvdrWJvc2K+DN+uh3fQW5DFXYDHtSpcQ56hhv7L01Muqa
 /8xGLdGk4Ys8t605I7Lth3i2kYSefxcyuJi0tmzg91pw+BUsDGw/kUDFiOc7j0ac9hPo
 6K52yEum6z2tfA0wex5yqopBxh7O5uONWqRet0UF8BDOP662WmWCWugBLDDsEZPg6Ckq
 iLjksne0gYvs+G9P5nSaKZMMTWb7iCMJ4ow0azlqBt9VO0VqBYO4Bgyvbypyl8KiRUPY
 6zAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ErpD005K8iYixCtXraaf0qKEe8O3SNQDyjJIUDV6siU=;
 b=dl5V9cOMdNRHPufEnPKqhwAnAWK/oL297rcnWgA150x1go7rZy0PQWpOBXdiaCj+A9
 p5/Ai+EHhbv613zPg1xlPLy4muvpEHd5g00/ub+aHl0gWkD4Z0DFSGouXrAz6ch/8Kmx
 sSnMAVXb5GMdFVBd1SXs8l8YU702FqsQ+BRB2Tw8m4Y1RcW5R32ABb34Px3dwelmVvh/
 dY7Y+DqUGC9s0tGG5Mb3tySNtQASszq8HiEYrFx231fuYsTQZuoi8BjwFiO1OK+6zVmA
 1Vj8bqo8BPrXKsP2ZQajS3WvDxEF48kY68irXvGogCee/enkZi2kzMh9CDxS6arCwH2T
 IpWQ==
X-Gm-Message-State: AOAM5315W+PeAViSz6Vf0/cIvMtV2NATZ85eyUQzcHj8vfCsqH0yPT8q
 fJgyUIMQqgInDh3WDdhBgPRzupblHn8VpIZzSrnmiw==
X-Google-Smtp-Source: ABdhPJzGhE9TBPwc6yZBm0TmweNdoZRDnZUyeBsLhIenZIqVHqZh3uraAQS1jlzF7QU74kz9DLqNd3qPcSpK0dhuDJ4=
X-Received: by 2002:adf:f1cc:: with SMTP id z12mr24868921wro.395.1638186886350; 
 Mon, 29 Nov 2021 03:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20211117140900.313181-1-maxime@cerno.tech>
 <20211117140900.313181-2-maxime@cerno.tech>
 <20211119163124.14db6063@eldfell>
In-Reply-To: <20211119163124.14db6063@eldfell>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 29 Nov 2021 11:54:30 +0000
Message-ID: <CAPY8ntCdtVT-U6nHh39WSGkUovHiVJ2tBCYcjZ0pnc-eiK-e9Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka

On Fri, 19 Nov 2021 at 14:31, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 17 Nov 2021 15:08:58 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Adds a format that is 3 10bit YUV 4:2:0 samples packed into
> > a 32bit work (with 2 spare bits).
> >
> > Supported on Broadcom BCM2711 chips.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/drm_fourcc.c  |  3 +++
> >  include/uapi/drm/drm_fourcc.h | 11 +++++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 25837b1d6639..07741b678798 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -269,6 +269,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >                 .num_planes = 3, .char_per_block = { 2, 2, 2 },
> >                 .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> >                 .vsub = 0, .is_yuv = true },
> > +             { .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
> > +               .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> > +               .hsub = 2, .vsub = 2, .is_yuv = true},
> >       };
> >
> >       unsigned int i;
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 7f652c96845b..2e6d2ecae45f 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -330,6 +330,13 @@ extern "C" {
> >   */
> >  #define DRM_FORMAT_Q401              fourcc_code('Q', '4', '0', '1')
> >
> > +/*
> > + * 2 plane YCbCr MSB aligned, 3 pixels packed into 4 bytes.
>
> Hi,
>
> what does "MSB aligned" mean? How widely used term is that?

DRM_FORMAT_P210, DRM_FORMAT_P010, DRM_FORMAT_P012, and DRM_FORMAT_P016
all use it in drm_fourcc.h
https://github.com/torvalds/linux/blob/master/include/uapi/drm/drm_fourcc.h#L290

> > + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
>
> Because if I had to say, this looks like LSB aligned?
>
> > + * index 1 = Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 [2:10:10:10:2:10:10:10] little endian
>
> And this is not really either, I guess.

Yup, looks like I was a bit too keen on copy/paste from the Intel formats :-(

/* 2 plane YCbCr420.
 * 3 10 bit components and 2 padding bits packed into 4 bytes.
 * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
 * index 1 = Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0
[2:10:10:10:2:10:10:10] little endian
 */

  Dave

> Thanks,
> pq
>
> > + */
> > +#define DRM_FORMAT_P030              fourcc_code('P', '0', '3', '0') /* 2x2 subsampled Cr:Cb plane 10 bits per channel packed */
> > +
> >  /*
> >   * 3 plane YCbCr
> >   * index 0: Y plane, [7:0] Y
> > @@ -854,6 +861,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >   * and UV.  Some SAND-using hardware stores UV in a separate tiled
> >   * image from Y to reduce the column height, which is not supported
> >   * with these modifiers.
> > + *
> > + * The DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT modifier is also
> > + * supported for DRM_FORMAT_P030 where the columns remain as 128 bytes
> > + * wide, but as this is a 10 bpp format that translates to 96 pixels.
> >   */
> >
> >  #define DRM_FORMAT_MOD_BROADCOM_SAND32_COL_HEIGHT(v) \
>
