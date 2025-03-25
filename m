Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E3A6EC57
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BC710E522;
	Tue, 25 Mar 2025 09:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2MghPZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD9F10E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742894214; x=1774430214;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q04Pa5WfYlc8uaPeRNABjNQkU6MR7ctfOjPyC9TC5S4=;
 b=H2MghPZ/284E+XMVvTiwY1CU1aW332xvn3RFbGq051g6C9+fmxFJhRQs
 JN11RCDn9SsuC29urwqRw7LY0WGhACwYZvN9snSHwK6dqWTlSB5IWZXcb
 RvPNznmXUcKqlqY+Y5VCuU1o/nQkhiPJ4WlakZkdbqRYxfPwkFinwtrQT
 miPuIq/33teKsKaViGcnVlxc6FBupEE63KtoW+8LIE7vevdmvMTXzhx3K
 WNNzRcczfDejM2c9NZOXNW1O4/a2pyGYiOvvRo0KyYwz9i7ILbyBzz7UT
 PAk6y6IlBgOdjb6zjzoReVl7PfHqqcrxAY1MQtPYJJaz6odZSqx600wJQ Q==;
X-CSE-ConnectionGUID: KFwIFjCRSMyFVUlnl5N5fQ==
X-CSE-MsgGUID: YHvtdkhiQ+WrAppa/bhcoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43854371"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43854371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:16:53 -0700
X-CSE-ConnectionGUID: eRAHrhygS7imR+lj1/z6rQ==
X-CSE-MsgGUID: OccYvP0eT/CB4Q6qCYJJXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129002396"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:16:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: devbrones <jonas.cronholm@protonmail.com>
Cc: maarten.lankhorst@linux.intel.com, devbrones
 <jonas.cronholm@protonmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: Add non-desktop quirk for Playstation VR
 Headsets with Product ID 0xB403
In-Reply-To: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250322122048.28677-1-jonas.cronholm@protonmail.com>
Date: Tue, 25 Mar 2025 11:16:47 +0200
Message-ID: <875xjxa2rk.fsf@intel.com>
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

On Sat, 22 Mar 2025, devbrones <jonas.cronholm@protonmail.com> wrote:
> This fixes a bug where some Playstation VR Headsets would not be assigned
> the EDID_QUIRK_NON_DESKTOP quirk, causing them to be inaccessible by
> certain software under Wayland.

Please file a bug over at [1], and attach the EDID on that bug, so we
have some clue what's going on.

Thanks,
Jani.


[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/new


>
> Signed-off-by: devbrones <jonas.cronholm@protonmail.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..51b4d7a02c02 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -239,6 +239,7 @@ static const struct edid_quirk {
>  
>  	/* Sony PlayStation VR Headset */
>  	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('S', 'N', 'Y', 0xB403, EDID_QUIRK_NON_DESKTOP),
>  
>  	/* Sensics VR Headsets */
>  	EDID_QUIRK('S', 'E', 'N', 0x1019, EDID_QUIRK_NON_DESKTOP),

-- 
Jani Nikula, Intel
