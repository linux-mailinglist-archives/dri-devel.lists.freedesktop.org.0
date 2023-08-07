Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D528A772CCE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB65910E356;
	Mon,  7 Aug 2023 17:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952A710E355;
 Mon,  7 Aug 2023 17:25:04 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b9f3b57c4fso3608226a34.1; 
 Mon, 07 Aug 2023 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429104; x=1692033904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLvst6Zccwh0wf7EIu3L9mB0yryAQ4IriShfN7o2rso=;
 b=jWN9RHNdtgKdUKLtAsIovNcE4VyCmk/n5s7+1X+Wr126XMU1E3mH61625YKVvoV2H+
 066KNAhA5cAB2IneultQlG6pKkTzabzX4Dg9H2SyyY570qhirgvWV+FHHsf0uW+BEqnh
 cUfiMOqSPw31WBcq8t/DgiLYRmjRw7dVQH1EZNOSt2E2kzZ2MmArjdJAj8Giq+dJk3z8
 1RwQK4GvZ1IiqNLzOoNVyObP4oz207ziRhne5JS0RE0Qa5vc3WMe/U6UmTId9XmEI5+u
 Dei6c8Qv+b7ytKF74FvDTJNAIVkRhVbHK7C1d7NRBeQtvdTioDLb3f5E4GgrI6ITbaxl
 sfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429104; x=1692033904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLvst6Zccwh0wf7EIu3L9mB0yryAQ4IriShfN7o2rso=;
 b=B9CVeMOcIJq9m9Kk2W7bKNXpJEEReKW4dXEcm1E0JcgEjK6H7X4P9iVxKP6C2F3bUL
 /WjEkxAruq4L+zkyBfBx6pFSC+d9uL4vYP+QycxL5dJyc8rTbrQh8IhpGK3QPlXjnu1v
 pd4ei6PfCayW4nuYQVzZfLEV61o+zLytcHqxfU6rn6eF8rgV4FM7Bifd0SK5fpueYil5
 IJE+XoldGB00XPAMHJBJQbC7fbdUaAFC+OcBYwOunILtncMoyNZ4iL8fCyE6AqytU8Kp
 biCLrih5wbTY2F4CcGWtM1eBpZKwcEC1a6nycCypLYVFVkorhIsFmvK7wmq58spR+oSv
 xKxA==
X-Gm-Message-State: AOJu0Yw/Fn7yuvmMU7JAp5KY1WmxsXOv+kUD4OPbuxldCTuV0YcCQZSq
 xXlLauiqfKoqnvMSUouO/yG2LZruqxCJg5aCHzI=
X-Google-Smtp-Source: AGHT+IGgJVtr6qXj+2p5kOMV/EpBlIffMAz2jT7+vqJphZZDzvI7CUyNOajNYT9Mxo/5yYmXiRnTcPynAPmw1Ocm6eg=
X-Received: by 2002:a9d:611c:0:b0:6bb:1ec3:9ac1 with SMTP id
 i28-20020a9d611c000000b006bb1ec39ac1mr5578212otj.13.1691429103905; Mon, 07
 Aug 2023 10:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230802071201.12717-1-sunran001@208suo.com>
In-Reply-To: <20230802071201.12717-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:24:53 -0400
Message-ID: <CADnq5_O6H-YLDHxDM0baTpmLgrfdASsyFX4CPRQfZ9WyD8_ZRg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/jpeg: Clean up errors in vcn_v1_0.c
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

On Wed, Aug 2, 2023 at 3:12=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required before the open parenthesis '('
> ERROR: space prohibited after that '~' (ctx:WxW)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v1_0.c
> index 16feb491adf5..25ba27151ac0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -473,7 +473,7 @@ static void vcn_v1_0_disable_clock_gating(struct amdg=
pu_device *adev)
>         if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
>                 data |=3D 1 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
>         else
> -               data &=3D ~ UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
> +               data &=3D ~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
>
>         data |=3D 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
>         data |=3D 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
> @@ -1772,7 +1772,7 @@ static int vcn_v1_0_set_powergating_state(void *han=
dle,
>         int ret;
>         struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>
> -       if(state =3D=3D adev->vcn.cur_state)
> +       if (state =3D=3D adev->vcn.cur_state)
>                 return 0;
>
>         if (state =3D=3D AMD_PG_STATE_GATE)
> @@ -1780,7 +1780,7 @@ static int vcn_v1_0_set_powergating_state(void *han=
dle,
>         else
>                 ret =3D vcn_v1_0_start(adev);
>
> -       if(!ret)
> +       if (!ret)
>                 adev->vcn.cur_state =3D state;
>         return ret;
>  }
> @@ -2065,8 +2065,7 @@ static void vcn_v1_0_set_irq_funcs(struct amdgpu_de=
vice *adev)
>         adev->vcn.inst->irq.funcs =3D &vcn_v1_0_irq_funcs;
>  }
>
> -const struct amdgpu_ip_block_version vcn_v1_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version vcn_v1_0_ip_block =3D {
>                 .type =3D AMD_IP_BLOCK_TYPE_VCN,
>                 .major =3D 1,
>                 .minor =3D 0,
> --
> 2.17.1
>
