Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C882C1F8E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8270F6E283;
	Tue, 24 Nov 2020 08:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4DB6E051
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 16:43:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606149800; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=leBQOMx6/skeowlXzbnIlowNJeAVezu2dq92/PVNvAc=;
 b=tMvIv/dK5V+sexXwWq7c01S6oLM83UXliPyKIxQ7aOpeRgLyxWsoUAOgBI97+HMg6p+TQWFf
 xFZoXI+QfTroq2nuTxxn0SMIuDjQw3aYBZjBlMI7UNz+waPQCDLTo/cYc2cXX0cL+1H2iAIk
 EYtkQLcTXWEMCb3Ub4oJ496uNYA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fbbe6a19e87e16352710495 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 16:43:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9F693C43463; Mon, 23 Nov 2020 16:43:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7209BC43464;
 Mon, 23 Nov 2020 16:43:10 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 22:13:10 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv8 3/8] iommu/arm-smmu: Move non-strict mode to use
 domain_attr_io_pgtbl_cfg
In-Reply-To: <20201123151930.GD11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <672a1cf7bbfc43ab401a2c157dafa0e9099e67a2.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123151930.GD11033@willie-the-truck>
Message-ID: <956bb794ffd144b3eff76686619aa93e@codeaurora.org>
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
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, dri-devel@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 20:49, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:42PM +0530, Sai Prakash Ranjan wrote:
>> Now that we have a struct domain_attr_io_pgtbl_cfg with quirks,
>> use that for non_strict mode as well thereby removing the need
>> for more members of arm_smmu_domain in the future.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 7 ++-----
>>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 -
>>  2 files changed, 2 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 7b05782738e2..5f066a1b7221 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -786,9 +786,6 @@ static int arm_smmu_init_domain_context(struct 
>> iommu_domain *domain,
>>  			goto out_clear_smmu;
>>  	}
>> 
>> -	if (smmu_domain->non_strict)
>> -		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> -
>>  	if (smmu_domain->pgtbl_cfg.quirks)
>>  		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
>> 
>> @@ -1527,7 +1524,7 @@ static int arm_smmu_domain_get_attr(struct 
>> iommu_domain *domain,
>>  	case IOMMU_DOMAIN_DMA:
>>  		switch (attr) {
>>  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			*(int *)data = smmu_domain->non_strict;
>> +			*(int *)data = smmu_domain->pgtbl_cfg.quirks;
> 
> Probably better to compare with IO_PGTABLE_QUIRK_NON_STRICT here even 
> though
> we only support this one quirk for DMA domains atm.
> 

Ok will do, thanks.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
