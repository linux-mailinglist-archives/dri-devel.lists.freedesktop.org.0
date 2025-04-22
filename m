Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C46A96C62
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721DB10E59F;
	Tue, 22 Apr 2025 13:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fwtDsSSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44C510E59E;
 Tue, 22 Apr 2025 13:22:38 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ff6ce72844so569673a91.2; 
 Tue, 22 Apr 2025 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745328158; x=1745932958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBILyizekAjPCmmmdo2HKqcc4V7w+tmXlAj3jy+pQkY=;
 b=fwtDsSSIHV6G+AQ82M6/o6UvsF3qDu0kAxaHaxJELoaTGTXIs+LSpi7/yZwkA+SIxu
 SY5e2CKtY2xnSpOmAK45+GaD1aiNUM7xf/Npe6S/ladVNdHY0lhx3QhD6/jiuXFN6yd3
 XUwqGpK8FEmlomedfySl/8aciVXLsN9rfXCcmHvUuXuNDqLXHkcTcAa2Jdyn5N0Yia1U
 g44ojHmenvXKn3YxCQOU4eDeH8C7hp+uMOOuyaRq2IojKEsokpex9JnUdXATDRg10PiT
 kJUAYu/SuOT4TNojAzjYab0dnoCX2sEiJIvBxOEgGhv8KlVUh12yHqHQIPIQeDxisg2l
 /VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745328158; x=1745932958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBILyizekAjPCmmmdo2HKqcc4V7w+tmXlAj3jy+pQkY=;
 b=lWR8eoJ2LDi0Xg7TTz/BLmoUIEwvZbbh/ncD33y0tqeaaPYfweGrLTt08u6kGk6kN0
 iJe2o94JYLLuiHjgA0kTENYe56h3/F0YJjpuymO0kUtBKz0VZ8a2qcwcQmUWPHiEVeTN
 /y/dpT/OjRNuZuqOrq0MKXKrILcdrARf+/NQb3XLp3JDyyZowauRkfWyEJHCynFQHCUp
 a8OK3Uqlwr+ujECexqk8+iFH7R3njlWFRDlSp4uRo7WGy0G7p5ccUa8E8PgihWSUFqEW
 vvV7TZkW1CPmJuSipI8agD6Hb6syUWHvQB3Ea0IgPxrOLo2y/F2/3CB7Wkwc9evIP1LJ
 gwuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHbFbyQhg0DT9AdEM4YNjRbislONWjXtnalOHg2+E24KslFKVdYR7mZs1LB3BpXMbvCi7fKNxk0x19@lists.freedesktop.org,
 AJvYcCWgOgFkfIQK9a5xEuJ/WLNl6E2i/0/THR7Nz4ezICyz4+yW5LTPgluak4Y3u86KphkzzYoWBlrO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT4EYUong75urd8mwaaEXm2X1VgBEqMj7yv5RbMeHiRTHT+5Cd
 PJGOJRlV0tZnaNHPYLnwyVcg7tldbFmdD1K9I1POacTdEAIZdCYXO3J25+b58akrneH+rGhMJ5b
 81kxspJxt91hbh1jRDWD6K3DpZxUB3A==
X-Gm-Gg: ASbGncth9+/Y37s+SeumeBp6o6eb2mLQiJHziBUzmMflOfD3NeoDX+LIawfUkp6JP9O
 /jTBSOPo7RuYolpKOLAbTJwBunpoa72MSNomYjA6nJro0q8DFwpo7AJMYe98sRLDqO2A4fxHnI4
 G9Nbhai5CfdEUSIPVOCa2dlhP1wXW73ywW
X-Google-Smtp-Source: AGHT+IEHxIXJ57o2vAr1MKjS3Ux5RQVm7gJxKy8BTvCUtNN6vjof8j5ax/+3hlrY42ZuLwk/zzHCuS0iACWxFSW1XL4=
X-Received: by 2002:a17:90b:3b8d:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-3087bb426aemr9258177a91.1.1745328158110; Tue, 22 Apr 2025
 06:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250421215833.work.924-kees@kernel.org>
In-Reply-To: <20250421215833.work.924-kees@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Apr 2025 09:22:26 -0400
X-Gm-Features: ATxdqUGJQNgaoaG-hS1nqNwSeL05Pe4-dnmCjl-rEQJYX-mGdL9-b6jNGkZx9D0
Message-ID: <CADnq5_MbGS+DBRZhQccqP-o50vvv6uiT31msefRTw5bMydAAKg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/atom: Work around vbios NULL offset false
 positive
To: Kees Cook <kees@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jesse Zhang <jesse.zhang@amd.com>, Tim Huang <Tim.Huang@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alexander Richards <electrodeyt@gmail.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Al Viro <viro@zeniv.linux.org.uk>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

On Mon, Apr 21, 2025 at 5:59=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> GCC really does not want to consider NULL (or near-NULL) addresses as
> valid, so calculations based off of NULL end up getting range-tracked int=
o
> being an offset wthin a 0 byte array. It gets especially mad about this:
>
>                 if (vbios_str =3D=3D NULL)
>                         vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;
>         ...
>         if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
>                 vbios_str++;
>
> It sees this as being "sizeof(BIOS_ATOM_PREFIX) - 1" byte offset from
> NULL, when building with -Warray-bounds (and the coming
> -fdiagnostic-details flag):
>
> In function 'atom_get_vbios_pn',
>     inlined from 'amdgpu_atom_parse' at drivers/gpu/drm/amd/amdgpu/atom.c=
:1553:2:
> drivers/gpu/drm/amd/amdgpu/atom.c:1447:34: error: array subscript 0 is ou=
tside array bounds of 'unsigned char[0]' [-Werror=3Darray-bounds=3D]
>  1447 |         if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
>       |                                  ^~~~~~~~~~
>   'amdgpu_atom_parse': events 1-2
>  1444 |                 if (vbios_str =3D=3D NULL)
>       |                    ^
>       |                    |
>       |                    (1) when the condition is evaluated to true
> ......
>  1447 |         if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
>       |                                  ~~~~~~~~~~
>       |                                  |
>       |                                  (2) out of array bounds here
> In function 'amdgpu_atom_parse':
> cc1: note: source object is likely at address zero
>
> As there isn't a sane way to convince it otherwise, hide vbios_str from
> GCC's optimizer to avoid the warning so we can get closer to enabling
> -Warray-bounds globally.
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

Do you want me to pick this up, or do you want to take this through
some other tree?

Thanks,

Alex

> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Tim Huang <Tim.Huang@amd.com>
> Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> Cc: Alexander Richards <electrodeyt@gmail.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/atom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdg=
pu/atom.c
> index 81d195d366ce..427b073de2fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> @@ -1444,6 +1444,7 @@ static void atom_get_vbios_pn(struct atom_context *=
ctx)
>                 if (vbios_str =3D=3D NULL)
>                         vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;
>         }
> +       OPTIMIZER_HIDE_VAR(vbios_str);
>         if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
>                 vbios_str++;
>
> --
> 2.34.1
>
