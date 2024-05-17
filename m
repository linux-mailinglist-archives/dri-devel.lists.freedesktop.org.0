Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EB18C8763
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 15:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C707510E803;
	Fri, 17 May 2024 13:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GFliri2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DABC10E803;
 Fri, 17 May 2024 13:43:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1ecddf96313so9476445ad.2; 
 Fri, 17 May 2024 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715953430; x=1716558230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBcBMRXsPyrx8zt/i0Fy/oTh1l0D1eBrNBX8vbCKfck=;
 b=GFliri2WSFQ6ANGRFeQ9CZ6KxD4Jz/qc7rChegutsQRmW16/NLzJApfZiZHFCqJPB2
 3EXhsZGS8AM9zqVPqM8hiIcE7Ss3j7UfT+IWmVKxLDWik1ZsrsLiA8cvaQ5svJpKE+d1
 idGhbOfWol6vDOkWWJCre3xC5L+ryvm39cKVpBIjB81oshuh807vO6GyqW2c5pVJdEpI
 cSewCVkywe8Ul/QnxFWEW2VuSmVVJ4HlBNfJnMUeF+SWa/7e5qWLWywA3iySuvWJyXly
 QXqUDcGVR1DysMSeZQzBOTLoznlyd+Z2ZhXG6PjlneT+pGbIW4PK/26ind+OcL1VTrOY
 Hcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715953430; x=1716558230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBcBMRXsPyrx8zt/i0Fy/oTh1l0D1eBrNBX8vbCKfck=;
 b=t1Ak/8NvziCEsZ9MwhOtfVptQEUGGrkJGGctYTOjHrMwqsMV0Z75VQwVlh1lYRjGU2
 o2rBhtKduoA184CDEG3h2RagJHvOK++Z/E+gbgxkvHdVkc+2lBnK7ljN7311rY9dupOa
 Wf6nxzlE1/I3VPkaVv6ifo7FZoWtqp+yYt+ljxleX0OGtjMhQS+IYVumpanYnYhaqMQR
 IJG0ALvxyvizlKHsk4rv+pwbcBNzwcdHyp2/wIZ1vM7B6h5HBwa9zni9kvaxr+5Xa3Fw
 62fnhsfmN/Sixz8OzXz8Nl4JTrnXJ462+ZwmLx22svqiWsuhnE2O18mTR7QW+0OjpIhU
 DyMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6oP8lPj+vlXakfRjqDo637qXz2+3S0hscGx2fWwFM8RD4Kg00kJShRIlY+Cpi/N6KdReoLs2jZHmb1XOr4jVl6LG42qVfLM/28AMoKRqN4fBX4TFhNIhJCm9yhM7z8JaGJk1pc2zD1kPJx+h6Hw==
X-Gm-Message-State: AOJu0YxR0sFAXykPB8kiUnmnOpL/A7JxmTo6/Yi9UFxLHYZldnIpMobo
 4CoQDKTxYy/iTVaYT7FFKP024JX6xmOlAFVan1UepJmnpa1GQsrKARgy3SsefQyV5b/kBK9sJa1
 qLj5A1geSZ0PoD4LS2PU0IBlZvgI=
X-Google-Smtp-Source: AGHT+IFPkGzL98cTFklkjRFpLqCsZE4+C1rjXZ/7JWpj4Azd6OmW5EBsCIzp5yFGabjlPXzzdfaGtSLnSreLt+WtYTk=
X-Received: by 2002:a17:90a:cf86:b0:2b8:ffa3:f0d7 with SMTP id
 98e67ed59e1d1-2b8ffa3fc22mr17999229a91.34.1715953430540; Fri, 17 May 2024
 06:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240516121822.19036-1-tursulin@igalia.com>
 <CADnq5_PhZ5bqEJKQ+bPQAeXihMfZrFVqLN-+nd69+zZooBT6BA@mail.gmail.com>
 <4cfb94e4-8f15-4b7f-8911-60298da3edb7@igalia.com>
In-Reply-To: <4cfb94e4-8f15-4b7f-8911-60298da3edb7@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2024 09:43:38 -0400
Message-ID: <CADnq5_PrKiuLLymMM=qPgg=x8srbh=xXgFQvKWsnAxCEvgc=nw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] Discussion around eviction improvements
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Friedrich Vock <friedrich.vock@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 17, 2024 at 3:41=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
>
> On 16/05/2024 20:21, Alex Deucher wrote:
> > On Thu, May 16, 2024 at 8:18=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia=
.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>
> >> Reduced re-spin of my previous series after Christian corrected a few
> >> misconceptions that I had. So lets see if what remains makes sense or =
is still
> >> misguided.
> >>
> >> To summarise, the series address the following two issues:
> >>
> >>   * Migration rate limiting does not work, at least not for the common=
 case
> >>     where userspace configures VRAM+GTT. It thinks it can stop migrati=
on attempts
> >>     by playing with bo->allowed_domains vs bo->preferred domains but, =
both from
> >>     the code, and from empirical experiments, I see that not working a=
t all. When
> >>     both masks are identical fiddling with them achieves nothing. Even=
 when they
> >>     are not identical allowed has a fallback GTT placement which means=
 that when
> >>     over the migration budget ttm_bo_validate with bo->allowed_domains=
 can cause
> >>     migration from GTT to VRAM.
> >>
> >>   * Driver thinks it will be re-validating evicted buffers on the next=
 submission
> >>     but it does not for the very common case of VRAM+GTT because it on=
ly checks
> >>     if current placement is *none* of the preferred placements.
> >
> > For APUs at least, we should never migrate because GTT and VRAM are
> > both system memory so are effectively equal performance-wise.  Maybe
>
> I was curious about this but thought there could be a reason why VRAM
> carve-out is a fix small-ish size. It cannot be made 1:1 with RAM or
> some other solution?

It's really only needed for displays at boot up prior to the OS
loading or for displays on older APU that did not support
scatter/gather display.  The problem with increasing the carveout size
is that that prevents the memory from being available to the rest of
the system.

Alex

>
> > this regressed when Christian reworked ttm to better handle migrating
> > buffers back to VRAM after suspend on dGPUs?
>
> I will leave this to Christian to answer but for what this series is
> concerned I'd say it is orthogonal to that.
>
> Here we have two fixes not limited to APU use cases, just so it happens
> fixing the migration throttling improves things there too. And that even
> despite the first patch which triggering *more* migration attempts.
> Because the second patch then correctly curbs them.
>
> First patch should help with transient overcommit on discrete, allowing
> things get back into VRAM as soon as there is space.
>
> Second patch tries to makes migration throttling work as intended.
>
> Volunteers for testing on discrete? :)
>
> >>
> >> These two patches appear to have a positive result for a memory intens=
ive game
> >> like Assassin's Creed Valhalla. On an APU like Steam Deck the game has=
 a working
> >> set around 5 GiB, while the VRAM is configured to 1 GiB. Correctly res=
pecting
> >> the migration budget appears to keep buffer blits at bay and improves =
the
> >> minimum frame rate, ie. makes things smoother.
> >>
> >>  From the game's built-in benchmark, average of three runs each:
> >>
> >>                                                  FPS
> >>                  migrated KiB    min     avg     max     min-1%  min-0=
.1%
> >>    because          20784781     10.00  37.00   89.67    22.00    12.3=
3
> >>    patched           4227688     13.67  37.00   81.33    23.33    15.0=
0
>
> Hmm! s/because/before/ here obviously!
>
> Regards,
>
> Tvrtko
>
> >> Disclaimers that I have is that more runs would be needed to be more c=
onfident
> >> about the results. And more games. And APU versus discrete.
> >>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> >>
> >> Tvrtko Ursulin (2):
> >>    drm/amdgpu: Re-validate evicted buffers
> >>    drm/amdgpu: Actually respect buffer migration budget
> >>
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 112 +++++++++++++++++++----=
--
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  21 ++++-
> >>   2 files changed, 103 insertions(+), 30 deletions(-)
> >>
> >> --
> >> 2.44.0
> >>
