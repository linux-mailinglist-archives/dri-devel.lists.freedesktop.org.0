Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6F41DFFF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A756EC2E;
	Thu, 30 Sep 2021 17:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDFF6EC16;
 Thu, 30 Sep 2021 17:18:56 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 e66-20020a9d2ac8000000b0054da8bdf2aeso6019790otb.12; 
 Thu, 30 Sep 2021 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0AEwdvslYHUXs1dqzetG2U/icJ2B0o3I7Pc5jNQMpJk=;
 b=Z6NVRoXyvyBymM0wfTEIbRdKEFzPE3zEoQfQzXBE1Sa3C8tcMvesMOL73y29kgY8ux
 Q0tX6Lx8bD/XPIbppY9xCiNQcnwITqaA+VP8kH7xmzG2yPhsVXAC/9llUIr8trDN2aZG
 1q6NoEoZAyr2unmZZGnkm4YCz4bvoALVAdfJtgsRBXbF3Y7AYtM8sfJRcFJ9rrwat2XF
 F6F55z2CU+T+id9GUYKLdeaa6t/Vqwcg8EnOYf1/MpnpWeK0Nm5Y3mVS3n1RT+h60prQ
 n9GfgfylrpmQoLhGkylpedNBAWT3rDQOqo1fLNYm49NAxy91YgXG3LneBVGQXjWluEjG
 NKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0AEwdvslYHUXs1dqzetG2U/icJ2B0o3I7Pc5jNQMpJk=;
 b=x/VlkuJnhfxtDGVlEnAkIFUucEtwxAgwG+eprynhV73vHB7yUd/oFKMNC0yEHwWFkc
 wcrlqmnyb3jZSc5mJ/xow87/u1k8e7CtUqTGST9GotKRPzyIIupamA2F15jzKrCTZ0eb
 mgt1mtlVOGW8wF0/jKAIBPKM73h4xO+nzTciBH4cr3BeQEeLpA4HWcQi87MWWoUS9H6L
 JuYeOEQfECofcsFlCDLySD9XJM/ps4GCbAG4c1tsQJdHFUXhaAfF8Tw16Z+1nGp9HguF
 IeCU0TaV2irCTYyYivMFMts+MO363/sKP+u00jv5EaKUzMczeUNp0zlvXyblI11DC0hT
 oC1Q==
X-Gm-Message-State: AOAM533CIR/ZUn0VhTw5lZCqDcbujYaAuHtU0uddcga+J/V3BB980VFU
 ZVro+atZSM0pPDl7L8HdFWNcxfprwVF1FpzqlQ8=
X-Google-Smtp-Source: ABdhPJwZ+f3/GZr7/EhQcpADsCHcDrnSO+IWU2DxU0XdnmmE+Gn2F4P1HkTjRXY64eJeiizqhK+U7IZvCsBBAiYV2JQ=
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr6263825otd.200.1633022335866; 
 Thu, 30 Sep 2021 10:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210930161641.2333583-1-nathan@kernel.org>
In-Reply-To: <20210930161641.2333583-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Sep 2021 13:18:44 -0400
Message-ID: <CADnq5_PS3T6GpqL0zi6ct+QFFzutPJEuTy638O=-ik=LETKMYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Initialize remove_mpcc in dcn201_update_mpcc()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Sep 30, 2021 at 12:16 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:505:6: error: variable 'remove_mpcc' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         if (mpc->funcs->get_mpcc_for_dpp_from_secondary)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:509:6: note: uninitialized use occurs here
>         if (remove_mpcc != NULL && mpc->funcs->remove_mpcc_from_secondary)
>             ^~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:505:2: note: remove the 'if' if its condition is always true
>         if (mpc->funcs->get_mpcc_for_dpp_from_secondary)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:442:26: note: initialize the variable 'remove_mpcc' to silence this warning
>         struct mpcc *remove_mpcc;
>                                 ^
>                                  = NULL
> 1 error generated.
>
> The code already handles remove_mpcc being NULL just fine so initialize
> it to NULL at the beginning of the function so it is never used
> uninitialized.
>
> Fixes: ff7e396f822f ("drm/amd/display: add cyan_skillfish display support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1469
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> index ceaaeeb8f2de..cfd09b3f705e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> @@ -439,7 +439,7 @@ void dcn201_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
>         bool per_pixel_alpha = pipe_ctx->plane_state->per_pixel_alpha && pipe_ctx->bottom_pipe;
>         int mpcc_id, dpp_id;
>         struct mpcc *new_mpcc;
> -       struct mpcc *remove_mpcc;
> +       struct mpcc *remove_mpcc = NULL;
>         struct mpc *mpc = dc->res_pool->mpc;
>         struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
>
>
> base-commit: 30fc33064c846df29888c3c61e30a064aad3a342
> --
> 2.33.0.591.gddb1055343
>
