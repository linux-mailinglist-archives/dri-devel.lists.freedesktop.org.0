Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F4772B03
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEEA10E2D4;
	Mon,  7 Aug 2023 16:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6C10E2C6;
 Mon,  7 Aug 2023 16:34:13 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1bbb4bde76dso3499975fac.2; 
 Mon, 07 Aug 2023 09:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426053; x=1692030853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=355u3wxzUAPBEukgqITBwq4f3qWHBLHWp7l/yfnQN6k=;
 b=GZRu27dbzX8FvcS00nyGqmOQinIcuRBNRqiXH9h+pzDxYmJ2DdGcJO0QhC9lDGZykv
 pcsw8NV2H0J2eH1n18WceZW+1s0+HHTPh8vMxuJs8eAZ/rn5p80qpeDorwos+gqwipBy
 LO8vAvCK1i0MRS62hpnUaQNPB3ul5zTEBCxf4dxD1L9Iik3WJZAjUyg05BjD0fmJiGb9
 wK4mgYRT0mX2L70fYdcKnIwOOIEXKhe5WDSrWw3CZnHk+gwucgvYgv14fLvCJDARqLna
 cBnG6qqXOGkXdhErecJDXNZxqX25dvcLwXds+F8QBT5CZkecihhS5FDQizHkTTeENevC
 yfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426053; x=1692030853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=355u3wxzUAPBEukgqITBwq4f3qWHBLHWp7l/yfnQN6k=;
 b=Bzb39R4jLNMM28sikCz1U2+YBDx5yvplJxQeQ/T/rt+3q2id2Ik/DT2G/RsUgvd30f
 MWDcCgZSeAteI/v5ClHEwy8iFKKa29lVonsY5TQ/q/dy41Gze4dqKKFGhDewL9CY1kAP
 DIQlJuLp3iEYOVv8dgRCol0972pnqr3vCnDmXs+wDtz/JITBSHp6R4Wgqy3BXmLBqjgT
 9hSKYKN4kPuOfCmd6AoDClQgmCDcORNB7Ke5s37ZqLdTErrWgXfrgMZ+/rldGwvTGGZb
 Tw7eUr33IT5eKGG2xaHNUVuf57D8zBNPkiNw//tIissIb7WCxc7on8mDfYD1LH2wyW+A
 yqYQ==
X-Gm-Message-State: AOJu0YyYGZ5d3LKs4geL6R58A4QolJJZbZVCGBc/K65N72U70cnIDLCC
 iAkkbut5yj60fBqMlH6xioxokGJrnXv2kX19GPI=
X-Google-Smtp-Source: AGHT+IFC5BE479wBcqELZQpVQeGM0HBTQWCDcSzbvqyZzNr9zNQh+18S5QX8gg7gH5GWza1EoxxEYGNZsKrKryI5Vco=
X-Received: by 2002:a05:6870:4724:b0:1be:f23f:99b with SMTP id
 b36-20020a056870472400b001bef23f099bmr12307708oaq.42.1691426053066; Mon, 07
 Aug 2023 09:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230801061529.6269-1-sunran001@208suo.com>
In-Reply-To: <20230801061529.6269-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:34:02 -0400
Message-ID: <CADnq5_PizYO5faQR3AoGyZRq__sccQr9_6VuSqxv_DqKoM8SqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in smu7_powertune.c
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

On Tue, Aug 1, 2023 at 2:15=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: space required after that ',' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> index 21be23ec3c79..edab3ef09d33 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> @@ -520,8 +520,7 @@ static const struct gpu_pt_config_reg DIDTConfig_Pola=
ris12[] =3D {
>         {   0xFFFFFFFF  }
>  };
>
> -static const struct gpu_pt_config_reg DIDTConfig_Polaris11_Kicker[] =3D
> -{
> +static const struct gpu_pt_config_reg DIDTConfig_Polaris11_Kicker[] =3D =
{
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                       Shift                                               =
Value       Type
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -646,7 +645,7 @@ static const struct gpu_pt_config_reg DIDTConfig_Pola=
ris11_Kicker[] =3D
>         {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_=
STALL_CTRL_ENABLE_MASK,   DIDT_TCP_STALL_CTRL__DIDT_STALL_CTRL_ENABLE__SHIF=
T, 0x0001,     GPU_CONFIGREG_DIDT_IND },
>         {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_=
STALL_DELAY_HI_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_HI__SHIFT, =
   0x0001,     GPU_CONFIGREG_DIDT_IND },
>         {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_=
STALL_DELAY_LO_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_LO__SHIFT, =
   0x0001,     GPU_CONFIGREG_DIDT_IND },
> -       {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_=
HI_POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHI=
FT,0x01aa,     GPU_CONFIGREG_DIDT_IND },
> +       {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_=
HI_POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHI=
FT, 0x01aa,     GPU_CONFIGREG_DIDT_IND },
>         {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__UNUSE=
D_0_MASK,                 DIDT_TCP_STALL_CTRL__UNUSED_0__SHIFT,            =
   0x0000,     GPU_CONFIGREG_DIDT_IND },
>
>         {   ixDIDT_TCP_TUNING_CTRL,            DIDT_TCP_TUNING_CTRL__DIDT=
_TUNING_ENABLE_MASK,      DIDT_TCP_TUNING_CTRL__DIDT_TUNING_ENABLE__SHIFT, =
   0x0001,     GPU_CONFIGREG_DIDT_IND },
> @@ -666,8 +665,7 @@ static const struct gpu_pt_config_reg DIDTConfig_Pola=
ris11_Kicker[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct gpu_pt_config_reg GCCACConfig_VegaM[] =3D
> -{
> +static const struct gpu_pt_config_reg GCCACConfig_VegaM[] =3D {
>  // ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>  //      Offset                             Mask                         =
                       Shift                                               =
Value       Type
>  // ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -703,8 +701,7 @@ static const struct gpu_pt_config_reg GCCACConfig_Veg=
aM[] =3D
>      {   0xFFFFFFFF  }  // End of list
>  };
>
> -static const struct gpu_pt_config_reg DIDTConfig_VegaM[] =3D
> -{
> +static const struct gpu_pt_config_reg DIDTConfig_VegaM[] =3D {
>  // ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>  //      Offset                             Mask                         =
                       Shift                                               =
Value       Type
>  // ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -831,7 +828,7 @@ static const struct gpu_pt_config_reg DIDTConfig_Vega=
M[] =3D
>      {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STA=
LL_CTRL_ENABLE_MASK,   DIDT_TCP_STALL_CTRL__DIDT_STALL_CTRL_ENABLE__SHIFT, =
0x0001,     GPU_CONFIGREG_DIDT_IND },
>      {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STA=
LL_DELAY_HI_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_HI__SHIFT,    =
0x0001,     GPU_CONFIGREG_DIDT_IND },
>      {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_STA=
LL_DELAY_LO_MASK,      DIDT_TCP_STALL_CTRL__DIDT_STALL_DELAY_LO__SHIFT,    =
0x0001,     GPU_CONFIGREG_DIDT_IND },
> -    {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_HI_=
POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHIFT,=
0x01aa,     GPU_CONFIGREG_DIDT_IND },
> +    {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__DIDT_HI_=
POWER_THRESHOLD_MASK,  DIDT_TCP_STALL_CTRL__DIDT_HI_POWER_THRESHOLD__SHIFT,=
 0x01aa,     GPU_CONFIGREG_DIDT_IND },
>      {   ixDIDT_TCP_STALL_CTRL,             DIDT_TCP_STALL_CTRL__UNUSED_0=
_MASK,                 DIDT_TCP_STALL_CTRL__UNUSED_0__SHIFT,               =
0x0000,     GPU_CONFIGREG_DIDT_IND },
>
>      {   ixDIDT_TCP_TUNING_CTRL,            DIDT_TCP_TUNING_CTRL__DIDT_TU=
NING_ENABLE_MASK,      DIDT_TCP_TUNING_CTRL__DIDT_TUNING_ENABLE__SHIFT,    =
0x0001,     GPU_CONFIGREG_DIDT_IND },
> --
> 2.17.1
>
