Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD831215338
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1556A6E321;
	Mon,  6 Jul 2020 07:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C816EB2C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 16:59:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593795560; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+gnWJZLQFOi3Y3xgbq+Jj83g8jf7HMQgZHy7FN5ldrA=;
 b=EjIuvl78ZmKmI6Au48AVCGhtr+kNqmihYQTsyl8VqwR6K+ZEVikpy/b0aQyYItbco/D7Mhv3
 M7kattnHUor2Z/HhH/nvTzHbZnSgQa8I1LX05DBq0OAvKsNnxaiCW/u3aZACJUkeQaUIMaG4
 nC5e5MtgXo2N+RQyT3fejwFZpxI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5eff63e6a3d8a447431620b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Jul 2020 16:59:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8AAAAC433A1; Fri,  3 Jul 2020 16:59:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CB36C433C6;
 Fri,  3 Jul 2020 16:59:16 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 03 Jul 2020 22:29:16 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCHv3 7/7] drm/msm/a6xx: Add support for using system
 cache(LLC)
In-Reply-To: <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
 <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
 <20200703133732.GD18953@willie-the-truck>
 <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
 <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
Message-ID: <c925406446bb2f6c7aead8e047672cae@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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
Cc: Will Deacon <will@kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Emil Velikov <emil.velikov@collabora.com>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sharat Masetty <smasetty@codeaurora.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-03 21:34, Rob Clark wrote:
> On Fri, Jul 3, 2020 at 7:53 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Will,
>> 
>> On 2020-07-03 19:07, Will Deacon wrote:
>> > On Mon, Jun 29, 2020 at 09:22:50PM +0530, Sai Prakash Ranjan wrote:
>> >> diff --git a/drivers/gpu/drm/msm/msm_iommu.c
>> >> b/drivers/gpu/drm/msm/msm_iommu.c
>> >> index f455c597f76d..bd1d58229cc2 100644
>> >> --- a/drivers/gpu/drm/msm/msm_iommu.c
>> >> +++ b/drivers/gpu/drm/msm/msm_iommu.c
>> >> @@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu,
>> >> uint64_t iova,
>> >>              iova |= GENMASK_ULL(63, 49);
>> >>
>> >>
>> >> +    if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
>> >> +            prot |= IOMMU_SYS_CACHE_ONLY;
>> >
>> > Given that I think this is the only user of IOMMU_SYS_CACHE_ONLY, then
>> > it
>> > looks like it should actually be a property on the domain because we
>> > never
>> > need to configure it on a per-mapping basis within a domain, and
>> > therefore
>> > it shouldn't be exposed by the IOMMU API as a prot flag.
>> >
>> > Do you agree?
>> >
>> 
>> GPU being the only user is for now, but there are other clients which
>> can use this.
>> Plus how do we set the memory attributes if we do not expose this as
>> prot flag?
> 
> It does appear that the downstream kgsl driver sets this for basically
> all mappings.. well there is some conditional stuff around
> DOMAIN_ATTR_USE_LLC_NWA but it seems based on the property of the
> domain.  (Jordan may know more about what that is about.)  But looks
> like there are a lot of different paths into iommu_map in kgsl so I
> might have missed something.
> 
> Assuming there isn't some case where we specifically don't want to use
> the system cache for some mapping, I think it could be a domain
> attribute that sets an io_pgtable_cfg::quirks flag
> 

Ok then we are good to remove unused sys cache prot flag which Will has 
posted.

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
