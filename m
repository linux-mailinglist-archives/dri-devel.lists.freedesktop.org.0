Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A66A11C3B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D6310E56A;
	Wed, 15 Jan 2025 08:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PjIjPJuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A753D10E56A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:41:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30613802a04so40211961fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736930514; x=1737535314; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TdXKX+DElTWdQSe1iA/sdCzGpS4cDFP9391dO93DZTs=;
 b=PjIjPJuQpLADkyTrXYqu23FhHfVzEBMZZkO2Pdk+G8xzlbiLmiXW812hEmuf76Lsqq
 aztvPxDMCIDbVrP8sAdoUokwYeD/FsrVx/K+CjlsXS4/raG3HlumMuxOTgPeHTj4IDxL
 59l3YsP6FO++2yvrG2+jIsg+5wT7SIFIAkPwQ4QnfAtno5PBJAWReL3uZB0PqknbqL/b
 NgUTD7nnGrfz56Ev7HwdeEtZZQQvJmLOO31LVPaK/y3Evji8AiNJTz7Dv8LCd6KZhSBy
 xCMaO9cfnS+9VQ13hZ8hmeNoDQJNqkzTcRk/dNUsCdPwXZyn/EHyCUBEOW9JL07aD/Kz
 Y5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736930514; x=1737535314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdXKX+DElTWdQSe1iA/sdCzGpS4cDFP9391dO93DZTs=;
 b=cu1gxs4lk23/ymWbwI+taUeu4qfRKkgq/tj9RT6GSQkyD7DtmfzArGNWOOQeJUWaAp
 heETUtWEeKVt3tWzzIhdBkdrdWPR/ZhCXnN/mbzX9BKwEtarg+EJfdaQGDKrbG+g7iqQ
 mxsiz+XFS7Lbm0EMXm7tC6M07EXnNqFLBqMoQGUp4d8EGcWNm2GcJtfhIWwFEpN/5PQG
 f5yN6oggj3wf1kA76GWaukbPTg3y11YD4pDirSSkj1qqfVoLFWT/7sIUHfPCYJiljhOi
 3eMWfpDAp/WpIfvQAsnL4d75IzHEb0FeaiTQ8+rWPnz6342TMIYL2NIlIsUaETmLuZrx
 3qbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIXIDKYkE2HZPKozv4mi5RCe/iwGiR0vHKmr/R0ScOhDdOtH+STyOq32iaPZyarKIedcrO6kL5op8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6kupaejS09vzfKBBB8Hnp1t1BXPouJcGDe99A5/8TbsZkYlzh
 NyIfsOpG0q4OjS+b/v5K3WTiBhQuQi06PrJW6SCC/VkbdlPbqJM8a9+ZweHlids=
X-Gm-Gg: ASbGncu2l8HBZjiXJF0SrgGYVgvpsysGblouhUEKDHa/TY32W5UWpMPlVN8s09uaad0
 Hv91EfH6rDUf9N37pOfmIlGtgME6I4KB3GZ7R2yAHKFTyJTjNWVw0TudN5zC43GE9jhJLO9+kq/
 mFkZN6P+YlE7OsoCfPMecuRg4t2uilfAyKZ+DL38LVdqRfRjTivt+bWT/KTbvWOkVHSnJD4It0V
 QsPIa2nXd72xkbx0AIesTl2vZhzFR8G3MVCPDrwJG5Uc/Mny9gAaU3j6w2NfEwnuKtoeV8mTmA+
 oRPZNfVyztoYx/Ae0kAMIWizLTwMHLx0t9L2
X-Google-Smtp-Source: AGHT+IFepbkE4RMrmQ34QSMlcth3dnNyGKbzaxJER2+6cB4YSdoaV02zFA/hFD1vHxGGwE7iVc6AQQ==
X-Received: by 2002:a2e:be8a:0:b0:302:1b18:2bfa with SMTP id
 38308e7fff4ca-305f45b25e8mr98179571fa.23.1736930513860; 
 Wed, 15 Jan 2025 00:41:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0f6aa9sm20818371fa.57.2025.01.15.00.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:41:52 -0800 (PST)
Date: Wed, 15 Jan 2025 10:41:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 8/9] drm/msm/dpu: rework core_perf debugfs overrides
Message-ID: <2qhm7oqpbgyoghpj3txjpmb4q3tmxd23cvrdqxicw3lpmwfcwg@m5mn5flvovmp>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-8-00b248349476@linaro.org>
 <86152d89-cf42-4e2f-a188-c401de9d47df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86152d89-cf42-4e2f-a188-c401de9d47df@quicinc.com>
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

On Tue, Jan 14, 2025 at 02:02:54PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > Currently debugfs provides separate 'modes' to override calculated
> > MDP_CLK rate and interconnect bandwidth votes. Change that to allow
> > overriding individual values (e.g. one can override just clock or just
> > average bandwidth vote). The maximum values allowed for those entries by
> > the platform can be read from the 'max_core_ab' and 'max_core_clk_rate'
> > files in debugfs.
> > 
> 
> Apart from the concern I highlighted in the previous patch, the only issue I
> have with this is that, this went from a one step process of using the
> "mode" this has become a two step one.
> 
> There were essentially two modes we are talking about - "fixed" and
> "minimum"
> 
> With respect to "fixed" this is totally fine because this is preserving that
> functionality because to be able to set the fixed mode the end user must
> know what values they want to try anyway.
> 
> With respect to "minimum" mode, is where this approach is not that great.
> The end users of this can be non-display developers too such as our QA teams
> who might want to perform a first level of triage on the issues and route it
> accordingly. This is especially true for underruns and some performance lags
> as well.
> 
> If you really dont like the term "modes", to preserve the "minimum" mode,
> how about just using a bool debugfs like "max_perf_params" which internally
> maxes out the max MDP clock and ab/ib params.

That's what I'm trying to avoid - having an extra debugfs file which
overrides other files. It is much easier to work if there is no need to
switch modes, it is easy to overlook it. I think it should be fine to
use `cat max_foo > fix_foo` to override each of the params. After
renaming the threshold_high to max_core_ab the names of the debugfs
files match.

> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
> >   2 files changed, 9 insertions(+), 88 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 7ff3405c6867556a8dc776783b91f1da6c86ef3f..913eb4c01abe10c1ed84215fbbee50abd69e9317 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -17,20 +17,6 @@
> >   #include "dpu_crtc.h"
> >   #include "dpu_core_perf.h"
> > -/**
> > - * enum dpu_perf_mode - performance tuning mode
> > - * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
> > - * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
> > - * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
> > - * @DPU_PERF_MODE_MAX: maximum value, used for error checking
> > - */
> > -enum dpu_perf_mode {
> > -	DPU_PERF_MODE_NORMAL,
> > -	DPU_PERF_MODE_MINIMUM,
> > -	DPU_PERF_MODE_FIXED,
> > -	DPU_PERF_MODE_MAX
> > -};
> > -
> >   /**
> >    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> >    * @perf_cfg: performance configuration
> > @@ -215,18 +201,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   	if (!kms->num_paths)
> >   		return 0;
> > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -		avg_bw = 0;
> > -		peak_bw = 0;
> > -	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +
> > +	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +	peak_bw = perf.max_per_pipe_ib;
> > +
> > +	if (kms->perf.fix_core_ab_vote)
> >   		avg_bw = kms->perf.fix_core_ab_vote;
> > -		peak_bw = kms->perf.fix_core_ib_vote;
> > -	} else {
> > -		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > -		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > -		peak_bw = perf.max_per_pipe_ib;
> > -	}
> > +	if (kms->perf.fix_core_ib_vote)
> > +		peak_bw = kms->perf.fix_core_ib_vote;
> >   	avg_bw /= kms->num_paths;
> > @@ -275,12 +259,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> >   	struct drm_crtc *crtc;
> >   	struct dpu_crtc_state *dpu_cstate;
> > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
> > +	if (kms->perf.fix_core_clk_rate)
> >   		return kms->perf.fix_core_clk_rate;
> > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
> > -		return kms->perf.max_core_clk_rate;
> > -
> >   	clk_rate = 0;
> >   	drm_for_each_crtc(crtc, kms->dev) {
> >   		if (crtc->enabled) {
> > @@ -396,54 +377,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >   #ifdef CONFIG_DEBUG_FS
> > -static ssize_t _dpu_core_perf_mode_write(struct file *file,
> > -		    const char __user *user_buf, size_t count, loff_t *ppos)
> > -{
> > -	struct dpu_core_perf *perf = file->private_data;
> > -	u32 perf_mode = 0;
> > -	int ret;
> > -
> > -	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
> > -	if (ret)
> > -		return ret;
> > -
> > -	if (perf_mode >= DPU_PERF_MODE_MAX)
> > -		return -EINVAL;
> > -
> > -	if (perf_mode == DPU_PERF_MODE_FIXED) {
> > -		DRM_INFO("fix performance mode\n");
> > -	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
> > -		/* run the driver with max clk and BW vote */
> > -		DRM_INFO("minimum performance mode\n");
> > -	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
> > -		/* reset the perf tune params to 0 */
> > -		DRM_INFO("normal performance mode\n");
> > -	}
> > -	perf->perf_tune.mode = perf_mode;
> > -
> > -	return count;
> > -}
> > -
> > -static ssize_t _dpu_core_perf_mode_read(struct file *file,
> > -			char __user *buff, size_t count, loff_t *ppos)
> > -{
> > -	struct dpu_core_perf *perf = file->private_data;
> > -	int len;
> > -	char buf[128];
> > -
> > -	len = scnprintf(buf, sizeof(buf),
> > -			"mode %d\n",
> > -			perf->perf_tune.mode);
> > -
> > -	return simple_read_from_buffer(buff, count, ppos, buf, len);
> > -}
> > -
> > -static const struct file_operations dpu_core_perf_mode_fops = {
> > -	.open = simple_open,
> > -	.read = _dpu_core_perf_mode_read,
> > -	.write = _dpu_core_perf_mode_write,
> > -};
> > -
> >   /**
> >    * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
> >    * @dpu_kms: Pointer to the dpu_kms struct
> > @@ -472,8 +405,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >   			(u32 *)&perf->perf_cfg->min_llcc_ib);
> >   	debugfs_create_u32("min_dram_ib", 0400, entry,
> >   			(u32 *)&perf->perf_cfg->min_dram_ib);
> > -	debugfs_create_file("perf_mode", 0600, entry,
> > -			(u32 *)perf, &dpu_core_perf_mode_fops);
> >   	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
> >   			&perf->fix_core_clk_rate);
> >   	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index 5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d..9d8516ca32d162b1e277ec88067e5c21abeb2017 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -24,20 +24,11 @@ struct dpu_core_perf_params {
> >   	u64 core_clk_rate;
> >   };
> > -/**
> > - * struct dpu_core_perf_tune - definition of performance tuning control
> > - * @mode: performance mode
> > - */
> > -struct dpu_core_perf_tune {
> > -	u32 mode;
> > -};
> > -
> >   /**
> >    * struct dpu_core_perf - definition of core performance context
> >    * @perf_cfg: Platform-specific performance configuration
> >    * @core_clk_rate: current core clock rate
> >    * @max_core_clk_rate: maximum allowable core clock rate
> > - * @perf_tune: debug control for performance tuning
> >    * @enable_bw_release: debug control for bandwidth release
> >    * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
> >    * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
> > @@ -47,7 +38,6 @@ struct dpu_core_perf {
> >   	const struct dpu_perf_cfg *perf_cfg;
> >   	u64 core_clk_rate;
> >   	u64 max_core_clk_rate;
> > -	struct dpu_core_perf_tune perf_tune;
> >   	u32 enable_bw_release;
> >   	u64 fix_core_clk_rate;
> >   	u32 fix_core_ib_vote;
> > 

-- 
With best wishes
Dmitry
