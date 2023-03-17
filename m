Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC06BF240
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E11410E3FA;
	Fri, 17 Mar 2023 20:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A8010E3EE;
 Fri, 17 Mar 2023 20:18:15 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id bk32so4657290oib.10;
 Fri, 17 Mar 2023 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679084294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSMRygJzH6vE62Q2mHcoZV1+MU3Mf7BqCz0sgRtV3Yw=;
 b=g8vlCfiZNtHXNz5dLm2xZ3ScxKdSlL5Q5bZ/mZAdPhO8pg5IFz0ALUWgEXQl97+zMB
 jyOeAcDiX9XrtYNdPvPMcpe0Cd+MfJFkcJaY4V9WgFXZklIo0w1URF3A81OkzA7HjfL1
 8BPyt9ATXw00zGSFPzKZNjJY18EoyWvcFS3mWiN1gJF2ix4hK5AzzLunuYz4xdUgrUCB
 gWrbni56ZpWkNb73E4fSixFnJcRPMojGV7yUtEtYcUKTO1oeYnfqew9DpUK1Jm+XuMbT
 bzJCghUeCYaIR/ugMh8N/iJpWEzibWLlKu/QhCX/bkYhh7T2SOizKeDx9I2q9Dwhwy1b
 Z+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679084294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XSMRygJzH6vE62Q2mHcoZV1+MU3Mf7BqCz0sgRtV3Yw=;
 b=wXmOOpOmxm4zOfBdJrqdSiOyJZMrIn10+xBo3MR62j5j1LvsMJ5E+2hudGsYAfn8WU
 X7fcgrtIXvokbtV6ElgNIT/rVF+MlagK2liR9z91CtLySTNGp0NlcquphHmOOOG9zXBW
 9i2pKAK91cnMIvMGwKs4aoGf26k/WSJ47cyXOecAnU8H/kasPlpr2eu0HML0PFjUzXWk
 FzdntatseZv1K+x/gqDJt6rzz3RqfqSHwZdJe0aoW7U3ABXqdUEf0CxxFtLt7hXSxisH
 cZXvHooGdXsojcfQjH3cqwsyCWPEmHu6hkzEKWxUGJSke9zfHPNMf4Skr46P5Qmk75to
 VMOA==
X-Gm-Message-State: AO0yUKXATMh4Z1xpgfuMy8ZX9FCT525DG7hukkO4jM5laQFj/qSaasSR
 PpKq665bIqSPqM+h7YN42lWGJjgJP47eOdEHMyc=
X-Google-Smtp-Source: AK7set/ivwdewzaoPiq9B8mDQNenr6n+DI+0+c4st0V6joQZHeoxSoLrraA4/PTSYQt82J595tpbvC4XvDslpPaIc/U=
X-Received: by 2002:a05:6808:498:b0:384:2b09:45f7 with SMTP id
 z24-20020a056808049800b003842b0945f7mr1592391oid.4.1679084293926; Fri, 17 Mar
 2023 13:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-14-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-14-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Mar 2023 16:18:02 -0400
Message-ID: <CADnq5_PEhRovUNGCTFHNuUswWt1_qz4gy8+8kUJZeyFaKFzuZQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxMy8zN10gZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlOiBSZW1vdg==?=
 =?UTF-8?B?ZSB1bnVzZWQgZnVuY3Rpb24g4oCYYW1kZ3B1X3Vjb2RlX3ByaW50X2ltdV9oZHLigJk=?=
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 17, 2023 at 4:22=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c:129:6: warning: no previous pr=
ototype for =E2=80=98amdgpu_ucode_print_imu_hdr=E2=80=99 [-Wmissing-prototy=
pes]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ucode.c
> index 380b89114341d..a7bffd24ceaf3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -126,19 +126,6 @@ void amdgpu_ucode_print_gfx_hdr(const struct common_=
firmware_header *hdr)
>         }
>  }
>
> -void amdgpu_ucode_print_imu_hdr(const struct common_firmware_header *hdr=
)
> -{
> -       uint16_t version_major =3D le16_to_cpu(hdr->header_version_major)=
;
> -       uint16_t version_minor =3D le16_to_cpu(hdr->header_version_minor)=
;
> -
> -       DRM_DEBUG("IMU\n");
> -       amdgpu_ucode_print_common_hdr(hdr);
> -
> -       if (version_major !=3D 1) {
> -               DRM_ERROR("Unknown GFX ucode version: %u.%u\n", version_m=
ajor, version_minor);
> -       }
> -}
> -
>  void amdgpu_ucode_print_rlc_hdr(const struct common_firmware_header *hdr=
)
>  {
>         uint16_t version_major =3D le16_to_cpu(hdr->header_version_major)=
;
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
