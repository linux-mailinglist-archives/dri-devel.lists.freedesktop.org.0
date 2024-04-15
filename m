Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C505F8A526C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 15:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADF31125C6;
	Mon, 15 Apr 2024 13:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kdTRWewV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A551125C9;
 Mon, 15 Apr 2024 13:56:49 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2a2d0ca3c92so2049543a91.0; 
 Mon, 15 Apr 2024 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713189409; x=1713794209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N27uhOB3jdl5PJcj6aOsTcYbh8hiJsFDu4/EeTNh8FU=;
 b=kdTRWewVuXTzi5h8+i1EAfl43y27w3H54QUKB9k9/ZLTeDOjv3rpO/bQJI+8bMYmSj
 pIFX11tqDAh7fYIeGXl1mMr7hstHxBEQG/KhpcH8oEeZsHYX4kqYnv0ob79qqg1EKHNv
 67a5GrEuK5WjacI2tMCKyLYrpl8WOxMhT0aXNnzvbYH/B0tqDKDATHVG54fVQpfKmncY
 oY3kaH/8gulHwNCAfClKTr2+ig6nk6nZT2Fb8CuRtsIRawKPhxq5kG/WzbP5wDbMRqiL
 8bfTzdgcRk2X6HIHPgfpsZvVkhrZZBTKEkR1Tg3FBgyB6V3x949tnY5hrZWCUMRDjhwF
 TXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713189409; x=1713794209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N27uhOB3jdl5PJcj6aOsTcYbh8hiJsFDu4/EeTNh8FU=;
 b=pXg11+CGPKXTScnIKcVp/g4PYSI76vyou5UnDBrZuQodLi0EsQcLIwGKEuGzq0zCLT
 8MIwt5DZJ8drgB6XuY6UIFAKLdK3Msn29L4D23mujqT0ndarNcMPXh0/EBSO6U4+B8gy
 MvdkBn4Axm2gexPkNsLkyc1SLeLv1vFmte7yNy5Dokf18FETIjDYynaf2L+EiIS2/1wo
 gf525ZMIX9/Bea2bU/SQZfDw7/9Ld72pTN1MU3rMoVBTYq7pvwazrEi3olaW5Ud4ejzn
 iVI7Cr0Pm+5OGELlD5XeCnfUeB4QuQdi/WmHOP4PEoYgS24mjyO8wLgLOZbma/BF3YbT
 hI+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRhtrvxIFJ2XiQ+z16NBsKnR8Osu2eFiCMpdaJeBJqJKgpw6WOiOnUiRk/3Rn6n2bTHVY131c7b/XlSQFhZleNbl273mYvz8ZxSu1Ic87y/ozsnyjvI1XrRh08ZZAf0hebavXxK8CbFxXQymkTNg==
X-Gm-Message-State: AOJu0YwVsSEyHgkO6+GpMbuNxx7J/3CKOhAdaUceP03hZr/kSsh7Th+d
 KZmfnERsz/dmPk8EyHge6Vpz62BjmcxbxpYD5rufdIBzwAqV5srqdjG/AIjwfE6skb6LDQcrs44
 ES5hDrlfR58QDed1L94eTtUpWpL8=
X-Google-Smtp-Source: AGHT+IEuqzfxEKSwCRqiSawZUWwilC/ojUvHQDxuDQYLsSXPdtaOnhU6lM2L2uNln4vBjCYSGvjs1qSx8rhc0LBcb7A=
X-Received: by 2002:a17:90b:892:b0:2a6:76e2:86db with SMTP id
 bj18-20020a17090b089200b002a676e286dbmr14028033pjb.15.1713189409324; Mon, 15
 Apr 2024 06:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240414233838.359190-1-thorsten.blum@toblux.com>
In-Reply-To: <20240414233838.359190-1-thorsten.blum@toblux.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Apr 2024 09:56:37 -0400
Message-ID: <CADnq5_P1YjyywJ1B+uG+0VRmWKGqiHOLQDuVe5_jmL3cMN-3OQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add missing space to DRM_WARN() message
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org, 
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

On Mon, Apr 15, 2024 at 4:40=E2=80=AFAM Thorsten Blum <thorsten.blum@toblux=
.com> wrote:
>
> s/,please/, please/
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

And applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 7753a2e64d41..3cba0e196ca8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1455,7 +1455,7 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_devic=
e *adev)
>
>         /* PCI_EXT_CAP_ID_VNDR extended capability is located at 0x100 */
>         if (!pci_find_ext_capability(adev->pdev, PCI_EXT_CAP_ID_VNDR))
> -               DRM_WARN("System can't access extended configuration spac=
e,please check!!\n");
> +               DRM_WARN("System can't access extended configuration spac=
e, please check!!\n");
>
>         /* skip if the bios has already enabled large BAR */
>         if (adev->gmc.real_vram_size &&
> --
> 2.39.2
>
