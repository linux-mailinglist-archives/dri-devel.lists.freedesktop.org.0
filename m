Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3F87EC0D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D95410F9CD;
	Mon, 18 Mar 2024 15:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUYs6qZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EBA10F9CD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710775460; x=1742311460;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=H5Yl2+KH5clpDAidnyUJS6JZKwl1txrmCW3WlkQErtY=;
 b=CUYs6qZdtfdoS5y8xzNSgNbD+RchsJQE1vINYs1OLw+kpJ1vtAZFF7MV
 GtZuKt3JSop+VcqZGLNxd+d95UGRMn0hAN3KrJ7Se005Eqquh0TwRoWPC
 QmvDJY/lbx9G4lxa3dd/PXdBpx3J8DC/WZEngtKu7Y5o+PyHZdwcyorDz
 JcPReHQsdS5sZm/jJ2aeujDzshLBjU0RBT1CUFo7Z/lzKsY6Pm2b7ce/K
 UVU2wUcyhJqQntF6FlT0TgIREB6PbxX4+J55f66lg2HRlE8v7G/8PzeDy
 HJqAAdATQLGGxP9+q0o8IwjDWpenWyGRsZKC1rCTQrcsOc/wxqFuECWxQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5456395"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5456395"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13398989"
Received: from ahmedess-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:24:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
In-Reply-To: <CZWX8POMMGS3.1YJ0MLS9HO90L@fairphone.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
 <87wmpzq0bp.fsf@intel.com> <87ttl3pzzi.fsf@intel.com>
 <CZWX8POMMGS3.1YJ0MLS9HO90L@fairphone.com>
Date: Mon, 18 Mar 2024 17:24:10 +0200
Message-ID: <8734snpnqd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 18 Mar 2024, "Luca Weiss" <luca.weiss@fairphone.com> wrote:
> Would you know the correct fix for this? I'm aware of the pattern
> "select FOO || !FOO" but I guess it's also not applicable here?

I don't think that pattern works for select, only for depends on.

And I think the problem, again, is the abuse of select for symbols with
dependencies.

$ git grep "select DRM_KMS_HELPER" | wc -l
122

I'm guessing these only work because a) they are tristates, and b) they
directly or indirectly already "depends on DRM", which satisfies
DRM_KMS_HELPER's "depends on DRM".

I think the correct fix for this, and a plethora of other kconfig
problems, is adhering to the note in
Documentation/kbuild/kconfig-language.rst:

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

The downsides are that it's a lot of churn to fix them, they'll creep
back in, and kconfig doesn't warn about these cases up front while it
could, and menuconfig etc. aren't helpful in enabling dependencies for
you recursively. So here we are, adding bandaid year after year. :(


BR,
Jani.


-- 
Jani Nikula, Intel
