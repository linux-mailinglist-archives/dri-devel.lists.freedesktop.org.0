Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7CE6EE9D4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 23:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11E010E295;
	Tue, 25 Apr 2023 21:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0D6889BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 21:53:19 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DE2DD3F1F3;
 Tue, 25 Apr 2023 23:53:15 +0200 (CEST)
Date: Tue, 25 Apr 2023 23:53:14 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2 04/17] drm/msm/dpu: Fix PP_BLK_DIPHER ->
 DITHER typo
Message-ID: <klrcz6zw4syxllhtbuclo65lo73kdunl5syuuoiv6zzkf3fadl@rgjc7rlgaoxq>
References: <20230411-dpu-intf-te-v2-4-ef76c877eb97@somainline.org>
 <a0a0b8fb-0d6b-d11b-5596-d61c41aabe7f@quicinc.com>
 <bhatfkgdkjt2bih4lcwa5cxcp3w2tkjrqmbdhqhzqa2cizrmxs@py3gr5vifsoc>
 <65bb4d8a-c607-4152-0ae3-bf3134955925@quicinc.com>
 <5td7ikd76obc5bn5sndnt7fbzjuwmyxtu35ma3lykzmmbyfffk@b24jh6imaocy>
 <7541b780-482e-ea92-f788-18c8fbf45d77@quicinc.com>
 <o536qdkbrqob5wux7jvmo7expwn4bdlj7vy7egjfsyydxp5myb@xjhmolci5jzl>
 <cc537736-a555-dc3e-2e53-f1d4479eab21@quicinc.com>
 <6crk3acgxcdfdokpgcfjkojs2wdjoxalkmctqfgtc725wsgoep@kdj4zbavbe62>
 <a8f33707-b9ea-5595-e458-4f56c24c1167@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8f33707-b9ea-5595-e458-4f56c24c1167@quicinc.com>
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

On 2023-04-25 14:37:21, Abhinav Kumar wrote:
> 
> 
> On 4/25/2023 1:43 PM, Marijn Suijten wrote:
> > On 2023-04-25 09:47:30, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/25/2023 9:33 AM, Marijn Suijten wrote:
> >>> On 2023-04-25 09:18:58, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 4/24/2023 11:54 PM, Marijn Suijten wrote:
> >>>>> On 2023-04-24 16:09:45, Abhinav Kumar wrote:
> >>>>> <snip>
> >>>>>>>> dither block should be present on many other chipsets too but looks like
> >>>>>>>> on sm8550 was enabling it. Not sure how it was validated there. But we
> >>>>>>>> are enabling dither, even other chipsets have this block.
> >>>>>>>
> >>>>>>> Correct, they all seem to have it starting at sdm845.  My patch message
> >>>>>>> seems to lack the word "exclusively" as the PP on sm8550 appears to
> >>>>>>> exclusively contain a DITHER subblock (unless other blocks are available
> >>>>>>> that simply aren't supported within this driver yet) and no other
> >>>>>>> registers.  Hence this aptly named macro exist to emit just the feature
> >>>>>>> bitflag for that and a .len of zero.
> >>>>>>>
> >>>>>>
> >>>>>> I think after the TE blocks were moved to INTF, dither is the only
> >>>>>> sub-block for all Ping-Pongs not just in sm8550.
> >>>>>
> >>>>> So you are asking / leaving context to make all >= 5.0.0 pingpong blocks
> >>>>> use this macro with only a single DITHER sblk in PP?
> >>>>>
> >>>>> As far as I recall SM8550 is the first SoC to use zero registers in PP,
> >>>>> which is specifically what this macro takes care of too.  Then, there
> >>>>> are only a few SoCs downstream still (erroneously?) referencing TE2 as
> >>>>> the only other sub-blk, those SoCs still use sdm845_pp_sblk_te.
> >>>>>
> >>>>
> >>>> So, what I didnt follow is why should sm8450 use PP_BLK_TE Vs sm8550
> >>>> should use PP_BLK_DIPHER?
> >>>>
> >>>> Atleast for those two, both should be using PP_BLK_DIPHER.
> >>>>
> >>>> Thats what I was trying to note here.
> >>>>
> >>>> This isnt even right as there is no PP_BLK_TE in sm8450.
> >>>
> >>> SM8450 doesn't use PP_BLK_TE (TE2) anymore since the second patch in
> >>> this series.  If you think it should use the DITHER (not DIPHER!) macro
> >>> instead of the regular PP_BLK with a size of 0xd4, we can do that in
> >>> another patch as that's not strictly related to this series.
> >>>
> >>
> >> Yes, thanks for pointing the TE2 was removed in the prev patch of this
> >> series for sm8450. I was just focusing too much on this patch.
> >>
> >> And Yes, I think we should use the DIPHER ..... oh sorry .... DITHER ;)
> >>
> >> Yes, it can go as a different series, like I already wrote many times in
> >> this.
> > 
> > Thanks, that'd be great.  I wasn't sure at this point what you wanted to
> > be changed here, after commenting on a typo fix rather than i.e. patch 2
> > that deals with the TE2 sub-block of PP :)
> > 
> 
> The reason I commented on this patch is because all the discussion so 
> far was surrounding the PP_BLK_DITHER macro which was being touched in 
> this patch.
> 
> So even now, we found out about sm8450 and sm8550 because of the 
> question that why sm8550 alone should use PP_BLK_DITHER and not sm8450.
> 
> This patch led to all the discussion about PP_BLK_DITHER.
> 
> Even though it was just a typo fix patch, it uncovered deeper issues in 
> catalog about why PP_BLK_DITHER wasnt used more often.

Indeed: the initial question was for the dither _block_ which is enabled
on every other platform, just through the original macros which do more
than exclusively enabling the dither block.

> >> But atleast now, someone will remember to do it.

I'll see whether I can include these fixes before sending v3 (got all
the other changes in and am all-ready to send it): is there any other
SoC you're seeing this issue on?

- Marijn

> >>> Note that that's the only difference between these macros.  The size
> >>> becomes 0 but the .features mask is the same (SM8450 uses
> >>> PINGPONG_SM8150_MASK).
> >>>
> >>> These patches are anyway already distracting from my series, but were
> >>> easier to do in one go as I was touching the PP and INTF catalog blocks
> >>> regardless.
> >>>
> >>> While at it, perhaps we should check if the version and offset for the
> >>> DITHER block are correct?  SM8450 uses SDM845 sblk definitions.
> >>>
> >>
> >> Yes I already checked. the version and offset of dither are same between
> >> sm8450 and sm8550.
> > 
> > Thanks for checking, so then sm8450 is wrong on multiple occasions.
> > Let's check all other SoCs that use sdm845_pp_sblk whether they should
> > have used sc7280_pp_sblk instead.
> > 
> > - Marijn
