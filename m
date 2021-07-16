Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B73CB6A5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 13:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9A06E96F;
	Fri, 16 Jul 2021 11:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96DB6E96F;
 Fri, 16 Jul 2021 11:21:16 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id v14so6809050qtc.8;
 Fri, 16 Jul 2021 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UwXIuhb0zv973Vcg7X+3l/bLAP0Swe7e5GwE4NuxqPE=;
 b=kt+YI6Rb0DrHPmOjh6BdzuA7oW/9VxR2Ypy//rdH4Usl3aYMcZ8Mx0e6V+1WXjK57s
 iE37w3XwB5GpqovjZUxhKd81YTuxUfg6cxb69a10bennbzbf8pzWRrBgrq8tih0XpWB1
 2TUTg1Zcox9yP1MsadpYUHaqmH7EaqJr0kGfDNy+aQU1nc7h/woyOlupJlnJ9UHPXLmk
 3XQ7ZpdOq5zbP+sZqBJZtQowkTRG0emivlykC90DOtQjRk0tNhLKVEX37J4XxeCcjS0q
 awP0Pk3+l49571fjnv7WpitEvaw6AQ3COHtXx/roP6wuCzePaXnKxvf6FJwxTree70kB
 +0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UwXIuhb0zv973Vcg7X+3l/bLAP0Swe7e5GwE4NuxqPE=;
 b=e8eZkH+chHhp10vBYsUz4N8Rq/341XkfPqTxGCQTRK8NXPXJFPDPw5tCI1SDXtLFiB
 Jyyaap2D3bFyUmoYI44ors7+LQuj9GaetVZPySaOjlk8s6tcXSXc555BgbQoZZ97pH9w
 lI9ecZoSGKgqe55dVC0A9jjLVC2hYmcv7YR/kS/1kvvaT7BbJoYd+XHr3ir/AUo0eOiQ
 XTswKeg9Lr5OagdDZAVTh9Y48n6IUbu8G4L8ThFYkHXjBeZzrV9FkMi8s7h01CS+P7ZB
 RDt4Tifu0kGFYohj2M3AZ1Z+jbrhB+8vLGX3NI6jmCtD/il520XoEOSKYAxNlLqjnvK6
 paVQ==
X-Gm-Message-State: AOAM533FR6MKzGCE8PQfnQDwHYoXF8qLZbwCbJ5ugBc/hlbwL32j5ss8
 H1GHxp9t9VUctnJzNx7GvyHshw+XswySLD6HN/I=
X-Google-Smtp-Source: ABdhPJwCawCptYIa1ofUVsZMR902SVH1ZTA1GVE9MVWkHKave+3ZPkXnPEw9vh7fggLbwFMyfVu10N9IiRmSb77LZAM=
X-Received: by 2002:a05:622a:89:: with SMTP id
 o9mr8539142qtw.339.1626434475830; 
 Fri, 16 Jul 2021 04:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-4-jason@jlekstrand.net>
In-Reply-To: <20210715223900.1840576-4-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 12:20:47 +0100
Message-ID: <CAM0jSHMU82eH15qC_dpYRkMm9dh+KRrCaJh6Y07nG+==6S4AQA@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/i915/gem: Unify user object creation
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> Instead of hand-rolling the same three calls in each function, pull them
> into an i915_gem_object_create_user helper.  Apart from re-ordering of
> the placements array ENOMEM check, the only functional change here
> should be that i915_gem_dumb_create now calls i915_gem_flush_free_objects
> which it probably should have been calling all along.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 106 +++++++++------------
>  1 file changed, 43 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 391c8c4a12172..69bf9ec777642 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -11,13 +11,14 @@
>  #include "i915_trace.h"
>  #include "i915_user_extensions.h"
>
> -static u32 object_max_page_size(struct drm_i915_gem_object *obj)
> +static u32 object_max_page_size(struct intel_memory_region **placements,
> +                               unsigned int n_placements)
>  {
>         u32 max_page_size = 0;
>         int i;
>
> -       for (i = 0; i < obj->mm.n_placements; i++) {
> -               struct intel_memory_region *mr = obj->mm.placements[i];
> +       for (i = 0; i < n_placements; i++) {
> +               struct intel_memory_region *mr = placements[i];
>
>                 GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
>                 max_page_size = max_t(u32, max_page_size, mr->min_page_size);
> @@ -81,22 +82,35 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
>         return 0;
>  }
>
> -static int
> -i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
> +static struct drm_i915_gem_object *
> +i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,

create_user sounds nice.

> +                           struct intel_memory_region **placements,
> +                           unsigned int n_placements)
>  {
> -       struct intel_memory_region *mr = obj->mm.placements[0];
> +       struct intel_memory_region *mr = placements[0];
> +       struct drm_i915_gem_object *obj;
>         unsigned int flags;
>         int ret;
>
> -       size = round_up(size, object_max_page_size(obj));
> +       i915_gem_flush_free_objects(i915);

Needs to be a separate patch.

> +
> +       obj = i915_gem_object_alloc();
> +       if (!obj)
> +               return ERR_PTR(-ENOMEM);

Should move this way down, so we don't accidently leak it.
