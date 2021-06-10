Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDA3A22BC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 05:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2B96E43B;
	Thu, 10 Jun 2021 03:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2146E43B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 03:23:41 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id z3so573999oib.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 20:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bnSnjCQmJkvI/c6d8ebbCLxM2gw0SqMaYv5TyjqTZjg=;
 b=I8vgu/viyavEHf9wfa84D20yJO9dbKfJ/YyNoBmdVdm5TjRMsI4MiMOVRpYLIXZ3wJ
 OHwJEgYqJrejgYikksDouJiRm0GAIXvGBCZQ14sLGODq3kMjyw8cJ3/jfEQDs2CtHkV9
 m9op5G+xzLgSVUWJYIgcrAGIYkR1e4cv9y/7EStrmNzL1m913brCV0QvT8IuGkbtwUME
 EeGH96U0R88RWFKhjuzukrgrNvOh8wN4rrm8fFBt4ck0g90jCS5ftvcrm3r2b9hZibT2
 T8Pf0g9fjPVq0SF7T6hGfGSPj1GX4ICrGPHyqv7EKh7TLMrpz0NwIlFgd4Oh7VVqXJNt
 bPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bnSnjCQmJkvI/c6d8ebbCLxM2gw0SqMaYv5TyjqTZjg=;
 b=eB9mN54OLj0vtVrPIOlJS3O8HUE7Wco5y7TIH42s0uQTxSzWrbzNRIpd9hT7x0jKpR
 w59598gQs0Gm9CaagR9pMbz8Z4Qun32eEANnmdeoc2cN2CrCZXakThh+ttWF/CvvQn/w
 k3fT+hPkv6K6ybREPFWuxl9PnUoEVYmEwIJ/HqJ7d+TQdv30t2a/pOPt7C/00HWxKuqy
 eK8OFS9U+BTJGnD8/XXoZo8T7w/6C4HFXxovIR6YWVxywtTIbQOBn2s2oP+YmU3R3JPb
 0sOj/m9gy2ERn/xdfVnib4ueU1CV1Z9sy5lS8/qupoISra2xfqgAKLO7TH8HMO09Pz8j
 2+2w==
X-Gm-Message-State: AOAM5310ywnMME4gxMooNdZKk3TIdn2a/wQNg0DG472nkiRMXWmcno77
 7jRr98bg3zZnCtJPmZeckwEwO9Ih413ZUQvXrK0=
X-Google-Smtp-Source: ABdhPJzLOceBdN9PSCMCjnirRQEaB9LktoTW7LJQWhNRL4Yqmqi8Pqm9IUIDaXbFFH189HvQ+O9WRG2JyLdH4EuLs20=
X-Received: by 2002:a05:6808:999:: with SMTP id
 a25mr1889689oic.123.1623295420774; 
 Wed, 09 Jun 2021 20:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210610030344.117897-1-airlied@gmail.com>
In-Reply-To: <20210610030344.117897-1-airlied@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Jun 2021 23:23:29 -0400
Message-ID: <CADnq5_NsAmBLMLmWsCc0VJO130z+ARhGXM6kVS_YD++nQ_Gy_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use correct rounding macro for 64-bit
To: Dave Airlie <airlied@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 9, 2021 at 11:10 PM Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> This fixes 32-bit arm build due to lack of 64-bit divides.
>
> Fixes: cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 9a6df02477ce..436ec246a7da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -407,7 +407,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  #endif
>                 pages_per_node = max_t(uint32_t, pages_per_node,
>                                        tbo->page_alignment);
> -               num_nodes = DIV_ROUND_UP(PFN_UP(mem_bytes), pages_per_node);
> +               num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>         }
>
>         node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
> --
> 2.25.4
>
