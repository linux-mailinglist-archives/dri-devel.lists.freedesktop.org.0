Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305235FBFFB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 06:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D6410E330;
	Wed, 12 Oct 2022 04:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E2110E319;
 Wed, 12 Oct 2022 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665550303; x=1697086303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UHD4MHrA3NeiXgGrUMk+rGdFhgqSvbJdrpG5hsOsFro=;
 b=S5Vnnw0a2bUOK6xUmu8E0D4pRiff+oUObwGuVyE2rzAGShAmy+TFLlbm
 igXJHt65o11+joWOJJnjawzf6O4Mco7iUcGQS19m7QwLmIL2TBdWyjodT
 qwFL7iHnRNqIppHi81ObOCAQeENkTvv0j5V0uR8g06f/FvVJMA7QJGoPz
 cQBu46aEI1IzScPdThFgLZ27ec7AKm8jVOUnYn82XNJLRb74qZ2zzPUS+
 PKIiqujB+2EiQE9Miet07Vlth6SHY/CWeW2m/EFKNX/xM3BRUGL1+hdUz
 9agbik2kyh6eoV9cVGc36Z0QU6yLjB+F8rWsWhjBqyV4d1kOBFVMWbtRf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284423456"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="284423456"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:41 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="577698652"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="577698652"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/3] Add _PICK_EVEN_RANGES
Date: Tue, 11 Oct 2022 21:51:07 -0700
Message-Id: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
Content-Transfer-Encoding: quoted-printable
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new macro, _PICK_EVEN_RANGES, that supports using 2 address=0D
ranges. This should cover most of our needs for _MMIO_PLL3 and such.=0D
To show what is achieved with the new macro, convert some PLL-related=0D
macros to use it instead of _MMIO_PLL3.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Lucas De Marchi (3):=0D
      drm/i915: Add _PICK_EVEN_RANGES()=0D
      drm/i915: Fix coding style on DPLL*_ENABLE defines=0D
      drm/i915: Convert pll macros to _PICK_EVEN_RANGES=0D
=0D
 drivers/gpu/drm/i915/i915_reg.h | 91 +++++++++++++++++++++++--------------=
----=0D
 1 file changed, 52 insertions(+), 39 deletions(-)=0D
---=0D
base-commit: caaf8c4c270b6b9ce1b8610b4eea888190fc087f=0D
change-id: 20221011-pick-even-ranges-76ad8a5007e9=0D
=0D
Best regards,=0D
-- =0D
Lucas De Marchi <lucas.demarchi@intel.com>=0D
