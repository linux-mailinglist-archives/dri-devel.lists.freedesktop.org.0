Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A3CBFC638
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A6C10E7AD;
	Wed, 22 Oct 2025 14:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JzFm2y15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB7D10E7AD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:08:08 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2699ef1b4e3so11650865ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142088; x=1761746888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxWecD44n8F7A68MtB2Gk3SGRDfmDIC8qrgGGOx9IvQ=;
 b=JzFm2y15gzaqngtYJeuEXuDTCeDmCVz9dMyBnhT+ED/crIewLyewD1pQrWvq/9ANOf
 Q2BbhmtSWkxRCJs3/EaNkPsWa2QgJ0s+YgHlLEfnJ2ubZh4wXsWZ4PFD1Nq9sFqfv+7q
 0viCMeqHfmRgtlirqOiJuU9GvetRGlX7slbT+hwoX30/LHNggRp34RC7TEU6hQ+ocYyC
 u0BTx3FvQREel1kdL1IY3ELR3z0mfxWdQx1wjRtT3u7rhWkGq3oDJzQHNnC0pnm0dVYG
 oRV3EcdRCLaRqCQi6MM0HeV3CHzkb3d6w7KC85PJ52jJFv8dABnxUAc6LzI/QvMKXRyO
 P/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142088; x=1761746888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxWecD44n8F7A68MtB2Gk3SGRDfmDIC8qrgGGOx9IvQ=;
 b=fJle3mqH2eAMNQkg4Qn1gyxl2h+nFK1L2CLKUbC/ApWhZn8tAsdWQRwPJHQBtzrKsd
 En6wqwEXYcddwrX/o8pytfm33+pbo0V+FB4xyI2a7fxCdQQKLlK4AyJT8eLPETPQOAIZ
 EWRUXA+LWjrOV+zNJhXIakg0jW8t/jMw+WBF299dXRwlYqv1dzcEgze8+kwcdW9ylJoH
 JCXrCoJ0l9oaHC+IoyXAuFWdyYYH0stU7J0CNS3xnuWMmzwQWgwfNzb5Or6//x5Tzock
 BolUrXuloubeUCk0qDMLRqe0lWnvdvTPykEaPivtCMSQ1LdBSAFodpExXZoTEKeVw28T
 dnXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3lD+bpGwtmd47KCsoa3FcdbqJWbv8EzuIzcfJ/SIMeuM2EutkZLFDRTZIsIpre8+pVw+HjGO0a2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnbIWueqJ+/MDDZVLd+MhgFCpgwH/IAZ6SsvrpUzmSsz9aZITD
 Pbqoe8V1s5XBK2E04+OwEXyaB2cASbVL3Oji6HruDX6jJEvgXvf+wrQZUG3qTbfqf7jbO1UMpXF
 huaQmUopKNFGsGw76y5X4PopgnUElsn0=
X-Gm-Gg: ASbGnctG3ohhY5ix1GahRdwf5rbD0qOQGqxMsgBsHjHkM0eXnfWkpxMsxgSXG9g2Rqq
 QylizE1r7VCtxrg51utNq38iKNVZ5EUaET5vh3uXXJ8mPoqcSpAMKPaMYWvZu452Za98vbHfu8g
 Ks+3yYJccd4kH4E1P+PQc51RexDg9uOgYRJB8ggVzdCJSMOZXtw22uS0IBUzalDx4Ii5GzN4RdB
 uRrC3KlGXkthHvHwMxI0yZyN2hEVrgRBpsMogLcH68uPqE3xtkZId2WNP5u
X-Google-Smtp-Source: AGHT+IGM3mvFgkHnTG7QRIj/Gmy3p+LRuhhPAH5vukdmhYx7TsNqfkR+YhVrgCxY2EWb4hIpzDcGres9mluYuxqKhfc=
X-Received: by 2002:a17:903:120b:b0:28d:1904:6e77 with SMTP id
 d9443c01a7336-290c9d26917mr126853125ad.3.1761142087899; Wed, 22 Oct 2025
 07:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <aPi5_CILMKn3ZrVd@stanley.mountain>
In-Reply-To: <aPi5_CILMKn3ZrVd@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Oct 2025 10:07:56 -0400
X-Gm-Features: AS18NWBdUcj9BuAc7F-BssClfHNNkfo9ryZDxZvVPhEuoCs-u5I60K5betUL5-0
Message-ID: <CADnq5_MoG0s7K5wCaf8-32SWCnOeaPkYvDCyixem_w_jVBbgag@mail.gmail.com>
Subject: Re: [PATCH next] drm/amdgpu/userqueue: Fix use after free in
 amdgpu_userq_buffer_vas_list_cleanup()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prike Liang <Prike.Liang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

Alex

On Wed, Oct 22, 2025 at 9:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The amdgpu_userq_buffer_va_list_del() function frees "va_cursor" but it
> is dereferenced on the next line when we print the debug message.  Print
> the debug message first and then free it.
>
> Fixes: 2a28f9665dca ("drm/amdgpu: track the userq bo va for its obj manag=
ement")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index 9d4751a39c20..2200e0bbf040 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -159,9 +159,9 @@ static int amdgpu_userq_buffer_vas_list_cleanup(struc=
t amdgpu_device *adev,
>                         r =3D -EINVAL;
>                         goto err;
>                 }
> -               amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
>                 dev_dbg(adev->dev, "delete the userq:%p va:%llx\n",
>                         queue, va_cursor->gpu_addr);
> +               amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
>         }
>  err:
>         amdgpu_bo_unreserve(queue->vm->root.bo);
> --
> 2.51.0
>
