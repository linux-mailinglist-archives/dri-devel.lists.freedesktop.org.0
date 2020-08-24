Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBC25075F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4585F6E432;
	Mon, 24 Aug 2020 18:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAC46E432;
 Mon, 24 Aug 2020 18:24:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g75so9180449wme.4;
 Mon, 24 Aug 2020 11:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6IMhsacwEGlvqh63CK0QsU6TXKj2+AaqerE7CsDvPC4=;
 b=cuzflAC3uciy+SFo7niw4FCDuAb3fCMO86nc63jHSysfsEyKhWd27QFpqF3n6w/xWC
 1obfY0eXN+qO+RLagG+MeQ4XvM0NUv+JIgPW4xc1THskPm97mmyvg5JVnf3kzU3FdnXu
 3h1lMyO0QB608NMom1x7NB0/tDOiorIbSDvrSm2jkcjMYdaM8feWuZPFXXiqU0q5Q5W3
 CJKsyzaiWPieLyXFvRh0832RE97WLGEe6B/Iqb1j690i5oH9R4IdOAGRpb9ag2czWN7a
 e+SdM2jyKEtg8NmTygqUmA7yaZ9Heq2GjDfWJBfZh5JvQPnEJjyKfgQ/km678L3PLXBK
 GtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6IMhsacwEGlvqh63CK0QsU6TXKj2+AaqerE7CsDvPC4=;
 b=Z454mYLaB15u5BFfN6X2P7phnmRO+k2zyJJBLb/ZuqznutFuT2GOgCi2+FRFqHVdQX
 0zM2m3aqhud/ExXlxyrXz60hWmGKqNfrGYRfXOrx3aVwpyQlzudl2OBJR3cDsbSpDmUC
 AAYQENxeiysgpnCL516KEq/SmWb1vyp6IthNmD07MfMcy7wnx8eCGvczj2buGcc2BL+U
 pERbFvtZ6EJLKQ/bNK1BMih+0GYmk1p5K8sGA3eojuo7CqYivP7uvWPmRiXC6xT2wQUR
 6+RmYnbn79Ytj6rbmDGLj2MblSunXPhwYMlkNPLVOZINmVfcu06xSRMRUvH7OCkUiYhw
 IjAQ==
X-Gm-Message-State: AOAM533iz0kZSF7WbB+tc2+sll2D2zvLNtwi1eQr6pYl2eydSnjZyAM1
 n8EFpLy3yHJJXTpxwHiuok8h717/Z/XZYDsSm0Q=
X-Google-Smtp-Source: ABdhPJz0DDJ2oIV/MrKaC4i0wH55w26Pka4uWviJmB8OafYTOputc9WZ6fiTJY/yEvVjFSK0bLyEE/F5rQPjGysMQBE=
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr495773wmh.39.1598293453989;
 Mon, 24 Aug 2020 11:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200824163504.605538-1-sashal@kernel.org>
 <20200824163504.605538-58-sashal@kernel.org>
In-Reply-To: <20200824163504.605538-58-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 14:24:02 -0400
Message-ID: <CADnq5_P7CMeUof2G99jMFCq95VsSCb8CAWMOFL=PujmZs=0QcQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.8 58/63] Revert "drm/amdgpu: disable gfxoff for
 navy_flounder"
To: Sasha Levin <sashal@kernel.org>
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
Cc: Tao Zhou <tao.zhou1@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 12:36 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Jiansong Chen <Jiansong.Chen@amd.com>
>
> [ Upstream commit da2446b66b5e2c7f3ab63912c8d999810e35e8b3 ]
>
> This reverts commit 9c9b17a7d19a8e21db2e378784fff1128b46c9d3.
> Newly released sdma fw (51.52) provides a fix for the issue.
>
> Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
> Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Support for this chip does not exist in 5.8 or any other older trees.
Please drop this.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 2c870ff7f8a45..fac77a86c04b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -3427,9 +3427,6 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
>                 if (!gfx_v10_0_navi10_gfxoff_should_enable(adev))
>                         adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
>                 break;
> -       case CHIP_NAVY_FLOUNDER:
> -               adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
> -               break;
>         default:
>                 break;
>         }
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
