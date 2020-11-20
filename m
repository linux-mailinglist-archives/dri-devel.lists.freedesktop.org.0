Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0422BB95C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 23:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCFB6E93A;
	Fri, 20 Nov 2020 22:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEABA6E93A;
 Fri, 20 Nov 2020 22:46:24 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id w5so9994843ybj.11;
 Fri, 20 Nov 2020 14:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2et3t7V/KMkTytiG/e4D11gYul4TV6gTCzuYs+F2ZTA=;
 b=DJlQIvCJkf4+1dPh8TYw/kq+VciO+Nu8p0l00YuVUY9jScVcMNkjJrM9QrGA0UaAWo
 vR1QAMpWzfdHrJutnVWx/iyN6mkkntDbJ+TDwyj96irCZVg32WjHaS9cvci2j/VXeOu8
 nb6f4V/bfTKkg/jp1G1VMsDsvproKdBmjTJ5xh6SMvPjmi9ZqlMy1k/ATKosh2BIvdel
 93prsAl37ZGGkXKXWE2Z3blMLMznWhGGosb1ZXUnkMHWhvs5sZRLWY50q10QXhIhiaIh
 KuiAx3tkdXFXbw8I4+Ae64AnkcHfrOG1SXlNvnzUydInBV0NDE7ER0xtaACS4quhbHPd
 S+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2et3t7V/KMkTytiG/e4D11gYul4TV6gTCzuYs+F2ZTA=;
 b=AwZfYi4Y89EyODtXFZs1JABbGRv5l952+WyNKEmx9cZ/8O4qVmO16xcqgT60uAH3aP
 eBFPpufJhVsmEc1WPfLyhywhBKxdWolBlDDJLmb1l16F3Nn/xs+EdAy1jp4l9mRUsNSX
 P7wtxbCkz/74IzH7S9TYuem0WPoLo9xr1uLaFnCPwL5ZYJ7AISK676ZRMWSi6JHhPMFS
 HnxyeXoOzd4l/qEu/UPMro9ANNF12YwPtgqDSMH53KkHFtUZQCVjq036xqXIQJK4isf4
 bIwBPLAl2QsGMouaAGPH498JcwDEXsQ5MyYLo856iNePGXe3ZxgZwCmQkUNV0kyRgwcD
 xXKw==
X-Gm-Message-State: AOAM5334zUjtRQXVdS/mc7RQyqUBrydieNV8N2YVr9+/nMj9cqFiApG4
 DKlBrR1334B0FV/aUseVmCTRIyD8daNVw2ebaLs=
X-Google-Smtp-Source: ABdhPJzSQjUz8dvYfSiTH1U32APPsuQRJVBLBjH9CH5oFPS39C/kkiOMuJbRHdykj3+wPaMWsDr+x2P3/HvDpgo75s4=
X-Received: by 2002:a25:b803:: with SMTP id v3mr30277370ybj.326.1605912384156; 
 Fri, 20 Nov 2020 14:46:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <b73d98f74902b495689069177ffde953e1a061fb.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <b73d98f74902b495689069177ffde953e1a061fb.1605896059.git.gustavoars@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Nov 2020 17:46:12 -0500
Message-ID: <CADnq5_Ozd0bGq6CpkmjHaZH+D8dwpnMNmCzPQxh7pNh0hwNykg@mail.gmail.com>
Subject: Re: [PATCH 078/141] drm/amd/pm: Fix fall-through warnings for Clang
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
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 1:35 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
> of warnings by explicitly adding a break statement instead of letting
> the code fall through to the next case, and a fallthrough pseudo-keyword
> as a replacement for a /* fall through */ comment,
>
> Notice that Clang doesn't recognize /* fall through */ comments as
> implicit fall-through markings.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/pm/powerplay/si_dpm.c                  | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
> index b5986d19dc08..afa1711c9620 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
> @@ -6200,8 +6200,8 @@ static void si_request_link_speed_change_before_state_change(struct amdgpu_devic
>                 case AMDGPU_PCIE_GEN2:
>                         if (amdgpu_acpi_pcie_performance_request(adev, PCIE_PERF_REQ_PECI_GEN2, false) == 0)
>                                 break;
> +                       fallthrough;
>  #endif
> -                       /* fall through */
>                 default:
>                         si_pi->force_pcie_gen = si_get_current_pcie_speed(adev);
>                         break;
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index c3d2e6dcf62a..7d7d698c7976 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -2272,6 +2272,7 @@ static int polaris10_update_smc_table(struct pp_hwmgr *hwmgr, uint32_t type)
>                 break;
>         case SMU_BIF_TABLE:
>                 polaris10_update_bif_smc_table(hwmgr);
> +               break;
>         default:
>                 break;
>         }
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
