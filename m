Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1D964BF9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6238810E1B5;
	Thu, 29 Aug 2024 16:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2KyRMXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6E10E1B5;
 Thu, 29 Aug 2024 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724950252; x=1756486252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mBFyHJ1cxxzqzuDoVa0CcyT0Am0dW1OlHiZMgwUmpsA=;
 b=D2KyRMXqrqab97wujuQgwAaPlW+kubNo+o7Dik+eUfODa2CZoMQ4HcMF
 9WcuCntyFpzqwrA8cF37URR08lb0IEElfi+bGF4WlISBzFBSOB1yJuwaP
 mnvf3l2QPirGX7a9OO8EOf1wSAf14wtYjDVCudPDZv0VlL3yzlHiizRCE
 CGw7NSDAIRagYdJMP6tqvW4YSv0uzgO7dIfHHHdF9BkgYMRCGEiKEcpXW
 wXQRt8wZDMTvJQOMoDkWmMrHc+3AQmTaP6VHhetvxujn+ck1If2evgJyZ
 QgNBO7LBwKfAiM0X4b8vWl74TqGzjYxb3IBf/cJb9XWQGoNOL4jZT5dZ5 Q==;
X-CSE-ConnectionGUID: QP3AMXPdSzuSPJSycO3KTA==
X-CSE-MsgGUID: 2l3gTpZsTsGY9kTPcPfh/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34224194"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34224194"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:50:51 -0700
X-CSE-ConnectionGUID: O+Qcox/NSQORWZQsDhHf1w==
X-CSE-MsgGUID: NEMeLY+lQj2/dNThHV59Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68528846"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 09:50:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 09:50:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 09:50:50 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 09:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIQP04veWaGFo95WEq3dbrHa+dQUVuyl86p3muRmnGVgO0bYiIDlcilpTxwbj/R5yi/2KP3DpBlRAHA1NIOCE6sZhRC/mw7nFxtwvlFrBqw9BBzO6UIIPY4XBojzCS/D1bZwa7i0dpDeG7PDAGti4Vr26c5L/TWonjMya5XUyFWpz1WOksUobQmfySKARkJFLxB1O4/p6ItqTbJp5qdpwX4rtzJ6t0f8zVeJm9RGjbX7Sr/WB3deUPUcBltYICPxXCjAL58EizbxZXkHy5iVUngnURW2I/UKAyGq+Gsl1SfYgQjMTOsP6i4x+9cjFhgSBranzexWd0cIBpoPbZv1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFJ7obfd+s3rvXUq1kVL/uwsDCtarC6agGk3BXL582I=;
 b=Up3cJGX5WDRXOMYqTDbeEInWNMO7UpUsqZARLkzgzff1hX9bVdy5eXFWs0j4psBSHWyoUGNCGrfnjvHSXrwPFNP/cujR9XHN7cTWhMfjiLeJQKkYMcHAwuK2iIhsxrn6RS21iZy2Xbd+okfp9vIOswXI8wQnxPgX+kg2aXIOQe7PZDLvv/E8yP+TWepTnb/UV4HHut2wr5KcBcXeIbjV6RIZA4ywQ+fU39tPrEX/GZyJJ5wPEKlz7wkqVDgUkokCGZiOnT8pobWOMalRo9Hal9PkCpbaRX0AhsezHn9B5m+UK2+Na1OSi2CianXrM0APKDR2icvApO5ZP8g22PKGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6160.namprd11.prod.outlook.com (2603:10b6:208:3c8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 29 Aug
 2024 16:50:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 16:50:42 +0000
Date: Thu, 29 Aug 2024 16:49:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtCmi3Hjk7K+Sk09@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <Zs9xWiECsszs6nPR@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zs9xWiECsszs6nPR@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 45befd4a-c8a4-4b94-04d5-08dcc84ab83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4w/A7BsAkfBzGwpp0ltZPWMSybtdns+mqNS+/e/nrfZSEUetqURzWZtmH4eA?=
 =?us-ascii?Q?u/kbpy/fQtTrz3LFKN9r+FBkXQKBI8vVbq5Wn+obMqmS39RKglWt4270gkCM?=
 =?us-ascii?Q?QygyCwFV7B0Tqw1UjwnWMA0Pj02fIcX61mPZntpvIV8J43hBEj0fTg6gMTYA?=
 =?us-ascii?Q?FfwRh1z8MZdDoS2LvLUqt4N/4CuL+YXDQ4WgEPOsyKYmNWsHQsKQshGEHxO+?=
 =?us-ascii?Q?otnRaO0KEkdI9+iKTvvhfdX/0Q7qrCcsMdTRtytMhix3EehnLa/xbMg7hgq9?=
 =?us-ascii?Q?AZ01RVXVR3Z/4PsMOMJrEqh/FZc1P8vNar8+NFD+ffoPpxIZmOPRrIWWwOUJ?=
 =?us-ascii?Q?rrl23O0q2YJoIu8p55pOTE2nBjDV9t/E1A63fETbMGtHfArkbQTnZcfev/Uz?=
 =?us-ascii?Q?+2yK/gamDvO841u+j71KsLPIUpT0h8QpaNGawSLSoYSmHfXuDRUyYOYLRL90?=
 =?us-ascii?Q?Y4VjbAU4alIBhxOPtIm5FlCNohRnOloZNAbS6m0dUFyqMm4PaJaOMYqobZ9c?=
 =?us-ascii?Q?Sfb4DsQZN+lbaMmvRVydCexlmhtDfrQDkmLbBqFOLmzqHPWCXpF7ptFMvaR/?=
 =?us-ascii?Q?jT14thBWaORQbyHPjUPNWWVV8FHacAxfoZZcz8BbuixZYItcmssnZs8BW0f8?=
 =?us-ascii?Q?SQ6fBrJwrBD3/K6gAdl0d2/cjFqxe4IVhWxPC8gmFBFBkP6o1RwuQrrTfLdd?=
 =?us-ascii?Q?NKhy0tF6d3TaAF7ymCBQ4vVkD2++Zi9NFbhZLipirYgC/L5YhlfaSuFrIDeu?=
 =?us-ascii?Q?ylhwMtvE9YZGLcWCxqCyBPXKvIjY2sMe3GBvk7BthSVR6lyFNxR8/mwS3j/c?=
 =?us-ascii?Q?iWynyOMqSeRK7mOer2PGH3pw/VoPFTH+MDBbHoURqUYzQvt1jcHKS4RxJnDm?=
 =?us-ascii?Q?F9nd+0fEm4qtLMAoYtRpusuCoQ1C/uxtZf4Dbtdf0LPgaGX4tKeXHPEKq2x7?=
 =?us-ascii?Q?pPv7nDhspdxiBVnhxHPeOgr5CCMNHcDk7Fm+vWTqBnroi6L8plrUucoEEMPA?=
 =?us-ascii?Q?KR9cbaB5LI/X09A+4DNEuuYKAizxPAvSDAiR1qJABHcwwEVpJf1bkVSYXzsc?=
 =?us-ascii?Q?5XQJ8P6y51Dje/8muRuGcIHekAW665ff2VVXx1sjjG26Psz86D7lWb5M8tH/?=
 =?us-ascii?Q?lNRPG9l4ySvQm2+NJFKZlLrO6bp2wmnVVBJrvy5qBvswAxH+30aG+3dRPB7A?=
 =?us-ascii?Q?lEU4odHwzznFUqFBM/wPySN6qF4ZTmHT0GaNLW1BPWdTQ6NQVBKADXPrl3QT?=
 =?us-ascii?Q?4+RZ7ymw0QJjATuPosgKwMmoT3yd7sYkLXHhxpI2TIh+7bEVagbNaw0vRC+A?=
 =?us-ascii?Q?HYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYCiwwz4Y7CMoJtLaoR+lZ5Bv6Wi+LMXUkvk2g3BbyB+1Vmt4RovIA1v16NE?=
 =?us-ascii?Q?ALC/PbQzM14uS3VrteHj/laUnAiOXUHlx767zixJrskV8CgwokmLHyuA4wIv?=
 =?us-ascii?Q?UOtprjDC/uDNdqtQ+Ef+L4TPUIV6rypD17YeTINRYsUARvEkvUCHK8+n13d7?=
 =?us-ascii?Q?eanu9Wh7VMI8I7bbfW9ksOOZDyCMden+UUyasdbuuUc6Ai6HtCnAYiv2aAZ+?=
 =?us-ascii?Q?TrM5U7+47L+SxOzCCn/AP6pDvJh4c0YAuBo20ifetcm8DYQRTTCsBZxd11mn?=
 =?us-ascii?Q?G/pGN3Lo/fezwfjI4PAr4mZQgiUeSGyX54NLTekcuuMoU11utV2K3dhvFp+B?=
 =?us-ascii?Q?6eDtra/39rf+E6g3x8LGZG9dK+taBaocNKNhq3lz4EYj5TajTD/c3R++gfYi?=
 =?us-ascii?Q?6MkUDjZ2M0NmryV/DCPUKq9IlSsQ9NT/oh2OmVH1DIGfFvRSKTJhcFMb+O28?=
 =?us-ascii?Q?VQls61S5MRxub2JPNjLIV7Gj6cc5ODp/Bfm1PtcS01fhZ1hb7vwvI546tXIw?=
 =?us-ascii?Q?Xtw84TuD3uqIns8DHHDv5wzsbzeUh+29vQr09Pl7/KphtCSBxkd4QOaRQOff?=
 =?us-ascii?Q?6HeaiRDaizOvmDfaawRRSSHCccMpmP9KrIe7oKxNBxceGhgXDeCFGg//x7Xr?=
 =?us-ascii?Q?a4Az2qtRSpe1RAO60Hi18n1IB5aQ8YyHh3Fj4glnxr86DxtVhx1y6cDXTUrS?=
 =?us-ascii?Q?m3Mm4XZaUuxMwAFmOwCYKUJCyIpTp/43GDmrJdDohbir/E0ryPJocnWSYLEY?=
 =?us-ascii?Q?SSUdDO+lU6OX4wqKWiaehVar/Yg14mCbbMZALCj9Q5BPdy/vpfSzcuoizCoR?=
 =?us-ascii?Q?HW5TIkW5qppxybopc/eqnGQe0sOdHobk5CdxGfi/1CiJehTxJwtddOSA9F9I?=
 =?us-ascii?Q?orY83HIBfLcUhFw1pM7huo06dxTBYFXUtoYLKDJnJtGiuGzvL2qucIUk681v?=
 =?us-ascii?Q?dGpmHqVJ4/jgLsuPNmLr5ph0cwDE75qlAzvGBhcKNQ/Ss4tD87dQ7glYI/bF?=
 =?us-ascii?Q?ZkHezneVXBGcYYyVI5Evz6uLyv22NIpkjdX6TN6xnIYsR9ppMl3IrQb4eI0v?=
 =?us-ascii?Q?HJc7y7wZyYCviiwExilcsc2dQzvE1nOWSwTsaay68/hK+LCr66vcgQ4/bG3L?=
 =?us-ascii?Q?2vf9g+Ah2NBLGfDyZJWF4OiQ8OACkpmdJ067uV5W43KsaxaghJ7XN4ZOuGgp?=
 =?us-ascii?Q?IHGudSXhdRXpK8NT9djr0R1wKfv9TXKkOvAUrQbWoZ5de5/5sw8nKMvSC6Qz?=
 =?us-ascii?Q?RfV8LYtukYoB+eN+Jp1h/xoiNo4g9epPE+6zQIaMS15RP5nLVVR3aE9be+LB?=
 =?us-ascii?Q?efDragkvCtBWWllba93PnLbe1IiO6f8SzAROF7iSbEuuAP+AuJaoGpPkkX0q?=
 =?us-ascii?Q?j6dw1hkPARna//BHUSGL43mzYcXVe3zD8Uk4YmgqdSikfP8hKsWVk2qCTwVG?=
 =?us-ascii?Q?xbplp7gmI+4V1SpJJGPfPngdsXph4OR2vG6l3NEVxoUILkRDvVFKsQ+2bnTU?=
 =?us-ascii?Q?/EN8gYfIt/SZO4RYDM2XtQo7TkscZCLNeWuEHvys6vl88bqnHoo2H424ogaK?=
 =?us-ascii?Q?YlZr8NROJQnrVFAduVe5m5QHFu7056Q7iV2dPrTxUSspr3ff8WpJlu+ocilk?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45befd4a-c8a4-4b94-04d5-08dcc84ab83c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 16:50:42.4798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1uwuzw7ibb+cAoSu0JMe5MI4EemYdvCXDQoD7GtMduZLSkqHexJ9TLG7/5YbJpYkoDxAs2P0Ry86vNxAe0E0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6160
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

On Wed, Aug 28, 2024 at 08:50:02PM +0200, Daniel Vetter wrote:
> On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	u64 start = range->va.start, end = range->va.end;
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	struct vm_area_struct *vas;
> > +	int err;
> > +	bool retry = false;
> > +
> > +	if (!ctx->mmap_locked) {
> > +		if (!mmget_not_zero(mm)) {
> > +			err = -EFAULT;
> > +			goto err_out;
> > +		}
> > +		if (ctx->trylock_mmap) {
> > +			if (!mmap_read_trylock(mm))  {
> > +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
> > +				goto err_mmput;
> > +			}
> > +		} else {
> > +			mmap_read_lock(mm);
> > +		}
> > +	}
> > +
> > +	mmap_assert_locked(mm);
> > +
> > +	/*
> > +	 * Loop required to find all VMA area structs for the corner case when
> > +	 * VRAM backing has been partially unmapped from MM's address space.
> > +	 */
> > +again:
> > +	vas = find_vma(mm, start);
> 
> So a hiliarous case that amdkfd gets a bit better but still not entirely
> is that the original vma might entirely gone. Even when you can still get
> at the mm of that process. This happens with cow (or shared too I think)
> mappings in forked child processes, or also if you play fun mremap games.
> 
> I think that outside of the ->migrate_to_ram callback migration/eviction
> to sram cannot assume there's any reasonable vma around and has to
> unconditionally go with the drm_gpusvm_evict_to_sram path.
> 

See my response here [1]. Let me drop the whole trylock thing and
convert to an 'evict' flag which calls drm_gpusvm_evict_to_sram in
places where Xe needs to evict VRAM. Or maybe just export that function
and call it directly. That way the only place the VMA is looked up for
SRAM -> VRAM is upon CPU page fault.

[1] https://patchwork.freedesktop.org/patch/610955/?series=137870&rev=1#comment_1111164

> Also in the migrate_to_ram case the vma is essentially nothing else that
> informational about which ranges we might need if we prefault a bit (in
> case the child changed the vma compared to the original one). So it's good
> to as parameter for migrate_vma_setup, but absolutely nothing else.
> 
> amdkfd almost gets this right by being entirely based on their svm_range
> structures, except they still have the lingering check that the orignal mm
> is still alive. Of course you cannot ever use that memory on the gpu
> anymore, but the child process could get very pissed if their memory is
> suddenly gone. Also the eviction code has the same issue as yours and
> limits itself to vma that still exist in the original mm, leaving anything
> that's orphaned in children or remaps stuck in vram. At least that's my
> understanding, I might very well be wrong.
> 
> So probably want a bunch of these testcases too to make sure that all
> works, and we're not stuck with memory allocations in vram that we can't
> move out.

When writing some additional test cases, let me add hooks in my IGTs to
be able to verify we are not orphaning VRAM too.

Matt

> -Sima
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
