Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFF051AE96
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 21:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF90B10E353;
	Wed,  4 May 2022 19:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE9010E1AE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 19:59:14 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so1601289otu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 12:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIbIARx8crNnk+PFkaYggGWFPiyJL1LyCwzj00jstCs=;
 b=NrHz/ITZ3FoxyvVfqd9g68Cf7G/VGjfY/GOxvNxHCFqA+RHVdPv6lle8m3UKyWYEkP
 hYRjUpQaNuEhBAS9IkZ56Wt8dvA8Qepy/JaB9L7NzzAMgo15grMS6h7usxWf1Kx/oun3
 Cenk1+CfrHqGXm2BUy/mt1gDi/Eh88MsMSoEP63EcpspZjSNLCfk28HWNv/kRSOyBEkG
 rK5bawkwYPoZpx1XGjH+tL2uH0SXmabBFRq2i3JNOfweCCRgzQOdzaIWzNmCFCtzDkAg
 h+N6ODH0dK7owgCQw6P6w2cZzPsPXYv7vCWiA1qg7UMeNH66oXcn9wj+/IoSDi9QkMp2
 PRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIbIARx8crNnk+PFkaYggGWFPiyJL1LyCwzj00jstCs=;
 b=sYoIBGg3R8QVwtXsi6GTS2lONfwQF0wzDJHz0ygjs/eBt2owV7WThJ7vMJspO0kHyc
 B1+ocW0xoMFJEAZQ0ErScgNeEwCSMyrOa9x/clmigTqbQOLecEE6TYpZXTAwcAF9ql1w
 Z1LrpXRhn5edF+kxt4hXhC5hP6UWLZuUf3fz/4lDUOmvosr0ruCCNfxOR7beHX2zzEzZ
 S2qFR3VF5dhLj/QaRSMOCNZRZJ3mRg6dlQQx4yji56eGjP28/cZmfTM6N9rp2ZXNwhds
 zRan1myACPrhAB4sqQFLZgrw3MbQ1kgHkG1QGCC4IXzGt6qsi0q5cRWT+GqAmoukoHuo
 XQog==
X-Gm-Message-State: AOAM530I6ua9vgGF62avGM9eZy1sh+qe/jzk9AxriOgfL9G1Ly2QbbCa
 /jx6ePND+UdH5ZvjAOxkCFOMhuy8f6Msa26JE1ymMw20
X-Google-Smtp-Source: ABdhPJzSkySajjFh9Zvdsmtyy2Q+hYxzDlsTEgzPFiJufw99I47PAa5uQqSk6Gw8gIkq5coPqqIh4SPQ18d35fxotyo=
X-Received: by 2002:a9d:6543:0:b0:605:e789:271e with SMTP id
 q3-20020a9d6543000000b00605e789271emr8117223otl.200.1651694354108; Wed, 04
 May 2022 12:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220504165009.82557-1-mike@fireburn.co.uk>
 <20220504165009.82557-4-mike@fireburn.co.uk>
In-Reply-To: <20220504165009.82557-4-mike@fireburn.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 May 2022 15:59:03 -0400
Message-ID: <CADnq5_NavzveMzvJ+nB-xoi79Dep8LBpodPF3jxbEsv7GG_hQA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu/gfx11: Add missing break
To: Mike Lothian <mike@fireburn.co.uk>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied patch 3.  Thanks!

Alex

On Wed, May 4, 2022 at 12:50 PM Mike Lothian <mike@fireburn.co.uk> wrote:
>
> This stops clang complaining:
>
> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5895:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>         default:
>         ^
> drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5895:2: note: insert 'break;' to avoid fall-through
>         default:
>         ^
>         break;
>
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index b6fc39edc862..e26f97f77db6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -5892,6 +5892,7 @@ static int gfx_v11_0_set_priv_inst_fault_state(struct amdgpu_device *adev,
>                 WREG32_FIELD15_PREREG(GC, 0, CP_INT_CNTL_RING0,
>                                PRIV_INSTR_INT_ENABLE,
>                                state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
> +               break;
>         default:
>                 break;
>         }
> --
> 2.35.1
>
