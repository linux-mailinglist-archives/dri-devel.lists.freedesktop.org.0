Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D741FE68
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84956E044;
	Sat,  2 Oct 2021 22:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA36E044
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 22:14:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x27so53958798lfu.5
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HorQJKC+7DLWPWtIFJ06VYgaieaLtIKugnyhs6NTgis=;
 b=Zleq+h+xAH1zWz7IrmBedzxOuIshm7dVdhjCqbIdNPvD//ouom6toiGdtopiwuSQxu
 0WmOmDYwb0D89t7pixHaXTornXpkrYdHPgMRg9SOc8PMFNtgzfxgzVFImbqgc7oOMeEj
 aSYDgdv6bD4W2NTshlvbH+qx2MRuVQaJXzGPGxfGA6QtBGShf6qVqvqD7GIMUB08vKdu
 ORAj9Of+4AqCVoiPWFn48/dhAEyKLIkMFEZ81hDjbXGyeu2eziBtBG9YKp5HScx1p8rc
 M7SnvyYLEfqoE09a/g75r0uEYb+bu8ZB31shFd1ptVGNWeXj053esZRjk20w97h11f9y
 7bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HorQJKC+7DLWPWtIFJ06VYgaieaLtIKugnyhs6NTgis=;
 b=W6FTL9LiFds+SET4xNEkRv3/Gfy+jj7YkKn32NkGTHnB5QL8+ANEs1jxZcJwbjedSv
 Digd160AkSiaIEgiakwjtMLaYhtAyFNvKk9ubCpKrM6BppvZTr9O1SWLSxs7YMHdZelE
 Sq4XOho4doXMOVr43leZx4RFnAklPdv+c0dOQtTBfLPgxZWZUfZ5BD6fXY4yCkomXWJC
 nszHuC3kCiA73Iove6roKh/9G+cGKtpEZNHknwdtORy3XgbKcztl0dFJ6jjjGxQf9/Ge
 V/5KXrUv+YUSNjCxe40rlCtYysKS0EYvOefOppwdSIawnaVEwDV0sLc2Kb4k2tpcButQ
 AgAA==
X-Gm-Message-State: AOAM531q3CuGWISOsCENmELqyptuWc3Xb+1YyfNdtoX+JLa+NeHYfoRA
 1lVHWdTJdqEPKFAxsZyt6XzePuO/Z+I68O4XbFQ=
X-Google-Smtp-Source: ABdhPJxZcmxaCZlJ+Y/MOnU8eGQ/PRQ2VfmgNCeQNP7UQPsxdt3X/pDFdQucoynjP0xWCQts9lAylCsJE42rDossnNI=
X-Received: by 2002:a2e:a316:: with SMTP id l22mr441019lje.231.1633212854777; 
 Sat, 02 Oct 2021 15:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-6-tzimmermann@suse.de>
In-Reply-To: <20210928084446.22580-6-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 3 Oct 2021 00:14:03 +0200
Message-ID: <CAMeQTsZdaoUoC=dGSWFAmHd_dofRhOFFGcfGsRuaEmbGuCGqkA@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/gma500: Rename psb_gtt_{pin,
 unpin}() to psb_gem_{pin, unpin}()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Sep 28, 2021 at 10:44 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Rename psb_gtt_pin() to psb_gem_pin() to reflect the semantics of the
> function. Same for psb_gtt_unpin(). No functional changes.

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c         |  8 ++++----
>  drivers/gpu/drm/gma500/gem.h         |  4 ++--
>  drivers/gpu/drm/gma500/gma_display.c | 12 ++++++------
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 4acab39a583a..369910d0091e 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -41,7 +41,7 @@ static void psb_gtt_detach_pages(struct gtt_range *gt)
>         gt->pages = NULL;
>  }
>
> -int psb_gtt_pin(struct gtt_range *gt)
> +int psb_gem_pin(struct gtt_range *gt)
>  {
>         int ret = 0;
>         struct drm_device *dev = gt->gem.dev;
> @@ -69,7 +69,7 @@ int psb_gtt_pin(struct gtt_range *gt)
>         return ret;
>  }
>
> -void psb_gtt_unpin(struct gtt_range *gt)
> +void psb_gem_unpin(struct gtt_range *gt)
>  {
>         struct drm_device *dev = gt->gem.dev;
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> @@ -94,7 +94,7 @@ static void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt)
>  {
>         /* Undo the mmap pin if we are destroying the object */
>         if (gt->mmapping) {
> -               psb_gtt_unpin(gt);
> +               psb_gem_unpin(gt);
>                 gt->mmapping = 0;
>         }
>         WARN_ON(gt->in_gart && !gt->stolen);
> @@ -290,7 +290,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
>         /* For now the mmap pins the object and it stays pinned. As things
>            stand that will do us no harm */
>         if (r->mmapping == 0) {
> -               err = psb_gtt_pin(r);
> +               err = psb_gem_pin(r);
>                 if (err < 0) {
>                         dev_err(dev->dev, "gma500: pin failed: %d\n", err);
>                         ret = vmf_error(err);
> diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
> index 6b67c58cbed5..21c86df482a6 100644
> --- a/drivers/gpu/drm/gma500/gem.h
> +++ b/drivers/gpu/drm/gma500/gem.h
> @@ -15,7 +15,7 @@ struct drm_device;
>  struct gtt_range *
>  psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align);
>
> -int psb_gtt_pin(struct gtt_range *gt);
> -void psb_gtt_unpin(struct gtt_range *gt);
> +int psb_gem_pin(struct gtt_range *gt);
> +void psb_gem_unpin(struct gtt_range *gt);
>
>  #endif
> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> index 8c95b50034a5..6d0470b27bc5 100644
> --- a/drivers/gpu/drm/gma500/gma_display.c
> +++ b/drivers/gpu/drm/gma500/gma_display.c
> @@ -75,7 +75,7 @@ int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
>
>         /* We are displaying this buffer, make sure it is actually loaded
>            into the GTT */
> -       ret = psb_gtt_pin(gtt);
> +       ret = psb_gem_pin(gtt);
>         if (ret < 0)
>                 goto gma_pipe_set_base_exit;
>         start = gtt->offset;
> @@ -126,7 +126,7 @@ int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
>  gma_pipe_cleaner:
>         /* If there was a previous display we can now unpin it */
>         if (old_fb)
> -               psb_gtt_unpin(to_gtt_range(old_fb->obj[0]));
> +               psb_gem_unpin(to_gtt_range(old_fb->obj[0]));
>
>  gma_pipe_set_base_exit:
>         gma_power_end(dev);
> @@ -350,7 +350,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>                 /* Unpin the old GEM object */
>                 if (gma_crtc->cursor_obj) {
>                         gt = to_gtt_range(gma_crtc->cursor_obj);
> -                       psb_gtt_unpin(gt);
> +                       psb_gem_unpin(gt);
>                         drm_gem_object_put(gma_crtc->cursor_obj);
>                         gma_crtc->cursor_obj = NULL;
>                 }
> @@ -378,7 +378,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>         gt = to_gtt_range(obj);
>
>         /* Pin the memory into the GTT */
> -       ret = psb_gtt_pin(gt);
> +       ret = psb_gem_pin(gt);
>         if (ret) {
>                 dev_err(dev->dev, "Can not pin down handle 0x%x\n", handle);
>                 goto unref_cursor;
> @@ -426,7 +426,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>         /* unpin the old bo */
>         if (gma_crtc->cursor_obj) {
>                 gt = to_gtt_range(gma_crtc->cursor_obj);
> -               psb_gtt_unpin(gt);
> +               psb_gem_unpin(gt);
>                 drm_gem_object_put(gma_crtc->cursor_obj);
>         }
>
> @@ -490,7 +490,7 @@ void gma_crtc_disable(struct drm_crtc *crtc)
>
>         if (crtc->primary->fb) {
>                 gt = to_gtt_range(crtc->primary->fb->obj[0]);
> -               psb_gtt_unpin(gt);
> +               psb_gem_unpin(gt);
>         }
>  }
>
> --
> 2.33.0
>
