Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CB9F8A1F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 03:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04B110EE42;
	Fri, 20 Dec 2024 02:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W2nTvLLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A6C10EE3B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 02:32:39 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-303548a933aso11208151fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734661958; x=1735266758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wikVcC8YwP43NyawYqahXbzGX/uRVSr7BgXqLVuUyoI=;
 b=W2nTvLLx3uCcoX13TZ5cuNtp8wdVP/5lT7XoXL3mPFjyt+1rJBsvaI8gf8iRpgzMcQ
 3iX+82GZ4QBhaV4wHGfH0C2IgqMXp7ESnymjSalKomsumdfyrptvKuHMf+Ib2ywGscYi
 6vhVakALzNw+vfgpKdeKUyHnpps6iwBokf/6zzB/KG21SjdxeVvDD8HJV8CX5ulHc4Ax
 9W6R5JMZEpbswm301+OYDWifBgatbPtv7hDiNjey81Ww9I18G20Dh7LlYWyBMG0orPdK
 /sODZl4m04Nv7npGE9ihkXY6diHAczJViiHdtl5K+tNRAftocqoR+ju15ibEg+bfhoTo
 9cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734661958; x=1735266758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wikVcC8YwP43NyawYqahXbzGX/uRVSr7BgXqLVuUyoI=;
 b=jlM8hM4AvmOQ1i2IA+OhacPkNp4h3bsNKP8GFHMAAIAyDy8Vj1K0yk9cm3SPzpMwf8
 U/S7XNx0Ds3zgRymBdhkYqk5Mhhq+w1JMvrZ8JZNPEDt9jBJlRtr9UNKbk+hVsTaKr8v
 XtpUdQWQ13uuVOaFfkQr4zZ9jNGGcEXDjLwvBVx+5YqmEKf7W85jbItH1KTUhkul4oVL
 r3F6s/AHBp1x55JSaxBKJ+zrd60fMmKnTnQetkf57JIF+alXXBKUhSuOi5YMOk5cLrxb
 3o79J75JN/pqFN2Ih69wS/orspjesI8Isw1ogCqKQ335IOF9pZLx9wN50WJAcyCwm7Yn
 Idcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1RJLOXoAHFZxrn3un0LmOF9zqi3M9zrHTdaIfd1jfARimNpmCMMzlMPlKJ/k8ZAUjgw6kiHPUnsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYYnaE4Oap4BicfrpF6pPVjvyDPelO5s+sfAfemZtWff+XxfN+
 1iB2L/nTkzwUuIV14i5c4DXwlbizoBU4sQEkjaZdQT0HlFIpnjAOQYmIz/020Gk=
X-Gm-Gg: ASbGncu48eLI+gQhCUYNIqT6f46Alr0trXW5FBRxNzARdlsJg5/HL6d2LlOrXgYY3ur
 rXUOYJxd73WD7vACOZCYM82OSafAClPk2GIXB+S6sDez3fSuJoYC8KBhdUrfnKycxe23Q9x11YN
 CSdrp54CqAuZ7eg72MR3EmrJUEQX0D8ioRSExxhYrP4Jp7EbQinwaNMPBdD7oL9mURwdOtXV/Tt
 VCcDyIIHys2ixMBEEx231/uCsr+mYb0DDwto5yVjxSqu6ADmf8uo6ws1fILz6FBH1yxFrd2Cgu7
 lFwRMFn0jVH91GzhTc6nb6Ar/2AaCjk8Gihg
X-Google-Smtp-Source: AGHT+IHeePIRvRlTa0WzSJOEaRbNYDGB0kZScBMguM6RwOqMwsGDgUW7Iqn7n7S3fRfyoGyLByO5pA==
X-Received: by 2002:a2e:be8e:0:b0:300:3a15:8f23 with SMTP id
 38308e7fff4ca-304685198eemr3702051fa.7.1734661957805; 
 Thu, 19 Dec 2024 18:32:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cad7sm3857071fa.9.2024.12.19.18.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:32:36 -0800 (PST)
Date: Fri, 20 Dec 2024 04:32:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 07/25] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <y2qtp2avw7hjkweh3svfwr6ytvg54lmhqiowfjeiufnyhxiryw@vb4mwnyi2ict>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
 <b329e872-3e1e-45e3-bff6-bf6ad2c11144@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b329e872-3e1e-45e3-bff6-bf6ad2c11144@quicinc.com>
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

On Mon, Dec 16, 2024 at 05:47:50PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/16/2024 4:43 PM, Jessica Zhang wrote:
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
> > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 256 ++++++++++------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
> >   3 files changed, 181 insertions(+), 169 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 9f6ffd344693ecfb633095772a31ada5613345dc..186ed84f59f16997716fe216e635b8dce07a63a1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1182,6 +1182,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> >   	return false;
> >   }
> 
> <snip>
> 
> > +static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
> >   {
> > -	struct dpu_crtc_state *cstate;
> > -	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > -	int num_lm, num_ctl, num_dspp, i;
> > -
> > -	cstate = to_dpu_crtc_state(crtc_state);
> > -
> > -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > -
> > -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> > -		ARRAY_SIZE(hw_dspp));
> > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > +	u32 num_intf = 0;
> > +	u32 num_dsc = 0;
> > +	int i;
> > -	for (i = 0; i < num_lm; i++) {
> > -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > +	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> > +		if (dpu_enc->phys_encs[i])
> > +			num_intf++;
> > -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > -		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> > -	}
> > +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > +	if (dpu_enc->dsc)
> > +		num_dsc += 2;
> 
> As we requested in v3, can you please explain why we have num_dsc +=2
> instead of just num_dsc = 2? If we are hard-coding 2:2:1, this should be
> just num_dsc = 2.

I'll drop it while applying a first part of the series. Granted that
num_dsc is initialized to 0 few lines above, it should be fine.

If later there is a need to change the lane, it can be done in a
consequent patch.


-- 
With best wishes
Dmitry
