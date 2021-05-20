Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31138B747
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA126F4FF;
	Thu, 20 May 2021 19:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657566F4FE;
 Thu, 20 May 2021 19:19:32 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so5303777oty.7; 
 Thu, 20 May 2021 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aOvxK05c6d3wLnFR8rUhQpFTkZU71eE9Pa/GUWPK6jA=;
 b=owH4E/XC406vIhUhSMWKPP8GyzYF1Mz7lVEo7LkRN7q76QG2sgiTXc/BMDNCWHxBV4
 5eIsWYI7Y06NM/nbZzTqTwVgMR6e8YFBUz8XTPxQBPhyv3tFmpVR3RADDLFn/rle8h4F
 cgPWUwXLPvFpOIo1cn5flHD7ieUjHUAv6/HsOUwVVqpU86IpKOeB18jJnXudzBMq47UQ
 VPs5Yt225e/0F5nRXeHuJE4+W5aRuoeIjCpuhmlNqTumAygglz9UidSgkiAqqtjWNv/0
 hSyBN5GXNzwhnfyOAUTEDHzsRiqdagH47HqhiF/mc6JMZlohcD9b9BkPYTAz4T7J96Gl
 QLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aOvxK05c6d3wLnFR8rUhQpFTkZU71eE9Pa/GUWPK6jA=;
 b=jCRvR4Ru4tIdJ8fRQNgLMrmJMje57B2s+kjtBj8rT4G+VakzL54lmhE6Dc9uajJn7I
 d0odIghMSrmPCniakRG4cdgWLGgV8H4BITBKeUOf+aGND1xHZr8SwmKxPkkixOUlQlbo
 90n5unsYNH+zyY78sYbcCx/K/VB0xQgf9lrtnyIU8noMHFt/goIb3eYrR0oVKFV04N5r
 sFxy2Rb3g+gItyn0bApw/0QCK7Tdf1OLAJqO3dxl+h1vLDaVhEW9TMBrylqK1xyud8I+
 Uf2MyFEEfaEcU0vT/JsF/fz7HaQzAUa2usk3IcOqpICn+ciO/V7er+k9OtiC9bFYs3t4
 kJGw==
X-Gm-Message-State: AOAM5316S+SC69S/1SjT/fk5iE39H6Y66sizwUsSEc6+Dwb42dRzmsWj
 e5nQ/CXCMD4gRfe+Rq5OKYUbDwQuyXJHJDCztSA=
X-Google-Smtp-Source: ABdhPJyH4iCQKcDPVu6k2YTOnGw2ittRAY+dS0HMOZ25P+LVhK/V3vl3eDM4n+HZ6KmurXcebwFwKqKfjYKus3pdk1U=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5144353otl.132.1621538371730; 
 Thu, 20 May 2021 12:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-25-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-25-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:19:20 -0400
Message-ID: <CADnq5_OtCr6KeYBOr-chNZRKuUOEE96B5WZN_mu2A2H_JutjeA@mail.gmail.com>
Subject: Re: [PATCH 24/38] drm/amd/amdgpu/mmhub_v9_4: Fix naming disparity
 with 'mmhub_v9_4_set_fault_enable_default()'
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c:446: warning: expecting prototyp=
e for mmhub_v1_0_set_fault_enable_default(). Prototype was for mmhub_v9_4_s=
et_fault_enable_default() instead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/am=
d/amdgpu/mmhub_v9_4.c
> index 47c8dd9d1c78e..c4ef822bbe8c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
> @@ -436,7 +436,7 @@ static void mmhub_v9_4_gart_disable(struct amdgpu_dev=
ice *adev)
>  }
>
>  /**
> - * mmhub_v1_0_set_fault_enable_default - update GART/VM fault handling
> + * mmhub_v9_4_set_fault_enable_default - update GART/VM fault handling
>   *
>   * @adev: amdgpu_device pointer
>   * @value: true redirects VM faults to the default page
> --
> 2.31.1
>
