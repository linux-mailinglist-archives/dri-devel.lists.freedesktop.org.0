Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06181C73B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 10:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2B610E78B;
	Fri, 22 Dec 2023 09:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AAB10E781;
 Fri, 22 Dec 2023 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703236755; x=1734772755;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=OhSMewe1WYEcQerjm8uONPnME1wpuu7rc7d+g1QNhLs=;
 b=VSzjxCmzCnRyGPn9izpa72XH/9O92WVPPAXvW09OnCp89zCOaEphfYBL
 d6Wun/n5WZt/FWRyP8Yd/N6NDF9/ORf/40k6dl3OhWoZvV2osdivcXnJv
 I81iOeD3LwNMzeLVhVrQ2FXelB3iuPHjnij4v8dTkrWimtWleWDYEVWvw
 0jfaDwu5luM12o6hQjnq/guXaaDJtGc4KiFE1EVl21AfekyBtm94cjIWa
 nnIToJmLOhuA1haXQrZJmtqZ/prJ4Hamx/wAjjKRmysVXpSWXLnxxMUqo
 tqMa9g1BLs1GdAptACtWn21Uu+XrAzxRksIf/q7uqHPx0tzdnqTw9If1c g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="381077528"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="381077528"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 01:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="726729831"
X-IronPort-AV: E=Sophos;i="6.04,296,1695711600"; d="scan'208";a="726729831"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 01:19:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 01:19:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 01:19:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 01:19:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi23dxzzpKCwx/YI8VVn+ijpuFhRgIdOWpWv1MkWHpjtjie+F0lmT1R7u+loiPonOrJP+mzEz3Gz1F0XWfJ8Vouv1NysII5pbYz5OkYfg+8z72JlO2oGw6hr3k7O19/0HZHdDSQMIGWqFBD2ggbwYtKJTVEK+8ZYdvDJ83qff/o6MaCx/OWP/aWup3/UstmSJUn+r4fkclvMeJ3nqaT7Ulhf9S+EMtwIBoVq/bubBeqcI9aWnFy75/TRTawMLm4oUT19EHslHbjrK3Fh6wLhAlBp53Mxqck3DddTlShARZ3Cyk4U1+0G1cIRwndIzfTidlSh3IBnp/8xNSv5MBKPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgFQ77BYWusH/K75gjnjL6YVk/Vv7e4LRfpewysVOHU=;
 b=m9EU9Wox+nQgpkXzjrAX16ajNgzceGA8tSfaEFMOP/rJx7YH4AzvO9Fs3YlGmF1NZEa2WUYxvbqX3JmBPs5KhuKrf6svN03+iLDmnJ4gC8CW4Uo+O3TWHL2mTN9ipEyKoxGBX2X5H1NIr66jHSUDChAYwivpIMrPYD5A18b7LPUnxKNqmv5D4pvUo0bM3PFJ79AjIE/iaIh1nXK0kbL1bjqmKCynB7hVgi8K+xYE4yIGqCn7JzGDcJ0gHyromhF7rcVdTUfbKit+2yARTVJOeXjZQEDZmGCx+ynLsNzCqM5JBIyHyISftqJ/jKPQxamzmAop4XZd3xm5sYDYybqaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 09:19:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 09:19:05 +0000
Date: Fri, 22 Dec 2023 17:18:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] locking/ww_mutex: Adjust to lockdep nest_lock requirements
Message-ID: <202312221708.b143534-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231219160524.3646-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: b057fe96-4c0c-4df4-5ae5-08dc02cf0b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rn9KlndM4SP5c8Y+E2RCDG++RZG5cg9yqjLUN+bKqlT7w3zMACo+SzX1bKQsoRMZSOm2AYtVw00fzHqd2hfuykmWi2MrRHp3EWMeDqdfMLkXzWwUFIv3PwuI6tvtL4xGnwTQqHUI8ynE84uVJh/w117XvYGHiMTSWP9z/JHyVLaSYslcRoPgGUPu2uGuvLs+/2cBgZvrkFc5jV86fir2JXJecqLFsuz+aMOQXxTl9JB8r0g/1aTGSe5Qnv0M+BWJoqes5xuQuBIljV+XNRYEhcCWAebe561Q8SKwqgDYlufrkPrqkwoC8jA4zrh+Wv3krRYiU4Qq7ZRcmxltU+JaAAuD947T07erzDwtvU4zJwP/cVoIWYGjqrv8NkzJdX6cywzw1uWC//Fmd+XNOv3Mk0/17CBnTx75edBwUJaBts8KgZaEQhWxzZBCR+6RmixFCiPPDNpALNtT/xvItslVFk4EBIqVT8DMwN8pJyyz1drXBkBt+EsKH7zDUSb761kJBTbpNBPx8HpkuucUJGX1RtY+trB8woF1/+5L/j5I8l67CcD37Us5YrAsnyNal1WMKYgx5fORaw4jgkfl5d4by4G5sJKSaLbO4oWh2S/SS+4tHugWpTQtw2hsiEmMOTyaqYqcvozLgps0WNiJ5yhbMtr/vRpPf8ooupg9WowOAO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(966005)(6486002)(38100700002)(4326008)(478600001)(82960400001)(5660300002)(54906003)(6916009)(316002)(66556008)(66476007)(66946007)(8676002)(8936002)(2616005)(26005)(1076003)(83380400001)(45080400002)(6666004)(6512007)(6506007)(41300700001)(86362001)(36756003)(2906002)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7w4jf2BEUQwh5H/bmj/MREScTttjdbV1QJ/I0VY2xthv7opUXd5e50gHNMv?=
 =?us-ascii?Q?FQM6n7KzliVl3MEQst4xi1IoOpqoN2aR41KEzma+gIhc1LnjcFXs1SOHN6iz?=
 =?us-ascii?Q?4Bhx4/I08YZoTojSKImE0SrrldDHM6BnEKi1h8CSGSIqQBFfbWLkvo6ZaPx8?=
 =?us-ascii?Q?qDVTYWWVTseJFBuJCTnBAWfAN2QoA+l/AqCvoktgkuiwCJnBPagtMeMcrmQf?=
 =?us-ascii?Q?bDimxK66IT1EYQbX8Jr10U5OBc8AAqGAEC1tWbG6JII0nyAcf9d3KFq7+upG?=
 =?us-ascii?Q?6Vaxt2eNIDjTVpWVDFaP7dZqnyUEu4Cnz7t5Yqltv/xwrFaTdzrYwc4S08WZ?=
 =?us-ascii?Q?rIWGFhDMru4Va8Am3PvttQilFrIgpwj4s/Vkm3vI6ZIauxPIRSAtQmvDnbVL?=
 =?us-ascii?Q?fo2CwrMG7QfjCQDTUF1G8RwcPIZkOH5J6498isyDkzTSSnop0rgk6W5RSK6I?=
 =?us-ascii?Q?1ULgKGw6Fwc8EucD9Rg7accYvoAqmAqsA/zKhiiBH/+sDHhfrpAF8r0XdS1l?=
 =?us-ascii?Q?4Hbm6zDE4XXGiW9GB4MhTuvSHFQ7M8jw/MxW0jr5LFSRFfhezS1x6lsGb9O+?=
 =?us-ascii?Q?fBJkZV5jI3ki9YnIg3F4Gb/SKDFpl/fvW7kaDGEoXC8HoAEjcj1R3B0C+fVr?=
 =?us-ascii?Q?2HHx/xBX56AybeiX0hFwdyFbtOgjnwSxQrcaOD6Zojr5nXXso42d40VKB7nS?=
 =?us-ascii?Q?q2fgqj9VfrMl5W9G0Lra7HqBN/3roV4RMtAr+mBNZz9LmbedIPQkjpsjZVrO?=
 =?us-ascii?Q?Dmy442npSMxe/wz55Vai0v08iy1jO+tauNRI4E7LPs7VZs+1dZzhJ4R9flya?=
 =?us-ascii?Q?//gX5E6vdEXMKvT1cYtYP7OfvS0j4zWg/qBKCeGBFhzds4U/5OFDHGJ/4E26?=
 =?us-ascii?Q?hRm6gZSKTz8AHq3Dnw1O6hLmGq/RwXOBjOZAPrQntlCAmsSy0gwVVZt0lwML?=
 =?us-ascii?Q?yIPbIjb8pOytp1gKqLu4WoNwsOwVPqhS7/oXtXjeSMvch0E5Ep/Nj25Nq2V3?=
 =?us-ascii?Q?wXShiGmiZBY4mcm5utR/kWJwtApDlOP5FWkpnHBtpUpUiYzOPWB8NsFFhUZe?=
 =?us-ascii?Q?UTwMM3qPK+w5PcShASrzHyUAMk24cQx3eXnKo0DWzyFlcaJAn0WlRgJj3avq?=
 =?us-ascii?Q?sh3BB5G7thLRd/Y9+pq6ctFRCbcbuMOcEd/kSqPjZVLZzHx6hey6w3N2KU4R?=
 =?us-ascii?Q?gLvLgllqgA7lDdcXSR9lY7eFHDrlyatBBIrTF06voWk+kqj0g1TUZhAcpnhC?=
 =?us-ascii?Q?nqn9CL6iRu2n0ym1h6tN1cd4rcvbA0PG7tq06RvRKWjRfcb075RTup+AAZaZ?=
 =?us-ascii?Q?c3VuBJi289Oxos6rVhR+XlWpi9WeeMfuY6MydupyMhNn5X2tsu7RSmIv1yrc?=
 =?us-ascii?Q?IdP7+/RG1wXiVeO5YPqX26HOMvhMORHcxqh2AepP52DE1vs55xq3mg3XSRDW?=
 =?us-ascii?Q?L1Fw6EGu/pUaua4quO/QbvZ9FYTbNislaf+gyZqlFvDL3JnU4O3r8epmAN/v?=
 =?us-ascii?Q?4hRaw50BjJmgfXXqLUFef6zUwMSnAjLWtGqUHt8gY2TI+Xj9M9lNrs14Deb0?=
 =?us-ascii?Q?7K4FbKC5nFO2luKCyNI+VHpEX1FuTNyFB9J03JC4bmCacBB7x5Isni80tnmb?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b057fe96-4c0c-4df4-5ae5-08dc02cf0b3c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 09:19:05.3172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb93ywReGzWN4A/diPohpQJX1MAxgdk4bBUAomgS5Z+4YK+zjYcNKBMRz/d1p4IAehCuT85bWey+10iiss61Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 lkp@intel.com, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Maarten Lankhorst <maarten@lankhorst.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 oliver.sang@intel.com, oe-lkp@lists.linux.dev,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "WARNING:at_kernel/locking/lockdep.c:#__lock_acquire" on:

commit: 4f37585fa02f3eaebc72efa1260e6742478c00fa ("[PATCH] locking/ww_mutex: Adjust to lockdep nest_lock requirements")
url: https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/locking-ww_mutex-Adjust-to-lockdep-nest_lock-requirements/20231220-000906
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git a51749ab34d9e5dec548fe38ede7e01e8bb26454
patch link: https://lore.kernel.org/all/20231219160524.3646-1-thomas.hellstrom@linux.intel.com/
patch subject: [PATCH] locking/ww_mutex: Adjust to lockdep nest_lock requirements

in testcase: boot

compiler: gcc-7
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------+------------+------------+
|                                                     | a51749ab34 | 4f37585fa0 |
+-----------------------------------------------------+------------+------------+
| WARNING:at_kernel/locking/lockdep.c:#__lock_acquire | 0          | 6          |
| EIP:__lock_acquire                                  | 0          | 6          |
+-----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202312221708.b143534-oliver.sang@intel.com


[    9.777113][   T10] ------------[ cut here ]------------
[    9.777784][   T10] DEBUG_LOCKS_WARN_ON(hlock->references < references)
[ 9.777795][ T10] WARNING: CPU: 0 PID: 10 at kernel/locking/lockdep.c:5055 __lock_acquire (kernel/locking/lockdep.c:5055 (discriminator 9)) 
[    9.778839][   T10] Modules linked in:
[    9.778839][   T10] CPU: 0 PID: 10 Comm: kworker/u2:0 Not tainted 6.7.0-rc1-00006-g4f37585fa02f #5
[    9.778839][   T10] Workqueue: test-ww_mutex stress_inorder_work
[ 9.778839][ T10] EIP: __lock_acquire (kernel/locking/lockdep.c:5055 (discriminator 9)) 
[ 9.778839][ T10] Code: e8 ae 10 2e 00 85 c0 0f 84 0e 0f 00 00 8b 1d 94 9c b5 ce 85 db 0f 85 00 0f 00 00 68 64 16 34 ce 68 fe 17 33 ce e8 09 22 fc ff <0f> 0b 58 5a e9 28 12 00 00 a1 90 ef 24 cf 85 c0 74 07 eb 2a 8d 74
All code
========
   0:	e8 ae 10 2e 00       	callq  0x2e10b3
   5:	85 c0                	test   %eax,%eax
   7:	0f 84 0e 0f 00 00    	je     0xf1b
   d:	8b 1d 94 9c b5 ce    	mov    -0x314a636c(%rip),%ebx        # 0xffffffffceb59ca7
  13:	85 db                	test   %ebx,%ebx
  15:	0f 85 00 0f 00 00    	jne    0xf1b
  1b:	68 64 16 34 ce       	pushq  $0xffffffffce341664
  20:	68 fe 17 33 ce       	pushq  $0xffffffffce3317fe
  25:	e8 09 22 fc ff       	callq  0xfffffffffffc2233
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	58                   	pop    %rax
  2d:	5a                   	pop    %rdx
  2e:	e9 28 12 00 00       	jmpq   0x125b
  33:	a1 90 ef 24 cf 85 c0 	movabs 0x774c085cf24ef90,%eax
  3a:	74 07 
  3c:	eb 2a                	jmp    0x68
  3e:	8d                   	.byte 0x8d
  3f:	74                   	.byte 0x74

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	58                   	pop    %rax
   3:	5a                   	pop    %rdx
   4:	e9 28 12 00 00       	jmpq   0x1231
   9:	a1 90 ef 24 cf 85 c0 	movabs 0x774c085cf24ef90,%eax
  10:	74 07 
  12:	eb 2a                	jmp    0x3e
  14:	8d                   	.byte 0x8d
  15:	74                   	.byte 0x74
[    9.778839][   T10] EAX: 00000033 EBX: 00000000 ECX: c0245cb4 EDX: ce9da1ac
[    9.778839][   T10] ESI: c26cb37c EDI: c02569ac EBP: c0245db0 ESP: c0245d60
[    9.778839][   T10] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010002
[    9.778839][   T10] CR0: 80050033 CR2: ffdda000 CR3: 0ec21000 CR4: 00040690
[    9.778839][   T10] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    9.778839][   T10] DR6: fffe0ff0 DR7: 00000400
[    9.778839][   T10] Call Trace:
[ 9.778839][ T10] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 9.778839][ T10] ? __warn (kernel/panic.c:677) 
[ 9.778839][ T10] ? __lock_acquire (kernel/locking/lockdep.c:5055 (discriminator 9)) 
[ 9.778839][ T10] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 9.778839][ T10] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 9.778839][ T10] ? handle_bug (arch/x86/kernel/traps.c:237) 
[ 9.778839][ T10] ? exc_invalid_op (arch/x86/kernel/traps.c:258 (discriminator 1)) 
[ 9.778839][ T10] ? handle_exception (arch/x86/entry/entry_32.S:1056) 
[ 9.778839][ T10] ? __lock_acquire (kernel/locking/lockdep.c:5047) 
[ 9.778839][ T10] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 9.778839][ T10] ? __lock_acquire (kernel/locking/lockdep.c:5055 (discriminator 9)) 
[ 9.778839][ T10] ? exc_overflow (arch/x86/kernel/traps.c:250) 
[ 9.778839][ T10] ? __lock_acquire (kernel/locking/lockdep.c:5055 (discriminator 9)) 
[ 9.778839][ T10] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 9.778839][ T10] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5755) 
[ 9.778839][ T10] ? stress_inorder_work (kernel/locking/test-ww_mutex.c:457) 
[ 9.778839][ T10] ? lock_is_held_type (kernel/locking/lockdep.c:5494 kernel/locking/lockdep.c:5824) 
[ 9.778839][ T10] __ww_mutex_lock+0xb1/0xd84 
[ 9.778839][ T10] ? stress_inorder_work (kernel/locking/test-ww_mutex.c:457) 
[ 9.778839][ T10] ww_mutex_lock (kernel/locking/mutex.c:878) 
[ 9.778839][ T10] stress_inorder_work (kernel/locking/test-ww_mutex.c:457) 
[ 9.778839][ T10] process_scheduled_works (kernel/workqueue.c:2630 include/linux/jump_label.h:207 include/trace/events/workqueue.h:108 kernel/workqueue.c:2635 kernel/workqueue.c:2703) 
[ 9.778839][ T10] worker_thread (include/linux/list.h:373 kernel/workqueue.c:841 kernel/workqueue.c:2785) 
[ 9.778839][ T10] kthread (kernel/kthread.c:390) 
[ 9.778839][ T10] ? rescuer_thread (kernel/workqueue.c:2730) 
[ 9.778839][ T10] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 9.778839][ T10] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 9.778839][ T10] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 9.778839][ T10] ret_from_fork_asm (arch/x86/entry/entry_32.S:741) 
[ 9.778839][ T10] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[    9.778839][   T10] irq event stamp: 14037
[ 9.778839][ T10] hardirqs last enabled at (14037): irqentry_exit (kernel/entry/common.c:435) 
[ 9.778839][ T10] hardirqs last disabled at (14036): common_interrupt (arch/x86/kernel/irq.c:247) 
[ 9.778839][ T10] softirqs last enabled at (8978): __do_softirq (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:400 kernel/softirq.c:582) 
[ 9.778839][ T10] softirqs last disabled at (8969): do_softirq_own_stack (arch/x86/kernel/irq_32.c:57 arch/x86/kernel/irq_32.c:147) 
[    9.778839][   T10] ---[ end trace 0000000000000000 ]---
[    9.917906][   T36] torture_spin_lock_write_delay: delay = 25 jiffies.
[   10.273181][   T36] torture_spin_lock_write_delay: delay = 25 jiffies.
[   10.621916][   T36] torture_spin_lock_write_delay: delay = 25 jiffies.
[   10.788923][   T36] torture_spin_lock_write_delay: delay = 25 jiffies.
[   10.919665][   T36] torture_spin_lock_write_delay: delay = 26 jiffies.
[   11.085916][   T36] torture_spin_lock_write_delay: delay = 25 jiffies.
[   11.471931][   T35] torture_spin_lock_write_delay: delay = 25 jiffies.
[   11.784602][    T1] All ww mutex selftests passed



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231222/202312221708.b143534-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

