Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912097C781
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 11:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F0110E2A4;
	Thu, 19 Sep 2024 09:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLvQI01U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CDE10E2A4;
 Thu, 19 Sep 2024 09:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726739347; x=1758275347;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=cxsp43UY5idT5FpVZL41ilEMCbKZEwpam7hNJrKRT8c=;
 b=RLvQI01UBIIk6q3ecP9I+ct20JvESf8QBd0eM5gkx+mnXQrOWCUnOlo5
 FHCO5kb/OmgiPjaHRZYYtBR8SZrMdSN1CT8bhj53v67UJF0HVxR5MNoPP
 IdTJmAquVr+Xfsr4KYgq9o4UnDB950GicImRLAwbD3x88Hbarfnm6+SJD
 fWaukK0R4TgrimUvftBqK/eN6pPu15K203vs0w7EsfWZegj/HIz0GoQhH
 AX7CRX1IZzfGjpcC1kE20JdjUaUT+AG0AiTppHXElSGK4hPJaJ9uBiCcD
 vgzwjXXgbrREE3m+YXLXL29gzcsNf8gcBTLosm5S80f5Tktoi7d7YhYx+ g==;
X-CSE-ConnectionGUID: s95bklhfQYydlC8TCaHcsg==
X-CSE-MsgGUID: MMkQHbufRiqej9eRUJNeRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36360873"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="36360873"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 02:49:07 -0700
X-CSE-ConnectionGUID: Xw2xPRC4T7WJ2EION4u45w==
X-CSE-MsgGUID: K/Yj8wXRQ7SEcbi52b+Cjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74670761"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 02:49:03 -0700
Date: Thu, 19 Sep 2024 12:49:00 +0300
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
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZuvzjAbx2pmjahxK@jlahtine-mobl.ger.corp.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Sima,

Here goes drm-intel-next-fixes PR towards 6.12.

Three display fixes; One to limit BMG to UHBR13.5 and two PSR ones.

Regards, Joonas

***

drm-intel-next-fixes-2024-09-19:

- Fix BMG support to UHBR13.5
- Two PSR fixes

The following changes since commit bf05aeac230e390a5aee4bd3dc978b0c4d7e745f:

  Merge tag 'drm-intel-next-fixes-2024-09-12' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-09-13 16:26:05 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2024-09-19

for you to fetch changes up to ec2231b8dd2dc515912ff7816c420153b4a95e92:

  drm/i915/dp: Fix AUX IO power enabling for eDP PSR (2024-09-16 09:11:48 +0300)

----------------------------------------------------------------
- Fix BMG support to UHBR13.5
- Two PSR fixes

----------------------------------------------------------------
Arun R Murthy (1):
      drm/i915/display: BMG supports UHBR13.5

Imre Deak (1):
      drm/i915/dp: Fix AUX IO power enabling for eDP PSR

Jouni Högander (1):
      drm/i915/psr: Do not wait for PSR being idle on on Panel Replay

 drivers/gpu/drm/i915/display/intel_ddi.c |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c  | 13 +++++++++++--
 drivers/gpu/drm/i915/display/intel_psr.c | 32 +++++++++++++++++++++-----------
 drivers/gpu/drm/i915/display/intel_psr.h |  2 ++
 4 files changed, 35 insertions(+), 14 deletions(-)
