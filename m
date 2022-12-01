Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCF963F245
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 15:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641B310E57C;
	Thu,  1 Dec 2022 14:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AB110E57C;
 Thu,  1 Dec 2022 14:06:32 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-142306beb9aso2215474fac.11; 
 Thu, 01 Dec 2022 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4QovkyEN3FI9gC12rA9+T60ZJm7m2T476/FNWKep6LI=;
 b=lJARIkAMU1NnBikMTBC1nBJTAmqLJbfbl0NIbGLRVlunD2c72jFF8wydmlnrnqSdsO
 B22vemfguyaRrjd8ARGSaZTTQ0ZZ1oZ2Ayoz3/MGEvMupNOvcgMJ49bfNi2qRnybH5V6
 YtHkZI4xcQy8f2h/V603ISNQeBTfaYevIhVJW3Y2wPpBMOYUGcBv4jS1HZJWz9wSt6UZ
 CNFZtgiOVxlgXszsovsFg1OscAYDo79OTYjkCOWhaLmJhhm2XJKRaWHrTzo218YRDmku
 DP1mGOKMi98yuJ5b6ZSXwPEnvegaVabgcPO6iuGCUKDPHikJNeJSQFWr4wS2sifkY22W
 ZPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4QovkyEN3FI9gC12rA9+T60ZJm7m2T476/FNWKep6LI=;
 b=ABTAIiyEBwktHkTN0Db53EDcunvq7hKqa8Hd4Z3cFxTv+zWYrBPIFRqCYxwrpPtJEV
 lmrKG5+F7BQwEa4U6lgMRlnJtGTVYCPsyefQ4sqWojznDXWpNKT6n/w1xTNwG/em1Bk6
 bPNGnvWJ2g4sNGCdyV6OAQsZ1X8/JIIkYkQwpmkJRWmU5+h27ecfQ4AHa5AjaJHFniKt
 BrwTdJpL9CPa9wQb+zV0+5aNxlWi/XM2TRon5ZaBvGdOqJ7/UXZ4aPS3HMSINGv6Junl
 zRwDaL30YHItPraPkCvNiU5+uXS8LCD7ic6qU7vzkMFjWWRRA7rN9esrMrXaJ7OgFbZs
 IqFA==
X-Gm-Message-State: ANoB5pkzDJy7d3qfvnmvmJylH9z3970cAgV5VATHxgs/H/bIiDXLOLs4
 gc1m9snN99ssKBMG+/Qs6JZgwl4b4RR/muVmjk97JHE/
X-Google-Smtp-Source: AA0mqf6s8lBrJO6vyrLKYp5N0XhofePbKsUweFIwwXobwIHnV5MaNW3NZ1G+1lQdzI4IQ/C/goV2bvhP2USp2d+KR1s=
X-Received: by 2002:a05:6870:7a0c:b0:143:8a81:116c with SMTP id
 hf12-20020a0568707a0c00b001438a81116cmr14756817oab.96.1669903591764; Thu, 01
 Dec 2022 06:06:31 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
 <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
 <Y4Y9SJC7gtUxP4+R@sqrt.uni.cx> <a5f73cfa-bd2a-3ab8-1e5c-253cfd832ea7@arm.com>
 <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
 <adf4a9b2-c30d-1e74-9848-7a63b3e0c674@arm.com>
 <CADnq5_PCGVhpk0TpnJKBx7BODV8xWk4hAyXM27tCxBpyS2y9gw@mail.gmail.com>
 <Y4e2NU4E6ZvFlEaL@sqrt.uni.cx> <087f62d7-7d82-4e42-305b-c48176d7d77b@arm.com>
In-Reply-To: <087f62d7-7d82-4e42-305b-c48176d7d77b@arm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Dec 2022 09:06:19 -0500
Message-ID: <CADnq5_PNggp8-Wc0wa-ph1d8Va2FHDbcPaRbvfigQ4509vfWaA@mail.gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
To: Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mikhail Krylov <sqarert@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 1, 2022 at 9:01 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-11-30 19:59, Mikhail Krylov wrote:
> > On Wed, Nov 30, 2022 at 11:07:32AM -0500, Alex Deucher wrote:
> >> On Wed, Nov 30, 2022 at 10:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>>
> >>> On 2022-11-30 14:28, Alex Deucher wrote:
> >>>> On Wed, Nov 30, 2022 at 7:54 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>>>>
> >>>>> On 2022-11-29 17:11, Mikhail Krylov wrote:
> >>>>>> On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
> >>>>>>> On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>>>>
> >>>>>>>> On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
> >>>>>>>>> On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
> >>>>>>>>>>
> >>>>>>>>>>>>> [excessive quoting removed]
> >>>>>>>>>>
> >>>>>>>>>>>> So, is there any progress on this issue? I do understand it's not a high
> >>>>>>>>>>>> priority one, and today I've checked it on 6.0 kernel, and
> >>>>>>>>>>>> unfortunately, it still persists...
> >>>>>>>>>>>>
> >>>>>>>>>>>> I'm considering writing a patch that will allow user to override
> >>>>>>>>>>>> need_dma32/dma_bits setting with a module parameter. I'll have some time
> >>>>>>>>>>>> after the New Year for that.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Is it at all possible that such a patch will be merged into kernel?
> >>>>>>>>>>>>
> >>>>>>>>>>> On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>>>>>>> Unless someone familiar with HIMEM can figure out what is going wrong
> >>>>>>>>>>> we should just revert the patch.
> >>>>>>>>>>>
> >>>>>>>>>>> Alex
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> Okay, I was suggesting that mostly because
> >>>>>>>>>>
> >>>>>>>>>> a) it works for me with dma_bits = 40 (I understand that's what it is
> >>>>>>>>>> without the original patch applied);
> >>>>>>>>>>
> >>>>>>>>>> b) there's a hint of uncertainity on this line
> >>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> >>>>>>>>>> saying that for AGP dma_bits = 32 is the safest option, so apparently there are
> >>>>>>>>>> setups, unlike mine, where dma_bits = 32 is better than 40.
> >>>>>>>>>>
> >>>>>>>>>> But I'm in no position to argue, just wanted to make myself clear.
> >>>>>>>>>> I'm okay with rebuilding the kernel for my machine until the original
> >>>>>>>>>> patch is reverted or any other fix is applied.
> >>>>>>>>>
> >>>>>>>>> What GPU do you have and is it AGP?  If it is AGP, does setting
> >>>>>>>>> radeon.agpmode=-1 also fix it?
> >>>>>>>>>
> >>>>>>>>> Alex
> >>>>>>>>
> >>>>>>>> That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=-1 doesn't
> >>>>>>>> help, it just makes 3D acceleration in games such as OpenArena stop
> >>>>>>>> working.
> >>>>>>>
> >>>>>>> Just to confirm, is the board AGP or PCIe?
> >>>>>>>
> >>>>>>> Alex
> >>>>>>
> >>>>>> It is AGP. That's an old machine.
> >>>>>
> >>>>> Can you check whether dma_addressing_limited() is actually returning the
> >>>>> expected result at the point of radeon_ttm_init()? Disabling highmem is
> >>>>> presumably just hiding whatever problem exists, by throwing away all
> >>>>>    >32-bit RAM such that use_dma32 doesn't matter.
> >>>>
> >>>> The device in question only supports a 32 bit DMA mask so
> >>>> dma_addressing_limited() should return true.  Bounce buffers are not
> >>>> really usable on GPUs because they map so much memory.  If
> >>>> dma_addressing_limited() returns false, that would explain it.
> >>>
> >>> Right, it appears to be the only part of the offending commit that
> >>> *could* reasonably make any difference, so I'm primarily wondering if
> >>> dma_get_required_mask() somehow gets confused.
> >>
> >> Mikhail,
> >>
> >> Can you see that dma_addressing_limited() and dma_get_required_mask()
> >> return in this case?
> >>
> >> Alex
> >>
> >>
> >>>
> >>> Thanks,
> >>> Robin.
> >
> > Unfortunately, right now I don't have enough time for kernel
> > modifications and rebuilds (I will later!), so I did a quick-and-dirty
> > research with kprobe.
> >
> > The problem is that dma_addressing_limited() seems to be inlined and
> > kprobe fails to intercept it.
> >
> > But I managed to get the result of dma_get_required_mask(). It returns
> > 0x7fffffff (!) on the vanilla (with the patch, buggy) kernel:
> >
> > $ sudo kprobe-perf 'r:dma_get_required_mask $retval'
> > Tracing kprobe dma_get_required_mask. Ctrl-C to end.
> >          modprobe-1244    [000] d...   105.582816: dma_get_required_mask: (radeon_ttm_init+0x61/0x240 [radeon] <- dma_get_required_mask) arg1=0x7fffffff
> >
> > This function does not even get called in the kernel without the patch
> > that I built myself. I believe that's because ttm_bo_device_init()
> > doesn't call it without the patch.
> >
> > Hope that helps at least a bit. If not, I'll be able to do more thorough
> > research in a couple of weeks, probably.
>
> Hmm, just to clarify, what's your actual RAM layout? I've been assuming
> that the issue must be caused by unexpected DMA address truncation, but
> double-checking the older threads it seems that might not be the case.
> I just did a quick sanity-check of both HIGHMEM4G and HIGHMEM64G configs
> in a VM with either 2GB or 4GB of RAM assigned, and the
> dma_direct_get_required_mask() calculation seemed to return the
> appropriate result for all combinations.
>
> Otherwise, the only significant difference of use_dma32 seems to be to
> switch TTM's allocation flags from GFP_HIGHUSER to GFP_DMA32. Could it
> just be that the highmem support somewhere between TTM and radeon has
> bitrotted, and it hasn't been noticed until this change because everyone
> still using a 32-bit system with highmem also happens not to be using a
> newer 40-bit-capable GPU? Or perhaps it never worked for AGP at all, in
> which case an explicit special case might be clearer?

WIth AGP, the driver just sets up an aperture on the GPU to point to
the AGP aperture in the system.  The platform AGP drivers handle the
DMA mappings into their aperture.  It's possible the AGP drivers are
doing something wrong with respect to their DMA masks?

Alex


>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index d33fec488713..acb2d534bff5 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -696,6 +696,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
>                                rdev->ddev->anon_inode->i_mapping,
>                                rdev->ddev->vma_offset_manager,
>                                rdev->need_swiotlb,
> +                              rdev->flags & RADEON_IS_AGP ||
>                                dma_addressing_limited(&rdev->pdev->dev));
>         if (r) {
>                 DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>
>
> Robin.
