Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12821C0F21
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 10:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5009D6EA90;
	Fri,  1 May 2020 08:08:20 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3FC6EC1B
 for <dri-devel@freedesktop.org>; Fri,  1 May 2020 08:08:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588320498; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=qcrL4Oy4sFTZZxhYPssgoqySFm5x5kTnylNldDFq1lo=;
 b=dpF3TmpqBkAc0WoJuyH2DJWD3yzScvyG6EE4re+IBLdGEyAylt8Ze+1jiMVqBF1My20bthcq
 ZxxL3nfEkTR2rcE7YFKlTnRQxPEMhCz/Z11e3W3G5HQcPiRT+CUvxk7AAawab3Kxjo6itU3X
 O5g9BRjwAlNt1swYEtVXQ3eDRVI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eabd8e7.7f9c7552e618-smtp-out-n05;
 Fri, 01 May 2020 08:08:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A54C0C43636; Fri,  1 May 2020 08:08:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [49.204.180.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2FB1C433CB;
 Fri,  1 May 2020 08:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2FB1C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [Freedreno] [PATCH v2] dt-bindings: arm-smmu: Add sc7180
 compatible string and mem_iface clock
To: Doug Anderson <dianders@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
References: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
 <20200430181233.GA21991@jcrouse1-lnx.qualcomm.com>
 <CAD=FV=Usp5RxgXtjtgBe6jR3o=-+EXkYZuVzx_AF3=BsVu+OeA@mail.gmail.com>
From: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <d310dd37-edab-2218-7ee6-40b1aba6633b@codeaurora.org>
Date: Fri, 1 May 2020 13:38:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Usp5RxgXtjtgBe6jR3o=-+EXkYZuVzx_AF3=BsVu+OeA@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/30/2020 11:51 PM, Doug Anderson wrote:
> Hi,
>
> On Thu, Apr 30, 2020 at 11:12 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>> On Thu, Apr 30, 2020 at 09:29:47AM +0530, Sharat Masetty wrote:
>>> This patch adds a new compatible string for sc7180 and also an
>>> additional clock listing needed to power the TBUs and the TCU.
>>>
>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>> ---
>>> v2: Addressed review comments from Doug
>>>
>>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> index 6515dbe..ba5dba4 100644
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -28,6 +28,7 @@ properties:
>>>             - enum:
>>>                 - qcom,msm8996-smmu-v2
>>>                 - qcom,msm8998-smmu-v2
>>> +              - qcom,sc7180-smmu-v2
>>>                 - qcom,sdm845-smmu-v2
>>>             - const: qcom,smmu-v2
>>>
>>> @@ -113,16 +114,23 @@ properties:
>>>         present in such cases.
>>>
>>>     clock-names:
>>> +    minItems: 2
>>> +    maxItems: 3
>>>       items:
>>>         - const: bus
>>>         - const: iface
>>> +      - const: mem_iface
>> Hi Sharat -
>>
>> I think there was a bit of confusion due to renaming between downstream and
>> upstream.  Currently for the sdm845 and friends we have:
>>
>>    clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>       <&gcc GCC_GPU_CFG_AHB_CLK>;
>>    clock-names = "bus", "iface";
>>
>> Confusingly these same clocks downstream are "mem_iface_clk" and "iface_clk"
>> respectively.
>>
>> It looks like you are trying to add GCC_DDRSS_GPU_AXI_CLK as "mem_iface" which
>> was formerly "mem_clk" downstream. I'm not sure if the naming change is
>> intentional or you were trying to make upstream and downstream match and didn't
>> realize that they were renamed.
>>
>> I'm not sure if we need DDRSS_GPU_AXI_CLK or not. Empirically it works without
>> it for sdm845 (I don't have a sc7180 to test) but we should probably loop back
>> with either the clock team or the hardware designers to be sure there isn't a
>> corner case that is missing. I agree with Doug that its always best if we don't
>> need to add a clock.

Thanks Jordan and Doug for the updates. My intention was to add the 
third clock as listed downstream, but as you said the naming is a bit 
misleading. From the clock GCC_DDRSS_GPU_AXI_CLK description, this is 
needed for the GPU to DDR access and all transactions to the DDR from 
the GPU go through the SMMU. It is listed in the SMMU dt node because 
its needed by SMMU to perform pagetable walks.

I think we may be fine by not listing this clock in the SMMU node 
because the same clock is listed in both the GMU and also the GPU.

> I can confirm that on sc7180 the GPU seems to come up just fine
> without the clock being specified in the iommu node.  Definitely would
> be good to know what's broken and if nothing is broken maybe we can
> change this patch to just add the sc7180 compatible string and drop
> the clock.  I do note that the GMU already has a reference to the same
> "GCC_DDRSS_GPU_AXI_CLK" clock.
>
> -Doug
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
