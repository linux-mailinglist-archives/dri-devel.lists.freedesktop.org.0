Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17410772C8F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1905110E328;
	Mon,  7 Aug 2023 17:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E19710E328;
 Mon,  7 Aug 2023 17:18:10 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1ba5cda3530so3717794fac.3; 
 Mon, 07 Aug 2023 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428689; x=1692033489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XV34gRN59NUXgPyKRqnl/Sn4kJFEpMQBDpWvtbTAeLk=;
 b=c8QS/POYZDVCy+zrr7lKWNWXC1LM0EjzSsNlMdfGnQH3HUcEzwfacv4W3XGqZFp1Nx
 kqHHS3BhtciMnfLsrjTBDvV1/2qxBs4wDwzlquknrAjdmd5I3cvtcGCsX/TdtH0O/X7S
 b5LtGKzhVpfodzCbifmnJ1xF/tJTP/JljGD/n8+5hJD4r4ObNJCi3Bii09hyxjE4Gksc
 VnSElVbQDzM3AONVcHv0+RcIm8YZtPxMH6As44T9anuJXJEoE2OPNh81HFxgQmW3Zf9p
 wut85O+rkynHPJwkzc+kqz5QWNcuRbm4hPpji3ijwLl28N/8AqtN9DYT4OFiYZeshZli
 OHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428689; x=1692033489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XV34gRN59NUXgPyKRqnl/Sn4kJFEpMQBDpWvtbTAeLk=;
 b=KYrf+jvaJFH2sYwvajIedEk9TO7/uI9Nj1QEEBzHI3g0ZTCMLJKyn906yesw0G29B5
 Vy3XFbPVIvrR8LDf2rV6vbqCp2ceuJD4Z+A+M3iNpdOJbkRGQyM/d7Wu3ePhNzW27+ep
 2XR2di32r+UwZMiQlDd9Oq888NARMs2rLEm5RWYbo2kAXQowi0UjGC62klf4uzY7VOF1
 Ni8knWCrgC2KjTwchoH5SxnVRIw6fRyx77KgEgjFaUiscph1HrT0Z3eldHnkcVvKHNuz
 HzY8oTdPf/Acd4FcImkyZX7cf3JocINBca44terN2md10A9THwXel9qiGMSMlJ9yu3K2
 AEog==
X-Gm-Message-State: AOJu0YwgZehenOc/+1MsgiNui8+f0CJenvZGB5PZInazyLViLa4YeLkr
 QIR5ygzYmvqcOGFwvuTb0qwE2Bk/xa0Lc5xIKSJDaNVt
X-Google-Smtp-Source: AGHT+IEqb0XN5+AviKjgEtzF5xxq33xiyN7TQ2h94ZssjX8/OEf4jSCH08clopGvmS9RGtf1fE6Uau80c6mGy5akoQA=
X-Received: by 2002:a05:6870:63a3:b0:1bb:a359:b909 with SMTP id
 t35-20020a05687063a300b001bba359b909mr11694940oap.55.1691428689591; Mon, 07
 Aug 2023 10:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230802064333.11895-1-sunran001@208suo.com>
In-Reply-To: <20230802064333.11895-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:17:58 -0400
Message-ID: <CADnq5_MmBnK5sq=LVfJa9hWyN23XQ=TRvw15ns28sm+G7E=9aA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in ih_v6_0.c
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

On Wed, Aug 2, 2023 at 2:43=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing statements should be on next line
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/a=
mdgpu/ih_v6_0.c
> index 980b24120080..ec0c8f8b465a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> @@ -494,7 +494,8 @@ static int ih_v6_0_self_irq(struct amdgpu_device *ade=
v,
>                 *adev->irq.ih1.wptr_cpu =3D wptr;
>                 schedule_work(&adev->irq.ih1_work);
>                 break;
> -       default: break;
> +       default:
> +               break;
>         }
>         return 0;
>  }
> @@ -759,8 +760,7 @@ static void ih_v6_0_set_interrupt_funcs(struct amdgpu=
_device *adev)
>         adev->irq.ih_funcs =3D &ih_v6_0_funcs;
>  }
>
> -const struct amdgpu_ip_block_version ih_v6_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version ih_v6_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_IH,
>         .major =3D 6,
>         .minor =3D 0,
> --
> 2.17.1
>
