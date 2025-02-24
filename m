Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5FA420DD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1C910E2B7;
	Mon, 24 Feb 2025 13:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jf89Vtru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9410E2C5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:39:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30797730cbdso43540701fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 05:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740404354; x=1741009154; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HpiZKM1D+dktug9FLneInEDvc/Zhfv4RR713WMJNSc8=;
 b=jf89VtruVAZeJEWL5sn5CS0hzpxW2RhEwOLVw6Av5fp6wa20/lKkOzEB18Gw1snew0
 c/7Ocz1nMSsnyQg9Ehlyxq/yF8rwPc/FumWagvHOFEyR71Fw0rWc/ydFObRqby7zE7n1
 +yeu6u7cb2qcMa1/vp8Z3cO6MbK0Y3U4QZZnxRyb25U7lFR6P8CoG15bvX8L1Hc7e1yT
 8wzJ/ec/mSoJGIy/9kycEj/0AKpgqkrziiYFUzq134cX2ejhrhbvE8BJBoqqAdxD9lpw
 hvnlMFq3W9zVBeStj8iBb93Y6evmjfVLNBSjG1Ko+sTvr65EiwDYkV0WyJ2YR5+QmbfY
 FKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740404354; x=1741009154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HpiZKM1D+dktug9FLneInEDvc/Zhfv4RR713WMJNSc8=;
 b=QYAOsF8B3xq2lDISxjnmxreFJ+HbOVX+S4Grex9mYjQFCOUtmYuSQ3PR65UJFTw/aH
 PWHi1Y1nxGguNqcR3Qk/5sx7TWAybs2SMo2RVyy0gxurmvuPOqy+wAO81mW271EpCLNH
 zFs488ed02jxA/6rX67vOdX2LvlWuaa0mwdDdsOHucoTvhUdOvHs6RxGj9JKO897umAv
 1/aqEJa0T7Uxv+DRq64kvJGkZfLEJkWM3YUAcDLdx3ojbAwvjZB7VcE3oQyJwq14rt32
 T1sgR/YlwU+RqpuaEWmoCVZvFBf2C2GWeDLrJsOjcqWTT1Gy6nH52M0NRo+qxVICIlJS
 QX8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjJoGGLh5+Ls4sHxam6ADJmWdN878ye2kKvbeXesf9T75ZnaBkTm+dX7ZVywD1iWQ5hJLqdIbpyiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAfrSd2pCXV6QFil5JGVbUFoJ667H8yvk5Npv+TyYrNLVD0E4e
 G85GyBfq3sxKEHmw5gYPjJPfQDS9nO8qfLEZI48fqJaL8/xhx7ooy5+xLw2zyuQ=
X-Gm-Gg: ASbGncuvGqvCDrKRI7j+7Qz4DeIhCkEbnrDHAJNOL3oVYlaNTIKsct1417j7pLDloAk
 EemF2gsF9EmmEGXLKjW4VqzaPiRe7RH3r//DbBPp4YEpz9IWuqeKlKqzxcYQRqTwtMdamBYPvDO
 sgfgURwKGy6yiqCI6XbmPNtta13wFWmQuhxS/aEXeCTOd4viPCtFa0HFeZPBM6GteLrmdgYfu4b
 FOeEYmqsKqTEsiA1cHT6Kyfm7K+TH48XpVNt2INm9pFlJ/PM8pkbcpftFyJYpLRhgTfQn71qvSV
 CYA9pjHTmYeGpDX8w3t4BaQXOW69fqr/oWl27tDc59Ern6lYM9JTm29cavMZ4zAEwpdAxBO3f2F
 gaMpHpg==
X-Google-Smtp-Source: AGHT+IGpWpgpPy98plh9aAWeGN4aFpnSv7Z09YXBn/2iaCyySuDx/5dPxRzvR239TBYipIAbDWvEPQ==
X-Received: by 2002:a2e:9b05:0:b0:308:f6fc:9569 with SMTP id
 38308e7fff4ca-30a59986b49mr35140841fa.29.1740404353659; 
 Mon, 24 Feb 2025 05:39:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091e04742esm34522851fa.86.2025.02.24.05.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 05:39:13 -0800 (PST)
Date: Mon, 24 Feb 2025 15:39:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/msm/dpu: allocate single CTL for DPU >= 5.0
Message-ID: <d4chicea6vhlbvw23lclnqovlhq4rfdtefkk66vnbo5y3wf5y4@ajrutdjao2e2>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-6-71ca67a564f8@linaro.org>
 <4aix26abutkas2fpj6ubu2hbqeljpgr5e3m24akeb3jz33limj@c7rymwz6zmft>
 <7vcnej2hh3knti66dfyatbcyrlygbwqtwdlumpf4aqmupuopcf@pcpkbn6fs4h4>
 <n6cljmchentiycfbnlxoptl6gtrv5n5353gdmvbrrssfp7mkiy@lenjcbxn732p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n6cljmchentiycfbnlxoptl6gtrv5n5353gdmvbrrssfp7mkiy@lenjcbxn732p>
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

On Mon, Feb 24, 2025 at 01:38:22PM +0100, Marijn Suijten wrote:
> On 2025-02-21 01:58:58, Dmitry Baryshkov wrote:
> > On Fri, Feb 21, 2025 at 12:34:12AM +0100, Marijn Suijten wrote:
> > > On 2025-02-20 12:26:23, Dmitry Baryshkov wrote:
> > > > Unlike previous generation, since DPU 5.0 it is possible to use just one
> > > > CTL to handle all INTF and WB blocks for a single output. And one has to
> > > > use single CTL to support bonded DSI config. Allocate single CTL for
> > > > these DPU versions.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
> > > >  2 files changed, 15 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > index 5baf9df702b84b74ba00e703ad3cc12afb0e94a4..4dbc9bc7eb4f151f83055220665ee5fd238ae7ba 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > @@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
> > > >  	/* Clear, setup lists */
> > > >  	memset(rm, 0, sizeof(*rm));
> > > >  
> > > > +	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
> > > > +
> > > >  	/* Interrogate HW catalog and create tracking items for hw blocks */
> > > >  	for (i = 0; i < cat->mixer_count; i++) {
> > > >  		struct dpu_hw_mixer *hw;
> > > > @@ -381,10 +383,16 @@ static int _dpu_rm_reserve_ctls(
> > > >  	int i = 0, j, num_ctls;
> > > >  	bool needs_split_display;
> > > >  
> > > > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > > > -	num_ctls = top->num_intf;
> > > > +	if (rm->has_legacy_ctls) {
> > > > +		/* each hw_intf needs its own hw_ctrl to program its control path */
> > > > +		num_ctls = top->num_intf;
> > > >  
> > > > -	needs_split_display = _dpu_rm_needs_split_display(top);
> > > > +		needs_split_display = _dpu_rm_needs_split_display(top);
> > > > +	} else {
> > > > +		/* use single CTL */
> > > > +		num_ctls = 1;
> > > > +		needs_split_display = false;
> > > > +	}
> > > >  
> > > >  	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
> > > >  		const struct dpu_hw_ctl *ctl;
> > > > @@ -402,7 +410,8 @@ static int _dpu_rm_reserve_ctls(
> > > >  
> > > >  		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
> > > >  
> > > > -		if (needs_split_display != has_split_display)
> > > > +		if (rm->has_legacy_ctls &&
> > > > +		    needs_split_display != has_split_display)
> > > 
> > > I deduced a long time ago that the check for rm->has_legacy_ctls is not needed.
> > > 
> > > needs_split_display is always false on DPU >= 5, and neither of those SoCs has
> > > DPU_CTRL_SPLIT_DISPLAY which means false != false is false, and this condition
> > > never triggers on active CTLs even without checking has_legacy_ctls.
> > 
> > During the transition time of 1 or 2 patches there is a window of
> > DPU >= 5 and DPU_CTRL_SPLIT_DISPLAY.
> 
> Correct, but would there be any harm in reordering the patches?  Before this
> patch DPU_CTL_SPLIT_DISPLAY seems to have caused wrongfully allocating multiple
> CTLs when multiple intfs are requested anyway.

Why do you think that it is done wrongly? Before this patch there was no
way to use one CTL in such a case.

> 
> - Marijn
> 
> > > Other than that, this is all successfully tested and:
> > > 
> > > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > 
> > > >  			continue;
> > > >  
> > > >  		ctl_idx[i] = j;
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > index 99bd594ee0d1995eca5a1f661b15e24fdf6acf39..130f753c36338544e84a305b266c3b47fa028d84 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > @@ -24,6 +24,7 @@ struct dpu_global_state;
> > > >   * @dspp_blks: array of dspp hardware resources
> > > >   * @hw_sspp: array of sspp hardware resources
> > > >   * @cdm_blk: cdm hardware resource
> > > > + * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
> > > >   */
> > > >  struct dpu_rm {
> > > >  	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> > > > @@ -37,6 +38,7 @@ struct dpu_rm {
> > > >  	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> > > >  	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
> > > >  	struct dpu_hw_blk *cdm_blk;
> > > > +	bool has_legacy_ctls;
> > > >  };
> > > >  
> > > >  struct dpu_rm_sspp_requirements {
> > > > 
> > > > -- 
> > > > 2.39.5
> > > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
