Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB58A44E00
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 21:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8601D10E7E2;
	Tue, 25 Feb 2025 20:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOHADKgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9C610E7DF;
 Tue, 25 Feb 2025 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740516421; x=1772052421;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bLZOs5YrC8h4QiHjvzHB/Cq2quj4CrkqIqwB1Y33fvA=;
 b=cOHADKgDOtuIWWtZSP/vca87L2B2oSqIuaBEu8lUY/TQ7xWXh42yhCN9
 nzp7abrX29crXblo5OTIDTLCTSSFxiQ203EmX81X/7AobwU2ROdd3paKP
 N03oN8tAS4NHpOUdmQdbsadlIKRnqxnAEMMdWJ968g6NljRdxT3aMTpAn
 ELQhTEy8kQwZc3nMImVIHiOv1xw83vrHTNuj71C/GV8vIm2qZ6ym21xx9
 k0EpRAKLeObHwSpm1tTQQeCiqRmxrCYCTe8E1ZaObufBgIt+yQKqJXvzy
 zI2NU1Wm4XY+NTcHSA01XGd7ngBIUHSVGKzO19zfkpC8jC5yqY79ndF3R A==;
X-CSE-ConnectionGUID: X9jSiyi3R1CScjFgP2eSFQ==
X-CSE-MsgGUID: MTe96+xuSvuriKeFNnmQNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58765872"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="58765872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 12:47:01 -0800
X-CSE-ConnectionGUID: Ucc06bE7TT+N8wHtnQMJDA==
X-CSE-MsgGUID: xsjiL5dLRC2JoK+FWX9l4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116988802"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 12:47:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 12:47:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 12:47:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 12:47:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2ZchTT1SMTMVhUxiJWca+LDY/Pk86BvHxnbbGG69tIPyIYrgoWQel/YVnevaPcBCtXQFs8GkaAGOspjk2QmwOprQX/vWBhKeWoWjUL5YPQrqor2H1AoROi0iF8vXKDNo+jGJ+CJc0Lm6uufDyNdMBKcbqJbuL6YryP07bMZ8smD2NSc+MsDvBF8MtGrCHycHBuDBOYeUUq/V+fi6lbl8OIqcElw4Nzw2m8PEUIOv9flVN3TK+v6OgnUzikT62MqjbiYIxTUOnfHRDU6cw16jnwOLWKUea++eWZmk1iN5KYdO/hk9jVnvDtGQonRJbXAt2dT0aX6kQPfrMuphbdyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn7GGMa3B7E09rC5JH3HqJOX9pDDu5ZuN0GsJ5WxLVk=;
 b=WmKesUa3U4jJq8ZDzxJ4Qll7VRho0ndzTjLeD/rLSSHHKkLSt0FuPcl8Pl7uDNZmn/4XdozuS9NI/gBditA+D4vmLJ4mv5bUoWPbqWZTffg0TG+GKReiUoyEpQ45OknXRYlOUb1OtBEBvyXxPDUtiCt+3IRKnlTloGMJImUowARLHqyDBPJ6ZuElRmcrAnRGvhULXM1YEx1F3GkRcFnNaiQgNHwIHp4WwoeyMNcGf0kpGCiD0HRfTXce6RS2bJmB8qXGdUrSUKc761iRF6y0FfoqDx65d4RjASEw7gKq2e/oxRTsxDTsQ/9Zh4/spVijr8SR3D6/+Px1jMI0W2WmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 20:46:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 20:46:57 +0000
Date: Tue, 25 Feb 2025 12:48:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@igalia.com>, <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct
 to header
Message-ID: <Z74sgEW8Yz9AYgyf@lstrano-desk.jf.intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
 <20250220203832.130430-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220203832.130430-3-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: aa408bf3-28ef-40e6-e50f-08dd55dd8b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JOaBTVeqYARdVeaOYxK94HTIGjl1DCmPzvpfyjfMjeTGw87lEngZMWbuoe3e?=
 =?us-ascii?Q?r2Htf6czRlJGQ58EwurQIb21X51U2jXlHRPQuF/vv345jD3gA8aU1C/79CVA?=
 =?us-ascii?Q?SGFoKjuU5pqkNvZSkliDZL8f3NgAlP+1dwUOezCESqZXSyIGbPMl7f0nF5lc?=
 =?us-ascii?Q?dBDdC7hPHJ0xdaP0LFiJO5O6QgIuCrsCQiCaXe7jdN0kg3dNJZpv/CwlLF8w?=
 =?us-ascii?Q?/jyshq6Sdnvonk3lgoCuGQZm3/H1SZbbxXGGJJ0fn99j4qUB3h3774PJUzdE?=
 =?us-ascii?Q?OoEy566iNO8bWlxLOEi1y5xybxBR7LRzkLkbuAght3wm3HLU2qMDXjhim0vK?=
 =?us-ascii?Q?Xlye3Z/mZc15zlMJO0OLAQlOAeoK2kFuZdIvbr4Ow5HXEhwtyjwz44BAJxsT?=
 =?us-ascii?Q?bp+FQ7zwsFIxER8jNdXqhtp6p6RHexz7KuDkxIKuRtAjsfAuUrV7Roh8N7AU?=
 =?us-ascii?Q?vcZHZePdn4jUKuHNOLbQNjXtwDDikPw/E6b/PQbRbuu4sZNpGpzrk3fDpDVA?=
 =?us-ascii?Q?MFHrIdoXZQBG9wp7YSd+9gASLmj5DVZ4fK0o0sloaTFX4StDRsS7n8mZEj01?=
 =?us-ascii?Q?fy1x2zPOuO01JWR7pCeCZTCLpu9wEuCweBPoHmlU2tqwD43bDjcMauNp8xiY?=
 =?us-ascii?Q?9t5N7ZnFbAzYQgFKGRMDWaBVbXRt/zZZSlSKAlnaE9qevGMFzH1k+kccRo6/?=
 =?us-ascii?Q?wulTH1EHCupQrMvtOiXhwMxqz6vWF/uD5p7ke233lMe4t9XLVHhQt57CAxmV?=
 =?us-ascii?Q?48l4ut2Md0wiPO8SQzg/ESdBUXWMrNdUK7DKoBCYt3AfOVibBZhPpNTu97mP?=
 =?us-ascii?Q?HVkQgu4IHHRpDj7SAhTpzH9c+WnZkj23v3JA3SC3VKARoCZB4ZfDq9TiMBD9?=
 =?us-ascii?Q?jsa96z8WvdzOZlO+l/8qOpg5AAEgkLYsNCRpuSzB2jgz86U9YxZMf7k1ojtE?=
 =?us-ascii?Q?GF7IZjkhmGIlzvB9ecHv45LUIGgIE1xKY0ZlvEXGZ+j/jH/61Ts7Qe3BtDX0?=
 =?us-ascii?Q?7kG9geVRxtD/vpGuqjN8EOxrHMkBi5WvDeSpeJXoLQzcPz6+rMJJcGj/oP2i?=
 =?us-ascii?Q?NJGJ/i1yVnuIjk6+0Ahr7bMt1q3qO1BE4s40WIxBiAbiQPe7BfhfsIWG1yLr?=
 =?us-ascii?Q?IzVizIrNzSECIdifejeWg+J2cpdyE4CqQKONU5uPTKat6LZMvTxmAFWFJjxc?=
 =?us-ascii?Q?6BCTIOxHI9M8opoZHEB2DjBmJcsMDrkITHpRj04fwOzMRumNSLHJ6FZm7UQA?=
 =?us-ascii?Q?hMdodzO/ejcPYok5PebwSOm8JbMjSFhn5XoCiOw7rE1xnAsPcwCABHTgJDee?=
 =?us-ascii?Q?BiRjJ+enjnt5MedOUw5r2EfS4q4xsSkbhKMBBw4wmNjLWtT+lap7uyTunWBe?=
 =?us-ascii?Q?brd4GYRiYDBvXF95mw0sTuyb6YLN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?644aAd3lBlw3Gop9TXx+veh72X7cYk/VAlqgXDtGhYXCvDlwKz3bBqd4bpzp?=
 =?us-ascii?Q?rBoE8LxQoZ+ZwJ9fUZfHbvYSj2M++HivgS5/4WhYIzU5Cd496UOlSkmKb4tY?=
 =?us-ascii?Q?yfhRE7I4Z7Sc8HtRYNxsGdmfZK9GvvgwTzjD/XxrKZa4HfxlRZgeUPus//SK?=
 =?us-ascii?Q?WMrvFOwEgaTPgC2vEi594Ei2OfGJ92hvPNDWDBaQf/qqLSFGO9GD8O1lIdzK?=
 =?us-ascii?Q?FPf/L+J5iWvgikJmWZq2UCktuNfMaSSW+WJC4RGE4QJKXd+OI6tiB3AUW5wB?=
 =?us-ascii?Q?vaXF/xO3i4zFZ8mXZU9nCyPpVJVm5jFSoicEKOC5i51d9Q4L/t0AasfciJto?=
 =?us-ascii?Q?0Uqyw2ABSOegEdA1z/SpwCRoGWU7D48lCG0S/A4ceaojzmqgeE+yrKU1h+ZZ?=
 =?us-ascii?Q?KeSfkilhlk2o46VzPSF4oZ93tg5i3xj/0toyD6eafgjHlarLmwKdKrjEXBXo?=
 =?us-ascii?Q?nFgBPZrpZeOMiXd9g7tXCvjONRdjm8BiaX9FPHJAU8V00ZMOobw93CNiIR66?=
 =?us-ascii?Q?AnT1I7gPBCJWRmgAKt7vNwPwzicwhJjbd6MP2Ku14by8SjlTvZuHTxQpLGia?=
 =?us-ascii?Q?WwMhNf+CZAYPt81C2LEw6zgjfWihLKUMnZZ9rnM+6gM5BgYuukkhqnfR7eGH?=
 =?us-ascii?Q?wV49UJpFQ6ml6XJIKNav70VjUNOI3mk6uwSxQZmOMhQOwr/FNEVS1yqFO05L?=
 =?us-ascii?Q?m5NCvqkAMwpRnEMyEY/hT1pSt2AkK96tuyS31Z4yFacdnHDvY8DdJwYUjQs6?=
 =?us-ascii?Q?7cqee6aRvO1eKdOTbEuW7dw/q6cBG1PnXqTPZL8QHdpXZIN30yXzENSS2MfJ?=
 =?us-ascii?Q?4jBem1i69DphXgaJK0mW7zpuHyz0O58b+5VmOgyP2GOUmj/FUntxD6PVoUne?=
 =?us-ascii?Q?8FW5zFukDNzWh6KYh5Ed3qAQ1a8lCdpdkkkpMFV8mZHUjopNBSlvhVl74xfQ?=
 =?us-ascii?Q?+ugxzUZZjtUxa5j2M3uPVIf8PoHs35AtbtCDqJG/xPm7zkwkyLOigH5+r3AV?=
 =?us-ascii?Q?d81lY0hi+kM7iQO2+1s3G4ZzK24dvewJcOVAEFtooTeyeMLSfVuq1k4CfKBu?=
 =?us-ascii?Q?++trkI+N7KItU57edwA12W8UHmF4hjCH8xOyWput99opB21rP7jpHPtylU/j?=
 =?us-ascii?Q?cV7/yqxxtsaeGWIb3WRGeTkG/tuD07HtBdC6pauGDSXUuQEyJm7wsHYNawbw?=
 =?us-ascii?Q?l6cxYurfVnd11xb52zTRBLsBduVJsc32h4hKjDrn6u+6bVeShhGE5Ux+uCeB?=
 =?us-ascii?Q?KvGJI+PcKuqQ5VEL/XcTDxAwp++Ln6RVlZtzlA7ivSzgQRE1/9DuLf1cX5gT?=
 =?us-ascii?Q?NcevbHXyuqEh+/buVlneXu+3WDeX9sLs96pKE8W+J98QdJ3kvUa5K5ATCHVf?=
 =?us-ascii?Q?idYJXuqQg6BOwM6Hn/mG63GhQDcMwZDrgyZPzp73jCL0AxzIhnqh5w8a269x?=
 =?us-ascii?Q?MS3TFIdffEKAGWvfgbi3fhsUNZWjcbAd8S2OOYEcHNPUVlb2Mz16LvPAgozb?=
 =?us-ascii?Q?sEpXMOY7QJBimeYGphpsxzqjoMUz/RJXtqp4InsjS26BcuAFkm62cn8bj12G?=
 =?us-ascii?Q?QB0Yzlq0FtVTOk6HyLdrKNxGwFcw8jCawBm+gLaW4EX386hQ8KkUCvo3EFBi?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa408bf3-28ef-40e6-e50f-08dd55dd8b74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 20:46:57.3859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eofQKegXR3lNS30snKbbabun0SRzU0hqKv9eO9B8g1C7zOjEXuROSx2hnZlo+arXaJaHZppzSyDh00skHWT8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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

On Thu, Feb 20, 2025 at 08:38:28PM +0000, Jonathan Cavitt wrote:
> Migrate the pagefault struct from xe_gt_pagefault.c to the
> xe_gt_pagefault.h header file, along with the associated enum values.
>

Let's normalize the names if moving these to a commonn header.
 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 27 ---------------------------
>  drivers/gpu/drm/xe/xe_gt_pagefault.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 46701ca11ce0..fe18e3ec488a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -22,33 +22,6 @@
>  #include "xe_trace_bo.h"
>  #include "xe_vm.h"
>  
> -struct pagefault {
> -	u64 page_addr;
> -	u32 asid;
> -	u16 pdata;
> -	u8 vfid;
> -	u8 access_type;
> -	u8 fault_type;
> -	u8 fault_level;
> -	u8 engine_class;
> -	u8 engine_instance;
> -	u8 fault_unsuccessful;
> -	bool trva_fault;
> -};
> -
> -enum access_type {
> -	ACCESS_TYPE_READ = 0,
> -	ACCESS_TYPE_WRITE = 1,
> -	ACCESS_TYPE_ATOMIC = 2,
> -	ACCESS_TYPE_RESERVED = 3,
> -};
> -
> -enum fault_type {
> -	NOT_PRESENT = 0,
> -	WRITE_ACCESS_VIOLATION = 1,
> -	ATOMIC_ACCESS_VIOLATION = 2,
> -};
> -
>  struct acc {
>  	u64 va_range_base;
>  	u32 asid;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> index 839c065a5e4c..e9911da5c8a7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> @@ -11,6 +11,34 @@
>  struct xe_gt;
>  struct xe_guc;
>  
> +struct pagefault {

s/pagefault/xe_pagefault

> +	u64 page_addr;
> +	u32 asid;
> +	u16 pdata;
> +	u8 vfid;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +	u8 engine_class;
> +	u8 engine_instance;
> +	u8 fault_unsuccessful;
> +	bool prefetch;
> +	bool trva_fault;
> +};
> +
> +enum access_type {

s/access_type/xe_pagefault_access_type

> +	ACCESS_TYPE_READ = 0,

s/ACCESS/XE_PAGEFAULT_ACCESS/

> +	ACCESS_TYPE_WRITE = 1,
> +	ACCESS_TYPE_ATOMIC = 2,
> +	ACCESS_TYPE_RESERVED = 3,
> +};
> +
> +enum fault_type {

s/fault_type/xe_pagefault_type/

> +	NOT_PRESENT = 0,

s/NOT_PRESENT/XE_PAGEFAULT_TYPE_NOT_PRESENT/

> +	WRITE_ACCESS_VIOLATION = 1,
> +	ATOMIC_ACCESS_VIOLATION = 2,

Same for these two, I think you get the idea.

Matt

> +};
> +
>  int xe_gt_pagefault_init(struct xe_gt *gt);
>  void xe_gt_pagefault_reset(struct xe_gt *gt);
>  int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> -- 
> 2.43.0
> 
