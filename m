Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC900772AE2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D330310E2BB;
	Mon,  7 Aug 2023 16:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03F910E1DD;
 Mon,  7 Aug 2023 16:32:25 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bc9254a1baso3838775a34.2; 
 Mon, 07 Aug 2023 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425945; x=1692030745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygTIUkZv7ZsC1Ak6vtB58w1LRxko3ruoE1DG7vp7o7g=;
 b=LAXiJfRVuW487oHewQhGBJPinFMxMoTRw/6b/moPXJpsf1IV75KV9K92HO/autzoOR
 rRg0qd7U7Rch7Wyf05kMunfAcflWrTpZGS9VV080lDEDu+ZywvmMy7A8gT0slXNWrPOe
 VGhzlgOl2baKd3H6Y0Dqk1IvndoCx0uzmJ5fYVvf10TVZ9mIbR3WgwKEoIf15uhtr396
 g8OpYuIEtz1oW37MOQbIRoZUsuF9g6VwQHNKQpH0H2IF/L9A0cZ6mmMT9DXr5lwXXGXT
 dmvkYZG6pmghrVNBKPdjcPL8+A5MZfAaP7jF0+JZrPvfYJvw9ZtPhd8VI7tmcNLTh3A6
 Xl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425945; x=1692030745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygTIUkZv7ZsC1Ak6vtB58w1LRxko3ruoE1DG7vp7o7g=;
 b=HjP2fiEViIDnEhVRKOcCZ59bZeNgMG6W9yEZKcCeesAhKmtjKyjQeVI+gvsL2Qgz/w
 jZQnLs2QY6BRXz5bOvryYbmLmqqSJyIxHNTvJQmlFt6n2BXAoEn5C5kTfZe7VMvcgdaF
 sYzw1zmstL/Zu+8ZLKMwq1eyy0cOpROT0wqZlq/TrRd9Kg2LyhQ7beLknc0PPzKpSxUI
 4PJHuCvi2vnAbnToV9pt+WGnSULfl6azgr0saXTDDah8srtvRkG8tR/0tHEdZCW4XKFj
 4Lf3bycsrWjh2ws9uYhsTcX8MqXpyI9Oh3+jiKR0fTVl/EikgSTsV3NPCBnt4tMQ9a70
 GF0g==
X-Gm-Message-State: AOJu0YwMhI6mJ/RtGcBH4Hk+Oecs6l6L7vLmwo/rv6DH4In2EXNAGu5x
 7TF218MFvBSNA/qNEzp9zefwPhFa8vRtZ34lYQs=
X-Google-Smtp-Source: AGHT+IFADLzDrmJBNqD0h6jZKZIbu6BHvz8y++9SQhxMWpdkTVMzHfELTGfP1WMkMgGjfOdSRul6Lm9Zr3/E55f5C9o=
X-Received: by 2002:a05:6870:8294:b0:1bb:8333:ab8a with SMTP id
 q20-20020a056870829400b001bb8333ab8amr10538221oae.4.1691425945123; Mon, 07
 Aug 2023 09:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230801055826.6000-1-sunran001@208suo.com>
In-Reply-To: <20230801055826.6000-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:32:14 -0400
Message-ID: <CADnq5_PJZ-vS+p8ky1C2LFPEfp6bVfTMveL7wFeKKytwvqePgw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega10_hwmgr.c
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

This one doesn't apply due to whitespace differences.

Alex

On Tue, Aug 1, 2023 at 1:58=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing statements should be on next line
> ERROR: space required before the open brace '{'
> ERROR: space required before the open parenthesis '('
> ERROR: space required after that ',' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> index 08518bc1cbbe..ba7294daddfe 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> @@ -670,17 +670,23 @@ static int vega10_patch_voltage_dependency_tables_w=
ith_lookup_table(
>         for (i =3D 0; i < 6; i++) {
>                 struct phm_ppt_v1_clock_voltage_dependency_table *vdt;
>                 switch (i) {
> -               case 0: vdt =3D table_info->vdd_dep_on_socclk;
> +               case 0:
> +                       vdt =3D table_info->vdd_dep_on_socclk;
>                         break;
> -               case 1: vdt =3D table_info->vdd_dep_on_sclk;
> +               case 1:
> +                       vdt =3D table_info->vdd_dep_on_sclk;
>                         break;
> -               case 2: vdt =3D table_info->vdd_dep_on_dcefclk;
> +               case 2:
> +                       vdt =3D table_info->vdd_dep_on_dcefclk;
>                         break;
> -               case 3: vdt =3D table_info->vdd_dep_on_pixclk;
> +               case 3:
> +                       vdt =3D table_info->vdd_dep_on_pixclk;
>                         break;
> -               case 4: vdt =3D table_info->vdd_dep_on_dispclk;
> +               case 4:
> +                       vdt =3D table_info->vdd_dep_on_dispclk;
>                         break;
> -               case 5: vdt =3D table_info->vdd_dep_on_phyclk;
> +               case 5:
> +                       vdt =3D table_info->vdd_dep_on_phyclk;
>                         break;
>                 }
>
> --
> 2.17.1
>
