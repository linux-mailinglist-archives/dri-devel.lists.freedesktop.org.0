Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51691213D32
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 18:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50576E56A;
	Fri,  3 Jul 2020 16:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81FC6E1B6;
 Fri,  3 Jul 2020 16:04:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e22so28189398edq.8;
 Fri, 03 Jul 2020 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/kUxjEepXtiPp+5nrjETtriBB7vp52saJU42L3Q0Ek=;
 b=NXTOyAOQ4GoupnlWcTajW/yNVeDnYrfHcp4BtrD8hDhof+ZevAzYJm3TxuAGYtrvIX
 rXs7IFYPAFaAYkPSaGYVPBBgx6wUXpVU7Tf2ZSfU3HSQNZuIfqmfnlHdR+0A3wooDual
 nww+ROO2dUWuJ2ti+hBkqVqEvZ4/hV0oUVxIg0fkD2qdrTqnRvFxJTPvp4CItzB1qJ33
 WDZPCtPVHuafx+0x1a3uAUjL2W/abTWpcNOi1zYqkyWNo9TnJ1r8zsPjqs3p1NNLj7+e
 BcY9+L3RcT/CUwC72p1r8dLp4ozaSzFkg9YeIqLuX1w6Y0NorfG4CmhwiljG3gO09s6G
 0jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/kUxjEepXtiPp+5nrjETtriBB7vp52saJU42L3Q0Ek=;
 b=NYJVoX0YASdNBpw7mJ67T/lqDkCnKbaY1QEmvFQW2evecKy9zLbUQmrDc0e3eZ849v
 Qb29FW9xX9haSwBZgqd+rQLTPROdLVEGntoRoW6PjBUqSBeSM8mT7Bg7gs4aNNz3x3RU
 OahDbY3S7xtr7WSCGSzI8oFX5X/Hh/IPa+IOiyrB7rrLvSHjtDBwuyXtHRo7wOjHbLTt
 mhxk0hymz7TJrFAUX7b3/mc7fIM7P74dshNJzYDHF7AyAEBsrNnsDgvIbu43CC2XQxtn
 5Wjs2KLvByA3eioA6gxCIYMF4eCD4bw8dgeTwLRNR/9Ai/C707GegR/VCjVMHn9M5oTW
 PvDw==
X-Gm-Message-State: AOAM53277swjQD+iw6Cs44nRy6aGHNHx9YJNcDQ/SF3NMPxlZELpOTnt
 DDvq1ZKSRFqLuNTVBOVNsfYEZUsmxiYlo1g/yCY=
X-Google-Smtp-Source: ABdhPJwY+TDU+zLAlj3AXwzh91hebM+nK4d4Q98sJyCJl1eumLSurp18Wh0DJ0XCpOtgEb4A9pmtUBcHSW9aUnmJcXw=
X-Received: by 2002:aa7:c656:: with SMTP id z22mr28236616edr.101.1593792259297; 
 Fri, 03 Jul 2020 09:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
 <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
 <20200703133732.GD18953@willie-the-truck>
 <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
In-Reply-To: <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Jul 2020 09:04:49 -0700
Message-ID: <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
Subject: Re: [PATCHv3 7/7] drm/msm/a6xx: Add support for using system
 cache(LLC)
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 3, 2020 at 7:53 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Will,
>
> On 2020-07-03 19:07, Will Deacon wrote:
> > On Mon, Jun 29, 2020 at 09:22:50PM +0530, Sai Prakash Ranjan wrote:
> >> diff --git a/drivers/gpu/drm/msm/msm_iommu.c
> >> b/drivers/gpu/drm/msm/msm_iommu.c
> >> index f455c597f76d..bd1d58229cc2 100644
> >> --- a/drivers/gpu/drm/msm/msm_iommu.c
> >> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> >> @@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu,
> >> uint64_t iova,
> >>              iova |= GENMASK_ULL(63, 49);
> >>
> >>
> >> +    if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
> >> +            prot |= IOMMU_SYS_CACHE_ONLY;
> >
> > Given that I think this is the only user of IOMMU_SYS_CACHE_ONLY, then
> > it
> > looks like it should actually be a property on the domain because we
> > never
> > need to configure it on a per-mapping basis within a domain, and
> > therefore
> > it shouldn't be exposed by the IOMMU API as a prot flag.
> >
> > Do you agree?
> >
>
> GPU being the only user is for now, but there are other clients which
> can use this.
> Plus how do we set the memory attributes if we do not expose this as
> prot flag?

It does appear that the downstream kgsl driver sets this for basically
all mappings.. well there is some conditional stuff around
DOMAIN_ATTR_USE_LLC_NWA but it seems based on the property of the
domain.  (Jordan may know more about what that is about.)  But looks
like there are a lot of different paths into iommu_map in kgsl so I
might have missed something.

Assuming there isn't some case where we specifically don't want to use
the system cache for some mapping, I think it could be a domain
attribute that sets an io_pgtable_cfg::quirks flag

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
