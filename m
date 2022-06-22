Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02C554C5F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5BB112560;
	Wed, 22 Jun 2022 14:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0067112545;
 Wed, 22 Jun 2022 14:13:49 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id t16so20280116qvh.1;
 Wed, 22 Jun 2022 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JF2AimeR0ZdN0wina6R2npKExnuHoKH5B4yeWBrwrDI=;
 b=ovK5r3LpOxdPW8NR3cAhNq28nijnnouQQ2Vm7wTp7Xd2N6zQBBah2PHB/DQT9tri1D
 qe4/sRKG0Uvc4fJgAgPxIbCQVKqeKA/nIppJZPyMrkuvnJTAoYCTkEqhpyy5gxGz3cpN
 LmTAb8F6kFpbmJDBVVbQh6wXOt32AdlxY/Cnp8n8lkXQ4ViYyDDr7NlwUK0sLoFjmM4b
 qEgDL5H5um/21I33SxxJoytPwyBa3U63JJSTf2LRbY2zFTdTd9/yVyAd1U4HSqZ8xcoz
 eVR1DH00occ9WAmFhfnAnn3qD9RSikjkqsTJUcurl8DxfiQBPGSDJpXFW3gZUX2jbhWC
 EilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JF2AimeR0ZdN0wina6R2npKExnuHoKH5B4yeWBrwrDI=;
 b=FDf6dbLLwgw+FXnjhrVlOD4gnIltUZmXZu9uLs0Ns/a0jrQRhDkpZPRPQJSgaWQc0N
 JtRz54gvBNJB1Le1d6r21wzRZNmVA8braw8/A0EZySWBovUdeDLKS8f6FAT6QwQrxNAx
 KF2Kb+0o8C/cYsGrGsJDxERMtHdD1yXMWMqPuEE48ikEVPzcbBO7FlISsTce3tJhW3i+
 rPGzbtkOMrqfJXYaucMJu+A1wlj6sEqND8ZaauKQSFPalT1s1s1BmbPVv5d3JdYnjxdE
 +nrlBHB8tXq1SLFisJBrW9lTcujAYMCe2pJLKLTGpvRj2IxdjlqHiFjx3+hwIpi0D56j
 jIUw==
X-Gm-Message-State: AJIora8IN1ec21OhEw0DvEdoo4K+osf+R8gfc54HaPcym+omvRq9AJ6C
 akM/M0pyYccGNDwpyUiGh/Wu1FAkgvYFzYeubY8=
X-Google-Smtp-Source: AGRyM1t/EEiS0w0D03mWIIxWud9qvw4VyMq9gCC6ZvI3z3ChkDdDsKGHzGFQDwrXH91aydUbnvDGdeZJbtWmh4YcckI=
X-Received: by 2002:a05:6214:29cd:b0:470:46e6:bbc6 with SMTP id
 gh13-20020a05621429cd00b0047046e6bbc6mr10624673qvb.0.1655907228901; Wed, 22
 Jun 2022 07:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220622141104.334432-1-matthew.auld@intel.com>
In-Reply-To: <20220622141104.334432-1-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Jun 2022 15:13:22 +0100
Message-ID: <CAM0jSHNdxpYRM64SEU228A5dA=XMrymS4m-A-qHTm1rVvcSo4g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/selftests: Increase timeout for
 live_parallel_switch
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jun 2022 at 15:11, Matthew Auld <matthew.auld@intel.com> wrote:
>
> From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
>
> With GuC submission, it takes a little bit longer switching contexts
> among all available engines simultaneously, when running
> live_parallel_switch subtest. Increase the timeout.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5885
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index 93a67422ca3b..c6ad67b90e8a 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -212,7 +212,7 @@ static int __live_parallel_switch1(void *data)
>
>                         i915_request_add(rq);
>                 }
> -               if (i915_request_wait(rq, 0, HZ / 5) < 0)
> +               if (i915_request_wait(rq, 0, HZ) < 0)
>                         err = -ETIME;
>                 i915_request_put(rq);
>                 if (err)
> --
> 2.36.1
>
