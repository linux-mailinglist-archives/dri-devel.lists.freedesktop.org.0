Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A93A733B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 03:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE00589F8E;
	Tue, 15 Jun 2021 01:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476089F8E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 01:08:58 +0000 (UTC)
IronPort-SDR: 9GgAq8y5ucCRlMceJzSUewa75sLsRoJM0n0uV5TtHzgvlzHT7QBFSAvpi4FVLNZuuXil/txWRQ
 3hAi11J2MCdw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="185597304"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="185597304"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 18:08:57 -0700
IronPort-SDR: m8YrB9Yd4usLrMSp/h4lqUHwCbGVQo7pLituvmU1gNRLs8LagHH5JCFvkOw23mRlA4Jsrwgnrq
 Gp1VlLZVuD1g==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="450065067"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.11])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 18:08:55 -0700
Date: Tue, 15 Jun 2021 09:08:53 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Subject: [tip:tmp.tmp2 302/364] drivers/video/backlight/rave-sp-backlight.c:
 linux/backlight.h is included more than once.
Message-ID: <20210615010853.GM237458@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, kbuild-all@lists.01.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: 3fb8658426ac271948eb757e1c5a5554afdc5cf8 [302/364] sched/headers, fb: Simplify <linux/fb.h> dependencies
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/video/backlight/rave-sp-backlight.c: linux/backlight.h is included more than once.
--
>> drivers/video/backlight/lm3639_bl.c: linux/backlight.h is included more than once.
--
>> drivers/video/backlight/kb3886_bl.c: linux/backlight.h is included more than once.
--
>> drivers/video/backlight/da9052_bl.c: linux/backlight.h is included more than once.
--
>> drivers/video/backlight/cr_bllcd.c: linux/backlight.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
