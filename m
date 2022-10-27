Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE360F20D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8064010E55D;
	Thu, 27 Oct 2022 08:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D57410E37F;
 Thu, 27 Oct 2022 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666858682; x=1698394682;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=wDppueEjzkLCSF0MIWlbIWo2NHUa5w5PJ8zhJgH+obk=;
 b=OLOE3iLMDp5VZngLXt7iI4TAx0zA09pDe1V+j+8rrUvYlzZoa9i3Hwyi
 twkeFfLZB51zcOM3BDmrBfaxqxmeKAHYLBv8nbuvV5UDf3nzBrCpshAtN
 3dAOizKE+IZOB9Wtn5T77g4hPDDPGeJt7/iqM58odHpu1xizLzWVSg1+m
 07B9mDIsuXgkW8XUjda6/DDKC0sNfNSfiCIrEu4vHR+y9yoQlAKgCwU5q
 Y4byOrXWIs2clOpW9cBXtbBDTvoyheEFWMC++KIA8JoQ8J0WpG3L63BBN
 R2dk5ux7lFpTLFMGJIIbK0C5A4K2JXgJs24rsAECKuojqYMyTtOEyE5gf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="295571605"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="295571605"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:18:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877497853"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="877497853"
Received: from rgrilak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.238.72])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:17:59 -0700
Date: Thu, 27 Oct 2022 09:17:57 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y1o+teE2Z11pT1MN@tursulin-desk>
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

Hi Dave, Daniel,

Three fixes for the next release candidate: one display training fix, one
new workaround and disabling of autosuspend for DG2 until things can get
properly fixed.

Regards,

Tvrtko

drm-intel-fixes-2022-10-27-1:
- Extend Wa_1607297627 to Alderlake-P (José Roberto de Souza)
- Keep PCI autosuspend control 'on' by default on all dGPU (Anshuman Gupta)
- Reset frl trained flag before restarting FRL training (Ankit Nautiyal)
The following changes since commit 247f34f7b80357943234f93f247a1ae6b6c3a740:

  Linux 6.1-rc2 (2022-10-23 15:27:33 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-10-27-1

for you to fetch changes up to 63720a561b3c98199adf0c73e152807f15cc3b7f:

  drm/i915/dp: Reset frl trained flag before restarting FRL training (2022-10-24 10:14:57 +0100)

----------------------------------------------------------------
- Extend Wa_1607297627 to Alderlake-P (José Roberto de Souza)
- Keep PCI autosuspend control 'on' by default on all dGPU (Anshuman Gupta)
- Reset frl trained flag before restarting FRL training (Ankit Nautiyal)

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/dp: Reset frl trained flag before restarting FRL training

Anshuman Gupta (1):
      drm/i915/dgfx: Keep PCI autosuspend control 'on' by default on all dGPU

José Roberto de Souza (1):
      drm/i915: Extend Wa_1607297627 to Alderlake-P

 drivers/gpu/drm/i915/display/intel_dp.c     |  2 ++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  4 ++--
 drivers/gpu/drm/i915/intel_runtime_pm.c     | 11 +++++++++--
 3 files changed, 13 insertions(+), 4 deletions(-)
