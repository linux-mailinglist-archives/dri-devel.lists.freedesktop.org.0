Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4F87EA48
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 14:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC8E10F75D;
	Mon, 18 Mar 2024 13:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OzCR2FHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF84910F75D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710769324; x=1742305324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QwXw278uS5af1/QLWBfT+3opLUTGo1Iotai2VsBacwA=;
 b=OzCR2FHYckU2tSO9qoqZtSa7vkYMCNTAQV/VzLCSUfB59XX0PO2QwqVd
 b8zZEssZqQrjgkLsYNK8p20sRfU+fuJYyTB86BjJLL94o/8mjswIl9Bbi
 2/4ojK56Jb8pX+VwOmHn15xRJ7nwiK9sE0hb4Sve9LGGx5W3Xq4YYZlGy
 IOB7ePQn7Jd23ID9L9JgDgc3NTFkbCFX6XQHp71tXhX1m6QW9vNeQsqOQ
 uC3il0l8gFOJNxCpn6F6nAwgH+oZdiqh9QiDZGatjVL2vCM+vCUBcPBYU
 Ed4zpx0/KX6unhRWbjbmQ4P8yL+9+8YI3oa9f7zvnObAQ9nUuSfC4SOt0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5765575"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5765575"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="827781790"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="827781790"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2024 06:41:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Mar 2024 15:41:56 +0200
Date: Mon, 18 Mar 2024 15:41:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Luca Weiss <luca.weiss@fairphone.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
Message-ID: <ZfhEpBLfAHk3JdlM@intel.com>
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
 <87wmpzq0bp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmpzq0bp.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 18, 2024 at 12:52:10PM +0200, Jani Nikula wrote:
> On Mon, 18 Mar 2024, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > Hi,
> >
> > On Thu, 11 Jan 2024 13:38:04 +0100, Luca Weiss wrote:
> >> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> >> bridge/panel.o to drm_kms_helper object, we need to select
> >> DRM_KMS_HELPER to make sure the file is actually getting built.
> >> 
> >> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
> >> be properly available:
> >> 
> >> [...]
> >
> > Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
> >
> > [1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3f18b0dd1db242791afbc3bd173026163ce0ccc
> 
> With my kernel config, e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER
> for DRM_PANEL_BRIDGE") leads to:
> 
> WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
>   Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
...

All the defconfigs in drm-rerere also seem to fail here.

Neil, are you using some weird .config, or did you not actually
build test this before pushing?

PS. the drm-rerere defconfigs seem pretty outdated (eg. missing
    tons of panel drivers). Would be good if someone could update
    those to provide better coverage

-- 
Ville Syrjälä
Intel
