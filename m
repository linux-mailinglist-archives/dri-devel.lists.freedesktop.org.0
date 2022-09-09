Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573E5B410C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F61810EE5F;
	Fri,  9 Sep 2022 20:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D121810EE5E;
 Fri,  9 Sep 2022 20:52:40 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-12803ac8113so7029120fac.8; 
 Fri, 09 Sep 2022 13:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=auTdx0ufon/JFw//ZNUMeBnNVMPTikmUwRLNyCwLhpU=;
 b=SJkHXuVd9goGm1zd4i9WhAGT1g0Zy2AKdDf0GPFcAbHCov3BndcvhuUauQZhMFRcMX
 alqvHPrT4MIH2xIL7HGk3BF0zm5aZsm8eajaq9PvCe7rQ9YkGbzBoXPI7PcUf+K1oLva
 9lv7Gpc4il9uXSRLobO/DChwj/Kt8XXVY9rmqpMsxSFKwEjKAOubguW+aYFjdxDFI0H2
 9GVRy6xkUavjj2VFF2BH677C69+6qcStEKWKFbljkhn/ss5VXIWL/KHJKzk/eiQAa3Mv
 qMm83dnbWh64C+xOy2TmpFY1rFWJVRIV88bmL7WhNC5vqXjw/jL4nh91gOKdklcFH8Gb
 Y3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=auTdx0ufon/JFw//ZNUMeBnNVMPTikmUwRLNyCwLhpU=;
 b=bFJ8MYvWWKoAM7ivWdJf/qjX/vIjBrtBHy8zk9sZjJf48kCZc9YjrR4WyVZAKr8Fgb
 QWbOlXjouCBOxKep5V3KBOuHxalqaUCOskGYf9IFBTRo/tji8L2th3IBmZOGfXsOKeMB
 rI2SJT24f2p6hhLHDOMCsHogOJpdV2u4n2v0f8OnFsf23HXqm3FzBPNeA4CNYNgYQrZn
 c68GexuwQcjvB6xrSCzIIezQD8M+85k9IO4wj+4ss+9XGcOSX9AL7ueAK0opJGW6+xWX
 sEBlbxYJFsH0CzyjRWylCNhQqJjCnU8uRcjRaKI0E4nqlS1ayu1xZrDLxXmGeGHagnN0
 muxA==
X-Gm-Message-State: ACgBeo2HQghhD1UqiKlbEPHrbLCbiIqLINVlq3gK6g3Es6E+m6TAk+zX
 a9AlkmXpMvqdk7SRgjit2e6Ud+N2hNGFDRXj8l4=
X-Google-Smtp-Source: AA6agR5I6Ldv3MIUY+iIA3U5//fxJC666jQR7VxjwrS9FgbbXxBYox+wQkCo795/fGd9GkuMcDlk0vPS+veH5/osdS0=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr4719371oae.46.1662756760178; Fri, 09 Sep
 2022 13:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220904183307.14550-1-jingyuwang_vip@163.com>
In-Reply-To: <20220904183307.14550-1-jingyuwang_vip@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:52:29 -0400
Message-ID: <CADnq5_OGdH17hhYh4=f70UJyqxgA2Od=_AkiLDo0wMSYSJ_Urg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_sync.c file
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Sep 5, 2022 at 2:29 AM Jingyu Wang <jingyuwang_vip@163.com> wrote:
>
> This is a patch to the amdgpu_sync.c file that fixes some warnings found by the checkpatch.pl tool
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 504af1b93bfa..090e66a1b284 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT
>  /*
>   * Copyright 2014 Advanced Micro Devices, Inc.
>   * All Rights Reserved.
> @@ -315,6 +316,7 @@ struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync)
>         struct hlist_node *tmp;
>         struct dma_fence *f;
>         int i;
> +
>         hash_for_each_safe(sync->fences, i, tmp, e, node) {
>
>                 f = e->fence;
> @@ -392,7 +394,7 @@ void amdgpu_sync_free(struct amdgpu_sync *sync)
>  {
>         struct amdgpu_sync_entry *e;
>         struct hlist_node *tmp;
> -       unsigned i;
> +       unsigned int i;
>
>         hash_for_each_safe(sync->fences, i, tmp, e, node) {
>                 hash_del(&e->node);
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> prerequisite-patch-id: fefd0009b468430bb223fc92e4abe9710518b1ea
> --
> 2.34.1
>
