Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E7379925
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE206E8FC;
	Mon, 10 May 2021 21:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE36E8FC;
 Mon, 10 May 2021 21:26:28 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v22so12238562oic.2;
 Mon, 10 May 2021 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i+UW9l1f2CKj2UlOVF+I0X5zqvD69rO6YcKaLDCC+D0=;
 b=aK69t+Y+KATfWUAk6yHy1uarwT8DuzijzWsJdsSzwILo31w+CBa7Ge896y2dH1twPd
 v99eDJh8be/MuW6zfNcEl34FncVQgrsS+XE8Wki23vSuSn2x5v6XWSCLS4tiOsSo44UE
 EBr6NPmu6nhWJNyjq92eQpoHYRdllfwhWmBZCCjySLiCwIqILEAoKUo0sWs1XYTt+rMR
 xMBykOXja9HhlrNBvrPHqsQOotCGUuOgm0EFycwdht9aB03Pc/ooSiTve/gYW3hqqJFe
 5SqQI3mQ4SUl+ONI4tYYcppGR3w5X1Ed0BcbwslsMh9WKRcMiq3s/fDZ1eDWtlIKeoDJ
 mUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i+UW9l1f2CKj2UlOVF+I0X5zqvD69rO6YcKaLDCC+D0=;
 b=r3Lq7x3Wylu4XElmvvCu3kwJKGR8JsR5FUi8oU8nY/NvkuirCCajTOeZu2ozjjYE1Q
 Ob4TRnAa3IpLrA3gfiojFgcwyBDhYz7yq+kJUoYY99cMhoaWMBnNHI44m3crINJD92cs
 GVUPEe/Zhy4UUkDDvidxuFn1JnVKvDO9So1a+m9Kz+7oqvo2q7oDh7OQMVdxg0XqF0Kk
 bFL84jZRjvsvWou3FhxRDRi63YNhxdK5R5I5OkuSf+QWjSMplSzF6XK27QUQfpDL7TR8
 Qg6xAsLr/yGfOO4rQwIN2KJcDsWLMfE4JrWlHMCAhQsho2NQx80mPYEOicEBtRITLytk
 JplQ==
X-Gm-Message-State: AOAM532gWi06/FfVpOOQNBU3zA6jb0cB6A2oc2XQuaBqMCQ1EsoJmSld
 Pp+m0x48mT4yakbHBTNVY0lfvB9wEKAv5ksMod8=
X-Google-Smtp-Source: ABdhPJz4WhvHhLUxZ231BvPLJkYiYWjvhE4d3egBqLdAG8uLzsMiXOd5tzCaRkhSGLlxD0u7yK2ZkKTaNoJJycm9sXk=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr19688116oii.123.1620681988325; 
 Mon, 10 May 2021 14:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210510122338.3748-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210510122338.3748-1-thunder.leizhen@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 May 2021 17:26:17 -0400
Message-ID: <CADnq5_Nc4ycGD7PrkQu2+fDuEOh6HqjjgSuyBfkjKSzU747mFg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Delete two unneeded bool conversions
To: Zhen Lei <thunder.leizhen@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 10, 2021 at 8:24 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:
>
> The result of an expression consisting of a single relational operator is
> already of the bool type and does not need to be evaluated explicitly.
>
> No functional change.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> index a9899335d0b1fb0..709ac576ac7e892 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> @@ -569,9 +569,9 @@ static int mmhub_v2_3_set_clockgating(struct amdgpu_device *adev,
>                 return 0;
>
>         mmhub_v2_3_update_medium_grain_clock_gating(adev,
> -                       state == AMD_CG_STATE_GATE ? true : false);
> +                               state == AMD_CG_STATE_GATE);
>         mmhub_v2_3_update_medium_grain_light_sleep(adev,
> -                       state == AMD_CG_STATE_GATE ? true : false);
> +                               state == AMD_CG_STATE_GATE);
>
>         return 0;
>  }
> --
> 2.26.0.106.g9fadedd
>
>
