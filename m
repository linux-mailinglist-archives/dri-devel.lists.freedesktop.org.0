Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5711A3E094
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F87610E9A9;
	Thu, 20 Feb 2025 16:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="msj2t9TK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C67910E9A9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:26:38 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30613802a6bso11322891fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740068797; x=1740673597; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r0ekJqJA3WyrdbcdjyAbVi1c2QG0kpkHpUl6hNIQRhE=;
 b=msj2t9TKGHp55MLWq6z4/HUR3RF/5lIe+1vaatjRnBSSCwmRYnOCQ2t9JxGFJcZsog
 upc1sI06cXcmSa1zAeO8uLQwmWeUlzz/tWgpKtrUxSOVHDiHJ7TG9EyXuFxpVQj6aVev
 pzlmxj4gubNEXUAplmEKg7QE/lIdQdfg9V/hijwVAXRWgXGwMwYXQiQowREdQUTrxCCk
 Qmhdkwa9ClCP6VzxUfsH2r8AFTSMMmDQHRQBNcDVC7xQvAwpGRUE04QSV312TanNBUCo
 kumjxLOGWshjlWhvnza+OAys7pUij/ZRdPI2j9Z9OhheFqQ6J1KR3y/Muwd6q28ijA7S
 SlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068797; x=1740673597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0ekJqJA3WyrdbcdjyAbVi1c2QG0kpkHpUl6hNIQRhE=;
 b=V1cWHgP/hLiexC9E7GyfN/d7+NFCUk6Or2AA/uaLTQXgTB69ajLt91upRkmnbtXZFp
 SyuIOTkJKd2Uob9PoGYva2z81o+ArWwIgBf1XSX1fwga5KtwXb3dcptqWUiTwzfzQigc
 HW+ynU9Q+kNoBkOnRt06mckmVW5ynykX7wTA8UfUxr1soU6mudLRRtYONqYKCeYKD/9m
 y6YRiaRgDHhfoZ0N/n2+dCTGEc4yjv2rQ++pO6jzbDcotNA8hMy/8Qa5wClFi58bQuvX
 ZMDIo6FhaZAWWxyTuYocw4MhM7FGgahM7pFOenfiCx3SmXKvuOxAupixxaJDqYVVxWSU
 UuXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzAbEo3oJgTuzUSb95YUlPwSCWFExLPN3QLBEYaMUI36vD8En37+iObpPx295E2WiDwDdhCyvN2i8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBry52FVaLX6ERYihxicgYRPK0FlNYapex/+2MYPfQO9Q6btbs
 U1FjyA9H5cTyU5dmAPJQfq6ad1LE3SQcL2VGJXmQKgXpS3aOwW3Y3PtG132bIoc=
X-Gm-Gg: ASbGnctcg7O+qJeSm1LUoG1mfOIFu+uLhM+PDdcMwghA/yvMw2TdWrORMKE34/xoTaL
 51E+tenAGa+rmLd9f8QduRNXRcf3LBO6Jq9ILZq+uZpxJu0RUA5dqUoKuE0GFyS8yurn1BMn7ma
 fhQMkIFN6WB6kpkDFl0i+PxjuBr02ix6F635wMxxr826jgU4/snX7IBElAkctGsNp+Fp3X5Mdak
 xjKFsqUD7Vlp/X4uIk2eMWyITPj8y4cXSWqQGU7oadPes7Gqk6bvF0zL4F60eTPrq75gd8gFp3B
 FWgcPX99xLJ+6cmnT3IrGEeSLBU0qrTpE4I5XC1B8bhSwj/DFcmnM42M66b5/SR1kZcx/Mo=
X-Google-Smtp-Source: AGHT+IEZPpWVQi0eT5y6UlvuFCXTH0aGhtf6NhUVFZphnSLktH3vyghmNSnR1lPc0JLKvye6i7h3yQ==
X-Received: by 2002:a2e:be84:0:b0:304:9dd4:fea7 with SMTP id
 38308e7fff4ca-30927a47496mr77592811fa.16.1740068796635; 
 Thu, 20 Feb 2025 08:26:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a25c88f33sm16727951fa.2.2025.02.20.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:26:36 -0800 (PST)
Date: Thu, 20 Feb 2025 18:26:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, suraj.kandpal@intel.com
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Message-ID: <r62gomdqvh3sotz4v5zxrewkfcd6iqnzxcvwbe5e6rmtwcz5r3@z23mgdullqxz>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
 <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
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

On Tue, Feb 18, 2025 at 11:13:39AM +0530, Murthy, Arun R wrote:
> On 17-02-2025 15:38, Pekka Paalanen wrote:
> > Hi Arun,
> > 
> > this whole series seems to be missing all the UAPI docs for the DRM
> > ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
> > replacement for them, I would assume both are a requirement.
> > 
> > Without the ReST docs it is really difficult to see how this new UAPI
> > should be used.
> Hi Pekka,
> I also realized later on this. Will add this in my next patchset.
> > 
> > On Tue, 28 Jan 2025 21:21:07 +0530
> > Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > 
> > > Display Histogram is an array of bins and can be generated in many ways
> > > referred to as modes.
> > > Ex: HSV max(RGB), Wighted RGB etc.
> > > 
> > > Understanding the histogram data format(Ex: HSV max(RGB))
> > > Histogram is just the pixel count.
> > > For a maximum resolution of 10k (10240 x 4320 = 44236800)
> > > 25 bits should be sufficient to represent this along with a buffer of 7
> > > bits(future use) u32 is being considered.
> > > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
> > > bits, hence 32 bins.
> > > Below mentioned algorithm illustrates the histogram generation in
> > > hardware.
> > > 
> > > hist[32] = {0};
> > > for (i = 0; i < resolution; i++) {
> > > 	bin = max(RGB[i]);
> > > 	bin = bin >> 3;	/* consider the most significant bits */
> > > 	hist[bin]++;
> > > }
> > > If the entire image is Red color then max(255,0,0) is 255 so the pixel
> > > count of each pixels will be placed in the last bin. Hence except
> > > hist[31] all other bins will have a value zero.
> > > Generated histogram in this case would be hist[32] = {0,0,....44236800}
> > > 
> > > Description of the structures, properties defined are documented in the
> > > header file include/uapi/drm/drm_mode.h
> > > 
> > > v8: Added doc for HDR planes, removed reserved variables (Dmitry)
> > > 
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > ---
> > >   include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 65 insertions(+)
> > > 
> > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
> > >   	__u32 pad;
> > >   };
> > > +/**
> > > + * enum drm_mode_histogram
> > > + *
> > > + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
> > > + * Maximum resolution at present 10k, 10240x4320 = 44236800
> > > + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
> > > + * can be a u32 value.
> > > + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
> > I assume s/SDL/SDR/.
> Yes, sorry TYPO
> > 
> > This assumption seems false. SDR can be also 10-bit and probably even
> > more.
> Yes but in practice majority of them being 8-bit. So have considered 8-bit
> for illustration purpose only.
> The design itself should accommodate 10-bit as well.
> > > + * If the most significant 5 bits are considered, then bins = 2^5
> > > + * will be 32 bins.
> > > + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
> > Does this mean that the histogram is computed on the pixel values
> > emitted to the cable? What if the cable format is YUV?
> Yes, again the illustration over here is max(RGB) used for histogram
> generation.
> If YUV is used or weighted RGB is used for histogram generation then the
> mode will have to change and accordingly the data for that mode.
> > > + * For illustration consider a full RED image of 10k resolution considering all
> > > + * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
> > > + * plane similarly with HDR the same would look like hist[65535] =
> > > + * {0,0,0,....44236800}
> > This SDR vs. HDR is a false dichotomy. I presume the meaningful
> > difference is bits-per-channel, not the dynamic range.
> > 
> > It would be good to have the pseudocode snippet here instead of the
> > commit message. The commit message should not contain any UAPI notes
> > that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
> > message is probably not very useful, as the more interesting questions
> > are why this exists and what it can be used for.
> I have the pseudocode in the cover letter of this patchset.
> > > + */
> > > +enum drm_mode_histogram {
> > > +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,
> > What does the HSV stand for?
> > 
> > When talking about pixel values, my first impression is
> > hue-saturation-value. But there are no hue-saturation-value
> > computations at all?
> The computation will have to be done by the user in the library.
> > > +};
> > > +
> > > +/**
> > > + * struct drm_histogram_caps
> > > + *
> > > + * @histogram_mode: histogram generation modes, defined in the
> > > + *		    enum drm_mode_histogram
> > > + * @bins_count: number of bins for a chosen histogram mode. For illustration
> > > + *		refer the above defined histogram mode.
> > > + */
> > > +struct drm_histogram_caps {
> > > +	__u32 histogram_mode;
> > > +	__u32 bins_count;
> > > +};
> > Patch 3 says:
> > 
> > + * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
> > + * Description of the structure is in include/uapi/drm/drm_mode.h
> > 
> > This is a read-only property, right?
> > 
> > The blob contains one struct drm_histogram_caps. What if more than one
> > mode is supported?
> Multiple modes can be ORed. User will have to choose one of them depending
> on the algorithm that he is developing/using.

No. Modes can not be ORed. The structure can be applicable to a single
mode (e.g. user settings) or to a multiple modes (e.g. caps).

So when the struct describes a single mode, it should be just that
mode, enumerated linearly, starting from 0.  When you have a struct
which can actually be related to several modes, it should have a value
of BIT(DRM_MODE_HISTOGRAM_foo) | BIT(DRM_MODE_HISTOGRAM_bar).


-- 
With best wishes
Dmitry
