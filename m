Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C964B76014F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753C10E36A;
	Mon, 24 Jul 2023 21:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6205F10E363;
 Mon, 24 Jul 2023 21:39:36 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a3ad1f39ebso3750302b6e.1; 
 Mon, 24 Jul 2023 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690234775; x=1690839575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQvicdLmL4lt+yOX/xSjVt1t0bXl8fj+TJA76nTMosM=;
 b=V79dFufsH0cq8p82YJZTa6JJu805tKEi0siRmc7/XqFp1XYZLKgJRXMCdoYJjQaMoy
 3ueByAhffU3P9aRI3PW838rHnrnT34TzFvgDdxp6pOVBQTn+zHRJ94uCjW7qREnx8NBB
 pY4ACAMGjVbc9FxaFOFrw8Gy8Ylf/4mYjTIvy4qOwKIELL05P1mWTG1SEy+ufYq2EnAb
 a7l0qq3D+2hFJBQrUP2nMEdBM+Fz6oFjxQYhI0AsMhCoAN+/mVpw3BFJqCWpPlWEc39J
 YHSxAQ8fsoBlJKPiJrKBpxHvV27wo0km4mpy9TJPHYtNu5QDtet6YpHC5Jzobcb49tYq
 zt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690234775; x=1690839575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQvicdLmL4lt+yOX/xSjVt1t0bXl8fj+TJA76nTMosM=;
 b=DtFKCsqGX5kjhESTgOFe0X6SQxXK2r/nsZQsQQBZDic0AEd/mWROKLyxtUMFEEryaA
 plQfnxw+bD4HTUqLTcikvdmlkFM7OZeE5n5OTVGHL+TCvszMrkLq2TQ8gI0bGzo/vN0y
 ApIq08af58ZBM7fsWW6SPokZAAx9lBL/NhGNWkBr3oxZMx/uUuv9scRLrHi1+PZ65mF1
 je3qctw3hw1EQCaYqG6mtDQe2FQm/GR/mXa826LQu5sAhI4pY2oxE8e+RTnhIwo+vOMj
 zPK4gNA5RsO4nmiisoRwmQYoVpcjlXhgrZl8BpkfxLZBeq8/Em2SUFbA0XwEkP8kie+I
 imiA==
X-Gm-Message-State: ABy/qLaxBI+cSiEbpLnBSSITEcBTDY4WYNTkfC0HuE8UDa1so9GQJvQo
 41gn/XsZYAckJ2TfyhHj5AOsqcpy3GVfc6EcFT2clRAn
X-Google-Smtp-Source: APBJJlEMvcyH9ZXex3ywXk18jFbBc0CodET+fnbeLWDQUctaVJbHZTMwvtITsVZodqjKH5wz1nAo4hnF/svGcBwq5Zo=
X-Received: by 2002:a05:6808:189b:b0:3a3:652e:8862 with SMTP id
 bi27-20020a056808189b00b003a3652e8862mr352635oib.2.1690234775301; Mon, 24 Jul
 2023 14:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230724032920.7892-1-xujianghui@cdjrlc.com>
 <d88773902f7a8536a8be83ead18981b3@208suo.com>
In-Reply-To: <d88773902f7a8536a8be83ead18981b3@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:39:24 -0400
Message-ID: <CADnq5_M7x2js7C4fAUVsOd6YAfExqjVW5AapiqDxRQo2e4stBA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: add missing spaces after ', ' and else should
 follow close brace '}'
To: sunran001@208suo.com
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

Alex

On Sun, Jul 23, 2023 at 11:30=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> ERROR: else should follow close brace '}'
>
> ERROR: space required after that ',' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/radeon/radeon_connectors.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c
> b/drivers/gpu/drm/radeon/radeon_connectors.c
> index 07193cd0c417..4ceceb972e8d 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -198,8 +198,7 @@ int radeon_get_monitor_bpc(struct drm_connector
> *connector)
>                                 DRM_DEBUG("%s: HDMI deep color 10 bpc exc=
eeds max tmds clock. Using
> %d bpc.\n",
>                                                   connector->name, bpc);
>                         }
> -               }
> -               else if (bpc > 8) {
> +               } else if (bpc > 8) {
>                         /* max_tmds_clock missing, but hdmi spec mandates=
 it for deep color.
> */
>                         DRM_DEBUG("%s: Required max tmds clock for HDMI d=
eep color missing.
> Using 8 bpc.\n",
>                                           connector->name);
> @@ -1372,7 +1371,7 @@ radeon_dvi_detect(struct drm_connector *connector,
> bool force)
>                                         /* assume digital unless load det=
ected otherwise */
>                                         radeon_connector->use_digital =3D=
 true;
>                                         lret =3D encoder_funcs->detect(en=
coder, connector);
> -                                       DRM_DEBUG_KMS("load_detect %x ret=
urned:
> %x\n",encoder->encoder_type,lret);
> +                                       DRM_DEBUG_KMS("load_detect %x ret=
urned: %x\n",
> encoder->encoder_type, lret);
>                                         if (lret =3D=3D connector_status_=
connected)
>                                                 radeon_connector->use_dig=
ital =3D false;
>                                 }
