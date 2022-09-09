Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0A95B410E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A4E10EE60;
	Fri,  9 Sep 2022 20:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C18910EE60;
 Fri,  9 Sep 2022 20:53:31 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so1817766otq.11; 
 Fri, 09 Sep 2022 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Tv3Et/tqY6Zk/pnAAyJuFDBD309Fy7UgcvolVBKAIt0=;
 b=XDqQfKosBFzUJL2xT8WnuKul95HYglkg8NPZTdD8yer3mkW0yRnXch4X7L024AWOpG
 lHhrc0bFdyTds58pYk8wgR+4CCChs02NqRg70znBM6Aq/MFeaft1dGIE2EnIDuXc4Pvh
 WPohlQkvZXJQed98j2WW2vYLuHj5mi1PpppqVit2JpE1KWLFaeVev2MZCX2xYDFePU42
 2lO1uClPEbP6gGdVFuoKyHDJ7DccqBAJmkDVinAjyh+pbyEj+NdiwNZl7CxJw0Zv++k9
 RjOD8wMR/g8OyqZusKMmA0yY6OU3FRaQ6RISA2FEEJveonpA0094igOC5Cm4+vYxIVSp
 tVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Tv3Et/tqY6Zk/pnAAyJuFDBD309Fy7UgcvolVBKAIt0=;
 b=AU/IVFQE4RzzcDvifDXCWyND+leVp8hJZYOVPYgw+BREXmzjuOj5nfNPpbRnLNuvGX
 JVv315fCzzYfBJRGoS3uyy9u8Xk5WDfF2YHpOUs1MVC3EKZNA3/QBVF6zp1oCJPVqlri
 ktVpTf14xP2DLMPxYOoVLCg8plEuXBzwLwv6eYb/1AFwyP9/d7dg5+5o9GaBcIYnE5sb
 S4IWtRJVaAHKIR+sMY4L7a1Avi55ssUkdx0aDNhnSD2wXoT/PGuMTt9GI1OkFRP7Aj8F
 zKU6bc6qSzyKi/g//Q484qGjU3mCJC29dpJifOcyiih+er0mx9dO6Epqpp9Q81ue7VY4
 m7iw==
X-Gm-Message-State: ACgBeo0Bke/hkWqvycjY720oCnjk9R9A0jJdiTE/Mh5ZuqV5TAgp7urF
 haMIn/z5P5vl6smvtYQDF3GKI7ra49rEdbiTxHs=
X-Google-Smtp-Source: AA6agR6OyPFZC2Rer+UUiW1qXoiXPjbx2R+7p2UUCURa7R4KDh0CNuFWNY3EZu5Y9xqXHY5l76BxtbO4Zjwk8hSy4PQ=
X-Received: by 2002:a9d:12ce:0:b0:654:9bf:94ee with SMTP id
 g72-20020a9d12ce000000b0065409bf94eemr3411691otg.123.1662756810347; Fri, 09
 Sep 2022 13:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220905075624.22979-1-jingyuwang_vip@163.com>
In-Reply-To: <20220905075624.22979-1-jingyuwang_vip@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:53:19 -0400
Message-ID: <CADnq5_NbUSWstURQQ8NKXehByBZY-2-gimwvA9kUyoGvaqKtKg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd.c
To: Jingyu Wang <jingyuwang_vip@163.com>
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 lexander.deucher@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 hristian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Sep 5, 2022 at 3:57 AM Jingyu Wang <jingyuwang_vip@163.com> wrote:
>
> Fix everything checkpatch.pl complained about in amdgpu_amdkfd.c
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 091415a4abf0..4f5bd96000ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT
>  /*
>   * Copyright 2014 Advanced Micro Devices, Inc.
>   *
> @@ -130,6 +131,7 @@ static void amdgpu_amdkfd_reset_work(struct work_struct *work)
>                                                   kfd.reset_work);
>
>         struct amdgpu_reset_context reset_context;
> +
>         memset(&reset_context, 0, sizeof(reset_context));
>
>         reset_context.method = AMD_RESET_METHOD_NONE;
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> --
> 2.34.1
>
