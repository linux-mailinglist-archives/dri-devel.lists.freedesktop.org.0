Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E844F5EF8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FDF10E0AC;
	Wed,  6 Apr 2022 13:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BE810E0AC;
 Wed,  6 Apr 2022 13:20:01 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id v75so2360727oie.1;
 Wed, 06 Apr 2022 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nR+sDilSKYVfN9qDJ/g98wvIu+WPZhJinVPgYGsVVDE=;
 b=iprevJ6Fyj+Zg9sDtMftRf78BwUL9DqO4cEkI/ScLzlTDexBgwMjru/ra3o0B7l1gu
 OJ20vYFsppHRlvKzZC28kzKR1hMyQwEsq9luV9cffZWeNE3vD+xf2WJv0Ca0dXadfQlj
 953oj+T6OUBOFGr+ot77RkmEcJoYJLsVMzPoMCP3RjNP7dekojnm6Fk8nu37iGq0duT8
 e08lmohwbasaykFFyW0Y/V5gQmgMHRDYdkmMKNwiglGCPR+86ugUxeRMo0SxI3b4z3Wx
 D+4wb3YcZzZLkr6ytY77qTmzkcgBjeoIIkpuRsjLV7h5+4hL294JmkK+1N9vxQ5eNgOf
 joTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nR+sDilSKYVfN9qDJ/g98wvIu+WPZhJinVPgYGsVVDE=;
 b=KmfXrJejKEXxGif0vCABFX7tcYL45Hk/pb5qeeR9ntshdqdss8gD+60m49zJXZXwFP
 03dOgykzaAxPtQrP+m4zYLPSRKx8X9Ypwyi9cPQD3d3lMA0xW8nNqGLTsjmm2pggCVll
 cn7JSxycQtXFeRz5ZxoNKpdO5koc4r3rN6L5XddgGKtoKFg+le5vVEWQVo7nD7o6VkVd
 I0api6tCTOKo2ly2LXStwXx4fJ/PZmrNx2D4y7Le34uQaGzlDZC9MYhxiGzQKuQb1Ak6
 do/WuxQgRnOWmyFinhwFcNhGF3TbCo67BMAnJZT6chyET8q1RPiD640FcogzhALH+bpm
 vyvA==
X-Gm-Message-State: AOAM533Scghc0Gm5HErwSC4cufsnuiY5MYRNE4Qm2jhOuBweEqazRiUt
 0+cfQ0sHQAb6zVpQfXR7oGkQVxEB/fyfpJZAILk=
X-Google-Smtp-Source: ABdhPJxyBFYsPElegdy6BaOXxjV6Kp33EHLXtBFktwHpS2gGqYGmZq94oWBFPsv+aCywyMrwUMjhsjcBBwjHvTN7c2g=
X-Received: by 2002:aca:d04:0:b0:2ef:8b45:d235 with SMTP id
 4-20020aca0d04000000b002ef8b45d235mr3630825oin.253.1649251200316; Wed, 06 Apr
 2022 06:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220405213800.90205-1-h0tc0d3@gmail.com>
In-Reply-To: <20220405213800.90205-1-h0tc0d3@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Apr 2022 09:19:49 -0400
Message-ID: <CADnq5_PXDyOXX2p4FswWWyY6sw8nXmajhUzx-=ke+6jiZn3ZPA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Unnecessary code in gfx_v7_0.c
To: Grigory Vasilyev <h0tc0d3@gmail.com>
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 6, 2022 at 4:00 AM Grigory Vasilyev <h0tc0d3@gmail.com> wrote:
>
> The code is useless and doesn't change the value.
>
> (0 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT) = 0
> gb_addr_config | 0 = gb_addr_config
>
> Perhaps there could be 1 instead of 0, but this does not correspond with
> the logic of the switch.

It doesn't do anything, but it helps the developer to understand how
the driver state maps to hardware state.

Alex

>
> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> index 1cb5db17d2b9..5ed84a6467ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -4409,16 +4409,14 @@ static void gfx_v7_0_gpu_early_init(struct amdgpu_device *adev)
>         /* fix up row size */
>         gb_addr_config &= ~GB_ADDR_CONFIG__ROW_SIZE_MASK;
>         switch (adev->gfx.config.mem_row_size_in_kb) {
> -       case 1:
> -       default:
> -               gb_addr_config |= (0 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT);
> -               break;
>         case 2:
>                 gb_addr_config |= (1 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT);
>                 break;
>         case 4:
>                 gb_addr_config |= (2 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT);
>                 break;
> +       default:
> +               break;
>         }
>         adev->gfx.config.gb_addr_config = gb_addr_config;
>  }
> --
> 2.35.1
>
