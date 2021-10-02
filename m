Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D2041FE65
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8746D6E041;
	Sat,  2 Oct 2021 22:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7516E041
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 22:13:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e15so53900347lfr.10
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tdFu7ZTG0SlTipsQX52NJOOnjx2JDX9+0/8/on4WbNY=;
 b=LNohnhtgcV0m5SsQt5cig+Tv2FV1wegR3MKpdsgz0O6QVFjYp2fhUsMreVrzbKOeUj
 M4SPMueB/ZCQrTsCz+Ijrij6PN/E/farEfvujKSTc/erIFFgm57hv0DxEjmpPx7SG/zG
 /8T81Z7EgMMYU5Lz/i3ZfvjCd+Ue+MgTeLqC7u1/xxSUVUCLcyO+Ka2VYEAWwS8ea2uf
 +aNwt+6C1h3lIlHR/ROpYIwd9Cxmr/Q6Zw32RxdFP0RLZU5Va28iR3f+hczNyiU33zyM
 Mkau2BN6g00Z5d+lrqK+ckFdndjcGn3lu4iGAsRTJo+Y9w3+/+MD2J1iLfRKlf/XRa0I
 pVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tdFu7ZTG0SlTipsQX52NJOOnjx2JDX9+0/8/on4WbNY=;
 b=WTpymY3bLb/vbBYa/OrhrLrNiDQylQBQlx89n3AAdREj1wt64K7rWYSOIZ4Rkdy53X
 KGdCOKcKAKo70KBSEr7p5is54bT8/KEu2Wfk5m888B6ztswAGvzHJx4XcoKUMWzzJAhc
 Me8kDDTkpAShmhRmEI0A36jGI6Hw5Q2UV3Xj1Vo9Gngoc0hMOgjOL7AGkdC1RbTZ2oVX
 Y9VBXCobbx7+Jx9Dy8/+1GjsufkYbGpd2yhFCz6QEU9Ul4kCDOz/IdAxHnDeomOiT+n6
 DKTauZKlZpD0cU2a7PBpmLnevEfT//w8uQmSP7N2t2hIwWa1mD+0fe3hOFfpXhjvLDE8
 Xtag==
X-Gm-Message-State: AOAM533SNjH4+qPlHVt33kolcjm5HgzDDjZtwn1yR3voa4du0QEZjsBj
 +stHIjbwwcCbCUejQQt84yXGN6CpF0gy9q+1SsI=
X-Google-Smtp-Source: ABdhPJyVZ1SuurxnUW9i8IFHCycUzrnqK9hdg5qT0mcJSeZ7CTdbQrSAUo2npYju7uaCb+gmTcfTdjBi0qplGGYBTag=
X-Received: by 2002:a05:6512:3502:: with SMTP id
 h2mr5475194lfs.635.1633212813544; 
 Sat, 02 Oct 2021 15:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-3-tzimmermann@suse.de>
In-Reply-To: <20210928084446.22580-3-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 3 Oct 2021 00:13:22 +0200
Message-ID: <CAMeQTsZNnSvt_=EK24RPxnNbRvrQhjBsj2tud00pPjS54XuaPQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/gma500: Use to_gtt_range() everywhere
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
> Convert upcasts from struct drm_gem_object to struct gtt_range to
> to_gtt_range(). Some places used container_of() directly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> ---
>  drivers/gpu/drm/gma500/gem.c         | 4 ++--
>  drivers/gpu/drm/gma500/gma_display.c | 7 +++----
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 734bcb7a80c8..ff2c1d64689e 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -106,7 +106,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
>
>  static void psb_gem_free_object(struct drm_gem_object *obj)
>  {
> -       struct gtt_range *gtt = container_of(obj, struct gtt_range, gem);
> +       struct gtt_range *gtt = to_gtt_range(obj);
>
>         /* Remove the list map if one is present */
>         drm_gem_free_mmap_offset(obj);
> @@ -256,7 +256,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
>         dev = obj->dev;
>         dev_priv = to_drm_psb_private(dev);
>
> -       r = container_of(obj, struct gtt_range, gem);   /* Get the gtt range */
> +       r = to_gtt_range(obj);
>
>         /* Make sure we don't parallel update on a fault, nor move or remove
>            something from beneath our feet */
> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> index ecf8153416ac..8285358fac01 100644
> --- a/drivers/gpu/drm/gma500/gma_display.c
> +++ b/drivers/gpu/drm/gma500/gma_display.c
> @@ -349,8 +349,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>
>                 /* Unpin the old GEM object */
>                 if (gma_crtc->cursor_obj) {
> -                       gt = container_of(gma_crtc->cursor_obj,
> -                                         struct gtt_range, gem);
> +                       gt = to_gtt_range(gma_crtc->cursor_obj);
>                         psb_gtt_unpin(gt);
>                         drm_gem_object_put(gma_crtc->cursor_obj);
>                         gma_crtc->cursor_obj = NULL;
> @@ -376,7 +375,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>                 goto unref_cursor;
>         }
>
> -       gt = container_of(obj, struct gtt_range, gem);
> +       gt = to_gtt_range(obj);
>
>         /* Pin the memory into the GTT */
>         ret = psb_gtt_pin(gt);
> @@ -426,7 +425,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>
>         /* unpin the old bo */
>         if (gma_crtc->cursor_obj) {
> -               gt = container_of(gma_crtc->cursor_obj, struct gtt_range, gem);
> +               gt = to_gtt_range(gma_crtc->cursor_obj);
>                 psb_gtt_unpin(gt);
>                 drm_gem_object_put(gma_crtc->cursor_obj);
>         }
> --
> 2.33.0
>
