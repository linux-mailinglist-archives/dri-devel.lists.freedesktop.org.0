Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0177AA9D9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 09:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CB110E61E;
	Fri, 22 Sep 2023 07:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F8F10E61E;
 Fri, 22 Sep 2023 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695366854; x=1726902854;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=EqETvI7e7qr1FcuN0yV2yOrt2KGzLRpMEshZmFWRC94=;
 b=X+imMF8T436jn6BekVfyS2YiJRBt2TAEeb7jeBdbrBZHfp+Ch7OMFsLb
 tuRVJfX/PhRvRsFlnvcbIZAqbN3jQBoVXaIobsGvaK8zJtfR1R8hg62wY
 d8LoRR8c5bLpkiwm1juWSRF3Nta0mAN5pmyQdK9nYMsw27G0/frQ9yp6/
 Zog0wAKKnKxLw95kAq527HDfZb+1nn/33wKonaQpJgphvJjiIK32IDSeC
 qUEw+lHFRslN4lvdqExYBX71fTys+1RqRse2dCIsdPGmSBP3wLOsN8xQa
 OOhizAh77Ml7d5asyWY5rxIdlgWSLQhsJtP7xsB0YOL6MFpSsn8MylM4D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="371083422"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="371083422"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 00:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="782536818"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="782536818"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 00:14:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 00:14:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 00:14:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 00:14:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 00:14:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+vUhKShSeHSVOSIdWJev3NjE663xir40UMqKdEuy6wHv3vbLt8heEkECp9W0GVEvhZKEmxFjdD3v3CB/Wpi6ly31pTO7LHCVlM7L0gzIRCD9EUr9Cwa8h9aiecvlOOhl+HBk3Gx+dBE9rlOOaEx+AWls/P9zZPUY970JM1oEh9avjrH0UIhRO5y6pSXNMOIjLsJ1RzhldZ9PpdkXEAtoa0Cz93J9qGbV0zwy6kVhU3EFBkvg2k28ANJkqdKShzJ7sA0KkLMqXjGDflIr7yRLM9CVnGLlS49ZjNlmzESkBHsVdiasMfX21G5/JA6mlotEHOPKY8adkE3JbkEJjDGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfcKG/CZUGNdcMtcnC5nA2+fernPceoMVzULgjAPvRc=;
 b=b0DM6RiqEF4YX2PKTjrsOTeGSIhd2ne4Ep9rBVC2cf/cvBIdmp/NMsDixa1Arwc56UVfaZs1gkxQUiZK9nr+HBUxZu/eDXDHEVRExUYM1Vs2JFnlYWa4Ll9yUkdro+V6xWJmEvdE0IYNN62wrEGWgUnGpRsbpTfO09MxNOTJMQgmvjb2oegc/FC8RwwYpczlluYdoHAjt4axZDK9KHTZQK4jYY1BTdSdhasMdUJqHsr7RuBFHZ1PDS7KSXj2N5yrRlI78nqRIxK+KSmfy5zWdkAA0RlNxDEK07/j3mNroq1PCiA5Rtrf5/tHUcG+IFzD/wHfkF8D8+UG/N0DHDsEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA0PR11MB7186.namprd11.prod.outlook.com (2603:10b6:208:442::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 07:14:11 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 07:14:11 +0000
Date: Fri, 22 Sep 2023 15:14:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 04/11] PM / QoS: Decouple request alloc from
 dev_pm_qos_mtx
Message-ID: <202309221426.fb0fe750-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230822180208.95556-5-robdclark@gmail.com>
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA0PR11MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: c99d9905-c2a6-4374-cf9f-08dbbb3b84d3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1BySSL8BkD18tOrmfqQHZmcVM95It7yUBWa4Jw95n3b1JhZ2EpshyW9EPHEnbxCTYEp+0j4rR3z/tHLB4Qioh2OJUKNu4AKUIwB9SjpmtGXUqexBpIEjDQjMdVdzuQ2NJNd0GZgi5cZWqGJK3LKYOjdSlWVLcsuq4QXFY/IF7oNhD+U2METlnFrvTv1RfFuiPm0PwA+1xtn273HG45XNhtPJWBLLieNfXefK8wL/Ydg1EsKajSDYr3/+PbstMnAPinpy8usmBQ8IotDo8b+6YVYuvKNKkQAZo8OI8Gb4tkgqamfHfrK251mKB5NXsQuW0MA0+wVRk1J7GwPfRQqaLDtUvMs3EqlKU2BwZwC1/72YSWBBC82PebFVFxAEraWIBMiu6TRy7VJ6ke9S/MhYmLD7nUznk2o/7LObVvkJoUr05S2b2/CzGz7G7K3wgXPCY2ATFh/DhV5FkT4oeyFLZMEmLsHKTKVRbC07CO5uLkW06iPocrNCBAkGpOzreR4V6wux9bPpk2LQIRAqjAmf2Fku+JGlodUw73123xqUU0nFKr8LjfVI4HMWknTuA9VYl5LDdUtzPmXWvFxgwNv+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199024)(1800799009)(186009)(6486002)(6506007)(6666004)(83380400001)(966005)(6512007)(478600001)(107886003)(26005)(1076003)(2616005)(8936002)(316002)(66946007)(66556008)(6916009)(66476007)(54906003)(4326008)(5660300002)(41300700001)(8676002)(2906002)(7416002)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/z7beF0KqiNYmCbQ91CQcFDd3CohX3s2U20vnTOdKOR/oIPWgM1jMeUp5qe?=
 =?us-ascii?Q?265BE2B60xat0XYLIgqbWDZFsBrOXTa1hacj7E54wcjotBgk5HiYUZfx7rIj?=
 =?us-ascii?Q?v5yNsKzKFgTIkCQjirzInKiiZ6HWNp8fF9NtXeWt4tz/7lYEzc/nc85ZJyQq?=
 =?us-ascii?Q?b07feNkjRqTyhGQ54ULREl48bgAzysJAycLwIdqvmMM6dbG3+4Ajidv1ZIyW?=
 =?us-ascii?Q?dSfWrV8zzQC0snu8/O06WNAo8JqBHNyZz//Dz6VK1YKLOv2GCYrwoM4wqwuR?=
 =?us-ascii?Q?yxGYLh4NfV1atwEou0P/ClFN2D2WpB29o20YNEHxsf0mIrc6lLWMonqB8JlW?=
 =?us-ascii?Q?wyQkxyRr1JS+P9F4c07/kePVJAwXt//BvRSuojMK/7mFAscpTw/b3lYHgNyC?=
 =?us-ascii?Q?J5I9FGo757mld/9ATz2Kprnb1++m4hV+PcWs9Tc1sHrryYXBKSikyXWVs7DJ?=
 =?us-ascii?Q?RVnyxDAg6XAsVirGsbTSEQ09wLlNRkOFwfqIZ6Z7xZxEfkY7bF1X0CSOAS5i?=
 =?us-ascii?Q?bwCNen0R4L8RdoVifSH+i5NqbNqUKttbyxhCzFoxcXzmdsShEObiAJjD1LfD?=
 =?us-ascii?Q?gDySs46YkDrfCzVetP2uJg0vmN77SJWUTZdjxw59H05J97obD7U/fIFMNj/z?=
 =?us-ascii?Q?fFYVQYZUdAvGB7PNb1abbZBxdW7PgCQaAo6doybWOxRmnSSbROQQrPzfKCzE?=
 =?us-ascii?Q?2zVktD0p8HMXC1dO3SMITYksaaj70vrLODpT7L8M9ZgsW3DfrONhdI7N/6be?=
 =?us-ascii?Q?ygTxt79xC5M6cbWnIQXRdriw5YJ8yOCwcGNCarRkawcDsJjqrRSSBcUbXqe5?=
 =?us-ascii?Q?OnZEXJmfh0Jpc6E1YmhSEUfKXE9xhlf2BBu+WDFbQhjkAjVRKckuvmNHIKSx?=
 =?us-ascii?Q?/m7xmgfevjNhjkX6Z2BESEmoGJ5sxfxN5czCtdopcR7C6g5TJMjl/PmG6d+C?=
 =?us-ascii?Q?xVWqnsM+Pllavq7Uuf9VVWAWJC6DsBzCl0Jc8Z8yjmg0yYo4NiXoLznmUuiz?=
 =?us-ascii?Q?pZhyKkkoJUTc3hiHexXM3r587lA5FMU7TpYgGSbNJke9YNhpfXIrMjAWKfWS?=
 =?us-ascii?Q?IdyFwR6bvfVmX1CaC8SxVVpo+cyEjygjysMTO5FccIBMUPuMKECA/sET2B3a?=
 =?us-ascii?Q?1ePmh9+D5va/GXrH4mB20fnijhjAhWTH4qdannNK4xceowizlX5Xhx86onBJ?=
 =?us-ascii?Q?QKbt+Zt/fqR3+wlp+K0TuWLgiD4jTkm0L9LSpQlJdwE+/cSuz90soClx4vly?=
 =?us-ascii?Q?7ASq1IJ7q8OibiCWBoDpgeuGRoO+tZucbx6/VTy5rpBibLMUAV1r2Yv2QR28?=
 =?us-ascii?Q?xpC5FYTHiIB0jTn9+oIx4QlvkNptQg7kxCfMaMSVzFC/ZsOG4zPEmciEzMdn?=
 =?us-ascii?Q?f8km2vArB+caqVzHCjsEGvxvcTAb5UINw9VzoJNggzGsbvGfmz6e4OZ2nHRe?=
 =?us-ascii?Q?GkPzDHZghdnZux6/cbjrsqK09t39qpY6x2oAC6yG74DQ4Hz3k5flq9PVu/v3?=
 =?us-ascii?Q?ingZ2Z6HwD8mgOCNvc1wxK1CNpTGcpVhFsn33ZGT9hyukXeVbDBMHrYbNuYB?=
 =?us-ascii?Q?aro+GB5WNgjOH3rOSXwfvKxcWDoMzBSBhgtKkLMK3Erx60eUroqhBSgHD97F?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c99d9905-c2a6-4374-cf9f-08dbbb3b84d3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 07:14:11.1353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ww1mi0Z9Ku47cwi2a9VJ/6d/6nMUQCc6ym4bEFwVZ/9cVUYvM1XcyfZmibWusVx3aXZTTemi4zERKykVa0VQzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7186
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
Cc: Rob Clark <robdclark@chromium.org>, Len
 Brown <len.brown@intel.com>, lkp@intel.com, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 oliver.sang@intel.com, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-lkp@lists.linux.dev,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "canonical_address#:#[##]" on:

commit: d308a440bdf329cfa70cc5d35c565939d81ae73f ("[PATCH v5 04/11] PM / QoS: Decouple request alloc from dev_pm_qos_mtx")
url: https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/PM-devfreq-Drop-unneed-locking-to-appease-lockdep/20230823-020443
base: git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link: https://lore.kernel.org/all/20230822180208.95556-5-robdclark@gmail.com/
patch subject: [PATCH v5 04/11] PM / QoS: Decouple request alloc from dev_pm_qos_mtx

in testcase: blktests
version: blktests-x86_64-e0bb3dc-1_20230912
with following parameters:

	disk: 1SSD
	test: nvme-group-01
	nvme_trtype: rdma



compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309221426.fb0fe750-oliver.sang@intel.com



[   79.616893][ T2311]
[   79.634663][ T3447] run blktests nvme/032 at 2023-09-19 15:50:52
[   83.369231][ T2313] /lkp/lkp/src/monitors/kmemleak: 19: echo: echo: I/O error
[   83.369240][ T2313]
[   85.082264][ T1434] nvme nvme0: 128/0/0 default/read/poll queues
[   88.926272][ T3447] general protection fault, probably for non-canonical address 0xdffffc0000000024: 0000 [#1] PREEMPT SMP KASAN NOPTI
[   88.941100][ T3447] KASAN: null-ptr-deref in range [0x0000000000000120-0x0000000000000127]
[   88.951583][ T3447] CPU: 95 PID: 3447 Comm: check Tainted: G S                 6.5.0-rc2-00514-gd308a440bdf3 #1
[   88.964091][ T3447] Hardware name: Intel Corporation D50DNP1SBB/D50DNP1SBB, BIOS SE5C7411.86B.8118.D04.2206151341 06/15/2022
[ 88.977880][ T3447] RIP: 0010:dev_pm_qos_update_user_latency_tolerance (kbuild/src/consumer/drivers/base/power/qos.c:936) 
[ 88.987504][ T3447] Code: 02 00 00 48 8b bb 08 02 00 00 e8 79 ea ff ff 48 8d b8 20 01 00 00 48 89 c5 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 3a 02 00 00 45 31 f6 48 83 bd 20 01 00 00 00 0f
All code
========
   0:	02 00                	add    (%rax),%al
   2:	00 48 8b             	add    %cl,-0x75(%rax)
   5:	bb 08 02 00 00       	mov    $0x208,%ebx
   a:	e8 79 ea ff ff       	callq  0xffffffffffffea88
   f:	48 8d b8 20 01 00 00 	lea    0x120(%rax),%rdi
  16:	48 89 c5             	mov    %rax,%rbp
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df 
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	0f 85 3a 02 00 00    	jne    0x26e
  34:	45 31 f6             	xor    %r14d,%r14d
  37:	48 83 bd 20 01 00 00 	cmpq   $0x0,0x120(%rbp)
  3e:	00 
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 85 3a 02 00 00    	jne    0x244
   a:	45 31 f6             	xor    %r14d,%r14d
   d:	48 83 bd 20 01 00 00 	cmpq   $0x0,0x120(%rbp)
  14:	00 
  15:	0f                   	.byte 0xf
[   89.010647][ T3447] RSP: 0018:ffa0000017fe7b70 EFLAGS: 00010206
[   89.018574][ T3447] RAX: dffffc0000000000 RBX: ff1100209b614298 RCX: 0000000000000000
[   89.028658][ T3447] RDX: 0000000000000024 RSI: 00000000ffffffff RDI: 0000000000000120
[   89.038735][ T3447] RBP: 0000000000000000 R08: 0000000000000000 R09: fff3fc0002ffcf64
[   89.048812][ T3447] R10: 0000000000000003 R11: ff1100208a8624b0 R12: ff1100209b6144a0
[   89.058895][ T3447] R13: 00000000ffffffff R14: ffffffffc08e3468 R15: ff110001273f4138
[   89.068957][ T3447] FS:  00007fc6d8027740(0000) GS:ff11003fd3180000(0000) knlGS:0000000000000000
[   89.080098][ T3447] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   89.088618][ T3447] CR2: 00007f5be5eeb120 CR3: 0000000263306002 CR4: 0000000000f71ee0
[   89.098720][ T3447] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   89.108812][ T3447] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
[   89.118899][ T3447] PKRU: 55555554
[   89.123997][ T3447] Call Trace:
[   89.128804][ T3447]  <TASK>
[ 89.133218][ T3447] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:460) 
[ 89.139003][ T3447] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:786 kbuild/src/consumer/arch/x86/kernel/traps.c:728) 
[ 89.146323][ T3447] ? asm_exc_general_protection (kbuild/src/consumer/arch/x86/include/asm/idtentry.h:564) 
[ 89.153849][ T3447] ? dev_pm_qos_update_user_latency_tolerance (kbuild/src/consumer/drivers/base/power/qos.c:936) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230922/202309221426.fb0fe750-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

