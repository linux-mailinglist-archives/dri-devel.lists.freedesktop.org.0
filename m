Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89B21F7808
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 14:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E556E037;
	Fri, 12 Jun 2020 12:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AC96E037
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 12:40:54 +0000 (UTC)
IronPort-SDR: sOFU1KftTXX7n27bBwvp2ptW1YKjpniKVdV2nAGRQP6/cwewxwuIvld1x9U+C6vn5g3FR5nPdW
 qrAGvcn3+9og==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 05:40:54 -0700
IronPort-SDR: dbq+MThCaK6fC8yMtZnmpkCURF5F8y8eSyAuDAu5LZ9fldwt84yuw3cw3bnvC4UFwmnEYbK2Q5
 O4CqYIcQyWSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; d="scan'208";a="289862274"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
 by orsmga002.jf.intel.com with ESMTP; 12 Jun 2020 05:40:51 -0700
Date: Fri, 12 Jun 2020 20:40:17 +0800
From: Philip Li <philip.li@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [kbuild-all] Re: [PATCH 4/4] drm: pl111: Update documentation
Message-ID: <20200612124017.GD7636@intel.com>
References: <20200609200446.153209-4-linus.walleij@linaro.org>
 <202006101538.mV5c2loX%lkp@intel.com>
 <CACRpkda+GJpHQjvfjcFfhher+Vfr66DRgf6my2Fx7qg9=-5ATQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda+GJpHQjvfjcFfhher+Vfr66DRgf6my2Fx7qg9=-5ATQ@mail.gmail.com>
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 01:04:02PM +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2020 at 9:38 AM kernel test robot <lkp@intel.com> wrote:
> 
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on drm-exynos/exynos-drm-next]
> > [also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master v5.7 next-20200609]
> > [cannot apply to drm-tip/drm-tip drm/drm-next]
> > [if your patch is applied to the wrong git tree, please drop us a note to help
> > improve the system. BTW, we also suggest to use '--base' option to specify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> >
> > url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/drm-pl111-Credit-where-credit-is-due/20200610-041025
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
> > reproduce: make htmldocs
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> What on earth was that. The robot reports on a patch only adding a few lines
> of comments as breaking the whole universe, and none of these systems
> even use the PL111.
Thanks for feedback, this is supposed to check make htmldocs. We will double
check this to fix issue. Sorry for noise.

> 
> Yours,
> Linus Walleij
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
