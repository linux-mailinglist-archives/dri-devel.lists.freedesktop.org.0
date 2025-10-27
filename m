Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F032C11F2B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 00:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFC010E1B3;
	Mon, 27 Oct 2025 23:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i316eP6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5455510E13B;
 Mon, 27 Oct 2025 23:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761606867; x=1793142867;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eM0C9wMJSpL/IoCYrf7QFXusvVjgZb66Dbl3Lv8r9L8=;
 b=i316eP6SFr54OCxt/FtoBMAJcZap43KWJwE+dPyM/+HnwrkjDsjT4BJU
 lO90gCePkMGTyZeRzFJ2XPG0QvvhgO3eD1x86ApmFJuVBnNPsWV+iwer+
 nr09pLe/zg/C5+AHHoul22pBsIY0Aa0CMS/ZHjinsLEa6NDWCgLMdcoER
 h2AYYIPXLAzHc3wvyhyODARN53Ne22zcj+0DCx0AKdSkVUtBYrw7HomIr
 S9lBIowz4u+WyOKUMvXckPLIvwybG+PULlIqbqAeurAUVP52g6IGAEQXB
 7fl3uFwgX72rD9UgHMBnWvtaqfzooUwvlYcs0VWQXM40pSiL99ZmE26cb g==;
X-CSE-ConnectionGUID: 8YzlgknkQA2kt2Q1W58T9g==
X-CSE-MsgGUID: t+iFHEcRTt2iEP67O5zB6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86327174"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="86327174"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 16:14:27 -0700
X-CSE-ConnectionGUID: KgoYlPw8RzutTQYTTluBTQ==
X-CSE-MsgGUID: oUzAVCLgQ1mv4Boe2Q72Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184361814"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 16:14:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 16:14:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 16:14:26 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 16:14:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMtYZcidfb5+dWK2AYb7X3XdXG4aAgimZYbkuRXr41AOn33owTwTaSfMBSX+9d0lB9w4VE7bdsP/yZ3jHG8bdmZWET1Shiw6uFdzCVRoYVzWGJipw8hNvqqhPdkexu+d84xbIJL8Nxc33PurqxAzu2gS0e6cYQiLhpr0yZc3wbDoMcpc4QTCy6md8SofZ8fscj1ycaJ4iz44hYwsZ103Cb7IddhcxXigh9gyhBboZB5LTjVwNnRLA9eAj8s7+d9tefbUb2RE+PXdS75mMiHeRlKBG9GYIA6QbupaDeFpgEZ+C4Q1x+ZdDlvCefRJ5GO8bwp3SNdArP/QxLifZZLD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh+HTtQzRizJMRRDVKoHTaTNMZCY8YMwUrs26fQkfSc=;
 b=bb6Bcbcj2fOfE8K7ZYI7kys9G//YbifnBxDNcMl6euF5QSfm3fPJS0lb60+s/y5yn0zNr9ZkTEgBapyqwx6ebcAZVomIQ6Wx0J/RvLqdVdZ0/TbhugPg9X2VLdBcBvTC9GW1++VDuhoCM5t8R8sauMe0K+DOsFuXmwek3B9RoGu/KzQ6amQGw9/mXtkd9XJWlR7Sjs52Qr5mTKg6c4dPdo3mS57PoS4To+nxhgCjHk0IxGaoWfRrrgyz9Yjplbk/NlydY7RoM4KgSPa310nfP3v4eMRI94/vM1V0BNgqJuNRVyOif5K9f83Ip0zvhwywB3+01mIvgTifpqQJUcx33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 23:14:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 23:14:20 +0000
Date: Mon, 27 Oct 2025 16:14:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 11/15] drm/xe: Simplify madvise_preferred_mem_loc()
Message-ID: <aP/8yIpRzcwrE+g1@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-12-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-12-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6e1490-e3f4-4ab5-2fed-08de15ae8f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e22WO4W2vUtkcwVO7cugLI1Ughl5FD5BbE7vHFUJBFbGW6iTz0c0MC2s03?=
 =?iso-8859-1?Q?tjetCeIGBhLnCUL106xvFgTzn13IkNwryvRIrN70PB2V51faZ41A5ijsX2?=
 =?iso-8859-1?Q?gkkP5Ptbs/qUAC6nQIfu+kUpR+6hAh7jhHBPRbxpdnJ8MlD/oT8qBGZi8V?=
 =?iso-8859-1?Q?JTwpyX1YIlnpp9ddJ+4cgrT2vIzwUwO3pmaJ0TsGv225ituAck5iqjqsIy?=
 =?iso-8859-1?Q?hKWsB58CF+2LVRAb/elR7pLi/jf6eb8FkCG0ofl4wGwKt9/7R6vxmsjqwP?=
 =?iso-8859-1?Q?cVpxJSZMDtRyQMznY1KT92wOyLQuuuE1WBUau+G6I63i6+E129D2VgsKSS?=
 =?iso-8859-1?Q?SJPuIR0oKPa0MB95UR+KyDp5zju+9DZg++WlSaTrhvNn/IJBueep6Wirg5?=
 =?iso-8859-1?Q?iSFkABehqxW6YfG3WMENbWd6ASAvy+LSrVVCxtuBft+09FqPdmixeGxZd2?=
 =?iso-8859-1?Q?Ikx//DvK0vvw/3St6XdFo70xbQFZm5nOv1qHoV7+JY0AmE0kQ/tf8tKWLz?=
 =?iso-8859-1?Q?dbS1zbFnVgIc6PfEwYw7/YVsvt+0FGxmKyfsU+biCeu0YLtAjqLri/h4se?=
 =?iso-8859-1?Q?/5x0rZYgRovf+1zQkC+eNPGeRHAcK153B0uwzeqp6H53aeiW+YmZvjfyb9?=
 =?iso-8859-1?Q?H6Juhsd3TD3zd4B1/407iOs8n42iTdGW9AWt/K+9SfOB8hA0UPYtdunCvk?=
 =?iso-8859-1?Q?yomokRyEzKSLzkRa1QyAc/ixaZZYzvrlXtSUeSOF5PM8Lgi/OSwQbzaqOQ?=
 =?iso-8859-1?Q?LKRr7/T9VYJnnEwceCaLyeo7BOGTrUw7Nz2hytrI+gTPs+CgbqQ22CaSkx?=
 =?iso-8859-1?Q?CBANFwEDnmGYneZeXaN6UmAk8nSK8aLVEG528uWy1jShi5ye9pKr4BrFBu?=
 =?iso-8859-1?Q?/nseRijVq5El5zSjM7kkKwZzFR+yHREHL12tAGvc5f1Zya727TNLaQGNIh?=
 =?iso-8859-1?Q?2wBmsln3A0QofbYVfc/j/G//nfb/Eq/TBQf+ft0gkOw5Nmx97UZUbZ7rGb?=
 =?iso-8859-1?Q?r9vQDKWJ9UCtrlma9Xs/leTahFihE3fGkTkWIdutl1L4cGCAV8UceAhPxn?=
 =?iso-8859-1?Q?i+2YIJWl7Y0Y7XPdkMrZg8RvR+38VEO0qVswWHR6kaAR4eLE/saUD2ViF5?=
 =?iso-8859-1?Q?j5kpTVa3tNYkpGSYz2VZqbOVuE/V7sHqBe+j6YjJyEBLgqpqiF9kGGUFJP?=
 =?iso-8859-1?Q?QSmIJvQDnce/gTMoMfZ8SGgMvHHwhTFflZbjmAcVxi5WKgKduw4DTLm3Nn?=
 =?iso-8859-1?Q?VbWYGE8y36Kf0hQSVRUQdy6u5cLTH8tbVjZK5I2AlVcedhTLNu7V31QU8j?=
 =?iso-8859-1?Q?tCGl9h/y60fvau8S8mZDd3zrywG8T+DKPtmJmsCigcZMUseb1wB3QNRWGc?=
 =?iso-8859-1?Q?bGgViOvU8NpnwvtuQaPXKp+DU0p1JHSMXO0L4e/PEHUA4q08zOhLN8ubH0?=
 =?iso-8859-1?Q?MKYwVUq89mfH/kDpRMtCueMoLa8O4Q2+tUcYrh4slUX+qO5R0CnnG4E93q?=
 =?iso-8859-1?Q?wKdyxtgC3Fcakw4k4384V1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lx/+8PDQWxX8Rho6wccSw/FzrpCSUC4HhSjRCZMiS/bQtBtq5A+/H68Kz8?=
 =?iso-8859-1?Q?giOKRybm8eqmSapkNZ8W7p8vLbC23XtaML4RZlxrTkFthRh0GAThO6p/6I?=
 =?iso-8859-1?Q?oAjQqRTGy9UHtBmqxlilexiDUq/2oSnZ8XfCF05ups8mtlFU2CkBgqm/jV?=
 =?iso-8859-1?Q?WhhX4HKulyimPLoVVrxJL1RpCtNv8MWBql8QUcN8aJlNtKxc5oPBkENyHp?=
 =?iso-8859-1?Q?1Y/ytltZ1QIRygSn0XjNoTThUSFYCAuWkoTpF9x8PPzktWy9lLyaHh0ugp?=
 =?iso-8859-1?Q?ty8cSITxOmiSSpmx+at614m/VGTJlMXnTSrJrlxi6inj/DY1hHEJCt1yxb?=
 =?iso-8859-1?Q?NIkPZlwii0K2pGLNBBFTFjb+b6H/HpfulzzIo4sceHSTRHl+s6gtTiHSVq?=
 =?iso-8859-1?Q?bmqWiRghGqM+WlmvN7gAPuY6SHodMMBkLswJ3+EJyvR1n8rR7pb6+srF/6?=
 =?iso-8859-1?Q?aG/1+PrE92+4W5XoVvZghNjRPf/qn2MGqrrQFi6bszplQddHDtMU9RnBkl?=
 =?iso-8859-1?Q?t7ZfzGJW7eg5anOGC/UeK2q/oQ640WPelMJA/eG9X3hg8fTbYSCwThV9s+?=
 =?iso-8859-1?Q?3BG/nemaVvWJ41drtLnZ3ex2Wuo0sci5TmVDW6CXiu5s/JxUckOGtVNh9H?=
 =?iso-8859-1?Q?y+BU86qPFPfbQyk74xt0VixsVaXJobRcrJt8F6PebxKf2iTRy1jrc2udnP?=
 =?iso-8859-1?Q?sHs08a2v5BRs0x2CWYbXEkLQa2jo3cJE3Y2zEjF7J8SjE4kqjTEgxUmkXY?=
 =?iso-8859-1?Q?tqKG+fY11YYEwF+eQVDmntySrx4GmAtSlvpIVP75b5+h8HJji23H0mClRq?=
 =?iso-8859-1?Q?PEwoRMnyFhR+wTevjJjQ4RGfMzDyEtJBmvJHm83PD8wfXZFLCL11skrN9t?=
 =?iso-8859-1?Q?QMi2buZiAIZH8iieDTbGdsW+6Nt9e8DWb0fPw9iPeuf69LjjUtvtLt6Azo?=
 =?iso-8859-1?Q?HtXzCbOoAYZqakj2huTE1J86+IuiNk30IVZ8c1bf34BN6lNTzb6PNH6xnf?=
 =?iso-8859-1?Q?/WMcAiL5Dz5rrtxSqYMdRpkIxFHlI2aLTw+xp88zIZsSz4owlQLoDMENCy?=
 =?iso-8859-1?Q?ndDF5PlORGri4BEV3lPxqkYQV2jHuWh8185UJC1L6qAvwodc9hKzMqDyz4?=
 =?iso-8859-1?Q?uUH2CEtDJM8w5Fq6HcMPyXk4BR5tMQNnRmN1xI42WProWDfyR4WivSUuHZ?=
 =?iso-8859-1?Q?RMsTohj5EDUSt3DpuyiDP77IW+og5h6xuwm/U94UiEomnJlXis6Aya2Tak?=
 =?iso-8859-1?Q?UkHUyt7ibLVe8IVGH3SWnq3mVyfLxxqysN/Y1rwkoIHEDheYqUArk9+A1J?=
 =?iso-8859-1?Q?hxrpuPCT6dOe2/SiLKLDj2JwQ3/N9VoZ76iZ7SSZN2zr1jFvFnuU7cbyXf?=
 =?iso-8859-1?Q?JHYkpOPc9DjPGz5DjauliHe8nMHLlVAKxm3fy5C7f1/YS9LKB9gXPjTpml?=
 =?iso-8859-1?Q?ZGySL7fJJKwkEQFiaSSwpVtvCprjHbC97SyQL6GqjcfkgAAgcjFon7vZnJ?=
 =?iso-8859-1?Q?QJQ5XSNItUBdpD7aN77o5+beglt7bQMZ7BvgL7BIg/Vtrt+GMMmAiqF9yn?=
 =?iso-8859-1?Q?CfKL3oaeur6jJE277ZO3vju/puwuZk+hacGm0eBQka6jAF7fcrAVYc5fx8?=
 =?iso-8859-1?Q?0zLCeRs+NYVawHAHj6ra4g62dbV15b2a9tTbGKYzkes1unRG+yE1F8PQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6e1490-e3f4-4ab5-2fed-08de15ae8f1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 23:14:20.4185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO44Rpvy6wYqljG/S0KgsmbcIrokZqIMAjH6r3MgwbsdjXFo/T++wN+IhiIe/HRKliYPpw4HFMLrFGeBH+o96A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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

On Sat, Oct 25, 2025 at 02:04:08PM +0200, Thomas Hellström wrote:
> Simplify madvise_preferred_mem_loc by removing repetitive patterns
> in favour of local variables.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Feel free to send a version of patch out on drm-tip, keep the RB, and
merge it as this change can go in ahead of the entire series.

Matt

> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 21 +++++++++++----------
>  drivers/gpu/drm/xe/xe_vm_types.h   |  2 +-
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 9553008409d1..d6f47c8e146d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -81,21 +81,22 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
>  
>  	for (i = 0; i < num_vmas; i++) {
> +		struct xe_vma *vma = vmas[i];
> +		struct xe_vma_preferred_loc *loc = &vma->attr.preferred_loc;
> +
>  		/*TODO: Extend attributes to bo based vmas */
> -		if ((vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
> -		     vmas[i]->attr.preferred_loc.migration_policy ==
> -		     op->preferred_mem_loc.migration_policy) ||
> -		    !xe_vma_is_cpu_addr_mirror(vmas[i])) {
> -			vmas[i]->skip_invalidation = true;
> +		if ((loc->devmem_fd == op->preferred_mem_loc.devmem_fd &&
> +		     loc->migration_policy == op->preferred_mem_loc.migration_policy) ||
> +		    !xe_vma_is_cpu_addr_mirror(vma)) {
> +			vma->skip_invalidation = true;
>  		} else {
> -			vmas[i]->skip_invalidation = false;
> -			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
> +			vma->skip_invalidation = false;
> +			loc->devmem_fd = op->preferred_mem_loc.devmem_fd;
>  			/* Till multi-device support is not added migration_policy
>  			 * is of no use and can be ignored.
>  			 */
> -			vmas[i]->attr.preferred_loc.migration_policy =
> -						op->preferred_mem_loc.migration_policy;
> -			vmas[i]->attr.preferred_loc.dpagemap = NULL;
> +			loc->migration_policy = op->preferred_mem_loc.migration_policy;
> +			loc->dpagemap = NULL;
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 5313bf2afa54..a83a0bda6861 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -56,7 +56,7 @@ struct xe_vm_pgtable_update_op;
>   */
>  struct xe_vma_mem_attr {
>  	/** @preferred_loc: perferred memory_location */
> -	struct {
> +	struct xe_vma_preferred_loc {
>  		/** @preferred_loc.migration_policy: Pages migration policy */
>  		u32 migration_policy;
>  
> -- 
> 2.51.0
> 
