Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E330A1340E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7551110E8CE;
	Thu, 16 Jan 2025 07:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r19vIFAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637E510E8CD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:28:02 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so1143352276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012421; x=1737617221; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=23JnYRpCbBV23N39s16FccVsN4HNHdf+HO6VU1JPv7k=;
 b=r19vIFACsWMxmAGcg4mug0V+v6ZAiwgBjtUr6a+I/2wiIhWnHTkssherkT1x02X2Dl
 6DzCtyv/m2r2Dr6EPaNa6rXMRCl4i9POJFa/ATITL/eRbAuEz/osJY+OPELuhOQP74AR
 HBEdU9r4r9t2HBV/RrmxKcP27NY9lNI38K9MSD2DDI7G1AFLuFF0TdG8XN2e32ukPQSD
 G3cZrhBUua0LZVnnCsrrJ4PpGDTMrNWaWmovvS6CsarS+m/bquLGCzqq4MvD9wQifEKY
 bj8GpcSTaTDjxwMB0m+oPQl0KaOHo+hLcdeUjSvRh9ZggJiJPD1u+GbScZ8k+KQiWx3w
 ihpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012421; x=1737617221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23JnYRpCbBV23N39s16FccVsN4HNHdf+HO6VU1JPv7k=;
 b=S7LgMcaHRc08cRUxYm9xdHFp8+UGLflxvcLihHTiIfhWRfB4hakZgGhzfyV7pd4NPr
 kVlWsKah9NhlC6FwwWCMrJer8hj+FzDjQgw1zBUBhVDwYP/kSS1M9HJzbkDbkZtjDhFI
 Asj99Z43zZ/oM58ROAXbl3u46b+9AwjCK7uHmHDnhBi8xjLqRbICWPB2+Ecbr4U8gEcG
 sQxILDfUMub/+dTjec7o/NFImm/rNkSaqYIjFifkFW44xkmAgFq6x0QGetglQZKgixND
 bvz1LAuV8HjMtR/vJ726cnzOFrHpweBRWhhE9QLhtnQV5yWub0QpBG1n6Xg1BKGS/gnv
 dqTg==
X-Gm-Message-State: AOJu0YzRme12xeDD91ZHLPU1Pq5mQ9YvRZiSkfW5hrHJk1xx5VxW9d2s
 DlBQHBQMFHt1FpW/gob698WyCsqQIUT0Z9+urKMWhTobnR8am2Jcnkdda7aPnSh9cr5gp2h7WW6
 ahsKAbIQsMm/GX37IvWR9v32zLE3DBiJs3zsSew==
X-Gm-Gg: ASbGncv7ZDu0nfq/prk8lEA4K8AVc9p5HKyXvm+y3QDikQg6ImDvCUX325RI2piK4LR
 sPwhfyC8vgk1MR8s2BwRxyLBchzQ4rsTTKdmyvSbJSKZaG7+qIw66
X-Google-Smtp-Source: AGHT+IHQ+qxV5BbgMIThXfCCGgqDGgcL7sB4lY/0l3wgCGZ7dg/DHlTQAZzzrZBqXeHZR237kIVVD3QaCUX5/f9Yw+g=
X-Received: by 2002:a05:690c:9687:b0:6f6:ccf8:614a with SMTP id
 00721157ae682-6f6ccf86218mr46318587b3.17.1737012421588; Wed, 15 Jan 2025
 23:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-2-605cb0271162@intel.com>
 <i6j3zi5tlnyk2eonmpa5h5qitwgzs2nuzrvsasde3dci6a4ngl@qhbtsjbhq6xr>
 <IA0PR11MB73075A89DAA5BF7D783125EEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73075A89DAA5BF7D783125EEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Jan 2025 09:26:50 +0200
X-Gm-Features: AbW1kvbKvQiACvA6KZB6HujLWaObXj3LewwLzU1hf6Lqx_12bXcUlXssKsNLIWE
Message-ID: <CAA8EJprDgcyZTgz9QX0X51sC=F6ogXsMkDLfbSypH1kSm5hJzg@mail.gmail.com>
Subject: Re: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, 
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
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

On Thu, 16 Jan 2025 at 09:08, Murthy, Arun R <arun.r.murthy@intel.com> wrote:
>
> > On Fri, Jan 10, 2025 at 01:15:30AM +0530, Arun R Murthy wrote:
> > > ImageEnhancemenT(IET) hardware interpolates the LUT value to generate
> > > the enhanced output image. LUT takes an input value, outputs a new
> > > value based on the data within the LUT. 1D LUT can remap individual
> > > input values to new output values based on the LUT sample. LUT can be
> > > interpolated by the hardware by multiple modes Ex: Direct Lookup LUT,
> > > Multiplicative LUT etc The list of supported mode by hardware along
> > > with the format(exponent
> > > mantissa) is exposed to user by the iet_lut_caps property. Maximum
> > > format being 8.24 i.e 8 exponent and 24 mantissa.
> > > For illustration a hardware supporting 1.9 format denotes this as
> > > 0x10001FF. In order to know the exponent do a bitwise AND with
> > > 0xF000000. The LUT value to be provided by user would be a 10bit value
> > > with 1 bit integer and 9 bit fractional value.
> > >
> > > Multiple formats can be supported, hence pointer is used over here.
> > > User can then provide the LUT with any one of the supported modes in
> > > any of the supported formats.
> > > The entries in the LUT can vary depending on the hardware capability
> > > with max being 255. This will also be exposed as iet_lut_caps so user
> > > can generate a LUT with the specified entries.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >  include/uapi/drm/drm_mode.h | 50
> > > +++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > index
> > >
> > 7a7039381142bb5dba269bdaec42c18be34e2d05..056c2efef1589848034afc00
> > 89f1
> > > 838c2547bcf8 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -1367,6 +1367,17 @@ struct drm_mode_closefb {
> > >   */
> > >  #define DRM_MODE_HISTOGRAM_HSV_MAX_RGB                     (1 <<
> > 0)
> > >
> > > +/* LUT values are points on exponential graph with x axis and y-axis
> > > +y=f(x) */
> >
> > Huh?
> >
> This f(x) can be the algorithm defined  by the user space algorithm to generate the lookup
> table. Generation of the LUT value is left to the user space algorithm.
> When this LUT table is passed to the hardware its just signifies how hardware should
> use this table to get the LUT value. In this mode it's a direct lookup table.

Your documentation should be describing what is expected from the
userspace. What is y, x and f(x)? How is it being used?

>
> > > +#define DRM_MODE_IET_LOOKUP_LUT                            (1 <<
> > 0)
> >
> > Again, what is the reason for a shift? Can these values be OR'd?
> >
> Yes can be OR'd values as well.
> Let me know if this has to be changed?
> Just chose bitwise shift to denote the multiple modes.

What does it mean if drm_iet_1dlut_sample.iet_mode contains OR of two values?

>
> > > +/*
> > > + * LUT values, points on negative exponential graph with x-axis and
> > > +y-axis
> > > + * Y = y/x so upon multiplying x, y is obtained, hence
> > > +multiplicative. The
> >
> > Can't parse this sentence.
> >
> We need x and y points in the exponential graph.
> For retrieving the value Y on the graph the value passed by the user is in the format y/x
> In order to get the Y points on the graph the value has to be multiplied by x.
> This is a floating point value when compared with an integer value with the direct
> lookup mode.

Again, what are x and y? Bin indices? Pixel counts? Number of CPUs in
the current generation?

>
>
> > > + * format of LUT can at max be 8.24(8integer 24 fractional)
> > > + represented by
> > > + * u32. Depending on the hardware capability and exponent mantissa
> > > + can be
> > > + * chosen.
> >
> > What does that mean? How is it choosen?
> >
> The max value that these kind of 1DLUT can be is 8.24

Why?

> Hardware design can choose anything within this range. This depends
> on the accuracy required by hardware keeping in mind the hardware cost for
> implementation.
> Just a precision for 32bit value.
>
> > > + */
> > > +#define DRM_MODE_IET_MULTIPLICATIVE                        (1 << 1)
> > > +
> > >  /**
> > >   * struct drm_histogram_caps
> > >   *
> > > @@ -1414,6 +1425,45 @@ struct drm_histogram {
> > >     __u32 nr_elements;
> > >  };
> > >
> > > +/**
> > > + * struct drm_iet_caps
> > > + *
> > > + * @iet_mode: pixel factor enhancement modes defined in the above
> > > +macros
> > > + * @iet_sample_format: holds the address of an array of u32 LUT sample
> > formats
> > > + *                depending on the hardware capability. Max being 8.24
> > > + *                Doing a bitwise AND will get the present sample.
> > > + *                Ex: for 1 integer 9 fraction AND with 0x10001FF
> >
> > ?? Can hardware support 16.16? 32.0?
> >
> No, for a 1D LUT maximum floating number can be 8.24

Why? Is it a limitation of the Intel hardware or just a random API choice?

> Hence hardware will have to adhere to anything within this range.
>
> > > + * @nr_iet_sample_formats: number of iet_sample_formsts supported by
> > the
> > > + *                    hardware
> > > + * @nr_iet_lut_entries: number of LUT entries  */ struct drm_iet_caps
> > > +{
> > > +   __u8 iet_mode;
> > > +   u64 iet_sample_format;
> > > +   __u32 nr_iet_sample_formats;
> > > +   __u32 nr_iet_lut_entries;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_iet_1dlut_sample
> >
> > Is it supposed to be used with DRM_MODE_IET_MULTIPLICATIVE only? Or is it
> > supposed to be used with DRM_MODE_IET_LOOKUP_LUT? In the latter case
> > what should be the iet_format value?
> >
> The struct iet_1dlut_sample will be used for all the IET modes i.e direct lookup and
> multiplicative.
> The element iet_sample_format will not be applicable for direct lookup. This will be
> used for multiplicative and the value what it can hold for multiplicative is mentioned
> in the above description.
> I missed adding this info in the description, will add it in the next version.

And some other formats will also require additional data. This
multi-format structure sounds bad from my POV.

>
> > > + * @iet_mode: image enhancement mode, this will also convey the channel.
> > > + * @iet_format: LUT exponent and mantissa format, max being 8.24
> > > + * @data_ptr: pointer to the array of values which is of type u32.
> > > + *       1 channel: 10 bit corrected value and remaining bits are reserved.
> > > + *       multi channel: pointer to struct drm_color_lut
> > > + * @nr_elements: number of entries pointed by the data @data_ptr
> > > + * @reserved: reserved for future use
> > > + * @reserved1: reserved for future use  */ struct
> > > +drm_iet_1dlut_sample {
> > > +   __u8 iet_mode;
> > > +   __u32 iet_format;
> > > +   __u64 data_ptr;
> > > +   __u32 nr_elements;
> > > +   __u32 reserved;
> > > +   __u32 reserved1;
> > > +};
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
> > >
> > > --
> > > 2.25.1
> > >
> >
> Thanks and Regards,
> Arun R Murthy
> --------------------



-- 
With best wishes
Dmitry
