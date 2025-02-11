Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C044A314DC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 20:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3340810E309;
	Tue, 11 Feb 2025 19:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juDDfC7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A71710E15E;
 Tue, 11 Feb 2025 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739301542; x=1770837542;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aOypmHAAvcXHLLTCQA9sHEseJt8Ydg3w70qCrG2u22c=;
 b=juDDfC7KdoSVVSDkVH434O7atW2kmPjQDjM3p+P6s7V4x4zTv3Xr10fU
 gndI6Es/KZWp+WibJwVlf8ui9kc3iwjAiQ1yypSc9EvVPXC62O0YbjEFi
 IVVVwFAG6kwLbDmZWDA2dr3VwVx6huF11rQ+53gBW/dkZhsd5jltGk+BU
 PhvofJ8/ttLlt9iVr/eiuPVspdENoq9gjwrvoFQa7Uzc0yAbJZdLV9ukq
 Xcua3k7GW81jJHWsVj+uH+wlxSnU5eFUcub7LtyK9cRzLeqtNexWjP+XR
 56eLRUu63sOqo0S1caINGymN4lRWx02V5Rsd0hioXDsgIXvPc8jsWtK3/ Q==;
X-CSE-ConnectionGUID: FYFAnkppTHeye75nLlRMig==
X-CSE-MsgGUID: xvKw9TQ/Sc6KJghILiMVMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50922741"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="50922741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 11:18:58 -0800
X-CSE-ConnectionGUID: +fnoyLiFRjCJp1PYEsvJ/A==
X-CSE-MsgGUID: Nez9YoX8SGC+ASc77dpBkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="112816043"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 11:18:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 11:18:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 11:18:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 11:18:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6tWaFNXtXbLQvCNT1kmxVZ72w+XM2tgMcCDjzNz30dL9hgfGQKotsnaKlCxMn3ZZtakqedVul1DCbXsL6ep02XI1teRma91WTYEZS86iF7629hIm+ePeM3/A3eveLcqBAgKAGkscYratDUdU3aakVPPuiGZESDQnxuwEoGymM21o7SZAm7bTd5KEluTm/2b4vZQ+mw74SESiRGm1LKFA6XBk9md2QDUi/0kmVwKGewI4qdn+74wLL2S3oMEJtAfvuH5j9sWQwn1fodFDi8VHP5iW4gPIukKK0rxF93sbrPOeYfrv1mTe6jtZ1PXnminIm7ahzaWwVXzDADvEVw/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IDVv+d/74rMIyTWodwX3RruphQxBdEHPY1qfB7/KfE=;
 b=lGfSIMkTyaz0UQUxLDUkjaa4d4+9ktMOs57d5Xj51G2FiL66XR46BUgTMt2yySrUcMUqRZxFRxjD7oYQK6A1+KKWxeaFE8RXnAGesLgdHeKXSR/hrh44Nn7v3oQoW5BfZpaNjLUOCPaXmzMMu8VJaEVLDUaBJXaCfjbuPGS3cqMV1FQL19lvjRf792NELIPLbR/T2MPVmPRCfuZPJ6OAYByulH5A6NxTKJ78PFrb3x9eVQ0WlejPEmn9NRH37Ryjmm8wxnAt6qbNdYsZDa1rr6cHT2nkhWBW84Hl1h86nMss67sohBtabyGP6QOoQjs3T1NVDDLB3womgMUPK1PU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 19:18:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:18:53 +0000
Date: Tue, 11 Feb 2025 11:19:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 27/33] drm/xe: Add BO flags required for SVM
Message-ID: <Z6ui2e6TYJ44aw1T@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-28-matthew.brost@intel.com>
 <d61011585df26476a5dba725ec1044e5d74bd928.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d61011585df26476a5dba725ec1044e5d74bd928.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 89633f92-1015-4e99-92e6-08dd4ad0ec70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yA9n52D+lqBxKHfQ4HpUPg25n8s6yyVoC1caqQazWmZ8A7Vo9wJIrcICcD?=
 =?iso-8859-1?Q?pyeujR0vQP8E96C9bvIl24DJqCddMNTmZ3PG83+ukLI4Tp66xnpwdjzKHq?=
 =?iso-8859-1?Q?+jwSXaTpah/uJhEgETrY/HcJXUh/usoVqkqg4YTeaC+KIeOyZ61xReUWAC?=
 =?iso-8859-1?Q?iZBEKoISozqQDPGs7OzgEVFG6iGs4lLRZeOt+AbthkMsDYj+SlKFak8wqZ?=
 =?iso-8859-1?Q?GuUiiufevx1kssZKC4Gl/0YLq3kX9VnrSvNrYu1OWUfv9MWBu2zLei8Kuq?=
 =?iso-8859-1?Q?S7vwabfCX+kDhFfSH/tk12Iz+OSakzD86cnJLQgbxCTbEiBVFYD/4A655A?=
 =?iso-8859-1?Q?hWagprAEDIVnAiRWCEgmHklpp9At/HBLz0MN0JJWoN/ooRPXQC3A77HVm2?=
 =?iso-8859-1?Q?53bbJ9KhEV0v/UqaP+5mClJvmPJZxuOe0kGeYN37m7z+B+zPNXDMnMgL76?=
 =?iso-8859-1?Q?FJHMFIkKGxpqmK72VTZj280tRAmYelsVDFZFnHTYrWuTWL5IkDhaGCjvVY?=
 =?iso-8859-1?Q?gg7jp1ipMxJup5qCA/oLRbsxcHfGi0N8EH7dFThpgjzGY8R4I2A/iaV8xT?=
 =?iso-8859-1?Q?hEW8sx7/b1FjyPtGUgWmKIgdjz50fboh+M7jN89ljAKaH+ErzASwJX81U0?=
 =?iso-8859-1?Q?TI+wFqPll569vlLWP1c/GQoQ3EdyziA0gdfmXXAOCMg3EsNdm+/wnEtAWO?=
 =?iso-8859-1?Q?XAtsg6817mMwlVKlWC8RV6jwsYRq7AqwQ0xDlCBtHZUT4X97ruMsYBzB1T?=
 =?iso-8859-1?Q?l4z2gIuzF0d7wGyd1jhf/P0v1SBdjyuShvGIifcaYV1DWC6mnIbixsf211?=
 =?iso-8859-1?Q?qWEoWITHAP//Ai09qV7pKWlWU6HHjvF69ShYen6iK8ZaClQH8yxKUWG0tg?=
 =?iso-8859-1?Q?YBdISJ/sfWH0D6UhmWDiKpP5DQNmW8FeyYA4GpNOYCFQrl5w7CpbBn8rUV?=
 =?iso-8859-1?Q?LhGe3N3JzUYWNBWvEwnsAg/Upx0ql3iPdonECpGAY/1/qYkuUmZQhqA+D/?=
 =?iso-8859-1?Q?/zd1TBzGwAYiF4gOy96dAQk7mR7e2+3j4/fJ572VmRLqmM7CDyd1zuvZj4?=
 =?iso-8859-1?Q?DwdVIXfKUbP4o5Fgk2W53HvP+50FsZOwt6RYy+Ez8F2IzwLwEeyk4wNsji?=
 =?iso-8859-1?Q?KZyij4+N8ppOKVkRTvnF+xFrB/58OvpQFnSfAu31yV3ebAF+uS8i3MPkyp?=
 =?iso-8859-1?Q?VRkyHZOx2obrYtINTQpdynHpJglsT78dYGdyD932bRwrovLkJPCAGAhJWI?=
 =?iso-8859-1?Q?PZzVNCveOY4nqhq74ejuBwszpMN1t0RWHGrfeBsNK5xOFODHx5KmQ9RoQy?=
 =?iso-8859-1?Q?E8zbDeKualpMSYu3SLyU4jfK0JVx81reyPfIOqpvjaHfNIobop6N5swzKJ?=
 =?iso-8859-1?Q?UkNy+zvcxDr7X49ahxKMAvoxHkgHlklR8ANBCuTRfvMqsh2a/4buVj8J87?=
 =?iso-8859-1?Q?SXP4CKA8xgezGqC0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QSlOFkpHC4bntyrK6Vwk/vfVRlx+UadSrqQe8tRN2wdfKRHA56YfB0+HGp?=
 =?iso-8859-1?Q?LhudmoMryM4HRNHzWIm2bDDKcqrrbjsROs90AgiNyFTWNDQ14z5Dd9moZn?=
 =?iso-8859-1?Q?/pW91Lu/y3xV0axQqlcFeR2ocor5I5REkNLTBSdd1+sEBZ4dXhxA6nGBgB?=
 =?iso-8859-1?Q?jhC75nJkgoTeTgkEmQPqv6ue12ylf+YefD7nX8P09msmVUh1U6UTnkPzBW?=
 =?iso-8859-1?Q?JGMAM/KW9Y9ce57iNSXdnev5m8NLGd+PP7YoQJQu126n7aZ7L5OoT1nphF?=
 =?iso-8859-1?Q?1aQRFbni/bFbej55u0/IpJWqn4T9aF5Qqwmd2xrTUDBAczI3Z6z74vvUg6?=
 =?iso-8859-1?Q?rnM7PdKsJ7rpAF5RVum39L31Fa15eFNX+RLUBx9MtIa1jJ4wOeA5CSql65?=
 =?iso-8859-1?Q?otLCBBp3Qc3ZV65VpMX2SBEjNO75LUMRPPqeFiBDeQT/qwiNjRtNhpxHOd?=
 =?iso-8859-1?Q?Q/iAYmiPfQmhe/xp30M+9QNlVsP/QAayZY5DbNiRsf04LHd8myasyy+0WG?=
 =?iso-8859-1?Q?+OHkifYGavsGBo1gFURjQOWVeqTCB1VM9m+KVVSIr83uI69lF6HSpNS/QZ?=
 =?iso-8859-1?Q?rc7UEHJu6BMD7cOIuqfom6k820Ev7nWiumdtDghsCoDKAnM618TAygLvi5?=
 =?iso-8859-1?Q?sc4PHgrxPSXX95F63Rav9i2dQuojbobc+fLt1+++kCenPu6qVMwBAMfRhG?=
 =?iso-8859-1?Q?VO2znvwQykA40/Yo1jqkmRpOUVja6VHnTjr3KrIKTD9DS4XtHk1hRrmpnd?=
 =?iso-8859-1?Q?6l9+XB/54okXZVBgcOEiVQTPE8NaS210oxzRRPLqKlXz7O/TtxANJILZxq?=
 =?iso-8859-1?Q?ROtyWYFWfNPX46tTSGXaas6BytINvw5qskloO7/stXcmOtZ3S13UTZiWU+?=
 =?iso-8859-1?Q?IItg0DQlVjq3MAHN8vx3DYM7YICDPGcpW6kewHakxVQDqZAibD5fXu2d7M?=
 =?iso-8859-1?Q?vY2Q7a7AbQPXO0QHZ0ZhtlkOGOZ/ka7o4nUX3z0BNpw73cMqtqSMXtoxrS?=
 =?iso-8859-1?Q?TI32STK+s7EWZtP5GiypklujPIVrxcx6YqisxvlsTwAEdzuJUmWRaDAzpT?=
 =?iso-8859-1?Q?3rBw1q5Y1lECJSzBNYAFChDpQhU1J4c8Y5HyXZdWTvQWtA5ITTH9IocPdz?=
 =?iso-8859-1?Q?2CxnMtm+8OKGkv1hnwDknChLjk8+Afg4PHBE2Ok+jCjXBbGcXQ/EH85/+n?=
 =?iso-8859-1?Q?1/2R/TUMI8D54ZkhWon3OQOKtw/vMR5PxXa5j5a9W7ueQszpokv0Ba8yrk?=
 =?iso-8859-1?Q?qHYLOynVhwb3BctuhkVZtk5/LBIqiWYJt6lmbEJrZCEZVxHSkReltb5I5C?=
 =?iso-8859-1?Q?o5GHqtTn7V45L/CBEiJG5jBgPsdFV1pBTUrB1onUDqiBLONsLpKD4GAm7Y?=
 =?iso-8859-1?Q?RBKGYw8Zs3HATAXI7zvkzLQfh7yprr8+jxkWisnJPgUElEccxNILwoIjnh?=
 =?iso-8859-1?Q?33vC8A0s4hTth/7Dxa2OOT84GTS47HeLVRSx33vmRwmGdrbaw0xSXUhwpA?=
 =?iso-8859-1?Q?hf4Id6Jrqe9pgWKxPD/6R1vg2z/c+4XHyj63958GbMMHyfvZZq3dcZkArR?=
 =?iso-8859-1?Q?SMGU/JZgp7mXqf84dOjaiDOWH3vTY+mSiwxJd3nkKZSngz8ST5tRmfcf9U?=
 =?iso-8859-1?Q?3qs8172YzYe5iJWF1OmzI0gL9WuYGimJomx8FraIOBxX3LXmez7wzJuQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89633f92-1015-4e99-92e6-08dd4ad0ec70
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 19:18:53.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfsLimmrFZbBGBhhKYezOcA+NjgrIgChpTCim84YmuJoiRxwmxFWUq+GRm/I7gkNp3UqqGxtoERqDwe7H0e87Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
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

On Fri, Feb 07, 2025 at 02:54:45PM +0100, Thomas Hellström wrote:
> On Wed, 2025-01-29 at 11:52 -0800, Matthew Brost wrote:
> > Add XE_BO_FLAG_CPU_ADDR_MIRROR to indicate BO is tied to SVM range.
> > While these BO's are kernel allocations, we need a VM reference in
> > this
> > case which this flag indicates. In addition, we do not support CCS on
> > these BO's either. The later can be revisited later.
> > 
> > v2:
> >  - Take VM ref for system allocator BOs
> > v3:
> >  - s/XE_BO_FLAG_SYSTEM_ALLOC/XE_BO_FLAG_CPU_ADDR_MIRROR (Thomas)
> >  - Better commit message (Thomas)
> >  - Drop XE_BO_FLAG_SKIP_CLEAR for now
> >  - Add comment about possibly supporting CCS (Thomas)
> > v4:
> >  - Fix alignment issue (Checkpatch)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I was wondering, since the bo might as well be an external bo and
> benefit from finer resv granularity on eviction, (multi-device actually
> uses this), can't we drop the bo->vm reference? And, assuming tile is
> not needed either (is it)? Can we skip the flag altogether?
> 

If we make these external BO's, then this patch could just be dropped.

I feel like I tried external BO's a while a back and for some reason it
did not work but falling recall why. If external BO's work, then sure we
can make that change drop or revert this patch.

Matt

> /Thomas
> 
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++----
> >  drivers/gpu/drm/xe/xe_bo.h |  1 +
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index e914a60b8afc..20c96709e267 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1239,7 +1239,7 @@ static void xe_ttm_bo_destroy(struct
> > ttm_buffer_object *ttm_bo)
> >  		xe_drm_client_remove_bo(bo);
> >  #endif
> >  
> > -	if (bo->vm && xe_bo_is_user(bo))
> > +	if (bo->vm && (xe_bo_is_user(bo) || bo->flags &
> > XE_BO_FLAG_CPU_ADDR_MIRROR))
> >  		xe_vm_put(bo->vm);
> >  
> >  	mutex_lock(&xe->mem_access.vram_userfault.lock);
> > @@ -1435,7 +1435,8 @@ struct xe_bo *___xe_bo_create_locked(struct
> > xe_device *xe, struct xe_bo *bo,
> >  	int err;
> >  
> >  	/* Only kernel objects should set GT */
> > -	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
> > +	xe_assert(xe, !tile || type == ttm_bo_type_kernel ||
> > +		  flags & XE_BO_FLAG_CPU_ADDR_MIRROR);
> >  
> >  	if (XE_WARN_ON(!size)) {
> >  		xe_bo_free(bo);
> > @@ -1631,7 +1632,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> >  	 * by having all the vm's bo refereferences released at vm
> > close
> >  	 * time.
> >  	 */
> > -	if (vm && xe_bo_is_user(bo))
> > +	if (vm && (xe_bo_is_user(bo) || bo->flags &
> > XE_BO_FLAG_CPU_ADDR_MIRROR))
> >  		xe_vm_get(vm);
> >  	bo->vm = vm;
> >  
> > @@ -2503,8 +2504,11 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
> >  	 * system memory (i.e., it allows XE_PL_TT placement),
> > FlatCCS
> >  	 * can't be used since there's no CCS storage associated
> > with
> >  	 * non-VRAM addresses.
> > +	 *
> > +	 * XXX: Can we support CCS with CPU address mirroring?
> >  	 */
> > -	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
> > +	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
> > +			    (bo->flags &
> > XE_BO_FLAG_CPU_ADDR_MIRROR)))
> >  		return false;
> >  
> >  	return true;
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index ce55a2bb13f6..c01ed535a8c3 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -47,6 +47,7 @@
> >  					 XE_BO_FLAG_GGTT1 | \
> >  					 XE_BO_FLAG_GGTT2 | \
> >  					 XE_BO_FLAG_GGTT3)
> > +#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
> >  
> >  /* this one is trigger internally only */
> >  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> 
