Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DD6FFF8B
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 06:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BF710E00C;
	Fri, 12 May 2023 04:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D7110E00C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 04:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683864585; x=1715400585;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ij2TBovyX1fbUGAzCKCpJn+xp0fp35Qx/066/MjPBlg=;
 b=mJSgBztLpJ+vPETvyFkfop9chIicPHY0WlMvleGgjo3r7KNPeLY9WfsP
 DlxqB+ahxXX1J8XHPrJjpDRuqoA1O11/a7Mu4fyUCa+jL2WQZbhLSXQ1j
 ZgOQXUwavCjE83b4T9vew0B4bKgEMSwxQ0e5ySmAAHXCWE8+M7z8IEdBO
 PHuKShAaVC3vAWbCbabxAWFDv4I5QDJ8HWc+fCeOOYCSakEshKEbfjBCO
 AkF68fF2+/YFUu7ydzh8aBlucR2qdJ75H+9upueOxnS62EWhvALNgUtx/
 ERd6OIXd6cgupWOUPoJPuHbZTTK13tViwVIUAK63QQKXjzvaSK8weIWy3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416324507"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="416324507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 21:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732872157"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="732872157"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 11 May 2023 21:09:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pxK63-0004UL-0Y;
 Fri, 12 May 2023 04:09:35 +0000
Date: Fri, 12 May 2023 12:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: Re: [PATCH 04/10] net: ethernet: 8390: Replace GPL boilerplate with
 SPDX identifier
Message-ID: <202305121107.Au46XZCK-lkp@intel.com>
References: <20230511133406.78155-5-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511133406.78155-5-bagasdotme@gmail.com>
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
 "David A . Hinds" <dahinds@users.sourceforge.net>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Greg Ungerer <gerg@linux-m68k.org>,
 Andy Gospodarek <andy@greyhouse.net>, Dan Carpenter <error27@gmail.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Minghao Chi <chi.minghao@zte.com.cn>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Peter De Schrijver <p2@mind.be>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>, Donald Becker <becker@scyld.com>,
 oe-kbuild-all@lists.linux.dev, Simon Horman <simon.horman@corigine.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bagas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Bagas-Sanjaya/agp-amd64-Remove-GPL-distribution-notice/20230511-214307
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230511133406.78155-5-bagasdotme%40gmail.com
patch subject: [PATCH 04/10] net: ethernet: 8390: Replace GPL boilerplate with SPDX identifier
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121107.Au46XZCK-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
   include/net/bonding.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_audio.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_blowfish.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_cmx.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_core.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_dtmf.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_tones.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/bonding/bond_main.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/bonding/bonding_priv.h: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/8390.h: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/apne.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/axnet_cs.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/hydra.c: 1:28 Invalid License ID: GPL-1.0-only
>> drivers/net/ethernet/8390/lib8390.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/mac8390.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/ne.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/ne2k-pci.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/pcnet_cs.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/smc-ultra.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/ethernet/8390/wd.c: 1:28 Invalid License ID: GPL-1.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
