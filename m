Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0F2D41CA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 13:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AFE6E138;
	Wed,  9 Dec 2020 12:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0E36E138;
 Wed,  9 Dec 2020 12:11:47 +0000 (UTC)
IronPort-SDR: 4GGoqD//skmO4hrC7yLaG/LEkxHoUMofSUQMJDFIRFml0bMVvYsRAtFguFZEK9FoarMejTRO/H
 VoWs1jgYVJ6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153302260"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="153302260"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 04:11:47 -0800
IronPort-SDR: m7LhZdmiyVYjbDQRO78DIx4PYa14HHHViN8u5JfON030En5oWU6uPPHEGI0TPk6KKXx0eTdXZw
 ZlITHYsBv0Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="318758568"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 09 Dec 2020 04:11:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Dec 2020 14:11:42 +0200
Date: Wed, 9 Dec 2020 14:11:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] drm-intel-fixes v2
Message-ID: <X9C+/nvvyls/vj1b@intel.com>
References: <20201203134705.GA1575873@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203134705.GA1575873@intel.com>
X-Patchwork-Hint: comment
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 03, 2020 at 05:47:05AM -0800, Rodrigo Vivi wrote:
> Hi Dave and Daniel,
> =

> Please ignore the pull request I had sent yesterday and use only this one.
> =

> I had missed one patch: 14d1eaf08845 ("drm/i915/gt: Protect context lifet=
ime with RCU").
> =

> Also, please notice that the commit 6db58901c2aa ("drm/i915/display: retu=
rn earlier from
> +intel_modeset_init() without display") was not actually a crucial fix, b=
ut it
> +allowed a clean pick of the use-after-free one.
> =

> Here goes drm-intel-fixes-2020-12-03:
> Fixes for GPU hang, null dereference, suspend-resume, power consumption, =
and use-after-free.
> =

> - Program mocs:63 for cache eviction on gen9 (Chris)
> - Protect context lifetime with RCU (Chris)
> - Split the breadcrumb spinlock between global and contexts (Chris)
> - Retain default context state across shrinking (Venkata)
> - Limit frequency drop to RPe on parking (Chris)
> - Return earlier from intel_modeset_init() without display (Jani)
> - Defer initial modeset until after GGTT is initialized (Chris)
> =

> Thanks,
> Rodrigo.
> =

> The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288=
da:
> =

>   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)
> =

> are available in the Git repository at:
> =

>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-1=
2-03
> =

> for you to fetch changes up to ccc9e67ab26feda7e62749bb54c05d7abe07dca9:
> =

>   drm/i915/display: Defer initial modeset until after GGTT is initialised=
 (2020-12-02 17:05:58 -0800)
> =

> ----------------------------------------------------------------
> Fixes for GPU hang, null dereference, suspend-resume, power consumption, =
and use-after-free.
> =

> - Program mocs:63 for cache eviction on gen9 (Chris)
> - Protect context lifetime with RCU (Chris)
> - Split the breadcrumb spinlock between global and contexts (Chris)
> - Retain default context state across shrinking (Venkata)
> - Limit frequency drop to RPe on parking (Chris)
> - Return earlier from intel_modeset_init() without display (Jani)
> - Defer initial modeset until after GGTT is initialized (Chris)
> =

> ----------------------------------------------------------------
> Chris Wilson (5):
>       drm/i915/gt: Program mocs:63 for cache eviction on gen9

That also needs
commit 444fbf5d7058 ("drm/i915/gt: Declare gen9 has 64 mocs entries!")
which seems to have not made it into this pull.

>       drm/i915/gt: Protect context lifetime with RCU
>       drm/i915/gt: Split the breadcrumb spinlock between global and conte=
xts
>       drm/i915/gt: Limit frequency drop to RPe on parking
>       drm/i915/display: Defer initial modeset until after GGTT is initial=
ised
> =

> Jani Nikula (1):
>       drm/i915/display: return earlier from intel_modeset_init() without =
display
> =

> Venkata Ramana Nayana (1):
>       drm/i915/gt: Retain default context state across shrinking
> =

>  drivers/gpu/drm/i915/display/intel_display.c      |  24 ++--
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c       | 168 ++++++++++------=
------
>  drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h |   6 +-
>  drivers/gpu/drm/i915/gt/intel_context.c           |  15 +-
>  drivers/gpu/drm/i915/gt/intel_context_types.h     |  23 ++-
>  drivers/gpu/drm/i915/gt/intel_mocs.c              |  14 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c               |   4 +
>  drivers/gpu/drm/i915/gt/shmem_utils.c             |   7 +-
>  drivers/gpu/drm/i915/i915_request.h               |   6 +-
>  9 files changed, 143 insertions(+), 124 deletions(-)
> _______________________________________________
> dim-tools mailing list
> dim-tools@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dim-tools

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
