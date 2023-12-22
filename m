Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F381C9A1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 13:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E2910E107;
	Fri, 22 Dec 2023 12:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C521610E0C6;
 Fri, 22 Dec 2023 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703246514; x=1734782514;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7dFqjBE9Wkd8deoyR1Sq4GXyF5qSE3k01QC+VMOAef0=;
 b=UglK1rmLGydBRhbs7+y6tPjw5bwJBDol0tO7QBXPJ1/c0AyWrU0AeS/7
 pGKHjkTVtqNjOBML3usiJYHKY5sA10jF9od2eGMSfj3t7kGDhFCa9tkEy
 dmIY57/we/K+APIi9EvNRnzrP8lkKqlShjnamLeZ+h4/nI7/lKAufuVHG
 LEgsr3ZmogIhKnteb8nA5HO4pcpkPg/G1mleEdkbHmu1w+TpMwiKt5sk9
 8Dn6GetPWxApiHUicGqbGMjk/SYi/lnG+RLF0YiYPJnn7yq4sK4h1f1dH
 851GvrOn6/82/xY7jvSEUu10e3qJ0AWSCsgtNbuHvExjYQ7NmefwKaC5V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="14791878"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="14791878"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 04:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="842929815"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="842929815"
Received: from yspisare-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.50.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 04:01:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
In-Reply-To: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
Date: Fri, 22 Dec 2023 14:01:30 +0200
Message-ID: <87h6kasaxx.fsf@intel.com>
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
Cc: Thomas =?utf-8?Q?Hellstr?= =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, dim-tools@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Dec 2023, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> Add the xe repo to drm-tip and the dim tools.
> For now use the sha1 of the first drm-xe-next pull request for drm-tip,
> since that branch tip is currently adapted for our CI testing.

I guess we'll need xe CI to switch to drm-tip based testing, and then
force push drm-xe-next to drop that core-for-CI thing. But I think it's
fine.

However, please first push v6.7-rc6 to drm-xe-fixes and current drm-next
to drm-xe-next-fixes as a starting point. AFAICT the branches don't
exist yet.

Other than that, LGTM.

BR,
Jani.

>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: daniel.vetter@ffwll.ch
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: dim-tools@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  nightly.conf | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/nightly.conf b/nightly.conf
> index 24126b61b797..accd3ff2cc39 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
>  https://anongit.freedesktop.org/git/drm/drm-tip
>  https://anongit.freedesktop.org/git/drm/drm-tip.git
>  "
> +drm_tip_repos[drm-xe]=3D"
> +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> +https://gitlab.freedesktop.org/drm/xe/kernel.git
> +"
>  drm_tip_repos[drm-intel]=3D"
>  ssh://git.freedesktop.org/git/drm/drm-intel
>  ssh://git.freedesktop.org/git/drm-intel
> @@ -65,14 +69,17 @@ drm_tip_config=3D(
>  	"drm			drm-fixes"
>  	"drm-misc		drm-misc-fixes"
>  	"drm-intel		drm-intel-fixes"
> +	"drm-xe			drm-xe-fixes"
>=20=20
>  	"drm			drm-next"
>  	"drm-misc		drm-misc-next-fixes"
>  	"drm-intel		drm-intel-next-fixes"
> +	"drm-xe			drm-xe-next-fixes"
>=20=20
>  	"drm-misc		drm-misc-next"
>  	"drm-intel		drm-intel-next"
>  	"drm-intel		drm-intel-gt-next"
> +	"drm-xe			drm-xe-next b6e1b7081768"
>=20=20
>  	"drm-intel		topic/core-for-CI"
>  	"drm-misc		topic/i915-ttm"

--=20
Jani Nikula, Intel
