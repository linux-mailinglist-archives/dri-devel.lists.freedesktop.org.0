Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180AD203352
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 11:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B196E0F0;
	Mon, 22 Jun 2020 09:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4566E0F0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:28:51 +0000 (UTC)
IronPort-SDR: q9f4lx1gJs3vNXmGHOZ8ZUPcqQnt8UmjzDMRTocvvfi4daP72kHOoRl6s7yxSfZ81xkTxodYgb
 17T7FUahjPgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="142763255"
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="142763255"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 02:28:50 -0700
IronPort-SDR: DYfUSnMSpl17B46igein1OOlahoUHMek9dQ8NjyWvq24ZZB/iVze/Bi2s/NjA4MiVwYcVv6fwx
 Ed4zZzeizOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="478388254"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2020 02:28:47 -0700
Subject: Re: [kbuild-all] Re: [PATCH 4/4] drm: pl111: Update documentation
To: Philip Li <philip.li@intel.com>, Linus Walleij <linus.walleij@linaro.org>
References: <20200609200446.153209-4-linus.walleij@linaro.org>
 <202006101538.mV5c2loX%lkp@intel.com>
 <CACRpkda+GJpHQjvfjcFfhher+Vfr66DRgf6my2Fx7qg9=-5ATQ@mail.gmail.com>
 <20200612124017.GD7636@intel.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <d9fe3168-d226-2c97-13ea-2495eea23034@intel.com>
Date: Mon, 22 Jun 2020 17:28:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200612124017.GD7636@intel.com>
Content-Language: en-US
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/12/20 8:40 PM, Philip Li wrote:
> On Fri, Jun 12, 2020 at 01:04:02PM +0200, Linus Walleij wrote:
>> On Wed, Jun 10, 2020 at 9:38 AM kernel test robot <lkp@intel.com> wrote:
>>
>>> I love your patch! Perhaps something to improve:
>>>
>>> [auto build test WARNING on drm-exynos/exynos-drm-next]
>>> [also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master v5.7 next-20200609]
>>> [cannot apply to drm-tip/drm-tip drm/drm-next]
>>> [if your patch is applied to the wrong git tree, please drop us a note to help
>>> improve the system. BTW, we also suggest to use '--base' option to specify the
>>> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/drm-pl111-Credit-where-credit-is-due/20200610-041025
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
>>> reproduce: make htmldocs
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>> What on earth was that. The robot reports on a patch only adding a few lines
>> of comments as breaking the whole universe, and none of these systems
>> even use the PL111.
> Thanks for feedback, this is supposed to check make htmldocs. We will double
> check this to fix issue. Sorry for noise.

Hi Linus,

We won't show unrelated htmldocs warnings in the future,
but the warning (with prefix '>>') was found in this patch,
could you take a look?

>> drivers/gpu/drm/pl111/pl111_drv.c:1: warning: 'ARM PrimeCell PL111 CLCD Driver' not found


Best Regards,
Rong Chen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
