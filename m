Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1160A18ED9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458A410E2EF;
	Wed, 22 Jan 2025 09:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SWxzkCXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7511210E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:53:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-542af38ecd6so7100996e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 01:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737539619; x=1738144419; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iRgf+4Gq7ci+Ro2VkxNsjuyLNd/CJ4xAOCwqSJx115Q=;
 b=SWxzkCXy911yADLJ7sQNnhNZZOtjT+oEAeaXSzG/HtlViMstcqduqusIzmauW78Ih9
 nj1NhfGoODHjrc/Zv7P0xS2iW7Ap4X2imeWHbledw3UWREdVHIku27IMK/VlLM5uIHKs
 6STnu858ItSm4uuBN0rQow8wwoecj+jT994NpdkI/0eIO7g+uvppibaeJL2mbs5Y/RT0
 3bFiDVRnjATxcBl616via4tPZLLCzmTp+hY+k4S3+iRQ+w3Ra+u26qBcDVwcGkZm0nib
 ArQg5jvuHyaLRk827p2M9HsxJZRUr1mTnSfwsFK3eUCeepyXpmckq775tU4K38QXMfjd
 x0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737539619; x=1738144419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRgf+4Gq7ci+Ro2VkxNsjuyLNd/CJ4xAOCwqSJx115Q=;
 b=is4lMPaZPj/So3caalBBB1DrqSgQBgODbcLgu3f41OFekWFHlyt31W5PkzJUQbwxY1
 osLkkIrZgMxsaEXMEHdUFv/2viH7ydPqY3tnhmFc10jI2CGVUE5H45uXLNqlAHjUrwiB
 jVwHtR3jwbLyITdh5k0DRc7Gp7OKDpG8jGXH423Y6rxjAUVxBD+By078FcM1TddDaSD3
 j7Z4rLOn53dKaAw2A+jshaUTN4Sser216nqo2je5LufdP4XQgzo0uLdB2gA/7PmkbGA2
 dmz7coYrsFimiItBmr4SYEEeRfG/Ol1Iy/zyw3rpx6pDv0eJAy3AP+4p6mvhoMsbsLkj
 aU+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+t2DTZOl0hJ/Qdd4rZ+FSu8K3cu9dE1+1Frztxm7kxraC2rjkW1D5036WH1QwJsOXa6mL01lvtjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs5p/F18bsc7xhqZMQMBjOZsPqbncY70+SDadl72srr3x2uEVB
 nYjDzFxWm2UinYf8ozE/jrfNAEVogcJQ96OB0poZNT/KRvf60n44c4i3oQo8AZE=
X-Gm-Gg: ASbGncsklkkBoJoNJRDyo+iOWHvV6F/sSeaxa3yJvuEKQBxo2D4Zo+TRPvME7vLW33Y
 8UbSRbNZQpyEPnHW8tsS+i736ofoLpf3FIK1SkFrxCXP+9q4b4tq6E1hzzKOQiiTb2cq0lXwseD
 I+UX5byGCEkV5p5Ze1WltkQ6MBP/4RrALQoAEh4Kfto0+OYUoIhnIHgAK2PK1eQZN/dacqB2uoL
 z7GFiTVk5F2YK6uw9Qd72d75XtT2eSrFu9C4OuzX/27FkPCrFMHVPU9Y1ltCkEpUWZUq39j/40H
 mZ61+Ow9KYFOApufIniZo6kgcbGHJ1jJ4Th4SPE1R69ImWAoNw==
X-Google-Smtp-Source: AGHT+IHLb2Jy8LJxpPjgGgMRTl/2bf+lFr1P6PyDavfCYaMiwjULwOKsJk+FZolKdDj43k4KykRThw==
X-Received: by 2002:a05:651c:e1b:b0:307:46f3:4e92 with SMTP id
 38308e7fff4ca-30746f34f8cmr32037541fa.32.1737539619493; 
 Wed, 22 Jan 2025 01:53:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330180sm25104611fa.23.2025.01.22.01.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 01:53:38 -0800 (PST)
Date: Wed, 22 Jan 2025 11:53:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/35] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <obrwhv2a4ubg4updrimszy7b7dwjsixuwzf5gutjahgdim6nxh@pin7heiwmco7>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-11-988f0662cb7e@linaro.org>
 <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>
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

On Tue, Jan 21, 2025 at 04:58:03PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> >   15 files changed, 13 insertions(+), 50 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index e9bbccc44dad8b391cd51daf902307105b2598fc..e16b0a0c57da4a1aa77064ca2214e37cd9ee4baa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -66,7 +66,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   	/* setup which pp blk will connect to this intf */
> > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> >   		phys_enc->hw_intf->ops.bind_pingpong_blk(
> >   				phys_enc->hw_intf,
> >   				phys_enc->hw_pp->idx);
> 
> Was it intentional to drop the DPU_CTL_ACTIVE_CFG here but not replace it
> with core_major_rev >= 5?

The bind_pingpong_blk is only defined for 5.x+ platforms, so the check
is useless.

> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 5f9cd09589bb403746d48af6f8555cd224bf3195..59d25916d2d412113768d71a76a6aed4c879299a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -716,7 +716,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
> >   	c->caps = cfg;
> >   	c->mdss_ver = mdss_ver;
> > -	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
> > +	if (mdss_ver->core_major_ver >= 5) {
> >   		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> >   		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> >   		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> > 
> 
> DPU ver 5 introduced active_cfg, so this part is correct. Hence overall
> change is fine.

-- 
With best wishes
Dmitry
