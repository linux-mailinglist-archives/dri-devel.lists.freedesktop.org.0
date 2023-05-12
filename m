Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09C70001A
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AE110E61E;
	Fri, 12 May 2023 06:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4474210E61E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683871309; x=1715407309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iHUv69UyfzxQ3VeWTpR1GT/N/Rvib8OFJmndtMsMloI=;
 b=DatQ72d+yu+UjxieNH615C/N5ZDF/qtniM72yQTKCDi0sQN8Vl1F3jBc
 ndwf8540hpQUNfndfkXFPVL9WukuyPNJ/Vl/MGmASmqWpJemQ91OLeV6m
 3xeGkwJlJbNO3RAILrAmsbvibrWOcDwMMC3SEEyflXPyoQY1lrC3HRM4k
 yGj93CLP71L5akArTks3XS0G6GvyHgmm/urynM7SKEjIx82qDX/h0v/0O
 LMGjap6S9eDnT4qoTXlNn2egIaC/iYmDxiUU2856EuVaZSkBLns76o8lQ
 X0Ddm/t/pjPFRf8p8R1rDDF1cvyAXmzRJnJemAQBb12yKgOL/1WNgBJ+6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353840866"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="353840866"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730683054"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="730683054"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2023 23:01:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pxLqU-0004a2-04;
 Fri, 12 May 2023 06:01:38 +0000
Date: Fri, 12 May 2023 14:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: Re: [PATCH 10/10] include: synclink: Replace GPL license notice with
 SPDX identifier
Message-ID: <202305121302.dCL8lmbx-lkp@intel.com>
References: <20230511133406.78155-11-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511133406.78155-11-bagasdotme@gmail.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>,
 Tom Rix <trix@redhat.com>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Andy Gospodarek <andy@greyhouse.net>,
 Dan Carpenter <error27@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Minghao Chi <chi.minghao@zte.com.cn>, Viresh Kumar <viresh.kumar@linaro.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Simon Horman <simon.horman@corigine.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bagas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Bagas-Sanjaya/agp-amd64-Remove-GPL-distribution-notice/20230511-214307
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230511133406.78155-11-bagasdotme%40gmail.com
patch subject: [PATCH 10/10] include: synclink: Replace GPL license notice with SPDX identifier
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121302.dCL8lmbx-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
   drivers/pcmcia/cirrus.h: 1:44 Invalid License ID: MPL
   drivers/pcmcia/pd6729.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/watchdog/ibmasr.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/watchdog/sb_wdog.c: 1:28 Invalid License ID: GPL-1.0
   fs/udf/ecma_167.h: 1:44 Invalid License ID: GPL-1.0-only
   fs/udf/osta_udf.h: 1:44 Invalid License ID: GPL-1.0-only
>> include/linux/synclink.h: 1:28 Invalid License ID: GPL-1.0-or-later
   include/net/bonding.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_audio.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_blowfish.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_cmx.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_core.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_dtmf.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_tones.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/bonding/bond_main.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/bonding/bonding_priv.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/8390.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/apne.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/axnet_cs.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/hydra.c: 1:28 Invalid License ID: GPL-1.0-only
   drivers/net/ethernet/8390/lib8390.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/mac8390.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/ne.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/ne2k-pci.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/pcnet_cs.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/smc-ultra.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/wd.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/i825xx/82596.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/i825xx/lasi_82596.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/i825xx/lib82596.c: 1:28 Invalid License ID: GPL-1.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
