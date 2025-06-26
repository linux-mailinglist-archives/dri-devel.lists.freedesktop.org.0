Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC7AEA635
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B133010E8F8;
	Thu, 26 Jun 2025 19:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJBgJ/KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D1E10E0ED;
 Thu, 26 Jun 2025 19:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750965362; x=1782501362;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6vfQ6DImhvsRbErmGbKkdmgE40ezSb+6WwuGZvzuo28=;
 b=XJBgJ/KB+gC4xo385XkKWdG18tRxcr91z/7MVOGn0Bw9isx99sB65nCl
 8AyNtK710CtizHyCoaQloEnW0437O4LfzyEFhLwHsJ7CRmWePW7BrXG5I
 aarUG63R8CvmeygY3aD0NMEodphZceC+YjIe4dUMCIrVSUU5CSFGHjKDK
 HJNERm2teKNAZ+nsT0Zo+JuS5rehRjhUVeOMe01/YQ3VzvTzeee1Rw5VK
 stj0QibCiDqW8SqCloKjXmU/NSwJCRYqkXPDHjVLaK9iYxfFe3/qX/OOu
 nz0+2zt9A1XzbErGCviS9mx0LYNWmXlFQPPxEOYjSE8JAG/8fvpDP5Ejc Q==;
X-CSE-ConnectionGUID: B10XstqVRGS+cGzUgVPqlw==
X-CSE-MsgGUID: k+2EuysfQBe8KypoXix4Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53239551"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53239551"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:16:01 -0700
X-CSE-ConnectionGUID: gP1MridIQY6AkVMSSkkn2g==
X-CSE-MsgGUID: ugtNj+dtQ+OgFVy0gfplJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="156630001"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:16:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 12:16:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 12:16:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 12:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqvZdd23EihYtC7XAl1UHftrAoOm4J4ZQUk1/Rn6OzpQsXgy4VLyWaQ7Z0nh4mxRXdGsX11cilTa3hH7xcCQ7jSNMDoXH0Wtn1/gKjzMzBm4Rr9nzpcgwOOX5e7daC12SCkSQUJDQD6SQ1HcVNysvX2/+oYWtOkT0O6WJGE4+jgD+I2BP5XkiOLDsfGyqXBbrFvxlyAlRI97j724QpFhkEHS0RRGUC54uWDNfZgLEzE+SdiKYKVmmlvnYZzoTCBSmSonr+zKf2EhoMXz2FqpZVeHyCyU7RfSMoJVU4du7cHhMoytFYVT3fhEMJH2ovxkvjq63S44eQFlJT/OEEK4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFs7XtJ5pAN0qxq03utxvAQrd7o/KBjH2IJEvJUNOEY=;
 b=NlQXGr6nLUrcHLF0C6u1wDhUSw2PBQb8rSD6ItJoIlwh8Qw5wMLiUJencbMpi6KsWDEjyNt8rv/P42KDWvqw39WwcR/XTMQSpYDcN+HbHMZOH+OrSLqtJ7Lb4jLeI5esTj9KTB7XZnew5BtBwzPoyRP5dwZZ+yqQQk990q+tYukFJvDAW/pNKF2NjHH1COsW5PIdXOAe8SZtGApohuveS0UkPVTbfn/hs6vVKYYce6FJ2w60lNLqx9wvqf3brAlBq7CnkbUBCX5VZhtWzhQFXMFMHD4lOJua9V/bXxT6uYFfdZSExnMpI9mmvMB0AsXtTb6klRwYTu43hoxCHNa+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6503.namprd11.prod.outlook.com (2603:10b6:8:8c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Thu, 26 Jun 2025 19:15:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 19:15:29 +0000
Date: Thu, 26 Jun 2025 14:15:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: linux-next: Tree for Jun 25
 (drivers/gpu/drm/{i915,xe}/intel_pcode.o)
Message-ID: <v7cozjpsggel5uzg5krdork42k4tqnefn5tqs6lxdjqvbnyzp2@65nioys2ix64>
References: <20250625172220.2b6aeff8@canb.auug.org.au>
 <3667a992-a24b-4e49-aab2-5ca73f2c0a56@infradead.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3667a992-a24b-4e49-aab2-5ca73f2c0a56@infradead.org>
X-ClientProxiedBy: SJ0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6503:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db2e2b0-0856-4287-baaf-08ddb4e5d038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P3Kj8s18aUqxGgeDba8Z4IQLKoGhzNrxNZVMAZWaI4kusM/6jERGxhooRmnf?=
 =?us-ascii?Q?Y9gE8OjT0kUGsrE0LSnA9tHBEbibeSYuQthGQKtlc+EnHPnzhZYos71RToow?=
 =?us-ascii?Q?q4GxvZ41XWdSx6QKQmh+pA7hhSfjlLp4yYxBXTdlqZLZF2+BgwVXLrcw00FB?=
 =?us-ascii?Q?WhMZ1OsJgSHB0+3tYHR+EN9xQfCYBDuiNcW+fJ7LKEdnln6nQHlK906WUin8?=
 =?us-ascii?Q?dxdzmYrt442M2P44FOayhaNDQvKhcSIYQASirtERaI/6msvgOExBqmz/pRQv?=
 =?us-ascii?Q?+kXUd1wVtOL1n2CRgqfn1jIwN3Jus+a/UhNBfWZuYEkPQy5f4tNPFDpVNNuk?=
 =?us-ascii?Q?X+fGkxY+lcuOoahZy5o4ufV9wxzNI5U5e5pOUaSqNRGLJ//mMTNu+YQnm/Mg?=
 =?us-ascii?Q?2aAFMXMCsHk26WOqIpqa2fTrxe3Cqtgkl+lh/GXU1DLXi3QkPxwLJtQYo7Fv?=
 =?us-ascii?Q?xQWCWI55PhWGvItVgDhuI0KVQZpWxmTa+2+Y7izF8S69ClBhp3mLuq7EDn/q?=
 =?us-ascii?Q?YtVOXVujAtvd4LkITFZxK93lri+QcT+bYMzfffpyJSnVaZA+ypI2k3sm8hZv?=
 =?us-ascii?Q?gkvgR87VFYLmB4I/lJAu5A2mG8efIdj4LZQDyqIdk0rSTvLdSyZidmh7oXU4?=
 =?us-ascii?Q?GQNkn3CEr57IwaCzs36H0JYGaAenFbsxNub+WT1yn7KvKtTpRdNpu+zgYMuI?=
 =?us-ascii?Q?frfZrGSEMjPmSek30sGCvHxpx6wKdmv4KAZPg33cA2x9+XSo7U2sbCk6JnjN?=
 =?us-ascii?Q?iyLeDJIf+ajb4nT55Vb9LHs7//79qvZ0zK5GCvnvXTc+9zGLZ8FMrtlFe7x8?=
 =?us-ascii?Q?e+185hKvxViZ/BWrd1nccpX9mNJpXCDVnKDRQGONJvZ71TBuSrM1OfSSULLb?=
 =?us-ascii?Q?M5TEviGl3TIYrP6HozasozA5DWcon2iq4RKhG2AJILWWyBTOqtE/N7ozS96F?=
 =?us-ascii?Q?qQraBl9bJRMaJTKULdxd+WnnpcZbr7KdxuR9UN8RadrttrZRZu4QlY5GiMHv?=
 =?us-ascii?Q?vm2suMdlPcCIxRnEm70LnDZrSn79auIBODk329rLzO5mSJOkCieDrLauG+UD?=
 =?us-ascii?Q?jIe4KVJGjIgG4fzufY+VnYnJPBH5XsxoW4L1OomGHnn1R74QNYRwHPR4Y3cX?=
 =?us-ascii?Q?bbymBVsAr/SCWnXxYsf41/XJHTLC20GDRUUIG2s3izShltyyzEzT3Lu9Hm/e?=
 =?us-ascii?Q?BOOrZs7vAQb3rVSifiKjX9AdjKa1xO39f0/0grty74OgdiQnkA4HsuQFMJMN?=
 =?us-ascii?Q?VuAw3hyhf1mfuHHnsfxSFur01bpXucBYMIHCNKW2qLDRp68S5qqBGBtMRb+S?=
 =?us-ascii?Q?8SabJOTSfjq3SJfU7cggQ0zL96FCsFfHEZqfLrWv0FnkMEcSCM2JZdqAK0lt?=
 =?us-ascii?Q?ktb5vo01v/kRqAqYj7SXiRxCK2O/ksBsn9JpmDqwRff3Q5n7sIA7BzHbzjkR?=
 =?us-ascii?Q?Q/lJpGriHm4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?roSqW9Kxn1Zh4c6cqMAsW+gPLccZkOPrWQB+ADUmsgnfs2TjOtH/7NlTiCHI?=
 =?us-ascii?Q?GQhEScuQ3qjp0zFLWvoXWyNvdeFfYywYuItubnijxNce6g2wdFsuvjWDDbJ3?=
 =?us-ascii?Q?a2Svb3l4RWas37RVxHh1aLC8fIj9ra0/xk0ZoKOlODnWljvST2eMWlIsrclO?=
 =?us-ascii?Q?2SkkcuL/LFryy/c/WxEc6A6Ag0mnjLsJ2UdZt+qiD5sSHH++ZCSUTwan7F1i?=
 =?us-ascii?Q?KIQE5xSFwr5cioKG47YrEGKhtDTGOGzBpTxh2TMqjHjWxmPYcKbxlgO+114/?=
 =?us-ascii?Q?3+B3QDDTRL9fPr0Pr1SrTOzq+Ra165Wl2oXXOEOYcUB/1rIrMy6W8xovNWfU?=
 =?us-ascii?Q?dYpEKFNN55peARl2xlg42scuCA33pMDVMDVEfRmnoInhng5/g6B52qSUbUER?=
 =?us-ascii?Q?Q4chDJCmAiurVeku3z33IhkKJUs0njFaYyGaMEXYwfuyGLNsny1bJ4gIB5NJ?=
 =?us-ascii?Q?Uw8fSabFrrODiL2X3+RtxpO3FcI4PeczDIhppO+d1A5E+ve0AdQ6QcTKffYY?=
 =?us-ascii?Q?ocs0k1oAC+z6BNT549iGNyw7DQUsfw5R2x4atlfbpiEOFLUbADFnbSHpRmhg?=
 =?us-ascii?Q?n/UWJ4vd+8ZLJzeAnmB5mmEI1F7G//5IMbgFH8d48nqpDrrX5Eg7O3nsZU7y?=
 =?us-ascii?Q?E3OVv6qc+CL39EY9z4EcsR/fKKHzjctqfN7aB8JpRKuOLkop0DQmJjygYGdF?=
 =?us-ascii?Q?B/LmIbuqjjgfSChkF3+UUjDuCHgwgGTGtGK1R0FFWS6m0LrA0vsvpyjq7tn8?=
 =?us-ascii?Q?Zsrc7mzw9AhCWvB0KjIU9PajmTcWUuSK6a5puu8bcINn4uBFTrFVwycod1ti?=
 =?us-ascii?Q?hexcMzjfhRMpFXNnwxczgmuRqL4/KBEYsETnn6vHsHiKiGQ0NkAuBtr/1At1?=
 =?us-ascii?Q?cSySGzbNQ/iJ/t4VZhju88ahyV7GXvoRFC35QMgsPQcGU3N/VhBhm5hV/lw1?=
 =?us-ascii?Q?lynwhTTSoHeo1Nx46yozS8GbRZIS5fDEt1VeuYWRyI3thKY3iQoBRs+Lv97A?=
 =?us-ascii?Q?cwj0hdaIeVPQr0ozCs9Vr9/wfnnuZaWtEnhzYiOKgjsOeBK7Gqmp3q+Kr1pq?=
 =?us-ascii?Q?/hVW8EsEwBqbyN2+RCM0HM2cdKVxzt4vZvO5N4ZkdJpqDQDNZKB2IzJ10Gxy?=
 =?us-ascii?Q?c+qOFVOkylMqaK7gbJk4KtIYBRfkLyhEk3Bzh7o7N0cMceHNi8JHHQXu7lsn?=
 =?us-ascii?Q?6mDfI8IkZaIOBC3QxRdCjIhB/EgAk4oTDdZDPt78626BF7cJEDC+pAvsdnDy?=
 =?us-ascii?Q?wIOhNhJrakDLe7wwgqYKzjzFo+7iXf4Hy7/Jk7eq4+MHTHSNzdwpkouCwqeK?=
 =?us-ascii?Q?wsCZuFX4cOzUE1NpdcNUaRH/stvmHAWymqTRWJ+2iFeUy7I5s18YbBqpO8zp?=
 =?us-ascii?Q?chfJhvGRMwMZiJ8hJMAzKdBba7wQpYM4mD6S2KnUeY2y/rtmcYz9hf42Ehxc?=
 =?us-ascii?Q?+OsPTsLBcDivsV2VPguFAlOMbGYd3+fT/0M8eOof9cFl8MhLXke7VBpgFnQm?=
 =?us-ascii?Q?ajDZGR63KLdw1PqElydL8oaN1oSdjpgFoFseNYO67nn1xCRhJWnrEGeBAE/Q?=
 =?us-ascii?Q?CBbKACivr/6wVQegrDHUT83LLgdgjwXFMpyRjYFJ6pZ0oRcVgw/okpFRuq35?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db2e2b0-0856-4287-baaf-08ddb4e5d038
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:15:29.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANR5jBXdwzEsRDb1//RwvtVZ4r7PAStmNdGmxQKm4OrMfFL7fEIr++WUNfPcQ0Rjnfk1HELV923mAzEVvwSt8L/vA5z2APG8zoBh+pSZIDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
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

On Wed, Jun 25, 2025 at 08:57:40PM -0700, Randy Dunlap wrote:
>
>
>On 6/25/25 12:22 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250624:
>>
>
>on i386, when both CONFIG_DRM_XE=y
>and CONFIG_DRM_I915=y:
>
>ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_read':
>xe_pcode.c:(.text+0x7d0): multiple definition of `intel_pcode_read'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x990): first defined here
>ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_write_timeout':
>xe_pcode.c:(.text+0x850): multiple definition of `intel_pcode_write_timeout'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x9b0): first defined here
>ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_request':
>xe_pcode.c:(.text+0x8f0): multiple definition of `intel_pcode_request'; drivers/gpu/drm/i915/intel_pcode.o:intel_pcode.c:(.text+0x9d0): first defined here

not exclusive to i386... the pcode part used to be guarded by
CONFIG_DRM_XE_DISPLAY, but that is broken now. Possible fix discussed
in https://lore.kernel.org/intel-xe/gbisrh7ep2gn2fxv7xz4g4sy75qjpmcr5yqdx5atlab2oxevlx@j3zwx3k4o4x4/

Lucas De Marchi


>
>
>-- 
>~Randy
>
