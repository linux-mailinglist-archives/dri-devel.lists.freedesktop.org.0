Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3033B476D45
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 10:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A1010ECF4;
	Thu, 16 Dec 2021 09:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1390 seconds by postgrey-1.36 at gabe;
 Thu, 16 Dec 2021 09:20:07 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0A210ECF0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hc8PniX1O3m43JAUOFyo2+ZL/GfkioFBwhdYGbPz2cI=; b=TiNt5FDJ7CE2zVSDNr9aQlu1dg
 Q1sQgcMp3w8M7wH9QAX/Il5DEQ4S7KNu/+y4D9VsahWfKExgvDQQ/4rIt4gW6AAiS6s5xXiY2v5Z0
 B/A6VUhPOsU62/w8MG+sF7g/Pfvf/uunGaipLkgpmIxNt0DQR2DadU5kRbD25sPE6nmB8Q8MeO7QT
 NRSGwR46KSfzM9UhwIrCo2fqN92VYjGkIsR9sYnjmrE2qTvwSNGmNxJWTd5ec0oWIT0jfpbDL+KjR
 4z26lRmka4LJ14FBb1VExMkYLm2dYfx0Vg0kdSIXyXRYiQ5c3e4POzbjfDxMI0ixgJbJQAs+KlhMp
 sFl34JXw==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1mxmZB-00069V-2u; Thu, 16 Dec 2021 10:56:45 +0200
MIME-Version: 1.0
Date: Thu, 16 Dec 2021 10:56:42 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH] drm/tilcdc: add const to of_device_id
In-Reply-To: <202112160411.sNrSELAY-lkp@intel.com>
References: <20211215161803.5900-1-wangxiang@cdjrlc.com>
 <202112160411.sNrSELAY-lkp@intel.com>
Message-ID: <44cf76aa7bc28df08a7a40a9a454c40a@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tomba@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please fix the bellow error and I will review and merge this. But in 
future, please at least compile test you changes with relevant 
configurations or alldefconfig before sending them to upstream!

Best regards,
Jyri

On 2021-12-15 22:35, kernel test robot wrote:
> Hi Xiang,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on drm/drm-next]
> [also build test ERROR on v5.16-rc5 next-20211214]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:
> https://github.com/0day-ci/linux/commits/Xiang-wangx/drm-tilcdc-add-const-to-of_device_id/20211216-002326
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: arm-randconfig-c002-20211214
> (https://download.01.org/0day-ci/archive/20211216/202112160411.sNrSELAY-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
> https://github.com/0day-ci/linux/commit/5698eadb76d94a4fc5298f5bea88b839399ddef0
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review
> Xiang-wangx/drm-tilcdc-add-const-to-of_device_id/20211216-002326
>         git checkout 5698eadb76d94a4fc5298f5bea88b839399ddef0
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0
> make.cross O=build_dir ARCH=arm SHELL=/bin/bash
> drivers/gpu/drm/tilcdc/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/gpu/drm/tilcdc/tilcdc_drv.c:590:34: error: conflicting types 
>>> for 'tilcdc_of_match'; have 'const struct of_device_id[]'
>      590 | static const struct of_device_id tilcdc_of_match[] = {
>          |                                  ^~~~~~~~~~~~~~~
>    drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:28: note: previous
> declaration of 'tilcdc_of_match' with type 'struct of_device_id[]'
>       63 | static struct of_device_id tilcdc_of_match[];
>          |                            ^~~~~~~~~~~~~~~
>    drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:28: error: array
> 'tilcdc_of_match' assumed to have one element [-Werror]
>>> drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:28: error: 'tilcdc_of_match' 
>>> defined but not used [-Werror=unused-variable]
>    cc1: all warnings being treated as errors
> 
> 
> vim +590 drivers/gpu/drm/tilcdc/tilcdc_drv.c
> 
>    589
>  > 590	static const struct of_device_id tilcdc_of_match[] = {
>    591			{ .compatible = "ti,am33xx-tilcdc", },
>    592			{ .compatible = "ti,da850-tilcdc", },
>    593			{ },
>    594	};
>    595	MODULE_DEVICE_TABLE(of, tilcdc_of_match);
>    596
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
