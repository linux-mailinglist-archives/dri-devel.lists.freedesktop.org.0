Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D5C8A984
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5E410E65B;
	Wed, 26 Nov 2025 15:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1scwzQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42B610E658;
 Wed, 26 Nov 2025 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764170417; x=1795706417;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=YNtEMCBvBMuiEcnfYm+UcY/8rvo9sum7Nw6L2hfM4cM=;
 b=a1scwzQ3Ahz8Oj9l7UrRdxgTjSa9ibnhc/nQz+Oh653HLDFWAqVuYdl+
 bkYYT7nbrBQZiyNcr7pKWLRadYLij5ODcuDZ1ak4vGm0kEIoXcWoPF4mK
 Pp+fDjPOxKFHyFT5S2EH6O0JsVsKx3l7oHIAp9kmh9oveno+pFb72FARK
 jehor3KrjGLoX+/ArQin7WuSroKNx8BPkXQu/Diy3mr+NhnLWbabdoWL3
 6aIOO4uonjrYXmgi7CYUPDR0NuxHK9tCsdJqnwQiU3D2N2d10IoWJvsUO
 JqAQ+lSixgFAtbzfzBu1R+VCCA7QEBbz9Rx5IfuRf3JPSu73MaK+Lu6PD A==;
X-CSE-ConnectionGUID: 8s1FW/s4RrSJ9XaVVBmPYw==
X-CSE-MsgGUID: 87mKH0XRREyl0tYu7Trl4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83602524"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="83602524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:20:17 -0800
X-CSE-ConnectionGUID: AqpRhrUNRxepAyWwo31cjg==
X-CSE-MsgGUID: nBYYNFzIQxa35kpiXwUchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192220020"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.178])
 ([10.245.245.178])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:20:12 -0800
Message-ID: <0090a4fc-9cc4-4c03-bfe5-d1b1f0cc7e05@linux.intel.com>
Date: Wed, 26 Nov 2025 16:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Dave, Simona,

Only 2 small fixes to nouveau for next pull request!

Started signing pull requests again, the option is missing from the sample dimrc. :-)

Kind regards,
~Maarten Lankhorst

drm-misc-next-fixes-2025-11-26:
drm-misc-next-fixes for v6.19:
- Restrict the pointer size of flush pages to prevent a regression.
The following changes since commit f3a1d69f9b388271986f4efe1fd775df15b443c1:

  Merge tag 'amd-drm-next-6.19-2025-11-14' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-11-18 07:01:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-11-26

for you to fetch changes up to 31d3354f42c0da34415164a1f621a195caa1f1bc:

  drm/nouveau: verify that hardware supports the flush page address (2025-11-24 17:53:22 -0500)

----------------------------------------------------------------
drm-misc-next-fixes for v6.19:
- Restrict the pointer size of flush pages to prevent a regression.

----------------------------------------------------------------
Timur Tabi (2):
      drm/nouveau: restrict the flush page to a 32-bit address
      drm/nouveau: verify that hardware supports the flush page address

 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c  | 3 +++
 6 files changed, 16 insertions(+), 1 deletion(-)
