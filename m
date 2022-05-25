Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9205853432F
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BE910EC73;
	Wed, 25 May 2022 18:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868A610EC60;
 Wed, 25 May 2022 18:40:39 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id y66so19976035oia.1;
 Wed, 25 May 2022 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IsIJb2bLdZeT3b6zZvcrkP7qwrS6+3RvK/fXCEbZ8Xk=;
 b=WwnZnZBcCw/Lgbs6q/t0HQLejAV7AaY1UZg/u+6/RxLgzg67BuTLQZ3axx9gmYR6gh
 EUWw/IIDQW01LSaipuTYCHHffE17EyBVVzbvBJIN6RG0sBpV9u2e7T88RJaqZSSPMGRj
 klBRTnvNVwswNbNoz0SX+tq/g837HmociAbHxhWKE79UFDGZbItqirbvSLYw3U248G8v
 a7HpRsNN6scZ+lP/gILfmUcsVv29e6C2EEGDuB+IyHPQSEUeIo5qnYOLxTEftZDZAt/v
 QysHqVm9lbwQS77EFOlAFo1vy1FtB7kl8fj44yqwFDXekSxVeZXIaLIfFiobnefOmphP
 FayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IsIJb2bLdZeT3b6zZvcrkP7qwrS6+3RvK/fXCEbZ8Xk=;
 b=bhisRMKVNoWyOWN2C2smTTNe2OAqNYR1OC587CKFMxBjG6qBzKNkJYQYsGCTcRktl1
 TobTcUeVwqTy6o5Js8x0Pev1pdmK+0MEbIWjPf7+QgMt0lcMsyssjzJ4g9WOi2XAec7I
 EeI6TrhWcNzDTkSt8Fet/gdtrgv+oFLtA4CkXa2YVsBNvRyN8WOYFsCLHEjqqdByAeFO
 60tGLklgIIf4nB1nIKabgbsO0cistGF02BqwBpWr//URqLModTpzYXrW04y0Kg1l8jEs
 TwhJUFCmRFK3fGj2e5ZrJLuQr1yORKJoqoYGIOHSgWPXS9EjH5032s+ffGMpuJlozuik
 RN7w==
X-Gm-Message-State: AOAM530wDkqkdk6HAf970eXAXEOY9/+aTevRcFM8rqJJ/mhz01KMiPAP
 5vfBvHkyPT72RMtu2Y4is0vBxTAh5N2yZVFkDEE=
X-Google-Smtp-Source: ABdhPJyOwUeuC147uYslh7O/kMgrID5j8lwN+MKYuAzgczWF4cVVrT5/c+7+RplRpMc7z7HtOrTgY1IJPNLYSJ3Ji9M=
X-Received: by 2002:a05:6808:15a7:b0:32b:aeac:84d0 with SMTP id
 t39-20020a05680815a700b0032baeac84d0mr530515oiw.253.1653504038768; Wed, 25
 May 2022 11:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220525093702.57166-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220525093702.57166-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 May 2022 14:40:27 -0400
Message-ID: <CADnq5_Pp8gCkW1L6RVzKYALSk-Z5sQNEFDbOd9D8khwJsF+qEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: make program_imu_rlc_ram static
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 Abaci Robot <abaci@linux.alibaba.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, May 25, 2022 at 5:37 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> This symbol is not used outside of imu_v11_0.c, so marks it
> static.
>
> Fixes the following w1 warning:
>
> drivers/gpu/drm/amd/amdgpu/imu_v11_0.c:302:6: warning: no previous
> prototype for =E2=80=98program_imu_rlc_ram=E2=80=99 [-Wmissing-prototypes=
].
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/imu_v11_0.c
> index 5d2dfeff8fe5..d63d3f2b8a16 100644
> --- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> @@ -299,7 +299,7 @@ static const struct imu_rlc_ram_golden imu_rlc_ram_go=
lden_11_0_2[] =3D
>         IMU_RLC_RAM_GOLDEN_VALUE(GC, 0, regCPG_PSP_DEBUG, CPG_PSP_DEBUG__=
GPA_OVERRIDE_MASK, 0)
>  };
>
> -void program_imu_rlc_ram(struct amdgpu_device *adev,
> +static void program_imu_rlc_ram(struct amdgpu_device *adev,
>                                 const struct imu_rlc_ram_golden *regs,
>                                 const u32 array_size)
>  {
> --
> 2.20.1.7.g153144c
>
