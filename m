Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC1481CAA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 14:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E97410E2D4;
	Thu, 30 Dec 2021 13:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD2010E2D3;
 Thu, 30 Dec 2021 13:53:30 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s73so40016209oie.5;
 Thu, 30 Dec 2021 05:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7WPoqGbRjf5qWZOIN3v134hjVS3pk8ybZf4CzUplN6Q=;
 b=LXJfcNr0JScpcQ7w+OIc5igJ563VY10gJbYIlaL94Ps5YeBi3azneCQqfPCmn2+Ydo
 0eLVXb6bAkEvye9p4Q6zU5VPiLhcfC5KtSzs5whpllrxDqLwXv4pUwPM51N0wzJJ+lGT
 bIpMpjaEFIJKBy0+F4ef698IvQyo5ElBoY+5GzJ/X/XEeOP1mF91+JDS/YEwIKSgsCJc
 MztFaluknwIyQeyNgGYE83+ICk4oktW4UzuhPvHFWEt8NjN9vsLLaVIDgWK/HbFrLjj/
 wAPhVtIZ9jcX6HiPmWLEp8Z5o2uwHCeWaV9EthH6oqDwcd6kvQjAgYd4f631Q5e2WlN0
 PYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7WPoqGbRjf5qWZOIN3v134hjVS3pk8ybZf4CzUplN6Q=;
 b=AZRFK45LKwRVcEIF4kHtgdOxoqHgaXyG+FdOisHWmEo7G9nFinNdM+VXJpX2FfaDmM
 bXBOZ1UHP8FIcIITNMano7cACyaIFFcO+h3SL1cWgpP0qxjAwZ3wMvvwsja9sk36a3hI
 RQrDC3UYJGPWaxOKXI1T8dREIWGcPtpAIiRrgfjzX9ni2E6UwUxBOQ0l70GDrqURtA1W
 oQ6n8pN/+IzN1wVKJHyjNeoYbPowL0wZmp9qkMfYLhXHyD2SCSfX6S1l2UnL4lld5qSY
 EcBtaC9eXBlXdTJclYgUh97LWAIRJf1bwfAY7KS9dsW3QNsnD85b4aXo1YTblZN9tpOm
 MQVA==
X-Gm-Message-State: AOAM532bIRvmY9d0X5JW1lgGBzqJmBH4wOPchROVtjeag27nm0HoFt87
 iLy6U67dE1YWQnOq/xf+kXsnI+CxXLPS8Uk2Fp8=
X-Google-Smtp-Source: ABdhPJx5kcfGn4Sxltpl4lgW9TtTMa4Tv9Sa4Hfh7Knh4ij92jSR70kgNdYcdOstbysXf4dHFbfe6ycYEDMflLiQsp8=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr23542416oib.120.1640872409739; 
 Thu, 30 Dec 2021 05:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20211229155129.5789-1-alexander.deucher@amd.com>
 <CAPM=9tyU-eP7Fc2ziWNURJrdxZJSkaNKbE0V6Xx6L9idswHv2A@mail.gmail.com>
In-Reply-To: <CAPM=9tyU-eP7Fc2ziWNURJrdxZJSkaNKbE0V6Xx6L9idswHv2A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Dec 2021 08:53:18 -0500
Message-ID: <CADnq5_OLKNqTv3OwnpVdc5-=wRFPC=jrGHu=nv6z1QmBfWgTeA@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.16
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Zhan Liu <zhan.liu@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wang,
 Angus" <angus.wang@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 30, 2021 at 12:29 AM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 30 Dec 2021 at 01:51, Alex Deucher <alexander.deucher@amd.com> wrote:
> >
> > Hi Dave, Daniel,
>
> Just FYI on merging this into tip I got a conflict I'm not sure what
> answer is right.
>
> fixes has:
> ee2698cf79cc759a397c61086c758d4cc85938bf
> Author: Angus Wang <angus.wang@amd.com>
> Date:   Thu Dec 9 17:27:01 2021 -0500
>
>     drm/amd/display: Changed pipe split policy to allow for
> multi-display pipe split
>
> next has:
> 1edf5ae1fdaffb67c1b93e98df670cbe535d13cf
> Author: Zhan Liu <Zhan.Liu@amd.com>
> Date:   Mon Nov 8 19:31:00 2021 -0500
>
>     drm/amd/display: enable seamless boot for DCN301
>
> -.pipe_split_policy = MPC_SPLIT_AVOID_MULT_DISP,
> fixes is +.pipe_split_policy = MPC_SPLIT_DYNAMIC,
> next is +.pipe_split_policy = MPC_SPLIT_AVOID,
>
> I've chosen the -fixes answer for now, but it would be good to have
> someone review it before Linus merges.

It should ultimately be MPC_SPLIT_DYNAMIC.  -next has an extra patch
which changes it to an intermediate value before this patch changes it
to MPC_SPLIT_DYNAMIC.

Alex


>
> Dave.
