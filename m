Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC188C0A37
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 05:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB02B10E14B;
	Thu,  9 May 2024 03:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2m8qwBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0010E10A;
 Thu,  9 May 2024 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715225888; x=1746761888;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pCA6eGsEUdL50qsMuoHdxw9neiXjqBVFxRnE4TThA8U=;
 b=G2m8qwBs9IfhUQVHIqWiJtDXMG4FOAf9Ql1oQbhmVLCq31FkrtqC01Zx
 s6IA+KlXYR2aXHRL+yHbsXQW1n+HjMAvRi23hoFY6FjO4yHV+GTBYF33Z
 rXKZZ1XAmnZFeW0hyzOxTdSd/h7jCZJfWZZOxBuY0zZTFQxr08LMeVX4y
 29QV4f80vL88SinqtwhWPibWRBqp69vk9KEMD8ec710cum0PyI77JZokW
 wsqBj6yrQMnA6BdIqJeEpeN92CsgEoMhf9YZt46ROCNuWEfeVhxW2ldeW
 n3d8lPGiV0GAG58EzaGJMLG11lhD8xT6K+7pEu6OBHro/zEBbsR+BUdmf A==;
X-CSE-ConnectionGUID: 4+UxUGf+Sny4R4wQvWiA0g==
X-CSE-MsgGUID: jGLZ/W6xQbCYSMT4nBRgMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36503972"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="36503972"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 20:38:07 -0700
X-CSE-ConnectionGUID: tpv/U3OfTw+wBMOqZKykWA==
X-CSE-MsgGUID: hQEAzregSJS8WVQqgXJD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="66535015"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 20:38:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 20:38:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 20:38:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 20:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUPTSg2jiifTdugjcqNpfXOFl/a0q80UKLEK9oz3qOa/n5/Hn4SOkpRyIBByFhHLyJadyyZfXL1Xllsl89TpgkeWtkyVrKTUjXrqk2qctJ9LSa+6m7Npebkcv6bvNWVeIhVWzZWgij+rMWprb4/ktUQeRXdac6hRo+jKF11LeHwPk4Tvv5Ou2lpavPEIiFoLrrCkeH00GNfjNGJgdaLz/1VoNtfwfbdD5KkdLS1s16LuJchcdTPLUTN/pPk+Gz8oSKPlR+l3697zb7vNEhdemymHZXSRfPfenw3PYixhrlLtFnNJW55GdnFKg3LMpUvqh618LgwIR5an8NNpDvg7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2yzv1ojJrKdMhXJeafgdjFZQUlmB12DGFEgS7OUdpY=;
 b=BXLA/eJTflbiIIZwrxMLT7GnN+jdb2vLR0HdoZHv0d2NTqjOZAcCbaM6ic9h8eANO77bp5+DoTRwj0qZiQeD/Ycy7Pt3rMtooShl7c3r/9a0jZqAMxv+l/0IJCtFWoh70NMoiviA159qqt5e2Mvj0Ql8o7SX4L95GYq0zwCXRX+oDAPimDlpNfYYHojY8aj0s1/3JM7Ag3Mi0eOIXm3Edyr0YSTJN3MCX6JcrTbuW6v3eigBJd79gAv11zw5dXmiiaimJvzKoN5Wj5pxUW3fYPT7KxjU4LjIRZTMouJhS4aXwUarbbNTxvDIygoWMzbyFMmaCXUCncdhs9SN/pwdJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Thu, 9 May
 2024 03:38:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 03:38:04 +0000
Date: Wed, 8 May 2024 22:38:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Message-ID: <dc7rmhsjbvtqddqvz465zo6esyiy7xengp43jepmvpaxvksuzv@bl6sq3upfy44>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <20240507130411.630361-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240507130411.630361-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0155.namprd04.prod.outlook.com
 (2603:10b6:303:85::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 264c0771-99d9-4852-2627-08dc6fd96ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CxjC4VUqQOdZKyt7SrgP7DH2eIJrcx5jPhus7GCfdTixnxoPgHA9oeYiIZl6?=
 =?us-ascii?Q?cX2hgfxF3Xx77WTGlxx9RrkCkHpgIkVVjsJAvZcb5g6matO0dmRYZRab34R+?=
 =?us-ascii?Q?iibju0qid0xftKzfw7EfRj5PFSprTbLvTzlkXu+aIR4a/K1jgVg/sZMNuM1v?=
 =?us-ascii?Q?HVpl1J25cGX2g1slegFazQEkA8kLj0WQZamLOcklpndE3UHpYVJrFBFfg1Bh?=
 =?us-ascii?Q?Qr6Rs6k8p6M3GaQEoagUup3RU8NZUpkIOPfdpyE/DTixL4vmBMsSWJgZhg5E?=
 =?us-ascii?Q?RoBnk4SW/QQfYeOtWG40mzER5zB60JiVahX9daVDlf7ZT3JnhRiaytf6PXgX?=
 =?us-ascii?Q?CGARCOooRAi8Zgxz4N/zsmoiU0AS9AXyMLTpjf7pf+XxEKt31h9QFOwRNTQg?=
 =?us-ascii?Q?3NQADHrgF335rZ8bwHxZe1HXRIUkXAoot98VRp/+YFoMw66p0GSGU6OTkH70?=
 =?us-ascii?Q?NPgrZ7InFeGpZlSFBukqHWwY0yH4cNPFwqBlWfVgVPLAKxCCzoZ5YPFWvH4W?=
 =?us-ascii?Q?lFal/IOG+oYWVmg7raMSC+0pNq26FnjnJBgES0BYnN/KaJWzjbTcpK2wQ2qo?=
 =?us-ascii?Q?K5SvXvA7ADCYSdWVDtDsvZsRV6XdMxVbP6ZI17bHvK0ilJ0hkeRNZP1iIuFD?=
 =?us-ascii?Q?e48aO11rOl1pPTfg+w4jC1L/hHXawwRFnysZPDFIcdmmoXduDsUqmpB+55KP?=
 =?us-ascii?Q?Yntsska0c/Cusc84qd+cHlKFh2pgD/Lx6W+VYH4mWHM7Il6xOMLRCbfnIT0E?=
 =?us-ascii?Q?xIrvIny5u1Rc2H6NL4Btau91RCQYp0+SLrIzMYvOyqg5yxmSnlUkHf8GLEMi?=
 =?us-ascii?Q?W4fXoYO4jUp91jxMDac/RiHiwoD9KZ/awgm8xSXsJCxc+3HFT0aWf3A4l03r?=
 =?us-ascii?Q?0douYT5ZeLw8gTJKYcyi+/t8Q+5SNfYhQesd2XnDrzjhFObSOxrUm9ecuetX?=
 =?us-ascii?Q?5Mi0CaBV+7CctgEOgDvZIpP+oS95897/zVAgsp2Vylf0Vs/4cVncl74vFqw6?=
 =?us-ascii?Q?1xT8R69IBvLMW2WAC5Fboy5+aN2dCHzIjMIapc8TBHoSak0amMtVWlNpjYNU?=
 =?us-ascii?Q?HRj5OHO2LQjEPzYD5h9GgT5+NWo0MdaX/39QIkNdQxAS9byVRRZwfC2XDzz9?=
 =?us-ascii?Q?NGgS7+v4CgYIysR2iAm10/sOZoo7T20TK4DN1TZOWe4cZqN+ns+W1uK5zQg2?=
 =?us-ascii?Q?e8VwI25yBCSr0TThbpRvb0sblAxpjGZxQ0TLPWPr3jAjqTx+6o6uJtOvYGU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhVWA4DGD539wAawUxohfrdPa8ferK2Amb+zEyT6M+XI3T5Dows4yBP16Y47?=
 =?us-ascii?Q?OIdb0aMmKGk75Is5nOFEBaw+GDmlUCLNaiUqMBEfbZBjHUjKO0boHGvQZswH?=
 =?us-ascii?Q?LKLsdOmKEpAZMbr7g8+JxIsJIKfklPw5HHCVXB0rUm5sKEre32tal0RtSu65?=
 =?us-ascii?Q?yMKSih/pQGtCW+oDpc3akaphLV/p1177Y0tQZvLIRIXIjAULxdOSbT1ggcEh?=
 =?us-ascii?Q?+e24Kd05F+cu7o1Kab5G+T+WKFJYTr7COLnx6FBCWfUUGclgh6y3RNgpPE1p?=
 =?us-ascii?Q?QgkVm5kuUtgUpcykbQR8DP2DBfWaoDB6c2wGR/N1thU5Lt+CqIUCpKAF5SEn?=
 =?us-ascii?Q?zGHIvBkxqesvFMONnvHzL0PwVb3Wvtg7sdX7vmUqUExnY7FfnJNjrgppdmMu?=
 =?us-ascii?Q?YqRGMIAeaOB5kw5yQ20WVIoteMzNPDhC14NT4VrW1E7yM8Sn8VzOiGpNoD8Z?=
 =?us-ascii?Q?R9f9fHn4FBe+X+PWblLpEDIaEjI9jGAjctldXGm7TmFwOUw4F0Efh/pfk8V3?=
 =?us-ascii?Q?ztJkaVHnQ7yT9NVzefdBwqNdkOofkkKCmYXty+Oh24fbvxPy3WnKt+44e4S+?=
 =?us-ascii?Q?yQX5xFTyV1DHBI8gkgrjBopHAmIrbXZ+UYdjrSXZx9TRJwkMgX1dJ+y5CLRO?=
 =?us-ascii?Q?l2GGfel+n2p5zzCqtZAHFUiHWveix0CQFtFf4gHzKyuMmtsgVc+8GcypROp3?=
 =?us-ascii?Q?/n+iMzUSgrddjbpKJyvJBhOsmxmEAoGr7AcssMekgOzuWgWlQXIU3MsfBtnf?=
 =?us-ascii?Q?b1B/yOMTnL1MGiqdbiuCEX2c+3W6dtauLIia++/HgfyF8aDtqy/EPCyNaVfE?=
 =?us-ascii?Q?FzeP7t4eTl/ts8A+Y+NU7nOqTLQv98l2aQsWAQWOGoMfPYkIQG/AAw0Z7KLt?=
 =?us-ascii?Q?TDPxumHFERrwBE2/3D+M0cTIu4lv3t3eakkIxqlvCqzBh0nPtoijiwCTZTOc?=
 =?us-ascii?Q?7A7GUs4It2uGt1jYUREVj06MIo2FTmwA67Q8niGou16KEGJptkLgsgCf4QwF?=
 =?us-ascii?Q?d68JqzYTCGg9Rw4AeaDEmfyD1aWdv4DmeKEO16vl7HDiahXwrgSYP3uLJDJD?=
 =?us-ascii?Q?+WFnZmjBFqt7Dl342vL6mFlxQ/lj/OP6T5h3e8lX0AO70nTJwfhAx+CrXgP1?=
 =?us-ascii?Q?dDrXksQEDNg7uzGXZtBW4NzR6SmP7k4uDVMiinndVIFTkfUhfy9+g33Spz+Q?=
 =?us-ascii?Q?zdbV5a2/2gd0u2yA6zU4jATVMbcvsfYAHTFpfad/2hUCuL6jpJ+btZQNOIFi?=
 =?us-ascii?Q?8kw/142X2qvkA2tIw1yNMrpVOjzJH3xJ8p6Kxys8/NocQjNYp3/6CtLaYsJM?=
 =?us-ascii?Q?YQBhJhTSMkjlSujR0p9+hUWYS9B9pzDhphFKuZkbXQD46eyMRn5jLLZ0E+6L?=
 =?us-ascii?Q?nQAwbG5Md8XqYxao7oIGKK6dU+m0oU4CyRJwi2yQqK0Vwkid6LnX05R25gRm?=
 =?us-ascii?Q?3fa+vwyZVe+N4Iosq7gGgc2G8X7rCquptH2kY2PElT9yU+/ze908yOIclTnC?=
 =?us-ascii?Q?J6drjtZE3irWRAlAcfxDSzQUh77wARkO38O6VD0dzXDf2QOUyy4fCRZ7jfIY?=
 =?us-ascii?Q?8M2AZMIggHX8kkfDQKg451x8DPjGdGuRCWcgY7y2Zwac+WMw9JFFJaG03gYz?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 264c0771-99d9-4852-2627-08dc6fd96ed2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 03:38:03.9622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWqMagL1SGtbqZNJ9iEusuqKIpzAfCPYAgdSmukXViXuqKTeXhJGmOBULTftozVMtMJoLuJjFzLIF3sK7gO/IJBgMx32rnYH9pugSuLb3U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 07, 2024 at 01:04:11PM GMT, Shuicheng Lin wrote:
>Here is the failure stack:
>[   12.988209] ------------[ cut here ]------------
>[   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
>[   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned int'
>[   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U             6.9.0-rc6+prerelease1158+ #19
>[   12.988237] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
>[   12.988239] Call Trace:
>[   12.988240]  <TASK>
>[   12.988242]  dump_stack_lvl+0xd7/0xf0
>[   12.988248]  dump_stack+0x10/0x20
>[   12.988250]  ubsan_epilogue+0x9/0x40
>[   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
>[   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
>[   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
>[   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
>[   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
>[   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
>
>It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.
>And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-out-of-bounds.

ok

>For num_fences == 0 case, drm_exec_prepare_obj is the same as drm_exec_lock_obj in
>function, so call drm_exec_lock_obj instead to solve it.

this is not true and per discussion in this thread it's not going to
change. drm_exec_prepare_obj() should not be called with num_fences ==
0. So I'd reworded with something like below so we have all breadcrumbs
for anyone trying to understand the changes later:

	By design drm_exec_prepare_obj() should be called only when there are
	fences to be reserved. If num_fences is 0, calling drm_exec_lock_obj()
	is sufficient as was done in commit 9377de4cb3e8 ("drm/xe/vm: Avoid
	reserving zero fences")

>
>Cc: Nirmoy Das <nirmoy.das@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

with the reword,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

And also add:
Link: https://lore.kernel.org/all/24d4a9a9-c622-4f56-8672-21f4c6785476@amd.com

Could you also submit a patch to add the warning like mentioned by
Christian?

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_vm.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index d17192c8b7de..c5b1694b292f 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>
> 	if (bo) {
> 		if (!bo->vm)
>-			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
>+			err = drm_exec_lock_obj(exec, &bo->ttm.base);
> 		if (!err && validate)
> 			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
> 	}
>@@ -2777,7 +2777,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> 	struct xe_vma_op *op;
> 	int err;
>
>-	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
>+	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
> 	if (err)
> 		return err;
>
>-- 
>2.25.1
>
