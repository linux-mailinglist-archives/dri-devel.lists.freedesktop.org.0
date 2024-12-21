Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061429F9D9C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2024 02:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0351E10E17B;
	Sat, 21 Dec 2024 01:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uxdBbqj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0D210E2D5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 01:07:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53f757134cdso2604485e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 17:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734743263; x=1735348063; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/+7G4IHljTETR8bE0VtNLCjpoBtoZ9G63QmTUV7xWF4=;
 b=uxdBbqj3oHupKx0waUdM4wIx8BiDDMrHP+H7QIME7gtaygz8mJwRYgwEu3GGr7yUrX
 YeHe0BuuhF//TOg/z++/eFCm1Wsap76zk7vYsSvVjE2xaTof8DQJsB2D0RDCUhJGd2E+
 nieTO9reT+iH5Ie7K0sWp4O0t700/6A8ovTJzG1WMGbommJiy4ONuuYEshc/2FSpk5+f
 TPotaNWk9/dUY/0MU02hjDF0OR6i2xhN55pvE7temW0nE3Ga2IOAa7oWGhrTwSD+OwDb
 LYrJY2jCn+vh+iLDBJ1dw9GuTMNkqg/z/hG3R9UbWt9IP6qVm3JbXoZbuR1XFIIIdPBu
 sESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734743263; x=1735348063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+7G4IHljTETR8bE0VtNLCjpoBtoZ9G63QmTUV7xWF4=;
 b=pKrgBvxguKuUKlZdHfZgdWi8deGMtarEE6DJ3Cuxjj/eSLp036sGa+nEWs8NOjfIcI
 umGPbninRGmuAKj6qaL39OI258zjAbcpZooHt+JAW8rg3kTsjvZc5AD7TGr9obOipW/f
 Azg5kwU2f+9lPaw9TCh5he0pzb+gsQA94w17/vdIjBiuxD1VXssfTy2Tu3jKfDfIgWAM
 BD/WO2xLkJSxeLHLwPLpsYiHZM8hF03Dje6RPFMQF3hGL2KzpDCWq+VuH4aTUt0mZnvE
 cZnLvNUVv19lmpecVbEQIqi/mgo11URlxGmVAuFPozRGC/zND1YTWMdkBe5tUCSEqg9p
 n2QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAGMR+holHSfAtErUcO697tgqhwy2JOjErrZPwGgasGr4TDkh3k12pnPF4pII+INhheNcJSiUyO3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5tZw5Mr/ohEJtN46KtwbnBoORpoSKlCRGH/T+3/RN3FCPMMA1
 02D622/bmJeQh8sj0Op84IEzwsGlY3duvxm3Mcsi+S5HLTFpvBNe1D9hhtIgDFQ=
X-Gm-Gg: ASbGncvqBbkztAyOyjSZMimtyvKg9eiTTqikmqSfgwkyT1jUGCB3ocYJyXYMJRxZl4i
 GwFz7WE34RtuTorrCijhg8axUAyY4AggWiPjWPD2OM2XbzpfLsrDBZRGEgf1YmD73l+bTiJpHSs
 2qQSETiH27S5BUa6Mb8d9fHPNoHr034F3pqRGR/vflw4EV2uq2AfapKPkyG0MOsWs4cOsxPsJsy
 F2nFfy0ZZnmbgNbzK7vOD4UAj+AZX6NYWI6TVn1ZCunUwFkBVFJo0AdQkgIqYcBDwTfOiqNyPgh
 Vx7G+ijlAhfHAzSc84kBbBatTTbflEjn//St
X-Google-Smtp-Source: AGHT+IF8i0Dd2tY3e50AnNMcVZtNH2PLFkUDcYAKXpkwMPi9A4Ahu8JUjvQXGx/LHzOxS9pZ7CAW0Q==
X-Received: by 2002:a05:6512:1387:b0:53e:3804:57ae with SMTP id
 2adb3069b0e04-5422957ac55mr1953127e87.51.1734743263047; 
 Fri, 20 Dec 2024 17:07:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382156dsm596890e87.186.2024.12.20.17.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 17:07:41 -0800 (PST)
Date: Sat, 21 Dec 2024 03:07:39 +0200
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
Subject: Re: [PATCH v4 18/25] drm/msm/dpu: Reserve resources for CWB
Message-ID: <pp2uifxzgqmg3ske3mmlgznzb76eovxvgv6y6kfafk5wvoq3ou@5x7bwdkipius>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-18-fe220297a7f0@quicinc.com>
 <z6pebzm5yxaqqmktu4jjjy4rojkdarrqrwo4ikmv6jzku7foyf@cc325q3dfgif>
 <ddd1db49-39d8-44b6-b658-b30fe8ba4428@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddd1db49-39d8-44b6-b658-b30fe8ba4428@quicinc.com>
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

On Fri, Dec 20, 2024 at 04:12:29PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/19/2024 9:52 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 04:43:29PM -0800, Jessica Zhang wrote:
> > > Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> > > 
> > > For concurrent writeback, even-indexed CWB muxes must be assigned to
> > > even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> > > even/odd rule applies for dedicated CWB PINGPONGs.
> > > 
> > > Track the CWB muxes in the global state and add a CWB-specific helper to
> > > reserve the correct CWB muxes and dedicated PINGPONGs following the
> > > even/odd rule.
> > > 
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 83 +++++++++++++++++++++++++++++
> > >   4 files changed, 116 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index a895d48fe81ccc71d265e089992786e8b6268b1b..a95dc1f0c6a422485c7ba98743e944e1a4f43539 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -2,7 +2,7 @@
> > >   /*
> > >    * Copyright (C) 2013 Red Hat
> > >    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> > > - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > >    *
> > >    * Author: Rob Clark <robdclark@gmail.com>
> > >    */
> > > @@ -28,6 +28,7 @@
> > >   #include "dpu_hw_dsc.h"
> > >   #include "dpu_hw_merge3d.h"
> > >   #include "dpu_hw_cdm.h"
> > > +#include "dpu_hw_cwb.h"
> > >   #include "dpu_formats.h"
> > >   #include "dpu_encoder_phys.h"
> > >   #include "dpu_crtc.h"
> > > @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
> > >    * @cur_slave:		As above but for the slave encoder.
> > >    * @hw_pp:		Handle to the pingpong blocks used for the display. No.
> > >    *			pingpong blocks can be different than num_phys_encs.
> > > + * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
> > > + *			display. Number of CWB muxes can be different than
> > > + *			num_phys_encs.
> > >    * @hw_dsc:		Handle to the DSC blocks used for the display.
> > >    * @dsc_mask:		Bitmask of used DSC blocks.
> > >    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> > > @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
> > >   	struct dpu_encoder_phys *cur_master;
> > >   	struct dpu_encoder_phys *cur_slave;
> > >   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> > > +	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> > >   	unsigned int dsc_mask;
> > > @@ -1138,7 +1143,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
> > >   	int num_pp, num_dsc, num_ctl;
> > > +	int num_cwb = 0;
> > > +	bool is_cwb_encoder;
> > >   	unsigned int dsc_mask = 0;
> > >   	int i;
> > > @@ -1152,6 +1160,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	priv = drm_enc->dev->dev_private;
> > >   	dpu_kms = to_dpu_kms(priv->kms);
> > > +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> > > +			dpu_enc->disp_info.intf_type == INTF_WB;
> > >   	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > >   	if (IS_ERR_OR_NULL(global_state)) {
> > > @@ -1162,9 +1172,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	trace_dpu_enc_mode_set(DRMID(drm_enc));
> > >   	/* Query resource that have been reserved in atomic check step. */
> > > -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > > -		ARRAY_SIZE(hw_pp));
> > > +	if (is_cwb_encoder) {
> > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_DCWB_PINGPONG,
> > > +						       hw_pp, ARRAY_SIZE(hw_pp));
> > > +		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_CWB,
> > > +						       hw_cwb, ARRAY_SIZE(hw_cwb));
> > > +	} else {
> > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > +						       drm_enc->crtc,
> > > +						       DPU_HW_BLK_PINGPONG, hw_pp,
> > > +						       ARRAY_SIZE(hw_pp));
> > > +	}
> > > +
> > > +	for (i = 0; i < num_cwb; i++)
> > > +		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> > > +
> > >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > >   			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
> > >   	DPU_HW_BLK_LM,
> > >   	DPU_HW_BLK_CTL,
> > >   	DPU_HW_BLK_PINGPONG,
> > > +	DPU_HW_BLK_DCWB_PINGPONG,
> > >   	DPU_HW_BLK_INTF,
> > >   	DPU_HW_BLK_WB,
> > >   	DPU_HW_BLK_DSPP,
> > >   	DPU_HW_BLK_MERGE_3D,
> > >   	DPU_HW_BLK_DSC,
> > >   	DPU_HW_BLK_CDM,
> > > +	DPU_HW_BLK_CWB,
> > >   	DPU_HW_BLK_MAX,
> > >   };
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > index 48d756d8f8c6e4ab94b72bac0418320f7dc8cda8..1fc8abda927fc094b369e0d1efc795b71d6a7fcb 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > @@ -128,6 +128,7 @@ struct dpu_global_state {
> > >   	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
> > >   	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
> > >   	uint32_t cdm_to_crtc_id;
> > > +	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
> > >   };
> > >   struct dpu_global_state
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index 85adaf256b2c705d2d7df378b6ffc0e578f52bc3..ead24bb0ceb5d8ec4705f0d32330294d0b45b216 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -234,6 +234,55 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> > >   	return -EINVAL;
> > >   }
> > > +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> > > +						 struct dpu_global_state *global_state,
> > > +						 uint32_t crtc_id,
> > > +						 struct msm_display_topology *topology)
> > > +{
> > > +	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> > > +	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> > > +	int cwb_pp_idx[MAX_BLOCKS];
> > > +	int cwb_mux_idx[MAX_BLOCKS];
> > > +
> > > +	/*
> > > +	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> > > +	 * mixer
> > > +	 *
> > > +	 * TODO: add support reserving resources for platforms with no
> > > +	 *       PINGPONG_CWB
> > 
> > What about doing it other way around: allocate CWBs first as required
> > (even/odd, proper count, etc). Then for each of CWBs allocate a PP block
> > (I think it's enough to simply make CWB blocks have a corresponding PP
> > index as a property). This way the driver can handle both legacy and
> > current platforms.
> 
> Hi Dmitry,
> 
> Sorry if I'm misunderstanding your suggestion, but the main change needed to
> support platforms with no dedicated PINGPONG_CWB is where in the
> rm->pingpong_blks list to start assigning pingpong blocks for the CWB mux.
> I'm not sure how changing the order in which CWBs and the pingpong blocks
> are assigned will address that.
> 
> (FWIW, the only change necessary to add support for non-dedicated
> PINGPONG_CWBs platforms for this function should just be changing the
> initialization value of cwb_pp_start_idx)

If I remember correctly, we have identified several generations of DPU
wrt. CWB handling:
- 8.1+ (or 8.0+?), DCWB, dedicated PP blocks
- 7.2, dedicated PP_1?
- 5.0+, shared PP blocks
- older DPUs, special handling of PP

If the driver allocates PP first and then first it has to allocated PP
(in a platform-specific way) and then go from PINGPONG to CWB (in a
platform-specific way). If CWB is allocated first, then you have only
one platform-specific piece of code that gets PINGPONG for the CWB (and
as this function is called after the CWB allocation, the major part of
the CWB / PP allocation is generic).

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > +	 */
> > > +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> > > +	     cwb_pp_count < num_cwb_pp; i++) {
> > > +		for (int j = cwb_pp_start_idx;
> > > +		     j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> > > +			/*
> > > +			 * Odd LMs must be assigned to odd PINGPONGs and even
> > > +			 * LMs with even PINGPONGs
> > > +			 */
> > > +			if (reserved_by_other(global_state->pingpong_to_crtc_id, j, crtc_id) ||
> > > +			    i % 2 != j % 2)
> > > +				continue;
> > > +
> > > +			cwb_pp_idx[cwb_pp_count] = j;
> > > +			cwb_mux_idx[cwb_pp_count] = j - cwb_pp_start_idx;
> > > +			cwb_pp_count++;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (cwb_pp_count != num_cwb_pp) {
> > > +		DPU_ERROR("Unable to reserve all CWB PINGPONGs\n");
> > > +		return -ENAVAIL;
> > > +	}
> > > +
> > > +	for (int i = 0; i < cwb_pp_count; i++) {
> > > +		global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> > > +		global_state->cwb_to_crtc_id[cwb_mux_idx[i]] = crtc_id;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   /**
> > >    * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
> > >    *	proposed use case requirements, incl. hardwired dependent blocks like
> > > @@ -614,6 +663,12 @@ static int _dpu_rm_make_reservation(
> > >   		return ret;
> > >   	}
> > > +	if (topology->cwb_enabled) {
> > > +		ret = _dpu_rm_reserve_cwb_mux_and_pingpongs(rm, global_state,
> > > +							    crtc_id, topology);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > >   	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
> > >   			topology);
> > > @@ -671,6 +726,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
> > >   	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
> > >   			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
> > >   	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
> > > +	_dpu_rm_clear_mapping(global_state->cwb_to_crtc_id,
> > > +			ARRAY_SIZE(global_state->cwb_to_crtc_id), crtc_id);
> > >   }
> > >   /**
> > > @@ -733,6 +790,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> > >   	switch (type) {
> > >   	case DPU_HW_BLK_PINGPONG:
> > > +	case DPU_HW_BLK_DCWB_PINGPONG:
> > >   		hw_blks = rm->pingpong_blks;
> > >   		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
> > >   		max_blks = ARRAY_SIZE(rm->pingpong_blks);
> > > @@ -762,6 +820,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> > >   		hw_to_crtc_id = &global_state->cdm_to_crtc_id;
> > >   		max_blks = 1;
> > >   		break;
> > > +	case DPU_HW_BLK_CWB:
> > > +		hw_blks = rm->cwb_blks;
> > > +		hw_to_crtc_id = global_state->cwb_to_crtc_id;
> > > +		max_blks = ARRAY_SIZE(rm->cwb_blks);
> > > +		break;
> > >   	default:
> > >   		DPU_ERROR("blk type %d not managed by rm\n", type);
> > >   		return 0;
> > > @@ -772,6 +835,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> > >   		if (hw_to_crtc_id[i] != crtc_id)
> > >   			continue;
> > > +		if (type == DPU_HW_BLK_PINGPONG) {
> > > +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> > > +
> > > +			if (pp->idx >= PINGPONG_CWB_0)
> > > +				continue;
> > > +		}
> > > +
> > > +		if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> > > +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> > > +
> > > +			if (pp->idx < PINGPONG_CWB_0)
> > > +				continue;
> > > +		}
> > > +
> > >   		if (num_blks == blks_size) {
> > >   			DPU_ERROR("More than %d resources assigned to crtc %d\n",
> > >   				  blks_size, crtc_id);
> > > @@ -847,4 +924,10 @@ void dpu_rm_print_state(struct drm_printer *p,
> > >   	dpu_rm_print_state_helper(p, rm->cdm_blk,
> > >   				  global_state->cdm_to_crtc_id);
> > >   	drm_puts(p, "\n");
> > > +
> > > +	drm_puts(p, "\tcwb=");
> > > +	for (i = 0; i < ARRAY_SIZE(global_state->cwb_to_crtc_id); i++)
> > > +		dpu_rm_print_state_helper(p, rm->cwb_blks[i],
> > > +					  global_state->cwb_to_crtc_id[i]);
> > > +	drm_puts(p, "\n");
> > >   }
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
