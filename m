Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A444756A0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787B610E3AD;
	Wed, 15 Dec 2021 10:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA48410E3A1;
 Wed, 15 Dec 2021 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639564994; x=1671100994;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Hy2AK7kLKnChI1EgB3pdh1hG/RZV7nqXJNSdowe3EzI=;
 b=SwiT9l13Y3vCSI+0oPbx4ndhjm8arJYvLFthfzbL94fkc6FAG/sbdUYN
 IL+A8QYi3U7MGJPTQIrG8mHRYfBdbz2htw9qXOikz54safFqyQfsApt0T
 EyTaAe6hByB6F5lIkcn+Lbfig/D50VY7Sj16dx9Ba3gpKonH9brVCW4Yj
 fmBR08NzgAvx8CY9Eu55uqnL81CzdT3Q0DPPkmc7C4rzu2NHq3hNNOvvf
 WKPtvDBIbHRtFYS2lr+/pSHXK+TKiwIP7lcyECjH3Vf7AVTbd4bDgR2sT
 aRnDsyqROtVPsRFJ6UDqM7WA6J4F7WNmqCkcz/ruR2enF2++KlRIBKhtJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219215687"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="219215687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 02:43:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="518718900"
Received: from prajwal2-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.38.201])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 02:43:12 -0800
Date: Wed, 15 Dec 2021 05:43:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YbnGvnsX/H3rKAqO@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

First, a heads up that I will be on vacation for the next weeks
so Jani will cover the drm-intel-fixes for the next rounds.

Now, here goes drm-intel-fixes-2021-12-15:

Fix a bound check in the DMC fw load.

Thanks,
Rodrigo.

The following changes since commit 2585cf9dfaaddf00b069673f27bb3f8530e2039c:

  Linux 5.16-rc5 (2021-12-12 14:53:01 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-12-15

for you to fetch changes up to 53b3495273282aa844c4613d19c3b30558c70c84:

  drm/i915/display: Fix an unsigned subtraction which can never be negative. (2021-12-14 04:11:10 -0500)

----------------------------------------------------------------
Fix a bound check in the DMC fw load.

----------------------------------------------------------------
Harshit Mogalapalli (1):
      drm/i915/display: Fix an unsigned subtraction which can never be negative.

 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
