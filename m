Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6DA13010
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 01:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BAE10E17B;
	Thu, 16 Jan 2025 00:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gm+F9sP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7542810E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:36:13 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53f757134cdso378945e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 16:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736987712; x=1737592512; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6d5rYCGOCl55pW4aEcailtG872E4UJT+niFqa5p5oek=;
 b=gm+F9sP2TBZZRCPTZGYUQVrURKG6IJYGG4l+HRANfQGecvsghKP5Cx6eA3y3iZQH+f
 BwnMfSPlUjTDtFk1q86tKpdmm5hJFUOJStFSjzIK0F8/fV0CqEedrcnhndQ4qyEp7mlh
 lofIwdYrj70UbmLPcCmEB56oPUU+X1Kal4eB6s0mAMd1UQVQI9Mq8GyvwVayU4P9jnyP
 sV46pLucA3IVZs8pAwrpdIfKR69yLI47Wn/g7/RMJLlUrHNiYqjMvi6DIuqXpExNAKz5
 CCw3cdFaHs5XBPemza0DvSxdSMJSbxjWAGeDCyGN1cweKbAePYUV4CvtmhyZL1Ju37GM
 E7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736987712; x=1737592512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d5rYCGOCl55pW4aEcailtG872E4UJT+niFqa5p5oek=;
 b=GCGP6xKsiF76Ca3BseY3mRnQKC5vBaV/47ZGRNSIWnQX1ZwrVa3SwGhnoHDRcfR6pf
 ++JUOYQXNA6yCbTxvQrcfA0LtYYL/qp9DKqkoafNQXHM1kk4IVFbtgs0I1H5Pvw6pQzG
 PKjlGBnZ0qETe+PlIIPs6pk7aJe0u/NONjO1oqKIlT3Cyx6P6ylnSWGmcidbVowLtn2f
 sD5rJVuCm0uO4JFL76n8ciJQTHfK5U0VdgQfU0N++Honu7JjLJ8+TWMOMgjgX3lhzi0F
 OgXBTnimei8s/npugolRtkD2cIb2XdfviF2jOm7O8irNVQCx81r/cvZNulsKuoNZHA3R
 0l8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0XnsvTRVeawWW8Phz/HIFhkNTZt+w4WwGm0RsxDt9Qe++sgV9iJAcsm1qmsLW0RcchdUR6+PJ+eU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRnN+GZRHhKi1t18aqHmOeqMj+vHiiDRgcAhpNywlM/K6sYDvT
 qRbeOFUetQ1KzISw5kP2s197lHX0Sd+QV4Dk1KAjd5ihvcIJExOoXjccN7h56+A=
X-Gm-Gg: ASbGncs/HrR5+q/JE3b8s1jCooC6KwjH78lPy+QYFBfuEu2HUn0dLEFUAKkaexiWktp
 M3s4eJvV7iLdkp/PSKQ8Ik4BByr7W6FqsNKX17ODwb4xUFsTkUX7Y5CnawCL1EtTF7cZOp+J70X
 udnPBoA8B6nJeBfY3EWV0sDW3qd77EiNqIOqBZiX0SEAwjeH//yaPB8RL+6h0FPtDVRA0VZmr/i
 3caudFy+s+sF6M3rQmb3ZvS6XsrnbVK6Qf7Okb+rMzLaBIWmnPL0XJrnFSML9ezm4T+eDEAWIOF
 lpBjNKXcxVSJd03y1n5ixeQgdF6CrzNGDgMi
X-Google-Smtp-Source: AGHT+IHjClC0xjY1GQ/HMj+SZ3Z4XR46DWBlZX/j36/oXOzActO5faMDwqBdRsF3Qs5DrJI8wHVTig==
X-Received: by 2002:a05:6512:282a:b0:53e:3a7d:a1df with SMTP id
 2adb3069b0e04-542847f9e1amr9912570e87.45.1736987711824; 
 Wed, 15 Jan 2025 16:35:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea673csm2182478e87.128.2025.01.15.16.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 16:35:10 -0800 (PST)
Date: Thu, 16 Jan 2025 02:35:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 8/9] drm/msm/dpu: rework core_perf debugfs overrides
Message-ID: <usk35aka6di4iay4ltz7gv2oydga55lvjy6n5netypixgp25ue@2djf75uegzyo>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-8-00b248349476@linaro.org>
 <86152d89-cf42-4e2f-a188-c401de9d47df@quicinc.com>
 <2qhm7oqpbgyoghpj3txjpmb4q3tmxd23cvrdqxicw3lpmwfcwg@m5mn5flvovmp>
 <aa7fd49e-ab48-47b6-8e77-15246f79010f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa7fd49e-ab48-47b6-8e77-15246f79010f@quicinc.com>
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

On Wed, Jan 15, 2025 at 11:51:20AM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/15/2025 12:41 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 14, 2025 at 02:02:54PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > > > Currently debugfs provides separate 'modes' to override calculated
> > > > MDP_CLK rate and interconnect bandwidth votes. Change that to allow
> > > > overriding individual values (e.g. one can override just clock or just
> > > > average bandwidth vote). The maximum values allowed for those entries by
> > > > the platform can be read from the 'max_core_ab' and 'max_core_clk_rate'
> > > > files in debugfs.
> > > > 
> > > 
> > > Apart from the concern I highlighted in the previous patch, the only issue I
> > > have with this is that, this went from a one step process of using the
> > > "mode" this has become a two step one.
> > > 
> > > There were essentially two modes we are talking about - "fixed" and
> > > "minimum"
> > > 
> > > With respect to "fixed" this is totally fine because this is preserving that
> > > functionality because to be able to set the fixed mode the end user must
> > > know what values they want to try anyway.
> > > 
> > > With respect to "minimum" mode, is where this approach is not that great.
> > > The end users of this can be non-display developers too such as our QA teams
> > > who might want to perform a first level of triage on the issues and route it
> > > accordingly. This is especially true for underruns and some performance lags
> > > as well.
> > > 
> > > If you really dont like the term "modes", to preserve the "minimum" mode,
> > > how about just using a bool debugfs like "max_perf_params" which internally
> > > maxes out the max MDP clock and ab/ib params.
> > 
> > That's what I'm trying to avoid - having an extra debugfs file which
> > overrides other files. It is much easier to work if there is no need to
> > switch modes, it is easy to overlook it. I think it should be fine to
> > use `cat max_foo > fix_foo` to override each of the params. After
> > renaming the threshold_high to max_core_ab the names of the debugfs
> > files match.
> > 
> 
> Its just a difference in interpretation IMO.
> 
> the "fixed" mode is trying to given an option to incrementally try and see
> which value really works and also to see whether its the clock OR the
> bandwidth which is making the difference. So individual control of those.
> 
> The "max" mode is trying to see if even the max values of everything cannot
> fix the problem. BTW, the max was maxing out BOTH the DPU clocks and BW.
> 
> So this is not just 2 extra reads for the user but 3. (ab/ib/dpu_clk) if we
> drop "max" and use "fixed" for max as well and even for that the user has to
> refer the max DPU clock value.

Yes, I understand that. However I still think that it's easier than
having a set of 'fix_foo' values which are silently ignored because of
the preselected mode.

I can probably see an option: use your max_perf_params idea, but in a
form of a write-only file which immediately selects max values for clock
rate and both bandwidths. WDYT?

> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 87 +++------------------------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 10 ---
> > > >    2 files changed, 9 insertions(+), 88 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > index 7ff3405c6867556a8dc776783b91f1da6c86ef3f..913eb4c01abe10c1ed84215fbbee50abd69e9317 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > @@ -17,20 +17,6 @@
> > > >    #include "dpu_crtc.h"
> > > >    #include "dpu_core_perf.h"
> > > > -/**
> > > > - * enum dpu_perf_mode - performance tuning mode
> > > > - * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
> > > > - * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
> > > > - * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
> > > > - * @DPU_PERF_MODE_MAX: maximum value, used for error checking
> > > > - */
> > > > -enum dpu_perf_mode {
> > > > -	DPU_PERF_MODE_NORMAL,
> > > > -	DPU_PERF_MODE_MINIMUM,
> > > > -	DPU_PERF_MODE_FIXED,
> > > > -	DPU_PERF_MODE_MAX
> > > > -};
> > > > -
> > > >    /**
> > > >     * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> > > >     * @perf_cfg: performance configuration
> > > > @@ -215,18 +201,16 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> > > >    	if (!kms->num_paths)
> > > >    		return 0;
> > > > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > > > -		avg_bw = 0;
> > > > -		peak_bw = 0;
> > > > -	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > > > +	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > +
> > > > +	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > > > +	peak_bw = perf.max_per_pipe_ib;
> > > > +
> > > > +	if (kms->perf.fix_core_ab_vote)
> > > >    		avg_bw = kms->perf.fix_core_ab_vote;
> > > > -		peak_bw = kms->perf.fix_core_ib_vote;
> > > > -	} else {
> > > > -		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > > > -		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > > > -		peak_bw = perf.max_per_pipe_ib;
> > > > -	}
> > > > +	if (kms->perf.fix_core_ib_vote)
> > > > +		peak_bw = kms->perf.fix_core_ib_vote;
> > > >    	avg_bw /= kms->num_paths;
> > > > @@ -275,12 +259,9 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> > > >    	struct drm_crtc *crtc;
> > > >    	struct dpu_crtc_state *dpu_cstate;
> > > > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
> > > > +	if (kms->perf.fix_core_clk_rate)
> > > >    		return kms->perf.fix_core_clk_rate;
> > > > -	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
> > > > -		return kms->perf.max_core_clk_rate;
> > > > -
> > > >    	clk_rate = 0;
> > > >    	drm_for_each_crtc(crtc, kms->dev) {
> > > >    		if (crtc->enabled) {
> > > > @@ -396,54 +377,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> > > >    #ifdef CONFIG_DEBUG_FS
> > > > -static ssize_t _dpu_core_perf_mode_write(struct file *file,
> > > > -		    const char __user *user_buf, size_t count, loff_t *ppos)
> > > > -{
> > > > -	struct dpu_core_perf *perf = file->private_data;
> > > > -	u32 perf_mode = 0;
> > > > -	int ret;
> > > > -
> > > > -	ret = kstrtouint_from_user(user_buf, count, 0, &perf_mode);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > > -	if (perf_mode >= DPU_PERF_MODE_MAX)
> > > > -		return -EINVAL;
> > > > -
> > > > -	if (perf_mode == DPU_PERF_MODE_FIXED) {
> > > > -		DRM_INFO("fix performance mode\n");
> > > > -	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
> > > > -		/* run the driver with max clk and BW vote */
> > > > -		DRM_INFO("minimum performance mode\n");
> > > > -	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
> > > > -		/* reset the perf tune params to 0 */
> > > > -		DRM_INFO("normal performance mode\n");
> > > > -	}
> > > > -	perf->perf_tune.mode = perf_mode;
> > > > -
> > > > -	return count;
> > > > -}
> > > > -
> > > > -static ssize_t _dpu_core_perf_mode_read(struct file *file,
> > > > -			char __user *buff, size_t count, loff_t *ppos)
> > > > -{
> > > > -	struct dpu_core_perf *perf = file->private_data;
> > > > -	int len;
> > > > -	char buf[128];
> > > > -
> > > > -	len = scnprintf(buf, sizeof(buf),
> > > > -			"mode %d\n",
> > > > -			perf->perf_tune.mode);
> > > > -
> > > > -	return simple_read_from_buffer(buff, count, ppos, buf, len);
> > > > -}
> > > > -
> > > > -static const struct file_operations dpu_core_perf_mode_fops = {
> > > > -	.open = simple_open,
> > > > -	.read = _dpu_core_perf_mode_read,
> > > > -	.write = _dpu_core_perf_mode_write,
> > > > -};
> > > > -
> > > >    /**
> > > >     * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
> > > >     * @dpu_kms: Pointer to the dpu_kms struct
> > > > @@ -472,8 +405,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> > > >    			(u32 *)&perf->perf_cfg->min_llcc_ib);
> > > >    	debugfs_create_u32("min_dram_ib", 0400, entry,
> > > >    			(u32 *)&perf->perf_cfg->min_dram_ib);
> > > > -	debugfs_create_file("perf_mode", 0600, entry,
> > > > -			(u32 *)perf, &dpu_core_perf_mode_fops);
> > > >    	debugfs_create_u64("fix_core_clk_rate", 0600, entry,
> > > >    			&perf->fix_core_clk_rate);
> > > >    	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > index 5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d..9d8516ca32d162b1e277ec88067e5c21abeb2017 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > @@ -24,20 +24,11 @@ struct dpu_core_perf_params {
> > > >    	u64 core_clk_rate;
> > > >    };
> > > > -/**
> > > > - * struct dpu_core_perf_tune - definition of performance tuning control
> > > > - * @mode: performance mode
> > > > - */
> > > > -struct dpu_core_perf_tune {
> > > > -	u32 mode;
> > > > -};
> > > > -
> > > >    /**
> > > >     * struct dpu_core_perf - definition of core performance context
> > > >     * @perf_cfg: Platform-specific performance configuration
> > > >     * @core_clk_rate: current core clock rate
> > > >     * @max_core_clk_rate: maximum allowable core clock rate
> > > > - * @perf_tune: debug control for performance tuning
> > > >     * @enable_bw_release: debug control for bandwidth release
> > > >     * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
> > > >     * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
> > > > @@ -47,7 +38,6 @@ struct dpu_core_perf {
> > > >    	const struct dpu_perf_cfg *perf_cfg;
> > > >    	u64 core_clk_rate;
> > > >    	u64 max_core_clk_rate;
> > > > -	struct dpu_core_perf_tune perf_tune;
> > > >    	u32 enable_bw_release;
> > > >    	u64 fix_core_clk_rate;
> > > >    	u32 fix_core_ib_vote;
> > > > 
> > 

-- 
With best wishes
Dmitry
