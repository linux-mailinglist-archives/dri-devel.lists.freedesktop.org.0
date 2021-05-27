Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CEF392587
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102316EDF9;
	Thu, 27 May 2021 03:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593336EDF9;
 Thu, 27 May 2021 03:43:05 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so3156960otg.2; 
 Wed, 26 May 2021 20:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jfHExiAwx1yhDJ7z9SPOraFBPqMXoh5n46J3TLD6IxI=;
 b=qCrx8FvXM97lUfDQtGc7hqeqQ944hYWWSoZujRCyYfzaH2s5JMDv2t2lz5CDYr8a4Y
 RdafEpU06bBsenrmamIC2itw/iiggx/c8Rzq+H6/Z6je69wxAOlgrSenGLJhTxZ1f8vU
 3VegTt+cwG8QpP0YCRg2HEaApzeqy9m2YmRI1GFSSsxZnaxrLm+nLUHCvamNrv1LmqwX
 JnvuRQEKuANxoS7lJlLC7H2mQnaoiPzkcrDVygrPJ2JXOQmmI7UzucPCas1t778Umb5k
 0d6kKCIh6v0DwJcdZgXB9P9jQlmnX9K/Z7G6DP6U2uQi+Nb/gqn2TWQxSJjaWKxJU2Ji
 FUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jfHExiAwx1yhDJ7z9SPOraFBPqMXoh5n46J3TLD6IxI=;
 b=LaHoKUF23aGnHtxDOz4c8MJE9yYIVcjH8pyBncrrrZmBf4clNpuV0sXdFbmLDanCSo
 gA0kep5Zq0KgQtdNy145als3mTlIKodIYfC0CynrjtsAUsum10D5KZ8wbfs4RvwKjIEF
 I5mgfncHgqgdo5kc/jPhV4c6dZYGK9DbinQi8/r3npvbNJaoqhRTQNCkj87+R1IBhWUj
 tDicZACBjcxEA2alnhP5Y2qoZVRD/oGepYcOQfEyPVa2heultcvHPygwzybzDZiIBtWv
 2FLbunBbTIq/NP0L/wtc4pQKA3H7DqZFcX94DumdBxeHAM6GMCnVAmrD0mi0olcCVaj8
 8c/A==
X-Gm-Message-State: AOAM531w82iv9CQQ5dnp2nUKUQbmF/PI0KETSEEvRqR5vHDVf8DJDlXL
 hbzgIfx+79pUtZ5G57qFcWTaV1Niei07zbnGyXw=
X-Google-Smtp-Source: ABdhPJyZnqxxgDnJ6PHbltuqV9e7YpgMP1k4fxHJNb1XSn7Xny5N88vOTGA/oxzG3Dqra1oAamTpwHWFw2t+Zsk06wA=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr1174607otl.311.1622086984587; 
 Wed, 26 May 2021 20:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-2-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-2-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:42:53 -0400
Message-ID: <CADnq5_PhozjNvOjvoMQRr-oqNz_vOjHtuW45wCK80jHKYscV7A@mail.gmail.com>
Subject: Re: [PATCH 01/34] drm/amd/pm/inc/smu_v13_0: Move table into the only
 source file that uses it
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/inc/smu_v13_0.h:54:43: warning: =E2=80=
=98smu13_thermal_policy=E2=80=99 defined but not used [-Wunused-const-varia=
ble=3D]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             | 6 ------
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h b/drivers/gpu/drm/amd=
/pm/inc/smu_v13_0.h
> index 1687709507b3d..6119a36b2cba0 100644
> --- a/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
> +++ b/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
> @@ -51,12 +51,6 @@
>  #define CTF_OFFSET_HOTSPOT             5
>  #define CTF_OFFSET_MEM                 5
>
> -static const struct smu_temperature_range smu13_thermal_policy[] =3D
> -{
> -       {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 9=
9000},
> -       { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000,=
 120000},
> -};
> -
>  struct smu_13_0_max_sustainable_clocks {
>         uint32_t display_clock;
>         uint32_t phy_clock;
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index d62cc6bb1a305..d6ce665baaf3b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -78,6 +78,12 @@
>
>  #define smnPCIE_ESM_CTRL                       0x111003D0
>
> +static const struct smu_temperature_range smu13_thermal_policy[] =3D
> +{
> +       {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 9=
9000},
> +       { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000,=
 120000},
> +};
> +
>  static const struct cmn2asic_msg_mapping aldebaran_message_map[SMU_MSG_M=
AX_COUNT] =3D {
>         MSG_MAP(TestMessage,                         PPSMC_MSG_TestMessag=
e,                     0),
>         MSG_MAP(GetSmuVersion,                       PPSMC_MSG_GetSmuVers=
ion,                   1),
> --
> 2.31.1
>
