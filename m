Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7D12C1F8B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9646E241;
	Tue, 24 Nov 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10276E05A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 17:02:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606150926; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OMLlds5ZASBxc6VI9c5Wt8OmEB5BECKe6YXf0Nc2/+A=;
 b=tZ11JrKkuR3OrbX2FAMeKMGxqmmMH8OpLVDdjBe64xewjCBAQnaqX4ZlFuCykSlJXOzws1bN
 /KcO5Cdw7oodBvZ8qD76JLLeoW23WvmYcRbleek7k3WX0ox1PLPw640PcRnCjF9UeT6JuTXD
 eHLbPM8eCBGTAmf6RzN14rrgYLA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fbbeafe1dba509aaecd2e3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 17:01:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8370C43465; Mon, 23 Nov 2020 17:01:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A71EC433C6;
 Mon, 23 Nov 2020 17:01:48 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 22:31:48 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
In-Reply-To: <20201123152146.GE11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
Message-ID: <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, "Kristian H .
 Kristensen" <hoegsberg@google.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 20:51, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
>> Some hardware variants contain a system cache or the last level
>> cache(llc). This cache is typically a large block which is shared
>> by multiple clients on the SOC. GPU uses the system cache to cache
>> both the GPU data buffers(like textures) as well the SMMU pagetables.
>> This helps with improved render performance as well as lower power
>> consumption by reducing the bus traffic to the system memory.
>> 
>> The system cache architecture allows the cache to be split into slices
>> which then be used by multiple SOC clients. This patch series is an
>> effort to enable and use two of those slices preallocated for the GPU,
>> one for the GPU data buffers and another for the GPU SMMU hardware
>> pagetables.
>> 
>> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
>> Patch 7 and 8 are minor cleanups for arm-smmu impl.
>> 
>> Changes in v8:
>>  * Introduce a generic domain attribute for pagetable config (Will)
>>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
>>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config 
>> (Will)
> 
> Modulo some minor comments I've made, this looks good to me. What is 
> the
> plan for merging it? I can take the IOMMU parts, but patches 4-6 touch 
> the
> MSM GPU driver and I'd like to avoid conflicts with that.
> 

SMMU bits are pretty much independent and GPU relies on the domain 
attribute
and the quirk exposed, so as long as SMMU changes go in first it should 
be good.
Rob?

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
