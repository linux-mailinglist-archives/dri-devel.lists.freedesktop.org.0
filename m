Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDAA2F1A9A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB38F6E0F7;
	Mon, 11 Jan 2021 16:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B3188EF3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:11:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610381493; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=P5+Mis721Z6vZ3WqvVWUlOlPJxsnwl96h64oYHY/Qv4=;
 b=jei0IxXE6sIOoBMIFsIh+uoJj0HkavMTcevIXisl294aujRIeyMnQ6Wl1+cubibgwvm0wZXT
 56dsFLwvrTP3VmVQs3orZXINF/CZcv6ot2AuGTDEBq6KopNRtDv0DHfEdq6gSOallAthDkh/
 CQimv6eSjh6tK7T3jqYqJYXO1ss=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ffc78abf1be2d22c4f333e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 16:11:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9C726C43463; Mon, 11 Jan 2021 16:11:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BAD3DC43463;
 Mon, 11 Jan 2021 16:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BAD3DC43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 11 Jan 2021 09:11:15 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
Message-ID: <20210111161115.GB29638@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Sean Paul <sean@poorly.run>, Jonathan <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 martin.botka@somainline.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Shawn Guo <shawn.guo@linaro.org>, marijn.suijten@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Daniel Vetter <daniel@ffwll.ch>,
 angelogioacchino.delregno@somainline.org,
 Dave Airlie <airlied@redhat.com>, phone-devel@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
 <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
 <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
 <CAF6AEGsd5B0R7H1noO+=LByx4zkdVvu1LALZWnevGbMRj76m2w@mail.gmail.com>
 <73609df52188588bf7d023e16a706a7a@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73609df52188588bf7d023e16a706a7a@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno <freedreno@lists.freedesktop.org>, phone-devel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Jonathan <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 09:54:12AM +0530, Sai Prakash Ranjan wrote:
> Hi Rob,
> 
> On 2021-01-08 22:16, Rob Clark wrote:
> >On Fri, Jan 8, 2021 at 6:05 AM Sai Prakash Ranjan
> ><saiprakash.ranjan@codeaurora.org> wrote:
> >>
> >>On 2021-01-08 19:09, Konrad Dybcio wrote:
> >>>> Konrad, can you please test this below change without your change?
> >>>
> >>> This brings no difference, a BUG still happens. We're still calling
> >>> to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330
> >>> into an A640..
> >>>
> >>> Also, relying on disabling LLCC in the config is out of question as it
> >>> makes the arm32 kernel not compile with DRM/MSM and it just removes
> >>> the functionality on devices with a6xx.. (unless somebody removes the
> >>> dependency on it, which in my opinion is even worse and will cause
> >>> more problems for developers!).
> >>>
> >>
> >>Disabling LLCC is not the suggestion, I was under the impression that
> >>was the cause here for the smmu bug. Anyways, the check for llc slice
> >>in case llcc is disabled is not correct as well. I will send a patch for
> >>that as well.
> >>
> >>> The bigger question is how and why did that piece of code ever make it
> >>> to adreno_gpu.c and not a6xx_gpu.c?
> >>>
> >>
> >>My mistake, I will move it.
> >
> >Thanks, since we don't have kernel-CI coverage for gpu, and there
> >probably isn't one person who has all the different devices supported
> >(or enough hours in the day to test them all), it is probably
> >better/safer to keep things in the backend code that is specific to a
> >given generation.
> >
> 
> Agreed, I will post this change soon and will introduce some feature
> check as well because we will need it for iommu prot flag as per discussion
> here - https://lore.kernel.org/lkml/20210108181830.GA5457@willie-the-truck/
> 
> >>> To solve it in a cleaner way I propose to move it to an a6xx-specific
> >>> file, or if it's going to be used with next-gen GPUs, perhaps manage
> >>> calling of this code via an adreno quirk/feature in adreno_device.c.
> >>> Now that I think about it, A5xx GPMU en/disable could probably managed
> >>> like that, instead of using tons of if-statements for each GPU model
> >>> that has it..
> >>>
> >>> While we're at it, do ALL (and I truly do mean ALL, including the
> >>> low-end ones, this will be important later on) A6xx GPUs make use of
> >>> that feature?
> >>>
> >>
> >>I do not have a list of all A6XX GPUs with me currently, but from what
> >>I know, A618, A630, A640, A650 has the support.
> >>
> >
> >From the PoV of bringing up new a6xx, we should probably consider that
> >some of them may not *yet* have LLCC enabled.  I have an 8cx laptop
> >and once I find time to get the display working, the next step would
> >be bringing up a680.. and I'd probably like to start without LLCC..
> >
> 
> Right, once I move the LLCC code to a6xx specific address space creation,
> without LLCC slices for GPU specified in qcom llcc driver, we will not
> be using it.

Right. The problem here was that we were assuming an a6xx container in generic
code. Testing the existence of LLCC or not is a different problem but it is my
understanding that if we set the attribute without LLCC enabled it just gets
ignored. Is that correct Sai?

Jordan

> Thanks,
> Sai
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
