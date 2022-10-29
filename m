Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3461234D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 15:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF4A10E292;
	Sat, 29 Oct 2022 13:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DF010E292;
 Sat, 29 Oct 2022 13:32:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so5455314wmb.2; 
 Sat, 29 Oct 2022 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovWvPMhMVx3yZGGDynfZo7QLPoF3QUGKpTwhTdrcCss=;
 b=Jp2a8bDSLdwHYCubw8TYuljyMr02lO/CYSfhvBBKG4VPvozxBOfshWZBb47JxOhL+J
 IWB9yGjEhEY+RRNWyoIlG40oLfM9oATJKdi3zIOjXIQ0aTmTDgkexlC8SilNZF65KT5l
 Lh98PPToLFvCXmAajpROMrHT3YV7n5Mz9j+L5S//vTKR9iqo9nFDJn6Pu4wTMpuAesjK
 7dfQGyL/G8JUl6k9KWXLAcy1YesuSLqEQiQGCtLO1uTXcqve9eu0BAPjMbLkLCwgMvw8
 ijg33SW+vBG6wQeI9Bkpggxh4FZTPzmfA+S+LdGEqNpVbQbLkyIvZZpZiduxHHeTC2lW
 o9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovWvPMhMVx3yZGGDynfZo7QLPoF3QUGKpTwhTdrcCss=;
 b=va4UAubMU7UwJ1TncvEqGhKw8cqKBGW+F8/vv3okQm0a9LruBS42mwcZsxj3FGI52P
 nxZ+DKW6z0WGgKwZEcuqq9vbWLC3cJ+D26F3trz0+DW6ui2mpZTosa5TE+sctC2uLroS
 pFzOH95YcVe2SOaDhL7yqPX+Zr3e1/6S28YZmK1CbAi0syEUWhZs/6CU2srWkVOKzPx1
 1BO8xegP7xqJMTUJ3TklvMgEILwQcapbPG8WxuXWz3zRXvbG+zxxlTwffAOZqA8YSVLg
 z2uWlOxVKg7cV7sNtvJd19vVMAN0WcWLzZpvXTcFdYm+lidGJ9xEwsG50mIWtEI8vFyt
 c+vQ==
X-Gm-Message-State: ACrzQf0I1GRO9sf3kCJD1WyiuNt97P0ijkiTWp4a3kyadUOubggrZx2p
 d4tZO2LMe9agzeZ4PwgD0nQ=
X-Google-Smtp-Source: AMsMyM4E3VJ4F630pyTdokSSc05TdRQm/7azTCmFMOo0jDjFZZ2fMI7fVQ1I2TId02KSH6qhHm8oFQ==
X-Received: by 2002:a05:600c:3849:b0:3cf:4d99:fd1f with SMTP id
 s9-20020a05600c384900b003cf4d99fd1fmr11613404wmr.128.1667050331652; 
 Sat, 29 Oct 2022 06:32:11 -0700 (PDT)
Received: from suse.localnet (host-79-43-11-206.retail.telecomitalia.it.
 [79.43.11.206]) by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b003c83465ccbfsm470567wmq.35.2022.10.29.06.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 06:32:10 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhao Liu <zhao1.liu@linux.intel.com>
Subject: Re: [PATCH 2/9] drm/i915: Use kmap_local_page() in gem/i915_gem_pyhs.c
Date: Sat, 29 Oct 2022 15:32:08 +0200
Message-ID: <13152489.uLZWGnKmhe@suse>
In-Reply-To: <20221017093726.2070674-3-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-3-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Dave Hansen <dave.hansen@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>, Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On luned=EC 17 ottobre 2022 11:37:18 CEST Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1].
>=20
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption.
>=20
> In drm/i915/gem/i915_gem_phys.c, the functions
> i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
> don't need to disable pagefaults and preemption for mapping because of
> these 2 reasons:
>=20
> 1. The flush operation is safe for CPU hotplug when preemption is not
> disabled. In drm/i915/gem/i915_gem_object.c, the functions
> i915_gem_object_get_pages_phys() and i915_gem_object_put_pages_phys()
> calls drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
> Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu in
> drm_clflush_virt_range(), the flush operation is global and any issue
> with cpu's being added or removed can be handled safely.
>=20
> 2. Any context switch caused by preemption or sleep (pagefault may
> cause sleep) doesn't affect the validity of local mapping.
>=20
> Therefore, i915_gem_object_get_pages_phys() and
> i915_gem_object_put_pages_phys() are two functions where the use of
> kmap_local_page() in place of kmap_atomic() is correctly suited.
>=20
> Convert the calls of kmap_atomic() / kunmap_atomic() to
> kmap_local_page() / kunmap_local().
>=20

I have here the same questions as in 1/9.

> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.=
com
>=20
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Suggested-by: Ira Weiny <ira.weiny@intel.com>
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credits:
>   Dave: Referred to his explanation about cache flush.
>   Ira: Referred to his task document, review comments and explanation abo=
ut
>        cache flush.
>   Fabio: Referred to his boiler plate commit message.
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> b/drivers/gpu/drm/i915/gem/i915_gem_phys.c index 0d0e46dae559..d602ba19ec=
b2=20
100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -66,10 +66,10 @@ static int i915_gem_object_get_pages_phys(struct=20
drm_i915_gem_object
> *obj) if (IS_ERR(page))
>  			goto err_st;
>=20
> -		src =3D kmap_atomic(page);
> +		src =3D kmap_local_page(page);
>  		memcpy(dst, src, PAGE_SIZE);
>  		drm_clflush_virt_range(dst, PAGE_SIZE);
> -		kunmap_atomic(src);
> +		kunmap_local(src);

Please use memcpy_from_page() instead of open coding mapping + memcpy() +=20
unmapping.

>=20
>  		put_page(page);
>  		dst +=3D PAGE_SIZE;
> @@ -114,10 +114,10 @@ i915_gem_object_put_pages_phys(struct=20
drm_i915_gem_object *obj,
>  			if (IS_ERR(page))
>  				continue;
>=20
> -			dst =3D kmap_atomic(page);
> +			dst =3D kmap_local_page(page);
>  			drm_clflush_virt_range(src, PAGE_SIZE);
>  			memcpy(dst, src, PAGE_SIZE);
> -			kunmap_atomic(dst);
> +			kunmap_local(dst);

=46or the same reasons said above, memcpy_to_page() should be used here and=
=20
avoid open coding of three functions.

Using those helpers forces you to move drm_clflush_virt_range() out of the=
=20
mapping / un-mapping region. I may be wrong, however I'm pretty sure that t=
he=20
relative positions of each of those call sites is something that cannot be=
=20
randomly chosen.

Thanks,

=46abio

>=20
>  			set_page_dirty(page);
>  			if (obj->mm.madv =3D=3D I915_MADV_WILLNEED)



