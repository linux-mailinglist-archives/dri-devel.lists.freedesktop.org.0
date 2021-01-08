Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C22EFF43
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28ECF6E94B;
	Sat,  9 Jan 2021 11:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787BB6E823
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 12:26:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610108784; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ltITCVK+GHt+cI16gwWol0Uz6E4S5jii+UYNG7fhJxc=;
 b=kNxDJhjRoghMnEyKpP0X6rjM7DQyJHjZb8I2Go4XE0k6/Dj9BnolyZEemq8iOhcrMat7ey2z
 Qq/oKsYv009+ZQXxZOYe9bpCDxdm0trs6Buj2RAORWbKbSFD54qZS+Px5liUREeyhwEXIWcs
 WlvUHLFDOVp1g29MRn5/y3pk8og=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ff84f6c3ef43e16539be47b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Jan 2021 12:26:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2E21BC433ED; Fri,  8 Jan 2021 12:26:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A4DCC43462;
 Fri,  8 Jan 2021 12:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A4DCC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: robdclark@gmail.com
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
Date: Fri,  8 Jan 2021 17:56:01 +0530
Message-Id: <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: sean@poorly.run, saiprakash.ranjan@codeaurora.org, jonathan@marek.ca,
 martin.botka@somainline.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 smasetty@codeaurora.org, konrad.dybcio@somainline.org, akhilpo@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 marijn.suijten@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org, airlied@redhat.com,
 phone-devel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob, Konrad,

On 2021-01-07 22:56, Rob Clark wrote:
> On Wed, Jan 6, 2021 at 8:50 PM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>>
>> On 2021-01-05 01:00, Konrad Dybcio wrote:
>> > Using this code on A5xx (and probably older too) causes a
>> > smmu bug.
>> >
>> > Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system
>> > cache(LLC)")
>> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> > Tested-by: AngeloGioacchino Del Regno
>> > <angelogioacchino.delregno@somainline.org>
>> > ---
>>
>> Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>
>> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++---------
>> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>> >  2 files changed, 17 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> > b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> > index 6cf9975e951e..f09175698827 100644
>> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> > @@ -191,8 +191,6 @@ adreno_iommu_create_address_space(struct msm_gpu
>> > *gpu,
>> >               struct platform_device *pdev)
>> >  {
>> >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> > -     struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> > -     struct io_pgtable_domain_attr pgtbl_cfg;
>> >       struct iommu_domain *iommu;
>> >       struct msm_mmu *mmu;
> >       struct msm_gem_address_space *aspace;
>> > @@ -202,13 +200,18 @@ adreno_iommu_create_address_space(struct msm_gpu
>> > *gpu,
>> >       if (!iommu)
>> >               return NULL;
>> >
>> > -     /*
>> > -      * This allows GPU to set the bus attributes required to use system
>> > -      * cache on behalf of the iommu page table walker.
>> > -      */
>> > -     if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
>> > -             pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>> > -             iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG,
>> > &pgtbl_cfg);
>> > +
>> > +     if (adreno_is_a6xx(adreno_gpu)) {
>> > +             struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> > +             struct io_pgtable_domain_attr pgtbl_cfg;
>> > +             /*
>> > +             * This allows GPU to set the bus attributes required to use system
>> > +             * cache on behalf of the iommu page table walker.
>> > +             */
>> > +             if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
>> > +                     pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>> > +                     iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG,
>> > &pgtbl_cfg);
>> > +             }
>
> I'm applying for -fixes as this is an obvious problem..  But kinda
> thinking that we should try to move it into an a6xx specific
> create_address_space() (or wrapper for the generic fxn)
>
> Sai/Jordan, could I talk one of you into trying to clean this up
> better for next cycle?
>

Looking more closely(sorry I should have before), the quirk setting
is already guarded by htw_llc_slice check but what is happening here is
that check is not proper when LLCC is disabled i.e., CONFIG_QCOM_LLCC=n.
When LLCC is disabled, htw_llc_slice is set to NULL and the !IS_ERR
check passes because it doesn't take care of NULL and quirk is
set causing bugs. So the proper fix would be to use IS_ERR_OR_NULL for
the check.

Konrad, can you please test this below change without your change?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 130661898546..3b798e883f82 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1117,7 +1117,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
        a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
        a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);

-       if (IS_ERR(a6xx_gpu->llc_slice) && IS_ERR(a6xx_gpu->htw_llc_slice))
+       if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
                a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 6cf9975e951e..dbd5cacddb9c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -206,7 +206,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
         * This allows GPU to set the bus attributes required to use system
         * cache on behalf of the iommu page table walker.
         */
-       if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
+       if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice)) {
                pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
                iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
        }


Thanks,
Sai

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
