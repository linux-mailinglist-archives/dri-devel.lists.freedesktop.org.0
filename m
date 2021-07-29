Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0093D9B9C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 04:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2526EC47;
	Thu, 29 Jul 2021 02:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8686EC47
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 02:14:44 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so4232583oth.7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 19:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=RKcHeVvw16ovUpP8GEZ6BTrOqKRokMe4yAiNEIUj+ew=;
 b=lHM9MrZBCcdqjOiYzh5aS5m1SCpmNbjI1/f3+dV75FUKSnkpNy0enFMCyf/Zja+xET
 9T065+MmGCFyXdXk7AAtgT1UE7aMrvRVY0jd0exTi4SDZYz6gDib4OIR+4NR/pWzDnAD
 wQNEYDNY++h4QcBbrSBEFYGuIRkYcqPNTJ/J+c202GRn5DaRveI/UeUVCzAFJtPSY7p4
 JS13dWon5hsfp1AhjoAspAuPXxKrkJ5Gvs6ye/haNmqrB+muYV+QsM9A1t5Cx3oJiU/S
 6HVHPMvuJM9d5vYwQ0KyoEcLsQiCixeVsq3ePlzGiwWVRs2XKnb4HsT13OT/aTuUH9qo
 kDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=RKcHeVvw16ovUpP8GEZ6BTrOqKRokMe4yAiNEIUj+ew=;
 b=bokLrtBx0xMt1sxKaGwOX6MwHiU3Ebv5HfL3bwrpto2FX5/TbDK9+PWqqJeLHtS2N1
 pfaTRqpORQjxIQTslwqFttc4xeAfXErqcfU5oAg9mIHflSU1zrVFP8c4pdDycYitV0PE
 sXH2yFkcl4zyaO06uN4/w+26mz3J0UZcdotBz/rZV8B3Xt4noN5WLK3wO9KG6R0+lwN9
 M5ocSLRRFdphmrtvO3Z1CdUs2aT1EPb/kOG1ionZprFAmPeSu8luc3dZDABjt+Nq53Xg
 fZJZUA4yNIAIaTqZDSo6tXLfC71UXGHc2tXyfqsdlnPoWPHQUZvp7o2vFX7lXqwsbyjR
 j61A==
X-Gm-Message-State: AOAM531lSYm/TnFpL2qEubntCNMfvlYy3HyRMeHDdYL5jeKXkOKQ2vk4
 GRA+sA9sRSXfLpnfX9yijqJnqA==
X-Google-Smtp-Source: ABdhPJwPJ53Vs9M4+90a0FM9VefA6mhmmSbR2UkVToV2IIkvkRyb2QjnfUKiCOOxrZpiD9WYdgbZzg==
X-Received: by 2002:a05:6830:1414:: with SMTP id
 v20mr1887957otp.69.1627524883485; 
 Wed, 28 Jul 2021 19:14:43 -0700 (PDT)
Received: from [100.72.193.189] ([209.107.186.70])
 by smtp.gmail.com with ESMTPSA id z22sm274888ooz.20.2021.07.28.19.14.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Jul 2021 19:14:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Matthew Auld <matthew.auld@intel.com>, <intel-gfx@lists.freedesktop.org>
Date: Wed, 28 Jul 2021 21:14:41 -0500
Message-ID: <17af00ad680.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <20210728155711.1744601-1-matthew.auld@intel.com>
References: <20210728155711.1744601-1-matthew.auld@intel.com>
User-Agent: AquaMail/1.30.0-1826 (build: 103000001)
Subject: Re: [PATCH] drm/i915/selftests: prefer the create_user helper
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="17af00ada8db272817f17f5af"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--17af00ada8db272817f17f5af
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On July 28, 2021 10:57:23 Matthew Auld <matthew.auld@intel.com> wrote:

> No need to hand roll the set_placements stuff, now that that we have a
> helper for this. Also no need to handle the -ENODEV case here, since
> NULL mr implies missing device support, where the for_each_memory_region
> helper will always skip over such regions.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>


> ---
> .../drm/i915/gem/selftests/i915_gem_mman.c    | 46 ++-----------------
> 1 file changed, 4 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c 
> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 0b2b73d8a364..eed1c2c64e75 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -860,24 +860,6 @@ static bool can_mmap(struct drm_i915_gem_object *obj, 
> enum i915_mmap_type type)
>  return !no_map;
> }
>
> -static void object_set_placements(struct drm_i915_gem_object *obj,
> -  struct intel_memory_region **placements,
> -  unsigned int n_placements)
> -{
> - GEM_BUG_ON(!n_placements);
> -
> - if (n_placements == 1) {
> - struct drm_i915_private *i915 = to_i915(obj->base.dev);
> - struct intel_memory_region *mr = placements[0];
> -
> - obj->mm.placements = &i915->mm.regions[mr->id];
> - obj->mm.n_placements = 1;
> - } else {
> - obj->mm.placements = placements;
> - obj->mm.n_placements = n_placements;
> - }
> -}
> -
> #define expand32(x) (((x) << 0) | ((x) << 8) | ((x) << 16) | ((x) << 24))
> static int __igt_mmap(struct drm_i915_private *i915,
>       struct drm_i915_gem_object *obj,
> @@ -972,15 +954,10 @@ static int igt_mmap(void *arg)
>  struct drm_i915_gem_object *obj;
>  int err;
>
> - obj = i915_gem_object_create_region(mr, sizes[i], 0, I915_BO_ALLOC_USER);
> - if (obj == ERR_PTR(-ENODEV))
> - continue;
> -
> + obj = __i915_gem_object_create_user(i915, sizes[i], &mr, 1);
>  if (IS_ERR(obj))
>  return PTR_ERR(obj);
>
> - object_set_placements(obj, &mr, 1);
> -
>  err = __igt_mmap(i915, obj, I915_MMAP_TYPE_GTT);
>  if (err == 0)
>  err = __igt_mmap(i915, obj, I915_MMAP_TYPE_WC);
> @@ -1101,15 +1078,10 @@ static int igt_mmap_access(void *arg)
>  struct drm_i915_gem_object *obj;
>  int err;
>
> - obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
> - if (obj == ERR_PTR(-ENODEV))
> - continue;
> -
> + obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>  if (IS_ERR(obj))
>  return PTR_ERR(obj);
>
> - object_set_placements(obj, &mr, 1);
> -
>  err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_GTT);
>  if (err == 0)
>  err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_WB);
> @@ -1248,15 +1220,10 @@ static int igt_mmap_gpu(void *arg)
>  struct drm_i915_gem_object *obj;
>  int err;
>
> - obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
> - if (obj == ERR_PTR(-ENODEV))
> - continue;
> -
> + obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>  if (IS_ERR(obj))
>  return PTR_ERR(obj);
>
> - object_set_placements(obj, &mr, 1);
> -
>  err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_GTT);
>  if (err == 0)
>  err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_WC);
> @@ -1405,15 +1372,10 @@ static int igt_mmap_revoke(void *arg)
>  struct drm_i915_gem_object *obj;
>  int err;
>
> - obj = i915_gem_object_create_region(mr, PAGE_SIZE, 0, I915_BO_ALLOC_USER);
> - if (obj == ERR_PTR(-ENODEV))
> - continue;
> -
> + obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>  if (IS_ERR(obj))
>  return PTR_ERR(obj);
>
> - object_set_placements(obj, &mr, 1);
> -
>  err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_GTT);
>  if (err == 0)
>  err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_WC);
> --
> 2.26.3


--17af00ada8db272817f17f5af
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On July 28, 2021 10:57:2=
3 Matthew Auld &lt;matthew.auld@intel.com&gt; wrote:</span></div><div id=3D=
"aqm-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">No need to hand roll the set_placements stuff, now that t=
hat we have a</div>
<div dir=3D"auto">helper for this. Also no need to handle the -ENODEV case =
here, since</div>
<div dir=3D"auto">NULL mr implies missing device support, where the for_eac=
h_memory_region</div>
<div dir=3D"auto">helper will always skip over such regions.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Matthew Auld &lt;matthew.auld@intel.com&gt=
;</div>
<div dir=3D"auto">Cc: Jason Ekstrand &lt;jason@jlekstrand.net&gt;</div></bl=
ockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: J=
ason Ekstrand &lt;jason@jlekstrand.net&gt;</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: black=
;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"ma=
rgin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;">=
<div dir=3D"auto"></div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;.../drm/i915/gem/selftests/i915_gem_mman.c &nbsp; &=
nbsp;| 46 ++-----------------</div>
<div dir=3D"auto">&nbsp;1 file changed, 4 insertions(+), 42 deletions(-)</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_=
mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c</div>
<div dir=3D"auto">index 0b2b73d8a364..eed1c2c64e75 100644</div>
<div dir=3D"auto">--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c<=
/div>
<div dir=3D"auto">+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c<=
/div>
<div dir=3D"auto">@@ -860,24 +860,6 @@ static bool can_mmap(struct drm_i915=
_gem_object *obj, enum i915_mmap_type type)</div>
<div dir=3D"auto">&nbsp;=09return !no_map;</div>
<div dir=3D"auto">&nbsp;}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-static void object_set_placements(struct drm_i915_gem_ob=
ject *obj,</div>
<div dir=3D"auto">-=09=09=09=09 &nbsp;struct intel_memory_region **placemen=
ts,</div>
<div dir=3D"auto">-=09=09=09=09 &nbsp;unsigned int n_placements)</div>
<div dir=3D"auto">-{</div>
<div dir=3D"auto">-=09GEM_BUG_ON(!n_placements);</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">-=09if (n_placements =3D=3D 1) {</div>
<div dir=3D"auto">-=09=09struct drm_i915_private *i915 =3D to_i915(obj-&gt;=
base.dev);</div>
<div dir=3D"auto">-=09=09struct intel_memory_region *mr =3D placements[0];<=
/div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">-=09=09obj-&gt;mm.placements =3D &amp;i915-&gt;mm.regions=
[mr-&gt;id];</div>
<div dir=3D"auto">-=09=09obj-&gt;mm.n_placements =3D 1;</div>
<div dir=3D"auto">-=09} else {</div>
<div dir=3D"auto">-=09=09obj-&gt;mm.placements =3D placements;</div>
<div dir=3D"auto">-=09=09obj-&gt;mm.n_placements =3D n_placements;</div>
<div dir=3D"auto">-=09}</div>
<div dir=3D"auto">-}</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">&nbsp;#define expand32(x) (((x) &lt;&lt; 0) | ((x) &lt;&l=
t; 8) | ((x) &lt;&lt; 16) | ((x) &lt;&lt; 24))</div>
<div dir=3D"auto">&nbsp;static int __igt_mmap(struct drm_i915_private *i915=
,</div>
<div dir=3D"auto">&nbsp;=09=09 &nbsp; &nbsp; &nbsp;struct drm_i915_gem_obje=
ct *obj,</div>
<div dir=3D"auto">@@ -972,15 +954,10 @@ static int igt_mmap(void *arg)</div=
>
<div dir=3D"auto">&nbsp;=09=09=09struct drm_i915_gem_object *obj;</div>
<div dir=3D"auto">&nbsp;=09=09=09int err;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09=09obj =3D i915_gem_object_create_region(mr, sizes=
[i], 0, I915_BO_ALLOC_USER);</div>
<div dir=3D"auto">-=09=09=09if (obj =3D=3D ERR_PTR(-ENODEV))</div>
<div dir=3D"auto">-=09=09=09=09continue;</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">+=09=09=09obj =3D __i915_gem_object_create_user(i915, siz=
es[i], &amp;mr, 1);</div>
<div dir=3D"auto">&nbsp;=09=09=09if (IS_ERR(obj))</div>
<div dir=3D"auto">&nbsp;=09=09=09=09return PTR_ERR(obj);</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09=09object_set_placements(obj, &amp;mr, 1);</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">&nbsp;=09=09=09err =3D __igt_mmap(i915, obj, I915_MMAP_TY=
PE_GTT);</div>
<div dir=3D"auto">&nbsp;=09=09=09if (err =3D=3D 0)</div>
<div dir=3D"auto">&nbsp;=09=09=09=09err =3D __igt_mmap(i915, obj, I915_MMAP=
_TYPE_WC);</div>
<div dir=3D"auto">@@ -1101,15 +1078,10 @@ static int igt_mmap_access(void *=
arg)</div>
<div dir=3D"auto">&nbsp;=09=09struct drm_i915_gem_object *obj;</div>
<div dir=3D"auto">&nbsp;=09=09int err;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09obj =3D i915_gem_object_create_region(mr, PAGE_SIZ=
E, 0, I915_BO_ALLOC_USER);</div>
<div dir=3D"auto">-=09=09if (obj =3D=3D ERR_PTR(-ENODEV))</div>
<div dir=3D"auto">-=09=09=09continue;</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">+=09=09obj =3D __i915_gem_object_create_user(i915, PAGE_S=
IZE, &amp;mr, 1);</div>
<div dir=3D"auto">&nbsp;=09=09if (IS_ERR(obj))</div>
<div dir=3D"auto">&nbsp;=09=09=09return PTR_ERR(obj);</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09object_set_placements(obj, &amp;mr, 1);</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">&nbsp;=09=09err =3D __igt_mmap_access(i915, obj, I915_MMA=
P_TYPE_GTT);</div>
<div dir=3D"auto">&nbsp;=09=09if (err =3D=3D 0)</div>
<div dir=3D"auto">&nbsp;=09=09=09err =3D __igt_mmap_access(i915, obj, I915_=
MMAP_TYPE_WB);</div>
<div dir=3D"auto">@@ -1248,15 +1220,10 @@ static int igt_mmap_gpu(void *arg=
)</div>
<div dir=3D"auto">&nbsp;=09=09struct drm_i915_gem_object *obj;</div>
<div dir=3D"auto">&nbsp;=09=09int err;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09obj =3D i915_gem_object_create_region(mr, PAGE_SIZ=
E, 0, I915_BO_ALLOC_USER);</div>
<div dir=3D"auto">-=09=09if (obj =3D=3D ERR_PTR(-ENODEV))</div>
<div dir=3D"auto">-=09=09=09continue;</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">+=09=09obj =3D __i915_gem_object_create_user(i915, PAGE_S=
IZE, &amp;mr, 1);</div>
<div dir=3D"auto">&nbsp;=09=09if (IS_ERR(obj))</div>
<div dir=3D"auto">&nbsp;=09=09=09return PTR_ERR(obj);</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09object_set_placements(obj, &amp;mr, 1);</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">&nbsp;=09=09err =3D __igt_mmap_gpu(i915, obj, I915_MMAP_T=
YPE_GTT);</div>
<div dir=3D"auto">&nbsp;=09=09if (err =3D=3D 0)</div>
<div dir=3D"auto">&nbsp;=09=09=09err =3D __igt_mmap_gpu(i915, obj, I915_MMA=
P_TYPE_WC);</div>
<div dir=3D"auto">@@ -1405,15 +1372,10 @@ static int igt_mmap_revoke(void *=
arg)</div>
<div dir=3D"auto">&nbsp;=09=09struct drm_i915_gem_object *obj;</div>
<div dir=3D"auto">&nbsp;=09=09int err;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09obj =3D i915_gem_object_create_region(mr, PAGE_SIZ=
E, 0, I915_BO_ALLOC_USER);</div>
<div dir=3D"auto">-=09=09if (obj =3D=3D ERR_PTR(-ENODEV))</div>
<div dir=3D"auto">-=09=09=09continue;</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">+=09=09obj =3D __i915_gem_object_create_user(i915, PAGE_S=
IZE, &amp;mr, 1);</div>
<div dir=3D"auto">&nbsp;=09=09if (IS_ERR(obj))</div>
<div dir=3D"auto">&nbsp;=09=09=09return PTR_ERR(obj);</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09object_set_placements(obj, &amp;mr, 1);</div>
<div dir=3D"auto">-</div>
<div dir=3D"auto">&nbsp;=09=09err =3D __igt_mmap_revoke(i915, obj, I915_MMA=
P_TYPE_GTT);</div>
<div dir=3D"auto">&nbsp;=09=09if (err =3D=3D 0)</div>
<div dir=3D"auto">&nbsp;=09=09=09err =3D __igt_mmap_revoke(i915, obj, I915_=
MMAP_TYPE_WC);</div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.26.3</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--17af00ada8db272817f17f5af--

