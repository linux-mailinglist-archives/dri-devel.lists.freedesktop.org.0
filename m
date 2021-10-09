Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C34427C45
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 19:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E406E89C;
	Sat,  9 Oct 2021 17:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB796E89B;
 Sat,  9 Oct 2021 17:11:11 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id u18so52703820lfd.12;
 Sat, 09 Oct 2021 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8Nr0xBKHY4SuQ+ba6eyoUA4TZvjy2Fr4qHXw6QKw94=;
 b=JHxRhw+CLPxSegCXrpyA/VzH7KRbnoLfT2dAGbj97rJCYYTEEbk/YeQJundnI/Spei
 MdGZwNJQsf7JRS5YI4+8Re5U+0cRbfsrEwhvuxKGT9KRJQn7fbiEhLISC6e0a/WrnEIX
 fSXUyxE02m9Acx/aPj3Am+WmDi9L6Vg9mO0CmnYodjM4244ofE9OJZJNBmQCPT4FfytK
 v4mxd5SEB6PwWLx5mdpZsDfEE/vEE58f3+LHCY+oSQK6jUOJrGpa1oCIjBvzI5Nq8Qeo
 0OglCKdOnNWl4SlgS0Qw8J0SH86C++t4jCUhrC3vvwqfMksnjt57qwFftd8oe8lWbKU3
 E9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8Nr0xBKHY4SuQ+ba6eyoUA4TZvjy2Fr4qHXw6QKw94=;
 b=EmwLfOcSUgUZ2GRpw24jv7xNO971m4fM1RAmnjVPHGe0t/Y9QV6gDuRL+wqEhIwrrk
 VkA5O9gCabO96/ZaCj/abmds0ZrrPvR8Crd5/vd/y3YkpMazD6EjJSNqSx6yQUD8aiJP
 P6rSrfNbKR7BV3H3dj906nIGHy8j9J/Cy07Lk9bF9kOEEKOFzy4grnbhk2L/e/GkoLph
 RZcRl+brjFiJ/hVNnbOoI/uarMuE70Wlq7Bjmm4bggpmF+QhLrf+sizr6OJtYYfFxXI9
 ZCvDBgPgmR3KHWYjDweyRwgq+itzSAcx4jbljRwzOHwReUedDnpXcRWHq576XchEnb04
 y0+w==
X-Gm-Message-State: AOAM533Zlah/aoVyXfbh2HZnnsbNVayOL0dMzz5RBno08gLv9HUikDyh
 o43Hf2RqP9ggZMEx9arY0eGKYBhzNXw/DnXy0Bcfw1uTWL0=
X-Google-Smtp-Source: ABdhPJxcsw9Mm11TTq5qjKPelgo8hvSHMKiNnU3iD8PaUUzY8KmFHsm8Dvs5NioXTrDfA5x47RjWnhIbqeL7kKcWw7w=
X-Received: by 2002:a05:6512:3d11:: with SMTP id
 d17mr15716867lfv.542.1633799469796; 
 Sat, 09 Oct 2021 10:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211008235846.15482-1-andi@etezian.org>
In-Reply-To: <20211008235846.15482-1-andi@etezian.org>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Sat, 9 Oct 2021 10:10:58 -0700
Message-ID: <CAKi4VA+KRyQFMiFSRLzAwpGy9ZPq6JKaQOGpQe+=L82sBEZj=A@mail.gmail.com>
Subject: Re: [PATCH v4] drm/i915/gt: move remaining debugfs interfaces into gt
To: Andi Shyti <andi@etezian.org>
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>, 
 DRI Devel <dri-devel@lists.freedesktop.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Andi Shyti <andi.shyti@intel.com>
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

On Fri, Oct 8, 2021 at 4:59 PM Andi Shyti <andi@etezian.org> wrote:
>
> From: Andi Shyti <andi.shyti@intel.com>
>
> The following interfaces:
>
>   i915_wedged
>   i915_forcewake_user
>
> are dependent on gt values. Put them inside gt/ and drop the
> "i915_" prefix name. This would be the new structure:
>
>   dri/0/gt
>   |
>   +-- forcewake_user
>   |
>   \-- reset
>
> For backwards compatibility with existing igt (and the slight
> semantic difference between operating on the i915 abi entry
> points and the deep gt info):
>
>   dri/0
>   |
>   +-- i915_wedged
>   |
>   \-- i915_forcewake_user
>
> remain at the top level.
>
> Signed-off-by: Andi Shyti <andi.shyti@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
> Changelog:
> ----------
> v3 -> v4: https://patchwork.freedesktop.org/patch/458225/
>  * remove the unnecessary interrupt_info_show() information. They
>    were already removed here by Chris:
>
>         cf977e18610e6 ("drm/i915/gem: Spring clean debugfs")
>
> v2 -> v3: https://patchwork.freedesktop.org/patch/458108/
>  * keep the original interfaces as they were (thanks Chris) but
>    implement the functionality inside the gt. The upper level
>    files will call the gt functions (thanks Lucas).
>
> v1 -> v2: https://patchwork.freedesktop.org/patch/456652/
>  * keep the original interfaces intact (thanks Chris).
>
>  drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    | 42 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    |  4 ++
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 41 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h |  4 ++
>  drivers/gpu/drm/i915/i915_debugfs.c           | 43 +++----------------
>  5 files changed, 98 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> index 1fe19ccd27942..f712670993b68 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> @@ -13,6 +13,46 @@
>  #include "pxp/intel_pxp_debugfs.h"
>  #include "uc/intel_uc_debugfs.h"
>
> +int reset_show(void *data, u64 *val)
> +{
> +       struct intel_gt *gt = data;
> +       int ret = intel_gt_terminally_wedged(gt);
> +
> +       switch (ret) {
> +       case -EIO:
> +               *val = 1;
> +               return 0;
> +       case 0:
> +               *val = 0;
> +               return 0;
> +       default:
> +               return ret;
> +       }
> +}
> +
> +int reset_store(void *data, u64 val)
> +{
> +       struct intel_gt *gt = data;
> +
> +       /* Flush any previous reset before applying for a new one */
> +       wait_event(gt->reset.queue,
> +                  !test_bit(I915_RESET_BACKOFF, &gt->reset.flags));
> +
> +       intel_gt_handle_error(gt, val, I915_ERROR_CAPTURE,
> +                             "Manually reset engine mask to %llx", val);
> +       return 0;
> +}
> +DEFINE_SIMPLE_ATTRIBUTE(reset_fops, reset_show, reset_store, "%llu\n");
> +
> +static void gt_debugfs_register(struct intel_gt *gt, struct dentry *root)
> +{
> +       static const struct intel_gt_debugfs_file files[] = {
> +               { "reset", &reset_fops, NULL },
> +       };
> +
> +       intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), gt);
> +}
> +
>  void intel_gt_debugfs_register(struct intel_gt *gt)
>  {
>         struct dentry *root;
> @@ -24,6 +64,8 @@ void intel_gt_debugfs_register(struct intel_gt *gt)
>         if (IS_ERR(root))
>                 return;
>
> +       gt_debugfs_register(gt, root);
> +
>         intel_gt_engines_debugfs_register(gt, root);
>         intel_gt_pm_debugfs_register(gt, root);
>         intel_sseu_debugfs_register(gt, root);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> index 8b6fca09897ce..6bc4f044c23f3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.h
> @@ -35,4 +35,8 @@ void intel_gt_debugfs_register_files(struct dentry *root,
>                                      const struct intel_gt_debugfs_file *files,
>                                      unsigned long count, void *data);
>
> +/* functions that need to be accessed by the upper level non-gt interfaces */
> +int reset_show(void *data, u64 *val);
> +int reset_store(void *data, u64 val);

We are trying to make the several parts of the driver self-contained.
Functions exposed by this header should keep the namespace...

So I think this would be intel_gt_debugfs_reset_show() /
intel_gt_debugfs_reset_store()
or something like that.

Also, since you still have a i915_wedged_set() function, here the first
parameter could be struct intel_gt * to make the interface clear.

> +
>  #endif /* INTEL_GT_DEBUGFS_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 5f84ad6026423..712c91d588eb3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -19,6 +19,46 @@
>  #include "intel_sideband.h"
>  #include "intel_uncore.h"
>
> +int __forcewake_user_open(struct intel_gt *gt)
> +{
> +       atomic_inc(&gt->user_wakeref);
> +       intel_gt_pm_get(gt);
> +       if (GRAPHICS_VER(gt->i915) >= 6)
> +               intel_uncore_forcewake_user_get(gt->uncore);
> +
> +       return 0;
> +}
> +
> +int __forcewake_user_release(struct intel_gt *gt)
> +{
> +       if (GRAPHICS_VER(gt->i915) >= 6)
> +               intel_uncore_forcewake_user_put(gt->uncore);
> +       intel_gt_pm_put(gt);
> +       atomic_dec(&gt->user_wakeref);
> +
> +       return 0;
> +}
> +
> +static int forcewake_user_open(struct inode *inode, struct file *file)
> +{
> +       struct intel_gt *gt = inode->i_private;
> +
> +       return __forcewake_user_open(gt);
> +}
> +
> +static int forcewake_user_release(struct inode *inode, struct file *file)
> +{
> +       struct intel_gt *gt = inode->i_private;
> +
> +       return __forcewake_user_release(gt);
> +}
> +
> +static const struct file_operations forcewake_user_fops = {
> +       .owner = THIS_MODULE,
> +       .open = forcewake_user_open,
> +       .release = forcewake_user_release,
> +};
> +
>  static int fw_domains_show(struct seq_file *m, void *data)
>  {
>         struct intel_gt *gt = m->private;
> @@ -627,6 +667,7 @@ void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root)
>                 { "drpc", &drpc_fops, NULL },
>                 { "frequency", &frequency_fops, NULL },
>                 { "forcewake", &fw_domains_fops, NULL },
> +               { "forcewake_user", &forcewake_user_fops, NULL},
>                 { "llc", &llc_fops, llc_eval },
>                 { "rps_boost", &rps_boost_fops, rps_eval },
>         };
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> index 2b824289582be..fe306412b996d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> @@ -13,4 +13,8 @@ struct drm_printer;
>  void intel_gt_pm_debugfs_register(struct intel_gt *gt, struct dentry *root);
>  void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *m);
>
> +/* functions that need to be accessed by the upper level non-gt interfaces */
> +int __forcewake_user_open(struct intel_gt *gt);
> +int __forcewake_user_release(struct intel_gt *gt);

same thing here.

Other than those renames,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
