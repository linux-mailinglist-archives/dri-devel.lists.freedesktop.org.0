Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E687063D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A351122C6;
	Mon,  4 Mar 2024 15:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBzJmiwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C669B1122C5;
 Mon,  4 Mar 2024 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709567563; x=1741103563;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MESy6p+nNWkZHpdTSBwquJZwq3aNE45YOxxi1/QOwl0=;
 b=hBzJmiwokVa+l5zDHYcayumsFUI5pDIfn1HE5AQhPTqDAboHIWIemA6f
 1948I23/8GOdyWqYCGHgwE+TU+Q0Z7geJg5SYu+8fbHebJNK9MHK92VNu
 PJyFOEuoyiPWKlGzFr/4nY9OxBzxowmfstQ4n5ZFPjiRBeEY6aL1JNU9p
 vjm2lTBSTMeEFDTJepe31vNelsIKx0dsIsw8grgOlYbAc2vDSGVhOhPSG
 VrDgAeTiE2gSkgDIk4kXvox4dDO088VDt9SYrTHgsPe/xZsMptc5lbkap
 pYKYlyjNZHDsrSSga4KTFAIErsBWRiic4REZkXSlx7HSv4OO3lJNGyW95 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4230389"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4230389"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="39887570"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 07:52:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 07:52:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 07:52:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 07:52:40 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 07:52:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZ7ZFe9FIIHrm2xBYoW3Ah3MJTFTREOf/O0MU3RgsvNJpzaM540ynth18F02+cNZVu5oZdmvxBWCbIbFgou5iufJexOrm0cggrTflZgCM64egNTOfb0M+BkKlbPa0y09u87k4fytVuSfGveQ15xCLa3Dne69Lsz9ZOecx3O4tXXCayMDIC9F61MLhIQwI7Mf7PKtvztV4ocBLIyZXT6QUB4wkzZgEwI00cdIrFLuEYHpangvQdy0zBAZwUSzs2VWjUZcNxIIkxYyhXZJIzBJcJMI3un0TIDT41G64Y/0APphS5fLlVbftH65DGPV0J/7Er2/3ATM45pEYOJT/ABcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PNU/TTrBoTodmxRmJXz+sv3LejvEG2WkC/LDPkuNBQ=;
 b=RVo393fPkAChcSaSoxBF1GcgV+S9J63dTwzQ9Rg9Kbp6yVX5hV8MsFyJn2nhXzEcf1A5rr4N1Mg0IkuLM3E7Swlc64/92mrLmb8u22/yoSoWzRQHOSLKuCWFqGEjuDHWL6WNNZqgyFuXvrigNM8YPzRAHSg9lL5uaN/zIVuJay5NAlZo5d5ZEi5pdSXMirlii1+qNsGZ91wEGTj2DDdVnaUAwSa3CweNPRTOB3IIZpW0k2gTchJXyct3A5s2t3wEvhC8Doqz3sk1gT9ssiiuHWLCmeI1VZ76li4977IZfExJZuaBaq4lvTmjgAyBENeEvZmgqYNzjT4nyKD21IBSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 15:52:38 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 15:52:38 +0000
Message-ID: <60140ae5-f52a-498b-9719-027884748259@intel.com>
Date: Mon, 4 Mar 2024 16:52:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/i915/vma: Fix UAF on destroy against retire
 race
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
References: <20240301073225.121634-5-janusz.krzysztofik@linux.intel.com>
 <20240301073225.121634-6-janusz.krzysztofik@linux.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240301073225.121634-6-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: e7174d86-c9da-42f0-4778-08dc3c631ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFsAjVvstWjshigfBipuj/FWtz3KAgoMfmniHUzIl8UKBySA85z6bygLIiNwUF9bXGvnRicX8CSsUoKky5tiG2ZZ+uezWkeJDDbSOh81nLr03/fAFDjLbppl6QwslSVY1cjQQxjGZpx3yiHKbRq6PegzeKvCEsu1Bjz8lPb5fhV1u/tSVNL3PUeM2PO7lcg/TIl5Sy35KgY2BlI50o5dXFTd9EDCBvlcQNE+WS8c1ApjKaLkixu1HlAtgKk7r0Wq1CIe5WU0+5uN1R9KHBIe6JXhtuICXjvVWTVPAVsfhXJX6i3Aiuqm6PvXHtmwN0sleN0gkC28445iXCgy/9xfTUALTerp7O6Cc66uOha5CXEI/Axs/8AshLAbRSYcOrd9Trp4ixs1KdGtbL0BBVAlkHsxHGLlbX3TxiYvYTN6VR/5U39+zByT0kV4dDdvDnFFsHIx1roUq4F2PXRCWpIZdSsR8SjbWX7HKkF+3om3e6Z7Lh9eWMxZ58qECytQFqejj5Yl4FDCZYM2CGj36JL/rESBpngBzYjd1gVyqpbZaABbMIIyNux4A1f3MVZPs7Q/NTPuMBreKXhXELdVYe7gyCJYEvzYg/2JynEFIIW3FQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VklkbTJBTEo1NXlSRlMrM1YzTHVIOTd3b1ZhRExyaWdEYmlqRFBqeEFrWWpp?=
 =?utf-8?B?cWF0aVpEUWZiZi9FaTVqV2xXdUkvRlhRb3hOK05WaGJMMUtKV3ZnTFoweXRH?=
 =?utf-8?B?NXIzRldFTDdieHN4Y3lTdUZIK0tMd0lDaXQ0c0hNY0hqb2N5azJUVThheXJQ?=
 =?utf-8?B?QUVZcVZmUlVYMEtEdUZZb3haK0xpb3hKcDYvblNybUY3WHhVSTBNVWpubzBi?=
 =?utf-8?B?M0N4ZkcwWFd2RFNSa0V3aEN3UmthSmRNbVRsTVpYS3oyZGQzR1NjY0lGRlcz?=
 =?utf-8?B?b3dnNXZzdEUrMmE4TE1PZzBtOWlSc2RERnJNNmhwOG45L2R3THBybDkwenZI?=
 =?utf-8?B?OW5ML1hxNFYvcUxJK2FnRVRHNzNYMlUyYmpJSHVFK3BwZTc4MEZuMEZrUVZr?=
 =?utf-8?B?UDhWaTBvdTZUZnAwLzVNUGJHaG1xbDlWMFNjbUl0R2djTXFaOG5tOGpPeVE1?=
 =?utf-8?B?dm5jbGRTMDZWYkMxZWQ2eXRMVWExV1k4WnRLZ1hqY29xK29WWEgzN0tYQ2tG?=
 =?utf-8?B?Njhzb3lMVmhNZUlaVDVoMjgwVHdBS2s0T0hiemNFc0NQRElSbnNJRnJZK0tn?=
 =?utf-8?B?VmJDWFZ2MGZETGEvZ3dFZmJMb25TU29nOWsrcmMzVWxYalMwNHNFayt3RlRR?=
 =?utf-8?B?cGN6QytaWHRka01aOUFRa1BYR1hVbmFBT3pkZ00rYWU0akVzam1zaWlrS3FY?=
 =?utf-8?B?UkNvR09WT00zYUt2SHVWUmM1K3BHWkNpYmtIN2pyVHZMNS91b3ZvaTBIMjRD?=
 =?utf-8?B?enR1dDBTSnhSbDFrS1l5RkJIdnQwUUNobDFQZ2xBY25uM29LQnpMaFpWZ1ZG?=
 =?utf-8?B?SmlLS3RrMFVZdjVjdWEwSGpUQlY5YlhBS3I5VXVHcWVKS2NmVlVHUzhkdEll?=
 =?utf-8?B?K2tqZThGSkd6cmhvakVoSGJwc210YmtLZUVwTkNDNVJaM2dFdVdqdHRUaUxm?=
 =?utf-8?B?M1V1U05Kc3NYQUdXT1Fzc0NReC9rZHMrbHZkTWxLWnBpWklpVTlUVHoyVkU3?=
 =?utf-8?B?ZlY2NGR6N1dWa25kcXJPNzFjMTgxdzZtWVNkeTYvd21DMjcrY0lVY04vVmJB?=
 =?utf-8?B?OGIzdWdPU2M5ay9BalNHcHlQeHJlNVJnaVRmQVdSY2VkNmd6OGlJS0VVb2Vp?=
 =?utf-8?B?Q1lvY1Z3OFlaT0RCcW0zZmFSVlZFbFVQY1NiZUN5TXRIZ3Nrc1dGYVJJVzEx?=
 =?utf-8?B?ZGgwbkllclY2cGdjMkY5UjFhU3lCQVpmTUwxL0pLcmhFT2NTZVFCbDRJeTM1?=
 =?utf-8?B?R2Y4aitGVlZzQkkrTlZib0ladm81T1g5aGFCWll6S2taQ0NKdHJWZVBwODFR?=
 =?utf-8?B?ZXgvc2hWN0NPbmtEWXQ4c2pSVnlOUHhsVzhzTTJWSTd4Yk9odEVleEJzZFd1?=
 =?utf-8?B?cENsTTdNeGZZNUtSRnNyRzBrZXJTUklWU0ZLZDhnOG9WK21PeWdqcUpuaGpP?=
 =?utf-8?B?Y3cyWlh5VjY3NFN3QUhDbnpSQStLWUZzUU0vWDkzTVpoMFVpeE5FNEFrV3lP?=
 =?utf-8?B?c1BrVVYrVWsvLzFGWGI1VjdocXhKN2JMTCswZkJjN3FiYkpYanZ2Ny9tMUpH?=
 =?utf-8?B?OW56ZURrdmpMUWloT2pIc2RReUgwdkdlU2hCL3h0UTRRcWlLNkpiRzROdFFy?=
 =?utf-8?B?RWlZYVhwWGJ1QUhsTkgzM29nSUtmNFA4N25TSTVLWVBRZmlNS3FLYzVwbGxo?=
 =?utf-8?B?bUc4Q2pYN2dnb2R6c0RmL0t3QjVoR1U0blVTN014UGJ4enVXTjNjeVM1QnY2?=
 =?utf-8?B?dUpXUExhK2FKYkxQSElCUFRHdm9UYXBCR1V6ZDIwY1ZXbXZrZkJIM0h0N2lz?=
 =?utf-8?B?cmpvTXRIOVdvcEtiZjNvTG5kV0NSNnlRM0JCL3VSMXFyNnRUa1E3TktDZ2Zy?=
 =?utf-8?B?YldrcHNDdGxmNjNBWU00RG13ZFM5RjhuQ3ZIWWozcCt1WWhvMzZjQzlsbnZV?=
 =?utf-8?B?b0ZoOFhVdGlCc01adUZsNTB3N3BWMGluU2tMTnFXR2VtdGQvVFIySWRPVFRL?=
 =?utf-8?B?MkdtaWFtREJ6d2c5NGZ3TnphbkhldDJOd2htQmVDYkJxNm5XcU1DNjJvbkEy?=
 =?utf-8?B?VXF2Q0JOU2NiV0p6SzNXbWF1eW5KcTFoeitEZ1FBa0RYRGNrR0ViYUFBU09P?=
 =?utf-8?Q?o1NFDWLkzZUHtEREim6mJZgCK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7174d86-c9da-42f0-4778-08dc3c631ddc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 15:52:38.3030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlOqDdFYTyZqalCxjYyKBwhmuY8wt/kWIOVP8zezl9wWYfsF8d24rKMrJhS6ZZrOboWy67MAgvU8F20IL5s1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
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


On 3/1/2024 8:29 AM, Janusz Krzysztofik wrote:
> Object debugging tools were sporadically reporting illegal attempts to
> free a still active i915 VMA object when parking a GT believed to be idle.
>
> [161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
> [161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_print_object+0x80/0xb0
> ...
> [161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-CI_DRM_13375-g003f860e5577+ #1
> [161.360314] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
> [161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
> [161.360592] RIP: 0010:debug_print_object+0x80/0xb0
> ...
> [161.361347] debug_object_free+0xeb/0x110
> [161.361362] i915_active_fini+0x14/0x130 [i915]
> [161.361866] release_references+0xfe/0x1f0 [i915]
> [161.362543] i915_vma_parked+0x1db/0x380 [i915]
> [161.363129] __gt_park+0x121/0x230 [i915]
> [161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]
>
> That has been tracked down to be happening when another thread is
> deactivating the VMA inside __active_retire() helper, after the VMA's
> active counter has been already decremented to 0, but before deactivation
> of the VMA's object is reported to the object debugging tool.
>
> We could prevent from that race by serializing i915_active_fini() with
> __active_retire() via ref->tree_lock, but that wouldn't stop the VMA from
> being used, e.g. from __i915_vma_retire() called at the end of
> __active_retire(), after that VMA has been already freed by a concurrent
> i915_vma_destroy() on return from the i915_active_fini().  Then, we should
> rather fix the issue at the VMA level, not in i915_active.
>
> Since __i915_vma_parked() is called from __gt_park() on last put of the
> GT's wakeref, the issue could be addressed by holding the GT wakeref long
> enough for __active_retire() to complete before that wakeref is released
> and the GT parked.
>
> I believe the issue was introduced by commit d93939730347 ("drm/i915:
> Remove the vma refcount") which moved a call to i915_active_fini() from
> a dropped i915_vma_release(), called on last put of the removed VMA kref,
> to i915_vma_parked() processing path called on last put of a GT wakeref.
> However, its visibility to the object debugging tool was suppressed by a
> bug in i915_active that was fixed two weeks later with commit e92eb246feb9
> ("drm/i915/active: Fix missing debug object activation").
>
> A VMA associated with a request doesn't acquire a GT wakeref by itself.
> Instead, it depends on a wakeref held directly by the request's active
> intel_context for a GT associated with its VM, and indirectly on that
> intel_context's engine wakeref if the engine belongs to the same GT as the
> VMA's VM.  Those wakerefs are released asynchronously to VMA deactivation.
>
> Fix the issue by getting a wakeref for the VMA's GT when activating it,
> and putting that wakeref only after the VMA is deactivated.  However,
> exclude global GTT from that processing path, otherwise the GPU never goes
> idle.  Since __i915_vma_retire() may be called from atomic contexts, use
> async variant of wakeref put.  Also, to avoid circular locking dependency,
> take care of acquiring the wakeref before VM mutex when both are needed.
>
> v6: Since __i915_vma_active/retire() callbacks are not serialized, storing
>      a wakeref tracking handle inside struct i915_vma is not safe, and
>      there is no other good place for that.  Use untracked variants of
>      intel_gt_pm_get/put_async().
> v5: Replace "tile" with "GT" across commit description (Rodrigo),
>    - avoid mentioning multi-GT case in commit description (Rodrigo),
>    - explain why we need to take a temporary wakeref unconditionally inside
>      i915_vma_pin_ww() (Rodrigo).
> v4: Refresh on top of commit 5e4e06e4087e ("drm/i915: Track gt pm
>      wakerefs") (Andi),
>    - for more easy backporting, split out removal of former insufficient
>      workarounds and move them to separate patches (Nirmoy).
>    - clean up commit message and description a bit.
> v3: Identify root cause more precisely, and a commit to blame,
>    - identify and drop former workarounds,
>    - update commit message and description.
> v2: Get the wakeref before VM mutex to avoid circular locking dependency,
>    - drop questionable Fixes: tag.
>
> Fixes: d93939730347 ("drm/i915: Remove the vma refcount")
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: stable@vger.kernel.org # v5.19+
> ---
>   drivers/gpu/drm/i915/i915_vma.c | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index d09aad34ba37f..ffe81fe338f7e 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -34,6 +34,7 @@
>   #include "gt/intel_engine.h"
>   #include "gt/intel_engine_heartbeat.h"
>   #include "gt/intel_gt.h"
> +#include "gt/intel_gt_pm.h"
>   #include "gt/intel_gt_requests.h"
>   #include "gt/intel_tlb.h"
>   
> @@ -103,12 +104,25 @@ static inline struct i915_vma *active_to_vma(struct i915_active *ref)
>   
>   static int __i915_vma_active(struct i915_active *ref)
>   {
> -	return i915_vma_tryget(active_to_vma(ref)) ? 0 : -ENOENT;
> +	struct i915_vma *vma = active_to_vma(ref);
> +
> +	if (!i915_vma_tryget(vma))
> +		return -ENOENT;
> +
> +	if (!i915_vma_is_ggtt(vma))
> +		intel_gt_pm_get_untracked(vma->vm->gt);
Please add the v6 comment here as well, otherwise this series is:

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> +
> +	return 0;
>   }
>   
>   static void __i915_vma_retire(struct i915_active *ref)
>   {
> -	i915_vma_put(active_to_vma(ref));
> +	struct i915_vma *vma = active_to_vma(ref);
> +
> +	if (!i915_vma_is_ggtt(vma))
> +		intel_gt_pm_put_async_untracked(vma->vm->gt);
> +
> +	i915_vma_put(vma);
>   }
>   
>   static struct i915_vma *
> @@ -1404,7 +1418,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	struct i915_vma_work *work = NULL;
>   	struct dma_fence *moving = NULL;
>   	struct i915_vma_resource *vma_res = NULL;
> -	intel_wakeref_t wakeref = 0;
> +	intel_wakeref_t wakeref;
>   	unsigned int bound;
>   	int err;
>   
> @@ -1424,8 +1438,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	if (err)
>   		return err;
>   
> -	if (flags & PIN_GLOBAL)
> -		wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
> +	wakeref = intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>   
>   	if (flags & vma->vm->bind_async_flags) {
>   		/* lock VM */
> @@ -1561,8 +1574,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	if (work)
>   		dma_fence_work_commit_imm(&work->base);
>   err_rpm:
> -	if (wakeref)
> -		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
> +	intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>   
>   	if (moving)
>   		dma_fence_put(moving);
