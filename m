Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B717E1C759E
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 18:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726C6E8A0;
	Wed,  6 May 2020 16:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337CA6E049;
 Wed,  6 May 2020 16:00:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s8so2833466wrt.9;
 Wed, 06 May 2020 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5eC0q9kH/OLW0xvH/Ya7sSzazIuNp3mcIJJ1oeL080=;
 b=lQ4Ia6TZkysbbNIAhDuGpiWO7KCO47RjQPcjpPSazd6nrV18G3QvrExOvMLRWcOlon
 nRoXysP7XKcVH9sSW2dDvM8hAxLsQ5vL0VRPGfE6VyAyfXaQbRAGaXRVwVJFYggcbshQ
 OceVO97EVdAO4rE7Ex9n/pgGpW+guIOj3cuWITRY0EBJr2Ij+D0mY42Yuu0VDNEcyDrQ
 HfBzrxDXl8NMox2jDWQph40c5NZTu2j49IOPMMNjOWxawnWvO5FRr34r5jLU3N+/Xas3
 ClnK59EnGBDfAu/bjEzfaR5RoHbfH+KdO63KZ0Xr8P8Tv3TKNLPqY4EWE/7PfTSmn0/6
 kVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5eC0q9kH/OLW0xvH/Ya7sSzazIuNp3mcIJJ1oeL080=;
 b=ptGInQg1b24onyYtwXvgeRZanOGqpjXIcfVnO7HknS1hvR/z2ezDVyXfAQDqR4nsJ0
 q3DkfAfsGDBzq2t3qWjVS7zLz/kMzz3gHjiECUcvBXH63jVbDHNfnVnJ1LS69DAey7Oe
 c8TmLqYP4OPul34xuV3sDomx+nUBmnyURU2XaC1VSKe8cqRv/zC8wNcptLz0kXMOXfJl
 88F0sFMK7V6kRiOV1i2a0DVSIAbOCm6aEavSGGCVtxkqx7gOo4xsYrZ2JTKKjhBd5bYQ
 /UByCLnawiDeHrc07LFPPCuFmCc6z+Ql5dyIF6cxiDCxLuIPH/0T3qlCKGVxtf21ZKSD
 LdhQ==
X-Gm-Message-State: AGi0PuZERwxrFB4sskmUK8ri0unJ/vWFRUPqLevg/P2LlPrwuv7zi8nT
 HD5/gWqQmJpGWUpZAtJr0/uUbtprwwGnYPicvlTMUg==
X-Google-Smtp-Source: APiQypL3tXEjYhLf/bgr7Q0/DSDIJeeO4NiNwYIkbeeKaDlvH8xQfeOdRow5FP8uN2OVMaxsWCEPpToybESgb9qCgTA=
X-Received: by 2002:a5d:4389:: with SMTP id i9mr10814250wrq.374.1588780835900; 
 Wed, 06 May 2020 09:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200506143326.66467-1-zhengbin13@huawei.com>
In-Reply-To: <20200506143326.66467-1-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 May 2020 12:00:24 -0400
Message-ID: <CADnq5_MZvyhVQ6kcd1_qHgDOGGSe+DEbQJNnGeBf6mq5zT8GrA@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/radeon: remove comparison to bool
To: Zheng Bin <zhengbin13@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 6, 2020 at 10:27 AM Zheng Bin <zhengbin13@huawei.com> wrote:
>
> Zheng Bin (14):
>   drm/radeon: remove comparison to bool in btc_dpm.c
>   drm/radeon: remove comparison to bool in ci_dpm.c
>   drm/radeon: remove comparison to bool in ni_dpm.c
>   drm/radeon: remove comparison to bool in radeon_atpx_handler.c
>   drm/radeon: remove comparison to bool in radeon_object.c
>   drm/radeon: remove comparison to bool in radeon_ttm.c
>   drm/radeon: remove comparison to bool in r100.c
>   drm/radeon: remove comparison to bool in r300.c
>   drm/radeon: remove comparison to bool in r600.c
>   drm/radeon: remove comparison to bool in rs600.c
>   drm/radeon: remove comparison to bool in rs690.c
>   drm/radeon: remove comparison to bool in rv6xx_dpm.c
>   drm/radeon: remove comparison to bool in rv515.c
>   drm/radeon: remove comparison to bool in si_dpm.c

Does the checker need to be fixed?  All of these are comparing boolean
variables to true/false.  Seems like needless code churn to me.

Alex

>
>  drivers/gpu/drm/radeon/btc_dpm.c             | 2 +-
>  drivers/gpu/drm/radeon/ci_dpm.c              | 4 ++--
>  drivers/gpu/drm/radeon/ni_dpm.c              | 6 +++---
>  drivers/gpu/drm/radeon/r100.c                | 2 +-
>  drivers/gpu/drm/radeon/r300.c                | 2 +-
>  drivers/gpu/drm/radeon/r600.c                | 3 ++-
>  drivers/gpu/drm/radeon/radeon_atpx_handler.c | 4 ++--
>  drivers/gpu/drm/radeon/radeon_object.c       | 2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c          | 2 +-
>  drivers/gpu/drm/radeon/rs600.c               | 2 +-
>  drivers/gpu/drm/radeon/rs690.c               | 3 ++-
>  drivers/gpu/drm/radeon/rv515.c               | 2 +-
>  drivers/gpu/drm/radeon/rv6xx_dpm.c           | 2 +-
>  drivers/gpu/drm/radeon/si_dpm.c              | 6 +++---
>  14 files changed, 22 insertions(+), 20 deletions(-)
>
> --
> 2.26.0.106.g9fadedd
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
