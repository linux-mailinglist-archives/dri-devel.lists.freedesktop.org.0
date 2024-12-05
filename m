Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867F29E616B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 00:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E553210EFDA;
	Thu,  5 Dec 2024 23:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YEv4rAz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3213710EFD8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 23:39:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53ded167ae3so1483516e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 15:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733441939; x=1734046739; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x+KtdEWwaYEAS7NVE+2dcFcFQ+Dv6x3idu/TQviwsT0=;
 b=YEv4rAz6wt4vdwyk0a7fQA+7BDP/s9KNI8xPz0w3lqMxd4iZ8oTKPClU2ABTXRZrod
 3SBGcVFLM/87y8Goqee48TvZQPXuzm1lAuTxfl3/+wmXTCMKGWbamlCnmYAlNB2CPxSq
 XfB0JTxEQcO6o/wvrAWG2boPfQGrXbcB7FQ+vvpPn9kp5ew0GcPRmaQjY/EYRbWojXpY
 pbCOHHNNU1vpbNSMIsau9LXQ8tP92p/MzsSxPrwtZbV+GYxxV8FcOKwttVzELRuAPuca
 eOlCSZRPy7qmfJGz7kpVp6M/oMx4ntlD5OKNC7SP+/3om9YctfU4TpNpLmZ4RpTBklL1
 B/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733441939; x=1734046739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+KtdEWwaYEAS7NVE+2dcFcFQ+Dv6x3idu/TQviwsT0=;
 b=aJTw+j0xYD0Pa2oQB+MVwB30Zjv2BobR4I51CUeji9ghqZ8QS1lDiuV0tI+Du4PC4o
 bB2GzQyCDd/z/Db5cWS3immS3AN/4dZ1OmkA1QNzwCK8HfokW3/N82NoMbBikY7Vihnp
 DDFNpN0yuGYE3TBOBEtRg493sCBlo6TLqnzjH9jNUXWs7NWLQbj8SOxzwsNp1fYtAdkF
 38+UFfrFZwA2xLdlBtUliA7PkmHSayRQdq5mVCr9ZxcEKgjl1jMjAFrhynt+wy33Z3mq
 A82SaK8yu4r+smXilB3Ma7fyOupwpiJ8nEOncZPP/BVydFKmA4A4tH0RJN83afzuAr4f
 V/OA==
X-Gm-Message-State: AOJu0YyloTl5KK355iq1SMZOGrV5DyRFaUAcSaJcoj2U4VmKdZkwbOLs
 WoMmF2KnfjqY3wAMBKyblufY4kuKyElWLAMmyWSMzmRFgJo8BgPFTfRW9t7MMsw=
X-Gm-Gg: ASbGnctJw+eovzChq9rDAw3rosUmE4ITwxu53q6VKYDtq/yJmJdedutaXp6YTDoefjf
 JZPphVd4jnltDg0pEI8RGDyQWnUWcf1s7wD1z9NJaIJMylkokJMlfK38txDI7taKK5/fStG6pNv
 3cXqU0a373rHctxepO9KFAMBtP3KRxL3jyr/UnHclPvRhLdKOpz26P32yMas2gAPspDv4hwDa+R
 9PyqlOj9V0LmJOgQezU0ypqkSTUxcJYcYLdj7GnU6wisyrZj8rcQTGUxZah/btPFYhnzWsdCnci
 /TNyznK97OikEbKkZEE+4l/RloyyDQ==
X-Google-Smtp-Source: AGHT+IGbdj0xt+8IkG99P5QkTi0gDWu+e9J0IZeREKHJi5fxrVX5HzFOPSts0eJkMFINTmaJC/Dc/w==
X-Received: by 2002:a05:6512:2210:b0:53b:1526:3a63 with SMTP id
 2adb3069b0e04-53e2c2f01b6mr212357e87.56.1733441939285; 
 Thu, 05 Dec 2024 15:38:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229473d2sm358466e87.14.2024.12.05.15.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 15:38:57 -0800 (PST)
Date: Fri, 6 Dec 2024 01:38:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pekka.paalanen@haloniitty.fi" <pekka.paalanen@haloniitty.fi>, 
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, 
 "mwen@igalia.com" <mwen@igalia.com>,
 "contact@emersion.fr" <contact@emersion.fr>, 
 "Kumar, Naveen1" <naveen1.kumar@intel.com>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Subject: Re: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
Message-ID: <kb4oqfcbqhiowvkmqaxtvq6wdxixas3ltjk2dfqp4giq3irurr@xvgd6lwf7rzs>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-10-uma.shankar@intel.com>
 <bhjkznwq2776cpjun56fqi6qgfu7ezojxs6mv4itb3njws3aeu@ixhixfv6uknj>
 <DM4PR11MB636063F43127CCDF65F7249DF4362@DM4PR11MB6360.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR11MB636063F43127CCDF65F7249DF4362@DM4PR11MB6360.namprd11.prod.outlook.com>
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

On Tue, Dec 03, 2024 at 09:14:58AM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Saturday, November 30, 2024 3:17 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-
> > xe@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> > harry.wentland@amd.com; pekka.paalanen@haloniitty.fi;
> > sebastian.wick@redhat.com; jadahl@redhat.com; mwen@igalia.com;
> > contact@emersion.fr; Kumar, Naveen1 <naveen1.kumar@intel.com>; Borah,
> > Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > Subject: Re: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
> > 
> > On Tue, Nov 26, 2024 at 06:57:14PM +0530, Uma Shankar wrote:
> > > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > >
> > > Add helper to initialize 1D segmented LUT
> > >
> > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_colorop.c | 27 ++++++++++++++++++++++++++-
> > >  include/drm/drm_colorop.h     |  4 ++++
> > >  2 files changed, 30 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_colorop.c
> > > b/drivers/gpu/drm/drm_colorop.c index 111517c08216..871d5660e3b2
> > > 100644
> > > --- a/drivers/gpu/drm/drm_colorop.c
> > > +++ b/drivers/gpu/drm/drm_colorop.c
> > > @@ -104,7 +104,6 @@ static int drm_create_colorop_capability_prop(struct
> > drm_device *dev,
> > >  	return 0;
> > >  }
> > >
> > > -__maybe_unused
> > 
> > Squash all three patches so that you don't have to play with __maybe_unused.
> > Then please expand commit message to describe the problem that you are
> > solving.
> 
> Idea was to logically separate for ease of review. But we can squash if that looks better.

I think the patches are simple enough, but it's just my 2c.

> 
> > >  static int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
> > >  				    struct drm_plane *plane,
> > >  				    const struct drm_color_lut_range *ranges,

-- 
With best wishes
Dmitry
