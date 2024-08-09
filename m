Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D194CC59
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 10:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D0C10E0C2;
	Fri,  9 Aug 2024 08:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XW6BwU75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A15898A4;
 Fri,  9 Aug 2024 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723192534; x=1754728534;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=IxIAuTATFbgSNxUVw+Di74EcQOhyvZJXvTlffW4uQv4=;
 b=XW6BwU75eyQT5DN0lahNx+T2KWLlLB82jev0ROFWs9aHRmVNSyphl0en
 kYWsz/IjVtVBwCsMU4depnYEMF8/fDSqmwBQVKF2HAnRhoXeXaIApu8UO
 0ApHvi4Au17ewxsPHtBeiiZDz/agyOpef5KuMBpjtGy7Sw5HyzdTXLEwd
 RXvr7EwyoI1ZJR4hiAj7RHx3eNMa0L9E1EJExnwsa9WMk/nUHej/a01NY
 XviehDBQKbpOaTyqj3Micz+NpJgW9wH55btcsk+m2rnhEyOwOBwgVyA9i
 n7XqiH1ycc6n5Xj5CcTEvhEWkf9bu+Kmk1hs5HcaHVKSzV70DVusbelVT A==;
X-CSE-ConnectionGUID: b9ToXPfiRcSQDAwziFVxhw==
X-CSE-MsgGUID: 5IjThUyRQ5+lTqLKRdC9og==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="12931197"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="12931197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 01:35:33 -0700
X-CSE-ConnectionGUID: H0OaZmenSyGcWMVWrzteqg==
X-CSE-MsgGUID: 7EXSLM+pQQ2ZP0IJSruhGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="62143851"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.235])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 01:35:28 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3b87c155-f35d-4812-a4b3-ac5e0bfe0c18@kernel.org>
References: <ZrSFpj20b1LbBhCJ@linux>
 <8f7c531a-ecb9-4c30-b4bb-2bdf3056ff34@kernel.org>
 <3b87c155-f35d-4812-a4b3-ac5e0bfe0c18@kernel.org>
Subject: Re: [PULL] drm-intel-fixes
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tvrtko Ursulin <tursulin@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 09 Aug 2024 11:35:23 +0300
Message-ID: <172319252380.21349.12392253333144037613@jlahtine-mobl.ger.corp.intel.com>
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

Quoting Krzysztof Kozlowski (2024-08-08 21:44:39)
> On 08/08/2024 20:35, Krzysztof Kozlowski wrote:
> > On 08/08/2024 10:45, Tvrtko Ursulin wrote:
> >>
> >> Hi Dave, Sima,
> >>
> >> A small bunch of fixes for the weekly cycle:
> >=20
> > ...
> >=20
> >>
> >> ----------------------------------------------------------------
> >> Andi Shyti (2):
> >>       drm/i915/gem: Adjust vma offset for framebuffer mmap offset
> >>       drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
> >>
> >> David Gow (2):
> >>       drm/i915: Allow evicting to use the requested placement
> >>       drm/i915: Attempt to get pages without eviction first
> >>
> >> Dnyaneshwar Bhadane (1):
> >>       drm/i915/display: correct dual pps handling for MTL_PCH+
> >=20
> > Several commits have issues. Look:
> >=20
> >     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >     Link: https://patchwork.freedesktop.org/patch/msgid ...
> >     (cherry picked from commit 97b6784753da06d9d40232328efc5c5367e53417)
> >     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >=20
> >=20
> > 1. Duplicated committer SoB.
> > You added SoB. No need to add two. It does not get stronger. You do not
> > change the DCO rules by adding two SoBs. You cannot confirm something
> > more or twice. Read DCO one more time...

Hi Krzysztof,

As a self-proclaimed quite active kernel developer (by a quick web search)
you might have already ventured to look at the GIT history of the subsytem =

tree for the patch in question. If you did that, you might have implied that
the second S-o-b is added by automation -- and it indeed is.

While appreciating the report, maybe not so much the the condescending
style of the communication. You now slightly come through as a troll
hoping to be fed - I hope that is not the case.

Seems like we've had such a double S-o-b regularly generated by DIM (Drm
Inglorious Maintainer scripts) at least since 2016 as the first occurrance
seems to have been in ccda3a728f70 . So rest of the ecosystem seems to
deal with them just fine.

Is the double S-o-b issue purely cosmetic for you? Not a lawyer but I don't
think there is any legal problem in stating the same thing twice. [1]

Or are you maybe running into some more concrete issues with upstream kernel
process related scripts or other automation processing of the commit?

Regards, Joonas

[1] When it comes to the commit rights model in DRM subsystem, stripping
the final S-o-b after the cherry-pick would make it less obvious who did
the pick. If there are multiple S-o-bs and the cherry-picking person
happened to be one of them, that information would be lost. Less
predictable outcome for the patch form for no actual gain in my opinion.

On the other hand, removing the S-o-b line from above the "(cherry-picked.."
line would modify the cherry-picked commit description itself and I
would assume everyone agrees that should not be done.
