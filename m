Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E2AA00E07
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 19:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CDE10E33A;
	Fri,  3 Jan 2025 18:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jYdRGASz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C03510E33A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 18:47:18 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-304d760f12aso15155421fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 10:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735929976; x=1736534776; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CEJ8oonqtcvJ6IAkiqfllwsDWGyyWC08rfpdJ62V49g=;
 b=jYdRGASzmhD4YzspUc9WjxOM6fAhWPaAqaBD2H8jAQKUvMtJJGPZh9Dx/LBM6415CT
 4pLzGtYGoGGTF3WyHHbWLxZSvTKEVFUql1Dcz0UlvgSvtTXAihvaFzB/ezE+7YHaiCIF
 aczVxPT9T/hx/V9KRExSKSXyr4tCG1KcW/j40wPVrPSMWQ6S2JvfMC7DHWSRf6BjudIc
 CihsbPBEP3jZ9Q081SsAKfaO/7PPeRFYeovyRwpFslyvqxsh8XTbqnRgmQTY7SLzGLO+
 8OVuoOY3ibmD5nDsFBv+tn6Tm1+c7eI4bWhEZmQDSTzc6vGsDRp7psyWD/F+Ml/SFF0D
 xMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735929976; x=1736534776;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CEJ8oonqtcvJ6IAkiqfllwsDWGyyWC08rfpdJ62V49g=;
 b=pRMe4S3CQB2tjjeedZ6MtiBFfWHloAAuqcTmikBxwK20tjZ2V/oTW8v9M9eORTDuPc
 10wAQJLRLFWbgXxKfeAhqh9qqR0569jOkGnvbFwOWbZUenzJr37JOlJS78NFgENBtCqe
 41NNBCJsCJwX9J6z+PqdvDUdU2zo8yqrBrf9gtrEg+ZMHC70YA2K7S1rW2Qt2LV1kJ82
 OCA9cpeBg9QaZwQ6tJIdPrcNhObP6XBMeciTUtSoQFD4TUAL/pzjwPZhrGC3U+g3vTBK
 RbY5MliNpiDyOMDHMobQ5hA2mc0imWuqtctLJkMD+icO20GhmOHVytNtM08eWlup/j1J
 g1NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhPR/tX+YRNwN2jgh9wv7v0dFdHSuhCsQqpurayWxayxmUQj4mDnwkaZvomMmPALnywFaOGLGHZhw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt+n3KFZfCm1zvBa25hrM1F/O5Uj/9H37+KdtU4K0SzCiRoWx/
 yVaGwTT6SCyYamhheIgdYjpcx32UA6zH7+4EtaEuI4uxewquazsCloOPS4fadjQ6uk5JChJpQNU
 ziDA=
X-Gm-Gg: ASbGnctm/bo2ye+SlrTYwAeEVVl7iFNl85h/6u8XeWJdRRpEes6hhrxqDHBZAt/+1qA
 SY2A7HwYDg6yfZ2rNumPMIh8zYMUP461rS2g1W6kj0OE/xx4mcuKddO0mIMpVDYEBNObLD9LBaW
 4/dcXjnrwQpqEiitn/2W0fW5vXaOfsPBdzETjnzGNiAtpfnfMbJY+ROL49lPoHS2OhVylONWVu5
 aYw94h4MtXAXbl1S366qlqFUmhL+K9vGyaMoCsDkj7WbiqxRoBsOg1/rTSNmcSX5TpeJuTXeVJR
 qezVeXz/qwefDzB4uwObP/sU8ZV2K+9SxwEn
X-Google-Smtp-Source: AGHT+IEvvepfOBU+EsQDIAwIOdIqeI1ZlSV0iPdxp215z+zkJx6XJtR+bJJEVpMxCwPG4qFEfl+uKQ==
X-Received: by 2002:a05:6512:23a0:b0:540:75d3:95a4 with SMTP id
 2adb3069b0e04-54229538b24mr15437986e87.17.1735928191141; 
 Fri, 03 Jan 2025 10:16:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813692sm4128190e87.125.2025.01.03.10.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:16:29 -0800 (PST)
Date: Fri, 3 Jan 2025 20:16:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <a4akor2liqafta53zeev22x2pkqwzo5szwidr2ruzdvttvze5h@jtio3jue7ez3>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
 <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
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

On Fri, Jan 03, 2025 at 10:03:35AM -0800, Jessica Zhang wrote:
> 
> 
> On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> > > Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> > > to account for concurrent writeback
> > 
> > Why?
> 
> Hi Dmitry,
> 
> This flag is necessary to specify that CWB mux(es) need to be assigned for
> the given reqeusted topology.

Why is necessary? Please rephrase your statement (we need foo bar, so do
baz).

> 
> > 
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
> > >   3 files changed, 20 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> > >   					    &crtc_state->adjusted_mode);
> > > +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> > > +
> > >   	/*
> > >   	 * Datapath topology selection
> > >   	 *
> > > @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > >   	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > >   	 *
> > >   	 * Add dspps to the reservation requirements if ctm is requested
> > > +	 *
> > > +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> > > +	 * enabled. This is because in cases where CWB is enabled, num_intf will
> > > +	 * count both the WB and real-time phys encoders.
> > > +	 *
> > > +	 * For non-DSC CWB usecases, have the num_lm be decided by the
> > > +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
> > >   	 */
> > > -	if (topology.num_intf == 2)
> > > +	if (topology.num_intf == 2 && !topology.cwb_enabled)
> > >   		topology.num_lm = 2;
> > >   	else if (topology.num_dsc == 2)
> > >   		topology.num_lm = 2;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
> > >   	int i = 0, j, num_ctls;
> > >   	bool needs_split_display;
> > > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > > -	num_ctls = top->num_intf;
> > > +	/*
> > > +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> > > +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> > > +	 */
> > 
> > Why?
> 
> This is because num_intf is based on the number of phys_encs. Since in the
> CWB case, the WB and real-time encoders will be driven by the same CTL. I
> can add this to the comment doc.

Why are they driven by the same CTL? Is it also the case for platforms
before DPU 5.x?

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > +	if (top->cwb_enabled)
> > > +		num_ctls = 1;
> > > +	else
> > > +		num_ctls = top->num_intf;
> > >   	needs_split_display = _dpu_rm_needs_split_display(top);
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > @@ -46,6 +46,7 @@ struct dpu_rm {
> > >    * @num_dspp:     number of dspp blocks used
> > >    * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> > >    * @needs_cdm:    indicates whether cdm block is needed for this display topology
> > > + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
> > >    */
> > >   struct msm_display_topology {
> > >   	u32 num_lm;
> > > @@ -53,6 +54,7 @@ struct msm_display_topology {
> > >   	u32 num_dspp;
> > >   	u32 num_dsc;
> > >   	bool needs_cdm;
> > > +	bool cwb_enabled;
> > >   };
> > >   int dpu_rm_init(struct drm_device *dev,
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry
