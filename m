Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C991179C64B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 07:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB2010E2CA;
	Tue, 12 Sep 2023 05:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BDD10E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 05:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694496783; x=1726032783;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=QpyUo+kDbZfBZNnr4mnID+xic2kFfWUqZpQgmsaS18U=;
 b=VhunoMyfH7sVqXRvGidlxvHrhdXOtfe3z1C58WqTXu83Q9OekQsJ5xe2
 XKJ7otfXoQzHvyaMxy2iV7kA8cw4w4FFWbhG/yTwplSiRMZ+LX+Kf6+Rk
 Igp0Q/tC+xFtmFOt4JIdqwSakz2gpTPSsk/+9V8LkvG6O3N/Ctpy4Dt+l
 BCABjiZlZ0o+6aakoeTiKUi2MwHJ2I40lowMAyokTiH+k+hNVcC1hjw86
 /iFAjDbRSryOYJcGH9mRum3GVCBfw4HqnGqB9LGRCFWVZb9sn25/q5AL+
 WMkxPblxmT+82gijGXRnevgcTEfi0AO3UouqV/Fb1SzfiEiuhooEVT5VW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="380980821"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="380980821"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 22:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886818967"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="886818967"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 22:32:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 22:33:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 22:33:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 22:33:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 22:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHAABdGYPSOGS8MlCsDuTKS/mbb3i6jYjOWDlY8hyaG4MiXu2Q3+D4JoL6X+NWx/62E0Mm1BQ0fvTc8JSm79gW49DXtGcOdLJv4lOMt/mu/1K3V2iQykx7IIpnxO65qp/HMmYO8SSAngSEDc454pbBdQa16vRepxWDSxP82SvU7Ayqa6XxeNGArKWJvq66fKjZqfQQOWsfnzMnFaBbEB3KTdLLdyO7kP/udmKm5W9YJOXQocDbsCL9t2nnRDwZa60LHRbt84f0J8LaOKridDqIN1SRAjubDe6NQ2lAENG5Pn8Z/QHNpTbPhvF76UgtzYX4OFWQNzgjOcw7mSU3SBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHKV/eMbpvT3tR/we5a66JIyabrp12c7ANfwgPH/hVU=;
 b=bpcFZiok+slBT/5uvyLPKb1REQNmW98zjRYQ/pErmnNa4pgNobCRrDlf871Y2DmD01tNE0VntkNW91uTv7VoFL3xwRIRMlgRY8gVDCuuJ1b5PeFhhZbb1S73fCFlO6MQOL9cURQObELBTviw62CzlHetjIszWmnbPbZkIP/lmSpjitfIu2bMKr9HrPB6OcOJ9p7dCDqkOq0jff5eVxRkOkygiJZvWjUqSPDJp8rRrrZsAuEf5UZfwo4AcjVFt+67BMPyHPmPcefeRPqZx2ionurWPXfIVhkYVi75BPpn6ATmGhUXRKV4t5y1MyHlWG0iBv1MZU0+hh1bw3xsKizthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 05:32:58 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 05:32:58 +0000
Date: Tue, 12 Sep 2023 13:32:45 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
Message-ID: <202309121305.81d349e5-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230911090729.5287-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SG2PR03CA0086.apcprd03.prod.outlook.com
 (2603:1096:4:7c::14) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a6fa9e-694f-40a5-e1ee-08dbb351b863
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuDQoodr2BIdIDgiiCW/NMFWCBa0UZRIrJfi/PMotntFyvpLfu5Elel9Rmg1jEd2b3KSW7haMDJtFv/LTeH+y/70IElg8/6eKhc0hUpOqDLluNpa7kZALpntm9+1XlcEcBUxX8au9qTq9yrGGj73gjZGTT9/zSAml3/ZD+aJtc2/TKOGNkX4Ear5eW7eN6oemfGt3mXP3ZtGXvXpJQktSpt3ilSEpc2Pge7NDz7c7xhp6+t/TKafoY4cuLVk5rZaDCsJXbDDEfxc/dGI8G3U1qz8CkByunXANf2rSUHbOLUK7g3JvTSJg6sRWeWbn5o+Xg5w5l2LDg70L6Xr/UQT43dMGRgxKIxVN3t0G2KNLMSMoCEDdnvga7I6npVbK1zNXafAP0VdeHBuovu6uUmGi8xp1VLq2fkb1VC0tKTpVUCWSRxlj+zBdnWM7LHizeSyoh3KH0W3flGd/q2BDPiC6nHtMTKBh7s1k/wYMx+oYMjov+RXuHbV+bywxC2oiP5hSjFDvuz5LNgo8nNA5JZRwm5WLB0SzsjlJAZIAx9wqEUN0gkNyhh4VzK4re2PhHkhjERjKuey8hdNkqBJw0LhKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(186009)(1800799009)(451199024)(4326008)(8676002)(8936002)(36756003)(26005)(82960400001)(6506007)(6666004)(6486002)(86362001)(5660300002)(38100700002)(2906002)(83380400001)(41300700001)(7416002)(66476007)(2616005)(1076003)(6512007)(478600001)(6916009)(966005)(54906003)(66556008)(316002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aK0CGAN/au1u8gbE9PQj4SX/3QQbC/0KwDaWsUryuwN7BlQNtpoFwRowWa/G?=
 =?us-ascii?Q?2ZcRmo59fHDNbayeTqje761rf6dO/bUnxifcXUGG9DAN/G2nASNtSdzdSbh4?=
 =?us-ascii?Q?oi8EbcE5U8tPXgQoFRJa/mjPYCEn0q7GBjYiLuYqK6W5IIvKz9yBwRmVGlkf?=
 =?us-ascii?Q?ABFyRqIZxZY3o1ASnxuQ7TNLPkLK2Yn3UADu7IT3xL3XhZ8TTsuUz3MFqSVD?=
 =?us-ascii?Q?EzCWpXMhVwOe0I4tAGrhDqKjx+lVLFJfTEj/xP5lP2mYbl5WSdxTKml06r8A?=
 =?us-ascii?Q?JfB7q+ah15zDJzquHeeMeffEsvnyJpeBqg/evz+/sbrmwEcVgZx7J10xgIEB?=
 =?us-ascii?Q?yP2EmaXnkA/Q/VH+xZKxlja+0HRbKGcKRvj4D815YHH8r3VodGJ0p717y8B8?=
 =?us-ascii?Q?tFNfbYCpacBPfyzdaIRJZRx+lesKjplusFfzjM2dBOkZhaTXKk+1Eq1z46Lo?=
 =?us-ascii?Q?+/lF9hsu++MaeOf1F8PZOsZJZhmOcvF7RVFcOUvf3rX0CjdMKm4E0wxBHGj0?=
 =?us-ascii?Q?tIi1T4VOnpuYZw3L1T1u9VOq+fq6UBfIHfeUtePTxOdGSmo6irx9Tn7NbIQe?=
 =?us-ascii?Q?cDvGf0aRaT5nldebPhMNA5rNpoTtb7n+axw3d1UXYpTS6L3Tq6c4+MbFqPn4?=
 =?us-ascii?Q?GS4vcd663uHj2MBNsfCkcFAvN1wIJiEzdnDHjGr1jkI2bS42gmTjKmPyTgCb?=
 =?us-ascii?Q?MEmtnhD2mrAj8rrCgacAvIDlsnTPdHSayIBlEp41vaACmUQCjtOl2zdnRt45?=
 =?us-ascii?Q?Gb6rFarBz13RxISZm3Vv2/+z1xRv01DDguuNtuRVGDVqgRJ/982LtBMkBwq7?=
 =?us-ascii?Q?AENnWGWrV0b0+pbFjVJdwLU//57kT0bhGlDHrk41MhHLC/qnMu8AgHUB4ztx?=
 =?us-ascii?Q?D+NGFiWswlyaUgoYepbikCcud4ZBtHAy9z8U+/7bbCwlHeQfoMxCec1xBoYw?=
 =?us-ascii?Q?GKnuLlHX7qEzRKziBNRuhb5vuYUJEMqsjnRDQrqCKzrB4ot5WvX0WSObFQQ4?=
 =?us-ascii?Q?j1dk1xdzVkjCyoMeovnydzhQ3K46uhTGwmtZVSpruQsdo7s2Ys5fAyo+NET4?=
 =?us-ascii?Q?X81CLCQNgY2GTkUhFD7XyvNw27YZNO/HTq4DFEX+ErfGYFaNsDbtBRBpR4TH?=
 =?us-ascii?Q?aLcksnvSTUSFFGgVQwd4HYhOeWPA/YGVnsXajIOHQsnia2vE0qtpG8iFRXj8?=
 =?us-ascii?Q?qyBObsiRY9/Nt8baAWiEZHmmb4p6Ijp1bc64GHoHo7mE5+qYKuQ0K0B9RWJ0?=
 =?us-ascii?Q?YZ9OvqF81j2BEj5oxxwGMZIXsHCakR/ZddDJBbXf3ur3LLageeHAhNiLvNtp?=
 =?us-ascii?Q?XJwH772hBbnDC2eK79D57I15KKG9MZ7yG/AkUFKD/igNAK5igdOYcS4VROcF?=
 =?us-ascii?Q?43H0AEk3t/Zc3B18kAMvNu8QXy6/dKb+/7JDffs0HEhfLUk0R9uHyJslAZBH?=
 =?us-ascii?Q?0SdE4YGU+96saDm02JY17dX6u0Z3PmC52dQCwmfOY3twwCMPrO0Z1qJuCYtH?=
 =?us-ascii?Q?7ddlS8mPnD7Cuwexy1tfs9/SBmAuYBNPBSYAr6547KB+F1LdBY6wXv+a3vkh?=
 =?us-ascii?Q?ZaL6aQvYeensIc6hZm/MBepLqi5jbuCFljuNcjNjvIGouocKgojjAU/Z46EC?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a6fa9e-694f-40a5-e1ee-08dbb351b863
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 05:32:57.9845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJph81relffdsYZXsejrVQnJXew1Iglsklo/DDwdE6jRexSYA3UdvhwgNrxTEP8/SdU9oDBVSEreRyfeMcpTjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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
Cc: lkp@intel.com, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 oliver.sang@intel.com, Daniel Vetter <daniel.vetter@intel.com>,
 oe-lkp@lists.linux.dev, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:

commit: bb043828b2d487832c946751ffcc4ebd80d2a624 ("[RFC PATCH] locking/ww_mutex: Adjust to lockdep nest_lock requirements")
url: https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/locking-ww_mutex-Adjust-to-lockdep-nest_lock-requirements/20230911-170838
base: git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link: https://lore.kernel.org/all/20230911090729.5287-1-thomas.hellstrom@linux.intel.com/
patch subject: [RFC PATCH] locking/ww_mutex: Adjust to lockdep nest_lock requirements

in testcase: boot

compiler: clang-16
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309121305.81d349e5-oliver.sang@intel.com


[  252.054712][    T1] WARNING: possible recursive locking detected
[  252.055056][    T1] 6.5.0-rc2-00590-gbb043828b2d4 #5 Not tainted
[  252.055056][    T1] --------------------------------------------
[  252.055056][    T1] swapper/1 is trying to acquire lock:
[ 252.055056][ T1] ffffc9000001f990 (ww_class_mutex){+.+.}-{0:0}, at: test_ww_mutex_init (kbuild/src/rand/kernel/locking/test-ww_mutex.c:77 kbuild/src/rand/kernel/locking/test-ww_mutex.c:632) 
[  252.055056][    T1]
[  252.055056][    T1] but task is already holding lock:
[ 252.055056][ T1] ffffc9000001f800 (ww_class_mutex){+.+.}-{0:0}, at: do_one_initcall (kbuild/src/rand/init/main.c:1232) 
[  252.055056][    T1]
[  252.055056][    T1] other info that might help us debug this:
[  252.055056][    T1]  Possible unsafe locking scenario:
[  252.055056][    T1]
[  252.055056][    T1]        CPU0
[  252.055056][    T1]        ----
[  252.055056][    T1]   lock(ww_class_mutex);
[  252.055056][    T1]
[  252.055056][    T1]  *** DEADLOCK ***
[  252.055056][    T1]
[  252.055056][    T1]  May be due to missing lock nesting notation
[  252.055056][    T1]
[  252.055056][    T1] 2 locks held by swapper/1:
[ 252.055056][ T1] #0: ffffc9000001f7d8 (ww_class_acquire){+.+.}-{0:0}, at: do_one_initcall (kbuild/src/rand/init/main.c:1232) 
[ 252.055056][ T1] #1: ffffc9000001f800 (ww_class_mutex){+.+.}-{0:0}, at: do_one_initcall (kbuild/src/rand/init/main.c:1232) 
[  252.055056][    T1]
[  252.055056][    T1] stack backtrace:
[  252.055056][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 6.5.0-rc2-00590-gbb043828b2d4 #5 9492b9dd86bdf82b2f3deb22196638d07aad10f2
[  252.055056][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  252.055056][    T1] Call Trace:
[  252.055056][    T1]  <TASK>
[ 252.055056][ T1] dump_stack_lvl (kbuild/src/rand/lib/dump_stack.c:?) 
[ 252.055056][ T1] __lock_acquire (kbuild/src/rand/kernel/locking/lockdep.c:?) 
[ 252.055056][ T1] ? finish_lock_switch (kbuild/src/rand/arch/x86/include/asm/irqflags.h:42 kbuild/src/rand/arch/x86/include/asm/irqflags.h:77 kbuild/src/rand/kernel/sched/sched.h:1378 kbuild/src/rand/kernel/sched/core.c:5133) 
[ 252.055056][ T1] ? __schedule (kbuild/src/rand/kernel/sched/core.c:6718) 
[ 252.055056][ T1] lock_acquire (kbuild/src/rand/kernel/locking/lockdep.c:5761) 
[ 252.055056][ T1] ? test_ww_mutex_init (kbuild/src/rand/kernel/locking/test-ww_mutex.c:77 kbuild/src/rand/kernel/locking/test-ww_mutex.c:632) 
[ 252.055056][ T1] __mutex_lock_common (kbuild/src/rand/kernel/locking/mutex.c:603) 
[ 252.055056][ T1] ? test_ww_mutex_init (kbuild/src/rand/kernel/locking/test-ww_mutex.c:77 kbuild/src/rand/kernel/locking/test-ww_mutex.c:632) 
[ 252.055056][ T1] ? mark_lock (kbuild/src/rand/arch/x86/include/asm/bitops.h:228 kbuild/src/rand/arch/x86/include/asm/bitops.h:240 kbuild/src/rand/include/asm-generic/bitops/instrumented-non-atomic.h:142 kbuild/src/rand/kernel/locking/lockdep.c:228 kbuild/src/rand/kernel/locking/lockdep.c:4663) 
[ 252.055056][ T1] ? test_ww_mutex_init (kbuild/src/rand/kernel/locking/test-ww_mutex.c:77 kbuild/src/rand/kernel/locking/test-ww_mutex.c:632) 
[ 252.055056][ T1] ww_mutex_lock (kbuild/src/rand/kernel/locking/mutex.c:754 kbuild/src/rand/kernel/locking/mutex.c:871) 
[ 252.055056][ T1] test_ww_mutex_init (kbuild/src/rand/kernel/locking/test-ww_mutex.c:77 kbuild/src/rand/kernel/locking/test-ww_mutex.c:632) 
[ 252.055056][ T1] ? __asan_memcpy (kbuild/src/rand/mm/kasan/shadow.c:105) 
[ 252.055056][ T1] ? do_one_initcall (kbuild/src/rand/init/main.c:1232) 
[ 252.055056][ T1] ? __pfx_test_mutex_work (kbuild/src/rand/kernel/locking/test-ww_mutex.c:41) 
[ 252.055056][ T1] ? __pfx_test_ww_mutex_init (kbuild/src/rand/kernel/locking/test-ww_mutex.c:622) 
[ 252.055056][ T1] do_one_initcall (kbuild/src/rand/init/main.c:1232) 
[ 252.055056][ T1] ? __pfx_test_ww_mutex_init (kbuild/src/rand/kernel/locking/test-ww_mutex.c:622) 
[ 252.055056][ T1] do_initcall_level (kbuild/src/rand/init/main.c:1293) 
[ 252.055056][ T1] do_initcalls (kbuild/src/rand/init/main.c:1307) 
[ 252.055056][ T1] kernel_init_freeable (kbuild/src/rand/init/main.c:1550) 
[ 252.055056][ T1] ? __pfx_kernel_init (kbuild/src/rand/init/main.c:1429) 
[ 252.055056][ T1] kernel_init (kbuild/src/rand/init/main.c:1439) 
[ 252.055056][ T1] ? __pfx_kernel_init (kbuild/src/rand/init/main.c:1429) 
[ 252.055056][ T1] ret_from_fork (kbuild/src/rand/arch/x86/kernel/process.c:151) 
[ 252.055056][ T1] ? __pfx_kernel_init (kbuild/src/rand/init/main.c:1429) 
[ 252.055056][ T1] ret_from_fork_asm (kbuild/src/rand/arch/x86/entry/entry_64.S:298) 
[  252.055056][    T1] RIP: 0000:0x0
[ 252.055056][ T1] Code: Unable to access opcode bytes at 0xffffffffffffffd6.

Code starting with the faulting instruction
===========================================
[  252.055056][    T1] RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
[  252.055056][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[  252.055056][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  252.055056][    T1] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  252.055056][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  252.055056][    T1] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  252.055056][    T1]  </TASK>
[  258.685819][    T1] All ww mutex selftests passed


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230912/202309121305.81d349e5-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

