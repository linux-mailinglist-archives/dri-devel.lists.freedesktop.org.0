Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A3772CEE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7605E10E363;
	Mon,  7 Aug 2023 17:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5562410E35F;
 Mon,  7 Aug 2023 17:28:53 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6b9defb36a2so4519472a34.2; 
 Mon, 07 Aug 2023 10:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429332; x=1692034132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QfKREUB/ze/gPaxCIXzG9vbzEZPQ/IuHH12Y4Awob7s=;
 b=bxty7KM+L7WPzdm3wHFGTYyysg+SYH9BXSLV007seXB5Q19wt8VQlX8oeXht3QmZf1
 Y/OlgyVCs8kpIpvICbPmjbcdzA2U1M2vkRhCABjMfR5Yz1dDerNBN+EEBKw/B2nBn/OK
 TV+XH2r598HMG0LhdZkGZCA4JgKUpVUJqxkr5/i2J+bRFGaq8rIag2FYyO0Wgs8JNpNY
 /eWlmwjtEKJVLZsOr6SSqT/aZqkpFtGCEtcklMHw9WD1ECaS3dkayeo98EvX1vkghs03
 OuM1UA82Fygy2vXkuDnhpQfLa8PeL3KuT8IYjcOUkNXkh9e2DaJFFGMOxxn4+ycN+380
 nN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429332; x=1692034132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QfKREUB/ze/gPaxCIXzG9vbzEZPQ/IuHH12Y4Awob7s=;
 b=alepllugtdDISBtqTgouFPek6JPpfgBKM0A6mFtzsmWsuoE2sAgehzdW/1uEXNkUFb
 rIKu9tmrFV0BJ8q2AajGOVPhMIdwYeqkijRP3p1bqf0bm4FhCA204VbNmWaDEStTMKXa
 TYVUj9SKLNvDsnP4vwv+SWKf1tOoOHHz1vMgKZwqeh1dvYyqP5ARocsN9v/jc1AuvTX3
 +WTgrYrSpLMSak8QvzHcflgjdseBFjS7bcCdrxWAf7brOHKUfFwXr5Bsuf13XgU8YoUV
 19C5E3gIIVHdjH5wWja7t503CsTtxaOVWr1xc7RAO51FbtlvkwawgLGtLmPPwjqmgIQU
 33HQ==
X-Gm-Message-State: AOJu0YxmxYji/ZxlkUA9r2GmJSihVm1JIC/77LSTnw4RoGlqTOiDN673
 qTInBf20IT2jLDo8aN+9CIOJySJ5+Q7i3zhmOAfkqLlw
X-Google-Smtp-Source: AGHT+IEGDjI/OhRxZswgmS5XS3cRKcjbbEKil1UqockkIM0pWFuIygjmrKnTeLBH5/k2i/hodn6aQ45KdNBTTbqHyzQ=
X-Received: by 2002:a05:6870:ac22:b0:1bb:9c27:c7e6 with SMTP id
 kw34-20020a056870ac2200b001bb9c27c7e6mr13777329oab.41.1691429332553; Mon, 07
 Aug 2023 10:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230802072813.13252-1-sunran001@208suo.com>
In-Reply-To: <20230802072813.13252-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:28:41 -0400
Message-ID: <CADnq5_P__8hWvVZfUzck8cd6-5aHD9P=G+FiCCw8c978gi32dg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in amdgpu_ring.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 3:28=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that ':' (ctx:VxW)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.h
> index 028ff075db51..e2ab303ad270 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -389,7 +389,7 @@ static inline void amdgpu_ring_write_multiple(struct =
amdgpu_ring *ring,
>         occupied =3D ring->wptr & ring->buf_mask;
>         dst =3D (void *)&ring->ring[occupied];
>         chunk1 =3D ring->buf_mask + 1 - occupied;
> -       chunk1 =3D (chunk1 >=3D count_dw) ? count_dw: chunk1;
> +       chunk1 =3D (chunk1 >=3D count_dw) ? count_dw : chunk1;
>         chunk2 =3D count_dw - chunk1;
>         chunk1 <<=3D 2;
>         chunk2 <<=3D 2;
> --
> 2.17.1
>
