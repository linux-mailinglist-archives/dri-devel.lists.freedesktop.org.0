Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097E786597
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 04:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C24010E4C5;
	Thu, 24 Aug 2023 02:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC11510E4C5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 02:57:31 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so790525966b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 19:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692845850; x=1693450650;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=glCjo1F94JBmzvms27OTmepsDv2N1ouu2CLlsTqKN9I=;
 b=gLwkzFmrl8u8ZfHEDU8+AyiL0Fw6bZIaU3W/c0DWF1ETSG8JXJpKy3T46gfg+t5bSR
 u0/y9oC0oXIjE2NFWprih7iP+l/GR5PMFHhaePj2TxYG+JMHIYwcke+HVgUO/MwQSLep
 lsyP303pnccf0vngf9Nx56bClDyB0O9eCj82cq/0nBBJopEW5mFMaA48oasjwpcahvCv
 SIkgImruCNKt9L7FiFkDdRQnmjFv0A3P3rI0l7mBy45WXAU0Cpt/Yil5ao5K77HfnQqE
 AMA+/9BvdEChQvGkxSJBz/KfnVfjB1eU4pj7/OF84u1d9V1V+seZIfVHU5d6GAON/IVd
 qRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692845850; x=1693450650;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=glCjo1F94JBmzvms27OTmepsDv2N1ouu2CLlsTqKN9I=;
 b=VVXyYueJQWDwyyLWXeBObKWA0c19IkQTCd+WddGz/u7HBcNxKezoPApYB6dfckn8oi
 M3hnaBHm28+WR3SYqgUBUQlGE+/F/HFOVe0GaBL6h+3HFNneNvQJUpaO3SjPTohHKc+r
 MUTAHJaKrUzXsjpPvG1HaCGVgrmXdb7TnzN3oDH1ZZlb6MuGv9t0pLFrLXcw+KHUCeUE
 jtDa8R2iob9X9tw63MrKtCVWhXzwyJucPnCeF5GWKXSTNk6/8+I+wyUOvDli77B0yDB4
 Q3uIaKyaiUrTQpTbkpPBle6TW/F79ffR0Wg/e+1C8n6a/AwHhMJGTmEx4jztlh6Q1+pR
 i6MA==
X-Gm-Message-State: AOJu0Ywaw78M88JuDIcR6zGf7d6rkel+bIR7eBkUwRUo5yETY10mbBYg
 wpnhoG+OlUz10QOnrWXx/1XlZwOGuNFScbtBR/Q=
X-Google-Smtp-Source: AGHT+IGGs4hhDpkZJt5peSF19rdmbtl1bCN4ozS6KikecPNkQYyMYUkDlwhO9dKwKbz/kOan7UFvj/xcmq5erc+izak=
X-Received: by 2002:a17:906:7391:b0:9a1:c659:7c62 with SMTP id
 f17-20020a170906739100b009a1c6597c62mr4052476ejl.66.1692845849977; Wed, 23
 Aug 2023 19:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230823233119.2891-1-dakr@redhat.com>
In-Reply-To: <20230823233119.2891-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Aug 2023 12:57:18 +1000
Message-ID: <CAPM=9twmbMC8VSoShxZUDW2+7=Kp0kBXsV33v7+4crrDyzfMAg@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next] drm/gpuva_mgr: remove unused prev pointer
 in __drm_gpuva_sm_map()
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023 at 09:31, Danilo Krummrich <dakr@redhat.com> wrote:
>
> The prev pointer in __drm_gpuva_sm_map() was used to implement automatic
> merging of mappings. Since automatic merging did not make its way
> upstream, remove this leftover.
>
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/drm_gpuva_mgr.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index 1bc91fc60ef3..3e1ca878cb7e 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -1743,7 +1743,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>                    u64 req_addr, u64 req_range,
>                    struct drm_gem_object *req_obj, u64 req_offset)
>  {
> -       struct drm_gpuva *va, *next, *prev = NULL;
> +       struct drm_gpuva *va, *next;
>         u64 req_end = req_addr + req_range;
>         int ret;
>
> @@ -1773,7 +1773,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>                                 ret = op_unmap_cb(ops, priv, va, merge);
>                                 if (ret)
>                                         return ret;
> -                               goto next;
> +                               continue;
>                         }
>
>                         if (end > req_end) {
> @@ -1818,7 +1818,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>                                 ret = op_remap_cb(ops, priv, &p, NULL, &u);
>                                 if (ret)
>                                         return ret;
> -                               goto next;
> +                               continue;
>                         }
>
>                         if (end > req_end) {
> @@ -1851,7 +1851,7 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>                                 ret = op_unmap_cb(ops, priv, va, merge);
>                                 if (ret)
>                                         return ret;
> -                               goto next;
> +                               continue;
>                         }
>
>                         if (end > req_end) {
> @@ -1872,8 +1872,6 @@ __drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
>                                 break;
>                         }
>                 }
> -next:
> -               prev = va;
>         }
>
>         return op_map_cb(ops, priv,
> --
> 2.41.0
>
