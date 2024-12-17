Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25FD9F59CF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 23:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F4A10E160;
	Tue, 17 Dec 2024 22:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kt2qSat1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0854E10E132;
 Tue, 17 Dec 2024 22:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734475703; x=1766011703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z0TqHu9eVePznA6HTPwd1lV8CM7hXOkzrMlUdNp5pQo=;
 b=kt2qSat1JbWBwWBjAOHl3c8BgShleL75g2m8IJv0um8/STZtFT52MwjK
 aqU1udv1CeiKCb+XB/Ssz/5Y7CZOao0unH7xSW3gdjzgxr9zyZv19fS8J
 MA7mjZw6JkOjNW5NDkZs6RYtc2/FWefzOUmrSJIZIE9BjDAVXk8soBqcQ
 EFGyMmA73382JbDdSI1R4B4uUEVw+Itl4fo7rVegvWZ92s1zqwspd9sy+
 3dMuSj98VmYfAHyCmcxMaRrAokWGl02FZao+NDYNtOkj3OwNXu2TqzMMc
 UGvaGAAyX6zFNRXAa76IINdvDfi/zOS6gs3LUokPkvL+gYGbSZkin5cgq Q==;
X-CSE-ConnectionGUID: A7uBgleLTMyEH6Jmm4Oxkg==
X-CSE-MsgGUID: Q/D5DXvqQBC/h97MYH5/1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34828462"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="34828462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:48:23 -0800
X-CSE-ConnectionGUID: wAtlnLInTd+Pr0iwkd93Uw==
X-CSE-MsgGUID: VqCpAxeORROCWJ490TQvrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102658668"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 14:48:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 14:48:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 14:48:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 14:48:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE3VbEpqzi3y/0JXPRM1O++ZwFSSWJv34mAOcpC3AJ1+YHKk15ME664EDKI7R5lq18newOsGLqQOFjukZaZiLl/MPRxYiEecRBSRaeLzNiPfu5Mq5S3QQSMU4mz0JeBnhJegp30haMJ6gHXdiWIgdR8DQH04+SPuBWsZQyTfTUx+tCxmdG0hBbpa+XcooQwkrLeskGcsxsUkUknmP85QotHr0OGe/jDftv2kJXbHpO6t7FdPYHkG8zB0pB/I1EJI2zJxf5fgEosrfBU/J4rSSBsAg6VrNkIfzGojWmS1dqej/CF/zfY87RjD/unhqyhYhnrs8m4srE6REVO/PtA3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4yFrZ/cG7ci1HprtBiAKAbVFpZ76aiHzFgrzxl2yMU=;
 b=kJxPFHSCEsBKFcUxgo5s2nor+O/5+Zo0fhcxBNGouJUhwNRbMNRCBhqfqkLh0BcFdzvnvsvsxJ9ao53jt68CWGKri54rC0AcfTzCjD2WrhEphFcABaUjxfYZ2Tj8YKAK0ERkmkryqW40+UWzz/J+LlvEhjITXeCFEz6NwfdAi1MKu76fsuv1btO20gho/mlZsvaFyp1PxygBB7aUeR+hXolrkHVBi4303ZnFJ6jEPH9TlIgBiQNVBOuaiIbHf7B4KNeamFt612EUyH1NTTvSFjGPA/K/GE8Km+AKcQOr3QN3QYAnAGXjBJkSykDwasyD/0DOTL5WIoEBCLkSyCY82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 22:48:19 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 22:48:19 +0000
Date: Tue, 17 Dec 2024 17:48:13 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Tomas
 Winkler" <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: Re: [PATCH v3 03/10] mtd: intel-dg: implement access functions
Message-ID: <Z2H_rX23gLJmJ_Nf@intel.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-4-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241119140112.790720-4-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf40f5b-d455-47cc-eee4-08dd1eece6e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0noqR0buvuuGLzbBnayWrxGdid7pBm0/gb+lJu5nuYFMeG46/1VV2s6WjimK?=
 =?us-ascii?Q?q4w3nRCo/lDOmDH/16ElutzMh+phqaM2ehTaJaVX67PEp/1Y/W9JAoVV5HFA?=
 =?us-ascii?Q?qzewp7uKt0NGrs2qnLUHxXNBTSuv0p2Lisj2O6B8bjLZGl47VXcQ2sD9oWbo?=
 =?us-ascii?Q?THAXQshOl6/v3bUDFNMOKYb3NuLvuqAkYWYp8eZz1+tYX1WEVuKS9fXpai/9?=
 =?us-ascii?Q?YM4s039BHzRE11wY35Sq+0qL0vlCV2o8ST7TZbJd953tPiKW6gGGnjH/ZIXp?=
 =?us-ascii?Q?WlBHuXvrv6frIJsAp9c3GGhFIgCN0b+KBsyKbg0oGkS4FyUUqSJTT//20oN1?=
 =?us-ascii?Q?yBEFLjGm3dkFsjA73As6iDvZAOvwesUj5TtfAjTJsIdJehBFeUrNBl2fWXf9?=
 =?us-ascii?Q?yZqn6FkX7GqWWUr0p7GoV7TGt9tcdc9vYSkLuQqyWimzaw3/AVi9aweEBGmA?=
 =?us-ascii?Q?88+Q/LkTLbA24EwsllpVNNAKASEWn9dGY8LDYyqGWJOoVScRkwspLmDu2Otl?=
 =?us-ascii?Q?UAHk2MHZpxwksR59mjRAwb656HCHZPcPmNU5cETdmAz117SBm5aRNjpXhkxg?=
 =?us-ascii?Q?1FqAWMRbPlqO+u4Hy/2uab2BrX97wSZ/TVMay75tNEKKE74PVY+0sA/PTcfE?=
 =?us-ascii?Q?Zs9oXJD/9ijbBqZ57X3b/pAmqF2zqMnuBFu4TPwJ0Af+3GNTjTPuu5fjSggJ?=
 =?us-ascii?Q?GldETkRM8M/OMgDiegwxBf9yB91x3bh8DXqH2dppM4Nrr7mQ6yT4jKddxryO?=
 =?us-ascii?Q?PNpwlFOA+qYHLQoN/8pwolB7cDJSGTQhnAKobTjPfZqHREQ7O9Nr0IdKVx54?=
 =?us-ascii?Q?nu8uVnARmnkiCEb4/c2bb7vUQZsSqSwTM6TrPpT+yZ1GQ9KP4TSfjJJNXrDP?=
 =?us-ascii?Q?Ibau0KlNjXQ3OHtdV+RxDA0Z+c5KZ4pAwFT60ErZBJ1/iRQMOqJYSM8bsSKn?=
 =?us-ascii?Q?EmIG6odmt5lRExd8dhNz4df1entKNdzSeeEeFGOkmvMJYLL0uNH7rNceJ3Oo?=
 =?us-ascii?Q?ui1YkHz69wO/x0EN/kGd2LZkCfE19nKSg4YqXrQonGha9HJYhQaiksmr2XqP?=
 =?us-ascii?Q?bxG1lKguC3IqdYrd34IXcs3gDfpuMIhAL/bGaPym7FOxucr06H0aM4BgPpnH?=
 =?us-ascii?Q?K8UW72l96vfPrcpZxLal/EcztWPywj2D/MiNXM3zxgZHeItlcEaiaZkXyz8O?=
 =?us-ascii?Q?v+b48ToqxDt2RyHVyvlseebLp/gKhTuFs+yOry4O0WzZLLqwxQBk/yqf3Rcl?=
 =?us-ascii?Q?WAKIO0SwRZj8z6c8qRPerPpHKyzPTusKp0kIs9AKX/t6331XWpeOtFxsBtEu?=
 =?us-ascii?Q?dQVE5oxhLM20pk4rKfj14nzqDBHbG4t3mkz3/+yY6dg5hPBlIK+c6RxWyVPr?=
 =?us-ascii?Q?U3Hkva+1RftKHNVMcIXvfMwbzC7Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XWWx1fFLuUdepv779/OVH6zIwwsBzbx+lUxFj2Cn0t1x/pgJKRGnZOzetZ+H?=
 =?us-ascii?Q?oM44sg8sLQJYmEtMsr01Kz6x05XdsopnF4tJ9wFpZOComoZxDu2LHsri3c+L?=
 =?us-ascii?Q?oqU7OT8ArgTvwsIriXE7AUJLkOMFRbDhAZT9meXiwa4DFdQrFysCTnYdUt3e?=
 =?us-ascii?Q?/o4bKPv33EO4fYJ2hNCcWO6JIbRgcG8wM5gQ7DZYYzouao9ozONCnzT1Waf6?=
 =?us-ascii?Q?fJtSreSEuWwdogC5kHmr5Tlp6OpuzHrOdaUF7E6s08z6Gb8R1lmIrxoZ/PfY?=
 =?us-ascii?Q?iBtLD3+G4SWy2lnCs3IbaTtBLsjqdiVQRYmN9OdhflNRH9vigbMIkRyxqbh3?=
 =?us-ascii?Q?ozOhRe2GcgFd6yq2FPfOCaUWufcL5NCeU7yumg1VCpFGVIwBPu5QuY2mFQax?=
 =?us-ascii?Q?fJsiRIJdSdmo7VMqAelTJGvY6mVjqvm5wn8EVqIQI9G1VGFjB/y3EcJvFkfQ?=
 =?us-ascii?Q?7U2fS4HTfjQ+JaLqKkhhksBqbS8LrCRLxsarok31LFHpMLG8q9P+y59e+koZ?=
 =?us-ascii?Q?hYzsR8yK6aRXVrKIRMYS6bpSI37o3PvfL+ff63suXwaNw1StAY3kik9AED8/?=
 =?us-ascii?Q?Q9C+3MWrGN7Te8crhJMOgkgEUy09E1uEo+JCF+uj87KvuftICLYKkSmc2hRb?=
 =?us-ascii?Q?sw/VBYTjMDymT0JV8tXsR+Q75DncIlj4o8sIXvu1JiMEKST4biLYabEgNIzM?=
 =?us-ascii?Q?BNr/6bpsEzSmblHYkIDCRc+JjODUXPbKbJSwIx3hA2KEmjCMFxO04Vu+SpBi?=
 =?us-ascii?Q?DgEf3OX3EH96k2PteThmhBMo+dBg/CZQboB6RasDyjeVteTB0lNn1w/qgvGH?=
 =?us-ascii?Q?fbcLaMVReh3pG+RT43T+2MxsXBtKDpRAT1kYVs0amHE4CQYYr+tTKRhIpVlv?=
 =?us-ascii?Q?gvC2ml32FaVIOgpoFb6LQandr7EMz/SmzWmRyLZ4nnUGI4KkpuOeHih9EcV5?=
 =?us-ascii?Q?w4Ya/NbxZFrDGUXfkdhq3mwyIyXaCUl5Rm4Ig8TOkbZ9IfW2Ze/9I5/zlLwr?=
 =?us-ascii?Q?jwY8KUFQ1+r0ZQkVx91dR53RTYOm0PEEE60u7nc5s+TbzTvddPPdnECEsKKI?=
 =?us-ascii?Q?fmarZdxAEG3NFg7+phg6nvRx8lEXf8fUpw/2d+uib1Q3NkeY3NpWzijViqo8?=
 =?us-ascii?Q?T+JDpp1ZMRPmkf94kLsLR1MnSlFTkcRSqC1BrqWsJJrf6A4qyAPfYXJWb7Fu?=
 =?us-ascii?Q?zK0rf3yF/iWsbcRQY31isdiyS2PZ0qUfTkL7V7vzR3423Q63Gt5FaDSsVqzy?=
 =?us-ascii?Q?a+koY1y5waTuRDTZZPuiSqq22wmJZjUGBEf21pF5yU7kNYb62G8D3IWPcwZz?=
 =?us-ascii?Q?63IPsTlDhFsPf2Eljoewo30i3F/De9o8J3UjY0rmYkHexbhzfuYWAeHKIqz2?=
 =?us-ascii?Q?svmmuJLWL4A3vLflyoPKYbBvcHRmH+oKs8PsRG26JuwKdCOYHLCdaiHw0iNi?=
 =?us-ascii?Q?slzepzFiXOpIGWY6yAdN1IJveFCGSA63A+oZPB4Qfg1e7GxohWctzUDqE1nO?=
 =?us-ascii?Q?IMPVDa8tHLX09iG8MqWALVLV2Ksw6/t9xIr4NGWc7eeALyUoWAXtcn3kIhLU?=
 =?us-ascii?Q?cZAABrwj/vBKeoeuFnph3MTNv6IeCW9nfQTGmiFPU6lpfGSJISY+98H4Kya4?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf40f5b-d455-47cc-eee4-08dd1eece6e2
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 22:48:19.3419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqbtlulfVXo4BSj3uamAVG1xmMBpoXF4gIE8xitYvrGyyS9mWiDNVnQP+ZEbRn3t+kPhMmCOQ9kuGDoqZfpHxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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

On Tue, Nov 19, 2024 at 04:01:05PM +0200, Alexander Usyskin wrote:
> Implement read(), erase() and write() functions.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Co-developed-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Vitaly Lubart <lubvital@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd-intel-dg.c | 197 +++++++++++++++++++++++++++++
>  1 file changed, 197 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> index 05e333771be0..915b9750ca62 100644
> --- a/drivers/mtd/devices/mtd-intel-dg.c
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -5,13 +5,16 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/intel_dg_nvm_aux.h>
>  #include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
> +#include <linux/sizes.h>
>  #include <linux/types.h>
>  
>  struct intel_dg_nvm {
> @@ -91,6 +94,33 @@ static inline u32 idg_nvm_read32(struct intel_dg_nvm *nvm, u32 address)
>  	return ioread32(base + NVM_TRIGGER_REG);
>  }
>  
> +static inline u64 idg_nvm_read64(struct intel_dg_nvm *nvm, u32 address)
> +{
> +	void __iomem *base = nvm->base;
> +
> +	iowrite32(address, base + NVM_ADDRESS_REG);
> +
> +	return readq(base + NVM_TRIGGER_REG);
> +}
> +
> +static void idg_nvm_write32(struct intel_dg_nvm *nvm, u32 address, u32 data)
> +{
> +	void __iomem *base = nvm->base;
> +
> +	iowrite32(address, base + NVM_ADDRESS_REG);
> +
> +	iowrite32(data, base + NVM_TRIGGER_REG);
> +}
> +
> +static void idg_nvm_write64(struct intel_dg_nvm *nvm, u32 address, u64 data)
> +{
> +	void __iomem *base = nvm->base;
> +
> +	iowrite32(address, base + NVM_ADDRESS_REG);
> +
> +	writeq(data, base + NVM_TRIGGER_REG);
> +}
> +
>  static int idg_nvm_get_access_map(struct intel_dg_nvm *nvm, u32 *access_map)
>  {
>  	u32 flmap1;
> @@ -147,6 +177,173 @@ static int idg_nvm_is_valid(struct intel_dg_nvm *nvm)
>  	return 0;
>  }
>  
> +__maybe_unused
> +static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm, loff_t from)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nvm->nregions; i++) {
> +		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) > from &&
> +		    nvm->regions[i].offset <= from &&
> +		    nvm->regions[i].size != 0)
> +			break;
> +	}
> +
> +	return i;
> +}
> +
> +static ssize_t idg_nvm_rewrite_partial(struct intel_dg_nvm *nvm, loff_t to,
> +				       loff_t offset, size_t len, const u32 *newdata)
> +{
> +	u32 data = idg_nvm_read32(nvm, to);
> +
> +	if (idg_nvm_error(nvm))
> +		return -EIO;
> +
> +	memcpy((u8 *)&data + offset, newdata, len);

I'm a bit concerned with the usage of len here without any check...

> +
> +	idg_nvm_write32(nvm, to, data);
> +	if (idg_nvm_error(nvm))
> +		return -EIO;
> +
> +	return len;
> +}
> +
> +__maybe_unused
> +static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
> +			 loff_t to, size_t len, const unsigned char *buf)
> +{
> +	size_t i;
> +	size_t len8;
> +	size_t len4;
> +	size_t to4;
> +	size_t to_shift;
> +	size_t len_s = len;
> +	ssize_t ret;
> +
> +	idg_nvm_set_region_id(nvm, region);
> +
> +	to4 = ALIGN_DOWN(to, sizeof(u32));
> +	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
> +	if (to - to4) {

As well the 'to'...

I was even trying to review all 3 patches together, 3, 4, and 5,
but there's too much indirection on those values and no checks
in any place...


> +		ret = idg_nvm_rewrite_partial(nvm, to4, to - to4, to_shift, (uint32_t *)&buf[0]);
> +		if (ret < 0)
> +			return ret;
> +
> +		buf += to_shift;
> +		to += to_shift;
> +		len_s -= to_shift;
> +	}
> +
> +	len8 = ALIGN_DOWN(len_s, sizeof(u64));
> +	for (i = 0; i < len8; i += sizeof(u64)) {
> +		u64 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u64));
> +		idg_nvm_write64(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +	}
> +
> +	len4 = len_s - len8;
> +	if (len4 >= sizeof(u32)) {
> +		u32 data;
> +
> +		memcpy(&data, &buf[i], sizeof(u32));
> +		idg_nvm_write32(nvm, to + i, data);
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		i += sizeof(u32);
> +		len4 -= sizeof(u32);
> +	}
> +
> +	if (len4 > 0) {
> +		ret = idg_nvm_rewrite_partial(nvm, to + i, 0, len4, (uint32_t *)&buf[i]);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return len;
> +}
> +
> +__maybe_unused
> +static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
> +			loff_t from, size_t len, unsigned char *buf)
> +{
> +	size_t i;
> +	size_t len8;
> +	size_t len4;
> +	size_t from4;
> +	size_t from_shift;
> +	size_t len_s = len;
> +
> +	idg_nvm_set_region_id(nvm, region);
> +
> +	from4 = ALIGN_DOWN(from, sizeof(u32));
> +	from_shift = min(sizeof(u32) - ((size_t)from - from4), len);
> +
> +	if (from - from4) {
> +		u32 data = idg_nvm_read32(nvm, from4);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[0], (u8 *)&data + (from - from4), from_shift);
> +		len_s -= from_shift;
> +		buf += from_shift;
> +		from += from_shift;
> +	}
> +
> +	len8 = ALIGN_DOWN(len_s, sizeof(u64));
> +	for (i = 0; i < len8; i += sizeof(u64)) {
> +		u64 data = idg_nvm_read64(nvm, from + i);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +
> +		memcpy(&buf[i], &data, sizeof(data));
> +	}
> +
> +	len4 = len_s - len8;
> +	if (len4 >= sizeof(u32)) {
> +		u32 data = idg_nvm_read32(nvm, from + i);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[i], &data, sizeof(data));
> +		i += sizeof(u32);
> +		len4 -= sizeof(u32);
> +	}
> +
> +	if (len4 > 0) {
> +		u32 data = idg_nvm_read32(nvm, from + i);
> +
> +		if (idg_nvm_error(nvm))
> +			return -EIO;
> +		memcpy(&buf[i], &data, len4);
> +	}
> +
> +	return len;
> +}
> +
> +__maybe_unused
> +static ssize_t
> +idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64 *fail_addr)
> +{
> +	u64 i;
> +	const u32 block = 0x10;
> +	void __iomem *base = nvm->base;
> +
> +	for (i = 0; i < len; i += SZ_4K) {
> +		iowrite32(from + i, base + NVM_ADDRESS_REG);
> +		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
> +		/* Since the writes are via sguint
> +		 * we cannot do back to back erases.
> +		 */
> +		msleep(50);
> +	}
> +	return len;
> +}
> +
>  static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device)
>  {
>  	int ret;
> -- 
> 2.43.0
> 
