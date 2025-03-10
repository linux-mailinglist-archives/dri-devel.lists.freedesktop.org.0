Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB40A598D1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ACB10E32C;
	Mon, 10 Mar 2025 15:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BkpXz175";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE6010E2A8;
 Mon, 10 Mar 2025 15:00:54 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ff73032ac0so1094682a91.3; 
 Mon, 10 Mar 2025 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741618854; x=1742223654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pik+SJ6TeRT73WeaopsJrOapXLaVVKqUv0DnQJUUmIc=;
 b=BkpXz175ZOLaGDq6br1Scci//H7uoztK5N3EnBKIw2jiUBHvBwQ+jv54NStTUxEPDT
 oTcxF3OEbZLS5zysxo7E4AnJg7Cv54sla4DrLNDxFq9aoD0oiSMaTJONKEvJbT6+9ZGK
 yn/PNs3SaMnPQ+QjC70HReauKK4Z2gFOCWUSpItqaAwIUpVXmfSuRJ7Ero3nWM6BPwvc
 yQ2RiPi7hEGD2NXGFpwLTOdMk5vq5WnLP0d0eYPhgXt+Ih0ZvjIEC6UbhUvH1HX4cpKt
 OqaviS/bLlCrsQIYcT5lWjbO3i5JtJpUtBBkeUbKFx8o/Pv2lxICav+J8Vg5RWyUfuMO
 3mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741618854; x=1742223654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pik+SJ6TeRT73WeaopsJrOapXLaVVKqUv0DnQJUUmIc=;
 b=rWjEnFEZaU2c3/GE1shrYHxn3R+zmUv6V6x/pvA/gJzaknGVEoZbc7KlBflaaWegSg
 qdgp+I5Sp72QCMVurJ2aeRJ7LEzl3qaYUe0o85L0vTzlC9y0NxDoMrd+tZsN9xSV93Mx
 PZGeJA5X7CVmXIGOLahD9Aogdn94YGI33tz7lNs77LAJpj1ZccqE3Q6I71eHPeC5dG/4
 wQkof16HGOgwUpHBjqT5Wp8ANHBOtn0DvG7qfNgOLVtuZOI+YfQdHa5PkieyhKQU6Wgm
 n8mRD3EnPxcmFjzfd8eDIcI2sX5Y6YkEewG4tYG0hW1fr+kXZRXnxJO6qLUwvsKGXbHP
 GAGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz2ssp26oNkzYO8LtimEq9seyZm+xILCQPPZDLTaFPGJP8AvLqu6x4/t6RpHTekZYwKUz4Kzqux9cP@lists.freedesktop.org,
 AJvYcCXim0akkwk+7glD/8nS00DKPenL/wl6ay4yZmIR1SPYgcG8pV+AVNe3wPrYCjeYTfJvzBV1QzTD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMTcA6tpq8xuVqGKJKxUxy98let+5UUlsGneec48wAiT9ZmqQH
 18TyzycoCpEQH3XwYXYxsxgqKddE937RPhtHNcquIA0s/5Xc+Ys4kAAQ4Wr3/v7wlO/aK5e11aL
 /4Z5w7IAyIDHI/x/fOTF3cV444aM=
X-Gm-Gg: ASbGncsLp/zofSPoMtQg832djMZHcCGBsYrEFZX0sY6cvSYNS8vO8Cp213epeJvnuR7
 1VNJ/Bl46twhCY4A7dAokk8iEnJWSwg7T3EinrOm+VaeA9st8ZbnXONLdD/9TGvzDZh6c5g55wP
 +L+hLvAN6fTQvL3e6N65X7jkujDw==
X-Google-Smtp-Source: AGHT+IHuWmERPlE+4ZNLC90fXXCO1PHzcp3LKpUguGUQ5r6EGa2DRmmvlJlS8B4Wb3tJXau9KQwIQ9GO609WUZ393FY=
X-Received: by 2002:a17:90b:3b4c:b0:2ff:6ac2:c5ae with SMTP id
 98e67ed59e1d1-300ff724725mr68013a91.1.1741618854030; Mon, 10 Mar 2025
 08:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <92b9d527-fa20-4e4d-a4ce-7c442df9df0e@stanley.mountain>
 <47a52abb-61ae-467c-9cf2-27427a5057ac@amd.com>
In-Reply-To: <47a52abb-61ae-467c-9cf2-27427a5057ac@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Mar 2025 11:00:42 -0400
X-Gm-Features: AQ5f1Jqm9WMU4lBdVptaUYa6Os9jtW4_wZaL5H0Ev3cSsBOqS0XIQez62ZUgzTc
Message-ID: <CADnq5_O=aawGH773SZ2KVwvOTRz0CsnoAuGPZTsAR=Fcqy3udA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx: delete stray tabs
To: SRINIVASAN SHANMUGAM <srinivasan.shanmugam@amd.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Jack Xiao <Jack.Xiao@amd.com>, "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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

On Mon, Mar 10, 2025 at 8:18=E2=80=AFAM SRINIVASAN SHANMUGAM
<srinivasan.shanmugam@amd.com> wrote:
>
>
> On 3/10/2025 4:17 PM, Dan Carpenter wrote:
>
> These lines are indented one tab too far.  Delete the extra tabs.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index a194bf3347cb..984e6ff6e463 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -2002,8 +2002,8 @@ void amdgpu_gfx_enforce_isolation_handler(struct wo=
rk_struct *work)
>   if (adev->kfd.init_complete) {
>   WARN_ON_ONCE(!adev->gfx.kfd_sch_inactive[idx]);
>   WARN_ON_ONCE(adev->gfx.kfd_sch_req_count[idx]);
> - amdgpu_amdkfd_start_sched(adev, idx);
> - adev->gfx.kfd_sch_inactive[idx] =3D false;
> + amdgpu_amdkfd_start_sched(adev, idx);
> + adev->gfx.kfd_sch_inactive[idx] =3D false;
>   }
>   }
>   mutex_unlock(&adev->enforce_isolation_mutex);
>
> Thanks!
>
> Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
