Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA3772C6E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182CB10E333;
	Mon,  7 Aug 2023 17:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8C10E326;
 Mon,  7 Aug 2023 17:13:33 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bff2d2c141so597185fac.1; 
 Mon, 07 Aug 2023 10:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428413; x=1692033213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNT2pPzXo/+0oZm3DAtNl1Zdp8iCzJdD2Cg8qDW5Fmc=;
 b=Sau5uY4A4SOGreJsBXpdzR0RFtMroS+Xw/+Dd2z/O2K7zss8phvshitDjUeP4uIwfh
 BsbzhMeT7vsslDRSoCacSCa+ovbnQlw8rBoXC7K0wP+Wy+1KI7q09Sf6LS+vm4ulke3O
 sxUFFmnLuLY871Ai+1BlzRHBxCGAmIsVSMt7LYSjy0nv8uswR5JEG07J0g3YBVq3bsze
 ctrP5wRMQwzyLdIiJ0LW/P1+JRc53bp8m3qHcw3Z8er45mGugQnf4BMUthx8gQWffOf6
 VYgIRSicd50rPgSqTM80X4YUl82qfBzE3xs+dJlKf1EPYcS1adX+hOjfXwV6B2I58kg3
 uN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428413; x=1692033213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNT2pPzXo/+0oZm3DAtNl1Zdp8iCzJdD2Cg8qDW5Fmc=;
 b=fA4VBZYqqYMbNWvT0+bE0azYI8QrkfxfRwSujVt9YpgOOnL6PTKvbjJeQ/xRv4MhjM
 kT6ekCU6HcYSajUlRiqwMLe/ChXhsev2Z/7+sGRZ5/eUaLkGT49I+HCkasiMxZ93o6r2
 k4fulE6cpnG5o9azsA18nyt9MCNqtjTJ50kaTKeLpE8LaPLlXlnQ+Pf2h1cvz/xhnSL1
 9OqkZsEJ/5zHAX/6yaMHMGyBvkYvrxAuzTb45YwRWGZOaIGJ/1zoJ6fq2kpy5w5ETplV
 kBEVVbQ65xU+CdR9FFZNaKqHugy93fpX17GI1qYDgGLdrbn+Us7aeAuWuwPcL/+c6r7x
 WonQ==
X-Gm-Message-State: AOJu0YxdxLMEtIvt62Kg1IB2xSj6BteQeGj7xzVNOcyqVw40rVnPp6rm
 ZTKy38dyUk2MSkKB8+VREhJs7zL2hv9FKvJQ5Kw=
X-Google-Smtp-Source: AGHT+IGS0Hk2RkjYc2XJl6PanoOJZBzzEKeL5gjMguhmRAjwN/TWLHSj1ySl0gMy7ZRMsLbC9a0Re42pzE3JGeNmyzo=
X-Received: by 2002:a05:6870:148f:b0:1bb:c946:b80e with SMTP id
 k15-20020a056870148f00b001bbc946b80emr9826593oab.28.1691428412855; Mon, 07
 Aug 2023 10:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230802032256.10846-1-sunran001@208suo.com>
In-Reply-To: <20230802032256.10846-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:13:22 -0400
Message-ID: <CADnq5_O5FY_eYetryQ47FRwhh4-w=ifakZy0GNkvswQccuef2g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in bios_parser2.c
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

As a follow up patch, care to drop the break statements after a return?

On Tue, Aug 1, 2023 at 11:23=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: switch and case should be at the same indent
> ERROR: code indent should use tabs where possible
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/display/dc/bios/bios_parser2.c    | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers=
/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 540d19efad8f..033ce2638eb2 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -772,20 +772,20 @@ static enum bp_result bios_parser_get_device_tag(
>                 return BP_RESULT_BADINPUT;
>
>         switch (bp->object_info_tbl.revision.minor) {
> -           case 4:
> -           default:
> +       case 4:
> +       default:
>                 /* getBiosObject will return MXM object */
> -               object =3D get_bios_object(bp, connector_object_id);
> +               object =3D get_bios_object(bp, connector_object_id);
>
>                 if (!object) {
>                         BREAK_TO_DEBUGGER(); /* Invalid object id */
>                         return BP_RESULT_BADINPUT;
>                 }
>
> -               info->acpi_device =3D 0; /* BIOS no longer provides this =
*/
> -               info->dev_id =3D device_type_from_device_id(object->devic=
e_tag);
> -               break;
> -           case 5:
> +               info->acpi_device =3D 0; /* BIOS no longer provides this =
*/
> +               info->dev_id =3D device_type_from_device_id(object->devic=
e_tag);
> +               break;
> +       case 5:
>                 object_path_v3 =3D get_bios_object_from_path_v3(bp, conne=
ctor_object_id);
>
>                 if (!object_path_v3) {
> @@ -1580,13 +1580,13 @@ static bool bios_parser_is_device_id_supported(
>         uint32_t mask =3D get_support_mask_for_device_id(id);
>
>         switch (bp->object_info_tbl.revision.minor) {
> -           case 4:
> -           default:
> -               return (le16_to_cpu(bp->object_info_tbl.v1_4->supportedde=
vices) & mask) !=3D 0;
> -                       break;
> -           case 5:
> -                       return (le16_to_cpu(bp->object_info_tbl.v1_5->sup=
porteddevices) & mask) !=3D 0;
> -                       break;
> +       case 4:
> +       default:
> +               return (le16_to_cpu(bp->object_info_tbl.v1_4->supportedde=
vices) & mask) !=3D 0;
> +               break;
> +       case 5:
> +               return (le16_to_cpu(bp->object_info_tbl.v1_5->supportedde=
vices) & mask) !=3D 0;
> +               break;
>         }
>
>         return false;
> @@ -1755,7 +1755,7 @@ static enum bp_result bios_parser_get_firmware_info=
(
>                         case 2:
>                         case 3:
>                                 result =3D get_firmware_info_v3_2(bp, inf=
o);
> -                                break;
> +                       break;
>                         case 4:
>                                 result =3D get_firmware_info_v3_4(bp, inf=
o);
>                                 break;
> @@ -2225,7 +2225,7 @@ static enum bp_result bios_parser_get_disp_connecto=
r_caps_info(
>                 return BP_RESULT_BADINPUT;
>
>         switch (bp->object_info_tbl.revision.minor) {
> -           case 4:
> +       case 4:
>             default:
>                     object =3D get_bios_object(bp, object_id);
>
> --
> 2.17.1
>
