Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9775F85D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FCB10E318;
	Mon, 24 Jul 2023 13:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8C110E318
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 13:36:13 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1b059dd7c0cso3447075fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690205772; x=1690810572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7pnC1ES+TYwq0ogKI05HX1zNouPynL1TkXC7ZriDT0=;
 b=XVtqpWw7sx0jjDZM62tUWvt29wirwK9CzK5WVw11UVb5VegtxshdsieUJOG9ewVY0I
 hFKe6sD0Jo41HZ688ptyxI4kN0JiMDGHE3pWflfxRyPYYmCX3mfCwskyHU6Vv79cySj8
 XoisbhVGZyYRDANQyGya2uBoNwrNzdAUOQXqzEwXbxME86TH21CnQYr/bI5qXPsU5qvj
 yC9TBiw7CvFI2iuhnf7697f8Ta72FXeW26OSsF1kCTetanmmh2zv2YGEsMN+LjOwnWBb
 w9rS64LKmcIGjM1N60QX1e27KJSgU0KOEm4r3U0r5rDWFP+5oDy8MUpO0z3jGV2+y3Od
 7sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690205772; x=1690810572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7pnC1ES+TYwq0ogKI05HX1zNouPynL1TkXC7ZriDT0=;
 b=PsscCAMlTF8n0FkkLcerT3fS0E9dgkL9KSh+r1HU8OZlfs6sQ4fEoYhagKAdgw8WgG
 dKHm6YqPhRWjc+zltchO4zpzrckjRCfE2GzT985DEwK8rn/iXL2Owov/NKnJFvJwDrCI
 KnHdrJ5yzdgWMSTF7jnDtPBUE5ONxj63UK0ZO9OcfF/hl8KQn4Fil76ObHhYFeNNZlJs
 0IHnuJ4fQr5TNCk/4R4FSqtpMTWGfLKCwxyYhgMKT8V2yTbSFJoMSbzKdRkqXlYy0OH2
 cECEeQBYv/ftKgffsXIi6lJiPXNq08YdsgPzEwjCS+yUG6n1WSRDikz0ruDNsaO9AL53
 fgMQ==
X-Gm-Message-State: ABy/qLbCgdrXIvH/G7WLATYaPgRf9I0dMcKvDeKRZtUATNO2H9Rz9+MN
 7b5bXLUdS/fgdbA5KBKC+ugar3g5HGni9SQdHw5G6GiL
X-Google-Smtp-Source: APBJJlGHHYS+RO8bVzjN28h8WVqDkNOx2zNEZOLX2OwjQDUCn12Nfn2UKkomiDy+1I3iuDjrCAPUXyxRak6SK7kr8ZE=
X-Received: by 2002:a05:6870:8a09:b0:1b7:8950:c881 with SMTP id
 p9-20020a0568708a0900b001b78950c881mr11059924oaq.13.1690205772400; Mon, 24
 Jul 2023 06:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230724024229.1118444-1-guchun.chen@amd.com>
In-Reply-To: <20230724024229.1118444-1-guchun.chen@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 09:36:01 -0400
Message-ID: <CADnq5_Pfwyen7W6v9-MoT_S=owcRHbu-+TbwJ2KTN-iHcbEY5w@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: check null pointer before accessing when swapping
To: Guchun Chen <guchun.chen@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 23, 2023 at 10:43=E2=80=AFPM Guchun Chen <guchun.chen@amd.com> =
wrote:
>
> Add a check to avoid null pointer dereference as below:
>
> [   90.002283] general protection fault, probably for non-canonical
> address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
> [   90.002292] KASAN: null-ptr-deref in range
> [0x0000000000000000-0x0000000000000007]
> [   90.002346]  ? exc_general_protection+0x159/0x240
> [   90.002352]  ? asm_exc_general_protection+0x26/0x30
> [   90.002357]  ? ttm_bo_evict_swapout_allowable+0x322/0x5e0 [ttm]
> [   90.002365]  ? ttm_bo_evict_swapout_allowable+0x42e/0x5e0 [ttm]
> [   90.002373]  ttm_bo_swapout+0x134/0x7f0 [ttm]
> [   90.002383]  ? __pfx_ttm_bo_swapout+0x10/0x10 [ttm]
> [   90.002391]  ? lock_acquire+0x44d/0x4f0
> [   90.002398]  ? ttm_device_swapout+0xa5/0x260 [ttm]
> [   90.002412]  ? lock_acquired+0x355/0xa00
> [   90.002416]  ? do_raw_spin_trylock+0xb6/0x190
> [   90.002421]  ? __pfx_lock_acquired+0x10/0x10
> [   90.002426]  ? ttm_global_swapout+0x25/0x210 [ttm]
> [   90.002442]  ttm_device_swapout+0x198/0x260 [ttm]
> [   90.002456]  ? __pfx_ttm_device_swapout+0x10/0x10 [ttm]
> [   90.002472]  ttm_global_swapout+0x75/0x210 [ttm]
> [   90.002486]  ttm_tt_populate+0x187/0x3f0 [ttm]
> [   90.002501]  ttm_bo_handle_move_mem+0x437/0x590 [ttm]
> [   90.002517]  ttm_bo_validate+0x275/0x430 [ttm]
> [   90.002530]  ? __pfx_ttm_bo_validate+0x10/0x10 [ttm]
> [   90.002544]  ? kasan_save_stack+0x33/0x60
> [   90.002550]  ? kasan_set_track+0x25/0x30
> [   90.002554]  ? __kasan_kmalloc+0x8f/0xa0
> [   90.002558]  ? amdgpu_gtt_mgr_new+0x81/0x420 [amdgpu]
> [   90.003023]  ? ttm_resource_alloc+0xf6/0x220 [ttm]
> [   90.003038]  amdgpu_bo_pin_restricted+0x2dd/0x8b0 [amdgpu]
> [   90.003210]  ? __x64_sys_ioctl+0x131/0x1a0
> [   90.003210]  ? do_syscall_64+0x60/0x90
>
> Fixes: a2848d08742c ("drm/ttm: never consider pinned BOs for eviction&swa=
p")
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7139a522b2f3..54e3083076b7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -519,7 +519,8 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm=
_buffer_object *bo,
>
>         if (bo->pin_count) {
>                 *locked =3D false;
> -               *busy =3D false;
> +               if (busy)
> +                       *busy =3D false;
>                 return false;
>         }
>
> --
> 2.25.1
>
