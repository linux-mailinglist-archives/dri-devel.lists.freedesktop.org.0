Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C8250775
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700596E42F;
	Mon, 24 Aug 2020 18:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDBC6E452;
 Mon, 24 Aug 2020 18:25:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r15so9820281wrp.13;
 Mon, 24 Aug 2020 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bq5hRh6dg9CMA08TsyveabYMk5mqrcCNLEtAUVdySnw=;
 b=daV5NP6KOQoVdPhRTGodqQ1JzkNkgZDMhtCfKtrZere0DfYHigFpCO3yp7egRNWQ0H
 /MtuQ1mXghrxISQDgOLetOnRz7TuPJz+sCIcUlnTrR1dG21Tb8F5Sl1zqzguMFMTuF3u
 7mG4P5obRsoI0OmXWg2XsMjrlxxbOSY8qSnP7vc+F7unlZa8DUJcQMZ+6AaOB/Ca1GTq
 o8limkjqvpNJK0ga98DoiGCLFrsUsovgBPL2eiFyIqsmjZV+vGEHl3/c3giTnwJyivZc
 1kUug3HpHJBLiAW4H3Omvg0DjWkXnQDeOGf5ImqqvF7vTgH27KqTlvit8K4ZgH5bRedm
 jl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bq5hRh6dg9CMA08TsyveabYMk5mqrcCNLEtAUVdySnw=;
 b=LKsHqPSeMYJkVxyUy58IrjbQ2j2ZQffcUf28q81Ep+ks3eZBtLA3k5MAEdPSQzeLfX
 20cxlq8rO7MxASdhULecRo9m9roQRMKfnbIJOe5M+dnM+a25tkoaZxMOxIDg14fWbRfs
 Zn04I1yajZ9ADwtcEvQOLyMhddIYtKuq4DXW4J66VwOdXyCNNf3n+IiwZxjKkyzRscmn
 7aFH/Xx9x+Qn6pED1z6SKIQMOFs5QnZSr9pvWdxbo5ZcDnLBmFZAkNTY4H32kkIGhi4f
 l/iZCYI2KkbuXQZXU8aawND217SKqE5XAlT9pMvZSIePJPHaOqZOG6nB78VpuNRCX+c1
 wZqQ==
X-Gm-Message-State: AOAM533qokV4bMMMQdgCJYh0+jVROR1FRXPJ+MBLYDIEaNDqMdse0EO8
 BkhYaLrT5OhSODOQ3jjm0Gn0BAkk5wR+wdGJEPo=
X-Google-Smtp-Source: ABdhPJyfe2oCjJZx3F1PpVwy8oM7f8wrIEpDwj0rmv3wnnbE2x01swwhENf8HW/Y5/48gXRk7Fq6pyaNCGKpuT2dGTw=
X-Received: by 2002:adf:edca:: with SMTP id v10mr3893592wro.124.1598293540053; 
 Mon, 24 Aug 2020 11:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200824163751.606577-1-sashal@kernel.org>
 <20200824163751.606577-35-sashal@kernel.org>
In-Reply-To: <20200824163751.606577-35-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 14:25:29 -0400
Message-ID: <CADnq5_OouGpkpOeW+6=vhLOba-jWDDw_TDuzcTzKtcJ1T0U=yw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 35/38] Revert "drm/amdgpu: disable gfxoff for
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

On Mon, Aug 24, 2020 at 12:38 PM Sasha Levin <sashal@kernel.org> wrote:
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

Support for this chip does not exist in 5.4 or any other older trees.
Please drop this.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 3a5b4efa7a5e6..64d96eb0a2337 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -617,9 +617,6 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
>         case CHIP_NAVI10:
>                 adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
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
