Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D57AE3D9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 04:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAB810E344;
	Tue, 26 Sep 2023 02:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8748F10E344;
 Tue, 26 Sep 2023 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695697162; x=1727233162;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PqpmoCdcEoilx4imrZ5lh4kLGATk+3fxlPYPP3mKYPo=;
 b=hXzWoIuQoefbmZLgJtkX0mBiYyh2V1tAggkXTGJACRNJ6BYvysmzIxMl
 /rNYKUa9g9Mwu7YwXiHlXBmH3NNeNcWN/uQNxX53LGcRkPFVgEv79kW+S
 i26tTVo0gXpBcmhaump0pPujFsYxcvcbR/QCODR8wwMwIQN2i5avKPGxV
 /lb9K5g+3P5Hv9q90uMnuIn7hDmeS/vfr4PreC0mH0cyMQtCcudf9VZLo
 Ccov3jo2ogOc74B2paPbhsIbld1SVM+wpnwSfT0zidPeV9hRLCxulQaFo
 IVIZ06mcyQTJmfrpkWSZIlerOcNwv8J4YtBF4m96pPLMyT+3jhXqwuXNk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385317644"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="385317644"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 19:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995645616"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="995645616"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 19:59:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 19:58:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 19:58:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 19:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUxe4VjASQOixsivppnJjl66gNIWuhMbzDQ9lQVyOZemvJIuYyYFYU3zvfolR1U2kqWFxL8HcGtCOx9l6A9a58IhxSIV8AIRkqjgs255ArxWBNcPnRdxbN2xusyNdUFO1OML46FL2iyQnMrpuItJ4fNmH/pMMvKDnH2XiZpc7Ja5tRrpgJmjFrhO1UAIQa2FxUrn9YxojIHalWaVED6j12OnYe6vqzeo+5wHZR7itUMfB3ZiUKxOAUfZYnuJFHZxaqkONG5lVQMfwt+Nr1ok8ttGzvZluhOXksrbindU6WEptDJpe7U6mR6md/tHqLmc3Jw+3St0iUPnUQPlkmk9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu5T12nzc0NKUFmTOBY2bf7oReSAvbAdoWsjj4wXCVc=;
 b=EEOMsa7qZ3S/64trYeFXKjGC75snXSGXqjCEOmwwGs19z23Yu5viNWvNEArJxqrb8tlqMaPXPXEKKugZN8BtfnAR5n66ziTemmPj00hz1ypkmo48v6JGC5Pvfs/FdRQ5G3CiSq7MWm4b37XrW0JVsfFtjd1gMnn7/gt/DJGTRXdTGAfot0eibXuBgvwJgi4O7PrXuwfIL0wVo1Wcza6at5qak390bc/CYw4ojaDBEQGtFqnCin96ohyd5QpOODjtWvYVfMFSjlTS55v2HL9tc3v+DbRST1cD6AUmFTdTcufvJeNxkDUrZ0xKJ/aKBpQHARGdS24uHlQ4S0NEfqAmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 26 Sep
 2023 02:58:57 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 02:58:56 +0000
Date: Tue, 26 Sep 2023 10:58:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Allow users to disable waitboost
Message-ID: <202309261055.b74df987-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SG2PR04CA0193.apcprd04.prod.outlook.com
 (2603:1096:4:14::31) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 905363a6-a666-4485-6f5c-08dbbe3c863e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2gnzTnaTWCouu+hDjiyTmm7cBfkBx2XyhJ1MHuPxxZ8KRsNYbjSaRJBz8A2EbmcpYgQYNLceuLp3l2S9tofNCRJlmcGoEpxTmmiJ0IIbKBp2kxLp4i1lA5HHFuB6oCfgPLO6gNHA0Pl7qUXXtSKOgGtcES2PcIgfzuEN0/M8ELLmV47RoNVMa7TqZ5a9fNdKvM/swn6TWFBSSo8G6ELlM4VFsDjWLOBSYeK5qVzLLFBSjVgNYs0HjjVQIaobisRkrhmlxu72E6wEAYH+uU1P3msVmva/IcOkdUbEga6ub3Q82j30q1NZIb5udgQnAClRnWovHWp5B85N6yG9WSDwN4bJB5gaiP5K+tnbNr4yvCcgt/f4E/bAY+2xIghpUO11osULHOCAmTS2XaxDRcmrlui5400UYQjORgFYImozHgG9Gw8o9FHdiNg4JDUENyGyeJjvzSjVKqkYQMUJedpmbZf1laABGJO2i2sqBRMjGjKCpTmgSNM0qmLjF2Eyfw2cx6mp6171EROyq3OZ7/SzmnhYEVui80735ZSGh13QOBrVf0NNU9U+xEmbi5UQoYVTiGyoBWtPt0n57F6j+fy3QA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(451199024)(1800799009)(186009)(6486002)(6512007)(83380400001)(4326008)(6506007)(8936002)(6862004)(966005)(8676002)(26005)(2616005)(107886003)(1076003)(82960400001)(2906002)(38100700002)(19627235002)(30864003)(41300700001)(36756003)(6636002)(66946007)(37006003)(54906003)(66556008)(66476007)(316002)(86362001)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?spM5A9fbpO6c0lOCZctdyNWPjSTO+4PVO8uia+VZwUvvn1kRROCDBzG3/w?=
 =?iso-8859-1?Q?MXij/IzYwLiZylrxypC9y6IdXA3seJW9Z49Fm+xMlJJKP5fI3OSdOPqyuS?=
 =?iso-8859-1?Q?kDEPI8k9FqnIlUpjs9aYrK5uyPWRl4iUvmQXNqv8Gpm1ErdCJfRmE/u3/9?=
 =?iso-8859-1?Q?VaysD2f10PYEr5s0xY8bzikZzM9QpCeoRuhG1fR0oiliOn2+zNaWMfkK27?=
 =?iso-8859-1?Q?VBawK4qZIEXDMhnc84wXYidH0PoPGO4JJ2QVs3+tUam1Otbe1JQbDVtNC8?=
 =?iso-8859-1?Q?soeCG+K5RmGd9+Atqeblu7TwlQWiAaO5FzGSLAlgH6thM/tvfsI6eWCdcK?=
 =?iso-8859-1?Q?UqbXpJdUWO8OMteO486aCD+FyniUvJLuGKk0lTmvGC02CnQOfrywhqVoSJ?=
 =?iso-8859-1?Q?Rg0k9PpbwzVRKYh11pCma3XIGM7ggU3IRu1hN/0iVRl8VWuBtEUp+LCPU+?=
 =?iso-8859-1?Q?C60NK8lwum1XeCAjf1c24tks7DkwtgoZioRADO/079n4F3RrQDY1iOXmdL?=
 =?iso-8859-1?Q?g/tAmQTyaiDidFGeHyj3lHIQaoJT+iQ/c/0wTYjpapRTwOzS4Px6GbWBBL?=
 =?iso-8859-1?Q?EIwHzdYSHEy/Hgs7YDKTxUJPN/ZlvR5KaPejP33VjZ2MoeJ9KOWvgebJJZ?=
 =?iso-8859-1?Q?qYYhN0AFZ0DFfctsQtue3gA+k7qVbdUQfO4ERZVDRtoE6zuh/U+mRT78tm?=
 =?iso-8859-1?Q?F8Z3vH9fenS8pFnmNpRfk4fdAU1fHRTgsdhrzQQpnCewGItkM2bwL5Uq98?=
 =?iso-8859-1?Q?ngKqpbck8pFAqiY81A7hXXhIQw8QeB9cIz6Xa9izeP/Ou+s7MBd5v0RT84?=
 =?iso-8859-1?Q?tHOcJTf89bbvJy85D5JY+PHBxbSp9LAYntktQGyMGbP/MdXUQY1kwmrdaq?=
 =?iso-8859-1?Q?MXOChjJSUB5TbXoQB54XwRRlZynlpLdvFy3fun79A4r09i+K92aeuLrVur?=
 =?iso-8859-1?Q?o2XmyH5x6O1OHAdSpqvykW3vkxQYa1lRxk7lQaUzvMBZKLERW8VWSdUErT?=
 =?iso-8859-1?Q?TTFD2gxPIF5sUKQyxo8n3OekGXIXy/uYABcZgGG2zaZNiaaFK9Uht9U876?=
 =?iso-8859-1?Q?7DvwutcovPkXDqEgWMvD+Ky+lBVuK1Dc5JaDGXtWmiIp/rLS4n31QXdyxT?=
 =?iso-8859-1?Q?hfIl1RrhmuQILNYM7Q5NEyKBezXoPsvJaFD/DQmR05XOr0pIODbs398PAG?=
 =?iso-8859-1?Q?HXt3Nzo7YwHewuUR1TPdRCIL5LLHDgWnLpR6EatP/a2SnXdBOWMJTyLSH7?=
 =?iso-8859-1?Q?WueUZ/vWEn72Xe2NzIqZI68oEW2b1QVJNOdE3xvOUQk/Ae+p3KRtwND9+2?=
 =?iso-8859-1?Q?5uX7SAQdWMQltvTG+tvayG87yqJN9YSiPYQE39+55rbxjm/UfgFG4Bg9LQ?=
 =?iso-8859-1?Q?rNGt1wSuOH80ITCUpNr/N9PhEscXueI+Z+fc99MS/jat4czdBieDqYhgCl?=
 =?iso-8859-1?Q?BI+LcSpzgPpxTC+7RHKrYwYiqX/RACUdjMZrQYN/RVzZvvt7fY724Y+r++?=
 =?iso-8859-1?Q?ezWGcuEi4EDig/m068nWUmCDaBGwRQmSh/4YJl1mlTmwqmpoUHzQsuzQk5?=
 =?iso-8859-1?Q?i5ZGi7z1OeRnGS8c2hecuBMQzagoafWwKT3CVxHNzb+XyP25iWo5hEHJ8l?=
 =?iso-8859-1?Q?5ZYMC4gLx3GeUosCv1nbiZXvCaoIMxXss3Rx6CFKvYliO4VybXvjGjyg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 905363a6-a666-4485-6f5c-08dbbe3c863e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 02:58:56.6412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsOnQE7dvNlQQAaeWbZQTPhnCIQxzNK6AJ/Aazn5hWsm4v7vQHWkvPi99lv6ycdwxAK26/DqQ+C1VVer3ZnhMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
X-OriginatorOrg: intel.com
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
Cc: feng.tang@intel.com, lkp@intel.com, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, fengwei.yin@intel.com,
 dri-devel@lists.freedesktop.org, oliver.sang@intel.com, ying.huang@intel.com,
 oe-lkp@lists.linux.dev, Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed a -3.2% regression of phoronix-test-suite.paraview.WaveletContour.1024x768.mipolys___sec on:


commit: 54fef7ea35dadd66193b98805b0bc42ef2b279db ("[PATCH] drm/i915/gem: Allow users to disable waitboost")
url: https://github.com/intel-lab-lkp/linux/commits/Vinay-Belgaumkar/drm-i915-gem-Allow-users-to-disable-waitboost/20230921-060357
base: git://anongit.freedesktop.org/drm-intel for-linux-next
patch link: https://lore.kernel.org/all/20230920215624.3482244-1-vinay.belgaumkar@intel.com/
patch subject: [PATCH] drm/i915/gem: Allow users to disable waitboost

testcase: phoronix-test-suite
test machine: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 32G memory
parameters:

	need_x: true
	test: paraview-1.0.2
	option_a: Wavelet Contour
	option_b: 1024 x 768
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------------------+
| testcase: change | phoronix-test-suite: phoronix-test-suite.x11perf.PutImageXY500x500Square.operations___second 12.8% improvement |
| test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 32G memory                     |
| test parameters  | cpufreq_governor=performance                                                                                   |
|                  | need_x=true                                                                                                    |
|                  | option_a=PutImage XY 500x500 Square                                                                            |
|                  | test=x11perf-1.1.1                                                                                             |
+------------------+----------------------------------------------------------------------------------------------------------------+
| testcase: change | phoronix-test-suite: phoronix-test-suite.openarena.2560x1440.milliseconds -12.2% regression                    |
| test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 32G memory                     |
| test parameters  | cpufreq_governor=performance                                                                                   |
|                  | need_x=true                                                                                                    |
|                  | option_a=2560 x 1440                                                                                           |
|                  | test=openarena-1.5.5                                                                                           |
+------------------+----------------------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309261055.b74df987-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230926/202309261055.b74df987-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/need_x/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/true/Wavelet Contour/1024 x 768/debian-x86_64-phoronix/lkp-cfl-d2/paraview-1.0.2/phoronix-test-suite

commit: 
  16a9359401 ("drm/i915: Implement transcoder LRR for TGL+")
  54fef7ea35 ("drm/i915/gem: Allow users to disable waitboost")

16a9359401edcbc0 54fef7ea35dadd66193b98805b0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.05 ±  4%      +0.0        0.06 ±  2%  mpstat.cpu.all.soft%
     66.17 ± 60%    +145.6%     162.50 ± 33%  turbostat.C10
     28.61            -3.3%      27.68        phoronix-test-suite.paraview.WaveletContour.1024x768.frames___sec
    298.15            -3.2%     288.49        phoronix-test-suite.paraview.WaveletContour.1024x768.mipolys___sec
    535005            +8.6%     580810        phoronix-test-suite.time.minor_page_faults
      6278            +8.3%       6797        phoronix-test-suite.time.voluntary_context_switches
    801166            +5.6%     845675        proc-vmstat.numa_hit
    799382            +5.1%     840353        proc-vmstat.numa_local
     59648            +2.6%      61211        proc-vmstat.pgactivate
   1539307            +2.7%    1580759        proc-vmstat.pgalloc_normal
    734297            +6.8%     783862        proc-vmstat.pgfault
   1343231            +3.1%    1385353        proc-vmstat.pgfree
     39042            +3.7%      40480 ±  2%  proc-vmstat.pgreuse
 1.106e+08            +2.1%  1.129e+08        perf-stat.i.cache-references
 4.255e+09            +1.9%  4.336e+09        perf-stat.i.cpu-cycles
    147872            +2.4%     151392        perf-stat.i.dTLB-store-misses
    230242            +2.2%     235419        perf-stat.i.iTLB-load-misses
    569455            +2.4%     583234        perf-stat.i.iTLB-loads
      0.35            +1.9%       0.36        perf-stat.i.metric.GHz
     12547            +8.6%      13625        perf-stat.i.minor-faults
    609443 ±  2%      +4.0%     633739 ±  2%  perf-stat.i.node-loads
   1701083 ±  2%      +5.0%    1786794 ±  2%  perf-stat.i.node-stores
     12566            +8.6%      13644        perf-stat.i.page-faults
 1.085e+08            +2.1%  1.108e+08        perf-stat.ps.cache-references
 4.179e+09            +1.9%  4.259e+09        perf-stat.ps.cpu-cycles
    225995            +2.3%     231096        perf-stat.ps.iTLB-load-misses
    558694            +2.4%     572272        perf-stat.ps.iTLB-loads
     12320            +8.6%      13380        perf-stat.ps.minor-faults
    598059 ±  2%      +4.0%     621901 ±  2%  perf-stat.ps.node-loads
   1670891 ±  2%      +5.0%    1754927 ±  2%  perf-stat.ps.node-stores
     12339            +8.6%      13399        perf-stat.ps.page-faults
     14.86 ± 42%     -11.7        3.12 ±152%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     14.86 ± 42%     -11.7        3.12 ±152%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     14.86 ± 42%     -11.7        3.12 ±152%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     14.86 ± 42%     -11.0        3.82 ±161%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     11.53 ± 67%     -10.1        1.39 ±223%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     11.53 ± 67%      -9.4        2.08 ±223%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     11.53 ± 67%      -9.1        2.43 ±143%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      6.02 ± 95%      -5.3        0.70 ±223%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      5.51 ± 56%      -4.8        0.70 ±223%  perf-profile.calltrace.cycles-pp.intel_idle_ibrs.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     14.86 ± 42%     -11.7        3.12 ±152%  perf-profile.children.cycles-pp.start_secondary
     14.86 ± 42%     -11.0        3.82 ±161%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     14.86 ± 42%     -11.0        3.82 ±161%  perf-profile.children.cycles-pp.cpu_startup_entry
     14.86 ± 42%     -11.0        3.82 ±161%  perf-profile.children.cycles-pp.do_idle
     11.53 ± 67%      -9.4        2.08 ±223%  perf-profile.children.cycles-pp.cpuidle_enter
     11.53 ± 67%      -9.4        2.08 ±223%  perf-profile.children.cycles-pp.cpuidle_enter_state
     11.53 ± 67%      -8.4        3.12 ±152%  perf-profile.children.cycles-pp.cpuidle_idle_call
      6.02 ± 95%      -5.3        0.70 ±223%  perf-profile.children.cycles-pp.intel_idle
      5.51 ± 56%      -4.8        0.70 ±223%  perf-profile.children.cycles-pp.intel_idle_ibrs
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
      7.02 ±128%      -2.6        4.44 ±147%  perf-profile.children.cycles-pp.get_signal
      6.02 ± 95%      -5.3        0.70 ±223%  perf-profile.self.cycles-pp.intel_idle
      5.51 ± 56%      -4.8        0.70 ±223%  perf-profile.self.cycles-pp.intel_idle_ibrs


***************************************************************************************************
lkp-cfl-d2: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 32G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/need_x/option_a/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/true/PutImage XY 500x500 Square/debian-x86_64-phoronix/lkp-cfl-d2/x11perf-1.1.1/phoronix-test-suite

commit: 
  16a9359401 ("drm/i915: Implement transcoder LRR for TGL+")
  54fef7ea35 ("drm/i915/gem: Allow users to disable waitboost")

16a9359401edcbc0 54fef7ea35dadd66193b98805b0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     11950 ±  3%     +93.9%      23173 ±  3%  meminfo.Unevictable
      1.02 ±  3%      -0.6        0.43 ±  3%  mpstat.cpu.all.iowait%
     21273            -5.3%      20141        vmstat.system.in
      4887 ± 32%     -67.7%       1579 ± 32%  phoronix-test-suite.time.involuntary_context_switches
    147212           +26.1%     185677        phoronix-test-suite.time.minor_page_faults
     76.83           +10.6%      85.00        phoronix-test-suite.time.percent_of_cpu_this_job_got
     96.48 ±  4%     +15.0%     110.93 ±  2%  phoronix-test-suite.time.user_time
    106.83           +12.8%     120.50        phoronix-test-suite.x11perf.PutImageXY500x500Square.operations___second
      3.73 ±  3%      -0.6        3.12 ±  2%  turbostat.C1E%
     58316 ±  5%     -20.6%      46326 ±  3%  turbostat.C3
      0.86 ±  2%      -0.1        0.74 ±  3%  turbostat.C3%
      1.24 ±  8%     -18.9%       1.01 ± 10%  turbostat.CPU%c3
     38.67 ±  2%      +5.0       43.70 ±  2%  turbostat.CPUGFX%
     23.44            +4.0%      24.38        turbostat.CorWatt
      2.30 ±  4%     -71.6%       0.65 ±  2%  turbostat.GFXWatt
     26.19            -2.7%      25.49        turbostat.PkgWatt
      1.41            +2.4%       1.44        turbostat.RAMWatt
     61.83 ± 23%     -20.2       41.62 ± 31%  perf-profile.calltrace.cycles-pp.intel_idle_ibrs.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     61.85 ± 23%     -20.2       41.64 ± 31%  perf-profile.children.cycles-pp.intel_idle_ibrs
      1.24 ± 59%      -1.0        0.23 ± 27%  perf-profile.children.cycles-pp.worker_thread
      0.84 ± 60%      -0.7        0.18 ± 48%  perf-profile.children.cycles-pp.asm_common_interrupt
      0.83 ± 61%      -0.7        0.18 ± 48%  perf-profile.children.cycles-pp.common_interrupt
      0.35 ± 74%      -0.3        0.06 ± 85%  perf-profile.children.cycles-pp.__common_interrupt
      0.35 ± 75%      -0.3        0.06 ± 85%  perf-profile.children.cycles-pp.handle_edge_irq
      0.30 ± 78%      -0.3        0.05 ± 81%  perf-profile.children.cycles-pp.handle_irq_event
      0.37 ± 18%      -0.2        0.18 ± 46%  perf-profile.children.cycles-pp.newidle_balance
      0.12 ± 32%      -0.1        0.04 ± 79%  perf-profile.children.cycles-pp.exit_mm
      0.12 ± 30%      -0.1        0.05 ± 73%  perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.03 ±144%      +0.1        0.10 ± 38%  perf-profile.children.cycles-pp.dma_resv_iter_first_unlocked
      0.04 ±154%      +0.1        0.19 ± 40%  perf-profile.children.cycles-pp.i915_gem_busy_ioctl
     61.82 ± 23%     -20.2       41.63 ± 31%  perf-profile.self.cycles-pp.intel_idle_ibrs
      0.12 ± 26%      -0.1        0.05 ± 74%  perf-profile.self.cycles-pp.native_apic_msr_eoi
     31861            +5.9%      33748        proc-vmstat.nr_active_file
     29007            +7.6%      31200        proc-vmstat.nr_mapped
    183598            +1.6%     186520        proc-vmstat.nr_shmem
      2987 ±  3%     +93.9%       5793 ±  3%  proc-vmstat.nr_unevictable
     31861            +5.9%      33748        proc-vmstat.nr_zone_active_file
      2987 ±  3%     +93.9%       5793 ±  3%  proc-vmstat.nr_zone_unevictable
    721353 ±  2%     +13.3%     816958        proc-vmstat.numa_hit
    721406 ±  2%     +13.2%     816970        proc-vmstat.numa_local
     21301 ±  4%     +13.1%      24099        proc-vmstat.pgactivate
   2459642 ±  3%     +15.5%    2840123 ±  2%  proc-vmstat.pgalloc_normal
    530507 ±  3%      +8.0%     573060        proc-vmstat.pgfault
   2336660 ±  3%     +16.3%    2717873 ±  2%  proc-vmstat.pgfree
      9973 ±  2%    +143.6%      24292 ±  3%  proc-vmstat.unevictable_pgs_culled
      9875          +146.0%      24292 ±  3%  proc-vmstat.unevictable_pgs_rescued
      9876          +146.1%      24304 ±  3%  proc-vmstat.unevictable_pgs_scanned
 1.413e+09           +12.4%  1.588e+09        perf-stat.i.branch-instructions
      2.09            -0.1        1.99 ±  2%  perf-stat.i.branch-miss-rate%
  23305261            +1.8%   23715959        perf-stat.i.branch-misses
      4.57 ±  4%      +1.5        6.06 ±  2%  perf-stat.i.cache-miss-rate%
   4971151 ±  5%     +71.3%    8515308 ±  2%  perf-stat.i.cache-misses
 1.771e+08            +6.4%  1.884e+08        perf-stat.i.cache-references
      0.91            -3.5%       0.88 ±  2%  perf-stat.i.cpi
 4.936e+09            +7.8%  5.319e+09        perf-stat.i.cpu-cycles
     39.95 ±  3%     -15.1%      33.90 ±  2%  perf-stat.i.cpu-migrations
      1671 ±  4%     -34.5%       1095 ±  6%  perf-stat.i.cycles-between-cache-misses
 2.815e+09           +11.8%  3.147e+09        perf-stat.i.dTLB-loads
      0.02 ±  2%      -0.0        0.02 ±  4%  perf-stat.i.dTLB-store-miss-rate%
 6.478e+08           +10.4%  7.153e+08        perf-stat.i.dTLB-stores
     40.15 ±  2%      -2.9       37.29        perf-stat.i.iTLB-load-miss-rate%
 1.063e+10           +12.2%  1.192e+10        perf-stat.i.instructions
     40912 ±  4%     +25.5%      51361 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      2.18            +2.7%       2.23        perf-stat.i.ipc
      0.41            +7.8%       0.44        perf-stat.i.metric.GHz
    421.03           +11.6%     469.88        perf-stat.i.metric.M/sec
      3358            +5.5%       3542        perf-stat.i.minor-faults
      0.00 ± 11%      -0.0        0.00 ±  6%  perf-stat.i.node-load-miss-rate%
      6.40 ±  8%     +17.6%       7.52 ±  5%  perf-stat.i.node-load-misses
    216221 ±  6%     +61.9%     350134        perf-stat.i.node-loads
      0.00 ± 16%      +0.1        0.12 ±220%  perf-stat.i.node-store-miss-rate%
      6.72 ±  6%  +6.9e+12%  4.615e+11 ±223%  perf-stat.i.node-store-misses
    694301 ±  9%     -14.3%     594881 ±  3%  perf-stat.i.node-stores
      3361            +5.5%       3545        perf-stat.i.page-faults
      0.47 ±  5%     +52.6%       0.71 ±  2%  perf-stat.overall.MPKI
      1.65            -0.2        1.49        perf-stat.overall.branch-miss-rate%
      2.81 ±  6%      +1.7        4.52 ±  2%  perf-stat.overall.cache-miss-rate%
      0.46            -4.0%       0.45        perf-stat.overall.cpi
    994.89 ±  5%     -37.2%     624.75 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.03            -0.0        0.02        perf-stat.overall.dTLB-load-miss-rate%
      0.01            -0.0        0.01        perf-stat.overall.dTLB-store-miss-rate%
     30.99 ±  3%      -2.3       28.68 ±  4%  perf-stat.overall.iTLB-load-miss-rate%
     25510 ± 11%     +20.2%      30672 ±  5%  perf-stat.overall.instructions-per-iTLB-miss
      2.15            +4.1%       2.24        perf-stat.overall.ipc
      0.00 ±  8%      -0.0        0.00 ±  5%  perf-stat.overall.node-load-miss-rate%
      0.00 ±  8%     +16.7       16.67 ±223%  perf-stat.overall.node-store-miss-rate%
 1.403e+09           +12.5%  1.578e+09        perf-stat.ps.branch-instructions
  23153579            +1.7%   23558574        perf-stat.ps.branch-misses
   4938806 ±  5%     +71.3%    8457880 ±  2%  perf-stat.ps.cache-misses
 1.758e+08            +6.4%  1.871e+08        perf-stat.ps.cache-references
 4.901e+09            +7.8%  5.282e+09        perf-stat.ps.cpu-cycles
     39.66 ±  3%     -15.1%      33.67 ±  2%  perf-stat.ps.cpu-migrations
 2.795e+09           +11.8%  3.125e+09        perf-stat.ps.dTLB-loads
 6.432e+08           +10.4%  7.103e+08        perf-stat.ps.dTLB-stores
 1.055e+10           +12.2%  1.184e+10        perf-stat.ps.instructions
      3336            +5.5%       3518        perf-stat.ps.minor-faults
      6.35 ±  8%     +17.6%       7.47 ±  5%  perf-stat.ps.node-load-misses
    214756 ±  6%     +61.9%     347761        perf-stat.ps.node-loads
      6.67 ±  6%  +6.9e+12%  4.577e+11 ±223%  perf-stat.ps.node-store-misses
    689455 ±  9%     -14.3%     590802 ±  3%  perf-stat.ps.node-stores
      3338            +5.5%       3521        perf-stat.ps.page-faults
 1.467e+12 ±  4%     +15.7%  1.698e+12 ±  2%  perf-stat.total.instructions



***************************************************************************************************
lkp-cfl-d2: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 32G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/need_x/option_a/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/true/2560 x 1440/debian-x86_64-phoronix/lkp-cfl-d2/openarena-1.5.5/phoronix-test-suite

commit: 
  16a9359401 ("drm/i915: Implement transcoder LRR for TGL+")
  54fef7ea35 ("drm/i915/gem: Allow users to disable waitboost")

16a9359401edcbc0 54fef7ea35dadd66193b98805b0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1459 ± 27%     +34.9%       1967 ± 13%  sched_debug.cpu.curr->pid.max
      1.63            -0.5        1.14 ±  2%  mpstat.cpu.all.iowait%
      1.17            -0.1        1.06        mpstat.cpu.all.irq%
    189.00 ± 11%     -53.6%      87.67 ± 17%  perf-c2c.DRAM.local
     20.67 ± 28%     -87.9%       2.50 ± 72%  perf-c2c.HITM.local
      6016            +5.7%       6358        vmstat.io.bi
     30168            -5.0%      28666        vmstat.system.cs
     27678            -2.7%      26933        vmstat.system.in
    337.58           +13.2%     382.30        phoronix-test-suite.openarena.2560x1440.frames_per_second
      2.95           -12.2%       2.59        phoronix-test-suite.openarena.2560x1440.milliseconds
    191369           +23.8%     236938        phoronix-test-suite.time.minor_page_faults
     51.00            +6.5%      54.33        phoronix-test-suite.time.percent_of_cpu_this_job_got
     56192           -63.1%      20758        phoronix-test-suite.time.voluntary_context_switches
     90640           -64.0%      32673 ±  7%  turbostat.C1
      0.68 ±  2%      -0.3        0.38 ±  5%  turbostat.C1%
     46385           -12.3%      40688 ±  2%  turbostat.C3
      1.72            -0.2        1.51 ±  2%  turbostat.C3%
      3.58 ±  6%     -17.6%       2.95 ± 11%  turbostat.CPU%c3
      5.71           -11.1%       5.08        turbostat.GFXWatt
     29983 ±  4%     -63.0%      11105 ± 24%  turbostat.POLL
      0.06 ±  8%      -0.0        0.01 ± 35%  turbostat.POLL%
      1.31 ± 15%     +70.2%       2.23 ±  7%  turbostat.Pkg%pc2
     29.56            -1.4%      29.14        turbostat.PkgWatt
      2123            -5.7%       2001        proc-vmstat.nr_active_anon
     37869            +2.8%      38912        proc-vmstat.nr_active_file
     22828            -5.8%      21501        proc-vmstat.nr_unevictable
      2123            -5.7%       2001        proc-vmstat.nr_zone_active_anon
     37869            +2.8%      38912        proc-vmstat.nr_zone_active_file
     22828            -5.8%      21501        proc-vmstat.nr_zone_unevictable
    624578            +4.2%     650937        proc-vmstat.numa_hit
    624578            +4.2%     650937        proc-vmstat.numa_local
    771624            +3.5%     798755        proc-vmstat.pgalloc_normal
    429393            +7.2%     460476        proc-vmstat.pgfault
    620059            +4.1%     645242        proc-vmstat.pgfree
      8.52 ±126%      -7.9        0.62 ±223%  perf-profile.calltrace.cycles-pp.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      6.09 ±114%      -5.4        0.67 ±223%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      3.76 ±110%      -3.8        0.00        perf-profile.calltrace.cycles-pp.error_entry
      8.52 ±126%      -7.9        0.62 ±223%  perf-profile.children.cycles-pp.wp_page_copy
      6.09 ±114%      -5.4        0.67 ±223%  perf-profile.children.cycles-pp.intel_idle
      5.79 ±100%      -4.6        1.24 ±223%  perf-profile.children.cycles-pp.do_filp_open
      5.79 ±100%      -4.6        1.24 ±223%  perf-profile.children.cycles-pp.path_openat
      3.76 ±110%      -3.8        0.00        perf-profile.children.cycles-pp.error_entry
      3.76 ±110%      -2.6        1.11 ±223%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      3.76 ±110%      -2.6        1.11 ±223%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.76 ±110%      -2.6        1.11 ±223%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      3.76 ±110%      -2.6        1.11 ±223%  perf-profile.children.cycles-pp.hrtimer_interrupt
      6.09 ±114%      -5.4        0.67 ±223%  perf-profile.self.cycles-pp.intel_idle
      3.76 ±110%      -3.8        0.00        perf-profile.self.cycles-pp.error_entry
      4.97 ±109%      -2.2        2.78 ±223%  perf-profile.self.cycles-pp.zap_pte_range
  8.07e+08            +2.7%   8.29e+08        perf-stat.i.branch-instructions
  31612011            +4.7%   33095236        perf-stat.i.cache-misses
     31337            -4.0%      30085        perf-stat.i.context-switches
      1.57            +7.7%       1.69 ±  2%  perf-stat.i.cpi
 4.798e+09            +3.2%   4.95e+09        perf-stat.i.cpu-cycles
      0.14 ±  3%      +0.0        0.16 ±  3%  perf-stat.i.dTLB-load-miss-rate%
 1.131e+09            +4.1%  1.177e+09        perf-stat.i.dTLB-loads
      0.03 ±  2%      +0.0        0.03 ±  2%  perf-stat.i.dTLB-store-miss-rate%
    134590            +6.1%     142835        perf-stat.i.dTLB-store-misses
 5.907e+08            +4.5%  6.175e+08        perf-stat.i.dTLB-stores
   3858714            +6.5%    4109072        perf-stat.i.iTLB-loads
 4.646e+09            +3.6%  4.812e+09        perf-stat.i.instructions
      0.40            +3.2%       0.41        perf-stat.i.metric.GHz
    824.17            +6.4%     876.81        perf-stat.i.metric.K/sec
    224.04            +3.7%     232.30        perf-stat.i.metric.M/sec
      5577           +13.3%       6319        perf-stat.i.minor-faults
   1661010            +8.8%    1806501        perf-stat.i.node-loads
   4199874            +5.4%    4426929        perf-stat.i.node-stores
      5582           +13.3%       6325        perf-stat.i.page-faults
    151.84            -1.5%     149.61        perf-stat.overall.cycles-between-cache-misses
 7.953e+08            +2.6%   8.16e+08        perf-stat.ps.branch-instructions
  31131128            +4.6%   32563072        perf-stat.ps.cache-misses
     30863            -4.1%      29604        perf-stat.ps.context-switches
 4.727e+09            +3.1%  4.871e+09        perf-stat.ps.cpu-cycles
 1.114e+09            +4.0%  1.158e+09        perf-stat.ps.dTLB-loads
    132539            +6.0%     140536        perf-stat.ps.dTLB-store-misses
 5.818e+08            +4.4%  6.076e+08        perf-stat.ps.dTLB-stores
   3798756            +6.4%    4042216        perf-stat.ps.iTLB-loads
 4.577e+09            +3.5%  4.736e+09        perf-stat.ps.instructions
      5496           +13.2%       6220        perf-stat.ps.minor-faults
   1635550            +8.7%    1777301        perf-stat.ps.node-loads
   4135301            +5.3%    4355124        perf-stat.ps.node-stores
      5501           +13.2%       6226        perf-stat.ps.page-faults
 3.045e+11            -2.8%  2.961e+11        perf-stat.total.instructions





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

