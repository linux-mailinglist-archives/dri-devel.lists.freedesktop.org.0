Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64872494B74
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE7010E46B;
	Thu, 20 Jan 2022 10:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D8410E46B;
 Thu, 20 Jan 2022 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642673618; x=1674209618;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=SP9D6M/YG4XD/OesWaVV5Bw1/H0g4y9IDq8cfP6O8jI=;
 b=AGWppeidOSNMLw+iw9mSNbNs+mE8DsmDlFAIjdRnJhVbxbOqSj/zJtXt
 HdUQg2TE3ky5YBEatRHrc+EN97bdco6xK23vKAloyvWgBGTI45OzzsUTW
 k4/68EnOZoPiykPjcYt3G38gTHCw3zwV3ODv/0J63fjQC682XXEtwiiTG
 1P/E0R24iEMCRZN6lgD3LNTY8ZXQEE7Q52RMGT9f6ULGLWtQG9eZ5vNVU
 ILJ0kQR4nJTP/vBcJQIx41566FI74taEAkCKeqnKXsYDZs5ICvdVwR0iH
 LBmIw4mpX9ghQO4u3ndkVeKPpE4hZKsvne8Li+VZeSe/vZVigEh/PgbFH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="331670510"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="331670510"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:13:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="694148285"
Received: from bmurphy-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.207.182])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:13:34 -0800
Date: Thu, 20 Jan 2022 10:13:33 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <Yek1zdsnRPiBVvFF@tursulin-mobl2>
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


Hi Dave and Daniel,

A couple display fixes for the merge window. One for EHL and one for ADL-P,
and both in the are of voltage swing programming.

Regards,

Tvrtko

---

drm-intel-next-fixes-2022-01-20:
- Latest updates for the EHL display voltage swing table (José Roberto de Souza)
- Additional step is required when programming the ADL-P display TC voltage swing (José Roberto de Souza)
The following changes since commit 6ef295e34297433c78ea02dfcf1c649a769050bb:

  drm/i915/ttm: ensure we unmap when purging (2022-01-10 14:00:47 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-01-20

for you to fetch changes up to e26602be4869c74dd8a0f66f718b8a0ce120edb4:

  drm/i915/display/adlp: Implement new step in the TC voltage swing prog sequence (2022-01-17 10:19:41 +0000)

----------------------------------------------------------------
- Latest updates for the EHL display voltage swing table (José Roberto de Souza)
- Additional step is required when programming the ADL-P display TC voltage swing (José Roberto de Souza)

----------------------------------------------------------------
José Roberto de Souza (2):
      drm/i915/display/ehl: Update voltage swing table
      drm/i915/display/adlp: Implement new step in the TC voltage swing prog sequence

 drivers/gpu/drm/i915/display/intel_ddi.c           | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 10 +++++-----
 drivers/gpu/drm/i915/i915_reg.h                    |  8 ++++++--
 3 files changed, 33 insertions(+), 7 deletions(-)
