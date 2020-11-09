Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023062AC555
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4B1892BE;
	Mon,  9 Nov 2020 19:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F47892BE;
 Mon,  9 Nov 2020 19:48:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so644846wme.1;
 Mon, 09 Nov 2020 11:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3WLOB+DsIhONnbyWJDNWa6PF7p/j2odAKBqntDd2Dp8=;
 b=pK6s3U8rxkkI9GRUcNoYaW3rN/BVR3BCnxKwl0+MbtErM99Zio2pDgH0Ys6GGuT75u
 MGpvs/yX5Ph9khll6CptPTNr/XxaRmYvzKNbVSsgaxzNYHUwrpupY8CbzylKGsO0/7Pd
 9jqF/xAgOoYl6W3Ve/NqMnFcKXMfCRSbp/p3A/Jk2xBD+b7TvufHKLW9s+jaDAQEecsj
 yIlIPGRku43sjxftFcrjRIfmNGNRJ0FOspJoSmOVB/hxSIVZv5Opbu23c6IpwdGid/dg
 4F3qi5KSXPCiqsG84G8djs1IZTjNBHj9SUQ/6KLVT0Czu1TLJryXaI+y4KDf0uSxoaVm
 /2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WLOB+DsIhONnbyWJDNWa6PF7p/j2odAKBqntDd2Dp8=;
 b=mXLoJmEFjW9t5y2MG1X22dWC46UJE9kJDoKZxs69uyWTF1XI9nK9FvlApOb6kQyjFm
 yLPuW0pxMqCpmNhArh0iORcorePSRV4OQEf9BigILrgf6r0wSayGY+jc6OMOF9Hgf94l
 LK6I2v9rnkKYO2/pSOkkGuir+FcHiQdQ46jHOENeP9/x4OAcowk9Gb5lJJjkU0LCa+cP
 k4vsRr0DM97SXbs1KPIxSGpC3XDRJYe2EICKsUcpXSR+GrlGUMBclvVh0PjJufD2e2A/
 SxUzszmlea3dMFCSYxtksg17cka+uabp3N4jG5Jmv2Sseb7NbWqcjxJsuAPUbj9E5zj3
 sBAg==
X-Gm-Message-State: AOAM532BNAg+HMHAjiq5yxt+1KGIdCvXIhbBa3bEij+uf+fQFY1LX8qs
 L3GsJEiBVTZwQJ55DSTsPl/aFaLppWLIofPl/D4=
X-Google-Smtp-Source: ABdhPJyKHv/hmDBOb9KR8vgX4EYpgNR+v0BD8Y47n9XpurORBE4ESC/uFvjcz4SC0hsXS9txtw0C628iOkCL9RwhChA=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr795848wmd.73.1604951285618; 
 Mon, 09 Nov 2020 11:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20201109083824.14664-1-unixbhaskar@gmail.com>
In-Reply-To: <20201109083824.14664-1-unixbhaskar@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2020 14:47:54 -0500
Message-ID: <CADnq5_N3vCB4yBdwozt-04f5LLRVPk_SNm0s=z+u_Rf-C7S0gQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: amdgpu: amdgpu_display.c: Fix a spelling
 doens\'t to doesn\'t
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Jean Delvare <jdelvare@suse.de>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 9, 2020 at 3:52 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> s/doens't/doesn't/p
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 7cc7af2a6822..a92cb137293a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -512,7 +512,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>          * to avoid hang caused by placement of scanout BO in GTT on certain
>          * APUs. So force the BO placement to VRAM in case this architecture
>          * will not allow USWC mappings.
> -        * Also, don't allow GTT domain if the BO doens't have USWC falg set.
> +        * Also, don't allow GTT domain if the BO doesn't have USWC falg set.

Applied. Care to send a patch to also fix the spelling of "flag"?

Thanks,

Alex


>          */
>         if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
>             amdgpu_bo_support_uswc(bo_flags) &&
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
