Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640298DEE8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37C010E32A;
	Wed,  2 Oct 2024 15:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeoPAL2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BAE10E00A;
 Wed,  2 Oct 2024 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727882745; x=1759418745;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=48riYWv1AS0oMFz/CKOhrBHc1mk2BpQ28bW4VOo4i64=;
 b=SeoPAL2UHMOzQvTYAFNSfwdR1Wd7sx95RaCaeCSEoaBS0SFyPpCWxbqd
 1awttLuffTvpV1G813wt3XqhpvbP4HgzuxwzdQWfAypiDJXqdoKaL4WBp
 typ///tgzb59hrPaZ5S6jV95TjdPurr96+8NKb2iaWM7u0m3BtO4Gm2+1
 zMQvcK4lTqRDAdMZPlaZbeS5d04xMJ7oXPxnho5kYhyuDs8q1Poai4giI
 7Ks9vo3MMOMGEsUbmGPoZnWoGpH4jvvim4MBl0jP8czSNBemRy7wezvF8
 EFlIGBabCTByLEQ0Kk88X8OSH2NerovOpNUJo62BKsHhyCUv94Oi7z6ez A==;
X-CSE-ConnectionGUID: v/2KXbzPS8G9E82GMFuMWQ==
X-CSE-MsgGUID: oWV3RhduSsCdcroThokH1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26850664"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="26850664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:25:44 -0700
X-CSE-ConnectionGUID: qcx0zXmpSMOXKybi5hE7kA==
X-CSE-MsgGUID: Ag5qp731QomXFE81X2RHNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="111490772"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:25:39 -0700
Date: Wed, 2 Oct 2024 18:25:35 +0300
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
Message-ID: <Zv1l75s9Z4Gl4lDH@jlahtine-mobl.ger.corp.intel.com>
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

Here goes drm-intel-fixes toward v6.12-rc2.

Just one & vs && fixup into PM code that should only trigger with debug
Kconfig options.

Regards, Joonas

***

drm-intel-fixes-2024-10-02:

- One fix for bitwise and logical "and" mixup in PM code

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-10-02

for you to fetch changes up to 394b52462020b6cceff1f7f47fdebd03589574f3:

  drm/i915/gem: fix bitwise and logical AND mixup (2024-10-01 10:28:29 +0300)

----------------------------------------------------------------
- One fix for bitwise and logical "and" mixup in PM code

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/gem: fix bitwise and logical AND mixup

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
