Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE32C1F80
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2EA6E216;
	Tue, 24 Nov 2020 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FE46E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 16:42:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606149751; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BA4PcbiZ9C47lYPVovvBsIy3njEFvvWJDKuQ323HHlM=;
 b=nBFuQ+qqfqG1MHv5f3YTv0zhCxpkGVaEb/4FSVM5amr8DOFlhGvvj/oJqqb1lqyxTT+x6nte
 Fm50wTmADzCeZjkqKhv/PPgWkj0ujKx0keSJYN0XazSIPOU99zmXyVEWCqfHRzTuJB2agVYI
 +ZFYXSwXeyISKBawYaJfEvcYDUA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fbbe675fa67d9becfa517b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 16:42:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C72A0C43468; Mon, 23 Nov 2020 16:42:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9AFA6C433C6;
 Mon, 23 Nov 2020 16:42:27 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 22:12:27 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv8 2/8] iommu/arm-smmu: Add domain attribute for pagetable
 configuration
In-Reply-To: <20201123151857.GC11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <3dfbc9d6d4489ca90361fac4e64586434331792f.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123151857.GC11033@willie-the-truck>
Message-ID: <0907c051561caa178365730c2ca8bccf@codeaurora.org>
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

On 2020-11-23 20:48, Will Deacon wrote:
> On Tue, Nov 17, 2020 at 08:00:41PM +0530, Sai Prakash Ranjan wrote:
>> Add iommu domain attribute for pagetable configuration which
>> initially will be used to set quirks like for system cache aka
>> last level cache to be used by client drivers like GPU to set
>> right attributes for caching the hardware pagetables into the
>> system cache and later can be extended to include other page
>> table configuration data.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 25 +++++++++++++++++++++++++
>>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>>  include/linux/io-pgtable.h            |  4 ++++
>>  include/linux/iommu.h                 |  1 +
>>  4 files changed, 31 insertions(+)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 0f28a8614da3..7b05782738e2 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -789,6 +789,9 @@ static int arm_smmu_init_domain_context(struct 
>> iommu_domain *domain,
>>  	if (smmu_domain->non_strict)
>>  		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
>> 
>> +	if (smmu_domain->pgtbl_cfg.quirks)
>> +		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
>> +
>>  	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
>>  	if (!pgtbl_ops) {
>>  		ret = -ENOMEM;
>> @@ -1511,6 +1514,12 @@ static int arm_smmu_domain_get_attr(struct 
>> iommu_domain *domain,
>>  		case DOMAIN_ATTR_NESTING:
>>  			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
>>  			return 0;
>> +		case DOMAIN_ATTR_IO_PGTABLE_CFG: {
>> +			struct domain_attr_io_pgtbl_cfg *pgtbl_cfg = data;
>> +			*pgtbl_cfg = smmu_domain->pgtbl_cfg;
>> +
>> +			return 0;
>> +		}
>>  		default:
>>  			return -ENODEV;
>>  		}
>> @@ -1551,6 +1560,22 @@ static int arm_smmu_domain_set_attr(struct 
>> iommu_domain *domain,
>>  			else
>>  				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
>>  			break;
>> +		case DOMAIN_ATTR_IO_PGTABLE_CFG: {
>> +			struct domain_attr_io_pgtbl_cfg *pgtbl_cfg = data;
>> +
>> +			if (smmu_domain->smmu) {
>> +				ret = -EPERM;
>> +				goto out_unlock;
>> +			}
>> +
>> +			if (!pgtbl_cfg) {
> 
> Do we really need to check this? If somebody passed us a NULL pointer 
> then
> they have a bug and we don't check this for other domain attributes 
> afaict.
> 

True, I'll drop it.

>> +				ret = -ENODEV;
>> +				goto out_unlock;
>> +			}
>> +
>> +			smmu_domain->pgtbl_cfg = *pgtbl_cfg;
>> +			break;
>> +		}
>>  		default:
>>  			ret = -ENODEV;
>>  		}
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 04288b6fc619..18fbed376afb 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -364,6 +364,7 @@ enum arm_smmu_domain_stage {
>>  struct arm_smmu_domain {
>>  	struct arm_smmu_device		*smmu;
>>  	struct io_pgtable_ops		*pgtbl_ops;
>> +	struct domain_attr_io_pgtbl_cfg	pgtbl_cfg;
>>  	const struct iommu_flush_ops	*flush_ops;
>>  	struct arm_smmu_cfg		cfg;
>>  	enum arm_smmu_domain_stage	stage;
>> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
>> index a9a2c59fab37..686b37d48743 100644
>> --- a/include/linux/io-pgtable.h
>> +++ b/include/linux/io-pgtable.h
>> @@ -212,6 +212,10 @@ struct io_pgtable {
>> 
>>  #define io_pgtable_ops_to_pgtable(x) container_of((x), struct 
>> io_pgtable, ops)
>> 
>> +struct domain_attr_io_pgtbl_cfg {
>> +	unsigned long quirks;
>> +};
> 
> nit: Can you rename this to 'struct io_pgtable_domain_attr' please?
> 

Done, thanks.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
