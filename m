Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4EF772CC2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0079C10E352;
	Mon,  7 Aug 2023 17:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8410E35E;
 Mon,  7 Aug 2023 17:23:48 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1bb7a1c2fe5so3529924fac.2; 
 Mon, 07 Aug 2023 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429027; x=1692033827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnSUl1DSZr5Fls6ZOpvWGsqmImbGUDT7mTUl9oquTSs=;
 b=cC64se7BOTXW8iN4bttq/0ZioKeGOfYwXCHPFF4BDg0bC1qSuGMzUIlfe1iDbiED9e
 k2ycA/RfdVCWN7ljdaaDN2ecFOF1jf0jXxB4df8BcmNPMqIV2EOp7wyW5T+NJ6vlkNKi
 G1XwTfr32I0mUnzoregb6SpbkIgtuHr6l595IAEtDySDIbjkvOHyREuT8rykA1VyXQgw
 dZv8mNwtX/Z284T5mTH18PSbjqjLkRK5eqB9aGPf0wlXzFnOhdRxRrHZD2JEW/aTYe91
 SOyYcXBWD1AkbuBMHtNgZR5KDmqv1UOI1YKqag1hCV6j7uIs8mXqLff1Olsj/6Ai0ztM
 gnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429027; x=1692033827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hnSUl1DSZr5Fls6ZOpvWGsqmImbGUDT7mTUl9oquTSs=;
 b=RL3EO62Sbbc2gG7pwpfCDHaHmhQIbBQsSb3jPzm9pxcAwwVMQuYbr7QmxQroZx6Umm
 cUEJ6a4uKizjL2GysiRkS+gKhg7TrjJE0RitrlEqluxxAgLbQIq3ESdjoOD4ykJGH8SA
 wAD85AjKn93WekzaMnt32dER/0jATKuM/kDfpzr3z4EWEWArHSNDaN6xWib9c41wnC1U
 hvdGPzZ+xQuML6XaI6dr/mvbqGoLGJTPO01YMMVZ6mABVa0G5nBlHN/TAzAbM1R7rjdH
 YHbY67C9mTjCOyRdAcm6QYWLivEwTjAjlko3Cys8P5x6YJLnPDlz5H0ue4FvF3DsU8Gq
 9D1A==
X-Gm-Message-State: AOJu0Yy4kXmltTwxP0PqUE7W5HkuTu+uvRFHZF4dWjtPUATPTZq79J2f
 6EP1RbTcR7Xaona0obd/HMPZbRQG63VSdDyZVjLtmK2N
X-Google-Smtp-Source: AGHT+IGJBJkTtqCZ7hXNDy1AMmlhV69JSCio42nXPS+htexa0SnMKdOfQzoS5i8rtwe18oVXCg5JwhMw/9HpV+CRZOY=
X-Received: by 2002:a05:6870:e387:b0:1bf:8033:69a0 with SMTP id
 x7-20020a056870e38700b001bf803369a0mr12176484oad.30.1691429027572; Mon, 07
 Aug 2023 10:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230802070348.12538-1-sunran001@208suo.com>
In-Reply-To: <20230802070348.12538-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:23:36 -0400
Message-ID: <CADnq5_PaOovxLpa+8XZO1-AMFXyqNAg_VBNNGjvaVhRe=di0cQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in dce_v10_0.c
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

On Wed, Aug 2, 2023 at 3:04=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 30 +++++++++-----------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v10_0.c
> index 9a24ed463abd..584cd5277f92 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -52,8 +52,7 @@
>  static void dce_v10_0_set_display_funcs(struct amdgpu_device *adev);
>  static void dce_v10_0_set_irq_funcs(struct amdgpu_device *adev);
>
> -static const u32 crtc_offsets[] =3D
> -{
> +static const u32 crtc_offsets[] =3D {
>         CRTC0_REGISTER_OFFSET,
>         CRTC1_REGISTER_OFFSET,
>         CRTC2_REGISTER_OFFSET,
> @@ -63,8 +62,7 @@ static const u32 crtc_offsets[] =3D
>         CRTC6_REGISTER_OFFSET
>  };
>
> -static const u32 hpd_offsets[] =3D
> -{
> +static const u32 hpd_offsets[] =3D {
>         HPD0_REGISTER_OFFSET,
>         HPD1_REGISTER_OFFSET,
>         HPD2_REGISTER_OFFSET,
> @@ -121,30 +119,26 @@ static const struct {
>         .hpd =3D DISP_INTERRUPT_STATUS_CONTINUE5__DC_HPD6_INTERRUPT_MASK
>  } };
>
> -static const u32 golden_settings_tonga_a11[] =3D
> -{
> +static const u32 golden_settings_tonga_a11[] =3D {
>         mmDCI_CLK_CNTL, 0x00000080, 0x00000000,
>         mmFBC_DEBUG_COMP, 0x000000f0, 0x00000070,
>         mmFBC_MISC, 0x1f311fff, 0x12300000,
>         mmHDMI_CONTROL, 0x31000111, 0x00000011,
>  };
>
> -static const u32 tonga_mgcg_cgcg_init[] =3D
> -{
> +static const u32 tonga_mgcg_cgcg_init[] =3D {
>         mmXDMA_CLOCK_GATING_CNTL, 0xffffffff, 0x00000100,
>         mmXDMA_MEM_POWER_CNTL, 0x00000101, 0x00000000,
>  };
>
> -static const u32 golden_settings_fiji_a10[] =3D
> -{
> +static const u32 golden_settings_fiji_a10[] =3D {
>         mmDCI_CLK_CNTL, 0x00000080, 0x00000000,
>         mmFBC_DEBUG_COMP, 0x000000f0, 0x00000070,
>         mmFBC_MISC, 0x1f311fff, 0x12300000,
>         mmHDMI_CONTROL, 0x31000111, 0x00000011,
>  };
>
> -static const u32 fiji_mgcg_cgcg_init[] =3D
> -{
> +static const u32 fiji_mgcg_cgcg_init[] =3D {
>         mmXDMA_CLOCK_GATING_CNTL, 0xffffffff, 0x00000100,
>         mmXDMA_MEM_POWER_CNTL, 0x00000101, 0x00000000,
>  };
> @@ -1425,8 +1419,7 @@ static void dce_v10_0_audio_enable(struct amdgpu_de=
vice *adev,
>                            enable ? AZALIA_F0_CODEC_PIN_CONTROL_HOT_PLUG_=
CONTROL__AUDIO_ENABLED_MASK : 0);
>  }
>
> -static const u32 pin_offsets[] =3D
> -{
> +static const u32 pin_offsets[] =3D {
>         AUD0_REGISTER_OFFSET,
>         AUD1_REGISTER_OFFSET,
>         AUD2_REGISTER_OFFSET,
> @@ -1811,8 +1804,7 @@ static void dce_v10_0_afmt_fini(struct amdgpu_devic=
e *adev)
>         }
>  }
>
> -static const u32 vga_control_regs[6] =3D
> -{
> +static const u32 vga_control_regs[6] =3D {
>         mmD1VGA_CONTROL,
>         mmD2VGA_CONTROL,
>         mmD3VGA_CONTROL,
> @@ -3651,8 +3643,7 @@ static void dce_v10_0_set_irq_funcs(struct amdgpu_d=
evice *adev)
>         adev->hpd_irq.funcs =3D &dce_v10_0_hpd_irq_funcs;
>  }
>
> -const struct amdgpu_ip_block_version dce_v10_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version dce_v10_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_DCE,
>         .major =3D 10,
>         .minor =3D 0,
> @@ -3660,8 +3651,7 @@ const struct amdgpu_ip_block_version dce_v10_0_ip_b=
lock =3D
>         .funcs =3D &dce_v10_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version dce_v10_1_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version dce_v10_1_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_DCE,
>         .major =3D 10,
>         .minor =3D 1,
> --
> 2.17.1
>
