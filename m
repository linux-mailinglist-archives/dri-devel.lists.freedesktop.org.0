Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE47512B3C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 08:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809E610EDE4;
	Thu, 28 Apr 2022 06:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5186210EDE4;
 Thu, 28 Apr 2022 06:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651125677; x=1682661677;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=6x/xNc+goo3BmXJ71/zPYFj12xHzJj/XtPMMbQdG+Y4=;
 b=i0vldG9eEnjLHVIAjfDP9f+3gCxKrkfIaJU1wUYs0JWZSPrO3Y6qc3EW
 IrLYI3GannwRSdRd0VYPPyki/Vifd82dQXkjkGycJEYJ+wcr4Q3+QIXRc
 tLdLAyAoa1RBeihwnU8H4SSVtLKnN6NIez9rXH6VWUH2vNyJQv6VqbPvX
 S0p6GKv4VO6vYDSbSyeC8FQ8eQ3nJLAAMsT6ptuZYeXmLtMkOzdYy9sRE
 bCZvNPjgKr/Ku6T1sPNbI9pyR6hYi73cDEnlqRrzwEQPyCEaSdtOJQjtM
 45BTra1qWeF/JW9rFIloMb/uvGI0DcspmNBpXEMvn+HcJeDRjKgMyMWWq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246729919"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="246729919"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 23:01:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="617977541"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.254.116])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 23:01:08 -0700
Date: Thu, 28 Apr 2022 09:01:05 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Ymotel5VfZUrJahf@jlahtine-mobl.ger.corp.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes drm-intel-fixes PR for v5.18-rc5.

Fixes for backlight control on XMG Core 15 e21 (#5284, regression since
5.15) and black display plane on Acer One AO532h.

Then two smaller display fixes picked up by tooling.

Regards, Joonas

***

drm-intel-fixes-2022-04-28:
- Fix #5284: Backlight control regression on XMG Core 15 e21
- Fix black display plane on Acer One AO532h
- Two smaller display fixes
-
The following changes since commit af2d861d4cd2a4da5137f795ee3509e6f944a25b:

  Linux 5.18-rc4 (2022-04-24 14:51:22 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-04-28

for you to fetch changes up to f7e1089f43761ca221914aea9a755b23dc7cbc33:

  drm/i915/fbc: Consult hw.crtc instead of uapi.crtc (2022-04-26 10:12:36 +0300)

----------------------------------------------------------------
- Fix #5284: Backlight control regression on XMG Core 15 e21
- Fix black display plane on Acer One AO532h
- Two smaller display fixes
-

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915: Fix DISP_POS_Y and DISP_HEIGHT defines

Imre Deak (1):
      drm/i915: Fix SEL_FETCH_PLANE_*(PIPE_B+) register addresses

Jouni Högander (1):
      drm/i915: Check EDID for HDR static metadata when choosing blc

Ville Syrjälä (1):
      drm/i915/fbc: Consult hw.crtc instead of uapi.crtc

 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 34 +++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_fbc.c           |  2 +-
 drivers/gpu/drm/i915/i915_reg.h                    |  6 ++--
 3 files changed, 30 insertions(+), 12 deletions(-)
