Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E703FA910EE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 02:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210F910E0AC;
	Thu, 17 Apr 2025 00:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0NIcJYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC0510E0AC;
 Thu, 17 Apr 2025 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744851255; x=1776387255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1ZF7HZ/T3n3Vi4adqq6VC5kKTgM4aEEBuXA0qliBotc=;
 b=l0NIcJYMJSW34R7B31Pj2sUAzb6IfZKSllZr6cKk2ndjOENy5dXSucxo
 rO3eneJZ8N/CYte2rw5T50l5ScdYzQ1KG9YJBVhy0VRpRfTHxpCyQM7Wj
 My4chbICKrqLAONtdC0tx4AIOIkaRU2Kp+rvaiDXLa3gdcG5ADHZ5wltG
 Y3O5nvlYl/aHbb9jQP0NdUOcH0SNdu5P9EF2ZAD4Gl8Ho4Ziur87H+sTk
 avf5E6TiyvqhhIMX9fJSNEFzL6HjnKz7AFtYSLWL30BAROa+hbtj54naw
 oT8kOFHvPhPvDghAgKrGPGxPs55PbzcDiNXjZgJyimRFF+4qonLLUtspE A==;
X-CSE-ConnectionGUID: CQiFpd02SlWE6ZjU5kgfkw==
X-CSE-MsgGUID: 1wz004Y1QUC/xzxDHv3tiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63956641"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="63956641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:54:15 -0700
X-CSE-ConnectionGUID: VtuYz5QzRaObGYOZdnRpnQ==
X-CSE-MsgGUID: oqi5Ne6NTqqqqpU2WqJ1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="130958735"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 17:54:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 17:54:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 17:54:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 17:54:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2VChN1oRNj4Dwx/vRfR/hvUmmBjQaAuwNRBGDaHdbq0eu2DCU4E2YLRwF040Du5//MIjBPhP8Hwaf6TtMl2E7Fdw1BS9MyAwRtVfo15HINkeLs1Mfdogu5OevgY/IoMGdREU6+M0PWeK7CoGIwbzW8l+2owNS/ZkLPEhYcLO4wG5q1/5ik2ij/5SSc3q+d6LEK2CN/extA3o3qaGBigNIlltc/CL8Umj/gv8Syd3gW0CCGo4IAsBBhE4NOUvvH3imwPtF4ID3qH3BZO4kvNKE6bSGwmj4umpMiwiqDJpi3ZL+mGgD2rheOLK4CiMV5QKsAc3WJKFNDUSHGoOS7/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKEQCdSNU9rEOTl2ELWCEMiI6+ro/KkI9peejrKwXoo=;
 b=x5Sye0i1ilz+m0mxCq5CnYoKV9J+ZNh4O7Eyf94FaGgouIhRVpXMhUz5qE7D4JdFRJsyT533XMUuZDEN+ftQLQOv3r4gthYYQWWLOVHSn5YThI21M4B9uxAT56z0mqFzVNsqWC7wSdmCpBxHK5bTkJgDl7Puh9+A6u+V0R2JJxdlAoe7ncrA2SOYlgpRfYqYXUC9E5Hg+m+l1XNKuPeUXlyvvkNQDmdxHQQBjPiZvm/DNPjZKY7tTKB5LWAfhn1g4GDqIHoE1Z1xnsx+TTx3dfCCP7bMu23K1Q/gxdC7ywKxWARQIUKX+5YOGDWx34OTY6vZASbE54duoY6MOGBMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7748.namprd11.prod.outlook.com (2603:10b6:930:87::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 00:53:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 00:53:43 +0000
Date: Wed, 16 Apr 2025 17:55:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH 0/4] Enable SVM atomics in Xe / GPU SVM
Message-ID: <aABRZylb5ZT3A5rk@lstrano-desk.jf.intel.com>
References: <20250416181107.409538-1-matthew.brost@intel.com>
 <aAAMDFKLdTkdI3Ln@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aAAMDFKLdTkdI3Ln@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 356b1798-ebec-4aa9-b3ab-08dd7d4a4d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fogZ6C0pqO3ZmjHMAGvPOds/pswQlpywXd68k+yo/8FA+Kw/dcuhJQkbNvfU?=
 =?us-ascii?Q?wYEx6ovycvhDaJYjYqd6+RvdVuVc7tZKvYT+dvOokJxTnJzxpsfgiG6bKehW?=
 =?us-ascii?Q?cZ9y2Pl9mrG8UaCmi8vhKWuzE+MEp8TsvtFluDQepP5ySSiUJFqMIGSCSFm1?=
 =?us-ascii?Q?ir9CNSS0EwaLjzzrBnHXnNQSXZN2ajudSaEijjmDlhNEsNRcV3+qnxQe0hiv?=
 =?us-ascii?Q?pXm/Np8Lm+G7JpF7GKXffTbCWZ9Yue94TDkEaIYVNJXOtG+tG330ZYR21/wy?=
 =?us-ascii?Q?HoBAanxW89fDE/cL73SjLBbRCO2pV/xfvCA5sUyP2YEx5VYDYoizZDFT35hj?=
 =?us-ascii?Q?lg+lKX8bU7bCtcwrGUnoUl8luHDGHVJwuxNx47QJRfmIFys3kvO9u7JYXKSP?=
 =?us-ascii?Q?xmrwW7WdMxO2WAiPplvyoAOwZU37HYUjiGz4o28OTjRVQQyu0SLgBXCRbp7s?=
 =?us-ascii?Q?nn1MkUz3RwMcMaD6KqA8+UzP+hnH4QGXkI5EoGYBvhpKlj2qiPoKWoX6+rU3?=
 =?us-ascii?Q?4dwm6p7JBLS0QfSBA0igA9euL8zh9xxWH36VXpXUhFHsGZDBfbAj0dmIdKB4?=
 =?us-ascii?Q?v0UYliY5xJ0L1fRC5MTwxheIiuqOHkiXwkfMrSKoS5sV6e0UBm772SYlNVNo?=
 =?us-ascii?Q?p+zujxg2FU4VOob59KITA3SfwqgGJjlZlzoH8iLOo73JHeYZPcrlXmuD4Lmv?=
 =?us-ascii?Q?rCn+x3PZHLnzUDY/NsftZCujA45JNGL26J0+xK3kjrHeZ41m3x6xpXVE2Ei3?=
 =?us-ascii?Q?Leyoq6vmY7/MkHQuCeBU4Ym6eBCJzTU4kagwqM6HVr84nN9KuB3qgIMm63AL?=
 =?us-ascii?Q?+csc1CghKHgB07x01nSVSq+60z6Pufw+HU1PPowoutBTVbHt6fnr52D9aIWR?=
 =?us-ascii?Q?73bXvaQb/OOjF7AUtqDYmOKZ9enH/giw+848RGWrtZpO5htCekUIMKtqbcOt?=
 =?us-ascii?Q?CMdIzvdNGh26o5sZS6o94dMUdFr89j9H8mlubJ5CNoEC4qw0rflIRGVOnYF6?=
 =?us-ascii?Q?rgJMXLv/oDVy0yT8tWiAK23lRX2XEDBDvOpqCoUuCpCvTaADOiy4xDDIXw5f?=
 =?us-ascii?Q?kxYBoC3ZbUSswKnWamA5WnbNAP8H97IvHw+c+T1fA+gmB6OI6LvOkcRqIMiI?=
 =?us-ascii?Q?CNcmFRlCXfKVhTOmKeUx2WIJTNApZbFIUpurST+wsIIvTDY8Byg8+HOGRjKI?=
 =?us-ascii?Q?47s0gWwACtGZG9NoPpLrnKBzVDl4cu7exn/q1GeVdTIIGhXUZXtPiyzKPHkE?=
 =?us-ascii?Q?OcksB0qzxfTbO5Tz1BcCV9n90qyfoEtVuTcpOWr6jMF7fQZnMpEV1Lu56k96?=
 =?us-ascii?Q?SctxiIA8n5QnIHdp1VClf7MBAZXHd/q1RUqy1MGAqn96IRGn6+TgKgJb2Sc8?=
 =?us-ascii?Q?GeKh3mM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q7KfWmeinGV1WClIxqRFniGz8K2Dn+PTNj4cMqUYEdR8huwlv8d3AqhaRX++?=
 =?us-ascii?Q?LNWa+VnrsHkMw9c5bsmaxX8neTqhWI6n70xyKm7tLHzxijN4RYBc0eW9XYPk?=
 =?us-ascii?Q?/W79LI+byj9ETwMPJW/PhnIqdv7Ds0IQjKJvtyYYjLlA8VN6PbYkJCS0XRVR?=
 =?us-ascii?Q?+WH3XeJa5KlQ7xRjqZ9i5aFaos8QD8Xp2R0JDacPecHvOHw2kVqAQFU9NaE1?=
 =?us-ascii?Q?VED1EWOyJf+D9xpNf1fk3Aesx6Y1B0Q6m8wynaeqPN/peXL3H8a1ko+gX72l?=
 =?us-ascii?Q?1kg8/1baUrinkYEOOfuZ7oLG2O7zVp8PsYB0R6aO7k3Eyryhfmo2HS6ZKIpf?=
 =?us-ascii?Q?Bdusd4OfjHJzm4ZdkffhxKDm74F93FuzuXRVBqv5LrHOPkXDVkHqq72kKgDl?=
 =?us-ascii?Q?kxfo07o1BFDCzShoTxSXIMdhPW3XdxUhzwYOzDNf5UbI5vJkA0QJ3jAQqwrX?=
 =?us-ascii?Q?k+PXW0aLRcIGmb5+1ugDvCgN0Y/D9A5ZhyAicnW/1aAf4Ktg+npO+vUfO+yr?=
 =?us-ascii?Q?vYoBG647RK0TYv+d646a1SnN1RUTKH7FaNCdJN6ojMhY0hqhgDkDpRhEQZ3c?=
 =?us-ascii?Q?to2bvYa8zgbtIOxUSUo3KW0+6TeMh+ujAlOl+5Ii5Dbkq8dsQ3HhvTUU1lBN?=
 =?us-ascii?Q?So9YYDlgJ2dWpAzCj0U3yfzL3GvbHOLcW0lwVEmeCiAkLgRf/42NbCjPInOs?=
 =?us-ascii?Q?lX29LZr1sRQCiWlC3cLAqzGEOXyiogdFTmOClAJhMcuVrz5RpMqhEcsG+Tez?=
 =?us-ascii?Q?XU/TB/dL5ePmUB+rpto5xxaT18e7lblAB7tPwEpZzZyZGKkPabzwBPqDV1J3?=
 =?us-ascii?Q?do7XCxofxHtAQOJIYdG6pH0OWhyeu83XWb2kqxQlkBz2ItYCK1lYtb8wn56y?=
 =?us-ascii?Q?DFKlfqJrFheKpXqOHkxAMe4jlyxaUSqor8YuAlAInM9A10J3WIMs3cP9kCfx?=
 =?us-ascii?Q?8L5fFcTX8HoDqC4iUK622BiK/QdI79/g1UBlSg/YgCTHpG7AQipS5mcqbb6O?=
 =?us-ascii?Q?ByWbiM8nAoQtrw9Ammf34b7xaD94lKMuxKR4e6uqkQZ2Z8Zm2XZJaCtYYOq/?=
 =?us-ascii?Q?8ntS9T2451CQH+cUBD0YPB7qMC6N50UUqlwx0w9PhUb+ynIkq86QXcmgoLqN?=
 =?us-ascii?Q?CDRphs/HHZqrQLdUhnaZC5136iurPvkz2H/gJaFTvv/3ACCMLxpI5tN/AcGw?=
 =?us-ascii?Q?+tvRuJLsfkhl7y+cIwdn7VxCvmAZCd5rGBf8Jo3ZuZczwLiPXTBLVrz86kiJ?=
 =?us-ascii?Q?iiyZRYhp3KZRrZMSMoBtJ30MsxdY+vWChywfR1bIajb+PefmBvv6OP8Szh6S?=
 =?us-ascii?Q?cHcPGm0HiTTLVJsIZDr0dlz/tmrnf8WOh01MYHl6bhTqdyS0ku1+iav7QBVM?=
 =?us-ascii?Q?PnIYr8UNKDJNAWRGssgcHX/utWAy1dn2mOWdVMmuHWsJExLmRevdhVW7+pp8?=
 =?us-ascii?Q?S8okFhUQBiA4MRvrMfjAcGS9Iw5PeFanYPCt1xQVNmhYY2/tjuVmWn2Mn++p?=
 =?us-ascii?Q?kJGomvNEvkM73J+IUI5/KBW4c3omTXwhtvph/IyazfDAScLj1IqWZlQ6t4en?=
 =?us-ascii?Q?2cFa4o21pTLOi3EBuGfwBQx52PBoFXONLGPtyj41LWs0Qz3yQDR8uF3yhrYk?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 356b1798-ebec-4aa9-b3ab-08dd7d4a4d76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 00:53:43.8542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUpeIzO5a0trcTXFlpUdIo49yz+a8tLEof/YUMscSo+OzAJQVfXrZvpiV3PY7vgWVJsIFzvE+DmySvYBq2jzNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7748
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

On Wed, Apr 16, 2025 at 12:59:08PM -0700, Matthew Brost wrote:
> On Wed, Apr 16, 2025 at 11:11:03AM -0700, Matthew Brost wrote:
> > Minimal set of patches to enable compute UMD SVM atomics.
> > 
> > Collaboration with Himal.
> > 
> > Sending as RFC to see if we should pursue merging this series ASAP, the
> > solution of timeslicing may not be the final solution but it is quite
> > simple as a stopgate / software enabling.
> > 
> > Matt
> > 
> 
> Something in series broke processes-evict-malloc-mix-bo, will need to
> fix that.
> 
> Matt
> 

Nevermind, this series [1] is actually causing problems.

Matt

[1] https://patchwork.freedesktop.org/series/147849/

> > Himal Prasad Ghimiray (1):
> >   drm/gpusvm: Introduce vram_only flag for VRAM allocation
> > 
> > Matthew Brost (3):
> >   drm/xe: Strict migration policy for atomic SVM faults
> >   drm/xe: Timeslice GPU on atomic SVM fault
> >   drm/xe: Add atomic_svm_timeslice_ms debugfs entry
> > 
> >  drivers/gpu/drm/drm_gpusvm.c         | 14 +++++++
> >  drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device.c       |  1 +
> >  drivers/gpu/drm/xe/xe_device_types.h |  3 ++
> >  drivers/gpu/drm/xe/xe_svm.c          | 58 +++++++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_svm.h          |  5 ---
> >  include/drm/drm_gpusvm.h             |  7 ++++
> >  7 files changed, 108 insertions(+), 18 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
