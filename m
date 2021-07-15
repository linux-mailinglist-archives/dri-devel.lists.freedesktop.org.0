Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C943CA1D0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 18:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC68B6E87C;
	Thu, 15 Jul 2021 16:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88126E880;
 Thu, 15 Jul 2021 16:04:26 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 v32-20020a0568300920b02904b90fde9029so6674483ott.7; 
 Thu, 15 Jul 2021 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pDgo4aZEEERbVkoaBcaAe2QHHX9WVxAXJi1OtCjtkTM=;
 b=YqCnUt7Dm2F4+/3Rb71Adj77P9AGyQtomoFeo1/XCi/Fm5LB6jzB/pYpJUaAHoPxes
 jcDgGYADmp4xBu2KQGrQlNslohr/NFj1U3q+KruDrAfGGOjtF+XJKR0NdT+hDS0yjMxO
 ePw3zpXowf/yp63GDp2P3AYAJXfXCqP5lkpuytglp/wMRKEdjpeSkgb46tDhwwY1MgcF
 HSLzU3TdpuO7ANbm9fiNbBsJv5dVIzVx5a7a70P5sd0J0DMOdF7Y6n7Vzb1TUKBt/iFh
 nN1AM2F3Ljd8sfIQCYJEDNK0hoK07iaREQEDYRl/4Vr5jJa9bAP6vHb0qCwBp9gJ/0f/
 Ebyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pDgo4aZEEERbVkoaBcaAe2QHHX9WVxAXJi1OtCjtkTM=;
 b=ChmwyXVGMl7WMge9idTXYqqgYFe4hU6DrReBp0asPOYS9S/JBD0+ttI8RtNSAhiLDy
 vPTkRhaH3Mp74TVoBE2XElTNioaWhLkW6MDcT4hqGLNorrHgK+VjU41jjE5+3l5WDDZD
 9Y94BVtqlF0Steupoa1awzqYrIv7fMBc3sGR64xmkppBmpDlUcqhv0rBPqc1U2OUbIw0
 JgzdOdtIt+nFX74A/SU1H65EuobO4hkiQgZ+qEvCMSgilu9a8pHSlcxvsXB/id3rYYQS
 qiZ/HEo5sKWmy2Za9hp8aSwKmVpybmFA7j5e78M9CwyJqYeRKDbt3OISnZVb1JEftA9w
 FgBQ==
X-Gm-Message-State: AOAM531h7mdg/0+4KscW8GbzzRT1GllMN7y/GDPrVJKYzZX9MFWKQLi3
 hb5ffiKAv+kV/dwzFb3vVRKGsOoei5q+qP47iVqWXCAl
X-Google-Smtp-Source: ABdhPJytpHPsR7Psh+/kvUqKqvdOAb+qm1HyOVCZ8FzhnBWZ9JWAfapoFgqqNcWF62mrNZTJ0whN3cjvEj8Au3UfNSQ=
X-Received: by 2002:a05:6830:14cd:: with SMTP id
 t13mr4401878otq.23.1626365066132; 
 Thu, 15 Jul 2021 09:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210715143740.28403-1-colin.king@canonical.com>
In-Reply-To: <20210715143740.28403-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jul 2021 12:04:14 -0400
Message-ID: <CADnq5_NHEksy0hfBaFWEPO8Dz3gMJgojqk5R8sSN_+7aVSht7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: make a const array common_rates
 static, makes object smaller
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 10:37 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the const array common_rates on the stack but instead it
> static. Makes the object code smaller by 80 bytes:
>
> Before:
>    text    data     bss     dec     hex filename
>  268019   98322     256  366597   59805 ../display/amdgpu_dm/amdgpu_dm.o
>
> After:
>    text    data     bss     dec     hex filename
>  267843   98418     256  366517   597b5 ../display/amdgpu_dm/amdgpu_dm.o
>
> Reduction of 80 bytes
>
> (gcc version 10.3.0)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2d48bb09645f..b196bb6eafc0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7580,8 +7580,10 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
>          * 60       - Commonly used
>          * 48,72,96 - Multiples of 24
>          */
> -       const uint32_t common_rates[] = { 23976, 24000, 25000, 29970, 30000,
> -                                        48000, 50000, 60000, 72000, 96000 };
> +       static const uint32_t common_rates[] = {
> +               23976, 24000, 25000, 29970, 30000,
> +               48000, 50000, 60000, 72000, 96000
> +       };
>
>         /*
>          * Find mode with highest refresh rate with the same resolution
> --
> 2.31.1
>
