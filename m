Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D086ED7F3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 00:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1027310E634;
	Mon, 24 Apr 2023 22:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D3A10E62A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 22:30:45 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5E5493F28E;
 Tue, 25 Apr 2023 00:30:42 +0200 (CEST)
Date: Tue, 25 Apr 2023 00:30:41 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER ->
 DITHER typo
Message-ID: <bhatfkgdkjt2bih4lcwa5cxcp3w2tkjrqmbdhqhzqa2cizrmxs@py3gr5vifsoc>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
 <a0a0b8fb-0d6b-d11b-5596-d61c41aabe7f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0a0b8fb-0d6b-d11b-5596-d61c41aabe7f@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rajesh Yadav <ryadav@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-24 13:53:13, Abhinav Kumar wrote:
> 
> 
> On 4/17/2023 1:21 PM, Marijn Suijten wrote:
> > SM8550 only comes with a DITHER subblock inside the PINGPONG block,
> > hence the name and a block length of zero.  However, the PP_BLK macro
> > name was typo'd to DIPHER rather than DITHER.
> > 
> > Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> This change itself is fine, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> one comment below
> 
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 +-
> >   2 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > index 9e403034093f..d0ab351b6a8b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > @@ -132,28 +132,28 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
> >   		 &sm8150_dspp_sblk),
> >   };
> >   static const struct dpu_pingpong_cfg sm8550_pp[] = {
> 
> dither block should be present on many other chipsets too but looks like 
> on sm8550 was enabling it. Not sure how it was validated there. But we 
> are enabling dither, even other chipsets have this block.

Correct, they all seem to have it starting at sdm845.  My patch message
seems to lack the word "exclusively" as the PP on sm8550 appears to
exclusively contain a DITHER subblock (unless other blocks are available
that simply aren't supported within this driver yet) and no other
registers.  Hence this aptly named macro exist to emit just the feature
bitflag for that and a .len of zero.

Now, whether we should have the features contain subblock flags rather
than just scanning for their id's or presence in the subblocks is a
different discussion / cleanup we should have.

- Marijn

> > -	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> >   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> >   			-1),
> > -	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> >   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> >   			-1),
> > -	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> >   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> >   			-1),
> > -	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> >   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> >   			-1),
> > -	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> >   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> >   			-1),
> > -	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> >   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> >   			-1),
> > -	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
> >   			-1,
> >   			-1),
> > -	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
> > +	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
> >   			-1,
> >   			-1),
> >   };
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 03f162af1a50..ca8a02debda9 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -491,7 +491,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
> >   	.len = 0x20, .version = 0x20000},
> >   };
> >   
> > -#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> > +#define PP_BLK_DITHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> >   	{\
> >   	.name = _name, .id = _id, \
> >   	.base = _base, .len = 0, \
> > 
