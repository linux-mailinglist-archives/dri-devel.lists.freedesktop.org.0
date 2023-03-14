Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B566B8B2D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 07:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA2810E083;
	Tue, 14 Mar 2023 06:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EDF10E083;
 Tue, 14 Mar 2023 06:22:44 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id o2so13107723vss.8;
 Mon, 13 Mar 2023 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678774963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mP5emk5ij6jshM8bNF/8R6cp8PTSDJxKM5rJKgfECeY=;
 b=McaU0YGzdkZ9HoyYFK5fQkHwDWreYN+JBXl/CPv41Sfxu7S2nsMcK+4dQ4JwApi27Q
 quv8FCqcuuW5EJ7n4AboO3p60WcSsKrldnvBQe2763QPm/3zxrI8lCLeIxfohX711kzu
 JsJcqdv7S8DC/MFOwSswEOYJ0Mc2lFWgdB1m9cOslz+G5nlwK6LJrzxbmlfWpKN7PuPf
 JD2a52e4mCXfeBOLjqDY1Ek/ssH6nu2i2B3iktI6HUqWCSDh1+YkcYRQnTjIu8/LtKms
 6bUwAAeMHuhQK0vKoJnLq9lxBKkDq1b1tJjfb0G/sv66rgOX9OR3ezpDMs6KZjUz35lF
 YQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678774963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mP5emk5ij6jshM8bNF/8R6cp8PTSDJxKM5rJKgfECeY=;
 b=uegsuwueZphI4zV74ZtaO5NaA+w5U1dvXrkmZjK5EAy/Cgr8K0AyBJOHYVu8X5+cDi
 GyIIKsz6sGdbErC5507gV0NZADFtT+GYMuHcQWMV2bTlnQkWAGkXR/GgS8ElYK2aUpHL
 IWTXygUAlfXDBqARI2JXb9+ji7I5XgjvDmvnV9VQtrrzSmrMY7814fTmet4tmHXrB/9w
 /GmihAjsTWaq+5JEdvlQ5+LV1lt9k53DXTYrXgM/j4E3bHgeGf7Vf74Yf31QhTu++gFi
 Q7ja5DDd7hwtOlAorbKp8QxJne2DSUpKWXrqIHnjF1jbs3/z0LkgPWbejWHCdBsbyCHk
 8c4A==
X-Gm-Message-State: AO0yUKX+90dgoBr9I8CyN8GTWkGnd82vltz/jChQLAAx4soA9ouRxKoM
 yKnV7ihAIIEGNvrmzBi6d6eU0xmGtau5senYfwk=
X-Google-Smtp-Source: AK7set93QwubXRmJafDMw85VbcUHvhyg1cH2ItiXORXrlCQaBi7a+tHtXvJxTnt1oMBZ2mvp6I7vZ4JaIKk7pi1FjwY=
X-Received: by 2002:a67:d999:0:b0:423:e277:8c33 with SMTP id
 u25-20020a67d999000000b00423e2778c33mr5697413vsj.1.1678774963298; Mon, 13 Mar
 2023 23:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230314052711.4061652-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230314052711.4061652-1-harshit.m.mogalapalli@oracle.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 14 Mar 2023 14:22:32 +0800
Message-ID: <CAKGbVbsh4AXo+E4=T0eHeHS_ZuY4QYgRBF+Nbt+BFFMoJOMo0g@mail.gmail.com>
Subject: Re: [PATCH] drm/lima/lima_drv: Add missing unwind goto in
 lima_pdev_probe()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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
Cc: Simon Shields <simon@lineageos.org>, error27@gmail.com,
 lima@lists.freedesktop.org, Andreas Baierl <ichgeh@imkreisrum.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Tue, Mar 14, 2023 at 1:27=E2=80=AFPM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Smatch reports:
> drivers/gpu/drm/lima/lima_drv.c:396 lima_pdev_probe() warn:
>         missing unwind goto?
>
> Store return value in err and goto 'err_out0' which has
> lima_sched_slab_fini() before returning.
>
> Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Only compile tested.
> ---
>  drivers/gpu/drm/lima/lima_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index 7b8d7178d09a..39cab4a55f57 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -392,8 +392,10 @@ static int lima_pdev_probe(struct platform_device *p=
dev)
>
>         /* Allocate and initialize the DRM device. */
>         ddev =3D drm_dev_alloc(&lima_drm_driver, &pdev->dev);
> -       if (IS_ERR(ddev))
> -               return PTR_ERR(ddev);
> +       if (IS_ERR(ddev)) {
> +               err =3D PTR_ERR(ddev);
> +               goto err_out0;
> +       }
>
>         ddev->dev_private =3D ldev;
>         ldev->ddev =3D ddev;
> --
> 2.38.1
>
