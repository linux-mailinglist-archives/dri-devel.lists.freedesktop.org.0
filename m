Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAA6A89780
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB0610E69A;
	Tue, 15 Apr 2025 09:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaoT9aKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931A910E69A;
 Tue, 15 Apr 2025 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744708084; x=1776244084;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oMGn+Uvpm63tpBWdMLqAzsaYy5MGQUBVh3XFJ4N+pY4=;
 b=jaoT9aKTsKSEpYW8laXyfr+1a/6PRKWNXUtIKwHzjmVZ8PmSq+Jy21+2
 drKIxHGr02+KTBW+/8ZyrgMJVQS+jBAGGRwQEAPjlhwfzK40dHikzhizF
 J9JynHPtcypFLOa0VnaAeFPhYDIw28nFUe6RHDJP4jNXZUWkOk6D81hSa
 RO8z6G5ZV0UXs9Uubu8MT3LCgQY5O01uHT/zfNdPI86LHSPYgEKqez3pP
 SIRj1GR4+0Q0cuRMzp9nL+w/OUK5hKARXZ70eSlvvRwC7tWR++EiACnt0
 G6ePvy1VFWvC3O7QWvFr3VWkacjzd3f8XFJqy+8Pv8tH4y31T+MvMGyad Q==;
X-CSE-ConnectionGUID: W784cUoARu+RdRlmOjuoNg==
X-CSE-MsgGUID: DHcwX7suRlWNnuuW6T9QVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46370516"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46370516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:08:04 -0700
X-CSE-ConnectionGUID: PWdu4CxjQrGoEVn4JNCM2Q==
X-CSE-MsgGUID: Ko5iN2FuRuy0a2/a9weotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130595799"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:08:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to
 `intel_pxp_gsccs_is_ready_for_sessions'
In-Reply-To: <CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
 <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
 <87sem9svmn.fsf@intel.com>
 <CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
Date: Tue, 15 Apr 2025 12:07:56 +0300
Message-ID: <87mschssgj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
> Jani Nikula <jani.nikula@linux.intel.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=
=8815=E6=97=A5=E5=91=A8=E4=BA=8C 15:59=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Fri, 11 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
>> > On x86_64 with gcc version 13.3.0, I compile kernel with:
>> >
>> >   make defconfig
>> >   ./scripts/kconfig/merge_config.sh .config <(
>> >     echo CONFIG_COMPILE_TEST=3Dy
>> >   )
>> >   make KCFLAGS=3D"-fno-inline-functions -fno-inline-small-functions -f=
no-inline-functions-called-once"
>>
>> The change looks good, but I'm guessing the real explanation is that you
>> have CONFIG_DRM_I915_PXP=3Dn and that appears to be broken.
>>
>> Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup=
")
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>
>> But how do you want this merged?
>>
>
> As patch 5 has been merged into rdma-next, I think it's OK to merge
> this single patch into your tree.

Thanks. I amended the commit message a little, and resent this to
intel-gfx [1], and will merge it via drm-intel-next.

BR,
Jani.



[1] https://lore.kernel.org/r/20250415090616.2649889-1-jani.nikula@intel.com



--=20
Jani Nikula, Intel
