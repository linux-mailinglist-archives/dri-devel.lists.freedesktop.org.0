Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C587B78716E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562D210E126;
	Thu, 24 Aug 2023 14:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C8C10E126;
 Thu, 24 Aug 2023 14:25:09 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1c4de3b9072so4552922fac.3; 
 Thu, 24 Aug 2023 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692887109; x=1693491909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jj+VsxPNlYygxR0YWp1qEk+PHqvGIcv1NZFfF1gn04=;
 b=LZA044mX8DLFktOaXrGFSp/RcXyh5URTciSLev7oFFAGezD2/hScyKGYxysgaXoXBH
 XbBcKk1XjJVGFgsgg/kwM9OJLUmG+WvTKc/rqfJYOGfl4N46esY8ufvgOE60EbHsb0YH
 hDpc7wMrAPE+iCIabCquj4gJa6v5k4FlcOV0fFkh3AR/U3dLoyLasp3hNqGerthBNI70
 YN/fi9PT77+3FkTAGDthLSLMTCaD8kDdWkvoM0cYZt6NCYKBs7cb+3Y5vB5In2Y+/7KK
 yjWBvpCYpLgBb8z4kRL7ujHG9ZAO3uT1ik6UQ4Kl68tg6iJ6eRCb15C/XXdHKJmt2BZi
 sSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887109; x=1693491909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jj+VsxPNlYygxR0YWp1qEk+PHqvGIcv1NZFfF1gn04=;
 b=KBYaSaxFSjd5f5WO7yiMdlLJeOUJoW0T8vEjncqflTIn5FDqdZr0eg4anGTwajTvS/
 nW7NOu5TmPCp1HFj81zjt9aQKOabHWn+WNshiwq3WC2XRv8LCc+zIQUDgN2YdZT70y7e
 Pz7cOKyT7vrThDQe8NGHNwQGU9bOzArlA3LvR4L6ihuRvJN4yYFly+dMObr1gtI7GTzn
 QhWgvHHL7Uwlr4tRLw5IpxObDbkqMuvE3POMjTlkyWzoOoiF8Y+YaXqqvDbmYVn6P9o4
 iYLRAXYkAlior3s/irbV7uHfbuLtNrhnQ5L/nDOtY6eecEh+a8kQRqnbKrf6LmsrEngN
 dbXw==
X-Gm-Message-State: AOJu0YwkqGMTeubWr6qZB4ELVgEpI42lZD6zTLfTcjt4qczd0mQJ7PZx
 g5hbFWbuM/EUQBmY/0L7p+qPGJzDJfCUUaKPnu4=
X-Google-Smtp-Source: AGHT+IFDDRQe/ZcAWLpqIFG8ZkwVnJ2S73S5T2E6cIqdd0/6XZWYewu0LM3ybZy276+QGrFZQcOUPJlQOWThlrvPXV8=
X-Received: by 2002:a05:6870:41d2:b0:1c8:b82b:cbdb with SMTP id
 z18-20020a05687041d200b001c8b82bcbdbmr18609632oac.33.1692887108906; Thu, 24
 Aug 2023 07:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230822113553.3551206-1-sashal@kernel.org>
 <20230822113553.3551206-10-sashal@kernel.org>
In-Reply-To: <20230822113553.3551206-10-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:24:57 -0400
Message-ID: <CADnq5_NGRLrgh=f1=4nyWAMv3_HhV5zCJxV9UYc1GLCygVjp1w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.4 10/11] drm/amdkfd: disable IOMMUv2 support for
 KV/CZ
To: Sasha Levin <sashal@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 7:36=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Alex Deucher <alexander.deucher@amd.com>
>
> [ Upstream commit 616f92d188ee7142a95a52068efdbea82645f859 ]
>
> Use the dGPU path instead.  There were a lot of platform
> issues with IOMMU in general on these chips due to windows
> not enabling IOMMU at the time.  The dGPU path has been
> used for a long time with newer APUs and works fine.  This
> also paves the way to simplify the driver significantly.
>
> v2: use the dGPU queue manager functions
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Tested-by: Mike Lothian <mike@fireburn.co.uk>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This is not necessary for stable.

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c               | 6 ------
>  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 8 +-------
>  2 files changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/am=
d/amdkfd/kfd_device.c
> index 00f528eb98126..9c8197573dee7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -224,10 +224,6 @@ static void kfd_device_info_init(struct kfd_dev *kfd=
,
>                     asic_type !=3D CHIP_TONGA)
>                         kfd->device_info.supports_cwsr =3D true;
>
> -               if (asic_type =3D=3D CHIP_KAVERI ||
> -                   asic_type =3D=3D CHIP_CARRIZO)
> -                       kfd->device_info.needs_iommu_device =3D true;
> -
>                 if (asic_type !=3D CHIP_HAWAII && !vf)
>                         kfd->device_info.needs_pci_atomics =3D true;
>         }
> @@ -240,7 +236,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *a=
dev, bool vf)
>         uint32_t gfx_target_version =3D 0;
>
>         switch (adev->asic_type) {
> -#ifdef KFD_SUPPORT_IOMMU_V2
>  #ifdef CONFIG_DRM_AMDGPU_CIK
>         case CHIP_KAVERI:
>                 gfx_target_version =3D 70000;
> @@ -253,7 +248,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *a=
dev, bool vf)
>                 if (!vf)
>                         f2g =3D &gfx_v8_kfd2kgd;
>                 break;
> -#endif
>  #ifdef CONFIG_DRM_AMDGPU_CIK
>         case CHIP_HAWAII:
>                 gfx_target_version =3D 70001;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driv=
ers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 7a95698d83f73..c73417e79745e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -2335,18 +2335,12 @@ struct device_queue_manager *device_queue_manager=
_init(struct kfd_dev *dev)
>         }
>
>         switch (dev->adev->asic_type) {
> -       case CHIP_CARRIZO:
> -               device_queue_manager_init_vi(&dqm->asic_ops);
> -               break;
> -
>         case CHIP_KAVERI:
> -               device_queue_manager_init_cik(&dqm->asic_ops);
> -               break;
> -
>         case CHIP_HAWAII:
>                 device_queue_manager_init_cik_hawaii(&dqm->asic_ops);
>                 break;
>
> +       case CHIP_CARRIZO:
>         case CHIP_TONGA:
>         case CHIP_FIJI:
>         case CHIP_POLARIS10:
> --
> 2.40.1
>
