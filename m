Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1A690BE6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 15:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC5F10EB0F;
	Thu,  9 Feb 2023 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD5B10EB0F;
 Thu,  9 Feb 2023 14:35:53 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 20so1789873oix.5;
 Thu, 09 Feb 2023 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sp03I73N+r+twL5ugYnXLYJHbMgUcy+BtwmbrfyskRA=;
 b=pk2zh5SKB0jC3nyw5hEQMgnCtR1FzWaM40IWi6fTOOzWWWDF1KEMm8BKLaF++pBFNP
 LISFddbkBGt9pkiEX0zlHCkysLhP+vszdT3pE68qkI/nihnVTWYwwJpKaxdjhRp2CLoV
 hmRmhAc0oWHyLq4KSG2cYKAsxoZ0DGLJe5wVv8celkMvhfKOpkP1PfJW7PPfB9+9+uP4
 ycFwzTH3d6vQVrraGr7hcY4+ddve3ztW8K/x+lLZoH7QegRjFncz6U8ug2RBt6NR7pOO
 LW8z8m6jay2uXfa1lIrvzXJAaqska39DGFurLQA2fTzT0vtpW77xAXGfdjRQ5yEMVsVK
 udAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sp03I73N+r+twL5ugYnXLYJHbMgUcy+BtwmbrfyskRA=;
 b=aDzK/DwtS5zP7eG/36XVZrySMBBNTUufO8sS0PdhW55djof9XfVBOwDP78VQdcMm/y
 8cIpPPFsO/FNZyjRQSIYIFvhdpLWWlh6GmGldPVL3H80VzdZWET3ipIy+0kIn/WSQeFz
 oIHhcNe7fVsf0paeWlBBel6k+b8MM1A0tpzmhGsWzDq9i/xJrjP30N25QDmkQvJuR3HN
 hKHtWpfYZEyF+f67aRwqvAZLP5OleougEMs2pgOvOZhl+PgeE6Y+UZvMg2wBF7m0BiZB
 D7JLwgVPythaq9yY9MMUNzCggiBLuigHqfBBVUAlUQuRwxNucOeaLKJ1827Zp0DCVhkC
 kzew==
X-Gm-Message-State: AO0yUKVDkg/iou2aEFd9DKmywT5eD1whOZLG7p+v22lOOldwiObNMByz
 KDa6Hg8F5QiW3yWo5XiI7XKXrHOgHlIch6f2Yyo=
X-Google-Smtp-Source: AK7set8WUzFR+9A6rkN9lf35+zMlZ5Ra7EmUoSFmZH1NreHw2xOKi29aBn57YpXN8BAKmHuLuXls8iBeXTO3FjkqpBs=
X-Received: by 2002:aca:c108:0:b0:35b:d93f:cbc4 with SMTP id
 r8-20020acac108000000b0035bd93fcbc4mr575101oif.96.1675953352898; Thu, 09 Feb
 2023 06:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20230209125330.1433481-1-colin.i.king@gmail.com>
In-Reply-To: <20230209125330.1433481-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Feb 2023 09:35:41 -0500
Message-ID: <CADnq5_Pju2QxoR2QEhWf_p9EcKnuF+SkqaKJ7i7adxBktJBBAw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistakes of function
 name in error message
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Feb 9, 2023 at 7:53 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The function name is being reported as dc_link_contruct when it is
> actually dc_link_construct_phy. Fix this by using %s and the __func__
> for the function name.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_factory.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
> index 13a766273755..3fc93fc593fb 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
> @@ -452,7 +452,7 @@ static bool dc_link_construct_phy(struct dc_link *link,
>         link->psr_settings.psr_vtotal_control_support = false;
>         link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
>
> -       DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
> +       DC_LOG_DC("BIOS object table - %s finished successfully.\n", __func__);
>         return true;
>  device_tag_fail:
>         link->link_enc->funcs->destroy(&link->link_enc);
> @@ -469,7 +469,7 @@ static bool dc_link_construct_phy(struct dc_link *link,
>                 link->hpd_gpio = NULL;
>         }
>
> -       DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
> +       DC_LOG_DC("BIOS object table - %s failed.\n", __func__);
>         return false;
>  }
>
> --
> 2.30.2
>
