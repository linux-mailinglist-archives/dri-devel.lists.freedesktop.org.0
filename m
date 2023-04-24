Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46706ED7D9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 00:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B55510E623;
	Mon, 24 Apr 2023 22:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55D510E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 22:25:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A9DAE3F5BC;
 Tue, 25 Apr 2023 00:25:32 +0200 (CEST)
Date: Tue, 25 Apr 2023 00:25:31 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 03/17] drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets
 out of hwio header
Message-ID: <7j6ww6nkplq6adjgpzu3uyswdmid2oxldpwlmis6cyw7tcbkrh@whpmzhsl5rpj>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-3-ef76c877eb97@somainline.org>
 <62d78d23-e191-a64f-5c4c-cd2c26217bdf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62d78d23-e191-a64f-5c4c-cd2c26217bdf@quicinc.com>
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

On 2023-04-24 13:44:55, Abhinav Kumar wrote:
> 
> 
> On 4/17/2023 1:21 PM, Marijn Suijten wrote:
> > These offsets do not fall under the MDP TOP block and do not fit the
> > comment right above.  Move them to dpu_hw_interrupts.c next to the
> > repsective MDP_INTF_x_OFF interrupt block offsets.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> This change itself is fine, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> One comment below.
> 
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 5 ++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h          | 3 ---
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index 53326f25e40e..85c0bda3ff90 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -15,7 +15,7 @@
> >   
> >   /*
> >    * Register offsets in MDSS register file for the interrupt registers
> > - * w.r.t. to the MDP base
> > + * w.r.t. the MDP base
> >    */
> >   #define MDP_SSPP_TOP0_OFF		0x0
> >   #define MDP_INTF_0_OFF			0x6A000
> > @@ -24,6 +24,9 @@
> >   #define MDP_INTF_3_OFF			0x6B800
> >   #define MDP_INTF_4_OFF			0x6C000
> >   #define MDP_INTF_5_OFF			0x6C800
> > +#define INTF_INTR_EN			0x1c0
> > +#define INTF_INTR_STATUS		0x1c4
> > +#define INTF_INTR_CLEAR			0x1c8
> >   #define MDP_AD4_0_OFF			0x7C000
> >   #define MDP_AD4_1_OFF			0x7D000
> >   #define MDP_AD4_INTR_EN_OFF		0x41c
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> > index feb9a729844a..5acd5683d25a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
> > @@ -21,9 +21,6 @@
> >   #define HIST_INTR_EN                    0x01c
> >   #define HIST_INTR_STATUS                0x020
> >   #define HIST_INTR_CLEAR                 0x024
> 
> Even HIST_INTR_*** need to be moved then.

These are relative to MDP_SSPP_TOP0_OFF too just like
INTR(2)_{CLEAR,EN,STATUS} so I left them here.  Otherwise, *all* these
interrupt masks are probably best moved to dpu_hw_interrupts.c for
clarity, as that's also the only place they are used?

Let me know which way you prefer.

- Marijn

> > -#define INTF_INTR_EN                    0x1C0
> > -#define INTF_INTR_STATUS                0x1C4
> > -#define INTF_INTR_CLEAR                 0x1C8
> >   #define SPLIT_DISPLAY_EN                0x2F4
> >   #define SPLIT_DISPLAY_UPPER_PIPE_CTRL   0x2F8
> >   #define DSPP_IGC_COLOR0_RAM_LUTN        0x300
> > 
