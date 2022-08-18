Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9E598C70
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 21:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596EC10E2B4;
	Thu, 18 Aug 2022 19:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364BC10E178;
 Thu, 18 Aug 2022 19:15:47 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-335624d1e26so67434537b3.4; 
 Thu, 18 Aug 2022 12:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sYP+9qNwIyDLFoEUvQXDyPtx/FoGhIOtPcaM79/4lYE=;
 b=en+OrA/MPbCzDMw6B2sjE8UIJ3itx4qg4etpbiCDA55zTKwwj4Bl/8sbdJgTk7XITt
 Occzc361Af0V3i5nt+j+29hWsIJstWjchA303kQ6KaH8dSboDFxlofyhMV79Ul6gQW5Z
 jmt3BVN9kerutUCrk8fAnIC/lkCDlFEZq+63tsWL/o9NwavqPfpW2YI2ShMT6EBQ+wBy
 DJNvF7PJWAHtsBnqPmR/sk472I6vw9jKOk5/BgWV45oY31uoEJNUJIVDZXVThkqwhScP
 6soIXff+09HQEFFWpECOXitWAXO2W5uV1zcaSpEsB+EytmYJiigu7Ji+p5xgEkxnD80A
 vwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sYP+9qNwIyDLFoEUvQXDyPtx/FoGhIOtPcaM79/4lYE=;
 b=tvxA9JLVFWCJZ05eMYXOhOcC9PnVrwDwDnPo7kUGqvSKt3btFCBAVGbe8Wka/1MW0r
 BlDEXd/WMMHNPmAfmwqtFvNUhmsU7OKLBWBKW7mBX9KaMqY3D9gC19ytq0+DXcTvajs1
 1ygJzpXSN2GIrbGUMjlNG4/srNWVytUzbCFgEE/5R9atLVyNPzpMpngFaFmgzkymRqBX
 laZ50PfAVbKr/amGHNzXPLkSaub41MutjLwOyOGa3+QtJw6vba5m0cAK8+AGaXXZtdl2
 1DnPy5iMW08Dy0ZH6p3eZ8k2IJLnA0aGtFoMBhRJB+UtrLboXnEi/Am4Q+81oODR0+U7
 3mcQ==
X-Gm-Message-State: ACgBeo2S8M5IjwiWuHCHXNJjE+/EXm+jFWY5LnC9cm90lgEw+eKQyx62
 cYEfmy4WsOps2Ue3zEfZONiOQSbISRKwpz4swuRDab8TuY4=
X-Google-Smtp-Source: AA6agR6NhKTP6dK/rnSflJDd7I8DGOq10wzhEsbsIVztuTgYWO5Ul7BkxPdhivVrz7UKcheuAilCdJQzcMtkDj8bX/Y=
X-Received: by 2002:a0d:c942:0:b0:337:5cf9:1c04 with SMTP id
 l63-20020a0dc942000000b003375cf91c04mr2114294ywd.39.1660850146313; Thu, 18
 Aug 2022 12:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <Yv1lepjhg/6QKyQl@debian>
 <CADnq5_Od9W1iuzYpsmODOB=Xem97ogeH_t0JrjWC-S8h0XM9fA@mail.gmail.com>
 <5638aaf1-b808-bdc6-d84a-820f24facea6@infradead.org>
 <CADVatmNA6-qCJEHNn-gRO6Nx88SsTrPsJn_F5J0NiFhyvijNxA@mail.gmail.com>
 <c1869a4b-ead1-2ae5-c9ec-61834b578216@infradead.org>
In-Reply-To: <c1869a4b-ead1-2ae5-c9ec-61834b578216@infradead.org>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 18 Aug 2022 20:15:10 +0100
Message-ID: <CADVatmPCd5KQ0mAfQGHvqVGFJtK+fyQPB4XUktgfc3fzYJvyCg@mail.gmail.com>
Subject: Re: build failure of next-20220817 for amdgpu due to 7bc913085765
 ("drm/amdkfd: Try to schedule bottom half on same core")
To: Randy Dunlap <rdunlap@infradead.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-next <linux-next@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 4:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 8/18/22 03:43, Sudip Mukherjee wrote:
> > On Thu, Aug 18, 2022 at 3:09 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >>
> >>
> >> On 8/17/22 19:01, Alex Deucher wrote:
> >>> On Wed, Aug 17, 2022 at 6:03 PM Sudip Mukherjee (Codethink)
> >>> <sudipm.mukherjee@gmail.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>> Not sure if it has been reported, build of next-20220817 fails with the
> >>>> error:
> >>>>
> >>>> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >>>>
> >>>> Trying to do a git bisect to find out the offending commit.
> >>>>
> >>>
> >>> Thanks.  I don't see that symbol in the driver at all.  Not sure where
> >>> it is coming from.
> >>>
> >>
> >> It's powerpc only.
> >>
> >> Sudip, is it non-CONFIG_SMP by any chance?
> >
> > Ohhh.. really sorry for the incomplete report. I should not try to
> > mail while travelling.
> >
> > The error is seen with powerpc allmodconfig and it has CONFIG_SMP=y.
>
> OK, I see that also, but it doesn't make any sense (to me).
>
> I did 'objdump' on the code file (amdgpu.o) and it's listed as
> undefined but there are no code references to it.

cpu_smt_mask() is called by drivers/gpu/drm/amd/amdkfd/kfd_device.c.
and cpu_smt_mask() is an inline function in
arch/powerpc/include/asm/smp.h which is doing "return
per_cpu(cpu_smallcore_map, cpu);"

So, the offending commit is 7bc913085765 ("drm/amdkfd: Try to schedule
bottom half on same core").


-- 
Regards
Sudip
