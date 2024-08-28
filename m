Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196C962C5C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B84F10E0E9;
	Wed, 28 Aug 2024 15:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L9hwnB+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A2810E0E9;
 Wed, 28 Aug 2024 15:30:36 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-8430dcdf9a9so152751241.2; 
 Wed, 28 Aug 2024 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724859035; x=1725463835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8aSC11rbT+ESzfKC/BjKSIyP+akTjhgeklkN6riloQ=;
 b=L9hwnB+YqPrQ4/mh0j2yIzzkrWnsMNF32NL1yBecTSPcM3H1+Fi44rXsv1FQ4XsgqC
 nNGzhGeWDi2/rptJ+8p5NflFM8ngzmPh+rSrfEvm3AIrSJzsL4RELIMIXSa9OPqO80Rj
 AUf1SVHy2Uu9r6seCPtE0t0DjtB/1abxZ93dpj5LZX70r+RL3CFionbx55FNgn1XmvMm
 Y2ejlQcytm9rdhjFE53PWyG6xHcETQdsGdzj+LfR0V646We5pXzbrGdFC5ZZw3QKXIlT
 78wo/xdt6wmJ29gEUOh1RO0RmtQXhG9w3n9PRe/kiCnXv2mWSXh377aPHBIIy4I1RtAv
 pb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724859035; x=1725463835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8aSC11rbT+ESzfKC/BjKSIyP+akTjhgeklkN6riloQ=;
 b=NKY3x3LSZioRnafIEINxc0yJAsckjlWS9MrI9hJ/jh3yO0jZDQ4jcgC1P8CV12ojiH
 BhD4IFT4dboT83RkY6e3XsfebX0qvhHnxTXquu/yfQHR49bxK5aBGfLECeFMcKDIQVra
 pod5S14o5YJZPGwUh7zhVkqFM1dfgXpnO/xCmJxBUuobKEf0jtvBWP745/6aLYXhko+3
 8zDhO85PExLcdrOPK1E5VOa5lfC4pvXyfO0ZvxNPge1PJROMlNhXmrEXxBFWdVpxKfFf
 8RTxBfJjNMArGOkaF8cCAKTjX/pXQPvfgzVdTrYuiFcQoyACUrGguTN4+u8Lr7Z29pto
 KxQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe/noQGq6h1dL6BhFB85F3Oo3XklSYiSmrTa9I4iqz6FKzLMow/dVKmuAEoSENzJk5LY2Ow9sL@lists.freedesktop.org,
 AJvYcCX9uCt/h6/ca+tCHJOdYtE+2ADpfgBX3l+FjBAEZxVf/akwUxJ8kM/JeBMEkRAyFnmDgrcEgR7soJfz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8jFK45YQn2qxi5EdhqFsL3ilwErO2WV/n9u2I7MPO3kVtc1JU
 Bg/qaFZfPZSXtnsjxl6rWKvrc3QOqTv9R/0ohLrePa4bGZMJQnrTpYOOYW1HBN8Xd4dPQH4ic20
 C1yCh0MiLChnWY3C6TzZCeb70CE4=
X-Google-Smtp-Source: AGHT+IGPkjK66VjlndHHn76dL6NJfQMquX3Tj33agX4XIk9OqPrCbY99rMMocN3ECpnDxN4e7+WUf5QrCbQXZ0GRW5A=
X-Received: by 2002:a05:6122:7d1:b0:4f9:756:45b4 with SMTP id
 71dfb90a1353d-4fd1a776f99mr9622423e0c.1.1724859034944; Wed, 28 Aug 2024
 08:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
In-Reply-To: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2024 11:30:20 -0400
Message-ID: <CADnq5_P42A81D_VufAdSkwVwC08ZRiT=6XAS3oHmSH325ygbow@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: disable amdgpu_dpm on THTF-SW831-1W-DS25_MB board
To: WangYuli <wangyuli@uniontech.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com, 
 mario.limonciello@amd.com, le.ma@amd.com, Jun.Ma2@amd.com, 
 hamza.mahfooz@amd.com, andrealmeid@igalia.com, wenlunpeng@uniontech.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com, zhanjun@uniontech.com
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

On Wed, Aug 28, 2024 at 7:28=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> From: wenlunpeng <wenlunpeng@uniontech.com>
>
> The quirk is for reboot-stability.
>
> A device reboot stress test has been observed to cause
> random system hangs when amdgpu_dpm is enabled.
>
> Disabling amdgpu_dpm can fix this.
>
> However, a boot-param can still overwrite it to enable
> amdgpu_dpm.
>
> Serial log when error occurs:
> ...
> Console: switching to colour frame buffer device 160x45
> amdgpu 0000:01:00.0: fb0: amdgpudrmfb frame buffer device
> [drm:amdgpu_device_ip_late_init] *ERROR* late_init of IP block <si_dpm> f=
ailed -22
> amdgpu 0000:01:00.0: amdgpu_device_ip_late_init failed
> amdgpu 0000:01:00.0: Fatal error during GPU init
> [drm] amdgpu: finishing device.
> Console: switching to colour dummy device 80x25
> ...
>
> Signed-off-by: wenlunpeng <wenlunpeng@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 094498a0964b..81716fcac7cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_vblank.h>
>
>  #include <linux/cc_platform.h>
> +#include <linux/dmi.h>
>  #include <linux/dynamic_debug.h>
>  #include <linux/module.h>
>  #include <linux/mmu_notifier.h>
> @@ -3023,10 +3024,32 @@ static struct pci_driver amdgpu_kms_pci_driver =
=3D {
>         .dev_groups =3D amdgpu_sysfs_groups,
>  };
>
> +static int quirk_set_amdgpu_dpm_0(const struct dmi_system_id *dmi)
> +{
> +       amdgpu_dpm =3D 0;

This will disable dpm on all devices that you might install on this
platform.  If this is specific to a particular platform and board
combination, it might be better to check the platform in the
dpm_init() code for the specific chip that is problematic.
Additionally, disabling dpm will result in boot clocks which means
performance will be very low.

Alex

> +       pr_info("Identified '%s', set amdgpu_dpm to 0.\n", dmi->ident);
> +       return 1;
> +}
> +
> +static const struct dmi_system_id amdgpu_quirklist[] =3D {
> +       {
> +               .ident =3D "DS25 Desktop",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_NAME, "THTF-SW831-1W-DS25_MB"=
),
> +               },
> +               .callback =3D quirk_set_amdgpu_dpm_0,
> +       },
> +       {}
> +};
> +
>  static int __init amdgpu_init(void)
>  {
>         int r;
>
> +       /* quirks for some hardware, applied only when it's untouched */
> +       if (amdgpu_dpm =3D=3D -1)
> +               dmi_check_system(amdgpu_quirklist);
> +
>         if (drm_firmware_drivers_only())
>                 return -EINVAL;
>
> --
> 2.43.4
>
