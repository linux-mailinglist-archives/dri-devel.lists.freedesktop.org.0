Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399618B4DD4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 23:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F2E11237E;
	Sun, 28 Apr 2024 21:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F84511237E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 21:06:38 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9A1D21F62F;
 Sun, 28 Apr 2024 23:06:35 +0200 (CEST)
Date: Sun, 28 Apr 2024 23:06:34 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 5/7] drm/msm/dpu: Correct dual-ctl -> dual-intf typo in
 comment
Message-ID: <mrg3m7awzvozhyg2zwwbawfa6cb6xo7obzooiq3iph6mu3ybfc@b5h2pzxvcjvf>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-5-78ae3ee9a697@somainline.org>
 <76hjmo4sq6sfjgmnvjoienc5aij74pfjtwevnnls65kxinyaxu@y3yydacvcflm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76hjmo4sq6sfjgmnvjoienc5aij74pfjtwevnnls65kxinyaxu@y3yydacvcflm>
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

On 2024-04-18 02:30:59, Dmitry Baryshkov wrote:
> On Wed, Apr 17, 2024 at 01:57:45AM +0200, Marijn Suijten wrote:
> > This comment one line down references a single, "same CTL" that controls
> > two interfaces, so the comment should clearly describe two interfaces
> > used with a single active CTL and not "two CTLs".
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index d9e7dbf0499c..7e849fe74801 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -428,7 +428,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
> >  	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
> >  
> >  	/*
> > -	 * For single flush cases (dual-ctl or pp-split), skip setting the
> > +	 * For single flush cases (dual-intf or pp-split), skip setting the
> 
> It should be fixed, but in the other way: it's 'single-ctl'. See
> sde_encoder_phys_needs_single_flush().

As written in the cover letter I was unsure about this comment.

You are right that sde_encoder_phys_needs_single_flush() is supposed to return
true in pp-split or single-ctl.  However, the second part of the comment (right
below) is in conflict with another patch that I've sent as part of these series:
on a single-ctl setup with dual interfaces, the second INTF needs to be marked
for flushing.

While that observation and fix is for CMD-mode, the exact same comment is found
downstream for video mode:

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.4.r1-rel/msm/sde/sde_encoder_phys_vid.c?ref_type=heads#L794-804

You were fixing exactly that in one of your preliminary Active-CTL patches by
making dpu_encoder_phys_vid_needs_single_flush() return for Active-CTL, so we
should probably update this comment in the same patch when you send it?

(that is: the flush bit needs to be set for the slave intf in Active-CTL. Before
Active-CTL, a slave encoder would actually have two CTLs and two INTFs where the
flush bit was probably skipped on both slaves?)

On a side-note, since the needs_single_flush callback is used elsehwere, I'm
unsure if that patch affects things in the wrong way since the downstream file
linked above applies the check for CTL_ACTIVE_CFG directly in-line without
affecting the callback.

- Marijn

> >  	 * flush bit for the slave intf, since both intfs use same ctl
> >  	 * and HW will only flush the master.
> >  	 */
> > 
> > -- 
> > 2.44.0
> > 
> 
> -- 
> With best wishes
> Dmitry
