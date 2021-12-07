Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C107A46B960
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 11:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CBB73074;
	Tue,  7 Dec 2021 10:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5496D73074;
 Tue,  7 Dec 2021 10:45:14 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id m25so13798272qtq.13;
 Tue, 07 Dec 2021 02:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y80ggJvGuAbpF9DPBV/2FvdX32V8tH3X6g9Jb9D4e0c=;
 b=AhzRujFZ5+F26N1DDqn1t7WY2GwlrBeDt9ny+LHvKawZxRMfrT0dxjOLhOXLPJh0Q0
 /NGI2E5WMYDrwDmK1IbST5ZbA6ZeNm0fD62k9UCof3JfVikowPZw3qpaMZYUXHNCx+7v
 T4wqeSC5/UUqUwkw99aP82YTjXn/woP0W5y5/4xKJsj7w+FLBKu0nty5cSNh7re5wW1v
 edcZjnmsHzPto14pLeZX1SI6TtkbQ5XjF7SMUArd5PV2tidOrAGCMfODbWo/EqNW57oI
 UD03SO78UwHlF6kfW/mftjkRfkinq+b824rvShk1BAUZHs5GgXbvQbaYrwe8IDcsNTIh
 0qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y80ggJvGuAbpF9DPBV/2FvdX32V8tH3X6g9Jb9D4e0c=;
 b=CIHSU7lHQAEeKiHJDrh3tXr7Ofl1m9B2b7HfNTzq/aHWjOQD9kMzjs8MtHZpK23pT9
 8s0mMyHoeAS7IGvbywCmgvEmvek6/uixo8WNvAnKmu9kPhdQGFAWlJlUL3cr8W6CHnlw
 qskXtiIaeW/fyy9CvsZRfGd64EdDxn0jLFQlz0+fm/9M/+7jMxA5dZb1X+4XHda2RNbC
 cGBkgH2dvZdF0RjpsKzW405dpZVHhxvZrbe6Z3GpVgrHAWIe13+ypLvmUI12w6K/4MZI
 wd1sjeEG2EfHAReU1oOqpuhg0yht4+1DMCdAs/cS9ZopYyanz7GvFblIOkdcLjJZxOoq
 07qQ==
X-Gm-Message-State: AOAM533qkftSs3/2//crL1cTk0Mvgh0rhqPpM3J3lviMl1A9JWaahARW
 aWh4Baf04pElX8tAoJCF3bb5xvoCUYPMUNQndlSp/T12i8joLg==
X-Google-Smtp-Source: ABdhPJxcksFmAqZD82u9NUOKc5I20fPwAeJowgG5m5VwiSnrhG4QAUaL1F0qXGKj7/CRuFcI1KkodGVu92rHIHWlbNE=
X-Received: by 2002:a05:622a:1990:: with SMTP id
 u16mr47194670qtc.355.1638873913181; 
 Tue, 07 Dec 2021 02:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-7-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-7-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 7 Dec 2021 10:44:46 +0000
Message-ID: <CAM0jSHPbcU9wJyKasz_c9uXHuSe=B7rx5bHfhBoV4joFGi-YNg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] drm/i915: Ensure gem_contexts selftests work
 with unbind changes.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> In the next commit, we don't evict when refcount = 0.
>
> igt_vm_isolation() continuously tries to pin/unpin at same address,
> but also calls put() on the object, which means the object may not
> be unpinned in time.
>
> Instead of this, re-use the same object over and over, so they can
> be unbound as required.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Is this something to be worried about in the real world, outside of
the selftests?

> ---
>  .../drm/i915/gem/selftests/i915_gem_context.c | 54 +++++++++++--------
>  1 file changed, 32 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index b32f7fed2d9c..3fc595b57cf4 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -1481,10 +1481,10 @@ static int check_scratch(struct i915_address_space *vm, u64 offset)
>
>  static int write_to_scratch(struct i915_gem_context *ctx,
>                             struct intel_engine_cs *engine,
> +                           struct drm_i915_gem_object *obj,
>                             u64 offset, u32 value)
>  {
>         struct drm_i915_private *i915 = ctx->i915;
> -       struct drm_i915_gem_object *obj;
>         struct i915_address_space *vm;
>         struct i915_request *rq;
>         struct i915_vma *vma;
> @@ -1497,15 +1497,9 @@ static int write_to_scratch(struct i915_gem_context *ctx,
>         if (err)
>                 return err;
>
> -       obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -       if (IS_ERR(obj))
> -               return PTR_ERR(obj);
> -
>         cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> -       if (IS_ERR(cmd)) {
> -               err = PTR_ERR(cmd);
> -               goto out;
> -       }
> +       if (IS_ERR(cmd))
> +               return PTR_ERR(cmd);
>
>         *cmd++ = MI_STORE_DWORD_IMM_GEN4;
>         if (GRAPHICS_VER(i915) >= 8) {
> @@ -1569,17 +1563,19 @@ static int write_to_scratch(struct i915_gem_context *ctx,
>         i915_vma_unpin(vma);
>  out_vm:
>         i915_vm_put(vm);
> -out:
> -       i915_gem_object_put(obj);
> +
> +       if (!err)
> +               err = i915_gem_object_wait(obj, 0, MAX_SCHEDULE_TIMEOUT);
> +
>         return err;
>  }
>
>  static int read_from_scratch(struct i915_gem_context *ctx,
>                              struct intel_engine_cs *engine,
> +                            struct drm_i915_gem_object *obj,
>                              u64 offset, u32 *value)
>  {
>         struct drm_i915_private *i915 = ctx->i915;
> -       struct drm_i915_gem_object *obj;
>         struct i915_address_space *vm;
>         const u32 result = 0x100;
>         struct i915_request *rq;
> @@ -1594,10 +1590,6 @@ static int read_from_scratch(struct i915_gem_context *ctx,
>         if (err)
>                 return err;
>
> -       obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -       if (IS_ERR(obj))
> -               return PTR_ERR(obj);
> -
>         if (GRAPHICS_VER(i915) >= 8) {
>                 const u32 GPR0 = engine->mmio_base + 0x600;
>
> @@ -1615,7 +1607,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
>                 cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
>                 if (IS_ERR(cmd)) {
>                         err = PTR_ERR(cmd);
> -                       goto out;
> +                       goto err_unpin;
>                 }
>
>                 memset(cmd, POISON_INUSE, PAGE_SIZE);
> @@ -1651,7 +1643,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
>                 cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
>                 if (IS_ERR(cmd)) {
>                         err = PTR_ERR(cmd);
> -                       goto out;
> +                       goto err_unpin;
>                 }
>
>                 memset(cmd, POISON_INUSE, PAGE_SIZE);
> @@ -1722,8 +1714,10 @@ static int read_from_scratch(struct i915_gem_context *ctx,
>         i915_vma_unpin(vma);
>  out_vm:
>         i915_vm_put(vm);
> -out:
> -       i915_gem_object_put(obj);
> +
> +       if (!err)
> +               err = i915_gem_object_wait(obj, 0, MAX_SCHEDULE_TIMEOUT);
> +
>         return err;
>  }
>
> @@ -1765,6 +1759,7 @@ static int igt_vm_isolation(void *arg)
>         u64 vm_total;
>         u32 expected;
>         int err;
> +       struct drm_i915_gem_object *obj_a, *obj_b;

Nit: Christmas tree-ish

>
>         if (GRAPHICS_VER(i915) < 7)
>                 return 0;
> @@ -1810,6 +1805,18 @@ static int igt_vm_isolation(void *arg)
>         vm_total = ctx_a->vm->total;
>         GEM_BUG_ON(ctx_b->vm->total != vm_total);
>
> +       obj_a = i915_gem_object_create_internal(i915, PAGE_SIZE);
> +       if (IS_ERR(obj_a)) {
> +               err = PTR_ERR(obj_a);
> +               goto out_file;
> +       }
> +
> +       obj_b = i915_gem_object_create_internal(i915, PAGE_SIZE);
> +       if (IS_ERR(obj_b)) {
> +               err = PTR_ERR(obj_b);
> +               goto put_a;
> +       }
> +
>         count = 0;
>         num_engines = 0;
>         for_each_uabi_engine(engine, i915) {
> @@ -1832,10 +1839,10 @@ static int igt_vm_isolation(void *arg)
>                                                    I915_GTT_PAGE_SIZE, vm_total,
>                                                    sizeof(u32), alignof_dword);
>
> -                       err = write_to_scratch(ctx_a, engine,
> +                       err = write_to_scratch(ctx_a, engine, obj_a,
>                                                offset, 0xdeadbeef);
>                         if (err == 0)
> -                               err = read_from_scratch(ctx_b, engine,
> +                               err = read_from_scratch(ctx_b, engine, obj_b,
>                                                         offset, &value);
>                         if (err)
>                                 goto out_file;

goto put_b; below also?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> @@ -1858,6 +1865,9 @@ static int igt_vm_isolation(void *arg)
>         pr_info("Checked %lu scratch offsets across %lu engines\n",
>                 count, num_engines);
>
> +       i915_gem_object_put(obj_b);
> +put_a:
> +       i915_gem_object_put(obj_a);
>  out_file:
>         if (igt_live_test_end(&t))
>                 err = -EIO;
> --
> 2.34.0
>
