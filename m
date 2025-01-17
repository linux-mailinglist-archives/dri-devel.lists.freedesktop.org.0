Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D61A1583E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 20:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79310EB79;
	Fri, 17 Jan 2025 19:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qnw3LvRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7DF10EB74;
 Fri, 17 Jan 2025 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737142884; x=1768678884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UP97XwVz53AtplWZD1q2CQgu2D7V7K8s4lVdxUSfHtI=;
 b=Qnw3LvRp1o6LRSSlDcrz5Ek5ltseuPEMuBhJXMBp62maDBEiek0njJIv
 lJkMQoLIUy5OnZVrKEP33fGi3eH9OkJjdyZkcGcjICpcZo17dxH80J2X+
 VG9+vY+nnt3UTyu0tTTER901/4ukhqQpMXU5DmMVggNCdSSNzB2PLClWC
 lUMPh8JoFqjfDPjGbdnAqla0arQtBhAN0+ITFn/HyPNmzItxNljialpTb
 4vn18TMN/e64gKXWFke69BFMtftx7KuKPgv/852aI+8hY8/q4aGaHKJ60
 mPGSuHGU8oJbRE16I895SGrSaqJkfxxtYy19OS+kh9mdZ5gjIxNx4uSsQ g==;
X-CSE-ConnectionGUID: BkiBCOrSQz6oGqf8FVJfKw==
X-CSE-MsgGUID: eiIRGyHVRkWNzu9na0tVhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37744096"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37744096"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 11:41:24 -0800
X-CSE-ConnectionGUID: 0aajDS+dQ6OCUrAtyIMeyg==
X-CSE-MsgGUID: u0PFfaxEQTa/LAVeMpZtKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="106441727"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 11:41:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 11:41:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 11:41:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 11:40:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD5bEQUPuxraMYZvY2HD0/pz9wbpoTt98TZaEKOKsVemGxO6iKpOoX1oOEUrSkhyMfBln45KD7KEIhWalKgBb3o2Se3aua0uzcBXy8TIEZgw9dpqSBRlWLCHbO3ckaf1CFmBKLO1w7IoLMndXahsenB14RQIsc3SPSttpheNMBu2XckiVq9EIiVoLP0b3QQs2PGN0KSBv1X4xm3/T5suhPAR/Zdea6iiASz/FwIzG0MwGet4+2t4bIlqcWckL0bWRvpIH7LBr7Xf6nlijCdO+ryNC636zDQbh+v3mkAbKLWx31OS12WWMRmRsTox5cP9HlxyKhrTCOf0wrU6skT7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSHqmXPyArgAddGCcgTFY+N5FWagi/hF1CbRnF1C/zU=;
 b=aQC59DrTdoBcPC5OwhppYqcx2OsOAIsIPNMAlHNGIbFYjbcBV+cRuN08g/W7qhh+TH5pIj73c5VoP7WfvOpAYyPc2NG12pjVaizSTugCCnqIHt7TDN/zW5dNhkyanVVRK4DFiP91mbFwZF+YfDCJYCPT1bCZmbpGhSlS8tOvBsmfyndREQo0X5hkDJihOq8h060uOwJJBmk8Yq/8XFk40brFrjv3itKRYaf/8iUYPbFAbnkXIxP2FE0QmIvBczJrJr+m820oaSONIB48uYVzDOkdrsca9IkoXP6wC2Ge4M3wWzhc1N8DSqWKGcLhal2jJzTAB3MclBVew/Er1mHWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 19:40:29 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 19:40:29 +0000
Date: Fri, 17 Jan 2025 14:40:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Michal Mrozek
 <michal.mrozek@intel.com>
Subject: Re: [PATCH V7] drm/xe/mmap: Add mmap support for PCI memory barrier
Message-ID: <Z4qyKDsmansWB6Rt@intel.com>
References: <20250113114201.3178806-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250113114201.3178806-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:303:16d::26) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 913abbf7-2303-4e44-390d-08dd372ecc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OhLH7Kfd3fy6f3XOeCBo34X66GmYLCa1lZatuLkYyVAK+GEQ+/1EJn+yIKnC?=
 =?us-ascii?Q?LbIzxPsE/zVKTZf9OTn914L3Iqnmg9unlbWkcaJVLWk5JO6LWauMKITHs7Sr?=
 =?us-ascii?Q?U96d1CFI/HffCLNHW6VhdcwIKhG5Yacoeil9MA2FB5GpRT9BIdcORwml8i2z?=
 =?us-ascii?Q?XM9C0+HxbHOKgdai9JibF8b92XcloiMakfGBlGRqWmmaQ7LIqaFvwgfn1iR9?=
 =?us-ascii?Q?WIRT9byO1ppzKbHGeEM/NP7cXRPpHuyruTdgzaMrYjMbJLHzGgC0mNbG93G0?=
 =?us-ascii?Q?Z5VxRgQBVWl2/GSWxJSC3G5rhcXQMMShh8oF+q/SCNU0vugzdtBtkfu3MSEV?=
 =?us-ascii?Q?hkY1KjPtgLxw3BFI8ToFpWl97NVxffsXgob/sKFOfHSQcTmO9hiJJ6xyNU7+?=
 =?us-ascii?Q?47MkksBp5ltAnuLz4FUXeWVdxZmFG0toIXKN93pH9P3ygN/aoFrt+Kk5vLjV?=
 =?us-ascii?Q?Sgm15Tyr5CRpbX7/+oHkvobABlklua+4+fuxGcpkaZMhxUG48wM1+bMbtbQ5?=
 =?us-ascii?Q?zHXCckS2hWiiSbJvmr4OsPmMvsoWN5LppIIsw1gY0Pt7UY7XMj00yMC2gFUS?=
 =?us-ascii?Q?QCL58KJlGFzhGaE73ss4Augho2hx37uMSNy3CvZP6v1baY23knt9sHON08zc?=
 =?us-ascii?Q?YiRbAeWUyOG+l6gHG0poNTqgpKhzj61RiKs0ByBrDRF6I/a1wz5KuCpJtVyc?=
 =?us-ascii?Q?oBcn74Nv6y+3aEEsBRD69zKnTQZc7YPm3aJv/lJoUf+Dkax9fq02vmZpP2xj?=
 =?us-ascii?Q?Uy7IU75BVLE2u1qPrUUv0K766a36K94xuV66Kw0SCYi120r2Q3HGeusB0+g5?=
 =?us-ascii?Q?2hfTRrQS48tdQyTEjCGZgXVOffAu7oe6RSVxuWHr7beE5u23gqgFFZAZ6Lg3?=
 =?us-ascii?Q?qsuYxB8jWqrQOwvzKZA73Ufck6jmqXroAD+Iq2ZkulbWCATZ+pRag7ESVFAG?=
 =?us-ascii?Q?ZpTyjSKpoGFSDNbZdvOfTYl1wLDlLXKOOW4IgOMeFaWN7W8km3oGAeEHa34s?=
 =?us-ascii?Q?QG9Z8XzY47vNwh3+lE8s9BpaUaNsXYx2m9plsP2rukmeB/bLe2I2lT03/xQA?=
 =?us-ascii?Q?+JdRBFJZvOCWcc991XKXeGQ8s7FDGdN41mf2+3OWJSCar8Z0YVEr6q8sbTjE?=
 =?us-ascii?Q?N9Kj93QKeKwZJ3xPI6aYlzEWKL9+Rh0AkI321ZzHUZjE5RiFJVkB9IcylI8T?=
 =?us-ascii?Q?jcg+m/str/o/qsJlKw/8UdlRVN83foVMbjGaApcXengkPNvaEF77WTc4FTFq?=
 =?us-ascii?Q?qjfMNeIpURGX8R8oPERZSf4hTSuulLaPtTy3ny8F2AaCUFk5SJ34dYdOysoI?=
 =?us-ascii?Q?QekUra+oA8ralO8/UpjbCf7w+o/5NVxWYiRsuZd8C448ow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ljpSz1SfFZ89dotwa26jJTLHMFHLVBb3X8c6xX53hTDoAiW6VeJNlLFtuRYW?=
 =?us-ascii?Q?kdsxapjQnwi1Nf6/46MyTDAyCyCNY5kipuNuTiT0o3bDBwmjyCasul1ze8H3?=
 =?us-ascii?Q?restaS1qZWdZPOU3nZWakvySshto3RFzpwqSVMqV2LTnvHB7iB9HcmFOSdb0?=
 =?us-ascii?Q?xhb+EZ59kc74RG4VvDczwapkjkpkKUSbjEZfe3VnI+0Y0EcOVAsbe8nohKpf?=
 =?us-ascii?Q?WH0Xd5yXwMjgX0vbCoT+V9h/PJv7uLQL5rPhYgQJTwjcooMwN3gwq5IRcgTv?=
 =?us-ascii?Q?GjeEzs2Y99RvbsVpMz4jPJJlJmxR1Me8q0Q3Jkt08hbWy8cN5NKaJYvK6KGC?=
 =?us-ascii?Q?T8vkaFZ3ScIyovqaFZFabRvbOPaXj531/WUORCjwleSq/yQK0DTOOzhbPVaw?=
 =?us-ascii?Q?FGRBYsnCLv9xikU3M6rvBKtUlvi6SvxvGsdpyj4MobQvTPjtGAxhiNguhb8W?=
 =?us-ascii?Q?7YLnbZ73O9FEOm5XrasSdLGecTTMh/WleBGX1WeDu/HmZ+9bTy6vtwO6E5yq?=
 =?us-ascii?Q?VlNYUoI18mNoKP9HfujxRG8bef68NvOZis3+SPcOrsxvmSpo1gnElQ0+HEUW?=
 =?us-ascii?Q?w5T4Ko8NYlzZtR0sGuKTw1hjAVKeeKJwajUqBJ6++HHLC37jCX2DVhivkk0M?=
 =?us-ascii?Q?aBMeoT8K4qP4JhjaYZnF+ObmWxJGBjEKZujke651ZrCUgdOG0qk944zgXFiv?=
 =?us-ascii?Q?RUYVJt2Rxa0tcosYtiDpDQs0AjvDdFoePzEyAH2mpauE9fcRfOVH6UvtGljR?=
 =?us-ascii?Q?VLI3UvTcskualCETdBhN4uq9Hj+5loZOzbMNl2qA6MwrcX6t/9aPSNabIpmc?=
 =?us-ascii?Q?Laf+dPNzvGtHTfyDNskrdVp+GV+MmgnC67Zd6Vx+hoNt/CEdNSJjmppWmWFA?=
 =?us-ascii?Q?28yIozhniwRbr+i7o8OUuumpq1Kiaytx5dXmJ1utj75XLFn9R5kP9ZZwieOI?=
 =?us-ascii?Q?f3s+hZl+aBCKo0Sxj48qLA7DOcZcKSZRRw3FTZACKJOpvAN6suXemryEo27O?=
 =?us-ascii?Q?5UlU1GlP7sGP26m13PB6B11z52tJjnsqly7kZ61usvbopjk5grYaArFkEDYo?=
 =?us-ascii?Q?zUGjGOiumrGFbAQM3/TNHkty6HL5UQYksVqIQf0tt6NAHb3KIVzRay2AoDU0?=
 =?us-ascii?Q?pods9OSbn+GhKl9NngS/MonGysLk9OOvBsD0qhRndngWhwlUmQZZzLBHAfgC?=
 =?us-ascii?Q?Mdlaws5Dbwte/hiD61WWwivw76mvp1NSSTZv8BPcAuNL/Bbv6SDPcVrTI7DL?=
 =?us-ascii?Q?hIicI6j2uLpxYXMCbjiEVYOuNmKVnXET/lMRoY2kgMmSUNsYCEVbbjsbu7v0?=
 =?us-ascii?Q?qPsAUDt0d40f/IRVeu0KYYczqYICwiIYhdj3vMA28PeOKoEF2eNnefb1vCo2?=
 =?us-ascii?Q?e9shJpgcrosJhGfvPBHUUXAfOd8rX4XqJ2su8P3eEShv5VACecuHTvm/Hsz3?=
 =?us-ascii?Q?wkUv2S3JkfocZFysRyEQYvSpljmoGslww6qGrEYD9AzwGIooSoSSLsNFqSOy?=
 =?us-ascii?Q?lUtMhAEhy3c/ugRNIEkIRo+NtDzdrImWLYp7iOXFu5VUx7eZG8vXjKu8uukj?=
 =?us-ascii?Q?XwXQJHgIS+DjUvf4A0cUYfm6z1Vl2kDv8zgTeDoAlp+QMZ3kL0xUuxGdyP1Q?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 913abbf7-2303-4e44-390d-08dd372ecc05
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 19:40:29.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC/6AEWyHE92tGVEcpDrzUFVQEw0nYyxq+qKV5JKgd/25nLug7my4KTVeZLCMLm+eGXJ2qZRU5AqjaxgajGsSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
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

On Mon, Jan 13, 2025 at 05:12:01PM +0530, Tejas Upadhyay wrote:

Next time, please identify the patch with 'drm/xe/uapi' to get
it more visible to maintainers.

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
> IGT : https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/b2dbc6f22815128c0dd5c737504f42e1f1a6ad62
> UMD : https://github.com/intel/compute-runtime/pull/772
> 
> V7:
>   - Dgpu filter added
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
> Cc: Matthew Auld <matthew.auld@intel.com>
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c     |  19 +++++-
>  drivers/gpu/drm/xe/xe_bo.h     |   2 +
>  drivers/gpu/drm/xe/xe_device.c | 107 ++++++++++++++++++++++++++++++++-
>  include/uapi/drm/xe_drm.h      |  29 ++++++++-
>  4 files changed, 154 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3f5391d416d4..0237e1620ea8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2263,9 +2263,26 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags))
> +	if (XE_IOCTL_DBG(xe, args->flags &
> +			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
>  		return -EINVAL;
>  
> +	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> +		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe)))
> +			return -EINVAL;
> +
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
> index 5cbc96b214fe..6ecbf7dd396c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -232,12 +232,117 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
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
> +	struct xe_device *xe = to_xe_device(dev);
> +
> +	if (!IS_DGFX(xe))
> +		return -EINVAL;
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
