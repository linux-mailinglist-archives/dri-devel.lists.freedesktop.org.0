Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D79A271A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 17:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF4F10E863;
	Thu, 17 Oct 2024 15:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrYTujXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837E610E860;
 Thu, 17 Oct 2024 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729179703; x=1760715703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CIbGqsPm9SIOnZz2MAAWF6VxswhpVf0Ps6OxDEba8cI=;
 b=HrYTujXvNLpns3JrR4vM7y5M7yfvxHtBLi9d8aW3v8ZgTf0sXfVHNOpH
 DgckrhuOqxqHJ0zEbW3nlc8aFcC1tFjhIKnd/IBC2GbnNWfsXRhR5zt0G
 7lPGt7CmESsv7uLuadyfWSMiXByVuyg/zyepRTwwxWZVHowBWtpDoqBit
 Q94RK2kJzQpK/jVvMgLEL7yrpoRUBo5w3sHeJCXhxQMhQOPSNdtQqUEJ3
 ztppeZlTBcdsCn2e0wTSrHw2kk1/A87Ko4hief5mpXw3ARkzC9nVuDOc7
 ON2UqKaJltmQLXAN+gD0vH9UnpKwiZdYZesI03KVJ1jDbVCg+WDexOyYt Q==;
X-CSE-ConnectionGUID: 0g5itXP4Tt6APwxx3AI72g==
X-CSE-MsgGUID: iJ0vIi9lTdKX0JgCLMaiaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28879544"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="28879544"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 08:41:43 -0700
X-CSE-ConnectionGUID: 3+4m6osGSpuvqHXSSePu9g==
X-CSE-MsgGUID: 0Lep/A6ATx2gyvZXzNnhnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="83225760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 08:41:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 08:41:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 08:41:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 08:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpO2dMtXgekZLnalJ5UJn1ljcOd4betIhZKnbdewWAqSD8ZhU2m5PewjwcYiVMSZtleRhNeLObhRbxd3dJRIS8bsEXUykSl4XUai/x3ED+aXZn7WR+uS3mDCpA0IRoINMVPpfs9nX3rqV8ks4zshvChty6gpile5s8tcdnBMOlhxYk/u3nPIL6BybDnJJ6PGFvwnO/f2Z40QKuiSQEqzYvD4pmNmwxICt/9f7ElGt2S+96gHYoQOWOr+u1J8nRRj5Y4Vck/aU+5aTHIk+7aseYwFhKl9FZafELVFt3yvHfIzTaqfEMtiGs3NpaooHaG/UDm7nxo0UHa1WHFhp0Bh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK2nkJ251SkgUSiueAtgRosaa3mvuWXHmfX38caNc4c=;
 b=yzEyyhxr237IGWc42NPglk+5L9Hs6i242W0U7T1mU4zx6ZtLy90YzvzS1xVmX26PoTzZfE2u9CleFwf1OMlKr2yaiwDRZ3NtUn3hs7+zjzCoJA2ZF+1QExbg5+3Ivu87HlbcF3J1txRRlmkj0BqfWqwxdxL0jkqb+K3E9qUz7oPAVQ8CstEfXEUAdH8SgSb20C2/2zda0Wu4cZehjSoBJtY3CZMOW6Y0N4/nOl+uZbo8kCMII2Q2/E1BPLWev68l1yVUPrToN5V6K2zXu5thpxVlVtqBn2dS/jyNMaMT65cUlVwyJ/k0CG9kRoH61giAJt65W5yZfLLTeSWkUx3sGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Thu, 17 Oct
 2024 15:41:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 15:41:35 +0000
Date: Thu, 17 Oct 2024 15:40:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zfn3mg69.fsf@nvdebian.thelocal>
X-ClientProxiedBy: SJ0PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9cd6d4-d380-45a5-1893-08dceec22e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t36se9ixJPUO0Mxd8sOh1sD9RpoOgKhGhG0Eooi52kVLsYykRwrd9jrA0i4a?=
 =?us-ascii?Q?V2QcukGiitr0N4o09Mr0UTrFenhsXrxhuxCzVrXnEbMlTRbVp+65iuDdtYEq?=
 =?us-ascii?Q?H7ibbxX+wCeZKNi7hNiG6vOjgAMVQTIeKr1EFe2p4abppSw6BZVhzta3iwUw?=
 =?us-ascii?Q?/KAhRPXkbiRcwXtNHcYSZMBeRc7COAJ6mNAVVlTLPaSjZV79oWiBY2OYK8fM?=
 =?us-ascii?Q?UoQwh16NoCMJ+iUx8wx7dhs47dcR2bTikN0c0e6KNEuSerZn7Kmfm/y5dBhU?=
 =?us-ascii?Q?wEU9iUZ9/+ez72abfCJJ7GuQgZURsQMvocLR8TnVSS7r82Ak2iEPWDuOo43U?=
 =?us-ascii?Q?DGracDeua4wjrvUWtPnyFaEQlHqLlsO2g5RRhb6OgLEABmJS9bWJUayt2e9n?=
 =?us-ascii?Q?DnmYZEkLcKbg/NfcZv2rPzBr/UA7cdtTIhj2DXBhw9upBqy3NuJye8LZZV1k?=
 =?us-ascii?Q?EAMGxwUZXCjiw4dS6WKjFrRC/6Wz34hQ/NZLdDqvI/UIhzhLfvhy11hsof0n?=
 =?us-ascii?Q?/ERVwAN0/qhC8G0jOW81cUt413s4qg9GY+1tfXLoGwJfOLgSSjQce9jx5GqY?=
 =?us-ascii?Q?ln7JTzEHnT4zIBmLsMuSkwBbw0VMBpmM6MCLz1EzckXAeg6XgdciRARzZGPE?=
 =?us-ascii?Q?a/HWjnGOr0PjF0PhEO5OtAshzPmdwlHZW27PaF+dL1Laf4nt74dZKFlVWPmX?=
 =?us-ascii?Q?f9R3mjPGGtyobPXrLWrRt852o6a3CcO8aRM7YNAZ7aTABdrQmaoHkhd9pcBX?=
 =?us-ascii?Q?zI+MkWHf6Jzer4+aIcXTzE5hs0zqJRafAkzNwDqXg37UI31THU34BvlS1xR0?=
 =?us-ascii?Q?RsmVSBPsKriXt+Qg2aOSYTHVEcGMvEgU6GWnrQAEpaXi6wGnHOVyA3z6KkGi?=
 =?us-ascii?Q?MbKQM7iIzs8wQ/wTOA/0mBbxmrXQ9R8WDbv6UiiUZsNMT2Sxamx9GLeCbTpM?=
 =?us-ascii?Q?W9QsEB6cIkugkiaYmSUEFHK/dXiL9iKVMHO53bbT72YgOAS0X88mqULndze+?=
 =?us-ascii?Q?x6F5s9fHuglQhlvGeFCLlqf/hl76Nx9GitDdqoWzDgpZpvxFms/FKDsr2Ouh?=
 =?us-ascii?Q?GywpI3M5A3CndOBKUcgge6J9brXxz1LCNeLM5pMjm+shAQgJ+8Va/20zCs82?=
 =?us-ascii?Q?Rq1QFKGKPYsR30rha5hPnuEIHtRMDj51MHyfZ21VPfmwAQe7hbks7G9KZPPx?=
 =?us-ascii?Q?CwTbF+WPF88KV60kO+LU+xa/nQFJqVdOD8Nssd7/isBM3C771V8/MS0wjfLq?=
 =?us-ascii?Q?Kqx+VcIwBPg84g8ijc4SlN/1V4rCJMK3zYZNWR5/4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qi4aiAnJ+hmxJelLkmX4ZYpbkDDqAkcH3udQmYMtn/MFCZcnjt/D1LJ4IVDj?=
 =?us-ascii?Q?DxKfkN0sgAaWXxv85CxjIkd4VZGQygSM07kUqHQSAhM9+hrJJGQ9LORrnceb?=
 =?us-ascii?Q?y0xRbX5hewtSBWkXVJNfuDunegrCs1GAK4t47T75nWJr0RAf04nyyjvfkpIq?=
 =?us-ascii?Q?mtwnT+Fc7i4Li6iBX7QlyN466S0BEoD4ERQTfshZvADkCOoUgy4D4AolYEJE?=
 =?us-ascii?Q?vFDIrGn2ONn4LGoiAR3vciG3xMVmxYmddPz+oQwULtxw5GAtsK2aJJnlp+2T?=
 =?us-ascii?Q?VWkvVGHyT3rBE7qeFWV1166SZu37+o5o04gJksp8CeFdJ+fORoxtudOMtcZR?=
 =?us-ascii?Q?Av+q7xK4e1kVe9DrQwtn8lLdMTXS8oBCKNrjJMHw5QJt/nZRGn2vwgcGKeOp?=
 =?us-ascii?Q?4b2NSmxfOVLlLQizj62zfvacBsqcA8Zi2AuEExdUoWcgeGO9RlGTKQXCNRwL?=
 =?us-ascii?Q?sk/095ff3E/zcbeu6WwuDv5z/oEfuzPQCBFijiqcrxwvOIViwAOFFBAZXqou?=
 =?us-ascii?Q?QYxj48i837g432kQmbZSndMxRq6fmL6B4J1Ph+DQ1kXGrfFcZ2udgA34xJjN?=
 =?us-ascii?Q?FB1va2+TiTFhQRD/3t4CyVELQLw6WHZ/58eyCwTE1Jk18QqV/AEaRnwId9gd?=
 =?us-ascii?Q?VPvA30Y0ScqnxaMkuOnOIOV32YvOcwbtKsq5S+cHrL51S3fl0Bs8PVZThZUg?=
 =?us-ascii?Q?d7ZiFT+WXhjgcIQ16yqm9FkqoiFEQIQpKjyoia0dPTsPH1yzFf31H4Gde8QZ?=
 =?us-ascii?Q?qFlDTeBc70OIJGkGYne6jXD2jsUyZsxoWotCzcmZfwwLc/HjG6ud+z12/Ux1?=
 =?us-ascii?Q?2UW81GmiShr5hT06lsuVRBk+4m4RVrGZ+wyZ/98/j4I0fx4wqUA4pfgYN9Dm?=
 =?us-ascii?Q?zrdq1uRBiiOND6mlbi9EXowqzkbEW0cTO/SHGHrxJprouo08wIkbfOZqHNng?=
 =?us-ascii?Q?8GRkuSUGTgXQbxnffKHHcDjaMiZAuO9Uo8EAnMTDszVNxxg1AIJ91y2dEQib?=
 =?us-ascii?Q?3utKXTA2oMSAK91zqCsgJBB/pLte7zXLqe7jPKgXsqbE6js2vmkbjDLe/tsU?=
 =?us-ascii?Q?0q5u7rWVCUDVK3CTJIybGOfnPy4st78Fj0tNCu1ArNJTmWcZD6VrHP5sFpud?=
 =?us-ascii?Q?O5RLP0dVEYGol5PEx9T70fmSmzcH5c9G6EChWHAC/OrjTvGvjX69vlTOLhpN?=
 =?us-ascii?Q?aVuwKX+f80Azib2JK3y7sppqaoe9Xe00T6ftu/RCNhG6qumdLMu6o8kMO2Pk?=
 =?us-ascii?Q?M6nDesxWf893bVRKsncznCytADY3dTmCQc9IEecR0goX3EJK1Q5DGgxD7SaM?=
 =?us-ascii?Q?ysdc9sB96zCfCoOgcg/+ToskLoipJl1G9HvvOsQbBd8suimGGk4//QOkW4tw?=
 =?us-ascii?Q?pDgYt3DhP3z/kG4vdanzJrDwrMrvK3Rs5HGLJc9lCi52f4L04I8qOCWj2QdG?=
 =?us-ascii?Q?uE6sfom3w8bo4yhoha9SHItrhByFzk4vPvJnQa7LUIb30GSqhw0ecl0AtN0z?=
 =?us-ascii?Q?R/NSVINuknNTpqjbdjD9gcQhqgzLdokVPYddkYfAmp0v805cyz4W+jE1CP1Q?=
 =?us-ascii?Q?bwAiZELiHOWBUr0zE815mge0NH0Rxq02avJ/zK8bEvCLEq44RVmzQDRm467+?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9cd6d4-d380-45a5-1893-08dceec22e6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 15:41:35.0917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzJN7TARUeJf6reeIBFV2oCKtR9dYCc9A61U8/IkFyvxDmwW8BchxPYGdpUwKDqozVln1QpMf/KMzEsKKHwPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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

On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
> 
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
> >> 
> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> 
> >> > On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
> >> >> 
> >> >> Matthew Brost <matthew.brost@intel.com> writes:
> >> >> 
> >> >> > On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> >> >> >> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> >> >> 
> >> >> [...]
> >> >> 
> >> >> >> > > +{
> >> >> >> > > +	unsigned long i;
> >> >> >> > > +
> >> >> >> > > +	for (i = 0; i < npages; i++) {
> >> >> >> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> >> >> >> > > +
> >> >> >> > > +		if (!get_page_unless_zero(page)) {
> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> > > +			continue;
> >> >> >> > > +		}
> >> >> >> > > +
> >> >> >> > > +		if (!trylock_page(page)) {
> >> >> >> > > +			src_pfns[i] = 0;
> >> >> >> > > +			put_page(page);
> >> >> >> > > +			continue;
> >> >> >> > > +		}
> >> >> >> > > +
> >> >> >> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> >> >> >> > 
> >> >> >> > This needs to be converted to use a folio like
> >> >> >> > migrate_device_range(). But more importantly this should be split out as
> >> >> >> > a function that both migrate_device_range() and this function can call
> >> >> >> > given this bit is identical.
> >> >> >> > 
> >> >> >> 
> >> >> >> Missed the folio conversion and agree a helper shared between this
> >> >> >> function and migrate_device_range would be a good idea. Let add that.
> >> >> >> 
> >> >> >
> >> >> > Alistair,
> >> >> >
> >> >> > Ok, I think now I want to go slightly different direction here to give
> >> >> > GPUSVM a bit more control over several eviction scenarios.
> >> >> >
> >> >> > What if I exported the helper discussed above, e.g.,
> >> >> >
> >> >> >  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
> >> >> >  906 {
> >> >> >  907         struct folio *folio;
> >> >> >  908
> >> >> >  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
> >> >> >  910         if (!folio)
> >> >> >  911                 return 0;
> >> >> >  912
> >> >> >  913         if (!folio_trylock(folio)) {
> >> >> >  914                 folio_put(folio);
> >> >> >  915                 return 0;
> >> >> >  916         }
> >> >> >  917
> >> >> >  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> >> >> >  919 }
> >> >> >  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
> >> >> >
> >> >> > And then also export migrate_device_unmap.
> >> >> >
> >> >> > The usage here would be let a driver collect the device pages in virtual
> >> >> > address range via hmm_range_fault, lock device pages under notifier
> >> >> > lock ensuring device pages are valid, drop the notifier lock and call
> >> >> > migrate_device_unmap.
> >> >> 
> >> >> I'm still working through this series but that seems a bit dubious, the
> >> >> locking here is pretty subtle and easy to get wrong so seeing some code
> >> >> would help me a lot in understanding what you're suggesting.
> >> >>
> >> >
> >> > For sure locking in tricky, my mistake on not working through this
> >> > before sending out the next rev but it came to mind after sending +
> >> > regarding some late feedback from Thomas about using hmm for eviction
> >> > [2]. His suggestion of using hmm_range_fault to trigger migration
> >> > doesn't work for coherent pages, while something like below does.
> >> >
> >> > [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
> >> >
> >> > Here is a snippet I have locally which seems to work.
> >> >
> >> > 2024 retry:
> >> > 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> > 2026         hmm_range.hmm_pfns = src;
> >> > 2027
> >> > 2028         while (true) {
> >> > 2029                 mmap_read_lock(mm);
> >> > 2030                 err = hmm_range_fault(&hmm_range);
> >> > 2031                 mmap_read_unlock(mm);
> >> > 2032                 if (err == -EBUSY) {
> >> > 2033                         if (time_after(jiffies, timeout))
> >> > 2034                                 break;
> >> > 2035
> >> > 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> >> > 2037                         continue;
> >> > 2038                 }
> >> > 2039                 break;
> >> > 2040         }
> >> > 2041         if (err)
> >> > 2042                 goto err_put;
> >> > 2043
> >> > 2044         drm_gpusvm_notifier_lock(gpusvm);
> >> > 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> >> > 2046                 drm_gpusvm_notifier_unlock(gpusvm);
> >> > 2047                 memset(src, 0, sizeof(*src) * npages);
> >> > 2048                 goto retry;
> >> > 2049         }
> >> > 2050         for (i = 0; i < npages; ++i) {
> >> > 2051                 struct page *page = hmm_pfn_to_page(src[i]);
> >> > 2052
> >> > 2053                 if (page && (is_device_private_page(page) ||
> >> > 2054                     is_device_coherent_page(page)) && page->zone_device_data)
> >> > 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
> >> > 2056                 else
> >> > 2057                         src[i] = 0;
> >> > 2058                 if (src[i])
> >> > 2059                         src[i] = migrate_device_pfn_lock(src[i]);
> >> > 2060         }
> >> > 2061         drm_gpusvm_notifier_unlock(gpusvm);
> >> 
> >> Practically for eviction isn't this much the same as calling
> >> migrate_vma_setup()? And also for eviction as Sima mentioned you
> >> probably shouldn't be looking at mm/vma structs.
> >> 
> >
> > hmm_range_fault is just collecting the pages, internally I suppose it
> > does look at a VMA (struct vm_area_struct) but I think the point is
> > drivers should not be looking at VMA here.
> 
> migrate_vma_setup() is designed to be called by drivers and needs a vma,
> so in general I don't see a problem with drivers looking up vma's. The
> problem arises specifically for eviction and whether or not that happens
> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
> issues there (see below).
> 

Ok, if you think it ok for drivers to lookup the VMA then purposed
exporting of migrate_device_pfn_lock & migrate_device_unmap is not
needed, rather just the original function exported in the this patch.

More below too.

> >> > 2063         migrate_device_unmap(src, npages, NULL);
> >> > ...
> >> > 2101         migrate_device_pages(src, dst, npages);
> >> > 2102         migrate_device_finalize(src, dst, npages);
> >> >
> >> >
> >> >> > Sima has strongly suggested avoiding a CPUVMA
> >> >> > lookup during eviction cases and this would let me fixup
> >> >> > drm_gpusvm_range_evict in [1] to avoid this.
> >> >> 
> >> >> That sounds reasonable but for context do you have a link to the
> >> >> comments/discussion on this? I couldn't readily find it, but I may have
> >> >> just missed it.
> >> >> 
> >> >
> >> > See in [4], search for '2. eviction' comment from sima.
> >> 
> >> Thanks for pointing that out. For reference here's Sima's comment:
> >> 
> >> > 2. eviction
> >> > 
> >> > Requirements much like migrate_to_ram, because otherwise we break the
> >> > migration gurantee:
> >> > 
> >> > - Only looking at physical memory datastructures and locks, no looking at
> >> >   mm/vma structs or relying on those being locked. We rely entirely on
> >> >   reverse maps from try_to_migrate to find all the mappings on both cpu
> >> >   and gpu side (cpu only zone device swap or migration pte entries ofc).
> >>
> >> I also very much agree with this. That's basically why I added
> >> migrate_device_range(), so that we can forcibly evict pages when the
> >> driver needs them freed (eg. driver unload, low memory, etc.). In
> >> general it is impossible to guarantee eviction og all pages using just
> >> hmm_range_fault().
> >> 
> >
> > In this code path we don't have device pages available, hence the
> > purposed collection via hmm_range_fault.
> 
> Why don't you have the pfns requiring eviction available? I need to read
> this series in more depth, but generally hmm_range_fault() can't
> gurantee you will find every device page.
> 

There are two cases for eviction in my series:

1. TTM decides it needs to move memory. This calls
drm_gpusvm_evict_to_ram. In this case the device pfns are available
directly from drm_gpusvm_devmem so the migrate_device_* calls be used
here albiet with the new function added in this patch as device pfns may
be non-contiguous.

2. An inconsistent state for VA range occurs (mixed system and device pages,
partial unmap of a range, etc...). Here we want to evict the range ram
to make the state consistent. No device pages are available due to an
intentional disconnect between a virtual range and physical
drm_gpusvm_devmem, thus the device pages have to be looked up. This the
function drm_gpusvm_range_evict. Based on what you tell me, it likely is
fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
using hmm_range_fault like I have suggested here.

Note #2 may be removed or unnecessary at some point if we decide to add
support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
now though. See 'Ranges with mixed system and device pages' in [5].

[5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2

> >> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
> >> > [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
> >> >
> >> >> > It would also make the function exported in this patch unnecessary too
> >> >> > as non-contiguous pfns can be setup on driver side via
> >> >> > migrate_device_pfn_lock and then migrate_device_unmap can be called.
> >> >> > This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
> >> >> > in [1].
> >> >> >
> >> >> > Do you see an issue exporting migrate_device_pfn_lock,
> >> >> > migrate_device_unmap?
> >> >> 
> >> >> If there is a good justification for it I can't see a problem with
> >> >> exporting it. That said I don't really understand why you would
> >> >> want/need to split those steps up but I'll wait to see the code.
> >> >>
> >> >
> >> > It is so the device pages returned from hmm_range_fault, which are only
> >> > guaranteed to be valid under the notifier lock + a seqno check, to be
> >> > locked and ref taken for migration. migrate_device_unmap() can trigger a
> >> > MMU invalidation which takes the notifier lock thus calling the function
> >> > which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
> >> >
> >> > I think this flow makes sense and agree in general this likely better
> >> > than looking at a CPUVMA.
> >> 
> >> I'm still a bit confused about what is better with this flow if you are
> >> still calling hmm_range_fault(). How is it better than just calling
> >> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
> >
> > The code in rev2 calls migrate_vma_setup but the requires a struct
> > vm_area_struct argument whereas hmm_range_fault does not.
> 
> I'm not sure that's a good enough justfication because the problem isn't
> whether you're looking up vma's in driver code or mm code. The problem
> is you are looking up vma's at all and all that goes with that (mainly
> taking mmap lock, etc.)
> 
> And for eviction hmm_range_fault() won't even find all the pages because
> their virtual address may have changed - consider what happens in cases
> of mremap(), fork(), etc. So eviction really needs physical pages
> (pfn's), not virtual addresses.
>

See above, #1 yes we use a physical pages. For #2 it is about making the
state consistent within a virtual address range.

Matt
 
> >> we're talking about eviction here so I don't understand why that would
> >> be relevant. And hmm_range_fault() still requires the VMA, although I
> >> need to look at the patches more closely, probably CPUVMA is a DRM
> >
> > 'hmm_range_fault() still requires the VMA' internal yes, but again not
> > as argument. This is about avoiding a driver side lookup of the VMA.
> >
> > CPUVMA == struct vm_area_struct in this email.
> 
> Thanks for the clarification.
> 
>  - Alistair
> 
> > Matt
> >
> >> specific concept?
> >> 
> >> Thanks.
> >> 
> >>  - Alistair
> >> 
> >> > Matt
> >> >  
> >> >>  - Alistair
> >> >> 
> >> >> > Matt
> >> >> >
> >> >> > [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
> >> >> >
> >> >> >> Matt
> >> >> >> 
> >> >> >> > > +	}
> >> >> >> > > +
> >> >> >> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> >> >> >> > > +
> >> >> >> > > +	return 0;
> >> >> >> > > +}
> >> >> >> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> >> >> >> > > +
> >> >> >> > >  /*
> >> >> >> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> >> >> >> > >   * a reference on folio which will be copied to the new folio if migration is
> >> >> >> > 
> >> >> 
> >> 
> 
