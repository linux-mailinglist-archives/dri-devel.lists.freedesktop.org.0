Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314A95ACF7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 07:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA6710E71E;
	Thu, 22 Aug 2024 05:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jx94o4qO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F7610E717;
 Thu, 22 Aug 2024 05:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724305210; x=1755841210;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=pMLmIVgRCimaMvw3QQYDT7GtgFDlKAo0xd7BaiYwLcA=;
 b=Jx94o4qO9Dh2C+flNS+MOwFs/gGgFPe+BIsEQWW/d6Sfxl29vC2+ciBd
 XriQtLaIoXRf5C/+0NkVBDmV7VLl+feb4gHnJr6M4uO8YLP1KRpIsNiBH
 ZxUJfOeWy0rDNiSltWKI/mnJX7Ja97v2W1vssC/iYOi1YMRRa/NEPHTzX
 71GB22PiKyzt9Cdsv9tMti6OENPo17bJ9EsMdMXtZK9FKvIfzBf0ptbLX
 464Kx5GGfr5BXeSzmkoySaejWwcyEqz3BCVaeydqtHGXcMpNa2/fWzgXK
 CUbm0A6izPLDOSpCWTWzlDbNb0hBZ1JwzS50GV64mOVLdYKU24Zv2cejg g==;
X-CSE-ConnectionGUID: L+xSZz9kT8+nGteRTi3PZg==
X-CSE-MsgGUID: lWbB9HEfTem19nD0C7nMLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22568627"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22568627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 22:40:10 -0700
X-CSE-ConnectionGUID: 0bFdEoI9SFmZ1uUbZEjIHQ==
X-CSE-MsgGUID: 6NBiHtTWQ8uy9M1v03KP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61314410"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 22:40:05 -0700
Date: Thu, 22 Aug 2024 08:40:02 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <ZsbPMm6XfzimmZW0@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave & Sima,

Here goes drm-intel-fixes towards v6.11-rc5.

Just one HDCP timeout fix this week.

Regards, Joonas

***

drm-intel-fixes-2024-08-22:

- Fix for HDCP timeouts

The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:

  Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-08-22

for you to fetch changes up to 5d41eeb6725e3e24853629e5d7635e4bc45d736e:

  drm/i915/hdcp: Use correct cp_irq_count (2024-08-19 06:40:57 +0300)

----------------------------------------------------------------
- Fix for HDCP timeouts

----------------------------------------------------------------
Suraj Kandpal (1):
      drm/i915/hdcp: Use correct cp_irq_count

 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
