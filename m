Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386CB2F2985
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC856E077;
	Tue, 12 Jan 2021 07:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5879689FA0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 06:49:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610434178; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=J/gXo0SfG2tE4eEiy9hfkib22kuMNt3ssI4CovuJIXE=;
 b=cXAPiU9ruE4p2UwJYJ/umqqF5ZHsBrgXIFfxu1IsRrHhUkV6smpskMuskFI8lom/exUlQubc
 pgYJADBgoHErAc/xsB6RdD//XSoFNE7juLkCq1XN8IM9UY++ER6gTlQJ4haK7AF/0JxZFr3i
 zvCLdcHl3FMJn11DZGyx/X3Ew58=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ffd4678415a6293c5d55200 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Jan 2021 06:49:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 61D2AC433C6; Tue, 12 Jan 2021 06:49:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B029C433CA;
 Tue, 12 Jan 2021 06:49:27 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 12 Jan 2021 12:19:27 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
In-Reply-To: <20210111161115.GB29638@jcrouse1-lnx.qualcomm.com>
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
 <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
 <43c8779bc5f03be2e8072c6484dfcabb@codeaurora.org>
 <CAF6AEGsd5B0R7H1noO+=LByx4zkdVvu1LALZWnevGbMRj76m2w@mail.gmail.com>
 <73609df52188588bf7d023e16a706a7a@codeaurora.org>
 <20210111161115.GB29638@jcrouse1-lnx.qualcomm.com>
Message-ID: <bfa4a5e84e427b6dca429136daa94693@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jordan,

On 2021-01-11 21:41, Jordan Crouse wrote:
> On Mon, Jan 11, 2021 at 09:54:12AM +0530, Sai Prakash Ranjan wrote:
>> Hi Rob,
>> 
>> On 2021-01-08 22:16, Rob Clark wrote:
>> >On Fri, Jan 8, 2021 at 6:05 AM Sai Prakash Ranjan
>> ><saiprakash.ranjan@codeaurora.org> wrote:
>> >>
>> >>On 2021-01-08 19:09, Konrad Dybcio wrote:
>> >>>> Konrad, can you please test this below change without your change?
>> >>>
>> >>> This brings no difference, a BUG still happens. We're still calling
>> >>> to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330
>> >>> into an A640..
>> >>>
>> >>> Also, relying on disabling LLCC in the config is out of question as it
>> >>> makes the arm32 kernel not compile with DRM/MSM and it just removes
>> >>> the functionality on devices with a6xx.. (unless somebody removes the
>> >>> dependency on it, which in my opinion is even worse and will cause
>> >>> more problems for developers!).
>> >>>
>> >>
>> >>Disabling LLCC is not the suggestion, I was under the impression that
>> >>was the cause here for the smmu bug. Anyways, the check for llc slice
>> >>in case llcc is disabled is not correct as well. I will send a patch for
>> >>that as well.
>> >>
>> >>> The bigger question is how and why did that piece of code ever make it
>> >>> to adreno_gpu.c and not a6xx_gpu.c?
>> >>>
>> >>
>> >>My mistake, I will move it.
>> >
>> >Thanks, since we don't have kernel-CI coverage for gpu, and there
>> >probably isn't one person who has all the different devices supported
>> >(or enough hours in the day to test them all), it is probably
>> >better/safer to keep things in the backend code that is specific to a
>> >given generation.
>> >
>> 
>> Agreed, I will post this change soon and will introduce some feature
>> check as well because we will need it for iommu prot flag as per 
>> discussion
>> here - 
>> https://lore.kernel.org/lkml/20210108181830.GA5457@willie-the-truck/
>> 
>> >>> To solve it in a cleaner way I propose to move it to an a6xx-specific
>> >>> file, or if it's going to be used with next-gen GPUs, perhaps manage
>> >>> calling of this code via an adreno quirk/feature in adreno_device.c.
>> >>> Now that I think about it, A5xx GPMU en/disable could probably managed
>> >>> like that, instead of using tons of if-statements for each GPU model
>> >>> that has it..
>> >>>
>> >>> While we're at it, do ALL (and I truly do mean ALL, including the
>> >>> low-end ones, this will be important later on) A6xx GPUs make use of
>> >>> that feature?
>> >>>
>> >>
>> >>I do not have a list of all A6XX GPUs with me currently, but from what
>> >>I know, A618, A630, A640, A650 has the support.
>> >>
>> >
>> >From the PoV of bringing up new a6xx, we should probably consider that
>> >some of them may not *yet* have LLCC enabled.  I have an 8cx laptop
>> >and once I find time to get the display working, the next step would
>> >be bringing up a680.. and I'd probably like to start without LLCC..
>> >
>> 
>> Right, once I move the LLCC code to a6xx specific address space 
>> creation,
>> without LLCC slices for GPU specified in qcom llcc driver, we will not
>> be using it.
> 
> Right. The problem here was that we were assuming an a6xx container in 
> generic
> code. Testing the existence of LLCC or not is a different problem but 
> it is my
> understanding that if we set the attribute without LLCC enabled it just 
> gets
> ignored. Is that correct Sai?
> 

Yes that is correct, I just confirmed now with LLCC team.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
