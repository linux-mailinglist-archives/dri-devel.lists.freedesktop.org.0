Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21333ED13
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 10:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C1E89C56;
	Wed, 17 Mar 2021 09:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-10.mailgun.net (m42-10.mailgun.net [69.72.42.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FA889C52
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 09:33:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615973608; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lZUJUo3Pug7BWyZZPzQMe4b62SCJmcae+oC4ypNhr2I=;
 b=tXhNOFwbB1qXnIEoAt2QT4FRIij5szEsVolb4nsGhI8oNCVSSNTlm8bZJZ5834bb3F5EPAFY
 U/DoZw8epQlYGgwKGtPimwXeEaBOGr0rCBXO84P4boyBiXRBAYQYIPGp7+djoVg9E0Y1WTbZ
 y4hQZclSNbpY0pJUDJv9b+a7nw8=
X-Mailgun-Sending-Ip: 69.72.42.10
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6051ccdd1de5dd7b996a07ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 09:33:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4D4B8C43465; Wed, 17 Mar 2021 09:33:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EB7DC433CA;
 Wed, 17 Mar 2021 09:33:16 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 17 Mar 2021 15:03:16 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
In-Reply-To: <CAF6AEGuc5i9hMtfU3HSpLVWi_e=emJTPLqntzJfAH69dO_gagA@mail.gmail.com>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
 <20210203214612.GB19847@willie-the-truck>
 <CAF6AEGvjzkRqr8-z56tJdMs-LsoLMr1m5cVAq_++xCdHjTPKrQ@mail.gmail.com>
 <CAF6AEGveB=t0gQ0-WZn_qy=scYR60DEcum53saovg5h31ZMHog@mail.gmail.com>
 <CAF6AEGuc5i9hMtfU3HSpLVWi_e=emJTPLqntzJfAH69dO_gagA@mail.gmail.com>
Message-ID: <d44fc38c038be1165aa8f4212bd9c91f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>, "\"
 <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, freedreno
 <freedreno@lists.freedesktop.org>, Kristian H Kristensen
 <hoegsberg@google.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 2021-03-16 22:46, Rob Clark wrote:

<snip>...

>> > >
>> > > When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also mapped
>> > > into the CPU and with what attributes? Rob said "writecombine for
>> > > everything" -- does that mean ioremap_wc() / MEMREMAP_WC?
>> >
>> > Currently userspace asks for everything WC, so pgprot_writecombine()
>> >
>> > The kernel doesn't enforce this, but so far provides no UAPI to do
>> > anything useful with non-coherent cached mappings (although there is
>> > interest to support this)
>> >
>> 
>> btw, I'm looking at a benchmark (gl_driver2_off) where (after some
>> other in-flight optimizations land) we end up bottlenecked on writing
>> to WC cmdstream buffers.  I assume in the current state, WC goes all
>> the way to main memory rather than just to system cache?
>> 
> 
> oh, I guess this (mentioned earlier in thread) is what I really want
> for this benchmark:
> 
> https://android-review.googlesource.com/c/kernel/common/+/1549097/3
> 

You can also check if the system cache lines are allocated for GPU
or not with patch in https://crrev.com/c/2766723

With the above patch applied,
cat /sys/kernel/debug/llcc_stats/llcc_scid_status

The SCIDs for GPU are listed in include/linux/soc/qcom/llcc-qcom.h

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
