Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0FAB84C04
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734FD10E8A0;
	Thu, 18 Sep 2025 13:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9D9DTpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C0210E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:12:23 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-26816246a0aso1973415ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758201142; x=1758805942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ow/FekpgA7UhV9Mvh36laSeW60WQ/h2Ti7HkmGFnCsM=;
 b=I9D9DTpoSIyHbtqQR1QCxVzbfouq6MLVBPUOgmN0+uwB7Fc8FLj47R7r4kDG03azwx
 S6/pb/hkf9XjHIRZiGo52Fzkd5wbDNiMCIUialvSodQkdDjaPLJknPooRrpbzuuZQtlT
 gKrLO9ueA/CyFizrIi5gjw56BMXet522y2ibm2vPaZ2BKkxkGYFkAPmVZ8LY4qMkQu24
 BEfxkU2BQDBYd/Lku02Pip5ZnL/W8egbwCTiqRKYe/1cWBYkhp6i7L1GiZQSmRxdO4jm
 qwxcwiOxuNuTJ11E/93HfZ7ODpUwwT6VXG13HJTZPN/YSMb64tG3UtO+cOCNhwNaYUjA
 NtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758201142; x=1758805942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ow/FekpgA7UhV9Mvh36laSeW60WQ/h2Ti7HkmGFnCsM=;
 b=exTHKKc3GroRwzUQ+oKsuH8p1gwUPv2A9nzp7Z9usyi3CGwMk10ZSs2GvzJF8AXeCt
 ixo9VuGwHLhT+0V2q1s1nEcXUC47Vsk5X/NEEg8s9AwVfwXd09Y4qIbJUHHbrZqmN2o+
 UyksCys5qKxPeGi49LxjLASEXsVM2LNPFoAl8Snh7AsYWGg86R+WhteqsZyA+/ZGjL9n
 sXAti3SGaqpbPv4dPH5bQSiqwD+5L+ybTnKC2GYIGPJ8TgvSmQ91BiwmvczcmFuIwA3d
 j2RzgClp2pF2sp5vQxaU+Ir5UhDS7iqCrpn4UFbLKawnZytiuJKHRpQQMsWrINgAxn6r
 hVxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpWOOm9Mg//ZP1GoL0WlgYHkWVWZbt0DEW+hv05kxYeORA4viEVjsEFFyAYnyRvE+Ppjo76xmbOW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2UMWlWDcc4pIKoa93usgJTvooyvgdwlJRdCnDNUtpyx9Gx/Vb
 i4TKDjqX13GmfBjK+H3D3stpyLCP6ZIdSQO7pMc9yQnJTCNJK5ed9MBxW6DSi9KZS+JzonZtqKE
 DDVu59GZJrp0+OQUxaQwqS+aO6E1v224=
X-Gm-Gg: ASbGnct7z3yl2JugfwVHDoxryj3IXpghvKS/4I80J5mDggDlK7yFqCpa6wg+0FW22xj
 oH71cA+VhsgDbgbxPB8DNw43e/iWA+CfVxWgBogB7Ps8ZPDpb9YA2gGBmijtaaaDAFj1tN2aUbv
 vnrb9PjdUYK2KlPhRSDUjZErhACTKXfw5F+52SRMXpc2yxqKi1S1Mw3Y7cDpHTQY5IjeHCb7wTr
 zpNAU3leFpSM5y3fL2SIHaQLCc=
X-Google-Smtp-Source: AGHT+IGPGpvPJnDMA+MU6VEF8DQ0xnGm1dy+iqzuJdF1p3969ZuqYgSVs9i3T569keWH/YmK9RWABocwx0S6kTCDWjQ=
X-Received: by 2002:a17:902:ce81:b0:269:9ae5:26cf with SMTP id
 d9443c01a7336-2699ae52d42mr9215285ad.4.1758201142273; Thu, 18 Sep 2025
 06:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250918105705.3480495-1-lgs201920130244@gmail.com>
In-Reply-To: <20250918105705.3480495-1-lgs201920130244@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Sep 2025 09:12:10 -0400
X-Gm-Features: AS18NWBryzMXeisWyksAUCkLKladPwFh28QPE6dGbAFuIaGpcNhnEsksRdkuC1w
Message-ID: <CADnq5_NQMQNpa7=MW4LXHvnKWTc4+QSEoA0zsNqpdfEV5Ho0SA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/atom: Check kcalloc() for WS buffer in
 amdgpu_atom_execute_table_locked()
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Kees Cook <kees@kernel.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Thu, Sep 18, 2025 at 8:44=E2=80=AFAM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> kcalloc() may fail. When WS is non-zero and allocation fails, ectx.ws
> remains NULL while ectx.ws_size is set, leading to a potential NULL
> pointer dereference in atom_get_src_int() when accessing WS entries.
>
> Return -ENOMEM on allocation failure to avoid the NULL dereference.
>
> Fixes: 6396bb221514 ("treewide: kzalloc() -> kcalloc()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/atom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdg=
pu/atom.c
> index 82a02f831951..bed3083f317b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> @@ -1247,9 +1247,9 @@ static int amdgpu_atom_execute_table_locked(struct =
atom_context *ctx, int index,
>         if (ws) {
>                 ectx.ws =3D kcalloc(4, ws, GFP_KERNEL);
>                 if (!ectx.ws) {
> -               ret =3D -ENOMEM;
> -               goto free;
> -        }
> +                       ret =3D -ENOMEM;
> +                       goto free;
> +               }

What branch is this patch against?  This doesn't apply as is.  I've
fixed this up manually and applied it.

Thanks,

Alex

>                 ectx.ws_size =3D ws;
>         } else {
>                 ectx.ws =3D NULL;
> --
> 2.43.0
>
