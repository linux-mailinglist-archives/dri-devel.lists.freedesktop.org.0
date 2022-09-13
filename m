Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC215B6DEB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E1210E6F8;
	Tue, 13 Sep 2022 13:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032D89EB1;
 Tue, 13 Sep 2022 13:05:42 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-11e9a7135easo31897155fac.6; 
 Tue, 13 Sep 2022 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Zz3ZuyKP9ensUU2Om8FSpGsYSuFsamP2YrTm9IZuHlw=;
 b=f+E0o0DPHiAXnmpaNZ73H5C4RsJLg+2Dwn1XMDPCz8+TOoFU/9uG96vepHmsIOEzO5
 2UzMeFlZsS3dOpSNb1rVaI5lbki8+8mV9F1qEiyOmiaZEoGU2gkyvHR0jD5snNPo756P
 nJ/qnKlnSoRt7xj6HUt7/aJsPS7nyga34CuXYK6FR3tt08DWCbd6FThJzrC0RQwb1Qxv
 Y+UYJ6Z0JY+TJ7L3n/h/8EQdBFDoomrPykXbF4TeP+wuko0qfU/ONJ25TjNN2XyvCdD3
 R0w57Nu7Vh4fpQ6pOqohi9yrCfN1LXfcoPUlQiwcpQDV1WMdZCqx1WGmAqNNnJ1PssBX
 TknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Zz3ZuyKP9ensUU2Om8FSpGsYSuFsamP2YrTm9IZuHlw=;
 b=6iRLCtJXKSiz8m4kX893TKf4UKSyPJLa2Ro6UlmvQRsDXOdbOFiDsDdemr9cqP+nV4
 554l5ZvU+f3qDEjrZEACs0473mymBc22OjNWHobEclHJt7HaA5rAZPS+siVd4V32GQmT
 D9Hz1dz+5QcsuWtwW+mBM+OCQtRQkgNJdFc8KCsVRIzAhrpo56yUdd48MfSEI8GfZD8h
 dRsoYLwLKkVCbDTdwUB740/j0QGLFuyYH1Ky8CvHnakdOOfIfWr+xct7y3cM8TJsNEGy
 731Q86nbdS8IxToKdG8ii40DGoJU2LYjCiXzNv8fJWB2iNbOCCTOqV3KwMtEIjIxdHW0
 fkoA==
X-Gm-Message-State: ACgBeo2rkNytinZGGBy2Y/ng2RGm37t8yIqW7gIi4tMjvdUJymILqCTq
 mvphNP1kkB4CKS71muJALcj8njpMvb7uWywt16Q=
X-Google-Smtp-Source: AA6agR5rduGKYZghi/pRmYkSMBadxQji0WAU2U3yLynsQzPDUoOEvNriM8jT51uEQbQwZ7SE19eM1sf6GDZOLvRepw8=
X-Received: by 2002:a05:6808:2384:b0:34f:df01:c011 with SMTP id
 bp4-20020a056808238400b0034fdf01c011mr1447287oib.96.1663074342037; Tue, 13
 Sep 2022 06:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220912032241.16259-1-xu.panda@zte.com.cn>
In-Reply-To: <20220912032241.16259-1-xu.panda@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Sep 2022 09:05:30 -0400
Message-ID: <CADnq5_OsjtPzYic1M9fbY=m7mwA_uxzZ=znVXgVrGjvJ2kRL7Q@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amd/display/amdgpu_dm: remove duplicate
 included header files
To: cgel.zte@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: christian.koenig@amd.com, sunpeng.li@amd.com,
 Xu Panda <xu.panda@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, roman.li@amd.com, airlied@linux.ie,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org, Wayne.Lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Sep 11, 2022 at 11:23 PM <cgel.zte@gmail.com> wrote:
>
> From: Xu Panda <xu.panda@zte.com.cn>
>
> soc15_common.h is included more than once.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7a93162633ae..0e42bf496a73 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -98,8 +98,6 @@
>  #include "soc15_common.h"
>  #include "vega10_ip_offset.h"
>
> -#include "soc15_common.h"
> -
>  #include "gc/gc_11_0_0_offset.h"
>  #include "gc/gc_11_0_0_sh_mask.h"
>
> --
> 2.15.2
>
