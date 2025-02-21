Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F69A3FAD6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E5410EABA;
	Fri, 21 Feb 2025 16:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ms8BL8EW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF9E10EAAD;
 Fri, 21 Feb 2025 16:20:45 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2217875d103so5163865ad.3; 
 Fri, 21 Feb 2025 08:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740154845; x=1740759645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ok1PcUQEwo9Z4uPO0boiFAABo1z9iTXkCf8Ww7aDcN4=;
 b=Ms8BL8EWwoMn6bRK4Hu9SrtkBLcr1QcZA9TFljg7HAvoTGPWcX9ukZLvW/XMZzHnSt
 TAUB1OGarSgAfXot1v9iX8RepN1L0difIb6AhmtjOVTtC3TFEep+7VwhWYTF+BtZ515k
 Gse3bhFhBlrjS1xGYujCg5/4kP7UB1nCmFa2UEElWJDVME0tA9RMnmmhMDUlKFZ5Avj5
 EqX6BwzvkGY61wQTXkY25WXfNQg4PGqGhzPW705QdK5E/FDuQhUe1GtpQt7xUl6/Uq9O
 OuLrN7BjIxC4ID+IT6ZFLXepfb4qh7246pnOWFMjrih44Ce5b+0mxzFtmZaQFrZIyHBE
 CuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154845; x=1740759645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ok1PcUQEwo9Z4uPO0boiFAABo1z9iTXkCf8Ww7aDcN4=;
 b=Je8bvpq47Um1rxMLmEKFWJ3my7z3S/4Y5RzYprV2QaAgA6DVnQjlZXdbSp1A5izLjC
 JRgdtSXGZKQ65LpeH2UR6pGGZw0mXQuhvTNyGdoVFTlnOl8Y25caYVrL0R4Vpl8G7Df7
 vGkG9wyBX1fa8AgSYDq98npYhUj7+epcp3jfnwvrSg8iQ2J2NRv1MObNult4KTaeoObL
 6JEsqElvvqY/fiyFl6twqwOejWaV/w43G/4QzL4Q3CtqsAGW2XtOHfrbeRlQ3loM9nYR
 Hy+lK3z66r5+iE/7SeR0X33Rl/71Cia1yygny+LA8ZPsVsEZVHIwklBa9vxq86kF4788
 2X/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Jnw0hOypm7ytPGYono82H9UDcEJ6hXo3QRrUjH2nouTYrO98HPReIi1787PDtkR5bSJ4w0hMweQ/@lists.freedesktop.org,
 AJvYcCV0O5XOm9tgIDPOzp285Kfqb3/3aFXJE0ZYUOUeFmanjrVVyejlzJPnjUmSiVekWXrTmee1HA/4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+/a0eTkJjbJB7CLrnCZ11gScJpK5nszAkK3SWtjtvee8AxSVZ
 QajhYEC60VqBQxA4vZaZ7gbB/kwtJ3OTujT8dcCTIl6B+jElEGJyxAZHQnLhhEJyGqTRs4ezJ46
 AM5yoUw489H/uReDRlLLAMFfqaHd06g==
X-Gm-Gg: ASbGncsigVaA7Aphz9nVVYsCEwlAZSwXHEN4LN5n5rvBRjLS4+Z6moBlXrdSjHBgGp7
 OtsRWifhF5lb7KgMatA2gcd8xgCGyagwugDsxZAAkcchArYIf6mMV4b0veRI/nF7B36fP2Xggk1
 yWAldBTgY=
X-Google-Smtp-Source: AGHT+IEeQ2lAvqEeFfxRn4Nrirkv4XDLaiyqdZeo/kvpEaOxNKZdbOVPP1dGbhLcch78JwD2YY3l/amCLt49Tu9LiQU=
X-Received: by 2002:a17:902:cec6:b0:220:d71d:4666 with SMTP id
 d9443c01a7336-2219fff855emr22594785ad.13.1740154845453; Fri, 21 Feb 2025
 08:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20250219212318.46036-1-linux@treblig.org>
In-Reply-To: <20250219212318.46036-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Feb 2025 11:20:33 -0500
X-Gm-Features: AWEUYZmGC373SSC5vhbJhkIHShbThxRTzyZwtw8XnFZE5muKA-ZzJdtCPl_7X2w
Message-ID: <CADnq5_PmPkzHrh9MjQF_tx-6ntEem0VKr=pbdWCgKaCKPz0NsA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove unused nbif_v6_3_1_sriov_funcs
To: linux@treblig.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Wed, Feb 19, 2025 at 4:48=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The nbif_v6_3_1_sriov_funcs instance of amdgpu_nbio_funcs was added in
> commit 894c6d3522d1 ("drm/amdgpu: Add nbif v6_3_1 ip block support")
> but has remained unused.
>
> Alex has confirmed it wasn't needed.
>
> Remove it, together with the four unused stub functions:
>   nbif_v6_3_1_sriov_ih_doorbell_range
>   nbif_v6_3_1_sriov_gc_doorbell_init
>   nbif_v6_3_1_sriov_vcn_doorbell_range
>   nbif_v6_3_1_sriov_sdma_doorbell_range
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c | 46 ------------------------
>  drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h |  1 -
>  2 files changed, 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c b/drivers/gpu/drm/a=
md/amdgpu/nbif_v6_3_1.c
> index c92875ceb31f..9efe74148867 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c
> @@ -474,52 +474,6 @@ const struct amdgpu_nbio_funcs nbif_v6_3_1_funcs =3D=
 {
>  };
>
>
> -static void nbif_v6_3_1_sriov_ih_doorbell_range(struct amdgpu_device *ad=
ev,
> -                                               bool use_doorbell, int do=
orbell_index)
> -{
> -}
> -
> -static void nbif_v6_3_1_sriov_sdma_doorbell_range(struct amdgpu_device *=
adev,
> -                                                 int instance, bool use_=
doorbell,
> -                                                 int doorbell_index,
> -                                                 int doorbell_size)
> -{
> -}
> -
> -static void nbif_v6_3_1_sriov_vcn_doorbell_range(struct amdgpu_device *a=
dev,
> -                                                bool use_doorbell,
> -                                                int doorbell_index, int =
instance)
> -{
> -}
> -
> -static void nbif_v6_3_1_sriov_gc_doorbell_init(struct amdgpu_device *ade=
v)
> -{
> -}
> -
> -const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs =3D {
> -       .get_hdp_flush_req_offset =3D nbif_v6_3_1_get_hdp_flush_req_offse=
t,
> -       .get_hdp_flush_done_offset =3D nbif_v6_3_1_get_hdp_flush_done_off=
set,
> -       .get_pcie_index_offset =3D nbif_v6_3_1_get_pcie_index_offset,
> -       .get_pcie_data_offset =3D nbif_v6_3_1_get_pcie_data_offset,
> -       .get_rev_id =3D nbif_v6_3_1_get_rev_id,
> -       .mc_access_enable =3D nbif_v6_3_1_mc_access_enable,
> -       .get_memsize =3D nbif_v6_3_1_get_memsize,
> -       .sdma_doorbell_range =3D nbif_v6_3_1_sriov_sdma_doorbell_range,
> -       .vcn_doorbell_range =3D nbif_v6_3_1_sriov_vcn_doorbell_range,
> -       .gc_doorbell_init =3D nbif_v6_3_1_sriov_gc_doorbell_init,
> -       .enable_doorbell_aperture =3D nbif_v6_3_1_enable_doorbell_apertur=
e,
> -       .enable_doorbell_selfring_aperture =3D nbif_v6_3_1_enable_doorbel=
l_selfring_aperture,
> -       .ih_doorbell_range =3D nbif_v6_3_1_sriov_ih_doorbell_range,
> -       .update_medium_grain_clock_gating =3D nbif_v6_3_1_update_medium_g=
rain_clock_gating,
> -       .update_medium_grain_light_sleep =3D nbif_v6_3_1_update_medium_gr=
ain_light_sleep,
> -       .get_clockgating_state =3D nbif_v6_3_1_get_clockgating_state,
> -       .ih_control =3D nbif_v6_3_1_ih_control,
> -       .init_registers =3D nbif_v6_3_1_init_registers,
> -       .remap_hdp_registers =3D nbif_v6_3_1_remap_hdp_registers,
> -       .get_rom_offset =3D nbif_v6_3_1_get_rom_offset,
> -       .set_reg_remap =3D nbif_v6_3_1_set_reg_remap,
> -};
> -
>  static int nbif_v6_3_1_set_ras_err_event_athub_irq_state(struct amdgpu_d=
evice *adev,
>                                                        struct amdgpu_irq_=
src *src,
>                                                        unsigned type,
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h b/drivers/gpu/drm/a=
md/amdgpu/nbif_v6_3_1.h
> index 9ac4831d39e1..3afec715a9fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h
> +++ b/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h
> @@ -28,7 +28,6 @@
>
>  extern const struct nbio_hdp_flush_reg nbif_v6_3_1_hdp_flush_reg;
>  extern const struct amdgpu_nbio_funcs nbif_v6_3_1_funcs;
> -extern const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs;
>  extern struct amdgpu_nbio_ras nbif_v6_3_1_ras;
>
>  #endif
> --
> 2.48.1
>
