Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBA14BA5F2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FFC10E37A;
	Thu, 17 Feb 2022 16:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6C610E2B3;
 Thu, 17 Feb 2022 16:31:42 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id i5so189068oih.1;
 Thu, 17 Feb 2022 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bElm5YilB/9jblKEU64fD/ESvy8c+wLEV4cgX1XhWn4=;
 b=Eq1tUKgqg59a4QA5ulUqAVWGJmM7UV+1lWzQXL+zegdCS5/d4qsDlC5deH1OCwWstU
 +C+uqqiZW2o3xKjbO23EnJl0d5uDvEe0lBrIH9PC5UwZ/u7Ts/hHBW7kzkx3yt4hxJ2M
 rw3a0q7ng+L5mm+KXKUAhVfwJoa1z3hmwUV7t8JtlBRa9fIOEL68OVNeV4kmYlgnkITW
 EO5lyysg+u3N2lBo8T8NUN78/kNWlDRnW35krNMGCsbBxLBuhxTgjQcvYJZ0rVp2HesJ
 QStSRNSpghG4F6RXqxSrxcLIbzpF0KewldPbmspmkxAT1On4cwLlW2PHhXBBIHEFLBVn
 5PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bElm5YilB/9jblKEU64fD/ESvy8c+wLEV4cgX1XhWn4=;
 b=NSs0h8lpBOKIFKHVnou/qq4KbWvKLLmfY9DqxldrWflzdtgk0Nf5Ds61HGuD8my949
 WPX5SgBhJm6DaBN3QFrQSMDCAofpqYRts4KC412wxonn5sjhLdrhFWj0F8Xw+imH0qkB
 bweoBfFb9kli8O1cex5Q5IPVSB/pXdyjYR//N6NSiULK3ODRAddg96nCXBR37nihLPaI
 eK6bdKg9E89UakF5rEsYuxZ9nZMvvKH6BVrOnl2v+ZQGthzqA9AtozpyAmp55izPtita
 ys9GTpv/H09YT/dxTLUIJCP6Q3Z3i55eztxkYpORy1xUt5thEe/CgQURucqy3RcVYlLX
 QqLA==
X-Gm-Message-State: AOAM532sGojdg++FyNIg8vxUOJdGYpLGhG3GjJOo5cdH6aPpKe2jaj7m
 Y8lf1PZsnPwkJVn8BWRR1lKJeXqWL83YLJQUNBs=
X-Google-Smtp-Source: ABdhPJx6a+RRNxIK4nxCa4AWmBuTIaxNxYd6UitmMWxs/iXH4phTUwHGWoWwQkdU27X2KXRi4tD18lfFTVADnZA347A=
X-Received: by 2002:a05:6808:f8b:b0:2ce:6ee7:2c99 with SMTP id
 o11-20020a0568080f8b00b002ce6ee72c99mr3205163oiw.199.1645115501464; Thu, 17
 Feb 2022 08:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20220217162142.1828990-1-nathan@kernel.org>
In-Reply-To: <20220217162142.1828990-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 11:31:30 -0500
Message-ID: <CADnq5_PmT3aWqGR7fAYxAvgAv7875kGjKo5tAQyGKeYuRrvAZg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Use proper enum in pm_unmap_queues_v9()
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: llvm@lists.linux.dev, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jonathan Kim <jonathan.kim@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 11:22 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.c:267:3:
>   error: implicit conversion from enumeration type 'enum
>   mes_map_queues_extended_engine_sel_enum' to different enumeration type
>   'enum mes_unmap_queues_extended_engine_sel_enum'
>   [-Werror,-Wenum-conversion]
>                   extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
>
> Use 'extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel' to eliminate
> the warning, which is the same numeric value of the proper type.
>
> Fixes: 009e9a158505 ("drm/amdkfd: navi2x requires extended engines to map and unmap sdma queues")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1596
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 806a03566a24..18250845a989 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -264,7 +264,7 @@ static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
>                                         sizeof(struct pm4_mes_unmap_queues));
>
>         packet->bitfields2.extended_engine_sel = pm_use_ext_eng(pm->dqm->dev) ?
> -               extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
> +               extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel :
>                 extended_engine_sel__mes_unmap_queues__legacy_engine_sel;
>
>         packet->bitfields2.engine_sel =
>
> base-commit: 3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
> --
> 2.35.1
>
