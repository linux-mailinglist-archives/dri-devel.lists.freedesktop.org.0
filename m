Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28C772C7B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732F10E33A;
	Mon,  7 Aug 2023 17:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3410E33A;
 Mon,  7 Aug 2023 17:15:17 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1bfafe8a425so2300041fac.3; 
 Mon, 07 Aug 2023 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428517; x=1692033317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kFXDoHF7GQ9pqFFzxyYijKExHAUDXpf8bLNBIMwDQc=;
 b=j4omNGFfHvaJj3AnMmflJ8VRfcki1f4QtDauC81JM+6mpZqIjmSRLFdAJ6sCbCRglX
 cN37W4uaQFKQ/eK5tQ9P6W/89vbqENJteuDp1IgSM3HiHyrtnaITT0x8NUlkO+4JueNo
 idOJ/K9S+oDMT8ltHPmUVe3LRjYClIrVFih9B0+554N1Nc0EKktiSjkSrFfp/mz5wKZM
 Cm53anU91soLJFagVTuQOQZ3Bcp5BO4z1lQTTgdZA5j3yEtJQpgkOHe0rnJAU5cr4jlj
 B72dgfIj77DUl88zbwYqZp+p9tNuoz07zQJ4tnobJ6BTGbYLhfLfFlxtadlHID0gmoXN
 vXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428517; x=1692033317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kFXDoHF7GQ9pqFFzxyYijKExHAUDXpf8bLNBIMwDQc=;
 b=HP8cdwuJogbm9ulvgmBP6Z27cdUIh5zhmdBMBtSjQqi5moWUcW/FGtkCjX4DzScXjK
 e1sRKFhioEChgznSvrfynnamDeMoP4a3HDrQPIrWgvqJOeD5sToXb5uY9YiBwCgXBWwM
 XiJgMinFQTAxZ7TVgxbem/a+2NWrI9Nxae851lrvJ4ZHRex8ljTikmzoNEG7JzZugETp
 lqjLYjfB68gc1hbOddJ5eSP1C73i1gJk5eNNypKJm6ie0VYz3cFsAnkwmuur1P26pusY
 xfjLONLXb6Lxw/ptehn4rHApGxUfU8B54WasgXIhdNwF+9g4yxjssg3LnzyhnKd/4DRA
 rPwQ==
X-Gm-Message-State: AOJu0YyigAAMFXzLvF4xxOgs5Ap+XpAqAEQd6vHytnPTtabkNNd78RHi
 JMA0qj40vvUJ+tWyHOYLHSUPgLqP7WUzjKK09IY=
X-Google-Smtp-Source: AGHT+IHcvWbklkO9vjl1KqJpyj7I8Hljj5IDdhpuX3IRLnuKNb8XtBUIRPgPCQCqfMbxqlSjM0DOG2YxjYtujvCBJT0=
X-Received: by 2002:a05:6870:d154:b0:1be:f8d9:7bdd with SMTP id
 f20-20020a056870d15400b001bef8d97bddmr11390360oac.6.1691428516729; Mon, 07
 Aug 2023 10:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230802062025.11332-1-sunran001@208suo.com>
In-Reply-To: <20230802062025.11332-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:15:05 -0400
Message-ID: <CADnq5_PFMaDMHX_VfpBAfVusz-8XPVu3C-WP9ugCrfDx1HbHrw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in display_mode_vba_30.c
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

On Wed, Aug 2, 2023 at 2:20=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: else should follow close brace '}'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c  | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30=
.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index 9af1a43c042b..ad741a723c0e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -784,8 +784,7 @@ static unsigned int dscComputeDelay(enum output_forma=
t_class pixelFormat, enum o
>                 Delay =3D Delay + 1;
>                 //   sft
>                 Delay =3D Delay + 1;
> -       }
> -       else {
> +       } else {
>                 //   sfr
>                 Delay =3D Delay + 2;
>                 //   dsccif
> @@ -3489,8 +3488,7 @@ static double TruncToValidBPP(
>                 if (Format =3D=3D dm_n422) {
>                         MinDSCBPP =3D 7;
>                         MaxDSCBPP =3D 2 * DSCInputBitPerComponent - 1.0 /=
 16.0;
> -               }
> -               else {
> +               } else {
>                         MinDSCBPP =3D 8;
>                         MaxDSCBPP =3D 3 * DSCInputBitPerComponent - 1.0 /=
 16.0;
>                 }
> --
> 2.17.1
>
