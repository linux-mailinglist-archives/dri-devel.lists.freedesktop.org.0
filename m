Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7250B3CB7C9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 15:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3100F6E97C;
	Fri, 16 Jul 2021 13:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469CC6E97C;
 Fri, 16 Jul 2021 13:18:26 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id j184so8603719qkd.6;
 Fri, 16 Jul 2021 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=do4NYtg1Fekus3VOaWDik8hcul43Gq8pau9ammo2VwI=;
 b=lsjX+8ssi5ZJrj3IlK64gKVoJZbXi9YXuF4oiBCMKZyBFtWSmhUV0gdW60sblYaogF
 pVgiym+cOqDF+H4kNhfPvKj/TSZHjXHeUu//vZQKX/8i08wFWnABb0WUIgsU/+zZ1gLD
 rjBugrKdMLYjpmKaiYsIuOUtD9dVCEZua4aEWl764MFShORmMPrCRQodGa/xR0rNLlcM
 W/aH46lsgvv6Sm7sKC9hF0rXimTfDmVwCMHRmGGrlCzLVS+7scO9qHms8J+v3SwBfygT
 /Fbm39OYaDxPXgRoFlQmlOVRIzmBDq6Lqm/XD5BPTUfZcfV6JI5yRnCYCqsJO1NGFbEX
 HHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=do4NYtg1Fekus3VOaWDik8hcul43Gq8pau9ammo2VwI=;
 b=ALr/64jaX6rHqMsldRJoRJZ68HZD4vzi7btO+NjldzmeLxlZRmTWBwdWbPWmViub29
 dQi36LNnfSIbg8UH/texXZubuHWh/NSG8B2tm0wJPhsLuMvoLiVASw8uwzFiV3hjRmdl
 rNM+1fUljOz2YPw5pwdyvhGBi72cws1l3we1lbmNzcL9SZLamKsIUYL/4ycjCMdcEfMu
 u9w7qExtqb6uYcKkYUpg1p0f4A0Kn3Qv1lQZnP/izXEmSDTgBmixzebrcdHM1ipHxh5u
 H1wroBcq0CreJME0Xp+3XgIKHr/RF+qOsPE4S7s1ojkNR05scn5xSRR8bIpumq1L3RkN
 dlDA==
X-Gm-Message-State: AOAM5303lWdBt4YWpXBa8vTJG6Y6Uy3hD7Jb5v/oCWbx1lY/DYsewCyq
 8jFg77O3EZ7Iut4/nXSMAz24JGCTGF1FCQHkyBgaoOTl5rA=
X-Google-Smtp-Source: ABdhPJxehnbwiBb4xRlo72zAMignJzhH/vxzMZ7mY0PYJ6buyHeSUISZPBzcl+YkTQcvH1imYGqwLjiyqNhtZgmd400=
X-Received: by 2002:a05:620a:1581:: with SMTP id
 d1mr9423595qkk.327.1626441505414; 
 Fri, 16 Jul 2021 06:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-5-jason@jlekstrand.net>
In-Reply-To: <20210715223900.1840576-5-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 14:17:56 +0100
Message-ID: <CAM0jSHN3kwyTuz=j4DAuBr0WxcB5-XyeGiPapDe8XS80jGpJ_g@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/i915/gem/ttm: Place new BOs in the requested
 region
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> __i915_gem_ttm_object_init() was ignoring the placement requests coming
> from the client and always placing all BOs in SMEM upon creation.
> Instead, compute the requested placement set from the object and pass
> that into ttm_bo_init_reserved().

AFAIK this is intentional, where we use SYS as a safe placeholder
specifically for object creation, since that avoids allocating any
actual pages. Later at get_pages() time we do the real allocation,
where we need to consider the placements.

If we set the real placements here, the ttm_bo_validate() call in
init_reserved() might allocate the backing pages here for the
lmem-only case, which is not what we want in i915.

>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 6589411396d3f..d30f274c329c7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -898,6 +898,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_re=
gion *mem,
>  {
>         static struct lock_class_key lock_class;
>         struct drm_i915_private *i915 =3D mem->i915;
> +       struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
> +       struct ttm_placement placement;
>         struct ttm_operation_ctx ctx =3D {
>                 .interruptible =3D true,
>                 .no_wait_gpu =3D false,
> @@ -919,6 +921,9 @@ int __i915_gem_ttm_object_init(struct intel_memory_re=
gion *mem,
>         /* Forcing the page size is kernel internal only */
>         GEM_BUG_ON(page_size && obj->mm.n_placements);
>
> +       GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
> +       i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
> +
>         /*
>          * If this function fails, it will call the destructor, but
>          * our caller still owns the object. So no freeing in the
> @@ -927,8 +932,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_re=
gion *mem,
>          * until successful initialization.
>          */
>         ret =3D ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), s=
ize,
> -                                  bo_type, &i915_sys_placement,
> -                                  page_size >> PAGE_SHIFT,
> +                                  bo_type, &placement, page_size >> PAGE=
_SHIFT,
>                                    &ctx, NULL, NULL, i915_ttm_bo_destroy)=
;
>         if (ret)
>                 return i915_ttm_err_to_gem(ret);
> --
> 2.31.1
>
