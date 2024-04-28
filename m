Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FCF8B4DC3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 22:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0171129B2;
	Sun, 28 Apr 2024 20:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CZCJpcG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD96D1129B2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 20:23:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-56e69a51a33so3332180a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714335784; x=1714940584; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1UYWciUs2erYzZFtTwjV5c1z3D+Uqx3k9sHr6YnyCsA=;
 b=CZCJpcG93um1ViR8zWrlSIKsMc0b3ahdjzRL1qPIdrRDSAPpZbTLMUG1XAFfwhyfxb
 4E2C9A2yo711Zucnz2zD9FoZJjZcmYIZVK7O10ckYqftnpub/y1its7pf7esGTutnAZf
 5UeJ7/sXTsHZ8nEdtPtsOYrFQlnbG9ZGssRYqYXbMNL+0uREw8QKWxwYPkPvQxIQe3DK
 PI9oPDY9EMNk+wVOhrYFM1ImFpCmX+dnZ338PHdMJKTKzp+tMauw5XKD+BbDXKgW3zM6
 nCQuYqNLt9JNIdbi+K5hy5IsaWNmVq5OK2jmKB9n8MxBr1oQqqWWuO/cs3OYiFESI67P
 imuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714335784; x=1714940584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1UYWciUs2erYzZFtTwjV5c1z3D+Uqx3k9sHr6YnyCsA=;
 b=FBCUX6r2XXKBeNecgqJ3BmahKYTnnvwESoXfWpYW9+ESbroU5avQTTyVMKZPfnGYQa
 Wk9hXYMKPFDMSfIYX89tc0RA/HL1GVncBQ7ktpXJUDEwxJd34u6Y4cg0tXL+xiKq2CbX
 p8g/ogsyf/DlmgFhNsGcy+1FB0JsL+cA2bBvlpDw8ZuhJgH5HR44AwDzSL08P0QeJ3Zp
 SrOKb8ZTLjsvz929xxSD+IKUO0vmEp1htV/LspqcPheg7h2p45B7z/6AusVq37XET+/9
 j9puujVkFYnEW/ngu/5hxq0eLQCThlNTk4HAdsGybu2Hsri0r+LRiRnFNzi7D462fQnd
 Ty2A==
X-Gm-Message-State: AOJu0YyluCyjsn0G/plU9MA2/IYVxq0wTyEWBMJY/5FpVyFHwAcc0QUz
 18bc+9lC4HhB3oCr5QZH+3WBDmCaWinFZk3a4RoibRu+bxVw2Qri7DKo8PoEkpzZJVmUMdCxrMK
 bdsYL4xXsfkP6WZaxFz41Hvm2xYQ=
X-Google-Smtp-Source: AGHT+IGluy1uFq/WY6DL1VnC9u8Pqr4PWkMPmHiWzCjfxgJaJI+ynQm5Ub6nCEQd8feX+KU/0XYBbQBv/MiBxsIHfrI=
X-Received: by 2002:a17:907:31c2:b0:a52:3645:22b6 with SMTP id
 xf2-20020a17090731c200b00a52364522b6mr8788842ejb.1.1714335783600; Sun, 28 Apr
 2024 13:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240427105547.10752-1-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20240427105547.10752-1-mohamedahmedegypt2001@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 29 Apr 2024 06:22:51 +1000
Message-ID: <CAPM=9tyoqdbzZ9Wg3q1f3j3ObzV0u1+qD_GbxhqE385Ms4BVAw@mail.gmail.com>
Subject: Re: [RFC] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This looks like a good start, though I wonder can we just refactor out
the common code from the vma and non-vma paths easier.

Also I wonder should we add a new GETPARAM so userspace can know this
change is available.

Of course we also need a pointer to the userspace implementation to
move forward.

Thanks,
Dave.

On Sun, 28 Apr 2024 at 19:32, Mohamed Ahmed
<mohamedahmedegypt2001@gmail.com> wrote:
>
> Allows PTE kind and tile mode on BO create with VM_BIND. This is needed to support modifiers in NVK and ensure correctness when dealing with the nouveau GL driver.
>
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index db8cbf615..0da0b5286 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -304,11 +304,25 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
>                 }
>                 nvbo->page = vmm->page[pi].shift;
>         } else {
> -               /* reject other tile flags when in VM mode. */
> -               if (tile_mode)
> -                       return ERR_PTR(-EINVAL);
> -               if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
> -                       return ERR_PTR(-EINVAL);
> +               if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
> +                       nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
> +                       if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +                               kfree(nvbo);
> +                               return ERR_PTR(-EINVAL);
> +                       }
> +
> +                       nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
> +               } else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> +                       nvbo->kind = (tile_flags & 0x00007f00) >> 8;
> +                       nvbo->comp = (tile_flags & 0x00030000) >> 16;
> +                       if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +                               kfree(nvbo);
> +                               return ERR_PTR(-EINVAL);
> +                       }
> +               } else {
> +                       nvbo->zeta = (tile_flags & 0x00000007);
> +               }
> +               nvbo->mode = tile_mode;
>
>                 /* Determine the desirable target GPU page size for the buffer. */
>                 for (i = 0; i < vmm->page_nr; i++) {
> --
> 2.44.0
>
