Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3A6E7619
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 11:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B8F10E8FA;
	Wed, 19 Apr 2023 09:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F3710E1B0;
 Wed, 19 Apr 2023 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681895957; x=1713431957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HOJZZG1Iglv22CswOXulGZF8xoZaAqLdsBH7LNxXSdY=;
 b=Z6yJRJL3IxDm5XiHpa4ktyUfHKV9oEJZOxkuQ8PiYvPQeq3PWWtRXAPL
 +DEecqAzg5DCP/FUoQQawiZXdtW5tRClSEm41bEmByPivdRvhFSzyBgIA
 r9s1l2ETWDKyLCJzUNipudlbveVsnp/8LRnREqIEYPti4Ps1E1Jxg49Pl
 sxjSEKNoSX8O96mQD9yKZAdjiOrWN2/KRW2yeNkU0o1wURL3wu5EynpAv
 qVhz151ehgDjN9h7tM+HOz/QqoEaq9QJefAxYI8nL5047FnJnUXUeYCkS
 onjAvThAUzOl0j58ohR4LjIncnZoHrUTHMufQ5NY59bdZf1pCiGVz1Z13 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347254108"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="347254108"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 02:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="937597867"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="937597867"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 02:19:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 19 Apr 2023 12:19:09 +0300
Message-ID: <87354w1b76.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


Hi Dave & Daniel -

drm-intel-fixes-2023-04-19:
drm/i915 fixes for v6.3 final:
- Fix fast wake AUX sync len

BR,
Jani.

The following changes since commit 6a8f57ae2eb07ab39a6f0ccad60c760743051026:

  Linux 6.3-rc7 (2023-04-16 15:23:53 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-04-=
19

for you to fetch changes up to e1c71f8f918047ce822dc19b42ab1261ed259fd1:

  drm/i915: Fix fast wake AUX sync len (2023-04-17 10:23:21 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.3 final:
- Fix fast wake AUX sync len

----------------------------------------------------------------
Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Fix fast wake AUX sync len

 drivers/gpu/drm/i915/display/intel_dp_aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
