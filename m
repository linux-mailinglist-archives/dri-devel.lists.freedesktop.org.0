Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD659254176
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 11:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF796EB3B;
	Thu, 27 Aug 2020 09:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8C26EB36;
 Thu, 27 Aug 2020 09:06:52 +0000 (UTC)
IronPort-SDR: mRy1ZuYHMJuWmr01Lqu/KBa8B0vzOMqrFKAlkATBeSS1H8tz8kQCD1VdRIaA2RDqaDiRiaoAeq
 CldYRR9B4pEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="156452644"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="156452644"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 02:06:51 -0700
IronPort-SDR: CY6bsyEdtb8l5ZrF+r8k7hTwXOP7RVYN/6XAgKV5gI3Sq2oj3DavadYGvapOpx1T3zPhIYUkhH
 ceS2xh8ORdOw==
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="475131206"
Received: from jhaapako-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.249.33.115])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 02:06:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 27 Aug 2020 12:06:43 +0300
Message-ID: <87imd45ufw.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel, just one fix for -rc3.

BR,
Jani.

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-08-27

for you to fetch changes up to e5f10d6385cda083037915c12b130887c8831d2b:

  drm/i915: Fix cmd parser desc matching with masks (2020-08-25 11:01:34 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.9-rc3:
- Fix command parser desc matching with masks

----------------------------------------------------------------
Mika Kuoppala (1):
      drm/i915: Fix cmd parser desc matching with masks

 drivers/gpu/drm/i915/i915_cmd_parser.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
