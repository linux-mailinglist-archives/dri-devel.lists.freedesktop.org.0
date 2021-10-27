Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258CA43C653
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 11:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11D26E874;
	Wed, 27 Oct 2021 09:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2706E874;
 Wed, 27 Oct 2021 09:19:13 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id h11so1279840qvk.4;
 Wed, 27 Oct 2021 02:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PstuwOjEdggQPxV8zHw/FQFt2fDJhQssjTXiFmUOTB4=;
 b=Uh9XxdgBj3vPf3YDNI+Iiz1O3rjT23rqlpINjIJO+1iO4CqtM+MwuK9cys+iB2KhU/
 pFR5zw7wkORq6pTV/lQeeslQ2WcW53kkcqqO5zeGpxPbnfM2WYoZC+8GPSkaMMMVLz1G
 rfA6HdixgLut3WHzq7CZA+5gJv4pBOyD4bUsqCWxULo5Yv74NgcXyAJyFmj65XlbWeVB
 pkPZgB6amfrYG0H9zTPTbwUgZ88kS1D1dA9RkajnXRgw/KoyamwlE8xk9xza8J1/7Aqg
 zkrEEZeXza00Xjz0WCK2tBOzv0ALToRlnxb5htR2alwGy/r4QVZ59+81XumMh1fQO1lz
 esYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PstuwOjEdggQPxV8zHw/FQFt2fDJhQssjTXiFmUOTB4=;
 b=m9WMymFUjh3RK3J++XjG/T04EWQsl37kBjX4fDFc1hfwSTQ4813CJfUsUdrdwXuEAg
 d1kkvtCc5gjAXpLZfpwJoPs82UyHfLtVCu/x1CRNGDjgyw/ZUCwgk2w9d5T6IUssbb+s
 3OpGYyrdnAUHFCSGd4LC2mkb52QYZ8bQkiI0VxCsQwF3264mCeUksgSi7VhnTYyIwfvG
 Dwabcuzo3GQ2X7xOf+TP2JO2cTz175A9/msTb2JMksFdM9QcAXIZ0ccxRJ95GccYVjZF
 2r/uOFDKVnZENpUdzjBDjSF+i6rAw4fCulv7oiKB7UQwlqnFVfGcUeiozrBYQ1W6Fdic
 sN8w==
X-Gm-Message-State: AOAM530DO4QLPTIljNbMi+v6AWBrYgmjl8vJ/q4m/cOlILEfsHVWkq5h
 ePjYL9Fvm3cIhD1lwSZs4/Xmii+FxNGKfsNvW8SlErB7snDMFA==
X-Google-Smtp-Source: ABdhPJxWf3zYTBrKjLNq1PS3rUK15ZN5+iiOKw/a+Np86gZvfJfPxg0q0pl7UWYLEl8MQoG0Snv4AXatJqDea+DhB+Q=
X-Received: by 2002:a0c:cd88:: with SMTP id v8mr20560105qvm.1.1635326352100;
 Wed, 27 Oct 2021 02:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211027083608.394152-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211027083608.394152-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 27 Oct 2021 10:18:44 +0100
Message-ID: <CAM0jSHNPYXchrz860n2qxEh+2zGooU2iwV65ns41dBpKT6MqBQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Remove gpu reloc workaround
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Oct 2021 at 09:36, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> GPU relocs are gone. There should be no need for this workaround anymore.
> Remove it.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

I was completely wrong here, sorry. Digging through the git history it
looks like this came from:

Commit 149c84077fe717af883bae459623ef1cebd86388
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed Feb 15 23:50:23 2012 +0100

    drm/i915: implement SNB workaround for lazy global gtt

    PIPE_CONTROL on snb needs global gtt mappings in place to workaround a
    hw gotcha. No other commands need such a workaround. Luckily we can
    detect a PIPE_CONTROL commands easily because they have a write_domain
    =3D I915_GEM_DOMAIN_INSTRUCTION (and nothing else has that).

so it looks to be unrelated to GPU relocs, which AFAIK didn't exist at
the time. I just saw the MI comment and assumed it was talking about
the MI_STORE_DWORD...

> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 1231224728e4..04af88e6d453 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1327,7 +1327,6 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>  {
>         struct drm_i915_private *i915 =3D eb->i915;
>         struct eb_vma *target;
> -       int err;
>
>         /* we've already hold a reference to all valid objects */
>         target =3D eb_get_vma(eb, reloc->target_handle);
> @@ -1357,25 +1356,9 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>                 return -EINVAL;
>         }
>
> -       if (reloc->write_domain) {
> +       if (reloc->write_domain)
>                 target->flags |=3D EXEC_OBJECT_WRITE;
>
> -               /*
> -                * Sandybridge PPGTT errata: We need a global gtt mapping
> -                * for MI and pipe_control writes because the gpu doesn't
> -                * properly redirect them through the ppgtt for non_secur=
e
> -                * batchbuffers.
> -                */
> -               if (reloc->write_domain =3D=3D I915_GEM_DOMAIN_INSTRUCTIO=
N &&
> -                   GRAPHICS_VER(eb->i915) =3D=3D 6) {
> -                       err =3D i915_vma_bind(target->vma,
> -                                           target->vma->obj->cache_level=
,
> -                                           PIN_GLOBAL, NULL);
> -                       if (err)
> -                               return err;
> -               }
> -       }
> -
>         /*
>          * If the relocation already has the right value in it, no
>          * more work needs to be done.
> --
> 2.31.1
>
