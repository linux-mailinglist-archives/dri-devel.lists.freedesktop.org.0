Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6583C20F2B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746C710E9EB;
	Thu, 30 Oct 2025 15:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gVmHCdGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6891810E9EB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:33:25 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-26987b80720so1543635ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761838405; x=1762443205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSrtuFsWyaFuDIg9Oq0ESkGEkzoKb+w5VcoJTz4/A6g=;
 b=gVmHCdGWVZ1d8H5QboZZo3OLnJJM+ZeRmwXQPE7hAZUutozZHNR/FLuy/GtLsKyshr
 OCzP8d5GvJa+w9aMCMTQe0grzsJdifQcdpV//S82lAyPa4vdTDfK3ooWhG9pLfeRfA1j
 zaR8DmGtotI3h85OtXW97O5ECOFCHFY6ZCBbw7yKMoteyz3keRQx1WgXKB+YT6Y9mpIU
 4jdiH7UbB1sCCqNS7wYO2fcktMi18UnwCRzngStVfhoW4ZuD6RDocjLMcR7gLBwSrUim
 xgweJzUmMNBx2m4ljPIKTo02DbHErzGR4CZuRmRnSA/LEt9XY2BfAmGpvwwRYLnc/t73
 xayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761838405; x=1762443205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSrtuFsWyaFuDIg9Oq0ESkGEkzoKb+w5VcoJTz4/A6g=;
 b=dGB2kTmtZmKcIe5Ote3fgRKXIF9Pw/RVbzMvvjSRN+nMmipvXHaLbFvF8fjW9UtYaP
 Z4e4dZXAWRcCp5ZjPktmKv8v2wMZPOZ77w3Be5KDxljAa217cZNErf8+933dK6x0zBEn
 MINrOsiDwxOmlzHZDXDgtfBuMg3zHOTKYn9SyNASYUKZVv+VDdr9K5lKYxqefvydFOb/
 jEtwZhtZniWVSYc/GTjsw9gsk8nK4KlPRdJcbkaJVxxkwpeobnAwVcFRYf3S8WAo82Gy
 WCh5VtKI1EScl9/AgukBPxf762lMsu/xpiaZCJVLHux10wg6HROMKLfjp7kfS6HP5hei
 7dgg==
X-Gm-Message-State: AOJu0Yyl2K/oJ3NCWf4Pny7AA9EGt4xeN5cjgoqgKcsZ/RcEqr4EJ79b
 M2gdkVYWXvKE9Kptxf/+PzpLzm6cjxDcAma8zETJRYiF91c17yDTBCKuI6x2EvmVVecqfc0FlZT
 BsshcUn5jq3olqWtpA0BeEADv4YDdZ1g=
X-Gm-Gg: ASbGnctaL6WDeWzVi8Rpe1XDCGnSVBLfCzM/ECB9Og2jBs7gwevX6+QD7Maae+YE03D
 ocY+k4d+XgOA1b3f+dizYOSDHtzhjrUumpt4kV7ooEC2VdrT+RKBz9f8OtHr73huEFOuHSsjT6u
 SskfmvqL71LEvMKznjN8sfiy1vuuYKEuheHRk2qCtRt5p6YSEEEw4+ta6+/1EeC/ppfwe5C6/Cq
 pBf+NLC3Scwub0j9VHEx0jqwXRPya1fWU2RMiEJAKHxDnm1Hd0L6odmsjNw
X-Google-Smtp-Source: AGHT+IF/DIcmG8u5RIhhAldrw36dsfpg+I4aimMNvV0R2hPUZTuiDy91PQ+wNVE4OZ/Fz3BlbzPBEjTfu7I/QAPnw0U=
X-Received: by 2002:a17:903:41ca:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-2951a37f5b0mr1184265ad.2.1761838404814; Thu, 30 Oct 2025
 08:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761681968.git.jani.nikula@intel.com>
 <c04d81ae648c5f21b3f5b7953f924718051f2798.1761681968.git.jani.nikula@intel.com>
In-Reply-To: <c04d81ae648c5f21b3f5b7953f924718051f2798.1761681968.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Oct 2025 11:33:13 -0400
X-Gm-Features: AWmQ_bmWPKIX3d-kIDddLaL2dw67OeDnzKsWnv6V0e-DXCx6Xc_EyN4vl5wEspA
Message-ID: <CADnq5_MA9sUeKC6XEJGqvzSwXzwXL8bqUfs4U41aTJY2qF=Upw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/displayid: add quirk to ignore DisplayID checksum
 errors
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, tiago.martins.araujo@gmail.com
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

On Tue, Oct 28, 2025 at 5:26=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> Add a mechanism for DisplayID specific quirks, and add the first quirk
> to ignore DisplayID section checksum errors.
>
> It would be quite inconvenient to pass existing EDID quirks from
> drm_edid.c for DisplayID parsing. Not all places doing DisplayID
> iteration have the quirks readily available, and would have to pass it
> in all places. Simply add a separate array of DisplayID specific EDID
> quirks. We do end up checking it every time we iterate DisplayID blocks,
> but hopefully the number of quirks remains small.
>
> There are a few laptop models with DisplayID checksum failures, leading
> to higher refresh rates only present in the DisplayID blocks being
> ignored. Add a quirk for the panel in the machines.
>
> Reported-by: Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmail.com>
> Closes: https://lore.kernel.org/r/CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBD=
xfOVtfGGqiKQ@mail.gmail.com
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14703
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_displayid.c          | 41 +++++++++++++++++++++---
>  drivers/gpu/drm/drm_displayid_internal.h |  2 ++
>  2 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displa=
yid.c
> index 20b453d2b854..58d0bb6d2676 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -9,6 +9,34 @@
>  #include "drm_crtc_internal.h"
>  #include "drm_displayid_internal.h"
>
> +enum {
> +       QUIRK_IGNORE_CHECKSUM,
> +};
> +
> +struct displayid_quirk {
> +       const struct drm_edid_ident ident;
> +       u8 quirks;
> +};
> +
> +static const struct displayid_quirk quirks[] =3D {
> +       {
> +               .ident =3D DRM_EDID_IDENT_INIT('C', 'S', 'O', 5142, "MNE0=
07ZA1-5"),
> +               .quirks =3D BIT(QUIRK_IGNORE_CHECKSUM),
> +       },
> +};
> +
> +static u8 get_quirks(const struct drm_edid *drm_edid)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(quirks); i++) {
> +               if (drm_edid_match(drm_edid, &quirks[i].ident))
> +                       return quirks[i].quirks;
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct displayid_header *
>  displayid_get_header(const u8 *displayid, int length, int index)
>  {
> @@ -23,7 +51,7 @@ displayid_get_header(const u8 *displayid, int length, i=
nt index)
>  }
>
>  static const struct displayid_header *
> -validate_displayid(const u8 *displayid, int length, int idx)
> +validate_displayid(const u8 *displayid, int length, int idx, bool ignore=
_checksum)
>  {
>         int i, dispid_length;
>         u8 csum =3D 0;
> @@ -41,8 +69,11 @@ validate_displayid(const u8 *displayid, int length, in=
t idx)
>         for (i =3D 0; i < dispid_length; i++)
>                 csum +=3D displayid[idx + i];
>         if (csum) {
> -               DRM_NOTE("DisplayID checksum invalid, remainder is %d\n",=
 csum);
> -               return ERR_PTR(-EINVAL);
> +               DRM_NOTE("DisplayID checksum invalid, remainder is %d%s\n=
", csum,
> +                        ignore_checksum ? " (ignoring)" : "");
> +
> +               if (!ignore_checksum)
> +                       return ERR_PTR(-EINVAL);
>         }
>
>         return base;
> @@ -52,6 +83,7 @@ static const u8 *find_next_displayid_extension(struct d=
isplayid_iter *iter)
>  {
>         const struct displayid_header *base;
>         const u8 *displayid;
> +       bool ignore_checksum =3D iter->quirks & BIT(QUIRK_IGNORE_CHECKSUM=
);
>
>         displayid =3D drm_edid_find_extension(iter->drm_edid, DISPLAYID_E=
XT, &iter->ext_index);
>         if (!displayid)
> @@ -61,7 +93,7 @@ static const u8 *find_next_displayid_extension(struct d=
isplayid_iter *iter)
>         iter->length =3D EDID_LENGTH - 1;
>         iter->idx =3D 1;
>
> -       base =3D validate_displayid(displayid, iter->length, iter->idx);
> +       base =3D validate_displayid(displayid, iter->length, iter->idx, i=
gnore_checksum);
>         if (IS_ERR(base))
>                 return NULL;
>
> @@ -76,6 +108,7 @@ void displayid_iter_edid_begin(const struct drm_edid *=
drm_edid,
>         memset(iter, 0, sizeof(*iter));
>
>         iter->drm_edid =3D drm_edid;
> +       iter->quirks =3D get_quirks(drm_edid);
>  }
>
>  static const struct displayid_block *
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/d=
rm_displayid_internal.h
> index 957dd0619f5c..5b1b32f73516 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -167,6 +167,8 @@ struct displayid_iter {
>
>         u8 version;
>         u8 primary_use;
> +
> +       u8 quirks;
>  };
>
>  void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
> --
> 2.47.3
>
