Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 177AE9F99D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5510E07A;
	Fri, 20 Dec 2024 18:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fi82B0dF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAFA10E07A;
 Fri, 20 Dec 2024 18:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734720891; x=1766256891;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wkL3ne+cN+bv4Gmd70Kx1aOtsjoBHflEe+EwVo/wpLk=;
 b=Fi82B0dFFae503GsO8LOB/v7agiZN4dzC3BrvBGcCALWN82vpRPQnkKl
 78FyZP+ERcrVEuddgfbegseyalKKdzFQJWAHZ/1FhoiXBf4M1zCKgDpyf
 b+Mtmto5rcUWG34oYNJ2J5mLsV7yianK8238KJngtUcIuuYrnshUXV3WE
 McGfvE3J5CxIFetuqYDK4vlJx8JuXTB8z9hk4TkG3LhP3Zdmws0rSkxgV
 IO+Nfk7qyI+0SixYG98znfvv8YfFPus/iUfha+wK2wAVc69ARczxoV1wv
 JidYCKGMTO1DI8HE7FVZZEga0rA+UV5UnxhwNWRyoyGiIb83bIfXQP1XU Q==;
X-CSE-ConnectionGUID: UHO1kwO6RVC4G+NcSLbGyg==
X-CSE-MsgGUID: hYUP/ALDQEGcJ1SDH9zM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52802511"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="52802511"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:54:51 -0800
X-CSE-ConnectionGUID: MpGtTvP8R226QOK9ZgZ+Hw==
X-CSE-MsgGUID: PU78V2xvQrWtdu714MrTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98790902"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:54:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:54:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:54:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:54:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvp3fz4mdXph7wKQDKh3zNhjYR1OJjHdf2RPqyJm7LSHhIdBWyDd0c45fodYVfYJaQ5F2sXesNqjbcNfm3LVDxKQ9q6i6+68//VDP/VX4Rp2Xin6nx4SR+5Bcm0UBv37oJ8cRuyK+xvdHKrKUH1bq3pDWlqkVfFMpfPCSQE+xP7WW1h9Cwvn7iq+V6301ERcFa+lvv6+F0N/+t9R696BiBj+aedyue0bm7ZsO4+4XXYh7dNiHIupp3zjFJlXa3ctZtLINNQ6GGKCK3a4HcSxzfaIgddhSSRopUciwGqO9tJpW1XOpg93iuJFub3MAemcqCo6j2Oez2xE5mZiaeBUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJbHBMDt6DK5gTYBz+VJFjpJfRsHZoRCH/VDi4wqY5Q=;
 b=UJJN0QqViREPOVIgV5Di5GrPVv0ghNs0aNAKclU69QrK/S7QY86NKGCvEXuy4dgLA8dsjWzkGcm3reFmu8+c0MFhxVWZNQW16YYssji1S4yui/cuv8n2+o+EOiLMzDd4ysa9Ft+zu2liVBqakE2vZcXEgVi0BbDzqlsSILpPgIA4Q3MJCPoQbeMEXDWQQBa6t+5hXybiXFhqyMcAky4ZQNfDYdtLL/5TjmokkOT2HdywJLnGDCFsZpJ5XgZZmLiKbJb1E+14r8QX6m+upaSHEyQ98BdtcrFnLchFG4ufjUIBxPI9k4wX6RiVJkYunUlORyKDaHC30Rgtb0T1pDbz7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 18:54:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:54:05 +0000
Date: Fri, 20 Dec 2024 10:54:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 15/30] drm/xe: Add unbind to SVM garbage collector
Message-ID: <Z2W9eVudWev/QOI6@lstrano-desk.jf.intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-16-matthew.brost@intel.com>
 <aa8fd567-7065-470e-af7c-d3910487d5b0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aa8fd567-7065-470e-af7c-d3910487d5b0@intel.com>
X-ClientProxiedBy: MW4PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:303:b5::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 47cfedaf-b80e-4f86-5af9-08dd2127ad81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Id9Q8h8u9ZjC8oRo9+2z1sXwTXvAs7EhRS2lOZrndB41QRL/yDtJa4v1iB/?=
 =?us-ascii?Q?jyMo2b987mwB4W1xscO++V1T4yNvKJgo7wwJEp9Dyz98TYIl0awXcw0pE87b?=
 =?us-ascii?Q?UZevmXvJ+vpTAsIz8hbBLkjZBjuCEBcQQqTEEg5sYEJx1srCUgqogLfMl3GS?=
 =?us-ascii?Q?+AL8UqtfgOxXdz08XvjBCC6dvDOK5w/2wR2ga7EoV9EHA4mPlijcKSdX4Py0?=
 =?us-ascii?Q?7eMX56RfM7z+i2VpLOh0jNIa+D5DV1gxNhxTI0Q3QG5CMxr+nFt3IVe3hRni?=
 =?us-ascii?Q?gzyWLPTLen6BZ906E6hsHpVYrMPDL+LKK8mz8hLbPEXNtn/DsiBad8CIMOwB?=
 =?us-ascii?Q?EO96zdcyHrnmOfnyNJ+/vln6O7NexcTaPsEXYIBVJLiBC8QcABxSril7/Mb+?=
 =?us-ascii?Q?cbp8U1UNWvADj1SilI69shjBC3n21uiqjG108qkd/33x6yAjUoTuEgjNLGpn?=
 =?us-ascii?Q?7nA/Wx8V/bD632468BqW9D8h69UGLXBd9DFEJJUwi7Gx9fN72rrMmr2veaKI?=
 =?us-ascii?Q?KKgVyQVLzrOSWRLWjwKaLIlY5LVCSX6rD0rzD6oKWh9FAx3YDaAHXbo7JMTp?=
 =?us-ascii?Q?6hRmLA7lgRHYbQppOmiDOjQzKSpUo1RBtxmx5jQiDRSbOcZ8UYRr2e4LSQFC?=
 =?us-ascii?Q?GD1Itln1j72DDnYaWT0x8sWAvNnJaxDTdaYWKYzT0lD3MNIwe7zjxKM8A8ry?=
 =?us-ascii?Q?xXvn7RKc3UNNbDuS/NCKALRHTMvHpwu+L6cjC/ReuKCgbT4kiT9VsJ/t74NR?=
 =?us-ascii?Q?pCNV2CHmZOafDIg1HHCw2tw+bhMQXbppnR86UFXpYAWjyssXgPBktqo6VcDH?=
 =?us-ascii?Q?DB+u16tbxA8bxJZp0/hGhz277YVXzBlYtJiKdhVdKznEFmxlaxDDg4hIhvQe?=
 =?us-ascii?Q?i1S20wEsluBVDV8amZ8brnPT8dKykWGBumxkOUK13eEIpdV8Z7oj348lEwJc?=
 =?us-ascii?Q?Egk05I7cEgpsQtbe3hkJ9UHYpfKNDF/vWc4WVOLJblqJN0Snyedfwr+ozbef?=
 =?us-ascii?Q?iD66h5kgADg/to+T5LoDyhgY4fKG6v5Pci24UgqVij7A0Y8L0HUqBiuCzjEK?=
 =?us-ascii?Q?5y83+0HbH4y3XMUxCqKhfo34I9slREGBU22oSV+Al3YHNGfZV5DuSI30v6Jn?=
 =?us-ascii?Q?xA1M3GWup1pjAp+HHv9qtDGpVwzsXZEdTS9lf3x/d3wS+og09FPtqWR/asE2?=
 =?us-ascii?Q?nIqJsJP3hJeoWupXy7G3LOXm/8Gk7W6inqQI85FoKYdAIbUySrXcjqMKibT1?=
 =?us-ascii?Q?IpLVFTb9QDh5BkpQmUaU78/vGUognssAW8jgl5ByMLadQATZWQ52DM47LON6?=
 =?us-ascii?Q?F7Sb3qODjYuWtmoTP1yplX//I434+nu6Y3YzoSiYrMctCfqzgBW+PpIW5ptR?=
 =?us-ascii?Q?nRiKQ3S8/YdHwYw7YSQ9yoUUgEw+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wo5Y63DEJyzbAdd4Rknefio6HxPJf9gfWuO74o06mFllujXEPn8mdeLKX+Ti?=
 =?us-ascii?Q?4osMyynEeDhsD4Oc9RC9qV5uB58vqko1Zw7VquPynievb/w7kI49R82yIxgw?=
 =?us-ascii?Q?6t7kKJf+96v/7g2w+iRdcVnRvmuz5xsoEb50bhdIrtNahXmgXAYDrQBmLRt4?=
 =?us-ascii?Q?gqn0kXS79lGB+IGbJpowsy16Uuhk0XEKDU6eyN9htr5sm79iIb1gFtdapOUG?=
 =?us-ascii?Q?AXkgIaX4MusaXL52OdGvYayaEWug0v3HZ82ExoDjesr0twoHURrRDfLiuCIA?=
 =?us-ascii?Q?T33KalFwqCPxkTcCoiMczHOIbPh+8dNTGsBRjWUhLs4ChKNZXxCo+Px6Eggh?=
 =?us-ascii?Q?Xbw08GkKX9gyceWhscX3/e+SyE3o+pLmDXPpJ+xhYQXkvc5u2eOgaE5Nlz8J?=
 =?us-ascii?Q?Tm0rtJkFQGMcKuhmUmrcp30w/4NCjliVGKkuS0x2lvGz/D+1lJLlcSXaRIUQ?=
 =?us-ascii?Q?BrxsBeB74N45MJ3tPidm83ZvfGnRiGdhqB1mXmfxMuBrWn7Ctip9RId4MAq/?=
 =?us-ascii?Q?wz7m8lHGaMLgiMcITfTLdKBWMrydYy4ppzs1wQpqbfY29Zd6ZmcAaZSLdsRx?=
 =?us-ascii?Q?V2OXWtA1lXro0CjzlTFtkWV/qR1V0O6luP1XAQ/d5z6jcK8DGxXLFyie5I0+?=
 =?us-ascii?Q?9TdfhTO4YK1OQO7VDYhnA4XoPJ07CENCFnz06vIvR3Duo9XbAEX84kSUzxpi?=
 =?us-ascii?Q?mD11cusDEUoTCj7XTWG06qQidEMaGxWCULGuC38p3M/L1otA2jEFsErJWxYG?=
 =?us-ascii?Q?jXztGIfxrg5tw8kwNiLPPvjsH8Ad0DIHn/3gUTJLrTobjLdxfE4caXtJGvPI?=
 =?us-ascii?Q?hr2rnIIGa3V3CXuYt4JWAqjzo2G0cjwjgE+0rURzHz+3Fy6g6njjICXpid1g?=
 =?us-ascii?Q?XmUwhFcfilQW9Ft196LS2jEdH7BWc5GehuKZ1iwxBpK9OX8uPsoxoNZdwC2z?=
 =?us-ascii?Q?qwJwt8cNs+FeJ3gKyVtDpT2i4+Cluvlzsbob0okJ8J02TOmTOsHHFn7GZtDc?=
 =?us-ascii?Q?k1LcV2TW0yIJUU9Vy9zqXSICsnK6L/JxbdIdtyy+u/5y9nYs3MCzOpkwqYQe?=
 =?us-ascii?Q?yycRpk0z7OROT88I11BUetrQIEMfoT54qBztjm6gwntEr+HpoX3qnCYc4Rff?=
 =?us-ascii?Q?n4TmOTYu36WQyFXFDUv9kGV3ja3midfJu4DZ4Menr/vrRAqQZZPnGr3HdzwX?=
 =?us-ascii?Q?PHlnQ9DySAUVS0AC7EIusKKI7mAVhKebzrMT0JYlyY21sNxL1FMmN/aLQ+Z1?=
 =?us-ascii?Q?v3roXtC4zf9xr5+dXk7Xch9kCr9HfY/skj8ICTph7SeKRjmjmcjPnMvsq+PB?=
 =?us-ascii?Q?8g9B+JEkoEU9IhbsHf8sivFlgpwRE9FXgHIdUYLd+PEtCJMQFyicEIdT8U8X?=
 =?us-ascii?Q?To6qzAhtXpbulKVJwEhRxWoesB6d/j8YayXhGK92aTZcArI7UBuc5ZeYwhuC?=
 =?us-ascii?Q?bp4vOuCZ7OmGmEtXslpycQtQegI0Q4XZizYDFWvDjb34dtCpH8VhoeFBdj+h?=
 =?us-ascii?Q?Ed74uJ1bn0Chq3lSvk2XrM0RP2C4HALMo1Vzvt4Dn5D4Z3O8J1siL3tlRQ2I?=
 =?us-ascii?Q?JTkxB0b08NYyCxjD+HrkXBRUziJll5xjwp1/h5FdoNjFUOd6YcGiPAKqcJy1?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cfedaf-b80e-4f86-5af9-08dd2127ad81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:54:05.6002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LIyzvCGPsZkiGS46fn9pqhFBRjn+l0RWhfoWyFnselV/GGr/NHC+17ufJHKf7RZGx7Pq86O6+N13+QgGLJ69Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

On Sat, Dec 21, 2024 at 12:20:09AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 18-12-2024 05:03, Matthew Brost wrote:
> > Add unbind to SVM garbage collector. To facilitate add unbind support
> > function to VM layer which unbinds a SVM range. Also teach PY layer to
> > understand unbinds of SVM ranges.
> > 
> > v3:
> >   - s/INVALID_VMA/XE_INVALID_VMA (Thomas)
> >   - Kernel doc (Thomas)
> >   - New GPU SVM range structure (Thomas)
> >   - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pt.c       | 84 ++++++++++++++++++++++++++------
> >   drivers/gpu/drm/xe/xe_svm.c      |  9 +++-
> >   drivers/gpu/drm/xe/xe_vm.c       | 83 +++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_vm.h       |  2 +
> >   drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++-
> >   5 files changed, 172 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 6924f3ebfe3a..9c90dfc81fbe 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -957,10 +957,16 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
> >   	}
> >   }
> > +#define XE_INVALID_VMA	((struct xe_vma *)(0xdeaddeadull))
> > +
> >   static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >   {
> > -	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_vm *vm;
> > +	if (vma == XE_INVALID_VMA)
> > +		return;
> > +
> > +	vm = xe_vma_vm(vma);
> >   	lockdep_assert_held(&vm->lock);
> >   	if (!xe_vma_has_no_bo(vma))
> > @@ -986,7 +992,8 @@ static void xe_pt_commit(struct xe_vma *vma,
> >   		for (j = 0; j < entries[i].qwords; j++) {
> >   			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
> > -			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
> > +			xe_pt_destroy(oldpte, (vma == XE_INVALID_VMA) ? 0 :
> > +				      xe_vma_vm(vma)->flags, deferred);
> >   		}
> >   	}
> >   }
> > @@ -1419,6 +1426,9 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> >   	list_for_each_entry(op, &vops->list, link) {
> >   		struct xe_svm_range *range = op->map_range.range;
> > +		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > +			continue;
> > +
> >   		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> >   		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> > @@ -1616,7 +1626,9 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
> >    * xe_pt_stage_unbind() - Build page-table update structures for an unbind
> >    * operation
> >    * @tile: The tile we're unbinding for.
> > + * @vm: The vm
> >    * @vma: The vma we're unbinding.
> > + * @range: The range we're unbinding.
> >    * @entries: Caller-provided storage for the update structures.
> >    *
> >    * Builds page-table update structures for an unbind operation. The function
> > @@ -1626,9 +1638,14 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
> >    *
> >    * Return: The number of entries used.
> >    */
> > -static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
> > +static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
> > +				       struct xe_vm *vm,
> > +				       struct xe_vma *vma,
> > +				       struct xe_svm_range *range,
> >   				       struct xe_vm_pgtable_update *entries)
> >   {
> > +	u64 start = range ? range->base.itree.start : xe_vma_start(vma);
> > +	u64 end = range ? range->base.itree.last + 1 : xe_vma_end(vma);
> >   	struct xe_pt_stage_unbind_walk xe_walk = {
> >   		.base = {
> >   			.ops = &xe_pt_stage_unbind_ops,
> > @@ -1636,14 +1653,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
> >   			.max_level = XE_PT_HIGHEST_LEVEL,
> >   		},
> >   		.tile = tile,
> > -		.modified_start = xe_vma_start(vma),
> > -		.modified_end = xe_vma_end(vma),
> > +		.modified_start = start,
> > +		.modified_end = end,
> >   		.wupd.entries = entries,
> >   	};
> > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > +	struct xe_pt *pt = vm->pt_root[tile->id];
> > -	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
> > -				xe_vma_end(vma), &xe_walk.base);
> > +	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
> > +				&xe_walk.base);
> >   	return xe_walk.wupd.num_used_entries;
> >   }
> > @@ -1885,13 +1902,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   	       "Preparing unbind, with range [%llx...%llx)\n",
> >   	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> > -	/*
> > -	 * Wait for invalidation to complete. Can corrupt internal page table
> > -	 * state if an invalidation is running while preparing an unbind.
> > -	 */
> > -	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
> > -		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
> > -
> >   	pt_op->vma = vma;
> >   	pt_op->bind = false;
> >   	pt_op->rebind = false;
> > @@ -1900,7 +1910,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   	if (err)
> >   		return err;
> > -	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
> > +	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> > +						vma, NULL, pt_op->entries);
> >   	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> >   				pt_op->num_entries, false);
> > @@ -1915,6 +1926,42 @@ static int unbind_op_prepare(struct xe_tile *tile,
> >   	return 0;
> >   }
> > +static int unbind_range_prepare(struct xe_vm *vm,
> > +				struct xe_tile *tile,
> > +				struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +				struct xe_svm_range *range)
> > +{
> > +	u32 current_op = pt_update_ops->current_op;
> > +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> > +
> > +	if (!(range->tile_present & BIT(tile->id)))
> > +		return 0;
> > +
> > +	vm_dbg(&vm->xe->drm,
> > +	       "Preparing unbind, with range [%lx...%lx)\n",
> > +	       range->base.itree.start, range->base.itree.last);
> > +
> > +	pt_op->vma = XE_INVALID_VMA;
> > +	pt_op->bind = false;
> > +	pt_op->rebind = false;
> > +
> > +	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
> > +						pt_op->entries);
> > +
> > +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > +				pt_op->num_entries, false);
> > +	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.itree.start,
> > +					 range->base.itree.last + 1);
> > +	++pt_update_ops->current_op;
> > +	pt_update_ops->needs_svm_lock = true;
> > +	pt_update_ops->needs_invalidation = true;
> > +
> > +	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
> > +				    pt_op->num_entries);
> > +
> > +	return 0;
> > +}
> > +
> >   static int op_prepare(struct xe_vm *vm,
> >   		      struct xe_tile *tile,
> >   		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> > @@ -1982,6 +2029,9 @@ static int op_prepare(struct xe_vm *vm,
> >   			err = bind_range_prepare(vm, tile, pt_update_ops,
> >   						 op->map_range.vma,
> >   						 op->map_range.range);
> > +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> > +			err = unbind_range_prepare(vm, tile, pt_update_ops,
> > +						   op->unmap_range.range);
> >   		}
> >   		break;
> >   	default:
> > @@ -2171,6 +2221,8 @@ static void op_commit(struct xe_vm *vm,
> >   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> >   			op->map_range.range->tile_present |= BIT(tile->id);
> >   			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
> > +		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> > +			op->unmap_range.range->tile_present &= ~BIT(tile->id);
> >   		}
> >   		break;
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 32b1581b1ad0..58fbe1b65e8b 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -216,7 +216,14 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> >   static int __xe_svm_garbage_collector(struct xe_vm *vm,
> >   				      struct xe_svm_range *range)
> >   {
> > -	/* TODO: Do unbind */
> > +	struct dma_fence *fence;
> > +
> > +	xe_vm_lock(vm, false);
> > +	fence = xe_vm_range_unbind(vm, range);
> > +	xe_vm_unlock(vm);
> > +	if (IS_ERR(fence))
> > +		return PTR_ERR(fence);
> > +	dma_fence_put(fence);
> >   	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 12e5e562c5e1..20ea099664af 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -984,6 +984,89 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
> >   	return fence;
> >   }
> > +static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
> > +					struct xe_svm_range *range)
> > +{
> > +	INIT_LIST_HEAD(&op->link);
> > +	op->tile_mask = range->tile_present;
> > +	op->base.op = DRM_GPUVA_OP_DRIVER;
> > +	op->subop = XE_VMA_SUBOP_UNMAP_RANGE;
> > +	op->unmap_range.range = range;
> > +}
> > +
> > +static int
> > +xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
> > +			   struct xe_svm_range *range)
> > +{
> > +	struct xe_vma_op *op;
> > +
> > +	op = kzalloc(sizeof(*op), GFP_KERNEL);
> > +	if (!op)
> > +		return -ENOMEM;
> > +
> > +	xe_vm_populate_range_unbind(op, range);
> > +	list_add_tail(&op->link, &vops->list);
> > +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_vm_range_unbind() - VM range unbind
> > + * @vm: The VM which the range belongs to.
> > + * @range: SVM range to rebind.
> > + *
> > + * Unbind SVM range removing the GPU page tables for the range.
> > + *
> > + * Return: dma fence for unbind to signal completion on succees, ERR_PTR on
> > + * failure
> > + */
> > +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > +				     struct xe_svm_range *range)
> > +{
> > +	struct dma_fence *fence = NULL;
> > +	struct xe_vma_ops vops;
> > +	struct xe_vma_op *op, *next_op;
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +	int err;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +	xe_vm_assert_held(vm);
> > +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> > +
> > +	if (!range->tile_present)
> > +		return dma_fence_get_stub();
> > +
> > +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> > +	for_each_tile(tile, vm->xe, id) {
> > +		vops.pt_update_ops[id].wait_vm_bookkeep = true;
> > +		vops.pt_update_ops[tile->id].q =
> > +			xe_tile_migrate_exec_queue(tile);
> > +	}
> > +
> > +	err = xe_vm_ops_add_range_unbind(&vops, range);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	err = xe_vma_ops_alloc(&vops, false);
> > +	if (err) {
> > +		fence = ERR_PTR(err);
> > +		goto free_ops;
> > +	}
> > +
> > +	fence = ops_execute(vm, &vops);
> > +
> > +free_ops:
> > +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> > +		list_del(&op->link);
> > +		kfree(op);
> > +	}
> > +	xe_vma_ops_fini(&vops);
> > +
> > +	return fence;
> > +}
> > +
> >   static void xe_vma_free(struct xe_vma *vma)
> >   {
> >   	if (xe_vma_is_userptr(vma))
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index a82fe743bbe0..3b6316dd9fd6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -221,6 +221,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
> >   				     struct xe_vma *vma,
> >   				     struct xe_svm_range *range,
> >   				     u8 tile_mask);
> > +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> > +				     struct xe_svm_range *range);
> >   int xe_vm_invalidate_vma(struct xe_vma *vma);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 576316729249..19576ac095e7 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -361,6 +361,12 @@ struct xe_vma_op_map_range {
> >   	struct xe_svm_range *range;
> >   };
> > +/** struct xe_vma_op_unmap_range - VMA unmap range operation */
> > +struct xe_vma_op_unmap_range {
> > +	/** @range: SVM range to unmap */
> > +	struct xe_svm_range *range;
> > +};
> > +
> >   /** enum xe_vma_op_flags - flags for VMA operation */
> >   enum xe_vma_op_flags {
> >   	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> > @@ -375,6 +381,8 @@ enum xe_vma_op_flags {
> >   enum xe_vma_subop {
> >   	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
> >   	XE_VMA_SUBOP_MAP_RANGE,
> > +	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
> > +	XE_VMA_SUBOP_UNMAP_RANGE,
> >   };
> >   /** struct xe_vma_op - VMA operation */
> > @@ -397,8 +405,10 @@ struct xe_vma_op {
> >   		struct xe_vma_op_remap remap;
> >   		/** @prefetch: VMA prefetch operation specific data */
> >   		struct xe_vma_op_prefetch prefetch;
> > -		/** @map: VMA map range operation specific data */
> > +		/** @map_range: VMA map range operation specific data */
> >   		struct xe_vma_op_map_range map_range;
> > +		/** @unmap_range: VMA unmap range operation specific data */
> > +		struct xe_vma_op_map_range unmap_range;
> 
> :%s/xe_vma_op_map_range unmap_range/xe_vma_op_unmap_range  unmap_range/

Yep, thanks.

Matt

> >   	};
> >   };
> 
