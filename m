Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF673BDF17
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 23:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7E6E037;
	Tue,  6 Jul 2021 21:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD036E037;
 Tue,  6 Jul 2021 21:44:44 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id z3so107861oib.9;
 Tue, 06 Jul 2021 14:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02NGKANC6bWRviktL9XwvAT8xDpibT4kcz5eISh/RS0=;
 b=Jr+EhbKVszQ7Dl4PYYZKnvaWVb/MSuomxwnEc1wXFqNiUUwIJFdeGCuVKV0BoTFVe4
 1gMXZ43NFBElK2Bha/35aW1zVuwUI40RpETpyPXISezds6jPxZWW/J8zKIp8e8hr0gL6
 gL3cBQ/kKYoRm43yP4kbMfwKEeuH8FuwohI1spoXtreMogVoacJv1LzcN+CT8ckhg4Fp
 W38vLGaVD/csV/Ob6zAgCn0UOORtuej0EzXjMSW1A+MEsZ2ukim95KMkJgBVPLzBXi9g
 l1ApVUqcP62AgYMPkRVI+E1NWiEOPg87QHTDjfnuNFgJq4GuUrOnUHQiT1sPgcgZC7QE
 Tw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02NGKANC6bWRviktL9XwvAT8xDpibT4kcz5eISh/RS0=;
 b=qvbWaBdKN8q3+Wj/6OuoGcqMKAtvTzgc8kcXXqv5ztTFL90NS7/+JEtubdjkFif3XT
 ZyMMPeajmSQKfk08DJhXOGBuVcwL4Gynyw/e0kvvdLPv7uzjQPCqYrmQUc9ovcJehLut
 5UA0TC2aWGjs9ENw3jw34UQtH//KESZku8ybLBlqyWh2Yb3hOIW74LL41s4L9Qwkh0x/
 OqCsi86J5VIwKrfpadu4enGKQ/NbdTEew5Bp3ElkrgKOTqTrYTaVCHyn/OQ5KESHE7Jj
 XNr9ok3k7UFj53C0hgqDdeEvdoTkOwz55W74cmwBdcEak9o3Pee/GNwph0TtKUreOM+I
 u72g==
X-Gm-Message-State: AOAM530780rl2wdq/bbpi8m9i+kWj/XSw3ElPV4ULLnfcfsJItIoSehm
 UH/Oo1bkny5DYgBBV9MIvxmLK2ESygZi8qVR7IM=
X-Google-Smtp-Source: ABdhPJyJt9TJEJerAMmCKYsbved+w6V/cNsXV68GF6PloP4xXpQNkMpmSAMYxKqeYYk3SHLvNpM8HdrL6BTx20w4ZxY=
X-Received: by 2002:aca:ac15:: with SMTP id v21mr2045269oie.5.1625607883766;
 Tue, 06 Jul 2021 14:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210706111409.2058071-1-sashal@kernel.org>
 <20210706111409.2058071-113-sashal@kernel.org>
In-Reply-To: <20210706111409.2058071-113-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Jul 2021 17:44:32 -0400
Message-ID: <CADnq5_ObmVRjwUB5Lw0bLZLL-+=CqvGkJZ+2DY5ZDh+uN-oo0g@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.13 113/189] drm/amdgpu/gfx9: fix the doorbell
 missing when in CGPG issue.
To: Sasha Levin <sashal@kernel.org>
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 7:16 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Yifan Zhang <yifan1.zhang@amd.com>
>
> [ Upstream commit 631003101c516ea29a74aee59666708857b9a805 ]
>
> If GC has entered CGPG, ringing doorbell > first page doesn't wakeup GC.
> Enlarge CP_MEC_DOORBELL_RANGE_UPPER to workaround this issue.
>
> Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This should be dropped.  It was already reverted.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 516467e962b7..c09225d065c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -3673,8 +3673,12 @@ static int gfx_v9_0_kiq_init_register(struct amdgpu_ring *ring)
>         if (ring->use_doorbell) {
>                 WREG32_SOC15(GC, 0, mmCP_MEC_DOORBELL_RANGE_LOWER,
>                                         (adev->doorbell_index.kiq * 2) << 2);
> +               /* If GC has entered CGPG, ringing doorbell > first page doesn't
> +                * wakeup GC. Enlarge CP_MEC_DOORBELL_RANGE_UPPER to workaround
> +                * this issue.
> +                */
>                 WREG32_SOC15(GC, 0, mmCP_MEC_DOORBELL_RANGE_UPPER,
> -                                       (adev->doorbell_index.userqueue_end * 2) << 2);
> +                                       (adev->doorbell.size - 4));
>         }
>
>         WREG32_SOC15_RLC(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL,
> --
> 2.30.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
