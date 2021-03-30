Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D960C34E247
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 09:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BFC6E869;
	Tue, 30 Mar 2021 07:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0CE6E869
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 07:37:09 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id d62so3186549vkb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qvQNG7MoGzFYXtjqbLKR5ZoQOrdPV7hI4S5BKtxl8bw=;
 b=nahXU/VwrF+jTQFR+CCKf3XutFZWF7obxaQ+a5TvY7DyhYS/io6s3Hqu4QkG+P3cZu
 9DavIiANAadtBNch0gp/XOeaEilTDmLsuNvh7wv6TVo/vceOflvQ3L+7anNu9X/ESdoF
 FznIaELMTbwDGAPIWKviAmXADPy1IbvrBe5Ky84cxdgXYkeUeAlh2n++QkYX+JOmNpFs
 G+gYEehpX9Jo6B+O/P8A0hafjp7pJnRvOPJAcnM31HabFw02KwVy7vz0yILtCNSqiWKw
 JRxkicbHOPJF0eiqWYrlrQF/E6hog8ZJJCDjczScuM3Hq0K5Qqecmo6fCFZQM2e+MmFU
 iBug==
X-Gm-Message-State: AOAM530bj5w91/fsO22qe4eaXAaFe6J+mZ+YmAKF9RYFc/32iUdeEWf4
 jTWVfR40YSued+rW3xSKmBlGNToazeboEEBufvE=
X-Google-Smtp-Source: ABdhPJxPLly45TgC6QKXizIcqd1cjiPQH0CtyhWUI5AhbVx3eCiOGrlDOEM2Bzut8wOVPvzfiO4RoVF21DSV2kwPAw0=
X-Received: by 2002:a1f:e543:: with SMTP id c64mr16591580vkh.2.1617089828934; 
 Tue, 30 Mar 2021 00:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210329131401.15724766@canb.auug.org.au>
In-Reply-To: <20210329131401.15724766@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Mar 2021 09:36:57 +0200
Message-ID: <CAMuHMdXtjy4HDzK2y2+3Fb788=OQAv_OQJaw31FRL0pkjLXb4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Mon, Mar 29, 2021 at 4:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>
> between commits:
>
>   9adb125dde69 ("drm/amdgpu: re-enable suspend phase 2 for S0ix")
>   4021229e32bd ("drm/amdgpu/swsmu: skip gfx cgpg on s0ix suspend")
>   9bb735abcbd8 ("drm/amdgpu: update comments about s0ix suspend/resume")
>
> from Linus' tree and commit:
>
>   e3c1b0712fdb ("drm/amdgpu: Reset the devices in the XGMI hive duirng probe")
>
> from the drm tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 8a5a8ff5d362,0f82c5d21237..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@@ -2743,16 -2712,15 +2720,25 @@@ static int amdgpu_device_ip_suspend_pha
>                         continue;
>                 }
>
>  +              /* skip suspend of gfx and psp for S0ix
>  +               * gfx is in gfxoff state, so on resume it will exit gfxoff just
>  +               * like at runtime. PSP is also part of the always on hardware
>  +               * so no need to suspend it.
>  +               */
>  +              if (adev->in_s0ix &&
>  +                  (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP ||
>  +                   adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GFX))
>  +                      continue;
>  +
> +               /* skip unnecessary suspend if we do not initialize them yet */
> +               if (adev->gmc.xgmi.pending_reset &&
> +                   !(adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_GMC ||
> +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC ||
> +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON ||
> +                     adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH)) {
> +                       adev->ip_blocks[i].status.hw = false;
> +                       continue;
> +               }
>                 /* XXX handle errors */
>                 r = adev->ip_blocks[i].version->funcs->suspend(adev);
>                 /* XXX handle errors */

The above is not what you have in next-20210329?
Your tree has a second copy of the first conflict block after the second:

                /* skip suspend of gfx and psp for S0ix
                [...]
                /* skip unnecessary suspend if we do not initialize them yet */
                [...]
                /* skip suspend of gfx and psp for S0ix

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
