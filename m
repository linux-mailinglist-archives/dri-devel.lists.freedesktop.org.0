Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CF2BB947
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 23:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D815489FF9;
	Fri, 20 Nov 2020 22:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1FF89FF9;
 Fri, 20 Nov 2020 22:43:38 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id t33so10038077ybd.0;
 Fri, 20 Nov 2020 14:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nu9Pci9XSkyd2dQdu9gYuDXeZiilDMpuYrk/Rd2PDx0=;
 b=vLazJgTbtfbaGpmbkmH9kjLDe/7YdZSR3IjSdTOC3a7M45J/PvYmtJ/ATBlPLtCXnS
 B9HxkvDhjflDpD9Je6i2J5DMk7XoIAuV+CgpkIE/GgKxvF081o4pPQZ7gGHBtBgIdozW
 a7gdWKUoPTaXlyivSbYHWO3GQFZuSqcPgv/qsmgMLwOAfQKjfjopSamtnb/TXGqobEhq
 cRMY/udYpwC+qW64oD+Kym32KEcD/EhXx/v2i960ZlYjlm+QAPJ1cpWunMuXQJ6H7fox
 m06GBTkn6shJ6Hk8qlWcQoLAGEg7fPky6YI3HaLP1o07U5OWbTUA5YtULqsV0Z71AA+S
 oppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nu9Pci9XSkyd2dQdu9gYuDXeZiilDMpuYrk/Rd2PDx0=;
 b=Mrp8HYpxzaDFSjBwbGEZ8pXzFaTnWHRoHWJ9OTY1FMnMnU7nD0WfEd4dUuP6cBV3zJ
 pvRCCpij9S+iELh6Lk5JN6u+zlZQC7J4dTkv0WaagF2IUergfLd+SGTdXDrlMXuUvCaB
 SSg3y2uZbfUdr/A9Hxu+AsimCQ03tUlQ2XYyLwEH7qIZvO5/l/zYQPUa4fWtVf6Gbrou
 fkEu70sglV9xv/x8E0rFe/LNnkmWFIGcy28D9PoD0Tp5taE8i7krTsVM5NkXBrz56pZF
 L4S5MpK1pPg85KdiYN/I5ZqUKiK6filemnAdKjqq9+V+8VnyXH8og7VQJj7Ilg0MmoHV
 hWtw==
X-Gm-Message-State: AOAM530I8B2eNM6bsAJlONbU+dYiEo+q+gkGYd5POzujFZM9j9vg8eG2
 DnjDXLoZYSNp7hKN2SPgycl/VEGhvObIj8TnU4I=
X-Google-Smtp-Source: ABdhPJwtW2ZdxXKGprnW3kFvpKNwPgrQ+lYf1VfvdBm8kxziqaJ0nTDG9tH90wmo+KGpy9hxejETqZf0R7aZrzO+0cs=
X-Received: by 2002:a05:6902:102a:: with SMTP id
 x10mr20678016ybt.130.1605912217819; 
 Fri, 20 Nov 2020 14:43:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <4737ca598d8548f06e5cae6333c0e100b74ffa65.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <4737ca598d8548f06e5cae6333c0e100b74ffa65.1605896059.git.gustavoars@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Nov 2020 17:43:26 -0500
Message-ID: <CADnq5_OFMOpG8ZDHBGXv4pcmHsm=5FJKPqCzYNyxTAJ28QPu9A@mail.gmail.com>
Subject: Re: [PATCH 005/141] drm/radeon: Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 1:24 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple fallthrough pseudo-keyword macros,
> as replacement for /* fall through */ comments.
>
> Notice that Clang doesn't recognize /* fall through */ comments as
> implicit fall-through markings.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 2 +-
>  drivers/gpu/drm/radeon/r300.c   | 1 +
>  drivers/gpu/drm/radeon/si_dpm.c | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
> index 886e9959496f..3d0a2e81b2de 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -4860,8 +4860,8 @@ static void ci_request_link_speed_change_before_state_change(struct radeon_devic
>                 case RADEON_PCIE_GEN2:
>                         if (radeon_acpi_pcie_performance_request(rdev, PCIE_PERF_REQ_PECI_GEN2, false) == 0)
>                                 break;
> +                       fallthrough;
>  #endif
> -                       /* fall through */
>                 default:
>                         pi->force_pcie_gen = ci_get_current_pcie_speed(rdev);
>                         break;
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
> index 73f67bf222e1..213dc49b6322 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -1162,6 +1162,7 @@ static int r300_packet0_check(struct radeon_cs_parser *p,
>                 /* valid register only on RV530 */
>                 if (p->rdev->family == CHIP_RV530)
>                         break;
> +               fallthrough;
>                 /* fallthrough do not move */
>         default:
>                 goto fail;
> diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
> index d1c73e9db889..d19c08e0ad5a 100644
> --- a/drivers/gpu/drm/radeon/si_dpm.c
> +++ b/drivers/gpu/drm/radeon/si_dpm.c
> @@ -5748,8 +5748,8 @@ static void si_request_link_speed_change_before_state_change(struct radeon_devic
>                 case RADEON_PCIE_GEN2:
>                         if (radeon_acpi_pcie_performance_request(rdev, PCIE_PERF_REQ_PECI_GEN2, false) == 0)
>                                 break;
> +                       fallthrough;
>  #endif
> -                       /* fall through */
>                 default:
>                         si_pi->force_pcie_gen = si_get_current_pcie_speed(rdev);
>                         break;
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
