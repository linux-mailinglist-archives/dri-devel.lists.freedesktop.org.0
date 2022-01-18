Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A2492F67
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 21:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6DE89FF6;
	Tue, 18 Jan 2022 20:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E715889FF6;
 Tue, 18 Jan 2022 20:31:37 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 v10-20020a4a244a000000b002ddfb22ab49so103154oov.0; 
 Tue, 18 Jan 2022 12:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lS3GFrM29kfkWwvPWQIw4Pk6eycOPGCpsobayljmZkw=;
 b=V9sBl3RXniA+oUbr5FnqqjPErpemmaL+yQmC7+wieMHA1rxEIMHEQP4+Yptu/ZLS1i
 PEb6tz7rCo33HvMdh7OcQja7l54gxG1OQkx/I16eDZl2rqjp/r94C6LWg44v2DfNBmtA
 0EaLrgcMP1wz+isVMSFmc+gYMUFLz4Pj9ARee4dTHPwiZhYkLt4phILDKcaG73lFo/sV
 ENoGra2xi3AHouWAArmOgW0QlglmwS1brr0rku2pyW+BtwB6bf2NvKuSwW6sy1MJs+Yy
 Dyy4HsBshi0av2Ut3fHrmL5RkRBuZ6T6l2slmxtTrIrHNPK5llCW0hUK4jh6ZHcrqwbg
 KtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lS3GFrM29kfkWwvPWQIw4Pk6eycOPGCpsobayljmZkw=;
 b=Osl/qBv77MRXDCZzc/ROxp1vQXc4nlaZol0znT7GmkOHrQaShYvkynOSGoOrUiWt46
 5W72aYZbHxNy6KbQ9FjNV6PfgRAWNHOLOA4nU8TANunnslGlYfUfvPlGqv6reIwBEXTf
 7z447INli98E4FxUMEdUl3tFWb1Fxl+9X3PgN+VV38qx1oqNR9Dvwt2nxN3qTxSlu8mM
 afOOI/sFbggHDMgKwVXUEeEHBNwbGWqQqCm+XQwJjTU7AsZfALDzclttAMvJqr4M4iIC
 cK7nplAacJrjATzGcuAlGwenEjxTiLZ1CgdLo/FCduqq28ihtw3kYkDekNJhcto6Umex
 58Dw==
X-Gm-Message-State: AOAM530I8GqEzKAaCgQUABJrOfPQFpyQEXbdOktntEvqLDhf3tPg76Nl
 AXtvl9RyMOacvjt1bHN8mk+9sf71UKT5efo+goE=
X-Google-Smtp-Source: ABdhPJwC6J2yTtkomxVb1nBmVSS2A70Zz3uGg1xsukouvEGbNDpuyzjryP5ofkkY9baDzG+BHEx+p8BzBJelYa2CRdA=
X-Received: by 2002:a4a:3412:: with SMTP id b18mr19430884ooa.23.1642537897267; 
 Tue, 18 Jan 2022 12:31:37 -0800 (PST)
MIME-Version: 1.0
References: <20220118075702.925929-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220118075702.925929-1-chi.minghao@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jan 2022 15:31:26 -0500
Message-ID: <CADnq5_OeWEJq7Re-usY=m8vThD2jLyXObL6Cn_k3mZweFW_+Pg@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/amdgpu_psp: remove unneeded ret variable
To: CGEL <cgel.zte@gmail.com>
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
Cc: xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, John Clements <john.clements@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>, "Lazar, Lijo" <lijo.lazar@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, "Kim,
 Jonathan" <jonathan.kim@amd.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Li,
 Candice" <candice.li@amd.com>, Lang Yu <lang.yu@amd.com>,
 Zeal Robot <zealci@zte.com.cn>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Jan 18, 2022 at 2:57 AM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Return value from amdgpu_bo_create_kernel() directly instead
> of taking this in another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index dee17a0e1187..ac2b87f81ef9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -914,19 +914,15 @@ static void psp_prep_ta_load_cmd_buf(struct psp_gfx_cmd_resp *cmd,
>  static int psp_ta_init_shared_buf(struct psp_context *psp,
>                                   struct ta_mem_context *mem_ctx)
>  {
> -       int ret;
> -
>         /*
>         * Allocate 16k memory aligned to 4k from Frame Buffer (local
>         * physical) for ta to host memory
>         */
> -       ret = amdgpu_bo_create_kernel(psp->adev, mem_ctx->shared_mem_size,
> +       return amdgpu_bo_create_kernel(psp->adev, mem_ctx->shared_mem_size,
>                                       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM,
>                                       &mem_ctx->shared_bo,
>                                       &mem_ctx->shared_mc_addr,
>                                       &mem_ctx->shared_buf);
> -
> -       return ret;
>  }
>
>  static void psp_ta_free_shared_buf(struct ta_mem_context *mem_ctx)
> --
> 2.25.1
>
