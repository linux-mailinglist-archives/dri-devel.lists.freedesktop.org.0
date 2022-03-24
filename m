Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D274E6093
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 09:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F50310E1C4;
	Thu, 24 Mar 2022 08:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D0410E1C4;
 Thu, 24 Mar 2022 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648111496; x=1679647496;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NuFHm8ohUCzRq/vcJj0ieIt6EJ2SIkaPIdvd5O7e/1g=;
 b=WH2n1UqkX6i/M0/IB6Z3hQ7Bf3fibpRRn4sAQ9Wa+Hit//Nfa1P4ZBG6
 xiYJ5dzq1L9cXp0WkcBsRjx4BKO8G2emT5JPmaCqfv0UsH7+vg39WGXvs
 Z9wEbsdtuwqO68c7/LgxEk3X4f1b0eKQO1fPWOIIJw7HT2Y/hfpMxGRE3
 YSUygLcJIaqRCqEoDv5VyakDhlUc+bS27CtYLrG471JciQPOQUB2bsMMR
 zgSACma0ivenfiNuguUI4/YH2zL512YCXjGEbLaSkjRclX+LajJXmCKry
 Axyr3M68OOkLu5IPh45eN/Oy3+xp9wak0WsrvHwfOR7WBlcq2Dpo2K6oB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="257149995"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="257149995"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 01:44:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="649771142"
Received: from keithgra-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.230.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 01:44:52 -0700
Date: Thu, 24 Mar 2022 08:44:48 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YjwvgGzYNAX5rxHN@tursulin-mobl2>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave, Daniel,

A few fixes for the merge window.

Apart from a uninteresting rename of a field in an unused macro, the rest
are display fixes - two for SAGV and one for TDMS rate calculation on
Icelake and above.

Regards,

Tvrtko

drm-intel-next-fixes-2022-03-24:
- Reject unsupported TMDS rates on ICL+ (Ville Syrjälä)
- Treat SAGV block time 0 as SAGV disabled (Ville Syrjälä)
- Fix PSF GV point mask when SAGV is not possible (Ville Syrjälä)
- Fix renamed INTEL_INFO->media.arch/ver field (Lucas De Marchi)
The following changes since commit 278da06c03655c2bb9bc36ebdf45b90a079b3bfd:

  drm/i915/display: Do not re-enable PSR after it was marked as not reliable (2022-03-16 08:17:40 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-03-24

for you to fetch changes up to 00f4150d27d2c01eaeffe1091fc311a7c0872c69:

  drm/i915: Fix renamed struct field (2022-03-21 11:48:00 +0000)

----------------------------------------------------------------
- Reject unsupported TMDS rates on ICL+ (Ville Syrjälä)
- Treat SAGV block time 0 as SAGV disabled (Ville Syrjälä)
- Fix PSF GV point mask when SAGV is not possible (Ville Syrjälä)
- Fix renamed INTEL_INFO->media.arch/ver field (Lucas De Marchi)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/i915: Fix renamed struct field

Ville Syrjälä (3):
      drm/i915: Reject unsupported TMDS rates on ICL+
      drm/i915: Treat SAGV block time 0 as SAGV disabled
      drm/i915: Fix PSF GV point mask when SAGV is not possible

 drivers/gpu/drm/i915/display/intel_bw.c   |  3 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c |  9 +++++++++
 drivers/gpu/drm/i915/i915_drv.h           |  2 +-
 drivers/gpu/drm/i915/intel_pm.c           | 10 ++++++----
 4 files changed, 18 insertions(+), 6 deletions(-)
