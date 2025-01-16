Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B4CA13A98
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024C710E964;
	Thu, 16 Jan 2025 13:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J848hTDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B810E95F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:13:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso1061536e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737033134; x=1737637934; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h7ncLon1TjtOkO7Jtfuh3RQuT+tEFbDDlX3FlP1aHWo=;
 b=J848hTDVP33eDquSXZR4z4/7EwV9C4S0q/EJPEfoqQ1NR56WnH2tbnBQyK5hDKO4Hh
 JCx3K9FIzIDbc2XwZYP/5damv0LjB0XQNcRlikUDKkzcmWmIti7B56m0My8HEU/xUgqs
 vQr1YQvjYuSwKFsgcxvA9a15e/XFFcSQ4BSArBrYhkXu9NY6JsfT/tP3YWmv6eYBqlI7
 IWdjLkWZETpymj5AU7xUtwtJkYMaPoKBEQjZzGxc8uQJ6bFn5S3Vnl8d34O9yEYi/lnr
 5NTTueDEjcpbQtn2jDb+W77opPqdR703uGzIB9KA0Qvu7Yi6W0ycWaKGBpk+xIHxeKV2
 Hdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737033134; x=1737637934;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7ncLon1TjtOkO7Jtfuh3RQuT+tEFbDDlX3FlP1aHWo=;
 b=irMH1Rh3AARwOqZ/ZdJU49Sdoc9ITyV1AIB+J2Xo53dtmQJhmC6+1H6uLEuLVOCSXp
 nOr4pR5EH17XiQeZfBwhDk6EMsyWbQh4n1WKR+Lg0v4nBqIjHxGh1vgJMOt1lDTkYKzH
 TLr8+LaDkcI9XjkW6ftQIk5m36M9/pwqy3qj7mryD3Y61RbhZbW4nWOxw0CozZKD6ZiV
 cWMOE+1m2UWGKtsnTpWyPHtMzL5zd0D/06gHMffy2WxdTmCpAJ+8GE7kK7m9Pa9492kA
 2guh/Tquug8zh8zbJPlK1zQxml0nRH5sjzR2yVFOGfB5vUzwz2WRLyJJ5QtZry8JnAhd
 xmjw==
X-Gm-Message-State: AOJu0Yy8c9Q8BCAD0NqBeE2xNxgYXKjoAdghPSDtpZYJlj0faSmlbfF5
 bsN7GjTt51v9gzYSVYozOhcPFPKwoohbPLZgUzpz0Ywyu6hPF6rSg2864Hy07eo=
X-Gm-Gg: ASbGncuv5qrfA0p/p3hhz/ic/+p9JM8aEkak7ZR1f9BhKx0nKTbPvsV5kPkhT3wtiOr
 4Jg9e7kCpv5DefBIBIbuexbtvW/u53aC182tvfkrTfaLbVetaUBwY56NplSR0fXNNEJxOimQ01u
 ULwckORDdWgQ9Ha+OlBoxn8vSWj2Riqez4kK2lou/gGF6O8YQOgCiEuyb28JCZEWGZYYwwMWC5+
 XWP0vIL9CpHNPPtzkN7HJZVB51QPQ38Sa4Y4zTh+ABMhsoV5EDnDYWzocw6G7cm9oVc+mqPKxSX
 n/wR++uaol6juNq3AE8kJPN3RDgbPpOldT/m
X-Google-Smtp-Source: AGHT+IEpXMThqRec54vTBqA0y7vQZbmyuXWzxn2oKQjjbQlRhMvvxIERX9Cq1PEOWtqoz3n5WqcZDA==
X-Received: by 2002:a05:6512:3c98:b0:53e:389d:8ce4 with SMTP id
 2adb3069b0e04-54284577f93mr11880082e87.34.1737033133824; 
 Thu, 16 Jan 2025 05:12:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4994esm2313389e87.40.2025.01.16.05.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 05:12:12 -0800 (PST)
Date: Thu, 16 Jan 2025 15:12:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, 
 "Shankar, Uma" <uma.shankar@intel.com>, "Bhattacharjee,
 Susanta" <susanta.bhattacharjee@intel.com>
Subject: Re: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Message-ID: <6fiprampyjzkkyofaavdpe4dgeoomwahtwkh2dsclxegz4u472@irq2yelghle5>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-2-605cb0271162@intel.com>
 <i6j3zi5tlnyk2eonmpa5h5qitwgzs2nuzrvsasde3dci6a4ngl@qhbtsjbhq6xr>
 <IA0PR11MB73075A89DAA5BF7D783125EEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJprDgcyZTgz9QX0X51sC=F6ogXsMkDLfbSypH1kSm5hJzg@mail.gmail.com>
 <IA0PR11MB73072FF4CF32A40E670CD9CEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA0PR11MB73072FF4CF32A40E670CD9CEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Thu, Jan 16, 2025 at 12:33:30PM +0000, Murthy, Arun R wrote:
> > > > On Fri, Jan 10, 2025 at 01:15:30AM +0530, Arun R Murthy wrote:
> > > > > ImageEnhancemenT(IET) hardware interpolates the LUT value to
> > > > > generate the enhanced output image. LUT takes an input value,
> > > > > outputs a new value based on the data within the LUT. 1D LUT can
> > > > > remap individual input values to new output values based on the
> > > > > LUT sample. LUT can be interpolated by the hardware by multiple
> > > > > modes Ex: Direct Lookup LUT, Multiplicative LUT etc The list of
> > > > > supported mode by hardware along with the format(exponent
> > > > > mantissa) is exposed to user by the iet_lut_caps property. Maximum
> > > > > format being 8.24 i.e 8 exponent and 24 mantissa.
> > > > > For illustration a hardware supporting 1.9 format denotes this as
> > > > > 0x10001FF. In order to know the exponent do a bitwise AND with
> > > > > 0xF000000. The LUT value to be provided by user would be a 10bit
> > > > > value with 1 bit integer and 9 bit fractional value.
> > > > >
> > > > > Multiple formats can be supported, hence pointer is used over here.
> > > > > User can then provide the LUT with any one of the supported modes
> > > > > in any of the supported formats.
> > > > > The entries in the LUT can vary depending on the hardware
> > > > > capability with max being 255. This will also be exposed as
> > > > > iet_lut_caps so user can generate a LUT with the specified entries.
> > > > >
> > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > ---
> > > > >  include/uapi/drm/drm_mode.h | 50
> > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 50 insertions(+)
> > > > >
> > > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > > b/include/uapi/drm/drm_mode.h index
> > > > >
> > > >
> > 7a7039381142bb5dba269bdaec42c18be34e2d05..056c2efef1589848034afc00
> > > > 89f1
> > > > > 838c2547bcf8 100644
> > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > @@ -1367,6 +1367,17 @@ struct drm_mode_closefb {
> > > > >   */
> > > > >  #define DRM_MODE_HISTOGRAM_HSV_MAX_RGB                     (1 <<
> > > > 0)
> > > > >
> > > > > +/* LUT values are points on exponential graph with x axis and
> > > > > +y-axis
> > > > > +y=f(x) */
> > > >
> > > > Huh?
> > > >
> > > This f(x) can be the algorithm defined  by the user space algorithm to
> > > generate the lookup table. Generation of the LUT value is left to the user
> > space algorithm.
> > > When this LUT table is passed to the hardware its just signifies how
> > > hardware should use this table to get the LUT value. In this mode it's a direct
> > lookup table.
> > 
> > Your documentation should be describing what is expected from the userspace.
> > What is y, x and f(x)? How is it being used?
> > 
> Sure will add the above explanation in the patch documentation.
> 
> > >
> > > > > +#define DRM_MODE_IET_LOOKUP_LUT                            (1 <<
> > > > 0)
> > > >
> > > > Again, what is the reason for a shift? Can these values be OR'd?
> > > >
> > > Yes can be OR'd values as well.
> > > Let me know if this has to be changed?
> > > Just chose bitwise shift to denote the multiple modes.
> > 
> > What does it mean if drm_iet_1dlut_sample.iet_mode contains OR of two
> > values?
> > 
> iet_mode in struct drm_iet_caps can be OR of two such modes,
> which means that the hardware supports both of the modes.
> Drm_iet_1dlut_sample.iet_mode tells the hardware which iet 
> mode is used in generating the LUT value. Because hardware 
> will have to interpret the LUT value based on the mode.

Yes. That's why I asked about the drm_iet_1dlut_sample.iet_mode, not the
caps. It makes no sense to allow ORing several modes there. So the list
of modes should be a simple enum and caps should use BIT(val).

> 
> > >
> > > > > +/*
> > > > > + * LUT values, points on negative exponential graph with x-axis
> > > > > +and y-axis
> > > > > + * Y = y/x so upon multiplying x, y is obtained, hence
> > > > > +multiplicative. The
> > > >
> > > > Can't parse this sentence.
> > > >
> > > We need x and y points in the exponential graph.
> > > For retrieving the value Y on the graph the value passed by the user
> > > is in the format y/x In order to get the Y points on the graph the value has to
> > be multiplied by x.
> > > This is a floating point value when compared with an integer value
> > > with the direct lookup mode.
> > 
> > Again, what are x and y? Bin indices? Pixel counts? Number of CPUs in the
> > current generation?
> > 
> It depends on the mode for direct lookup both x and y are pixels and for
> multiplicative mode X co-ordinate is proportional to the pixel value and
> the Y co-ordinate is the multiplier factor, i.e X-axis in pixels and Y-axis 
> is OutPixel/InPixel

Please expand the description. An engineer, who has no Intel
documentation, should be able to understand your description.

> > > > > + * format of LUT can at max be 8.24(8integer 24 fractional)
> > > > > + represented by
> > > > > + * u32. Depending on the hardware capability and exponent
> > > > > + mantissa can be
> > > > > + * chosen.
> > > >
> > > > What does that mean? How is it choosen?
> > > >
> > > The max value that these kind of 1DLUT can be is 8.24
> > 
> > Why?
> > 
> 32bit is the container and within this if we choose 16.16 then it doesn’t
> make sense to boost the pixel by 2^16
> Hence set aside 8 bit for integer 2^8  thereby boosting the pixel by 255
> and that’s a huge boost factor.
> Remaining 24 bits out of the container 32 is fractional value. This is the
> optimal value for implementing in the hardware as well as per the
> hardware design.

Generic API means that there is no particular hardware design. However
the rest of the description makes sense. Please add it to the commit
message.

> 
> > > Hardware design can choose anything within this range. This depends on
> > > the accuracy required by hardware keeping in mind the hardware cost
> > > for implementation.
> > > Just a precision for 32bit value.
> > >
> > > > > + */
> > > > > +#define DRM_MODE_IET_MULTIPLICATIVE                        (1 << 1)
> > > > > +
> > > > >  /**
> > > > >   * struct drm_histogram_caps
> > > > >   *
> > > > > @@ -1414,6 +1425,45 @@ struct drm_histogram {
> > > > >     __u32 nr_elements;
> > > > >  };
> > > > >
> > > > > +/**
> > > > > + * struct drm_iet_caps
> > > > > + *
> > > > > + * @iet_mode: pixel factor enhancement modes defined in the above
> > > > > +macros
> > > > > + * @iet_sample_format: holds the address of an array of u32 LUT
> > > > > +sample
> > > > formats
> > > > > + *                depending on the hardware capability. Max being 8.24
> > > > > + *                Doing a bitwise AND will get the present sample.
> > > > > + *                Ex: for 1 integer 9 fraction AND with 0x10001FF
> > > >
> > > > ?? Can hardware support 16.16? 32.0?
> > > >
> > > No, for a 1D LUT maximum floating number can be 8.24
> > 
> > Why? Is it a limitation of the Intel hardware or just a random API choice?
> > 
> As explained above this an optimal value yielding to a huge boost factor of
> 255.99. This is as per the hardware design.
> 
> > > Hence hardware will have to adhere to anything within this range.
> > >
> > > > > + * @nr_iet_sample_formats: number of iet_sample_formsts supported
> > > > > + by
> > > > the
> > > > > + *                    hardware
> > > > > + * @nr_iet_lut_entries: number of LUT entries  */ struct
> > > > > +drm_iet_caps {
> > > > > +   __u8 iet_mode;
> > > > > +   u64 iet_sample_format;
> > > > > +   __u32 nr_iet_sample_formats;
> > > > > +   __u32 nr_iet_lut_entries;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct drm_iet_1dlut_sample
> > > >
> > > > Is it supposed to be used with DRM_MODE_IET_MULTIPLICATIVE only? Or
> > > > is it supposed to be used with DRM_MODE_IET_LOOKUP_LUT? In the
> > > > latter case what should be the iet_format value?
> > > >
> > > The struct iet_1dlut_sample will be used for all the IET modes i.e
> > > direct lookup and multiplicative.
> > > The element iet_sample_format will not be applicable for direct
> > > lookup. This will be used for multiplicative and the value what it can
> > > hold for multiplicative is mentioned in the above description.
> > > I missed adding this info in the description, will add it in the next version.
> > 
> > And some other formats will also require additional data. This multi-format
> > structure sounds bad from my POV.
> > 
> Will try generalize this structure across the modes.
> Its only for direct lookup mode we will not need any iet_sample_format.
> For other modes such as multiplicative, additive etc we will need to mention
> the iet_sample_format.

There might be other modes which require more data.

> Top view of this LUT is just a lookup table which says for a particular pixel
> value in the LUT table, what is the output value and this output value
> is the pixel value that is replaced in the incoming image.
> Now generation of this LUT can be done different methods referred to as
> modes over here.
> So one variable to mention the type of mode and other to specify the
> internal details of the selected mode.
> Will reframe accordingly.
> 
> Thanks and Regards,
> Arun R Murthy
> --------------------

-- 
With best wishes
Dmitry
