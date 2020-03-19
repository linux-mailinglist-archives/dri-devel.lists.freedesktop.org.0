Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED0F18C06B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 20:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A856E08C;
	Thu, 19 Mar 2020 19:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EE76E081;
 Thu, 19 Mar 2020 19:30:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s1so4633019wrv.5;
 Thu, 19 Mar 2020 12:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7CBudlfe9psd6R8TTGvkJ+zNu7+wVhc0v/RhkdEAA+A=;
 b=MfU0+wuOR72bKAex8obYLr8+8ICQquK+SgEYCdDXgN5HcxdbunVeBVda9qODu8ms+O
 Q3wexl/+2bVeJlyeLRslp0D1dZXV/NXyAI3ml6KJ04irI9n/ZeARsuiP72ZtbFVPuzDZ
 b3eA9UtiKp7YDJkED7OxKvfTXgd0JlR7/npsz1Bh/nI+SkJLvL0J702pff6y7s2vIf0z
 VUh9YEcKhoiqDiAiNCExpC96WTymTTtCPmW8mDXFiXgChvRl9vjW55waLy/RxMbiBZrI
 0clqT3YNooUFacK+CPRpwsEkCIjMdy3lOr+5mrxXgwrkRuXPAe93bElTt5QOLWREOwkz
 msDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7CBudlfe9psd6R8TTGvkJ+zNu7+wVhc0v/RhkdEAA+A=;
 b=YGVHse5SSSB0dCB/zE7JgFg52y+TAc9LLybTo27g8iEQ8yd+5KX3tX/hy2FdH6Sm1f
 KnnF+S9fAb/k/QrHjo+vd8fc/JWEIxgr/EsZuiezt+ehT3X57STDAj0h+GQ+FHq6RjJb
 2SuYg06Vno8F1SnjYvV2cJ5oMoJYhcz4zP92+XSR460qD/XrFJjJaSLSZvUNs3D4aWlp
 yR86D90sHBQoZRVDSqjFyVrgySVT9cmPAQsuSV9fxGKEp0kru6oUYd4vJSKxc+PwChjh
 LHLuduZ00ZgJo7R1YtdffSgCJIv1aKon/s364BM8daW03yK/28dIEhBi4M8ZBU98ou9I
 gHRQ==
X-Gm-Message-State: ANhLgQ2YHQDaE+Zna/YKNxd6W1GCAhsTpU6vesmPs4sFgyTKi/yW60oy
 GFIowcuOIcDLl6nl2Yg1aH7G9ZW7RMjgcHCtXxI=
X-Google-Smtp-Source: ADFU+vvHJQpSu0aOothelreJw0UeBo2KQzYdEJUfMzaZui4XNhDnAWSBybcN6x2QwGEYC0eWya0Y9ZtXjG5Y4gYbG3I=
X-Received: by 2002:adf:b35e:: with SMTP id k30mr6136403wrd.362.1584646219568; 
 Thu, 19 Mar 2020 12:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <SXhX80OoFKMCVNQM9khl9rN_3bsGdi2f6kiyvATRPj9w6_VqgIMqDqd5pPYK3OMFlHFaW1ln8wYqg2DXk4yyZIHJHeaCoaYj8EMmR52vf1U=@protonmail.com>
In-Reply-To: <SXhX80OoFKMCVNQM9khl9rN_3bsGdi2f6kiyvATRPj9w6_VqgIMqDqd5pPYK3OMFlHFaW1ln8wYqg2DXk4yyZIHJHeaCoaYj8EMmR52vf1U=@protonmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Mar 2020 15:30:08 -0400
Message-ID: <CADnq5_MZMuKtDGVgBQ5_+b0Zb2E-5JxLiqn8t08yG1YxtJwAaA@mail.gmail.com>
Subject: Re: [PATCH] Remove stable HAINAN board from max_sclk override check
 in radeon and amdgpu modules
To: Yassine Oudjana <y.oudjana@protonmail.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 9:50 AM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/si_dpm.c | 1 -
>  drivers/gpu/drm/radeon/si_dpm.c     | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> index 4cb4c891120b..0860e85a2d35 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> @@ -3439,7 +3439,6 @@ static void si_apply_state_adjust_rules(struct amdgpu_device *adev,
>
>         if (adev->asic_type == CHIP_HAINAN) {
>                 if ((adev->pdev->revision == 0x81) ||
> -                   (adev->pdev->revision == 0x83) ||
>                     (adev->pdev->revision == 0xC3) ||
>                     (adev->pdev->device == 0x6664) ||
>                     (adev->pdev->device == 0x6665) ||
> diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
> index 05e8b4d0af3f..2cb85dbe728f 100644
> --- a/drivers/gpu/drm/radeon/si_dpm.c
> +++ b/drivers/gpu/drm/radeon/si_dpm.c
> @@ -2979,7 +2979,6 @@ static void si_apply_state_adjust_rules(struct radeon_device *rdev,
>
>         if (rdev->family == CHIP_HAINAN) {
>                 if ((rdev->pdev->revision == 0x81) ||
> -                   (rdev->pdev->revision == 0x83) ||
>                     (rdev->pdev->revision == 0xC3) ||
>                     (rdev->pdev->device == 0x6664) ||
>                     (rdev->pdev->device == 0x6665) ||
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
