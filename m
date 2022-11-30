Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822C63D808
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DE210E472;
	Wed, 30 Nov 2022 14:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472E410E472;
 Wed, 30 Nov 2022 14:28:51 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-13bd2aea61bso21219801fac.0; 
 Wed, 30 Nov 2022 06:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sPziP1VTbVne2ERE0izFy4+kdIPJFuarGbYLKiGJn0o=;
 b=V+uxTm1z8VwczhY08G908ZKtyI2GM3PWjScULyFpKSXQtPewkxwpPawEEanZycWlrw
 OJ9Zl4lmWKWHIsOqPk2WGS5sRHoGI2odBSxEYZMmt/6Zq8VKZQCPidcC3p+4v7z4BE+7
 3GlJqwFI9wZ9wStrJXZTTbVtMxg2voe6wDmyRUV0IxqfQYoJ5tzD6cCFHzSzALEAy3/w
 qy1okXQRNKpIeF12LsFq0k3GIW+8FkVaT0eikJF7iXWaIefSg2C/wsFyk5F6G1PZPYDm
 iRXdjtUcvpUhPP27zGfW+/8VqeSHfq4zl3rLw5PdIU85JkXzVkUGIxOsWS+idVyRG4iF
 j/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sPziP1VTbVne2ERE0izFy4+kdIPJFuarGbYLKiGJn0o=;
 b=jtkvDynhNF6T8wRHnnhLQrNJAlNlG3EsefjwJa7sKr4N2UKzQCvQ0382PZ3A4e3tV5
 r9Bx5eO88GgblAJe2mq75gGd+Wnb78ILvLmUI4CrLztAipJidaF756qT1ivGebIqsROD
 SlzK3bpEmyxU8Zb87MycxRi3LAWSiQNua3FfCdfLvDzBFrz8LJ+Fay+1edrDZy1eXfyU
 vJ2KFWsn4fCWO+9YghdzYemkJF2RFbpn3J075kPE7RR4OIBDEvnDuFc1XwxGWVdIBgAw
 6FokO+3Mw0ujg1Fj0FueL22hF8IF8JoTzBJgDamW7lDJqAJn2nPQy9m6EfK3u4t/VPaz
 5TRQ==
X-Gm-Message-State: ANoB5pk/V8T3wLSwSS3ChdgoEIZAS/CLLQd8JlPWfmsY9MZScyFe84Pn
 +JzzySO4imYCVZ+XhgRwPwTdX3142rg8dqc+B3s=
X-Google-Smtp-Source: AA0mqf7wtnXJwIX1cHau9u8G7eHZiXsKTHDs+GrOgLBRPMbYEk6OdSJ0DF1nJfF+KwWbacRWbtq6f0Ua36TNosvj7oo=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr24867377oab.46.1669818530485; Wed, 30
 Nov 2022 06:28:50 -0800 (PST)
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
In-Reply-To: <a5f73cfa-bd2a-3ab8-1e5c-253cfd832ea7@arm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Nov 2022 09:28:39 -0500
Message-ID: <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
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

On Wed, Nov 30, 2022 at 7:54 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-11-29 17:11, Mikhail Krylov wrote:
> > On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
> >> On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>
> >>> On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
> >>>> On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>
> >>>>> On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
> >>>>>
> >>>>>>>> [excessive quoting removed]
> >>>>>
> >>>>>>> So, is there any progress on this issue? I do understand it's not a high
> >>>>>>> priority one, and today I've checked it on 6.0 kernel, and
> >>>>>>> unfortunately, it still persists...
> >>>>>>>
> >>>>>>> I'm considering writing a patch that will allow user to override
> >>>>>>> need_dma32/dma_bits setting with a module parameter. I'll have some time
> >>>>>>> after the New Year for that.
> >>>>>>>
> >>>>>>> Is it at all possible that such a patch will be merged into kernel?
> >>>>>>>
> >>>>>> On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
> >>>>>> Unless someone familiar with HIMEM can figure out what is going wrong
> >>>>>> we should just revert the patch.
> >>>>>>
> >>>>>> Alex
> >>>>>
> >>>>>
> >>>>> Okay, I was suggesting that mostly because
> >>>>>
> >>>>> a) it works for me with dma_bits = 40 (I understand that's what it is
> >>>>> without the original patch applied);
> >>>>>
> >>>>> b) there's a hint of uncertainity on this line
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
> >>>>> saying that for AGP dma_bits = 32 is the safest option, so apparently there are
> >>>>> setups, unlike mine, where dma_bits = 32 is better than 40.
> >>>>>
> >>>>> But I'm in no position to argue, just wanted to make myself clear.
> >>>>> I'm okay with rebuilding the kernel for my machine until the original
> >>>>> patch is reverted or any other fix is applied.
> >>>>
> >>>> What GPU do you have and is it AGP?  If it is AGP, does setting
> >>>> radeon.agpmode=-1 also fix it?
> >>>>
> >>>> Alex
> >>>
> >>> That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=-1 doesn't
> >>> help, it just makes 3D acceleration in games such as OpenArena stop
> >>> working.
> >>
> >> Just to confirm, is the board AGP or PCIe?
> >>
> >> Alex
> >
> > It is AGP. That's an old machine.
>
> Can you check whether dma_addressing_limited() is actually returning the
> expected result at the point of radeon_ttm_init()? Disabling highmem is
> presumably just hiding whatever problem exists, by throwing away all
>  >32-bit RAM such that use_dma32 doesn't matter.

The device in question only supports a 32 bit DMA mask so
dma_addressing_limited() should return true.  Bounce buffers are not
really usable on GPUs because they map so much memory.  If
dma_addressing_limited() returns false, that would explain it.

Alex
