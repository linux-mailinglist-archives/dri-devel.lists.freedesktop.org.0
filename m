Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF5719F37
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 16:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022A610E131;
	Thu,  1 Jun 2023 14:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8036610E131;
 Thu,  1 Jun 2023 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685628553; x=1717164553;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=mil7lhAZxpLhYqIms/MfsdGRrP6/pDWG4A0XpIhr0LU=;
 b=ZoMfqB+HbBOZZ3ZGbw1y/hBlrh1fRxMzeoPCeaPQrmTqsnZVJKapeY2w
 UK3tG7o2iEBmzKvMi0DiRwPFY6GTFi9SB4PuRrNkrPylacaQt4VBt9Cdx
 nLLjrK3Mce9EJEG1uFxOGI/DKNSD7Uy0Bri+tQMVfzrkHWDZDPYc1v5Bo
 TrBWMf1PNXkWGA9KuVL5dWRSCm0o09QWqhmS+/cYbS5unG5JzNDcKm8fv
 5roo0zbCVe0Zkm8jr49MmApeslBWGIZfexlxs1vIMy5xKT8pXTLBexDJ4
 QvC/w5HV57joEBGX8gkb1IwPFFHV+5C2K4MACrv/ehoS+7gxUSUH3dkKc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353063861"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="353063861"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831593851"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="831593851"
Received: from amnerie-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.2.192])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:09:07 -0700
Date: Thu, 1 Jun 2023 17:09:03 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZHimf55x/DyXYar1@jlahtine-mobl.ger.corp.intel.com>
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

One fix appeared this morning, related to OA API for
non-power-of-two reports.

Full CI results not in yet, BAT is looking good so please check
before pulling the trigger.

Regards, Joonas

***

drm-intel-fixes-2023-06-01:

- Fix for OA reporting to allow detecting non-power-of-two reports

The following changes since commit 7877cb91f1081754a1487c144d85dc0d2e2e7fc4:

  Linux 6.4-rc4 (2023-05-28 07:49:00 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-06-01

for you to fetch changes up to 62fe398761cd06a428e6f367aba84732a2f1c268:

  drm/i915/perf: Clear out entire reports after reading if not power of 2 size (2023-06-01 09:41:58 +0300)

----------------------------------------------------------------
- Fix for OA reporting to allow detecting non-power-of-two reports

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/i915/perf: Clear out entire reports after reading if not power of 2 size

 drivers/gpu/drm/i915/i915_perf.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)
