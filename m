Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E5A11C48
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0F510E4E9;
	Wed, 15 Jan 2025 08:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dlfzgOMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093910E566
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 08:43:29 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54263b52b5aso6605588e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 00:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736930548; x=1737535348; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lZk/iR/++ahrsJFkMAeCydXncYIA/yDJCJs2b060X04=;
 b=dlfzgOMgOPZxITpLlG8/dI+0fxN+CjjqglluTfJKyTSktXee/J4qQ0IA4owetcnbRE
 Q9e2fYcZcmatcjN7K4tmyqQ6+saxwfXVUQMRTS27DfRAVntjhdve7gs/s9OJ3js0NZgG
 VMk6awY6vJAQbRtPYIWPTVBaxpY1huUBkpYCeUlN9wcXzK4ZWbpU9ns/rtGXJ9GhO7pz
 zTZk7eX2O0BCHBueq2VHhHhKU/I2md29B46UJW8NetcyKvy7KqyiMLcnnWvh7+dLfPYg
 JEVnAa2o2VW+32bXNfoDJgakNCccbD2n/mN9KZoW+iiUnGJTS4jdw3QAEqLuCMdoxkF4
 fNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736930548; x=1737535348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZk/iR/++ahrsJFkMAeCydXncYIA/yDJCJs2b060X04=;
 b=J+QfpATPzXOPC3Dc7m8016ahCLgU8l1m5ag/OyqDYvtXB23+Ij7qD4q0mU6Waet5uq
 BOW79/C1b0JsxBtVJUbZP3wpkHn/Qj5b6vOMrQOf7OuYlUcGNb6iDYYoLS3FsaUyVjuv
 Y0FgB7LNq7DEScI7tYIzhB/hBgw5ezMDjNsrRknsWLwk0BUGktvJOwQrsTjS3/7O4jEO
 hrO/Vg+LQ1eAN2NPV/9nR25jcQbO9wDXAYVcocsNwVPOoWtuTko0MSe2OCI1IO30NeQ9
 zvmib5P7EUXT1ZPPI5hIEcoP/1R91GxfEgU/scJRIGPCVe34rZuDsamY6d84VbrFBMOn
 c+UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUF/dMAsKhQgCmSp/t3M16gLh71EglBzLxRS9l5IR65ME1ky/2PPASOTlI1Q7Avkx6x20dqnSP9Us=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJfhNUy7IFkZrN7UaW7/uFts1chiNgcnUTsRqSfaFSgKYe+YvW
 Prq43OIolyNWA/mInmSdUFwLj2w6T290G1Z/jzpuqKUwyy0iEPtD4mVjdFvScvE=
X-Gm-Gg: ASbGncsRjtx96CgKjQ9kGfa13rVqGSq4pg6UgZq2yt+9cWeJu8yU2kpii1O0FL/Q06H
 XFkLyrcqcZJ0/CB+WRt8Oc18eRjBFVtQn6MCsXG9UFVANU71kRKK78Ks3ZM044A3cIPwQ7B68Vu
 +K/XuPOvFsXKODUFxihAcU0injtYz5usNFQnfWBmQ+OWY6dqQw9ch3BCmCiQCHbgF9UBZhhHbPF
 /FcPj1XHKwIBsOLBD2FlVPxvSk9JewV/W6/EZs3y8jnal8C9SzbNRgQJIcvR8Vpen7DARgeoGsx
 6nrAXM0MJ2sBf341QRBclo8pcFjbSyNhAMLY
X-Google-Smtp-Source: AGHT+IHxu2bWsq5LOpgqWeFg+x5QNIImak2VP0xFnPhyWJs6nSmCqpRMYEK49XiKqJfZCWCXlCW9lw==
X-Received: by 2002:a05:6512:a8e:b0:542:2990:722e with SMTP id
 2adb3069b0e04-542845ba7b6mr9152754e87.15.1736930548306; 
 Wed, 15 Jan 2025 00:42:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7bd4sm20361321fa.80.2025.01.15.00.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:42:27 -0800 (PST)
Date: Wed, 15 Jan 2025 10:42:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 9/9] drm/msm/dpu: drop
 dpu_core_perf_params::max_per_pipe_ib
Message-ID: <5wmq4j2wh4eflsqanfladxh3wnbqcmxfezvxfs6kwmfu4iw5mi@rnemw3o52qkx>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-9-00b248349476@linaro.org>
 <0fcc05ba-a126-4214-8a3d-9586cd5e8d88@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fcc05ba-a126-4214-8a3d-9586cd5e8d88@quicinc.com>
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

On Tue, Jan 14, 2025 at 04:53:10PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > The max_per_pipe_ib is a constant across all CRTCs and is read from the
> > catalog. The override value is also applied at the
> > _dpu_core_perf_crtc_update_bus() time. Drop corresponding calculations
> > and read the value directly at icc_set_bw() time.
> > 
> > Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 16 ++++------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
> >   3 files changed, 4 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 913eb4c01abe10c1ed84215fbbee50abd69e9317..62dab5883513dc570076da5a64e32e502dd4320b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -105,12 +105,10 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >   	}
> >   	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > -	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> >   	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >   	DRM_DEBUG_ATOMIC(
> > -		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
> > +		"crtc=%d clk_rate=%llu core_ab=%u\n",
> >   			crtc->base.id, perf->core_clk_rate,
> > -			perf->max_per_pipe_ib,
> >   			(u32)DIV_ROUND_UP_ULL(perf->bw_ctl, 1000));
> >   }
> > @@ -126,9 +124,6 @@ static void dpu_core_perf_aggregate(struct drm_device *ddev,
> >   		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
> >   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
> > -			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> > -						    dpu_cstate->new_perf.max_per_pipe_ib);
> 
> During the enabled cases, this is fine since even if one crtc is enabled,
> its going to use the same value.
> 
> During disable to enable and enable to disable transitions, we do need to
> make it 0 right?

Good point, I will check that later.

> 
> OR if its already being made 0, we need to make sure it gets updated by
> forcing update_bus to true?
> 
> Is this part being handled by this block dpu_core_perf_crtc_update()?
> 
>         } else {
>                 DRM_DEBUG_ATOMIC("crtc=%d disable\n", crtc->base.id);
>                 memset(old, 0, sizeof(*old));
>                 update_bus = true;
>                 update_clk = true;
>         }
> 
> Please confirm this, I am fine with this change otherwise.
> 
> > -
> >   			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
> >   			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> > @@ -204,7 +199,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >   	avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > -	peak_bw = perf.max_per_pipe_ib;
> > +	peak_bw = kms->catalog->perf->min_dram_ib;
> >   	if (kms->perf.fix_core_ab_vote)
> >   		avg_bw = kms->perf.fix_core_ab_vote;
> > @@ -315,15 +310,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >   		 * 2. new bandwidth vote - "ab or ib vote" is lower
> >   		 *    than current vote at end of commit or stop.
> >   		 */
> > -		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
> > -			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
> > -			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
> > -			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
> > +		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
> > +		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
> >   			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
> >   				crtc->base.id, params_changed,
> >   				new->bw_ctl, old->bw_ctl);
> >   			old->bw_ctl = new->bw_ctl;
> > -			old->max_per_pipe_ib = new->max_per_pipe_ib;
> >   			update_bus = true;
> >   		}
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index 9d8516ca32d162b1e277ec88067e5c21abeb2017..863a6fc1f30c21cf2030a30be5fe62b024b3b820 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -14,12 +14,10 @@
> >   /**
> >    * struct dpu_core_perf_params - definition of performance parameters
> > - * @max_per_pipe_ib: maximum instantaneous bandwidth request
> >    * @bw_ctl: arbitrated bandwidth request
> >    * @core_clk_rate: core clock rate request
> >    */
> >   struct dpu_core_perf_params {
> > -	u32 max_per_pipe_ib;
> >   	u64 bw_ctl;
> >   	u64 core_clk_rate;
> >   };
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index ac3c6c5ad1cec3856f0eff2ed71153d3c2dc279e..cc240d3c7faa89254a575237634d0d0fa8f04f73 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1488,8 +1488,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
> >   			dpu_crtc->cur_perf.core_clk_rate);
> >   	seq_printf(s, "bw_ctl: %uk\n",
> >   		   (u32)DIV_ROUND_UP_ULL(dpu_crtc->cur_perf.bw_ctl, 1000));
> > -	seq_printf(s, "max_per_pipe_ib: %u\n",
> > -				dpu_crtc->cur_perf.max_per_pipe_ib);
> >   	return 0;
> >   }
> > 

-- 
With best wishes
Dmitry
