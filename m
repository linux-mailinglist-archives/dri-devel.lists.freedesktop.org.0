Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC2710C6F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 14:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAE810E07D;
	Thu, 25 May 2023 12:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F000710E067;
 Thu, 25 May 2023 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685019211; x=1716555211;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Pe/2hybB1KZS6B6bpzvr0i+gu/MZTkCVG5d98AdlQOU=;
 b=ckdkBnKrkCfxf/p1TNBy+JIawQGgQuYwdAH60PrVB9dT+MQKH6/aRh8X
 C1+1O102KvbEszEBPYfDvZWds5HBsuwo8MynjKe0vnIA/w3dI30+qeyYc
 jK0z7Q4kby2856o9D0g97oBlfwThCgUUGvQurughfpKsISxy83y9VjTE1
 HGup2CwB4+wukMKYMAgAayH9Qf9DOF/Qub2dLi/pYvewWtYjCeuxynQbY
 5PloBIsO6oVNroCJP1UkXPwHGnShgFyMKPPxU8dbIS9fdxQdF8CBdG1z5
 BpsIFYjU0Hw9pFMrtSTDjugCMifVKH/iO79Gq9KAnEH2RbFVe6ahSmwJJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382122505"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="382122505"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="655191418"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="655191418"
Received: from unknown (HELO localhost) ([10.252.45.101])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:53:27 -0700
Date: Thu, 25 May 2023 15:53:24 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZG9aROGyc947/J1l@jlahtine-mobl.ger.corp.intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Here goes drm-intel-fixes for v4.6-rc4.

Again just one fix, for pipejoiner config pipe disabling.

Regards, Joonas

***

drm-intel-fixes-2023-05-25:

PIPEDMC disabling fix for bigjoiner config

The following changes since commit 44c026a73be8038f03dbdeef028b642880cf1511:

  Linux 6.4-rc3 (2023-05-21 14:05:48 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-05-25

for you to fetch changes up to 45dfbd992923f4df174db4e23b96fca7e30d73e2:

  drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration (2023-05-22 17:10:11 +0300)

----------------------------------------------------------------
PIPEDMC disabling fix for bigjoiner config

----------------------------------------------------------------
Imre Deak (1):
      drm/i915: Fix PIPEDMC disabling for a bigjoiner configuration

 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
