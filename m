Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E253DAB79
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 20:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFCD6EE25;
	Thu, 29 Jul 2021 18:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D156EE25
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 18:57:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627585062; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5PUhTJkxxglb4jVPAuoIGe5hJA8DvLgM1EKOS/rX92s=;
 b=GzF3b+6eafRECMP7bRIcHus146XvWVc55b9nSUNDcc2VjLzVcFdQCIQ66tJdlcCt23aCdyDZ
 OCzBEaI/mVKe+7LC+KnGrlcA22eLCD9ZlhVOGkE5ai/aGPkwFc8aMOVk85cf70VNHe25hZuT
 0dfZv4q4pnD1EKX5aPHXjJVd/7I=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6102fa1b9771b05b24bf991c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 18:57:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9AA12C4360C; Thu, 29 Jul 2021 18:57:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.229.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 990BEC43460;
 Thu, 29 Jul 2021 18:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 990BEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To: Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno
 <freedreno@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
 <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
 <CAE-0n50-1eN3wwDukJi0JoTxCKnYx8NT1Ap2r0WDftQ621iBqQ@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <308d8f1e-9f23-9d78-42cc-a42ce3463027@codeaurora.org>
Date: Fri, 30 Jul 2021 00:27:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n50-1eN3wwDukJi0JoTxCKnYx8NT1Ap2r0WDftQ621iBqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/2021 10:46 PM, Stephen Boyd wrote:
> Quoting Akhil P Oommen (2021-07-28 00:17:45)
>> On 7/27/2021 5:46 AM, Stephen Boyd wrote:
>>> Quoting Akhil P Oommen (2021-07-24 10:29:00)
>>>> Add the necessary dt nodes for gpu support in sc7280.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>>> ---
>>>> This patch has dependency on the GPUCC bindings patch here:
>>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
>>>
>>> To avoid the dependency the plain numbers can be used.
>>
>> But, won't that reduce readability and make things prone to error?
> 
> The numbers are not supposed to change so maybe it reduces readability
> but I don't see how it is prone to error.

I cross check GPU's clock list whenever there is a system level issue 
like NoC errors. So it is convenient to have the clock names here, at 
least for me. But, I will budge if it is not easy to manage the dependency.

> 
>> If
>> the other patch doesn't get picked up soon, we should try this option.
>> We like to get this patch merged in v5.15.
> 
> The clk binding is already picked up but Bjorn would need to merge it
> into the qcom tree to use it. I don't know what the plan is there.
> 

Bjorn, could you please advise here?

-Akhil.
