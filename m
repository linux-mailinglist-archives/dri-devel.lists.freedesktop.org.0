Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE82E9B65
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 17:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE05589F5B;
	Mon,  4 Jan 2021 16:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F96989F31;
 Mon,  4 Jan 2021 16:57:20 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id a109so26631321otc.1;
 Mon, 04 Jan 2021 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKEArRiiv4Ret2Vl8aYzxA3JjlQ/SwUjodFVGcOwjxY=;
 b=CfOtvy5GR6roeZraK4hUCRcs78Pqc6a6+Qb2k+R/XICklbDRaQ8t3PYvZZPiPsogA0
 MozS26/E53V6DpkZaGBnQgVWjCkNuwXkMDs4VtN8ib01l5p/QJ5YRomxQ+P696ueGUCA
 tyug3r1QGKMKKnmeHt9RU/bmHBm9kXNEry3L0o3wFw32Ho2Gh38/N9cwOj9C+p7+mwYA
 wv65f97bZPcmCZJMOA2A6QEkGjzp3DS0vxKkN5R5ybCZKOfwpbAkdky1P0+PN+KzRt4m
 GN7k3ehjaof5z1P6IyC0stRiGjdxHAYgMgd77WiN36oWU/XkdCFFr5jrQnqWMP+fNws8
 zCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKEArRiiv4Ret2Vl8aYzxA3JjlQ/SwUjodFVGcOwjxY=;
 b=kstE8N2TeUDI/mOrvFMDoy4IRunfytg/vsSbLoCCRGaRWOhvUTrfosX5nVa5fdQoSS
 KRq6eWtA2Fi6ZCJMXMI77xncUPnZMA8yR+A4iZO5jWn1zT27qYWEf2yC7T/a5oZtxuDN
 catSaBipiN+pGc1RQ5Ev6iFQHcVsd+o2/DmD+hDGHGzNvNVcZ5PsuDjry4+UuYrUyaDc
 LwZe0wX3GNHlbuy4IzTs4ECrJ5qfJZZcFOCN6ARH6MtPaV1y+prSevEYEfGcWZeCuCqo
 5JTjFjJXfEMBjHv7ZDNww9P4S/FFMT7CMyCtOsKfnQQclFbbEDMmuL8TvW+Ell2q37DT
 YleA==
X-Gm-Message-State: AOAM533Fz8yrEBwMhZeMrdwjFAkmj23rR94uNsKOzXeTmZSLYbDCpCRH
 TAUgyrUjakX+DNbDxQqS/4/TsQLUfgxYICNvazBdm8h5
X-Google-Smtp-Source: ABdhPJw10Ti4/rXP8qMVO17Tv7tSyQcVeS16UkbwdDvCTKkjR9qOFdQfLteIFJ6FhruLkHrs5h5B7Z/+BLGpVIjpQe0=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr54791181ote.132.1609779439914; 
 Mon, 04 Jan 2021 08:57:19 -0800 (PST)
MIME-Version: 1.0
References: <1608549395-30993-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1608549395-30993-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Jan 2021 11:57:09 -0500
Message-ID: <CADnq5_OyM4D6GMyVetuBQidgTP2g11MtVL2+8JWMQAsDK6OOkg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove useless else if
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Joshua Aberback <Joshua.Aberback@amd.com>, Ashley.Thomas2@amd.com,
 Chris Park <Chris.Park@amd.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jing.Zhou@amd.com, Dave Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 9:40 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Fix the following coccinelle report:
> drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c:1357:6-8:
> WARNING: possible condition with no effect (if == else)
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> index 808c4dc..504f2a4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> @@ -1354,8 +1354,6 @@ static bool dcn302_resource_construct(
>
>         if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
>                 dc->debug = debug_defaults_drv;
> -       else if (dc->ctx->dce_environment == DCE_ENV_FPGA_MAXIMUS)
> -               dc->debug = debug_defaults_diags;
>         else
>                 dc->debug = debug_defaults_diags;
>
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
