Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF99D3E866B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 01:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0D989EB8;
	Tue, 10 Aug 2021 23:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0488972D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 23:24:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628637879; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zx8YddFJh59+5EnrQhywAgtFI/9rzkZOrxfXUeR4R9I=;
 b=VCwSoqFVG1i4w5ivHjA4enEzVQn22pg1/MB6zkQrS61JidNfifrKC24q4KhnIFmyTEfjoXNI
 Udj6PEMwABhE3QyIRSxQj2qjYN/rQqI2L1YE38pNFw8toEyq6SUajk+xnyV8Vg/T5xkRtCpX
 yFrQmiKTPDc8Ch7mopz8Jic1bCc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61130aad7ee60409779d45c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 23:24:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8217FC433D3; Tue, 10 Aug 2021 23:24:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FB33C433D3;
 Tue, 10 Aug 2021 23:24:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 10 Aug 2021 16:24:26 -0700
From: abhinavk@codeaurora.org
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: add support for dsi test pattern
 generator
In-Reply-To: <1cc300dc-7647-0431-fe05-d5504c337652@somainline.org>
References: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
 <61cdcd07-5bff-a8ae-7156-b85b9c6c8801@somainline.org>
 <f6235d170811ad02bf6321dcb5ef3568@codeaurora.org>
 <1cc300dc-7647-0431-fe05-d5504c337652@somainline.org>
Message-ID: <82699a2eb95fa619e772551f2a500921@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

Hi Marijn

Thanks for reviewing and testing the latest patchset.

On 2021-08-10 15:59, Marijn Suijten wrote:
> Hi Abhinav,
> 
> On 7/16/21 2:01 AM, abhinavk@codeaurora.org wrote:
>> Hi Marijn
>> 
>> Sorry for the late response.
> 
> 
> Apologies from my side as well.
> 
> [...]
> 
>>>> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host
>>>> *msm_host)
>>>> +{
>>>> +	u32 reg;
>>>> +
>>>> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
>>>> +
>>>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0,
>>>> 0xff);
>>>> +
>>>> +	reg |= (0x3 << 0x8);
>>>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
>>>> +	/* draw checkered rectangle pattern */
>>>> +	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));
>>> 
>>> 
>>> How about BIT(7)?
>> 
>> You mean BIT(7) of REG_DSI_TPG_MAIN_CONTROL2? Thats what this is 
>> right?
>> Did you mean some other bit?
> 
> 
> I meant to replace (0x1 << 0x7) with BIT(7), but replacing it with
> DSI_TPG_MAIN_CONTROL2_CMD_MDP0_CHECKERED_RECTANGLE_PATTERN is even
> better, thanks.
> 
>> 
>>> 
>>> On SM6125 this seems to change the color intensity of the pattern; it
>>> is always colored lines of a few pixels wide alternating R, B and G
>>> from left to right.  Is it possible to document the meaning and
>>> available values of these registers, especially if they differ 
>>> between
>>> SoC / DSI block?
>>> 
>> 
>> I have requested access for SM6125, will check this register on that 
>> to
>> see if there
>> is any difference.
>> 
>> Are you saying you are not seeing a rectangular checkered pattern 
>> while
>> testing?
> 
> 
> Correct.  It's fixed now, and this patch already proves its
> usefulness!  We had two minor configuration issues, and are now seeing
> the squares just like on the other SoCs.  Meaning we can finally move
> on to configuring the DPU, thanks!
> 

Thats good to know !

>> Also are you testing on command mode or video mode?
> 
> 
> Command mode, if it's still worth anything.
Thats good to know too, as I had not been able to test command mode.
> 
>> As requested by Rob, I will add the bit definitions and update the
>> dsi.xml.h in the
>> next patchset for the registers and the bits which I am using here.
>> 
>> With that the meaning of these bits will be more clear.
>> 
>> I dont think I will be able to document all the bits because the goal 
>> of
>> this patch
>> was only to draw a test pattern to help with validation. Different 
>> bits
>> of the REG_DSI_TPG_MAIN_CONTROL2
>> register only draw different patterns so the goal wasnt that we can 
>> draw
>> any pattern, it was just to
>> draw some pattern on the screen.
>> 
>> When we add support for all other patterns, we can expose those bits 
>> as
>> well but it should not
>> be required in my opinion.
> 
> 
> Understandable.  I'm curious if other patterns are useful in certain
> situations, like DSC?  Other than that, knowing that the DSI and PHY
> is correct is good enough for us.

The TPG in this patch is only for the DSI block which is after the DSC 
block.
So any pattern we pick from the DSI_TPG_MAIN_CONTROL2 register (using 
any other bit)
will only look different visually but will still be from DSI and no 
other block.
So it will not help to validate DSC block individually.

> 
>> 
>>> Kind regards,
>>> Marijn
>>> 
>>>> +	DBG("Cmd test pattern setup done\n");
>>>> +}
>>> [...]
> 
> 
> Thanks!
> Marijn
