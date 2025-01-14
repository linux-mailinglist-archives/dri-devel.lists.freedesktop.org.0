Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBAAA10512
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7EB10E16D;
	Tue, 14 Jan 2025 11:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HGZOsHjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C431B10E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 11:11:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401fb9fa03so4184163e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 03:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736853036; x=1737457836; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LcbWpbmmbJ2bnU2WDhOtIaUm7QnK525Rc7UTLeMZn7M=;
 b=HGZOsHjrrfTi0v5ZIWybd3CzDGPFCqsS+3sp5UxGWKSteDfBGnhob89e570MdjYFD0
 GxqI9mw5KIQYNpRV03eX30TcnjGJMb75R1hCB0xPRv8lsKdyQ5KkyJ999Be2LBcWwiu7
 ajXs9FFNTgR5vKakenCabw0W10drsYyI+xfslmBhp9EvlBvInPQlt46I2jx2gp+MuuH/
 M5mR5h6D9887XNB+R4jnKWJhspB/AphaHxHGdbHHnmTa65YFHovxMoAanCAVoRww2sg+
 zeOeJSZo8Q4XPRl2Tbq02K4BwVRf+9gEPJc2fb6G6X1cFui07WcH73CBLpO2iXkUMFKV
 gpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736853036; x=1737457836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LcbWpbmmbJ2bnU2WDhOtIaUm7QnK525Rc7UTLeMZn7M=;
 b=dInJNZARDzH7WpvrZ9ep44KpXSyY1fE7MTCZudxpDi5Bx1J3lm3Bx2aGIw/t/mUYYs
 4dJ87l90lXLmH7vlhefGMxqQXrMGiIXB8EqTtaX3N96kNzQl/Geq0ZmJMzAbbh4enpEg
 pOdcdggAH4N6SmdtxQSggGOqRZBHkErWaxMkYx1w3boT4XCQ44mcolRw9TJQyRmcfgje
 pkv4UkHUqkriE+Ohosng9PgH+ahXio8d0Rpj+4lenJ4mSDIMl/E74CNZa1l9M3EPNDoH
 DLKy1gfDN9+0CZJ55vqVbhvPuabysuQcugZwL/yMn27Waqm0vGla3QyXTzG8KcdIvI5n
 Vkmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6CNvBTX1fbmve7J0iRf2rTYeK5Nx0eUs1t+gYulBYPFo/CjFDQx7HxbbUXZjlV23vFWkdCdlk3po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOYxrumo81OVXv5thOLns4+OweqbFQm2UPh7UydseToMRAB8Mh
 VIpYaaw2pjoEn+F/eOD55ezdPkYK6/B1hIp8iYTT9z6s9+Ba6b6yOHI9u0CfDjg=
X-Gm-Gg: ASbGncv+7lek3zE5pEUOG2L2x4Dtt+HrUzR9DAhZ+lyH3AcwXMeYnF6kdaUub+T4Pxo
 Ur42hVbgw3aFAsKoeuLU0t3XBr6cHrIjH2vwlgzQNykyFzImKOvfbsh/9fWXPGCq7zUw675sOVf
 Z/+U/YWgjkMx+DaX78ibXY+LDDuuoPprmRiXiUdv07CD3RZwqLAIcKEtVmisTEAxs7APdBGvxrN
 abIvu498nPC/09XZmkiSgJKN0B7WYumf/fafXflh81lS/wucywHy6dXmsT+6sOwGQKCpFylYprG
 Lg3OupeFKtKXyaza5eT+nNHyVZB+otKS7wCj
X-Google-Smtp-Source: AGHT+IGvCkkJqD6qSUoUh+xwHvMJ01rnl6B7Sa+qT153PtEezacOoKnOV9KdyQAKOj7uQ/LiGgjBPQ==
X-Received: by 2002:a05:6512:2391:b0:540:2fe6:6a3c with SMTP id
 2adb3069b0e04-5428a5775dcmr7566905e87.0.1736853036185; 
 Tue, 14 Jan 2025 03:10:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea68aesm1648501e87.149.2025.01.14.03.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:10:34 -0800 (PST)
Date: Tue, 14 Jan 2025 13:10:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Message-ID: <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
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

On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> > 
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting. This better reflects user requirements in the case
> > of different resolutions being set on different CRTCs: instead of using
> > the same bandwidth for each CRTC (which is incorrect) user can now
> > calculate overall bandwidth required by all outputs and use that value.
> > 
> 
> There are two things this change is doing:
> 
> 1) Dropping the core_clk_rate setting because its already handled inside
> _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
> will still work.
> 
> and
> 
> 2) Then this part of moving the ab/ib setting to
> _dpu_core_perf_crtc_update_bus().
> 
> Can we split this into two changes so that its clear that dropping
> core_clk_rate setting in this change will not cause an issue.

Ack

> 
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
> >   1 file changed, 19 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >   		return;
> >   	}
> > -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -		perf->bw_ctl = 0;
> > -		perf->max_per_pipe_ib = 0;
> > -		perf->core_clk_rate = 0;
> > -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> > -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > -	} else {
> > -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > -	}
> > -
> > +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >   	DRM_DEBUG_ATOMIC(
> >   		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> >   			crtc->base.id, perf->core_clk_rate,
> > @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   {
> >   	struct dpu_core_perf_params perf = { 0 };
> >   	int i, ret = 0;
> > -	u64 avg_bw;
> > +	u32 avg_bw;
> > +	u32 peak_bw;
> >   	if (!kms->num_paths)
> >   		return 0;
> > -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > +		avg_bw = 0;
> > +		peak_bw = 0;
> > +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +		avg_bw = kms->perf.fix_core_ab_vote;
> > +		peak_bw = kms->perf.fix_core_ib_vote;
> > +	} else {
> > +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +
> > +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +		peak_bw = perf.max_per_pipe_ib;
> > +	}
> > -	avg_bw = perf.bw_ctl;
> > -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > +	avg_bw /= kms->num_paths;
> >   	for (i = 0; i < kms->num_paths; i++)
> > -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >   	return ret;
> >   }
> > 

-- 
With best wishes
Dmitry
