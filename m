Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA0A671A49
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 12:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2538410E15E;
	Wed, 18 Jan 2023 11:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395FA10E15E;
 Wed, 18 Jan 2023 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674040627; x=1705576627;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=9Nqfb28YBk5vxcFhw+YWbewR4Fqv+GH7icqfFVVRs7A=;
 b=NKO8aKusbtTaRIJ9Q52JpZ8vA1kI2xr7YsUjuCC+hageZKycbyXCtyLm
 MI8m+/8+ehePVKCR9RXXh7aSxV2BYc97Jz04JsPsOulGdcH8lwu2KzCOi
 MMn+yMIqjEuvjplQj50ntmC18gAn0PSZDkJECzGlLeggIxgDGTtMf2Ygm
 d10SQc4TYExxUZso3IyB5OyBr8qhCG4FI/Ta278uptuYxpWgZMFnq/3pQ
 ahWuzbbHKbRedF+bxtfvRDEIj21vez2BW5MAO0/8PbIqD1nyvMFrsP4zb
 hoqq4TYA/87OGN6kjmxGSBpXvbtAp24ChXvVnAPRRGKz/NIJUnz4VP0yx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="389460655"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="389460655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:17:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="652886548"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="652886548"
Received: from kozlovdm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.28.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:16:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Ongoing failure for "dim rebuild-tip"
In-Reply-To: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <b1605ab2-7f60-1e2d-de21-a6eb94afdbc7@amd.com>
Date: Wed, 18 Jan 2023 13:16:24 +0200
Message-ID: <87h6wocctz.fsf@intel.com>
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

On Wed, 18 Jan 2023, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Hi guys,
>
> for a couple of weeks now the command "dim rebuild-tip" fails for me.=20
> The error message is:
>
> Merging drm-intel/drm-intel-gt-next... Applying manual fixup patch for=20
> drm-tip merge... patching file drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> dim:
> dim: FAILURE: Could not merge drm-intel/drm-intel-gt-next
> dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
> dim: in the drm-tip.rst documentation for how to handle this situation.
>
> This also happens on a fresh clean install of dim, so I'm pretty sure=20
> that this isn't a problem on my side.
>
> What can we do?

I think you should probably try to update your git. Looks like you're
using git version 2.25.1, and over the past year most people have been
using 2.34.1 or later.

There can be subtle differences either in the merge conflicts or in the
recorded conflict resolutions (git rerere) between git versions, and
sometimes a resolution from one can't be reused in another.

If we knew which exact versions we require, we could add a check in
dim. Maybe we should just randomly warn about older than
2.34.1. *shrug*.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
