Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4BD87BE50
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 15:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D704910FA4D;
	Thu, 14 Mar 2024 14:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEsihnmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B5810EB69;
 Thu, 14 Mar 2024 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710425046; x=1741961046;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QwxItgZ3DVyRMjii4+hCa17jeID9DHbsTcrPwg+OgmM=;
 b=BEsihnmonRYegwX2ia/wW+wwA3hdTlp20bLbbAbR3GgpOYVEnj16O5vt
 01u/JyULUff0lZoLbPCPDgQKQFv1KW1ozzPHoAkCblcK69rg43hCiJIiQ
 zJm+PB5ri/n54LTE8q5bxYiB/QHcZ8TvulPxep9jEwJjlaitHjDPF8JVS
 zv+VMyxc38oGNFR8ywfjtG0yznapDReu00uo+pFheP0vETUZaoIAYS2VT
 Uj/Y7F/LHHXrzuGJzcGUKt6SPxl7Pu91zkRhVDyKTO+Gy+XGhzxWtAsAa
 hXtySfzBfMutfHG1mxMKdgOA+/NpJnbidkBk51T7io6icFMEQWm4QJ22X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5108263"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5108263"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12365769"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 07:04:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 07:04:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 07:04:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 07:04:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 07:04:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+DVdhIITvrx8AWji60pVdfRny9ZfgVbDwhjtAS6NpnmlnsinL597x5tP1nLsgRc2qU8nYghESFO24zqah994RH2jx3w/PPDkk7mhlR2V0Sdh+Zhuz7zK6+1Twx/u5EzL76HXclvNSOVnQFrLOduJdpSxYcEI+sgsTLqHOTa9kjns4RSavaFknqy3kiTWVzo1Xv0bsjoJdqqRyC27uBxbJ5kvEoxN8qfdW+xoakN/3i+P2cTqcOgHbWArHC8yGTYQ1IJXbGTmkped+fzZjaF3TQElJ+1S/otIGSoyPxWpL5JsCQLaTId4i8snl3CWwdJxVQT5bHKaoVOAzKTFald0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/eUdVg35eRmopJF81N8sxDeTlZB9bfPrQLRYYAImEA=;
 b=TpH2DVtg3dn9XbLn2eORwzyFZKyHXdM81ZGYwFFf9n33AfI46GJxmcbCjDBVPnw2bMuEh4tqZlKrgnGzNSqkZWqAQ4+iIMoF1RaS4lbK40mQdEydfkL01RY4SGKhHRFkxnAfzsykxs5zycusYE2E/jI/GeBXExMWqf/BB16zi86DOV8bbcRjqDmrQBBKxG0Wehta0szfoybCrxNXF9ZN6kj9gOPC0izXwZ4IrL4dCmW/UM0zdH2QY0X4sY2bYTksJxxWLTj7hz7rQ7JViOxv+KwRi4n4A+heTSc+b09NImmiHDngVVndNJ3x/4RWVMP0z3LegANvtp15Eew9S71/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 14:04:00 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::64b:598c:d4e0:3f26]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::64b:598c:d4e0:3f26%7]) with mapi id 15.20.7386.016; Thu, 14 Mar 2024
 14:04:00 +0000
Message-ID: <46ab1d25-5d16-4610-8b8f-2ee07064ec2e@intel.com>
Date: Thu, 14 Mar 2024 16:04:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Report full vm address range
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 <stable@vger.kernel.org>
References: <20240313193907.95205-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240313193907.95205-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d85dba-e83e-4ff4-5185-08dc442f98d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nJmBPNUD+jzI8htsTmutkzqwMV0gE2KbMcdNbpk4hax7tsK0LrZEFXzUN/wmLHN9yBSo3V4AXhVbu1WawnybETKLQ6mLZrLHRMbenYxPfKR/DuO6l+SywgpqP0mYtdI/ufufXyAX3U5WH3C5rb6ZUa1euvsBwWF6FGs/EX6h7Ccio64ff6b+t6axftLebZLAzupZt3S1LUN1G0a5V9wsdtaXwpSGt8PJbXAWYKOn/gxonWbMQU8Zm/dl+d65CTswQY5+SUkdJCy1uGrY5ScFJ4ln+ZmaOoguyckS9p84zrM4l9N3H1Cd9Aj5BQZ8NvWJ9ytnMU4OAX2XnCkqwCoYnPwns/i2ScPJsRR0DPqnF8w3e/ytyiimxllB0R3ZI3n+AOtx1dmKuZR3rMn4lNJ7SZ+Whh9r5xtNEbZiYhkO5+uApgXnIeZv762g5XaJ2A/PugWhu/V+KkTLgKSsDAQxu+mYpdWc+lYB+xHRTDuC9QQM33IW8G5FPSO3BU8LVsmLPCN303ftNUYJ+9qd2Z/33mIsifsPiVlVIVmQhz3zHNuW/DXrzdM8GeBCZT3gCXS/RSBxLEbJ/Br7MllA7oqAWi2KP96Kz/+ByXOfnw/radaKp2zrhD8qc+c4Hp6nkSkejsET3LLUpWUQGMMpCfx0SWE3jG5CiXdeohGdReL0X2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDBPc0dzRHhaVGZ4OEJ2dHB1SGtYZFhPdW92TkhnZWtzN01GUmF1SUNiUlBD?=
 =?utf-8?B?ck14T2dSL2RzSHRuOU80Vk1ubUVoajFyYnJoS09RcXdwVmpsdy9YeG9iTk11?=
 =?utf-8?B?NDhuT0dBQUFhZUhwZk5lOGkzR2NSdjE2ZVI3VXU2ejRjRjhrUExvSzkyNVJK?=
 =?utf-8?B?Tnp5RFhpVE1OZnFQL0Q5VUo3L2tLZ2lQY0M2UXFFWW9POStsUWpvbURJb0Va?=
 =?utf-8?B?Q2JFcW5ZdVhVbk1ObVk0NGFMS0xOUVdwNHBlY0ZQanNOSUJYZkI5N25BUWRW?=
 =?utf-8?B?c0pLbUUrN3QwYWhxbnR0NHFLdGNybmx5N3plWDlhSXRMeVcyd1RKRUlodFpt?=
 =?utf-8?B?cCtlZjgwUEI5Y0hBTUJqdlRURUhxaUJLVFpFL2NISm9UVlR3WUlqRHB2N0hV?=
 =?utf-8?B?OG43eE9uUlJQeEZVS2RRaXg0VGg1Y0s4OW13TzNuVytYTUVCMXNYQyt0NGJC?=
 =?utf-8?B?b1dRcWdkYVQySVlWZWlsS1drWkhYcHJQcG5GeG5XWGxmZmFzTXB4Y1pmZXJi?=
 =?utf-8?B?MUtVbWk5ZzNKRFpHWW94NXNpenUybk5NOU96dzJxZmU4TkVOdm1Vb1J3alFw?=
 =?utf-8?B?QnErTTBXc1pmVnZEZTk3T0FqaGg0akd4L29iQjI1cEx1cWxsUjRyeGR1eENE?=
 =?utf-8?B?cFN1QTVDK1UreDZzQmROK0s1a1ZVM2lWVTZDZnBPajROL1IzTzgvcllGblRH?=
 =?utf-8?B?V2wvZGdRditKVjd2M1NHendVT25zb2pFMHBSL2FiYkNwZlFaZms1ZENTbXlS?=
 =?utf-8?B?Rmg1ZHVBMXY4VFcvQlNGMzd2YVpwdU92SWw3S1Rnd0hsaWlLbXVMMU9wYkNj?=
 =?utf-8?B?NlFsRDhsRlVEekJqVG9nYis1WmJ5V0NxaEZVR1VDbjBLS3UwR2M2QU1welJI?=
 =?utf-8?B?RlVLNHJWeWJCblRBWkd6R2ZYanF5YTR1RWlSYW0wTmRrMVlHVUtadDl0Mlkx?=
 =?utf-8?B?WlBWNkM3b3ZucnVLcCtRM2J6aHdKRTdKWFBrOWhwdVlGWFhwd3IzZmY5VEdp?=
 =?utf-8?B?YWNtRVBzS252QTYvTWVMWGtwTnNzTnUrYmhlMHQxZjNiTXRXZmJXT2lMY2hC?=
 =?utf-8?B?NUdkcEpMRWlxMTQrbDI4WWdqb2p2UEVQNkJtS3J4a3VtQmFCYzlNUXBDTllU?=
 =?utf-8?B?YXZSQ2NVV3k0c3huaGpyRCs3Mk1jaVhLbEdRR0VNdGExYVRNTGExcDcvUzhR?=
 =?utf-8?B?a1VlNlRMVEg1aklWU0pSaktpUlEzNVE5R0NMZElyanpGYVFTU0dBMDI2UFRz?=
 =?utf-8?B?VFYxa0FxTVZ3MGo4R0FjNndDT01wZ0Z1akZjbm8ybE1KTDE5dlpYU0VmbXZm?=
 =?utf-8?B?YmFhN1Y5R0tKL1dVMGx4aWYzUDFRb0JIbml5UHBMVU1aNURma1k1TjhXTHJa?=
 =?utf-8?B?UWw5U1BMcjVwdzBrSHNlNXNscG9DMmUwMHNhL25WK3ExRnRLU1I2UnBIUllo?=
 =?utf-8?B?V05va1Jvd1RJb1orMWpiUml6UVBKdWNzS3dyaXdKSEtSNkMwQms1SitaV0FI?=
 =?utf-8?B?Y3NKeGIxRG1CZE1YQ3lJcGxxc3J6UFJLaGxyc0l4bFk5VkZxL2NhNzlwU1JW?=
 =?utf-8?B?UHliVTdacmxxUytBNkowMW5kdFI3dURGUUc5NG1xYmhIV3hSVDZNU3QzeWtT?=
 =?utf-8?B?UDBKSExXdzVUaDVRdGhVYTBqZ2pKRUpYS2ZYNnlvYldkR1R0V09vOEpTcFZB?=
 =?utf-8?B?cFZKbitYTVpYcURSVXN0RndkS2R1VkRMZTVMdkdWSFNab09Lb2xPOVhPUi9L?=
 =?utf-8?B?ckhwcEl4UmlsNkxLL2tNaERtSkRjTVlXUCsvSXljOGZHaDFGSVRmMHZHTlNN?=
 =?utf-8?B?U2NWanN5QzJMN3RxY0hseklPeERxOGhmVFo4L2NJdXFRSCtlUHhMZktvQnlr?=
 =?utf-8?B?dzdaY25rU3hYZitGWjQyM3BTUkdpRS8xMVo2TmlSNHhialAzWWM0YUozWnFC?=
 =?utf-8?B?bkRBR3FEcGxHWmsrODgyT2QwZGs2Z2xNL1Z2YWtjek1VWEUxcW50cVJneUFv?=
 =?utf-8?B?ODlaNVA1NTlkSVp3OXdQTnpzS0JEem9HaUhJWk1va3A4TWJjeHpFWG1jYUIy?=
 =?utf-8?B?cmxzd0lsUmhZU1U2YXJPdXpHVmttZDcrdGRlaGJrU0QrR2VDMVpxK3dZNC9H?=
 =?utf-8?B?ZmlKV3dTUkhzY1JTRkcxNk9WRFZLTVN1T2ZyR2tUb1Y4MldTWmdCSnVVM0dR?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d85dba-e83e-4ff4-5185-08dc442f98d4
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 14:04:00.0520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv8fYJDQKmJPEh65y0wLcNUToNzGq/KkG2aRF9PhzbBKlnUeo1MWZvz7MoWnktLGkKhXY6MYevz3+zxVtjiGrLPtwlAjgnZHeyIQAwOmsqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
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

Hi Andi,

In Mesa we've been relying on I915_CONTEXT_PARAM_GTT_SIZE so as long as 
that is adjusted by the kernel, we should be able to continue working 
without issues.

Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Thanks,

-Lionel

On 13/03/2024 21:39, Andi Shyti wrote:
> Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
> vm") has reserved an object for kernel space usage.
>
> Userspace, though, needs to know the full address range.
>
> Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index fa46d2308b0e..d76831f50106 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -982,8 +982,9 @@ static int gen8_init_rsvd(struct i915_address_space *vm)
>   
>   	vm->rsvd.vma = i915_vma_make_unshrinkable(vma);
>   	vm->rsvd.obj = obj;
> -	vm->total -= vma->node.size;
> +
>   	return 0;
> +
>   unref:
>   	i915_gem_object_put(obj);
>   	return ret;


