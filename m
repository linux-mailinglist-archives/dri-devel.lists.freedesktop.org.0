Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7542C3AAA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DCA6E86A;
	Wed, 25 Nov 2020 08:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7CD6E833
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 06:58:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606287514; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LrICIdDLfpZKH7ljsAEC0wOYB0ntNG1+5ilRwexAuoU=;
 b=YgQ8bQz7+khyQbS0+LahEtuMsgrElUQeL3RW57h9SWd3ScqNgFHNEqVhyxtTBHSa5yZsXmsd
 9BA+Ry7/t8DtCUqK8SxIjJXlGKTq5YU7LQPaE2sduCoHWIwUvnrLajy89btyrMkwUn2eUevC
 9XIMhohhz5WLhuT2wwUBRZSgATg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fbe008d77b63cdb345e8b98 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 06:58:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 052FEC433ED; Wed, 25 Nov 2020 06:58:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03716C433C6;
 Wed, 25 Nov 2020 06:58:18 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 25 Nov 2020 12:28:18 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCHv9 2/8] iommu/arm-smmu: Add domain attribute for pagetable
 configuration
In-Reply-To: <20201124214134.GB14252@willie-the-truck>
References: <cover.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <122e7b3050c51ee2e3637fca0b3967b4c3dc2bac.1606150259.git.saiprakash.ranjan@codeaurora.org>
 <20201124214134.GB14252@willie-the-truck>
Message-ID: <b56ec844e2c059d0c6d8de3424a0cce7@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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

On 2020-11-25 03:11, Will Deacon wrote:
> On Mon, Nov 23, 2020 at 10:35:55PM +0530, Sai Prakash Ranjan wrote:
>> Add iommu domain attribute for pagetable configuration which
>> initially will be used to set quirks like for system cache aka
>> last level cache to be used by client drivers like GPU to set
>> right attributes for caching the hardware pagetables into the
>> system cache and later can be extended to include other page
>> table configuration data.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++++
>>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>>  include/linux/io-pgtable.h            |  4 ++++
>>  include/linux/iommu.h                 |  1 +
>>  4 files changed, 26 insertions(+)
> 
> Given that we're heading for a v10 to address my comments on patch 3,
> then I guess you may as well split this into two patches so that I can
> share just the atttibute with Rob rather than the driver parts.
> 
> Please keep it all as one series though, with the common parts at the
> beginning, and I'll figure it out.
> 

Ok I will split up and send v10.

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
