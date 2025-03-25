Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C39A70CA2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 23:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FE510E2A7;
	Tue, 25 Mar 2025 22:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ODpWJwke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45F910E2A7;
 Tue, 25 Mar 2025 22:12:16 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2ff67f44fcaso1675629a91.3; 
 Tue, 25 Mar 2025 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742940736; x=1743545536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=od9pHwvKTDqtCanN7vue6aidZIC4KSNszNDu5XDL030=;
 b=ODpWJwke4eKtljEZ5nqLlwIw1QElJXRvnPdX0zzxJgF4EuG0YWBL3VUt1K2YczQ16n
 q1+F6LA7B85a28K+WNcW0tiLIugcS5BUGVw5zSXAjlmJZQiWnIY0BVZscnv33+tD6XFw
 mm9HUiIU9tS2Ws+As5Uqp51bK5aynLTrtWrrc0nEZyIjSAfEzgOaIRMN16XTzTkVJtuf
 cQAHMwC3G3/HJL+y9gS87NS3yV51mTW3SLYWlCvBQLFSs/zBZsVazCoYEqloGGTUZRFu
 v4fzAJipDED0GyGf6ixxn7rK2H2d0HjhKQNntf31mSjfVbABgIPruDp0eioKa7ujj168
 0BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742940736; x=1743545536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=od9pHwvKTDqtCanN7vue6aidZIC4KSNszNDu5XDL030=;
 b=It9aRUHvl1n8c58qR79BIpT7Uq8om/WvhV7zJDBh3v3yrOXncwlcjVhh23O5o/yLTP
 2jfmfkUqRn7R5yyx37d97QboGYehkZgeFU1OTjuuRLp05w5yWnfXZoJxXlALJSyEsVDA
 ssD9WsJafTu6CzY4fVcaYPfhgT2yYemtjJ05vkqrjjHq/Hln1g1mB8H8d/IU/9xTg/z2
 TMc9iOkIiKxEJHpJKcDqhW4/LtSRVI3JsZC3D0xD+52c1yaZl+3stctiUgGPTTNT46xp
 Pbb0DcrfcdmtzC0FsWkiVZRrz3fYNeDWufx2fLa9NZkUdX65jIs7C+Lbrlp6Ks432GiS
 7jMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6VOHuaOsHnxEUQnzF762uaR7CTww7R9gmCaEKsxLuZw/3EJghNkH7oqQS2Bri38buHAGZ2Zf8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmEuHcLT+ed5oXwoH7xOOiocdsxMIVf2cfn8sa/hsf3jqbtb3V
 KrH4OSBnqyH2yLbogpRTAj6BoDPCsZ4HqSNreCUZEoZRnsQQ+ydz7eXwoz1tGii23QOXaDgltp+
 vcmY938qD+NinbcE1TGKh+1uAI0Q=
X-Gm-Gg: ASbGncsxMt7iCFSLxnFB5EONRIlt2PJHSPAXeA7sjH25q3OMA5TpGgoPOhKklIGzQOm
 5+EpL8ezB6J1mvuJ1yi3mbQzP9iw4l+c1rZtgxHwcA+2WL7XCtfZGmn6SdISCuc1WRSsnEuGt85
 6SuZtaNpj6bN6jIB793dUcsjVgaA==
X-Google-Smtp-Source: AGHT+IGV1svpZf6dEQvMFQKxRZPRAcOHlrsfO4jmy72XxmgDQa5aB5mBLrtr9kwQGFf0DdhDb+az2tMunqavZTqdyWA=
X-Received: by 2002:a17:90b:4c41:b0:2ff:6666:529d with SMTP id
 98e67ed59e1d1-3030fef4b27mr11159900a91.6.1742940735916; Tue, 25 Mar 2025
 15:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250325210517.2097188-1-bradynorander@gmail.com>
In-Reply-To: <20250325210517.2097188-1-bradynorander@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Mar 2025 18:12:04 -0400
X-Gm-Features: AQ5f1Jq62_XuZD0k3dE4N_FzF_eoMBk1GYehLCaicuweyhrZdp2RKX8gCq_kFNs
Message-ID: <CADnq5_MNBUY=jWbnq-gZQ_4_M_sBJGAgMD0bj2cMdnkoU9G=HA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use static ids for ACP platform devs
To: Brady Norander <bradynorander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 sunil.khatri@amd.com, boyuan.zhang@amd.com
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

On Tue, Mar 25, 2025 at 6:07=E2=80=AFPM Brady Norander <bradynorander@gmail=
.com> wrote:
>
> mfd_add_hotplug_devices() assigns child platform devices with
> PLATFORM_DEVID_AUTO, but the ACP machine drivers expect the platform
> device names to never change. Use mfd_add_devices() instead and give
> each cell a unique id.

While you are at it, can you take a look at
drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c and
drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c as well?

Alex

>
> Signed-off-by: Brady Norander <bradynorander@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_acp.c
> index deb0785350e8..9c657637d317 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -302,17 +302,19 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_b=
lock)
>                 adev->acp.acp_res[2].end =3D adev->acp.acp_res[2].start;
>
>                 adev->acp.acp_cell[0].name =3D "acp_audio_dma";
> +               adev->acp.acp_cell[0].id =3D 0;
>                 adev->acp.acp_cell[0].num_resources =3D 3;
>                 adev->acp.acp_cell[0].resources =3D &adev->acp.acp_res[0]=
;
>                 adev->acp.acp_cell[0].platform_data =3D &adev->asic_type;
>                 adev->acp.acp_cell[0].pdata_size =3D sizeof(adev->asic_ty=
pe);
>
>                 adev->acp.acp_cell[1].name =3D "designware-i2s";
> +               adev->acp.acp_cell[1].id =3D 1;
>                 adev->acp.acp_cell[1].num_resources =3D 1;
>                 adev->acp.acp_cell[1].resources =3D &adev->acp.acp_res[1]=
;
>                 adev->acp.acp_cell[1].platform_data =3D &i2s_pdata[0];
>                 adev->acp.acp_cell[1].pdata_size =3D sizeof(struct i2s_pl=
atform_data);
> -               r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp=
.acp_cell, 2);
> +               r =3D mfd_add_devices(adev->acp.parent, 0, adev->acp.acp_=
cell, 2, NULL, 0, NULL);
>                 if (r)
>                         goto failure;
>                 r =3D device_for_each_child(adev->acp.parent, &adev->acp.=
acp_genpd->gpd,
> @@ -410,30 +412,34 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_b=
lock)
>                 adev->acp.acp_res[4].end =3D adev->acp.acp_res[4].start;
>
>                 adev->acp.acp_cell[0].name =3D "acp_audio_dma";
> +               adev->acp.acp_cell[0].id =3D 0;
>                 adev->acp.acp_cell[0].num_resources =3D 5;
>                 adev->acp.acp_cell[0].resources =3D &adev->acp.acp_res[0]=
;
>                 adev->acp.acp_cell[0].platform_data =3D &adev->asic_type;
>                 adev->acp.acp_cell[0].pdata_size =3D sizeof(adev->asic_ty=
pe);
>
>                 adev->acp.acp_cell[1].name =3D "designware-i2s";
> +               adev->acp.acp_cell[1].id =3D 1;
>                 adev->acp.acp_cell[1].num_resources =3D 1;
>                 adev->acp.acp_cell[1].resources =3D &adev->acp.acp_res[1]=
;
>                 adev->acp.acp_cell[1].platform_data =3D &i2s_pdata[0];
>                 adev->acp.acp_cell[1].pdata_size =3D sizeof(struct i2s_pl=
atform_data);
>
>                 adev->acp.acp_cell[2].name =3D "designware-i2s";
> +               adev->acp.acp_cell[2].id =3D 2;
>                 adev->acp.acp_cell[2].num_resources =3D 1;
>                 adev->acp.acp_cell[2].resources =3D &adev->acp.acp_res[2]=
;
>                 adev->acp.acp_cell[2].platform_data =3D &i2s_pdata[1];
>                 adev->acp.acp_cell[2].pdata_size =3D sizeof(struct i2s_pl=
atform_data);
>
>                 adev->acp.acp_cell[3].name =3D "designware-i2s";
> +               adev->acp.acp_cell[3].id =3D 3;
>                 adev->acp.acp_cell[3].num_resources =3D 1;
>                 adev->acp.acp_cell[3].resources =3D &adev->acp.acp_res[3]=
;
>                 adev->acp.acp_cell[3].platform_data =3D &i2s_pdata[2];
>                 adev->acp.acp_cell[3].pdata_size =3D sizeof(struct i2s_pl=
atform_data);
>
> -               r =3D mfd_add_hotplug_devices(adev->acp.parent, adev->acp=
.acp_cell, ACP_DEVS);
> +               r =3D mfd_add_devices(adev->acp.parent, 0, adev->acp.acp_=
cell, ACP_DEVS, NULL, 0, NULL);
>                 if (r)
>                         goto failure;
>
> --
> 2.48.1
>
