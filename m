Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEED772D03
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC4910E369;
	Mon,  7 Aug 2023 17:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CE310E369;
 Mon,  7 Aug 2023 17:31:49 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1bbb4bde76dso3539726fac.2; 
 Mon, 07 Aug 2023 10:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429508; x=1692034308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=076JJ4vvpe4Hogv09ZSyczaDY6j365GFf7clQP3Kyy0=;
 b=GewKJ+7D2HxtJUE/e7HkEFFricw8bVIBD/teJv7aIGFHXpP2gzVksmcN2MLIF+U+zJ
 2Lav5ecR1WTKN0aY0PN9P4bINxdHc4iy2hDfuboyPTBsjEc/SVziNsL52Wcxg9gBdWUr
 Acsn3I/tVKkXyEHhbTNbFyBZUBMJaD9W4EzULF6BFsL1CL7i7RyyqotKpzti/ohQjmeI
 pVsUdgP/3qSThRXsHD9qqiPOSZMp/RzGGgM+N3vokzeTS311/Ky7e50BHYcVyBTD+9xo
 PhFWCvjJ3dunB+EgPwbHatoI2bNpcYNF6JecCNa4m3uvBlCrrGskk7T8u34LENzmJ1Je
 H5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429508; x=1692034308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=076JJ4vvpe4Hogv09ZSyczaDY6j365GFf7clQP3Kyy0=;
 b=gSwPO0/MTu8v7LuI4n66pjnRaTM2h33d1T/Dlily2fWFH/vPxdgh/CJ73V9o8vv/u7
 /iBnmCW0V/jOtfk/ypDa43CVMUPwRtRaRYcPAJRNvNIIUlyB2rg4n+NXSifUacoPxOwl
 2xshQQ7vC8B6RBEnpFGyFn9+8WqMqRUxY+eC7eGeeEsSA5WqZ62s8xGMkKLY+lG2/Rs4
 GSDunSNX8MWJoepnHtTx/GVMZLAm8PXFwAq/d6nwGglXs1eC0ry/n136sZM98feTq5uH
 zwvPHHPHf3a73NO215SbNWxZ1oTQHdePPGy/CdmxXpdzaaUfr95vvp0Ae9mFhuUn6eQE
 kEHQ==
X-Gm-Message-State: AOJu0Yx98fSpupmR6XDSy8ByrJ3919fctfIdXjJHW2rlQONDu6nM6y2K
 iK+rNvaSxEXHH0UGWRxO+yS058HivotShZ01BxE=
X-Google-Smtp-Source: AGHT+IGp7pPKVqROyIZghJyysbYahTbYpKq7awECK6ZPckm/aCSYkRExkCDYPe43B6XSHWCqny+SrxAP2iyaZyJUZac=
X-Received: by 2002:a05:6871:6a9:b0:19f:2c0e:f865 with SMTP id
 l41-20020a05687106a900b0019f2c0ef865mr12265529oao.7.1691429508553; Mon, 07
 Aug 2023 10:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230802074315.13688-1-sunran001@208suo.com>
In-Reply-To: <20230802074315.13688-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:31:37 -0400
Message-ID: <CADnq5_PYnyF4JB5vWYydcWziaAyULWmxayZN6q+-iYnCBohO+A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in vcn_v4_0.c
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

On Wed, Aug 2, 2023 at 3:43=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> spaces required around that '=3D=3D' (ctx:VxV)
> ERROR: space required before the open parenthesis '('
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v4_0.c
> index 6089c7deba8a..ef5b16061e96 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1139,11 +1139,11 @@ static int vcn_v4_0_start(struct amdgpu_device *a=
dev)
>                                 if (status & 2)
>                                         break;
>                                 mdelay(10);
> -                               if (amdgpu_emu_mode=3D=3D1)
> +                               if (amdgpu_emu_mode =3D=3D 1)
>                                         msleep(1);
>                         }
>
> -                       if (amdgpu_emu_mode=3D=3D1) {
> +                       if (amdgpu_emu_mode =3D=3D 1) {
>                                 r =3D -1;
>                                 if (status & 2) {
>                                         r =3D 0;
> @@ -1959,7 +1959,7 @@ static int vcn_v4_0_set_powergating_state(void *han=
dle, enum amd_powergating_sta
>                 return 0;
>         }
>
> -       if(state =3D=3D adev->vcn.cur_state)
> +       if (state =3D=3D adev->vcn.cur_state)
>                 return 0;
>
>         if (state =3D=3D AMD_PG_STATE_GATE)
> @@ -1967,7 +1967,7 @@ static int vcn_v4_0_set_powergating_state(void *han=
dle, enum amd_powergating_sta
>         else
>                 ret =3D vcn_v4_0_start(adev);
>
> -       if(!ret)
> +       if (!ret)
>                 adev->vcn.cur_state =3D state;
>
>         return ret;
> @@ -2101,8 +2101,7 @@ static const struct amd_ip_funcs vcn_v4_0_ip_funcs =
=3D {
>         .set_powergating_state =3D vcn_v4_0_set_powergating_state,
>  };
>
> -const struct amdgpu_ip_block_version vcn_v4_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version vcn_v4_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_VCN,
>         .major =3D 4,
>         .minor =3D 0,
> --
> 2.17.1
>
