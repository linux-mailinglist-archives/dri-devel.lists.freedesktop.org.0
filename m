Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D839ADBB7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 07:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F9610E8AA;
	Thu, 24 Oct 2024 05:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DemOwdqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EAA10E8A6;
 Thu, 24 Oct 2024 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729749593; x=1761285593;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=8sl6seQUd2+qs/Pu7wkGqpPQnfUB9+hILuA27xAbonQ=;
 b=DemOwdqAs5ybHFoky7+/sjx45SBuRHvGmfD6XlOatd+O8bde6AITn7U/
 +nzIjPHVkxAG02U9JvAn5Rwo1qlLlLFjcEskK3fLkGBuIk/k0jzBgv7Ds
 hBxXlj0x3qKL7tRVT31b31uuPdSSB7chdC2xCfL0IBGwT6J3Y49B44fYH
 wUICd44h2fn5IIy/kNQfVNSbFbrS6ynJJeVjMjpZc8OD/GgMbWMLMstdY
 138LQQropOpcYzIe3TK4OrFC3KeJA7Swx5qpVnYrxyByuiw+V5xlpzBTT
 u2Q5yE3os+Wde8p9CQt+JU8P7fkl9QmyaA/CzsG+U2WSPJqp2wtwhmRtL g==;
X-CSE-ConnectionGUID: OmypNJ05SxOoNIOdqpPqGw==
X-CSE-MsgGUID: bTKuriNPQ567myB+ySOV+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51904014"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51904014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:59:53 -0700
X-CSE-ConnectionGUID: sRnlbOjOQsOFfA4/KRIQNQ==
X-CSE-MsgGUID: mzg3s5O9Qsmqr9C/1roFaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80492142"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.245.177])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:59:48 -0700
Date: Thu, 24 Oct 2024 08:59:46 +0300
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
Message-ID: <ZxniUlDg59RxOO-6@jlahtine-mobl.ger.corp.intel.com>
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

Here goes drm-intel-fixes towards v6.12-rc5.

Just one Kconfig fix for GVT.

Regards, Joonas

***

drm-intel-fixes-2024-10-24:

- Fix DRM_I915_GVT_KVMGT dependencies in Kconfig

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-10-24

for you to fetch changes up to 338b655a1178900ac05aca7ac66dc28b05100430:

  i915: fix DRM_I915_GVT_KVMGT dependencies (2024-10-21 09:51:05 +0300)

----------------------------------------------------------------
- Fix DRM_I915_GVT_KVMGT dependencies in Kconfig

----------------------------------------------------------------
Arnd Bergmann (1):
      i915: fix DRM_I915_GVT_KVMGT dependencies

 drivers/gpu/drm/i915/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
