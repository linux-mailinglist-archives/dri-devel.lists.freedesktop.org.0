Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C403F42BF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 03:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15B089EB1;
	Mon, 23 Aug 2021 01:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC6089EB1;
 Mon, 23 Aug 2021 01:05:49 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id i8so30945000ybt.7;
 Sun, 22 Aug 2021 18:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZJQCNnO+9ImeFWLaOc7NW0YUqFK8tUR44uA+5RXUmfc=;
 b=YtllfVz5+OdACbT9aFjGU7k46yOM39XMLyLB0hX1c2Zl2/t6mG44VEVQfG+Hg9OwNR
 477PdVYSh0/Cfj08No7pT2mqNYLEFv2ytfw3LXr3hl8Fg/wAakGNYAUOHe/mHKaMDog5
 MsuocSkSVGUOaqiQwm/dhjWlX7ToEf4tGOU2b9xpSYGH7A/95X+oBAA5rexzUZvwK797
 OgzT6C7pLrlloqiyksSz9ljrRKQ9df2SM5TUdbDvuhBwy9/CkoypQISWSz7noy+HyU30
 ziE+TBkzJX4Q8VdOEeSHLcjww5rCpRLAdI5JX2hJqiwi1g0rb6kTi6wS5r9t4sYF2mlM
 OXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJQCNnO+9ImeFWLaOc7NW0YUqFK8tUR44uA+5RXUmfc=;
 b=HB0jELcBLu1zZmf968rPK29IpIN9rd0Ft/X5J5TdwlPeH7jIxY9b54t2yo/4Uy+xZ4
 kr6z4hH4kPjoc+BLMgdgJFUbqC1sUZp/gMzFroqLXXgPOdXHTXxbWgvCbTQo2gwTBluc
 cF+WCeiQZ2yuJ9rIbqcKuEiygPV6qdy5Zy1ODLVbHBqOuFSfemeypsjLujKs6+lfpQZO
 f2Ek1xOg65dVrpeqlv9EIgZZgfVBroCknMa9K/l77n7pYuV/l5qeLTUgCV5MBxTVcfrB
 q6OpF4fVKpthpauckpkeovohdxt4v30CDThM/+NJ6MC7F+E6M9Y6+sclFIYzZzL0Vrzo
 Xfng==
X-Gm-Message-State: AOAM5314i6gc7smsrN0OJdF/yybtyFBmS+F05PK5mkjQYZFNcR/GAChp
 7AbH6jzVJ2WXwjT8nnAH/4GlbEXYeoA+af8KNto=
X-Google-Smtp-Source: ABdhPJxQZcPDZJPvD+47GIAEjHtGf4aCKNqLFyUlU/pn20qVnKz/qd9pW3DJdQyQi/sLBPi2jj1ufFPBCWZaGd1SNuc=
X-Received: by 2002:a25:db43:: with SMTP id g64mr39702282ybf.443.1629680748956; 
 Sun, 22 Aug 2021 18:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210820021911.95-1-caihuoqing@baidu.com>
In-Reply-To: <20210820021911.95-1-caihuoqing@baidu.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 23 Aug 2021 09:05:37 +0800
Message-ID: <CAKGbVbvsN84rvMMb-i=RLJB7uoLy49vL7-mXfpSe+GSq7r+V8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Remove unused lima_vm_print()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function is kept for debug usage.

On Fri, Aug 20, 2021 at 10:19 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> lima_vm_print() isn't used, so remove it
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/lima/lima_vm.c | 29 -----------------------------
>  drivers/gpu/drm/lima/lima_vm.h |  1 -
>  2 files changed, 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
> index 2b2739adc7f5..b3426c5c987f 100644
> --- a/drivers/gpu/drm/lima/lima_vm.c
> +++ b/drivers/gpu/drm/lima/lima_vm.c
> @@ -251,35 +251,6 @@ void lima_vm_release(struct kref *kref)
>         kfree(vm);
>  }
>
> -void lima_vm_print(struct lima_vm *vm)
> -{
> -       int i, j, k;
> -       u32 *pd, *pt;
> -
> -       if (!vm->pd.cpu)
> -               return;
> -
> -       pd = vm->pd.cpu;
> -       for (i = 0; i < LIMA_VM_NUM_BT; i++) {
> -               if (!vm->bts[i].cpu)
> -                       continue;
> -
> -               pt = vm->bts[i].cpu;
> -               for (j = 0; j < LIMA_VM_NUM_PT_PER_BT; j++) {
> -                       int idx = (i << LIMA_VM_NUM_PT_PER_BT_SHIFT) + j;
> -
> -                       printk(KERN_INFO "lima vm pd %03x:%08x\n", idx, pd[idx]);
> -
> -                       for (k = 0; k < LIMA_PAGE_ENT_NUM; k++) {
> -                               u32 pte = *pt++;
> -
> -                               if (pte)
> -                                       printk(KERN_INFO "  pt %03x:%08x\n", k, pte);
> -                       }
> -               }
> -       }
> -}
> -
>  int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
>  {
>         struct lima_bo_va *bo_va;
> diff --git a/drivers/gpu/drm/lima/lima_vm.h b/drivers/gpu/drm/lima/lima_vm.h
> index 3a7c74822d8b..291ec9a0a1c4 100644
> --- a/drivers/gpu/drm/lima/lima_vm.h
> +++ b/drivers/gpu/drm/lima/lima_vm.h
> @@ -58,7 +58,6 @@ static inline void lima_vm_put(struct lima_vm *vm)
>                 kref_put(&vm->refcount, lima_vm_release);
>  }
>
> -void lima_vm_print(struct lima_vm *vm);
>  int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff);
>
>  #endif
> --
> 2.25.1
>
