Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C0E79EB94
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 16:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD8B10E077;
	Wed, 13 Sep 2023 14:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594FE10E077
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694616637; x=1726152637;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=sq6M/flokF9WuaA5JmAJu63oOnCkbSZlzGboJRMrK58=;
 b=dMTNYwArfZ0jxFhiyRGkjvj4zzor2u5r3z72iEk5wHRQfj7MjKFmIGTE
 lpm76FopYbRw7cwqrb7sGT0g1mvzLpumdMhaqnAG9JYo1mkQ7hZNTg0OG
 zxdqBT7BuXcJtQcHG6Xy7+dmrKI0q6yy2VW4GGf+PjiqnvZTLo9M74UyL
 UlnqJgL3z4/HBt30A5cActGeQgZ/tO6YsHglxdoQ/mNkpOy4Q+uraq4MC
 GafQWXJkqIiPeUA8InGKrOp8OsrsOLmdOChE3WVo6rrI4F65z8y+4O93B
 EY4hScduJQ7ccvhn5gu+lqRY83RbDkmP+UcM8y2q3xnOS+6CSJWPCXpC6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445120903"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="445120903"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 07:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814244496"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="814244496"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 07:50:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 07:50:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 07:50:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 07:50:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 07:50:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC2TzblyRle2RKSWAFPiTlpn9/Wi6OHp7t+NkDURXLKetuTCAkXpnISpTE6xCbTY6hXjl7TZLY6aHDW2JVgwRj3OmkKqwpjBAFgsWr8VyaoKWU4QH97Idogc0kohaJVKhOUig2K7+0bVA1OUilINBDb6d0t/HuP/zDfDYDE2GW5062zPo49cYzUSWIKTiE4cD0s1dW7OWX/eELC7oc0E7lShhGxXCjsnmvJbPAPnmqJgxAtwR4JkAzNucxrgJT6wVThdbZJqsl6RmIoXBIEgXdfkPDjX4qBXYXQvWLk0/pXCkgQ/RoKPW9ycWn4lzwj2hwq0wRtNN3XYb81XaKkBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VC6ybvG0aGKPs11rgA8bPAUCSGEAHWJkFzGgIko/mo=;
 b=ejkQTPl6f5zfwZdldAR4Z4MhmanUQJWyYBn9YdPkjxtMF7vooQQiLvAnJdsfDVuDeo+z6RkFtpFjQqWPP60lynn68edwcibAEt3Kk5Jp11s4Ymgth2wYtp5/qyKx4R35oTxcWhwOOKy/TdThfJ1WiJlTnYrYAowmkTllN9IoaUIFhxSE/LLq6Xjrv+CuDcxIS9udeueoJ/szV4XWrW2yYudRYzcNZRewfxcZRk1U3k0fkyupumWkX94YiCjAsQaVNzoTuol0XUuu8QuyTWwBOKoCjmm1W9zOYIHkM2ASjsRUV08TYHbfLXiCBCMwSKOv7onY1YOtFUex4lbpV7HHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 14:50:25 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 14:50:25 +0000
Date: Wed, 13 Sep 2023 22:50:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Arvind Yadav <Arvind.Yadav@amd.com>
Subject: [linus:master] [dma]  d62c43a953:
 WARNING:at_mm/slab_common.c:#kmem_cache_destroy
Message-ID: <202309132239.70437559-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e713cb5-44eb-40cd-f54c-08dbb468c372
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGTVPP3N8g8htj/sKWrCweYfPnap1JOXT5DAIiX+kArE0rrQAeDcznc+QCKQxL65eh0zDvdqR0j0JfhAOqH7W6kO9ttPxPjO8bUTsX1dPucPxF5tkVdJkmCBVgin1QVVwUhdwDhwnpVpLf1OqWD9p/hyA3oUxLGY/imY8poNK8QWeyWmM+acs7FUG9YLSIzHzFayOVjaSW/FMR7g8IKUxgUKwxK2cpo2ZcmBOFZfW8pGuHH0V+QuXOnWQ5o2I5JXtFgR9O3XjGmgfm6yCa/MHq1dQHjUx82IZJ58jxO2lqpkjh5gDoG9HsNlkvcb3qy4A4sZ8B99ykE0ax3Qu6mQY9b4gIBp9HD7o4TeKd0i3fmYQkcmjxkcGaajzIfW4CJ/3C0SC80AzGzOoPF62HHtA3mC/df8fRm++pB2hU2zyrVrqAAaPwhScicxEl57pWUyIvDn9te0rpRdIFTKWoXHfKzxaRfBU+gOy+l0jPuSpeN6XxrmbQ/Ny2BZ8DQlLOMpe14ooVs7AKpzrawoUtgXM0KBL31tUY1Ngze+CJrmVnFKLHwaUXNPe7o3XqeVsD1cYtm5UYm9h9I2rMF2Vh9HVBQ+Q8P15Drww6T+Yo94Je/KtHQbfEKxbQvPsetDFvy6Uu8O3JhV2uMOvCQZJduvTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(1800799009)(451199024)(186009)(6486002)(6666004)(6506007)(2906002)(36756003)(86362001)(2616005)(82960400001)(107886003)(38100700002)(8936002)(1076003)(45080400002)(26005)(478600001)(6512007)(83380400001)(966005)(41300700001)(8676002)(5660300002)(4326008)(6916009)(66476007)(316002)(66556008)(66946007)(568244002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tDqmCHeMG30l76Uf345cC1AdSQjUGi6fCcQilAoCw/62X4uNwO1Zxnec8uuF?=
 =?us-ascii?Q?0C4mR3+d+1coKPPFWHcNxOOnWJ4NIBz7IsYoOy5HQho0PIum3srzi6atN9GP?=
 =?us-ascii?Q?ac3k9Sw2SOkk0usr+cGWs/gF4inHELMRCoB37DMjmNLENgmryO4qBLGOV+bF?=
 =?us-ascii?Q?vYYHBkzdWMSmOoAT0WyLyx1ZeswQ+eu1Fr59CXzC02dB6cy/m8BEC60TMHcX?=
 =?us-ascii?Q?NDSXmKkqT+7LyBviBF5W+n3OvWOMml8C9AHl2gkAWGS00HYosCXUH8Op8fEc?=
 =?us-ascii?Q?6xR8tMZXcJhRrsaSVpNvRbvpJWxFLLB6bLRI1EY0fuvZ+eGsyReFYEezKydJ?=
 =?us-ascii?Q?90PRWuWznzfcAbnkPenpbwtlptOodGgNJoYMM2oqs9Urv0cph/+iMjDnEVSU?=
 =?us-ascii?Q?738859I2On9fA3UsaG3PvN4IMugyFab+1NtBm6Y4KPyN3IS4fKL0GjxKe9kH?=
 =?us-ascii?Q?ZQ5s3NCnQJXg48hkviItKmZ6JClmnua3h5AQvOcJ3nCrNgr1TufLvuDvVOHG?=
 =?us-ascii?Q?4Y6m68opjbTtsJIPK4HPC8iqi6uTTAOjv7oJ4ZNTVevaRXqu8VYHD8iCLXmt?=
 =?us-ascii?Q?9s0JBwn8OjyNN9Vv3eF9wHwpfHeroE726M4X7kro+kcktRMURZePGIKeGMlv?=
 =?us-ascii?Q?FN50CoEJtJS9PZi83Ty7rtbdwp9HbG2OwBOPOK1QKvD89L36DOEGygqykL8t?=
 =?us-ascii?Q?oLxPWO9Ok57Xhp7jm2ruaKDwquMBEH/pWfgL3Y+9rEa/C17XwsSc9VxUK72H?=
 =?us-ascii?Q?jjEboLf39qmh+YwHcj4ZzSHznxmhw1G20lAiRnNUmwmLHYfZW61NRj9CU9AB?=
 =?us-ascii?Q?2laFQHEaw0IS/I4AHm/QOXl+YmBPFItyGWrsTUdHwSIAC1iZ2QRWPDzStHcB?=
 =?us-ascii?Q?xDmC/rUUGBJsPbxLcOVB6qYmi/xcIfyqtSaL6P93FHAI14wIuMSK8lPezAOt?=
 =?us-ascii?Q?dEoviGMpe+ytgV6Dm/EuWYKq1bLQWqMq7MYIH2/GevNuJgg9a8VFRPsFAsbh?=
 =?us-ascii?Q?TwIkyN0vc3Rid3U7/y2j3MOSghhYxdqRzUdfNvqTLK5COTVQMKWMkbQ4tPe9?=
 =?us-ascii?Q?58f14lKF1cu2Y04jA8PFLOlpTlL94vjr6/MhdXi5+d+uBNZElnNglFZI5ou2?=
 =?us-ascii?Q?m7lbvSPMNjlkVxPvibF8dVahxK2FMCvVjbovjCChuYKlTMF3BxQhXAPFbSWV?=
 =?us-ascii?Q?TNz66iu7rontCmC4ucuyoArAwmf2dDj6bnNk6zbHNwdIkuwd8pCj6LUR9JK4?=
 =?us-ascii?Q?PrRsRh+OWj/C5MvwvhtmDPJVp0bkH2/Wa+/xtwGoZCe1UatNnFIBchafqctd?=
 =?us-ascii?Q?z9a8y39ow0s9pPRlbQjvLd4FRC3jYEvX2tCI4wPakCa6bdBkUKGALuHX4dTV?=
 =?us-ascii?Q?shBliIV0w7bCDu6sK9zebuOkCUwk6gOJQaU51Ou5by71cnwVJvwjZvICALCZ?=
 =?us-ascii?Q?GmpUc6eJAIxI+51A/zLhrD1vBnd0EwbN0qd/zprBH4TvGRNReNVSIUcitsFN?=
 =?us-ascii?Q?SWC3G7P4QlsDstnZgw8eLDNhjdKOetDa2/48xEvNLWv5tkkHymlEIWufSl1A?=
 =?us-ascii?Q?uNN3feDb0ZBnyMHj5vy+HDqaceaOiiX6eBaLXHDAOBIHihNWrypYhh+lRbSz?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e713cb5-44eb-40cd-f54c-08dbb468c372
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:50:25.3535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPjaRNihFoq7iGYu639n80dQfIC+/HIgMBC3d86lQWY62Cl8T6QWAJd07Xelzv0w2eCUfQaWCOuuJRgZXQ/huA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 oliver.sang@intel.com, oe-lkp@lists.linux.dev,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


hi, Arvind Yadav,

we know this commit is quite old, but it shows persistent low rate issue and
parent keeps clean even when we run both this commit and parent up to ~300
times.

the config to build both kernel is a randconfig as in
https://download.01.org/0day-ci/archive/20230913/202309132239.70437559-oliver.sang@intel.com

c85d00d4fd8b98ea d62c43a953ce02d54521ec06217
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :300          6%          17:312   dmesg.BUG_mock_fence(Tainted:G_T):Objects_remaining_in_mock_fence_on__kmem_cache_shutdown()
           :300         11%          33:312   dmesg.EIP:kmem_cache_destroy
           :300         11%          33:312   dmesg.WARNING:at_mm/slab_common.c:#kmem_cache_destroy

at the same time, as in below formal report mentioned, we still observed
similar issue on latest linus/master and linux-next/master, so we just send
out this report FYI.


Hello,

kernel test robot noticed "WARNING:at_mm/slab_common.c:#kmem_cache_destroy" on:

commit: d62c43a953ce02d54521ec06217d0c2ed6d489af ("dma-buf: Enable signaling on fence for selftests")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]
[test failed on linux-next/master 3c13c772fc233a10342c8e1605ff0855dfdf0c89]

in testcase: boot

compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309132239.70437559-oliver.sang@intel.com


[   21.601153][    T1] ------------[ cut here ]------------
[ 21.693224][ T1] kmem_cache_destroy mock_fence: Slab cache still has objects when called from dma_fence_chain (drivers/dma-buf/st-dma-fence-chain.c:709) 
[ 21.693275][ T1] WARNING: CPU: 0 PID: 1 at mm/slab_common.c:478 kmem_cache_destroy (mm/slab_common.c:478) 
[   21.697039][    T1] Modules linked in:
[   21.697859][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                T  6.0.0-rc2-00744-gd62c43a953ce #1 26be6099e9dfaf1dc1fa091a1f5a61f95afa9121
[   21.700290][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 21.702175][ T1] EIP: kmem_cache_destroy (mm/slab_common.c:478) 
[ 21.707576][ T1] Code: 00 ff 4b 2c 0f 85 b2 00 00 00 89 d8 e8 ea 4a 02 00 85 c0 74 1f ff 75 04 ff 73 40 68 6c ff 96 d7 68 7d 44 09 d8 e8 40 c8 da 00 <0f> 0b 83 c4 10 e9 88 00 00 00 8d 73 44 89 f0 e8 8a 8e 2e 00 84 c0
All code
========
   0:	00 ff                	add    %bh,%bh
   2:	4b 2c 0f             	rex.WXB sub $0xf,%al
   5:	85 b2 00 00 00 89    	test   %esi,-0x77000000(%rdx)
   b:	d8 e8                	fsubr  %st(0),%st
   d:	ea                   	(bad)
   e:	4a 02 00             	rex.WX add (%rax),%al
  11:	85 c0                	test   %eax,%eax
  13:	74 1f                	je     0x34
  15:	ff 75 04             	push   0x4(%rbp)
  18:	ff 73 40             	push   0x40(%rbx)
  1b:	68 6c ff 96 d7       	push   $0xffffffffd796ff6c
  20:	68 7d 44 09 d8       	push   $0xffffffffd809447d
  25:	e8 40 c8 da 00       	call   0xdac86a
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	83 c4 10             	add    $0x10,%esp
  2f:	e9 88 00 00 00       	jmp    0xbc
  34:	8d 73 44             	lea    0x44(%rbx),%esi
  37:	89 f0                	mov    %esi,%eax
  39:	e8 8a 8e 2e 00       	call   0x2e8ec8
  3e:	84 c0                	test   %al,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	83 c4 10             	add    $0x10,%esp
   5:	e9 88 00 00 00       	jmp    0x92
   a:	8d 73 44             	lea    0x44(%rbx),%esi
   d:	89 f0                	mov    %esi,%eax
   f:	e8 8a 8e 2e 00       	call   0x2e8e9e
  14:	84 c0                	test   %al,%al
[   21.711048][    T1] EAX: 00000066 EBX: ee62b680 ECX: 00000001 EDX: 80000001
[   21.712412][    T1] ESI: d87beb98 EDI: ffffffff EBP: c128dee8 ESP: c128decc
[   21.713723][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010292
[   21.715192][    T1] CR0: 80050033 CR2: b7d07070 CR3: 189fe000 CR4: 00040690
[   21.716533][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   21.717859][    T1] DR6: fffe0ff0 DR7: 00000400
[   21.718792][    T1] Call Trace:
[ 21.719488][ T1] ? dma_fence_chain (drivers/dma-buf/st-dma-fence-chain.c:709) 
[ 21.720419][ T1] dma_fence_chain (drivers/dma-buf/st-dma-fence-chain.c:709) 
[ 21.721327][ T1] st_init (drivers/dma-buf/selftest.c:141 drivers/dma-buf/selftest.c:155) 
[ 21.722117][ T1] ? udmabuf_dev_init (drivers/dma-buf/selftest.c:154) 
[ 21.723147][ T1] do_one_initcall (init/main.c:1296) 
[ 21.724108][ T1] do_initcalls (init/main.c:1368 init/main.c:1385) 
[ 21.725029][ T1] kernel_init_freeable (init/main.c:1615) 
[ 21.726030][ T1] ? rest_init (init/main.c:1492) 
[ 21.726907][ T1] kernel_init (init/main.c:1502) 
[ 21.727732][ T1] ret_from_fork (arch/x86/entry/entry_32.S:770) 
[   21.728608][    T1] irq event stamp: 1964001
[ 21.729500][ T1] hardirqs last enabled at (1964011): __up_console_sem (arch/x86/include/asm/irqflags.h:29 (discriminator 1) arch/x86/include/asm/irqflags.h:70 (discriminator 1) arch/x86/include/asm/irqflags.h:130 (discriminator 1) kernel/printk/printk.c:264 (discriminator 1)) 
[ 21.731230][ T1] hardirqs last disabled at (1964020): __up_console_sem (kernel/printk/printk.c:262 (discriminator 1)) 
[ 21.735324][ T1] softirqs last enabled at (1963746): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:415 kernel/softirq.c:600) 
[ 21.736992][ T1] softirqs last disabled at (1963735): do_softirq_own_stack (arch/x86/kernel/irq_32.c:60 arch/x86/kernel/irq_32.c:150) 
[   21.738743][    T1] ---[ end trace 0000000000000000 ]---
[   21.739776][    T1] dma-buf: Running dma_fence_unwrap



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230913/202309132239.70437559-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

