Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDC46D2C08
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 02:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6041A10F356;
	Sat,  1 Apr 2023 00:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA6610F357
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680308389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1akfVcI7QR7lEshuitx6obMsoCPveh68wJcZR6xPcO0=;
 b=GSuMFpwoC5DK4PS5l0AGdF5C1ZMkVMXhv3qudrHyo30thkK25KaQCQojDzzapA43joz2wt
 JpA1cK4tvJTpha4HMFfV1SYBjBg4U+jgci3IK9YlMh7eZO0U+xJGIjOowxVd2H5sMuh0jk
 mykA+khIa0DvtYn7PHRJD1XGrYxLChs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-8Ly_tD1jMcq0LVZyB1meBQ-1; Fri, 31 Mar 2023 20:19:48 -0400
X-MC-Unique: 8Ly_tD1jMcq0LVZyB1meBQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 b5-20020a2ebc05000000b00295bab7c7d0so5420482ljf.15
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 17:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680308386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1akfVcI7QR7lEshuitx6obMsoCPveh68wJcZR6xPcO0=;
 b=hYreubRHDF/AC+GjMgQ0joJiORr09VMAApIkp+5cGLO7KOQAJ+2zLpaqxzvQIWJ3XJ
 xkG+YDRcgs+mhaQs9aGYSlWSzAWdKEHMe/BCEdlr6PuR73vRKlWrvqs2yi76TTtgS0pm
 NCs31QxNAlcL0OYnTOlrBKKA51K30q5KWF/MYBYOZV22JBjgu6nElOLTg0hKyXajgcIa
 l+hsTl7CiSqDvmmhpAmyHjhlaS4yA2JVxs1RxZnOZYhvll4BFWWEFJo061mLLlfWYaDf
 J8TS703YYe2rdSKyW2718GSc5F4A5WRCcCIhSkz+W8bh8krtoqBZ0m+pJDKkgD8pr/1v
 9rpQ==
X-Gm-Message-State: AAQBX9e5dO6RijkyxdIsOLkHkJAL7BD7FC9mjMIEvrXNP8oRmPm9b+AP
 5WOFjSxLeOg2VFNvDhSJMd/4lob4r5miOa9hQni3Md1T2Al6ss6Ew5BuxD208m04ty/rDR1bGVL
 h4uubTDLOrkUi6r9Zw7gZPq5gF7ajNImBbWCWoJREvPSj
X-Received: by 2002:ac2:5448:0:b0:4e9:bcf5:a0b6 with SMTP id
 d8-20020ac25448000000b004e9bcf5a0b6mr8226774lfn.11.1680308386562; 
 Fri, 31 Mar 2023 17:19:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ym6jp94Bk1kg399ONU4Y43W8m0No6VgXmQakZUMxIsdvzW+dZo3JC+oAnN0j7K8A6lQ3Sh1UTftySQqNEDppQ=
X-Received: by 2002:ac2:5448:0:b0:4e9:bcf5:a0b6 with SMTP id
 d8-20020ac25448000000b004e9bcf5a0b6mr8226765lfn.11.1680308386241; Fri, 31 Mar
 2023 17:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230330223938.4025569-1-kherbst@redhat.com>
In-Reply-To: <20230330223938.4025569-1-kherbst@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 1 Apr 2023 02:19:34 +0200
Message-ID: <CACO55turFB8MNbxB3Vk=J1GK_t07K+Ybym906fR=yDLfnwk8bw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp: Support more modes by checking with
 lower bpc
To: linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 12:39=E2=80=AFAM Karol Herbst <kherbst@redhat.com> =
wrote:
>
> This allows us to advertise more modes especially on HDR displays.
>
> Fixes using 4K@60 modes on my TV and main display both using a HDMI to DP
> adapter. Also fixes similiar issues for users running into this.
>
> Cc: stable@vger.kernel.org # 5.10+
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 32 +++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_dp.c    |  8 ++++---
>  2 files changed, 37 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index ed9d374147b8d..f28e47c161dd9 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -363,6 +363,35 @@ nv50_outp_atomic_check_view(struct drm_encoder *enco=
der,
>         return 0;
>  }
>
> +static void
> +nv50_outp_atomic_fix_depth(struct drm_encoder *encoder, struct drm_crtc_=
state *crtc_state)
> +{
> +       struct nv50_head_atom *asyh =3D nv50_head_atom(crtc_state);
> +       struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
> +       struct drm_display_mode *mode =3D &asyh->state.adjusted_mode;
> +       unsigned int max_rate, mode_rate;
> +
> +       switch (nv_encoder->dcb->type) {
> +       case DCB_OUTPUT_DP:
> +               max_rate =3D nv_encoder->dp.link_nr * nv_encoder->dp.link=
_bw;
> +
> +                /* we don't support more than 10 anyway */
> +               asyh->or.bpc =3D max_t(u8, asyh->or.bpc, 10);

luckily I didn't push yet, but this has to be `min_t` :)

> +
> +               /* reduce the bpc until it works out */
> +               while (asyh->or.bpc > 6) {
> +                       mode_rate =3D DIV_ROUND_UP(mode->clock * asyh->or=
.bpc * 3, 8);
> +                       if (mode_rate <=3D max_rate)
> +                               break;
> +
> +                       asyh->or.bpc -=3D 2;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +}
> +
>  static int
>  nv50_outp_atomic_check(struct drm_encoder *encoder,
>                        struct drm_crtc_state *crtc_state,
> @@ -381,6 +410,9 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
>         if (crtc_state->mode_changed || crtc_state->connectors_changed)
>                 asyh->or.bpc =3D connector->display_info.bpc;
>
> +       /* We might have to reduce the bpc */
> +       nv50_outp_atomic_fix_depth(encoder, crtc_state);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> index e00876f92aeea..d49b4875fc3c9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -263,8 +263,6 @@ nouveau_dp_irq(struct work_struct *work)
>  }
>
>  /* TODO:
> - * - Use the minimum possible BPC here, once we add support for the max =
bpc
> - *   property.
>   * - Validate against the DP caps advertised by the GPU (we don't check =
these
>   *   yet)
>   */
> @@ -276,7 +274,11 @@ nv50_dp_mode_valid(struct drm_connector *connector,
>  {
>         const unsigned int min_clock =3D 25000;
>         unsigned int max_rate, mode_rate, ds_max_dotclock, clock =3D mode=
->clock;
> -       const u8 bpp =3D connector->display_info.bpc * 3;
> +       /* Check with the minmum bpc always, so we can advertise better m=
odes.
> +        * In particlar not doing this causes modes to be dropped on HDR
> +        * displays as we might check with a bpc of 16 even.
> +        */
> +       const u8 bpp =3D 6 * 3;
>
>         if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_inter=
lace)
>                 return MODE_NO_INTERLACE;
> --
> 2.39.2
>

