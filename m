Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7972A78F90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E90D10E79F;
	Wed,  2 Apr 2025 13:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MvW7eJbG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A077910E79F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:16:22 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3fb3f4bf97aso2068251b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743599782; x=1744204582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6gpLUKQtk5zxPVjHDvDvSHDg4kW29T6hnEgCIVVHTg=;
 b=MvW7eJbG92FB8RkT8Ks1At50vqa+Y/InjPLrLmshM9rbNmHsLi6FsR7Diectuzjf50
 d0x1wwKWLlkBwqj7SV1fZBG0iqYsTBUqs7OTOF+ctQKkOWJu3FYLFUchjObYNXw8Dnpw
 Lr0x2mTXBaB0LYWRJwDEzWB3zEuWn4Hnjuk2SZE8tSolHYTSfD+3TI1DUmRvke8ueDFl
 pry+zLzIyJO9M0aaEZMEiV6TaMoRjfCJbb5a26O2hr55qJYyXtuOo228x9LXR+lO301N
 tSmXrXmTL5R2pGgyH/f9exXTSGODNj4d8ZpcDTHDjEjSWKg9OpzpMD7lirTAMRbP8BYE
 VPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743599782; x=1744204582;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q6gpLUKQtk5zxPVjHDvDvSHDg4kW29T6hnEgCIVVHTg=;
 b=e/X2X8inSojAkpIzZPGQi1tYOJI2kekBYB7Mcoj5FfYvGaf+5upxFM0934fLSHP0bM
 KczltWod8P+tahBVc1l6HdSvDlkV6yqp9HAxRVFYYjX1glUKnGP5Hu6teARM/2ZEhwxg
 7IG/UGyiDwAHCgEU3YYXyQT2wJGDLaUregS43GMYanjkRSA+bOpxTHeudcMBdAD6jngm
 qZGUkSg+JiZ7jARO6qJ6BGhfHSa1v8L6jJud+WiK3q+xFf5O3IxoZ4SGhbdW36p/Es6d
 BMGfxlEUAfxCbB1kZf7/bfT4IEE4OwAK0oAwBfA0/8E57K9D7WwQQsZ3buPG1dJ7J3IM
 a8og==
X-Forwarded-Encrypted: i=1;
 AJvYcCURdGQsn2loicUD4vL7A39UnayNUEZ07Ned0TzBva1+OBXkkNoO3G9/5QUxGc3b/3B344YDZOrJlFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/G8kxqWDMEFRuNBh6kv/Ysm8ZehCIaRcYCe4h/rFkG/3WM/9D
 Fu5xjlIQ0QL6fjAnQOwu4hmVZ9kPj+xLb85bRcLJBC1q9xBTSuDxVLgUpkIjLZAqBbvAPxv8E7x
 12FUulq63UyA9RTS0/RbkRxFjCIw=
X-Gm-Gg: ASbGncs+Cgov3cortKMLKhkpYpvH2FrJQicmXDWFCGveUEsxW1gjrfw/pLsjbnASdKB
 RPq9BDFseMB8UulpgMk4GqopcLPNEO6ktBJpg4Lv1Z/nDchw7cOkKe5nPHirMucyCBNc2p5ieL4
 hZiV55eli5lBsMwJM57HV/WdnC
X-Google-Smtp-Source: AGHT+IGtK5+3EN3RP36Jr6WhTgroYh7bJ+nbc8HfGZjGf3GbDQOIMlpGyvgP8INPiwIm/LolK7X4vsx+srQCIhDUtoE=
X-Received: by 2002:a05:6808:150c:b0:3fe:aecb:7110 with SMTP id
 5614622812f47-4003633f6dcmr1245029b6e.37.1743599781839; Wed, 02 Apr 2025
 06:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250401161929.283244-1-tzimmermann@suse.de>
 <20250401161929.283244-7-tzimmermann@suse.de>
In-Reply-To: <20250401161929.283244-7-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 2 Apr 2025 15:16:10 +0200
X-Gm-Features: AQ5f1Jpqk4WlR9xN-ml5vlp9yqeR-HzxlQx35c_lW0viVHhj5xfZaxTrLnthwBg
Message-ID: <CAMeQTsYcxHyFVn_BHUpxrfMsXZUX07Unm1rBmMYo6i1SMgj3VA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/udl: Return error if vendor descriptor is too
 short
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org
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

On Tue, Apr 1, 2025 at 6:23=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> There need to be least 5 bytes in the vendor descriptor. Return
> an error otherwise. Also change the branching to early-out on
> the error. Adjust indention of the rest of the parser function.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_main.c | 72 +++++++++++++++++-----------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_mai=
n.c
> index 4291ddb7158c4..58d6065589d3a 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -45,43 +45,43 @@ static int udl_parse_vendor_descriptor(struct udl_dev=
ice *udl)
>                 goto unrecognized;
>         len =3D ret;
>
> -       if (len > 5) {
> -               DRM_INFO("vendor descriptor length: %u data:%11ph\n",
> -                        len, desc);
> -
> -               if ((desc[0] !=3D len) ||    /* descriptor length */
> -                   (desc[1] !=3D 0x5f) ||   /* vendor descriptor type */
> -                   (desc[2] !=3D 0x01) ||   /* version (2 bytes) */
> -                   (desc[3] !=3D 0x00) ||
> -                   (desc[4] !=3D len - 2))  /* length after type */
> -                       goto unrecognized;
> -
> -               desc_end =3D desc + len;
> -               desc +=3D 5; /* the fixed header we've already parsed */
> -
> -               while (desc < desc_end) {
> -                       u8 length;
> -                       u16 key;
> -
> -                       key =3D le16_to_cpu(*((u16 *) desc));
> -                       desc +=3D sizeof(u16);
> -                       length =3D *desc;
> -                       desc++;
> -
> -                       switch (key) {
> -                       case 0x0200: { /* max_area */
> -                               u32 max_area;
> -                               max_area =3D le32_to_cpu(*((u32 *)desc));
> -                               DRM_DEBUG("DL chip limited to %d pixel mo=
des\n",
> -                                       max_area);
> -                               udl->sku_pixel_limit =3D max_area;
> -                               break;
> -                       }
> -                       default:
> -                               break;
> -                       }
> -                       desc +=3D length;
> +       if (len < 5)

Hi Thomas,

Shouldn't this be if (len <=3D 5)? The old code only parsed if the
descriptor returned at least 6 bytes.

-Patrik

> +               goto unrecognized;
> +
> +       DRM_INFO("vendor descriptor length: %u data:%11ph\n", len, desc);
> +
> +       if ((desc[0] !=3D len) ||    /* descriptor length */
> +           (desc[1] !=3D 0x5f) ||   /* vendor descriptor type */
> +           (desc[2] !=3D 0x01) ||   /* version (2 bytes) */
> +           (desc[3] !=3D 0x00) ||
> +           (desc[4] !=3D len - 2))  /* length after type */
> +               goto unrecognized;
> +
> +       desc_end =3D desc + len;
> +       desc +=3D 5; /* the fixed header we've already parsed */
> +
> +       while (desc < desc_end) {
> +               u8 length;
> +               u16 key;
> +
> +               key =3D le16_to_cpu(*((u16 *)desc));
> +               desc +=3D sizeof(u16);
> +               length =3D *desc;
> +               desc++;
> +
> +               switch (key) {
> +               case 0x0200: { /* max_area */
> +                       u32 max_area =3D le32_to_cpu(*((u32 *)desc));
> +
> +                       DRM_DEBUG("DL chip limited to %d pixel modes\n",
> +                                 max_area);
> +                       udl->sku_pixel_limit =3D max_area;
> +                       break;
> +               }
> +               default:
> +                       break;
>                 }
> +               desc +=3D length;
>         }
>
>         goto success;
> --
> 2.49.0
>
