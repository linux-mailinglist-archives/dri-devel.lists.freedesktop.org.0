Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88A8C7D1D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 21:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E30010E2E4;
	Thu, 16 May 2024 19:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YlR2SVSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7610E2E4;
 Thu, 16 May 2024 19:21:50 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2b432be5cc9so477525a91.3; 
 Thu, 16 May 2024 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715887310; x=1716492110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4Uj4MrKdaYYOIK2mHf5NlhXTXI7gxko3Ahn4VrR3/Y=;
 b=YlR2SVSvTlnvr5VCKZH28umFvnhN2KZrF19TBB0UAHfSMze6AI7+fWhZXHXIhVedBd
 StAHCSiAeesb+RVrZv998f/6gshbMpEnIRO7cjLWNmAe4Ymesby+xCR0gxULFzAtKZZT
 DPka9KvVQjDPPIcRK+s4y1Vdvq/zqZJNhiVbC1uRgXvuIOBI596spf2oyoQqGp+9xOBR
 NXc38Y1lnI/WOJwks6zQ4sdCj2knAVlWNDrdsAtB0iOa7x8DBi7roOtNf9RZmjQWZqrd
 JqeKewZkzkt8im5LxkO9jmIBkT9arq8K9j2FPhqVyE9W/TGuDlxSZZV0IKaTcclkrAcb
 5+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715887310; x=1716492110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4Uj4MrKdaYYOIK2mHf5NlhXTXI7gxko3Ahn4VrR3/Y=;
 b=TbP5JtOl4sPpVU7Mrvz8pGk9yGnGAvj3qOCYv0NCAYGyJxkgXxkC8Ly43IKhJsi44Y
 l3I0NB7W6Rg0PhoJ9SIpWtaEjhjPCHK/N4BEJ1ppC88rU12SE1bkIxyR5d6ScWodJ0n6
 vSHXIjs/ZadHzddz774KWvFVe3F7MmC2E/Hu45CI4CU10U5RddVcPAVgLaleTSRezQU/
 mKPzJWKfNpvvBQerH6XHCTkrQ/R/VGvOdohqssCVEOGSn2s3rC9uYqCDWFXgFfB1c4UV
 ZcUJpE3mTkFSlAX1RhQb9c/gFyYa6UM5uzN3m9PydMD5eSTfHwU9i5IquSg3NoZBgWK2
 nmZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcrKGfLHjDzu3Ev4CAKgJ/MK24XcM/jvEoT3eBcxI1gmAJG1VYfK1FWEscOJ5O3FcZ5IDhlt8chj1kW+KTvsyvTtWeXUMHj6FX9HU/576c
X-Gm-Message-State: AOJu0Yykd9mlDyFraCKPN544dw6+SaC4MEeSp9Sl1HMoa1kcj0qD2sQb
 pl1CU5/+wFvTBqwm3Hb0nKvI6VDDJmCT5WfY1JcZNJHhVCM62E/TMCRBI4A1agFpO4Pn2J9gzIi
 6sDQvzlckwVBSo11Dv7DgetsOHSaRNQ==
X-Google-Smtp-Source: AGHT+IG85I4gvx+pCQqOkVehuArcvbY/fpghQgxhwqtvwVLfdTzxNnc5Xaw1tOwyXeT+N4QlqY2bdQA2ZVczKpJ+5v4=
X-Received: by 2002:a17:90b:146:b0:2b2:9a77:3371 with SMTP id
 98e67ed59e1d1-2b6cc773684mr16914089a91.12.1715887310146; Thu, 16 May 2024
 12:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240516121822.19036-1-tursulin@igalia.com>
In-Reply-To: <20240516121822.19036-1-tursulin@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2024 15:21:38 -0400
Message-ID: <CADnq5_PhZ5bqEJKQ+bPQAeXihMfZrFVqLN-+nd69+zZooBT6BA@mail.gmail.com>
Subject: Re: [RFC v2 0/2] Discussion around eviction improvements
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
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

On Thu, May 16, 2024 at 8:18=E2=80=AFAM Tvrtko Ursulin <tursulin@igalia.com=
> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Reduced re-spin of my previous series after Christian corrected a few
> misconceptions that I had. So lets see if what remains makes sense or is =
still
> misguided.
>
> To summarise, the series address the following two issues:
>
>  * Migration rate limiting does not work, at least not for the common cas=
e
>    where userspace configures VRAM+GTT. It thinks it can stop migration a=
ttempts
>    by playing with bo->allowed_domains vs bo->preferred domains but, both=
 from
>    the code, and from empirical experiments, I see that not working at al=
l. When
>    both masks are identical fiddling with them achieves nothing. Even whe=
n they
>    are not identical allowed has a fallback GTT placement which means tha=
t when
>    over the migration budget ttm_bo_validate with bo->allowed_domains can=
 cause
>    migration from GTT to VRAM.
>
>  * Driver thinks it will be re-validating evicted buffers on the next sub=
mission
>    but it does not for the very common case of VRAM+GTT because it only c=
hecks
>    if current placement is *none* of the preferred placements.

For APUs at least, we should never migrate because GTT and VRAM are
both system memory so are effectively equal performance-wise.  Maybe
this regressed when Christian reworked ttm to better handle migrating
buffers back to VRAM after suspend on dGPUs?

Alex

>
> These two patches appear to have a positive result for a memory intensive=
 game
> like Assassin's Creed Valhalla. On an APU like Steam Deck the game has a =
working
> set around 5 GiB, while the VRAM is configured to 1 GiB. Correctly respec=
ting
> the migration budget appears to keep buffer blits at bay and improves the
> minimum frame rate, ie. makes things smoother.
>
> From the game's built-in benchmark, average of three runs each:
>
>                                                 FPS
>                 migrated KiB    min     avg     max     min-1%  min-0.1%
>   because          20784781     10.00  37.00   89.67    22.00    12.33
>   patched           4227688     13.67  37.00   81.33    23.33    15.00
>
> Disclaimers that I have is that more runs would be needed to be more conf=
ident
> about the results. And more games. And APU versus discrete.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>
> Tvrtko Ursulin (2):
>   drm/amdgpu: Re-validate evicted buffers
>   drm/amdgpu: Actually respect buffer migration budget
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 112 +++++++++++++++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  21 ++++-
>  2 files changed, 103 insertions(+), 30 deletions(-)
>
> --
> 2.44.0
>
