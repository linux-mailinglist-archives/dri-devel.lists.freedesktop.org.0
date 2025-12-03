Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E5C9D9E4
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 04:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE59C10E702;
	Wed,  3 Dec 2025 03:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtJDxfwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4840A10E035;
 Wed,  3 Dec 2025 03:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764731621; x=1796267621;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qkjOvwYhs/9lvLqRXjqdmQM6swOUbZ6zBLH4C5VbGnY=;
 b=CtJDxfwoHuy9nUgHiBiI4/hyu2mGkhVyIGaF/wAdavo2IcSQmNNVsxsX
 4wT+8LQurOnij6moPmzO+umIBnn3heDiVMDrtGv0brirQWE3E/5Ca7wpf
 Og2c7fmea1UWUsk0Nm5RdES4Fy1tW2SJgv2lLYkeDpIY0ebmrjokdywLt
 0Adg5X1O2LQ3SWo9MHHzP4IrKIgo91htaHs26OIBZBAHpeRLggEOIRiTX
 Lv3HiE86IFoFpPqbR1DnU07/cUaEdNeO+DvWDygtAHZFrjLhV4gD+6b4/
 f3uV5cI8gfcf+FEyUQvYURObOfek7j3XUjQJzBxD6VZQ/KFhxoJ1TWqWI A==;
X-CSE-ConnectionGUID: ZfbAwSGZRlemYLbJGkWRyQ==
X-CSE-MsgGUID: 9SfCo4PQRHiF0pVt5/BZeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69310213"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="69310213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:13:41 -0800
X-CSE-ConnectionGUID: Y+dsPMKcQC6gVZ4N/sfWOw==
X-CSE-MsgGUID: hkk/j+jMQoW9ulf0bP4cvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="231890612"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:13:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:13:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 19:13:39 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 19:13:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfRuTPLkc4wSqWSgCIuccKMJglQyvMz6Dwa0YymsuBAOHNoB0DZ6AdeEKAWqlO9RjcpSTgsbBTdey3WMfP+R1ZRKWvvqKnMm3gdPjLSnKzJXKHrmpX36Utyqeuak09PzT9oXLPgECuLbIVCNjQR4HrfWRfcFyuK88a0FFWYN2ytPqyxFTm6lQXRg5cmYe5k69/GZT46B3hCCfoi8ZDB1pvUOD/DURcGb8j3RSZHHeaz5Ut+d9gS+EDoGGye1sJ3+481N79wvjqt0TThhiryzPR8Y99SK+9qecLFo4pDgnZOKdSq+ho7z5VGhnpm5AmDZO7dtocCeDYcUvHtWS/CaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99Kq4OwA0SW5ctd6C7X6DJR8kMWP+PuZNz5Yzqgquhs=;
 b=bmnzm73SZlzh+K1iiH1fhuc0YpDJp4M0KsOQ0j/i3YFixOG6VoTaWUtL3Qba2PjttekZxdoNVm1TRAS4zdwyoA+QuRFqEfeJSZfl0078ZVoifPYqDJ0xDQQCylNCtvceQMfphNZmmo0Xthhi2ehZ0s+o6F8T/0Vk7LYmEcYhVt1lAYziqmJKO6LjE+onW1HNqDTJ4RlDO5ITpV5je8vN8AxaBWvZeOmozh3GrIDgw3W+NzUSI3MpkSGdCglly/I5AsEsFkgWOybmmIPhUXrbz8OqPOR81UHEk+0eMXScw7oPQGmOTv/gapV2f37i/H6ie7zUiY41+lReQaGRPj/Oxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 03:13:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 03:13:37 +0000
Date: Tue, 2 Dec 2025 19:13:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v30 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Message-ID: <aS+q3meOxp4wrL3Q@lstrano-desk.jf.intel.com>
References: <20251202221221.106060-7-jonathan.cavitt@intel.com>
 <20251202221221.106060-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202221221.106060-9-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ddd2ba-0f60-4bdb-acd0-08de3219f363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1l0vZowgCZ0iI0B6Q6hofHhNlspAJ5eUBCoJWddivfa2IvVJXBKErw4C7/s+?=
 =?us-ascii?Q?V4Jm9u5fTMULm0JK5pARiYrKE3Cz+swKOrMpZ8V90+HJd36fRM5gLYVcEgtu?=
 =?us-ascii?Q?Kywej/oz2OCcvO6jIKFHVxtYHNEBhztU9XR48XT8ZxImrjp8+nn7ceQn3aRz?=
 =?us-ascii?Q?A188WteJxS0OgVSf3oJKnDH5q+eSuw9nOrJHv+N1YvwaRc/vCUJsRAPfplsC?=
 =?us-ascii?Q?jaeVlManBowU0D1EegzRYF6vCLi/TsbtpiSDUsrtcUcNFdyV3Accq3Eeh2Rk?=
 =?us-ascii?Q?q0m5uBnkCAbEtU89NuvBQNczBz8kisgkrVUG5HXK3bXCVRC5UeLAdBxXXHod?=
 =?us-ascii?Q?upjyuwj/207fppY+X6qUG3o1ovES9EjAJsYkJkg4wV1YwCDFjPDgS/IekhRU?=
 =?us-ascii?Q?pToQgc4ceszvrnVxVM07SGb+t2zuSuo9ZyRIvKXCwrClAvFH0sWpPuWhZdTV?=
 =?us-ascii?Q?PznHmc+k/qEjISFMAnGtPgTp0RPlsuKVl5jUoXA65HXpIAmob1/dXMkC5z1f?=
 =?us-ascii?Q?wBubE7sk9Zioj78+YjlQ2vY/glINQrKlMVJfqRsxty7iGGR43y3ttCsEBRoB?=
 =?us-ascii?Q?fP10UO/5jGtE8WJ+Fe5g633N/3GE6QCRiOPRSQxUC2z+ZO2ZjvGP8weLuNY2?=
 =?us-ascii?Q?1yBNWQXQeJFNqJMCO+MoBJpfq+7X3DRyXZE9Jm8FPx5/Iw/jNufhVDlfpFq2?=
 =?us-ascii?Q?HJc1jiwd2w2rOx5dVsBVBPcsD6U9RxP2FxLvcbIs1Q4kU4F5RTRG/NlTj7BM?=
 =?us-ascii?Q?o26TT2wW/0chFWyVUImJvG8V1Ul8sg9eExp/AGSXMlg+CEsCoEV1sDJTuA/R?=
 =?us-ascii?Q?KpFFAKCJTvZlVBiLu7rZknXkN7GnTTT37o7NVe/3i9oqojoz2Pd3iD5FdiB8?=
 =?us-ascii?Q?mC7FyCbKMAviKnChSttvgzDzKEjU+cJOqAbiGSgfENffkgosDfkVXtCyLzzk?=
 =?us-ascii?Q?HaSJA/NMS+AV/nkNoSCRr8oi6CbvRwgToudX6f2z4Xf3q7xcn+9ApLQBGw0c?=
 =?us-ascii?Q?Ogtd5ltpuhoFN8kev37hHejCgvZEMENfkchee8/3l/lB9DCtOC9UbH2GPMEn?=
 =?us-ascii?Q?YprQaLLrx5g4POyDuVKzphjN4H0SJ9/775PA6amvhAl2bQUTsYepiS05YcrC?=
 =?us-ascii?Q?I7aYyyD6j83AY9nxsFg2aNfGfTV6JNutEpZL5D4iUuUiNSq48KX9UkeAbTZT?=
 =?us-ascii?Q?ABLzXp8qK31kK9jfyswoqld1b8EzX0L1Gsqwo4SXTe04s1D7nM2HalDx2/UK?=
 =?us-ascii?Q?Ywo7JoVCjst4v+EPLstpWK5dUjMg7D9lwxOt/5WMgrCR2YwiLnPsOXx4vzzJ?=
 =?us-ascii?Q?kXUkvoJNS2a8/j1rDTWAeVk1nzhUKPlaYI2EP6m9+f+hPboZAgP4f0SEOC10?=
 =?us-ascii?Q?85I1W7jwLXiIbTANrkz1eE/0bttbqk1gYRzOptO576d2DYUpkej3U2xcDiLI?=
 =?us-ascii?Q?w9np+cx5I9sbCSZ6UntmPECDrra72z9e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?maKNcepTZ/GhoIcoSk5SySqdnLzTox7vIDHmHetidIVtkMXgCnWodmzVJIh7?=
 =?us-ascii?Q?3VvLVrZqVpzzOngTw0wuiXNVkTXhQJzHqteq2ASMxz++K9hUeVAsfjn4o6pP?=
 =?us-ascii?Q?LN5I00iWIUcjh2F0884pGuSee0exLgqHMEdNzaXOXIizUCp1xvcCMPfoSMK8?=
 =?us-ascii?Q?4ImIIvCaHWtbG0BGcO8JSjcl3mN9V3P8DOG+Ko77fDiGP/OZ8lY8GTWB/7mb?=
 =?us-ascii?Q?B+oqLozh7NPVw1gIyjUdf6Joo2Vik8Pmvxj9SWsflK6ENiiPsmkWMcRoicbu?=
 =?us-ascii?Q?EqIC/LMMMri1/bAUXuD2UEambW/i052UKQFb8hFMWEl0wsUxJnzBTYidL8WT?=
 =?us-ascii?Q?SXorokbL+afXadQ6BrKZ6+Ms71LMZBtvqAxD59+Z3oRoegpXXOXhd+LBvNOA?=
 =?us-ascii?Q?O0rw4w0o8jwXxJsplHT3D8STso58weXsA/sc9zHASBmf5Iz27lsZswPsf3OE?=
 =?us-ascii?Q?uVi3DPxU5J29e1LNGE1TB9WturSmGz3yeGfFsDGTANcedW+BMObVKu3bL2d4?=
 =?us-ascii?Q?PzYH3mlvr07+zwrz7YY0ApfIr0lvtangFTZ1eeLtfpi5LXs9qe2koRcwLAy8?=
 =?us-ascii?Q?Boj6ZPASgTQPlX+bR5q7EMppsrn+N9CyiI2qwUcHSbJj+EiSs017+2OcAQm5?=
 =?us-ascii?Q?S4dZFlK3rJC2g2SF+Q5zv3jObTS4/6FH/aF/T7q9q9PqOnb8Bn/IabcgzcVb?=
 =?us-ascii?Q?vL0RHZwzs5Z/1pH4PlZjxTFyNlpfr32NIcyBZwCMBJeD0RZ4rLHJUVCTgvG/?=
 =?us-ascii?Q?TzUNrfPGwiqzakjds9jOdAP3XCsekSolAQZAUHq+pm9RMQGgFvtgEdFV6kIZ?=
 =?us-ascii?Q?nRm+CSpiEQcMXsRUVW+voevR+uAbvpgRjLT0e5W9czoMuCH9LWES1kvgy8k7?=
 =?us-ascii?Q?df7h0RRj1bWxJqakZoXzopIP64C79TfAP+2HPd6yMcFVyG4YBU3a00uTQWuC?=
 =?us-ascii?Q?9soLqgk584axDHKTPFdUZ/r1axMnZs3vYevgpTeGG36PWqN/JsIYdMrBkCTE?=
 =?us-ascii?Q?2J+O798gQhZy66nLeOv6o69f3XvAd8Q22eBbvzPXRfS7PAYRVm6/xKbKRCk5?=
 =?us-ascii?Q?aiofc0Uqjj/6wy1lFyhoGa8TF8vcC8Vh19uDhXcrZ+cdwJqa4HvYhLLqL8Ee?=
 =?us-ascii?Q?sJDWvcJE3jYHrIzMmyZ15DiRXORq9CHXCAAVhlhgHBDH2uAZ6N1orziDAU/0?=
 =?us-ascii?Q?RDnrbYsdy7fDOkfwIgNbbwUeJyc/rWtbH7MCTex+2gYa8/j4yAA8GZNYuwGK?=
 =?us-ascii?Q?y5ul4XuOdoRB/KIb7kdbIIUe7LEa0r56IRjmpNql58OKNXvZiN11pe/vm6X8?=
 =?us-ascii?Q?M13dxia9hL9FmFYEQKGMR2K9XH2TAKBksLeA1phug9krXJ6YlSgAY3eKv4wU?=
 =?us-ascii?Q?HncxAGYI0WRMYF8EKg4+ohUbABy2s/CPuA2SN2NKbo9ZFoojeEBNMqIOBc4L?=
 =?us-ascii?Q?QrRY+GHgPh+2wJOTWLL/nRzwhhPmjek1pOK42FfhzEmzXT+Vx/nmDXeWEXHI?=
 =?us-ascii?Q?wxZeLjkLEzwNABiyP8HM270cz3RMBqQb6EjdrjIXFyiUokytqD4nb1A/2BXH?=
 =?us-ascii?Q?u2dQrfr/0Y01kEeO5JOEWAENvzM0aNY+/Ts7M+F99UGyzAfLOeVs295fhepY?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ddd2ba-0f60-4bdb-acd0-08de3219f363
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 03:13:37.3743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RYvj5vaDNiuxq7lUh48ikPtVZpVe3d2jy01vSg653p5mIy4/Q6JnxQ5m7L5klnEm3y5FNuICPiO9XdcMsMFiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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

On Tue, Dec 02, 2025 at 10:12:24PM +0000, Jonathan Cavitt wrote:
> Add an address precision field to the pagefault consumer.  This captures
> the fact that pagefaults are reported on a SZ_4K granularity by GuC,
> meaning the reported pagefault address is only the address of the page
> where the faulting access occurred rather than the exact address of the
> fault.  This field is necessary in case more reporters are added where
> the granularity can be different.
> 
> v2:
> - Keep u8 values together (Matt Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       | 2 ++
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 8 +++++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 719a18187a31..79b790fedda8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -74,6 +74,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
>  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> +	pf.consumer.addr_precision = 12;
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 0b625a52a598..47dec46515b5 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
>  	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
>  		  "\tFaulted Address: 0x%08x%08x\n"
> +		  "\tAddress Precision: %lu\n"
>  		  "\tFaultType: %d\n"
>  		  "\tAccessType: %d\n"
>  		  "\tFaultLevel: %d\n"
> @@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		  pf->consumer.asid,
>  		  upper_32_bits(pf->consumer.page_addr),
>  		  lower_32_bits(pf->consumer.page_addr),
> +		  BIT(pf->consumer.addr_precision),
>  		  pf->consumer.fault_type,
>  		  pf->consumer.access_type,
>  		  pf->consumer.fault_level,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index d3b516407d60..333db12713ef 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -67,6 +67,12 @@ struct xe_pagefault {
>  		u64 page_addr;
>  		/** @consumer.asid: address space ID */
>  		u32 asid;
> +		/**
> +		 * @consumer.addr_precision: precision of the page fault address.
> +		 * u8 rather than u32 to keep compact - actual precision is
> +		 * BIT(consumer.addr_precision).  Currently only 12
> +		 */
> +		u8 addr_precision;
>  		/**
>  		 * @consumer.access_type: access type, u8 rather than enum to
>  		 * keep size compact
> @@ -85,7 +91,7 @@ struct xe_pagefault {
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
>  		/** consumer.reserved: reserved bits for future expansion */
> -		u8 reserved[7];
> +		u8 reserved[6];
>  	} consumer;
>  	/**
>  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> -- 
> 2.43.0
> 
