Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1496F9D3A83
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9E510E732;
	Wed, 20 Nov 2024 12:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QtSrA9jY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1873C10E727
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:16:15 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb587d0436so41069061fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 04:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732104973; x=1732709773; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cIsUKn523ItPFhw9PoQgspXzNPwI8eBe9tACkVcqoFg=;
 b=QtSrA9jY6ntogG7UjLFl/sORDRbpSWPY1scUnghPURNYADiWPjvgz0lCGRgalh72ix
 e1v+0OZ7wAg051kW9dVN1sJFKndbkp72qt/HoVt3+90l/2Tljgr2hHaDt/LxFWOKkEFm
 hXjGD9hW1AOsMBaovKrHrs6nIagkCaxGcs8eeW8LoLMj0PIfJOZdKKcMr//ViB0y/ZUT
 8dGSahiTGYdk/4E+DkwgfjWvXue+mXVRrkzxnOJDXHdhcdasPiNzv0VEgaet/7RLP7eL
 Z2ng5yProPqSiLLfHX13qmutES8D/AsKxru2jUbRu4yi/P2ni+IsY6AgHtmPCzG/TRl5
 FzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732104973; x=1732709773;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIsUKn523ItPFhw9PoQgspXzNPwI8eBe9tACkVcqoFg=;
 b=mebZC3SR8axlirpWku7TT7fHt4DEu+bMBrVgeMjPw8Ubi1DmIRQNT8gPYAR5h8Cb98
 b/sOTxWr61/0TTVwIPCmKkhYVAHw8mw2RYtmAiASu4DdPvE5Mtd+Q3FWn2l0LTNfvJ2Z
 Q6EDO7W+aDxZctyhUCbaO0n3wij7sZLiNj2B5SYg1LyPdYuRFAcpK87+GG8hB3DvH7Ph
 k1j1B6vHGp/ihBiGKmrN1G5rGyAzPF/ee0gLegNcEAgwRJSEcuZqTwcqExHb2ekOhP++
 CVpkQyqWFsViDjVtRGWSS3Y7Izv3S8EJJGtUlNJDpuJ4p6QPmOCmcCaXgEzRg2FhE9dJ
 2w9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe/hReCWpFGkUbz7IOd57YFU7KTv/b8blZCjaBl1gSQZV1Al7gjh9SPPxtAPVGRw2McXH2KDWMHHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRFVM1wq2ULkrAghH3Ymmq4NHEJBkUg267hl2ANwNVr3eLdcg9
 6WUuRQP/ZZJZl4GXgWUUXQ3UECj2llkmhOVsTIUF2cPbO2wmkt7pkJLsHZEMTmM=
X-Google-Smtp-Source: AGHT+IG+JbXwf7DnQ9184clVxgyLKaSqR5SrvWGXCF34hbjR2SJgwz1JS9pJIQewA46R8bEOMRQG1Q==
X-Received: by 2002:a2e:bc20:0:b0:2ff:78be:e02d with SMTP id
 38308e7fff4ca-2ff8dbcb795mr14542921fa.11.1732104973210; 
 Wed, 20 Nov 2024 04:16:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff69ae80c5sm15094771fa.80.2024.11.20.04.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 04:16:11 -0800 (PST)
Date: Wed, 20 Nov 2024 14:16:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 linux-arm-msm@vger.kernel.org, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, simona@ffwll.ch, quic_bjorande@quicinc.com, 
 quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Subject: Re: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Message-ID: <pwwukfhijwywhz7tailrfamxdyz6jabo5ref64xr6upnkzcpel@flzvrcr3m3h5>
References: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
 <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>
 <Zz3N7IvdN4L8N62p@HOME-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz3N7IvdN4L8N62p@HOME-PC>
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

On Wed, Nov 20, 2024 at 05:24:20PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> On Wed, Nov 20, 2024 at 01:02:32PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Nov 20, 2024 at 10:34:51AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > > The variable pixel_div can remain zero due to an invalid rate input,
> > 
> > No, it can not. Rate is set by the driver, which knowns which rates are
> > supported. 
> > 
> > > leading to a potential division by zero issue. This patch fixes it and
> > > the function now logs an error and returns early.
> > 
> > See Documentation/process/submitting-patches.rst, look for "This patch"
> > string.
> > 
> > > 
> > > Additionally, this patch resolves trailing whitespace issues detected
> > > by checkpatch.pl in the same file.
> > 
> > Additionally perform ... => separate commits.
> > 
> > > 
> > > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > index b4c8856fb25d..e170f70f1d42 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > @@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
> > >   * This function reset AUX controller
> > >   *
> > >   * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> > > - * 
> > > + *
> > >   */
> > >  void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
> > >  {
> > > @@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
> > >  		pixel_div = 2;
> > >  	else if (rate == link_rate_hbr2)
> > >  		pixel_div = 4;
> > > -	else
> > > +	else {
> > >  		DRM_ERROR("Invalid pixel mux divider\n");
> > > +		return;
> > > +	}
> > >  
> > >  	dispcc_input_rate = (rate * 10) / pixel_div;
> > >  
> > > @@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
> > >   * This function reset the DP controller
> > >   *
> > >   * NOTE: reset DP controller will also clear any pending HPD related interrupts
> > > - * 
> > > + *
> > >   */
> > >  void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
> > >  {
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> Hello Dmitry,
> 
> Thank you for the valuable feedback. Will update my commit messages
> accordingly. I wanted to seek clarification on the the divide by zero
> issue. Would pixel_dev not be zero upon hitting the else case as
> indicated below casuing a div by zero?
> 
> 	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
> 	
> 	[..]
> 	
> 	if (rate == link_rate_hbr3)
> 		pixel_div = 6;
> 	else if (rate == 162000 || rate == 270000)
> 		pixel_div = 2;
> 	else if (rate == link_rate_hbr2)
> 		pixel_div = 4;
> 	else
> 		DRM_ERROR("Invalid pixel mux divider\n"); <<-- here

The 'rate' itself also comes from the driver and the calling functions
ensure that the value is correct.

> 
> 	dispcc_input_rate = (rate * 10) / pixel_div;
> 
> -Dheeraj

-- 
With best wishes
Dmitry
