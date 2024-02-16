Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1258578DD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8208D10EAD5;
	Fri, 16 Feb 2024 09:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2+hV/H9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B9410EACB;
 Fri, 16 Feb 2024 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708075902; x=1739611902;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AmxN9cHuAukKG8/lL+pRiaRhvqyc1X782IP6Er/+qW0=;
 b=h2+hV/H966bTnnG0N3xBtrDVWYO8oH44iMWg+hc6ojlWibjR1sajBKSJ
 bS7oDBRBvxH4ivqZwiaA3egKxVA9d3IEwHJcVBlCiTw+YFYgpW//KXIGw
 NjyUMjq7kxduntSSMNlIf4mXKMyv7r8PaTm+fV1VNXKgp+SacVyuscSyn
 V4uu+qrEJQONVM3BLheHZq9/gWcRVe3SrwiKeoyE1tjIFk8hnl4D0j0XO
 KwbqKQHAxoyb9xKoKZbQM8KxQqIuoFc1AI19LMUwQ3zQ8MifG/Gp7Ziai
 hSo1tnTRPGY5jHMY+DmjMMdGGT2Y6JdJq5v+/B5c7SP5T2L2dwIMG5Em6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="24662915"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="24662915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="4108755"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.121])
 ([10.249.254.121])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:31:35 -0800
Message-ID: <7ee39ada7fbcbd19b7dc3e780818b7f0941283a6.camel@linux.intel.com>
Subject: Re: [PULL] drm-intel-gt-next
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  dim-tools@lists.freedesktop.org
Date: Fri, 16 Feb 2024 10:31:32 +0100
In-Reply-To: <CAPM=9twPjYvnAZQKEWrc2zvjTC4W2rfn9TWsHE8_QSgVUiPbOg@mail.gmail.com>
References: <Zc3iIVsiAwo+bu10@tursulin-desk>
 <CAPM=9twPjYvnAZQKEWrc2zvjTC4W2rfn9TWsHE8_QSgVUiPbOg@mail.gmail.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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

Hi, Dave

On Fri, 2024-02-16 at 12:58 +1000, Dave Airlie wrote:
> On Thu, 15 Feb 2024 at 20:06, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >=20
> > Hi Dave, Daniel,
> >=20
> > First pull request for 6.9 with probably one more coming in one to
> > two
> > weeks.
> >=20
> > Nothing to interesting in this one, mostly a sprinkle of small
> > fixes in
> > GuC, HuC, Perf/OA, a tiny bit of prep work for future platforms and
> > some
> > code cleanups.
> >=20
> > One new uapi in the form of a GuC submission version query which
> > Mesa
> > wants for implementing Vulkan async compute queues.
> >=20
> > Regards,
> >=20
> > Tvrtko
> >=20
> > drm-intel-gt-next-2024-02-15:
> > UAPI Changes:
> >=20
> > - Add GuC submission interface version query (Tvrtko Ursulin)
> >=20
> > Driver Changes:
> >=20
> > Fixes/improvements/new stuff:
> >=20
> > - Atomically invalidate userptr on mmu-notifier (Jonathan Cavitt)
>=20
> I've pulled this, but the above patch is triggering my this seems
> wrong spider sense.
>=20
> This and probably the preceeding patch that this references seem to
> move i915 to a long term pinning of userptr in memory with what I can
> see no accounting, and away from what the desired behaviour for
> drivers should be.

I can only answer for the first patch there, It was some time ago it
was written, but at that point the pinning was held both by get_pages()
and by submission. I removed the submission pinning and instead moved
get_pages() to start of submission. So no significant change in pinning
time there. For some reason I can't clearly remember the submission
pinning got in the way of the vm_bind implementation. That said, the
pinning AFAIR is released in the gem shrinker. And it's different from
what other drivers are doing. i915 never got to the point where it
completely dropped the pinning after the binding.

/Thomas


>=20
> It also feels like the authorship on this might be lies which also
> worries me.
>=20
> Dave.

