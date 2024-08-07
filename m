Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6894A657
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 12:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE13110E4A4;
	Wed,  7 Aug 2024 10:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeuAnBIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5BF10E4A4;
 Wed,  7 Aug 2024 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723028049; x=1754564049;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=oR6wjmW0ywkVYXOE/XRfiicEa0/7EYYqE9fCSgJGRow=;
 b=DeuAnBICKgRP41Go5wGFL9mN1MiZYHhqUz/ubno1Nem+weQdbuTIcu1Q
 q5lxj/Ls3litsaVQQnG8CMQQwrdrt2yKP1nETadlRWM5LRgAex85EjuwN
 wAyTfHRsp4Rp0hwCy1wXjdwL/wG+iYqmVwv91OxtfoZ2+9KChgFQceFnc
 KGwoZ950nk4xBDZEMS2+9KPbo20TDiFvekCu6cjSEs2zcwD+RnTLrpjO+
 LQGDp0LgusYgt5BUycVB8lQ78AwZokYLuvRrRP+Bdnb8HsUUvOOOBh3o2
 VsiNaeEiFLnIr/o1cNA+WCeAri9Tp126mUEO78u4VwQvvDLqPQ213lEBu w==;
X-CSE-ConnectionGUID: wAqYBWe2SPGoXpxYiQMdpw==
X-CSE-MsgGUID: iDnp7DAzQl+mZquEJTxJig==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32492624"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="32492624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:54:08 -0700
X-CSE-ConnectionGUID: EOQGpJa7QFi/xFYryweZMw==
X-CSE-MsgGUID: Fe7G17owTzesQsqhKQFYrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="56683889"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.244.200])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:54:06 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240521101201.18978-1-tursulin@igalia.com>
References: <20240521101201.18978-1-tursulin@igalia.com>
Subject: Re: [PATCH] drm/i915: 2 GiB of relocations ought to be enough for
 anybody*
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 kernel test robot <oliver.sang@intel.com>, Kees Cook <keescook@chromium.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, intel-gfx@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 07 Aug 2024 13:54:01 +0300
Message-ID: <172302804101.35850.2619835281498556916@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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

Quoting Tvrtko Ursulin (2024-05-21 13:12:01)
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Kernel test robot reports i915 can hit a warn in kvmalloc_node which has
> a purpose of dissalowing crazy size kernel allocations. This was added in
> 7661809d493b ("mm: don't allow oversized kvmalloc() calls"):
>=20
>        /* Don't even allow crazy sizes */
>        if (WARN_ON_ONCE(size > INT_MAX))
>                return NULL;
>=20
> This would be kind of okay since i915 at one point dropped the need for
> making a shadow copy of the relocation list, but then it got re-added in
> fd1500fcd442 ("Revert "drm/i915/gem: Drop relocation slowpath".") a year
> after Linus added the above warning.
>=20
> It is plausible that the issue was not seen until now because to trigger
> gem_exec_reloc test requires a combination of an relatively older
> generation hardware but with at least 8GiB of RAM installed. Probably even
> more depending on runtime checks.
>=20
> Lets cap what we allow userspace to pass in using the matching limit.
> There should be no issue for real userspace since we are talking about
> "crazy" number of relocations which have no practical purpose.
>=20
> *) Well IGT tests might get upset but they can be easily adjusted.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202405151008.6ddd1aaf-oliver.sang@=
intel.com
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Kent Overstreet <kent.overstreet@linux.dev>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index d3a771afb083..4b34bf4fde77 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1533,7 +1533,7 @@ static int eb_relocate_vma(struct i915_execbuffer *=
eb, struct eb_vma *ev)
>                 u64_to_user_ptr(entry->relocs_ptr);
>         unsigned long remain =3D entry->relocation_count;
> =20
> -       if (unlikely(remain > N_RELOC(ULONG_MAX)))
> +       if (unlikely(remain > N_RELOC(INT_MAX)))
>                 return -EINVAL;

Yeah, nobody will realistically need that many relocations.

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas

> =20
>         /*
> @@ -1641,7 +1641,7 @@ static int check_relocations(const struct drm_i915_=
gem_exec_object2 *entry)
>         if (size =3D=3D 0)
>                 return 0;
> =20
> -       if (size > N_RELOC(ULONG_MAX))
> +       if (size > N_RELOC(INT_MAX))
>                 return -EINVAL;
> =20
>         addr =3D u64_to_user_ptr(entry->relocs_ptr);
> --=20
> 2.44.0
>
