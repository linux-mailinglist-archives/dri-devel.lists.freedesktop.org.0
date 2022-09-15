Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6985B9C96
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 16:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E226A10E1D0;
	Thu, 15 Sep 2022 14:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EEE10E1D0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663250907; x=1694786907;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Z7Lu2DWPRFF2nf/dGi8qHHlBq8bmy7c7kcLKhkB15FE=;
 b=lKJC/wXTS6xq5mhhZ7r5FRggjgwpIvv81br1PlB6UhFmTlklSUw4A96i
 Kxndclvx2Q6ILnLumw/jyTQFVjxVuRc171XSwbWg24jTfO9zk95sz1m0g
 MUhh+XEviqSofy2y1nfD7Xac20B4Zoq9F8ZGkSkOYZlEunidFQsN/PVEy
 p/RaeER0muyGKrsErh4hjtlCTPuE94CIBKyku8YmRVZCNY2Iq9kDqY8PI
 cLcJKW50gyEyBx6BY0m2k8lN70pTogRNXv70WoDSZWxr97MUkGQZKHeXK
 iIuNE/1pLZZNExe2EXZJrAJTh9oXBSVDaL3vLr0Cfwm6hzLBYX91leo84 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="360459825"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="360459825"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 07:07:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="742943216"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.146])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 07:06:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org, dri-devel@lists.freedesktop.org
Subject: pr-tracker-bot for drm subsystem?
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 15 Sep 2022 17:06:51 +0300
Message-ID: <87a670spdw.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hey all, I'd be interested in having the pr-tracker-bot [1] set up for
the drm subsystem, following the dri-devel mailing list [2] and
notifying when the pull requests have been merged to either the drm-next
or drm-fixes branches of the main drm repository [3].

What would this require in terms of the tracker bot code?

Is the idea that the service could be expanded to cover subsystems
instead of just LKML and mainline, or would all subsystems have to set
it up for themselves with their own cron jobs on their own servers?

Other considerations?


BR,
Jani.


[1] https://korg.docs.kernel.org/prtracker.html
[2] https://lists.freedesktop.org/mailman/listinfo/dri-devel
[3] https://cgit.freedesktop.org/drm/drm/

-- 
Jani Nikula, Intel Open Source Graphics Center
