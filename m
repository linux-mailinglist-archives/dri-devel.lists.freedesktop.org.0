Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF79C943E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 22:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90910E37D;
	Thu, 14 Nov 2024 21:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V3VkXBYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4FF10E37D;
 Thu, 14 Nov 2024 21:23:00 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-72458778447so131325b3a.1; 
 Thu, 14 Nov 2024 13:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731619380; x=1732224180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHPQdWeymjSqEq39MrfOKaA+rsratObJz0alenKPpxA=;
 b=V3VkXBYRVQtDXTdbaO3Hrk7JTvT1yEXWX1GG3JC1C+mo2WeFvql62YBlncALg6Ki5F
 WUkkMX7S2tLy28V0q7IlKMP71axhGqFnFbabAT7trn0vPAMI3bgB5CV7AhVCKKVbUqIX
 wfc+I7yoWMhZID2YkV34XznI7hs0MDwsdzX4s5utuj4ONbiYuUHlwHatZw5u2Gg8GMRo
 jFHaHrmlwZ2UJDJG9q1n2eT4dw4xdcd8eg8cBWoJ9Xfhfl9UGf1NNFOyijy44cZ06mz5
 D12/MUbM9pBSmebpA5DRLupZjm7dsA+Y3RyICsmSGOdsZ34saslVpUctUVTijk/YLmpF
 15SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731619380; x=1732224180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RHPQdWeymjSqEq39MrfOKaA+rsratObJz0alenKPpxA=;
 b=X7fc8VcApKprL+myFTbQP0XivhFAKy68yhCDio20wqdjGkcZRXmZUzuyuqkf2zuWhD
 cekGL99HFsDJmLkNLN7DzKl69lJwrdh0tAXDOSkGQEzHRuPR7+S/EI4r6VgIdxuTYa7/
 t+V3K0W9At5cryy4sM3FBhgWYEkDi2/Y37HnQpD0T631PldHHrfKJpJpKkZrLZmVMgRR
 pRP0PIKNM53klwO1diHQUfgzNqYY5P2T0vLAN6tfWzRP/s8gN6Nw1E6newqNwVIFjuTA
 7wF7n+kcDR/qqwcT/ED5mnltB3FxpTnEaFgUcYJ9MJeRaYDk+pF885yJ7PWj91uE/Yq7
 Bc/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuCw6BtWs8HKVKGwpd86CcQSoXq8x1vZogsH4e3IhR1lZ7P/349qQKKPc2bybU/vRa1o4QnhC6@lists.freedesktop.org,
 AJvYcCXbsed9gPr5DNiIgkmaUp2w69sjlg+lhCleBJpFSJviD/Zkk83cCTkhqfJRDiqdjgxQLJl/qRBOvyfy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKqPf2YyOtkvyPcyCmo2N3FNM7BcosQFXFCsvxmx0A+MH1OKy8
 CU8rKVImw01hiL1RuEe25jMKIQ2un8KM/b7S3PoO7lPKiVuGAlDxc3aREoQBi5DgWwU4vC6siVz
 ek3QCUvE7NcQO8/jjlw+ytrFxCNM=
X-Google-Smtp-Source: AGHT+IE8GWehKpjTSXpVYptjXohMTqCxTrt68SQgfk9jJxHogJwyh/7+THbVI3C/Zce2x/BRDDMS7zuQSkIWIB9rRps=
X-Received: by 2002:a17:90b:33c6:b0:2ea:120e:14b6 with SMTP id
 98e67ed59e1d1-2ea1556e6d0mr205457a91.5.1731619379810; Thu, 14 Nov 2024
 13:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20241113125158.1959533-1-chenhuacai@loongson.cn>
 <11457899-355a-4682-aea1-6b0a196bcef2@amd.com>
In-Reply-To: <11457899-355a-4682-aea1-6b0a196bcef2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Nov 2024 16:22:48 -0500
Message-ID: <CADnq5_OUK8pEakX9w1dia31EvV1LCe1zU6mkk3nRZq=oW7hq-w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Use ttm_bo_move_null() in radeon_bo_move()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, 
 Huacai Chen <chenhuacai@kernel.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Applied.  Thanks!

Alex

On Wed, Nov 13, 2024 at 8:04=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 13.11.24 um 13:51 schrieb Huacai Chen:
> > Since ttm_bo_move_null() is exactly the same as ttm_resource_free() +
> > ttm_bo_assign_mem(), we use ttm_bo_move_null() for the GTT --> SYSTEM
> > move case too. Then the code is more consistent as the SYSTEM --> GTT
> > move case.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Looks reasonable to me, Acked-by: Christian K=C3=B6nig <christian.koenig@=
amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_ttm.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index 69d0c12fa419..616d25c8c2de 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -219,8 +219,7 @@ static int radeon_bo_move(struct ttm_buffer_object =
*bo, bool evict,
> >       if (old_mem->mem_type =3D=3D TTM_PL_TT &&
> >           new_mem->mem_type =3D=3D TTM_PL_SYSTEM) {
> >               radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
> > -             ttm_resource_free(bo, &bo->resource);
> > -             ttm_bo_assign_mem(bo, new_mem);
> > +             ttm_bo_move_null(bo, new_mem);
> >               goto out;
> >       }
> >       if (rdev->ring[radeon_copy_ring_index(rdev)].ready &&
>
