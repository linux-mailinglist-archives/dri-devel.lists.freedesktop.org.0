Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25467E9709
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 08:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E88B10E04B;
	Mon, 13 Nov 2023 07:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6675A10E04B;
 Mon, 13 Nov 2023 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699860376; x=1731396376;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=xwI9wglImXL7r278zSm8nBZ3dhwzL3wfiOlqif6PBXs=;
 b=U8AGqLkBw8C/GLEnKXQgkbaQTS5ao4TzBRwtmGCjZM0dcjFqNp0Xw0W9
 AaF2RX5V74zebt2fQ3enxnxKvmjHCXXSlwwKtNoud2OKzlM5H2xDFR19o
 vRMAxZ1EWkEmyGic1yqbKCRnuldxWAD2Jgx8H1QQdMO+goJWuzW6CUgYe
 0zeaTPUA+IfhRiXQXK9a42YxgajRzmgMyHImj2gBCijoD9XJVvumyauBJ
 rBpB+ilvlfgDfm/g+xlpm8d4lhSLJNSKizXHTgt0nllGBPWGR5spq9947
 YRt/EMAcF+gtojWcCFE7azIG79WY5rBVAcuiJfRpNlHRJ5HQ5SSBJy+ql A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="393253996"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; d="scan'208";a="393253996"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2023 23:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="757725680"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; d="scan'208";a="757725680"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2023 23:26:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 23:26:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 23:26:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 12 Nov 2023 23:26:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmfD2F+yyHva8pUihpJ94ar0eEo9Utqj1pdEwUV9AD+xixuSSQo1cIdJiNwZvTQM4toVPHzLFZw8mvE0eWAnHQT6rEGAYFDhGWf48g3PUvoUdbsUoBasHJkSJkFJpKHvUrBcaJj8uRgMzNEi8FggzwEGhO/+iMbPdSIw0XLYbA7P8KU6/kGZC+25gUb7I1oV9lRx+Z3Nm6A4XaKFmJbEkkiOzmJxYBTQWnCcEPxgYjkizWQ2M5Y3uCzrupfnNLVX+fR8U3b8rnHShqgaL0x0IWgLYtlVFJyGpww3co6hdt9MARMJ4HztF04rNXm/oLruAgFCsq0MbyEHkc8wRA1hEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5v7McfHBxIW8OjCZJZNOk+xuaSnYveQ9t147DrYmacE=;
 b=RMyNEhyRQk94m5L5X2sNmLE9bEjD4VdhklD3ohp9PyicVtSSxd7GaCYwc0km5YE1kF6NwS16UNnZVEYAvjdbVHaTx3b4KVTZqmrVp5hJyEKD3p1/JeZVWi3e9ZcGjGW4ztr7/b/t37aGyf+LVCGjOMEu7wDwZNWKghkeUFo/rW9uqqsw8QNJh72pQcw1RYh74CxoECKOv48cYe88ZVApBOqXQ+UUaYpmWMoKXn7llsc32IXpK8Uv24sGlB8IxN6wzJW1z/MucITwAwgxbdEvDkPq2tpkjYCO995AaWv0zt5TZT2HLspF+OIzHMkpq6nL1kW4k4u7NthUzsgRN3Lp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 07:26:07 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 07:26:06 +0000
Date: Mon, 13 Nov 2023 15:25:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dipam Turkar <dipamt1729@gmail.com>
Subject: Re: [PATCH v2] Remove custom dumb_map_offset implementations in i915
 driver
Message-ID: <202311131508.7fc7540b-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231110184126.712310-1-dipamt1729@gmail.com>
X-ClientProxiedBy: SG2PR04CA0186.apcprd04.prod.outlook.com
 (2603:1096:4:14::24) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9abfe4-aa19-4f7d-1c21-08dbe419ccde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMGWC8iG6QGUK/c1jS1NdBeXjTjXqfhXOuZs7mSQh6AKXAQZToCiOy+upKHzkYE5mLSWudKTJYAVGUj3fweEXiv04O6SKs1zFtsM4vmfdjnp1DnFPSjteCLJOoqSoR5DVB03HNP1U8H5n90492SzbQZMXk2XmCujDlPnq/tnXfF1q1Kq8hY/56lJdhjwimx9JBExKQvilV9/8cxCqKO2GQUUYmwSg+tK0uRZ6wXhrE8/dIaL77WMDGE5QANDubHZUG/52hhOcZAQHnZohQWqU6YVkTsMtJOs6fFuXtaqOF0yfFd0ftye1sA4UePMAVygy54IPjXX1yRs9khIQyj14wW8LNW8+eN/j37iNXBqo4CZK931XL3PF7pjuW5YemwWbYaZbtlN6GH7wv9vVPUq6OtHcFg+3lj+R7yIXLNQg9sv+/qMnzd7o66+xZ4M2aDxvKoUPE08xQEUATIpRsn/10Dsrh+Uoz8dyPNGSPr7KwO4iXqtjGn8Ez7D7fzfp/NflH5dYmmCMvnAo/DMrApZRBxtCq1auEmGgO4Bdwr8uRc15Vp+F5PT1OB1I0KmxFS9w9W91V0RNKA75gzN+re45w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4326008)(8676002)(8936002)(316002)(66946007)(66556008)(66476007)(6916009)(2906002)(41300700001)(86362001)(5660300002)(83380400001)(2616005)(82960400001)(1076003)(26005)(38100700002)(478600001)(36756003)(966005)(6486002)(6666004)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YDn7FLatiIzDo2/RygtlgOh0i/utgTQArFVqTFE71dIIRKhuvXiH3gbYCN14?=
 =?us-ascii?Q?LUoi6EfUG1v0Bs1FyvbfVgNSHb/oVOBd4bP9j+gSN8P5AJtDWyaljb3suF2u?=
 =?us-ascii?Q?NamSVPmLUxvYfmjlEz2MHRjlXPReAK9bNxD3tzPcgZg14T/dZ5JcVe43Nia/?=
 =?us-ascii?Q?Vk9ttPcZFTdXTEba6DBcPJxTcl1Gg4X36GRHTL57gHOwnG1pPmz2Mkfx2eZS?=
 =?us-ascii?Q?gKYwT8rFKhowZm32hwf/+8KjkDeamUsi+Ik4/pwcr0TsZKHAKlEQq1wFmomY?=
 =?us-ascii?Q?kxrmJ/mw92CyEw+NidNHLyoaOMcyz1dJUJq4pcSjh3DmkXCaezaazbTwqV9s?=
 =?us-ascii?Q?q4cbR3RbnxHvDZTtxxRLUFC000jPhAxmxVYQsxqKFATTRi9JipmoerKMHNd+?=
 =?us-ascii?Q?BdDLaG7euMl8BN4qvNBGqUeW/EDL4uQvvxvHNQ0Mbb6asanqjJW/poH5Esb0?=
 =?us-ascii?Q?Osl1hv7BOvhPTXRSH6XZOPtNuStgM93BamvsZ40kaVHmKgDUnOKVK6zmjn7s?=
 =?us-ascii?Q?9CV8N+B592UG7PmLrowHvJsW3jF1ayUStBZBSMGbumhHTq4nXNHc+HmP3hvq?=
 =?us-ascii?Q?CKMfx3V9AffRid+ElGgtmNdPrr2ugoiSahQqwepHbZKkBPpEmuqrgTXPi1Pc?=
 =?us-ascii?Q?2bsJUApGPSOpEEI0vigTZnyuELMN+FbF7I+70/hAGoCiRmbMcScAmQwgw8Lh?=
 =?us-ascii?Q?sWHi0oUgJy/bXzcdAwR5qWadlBAWYri0+/+bDmXVb7GBp+RPDpm59l5ughKg?=
 =?us-ascii?Q?V8IYqR5FoWOQgwUOTNI2yLSnobCwCr7IXEgJ0vW94A2uR2UmRdAeIkrQo07s?=
 =?us-ascii?Q?2qNWb9b43uS1CJqH41cx62785E2JZdoP5EyEdLMerupkHZ78l2YzkApzFgyq?=
 =?us-ascii?Q?JG9BAZ5PvXuTsV1VIrqticWdpGYNb7MZRPK6m5EznpvbxkUzeTAn7PDlGgi1?=
 =?us-ascii?Q?RQypW8Z2dvuI2ZMOe4bzxB3DY3bqdQKwZm21QOHL1xVJK3vfNF+ksr8raTlx?=
 =?us-ascii?Q?Ngc76SJ4/cvrg9uHFd0WRZaSls5D629sC1t4t+k90vsUfCAOicXbmhCgollk?=
 =?us-ascii?Q?+oXXdUaYu2FTEurgFjVl/iW64HMS4bUnj/SPt+6nOnksokp44YgK4u4LM0ff?=
 =?us-ascii?Q?mnkmF+s3X0VRIiBS52ewOtOJ5SmvnryMhJsbqkdnpebg+18VmXZFjC+1RZzu?=
 =?us-ascii?Q?yoGswOECK1RKp7oi+2B84Zu5ZGJcGsrm1eE6b2uH8tSLlZCa6xeZYQ7FD6st?=
 =?us-ascii?Q?X++EV7psWBMu8lIYKHE4pgn+B1en+gvDoawH3J3gQpwAUAYPFkBAR6eVw6uX?=
 =?us-ascii?Q?u7QQOWwK+cC+t11QLVov0INBqOLkG/a1c59WFKPulGHv0GojFZyNxZ+DuyI8?=
 =?us-ascii?Q?hSFTqIGdUEmRzedhuciR39lw5lM+Xr584NwPFfGqppdgOzhXKGG3UjqPYC25?=
 =?us-ascii?Q?iM4/TA8oL/wXq8yRueY0ewMCQkvexNZwg17zgAfvYxB7FtwdQk7cl63KPWgf?=
 =?us-ascii?Q?aW/N5Loxj5Ja4PE/+w3Op/sF97B1BREHMW1YsMPAhqaf24vdo8WKP9zzl11f?=
 =?us-ascii?Q?bjnf/UDbvUAkpKZWyoNB0oDKWqhyBHR5CmoUboIX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9abfe4-aa19-4f7d-1c21-08dbe419ccde
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 07:26:06.7997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fySNT3asPOeWKwpgX1snHc1RZK5QnbY/ziL21z8fJ02o5f8iGSx8u85sEjjEhCXMIIJfCqGVdzTqWY3GYwVD/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
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
Cc: tvrtko.ursulin@linux.intel.com, Dipam Turkar <dipamt1729@gmail.com>,
 lkp@intel.com, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 oliver.sang@intel.com, dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 oe-lkp@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: a09fc21ac1126b7a5542d2653aa2c319d3bbf5f4 ("[PATCH v2] Remove custom dumb_map_offset implementations in i915 driver")
url: https://github.com/intel-lab-lkp/linux/commits/Dipam-Turkar/Remove-custom-dumb_map_offset-implementations-in-i915-driver/20231111-024912
base: git://anongit.freedesktop.org/drm-intel for-linux-next
patch link: https://lore.kernel.org/all/20231110184126.712310-1-dipamt1729@gmail.com/
patch subject: [PATCH v2] Remove custom dumb_map_offset implementations in i915 driver

in testcase: phoronix-test-suite
version: 
with following parameters:

	need_x: true
	test: x11perf-1.1.1
	option_a: 500px PutImage Square
	cpufreq_governor: performance



compiler: gcc-12
test machine: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311131508.7fc7540b-oliver.sang@intel.com


[   53.192823][ T1574] BUG: unable to handle page fault for address: 0000000000040000
[   53.200433][ T1574] #PF: supervisor read access in kernel mode
[   53.206290][ T1574] #PF: error_code(0x0000) - not-present page
[   53.212150][ T1574] PGD 0 P4D 0
[   53.215393][ T1574] Oops: 0000 [#1] SMP PTI
[   53.219598][ T1574] CPU: 0 PID: 1574 Comm: Xorg Tainted: G S                 6.6.0-rc7-01630-ga09fc21ac112 #1
[   53.229545][ T1574] Hardware name: Dell Inc. OptiPlex 7060/0C96W1, BIOS 1.4.2 06/11/2019
[ 53.237674][ T1574] RIP: 0010:i915_gem_mmap (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:444 include/linux/atomic/atomic-instrumented.h:33 include/linux/refcount.h:147 include/linux/refcount.h:152 include/linux/refcount.h:227 include/linux/refcount.h:245 include/linux/kref.h:111 drivers/gpu/drm/i915/gem/i915_gem_object.h:109 drivers/gpu/drm/i915/gem/i915_gem_mman.c:1027) i915
[   53.239774][  T633] perf: 'sched' is not a perf-command. See 'perf --help'.
[ 53.243647][ T1574] Code: 00 85 d2 78 46 85 c9 78 42 31 f6 eb 85 48 83 fb 01 19 c0 83 e0 f7 83 e8 0d e9 f5 fe ff ff 48 8b bb c0 00 00 00 48 85 ff 74 59 <8b> 17 85 d2 74 53 8d 4a 01 89 d0 f0 0f b1 0f 75 59 85 d2 78 22 85
All code
========
   0:	00 85 d2 78 46 85    	add    %al,-0x7ab9872e(%rbp)
   6:	c9                   	leaveq 
   7:	78 42                	js     0x4b
   9:	31 f6                	xor    %esi,%esi
   b:	eb 85                	jmp    0xffffffffffffff92
   d:	48 83 fb 01          	cmp    $0x1,%rbx
  11:	19 c0                	sbb    %eax,%eax
  13:	83 e0 f7             	and    $0xfffffff7,%eax
  16:	83 e8 0d             	sub    $0xd,%eax
  19:	e9 f5 fe ff ff       	jmpq   0xffffffffffffff13
  1e:	48 8b bb c0 00 00 00 	mov    0xc0(%rbx),%rdi
  25:	48 85 ff             	test   %rdi,%rdi
  28:	74 59                	je     0x83
  2a:*	8b 17                	mov    (%rdi),%edx		<-- trapping instruction
  2c:	85 d2                	test   %edx,%edx
  2e:	74 53                	je     0x83
  30:	8d 4a 01             	lea    0x1(%rdx),%ecx
  33:	89 d0                	mov    %edx,%eax
  35:	f0 0f b1 0f          	lock cmpxchg %ecx,(%rdi)
  39:	75 59                	jne    0x94
  3b:	85 d2                	test   %edx,%edx
  3d:	78 22                	js     0x61
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction
===========================================
   0:	8b 17                	mov    (%rdi),%edx
   2:	85 d2                	test   %edx,%edx
   4:	74 53                	je     0x59
   6:	8d 4a 01             	lea    0x1(%rdx),%ecx
   9:	89 d0                	mov    %edx,%eax
   b:	f0 0f b1 0f          	lock cmpxchg %ecx,(%rdi)
   f:	75 59                	jne    0x6a
  11:	85 d2                	test   %edx,%edx
  13:	78 22                	js     0x37
  15:	85                   	.byte 0x85
[   53.243649][ T1574] RSP: 0018:ffffc90002117d10 EFLAGS: 00010206
[   53.243650][ T1574] RAX: 0000000000000001 RBX: ffff88810452de98 RCX: 0000000000100000
[   53.243651][ T1574] RDX: 0000000000000001 RSI: ffff888877be0000 RDI: 0000000000040000
[   53.243652][ T1574] RBP: ffff888169b452e0 R08: ffffc90002117cf0 R09: 0000000000000000
[   53.243653][ T1574] R10: ffff888108e0fe0c R11: 0000000000000008 R12: ffff8888745e0000
[   53.243653][ T1574] R13: ffff888877be0000 R14: 0000000000100000 R15: ffff888169b452e0
[   53.243654][ T1574] FS:  00007f200cf59f00(0000) GS:ffff888853600000(0000) knlGS:0000000000000000
[   53.250665][  T633]
[   53.270183][ T1574] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   53.270184][ T1574] CR2: 0000000000040000 CR3: 0000000107052002 CR4: 00000000003706f0
[   53.270185][ T1574] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   53.270186][ T1574] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   53.270187][ T1574] Call Trace:
[   53.270189][ T1574]  <TASK>
[ 53.270191][ T1574] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[   53.276433][  T633] Events disabled
[ 53.284111][ T1574] ? page_fault_oops (arch/x86/mm/fault.c:707) 
[ 53.284114][ T1574] ? exc_page_fault (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:72 arch/x86/mm/fault.c:1513 arch/x86/mm/fault.c:1561) 
[ 53.284117][ T1574] ? asm_exc_page_fault (arch/x86/include/asm/idtentry.h:570) 
[ 53.284120][ T1574] ? i915_gem_mmap (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:444 include/linux/atomic/atomic-instrumented.h:33 include/linux/refcount.h:147 include/linux/refcount.h:152 include/linux/refcount.h:227 include/linux/refcount.h:245 include/linux/kref.h:111 drivers/gpu/drm/i915/gem/i915_gem_object.h:109 drivers/gpu/drm/i915/gem/i915_gem_mman.c:1027) i915
[   53.291999][  T633]
[ 53.299843][ T1574] mmap_region (include/linux/fs.h:1961 mm/mmap.c:2754) 
[ 53.299847][ T1574] do_mmap (mm/mmap.c:1354) 
[ 53.299848][ T1574] ? apparmor_mmap_file (arch/x86/include/asm/current.h:41 security/apparmor/include/cred.h:76 security/apparmor/include/cred.h:109 security/apparmor/lsm.c:511 security/apparmor/lsm.c:556 security/apparmor/lsm.c:537 security/apparmor/lsm.c:562) 
[ 53.299851][ T1574] vm_mmap_pgoff (mm/util.c:546) 
[ 53.409245][ T1574] ksys_mmap_pgoff (mm/mmap.c:1400) 
[ 53.413900][ T1574] do_syscall_64 (arch/x86/entry/common.c:50 arch/x86/entry/common.c:80) 
[ 53.418192][ T1574] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120) 
[   53.423962][ T1574] RIP: 0033:0x7f200d4b40b2
[ 53.428264][ T1574] Code: 0f 1f 84 00 00 00 00 00 41 f7 c1 ff 0f 00 00 75 27 55 48 89 fd 53 89 cb 48 85 ff 74 3b 41 89 da 48 89 ef b8 09 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 66 5b 5d c3 0f 1f 00 48 8b 05 a9 3d 0c 00 64
All code
========
   0:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   7:	00 
   8:	41 f7 c1 ff 0f 00 00 	test   $0xfff,%r9d
   f:	75 27                	jne    0x38
  11:	55                   	push   %rbp
  12:	48 89 fd             	mov    %rdi,%rbp
  15:	53                   	push   %rbx
  16:	89 cb                	mov    %ecx,%ebx
  18:	48 85 ff             	test   %rdi,%rdi
  1b:	74 3b                	je     0x58
  1d:	41 89 da             	mov    %ebx,%r10d
  20:	48 89 ef             	mov    %rbp,%rdi
  23:	b8 09 00 00 00       	mov    $0x9,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 66                	ja     0x98
  32:	5b                   	pop    %rbx
  33:	5d                   	pop    %rbp
  34:	c3                   	retq   
  35:	0f 1f 00             	nopl   (%rax)
  38:	48 8b 05 a9 3d 0c 00 	mov    0xc3da9(%rip),%rax        # 0xc3de8
  3f:	64                   	fs

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 66                	ja     0x6e
   8:	5b                   	pop    %rbx
   9:	5d                   	pop    %rbp
   a:	c3                   	retq   
   b:	0f 1f 00             	nopl   (%rax)
   e:	48 8b 05 a9 3d 0c 00 	mov    0xc3da9(%rip),%rax        # 0xc3dbe
  15:	64                   	fs


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231113/202311131508.7fc7540b-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

