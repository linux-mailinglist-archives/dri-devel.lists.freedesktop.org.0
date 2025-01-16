Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98239A13A96
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B88F10E95A;
	Thu, 16 Jan 2025 13:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lyClBcz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5491E10E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:12:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54026562221so1002274e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737033175; x=1737637975; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IN5iErEK204hTsFbOEcPU9O7KFDei+gXebS5ZQrhPCE=;
 b=lyClBcz8iZ3Uf6ol3oG1TYaXPgNY6Q30Hog8ODdFX2iYHrH8iATSwePs3nBRBA80vz
 XLTaCCGyXHRI/+uIUakZ0ylPGrFeQMgCCa+ZiEiXNRsloESIuAyXyKU8lcC0bZe5Od8B
 9pbHhznVC3LR6p60bKGZ+TPZGLJdVb/WXODRdhtwvwRcrSkIH1h2fenwp17+MLjjYDaG
 RsJc6SXvJzkJYvCW5BYxwzgqM6k6EnYdfgOQRQGftMtFKrms69ENZtHGNFQEvgfSqSCD
 DNS2QiNAnpQJnHfrxKeT0qL7vUVocyt/HLhVzUdtsm2EfXnqqeNCPeh5+WK7+Jx3uzjM
 GtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737033175; x=1737637975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IN5iErEK204hTsFbOEcPU9O7KFDei+gXebS5ZQrhPCE=;
 b=c+GeWiAQieuqSJLrUcvaJHaRe4Vmy9Ke+KJlWvnUcShOIM3Oar81UOpqq9C3vEeD/z
 DRrYvhROxzu2HSzJuodGKEabPGG79xTgsUAVbwX2s8IUPUOagK3MdER/UFp2+UEW7p2l
 +mSuAHddutrXP+MIqi/L8cqx1rYmApdhV3nBIJaDAGQ0//rJrMUIGkZ7KtsOQ1eB+Ril
 65Ga4kwSzDDM+OopiZvr3fd2b0sqTw3ONJ9ec30uwuQpk8kgNVJep84e8++79Fkj5LTc
 6g77cx98r6k/UKnAkaWnRcEhs3U4SwyEAtqyUaCZwF8JkNrX6FSLBk8QwyDE2IFbltuy
 qRKA==
X-Gm-Message-State: AOJu0YwGdAqQjxUTZHsgH7zbs5udysU37XC38mZsfLjpDflic0v4tuuW
 7EvTATXP2y1E8QkmQTEutzgMiayTp5DpbK7VqgL6/7s0AglUJz72VjKk4zpnlsraRLtv7YU+3Ns
 uPP8=
X-Gm-Gg: ASbGncvpXzh/2NKLdGvGhK6NSfxgbTBLhEK13Oaf+3vW0Q0D1NLIa4GI46s9oqc/0Fl
 nH8LbcdMQ9ko5qp0WRyuO5UgCo2W55891eJ+FYofwzPl1RIeZ2eASAV5mYt+3IYe0CTkhKzLOlS
 afMlhZYjD9YA45YeIyIcRdjMmRRAAt+jqvxH5za7ZZn/B4JKoeB1ovrP3fPoDmWzmOPypha6iJc
 Xq1DnXtquc/1nDWmgRg/V+DNhSHpE9rP9b2iQhM5f+bNCukQywF8vdwWpp2nYXVxCMNxAYPIPCh
 jnTNNMeDQUMwQQ6csRZfoiHLqeO1rqTU1jpe
X-Google-Smtp-Source: AGHT+IHsMwVVXHTANfdMqD7v8ryQa3xtKKNCW75Lyt2j8h7YnEXxIQ/19jtCGN+l81P00mW/j/xJOw==
X-Received: by 2002:a05:6512:3b90:b0:542:214c:533 with SMTP id
 2adb3069b0e04-54284559eefmr11207075e87.30.1737033174553; 
 Thu, 16 Jan 2025 05:12:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be496desm2319317e87.44.2025.01.16.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 05:12:53 -0800 (PST)
Date: Thu, 16 Jan 2025 15:12:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, 
 "Shankar, Uma" <uma.shankar@intel.com>, "Bhattacharjee,
 Susanta" <susanta.bhattacharjee@intel.com>
Subject: Re: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Message-ID: <yyn35zkvqfajyyata2kuwfswfzjf3oqv4hzq5pc5rw7o2sporu@vsybecmh54ow>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
 <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
 <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
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

On Thu, Jan 16, 2025 at 12:33:20PM +0000, Murthy, Arun R wrote:
> > > > On Fri, Jan 10, 2025 at 01:15:29AM +0530, Arun R Murthy wrote:
> > > > > Display Histogram is an array of bins and can be generated in many
> > > > > ways referred to as modes.
> > > > > Ex: HSV max(RGB), Wighted RGB etc.
> > > > >
> > > > > Understanding the histogram data format(Ex: HSV max(RGB))
> > > > > Histogram is just the pixel count.
> > > > > For a maximum resolution of 10k (10240 x 4320 = 44236800)
> > > > > 25 bits should be sufficient to represent this along with a buffer
> > > > > of
> > > > > 7 bits(future use) u32 is being considered.
> > > > > max(RGB) can be 255 i.e 0xFF 8 bit, considering the most
> > > > > significant 5 bits, hence 32 bins.
> > > > > Below mentioned algorithm illustrates the histogram generation in
> > > > > hardware.
> > > > >
> > > > > hist[32] = {0};
> > > > > for (i = 0; i < resolution; i++) {
> > > > >     bin = max(RGB[i]);
> > > > >     bin = bin >> 3; /* consider the most significant bits */
> > > > >     hist[bin]++;
> > > > > }
> > > > > If the entire image is Red color then max(255,0,0) is 255 so the
> > > > > pixel count of each pixels will be placed in the last bin. Hence
> > > > > except hist[31] all other bins will have a value zero.
> > > > > Generated histogram in this case would be hist[32] =
> > > > > {0,0,....44236800}
> > > > >
> > > > > Description of the structures, properties defined are documented
> > > > > in the header file include/uapi/drm/drm_mode.h
> > > > >
> > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > ---
> > > > >  include/uapi/drm/drm_mode.h | 59
> > > > > +++++++++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 59 insertions(+)
> > > > >
> > > > > diff --git a/include/uapi/drm/drm_mode.h
> > > > > b/include/uapi/drm/drm_mode.h index
> > > > >
> > > >
> > c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bda
> > > > ec42
> > > > > c18be34e2d05 100644
> > > > > --- a/include/uapi/drm/drm_mode.h
> > > > > +++ b/include/uapi/drm/drm_mode.h
> > > > > @@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
> > > > >     __u32 pad;
> > > > >  };
> > > > >
> > > > > +/*
> > > > > + * Maximum resolution at present 10k, 10240x4320 = 44236800
> > > > > + * can be denoted in 25bits. With an additional 7 bits in buffer
> > > > > +each bin
> > > > > + * can be a u32 value.
> > > > > + * Maximum value of max(RGB) is 255, so max 255 bins.
> > > >
> > > > HDR planes have higher max value for a component.
> > > > Likewise even in an RGB24 case there are 256 possible values. It's
> > > > not clear why
> > > > 0 gets excluded.
> > > >
> > > This applies to only SDR and excludes HDR.
> > 
> > Why?
> > 
> We are limiting to only SDR. HDR includes a broad range of color and finer details,
> which essentially means its an enhanced image.
> We are trying to enhance the image quality of SDR with the support of histogram.

You are defining generic API. It might be broader than your existing
usecase. Please consider supporting HDR too.

> > > RGB in hex can have a maximum value of 0xFF { RGB (255, 255, 255) }
> > >

-- 
With best wishes
Dmitry
