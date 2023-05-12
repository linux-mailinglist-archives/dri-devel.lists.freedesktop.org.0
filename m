Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E166FFF73
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 05:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A460310E616;
	Fri, 12 May 2023 03:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D3310E616
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683863562; x=1715399562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pmopDKLIc4zl+fq5xL7xMuzECz1xDAHg5SvtSuERXKQ=;
 b=O6od6CE021N3vV5WMGIQo2pdaT7q5QxsVjHf2HuFwkZHuVqMGF+Ul8aG
 86voWjU7WlVxifh9RjQYuAwUQ+ct5fXV61jSiJTs9/KNCF16BoxeLcUk7
 vR1qPt4Kb4VoawPMUkuIOi20lSwve2ipqBSGj0E9jQ4Rwjeb60NDx23HA
 Wm0oeGNxUPsmIII89hrxpIhT/QWGEKM3IXhQP2YBuyUYwl50Jq6OmYVEa
 8pR0VWEF921OUTFCiM3j/MRZJu6U8SETTzPS1yRGFXSDMwZed240g3Pz2
 0VC9sV1it3edrduKMq3APU5+XS3Ooa+HKgXf2HBy54CTIe8rnZhnSRiKO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="437027760"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="437027760"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 20:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="769629426"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="769629426"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 11 May 2023 20:52:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pxJpa-0004TA-28;
 Fri, 12 May 2023 03:52:34 +0000
Date: Fri, 12 May 2023 11:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: Re: [PATCH 03/10] net: bonding: Add SPDX identifier to remaining files
Message-ID: <202305121116.pEUebm1s-lkp@intel.com>
References: <20230511133406.78155-4-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511133406.78155-4-bagasdotme@gmail.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Tom Rix <trix@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 David Airlie <airlied@redhat.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Andy Gospodarek <andy@greyhouse.net>, Simon Horman <simon.horman@corigine.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bagas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Bagas-Sanjaya/agp-amd64-Remove-GPL-distribution-notice/20230511-214307
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230511133406.78155-4-bagasdotme%40gmail.com
patch subject: [PATCH 03/10] net: bonding: Add SPDX identifier to remaining files
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121116.pEUebm1s-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> include/net/bonding.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_audio.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_blowfish.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_cmx.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_core.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_dtmf.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_tones.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/bonding/bond_main.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> drivers/net/bonding/bonding_priv.h: 1:28 Invalid License ID: GPL-1.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
