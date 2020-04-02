Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC819CC5F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 23:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853696E182;
	Thu,  2 Apr 2020 21:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377406E170;
 Thu,  2 Apr 2020 21:30:28 +0000 (UTC)
IronPort-SDR: jQSc1t4sm7ve7ZjCmiUS5+4ADZRThSfRnkBvIZYaINnP1NCmbi1yojEvk2+GARcR5fn+oSfrv0
 jFu1yzSuZpkA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 14:30:27 -0700
IronPort-SDR: vpxKDKfEKGXTLqPtSdBSPetnqcAJsgdjbGzd1VOHRyG4yokHFC2O+2j8cgGcfRVzvzufXECEjT
 y1zgpvJ1nLAg==
X-IronPort-AV: E=Sophos;i="5.72,337,1580803200"; d="scan'208";a="253150797"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 14:30:27 -0700
Date: Thu, 2 Apr 2020 14:30:26 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20200402213026.GA1141017@intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-next-fixes-2020-04-02:

Only gvt fixes on this round:

- Fix non-privilege access warning (Tina)
- Fix display port type (Tina)
- BDW cmd parser missed SWTESS_BASE_ADDRESS (Yan)
- Bypass length check of LRI (Yan)
- Fix one klocwork warning (Tina)

Thanks,
Rodrigo.

The following changes since commit 2bdd4c28baff29163808677a70942de2b45f17dc:

  drm/i915/display: Fix mode private_flags comparison at atomic_check (2020-03-26 10:21:30 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2020-04-02

for you to fetch changes up to 17d0c1062a0c60e17c96538adf4a84c208930d9d:

  Merge tag 'gvt-next-fixes-2020-03-31' of https://github.com/intel/gvt-linux into drm-intel-next-fixes (2020-03-31 09:25:15 -0700)

----------------------------------------------------------------
Only gvt fixes on this round:

- Fix non-privilege access warning (Tina)
- Fix display port type (Tina)
- BDW cmd parser missed SWTESS_BASE_ADDRESS (Yan)
- Bypass length check of LRI (Yan)
- Fix one klocwork warning (Tina)

----------------------------------------------------------------
Rodrigo Vivi (1):
      Merge tag 'gvt-next-fixes-2020-03-31' of https://github.com/intel/gvt-linux into drm-intel-next-fixes

Tina Zhang (3):
      drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
      drm/i915/gvt: Fix display port type issue
      drm/i915/gvt: Fix klocwork issues about data size

Yan Zhao (2):
      drm/i915/gvt: add support to command SWTESS_BASE_ADDRESS
      drm/i915/gvt: do not check len & max_len for lri

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 16 ++++------------
 drivers/gpu/drm/i915/gvt/display.c    |  6 +++---
 drivers/gpu/drm/i915/gvt/handlers.c   |  8 ++++++--
 drivers/gpu/drm/i915/gvt/scheduler.c  |  4 ++--
 4 files changed, 15 insertions(+), 19 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
