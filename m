Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FC77872D7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EB310E578;
	Thu, 24 Aug 2023 14:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B4A10E577;
 Thu, 24 Aug 2023 14:57:56 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a7e68f4214so4872567b6e.1; 
 Thu, 24 Aug 2023 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692889075; x=1693493875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0L8ZdCdslGV7lYgC2z8wsXPTGJqpToifU7gdWaRf1Mc=;
 b=GDNXuEPpzUgkKkWX+WqGCrRSnHLAzkx9ZUozaEdFTipr9OHJo+Viq+6VPSvHv2/P7g
 vub+stjA29kQOGOX480A6X32PcLxzPabgbLd70d3XwyVaBVsfvM+8wH94TzOpUJmLszf
 X+5qnxiWCKtIzK51fOEvCAXrwM6GJSLwHjGRLGDrSqMrBICp7H4otLWRhnmrNqOt6UKO
 bBJSOM2qyAz267xWs/y8LfFI0IpLDxkTES680/ZD1nxFe3fHjOrelBhi0BGA0F0AgyDp
 2pzdkZ7e2xWlTFBDjxdmJLL4GH5yVmpazkyno7RGPxpA40dEqvzofXcuxuuDr8MFPoup
 qqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692889075; x=1693493875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0L8ZdCdslGV7lYgC2z8wsXPTGJqpToifU7gdWaRf1Mc=;
 b=BLK/37ii9UR+N/G3qjHuydCdWAoenJinInz5bwcnj2CtnDdcCo8pbyXJshbRss0MFD
 /TKGnEQJ+iA+IuAGMzhuhlc5WwNGV/jQDiZBgUVfk3HiYs7gTLFXYJzAchBFlf3ADAro
 bZjqWYBFDqOr7W994bAvuwDNRnyIPILbA8M54342OEyuDCkXrdqDs5og8ycay5E4Cr97
 rtRGHu2nU2YdH5pYTKBL1CH+FBDaeGXNGIpckaD2UOZzkruDY0PhSuJMBVY3hEF7KFmE
 iuShZOACO7bHHwnVyCa+YuA/0jzna//n8RtWho4vQgXQHsvpoIjqnFRcbVcAjsLYjVb+
 KG+w==
X-Gm-Message-State: AOJu0YxLMO/Td+GXVuFY7o3aE0LBMuYTA7d8z/s7ZlSU9fi73g/MPlf8
 SsfM0eDxWM2fiu2ofURlL0iaSwSLarmx4/z8SKE=
X-Google-Smtp-Source: AGHT+IEzP66V0cPoFpKqDmO6GqrtdNmngPSWLKjGGYM0VIAt4kyZ16VL2U55cqbLGl4fqQHiq6yBqErfFEEAlfIZRyk=
X-Received: by 2002:a05:6808:138b:b0:3a7:6b1c:8142 with SMTP id
 c11-20020a056808138b00b003a76b1c8142mr23414816oiw.25.1692889075365; Thu, 24
 Aug 2023 07:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-21-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-21-lee@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:57:44 -0400
Message-ID: <CADnq5_NC5nmOKj+_-osrM1Taak=-TiF-pV+DWTcg7AzRJROiWA@mail.gmail.com>
Subject: Re: [PATCH 20/20] drm/amd/amdgpu/imu_v11_0: Increase buffer size to
 ensure all possible values can be stored
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 24, 2023 at 3:38=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c: In function =E2=80=98imu_v11_0_i=
nit_microcode=E2=80=99:
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c:52:54: warning: =E2=80=98_imu.bin=
=E2=80=99 directive output may be truncated writing 8 bytes into a region o=
f size between 4 and 33 [-Wformat-truncation=3D]
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c:52:9: note: =E2=80=98snprintf=E2=
=80=99 output between 16 and 45 bytes into a destination of size 40
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/imu_v11_0.c
> index 4ab90c7852c3e..ca123ff553477 100644
> --- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> @@ -39,7 +39,7 @@ MODULE_FIRMWARE("amdgpu/gc_11_0_4_imu.bin");
>
>  static int imu_v11_0_init_microcode(struct amdgpu_device *adev)
>  {
> -       char fw_name[40];
> +       char fw_name[45];
>         char ucode_prefix[30];
>         int err;
>         const struct imu_firmware_header_v1_0 *imu_hdr;
> --
> 2.42.0.rc1.204.g551eb34607-goog
>
