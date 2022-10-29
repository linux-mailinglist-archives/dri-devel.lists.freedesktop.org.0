Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AB612249
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 13:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214A310E27C;
	Sat, 29 Oct 2022 11:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC1D10E273;
 Sat, 29 Oct 2022 11:17:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l14so9655700wrw.2;
 Sat, 29 Oct 2022 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0tXyLiYHTFHrnfELnhiBy2A0/lH8eJ/gz7nv9Y4WAk=;
 b=qxxZZXAn/0ROZrdlj6fgD9B8BnlwZogfSH6Qzy9kMn3t8WTqscrss4BHDk1ZyaHrui
 04M0Zu4YZIW2XQ3qqk1sxZasKIz41tFStQiFtXFlmJF9RQHoJFl7rCjZr04Y/+X0PGrj
 acVewaNhmXC8ArCzpydE/qod7eh5PtS7LB6+/a1LujunMi2u6cMSRW1MhxEX956htpPc
 7Y33Rd0Z8LzodRfWJ4KtoPTzryQsRtrfn8tye4K2/DFqc2Hn7qb9bJQPKue9p5E4d0Fx
 AIfFERvOrCqeY2vcuQdmbuQHb2aHjuxg0Gy6Pq/Np1h6zF+ZsphexiQ8DV4y5BpkhXFA
 npgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0tXyLiYHTFHrnfELnhiBy2A0/lH8eJ/gz7nv9Y4WAk=;
 b=cRV0DToxbrmVkrJYsA65vv26NS47ilNpf+II8ke4ktKbIz2jtgXbTSpveV1a2hpjdn
 3sJRP/F8JUBup9Rx6mEikL4A2tQtbQfU3wIJQCHvd+iKjaVmPIRGCYtwylr234SBDpzk
 HR5s6i3JjqMYTpMjYNEdWKNMA5jLA6anyOSVIQMHcf0+7K5KG0ikCHR1l0v5ub7FYlXK
 RaNS51wGa3Aq3SxA8s1xiSP4SQZvU8rOg+U8LQigrz6VMRxTIQHrRsLOZFnpLIZkipSe
 GRLHhdnTgPIkcL8sCbxyIYNEZ0DffwI8iBxxPwA28wE1XBQKrcpN2Uu1bfgx6NAJOQs/
 DNuw==
X-Gm-Message-State: ACrzQf17ZEAINmur7YE5GPb7SsScX7qsXaLGDAoBKfo8ZCKw5N7sEZPK
 GK4LtT9volxC29seZJOT0uI=
X-Google-Smtp-Source: AMsMyM6OFxR8YNWlsapvGAgXKJQWYY3dgSYdiq08z6wpiK2S3QJ21a9bAi7mXamMRWHdvBIiDvt74A==
X-Received: by 2002:adf:dd91:0:b0:236:a261:6930 with SMTP id
 x17-20020adfdd91000000b00236a2616930mr2086998wrl.551.1667042226974; 
 Sat, 29 Oct 2022 04:17:06 -0700 (PDT)
Received: from suse.localnet (host-79-43-11-206.retail.telecomitalia.it.
 [79.43.11.206]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056000104600b0022e344a63c7sm1227924wrx.92.2022.10.29.04.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:17:05 -0700 (PDT)
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
Subject: Re: [PATCH 1/9] drm/i915: Use kmap_local_page() in
 gem/i915_gem_object.c
Date: Sat, 29 Oct 2022 13:17:03 +0200
Message-ID: <2541717.Lt9SDvczpP@suse>
In-Reply-To: <20221017093726.2070674-2-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <20221017093726.2070674-2-zhao1.liu@linux.intel.com>
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

On luned=EC 17 ottobre 2022 11:37:17 CEST Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1].
>=20
> The main difference between atomic and local mappings is that local
> mappings doesn't disable page faults or preemption.

You are right about about page faults which are never disabled by=20
kmap_local_page(). However kmap_atomic might not disable preemption. It=20
depends on CONFIG_PREEMPT_RT.

Please refer to how kmap_atomic_prot() works (this function is called by=20
kmap_atomic() when kernels have HIGHMEM enabled).

>=20
> There're 2 reasons why i915_gem_object_read_from_page_kmap() doesn't
> need to disable pagefaults and preemption for mapping:
>=20
> 1. The flush operation is safe for CPU hotplug when preemption is not
> disabled.=20

I'm confused here. Why are you talking about CPU hotplug?
In any case, developers should never rely on implicit calls of=20
preempt_disable() for the reasons said above. Therefore, flush operations=20
should be allowed regardless that kmap_atomic() potential side effect.

> In drm/i915/gem/i915_gem_object.c, the function
> i915_gem_object_read_from_page_kmap() calls drm_clflush_virt_range()

If I recall correctly, drm_clflush_virt_range() can always be called with p=
age=20
faults and preemption enabled. If so, this is enough to say that the=20
conversion is safe.=20

Is this code explicitly related to flushing the cache lines before removing=
 /=20
adding CPUs? If I recall correctly, there are several other reasons behind =
the=20
need to issue cache lines flushes. Am I wrong about this?

Can you please say more about what I'm missing here?

> to
> use CLFLUSHOPT or WBINVD to flush. Since CLFLUSHOPT is global on x86
> and WBINVD is called on each cpu in drm_clflush_virt_range(), the flush
> operation is global and any issue with cpu's being added or removed
> can be handled safely.

Again your main concern is about CPU hotplug.

Even if I'm missing something, do we really need all these details about th=
e=20
inner workings of drm_clflush_virt_range()?=20

I'm not an expert, so may be that I'm wrong about all I wrote above.

Therefore, can you please elaborate a little more for readers with very lit=
tle=20
knowledge of these kinds of things (like me and perhaps others)?
=20
> 2. Any context switch caused by preemption or sleep (pagefault may
> cause sleep) doesn't affect the validity of local mapping.

I'd replace "preemption or sleep" with "preemption and page faults" since=20
yourself then added that page faults lead to tasks being put to sleep. =20

> Therefore, i915_gem_object_read_from_page_kmap() is a function where
> the use of kmap_local_page() in place of kmap_atomic() is correctly
> suited.
>=20
> Convert the calls of kmap_atomic() / kunmap_atomic() to
> kmap_local_page() / kunmap_local().
>=20
> And remove the redundant variable that stores the address of the mapped
> page since kunmap_local() can accept any pointer within the page.
>=20
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
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> b/drivers/gpu/drm/i915/gem/i915_gem_object.c index=20
369006c5317f..a0072abed75e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -413,17 +413,15 @@ void __i915_gem_object_invalidate_frontbuffer(struct
> drm_i915_gem_object *obj, static void
>  i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, u64=
=20
offset, void
> *dst, int size) {
> -	void *src_map;
>  	void *src_ptr;
>=20
> -	src_map =3D kmap_atomic(i915_gem_object_get_page(obj, offset >>=20
PAGE_SHIFT));
> -
> -	src_ptr =3D src_map + offset_in_page(offset);
> +	src_ptr =3D kmap_local_page(i915_gem_object_get_page(obj, offset >>=20
PAGE_SHIFT))
> +	          + offset_in_page(offset);
>  	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
>  		drm_clflush_virt_range(src_ptr, size);
>  	memcpy(dst, src_ptr, size);
>=20
> -	kunmap_atomic(src_map);
> +	kunmap_local(src_ptr);
>  }
>=20
>  static void

The changes look good, but I'd like to better understand the commit message.

Thanks,

=46abio=20


