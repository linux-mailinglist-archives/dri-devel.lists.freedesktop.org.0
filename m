Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546890B334
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEBB10E414;
	Mon, 17 Jun 2024 15:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lIcKFix4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0AC10E412;
 Mon, 17 Jun 2024 15:01:37 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f65a3abd01so38464205ad.3; 
 Mon, 17 Jun 2024 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718636496; x=1719241296; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkUQ3FK7gYksAvRoh/DqalNd7XUdjUDoinpyvvkETiQ=;
 b=lIcKFix4KxiK8Gf+412PbMHd3RutSo5Y0Py1UkcJCThdp93y6mpDkoF9BO31YXgAwx
 nBl8WIrARJ/TpnWK+yfX9BwNmLeeuXIMTKletZufkVSsDLMttglb1skBj071kj+a9Fum
 c4rCzE4rFy8jAWtJ9hkjIm+38TbTLZVuUbbh9cLkaFB3VIY4j3a/8EYDBJN+FiBMLpEb
 whfhiZV9MWj/+nxYTKe9n/eCyl/Zk7NxHjcCXWl/v2W8k8azEHuxAhiuoMO6IxDczzWI
 fXWgRZsz3F2+ajZzOoewWeh1iYAM1tPRMjUvIoHa0yCEcDrDkJgCPNzSXEvkRiNU/FwH
 fIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718636496; x=1719241296;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkUQ3FK7gYksAvRoh/DqalNd7XUdjUDoinpyvvkETiQ=;
 b=Z8uFAkY30yNIyu1ERRn6GmH4feX0jvsj93T9+ctL9CGo9HQqCkd4lqCQL9OaSF+qcS
 t8DBf4z4rFs8UGsIlIy+khoJT8bClwz/ccYiZt9EJ5gvc+kAezxsvH3ujzg+qqITlLsL
 f+P+EfcO1eh0y0sTAsvzT1WeOYFcmyIzwelLMXkGK5rDONVVqY+bOEH2LqvU1JSW9up4
 ipdGSOio2sHaAh/Qj7mahs2GHBLDZuKUq9BNX5mxdTk428e/2IPxakm9F2lqG9CXe/Ud
 CFrs9spG1TwgeyXE1VMTqDy8d77qnIsov8D6wj4BmJwhQprHoEbKlqV9MzPRvR19Yvsp
 yVPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+7+cJACANXwOhTyMDKxCStnff7kt/2rTj7s6P8XztSokOs+OKSU3LztxSUm6O2mQf7lm8Ey29NyfljlLj9UoWLGB6z92/+cE0yz3lqg==
X-Gm-Message-State: AOJu0YzPg3I2hF5HxtmgypXxzBE1MsLZjoQ5/uulmrIgPCjSBFMeWPLO
 yzGmi8M8Yvc2d/QPWOY8mcfmaIss+MuqI6HhJdlFLzD1z1Zd/lzDhUy1ev9rMZSr0rNENCM6yTm
 r57IICxQVgRN6DeALT6M2YR39NU4=
X-Google-Smtp-Source: AGHT+IEsuB6l5SG4Cvs3xhhF/nAx6UFaYr3Uz3Btfd7tVaTu5y32qyHjK4CqtjZtHEK5N5kZIj3e55sj623ih9eKwIw=
X-Received: by 2002:a17:902:e847:b0:1f8:49e0:4d19 with SMTP id
 d9443c01a7336-1f8629fed6dmr145642115ad.57.1718636496299; Mon, 17 Jun 2024
 08:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
In-Reply-To: <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Jun 2024 11:01:24 -0400
Message-ID: <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Candice Li <candice.li@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Victor Lu <victorchengchi.lu@amd.com>, amd-gfx@lists.freedesktop.org, 
 chenxuebing <chenxb_99091@126.com>, linux-kernel@vger.kernel.org
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

On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
> ...and further, I'd say that this patch is more of a plea for help
> than a patch I think is actually right. I'm _fairly_ certain that
> drm/amdgpu needs this call at shutdown time but the logic is a bit
> hard for me to follow. I'd appreciate if anyone who actually knows
> what this should look like could illuminate me, or perhaps even just
> post a patch themselves!

I'm not sure this patch makes sense or not.  The driver doesn't really
do a formal tear down in its shutdown routine, it just quiesces the
hardware.  What are the actual requirements of the shutdown function?
In the past when we did a full driver tear down in shutdown, it
delayed the shutdown sequence and users complained.

Alex

>
> (no changes since v1)
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 ++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index f87d53e183c3..c202a1d5ff5f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1197,6 +1197,7 @@ static inline struct amdgpu_device *amdgpu_ttm_adev=
(struct ttm_device *bdev)
>  int amdgpu_device_init(struct amdgpu_device *adev,
>                        uint32_t flags);
>  void amdgpu_device_fini_hw(struct amdgpu_device *adev);
> +void amdgpu_device_shutdown_hw(struct amdgpu_device *adev);
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev);
>
>  int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 861ccff78af9..a8c4b8412e04 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4531,6 +4531,16 @@ void amdgpu_device_fini_hw(struct amdgpu_device *a=
dev)
>
>  }
>
> +void amdgpu_device_shutdown_hw(struct amdgpu_device *adev)
> +{
> +       if (adev->mode_info.mode_config_initialized) {
> +               if (!drm_drv_uses_atomic_modeset(adev_to_drm(adev)))
> +                       drm_helper_force_disable_all(adev_to_drm(adev));
> +               else
> +                       drm_atomic_helper_shutdown(adev_to_drm(adev));
> +       }
> +}
> +
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>  {
>         int idx;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index ea14f1c8f430..b34bf9259d5c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2409,6 +2409,8 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>         struct drm_device *dev =3D pci_get_drvdata(pdev);
>         struct amdgpu_device *adev =3D drm_to_adev(dev);
>
> +       amdgpu_device_shutdown_hw(adev);
> +
>         if (amdgpu_ras_intr_triggered())
>                 return;
>
> --
> 2.45.2.505.gda0bf45e8d-goog
>
