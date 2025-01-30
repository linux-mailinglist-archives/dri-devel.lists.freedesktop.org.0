Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E7A232DA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 18:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048A810E9B9;
	Thu, 30 Jan 2025 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hACVDlpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AD310E9B3;
 Thu, 30 Jan 2025 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738258224; x=1769794224;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tGhhAkkU4go/xkps6p4B6ygtLuLUp+ECHVDnv4lZWk8=;
 b=hACVDlpk82U4oFCBeo8jxN7bjW//w4kSF5XdCOsE/zYvZNWK39F+D2Ah
 LLnCU9zkQa28Qm0dtOA/84F/k6jAceHTcEksTk8dUtdrQ4G2bQclt+bTT
 jha6kesAZssjWeJAdRmZoXJL1ikv14RN26iUtY9hrSOS0yGpep6N7VzmZ
 VosFebXatd4Fr5f6Sg5j6bRuOXbFnbBDpLRkjk8k2fjdDLqW3Nc3z9id6
 Ai2sNQG7fYQRJolJF+WXLZCP+64uwTmBm6syXfPtsjs4RWupPCiFhyz5z
 zDiQdfxzADuAfos7SQrdDddIvygc4F5RNAPPItcnZiPA02tAo8kcMrAIi Q==;
X-CSE-ConnectionGUID: BjhLA21TR1Obe5GY/9EXAg==
X-CSE-MsgGUID: bQjg7kgnQnqLEY9k83UKmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39085641"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="39085641"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:30:23 -0800
X-CSE-ConnectionGUID: Pg8bp4c8S9y6XLEU1xkQbg==
X-CSE-MsgGUID: /VzWGm9wRrGiOvNN1zLSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109353767"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:30:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:30:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:30:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:30:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIcM435ATUDUBLlP2xaQmRl5WubL8SEY4kxqCeulgTj5YQItssUcW386ILnKLqcGklRdGlM9O/Y+l2TNQYXRuY4M3B9uv6mm5L//NZuqCXvO1+bmcojNtTakvGOFUoqu/zu3jysgje5gEKU888TJgRr61LIZBNaKi0efSq9yX2M8LKkWiH3dHPyl8hNZfDLKfYpJ3yKt+hupXpPPd6245NEs3F8a9Sf7sUANZgiqumhQnKxLcyDP7s2nRrWBlICVh9Y451akJLCBNNn3xp+9U5D4U3F1ySP4KaMYLZJC3HPbAil6yZBAjuQlqRZlOs3iUOSvNCuCQQvU1k91EyA/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gievvLhyuxhRyWH59CjCEniAHKborzU2a8fN6TgLnQ0=;
 b=wqyAwAX136wKA4qkBLpbk60L2FTzC72ALeRgsix/WjwbTONixxwp9yk2uPF3OhywcXPnVqe7elPbpvSS+g6NNCt52BTdqtrU4ftxP23wR3jF2/R6BM3hOQVf+AA+YEVd39T1btmS4KilbrweYIo6sSPsyPJOwmQ7H6qX+QCktr+OLbzZu4yo6M8WSo8ryE1fG/qcmWsC/qbRQzba88xG+AI5vZuNimoTQ9SOBFVgOHxAYLqfxT+rnO1Nn3Uz7IQ9Anf4eUS72cQRjC3HtupUteQMqpFWD3Wm7NMIi64V/ZJP1T+Zrt5bGAmjWCE9e8/YUNUSXUDkTFyJJ9rkIG14eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 17:30:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 17:30:20 +0000
Date: Thu, 30 Jan 2025 09:31:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 28/33] drm/xe: Add SVM VRAM migration
Message-ID: <Z5u3YyxWSGvDONl5@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-29-matthew.brost@intel.com>
 <01d5d109-aef5-463f-9475-22c2483501a3@intel.com>
 <Z5uprTtHJqOsn0EB@lstrano-desk.jf.intel.com>
 <93473543-9536-46f2-aabb-ee5e4dca60cc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <93473543-9536-46f2-aabb-ee5e4dca60cc@intel.com>
X-ClientProxiedBy: MW4PR04CA0140.namprd04.prod.outlook.com
 (2603:10b6:303:84::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 25185b4e-5652-4a19-b9c6-08dd4153c504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lPYW2xEf0dpL5PuSJ0R/2Qut9hvzalKZt/ccd+MWwXvqnVt1IZQsxH/BJQhb?=
 =?us-ascii?Q?mfcdvusY8sOwETKh225de89ZwvRonuKpdPfdBPDsP7b/xj1jiH5BL6v/4KS7?=
 =?us-ascii?Q?U9JhFHMJSJR2p/Z93F09oMVvQuAGWedT3XpSlRSREL+03MGAjreuSuTvsu/H?=
 =?us-ascii?Q?lrx/CTNikQ+NqvsCodiDbcaUlgH9ReHZoggaDly+m9NjMvGNT6B72C/1pvTG?=
 =?us-ascii?Q?4bmGOje/fvhsRIqgmXGXXgGdQxVQjnArPOAamSuE9zfoCoz/nisuCCNafp4t?=
 =?us-ascii?Q?50dHxiI7nM6xR4hKPOgPWTWiGff+ijZ7fC9/5ttFM1Xp3rUbRU2PYG7GGWpM?=
 =?us-ascii?Q?U2GR2Nw+gPEdYVkSxRqRuV8xv9DzT6Zsz26y4NiyXk5t4tsLoqwoyPH6wtwY?=
 =?us-ascii?Q?JOLRz0INUHL9rkrjwA/IRsxxeHWh6k2CJnYnxBuWCEONcSpOdHj4/1BiAC38?=
 =?us-ascii?Q?EGfs5DbD9OfnYTjaPS5FmD4RjszzI/m7yLU8Hgb0Ng1XGKFzeIEGKZqIKbTw?=
 =?us-ascii?Q?qIFw+5yqxhfrS/h4I49D+HQZUvxB5xhfKNH+6kMqsBBvY0lA02EyWZ+2RlSp?=
 =?us-ascii?Q?oLj/9Tl25cswszcgCbbd+sQLyvFbNtqz/IRaWmjI9OazIRW8Pk0eQFhFNQaA?=
 =?us-ascii?Q?EGqYiJFzXpLDpSO7xibjjtFy9VVfkRj+SYVKGlCRUfuRFzOd7ZdUccKiNOyh?=
 =?us-ascii?Q?SEeg2aZLQtIK2WfsJjlxVn0eDlNPvXj8MssKcpDN3b3/xXM3NfUAI8xuqUZQ?=
 =?us-ascii?Q?M+qdsveBmEBDber7q/W9DiWyW+tUxvjSaiwaZbOKVBsP1e3S5YQJ3OHjSkYB?=
 =?us-ascii?Q?146uJUvXCSLCdrKN4qTWm2MvDIr5P18+ha9Xn3CGHISDRRgOmH6idiyTZhvX?=
 =?us-ascii?Q?kbo6vZxVI17ay9DfZKgpTac2yubFCH8YBwmxMZxCpUGBMbLzzbH2wS1bjeGQ?=
 =?us-ascii?Q?JmR3Tsgge1ij9AMoyYhCKi2eYxGFWvOCei9o/EgcxM7wFMgslwDHUohTVLEA?=
 =?us-ascii?Q?ByBXajoU6mvnuR2xHLdccZIv5EOPweRgsMVNOqgZCqdEtA1UYSQKqqPNg6C2?=
 =?us-ascii?Q?oSWIhhbxAlRMXYxfgVKCOvrYmAzJZCT2d3emFGFfsk37A5dUVRo1VBDf0fjQ?=
 =?us-ascii?Q?oAEmxHDYbClbcZ/1nPKPcvRPjx51hDU7WMNZ8FfCfAVKxGt6fSlH0uPNllYS?=
 =?us-ascii?Q?j+KDQ/QqvznHDWdCR5L65a8cNFZCPVvyFh09lu1LSUME25+FdNjPsa1TYcU9?=
 =?us-ascii?Q?pt6a8oN8SM+CApeqlPqN6APNV3WqZR2ZY/gyB6vzdv19K4q4iwumDzM9wvQS?=
 =?us-ascii?Q?FtUACMk0UGUMQBnWPe55Lf2WsWRFya201X7nhWZZzGXHxQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?meKJvBguRkJY5Nejy+3FQ7KFrntR0nbIGbkIYwSsU+SYr5Xz60mEVCpDdPOF?=
 =?us-ascii?Q?tnImF15kHxcJi8BRlLwTZFj6V8ELrL+gyss9elJUwrbREgKq1c33dcZblQWC?=
 =?us-ascii?Q?rgb0Mp66Y8oFfRgzRphN6Kz2QbIm68m29V901qbJLmTOU2ttWyOmzj44Y9iT?=
 =?us-ascii?Q?RZuUr3XtMIapm9qeUsarM/1pKtb3oPJGKjA3M3qR0DiBm1ypTy4ttqWDmmMK?=
 =?us-ascii?Q?WZxd4LPbo2Xbr6bLoShTgwqXdgesWi6cjLfc/J+aTFaJTU5H5zO0rT9MJaMx?=
 =?us-ascii?Q?fwOxneOEwIiV/vSVkgi9EFCvx1nUnLHPj9plmtQ8jkWcXdB8f48+LLeWqg6M?=
 =?us-ascii?Q?L2oBHgmmBCDciD7Qzib8UUfmxHzuc0httQ0k24DNC6YSrQ85IVOl3Si9DOCi?=
 =?us-ascii?Q?q7ZbukJFAoXysaRiFTJXbt6mz6d6Pgut70P11DyTDIk60pqPR0LPr4vlsm2T?=
 =?us-ascii?Q?jbFDDLpad8N1Bqjl5zCxSuBGYfo02AIlb7MArINja0PclX9zi6L8pV59LfSM?=
 =?us-ascii?Q?vmROnU6IuyD7YlO3rmPtztqHH0KZ04E6Y3zUzDk/aJBxpr3Gwp81+pziliBj?=
 =?us-ascii?Q?ypxmNjotqi8VouXA5EpxmYaMGAxDGlU9PISKtEmP7An/mk89TWneNRBRQzJn?=
 =?us-ascii?Q?piZslNYk9BZm7LktoQ9yEQ/mRXs8mX6Ph0USX/NyrWtqgo7SY+UqQWsm3lCO?=
 =?us-ascii?Q?nEIiB8XVomT7TWgmQ2Au0+1MvRd4c+6+XziMT9vgABEFSBdGCEpEElIXzVW+?=
 =?us-ascii?Q?KSHQJz+EVJ07imqrRUK95DGoQYA3XqGyhWBYNFJczl//KVO161NkM43YNZP8?=
 =?us-ascii?Q?bN9jLf69hbrx5BkpP0Bp+eCENNNfq5/cs0E4KvFhW5YGsDX+FMA7z0eSMrvL?=
 =?us-ascii?Q?4p2RDcgBkNFlvKnoeBrkJs0v/6DiYcFnvt5R6WNz87PfbS6dxJWT+OIqNbOU?=
 =?us-ascii?Q?cPeSy1YDzFLROj7o5IdwlvpGrpGomMZZVAOlBu96VcetLpPv3JB3GyNHAdEc?=
 =?us-ascii?Q?6tNyXvTQ8vi32VTT72cHU3Pd3ngSYNcT3Z1Fjp5kzfG/7G7StuGe+iHyeyIf?=
 =?us-ascii?Q?MPaXEL0ZZOKHAIs90EVym1JCP8shg94rRU6o+0T4vD5I3f9aZQpHG3XlCXSM?=
 =?us-ascii?Q?lXI/41bEJKLWDCYHuqP6JLIPULbD6pvxrU2GEWZVGhakacFGBmLB77XW+2nL?=
 =?us-ascii?Q?qJDUxF04hP28SWWCED1OuuwetKvTE5BvicEy8DNIw1o2ffLpOJYsebnYzu2e?=
 =?us-ascii?Q?0CVJScSpXV1XvOZXAJ0tr6nseyhLs9qTIxFG/ae/uLd7ubV4eiUuCNQgfjJR?=
 =?us-ascii?Q?EBPhkfuRi/Ovike2hUfoPCPUdGfb7g0LBjRBflAIi/+bo/i25E8qtqgqMdlA?=
 =?us-ascii?Q?Kqe5kfmMmFBvueR4pliDMdtdPSy8rBG5tLucJBosSQO1KySqCTKdjfT5xLm1?=
 =?us-ascii?Q?3bbqN1GhBCzRa3hyOjA5XeAnVAsKCwFyyE3njpvb4BB472XPLKVLm7oJaLX/?=
 =?us-ascii?Q?9KE8KcX73fVVnJUzDbfLkqCDDh44tBYqzJjyqe/RX6Bn4W9ph09+SvHj7x/+?=
 =?us-ascii?Q?vNaj9A4FTopYD2c1LDx8VQ3WZsJSnkpbs5FF+PG5hsEvqrM259SE6YVwVAec?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25185b4e-5652-4a19-b9c6-08dd4153c504
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 17:30:20.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLk40Eyawmo7suMlRP2T3aoUQfEgVritsNEebBlyDIXg9ic8tcWkwpmQQ0MnAbPSRRobWwXWyirDUZbdeXIlCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
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

On Thu, Jan 30, 2025 at 04:56:39PM +0000, Matthew Auld wrote:
> On 30/01/2025 16:32, Matthew Brost wrote:
> > On Thu, Jan 30, 2025 at 02:22:55PM +0000, Matthew Auld wrote:
> > > On 29/01/2025 19:52, Matthew Brost wrote:
> > > > Migration is implemented with range granularity, with VRAM backing being
> > > > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> > > > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > > > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > > > 
> > > > The design choice for using TTM BO for VRAM backing store, as opposed to
> > > > direct buddy allocation, is as follows:
> > > > 
> > > > - DRM buddy allocations are not at page granularity, offering no
> > > >     advantage over a BO.
> > > > - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
> > > >     evict each other).
> > > > - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
> > > >     require a dma-resv.
> > > > - Likely allocation size is 2M which makes of size of BO (872)
> > > >     acceptable per allocation (872 / 2M == .0004158).
> > > > 
> > > > With this, using TTM BO for VRAM backing store seems to be an obvious
> > > > choice as it allows leveraging of the TTM eviction code.
> > > > 
> > > > Current migration policy is migrate any SVM range greater than or equal
> > > > to 64k once.
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/133643/
> > > > 
> > > > v2:
> > > >    - Rebase on latest GPU SVM
> > > >    - Retry page fault on get pages returning mixed allocation
> > > >    - Use drm_gpusvm_devmem
> > > > v3:
> > > >    - Use new BO flags
> > > >    - New range structure (Thomas)
> > > >    - Hide migration behind Kconfig
> > > >    - Kernel doc (Thomas)
> > > >    - Use check_pages_threshold
> > > > v4:
> > > >    - Don't evict partial unmaps in garbage collector (Thomas)
> > > >    - Use %pe to print errors (Thomas)
> > > >    - Use %p to print pointers (Thomas)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_svm.c | 99 +++++++++++++++++++++++++++++++++++--
> > > >    drivers/gpu/drm/xe/xe_svm.h |  5 ++
> > > >    2 files changed, 100 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > > index ba1db030bf33..fc030855d078 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -502,7 +502,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
> > > >    	return 0;
> > > >    }
> > > > -__maybe_unused
> > > >    static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> > > >    	.devmem_release = xe_svm_devmem_release,
> > > >    	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > > > @@ -582,6 +581,64 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > > >    	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
> > > >    }
> > > > +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
> > > > +{
> > > > +	return &tile->mem.vram;
> > > > +}
> > > > +
> > > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > > > +				       struct xe_svm_range *range,
> > > > +				       const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > +	struct xe_mem_region *mr = tile_to_mr(tile);
> > > > +	struct drm_buddy_block *block;
> > > > +	struct list_head *blocks;
> > > > +	struct xe_bo *bo;
> > > > +	ktime_t end = 0;
> > > > +	int err;
> > > > +
> > > > +retry:
> > > > +	xe_vm_lock(vm, false);
> > > > +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.itree.last + 1 -
> > > > +			  range->base.itree.start, ttm_bo_type_device,
> > > > +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > > +			  XE_BO_FLAG_CPU_ADDR_MIRROR);
> > > > +	xe_vm_unlock(vm);
> > > 
> > > What was the trick again to ensure eviction is not triggered at this point?
> > > I thought there was some trick with eviction_valuable() but I can't find it.
> > > 
> > 
> > I dropped that given the hacky nature of how it was implemented. Yes, it
> > is possible that we allocate VRAM and it is immediately evicted before
> > the bind occurs but in practice should never really happen given this BO
> > should be the last entry on the LRU list. Even if this happens, I
> > believe this is harmless given the bind will abort and trigger a retry.
> 
> Looking at xe_svm_bo_evict() it wants to use stuff like
> bo->devmem_allocation, but that is not set up yet?  For example
> dereferencing the devmem_allocation->mm from there will potentially hit a
> NPD?

Good catch. I think drm_gpusvm_devmem_init at least needs to be moved
under BO's dma resv lock.

The multi-GPU work Thomas is doing will even expand this scope further
to include drm_gpusvm_migrate_to_devmem under the BO dma-resv too - this
was ommitted in this series given we'd have to rework the mmap read lock
a bit too which I'd prefer to wait on until his series.

Matt

> 
> > 
> > Matt
> > 
> > > > +	if (IS_ERR(bo)) {
> > > > +		err = PTR_ERR(bo);
> > > > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > > > +			goto retry;
> > > > +		return bo;
> > > > +	}
> > > > +
> > > > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > > +			       vm->xe->drm.dev, vm->svm.gpusvm.mm,
> > > > +			       &gpusvm_devmem_ops,
> > > > +			       &tile->mem.vram.dpagemap,
> > > > +			       range->base.itree.last + 1 -
> > > > +			       range->base.itree.start);
> > > > +
> > > > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> > > > +	list_for_each_entry(block, blocks, link)
> > > > +		block->private = mr;
> > > > +
> > > > +	/*
> > > > +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
> > > > +	 * creation ref can be dropped upon CPU fault or unmap.
> > > > +	 */
> > > > +	xe_bo_get(bo);
> > > > +
> > > > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> > > > +					   &bo->devmem_allocation, ctx);
> > > > +	if (err) {
> > > > +		xe_bo_put(bo);	/* Local ref */
> > > > +		xe_bo_put(bo);	/* Creation ref */
> > > > +		return ERR_PTR(err);
> > > > +	}
> > > > +
> > > > +	return bo;
> > > > +}
> > > > +
> > > >    /**
> > > >     * xe_svm_handle_pagefault() - SVM handle page fault
> > > >     * @vm: The VM.
> > > > @@ -590,7 +647,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > > >     * @fault_addr: The GPU fault address.
> > > >     * @atomic: The fault atomic access bit.
> > > >     *
> > > > - * Create GPU bindings for a SVM page fault.
> > > > + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> > > > + * memory.
> > > >     *
> > > >     * Return: 0 on success, negative error code on error.
> > > >     */
> > > > @@ -598,11 +656,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    			    struct xe_tile *tile, u64 fault_addr,
> > > >    			    bool atomic)
> > > >    {
> > > > -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> > > > +	struct drm_gpusvm_ctx ctx = {
> > > > +		.read_only = xe_vma_read_only(vma),
> > > > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > > > +	};
> > > >    	struct xe_svm_range *range;
> > > >    	struct drm_gpusvm_range *r;
> > > >    	struct drm_exec exec;
> > > >    	struct dma_fence *fence;
> > > > +	struct xe_bo *bo = NULL;
> > > >    	ktime_t end = 0;
> > > >    	int err;
> > > > @@ -610,6 +675,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> > > >    retry:
> > > > +	xe_bo_put(bo);
> > > > +	bo = NULL;
> > > > +
> > > >    	/* Always process UNMAPs first so view SVM ranges is current */
> > > >    	err = xe_svm_garbage_collector(vm);
> > > >    	if (err)
> > > > @@ -625,9 +693,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	if (xe_svm_range_is_valid(range, tile))
> > > >    		return 0;
> > > > +	/* XXX: Add migration policy, for now migrate range once */
> > > > +	if (!range->migrated && range->base.flags.migrate_devmem &&
> > > > +	    (range->base.itree.last + 1 - range->base.itree.start) >= SZ_64K) {
> > > > +		range->migrated = true;
> > > > +
> > > > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > > +		if (IS_ERR(bo)) {
> > > > +			drm_info(&vm->xe->drm,
> > > > +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
> > > > +				 vm->usm.asid, bo);
> > > > +			bo = NULL;
> > > > +			goto retry;
> > > > +		}
> > > > +	}
> > > > +
> > > >    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> > > > -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> > > > +	/* Corner where CPU mappings have changed */
> > > > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > > > +		if (err == -EOPNOTSUPP)
> > > > +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> > > > +		drm_info(&vm->xe->drm,
> > > > +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > > > +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > >    		goto retry;
> > > > +	}
> > > >    	if (err)
> > > >    		goto err_out;
> > > > @@ -658,6 +748,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	dma_fence_put(fence);
> > > >    err_out:
> > > > +	xe_bo_put(bo);
> > > >    	return err;
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 63daffdfdbf6..4c2576162c39 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -35,6 +35,11 @@ struct xe_svm_range {
> > > >    	 * range. Protected by GPU SVM notifier lock.
> > > >    	 */
> > > >    	u8 tile_invalidated;
> > > > +	/**
> > > > +	 * @migrated: Range has been migrated to device memory, protected by
> > > > +	 * GPU fault handler locking.
> > > > +	 */
> > > > +	u8 migrated	:1;
> > > >    };
> > > >    int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> > > 
> 
