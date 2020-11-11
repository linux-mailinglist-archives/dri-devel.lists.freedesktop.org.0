Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3732AEA8F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086D089F6D;
	Wed, 11 Nov 2020 07:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD9789C05
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 06:02:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605074616; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=19xKhDfznvGCGW+VmHaRPVkvoli1tFBpBhhWtoq6cRk=;
 b=MvlAJfDfDsQDehJjSDfX1vIYztKluVNslFpEdMSRS7K4QdNRTNFOXZpXQfxC0p8pqp2wI37v
 DUY+TPN+PY/mDelxnzT6Oi257KBSNnZBXJS9nXr5I71lWQizfaQpbTxXFnbZbkXiWmtVRMG/
 sVXUE1erU3+tZWxFMVCo/18UtYg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fab7e8340d4446125b066f9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Nov 2020 06:02:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3A441C43387; Wed, 11 Nov 2020 06:02:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B6CAC433F0;
 Wed, 11 Nov 2020 06:02:42 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 11 Nov 2020 11:32:42 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv7 1/7] iommu/io-pgtable-arm: Add support to use system
 cache
In-Reply-To: <20201110121855.GD16239@willie-the-truck>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <1d4979c0dcf649c5717605c598067b4b225ab9de.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <20201110121855.GD16239@willie-the-truck>
Message-ID: <329542c0c09054a46fa8d6d8f92ad739@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, "Kristian H .
 Kristensen" <hoegsberg@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-10 17:48, Will Deacon wrote:
> On Fri, Oct 30, 2020 at 02:53:08PM +0530, Sai Prakash Ranjan wrote:
>> Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
>> attributes set in TCR for the page table walker when
>> using system cache.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/io-pgtable-arm.c | 7 ++++++-
>>  include/linux/io-pgtable.h     | 4 ++++
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>> b/drivers/iommu/io-pgtable-arm.c
>> index a7a9bc08dcd1..a356caf1683a 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -761,7 +761,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg 
>> *cfg, void *cookie)
>> 
>>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>>  			    IO_PGTABLE_QUIRK_NON_STRICT |
>> -			    IO_PGTABLE_QUIRK_ARM_TTBR1))
>> +			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
>> +			    IO_PGTABLE_QUIRK_SYS_CACHE))
>>  		return NULL;
>> 
>>  	data = arm_lpae_alloc_pgtable(cfg);
>> @@ -773,6 +774,10 @@ arm_64_lpae_alloc_pgtable_s1(struct 
>> io_pgtable_cfg *cfg, void *cookie)
>>  		tcr->sh = ARM_LPAE_TCR_SH_IS;
>>  		tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
>>  		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
>> +	} else if (cfg->quirks & IO_PGTABLE_QUIRK_SYS_CACHE) {
>> +		tcr->sh = ARM_LPAE_TCR_SH_OS;
>> +		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
>> +		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
> 
> Given that this only applies in the case where then page-table walker 
> is
> non-coherent, I think we'd be better off renaming the quirk to 
> something
> like IO_PGTABLE_QUIRK_ARM_OUTER_WBWA and then rejecting it in the
> non-coherent case.
> 

Do you mean like below?

diff --git a/drivers/iommu/io-pgtable-arm.c 
b/drivers/iommu/io-pgtable-arm.c
index a7a9bc08dcd1..94de1f71db42 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -776,7 +776,10 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg 
*cfg, void *cookie)
         } else {
                 tcr->sh = ARM_LPAE_TCR_SH_OS;
                 tcr->irgn = ARM_LPAE_TCR_RGN_NC;
-               tcr->orgn = ARM_LPAE_TCR_RGN_NC;
+               if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
+                       tcr->orgn = ARM_LPAE_TCR_RGN_NC;
+               else
+                       tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
         }

         tg1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1;


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
