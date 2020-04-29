Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012E91BD8D7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 11:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D826EA96;
	Wed, 29 Apr 2020 09:55:25 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADAB6EA94
 for <dri-devel@freedesktop.org>; Wed, 29 Apr 2020 09:55:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588154123; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3iXUY6EYpmcQbL2bjsrp6J9NTxmranLuwsV6XKvgXqY=;
 b=KDzoDVd+e77z84IEkU6YgpXbq9Bh54WHwsp0kdi1Qzez5INl7HtOjhcadksNLyhj2g2S+cqr
 7lWv5E+IcAIc4bB17synA683LM+9jJ3Um/HPti8poomBGxSHkME6iGOT8WDH+nC3wmBnvzAI
 3JgxuvziUR5GpI7FiW822MIwTvw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea94f0a.7fe57f375110-smtp-out-n03;
 Wed, 29 Apr 2020 09:55:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DB712C432C2; Wed, 29 Apr 2020 09:55:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.227] (unknown [49.204.176.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 07F91C433D2;
 Wed, 29 Apr 2020 09:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07F91C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Add a new compatible string and a
 clock
To: Doug Anderson <dianders@chromium.org>
References: <1588073914-15712-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
From: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <9aece4ec-6a14-ea73-fe9c-5f097a018354@codeaurora.org>
Date: Wed, 29 Apr 2020 15:25:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
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
Cc: tdas@codeaurora.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/29/2020 3:57 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Apr 28, 2020 at 4:39 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>> This patch adds a new compatible string for sc7180 and also an
>> additional clock listing needed to power the TBUs and the TCU.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
> nit: mention sc7180 in subject, like:
>
> dt-bindings: arm-smmu: Add sc7180 compatible string and mem_iface clock
>
>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 6515dbe..15946ac 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -28,6 +28,7 @@ properties:
>>             - enum:
>>                 - qcom,msm8996-smmu-v2
>>                 - qcom,msm8998-smmu-v2
>> +              - qcom,sc7180-smmu-v2
>>                 - qcom,sdm845-smmu-v2
>>             - const: qcom,smmu-v2
>>
>> @@ -113,16 +114,22 @@ properties:
>>         present in such cases.
>>
>>     clock-names:
>> +    minItems: 2
>> +    maxItems: 3
>>       items:
>>         - const: bus
>>         - const: iface
>> +      - const: mem_iface_clk
> People usually frown on clock-names ending in "_clk".  Just name it "mem_iface".
>
>
>>     clocks:
>> +    minItems: 2
>> +    maxItems: 3
>>       items:
>>         - description: bus clock required for downstream bus access and for the
>>             smmu ptw
>>         - description: interface clock required to access smmu's registers
>>             through the TCU's programming interface.
>> +      - description: clock required for the SMMU TBUs and the TCU
> Is this clock only needed for sc7180, or would it be useful if we
> enabled certain features on existing devices?  Please document exactly
> when someone would provide this clock and when they'd leave it off.
>
> ...also: maybe it's obvious to those that understand IOMMUs in depth,
> but to me I have no idea what your description means and why it's
> different from the other two clocks.  Any way you could punch up your
> description a little bit?
>
> Looking at sdm845 I see that this clock seems to exist but wasn't
> listed in the IOMMU device tree node.  Is that a mistake on sdm845?
> ...or is it just fine because the GPU holds the clock?  Is there a
> reason the sdm845 solution and the sc7180 solution shouldn't be the
> same (AKA we should either add this clock to the sdm845 device tree
> file or remove it from sc7180)?

I went and checked the downstream SDM845 device tree for GPU SMMU and I 
do see this clock listed on there. I am no expert in SMMU either but my 
understanding is that this clock is needed for core working of the SMMU 
like the pagetable walks, TLB invalidations etc, whereas the other two 
clocks are required to access SMMU register space from the host.My 
proposal is to add this clock to SDM845 as well as a follow up effort so 
that we can remove the Min/MaxItems properties which I do not like.

@Jordan, do you remember why this clock was added to SDM845?

> Thanks!
>
> -Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
