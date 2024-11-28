Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617129DB830
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 14:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F0410E47A;
	Thu, 28 Nov 2024 13:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXBIUtt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A2610E45D;
 Thu, 28 Nov 2024 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732798854; x=1764334854;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=01hNUZF9YkEcB3gHMxeLzf1hwYC080O692qRSMWqVUs=;
 b=iXBIUtt+dPACNHeHzOV3A0/jOgeGUTHFsUiIOva/2fH9oSROLajq3Xvx
 EhJ0UdXAPSQ9qFhosrYtjIdIk4aSIDvx3VR1PcP7AwSEiu7AlP/eLEZr3
 BCPf6VkArwYBjVd19//gv9QGjc1kdpkO8aZ5TBBzJ24seXkQ4BTQlXI7l
 a6GlhKd6a2DtKzMY5hyf3NMiJ/CndWdAwvpvBhCCNyqTtilBMHHB3/lQE
 GujS/QOIBf+L7nqBPw7EPSbG6tCJfpElAUCts3OoN4oVswJw/nztub68Y
 Wdik+Dlw7XcZOI7LKT7NCzAG2Xw6/lt6qiktObObSbsaTdpC6x1j6YK7Y w==;
X-CSE-ConnectionGUID: kSbd7h4sTc2GfM/56kpTlw==
X-CSE-MsgGUID: 8Wfj70FNTiuvLnTRsAsYpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33182850"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33182850"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:00:54 -0800
X-CSE-ConnectionGUID: l+yG+xBASl2R/4C8Vv22kg==
X-CSE-MsgGUID: z3HdnXFgSvSxe6f4/T7vIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129734156"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.49])
 ([10.245.245.49])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:00:49 -0800
Message-ID: <1f91eeaa-d3e4-4eca-9375-24c467f6976d@linux.intel.com>
Date: Thu, 28 Nov 2024 14:01:17 +0100
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

A pull request with a single obvious patch in it. Consequently it's very likely to break the world and everything in it. As famous last words I'll add: "the affected source file seems to compile on 32-bits and 64-bits x86".

Cheers,
~Maarten

drm-misc-next-fixes-2024-11-28:
A single buildfix for 32-bits rockchip compilation.
The following changes since commit a163b895077861598be48c1cf7f4a88413c28b22:

  Merge tag 'drm-xe-next-fixes-2024-11-15' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-11-18 13:38:46 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2024-11-28

for you to fetch changes up to 818956c76517e127fad8cf02cd29866e0a852072:

  drm/rockchip: avoid 64-bit division (2024-11-22 10:11:39 +0100)

----------------------------------------------------------------
A single buildfix for 32-bits rockchip compilation.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/rockchip: avoid 64-bit division

 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
