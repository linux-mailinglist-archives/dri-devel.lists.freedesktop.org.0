Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6217683DCB9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F041710FB1F;
	Fri, 26 Jan 2024 14:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4354D10FB1F;
 Fri, 26 Jan 2024 14:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706280459; x=1737816459;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=YNLlsP/SohdMvBnPEzAA76YCPQOks6j/c8hDxHb5Jc4=;
 b=OTP8kRsk4V52B4Wl6fPZ3OXdjIr15b/sDu1GusaBa1383ZBsrni/9pX+
 7XEzRyFgyxH3UbJ0L3l/2Cn9O1KZnDCn/HswSTF6YGUdcpNu+mJrFD6BN
 S2BR/SqMZDd8HZJ56nAM2KahrAG9LSHoqT5TdNltpPW/0HjYRiKkNzUqd
 jXqJ/D9Wr8yV1WxUefQjvIcxvXqCRswCxRCrTvCS+vZ4UGcY5kRkY5p7Q
 95lNJ+0eYGKTq1P9dfMQLs2/7zHM/i31GDFFOGgZ/ut2mr+V2HYNOPJvv
 V1m964jZD1FmMdXbihOY4mqNBezCmxTdG7fX9HAXyUegs91l8f63Gbx1N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401345168"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401345168"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 06:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2757759"
Received: from fnangle-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.94.252.234])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 06:47:35 -0800
Date: Fri, 26 Jan 2024 16:47:32 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZbPGBL9lj4DxxIW1@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Sima,

Just one Cc stable patch (the rest was already in drm-intel-next-fixes).

Tried to wait for CI results, but none yet.

Best Regards, Joonas

***

drm-intel-fixes-2024-01-26:

- PSR fix for HSW

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2024-01-26

for you to fetch changes up to f9f031dd21a7ce13a13862fa5281d32e1029c70f:

  drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT (2024-01-25 10:44:13 +0200)

----------------------------------------------------------------
- PSR fix for HSW

----------------------------------------------------------------
Ville Syrjälä (1):
      drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT

 drivers/gpu/drm/i915/display/intel_psr.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)
