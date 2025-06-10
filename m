Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDBFAD46F7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 01:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8E10E2E4;
	Tue, 10 Jun 2025 23:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Frk4JCUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2C810E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 23:46:09 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-70e447507a0so48586967b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749599168; x=1750203968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GaNAWIk693eyh1JuJXCjO7d9zppcw7IioMGsGW5QOeQ=;
 b=Frk4JCUSS2EP+JBc605vSDKxyQXvEklnXK0aE5BaLt6Dje77rebJG1Fnk8wqZQleZ5
 vaz9iRcPmabt8Z7pDHLbydd2X2qWwakdxAMw5YfGUwlQrm2AxqOuD68yQ+c/JXpQI1UL
 XVSOyTwHiogxKROAApn4uda1a+WSbG+Rg4BJg00nLXJsR18hROyYhHcBGvyVnYKgaNhs
 PQi4oGqQUl45P4lR/BsqqIrhy5zFoFbAzvGfAP3k/wVaE0ge3x/tB5iTzORBnt6VCOrY
 c1Zr+pAIWa1pCpCsdvB0s2Ew6J2+GBahCKUBWXAhId1ocUE7NM6KoOp521TkqIVMvakO
 +FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749599168; x=1750203968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GaNAWIk693eyh1JuJXCjO7d9zppcw7IioMGsGW5QOeQ=;
 b=q/V2uwinUgU54GLFWl8uOZerXy0jPdVnLPmJlaEBU+/ZbgplB996sS/0NGf6wcjKbY
 xiIAmbTqM1Tsj7/oSUb0o+In0qqYwQzyJI1tbHRvlrk+6+U76dJlAk61/GBfZNO9/A6O
 LZi2W7+cKahrNY6HvxzUAfC6uUQFkAwNUzV4eJBmfzs6f3Z1vVCm2PJpGOVvlJJE2S+H
 4+owOUaHvvu/H27WyyjlIhZHJU/zpB54X2MguyPftucm4zAlGUPtoFdN86ScXbeDP+pr
 /ez8ixUEEVkAISFnQ0Nj2m4xd9mQVyeY1aKjWDuHu5ZUa/DIwa9Mh2KZP7fbIHHzPGNY
 ERcQ==
X-Gm-Message-State: AOJu0YwPHdfOSoYmqPyOhq6c+mBqaOqP1hflj6g+wPUeShCvgjtY7nH5
 mU3CLB52T5wm/iYy1kzcM7aWu8db8cFUznaZppKpy+20QPfpyRQmMcXpWw/Ar6n9+MUMONywALz
 qg10S7UxNJhsMHLqu7PQnZGsngR6kHAk=
X-Gm-Gg: ASbGnctbzEZJT6YTCACaZwKJMnSHCTaC8thud2fN2pPo4TbOjn9Tv9n9vN7aWdHwSiW
 WAQfR91Dde3uKZvX/f9bAChtzrSeLwDyJeVm226URbHuoq32YXm8EyihKpYvv/pNcyqPs1qkyCh
 VL7GBQ8f78gfMl8+k3z9PhI9NxPmpGi6yB/Ep7wsksM4tu/RVXquX4370jvgW6y8JJ0huHRQiBe
 Mtq
X-Google-Smtp-Source: AGHT+IFlSiYMoXYwvXdw9GGBE1bbuzMyf8oy1xePq+HOQZmDZKnqRN3l+kSWFJuqu+jAvb7ulZL6geoVRsj/h6dDz2Q=
X-Received: by 2002:a05:690c:f8f:b0:70e:2cf0:f66a with SMTP id
 00721157ae682-711423b49ecmr12929537b3.6.1749599168119; Tue, 10 Jun 2025
 16:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-8-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-8-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:45:57 -0700
X-Gm-Features: AX0GCFtOjUISdCzo6v7j81cqhd-VkhsJOGhuoIsrxLi-HBnY11WkKZSrMnkt8pY
Message-ID: <CAPaKu7TFYuDNns1wwkb9RdZqgurQhAGMMOrOOUsg35umqLNL8w@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/panthor: Add support for Mali-Gx20 and
 Mali-Gx25 GPUs
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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

On Mon, Jun 2, 2025 at 7:34=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> Mali-Gx20 and Mali-Gx25 deprecates the use of FLUSH_MEM and FLUSH_PT
> MMU_AS commands in favour of cache maintenance via
> GPU_COMMAND's FLUSH_CACHES and FLUSH_PA_RANGE.
>
> They also introduce the following registers:
> - GPU_COMMAND_ARG0~1
> - SHADER_PWRFEATURES
> - AMBA_FEATURES
> - AMBA_ENABLE
>
> This patch enables FLUSH_CACHES for both families of GPUs via the
> PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH bit until FLUSH_PA_RANGE support
> is added. It also adds the aforementioned register definitions and
> firmware binary support for arch 12.8 and 13.8.
<snipped>
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/pan=
thor/panthor_regs.h
> index 4eaa2b612756..8e01440f8743 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -89,6 +89,8 @@
>
>  #define GPU_DOORBELL_FEATURES                          0xC0
>
> +#define GPU_COMMAND_ARG(n)                             (0xD0 + ((n) * 8)=
)
> +
>  #define GPU_SHADER_PRESENT                             0x100
>  #define GPU_TILER_PRESENT                              0x110
>  #define GPU_L2_PRESENT                                 0x120
> @@ -98,6 +100,8 @@
>  #define L2_READY                                       0x160
>
>  #define SHADER_PWRON                                   0x180
> +#define SHADER_PWRFEATURES                             0x188
> +#define   SHADER_PWRFEATURES_RAY_TRACING_UNIT          BIT(0)
>  #define TILER_PWRON                                    0x190
>  #define L2_PWRON                                       0x1A0
>
> @@ -125,6 +129,13 @@
>  #define   GPU_COHERENCY_ACE                            1
>  #define   GPU_COHERENCY_NONE                           31
>
> +#define AMBA_FEATURES                                  0x300
> +#define   AMBA_FEATURES_ACE_LITE                       BIT(0)
> +#define   AMBA_FEATURES_ACE                            BIT(1)
> +#define   AMBA_FEATURES_SHAREABLE_CACHE_SUPPORT                BIT(5)
> +
> +#define AMBA_ENABLE                                    0x304
We still use GPU_COHERENCY_FEATURES / GPU_COHERENCY_PROTOCOL even on
v12 and v13.  I suppose they are compatible with AMBA_FEATURES /
AMBA_ENABLE to some degree?  We should unify them.
