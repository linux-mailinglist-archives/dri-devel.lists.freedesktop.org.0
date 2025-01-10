Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D3A0851A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FEC10EF87;
	Fri, 10 Jan 2025 02:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nMZqQVFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2C810EF87
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:02:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so1395317e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 18:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736474545; x=1737079345; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IistZR9U1Esc/jSmKmQKS5mSqzf1yAZIWNOXNclkVNI=;
 b=nMZqQVFAj5g8KZHD27Fdidyz+pNZ7xL02O4F5Qr/lVn32GR2jtF17GTqluZBQl7atX
 jmx/HtuKcOnTfbXZ3vnbwxC0clCkzt7MLaa7VdMnjgMit/5Qz1rvJY40n7tipLDYFZye
 FmLGJB/0JjAroapAOWArbDafBh6eMTHxn4slZQuR1SeK5Ka8fR9hVdkFy9H3FYa7/4QW
 ES8yNWpgjB0n5+lqY0DGL0Bn9SvMt+a49GCbJ31qcaXOqv49UQjAlHzlX3C/D9lYNKAH
 d5ErzHJ13iVAEZEMjBHCUzE1XKSOfw2ZK+OdvfjEPcaeBi24yMLfYY/I8wOUQEQFB2NO
 BFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736474545; x=1737079345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IistZR9U1Esc/jSmKmQKS5mSqzf1yAZIWNOXNclkVNI=;
 b=fVvO6bX+X0l1RvwNuCIICx7Q5qSvtTFflBze/+pRD6WNuM2J/C0BUqPg5+UuTY8+gU
 cHSL0AcWxanY5mec3KjeYBjhm1GrIMqMd3ZnKRzWA+KWK9mpgJCuVDPFrKIVpevWZN9v
 zNe2prUPtxgdIPalt7IxSM/Ho6bY+4RnnisTtFZxlvEXmDiKocmASxSjKE4xl6IbMJ3y
 8+mG+/mIY66bBbV3ooEmcQh/Xnsa8sqvuRgXlSEWl8TnILenhaOdHMeTdN4ZjKmFSQ9w
 DAEQgr2siCwk/l46NN3eTH+0uc+13Oh50R8EL4HA+9HeIYHh5iKe339+3fzJXDXbud+G
 mslg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDQ8f9BZiGwAvx9urU5IdQtqxG73Oz+KBgJ+gen4qxC1huwih8kKAm9aEuOC2iwMgm/NQ9fIIwB/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl2ZwFaNrtORMeM3gyreVmtTi8Hmp4AKP4rriEsnZAU/e4h+lO
 UrxRDAEeX3oZo1YtIfp8VIKucGlaKGeCivc8pxVjcat8N2Kbhf1dVwts9aRhu9c=
X-Gm-Gg: ASbGnct++95T655c1nO2CX5EmQUvE07cU2olw/y3OZ33bx4BW8hzNXDcAuHF1yT+6LK
 CAt8x7azDN5YBz/HRLk9z8b4bbx2yaYTpC3ApCfk6bq9AWp4drd6+hTn2bwiJF+p8owGldkbAI1
 nFg8XtAC63WGOgGyXBECTv7xLShiVFSPiR5bUyw5RXlyGDCR6BDz/a69T+ayWs8uedGYpEjVY2n
 vtQ7VG06HCcXRyh51Vr+FYLjRo9rq+FVxTYbhk1tD9u1i2cGctVIexAKyFaKI2AXrko/DVSwRUp
 t7bUN8/xJuSUyw04Zhnzv+Bs+RFVANsS+E0x
X-Google-Smtp-Source: AGHT+IGZaXEzsNU48TlmzwrK1r4jXywYY4XA2tgLFhAYXAdj17LoYLX0rPRCpKNsxJKPndLhECZQug==
X-Received: by 2002:a05:6512:3994:b0:542:29a6:a063 with SMTP id
 2adb3069b0e04-542847f9de7mr2929382e87.43.1736474544784; 
 Thu, 09 Jan 2025 18:02:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6ab4sm360947e87.145.2025.01.09.18.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 18:02:23 -0800 (PST)
Date: Fri, 10 Jan 2025 04:02:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent
 with fix_core_ib_vote
Message-ID: <sklr3ryu35xmoejkmbu35d3jxsg2clk3whmzslxtzcbcb3gjy4@bmcivlzkxqa3>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
 <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>
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

On Thu, Jan 09, 2025 at 05:40:23PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> > The fix_core_ab_vote is an average bandwidth value, used for bandwidth
> > overrides in several cases. However there is an internal inconsistency:
> > fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
> > in Bps.
> > 
> > Fix that by changing the type of the variable to u32 and using * 1000ULL
> > multiplier when setting up the dpu_core_perf_params::bw_ctl value.
> > 
> 
> Actually after looking at this, I have another question.
> 
> How did you conclude that fix_core_ib_vote is in KBps?
> 
> min_dram_ib is in KBps in the catalog but how is fix_core_ib_vote?
> 
> It depends on the interpretation perhaps. If the debugfs was supposed to
> operate under the expectation that the provided value will be pre-multiplied
> by 1000 and given then that explains why it was not multiplied again.
> 
> And I cross-checked some of the internal usages of the debugfs, the values
> provided to it were in Bps and not KBps.

Well... As you wrote min_dram_ib is in KBps. So, by comparing the next
two lines, fix_core_ib_vote should also be in kBps, as there is no
premultiplier:

                perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
[...]
                perf->max_per_pipe_ib = perf_cfg->min_dram_ib;

And then, as a proof, perf->max_per_pipe_ib is passed to icc_set_bw()
without any modifications:

                icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);


> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >   		perf->max_per_pipe_ib = 0;
> >   		perf->core_clk_rate = 0;
> >   	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -		perf->bw_ctl = core_perf->fix_core_ab_vote;
> > +		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> >   		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> >   		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> >   	} else {
> > @@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >   			&perf->fix_core_clk_rate);
> >   	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
> >   			&perf->fix_core_ib_vote);
> > -	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
> > +	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
> >   			&perf->fix_core_ab_vote);
> >   	return 0;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -51,7 +51,7 @@ struct dpu_core_perf {
> >   	u32 enable_bw_release;
> >   	u64 fix_core_clk_rate;
> >   	u32 fix_core_ib_vote;
> > -	u64 fix_core_ab_vote;
> > +	u32 fix_core_ab_vote;
> >   };
> >   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> > 

-- 
With best wishes
Dmitry
