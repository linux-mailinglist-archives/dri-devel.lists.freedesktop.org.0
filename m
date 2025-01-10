Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B079A083C3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 01:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0290010E3CE;
	Fri, 10 Jan 2025 00:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gA09ehwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C270910E499
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 00:01:41 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-303548a933aso11120841fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 16:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736467240; x=1737072040; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V89tZmVrHGFuPql+PBulxt76Abvyv1smk3+78i/64eA=;
 b=gA09ehwYjjwuab3l+BKjiA04X+2mcLv39XZQTJqIu7473t1yw7j7pPWOOIRIC3Ml4s
 Q5czr1qbhw2UEDs6qwO+cuNMEIM5ufRlxB5dsCVyZxok6R4M2vXnyNjulsE6e7P+7kBf
 BdkzCG/qbbb4TU8ifHmpvco3kAB30AT9aGauLK6xCimcrH+2uGhKbD3pzoHgcaHoiUCy
 Kc9brVpE+G5fmmDi1fCbnnQTnV6P8pUtWHIeWfiUwXAwddM1/P3w9r6Ep+Uda3Zh3dY1
 bUK/xmhUzZWp7MNGpDYxK5gI/BlPg1mw90DmxY55WovuNW9j4Aj7z6XdubkMN12Zuuah
 y3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736467240; x=1737072040;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V89tZmVrHGFuPql+PBulxt76Abvyv1smk3+78i/64eA=;
 b=UHODy5WcykMt5qP9k490VQO3pSU/Ck4CRooRwxx3Q9XHvA1T6Ec6RRFVmAv20NfD9T
 KranFiwGfE4KWeOV5wI2f9TkPcOJfJcmryRah9YYxJ4/5MsKXKaRzzITMG6bITiQRMZN
 HdfmyyMUPso0HLKAAjDF8mc4LEMKlUa2D3WQPo4X8cMZRMceWGk+RKDP3g2mS1/NFt5Y
 3cs52ocSnzB4bWANCx/kVIaJ0E//pln9s4ms0TLh3FJa8+BIySfcARYE3qaK+rk3RzWa
 BEgN9xgh3UpBQxcu/Fq+6bd1eCdpYBJTAITIiHUBtQft557919tIWejDkLJSExq2UKbJ
 Tn8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuZIboSaBKfOhOy+aCsmNZDTrOkOi0vu9GGqdih9e9Rf+/oRMoacuEt7EFJC4imGH5mYttopLliE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJK40VLUDdj88Bg2JVMvi9+AVxsqkDVpo9ajScRZ+Qr2Wm2AjX
 2h9uB+Fzu9mlRfCZr3zzWYfiSsO59Qa9n+KM1Y9UWNLOph/Isq2SarnheZwJt9Q=
X-Gm-Gg: ASbGncv/tndZ3XeYSUd8MnSY5mL6XVnChiVIHcayPsAzpeoC9XSvMEoyEmewZDdsSQF
 I67djldk0XJeJ7bzW2utvrGZuYZXpSw1nwygL14ohH7DeN+nrKg4Ug/dxz4w1oJAUiqpHiPuYZ0
 kp33yiM+F9RxDaTfmx235hqx/Rr5ZfrG55LFHkz0AGeoe1NsJRRvtwgDko04TczfFA3/gNHv1DX
 SZIdRfhhC+xfB17kWNGMQYvVXcsfk6C0vEdoS64kcDkUjeVxLJOkXK+Fs0d0n3lG9CfZyma9mtH
 IgbkmXyYG8Q7eOZESUDD0pRd3DC/ydQvoufU
X-Google-Smtp-Source: AGHT+IF1kMl3/8tplC3d3ceeZdPyxdOdcXWi0l4AL0IfJYyKy6rFEmO45OwPi0QlXvFa+z23H39rUA==
X-Received: by 2002:a05:651c:50b:b0:300:34b2:f89e with SMTP id
 38308e7fff4ca-305f45747b3mr28788641fa.17.1736467240081; 
 Thu, 09 Jan 2025 16:00:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1ec4ecsm3364311fa.103.2025.01.09.16.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 16:00:38 -0800 (PST)
Date: Fri, 10 Jan 2025 02:00:37 +0200
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
Message-ID: <wheu3izj3pit6k3cmslpyegunmrcryy65y5eu432nec2y2aor6@kda3xnujhtnm>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
 <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
 <4069bd6a-c37f-4dbe-bbd6-5b333ee54ad8@quicinc.com>
 <a4akor2liqafta53zeev22x2pkqwzo5szwidr2ruzdvttvze5h@jtio3jue7ez3>
 <e47b33e6-142d-42d6-8ae9-f2d2c7793d18@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e47b33e6-142d-42d6-8ae9-f2d2c7793d18@quicinc.com>
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

On Thu, Jan 09, 2025 at 02:34:44PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/3/2025 10:16 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 03, 2025 at 10:03:35AM -0800, Jessica Zhang wrote:
> > > 
> > > 
> > > On 12/19/2024 9:03 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> > > > > Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> > > > > to account for concurrent writeback
> > > > 
> > > > Why?
> > > 
> > > Hi Dmitry,
> > > 
> > > This flag is necessary to specify that CWB mux(es) need to be assigned for
> > > the given reqeusted topology.
> > 
> > Why is necessary? Please rephrase your statement (we need foo bar, so do
> > baz).
> 
> Ack, what do you think of rephrasing the commit msg to this:
> 
> ```
> Add support for adjusting topology based on if concurrent writeback is
> enabled.
> 
> Currently, the topology is calculated based on the assumption that the user
> cannot request real-time and writeback simultaneously. For example, the
> number of LMs and CTLs are currently based off the number of phys encoders
> under the assumption there will be at least 1 LM/CTL per phys encoder.
> 
> This will not hold true for concurrent writeback as 2 phys encoders (1
> real-time and 1 writeback) can be driven by 1 LM/CTL when concurrent
> writeback is enabled.
> 
> To account for this, add a cwb_enabled flag and only adjust the number of
> CTL/LMs needed by a given topology based on the number of phys encoders only
> if CWB is not enabled.
> 
> ```
> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
> > > > >    3 files changed, 20 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > > > >    		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> > > > >    					    &crtc_state->adjusted_mode);
> > > > > +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> > > > > +
> > > > >    	/*
> > > > >    	 * Datapath topology selection
> > > > >    	 *
> > > > > @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
> > > > >    	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > > > >    	 *
> > > > >    	 * Add dspps to the reservation requirements if ctm is requested
> > > > > +	 *
> > > > > +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> > > > > +	 * enabled. This is because in cases where CWB is enabled, num_intf will
> > > > > +	 * count both the WB and real-time phys encoders.
> > > > > +	 *
> > > > > +	 * For non-DSC CWB usecases, have the num_lm be decided by the
> > > > > +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
> > > > >    	 */
> > > > > -	if (topology.num_intf == 2)
> > > > > +	if (topology.num_intf == 2 && !topology.cwb_enabled)
> > > > >    		topology.num_lm = 2;
> > > > >    	else if (topology.num_dsc == 2)
> > > > >    		topology.num_lm = 2;
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
> > > > >    	int i = 0, j, num_ctls;
> > > > >    	bool needs_split_display;
> > > > > -	/* each hw_intf needs its own hw_ctrl to program its control path */
> > > > > -	num_ctls = top->num_intf;
> > > > > +	/*
> > > > > +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> > > > > +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> > > > > +	 */
> > > > 
> > > > Why?
> > > 
> > > This is because num_intf is based on the number of phys_encs. Since in the
> > > CWB case, the WB and real-time encoders will be driven by the same CTL. I
> > > can add this to the comment doc.
> > 
> > Why are they driven by the same CTL? Is it also the case for platforms
> > before DPU 5.x?
> 
> This is because the WB and real-time path for a given topology would be
> driven by the same data path so the same CTL should enable the real-time and
> WB active bits.
> 
> This is the same for pre-DPU 5.x.

But pre-5.x platforms didn't have ACTIVE_CTL, so they should be using
separte CTL for each of the physical encoders.

> 
> > 
> > > 
> > > Thanks,
> > > 
> > > Jessica Zhang
> > > 
> > > > 
> > > > > +	if (top->cwb_enabled)
> > > > > +		num_ctls = 1;
> > > > > +	else
> > > > > +		num_ctls = top->num_intf;
> > > > >    	needs_split_display = _dpu_rm_needs_split_display(top);
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > > > > @@ -46,6 +46,7 @@ struct dpu_rm {
> > > > >     * @num_dspp:     number of dspp blocks used
> > > > >     * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> > > > >     * @needs_cdm:    indicates whether cdm block is needed for this display topology
> > > > > + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
> > > > >     */
> > > > >    struct msm_display_topology {
> > > > >    	u32 num_lm;
> > > > > @@ -53,6 +54,7 @@ struct msm_display_topology {
> > > > >    	u32 num_dspp;
> > > > >    	u32 num_dsc;
> > > > >    	bool needs_cdm;
> > > > > +	bool cwb_enabled;
> > > > >    };
> > > > >    int dpu_rm_init(struct drm_device *dev,
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry
