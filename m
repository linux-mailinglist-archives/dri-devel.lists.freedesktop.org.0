Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3339294A
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 10:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F786EE37;
	Thu, 27 May 2021 08:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334D56EE37;
 Thu, 27 May 2021 08:13:35 +0000 (UTC)
IronPort-SDR: M06uVMeWjPUGD/SumZZ6+Jc+nDphDIJ1v71N+AxJPyKq7WcdSppknwuCsUXs3mMYmKtXoOleB3
 OcBKw2yVQ6Vw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223878954"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="223878954"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:13:34 -0700
IronPort-SDR: KWqVJXChaCh2t/e9p6DlYdQ77tWjBTBAMN56f/dsuJqG4PhvjWH3waJhzOd7H3q2MJHwKZ7Ed9
 Xj6Lf/XUEU+w==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="477384769"
Received: from ebenabu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.22])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 01:13:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 27 May 2021 11:13:24 +0300
Message-ID: <875yz4bnmj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-fixes-2021-05-27:
drm/i915 fixes for v5.13-rc4:
- Re-enable LTTPR non-transparent LT mode for DPCD_REV<1.4

BR,
Jani.

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-05-27

for you to fetch changes up to e11851429fdc23524aa244f76508c3c7aeaefdf6:

  drm/i915: Reenable LTTPR non-transparent LT mode for DPCD_REV<1.4 (2021-05-25 12:43:06 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.13-rc4:
- Re-enable LTTPR non-transparent LT mode for DPCD_REV<1.4

----------------------------------------------------------------
Imre Deak (1):
      drm/i915: Reenable LTTPR non-transparent LT mode for DPCD_REV<1.4

 .../gpu/drm/i915/display/intel_dp_link_training.c  | 71 ++++++++++------------
 1 file changed, 33 insertions(+), 38 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
