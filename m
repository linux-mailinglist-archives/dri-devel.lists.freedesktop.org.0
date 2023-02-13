Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5A694804
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 15:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECC910E051;
	Mon, 13 Feb 2023 14:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7A910E221
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 14:28:34 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 804A43E986;
 Mon, 13 Feb 2023 15:28:32 +0100 (CET)
Date: Mon, 13 Feb 2023 15:28:31 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 06/10] drm/msm/dpu: Add SM6350 support
Message-ID: <20230213142831.hbzfp2chekshsqyy@SoMainline.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
 <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
 <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
 <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Liu Shixin <liushixin2@huawei.com>,
 Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-13 13:35:01, Dmitry Baryshkov wrote:
> On 13/02/2023 13:30, Marijn Suijten wrote:
> > On 2023-02-13 12:15:19, Konrad Dybcio wrote:
> > [...]
> >>>> @@ -1674,6 +1765,15 @@ static struct dpu_pingpong_cfg sc8280xp_pp[] = {
> >>>>              DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> >>>>    };
> >>>>    +static struct dpu_pingpong_cfg sm6350_pp[] = {
> >>>> +    PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> >>>
> >>> No TE support?
> >> It's.. complicated.. With just this patch, display refreshes, albeit
> >> not at 60fps. Marijn is working on getting it going, though
> >>
> >> https://github.com/SoMainline/linux/commits/marijn/longbois-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > 
> > This branch hasn't been updated for the longest time.  I'm preparing v2
> > of the INTF TE series at:
> > 
> > https://github.com/SoMainline/linux/commits/marijn/dpu/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > 
> > and it has about ±40% of Dmitry's review applied.  More to come now that
> > hiatus is over.
> 
> We should agree on landing order for my rework vs your changes. Can I 
> try persuading you to review that 50-patches beast? With the hope that 
> you'd agree to land your changes on top of it?

SM6115 unexpectedly landing in advance of SM8[345]0 was already an
unnecessary headache to deal with, and now we're "changing direction" on
landing SM6350/75 in advance of INTF TE too...  not to forget about
SM6125 which I also keep rebasing locally but planned on landing _after_
INTF TE.  Regardless of the extra effort it will take from me I'd be
happy to land my patches after everyone else's to have final say over
which setup gets what bitflags and interrupts, as these typically got
botched in our trees after rebases leading to broken INTF TE.
Perhaps I should resubmit the individual Fixes: commits though?

Feel free to propose a merge order listing all the aforementioned SoCs,
your rework, my INTF TE patches and whatever else is in the pipeline.
As I've been away for a while, and only have limited hobby time (_and_
have to split that on various projects), I'm behind on what's currently
in swing for DPU (need additional time to catch back up) nor will be
able to rebase/resubmit my patches often (a set-in-stone merge order
will really help prioritise/plan ahead here).

Sure, I will at least start looking at your 50-patch as part of catching
back up.  Do you want to process that on the mailing list or via
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/44?

- Marijn
