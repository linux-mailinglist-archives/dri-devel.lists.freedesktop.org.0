Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB329A1D37
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 10:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA3F10E7C1;
	Thu, 17 Oct 2024 08:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOb/fx69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E892B10E7BC;
 Thu, 17 Oct 2024 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729153916; x=1760689916;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Ii1v0FtqU8oTZXDztwaS+oUGSNl+R8s0xWhdAHmPyDI=;
 b=jOb/fx69nJUIIW0ei9PeRdJnXOuQJ5bo7vlNfRB3KJU+yEddStymCS2j
 THx4slSb0bNDw2Zw14La4LW5gZyoqPfwFlLhJ4FDPF69JKAkobN5v7JJV
 TMya9mwMYr+OdqpY8+Hy2612ErYb6o0IHBRVQrAzUsbywpMGNVDfx+mys
 5N35QUH0OdglQNMpLl7SyJGljwW/0GapIKSlp9Xm+yb7dnQoSQuUDCLhf
 JUQ9eqr2aUBiZXCLEMTB2rI/NNMDdsFo1OFqjGEdJvH6/YrVSiXYQFCtX
 WVLsRkPm4kP9OKtSoK20/QWRkT1NN6SVU4OvBVSXUN98H8CjKZQRcViLs A==;
X-CSE-ConnectionGUID: Y3tjZMmIQAChcun8MiNTIg==
X-CSE-MsgGUID: MlEl6QqqQXiMmM90o2mPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="39265768"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="39265768"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:31:55 -0700
X-CSE-ConnectionGUID: WprSBoEoTWKK4qU6deXbzg==
X-CSE-MsgGUID: RENHn+cPQEmbP0llsXPuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="83035203"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.51])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:31:51 -0700
Date: Thu, 17 Oct 2024 11:31:48 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <ZxDLdML9Dwqkb1AW@jlahtine-mobl.ger.corp.intel.com>
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

Here goes drm-intel-fixes towards v6.12-rc4.

Just two DP MST fixes this round.

Regards, Joonas

***

drm-intel-fixes-2024-10-17:

- Two DP bandwidth related MST fixes

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-10-17

for you to fetch changes up to 2f54e71359eb2abc0bdf6619cd356e5e350ff27b:

  drm/i915/dp_mst: Don't require DSC hblank quirk for a non-DSC compatible mode (2024-10-16 14:56:40 +0300)

----------------------------------------------------------------
- Two DP bandwidth related MST fixes

----------------------------------------------------------------
Imre Deak (2):
      drm/i915/dp_mst: Handle error during DSC BW overhead/slice calculation
      drm/i915/dp_mst: Don't require DSC hblank quirk for a non-DSC compatible mode

 drivers/gpu/drm/i915/display/intel_dp_mst.c | 40 +++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)
