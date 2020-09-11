Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF372662D5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 18:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A36B6E073;
	Fri, 11 Sep 2020 16:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D45F96E073;
 Fri, 11 Sep 2020 16:03:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E33F106F;
 Fri, 11 Sep 2020 09:03:15 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88D43F73C;
 Fri, 11 Sep 2020 09:03:11 -0700 (PDT)
Subject: Re: [PATCHv4 6/6] iommu: arm-smmu-impl: Remove unwanted extra blank
 lines
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
 <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c26b5317-f12d-8be9-be45-3307ce5efbfc@arm.com>
Date: Fri, 11 Sep 2020 17:03:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <010101747d912d9f-c8050b8d-1e81-4be0-ac35-b221f657b490-000000@us-west-2.amazonses.com>
Content-Language: en-GB
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
Cc: linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-11 15:28, Sai Prakash Ranjan wrote:
> There are few places in arm-smmu-impl where there are
> extra blank lines, remove them

FWIW those were deliberate - sometimes I like a bit of subtle space to 
visually delineate distinct groups of definitions. I suppose it won't be 
to everyone's taste :/

> and while at it fix the
> checkpatch warning for space required before the open
> parenthesis.

That one, however, was not ;)

BTW am I supposed to have received 3 copies of everything? Because I did...

Robin.

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index ce78295cfa78..f5b5218cbe5b 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -19,7 +19,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>   
>   static int arm_smmu_gr0_ns(int offset)
>   {
> -	switch(offset) {
> +	switch (offset) {
>   	case ARM_SMMU_GR0_sCR0:
>   	case ARM_SMMU_GR0_sACR:
>   	case ARM_SMMU_GR0_sGFSR:
> @@ -54,7 +54,6 @@ static const struct arm_smmu_impl calxeda_impl = {
>   	.write_reg = arm_smmu_write_ns,
>   };
>   
> -
>   struct cavium_smmu {
>   	struct arm_smmu_device smmu;
>   	u32 id_base;
> @@ -110,7 +109,6 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
>   	return &cs->smmu;
>   }
>   
> -
>   #define ARM_MMU500_ACTLR_CPRE		(1 << 1)
>   
>   #define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
> @@ -197,7 +195,6 @@ static const struct arm_smmu_impl mrvl_mmu500_impl = {
>   	.reset = arm_mmu500_reset,
>   };
>   
> -
>   struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   {
>   	const struct device_node *np = smmu->dev->of_node;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
