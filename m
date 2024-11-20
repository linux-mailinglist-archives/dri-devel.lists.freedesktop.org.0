Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86AE9D431D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 21:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630A410E7BD;
	Wed, 20 Nov 2024 20:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="asu0flqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8253410E282;
 Wed, 20 Nov 2024 11:54:24 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21262a191a5so13113105ad.0; 
 Wed, 20 Nov 2024 03:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732103664; x=1732708464; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3CU4VQWBACqm9PUCaRN7S/RhGe8ctry/AcpamMARb5Y=;
 b=asu0flqGu2mcSdbgPXMhlgycVG9DTQSbRDOEVO2BlnKYXYaqxZc0WwTIkyCn4eODKJ
 WP81jnDjhEGgB0wmGod4ymGzGSfD4Ut8+F50X2cVxO/pOzq1ZkSmFTCWI23m/RG5ZOk1
 dbaxDDNC3+EHjL2Jqjw2d2rEih87gRLFneqNGVNYG6QiSGrY3HWX8qZrn63PGycvhaC2
 UUpHuqRLKeDG8iULeyz5pVIBIQ4An7hO1WQRb/6/MP8rZHEToxK6RYkeD3q4peYcsXtP
 AENsnTUMQY2SHzTRfr6cZnbB5v+JQYUTfSelDh0ik3Vl0vG/2dQ+RmcySsWf1U8XFRSx
 ancQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732103664; x=1732708464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CU4VQWBACqm9PUCaRN7S/RhGe8ctry/AcpamMARb5Y=;
 b=kaZjz9dfB/rh0aecnD3nbgK5iZ22oCrNCx1zJ5ENNblk3au23anaschbzaySXxnxQR
 FkUagKmxs+m1ZTDzUDtkO6GsNlACVxpdt4q42cVQXH4P51SF7WQf+JPy7XdYY4r8XTOP
 Emom8swIRi3HF81BeuwurRjbX7EfvDWbGr6YOIFQOiEnAp7bDgBsF+cVAB3ufQ2x/CU3
 szr7fTHUuWmyZ8bbL+Hd6WD8rjSJDPmxi7LONtzYc01ZV8lfrDKSmI0xJscmNaWYLj/a
 qNsv/wuQuedY4GxW4uPbDmwrtqUOw27Vk6XHWZcYS4MM+jXJh1nsS7S5lQKkmYHDEABy
 7rcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlAl6/MAaRY8wXL6lrmhf3ucp75DT3hIlYKY0RMC2goCk/E9bm3U4k6QV4YnRA85y6JUgvV5AM6PU=@lists.freedesktop.org,
 AJvYcCXjPdU891S7ipr2fV1vOBOqln1BGdvz4/wKAww6m6qqKKow2kvNYXd7G6dct9N6b2XT1gYC3VdXFSUY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5j+51vY9vn75O/hVZjujjpkszCKdOK/Md32I50AnolfWNHxUa
 nnyd6iHm5B98s52VPXDlmELvFj2DpHiMozmgSbqhDZqFTRwxcLY4
X-Google-Smtp-Source: AGHT+IHCCQlHXWu+VwXZr0F1OsJVRG8awCPqJtVORBIi12RYKMzGzobiFsxattqW9qkfyCXn+lMg1Q==
X-Received: by 2002:a17:902:e94f:b0:20b:51b0:4b22 with SMTP id
 d9443c01a7336-2126c9785c1mr31181815ad.47.1732103663931; 
 Wed, 20 Nov 2024 03:54:23 -0800 (PST)
Received: from HOME-PC ([223.185.132.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21207f26c61sm62826295ad.160.2024.11.20.03.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:54:23 -0800 (PST)
Date: Wed, 20 Nov 2024 17:24:20 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_bjorande@quicinc.com, quic_parellan@quicinc.com,
 quic_khsieh@quicinc.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Subject: Re: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Message-ID: <Zz3N7IvdN4L8N62p@HOME-PC>
References: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
 <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>
X-Mailman-Approved-At: Wed, 20 Nov 2024 20:33:14 +0000
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

On Wed, Nov 20, 2024 at 01:02:32PM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 10:34:51AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > The variable pixel_div can remain zero due to an invalid rate input,
> 
> No, it can not. Rate is set by the driver, which knowns which rates are
> supported. 
> 
> > leading to a potential division by zero issue. This patch fixes it and
> > the function now logs an error and returns early.
> 
> See Documentation/process/submitting-patches.rst, look for "This patch"
> string.
> 
> > 
> > Additionally, this patch resolves trailing whitespace issues detected
> > by checkpatch.pl in the same file.
> 
> Additionally perform ... => separate commits.
> 
> > 
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > index b4c8856fb25d..e170f70f1d42 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > @@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
> >   * This function reset AUX controller
> >   *
> >   * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> > - * 
> > + *
> >   */
> >  void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
> >  {
> > @@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
> >  		pixel_div = 2;
> >  	else if (rate == link_rate_hbr2)
> >  		pixel_div = 4;
> > -	else
> > +	else {
> >  		DRM_ERROR("Invalid pixel mux divider\n");
> > +		return;
> > +	}
> >  
> >  	dispcc_input_rate = (rate * 10) / pixel_div;
> >  
> > @@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
> >   * This function reset the DP controller
> >   *
> >   * NOTE: reset DP controller will also clear any pending HPD related interrupts
> > - * 
> > + *
> >   */
> >  void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
> >  {
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Hello Dmitry,

Thank you for the valuable feedback. Will update my commit messages
accordingly. I wanted to seek clarification on the the divide by zero
issue. Would pixel_dev not be zero upon hitting the else case as
indicated below casuing a div by zero?

	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
	
	[..]
	
	if (rate == link_rate_hbr3)
		pixel_div = 6;
	else if (rate == 162000 || rate == 270000)
		pixel_div = 2;
	else if (rate == link_rate_hbr2)
		pixel_div = 4;
	else
		DRM_ERROR("Invalid pixel mux divider\n"); <<-- here

	dispcc_input_rate = (rate * 10) / pixel_div;

-Dheeraj
