Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E636C772B72
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E225010E2EF;
	Mon,  7 Aug 2023 16:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A96310E2EF;
 Mon,  7 Aug 2023 16:48:36 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56c685b7e91so3105393eaf.2; 
 Mon, 07 Aug 2023 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426915; x=1692031715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/XFpb9Q8SxuX4Bb0HzWApCl0ETedoYgIgDWXMebOdI=;
 b=JRv3FIduq6+iAKQo+88VdtQNqPMnEcW4wMVXdNwqZFEN2iMSHtgfvNqHy5Ck6bgYPV
 F8LcORa/HoiITMQyZepn1unEb0zD78crosXXir4GYrHNkZRsBGHmVioe4tRH1bqoQEXn
 zgCakowf1RxZ4c7jmEa9wCvIHVZzHYe885V/X5P2MzhoIM6tneK05nqGVTomjrLNzpCT
 boPNCd50O5WS70LDNR/FRbEZ607W7FjZoBl+GQo/BB2K7ODtc+Ktm9ztj6IxMfux7R/v
 oEuRuAni4FUdp10UXV7vJuph8LyzhheDCXlu7ieshfJ/3RPsqNmvoUednUni6/0Hc6+G
 Fcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426915; x=1692031715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/XFpb9Q8SxuX4Bb0HzWApCl0ETedoYgIgDWXMebOdI=;
 b=cK2jnuCiX++rrKN4NW7FrzaOVwTtzZ22ht6JZSkEc9jAguZjCRGM7gfgiUDOFjoiMt
 9WpCgd6R1IjJ2Ofvv9JJYvQpHZ0t6J891m8uJqrWynhorOmmsagBNKAApXR3WlArJOUA
 FEI8ZIREC/jY9pADAnW8nrYuUP8Aep5bA7TN+3C/HCvX/RwykqsnQphVqQNn2w3080D4
 N6IO8CK0Ni6QoUKe4Q1/w7iqXr95VGc9n1SE0nzJXtqu+SpNBCM7hD7pijjc52BMdgJm
 bqC94JW+g8ET3RFe5o+HyHZ9Null538QR/+0OUYqvxETCIlzzH/vwX0IAS6atYuUNIB9
 9ATg==
X-Gm-Message-State: AOJu0YzmCY1SjTDzYRyMPCh/hRRuxc6XkqbOs2zdCZEdXBZad5HBH64Q
 pJygEZWesJPK/5JD98bmVVvSEi05JqJ3qnWewUoACS8u
X-Google-Smtp-Source: AGHT+IEHDP4Fk56b/IDFNDYPsywp6rtzDsPvd4tyvoY1127dvwwNOtZRqIx0ZoqYS1/qV0w36xVPjxLEYQ86n8O2rcg=
X-Received: by 2002:a4a:929a:0:b0:56c:7a55:f6b3 with SMTP id
 i26-20020a4a929a000000b0056c7a55f6b3mr8516267ooh.5.1691426915440; Mon, 07 Aug
 2023 09:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230801093656.7761-1-sunran001@208suo.com>
In-Reply-To: <20230801093656.7761-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:48:24 -0400
Message-ID: <CADnq5_N8PzxV27cpYsw9MBe2dDvt7Ba7Pjf1d_O8hpEgSjJZCg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/powerplay/hwmgr/hwmgr: Clean up errors in
 hwmgr.c
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:37=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space prohibited after that '~' (ctx:WxW)
> ERROR: spaces required around that '||' (ctx:VxW)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c b/drivers/gpu=
/drm/amd/pm/powerplay/hwmgr/hwmgr.c
> index f2cef0930aa9..2b5ac21fee39 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
> @@ -120,7 +120,7 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
>                 case CHIP_TOPAZ:
>                         hwmgr->smumgr_funcs =3D &iceland_smu_funcs;
>                         topaz_set_asic_special_caps(hwmgr);
> -                       hwmgr->feature_mask &=3D ~ (PP_VBI_TIME_SUPPORT_M=
ASK |
> +                       hwmgr->feature_mask &=3D ~(PP_VBI_TIME_SUPPORT_MA=
SK |
>                                                 PP_ENABLE_GFX_CG_THRU_SMU=
);
>                         hwmgr->pp_table_version =3D PP_TABLE_V0;
>                         hwmgr->od_enabled =3D false;
> @@ -133,7 +133,7 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
>                 case CHIP_FIJI:
>                         hwmgr->smumgr_funcs =3D &fiji_smu_funcs;
>                         fiji_set_asic_special_caps(hwmgr);
> -                       hwmgr->feature_mask &=3D ~ (PP_VBI_TIME_SUPPORT_M=
ASK |
> +                       hwmgr->feature_mask &=3D ~(PP_VBI_TIME_SUPPORT_MA=
SK |
>                                                 PP_ENABLE_GFX_CG_THRU_SMU=
);
>                         break;
>                 case CHIP_POLARIS11:
> @@ -195,7 +195,7 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
>
>  int hwmgr_sw_init(struct pp_hwmgr *hwmgr)
>  {
> -       if (!hwmgr|| !hwmgr->smumgr_funcs || !hwmgr->smumgr_funcs->smu_in=
it)
> +       if (!hwmgr || !hwmgr->smumgr_funcs || !hwmgr->smumgr_funcs->smu_i=
nit)
>                 return -EINVAL;
>
>         phm_register_irq_handlers(hwmgr);
> --
> 2.17.1
>
