Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C468FF792
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 00:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D1210EB15;
	Thu,  6 Jun 2024 22:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvTcer7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B898E10EAE4;
 Thu,  6 Jun 2024 22:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717711921; x=1749247921;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=y/aYmwzATGiYRaVLP5/NPW1anTDo2bYjdI4u7CSBi1c=;
 b=RvTcer7M5QUy+I4Ac0HoH63+pQAE8M0cZ86liYY/lSyk9zUnEZbfDugs
 yig/Vj44jLjKA08DOQPDDx22JnUvXSp5r2cEuNLyj5UrNgWFgepsDi+Mj
 TlEFC5J8Hxx+6V0Q3bG/gv/JEr62MFV1fe/NrnOQdbq4PLE4eL1HanmJ1
 Bi7shgvP7l7KGCTS24ZOMWSbKoALV8rQfO3Lzi0vQb06Y34TeCuAKWG5T
 Y2dkwoOqMGrkzgohVeR/oWzy2dqa/3nF2n7f2YwlE5N8tLvOi0z398ePO
 mJHOuLuliJG1mh6LfNoT0lzfkahs/VkKIVkgDgoxVdgIDFu1XPLlxXz2L g==;
X-CSE-ConnectionGUID: r7geqBfBQMi+CtX1uwKtcA==
X-CSE-MsgGUID: r/9Azon3SUyr2KHUKeWl1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39818282"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="39818282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:12:00 -0700
X-CSE-ConnectionGUID: KIE+JsVITRSoNQblaqCpDA==
X-CSE-MsgGUID: Nf6G0Q6MS9OdhqXVBcPP5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38188039"
Received: from mmiotk-mobl2.ger.corp.intel.com (HELO [10.249.37.149])
 ([10.249.37.149])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:11:56 -0700
Message-ID: <0251b6ae-bffa-44b2-b698-955712c25a27@linux.intel.com>
Date: Fri, 7 Jun 2024 00:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
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
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Dave, Sima,

Pull request for a single patch lost in the wrong tree.

Cheers,
~Maarten

drm-misc-next-fixes-2024-06-07:
drm-misc-next-fixes for v6.10-rc3:
- Single unused struct removal that should have been in -fixes.
The following changes since commit 5a507b7d2be15fddb95bf8dee01110b723e2bcd9:

   drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2 
(2024-05-21 16:36:59 -0400)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-fixes-2024-06-07

for you to fetch changes up to 539d33b5783804f22a62bd62ff463dfd1cef4265:

   drm/komeda: remove unused struct 'gamma_curve_segment' (2024-05-31 
12:09:51 +0100)

----------------------------------------------------------------
drm-misc-next-fixes for v6.10-rc3:
- Single unused struct removal that should have been in -fixes.

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
       drm/komeda: remove unused struct 'gamma_curve_segment'

  drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c | 5 -----
  1 file changed, 5 deletions(-)
