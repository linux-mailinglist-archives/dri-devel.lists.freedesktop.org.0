Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A0707107
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 20:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C826B10E256;
	Wed, 17 May 2023 18:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A6210E256;
 Wed, 17 May 2023 18:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684349073; x=1715885073;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=BGOCNSQ5TKPL9sF6XhwNfC0FUKD25IujQZ/RoHskVx4=;
 b=Vk9tDr4ieSUJobJjbD4Se1N1f5x2x9ZniiVpibzD3BuZKaXCEbA+u5t9
 /ESb/UWXEYtLBnF+uAicwN45YOX6Zoa2RUgEQglgokCirukIHthKrqaFy
 u7AcsAzWlCv/5DYSGbkReD+kOYSrSDB44gseB23OD6VzotN2Ur1/tWRQ6
 EnxUGu1GfSN99Ey0XVpAxTh4t6onpiQS6WuR5sELZr0k2eq77V0RxL7j+
 +unxxLz15Elv+T9Q05bwIUAaFj0rdzOaZWt2WTysHtJJmDrqQ57zDO+6J
 Y0YRkBn7uYGBoPRAE8a84b8LAFJMajRIlrdmpjMavute3YO8pOoJcuTDz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336404135"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="336404135"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 11:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="1031842384"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="1031842384"
Received: from kfinnuca-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.60])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 11:44:29 -0700
Date: Wed, 17 May 2023 21:44:27 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZGUgi7kXq+MiLcCA@jlahtine-mobl.ger.corp.intel.com>
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

Here goes drm-intel-fixes for v6.4-rc3.

Just one missing null check addition for HDCP code.

Regards, Joonas

***

drm-intel-fixes-2023-05-17:

Add missing null check for HDCP code.

The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-05-17

for you to fetch changes up to 5896f2d363d5cfb7510856c90d5e0ed934a1d340:

  drm/i915/hdcp: Check if media_gt exists (2023-05-15 10:42:35 +0300)

----------------------------------------------------------------
Add missing null check for HDCP code.

----------------------------------------------------------------
Suraj Kandpal (1):
      drm/i915/hdcp: Check if media_gt exists

 drivers/gpu/drm/i915/display/intel_hdcp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
