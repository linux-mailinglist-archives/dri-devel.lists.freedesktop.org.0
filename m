Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B1A9487E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 19:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1090510E335;
	Sun, 20 Apr 2025 17:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9NEeBOF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449B810E25D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 00:34:46 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30c091b54aaso27661921fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 17:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745109284; x=1745714084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCVfNP1UFzhQHU+UziS/1aMy/BtD5fPkaaRh6L2J8Tk=;
 b=e9NEeBOFxirB50UuZXkX7cKTDXSsU0HXVQk4ih5SJDdXvU4ebqOzZFgE7+2zy04GfZ
 d6oQrN9rfLpeL89xHx+8T3YoX+7bpbZKR3oe7IDnrPqY6baUj9Ux+jMPluGyCQ9p+gWO
 fDkoBBYe9PhyAzBNThS32cWkfoTt8SWPfrkIPmLnCvsrS5oE6Sknlc03MKvz9Nu+SdjB
 Zr9MNn7CsZvv0PffkmMqflq7Y2BVGfL9IRw7+Tht/4UEYdfYyGlosnzQtbWbeMqoXBxH
 kiUbTed7MIWEvZFqhYditTqvZHfjri8nHArJUDITRiMZA58czUE0zBvyif08KH4EZgKP
 VQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745109284; x=1745714084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCVfNP1UFzhQHU+UziS/1aMy/BtD5fPkaaRh6L2J8Tk=;
 b=M+z3Q/UEMHlJJicO3NagL2f4dZkXqbxC/swit7InfUTKtCA51Zo9yiEAp9LoBd5MbL
 P6oYUp0NVSpKr0hoUbq3619Q2d59fZZXJXkvKZTi6okuVP8JT3iABIzDER7w+HiLYPBj
 CB090wSBGAWrT/0U8PIBA1w/GGFBffQVSvaKOsp5Sp+r1gKPwOQZ+jgdv7FFT/eLQ2fC
 WSq24K7N3mktWzQ0BWFetkD58RYG7QVYsFz+vIkW+0JNrddIX+vmUZsTBR6lSirLjz6l
 jwkKjIboRR9QPvro4jLFaeaH2GenHP2ovk85D2DlmTxiERulR8SvdKcM8XVszDS3c/IQ
 XVuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5Ny+PZyw+Fcl9I8nTgh0m8z3m/9RiRBV2tcLuHw3wM/I9np51PddIbrP81LfbgPIRvBR0x0lDkI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytX57JnMAKX6nUn8K3oDHu83PYt39ndRp9aki3UeYQ7SnGFqhy
 pdnEfhwv0M7bjfoWsrzU6afNEXX9+qTf564rAcXZWLr6uwZEJdqpbdj/0Ry57twf9ZZkLn+NQOZ
 atS1og9r6ig1iFGvbP67k+xZwYew=
X-Gm-Gg: ASbGncva5w0XwkBq9xbBPEX0ZIjGb2lCYYVD07sUvQfUykST9jub985XDm4NcRcY3TF
 7a7cRRIOpr1P+w7xjcMExgMVtPcZz6y+/Ht1tsJaGOiJ2pQlCiCwNAE4QAhPnMTqKXXIC3THIDA
 Zvf9kqb6HifI5BEn0QWmBG+A==
X-Google-Smtp-Source: AGHT+IGnBT9PQ5jEYh6DumXMG4qyl8frndd6pk/C2KijCK3Ra++k3C4hOaeGs7Q5Y+TzsQlcujBhFcQSpRKFZqunwH8=
X-Received: by 2002:a2e:a90c:0:b0:30b:c5e7:6e61 with SMTP id
 38308e7fff4ca-31090502c67mr21744281fa.20.1745109284149; Sat, 19 Apr 2025
 17:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
In-Reply-To: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sat, 19 Apr 2025 19:34:31 -0500
X-Gm-Features: ATxdqUElBbV3bALOk2EQDcBsKfIDN7TbdtaDRssMJYfP5UjTo9xKypEXMgLxsUY
Message-ID: <CALHNRZ83pcXT_7r4B-ZB-m9rP9vM0n+HzeCJkXvAFsdLch5-pg@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Assign plane type before registration
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 20 Apr 2025 17:31:13 +0000
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

On Sat, Apr 19, 2025 at 7:30=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Changes to a plane's type after it has been registered aren't propagated
> to userspace automatically. This could possibly be achieved by updating
> the property, but since we can already determine which type this should
> be before the registration, passing in the right type from the start is
> a much better solution.
>
> Suggested-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Cc: stable@vger.kernel.org
> ---
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 12 ++++++++----
>  drivers/gpu/drm/tegra/hub.c |  4 ++--
>  drivers/gpu/drm/tegra/hub.h |  3 ++-
>  3 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 798507a8ae56d6789feb95dccdd23b2e63d9c148..56f12dbcee3e93ff5e4804e5f=
e9b23f160073ebf 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1321,10 +1321,16 @@ static struct drm_plane *tegra_dc_add_shared_plan=
es(struct drm_device *drm,
>                 if (wgrp->dc =3D=3D dc->pipe) {
>                         for (j =3D 0; j < wgrp->num_windows; j++) {
>                                 unsigned int index =3D wgrp->windows[j];
> +                               enum drm_plane_type type;
> +
> +                               if (primary)
> +                                       type =3D DRM_PLANE_TYPE_OVERLAY;
> +                               else
> +                                       type =3D DRM_PLANE_TYPE_PRIMARY;
>
>                                 plane =3D tegra_shared_plane_create(drm, =
dc,
>                                                                   wgrp->i=
ndex,
> -                                                                 index);
> +                                                                 index, =
type);
>                                 if (IS_ERR(plane))
>                                         return plane;
>
> @@ -1332,10 +1338,8 @@ static struct drm_plane *tegra_dc_add_shared_plane=
s(struct drm_device *drm,
>                                  * Choose the first shared plane owned by=
 this
>                                  * head as the primary plane.
>                                  */
> -                               if (!primary) {
> -                                       plane->type =3D DRM_PLANE_TYPE_PR=
IMARY;
> +                               if (!primary)
>                                         primary =3D plane;
> -                               }
>                         }
>                 }
>         }
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index fa6140fc37fb16df4b150e5ae9d8148f8f446cd7..8f779f23dc0904d38b14d3f3a=
928a07fc9e601ad 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -755,9 +755,9 @@ static const struct drm_plane_helper_funcs tegra_shar=
ed_plane_helper_funcs =3D {
>  struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
>                                             struct tegra_dc *dc,
>                                             unsigned int wgrp,
> -                                           unsigned int index)
> +                                           unsigned int index,
> +                                           enum drm_plane_type type)
>  {
> -       enum drm_plane_type type =3D DRM_PLANE_TYPE_OVERLAY;
>         struct tegra_drm *tegra =3D drm->dev_private;
>         struct tegra_display_hub *hub =3D tegra->hub;
>         struct tegra_shared_plane *plane;
> diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
> index 23c4b2115ed1e36e8d2d6ed614a6ead97eb4c441..a66f18c4facc9df96ea8b9f54=
239b52f06536d12 100644
> --- a/drivers/gpu/drm/tegra/hub.h
> +++ b/drivers/gpu/drm/tegra/hub.h
> @@ -80,7 +80,8 @@ void tegra_display_hub_cleanup(struct tegra_display_hub=
 *hub);
>  struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
>                                             struct tegra_dc *dc,
>                                             unsigned int wgrp,
> -                                           unsigned int index);
> +                                           unsigned int index,
> +                                           enum drm_plane_type type);
>
>  int tegra_display_hub_atomic_check(struct drm_device *drm,
>                                    struct drm_atomic_state *state);
>
> ---
> base-commit: 119009db267415049182774196e3cce9e13b52ef
> change-id: 20250419-tegra-drm-primary-ce47febefdaf
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

This patch was being discussed on the tegra-drm freedesktop issue
tracker [0], but movement there has stopped. I'm submitting the change
here in hopes of getting it moving again.

The stable cc is intended to get this picked back to 6.12 at least.
But as far as I know, this bug has existed as long as Tegra186 support
in tegra-drm has.

Sincerely,
Aaron Kling

[0] https://gitlab.freedesktop.org/drm/tegra/-/issues/3
