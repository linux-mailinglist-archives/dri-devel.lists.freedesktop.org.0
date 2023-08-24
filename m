Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D97872BA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9ED10E56C;
	Thu, 24 Aug 2023 14:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEC910E570;
 Thu, 24 Aug 2023 14:56:51 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-570e88ee36aso2243113eaf.1; 
 Thu, 24 Aug 2023 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692889010; x=1693493810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlcXwQ+/lXfgHKsvPhtLOQCn3QX2DeYFbnPXFqzydHI=;
 b=HU6LW1B2SsNfR94cbSDMGTPaz88t/ZKs7rY4d+RaBdxLGhAoo3IH4IBlNIzjMv9Kd/
 CeXYy0mf0OiyyOTq04aM7gY+iqcZ+pHjWO8UaXzin7eiIhczfnzFtNOMTriqM5H4uRBK
 fSN37Vh/UjfXaNXEhB1F4fnlOXTS4CQxqefTmHRaQhOa4UqCys7NFbQs6ajrj1KWTG1B
 2wRzDxeexeAUp2yVvqp8O2goxiLQivnoZU8/GfHC8FNQN0ysgQD7+0B/RegYc4PUVXUU
 BhbPWswjbosgilnztPzHNXGqDgnJAkEbQtCI2NF4Fg9CmZxVRWaVHG98xXDdtRiQkxq6
 3HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692889010; x=1693493810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlcXwQ+/lXfgHKsvPhtLOQCn3QX2DeYFbnPXFqzydHI=;
 b=OahNwBs5ij22G5J7xYCEFx9sukP3ElDrJAoDOiH56bFr+ij1MOIzGM0L6f2ToKdZAC
 r/+wGlZp2zsD5LHX+V8E7pIZ5+3YskII+t67e9K5Fp/ptGwlGvOOxpmve8yDuRiEY3L1
 WwzIso7o6KSvr3eX9X7wU0UhChEfOVOuryIdr4jFo7v5LyOXSCOBgEdYFXoi2ga7k+kA
 EGrd6IQIdhsG1fyuJSF8o5G6iN7cZnY4YfKVVPIhZaxHqPzUlnwD+6Lj7hqY+yJToMOi
 cMENc5ebF5pluNOz5fv/zwtijqVjfUHc3zWn86tHED5VHpkQhSpJi9klHdTdOQcNIrT7
 /Eww==
X-Gm-Message-State: AOJu0YzwxjHP7W89NPbF2Z46EcQ7/yxUziN0yAxbVGwOvUrIfav9QXXL
 owJHcUc5mhg0Carm1bAacLyJ9mdlx351xYV2Q0c=
X-Google-Smtp-Source: AGHT+IG4J0uzwUdCGMigPK38FQL18XegkqRc6MfGFZit80x/D2PQ+IVpsh5ToiPkSjIUWb+70TCg3Qx7JYZz/McsWxA=
X-Received: by 2002:a4a:d1d7:0:b0:56c:7a55:f6b3 with SMTP id
 a23-20020a4ad1d7000000b0056c7a55f6b3mr2465522oos.5.1692889010331; Thu, 24 Aug
 2023 07:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-20-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-20-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:56:39 -0400
Message-ID: <CADnq5_Pucn7UidJLtkaLhB=1AGgrZeN2ax2fFj3PXMYO6iDyag@mail.gmail.com>
Subject: Re: [PATCH 19/20] drm/amd/amdgpu/amdgpu_sdma: Increase buffer size to
 account for all possible values
To: Lee Jones <lee@kernel.org>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 24, 2023 at 3:38=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c: In function =E2=80=98amdgpu_sd=
ma_init_microcode=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:217:64: warning: =E2=80=98.bin=
=E2=80=99 directive output may be truncated writing 4 bytes into a region o=
f size between 0 and 32 [-Wformat-truncation=3D]
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:217:17: note: =E2=80=98snprintf=
=E2=80=99 output between 13 and 52 bytes into a destination of size 40
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:215:66: warning: =E2=80=98snpri=
ntf=E2=80=99 output may be truncated before the last format character [-Wfo=
rmat-truncation=3D]
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:215:17: note: =E2=80=98snprintf=
=E2=80=99 output between 12 and 41 bytes into a destination of size 40
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sdma.c
> index e2b9392d7f0de..572f861e3f706 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> @@ -208,7 +208,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *=
adev,
>         const struct sdma_firmware_header_v2_0 *sdma_hdr;
>         uint16_t version_major;
>         char ucode_prefix[30];
> -       char fw_name[40];
> +       char fw_name[52];
>
>         amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, si=
zeof(ucode_prefix));
>         if (instance =3D=3D 0)
> --
> 2.42.0.rc1.204.g551eb34607-goog
>
