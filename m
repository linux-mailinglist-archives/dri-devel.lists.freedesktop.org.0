Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EE9FF579
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 02:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488D910E1D4;
	Thu,  2 Jan 2025 01:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbnOqWv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5B710E1D4;
 Thu,  2 Jan 2025 01:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735782265; x=1767318265;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GRS8g3zusx9P110kgk6A/z4T3pwXatniTbzEpPrLFrU=;
 b=WbnOqWv/6sYZNYCGYbRcwCi0/H4unH/I65boeY3bquw0za+mkabGOsYA
 PHzWYiUWTNvnFnAjyE+s97w/0oK7vKzb3AlHvczS4s4JbfqyvNVX0Yr3y
 0EMzwQs4PZGRRP84G1zeT1k8uu+PLRyUC+ZSq7YiKPSzcE9aRYNLLsqmb
 u+k4GXTeLJabNq6LQtAQ2TMWSDustbysET8dkMaqeZLgWwQMOYgx7pyIS
 0QfeM0CjkMpAL8ZcL3q7oatHNqC2T7VGxtPwHC4wBzpF+so4RkeRyBwwN
 Cs6+56JShsfmDo7yPg/AG5R3XlTp/kM2dEoZngMCDm0vbLN0jSQp9V0Mc Q==;
X-CSE-ConnectionGUID: N40iVZkBQJ2ScQBxj1gtZQ==
X-CSE-MsgGUID: tnxqrihvRA+4y8Zvec+8ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35262410"
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; d="scan'208";a="35262410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 17:44:25 -0800
X-CSE-ConnectionGUID: M//+DCYMRhuaTbeSit5Dow==
X-CSE-MsgGUID: /LJAk++HQNS+qsxNnECQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101210546"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jan 2025 17:44:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 1 Jan 2025 17:44:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 1 Jan 2025 17:44:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 1 Jan 2025 17:44:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b698KKgc5I8cY1AAFwKDukapQFDh7EJn0vTHuRqK56LbjdYng56kABwtz7J8b1rd7AbQEq9/4G36XzYozwDgiBoPX7n1+UTpURcfhq7NGHdOwMLmg6WUqj0WvxgK+RbnoKj99uyV4+Zg+0mg0D/oTbkJ9CSezbC8buM+3nnNx3MZRYa+76UxNeIOKU0zXH70WtvDfajjnjht6cRAajAwwJ53yWMenTaxkdKzpCucUqvXetcnt5jrMPSzKBF6DfClmll7Mrv0kXYBxIUAlWBu2SAPLKDfsggL+C1+OaddMtWhSmhgdKIEPAkBSRstOGN8Mey6R2y2if/jH1ew6DeTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OWsFpul0uUM7GpRLCzHvfvs8nJR6hq6c3hFsp6hFKE=;
 b=YwzDfXuUgl8oHB+2H81pSEIbJYaftUiAr5tmPNKdXb4Kx7qw8THW/FId1kHjRZGareHZxQ918Kvt0z3H8oDI6g5KYyH8WoiPd347Qilsv7QoRvMYBni93lw7C7/PEs/R1eF6jsejqEuu3TgzDzOvD4v0178mT7uK7qcLRSPESk5Dhk6UU8V1Gp1DM0BHgf5/e7WDSnSpNtSgDCKI1zly/Xwtx323ftUEaq37J3boEFfQ1Y6x/tXrUXkJH3IU8LWKohnReYZB0wqpRymJGnQLZ/+BgMurLor5M6xXTirdaLz+0fZmcgGbatJJalo+YD4gHWdxcojBud5vNvgbp6wZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH2PR11MB8779.namprd11.prod.outlook.com (2603:10b6:610:285::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Thu, 2 Jan
 2025 01:44:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8293.021; Thu, 2 Jan 2025
 01:44:17 +0000
Date: Wed, 1 Jan 2025 17:45:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>, "Michal
 Mrozek" <michal.mrozek@intel.com>
Subject: Re: [PATCH V6] drm/xe/mmap: Add mmap support for PCI memory barrier
Message-ID: <Z3XvobR95Pnw5c+w@lstrano-desk.jf.intel.com>
References: <20241218125628.2270030-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241218125628.2270030-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH2PR11MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: d9de1d00-03b9-493c-2523-08dd2acef840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C/rxuB+8ME4lB4ahMZJlGcJa8jxSd88TnZ1OLz8801hd5t3tnAKZe9n1QDzi?=
 =?us-ascii?Q?EEtsHrCfuKk/TBKTLRhK9FSbkPgFjhVkLQJM5FNTAw3aGFoGBvFu9DPUZdIV?=
 =?us-ascii?Q?rauVAClNOTs1SnDwcU9nDPqZhn6frP2e+u8oc3ZZ8nvRi8bCN1TUJC66zwUT?=
 =?us-ascii?Q?C3879xmgN9xHOwVaIufKVv9pPFxMX+iyRZQnTo1mvN76wSW5CTatYtnDLhII?=
 =?us-ascii?Q?awUwVgnVtEu/Af9fI36fTTw2tjy+uH0tuAVTfRfz88EJh7prT9f+OTLcmwzP?=
 =?us-ascii?Q?DAj6SckGx2hCETTHQ1BSJYtcUrwMwd7RlWVmizJLbE56ErxxqCeAE0FSp1Dm?=
 =?us-ascii?Q?M7+4rqtLHPAUNXBh8ITG7JUHLKDGnrAF5tM9M1pF1oVoMJpbozHV1yNiYw5N?=
 =?us-ascii?Q?qXXs2PP3D4NPSclaPGkO1wdk8pzRJauJvcYvLCP2SxLuK76yAf7KIwylrqG9?=
 =?us-ascii?Q?x4tFDJ0Tm0Nh/qOvcVoKyqjTaY3Ml9A0JDy+OSdHMZcVL7WifCvb7lJOZK2t?=
 =?us-ascii?Q?X+Byg9b44Qmi817YwjQCaZbnlYHImIL9etmMWCTZYRUsHOomzaxODjZVyDe7?=
 =?us-ascii?Q?HYOAf23HniO/eSPnZ2u8PkHikfHzVgX+PrEsdPlC40eYkfp3FT+NVX9I0fgh?=
 =?us-ascii?Q?nrEz4TCgU8wRMdzE/zwkaks+EioqlJraZJIpL2Ipk8taaybbrZkLVoPWgsp5?=
 =?us-ascii?Q?eo3OC0Yl3L5SxQ4bLjAiUWuMp6IL41UkSBycMnWFKbRMgoUpTo5GhFllVqea?=
 =?us-ascii?Q?twfRSW1abbXnua9DGJ+CXb7xWsGnG+r9lBmlQljPyMbqt57LeoIbcDK56Xxj?=
 =?us-ascii?Q?I6iIRW0QoMf/qFthzCaxu0hYsYizdPpcUO2JgUdHoLQuK10cmSlVyecvOXJi?=
 =?us-ascii?Q?T6DhNIpGw0AHmHbJ5vVSmM5G5bvc103OFdUJAGgjExIum3cXqVUAFnRwpOLa?=
 =?us-ascii?Q?VnlFvYsFbPP5kCX4Egqei5g9zNotkx+k2hAW70lo7oROVp+naicfk8ds2xzR?=
 =?us-ascii?Q?Kb+TpWd5pzbjmaLLK1lDst2zx/GzaV8LzQTg0S81TV3Bl0uJpXgqDYiRS/hL?=
 =?us-ascii?Q?0Ar68p9nRWlQw0Codtac3cyMa6mKJaqmlncIFr2oxRP/kLZ+DJoY99cQbsxN?=
 =?us-ascii?Q?rknTZPvrGLYR1M7jDhPvDNtVbUHE1QGovQ9mWL995cbXWHaGwELsN8XKbioc?=
 =?us-ascii?Q?Ac/dHwJQRPH6DbNUN5MquuVUW0xvxCZtwx0g3HixC6WPry3qdYKhJTORRgO7?=
 =?us-ascii?Q?Fe+z/wPJuS/6cj8rMUILYykWAJM9mg6563AcSeFm/0uKLaHwGT1GQXSvmdEq?=
 =?us-ascii?Q?pl96JD37kiugpAxgKTlHxsxINuiBNhAjxtnUZ3O3YfDOqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B9ZmCFfyLXL5/qmbb6RGUDrxFOw7p7qIkn3jO+DN1nybMrtm5fvJGRAtEtPL?=
 =?us-ascii?Q?QRPoxHUSo4tPYOSlYRdfuBwrNy60J9+Ogvsi6mqN9+ERd/+NKA/pPEdHCaUZ?=
 =?us-ascii?Q?a3L4xWag69OndT1sTl5xudfMLvJItOSEsSarLBWqnmJFsQg/ToWX3jWtHQjb?=
 =?us-ascii?Q?JjrnQ8DzEc9LJ2tc2OpNj8pYYZhgpLnYbuwkpTpeJHXSj2MbZ6ZWJjmhe3c/?=
 =?us-ascii?Q?qeIGCI7YrcVb47rKleG/BcI0PkofXUjTHa+ZwpJaWnEnmnHcVofiJ/wpVOYY?=
 =?us-ascii?Q?LEybMW3LLKooe7XBTfoOxrRADnnXUnKGtqQhvYibU3Pkx+1cRGrJmCHvSWhS?=
 =?us-ascii?Q?g9px+8i905gko1fFuAxDjMIHJb4nL+kdJATmEZo/W6stSFqr8JI84LPVhbvZ?=
 =?us-ascii?Q?hCA71SFzH+aPwwbzgx0zbPncLuNUPwMTebrecM+5ii/EO1VF7xykro9+P/78?=
 =?us-ascii?Q?JAYwdrh4naddNQ4G6JaLo0z3kdETGDw+VOSTrFee3CsZ1BTV7N207AtcQsTN?=
 =?us-ascii?Q?I/HM/8rdW8wVGIXhAI4EARFZ/rlx3IsgpzxtUThQvQs2ttFeJZJ9cOqqqX6W?=
 =?us-ascii?Q?k0A+XyAuUCPsyY/kjeE1xBpsu0zub9guQZwOhYIlcCy7U2WPXXtzD7b5YnNy?=
 =?us-ascii?Q?Ov/GFgWTZX8oojWQ6dzDPsmSgJYUuJU/q0MDvgfQivPpcXeko+P3k4lyXm8s?=
 =?us-ascii?Q?YcWpHGbyL9VMEXIOsSbHOFbdrgq9R06nbVvc966dDlrv8f9Vavt9greDcV8m?=
 =?us-ascii?Q?4/JNaaM+M6zGSX7dL45IhBsDi8yKOznrKmCGNMfkI2tpVo0xuzaciQrgL8Ty?=
 =?us-ascii?Q?XjwUQjVUuYj30eoPuMU1RUTagXGSm+wan6mhW1uxJ5fF39MsMtM6buEg4Zcm?=
 =?us-ascii?Q?7qCkol+WNvib2QqNHOcKHlietOy74myLxe9zntpBEj1Z+F7ce2+o3fSDx7xz?=
 =?us-ascii?Q?wbP4mnSOzagyiOv6qvxeRJjgB4IaDpsEHje8RUIcXM16T2U8H/u8F3GV/fmd?=
 =?us-ascii?Q?8He0s3Qv0DqjV5iuw4kVCxpKUO92uGWIoDSRZnCeXHsU0eA7QZ/M+RpmHguF?=
 =?us-ascii?Q?gwFvx99SvzXfvp9vXopr55R31nyM8KJgD6i4VSPXsGMvGHyaNa9a98E2cq9J?=
 =?us-ascii?Q?9jawzQdPYoDHRufH7x2AK+bCBGUMTf/CYjU7BsQiNRoU8K0U0WzabCzVl0f6?=
 =?us-ascii?Q?SuAx/OgLMlcFQEkIFIB2CMNIy9AkryWLmbFqYpPXA/nMzYtD+28fvpx1KZf4?=
 =?us-ascii?Q?fBuK9JiMUsIJjk4glIj/f/wJsWJAUrth2VFQVs8zlZU6p0oTUTjvb9izSFYN?=
 =?us-ascii?Q?IfSET5OXFHY2qinuWsW1c0c6t+UMeKtjyunP1OZcZBnPymbuH+uS9t/+CoLc?=
 =?us-ascii?Q?z4jm2LkKGk0KuvwusizBjkPpstTPaayNcN9hOO+RJfdhsnCIFji2en5wOxc/?=
 =?us-ascii?Q?JYucZLxU/u5LTHX+QQy5begHsHDxHOungzLvZqznyavmuUO+gBlA4OJ5cfjb?=
 =?us-ascii?Q?moB/64rlwpFZt/yqgRsfMx3rJSKZvwYg7iHtJ0Lc9pec8fnW+drd3y05phzg?=
 =?us-ascii?Q?6yZCwDXYUgips/H1cibJ5x4uyvFV3NWNuUovXamAtPT5N35YBbcZeClxOVoF?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9de1d00-03b9-493c-2523-08dd2acef840
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 01:44:17.5132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFitF8ivKYcjUEa4ysXFZWHws/in60arUpNclcGwxBGJq4j09Rxp6HDCStPMFdDRR0eBgbBwG00puSmqKTaweg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8779
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

On Wed, Dec 18, 2024 at 06:26:28PM +0530, Tejas Upadhyay wrote:
> In order to avoid having userspace to use MI_MEM_FENCE,
> we are adding a mechanism for userspace to generate a
> PCI memory barrier with low overhead (avoiding IOCTL call
> as well as writing to VRAM will adds some overhead).
> 
> This is implemented by memory-mapping a page as uncached
> that is backed by MMIO on the dGPU and thus allowing userspace
> to do memory write to the page without invoking an IOCTL.
> We are selecting the MMIO so that it is not accessible from
> the PCI bus so that the MMIO writes themselves are ignored,
> but the PCI memory barrier will still take action as the MMIO
> filtering will happen after the memory barrier effect.
> 
> When we detect special defined offset in mmap(), We are mapping
> 4K page which contains the last of page of doorbell MMIO range
> to userspace for same purpose.
> 
> For user to query special offset we are adding special flag in
> mmap_offset ioctl which needs to be passed as follows,
> struct drm_xe_gem_mmap_offset mmo = {
>         .handle = 0, /* this must be 0 */
>         .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> };
> igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
> 
> Note: Test coverage for this is added by IGT
>       https://patchwork.freedesktop.org/series/140368/  here.
>       UMD implementing test, once PR is ready will attach with
>       this patch.
> 
> V6(MAuld)
>   - Move physical mmap to fault handler
>   - Modify kernel-doc and attach UMD PR when ready
> V5(MAuld)
>   - Return invalid early in case of non 4K PAGE_SIZE
>   - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
> V4(MAuld)
>   - Add kernel-doc for uapi change
>   - Restrict page size to 4K
> V3(MAuld)
>   - Remove offset defination from UAPI to be able to change later
>   - Edit commit message for special flag addition
> V2(MAuld)
>   - Add fault handler with dummy page to handle unplug device
>   - Add Build check for special offset to be below normal start page
>   - Test d3hot, mapping seems to be valid in d3hot as well
>   - Add more info to commit message
> 
> Test-with: 20241118113606.1490397-1-tejas.upadhyay@intel.com
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Do we need a query to see if the Xe driver has this uAPI?

Matt

> ---
>  drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
>  drivers/gpu/drm/xe/xe_bo.h     |   2 +
>  drivers/gpu/drm/xe/xe_device.c | 103 ++++++++++++++++++++++++++++++++-
>  include/uapi/drm/xe_drm.h      |  29 +++++++++-
>  4 files changed, 147 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6c896ad5602..86f2c00a0afd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2263,9 +2263,23 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags))
> +	if (XE_IOCTL_DBG(xe, args->flags &
> +			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> +		if (XE_IOCTL_DBG(xe, args->handle))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
> +			return -EINVAL;
> +
> +		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
> +			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
> +		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
> +		return 0;
> +	}
> +
>  	gem_obj = drm_gem_object_lookup(file, args->handle);
>  	if (XE_IOCTL_DBG(xe, !gem_obj))
>  		return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index d9386ab03140..04995c5ced32 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -75,6 +75,8 @@
>  
>  #define XE_BO_PROPS_INVALID	(-1)
>  
> +#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
> +
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7f021ec5f8e7..bacfeec9dc0b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -232,12 +232,113 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>  #define xe_drm_compat_ioctl NULL
>  #endif
>  
> +static void barrier_open(struct vm_area_struct *vma)
> +{
> +	drm_dev_get(vma->vm_private_data);
> +}
> +
> +static void barrier_close(struct vm_area_struct *vma)
> +{
> +	drm_dev_put(vma->vm_private_data);
> +}
> +
> +static void barrier_release_dummy_page(struct drm_device *dev, void *res)
> +{
> +	struct page *dummy_page = (struct page *)res;
> +
> +	__free_page(dummy_page);
> +}
> +
> +static vm_fault_t barrier_fault(struct vm_fault *vmf)
> +{
> +	struct drm_device *dev = vmf->vma->vm_private_data;
> +	struct vm_area_struct *vma = vmf->vma;
> +	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	pgprot_t prot;
> +	int idx;
> +
> +	prot = vm_get_page_prot(vma->vm_flags);
> +
> +	if (drm_dev_enter(dev, &idx)) {
> +		unsigned long pfn;
> +
> +#define LAST_DB_PAGE_OFFSET 0x7ff001
> +		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
> +				LAST_DB_PAGE_OFFSET);
> +		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> +					  pgprot_noncached(prot));
> +		drm_dev_exit(idx);
> +	} else {
> +		struct page *page;
> +
> +		/* Allocate new dummy page to map all the VA range in this VMA to it*/
> +		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +		if (!page)
> +			return VM_FAULT_OOM;
> +
> +		/* Set the page to be freed using drmm release action */
> +		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
> +			return VM_FAULT_OOM;
> +
> +		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
> +					  prot);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct vm_operations_struct vm_ops_barrier = {
> +	.open = barrier_open,
> +	.close = barrier_close,
> +	.fault = barrier_fault,
> +};
> +
> +static int xe_pci_barrier_mmap(struct file *filp,
> +			       struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +
> +	if (vma->vm_end - vma->vm_start > SZ_4K)
> +		return -EINVAL;
> +
> +	if (is_cow_mapping(vma->vm_flags))
> +		return -EINVAL;
> +
> +	if (vma->vm_flags & (VM_READ | VM_EXEC))
> +		return -EINVAL;
> +
> +	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
> +	vma->vm_ops = &vm_ops_barrier;
> +	vma->vm_private_data = dev;
> +	drm_dev_get(vma->vm_private_data);
> +
> +	return 0;
> +}
> +
> +static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	switch (vma->vm_pgoff) {
> +	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
> +		return xe_pci_barrier_mmap(filp, vma);
> +	}
> +
> +	return drm_gem_mmap(filp, vma);
> +}
> +
>  static const struct file_operations xe_driver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
>  	.release = drm_release_noglobal,
>  	.unlocked_ioctl = xe_drm_ioctl,
> -	.mmap = drm_gem_mmap,
> +	.mmap = xe_mmap,
>  	.poll = drm_poll,
>  	.read = drm_read,
>  	.compat_ioctl = xe_drm_compat_ioctl,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f62689ca861a..cac607a30f6d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -811,6 +811,32 @@ struct drm_xe_gem_create {
>  
>  /**
>   * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> + *
> + * The @flags can be:
> + *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special offset
> + *  for use in mmap ioctl. Writing to the returned mmap address will generate a
> + *  PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
> + *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> + *  instruction.
> + *
> + *  Note: The mmap size can be at most 4K, due to HW limitations. As a result
> + *  this interface is only supported on CPU architectures that support 4K page
> + *  size. The mmap_offset ioctl will detect this and gracefully return an
> + *  error, where userspace is expected to have a different fallback method for
> + *  triggering a barrier.
> + *
> + *  Roughly the usage would be as follows:
> + *
> + *  .. code-block:: C
> + *
> + *  struct drm_xe_gem_mmap_offset mmo = {
> + *	.handle = 0, // must be set to 0
> + *	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + *  };
> + *
> + *  err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + *  map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> + *  map[i] = 0xdeadbeaf; // issue barrier
>   */
>  struct drm_xe_gem_mmap_offset {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -819,7 +845,8 @@ struct drm_xe_gem_mmap_offset {
>  	/** @handle: Handle for the object being mapped. */
>  	__u32 handle;
>  
> -	/** @flags: Must be zero */
> +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
> +	/** @flags: Flags */
>  	__u32 flags;
>  
>  	/** @offset: The fake offset to use for subsequent mmap call */
> -- 
> 2.34.1
> 
