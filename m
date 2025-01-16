Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFBFA12FFB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 01:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202E210E173;
	Thu, 16 Jan 2025 00:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kMa7icz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46AC10E173
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:32:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so390488e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 16:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736987562; x=1737592362; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xbDzpwSSc8XyS9KXfprC5IZcW4xyc8w1R6gyp/7m9aE=;
 b=kMa7icz8tmkBfFlDshuQ6KaieBC264rNRuTRsq7wPax6lBERUsjWW+tWBoKPgykHdG
 ZbjUdr4SA0c62rNgk0DpDaccnlzyNd/sLKD90NZeGipWoY3MG0mnS3r06WhPjilQSNjE
 mcG7w1MsJZIsdyv/kuSwXkiqxPgipkHX4h3YlpggOD+0n/FGIAsqKxy8Gy/tjcIXMEsH
 kKLn4wC1t6DVYTaA5HJEsqWcfScNLin3tGrperpu+5i5Pa0Bg1zljU+YOn3Ta3aBOC8p
 RqwoRjU2gGrWSafxgo+iFNqdy9ngI6hH7/BFhd2QYaQn9NFVyvCq86My+bB72/qwblG6
 limg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736987562; x=1737592362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xbDzpwSSc8XyS9KXfprC5IZcW4xyc8w1R6gyp/7m9aE=;
 b=xQkLKpbJTmCnMQwdWe9XjRHSwqTCwSPdtObYZMooj7xvmoIM8dyggU4jET5RIhL0o8
 tdPv1YdShekSJlr6wlNbP1xvWTzzyWT3namMWNzMdFv8WSWy5nbd/nQMbpxntLzJ0QAP
 1D4rtJc8gFTD1Y5hJ9ecD2MjWX/dt2b4qYDA+gGN3BPPsNzzM9+ZUdxfwspBnuan9z5V
 sxNzxHGqyD2H2mZQBox/uAIMNJSnxFjCryKLuLrcAzMSIwezdfO2LSVGJQvb9AZNa91d
 paf3bP1IQEKeMLKSHtrnG0GYuGLwV1HPq+A5h3S0DGKz/X6xcEJKeLH/xvS9rLOzYPc5
 H6Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5hs0DzWxhFk6vSLt3bWXLeC64RN16h3+cBbwVk4sgbIhdMvyYI+2W6RVyj1lV8KxrizTd7RpsYDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV+eKLzjzRCyogB74AlwOdaNh9OC2siyLO66EhpR+WY+qu4ldT
 sNNzu8CjIFx6YR30WyvYcK8lGe2KF51H34s1fIxPSypsIFUuiScaHXbo08wHiZs=
X-Gm-Gg: ASbGncv0gZONK2DbYg8mj082YOnVDml0LiH0Shkd1/6ZtSl3NLbBmLDfEDc8HI+ulWi
 TpX8WSWmRx2Ms+tGPJtQWSzJSHu3IqwKzkpJuUwR+wvF+KvI0/2Y6lzaVspLtEZLEK2jVj9wpqe
 kthqcoEKxItTcQXDc2z9kbQ9NYeBEHfPmb7YG1hwwu1yMI5abN2u5A4358tNNn60uYLyJaYhKuV
 qRrFctbxiKkFaL0cpowhhSnpywes2Tv9XGA57Flx7uMyVId8Ct4rtdp9ywf/BcrxRcSW5fHYw30
 E4O2L88cERG3eOH+ZBLHvnoHe1m/pWrQ50xT
X-Google-Smtp-Source: AGHT+IEWYhMh3IevBwvcH5MlFJNwS+BiIvAgx5CPvfjrs1KGiAUdaC6+6L3B3nmYddaLnEOpQm5NLQ==
X-Received: by 2002:a05:6512:3b2c:b0:542:2999:2f18 with SMTP id
 2adb3069b0e04-542845048f8mr9123561e87.8.1736987561645; 
 Wed, 15 Jan 2025 16:32:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6b78sm2124319e87.165.2025.01.15.16.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 16:32:40 -0800 (PST)
Date: Thu, 16 Jan 2025 02:32:37 +0200
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
Message-ID: <mvw34ny5en3dzt5ro6556daiktk6dc2azjotq26755dqscbu3b@fq7rxjqf7fg2>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
 <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
 <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>
 <4quxgv6n35np7fm7iqx5bw5xnkz7gxabh3ix5rexcq5nir5k7i@xi33w2wyj7om>
 <72c50442-5624-44ca-a954-64f7ddfa16f9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72c50442-5624-44ca-a954-64f7ddfa16f9@quicinc.com>
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

On Wed, Jan 15, 2025 at 11:41:27AM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/15/2025 12:27 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 14, 2025 at 01:18:26PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/14/2025 3:10 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
> > > > > 
> > > > > 
> > > > > On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > > > > > Move perf mode handling for the bandwidth to
> > > > > > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > > > > > and then aggregating known values.
> > > > > > 
> > > > > > Note, this changes the fix_core_ab_vote. Previously it would be
> > > > > > multiplied per the CRTC number, now it will be used directly for
> > > > > > interconnect voting. This better reflects user requirements in the case
> > > > > > of different resolutions being set on different CRTCs: instead of using
> > > > > > the same bandwidth for each CRTC (which is incorrect) user can now
> > > > > > calculate overall bandwidth required by all outputs and use that value.
> > > > > > 
> > > > > 
> > > > > There are two things this change is doing:
> > > > > 
> > > > > 1) Dropping the core_clk_rate setting because its already handled inside
> > > > > _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
> > > > > will still work.
> > > > > 
> > > > > and
> > > > > 
> > > > > 2) Then this part of moving the ab/ib setting to
> > > > > _dpu_core_perf_crtc_update_bus().
> > > > > 
> > > > > Can we split this into two changes so that its clear that dropping
> > > > > core_clk_rate setting in this change will not cause an issue.
> > > > 
> > > > Ack
> > > > 
> > > 
> > > Actually I think this is incorrect.
> > > 
> > > If the user puts in an incorrect value beyond the bounds, earlier the code
> > > will reject that by failing the in _dpu_core_perf_calc_crtc().
> > 
> > This function doesn't perform any validation nor returns an error code.
> > Probably you've meant some other function.
> > 
> 
> Sorry, let me explain a little more to complete the flow I am seeing.
> 
> _dpu_core_perf_calc_crtc() gets called by dpu_core_perf_crtc_check().
> 
> That one checks against erroneous values.
> 
>                 if (!threshold) {
>                         DPU_ERROR("no bandwidth limits specified\n");
>                         return -E2BIG;
>                 } else if (bw > threshold) {
>                         DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
>                                         threshold);
>                         return -E2BIG;
>                 }

Here we are checking that the selected set of modes doesn't overload
defined platform requirements. However I think that it should be
possible for the user to attempt to overcome predefined bandwidth
limitations in attempt to debug the issue. ICC framework handles that
perfectly (and if you check, until the sync_state is reached all BW's
are assumed to be UINT_MAX). Maybe I should document it in the commit
message that after this commit forced BWs are not a subject to the
catalog limitations.

> 
> > > 
> > > Now, if we move it to _dpu_core_perf_crtc_update_bus(), this is beyond the
> > > check phase so incorrect values cannot be rejected.
> > > 
> > > So we will still need to preserve overriding the values in
> > > _dpu_core_perf_calc_crtc().
> > > 
> > > > > 
> > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
> > > > > >     1 file changed, 19 insertions(+), 21 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > > @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> > > > > >     		return;
> > > > > >     	}
> > > > > > -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > > > > > -
> > > > > > -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > > > -		perf->bw_ctl = 0;
> > > > > > -		perf->max_per_pipe_ib = 0;
> > > > > > -		perf->core_clk_rate = 0;
> > > > > > -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > > > -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> > > > > > -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > > > > > -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > > > > > -	} else {
> > > > > > -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > > > -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > > > -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > > > -	}
> > > > > > -
> > > > > > +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > > > > > +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > > > > > +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > > > > >     	DRM_DEBUG_ATOMIC(
> > > > > >     		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> > > > > >     			crtc->base.id, perf->core_clk_rate,
> > > > > > @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > > > > >     {
> > > > > >     	struct dpu_core_perf_params perf = { 0 };
> > > > > >     	int i, ret = 0;
> > > > > > -	u64 avg_bw;
> > > > > > +	u32 avg_bw;
> > > > > > +	u32 peak_bw;
> > > > > >     	if (!kms->num_paths)
> > > > > >     		return 0;
> > > > > > -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > > > +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > > > +		avg_bw = 0;
> > > > > > +		peak_bw = 0;
> > > > > > +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > > > +		avg_bw = kms->perf.fix_core_ab_vote;
> > > > > > +		peak_bw = kms->perf.fix_core_ib_vote;
> > > > > > +	} else {
> > > > > > +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > > > +
> > > > > > +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > > > > > +		peak_bw = perf.max_per_pipe_ib;
> > > > > > +	}
> > > > > > -	avg_bw = perf.bw_ctl;
> > > > > > -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > > > > > +	avg_bw /= kms->num_paths;
> > > > > >     	for (i = 0; i < kms->num_paths; i++)
> > > > > > -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > > > > > +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
> > > > > >     	return ret;
> > > > > >     }
> > > > > > 
> > > > 
> > 

-- 
With best wishes
Dmitry
