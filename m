Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10F924732
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 20:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65DC10E672;
	Tue,  2 Jul 2024 18:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hkJNuKC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA3110E676;
 Tue,  2 Jul 2024 18:19:59 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-48c2d353b01so1468843137.2; 
 Tue, 02 Jul 2024 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719944398; x=1720549198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rdY3nfttXQyfJtXRQz+w76u4SJZ23QmqNlqUfvwe5I=;
 b=hkJNuKC0W6fbY1YVYcsmURImXxMg4Kr5/KeVBgzRAa0qYMGPZd8qECgJXZxETUJXMz
 hOMUhDHCo2TYC2c2dxqTiCp7hoiSpn4zxXWlXldoh353flgOST0CoUv5ReGyAX0ELncx
 7UGDVd2HdkIBsnm0MZXxUpWQxfN4+DG4FY7f5YIfSGaQsJRuNDPH1iFfMcd2wnM/pJDF
 4WC8EqiTVp1eHhEyp9TvXuXNqwj1pD6FiCdHEwQ5jdD2DjwBWVry36I4e1DQowC90d9q
 q+/5gUu7cMjU5kbLt4fZ3zLRigTuHFxNNzcmw9073HsF+99s2gI5w9Uyaqu8IN0Njhuz
 yFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719944398; x=1720549198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0rdY3nfttXQyfJtXRQz+w76u4SJZ23QmqNlqUfvwe5I=;
 b=Frd6TFx49CxtBjwqgBHXvjKLUz9Yg1rkOZcYfa7Tf5yp8Hf5d5F6sBsiqJx00XaBcx
 lzV7B4TzskWZRZSjvR+klxEymCrhDd7WzKu/Tm5SHoxU6tgLh39Npf0ViILViEn9AAIH
 tE2qDwgPBwuH1PTJhJNduRu6+ipTTlUND5fuzu281GHnkZR+nHlSH7Xa8kD9sE4tBEaD
 dpimMHGiUlN2dkY1iOO8pZm+1+N1rnxNGJEp8bUEm4sG9Es2JLtmY+SJMq9xomq8l2WQ
 BSPDXktoiJ8zVM52CCmtV1WPRJA9TNMlI9dPvNC+0csoXvVaW92roj4R8dlEw2iwsTV4
 41MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi4gV3Qkc1Te5Np3NWfAogbbu6ueZLkdaY8kiQJD/88H27XL781IK3TJqNAssecKf+JJKujSmgpYi2nlubo8yziumVOQb222EDiE5kTub2
X-Gm-Message-State: AOJu0YyiKPQqW5wPqULGo+hy3KmwbKUwhPeeKBmQ+OHV5pOKv6+65m30
 VQxKSepZzjI+EOzJFi2Kmbz/jTcdp8eZY/M2WAGf1UxqqDDF1uCl3MC8r8v9cyF/fSBAME0PfhS
 +uQg+X+OiuGz+prHCjJ4FfS/bKPU=
X-Google-Smtp-Source: AGHT+IHjTuR7tkA1YoV1X/Vc1MDwRXNGgjuh4jPO1kdI0ozZItn98WX7uULjPeQzl1OgXibRRsUD2XaEtEpLwuVn2e0=
X-Received: by 2002:a05:6102:d8e:b0:48f:4f10:cb0c with SMTP id
 ada2fe7eead31-48faf12e3bamr10430391137.22.1719944398048; Tue, 02 Jul 2024
 11:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240702173048.2286044-1-rajneesh.bhardwaj@amd.com>
In-Reply-To: <20240702173048.2286044-1-rajneesh.bhardwaj@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jul 2024 14:19:45 -0400
Message-ID: <CADnq5_Mzb6smePX-Uo2G+YXer3d=ckf9E2546DhHytSwSW6B3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: Allow direct reclaim to allocate local memory
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org, felix.kuehling@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com
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

+ dri-devel

On Tue, Jul 2, 2024 at 1:40=E2=80=AFPM Rajneesh Bhardwaj
<rajneesh.bhardwaj@amd.com> wrote:
>
> Limiting the allocation of higher order pages to the closest NUMA node
> and enabling direct memory reclaim provides not only failsafe against
> situations when memory becomes too much fragmented and the allocator is
> not able to satisfy the request from the local node but falls back to
> remote pages (HUGEPAGE) but also offers performance improvement.
> Accessing remote pages suffers due to bandwidth limitations and could be
> avoided if memory becomes defragmented and in most cases without using
> manual compation.
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 6e1fd6985ffc..cc27d5c7afe8 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -91,7 +91,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool=
 *pool, gfp_t gfp_flags,
>          */
>         if (order)
>                 gfp_flags |=3D __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_N=
OWARN |
> -                       __GFP_KSWAPD_RECLAIM;
> +                       __GFP_RECLAIM | __GFP_THISNODE;
>
>         if (!pool->use_dma_alloc) {
>                 p =3D alloc_pages_node(pool->nid, gfp_flags, order);
> --
> 2.34.1
>
