Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B263DA32
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 17:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB7110E49D;
	Wed, 30 Nov 2022 16:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7917510E4AC;
 Wed, 30 Nov 2022 16:07:45 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so2706133fac.2; 
 Wed, 30 Nov 2022 08:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TNA66VD1dhly+3dtftGrh+5H4e0DR5KYMxxoToOp0Zs=;
 b=j4pr7BkdEWAIJQ8tveBM/v58XDkS3tIH0kRwbbcNsFv8/WT++r9Y3r2TDlxofrhz0V
 5nty/74r5uNyASNsicy3gHRi1J9O9hhjFFGrwBHRxczNnLhluinCbRdV4MOrJDGWA8gc
 1zVGtRbp/KwoRn16DZpv4ANjfRewaDc1P0xfb8IxB/xKFwSAdJnOW/lsoIVuq3AyHV73
 f+RMc6zHLcOVf2q2jYoxrZZbq9SMaJagLWuKcpAJHmnv2DS1pHxzbUB9/xaBYVjvFEBI
 CdvTklSLG2ECJC6fwkaGqne24Qh9FOW1M0pjkPQawWmyxfWvsc4DlBAsYjS5SLpJmMsw
 i83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNA66VD1dhly+3dtftGrh+5H4e0DR5KYMxxoToOp0Zs=;
 b=ii6ZDkzHw/Lz7HcFkIWuhyEUpcA59O9fAIvI1xdGfwFNdG16cAqTD9o0n+eavpnfy0
 m51MKSqpGsal3RA3uYC6OZeTSseRbxu5lbuHOAYaCmvPMP5QdHSnPIDoE3b+IdwUMRt5
 rfwV0z2n7eNbgh3wEPnQEPHnHkCvi3tKYn2tpLpTlKtIoSaYFLCt7llfF96UPchjrvm9
 yDWPCJL4sE6Hbh1EG4MHWCjX06br8+8jnnlIO9hzm/VMgR7fOwtsbCKs2Bo4YONbW6PZ
 g33wCHIbR8ne1BB/JzNKgdF2lPqK/diuOB7GLsViM1ZqLVgtO+zAsEv4ZFw6wjvhMtIk
 v1LQ==
X-Gm-Message-State: ANoB5pmUgtqJNZsGAtqX3fPulWEpKhG7t6vGclZTu0jLEJIJHvMAo7QP
 Q0HmnoaJDQRzFOBHIJDfY5uiJXy3MTskHx0ptfZuoGzw3dQ=
X-Google-Smtp-Source: AA0mqf6N9o/4LXhyLGNuKrX32ebqnuhQGZViJ2Ow29ShP7StLFINnqRGYeCU3ZVKWZveYNCWr/E92nbD7buN6fNjXAc=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr25152318oab.46.1669824464662; Wed, 30
 Nov 2022 08:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20220423193145.3301ed06@desktop>
 <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
 <Y4TGOb3UGmDslyYF@sqrt.uni.cx>
 <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
 <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
 <Y4Y9SJC7gtUxP4+R@sqrt.uni.cx> <a5f73cfa-bd2a-3ab8-1e5c-253cfd832ea7@arm.com>
 <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
 <adf4a9b2-c30d-1e74-9848-7a63b3e0c674@arm.com>
In-Reply-To: <adf4a9b2-c30d-1e74-9848-7a63b3e0c674@arm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Nov 2022 11:07:32 -0500
Message-ID: <CADnq5_PCGVhpk0TpnJKBx7BODV8xWk4hAyXM27tCxBpyS2y9gw@mail.gmail.com>
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

On Wed, Nov 30, 2022 at 10:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-11-30 14:28, Alex Deucher wrote:
> > On Wed, Nov 30, 2022 at 7:54 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> On 2022-11-29 17:11, Mikhail Krylov wrote:
> >>> On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
> >>>> On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>
> >>>>> On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
> >>>>>> On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>>>
> >>>>>>> On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
> >>>>>>>
> >>>>>>>>>> [excessive quoting removed]
> >>>>>>>
> >>>>>>>>> So, is there any progress on this issue? I do understand it's not a high
> >>>>>>>>> priority one, and today I've checked it on 6.0 kernel, and
> >>>>>>>>> unfortunately, it still persists...
> >>>>>>>>>
> >>>>>>>>> I'm considering writing a patch that will allow user to override
> >>>>>>>>> need_dma32/dma_bits setting with a module parameter. I'll have some time
> >>>>>>>>> after the New Year for that.
> >>>>>>>>>
> >>>>>>>>> Is it at all possible that such a patch will be merged into kernel?
> >>>>>>>>>
> >>>>>>>> On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>>>> Unless someone familiar with HIMEM can figure out what is going wrong
> >>>>>>>> we should just revert the patch.
> >>>>>>>>
> >>>>>>>> Alex
> >>>>>>>
> >>>>>>>
> >>>>>>> Okay, I was suggesting that mostly because
> >>>>>>>
> >>>>>>> a) it works for me with dma_bits = 40 (I understand that's what it is
> >>>>>>> without the original patch applied);
> >>>>>>>
> >>>>>>> b) there's a hint of uncertainity on this line
> >>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> >>>>>>> saying that for AGP dma_bits = 32 is the safest option, so apparently there are
> >>>>>>> setups, unlike mine, where dma_bits = 32 is better than 40.
> >>>>>>>
> >>>>>>> But I'm in no position to argue, just wanted to make myself clear.
> >>>>>>> I'm okay with rebuilding the kernel for my machine until the original
> >>>>>>> patch is reverted or any other fix is applied.
> >>>>>>
> >>>>>> What GPU do you have and is it AGP?  If it is AGP, does setting
> >>>>>> radeon.agpmode=-1 also fix it?
> >>>>>>
> >>>>>> Alex
> >>>>>
> >>>>> That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=-1 doesn't
> >>>>> help, it just makes 3D acceleration in games such as OpenArena stop
> >>>>> working.
> >>>>
> >>>> Just to confirm, is the board AGP or PCIe?
> >>>>
> >>>> Alex
> >>>
> >>> It is AGP. That's an old machine.
> >>
> >> Can you check whether dma_addressing_limited() is actually returning the
> >> expected result at the point of radeon_ttm_init()? Disabling highmem is
> >> presumably just hiding whatever problem exists, by throwing away all
> >>   >32-bit RAM such that use_dma32 doesn't matter.
> >
> > The device in question only supports a 32 bit DMA mask so
> > dma_addressing_limited() should return true.  Bounce buffers are not
> > really usable on GPUs because they map so much memory.  If
> > dma_addressing_limited() returns false, that would explain it.
>
> Right, it appears to be the only part of the offending commit that
> *could* reasonably make any difference, so I'm primarily wondering if
> dma_get_required_mask() somehow gets confused.

Mikhail,

Can you see that dma_addressing_limited() and dma_get_required_mask()
return in this case?

Alex


>
> Thanks,
> Robin.
