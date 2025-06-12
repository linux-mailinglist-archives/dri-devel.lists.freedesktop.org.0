Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BA3AD7962
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 19:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FECD10E07E;
	Thu, 12 Jun 2025 17:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F53RMyKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEF210E0F5;
 Thu, 12 Jun 2025 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749750600; x=1781286600;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K2B7CYOXOF94NGHl4KDQl57UuD08PbHiCc8EzNxok4I=;
 b=F53RMyKMpz3D3edoCbD3GiAI2paCbphe08HcMeeADBb68rqTRJV/l/Ay
 sqJooYqTw9uFHc88vOQenHSX4pXfQuIpsUFubE/S80ZzS/bxz4H8MujmH
 bLvCSGnMu/rebP//R4vvOVyqi11wauGIU8ypy8vRe96PW9dTKO2xyumKS
 JXyNUL1PDpqW/Oym0/HmQwjySBhSbm4lrxFx5EEbDYs4pfW8ggwXLjgO2
 M8UD5CQAx6wdaL1jyQDax0FVZhCkbHilpvLhTYW4f+6papBsLbP89mlZ1
 ESav7F5n49pIH3WIwkUJwo/h2szFcshEsEdu7vzzD2lRPfPmRA9jGQpxb A==;
X-CSE-ConnectionGUID: hOhcA8xoR8WYyzN3g7SI0A==
X-CSE-MsgGUID: yGTHi+FDQKq/g3ypukJ0sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51663670"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51663670"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:50:00 -0700
X-CSE-ConnectionGUID: fhYKWbk0SHmbekdgjkP3KQ==
X-CSE-MsgGUID: 2idUTE/eTiClBKWwonRWiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152501206"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:49:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:49:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 10:49:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLrbt6wZrsR6acBGsQZ5JtJ9eakGYOfG2EbT3MjU7RdPzZO8Xy1IY+s6Ol4Y6y9dGpsF2GDHoN5qWXycSf24a2PmMRijx7b9cnTvACic/KbqXzuVLwacchlnJTAo3u7gGn4lI/aWh9wf/RSqHzhWu6NFzlGyYLiwCQnw0pqLL5WPuX+cMLneoLwFZkV5y7LFovRw/Oj2ZTXh79GrM+SvE4EUbxo2kHbFOl3KL2tvV7Nhgzk7UgcjvrDpUoGmorGBULq7EOzT/CFWXS4nAoQA966eQgg5rTvymyNKaZ5JGbk++5LCf1BMrAaa4IXjhunAbmirzXC5wakbFfNOsWhOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2B7CYOXOF94NGHl4KDQl57UuD08PbHiCc8EzNxok4I=;
 b=DMhQt1tKTiMifPM9z5N9w0L98/zc2v4eOhRMHCJkLBSQ9paMxBAvTO1VoLHn60363dvyvz1PZxo9E9SKP4V96ARg8PWBK8sYIZC27/jh4s0SLv9J2zNbp7RKvZNi9dx8WF8mFnCdRsX1LwoxKGN82F7TDtfi5ocwxLEjt8owOcOgJtMp1rrgYErjeTtxQD6T3qYN6MGTa764BVoEM4nCvycEtLJ1xBTlnAzBkUNO/YtKtsN9JrViN7wX+vnPUaI3XslWGJkI89pc7z0+l9AtcDaivIiAZHZYcyRtEaNgipcNO5D28DLONb8vwtsoi6FZao3mb+AllTA1NEQ0+xobyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 17:49:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 17:49:36 +0000
Date: Thu, 12 Jun 2025 12:49:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rob Clark
 <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, "Gustavo
 Padovan" <gustavo@padovan.org>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <amd-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v6 4/4] drm/xe: Make dma-fences compliant with the safe
 access rules
Message-ID: <lagtnrxxqzwn4akmummmuxd4msqctbzrqbht66debl7ktzgkpm@7xn5yv5ackvl>
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
 <20250610164226.10817-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250610164226.10817-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 8511696d-c341-44ed-7b73-08dda9d97ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dX2IAgyl8zMPIKC1SEmjZWQTkl+FACaIdTV/PNKT9EMUWSqARG9IienPSjQQ?=
 =?us-ascii?Q?4V6S5KL/XFMA5Qc0NNSXbxDzuAlfX5F+11Pna9FLVlLFDBP6o1NBNwy+7DDZ?=
 =?us-ascii?Q?bJFfC2AUWasp3sD4MIofUg+67bRzevXRF/TAbZ72BkVrA2KF5+9qqSIn3Ah3?=
 =?us-ascii?Q?J0eSsGKRg7jmlIR2FqZk6Yiuf734zB6crDLUD3NO9aR57W2DqMtVtuMLmc9p?=
 =?us-ascii?Q?0i2lmw02GF0VqchgWKBU3uJBiBabGmY/VkBkWqZSHQT3tqOpwPBvRE8POn6I?=
 =?us-ascii?Q?PORNmOlSdpe4N/W4XhulF9KcUqhJDaXZoVuy6EJOhaPZga848mAmFTYstPN5?=
 =?us-ascii?Q?gfAo0IBvtuKWXynbXCXZXked8ndMRrBzP8LKq+dnN+4UVwsFV6o4M+KpVMfP?=
 =?us-ascii?Q?kQP4D4cxPX1FWFSdqi0+576re//nP1vX5MyH138DuusFXFq0Wltyr55XqCyg?=
 =?us-ascii?Q?Smp8g5G/vhamceIlwcLxzsJYFLwIck8nIjWrhjBH8OAfiPzc6KHdWNS6zdMb?=
 =?us-ascii?Q?utUFjxTM2Rfpwo4bIV8QvgJy26+WrDdmqNR8rEOeBX2GeKKTtQUdYYKyAVpC?=
 =?us-ascii?Q?qB2++qHXrigjvYwSIE3lj1dkC53vEazH4cSWkvH3touZhsVR+WzuK3IRlViT?=
 =?us-ascii?Q?rnHWa0vaJ+ltDrGaE8rkEYyEmoiVOci8564MdMpKfltmRwDRaJAljoATpxNa?=
 =?us-ascii?Q?2NB9uA1YM8jyhGO7kf+zJM09crAbtsRHtKdWdv61d+k8jM8tvSktuWyULe/S?=
 =?us-ascii?Q?H94f1V71JT/npcD2MoejIM4UaP/VXy8gpxJIEMPGLhOVv0FUurJWan/PAUGU?=
 =?us-ascii?Q?srpP8LPXvfIwiLp8FBjFEgxHTSzkV50/A0z0w9W5hdxitLuR41U9c1KbFSKi?=
 =?us-ascii?Q?hgz/8Nc3ezFqKjngjXxSl9cQ6kKHnV5SpR/pqBvzJUYa5UpYK+R8mdwsmCOS?=
 =?us-ascii?Q?m7n9oP+hkNnGLrH1BkGvrVKIsHsYnghbXsby6SnnhPjtr0wX4mhSeyqpYFz1?=
 =?us-ascii?Q?iWygFxVNyrv+gIxoy/I0eTmptzAyTcG7f5Jc8IfAtOG3Mtj9OasApGxQUc7e?=
 =?us-ascii?Q?S9zsYsSI7TVL4xkNOec+s6x5svaDuhRAytqUUY0W3RCQPQa6NoeaSidg+/PD?=
 =?us-ascii?Q?UOLB5EKFqL4U8pzcZmr/GNXWjcioNGLTl95B/GItx41H7SlLNYs8S/dY/sgo?=
 =?us-ascii?Q?vWL5M+11ak56qtwt16jPYMBR5E1Lhreka6p0to8+GdBNtZ63kLP/R8CeZt08?=
 =?us-ascii?Q?/GINOYyuYxHhjaIJTD1SC7byPnvGcFaYzV2zGX3qHleNdYbv4iMNS+ewjgrN?=
 =?us-ascii?Q?60pzMaTh41ldrZS8jXPpXXpnbCmZGHwjQe26Bk2PZa0MJ+ngN55lpI/SDe13?=
 =?us-ascii?Q?FKFEHPFNIk0Vhh9Xu1QkX+oNYNUTHjLPH9miGIguFy5ACqcZu8vsumXe1rRq?=
 =?us-ascii?Q?OsxlOUbR7kU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vMjJ1RL9oCbC/wHND6D/xNVHrCwmqxm5fN1WrWbZ3nqquSkLxGXrum5QPXO8?=
 =?us-ascii?Q?feFnSPBcnUMobkFC57rvV6+HzcnoglHosXIFAqlmMSvszOVQ1nv2FqIqd1nd?=
 =?us-ascii?Q?xx39cv8Gp8qrHr+ZTQBCcdQFuwA/+HgWY9dEtceV7CIa6qZ3zGClkNMYM7K/?=
 =?us-ascii?Q?3rthjc0ojbRqlK38EMws4tjqRvAGQLSR1xb6G7uFohIBt9M8OEo/2qNI+uuj?=
 =?us-ascii?Q?zpUkpa6lqhMj5+KugPm7S92VFlJoAJIdyN9p+coJFTDYCxsYKsGfpVTgT8bG?=
 =?us-ascii?Q?tKx6XOhraBkDu14KxDqSchB1gcesV1Z0+zX2On6QjZL94Jc9DFErI39MWXF5?=
 =?us-ascii?Q?Szfe4pIsPW3xUG+ng7zXEXl3bVgYCVsY/O9GM6jhNltGa8ht5QMGjbuFX6IR?=
 =?us-ascii?Q?Srcb5WJoEz+Esu5C0OuQodiBrrzCNwLBzEFfRStlXkGarqobfCFCGkjoDEp4?=
 =?us-ascii?Q?35PWnVOl6khwCgpOKdwv7Y4XctWlQwzRo4b8fjXynK3aYcw+LRaFd+/RMok5?=
 =?us-ascii?Q?iQ5KPQysAG1m8CA7UpNxnXqeFk0fu+Vn5E76JQsU7p2ExAe0otLLFEQndyrs?=
 =?us-ascii?Q?C43xVgXfcKsazHLG1NULPCBEHCq2uYTjtq5hjXEK5akgdzJR0XtqyBy3Eb/0?=
 =?us-ascii?Q?x0OR8ccmULEe7ET30KrAlBYM1B0vocPPe7ZUbAwoqgx3q1to9MnlYJCXA8WG?=
 =?us-ascii?Q?9Owf/GkBjOCOmL+arQdV6SKloNxTML+rZHBspTaBm5UFV2q1JF/gOhRxfKnb?=
 =?us-ascii?Q?uJ+qGWvZ/Ol4ey2Fk4/70X35wMo4GoRRsGNNS3lWNOkKXAKoRJX7pDeCsZ2L?=
 =?us-ascii?Q?nOZPo2u5R3anwGtOJsxT7Kuo1YmVQzWE0VmrxlQPISXfZm66IbU2ir+yFd9H?=
 =?us-ascii?Q?6MKb/vi1QMmyadRGIrumaAgkjXuNqxlqFoN4bDuEkur/la6/BqcKCsIb5+I0?=
 =?us-ascii?Q?c3JG8dxi66FmoyU4ufV7+urvVPjwGisKg+PuPxxYAVS3MclIg8cP5C+Ub0mp?=
 =?us-ascii?Q?XKH/eYTAQoGNn67ag66nZOhewlMCElDWASrQZjOZ3jj2+uyQoJz852/1D2Hh?=
 =?us-ascii?Q?z+XcpZkV6REUFPPgvWqLbYnFcQp7B6zi1I2Hdo6R95Pj2viqA2FphAatZBoA?=
 =?us-ascii?Q?Y0LQ2/HWUkb5mLIlkrICXiTpSfWTkhbWE1JUBILD9SNfc/oJrkoNsXVFYsYe?=
 =?us-ascii?Q?1oB+oYUcHKRW2Z6yCQnuaAWoMDgctTkRXUpTp/15Xyu0hNAmqRGEcU0Ad75N?=
 =?us-ascii?Q?0IdqLZwcTmwX5pXnazPMTFeHCFGG7jfp4/+KUTMrYpl0MBgr1GCF4qMOV4FH?=
 =?us-ascii?Q?RfKne3EKJTC0ZE3I7CwhV2/Qr0HutjqXsvSudD4vp3oG/4bshNPi8yri2res?=
 =?us-ascii?Q?5SE1c3N4lOvK6uxAFdvoVDY5L/NVD8Worz59W2SCdhvx2gVWkdeKiknMJ/4U?=
 =?us-ascii?Q?cWtmHz77jq/vBBb+r3nY+I+Jx3B4hV9/i7rM3Vzcbw2JGwO8KGvT0nGcKTDM?=
 =?us-ascii?Q?ZPfkN7O5IHi17rpEcFCh59zJauQ2ZYda59A95Kn0ehVFwXjrm7esfBTA77C7?=
 =?us-ascii?Q?MwKL+ZT56Fhq6RFdyTQniS48hnXwVfjEaTGZzfs/Wiyv6pptTrNsaNej1sHE?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8511696d-c341-44ed-7b73-08dda9d97ee5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:49:35.9493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOnxrjp8RS3bb0u2rIw77HPpMOwjZGG/708uXetfR9LEQV0ufDEWkjBc9Wl8JZbLwRHzv2CocRMLI4EbtShLYEf/k7ltyLwhcx5CJ5xYde0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

On Tue, Jun 10, 2025 at 05:42:26PM +0100, Tvrtko Ursulin wrote:
>Xe can free some of the data pointed to by the dma-fences it exports. Most
>notably the timeline name can get freed if userspace closes the associated
>submit queue. At the same time the fence could have been exported to a
>third party (for example a sync_fence fd) which will then cause an use-
>after-free on subsequent access.
>
>To make this safe we need to make the driver compliant with the newly
>documented dma-fence rules. Driver has to ensure a RCU grace period
>between signalling a fence and freeing any data pointed to by said fence.
>
>For the timeline name we simply make the queue be freed via kfree_rcu and
>for the shared lock associated with multiple queues we add a RCU grace
>period before freeing the per GT structure holding the lock.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

for merging this through drm-misc tree.

Lucas De Marchi
