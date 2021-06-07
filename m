Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D739E50D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2E96E95B;
	Mon,  7 Jun 2021 17:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD67E6E959;
 Mon,  7 Jun 2021 17:14:35 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 d27-20020a4a3c1b0000b029024983ef66dbso1523607ooa.3; 
 Mon, 07 Jun 2021 10:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/dN2t+25j0me0dqCGourrl5uxnoeiK8B9YLt2YtSFhI=;
 b=oc2PqVHyYMlZw4hOPvYw5HlnHSiCMzNsJz8q3hg88et9M4aNH0ut2LT3sQXK1SSia5
 PNyW+cPfH/+wxZMxyzo5v8VDwW12iGXbnGFgKbJkq6QlQgk4ZLLrndesTHBNRN6re3Z/
 an4DWRG1ySXlS7UBuNzXzHI91u6aGBc+uq7+6PjoODBbiDkdnvcYv1zS83CbCagXw1du
 juLzp4zWcUsnBrRiEuxD4o5eZm8fpacL0stHEJrdHHF9fNslx7nB+1MbDGwAbxjlt0Vk
 CYeXpuDVNxJiPMT0sP1RD50TSQxX1jkBei/rjs5bSHBdf+2CIf0oKUiFCm7otqnrdm9U
 zWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/dN2t+25j0me0dqCGourrl5uxnoeiK8B9YLt2YtSFhI=;
 b=AmypTQCUvcASZKb78lLFnnXuyShJLhdopUyMIGSSpXCwDzUB3710PZ461VJ8OBi1wj
 czBgkQ83TvevR+75GjNhWOD4u+RoQj6gCRjhy9w1SDfubrPkzZkFwDg9zuzlzXGY+oyx
 YHyx2a90oLZBaAIu2e+/GWL1qcLqqGC7mX6RMQhjeo4IZttyt2rCGTEMTVeaX6kypDRS
 goU40I7GvgY4SATlyiHW/utyU8wI+7Bj66KwBG1fNJdut6zVKbopTBh1jsRJOXFkIAat
 c7cNeEGr9fDNYt32k69Ho2eaFc+O6LEUjnH13TxaISNdlmN+C72M7H7vqmXZoYx65hmO
 PcAA==
X-Gm-Message-State: AOAM530EtrzIB+LzdrgJqYRXA7flSGXywNO1BW4p6J0g7p+my/lj3xqn
 ziBJppIgEXEkXP9k0CzeDM8oACO87ua3fWpO9rXioHMO
X-Google-Smtp-Source: ABdhPJzy9qq/+5dPLG1VTR3jcNKRWhEs4CUDq5rywX+/7tXl9Mu6ZmbU8cYW1KilNB3jGeF2tDM4EFqq4n35dZ2viZk=
X-Received: by 2002:a4a:8c09:: with SMTP id u9mr13947559ooj.72.1623086075022; 
 Mon, 07 Jun 2021 10:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210605123137.8800-1-bernard@vivo.com>
In-Reply-To: <20210605123137.8800-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Jun 2021 13:14:24 -0400
Message-ID: <CADnq5_Px95C7Zosa4ADkBkmDXvPCkz=Hhns1twtixCMAx4y_dA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove no need variable
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, Solomon Chiu <solomon.chiu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Kolesa <daniel@octaforge.org>, "Li,
 Roman" <Roman.Li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 5, 2021 at 8:31 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> remove no need variable, just return the DC_OK
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index f962b905e79e..7daadb6a5233 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -1266,8 +1266,6 @@ static enum dc_status dcn10_validate_global(struct dc *dc, struct dc_state *cont
>
>  static enum dc_status dcn10_patch_unknown_plane_state(struct dc_plane_state *plane_state)
>  {
> -       enum dc_status result = DC_OK;
> -
>         enum surface_pixel_format surf_pix_format = plane_state->format;
>         unsigned int bpp = resource_pixel_format_to_bpp(surf_pix_format);
>
> @@ -1279,7 +1277,7 @@ static enum dc_status dcn10_patch_unknown_plane_state(struct dc_plane_state *pla
>                 swizzle = DC_SW_64KB_S;
>
>         plane_state->tiling_info.gfx9.swizzle = swizzle;
> -       return result;
> +       return DC_OK;
>  }
>
>  struct stream_encoder *dcn10_find_first_free_match_stream_enc_for_link(
> --
> 2.31.0
>
