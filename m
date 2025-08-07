Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F1B1D875
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 15:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFB10E83F;
	Thu,  7 Aug 2025 13:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D63bBk+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693BC10E83F;
 Thu,  7 Aug 2025 13:01:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b4274585be2so30142a12.3; 
 Thu, 07 Aug 2025 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754571702; x=1755176502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csit/92fkpbpiZ6AKL4lpm9dy77IvCLE9nFZVONA38c=;
 b=D63bBk+0/CboXCRUMhwRlG9h/8W90uBp93v7LXecAIdhA00LI2JOfFIYMMQixvBrO7
 aTQgp1pakkyqe7SHQhnyJXoUs95kZz72pTIK3hKW/M+8C1p6Di55C449gFPhKLdLl5zT
 /+TwHhSLBTDIRMBTFl2CLUmBVgCWuXL0r1SbswCjn9WUevCK2ARjx2iqDGSVEJsyxRHw
 jA2mn7K+wTtIMDf4FQjTa5fOf0I1SSSMsD02C9CUP5QG6lbv6egbi7sdeDNufEtUx3oP
 oBAfVYkt9OXT1bGEzludiLLOclCdag2wE/wBpT5AlmvoLTC5QoUuLH35MYKcIoVWFqrw
 fwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754571702; x=1755176502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=csit/92fkpbpiZ6AKL4lpm9dy77IvCLE9nFZVONA38c=;
 b=VVpF4vvSmxyLRIe7vZNCxHWIR2E7xbmpo5uPbhgxnMpB87O79Gzb7F4qCZaZx/QPaL
 MryDYcafX71KBrSz0tynoRqtIaQMdngg37eyoPla9CmzP1qB4Yqbgjm9KUMz9aKAfhFX
 tqRGJJ9UxzWtHkes5U4a9eLrU3YPMRlWN8+4XQDToP2Vp2WYwo7U3nY/XnDvKZ2CGnn5
 Sw4R27icYDF3c1KogiWrVFD8vRovwPolS5qoi5f8stiEOQOWldyPajvQNFrtskNG94+y
 s+hZuLFVwxFxYt5uV/emzWpZZxSFzKPZRQd/ehD1FVxE6faPdirZQLPqwYAXFvY5cjzw
 G0pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMG1nbhBiV10BctUMxi9z8WpGeh8O8C0R3sEQ8tE5C8QMDAsmvFfZiPimeeFwyUpNFPTzTyGgtGuxS@lists.freedesktop.org,
 AJvYcCW8Nma8pBsyDCb8RMK80mXND5vVPE2/qlbU72ZMI+BhIlOF7teGr5fG8wOVXr6sCcBiAk4f4Ox+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPmmWYzz+6xXpmCO5NSa3+0Yn/Ib+HjQW1apV+gGiEGgX73aLA
 wHRXf2mdtEa/c2FVwqfW4N0oXGWV6d1X5vbb7SQO93CpoyWb2nVyJVSCi/ld0K8ahPqjlgUl/Az
 fbKM3zMUCnJ8pAL1hImUhQeRsoFw6zz6F0wWI
X-Gm-Gg: ASbGncvYB5t2vHZJTzn5o3DYp9ezDOTTXAyvEkFxicagoFILVVfJw/hsa3zxD009RRH
 hfYxy0a2VSKdUuZxHV9BBwkEMlgz5FdGZnCtk9/mNOajw9HPVyT/Bv0P5chaa5qUUMyHv7u2dJj
 Cw3SPqBEiuzIEQQ+AhWVEljHNimeBiAtx+X7gPpoaM4IGugId6YXZpRT6zc2fsjDqxFTto8J+z/
 9LUNXQ=
X-Google-Smtp-Source: AGHT+IFTun8YI94ci/htHjX014sLvLSf/LonYrs5Z2b9fGtFLhJvbnYFieTgtNA2IiUvjT3cJXScNPm71K7j1e/5FUw=
X-Received: by 2002:a17:902:ea0e:b0:240:764e:afab with SMTP id
 d9443c01a7336-2429f4c6eafmr53528225ad.6.1754571701352; Thu, 07 Aug 2025
 06:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250807094719.56145-1-oushixiong1025@163.com>
In-Reply-To: <20250807094719.56145-1-oushixiong1025@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Aug 2025 09:01:29 -0400
X-Gm-Features: Ac12FXyRTfguGuFdTmafc0zCGvXHu-uSSEEJTDTQOrDFi2VatI0j0G8E3SWv1N4
Message-ID: <CADnq5_PSiQOqTF1VuJNOtSS1M8K5Ycp09PijaDn2eVUiWiCqwg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: skip disabling audio when device is unplugged
To: oushixiong1025@163.com
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, 
 Alexandre Demers <alexandre.f.demers@gmail.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
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

On Thu, Aug 7, 2025 at 5:53=E2=80=AFAM <oushixiong1025@163.com> wrote:
>
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> When Stopping lightdm and removing amdgpu driver are executed, the follow=
ing
> error is triggered probably:

There's already a patch to fix this here:
https://gitlab.freedesktop.org/drm/amd/-/issues/4481

Alex

>
> Unable to handle kernel paging request at virtual address 0000000000005e0=
0
> .....
> [ 2] [T10084] Call trace:
> [ 2] [T10084]  amdgpu_device_wreg.part.0+0x58/0x110 [amdgpu]
> [ 2] [T10084]  amdgpu_device_wreg+0x20/0x38 [amdgpu]
> [ 2] [T10084]  dce_v6_0_audio_endpt_wreg+0x64/0xd8 [amdgpu]
> [ 2] [T10084]  dce_v6_0_sw_fini+0xa0/0x118 [amdgpu]
> [ 2] [T10084]  amdgpu_device_ip_fini.isra.0+0xdc/0x1e8 [amdgpu]
> [ 2] [T10084]  amdgpu_device_fini_sw+0x2c/0x220 [amdgpu]
> [ 2] [T10084]  amdgpu_driver_release_kms+0x20/0x40 [amdgpu]
> [ 2] [T10084]  devm_drm_dev_init_release+0x8c/0xc0 [drm]
> [ 2] [T10084]  devm_action_release+0x18/0x28
> [ 2] [T10084]  release_nodes+0x5c/0xc8
> [ 2] [T10084]  devres_release_all+0xa0/0x130
> [ 2] [T10084]  device_unbind_cleanup+0x1c/0x70
> [ 2] [T10084]  device_release_driver_internal+0x1e4/0x228
> [ 2] [T10084]  driver_detach+0x90/0x100
> [ 2] [T10084]  bus_remove_driver+0x74/0x100
> [ 2] [T10084]  driver_unregister+0x34/0x68
> [ 2] [T10084]  pci_unregister_driver+0x24/0x108
> [ 2] [T10084]  amdgpu_exit+0x1c/0x3270 [amdgpu]
> [ 2] [T10084]  __do_sys_delete_module.constprop.0+0x1d0/0x330
> [ 2] [T10084]  __arm64_sys_delete_module+0x18/0x28
> [ 2] [T10084]  invoke_syscall+0x4c/0x120
> [ 2] [T10084]  el0_svc_common.constprop.0+0xc4/0xf0
> [ 2] [T10084]  do_el0_svc+0x24/0x38
> [ 2] [T10084]  el0_svc+0x24/0x88
> [ 2] [T10084]  el0t_64_sync_handler+0x134/0x150
> [ 2] [T10084]  el0t_64_sync+0x14c/0x150
> [ 2] [T10084] Code: f9401bf7 f9453e60 8b150000 d50332bf (b9000016)
> [ 2] [T10084] ---[ end trace 0000000000000000 ]---
>
> The adev->rmmio has been unmmaped in amdgpu_device_fini_hw().
>
> So skip disabling audio when device is unplugged.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index 276c025c4c03..48b29990da7f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -23,6 +23,7 @@
>
>  #include <linux/pci.h>
>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -1459,8 +1460,10 @@ static void dce_v6_0_audio_fini(struct amdgpu_devi=
ce *adev)
>         if (!adev->mode_info.audio.enabled)
>                 return;
>
> -       for (i =3D 0; i < adev->mode_info.audio.num_pins; i++)
> -               dce_v6_0_audio_enable(adev, &adev->mode_info.audio.pin[i]=
, false);
> +       if (!drm_dev_is_unplugged(adev_to_drm(adev))) {
> +               for (i =3D 0; i < adev->mode_info.audio.num_pins; i++)
> +                       dce_v6_0_audio_enable(adev, &adev->mode_info.audi=
o.pin[i], false);
> +       }
>
>         adev->mode_info.audio.enabled =3D false;
>  }
> --
> 2.25.1
>
