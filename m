Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0926120DF
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2F910E1AB;
	Sat, 29 Oct 2022 07:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEBC10E1AB;
 Sat, 29 Oct 2022 07:12:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so455631wmp.5; 
 Sat, 29 Oct 2022 00:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LmWzyQSrl0RTIim8O+jOq3HpQpoL52+tegLujW7nc0=;
 b=Qamia2mNdG+4Etnm9fZK/GEWc2oTqVjcWJemA7+faBe3tTKpki0Pviae5dWL+SMhnM
 /H7Tc0jAkp/j45lulMewb6aSxzuN4FO4dV5/POjSf5dYTtDkYkZjsYctkEPWVfx7kypa
 4cmCWsoCwhMC8V6eVGEjLvzrS6NKQ0De4PbQ1Pu/H9VWjInsIsuwAJOa1DkJ3GL0P08m
 6IDjGrkVG1n3jeEHGclMpBc4QqOi4iymkVfTm+pkkU3cUBL688P9Wxp2mLlFB96vvgtn
 7ZBgRVK3DVM80isOIS3GhW7yhMous00OcaYmNpZAbZwHX/oXFfeGTbZEdTgtf8JF2LCb
 BVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8LmWzyQSrl0RTIim8O+jOq3HpQpoL52+tegLujW7nc0=;
 b=rwiJV/fRDdf/K0izRQXHAXMiPeqrUpuAiamuwMe1R1Hx/yoZsQatHLhqRU2vyzhiqj
 3Vnun1PfySBgKT+h8l4S9LS1SnETgIoo1sTtP/8A4+LfK5Mzw+l6Yr+zdS2uhYtQHgPN
 Od3uhOPa15GqlDyOZ1ifF7rYXthpPGmMMDJSGO/YO/WDttOjl8uNmCjDeZrK69tnWuoF
 QmlYjAZKAlif6euKSUbHD2cvNobEeHbVCWxG1j0okpez0DXjKtDYZMdoW3a9XWtQFuio
 /oOc6/3SE2Icjs0a0DLHm1XNj9l4mWQ0Q/n8OUNaSQCP9mSU/CNVhzJ5E5avtrmzDpAD
 s3mA==
X-Gm-Message-State: ACrzQf1ax8JXkOfW1D4ZvmYnpEAhRiazXtXhjsuvfuKeCp1F7zqWxbYO
 2XuZPgEH6sc2KwyNwaDaqzw=
X-Google-Smtp-Source: AMsMyM5VbYe3KHUjunTOUobsVeVOTS3YZupYVm5K8P3gIxM9vM1MlavEhYY3mc9wL16JxW82wUzG7g==
X-Received: by 2002:a05:600c:26cb:b0:3cf:6265:ddc6 with SMTP id
 11-20020a05600c26cb00b003cf6265ddc6mr1902095wmv.195.1667027551615; 
 Sat, 29 Oct 2022 00:12:31 -0700 (PDT)
Received: from suse.localnet (host-79-43-11-206.retail.telecomitalia.it.
 [79.43.11.206]) by smtp.gmail.com with ESMTPSA id
 k3-20020a5d5183000000b00231ed902a4esm784817wrv.5.2022.10.29.00.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 00:12:30 -0700 (PDT)
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
Subject: Re: [PATCH 0/9] drm/i915: Replace kmap_atomic() with kmap_local_page()
Date: Sat, 29 Oct 2022 09:12:27 +0200
Message-ID: <10176905.nUPlyArG6x@suse>
In-Reply-To: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
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
Cc: Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On luned=EC 17 ottobre 2022 11:37:16 CEST Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1].

Some words to explain why kmap_atomic was deprecated won't hurt. Many=20
maintainers and reviewers, and also casual readers might not yet be aware o=
f=20
the reasons behind that deprecation.
=20
> In the following patches, we can convert the calls of kmap_atomic() /
> kunmap_atomic() to kmap_local_page() / kunmap_local(), which can
> instead do the mapping / unmapping regardless of the context.

Readers are probably much more interested in what you did in the following=
=20
patches and why you did it, instead of being informed about what "we can" d=
o.

I would suggest something like "The following patches convert the calls to=
=20
kmap_atomic() to kmap_local_page() [the rest looks OK]".

This could also be the place to say something about why we prefer=20
kmap_local_page() to kmap_atomic().=20

Are you sure that the reasons that motivates your conversions are merely=20
summarized to kmap_local_page() being able to do mappings regardless of=20
context? I think you are missing the real reasons why.=20

What about avoiding the often unwanted side effect of unnecessary page faul=
ts=20
disables?

>=20
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible.

No news here. kmap_atomic() is "per thread, CPU local and not glocally=20
visible". I cannot see any difference here between kmap_atomic() and=20
kmap_local_page().

>=20
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.=
com
> ---
> Zhao Liu (9):
>   drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
>   drm/i915: Use kmap_local_page() in gem/i915_gem_pyhs.c
>   drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
>   drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
>   drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
>   drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
>   drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
>   drm/i915: Use kmap_local_page() in i915_cmd_parser.c
>   drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c
>=20
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c       | 10 +++++-----
>  drivers/gpu/drm/i915/gem/i915_gem_object.c           |  8 +++-----
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c             |  8 ++++----
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c            |  6 ++++--
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c      |  6 +++---
>  .../gpu/drm/i915/gem/selftests/i915_gem_coherency.c  | 12 ++++--------
>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c    |  8 ++++----
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             |  5 +----
>  drivers/gpu/drm/i915/i915_cmd_parser.c               |  4 ++--
>  9 files changed, 30 insertions(+), 37 deletions(-)

Thanks for helping with kmap_atomic() conversions to kmap_local_page().

=46abio


