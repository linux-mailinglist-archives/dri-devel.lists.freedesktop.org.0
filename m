Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAEF948300
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 22:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8988210E2B0;
	Mon,  5 Aug 2024 20:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mPNihinT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EA310E2AF;
 Mon,  5 Aug 2024 20:13:00 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7bb75419123so770089a12.3; 
 Mon, 05 Aug 2024 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722888780; x=1723493580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnNys8YCkI4xiPbhHna2ObUa3tOGsVZDlY11WGOVPec=;
 b=mPNihinTLHa0MZ2JdOfLNt9X3kAsphmax9dUaH6xJRGoW3nr3oWPcxWblGcnedEEgF
 e57l3bMUU30YKzdIVjUCY035zVTAAaMF3klAAVYQUtDFL9aSbYGvoavGTx+AFYRSkqQc
 z4E66ddQ8DWaFl37sXVk1QVoZJ60xYMOz/HHiO4TNK6zFqHc9JGkpcz1uUN0Z96hLVnq
 5f3D82LQjsmhxlvwNhBpa7Lgsfv2HkdC7ja0f+ahmJ7ssXEieImwZOITTZRJXJWeGFD1
 Nx2cC1IO9SMi07o9WvbQHYRYBhWaE6FyoPRbRaWFFL9FRg2ZRKvB0XycfCbw0HUl/sqP
 KO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722888780; x=1723493580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnNys8YCkI4xiPbhHna2ObUa3tOGsVZDlY11WGOVPec=;
 b=GJ7tOvK8NKs8Rjrjgt0FDJDUUDVI02nGXI3oIUgm5mkR+rsT/4NuJB/27G0auLu2q9
 qDhtATPvh69ObC4cHar+aRBbYBQiFUNkpgPRYq7IBV5ZV8ibyooV9GrqaNml12NdUUM+
 7Op5J05BLkzvRUNrAVfIdpYRCipmeEHL7OpOo+B1I37PApet5h1CyPhgqdPZ3iWMxEUH
 m9XYZeEdDmUk93JdCEMurID0utbQU37JnH5BJJmXJoxupKo/JTeAqZYmxRPY5aNlKUZZ
 Nu7uEsq6YT2CN5qPahDNgjqJIICbN/t3RTlpT1KmDuuOmtXoj3vWVsZdq0wzizfHg/SS
 xyXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYAs8X2g7qrNxEntuumd34YUTX0qU62aqEDNqb5ykA4gBXGItQGqSUNL+glAsQQoTacIRG07kYAporDoi/I4BtUkSl5OfbiqIIQggPqRJH95FlmqZL5Ga5VQjcgSNcgAb7d6BG6RmPqg1O4IkdJg==
X-Gm-Message-State: AOJu0Yxu87V16WXJqUSn8/WMnTmPDUujpOmCzKqg1A/HTArQxyKYdYBg
 H0wqkikZ9494aZLEzZNmMBCcRDK5pwGhDKkxLpSWwxru65B/LGVgc5c85syk5UtUnsxwctOl/pE
 gj59Pj48clV2uvuDqSjwhZg51mITATg==
X-Google-Smtp-Source: AGHT+IH5XNmjYtdtzH+sxVQCriAMtEih+csTt9WlHGPQ2NLV8lq0dYnhfUuy3Jbb/qQKRCUuQ5+yIZvvlyffy5ieAHo=
X-Received: by 2002:a17:90b:f85:b0:2c8:da73:af82 with SMTP id
 98e67ed59e1d1-2cff943c31bmr12904102a91.10.1722888780200; Mon, 05 Aug 2024
 13:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240719100929.94365-1-arnd@kernel.org>
In-Reply-To: <20240719100929.94365-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 16:12:48 -0400
Message-ID: <CADnq5_Mq=XaAsKap-zKQuttFcODJ7FbJMfq7xxLRYxgYD=at+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Use a constant format string for
 amdgpu_ucode_request
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Hung <alex.hung@amd.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Jul 19, 2024 at 6:35=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Multiple files in amdgpu call amdgpu_ucode_request() with a fw_name
> variable that the compiler cannot check for being a valid format string,
> as seen by enabling the (default-disabled) -Wformat-security option:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function 'amdgpu_mes_init_mic=
rocode':
> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1517:61: error: format not a stri=
ng literal and no format arguments [-Werror=3Dformat-security]
>  1517 |         r =3D amdgpu_ucode_request(adev, &adev->mes.fw[pipe], fw_=
name);
>       |                                                             ^~~~~=
~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c: In function 'amdgpu_uvd_sw_init'=
:
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:263:9: error: format not a string=
 literal and no format arguments [-Werror=3Dformat-security]
>   263 |         r =3D amdgpu_ucode_request(adev, &adev->uvd.fw, fw_name);
>       |         ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c: In function 'amdgpu_vce_sw_init'=
:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:161:9: error: format not a string=
 literal and no format arguments [-Werror=3Dformat-security]
>   161 |         r =3D amdgpu_ucode_request(adev, &adev->vce.fw, fw_name);
>       |         ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c: In function 'amdgpu_umsch_m=
m_init_microcode':
> drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c:590:9: error: format not a s=
tring literal and no format arguments [-Werror=3Dformat-security]
>   590 |         r =3D amdgpu_ucode_request(adev, &adev->umsch_mm.fw, fw_n=
ame);
>       |         ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c: In function 'amdgpu_cgs_get_firm=
ware_info':
> drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c:417:72: error: format not a strin=
g literal and no format arguments [-Werror=3Dformat-security]
>   417 |                         err =3D amdgpu_ucode_request(adev, &adev-=
>pm.fw, fw_name);
>       |                                                                  =
      ^~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function =
'load_dmcu_fw':
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2221:9: error=
: format not a string literal and no format arguments [-Werror=3Dformat-sec=
urity]
>  2221 |         r =3D amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_na=
me_dmcu);
>       |         ^
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function =
'dm_init_microcode':
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5147:9: error=
: format not a string literal and no format arguments [-Werror=3Dformat-sec=
urity]
>  5147 |         r =3D amdgpu_ucode_request(adev, &adev->dm.dmub_fw, fw_na=
me_dmub);
>       |         ^
>
> Change these all to use a "%s" format with the actual name as an argument=
,
> to let the compiler prove this to be correct.
>
> Fixes: e5a7d047f41b ("drm/amd: Use `amdgpu_ucode_*` helpers for CGS")
> Fixes: 52215e2a5d4a ("drm/amd: Use `amdgpu_ucode_*` helpers for VCE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c           | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c           | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c      | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c           | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c           | 2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_cgs.c
> index c3d89088123d..16153d275d7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> @@ -414,7 +414,7 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_de=
vice *cgs_device,
>                                 return -EINVAL;
>                         }
>
> -                       err =3D amdgpu_ucode_request(adev, &adev->pm.fw, =
fw_name);
> +                       err =3D amdgpu_ucode_request(adev, &adev->pm.fw, =
"%s", fw_name);
>                         if (err) {
>                                 DRM_ERROR("Failed to load firmware \"%s\"=
", fw_name);
>                                 amdgpu_ucode_release(&adev->pm.fw);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_mes.c
> index e499d6ba306b..5d89a9a6f910 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -1514,7 +1514,7 @@ int amdgpu_mes_init_microcode(struct amdgpu_device =
*adev, int pipe)
>                          pipe =3D=3D AMDGPU_MES_SCHED_PIPE ? "" : "1");
>         }
>
> -       r =3D amdgpu_ucode_request(adev, &adev->mes.fw[pipe], fw_name);
> +       r =3D amdgpu_ucode_request(adev, &adev->mes.fw[pipe], "%s", fw_na=
me);
>         if (r && need_retry && pipe =3D=3D AMDGPU_MES_SCHED_PIPE) {
>                 dev_info(adev->dev, "try to fall back to %s_mes.bin\n", u=
code_prefix);
>                 r =3D amdgpu_ucode_request(adev, &adev->mes.fw[pipe],
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_umsch_mm.c
> index fbc2852278e1..6162582d0aa2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
> @@ -587,7 +587,7 @@ int amdgpu_umsch_mm_init_microcode(struct amdgpu_umsc=
h_mm *umsch)
>                 break;
>         }
>
> -       r =3D amdgpu_ucode_request(adev, &adev->umsch_mm.fw, fw_name);
> +       r =3D amdgpu_ucode_request(adev, &adev->umsch_mm.fw, "%s", fw_nam=
e);
>         if (r) {
>                 release_firmware(adev->umsch_mm.fw);
>                 adev->umsch_mm.fw =3D NULL;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_uvd.c
> index 07d930339b07..775c09d57222 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -260,7 +260,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
>                 return -EINVAL;
>         }
>
> -       r =3D amdgpu_ucode_request(adev, &adev->uvd.fw, fw_name);
> +       r =3D amdgpu_ucode_request(adev, &adev->uvd.fw, "%s", fw_name);
>         if (r) {
>                 dev_err(adev->dev, "amdgpu_uvd: Can't validate firmware \=
"%s\"\n",
>                         fw_name);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index 968ca2c84ef7..51b045de409d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -158,7 +158,7 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, un=
signed long size)
>                 return -EINVAL;
>         }
>
> -       r =3D amdgpu_ucode_request(adev, &adev->vce.fw, fw_name);
> +       r =3D amdgpu_ucode_request(adev, &adev->vce.fw, "%s", fw_name);
>         if (r) {
>                 dev_err(adev->dev, "amdgpu_vce: Can't validate firmware \=
"%s\"\n",
>                         fw_name);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7e7929f24ae4..80b7dc651f6b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2218,7 +2218,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
>                 return 0;
>         }
>
> -       r =3D amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, fw_name_dmcu)=
;
> +       r =3D amdgpu_ucode_request(adev, &adev->dm.fw_dmcu, "%s", fw_name=
_dmcu);
>         if (r =3D=3D -ENODEV) {
>                 /* DMCU firmware is not necessary, so don't raise a fuss =
if it's missing */
>                 DRM_DEBUG_KMS("dm: DMCU firmware not found\n");
> @@ -5144,7 +5144,7 @@ static int dm_init_microcode(struct amdgpu_device *=
adev)
>                 /* ASIC doesn't support DMUB. */
>                 return 0;
>         }
> -       r =3D amdgpu_ucode_request(adev, &adev->dm.dmub_fw, fw_name_dmub)=
;
> +       r =3D amdgpu_ucode_request(adev, &adev->dm.dmub_fw, "%s", fw_name=
_dmub);
>         return r;
>  }
>
> --
> 2.39.2
>
