Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A899E966783
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3FE10E8E7;
	Fri, 30 Aug 2024 17:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bvA32TAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4157D10E8E7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:01:44 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f401b2347dso18611481fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725037302; x=1725642102; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9e6nxlU1uy3OwWwU1U+BKOkR/SYcbY7cP9f18pPl24M=;
 b=bvA32TAVRmqaDBa8g1tWJcKRXaM+s8VEcn90CMA7Npo62weB5jte0+MMhg0N3bO4Qi
 j/4bvdzxwaacdzFM10csg+Q72Dr56AZuqANTAhCYqoRFupN+0xRIoUoEtd2rHA52tovv
 Be/MnF6I74+3jfuGwIZdkIkJlMNdLB6Q+Aq2PFJKf2LeERngB83Vv80cSpd2m6N6RTR9
 x/OiYwL3a/e821uLwiIygIs1WfDKqvC9rU38J/PBSB827sIvcBmf/OUQnjSgA7zwURMO
 yg2aTqacsN0l2lQC7H0cxE6gujh1a+eN7qoOhtkMYLiORUjfwmkUl3Uc09Dv/V2iKjD7
 gtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725037302; x=1725642102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9e6nxlU1uy3OwWwU1U+BKOkR/SYcbY7cP9f18pPl24M=;
 b=aokLyFPU6q9GXS+QlN0qM2dV8PblvMAqJeMhZ9y0SqeXS/h4ZgA+c80TpYnE5CIORy
 h2TAETiNYnUGGkfWWRBYc50yyRWGLgngfwQSiXfNTBsWmi5JR1QoelR5+fscVRK8Mx2o
 yuDDRJPw+VS90q8wATteiNuJhdDdo8BlUFHxcM9eQ+QWYd5xBQLC99H3eYXmfBWfM8al
 0WB87IJhHUNTMwAwRhlFA5D6qTQ3dl2fteZpEFmX6ivdFrZLomSB+6b6yjOgIa9qfHbs
 h/zqc1v7h2/r01G4crLCEBH7SKvOyVa+kiXKzSzhi6PQqXrfdYtzutuaIIGmY7pL/PMS
 cReQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCUlvhAvbJ3EFPE0TqymY3tPoN6PaHMTUgAEDH2enyIwwIbFBGlCUDKyS3TvsSofnaKZw87E2JGx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDzXujWcRXLyeiRcOwWrzVARvq85vja4cl3We3HFw0A2yS/6hw
 5wj9BrS7U2XqUIhsgKus8UKCBMNKZhXRS92fMQF65Wc3Uj3RFIYHK1ay1cRujj4=
X-Google-Smtp-Source: AGHT+IHVZcra0jI/oqIBBxlspPQCALcjRHzAaZIYOgKseKUP0hM1DoYe9EJx8fi3Kk//VawoWLFVXg==
X-Received: by 2002:a2e:bc18:0:b0:2ef:28ed:1ff5 with SMTP id
 38308e7fff4ca-2f612ae4c49mr23103861fa.15.1725037300112; 
 Fri, 30 Aug 2024 10:01:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f38ce5sm7125841fa.68.2024.08.30.10.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:01:39 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:01:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 05/21] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <4clfifnlalkzgf3fy2gl5enjam55vs24pf7zp64zevj64bh5mv@te4qvqe5oihc>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-5-502b16ae2ebb@quicinc.com>
 <fiydda6an5a4dc2gmrj4fnti4ymkk7ntbtpq6mgushmgnzl6cp@pwtz6goteljh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fiydda6an5a4dc2gmrj4fnti4ymkk7ntbtpq6mgushmgnzl6cp@pwtz6goteljh>
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

On Fri, Aug 30, 2024 at 07:42:52PM GMT, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:26PM GMT, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > All resource allocation is centered around the LMs. Then other blocks
> > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > powers up the CRTC rather than the encoder.
> > 
> > Moreover if at some point the driver supports encoder cloning,
> > allocating resources from the encoder will be incorrect, as all clones
> > will have different encoder IDs, while LMs are to be shared by these
> > encoders.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state and
> > dropped clearing num_mixers in crtc_disable]
> 
> Hmm, I still see the chunk in dpu_crtc_disable(). I think the chunk is
> correct so that if there is a disable/enable pair of calls with no
> intermediate mode_set then num_mixers carry over the correct value.

As a second thought: maybe it should be moved to the next patch.

> 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  89 +++++++++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> >  3 files changed, 183 insertions(+), 126 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 4c1be2f0555f..3296b0650056 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >  
> >  	dpu_core_perf_crtc_update(crtc, 0);
> >  
> > -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > -	cstate->num_mixers = 0;
> > -
> >  	/* disable clk & bw control until clk & bw properties are set */
> >  	cstate->bw_control = false;
> >  	cstate->bw_split_vote = false;
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
