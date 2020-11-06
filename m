Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E262A9054
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 08:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63A16E075;
	Fri,  6 Nov 2020 07:30:14 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443CF6E075
 for <dri-devel@freedesktop.org>; Fri,  6 Nov 2020 07:30:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604647813; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZGXXuu6qBXSfftqrulNTywUK6S0YxZhWGm7WSxymbYY=;
 b=vah3pzOCWoOto6fFYFSa/p/keLXfdHZFnjoGZ5SV2pK4rZMBmvDTPPParo1vA/3I2PdqcDDt
 ge1WGG1dn0RlSb/GWMSuhMOc7Nu1vaRvXIqjq05zBwZGQdcjKMcfn4eVyVTlymxLP96Z4Zvc
 1h4ri00sD5z/6GvtsWMDOOYUT20=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fa4fb8198aeba5841bf4eb8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 07:30:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3B14DC433CB; Fri,  6 Nov 2020 07:30:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.190.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8529EC433C8;
 Fri,  6 Nov 2020 07:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8529EC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [Freedreno] [PATCH v5 3/3] dt-bindings: drm/msm/gpu: Add cooling
 device support
To: Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
 <20201104200300.GA4036650@bogus>
 <CAF6AEGvj34MbnRS+A432AhOwMuL2BtTXJ+AD+zQ9w0_meV_-gw@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <8c28fe20-fbcf-5076-fad8-107073df63a5@codeaurora.org>
Date: Fri, 6 Nov 2020 13:00:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvj34MbnRS+A432AhOwMuL2BtTXJ+AD+zQ9w0_meV_-gw@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/2020 2:28 AM, Rob Clark wrote:
> On Wed, Nov 4, 2020 at 12:03 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, 30 Oct 2020 16:17:12 +0530, Akhil P Oommen wrote:
>>> Add cooling device support to gpu. A cooling device is bound to a
>>> thermal zone to allow thermal mitigation.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>>> ---
>>>   Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>
>>
>> Please add Acked-by/Reviewed-by tags when posting new versions. However,
>> there's no need to repost patches *only* to add the tags. The upstream
>> maintainer will do that for acks received on the version they apply.
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
> 
> 
> Thanks Rob
> 
> I've copied over your ack from the previous version.. but yes, it
> definitely makes my life easier when patch senders do this for me ;-)
> 
> BR,
> -R
> 
Robh, you Acked v4 after I shared v5 patches!!

-Akhil.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
