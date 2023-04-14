Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AA6E2BCE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 23:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3D410EEAE;
	Fri, 14 Apr 2023 21:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9CF10EEAE;
 Fri, 14 Apr 2023 21:42:04 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-187bee46f9dso1932467fac.11; 
 Fri, 14 Apr 2023 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681508523; x=1684100523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4dOlaJTaykyeAIOyyfVLZGC5xuxW3rGsW7rppv/Wag=;
 b=ZDq3zZcfXjDTSo07fp7wicclRBZHzadQz9vs5jq4IAyiLTI1NVhqesyUWovSAox5UZ
 iQmLxuF+VF9uU7PZE4HsPPsbAB5iTFH3FzhTjhEdCEN1Gt11srDM3kwIR8rJJSs0Y0zw
 3nGMPcZ0W1KgYG3rFi7G/RG6YaZeOJX1UbrUT1YZSCDa+VXSf4JEX+7lHEgic/WWm0Hd
 X415fTY6j+w17SPMzjnESbV6fEZ9GphSXoeJNSNMN1oI7kJZTX8MalEZdw45V8H6Oans
 oGRF8nA5EkNKZlH9TtpVN97jxrNsKHJdx/gbfusGR9eQZ8tFpY2V6H7NEDFmroDKbrYE
 n6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681508523; x=1684100523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4dOlaJTaykyeAIOyyfVLZGC5xuxW3rGsW7rppv/Wag=;
 b=e58+STetm9QNlJ2I2hPRbGumavGKDrj9tVGKe0PrjnKxlGkeGb4z9T+W2448/HEkMt
 w5M2LPImLa9vJXYFvTx3PGgBsDNExaw3Gc95Ml/Ne2DB4QcWtQZ98cgwRFZwxP4t8YGl
 jZUpSWSiCUK8ofKJQY+x/VYlw6ZU2Oqaice02jsBl7Zy/KAuEb/7FiPWsXVwyW3JHxKp
 mB0vmPhnsy7cnrfo8dfPW9vg0CFMWkjIWakNVmIahN10N99qimFq87rbmgfdCXueTt2R
 MqMzmvbth++Vv3NpbwsBI2ZuvaJI8f3P4z3BMmUdfruBERRW00gh9Tny7uhWG2qiBYs1
 mxtQ==
X-Gm-Message-State: AAQBX9fuHfb9YReBhmjig2SoP3H8jDzjhzGqCWnHYM12sAFhteAx35nG
 mLa58jqwcvndGtGqZKV0DuBxlx2DxkGTKeYNXk0=
X-Google-Smtp-Source: AKy350YetlReLD9YTsp7PoVpQ6ksQbwjAZG4Ya8Udcsx7KSPjxoP1YS+BEeO3W9f7u/w/4FndfFREsvGyGEyF+03as8=
X-Received: by 2002:a05:6870:390d:b0:184:2e38:c7af with SMTP id
 b13-20020a056870390d00b001842e38c7afmr3724017oap.3.1681508523173; Fri, 14 Apr
 2023 14:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230414120344.3170942-1-trix@redhat.com>
In-Reply-To: <20230414120344.3170942-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Apr 2023 17:41:51 -0400
Message-ID: <CADnq5_N2j-ASAUS4Y9rmAnPyKzJ47bS4PD6y93041-dCttt8NA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: change pmfw_decoded_link_width, speed
 variables to globals
To: Tom Rix <trix@redhat.com>
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
Cc: tim.huang@amd.com, lijo.lazar@amd.com, amd-gfx@lists.freedesktop.org,
 kenneth.feng@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mario.limonciello@amd.com,
 alexander.deucher@amd.com, evan.quan@amd.com, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Apr 14, 2023 at 8:04=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v1=
3_0.c:36:
> ./drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:66:18: error:
>   =E2=80=98pmfw_decoded_link_width=E2=80=99 defined but not used [-Werror=
=3Dunused-const-variable=3D]
>    66 | static const int pmfw_decoded_link_width[7] =3D {0, 1, 2, 4, 8, 1=
2, 16};
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~
> ./drivers/gpu/drm/amd/amdgpu/../pm/swsmu/inc/smu_v13_0.h:65:18: error:
>   =E2=80=98pmfw_decoded_link_speed=E2=80=99 defined but not used [-Werror=
=3Dunused-const-variable=3D]
>    65 | static const int pmfw_decoded_link_speed[5] =3D {1, 2, 3, 4, 5};
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~
>
> These variables are defined and used in smu_v13_0_7_ppt.c and smu_v13_0_0=
_ppt.c.
> There should be only one definition.  So define the variables as globals
> in smu_v13_0.c
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h   | 4 ++--
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/d=
rm/amd/pm/swsmu/inc/smu_v13_0.h
> index 7944ce80e5c3..df3baaab0037 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> @@ -62,8 +62,8 @@
>  #define CTF_OFFSET_HOTSPOT             5
>  #define CTF_OFFSET_MEM                 5
>
> -static const int pmfw_decoded_link_speed[5] =3D {1, 2, 3, 4, 5};
> -static const int pmfw_decoded_link_width[7] =3D {0, 1, 2, 4, 8, 12, 16};
> +extern const int pmfw_decoded_link_speed[5];
> +extern const int pmfw_decoded_link_width[7];
>
>  #define DECODE_GEN_SPEED(gen_speed_idx)                (pmfw_decoded_lin=
k_speed[gen_speed_idx])
>  #define DECODE_LANE_WIDTH(lane_width_idx)      (pmfw_decoded_link_width[=
lane_width_idx])
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu=
/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> index 73175c993da9..393c6a7b9609 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> @@ -85,6 +85,9 @@ MODULE_FIRMWARE("amdgpu/smu_13_0_10.bin");
>  static const int link_width[] =3D {0, 1, 2, 4, 8, 12, 16};
>  static const int link_speed[] =3D {25, 50, 80, 160};
>
> +const int pmfw_decoded_link_speed[5] =3D {1, 2, 3, 4, 5};
> +const int pmfw_decoded_link_width[7] =3D {0, 1, 2, 4, 8, 12, 16};
> +
>  int smu_v13_0_init_microcode(struct smu_context *smu)
>  {
>         struct amdgpu_device *adev =3D smu->adev;
> --
> 2.27.0
>
