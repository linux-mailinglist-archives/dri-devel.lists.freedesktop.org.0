Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98278A13B04
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5710E972;
	Thu, 16 Jan 2025 13:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jnpf4Ba+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5729310E974
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:40:07 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so886889e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737034746; x=1737639546; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VteJJx4VGuw0ltu0wQifkv086gnyuIyWiED0Wc5BNNg=;
 b=jnpf4Ba+5eX5A5RuRNZiaqS1x8HilTvDpMWOQtY1Ad1dl7NMowhe8PeXZY39D+fyXY
 c31+et1edFMXQJyk8WpDo25FFlzAw15WPfi4mK2xRq57Jw1ah58dcWy0JONM7+UVLQEK
 J6ANHleHVRzuP9rROebmUoaGLU69wwSP+qgQqbyoNF/y50Pf4q1GuXNQ3+Qr/1QnxGH/
 jA3noHo1BMaDcVUqqtqCbSojqaEuhuaEb+tASvFfNebV6BMiaIdMnuR21RJPaiXOJRML
 cHDQPi6LTOaPjf39sqThS3QgkBewv3fQZVKYxc/Ng+Mpfp+XjDt71KxANpeKdO08Voig
 IxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737034746; x=1737639546;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VteJJx4VGuw0ltu0wQifkv086gnyuIyWiED0Wc5BNNg=;
 b=jdw2hNqY9VBdzkLHKKPNeDCfGBfiHVeXklXVVAEqsyW7Ssva8NFW8Is/KYILDqKz16
 p6F9ZqTP+14yX19YKNv1N9ppy0kM/1I2cF/z1rYW9jCqhVg9t//JM7UtOt62WIARKVTJ
 A7TZ8rjRxtZXhoKnIRY7EyD1aUVtodkvvNQ7LX5jFfFInRAXo+WqFBxeDOx19zOAqXG7
 8Kl8SNAEXi9J4l4KmKABvr45kA15zqotV7fMt8XVfNBBVfeBiJLWM1slHiVukMYPLaa0
 LKk1VP078udOav+o+9YdJNfWGCw18LIdca5XyG8L/Fjysi1TY/Yg1AgQBy7eWJAybYDa
 1UXA==
X-Gm-Message-State: AOJu0Yy4Ca+hoDGHsl/GGJLm6r+XuP1T+LNtvaIBB0LOHHkOm0iaGUxY
 B0lQV9QzcjdZZiZ4+Z5IZU3np1Lx6P9qAFuLAmo7tsgZ0hdoqA5GkBwC1smzkTI=
X-Gm-Gg: ASbGncuXpeIJqWz7gEvZE5ag3G+A2qApmRSBBFFOqA0McyP4fztKWau0DPaC9Vdixx9
 R/nqH1fZHSQCl6KzTL2Zch4MI20W/CpDl3TWksGIb6pj38NyL6smOw5aiXaGaxOze/CGb60mpG5
 IKys9/K+xuKbGkkUNilegoOnqhT+gBrtxbr/hoIictrqAmNMfGgehpNE2d5vPGrtGsNEFIB4dpn
 t7QKYKUv5x12ay+oJff8N/xX9EEaoda8/6sv25kkMhI4WaXBieS+llWawnWUm7LXsZ2EG7G1NGe
 GNbpV7D0Nf9wO3lf2hZIW7bo8WeVA4jJJ68R
X-Google-Smtp-Source: AGHT+IE659wAmLhaDjEjv7Xvwm2qobkOfxpsGV1Lxrtg5uzKjfkE1pEHqIzIwLc5DjjVw/NbHrzKVA==
X-Received: by 2002:a05:6512:3daa:b0:542:297f:4f69 with SMTP id
 2adb3069b0e04-5428480191emr11187577e87.41.1737034745616; 
 Thu, 16 Jan 2025 05:39:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6862sm2374798e87.147.2025.01.16.05.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 05:39:04 -0800 (PST)
Date: Thu, 16 Jan 2025 15:39:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, 
 "Shankar, Uma" <uma.shankar@intel.com>, "Bhattacharjee,
 Susanta" <susanta.bhattacharjee@intel.com>
Subject: Re: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Message-ID: <sc52glzpdohjxjexpwayyud4mlbtygx5l4wuziw5oibqv674sf@6x2iohnm32e6>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
 <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
 <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <yyn35zkvqfajyyata2kuwfswfzjf3oqv4hzq5pc5rw7o2sporu@vsybecmh54ow>
 <IA0PR11MB73076D2B950535216961E209BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB73076D2B950535216961E209BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Thu, Jan 16, 2025 at 01:33:43PM +0000, Murthy, Arun R wrote:
> > On Thu, Jan 16, 2025 at 12:33:20PM +0000, Murthy, Arun R wrote:
> > > > > > On Fri, Jan 10, 2025 at 01:15:29AM +0530, Arun R Murthy wrote:
> > > > > > > Display Histogram is an array of bins and can be generated in
> > > > > > > many ways referred to as modes.
> > > > > > > Ex: HSV max(RGB), Wighted RGB etc.
> > > > > > >
> > > > > > > Understanding the histogram data format(Ex: HSV max(RGB))
> > > > > > > Histogram is just the pixel count.
> > > > > > > For a maximum resolution of 10k (10240 x 4320 = 44236800)
> > > > > > > 25 bits should be sufficient to represent this along with a
> > > > > > > buffer of
> > > > > > > 7 bits(future use) u32 is being considered.
> > > > > > > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most
> > > > > > > significant 5 bits, hence 32 bins.
> > > > > > > Below mentioned algorithm illustrates the histogram generation
> > > > > > > in hardware.
> > > > > > >
> > > > > > > hist[32] = {0};
> > > > > > > for (i = 0; i < resolution; i++) {
> > > > > > >     bin = max(RGB[i]);
> > > > > > >     bin = bin >> 3; /* consider the most significant bits */
> > > > > > >     hist[bin]++;
> > > > > > > }
> > > > > > > If the entire image is Red color then max(255,0,0) is 255 so
> > > > > > > the pixel count of each pixels will be placed in the last bin.
> > > > > > > Hence except hist[31] all other bins will have a value zero.
> > > > > > > Generated histogram in this case would be hist[32] =
> > > > > > > {0,0,....44236800}
> > > > > > >
> > > > > > > Description of the structures, properties defined are
> > > > > > > documented in the header file include/uapi/drm/drm_mode.h
> > > > > > >
> > > > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > > > ---
> > > > > > >  include/uapi/drm/drm_mode.h | 59
> > > > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > >  1 file changed, 59 insertions(+)
> > > > > > >
> > > > > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > > > > b/include/uapi/drm/drm_mode.h index
> > > > > > >
> > > > > >
> > > >
> > c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bda
> > > > > > ec42
> > > > > > > c18be34e2d05 100644
> > > > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > > > @@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
> > > > > > >     __u32 pad;
> > > > > > >  };
> > > > > > >
> > > > > > > +/*
> > > > > > > + * Maximum resolution at present 10k, 10240x4320 = 44236800
> > > > > > > + * can be denoted in 25bits. With an additional 7 bits in
> > > > > > > +buffer each bin
> > > > > > > + * can be a u32 value.
> > > > > > > + * Maximum value of max(RGB) is 255, so max 255 bins.
> > > > > >
> > > > > > HDR planes have higher max value for a component.
> > > > > > Likewise even in an RGB24 case there are 256 possible values.
> > > > > > It's not clear why
> > > > > > 0 gets excluded.
> > > > > >
> > > > > This applies to only SDR and excludes HDR.
> > > >
> > > > Why?
> > > >
> > > We are limiting to only SDR. HDR includes a broad range of color and
> > > finer details, which essentially means its an enhanced image.
> > > We are trying to enhance the image quality of SDR with the support of
> > histogram.
> > 
> > You are defining generic API. It might be broader than your existing usecase.
> > Please consider supporting HDR too.
> > 
> HDR image enhancement is very much complex including multiple stages such as image tone mapping and image denoising.
> Here for SDR planes, image enhancement is done by playing around the contrast and color.
> Maybe at this stage we can focus on SDR and can take this HDR at the next stage.

If you define max(colour) to be 255, then you can not expand it later.
The API will have 8 bits for colour information everywhere.

> 
> Thanks and Regards,
> Arun R Murthy
> -------------------- 

-- 
With best wishes
Dmitry
