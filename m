Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC646731ED9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 19:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0344310E52B;
	Thu, 15 Jun 2023 17:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B1110E52A;
 Thu, 15 Jun 2023 17:23:11 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6b291d55f52so5253953a34.2; 
 Thu, 15 Jun 2023 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686849790; x=1689441790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfFlsKMv3RMyntW+LCNUFcDhl5XFDp9sfF6uYbnWfyI=;
 b=MDcNSnh9seRrRK8gGegbccFg0UhxXjp8deXcRYO+wgnf+L+u6V7EIrbylLkuYO76s7
 MJ802l6kwXtNv8ZJUpPPPhewy9E4030SyAX3yI40hF26anhPDhTc3yxtw6hpcosqv1r3
 VpkcA7+8cc+bdH+AKYBWcbScZ24ETooBwOVryW1f8X8ljJaBTDuE8EKMNoYN9augXlVq
 vX9vITKgHbVD578FE5hzvD0dtKR8rAE/v4MUR3R6QcIWByGBbSWCQjmjdxjeDQSiV/Z6
 CM4c6WVO8OWghtG+9gvTVGCW5mCQ1JhC9f3p11hGRh90QeD8Qhx3ShLam2AZAdtBACW6
 HYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686849790; x=1689441790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfFlsKMv3RMyntW+LCNUFcDhl5XFDp9sfF6uYbnWfyI=;
 b=ZK8R1Pl8sxlwYDCtwtgVDC3cODlCpHVA6/36H+mtAjB3O993eNgqaAI6LbA75p7/E6
 u1sjQCZljaKH5YwRceA4l283rhnud28J+dThZc437tcJzUfg7deAO9SeO+07NfXvfY4e
 d64/QshkCrbvmB3N3Q3GNSvwTIPeaKmg+aibM3UleUxSUpnpGq3FhJFnrgqd9calqNPc
 D1xvpqzjeC3iF4HHUteV5ypAspkSvdKn5X3Tpdr3xoDrMKsB1dn0bKJa2WMUJGqx8ncI
 gOltwzxdTir1gSjQ84MM39oEcgkraHV3V2o0BNaooTyjHrtWPbhX3Z9qHzjwkrcqgGhT
 iZGA==
X-Gm-Message-State: AC+VfDwe/KqO5nRqn47QXQnigHQ5XRwI32xg1zUkmKjl28h+HPTD6dSi
 2gJ7iXF6DyPpv72YkkU0Q/gvMGFLUKhLCYmh+y8=
X-Google-Smtp-Source: ACHHUZ4oKwOWlIUEoBfveXnb3EmVEGrLJiB8zTlSSM8+U/ELL5P6THcZMl4V9mbwRUxV9zozzAKZcnU75oaVfITXnh0=
X-Received: by 2002:a9d:65d8:0:b0:6b2:b0dd:e99f with SMTP id
 z24-20020a9d65d8000000b006b2b0dde99fmr16979797oth.24.1686849790259; Thu, 15
 Jun 2023 10:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230614021546.39168-1-luojianhong@cdjrlc.com>
 <bfca99db848b8d29d0399566e579bc21@208suo.com>
In-Reply-To: <bfca99db848b8d29d0399566e579bc21@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jun 2023 13:22:59 -0400
Message-ID: <CADnq5_MYJYaQTPTdD04pZkoyTWQSxLLj7ZtTFkmVoR4F-1A1gQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove unneeded variable
To: baomingtong001@208suo.com
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied, but please check your mailer.  I had to manually fix this up.

Alex

On Wed, Jun 14, 2023 at 3:21=E2=80=AFAM <baomingtong001@208suo.com> wrote:
>
> fix the following coccicheck warning:
>
> drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:1657:14-18: Unneeded
> variable: "size".
>
> Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index 275f708db636..c94d825a871b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -1654,7 +1654,7 @@ static int navi10_force_clk_levels(struct
> smu_context *smu,
>                      enum smu_clk_type clk_type, uint32_t mask)
>   {
>
> -    int ret =3D 0, size =3D 0;
> +    int ret =3D 0;
>       uint32_t soft_min_level =3D 0, soft_max_level =3D 0, min_freq =3D 0=
,
> max_freq =3D 0;
>
>       soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
> @@ -1675,15 +1675,15 @@ static int navi10_force_clk_levels(struct
> smu_context *smu,
>
>           ret =3D smu_v11_0_get_dpm_freq_by_index(smu, clk_type,
> soft_min_level, &min_freq);
>           if (ret)
> -            return size;
> +            return 0;
>
>           ret =3D smu_v11_0_get_dpm_freq_by_index(smu, clk_type,
> soft_max_level, &max_freq);
>           if (ret)
> -            return size;
> +            return 0;
>
>           ret =3D smu_v11_0_set_soft_freq_limited_range(smu, clk_type,
> min_freq, max_freq);
>           if (ret)
> -            return size;
> +            return 0;
>           break;
>       case SMU_DCEFCLK:
>           dev_info(smu->adev->dev,"Setting DCEFCLK min/max dpm level is
> not supported!\n");
> @@ -1693,7 +1693,7 @@ static int navi10_force_clk_levels(struct
> smu_context *smu,
>           break;
>       }
>
> -    return size;
> +    return 0;
>   }
>
>   static int navi10_populate_umd_state_clk(struct smu_context *smu)
