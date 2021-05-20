Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C138B6CB
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B686F4E7;
	Thu, 20 May 2021 19:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB2D6F4E7;
 Thu, 20 May 2021 19:10:58 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 i8-20020a4aa1080000b0290201edd785e7so4027913ool.1; 
 Thu, 20 May 2021 12:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7aUG2dXh+6klmDA6WXd8OSdzl7pjQCCb87TCo0Exy6E=;
 b=mfIXPPC10SzTZqxuepC3SiwJi6etRAelD5Y7D4Mj+i2F+ZX9euxkSxgtSlreNy8Wq+
 0DzQ5Fd/Bw3uP+VaNdRXPkP2PdIWaZ71qzYVFPKDoW52A062H8ShnqfUFuuFM4LzZtWl
 e8x0dG0ZRmSreIPjrRnRP7NnexrVLaFbZdIxfa1jpRB1WST3Yvsd68yNsfJOAS3fC47c
 4kNHVUPhVOzqcafK3dXXLyJlbQaaNdlVcwZw5AfC31+Kfmb2wBS2ZwpUnpyzKqDx6WUa
 g2hqC+xjp6E1Mrt6so4bseLcZtNeIKTR7YHBcjOsOzgyYq4d8ccxnVvpnl1o+a+akq27
 /6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7aUG2dXh+6klmDA6WXd8OSdzl7pjQCCb87TCo0Exy6E=;
 b=F4aYYf4ombMxygoO6N6/ieuCrqNiv7EgQpwKMVdVlb5qxAN6zInu+JKDns4MuPHiKb
 pdD1fktUFwLDraDaVL12UU/SYrQM3ftLHJ10E/i5HmH4k0EVGyDKGlyUdT/UkmeYygck
 VOSd8M19VxGeSDMULhELL2aETWfzkwE0VPrz6Lp2JGX4BrFIrTBHVv0H/IWsmvx1V7kS
 EQ41KS01wksuxSqBojpEUi+QMcMVMjYCA47lpJSzYiG9sajsUo3OjqnOuJNpf2SyTUU0
 ZGfs1rrQI0Z1RgKbx6Pd/juB77Xx3W5q5RHcVQwpTWXfn0XJyudCy5uoNNSBLmgnwgS5
 yT1Q==
X-Gm-Message-State: AOAM532OUcUQ985atz7N1rfJNenSQDXrk/dwElBVbBk47IQUwgTgcecV
 hJWlSCBBdt921eRh6tQrTUz2QWdz8A+EA7PDeuY=
X-Google-Smtp-Source: ABdhPJyxmJJMnSHgvijXuC3+a1N5VY1r34o/FRKeOu5rQXlWBh5wzcOKYm9e4IMiB8c2W8XXE3R4pH7R9VEoycNN7Uo=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr4948998oor.61.1621537857547;
 Thu, 20 May 2021 12:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-13-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-13-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:10:46 -0400
Message-ID: <CADnq5_PCSixr_j3+zxhS4Z3WG83L_vYQuboo9NOOML0n_r9j0Q@mail.gmail.com>
Subject: Re: [PATCH 12/38] drm/amd/amdgpu/amdgpu_gmc: Fix a little naming
 related doc-rot
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

Alex

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:487: warning: expecting prototyp=
e for amdgpu_tmz_set(). Prototype was for amdgpu_gmc_tmz_set() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:533: warning: expecting prototyp=
e for amdgpu_noretry_set(). Prototype was for amdgpu_gmc_noretry_set() inst=
ead
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gmc.c
> index a129ecc738693..58feb0a422c34 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -528,7 +528,7 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_devi=
ce *adev)
>  }
>
>  /**
> - * amdgpu_tmz_set -- check and set if a device supports TMZ
> + * amdgpu_gmc_tmz_set -- check and set if a device supports TMZ
>   * @adev: amdgpu_device pointer
>   *
>   * Check and set if an the device @adev supports Trusted Memory
> @@ -574,7 +574,7 @@ void amdgpu_gmc_tmz_set(struct amdgpu_device *adev)
>  }
>
>  /**
> - * amdgpu_noretry_set -- set per asic noretry defaults
> + * amdgpu_gmc_noretry_set -- set per asic noretry defaults
>   * @adev: amdgpu_device pointer
>   *
>   * Set a per asic default for the no-retry parameter.
> --
> 2.31.1
>
