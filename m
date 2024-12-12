Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D719EDE0F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 04:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9E910ECB1;
	Thu, 12 Dec 2024 03:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0nv/8lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2653E10ECAF;
 Thu, 12 Dec 2024 03:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733975943; x=1765511943;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tMxOWFidS1KFPfOY9zDI1HBo/ThuAqx0hkAvHaGhe3k=;
 b=O0nv/8ltBaEO2G7zNEpksKwB3dCdHqmaDK2GBVDf0op/VRe0/2ENTH88
 qrNWz2L420wbTrZk1P+9WBkKAo8vGJgDkhyN+v8VRx9qQ9wZDIn4a/t7E
 //inL6yiiiBtqSSIk3tQVrmoYTcP/CuATM81YafX6EzjP1GU+TT3KX9iO
 N5nKSWvLIX4Or3/O4qa8BYZ2HStsfubqb/BJlazQU2yXopJaoTuDK/+TI
 Sl050tqYd4BVLKvfo/RKKSQH2yLfNJ/0E1wpdCcf0ClPQH1uYTwl9dRh7
 ai4EhdNfW1ZPe/eFngAizeE4lMB1sKh9yhDuanqnyjJlAXU0YO/Y9yBA8 A==;
X-CSE-ConnectionGUID: ++yQH9DIRPWM2qZFolqSHQ==
X-CSE-MsgGUID: jW9AxEySTMGIc2xUxEBJ7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34299912"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34299912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:59:02 -0800
X-CSE-ConnectionGUID: RosGC/hPTXeWJqDXmJz+/g==
X-CSE-MsgGUID: 95YeH/7CTVuKmk8s+URigw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="101165891"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:59:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:59:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:59:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:59:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJMdr3Y8Sg2HNtswT8BsTF1JuyzqVHO2eiqqbeiydDZC0WAKmkIEVoeygs9lvWTX4IhIang2RgJlO6PZOzYsdsKi1rjrazw/K0V2X9QjZeRE5ljK9QKwUM+ttBPyESTS+tBvzHuBiV78wyEwKWRQjNXFIRpVumSMZKDD5JupZ7S08zqovKwIaAVG0cw5TmZsgpmcQH8DfYcPgWYNpJTRDIlKKFKi42a3N3OOklAuwi+hxE2eHI20tGPNjYs/KdYh3q31jkeQvxCpqa/EruQgNThqIhrlutTIqj16Z69qlqiC0GLGLvqNCxg9m8SPv3xzOupsmAYzGazDjlVnlJR7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwFh+s90geEU07zLiHW9UqNKEKOeYOW9vb3sEiHJQZ0=;
 b=eknqEL7LUH1A8+YpQsl/1fL0QDfruhnT2YTXGromiDuNjnSmEyXKz+F570jH5SHM0vEaXO3jIKXHucIfLoJbTD/AwHn2fTGQTqvAfrrMQzOO6094gcXhtpx2GOgY62u3LajaVHzrogLcsyLgj2dKe+CS40g3wiO61tVKCzbHCa0OMv3rb3SnOyB6vwYU4B5MUU0vFBWhxsUjqjAhngwFca6nJSaR54bhL9MI9IkImwUmuS52NkFFCOETg5TWuO71QDfjTrXhSH229AntFyeT6Qj8vJ5Uz9PQC85lo6ofKqvUIXtvxlvixUDuU+xJXfPG+zML3+MhAVJPZx7lZlZzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Thu, 12 Dec
 2024 03:58:31 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:58:31 +0000
Date: Wed, 11 Dec 2024 19:59:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 19/29] drm/xe: Add GPUSVM devic memory copy vfunc
 functions
Message-ID: <Z1pfj1O1wDU4n8Wj@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-20-matthew.brost@intel.com>
 <f3726a7297943fb5316ab16c1943bc6fbe42be24.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3726a7297943fb5316ab16c1943bc6fbe42be24.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea66480-3eea-4c76-f492-08dd1a613e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sKDAHsrqMEHMePMZlzuS4j5wxDXDi0K7MART6nIL1y+mTprr8NK5vIBjM+?=
 =?iso-8859-1?Q?HORu4U1u7OQTgKxFSMjhPAzCrrsDK5yarHKsssHDH0DRF+B3vvFpj1Rtgd?=
 =?iso-8859-1?Q?M2FlMN2R7sJghdSlg3nQvygAJae4cm22JIN+WijL3ySYIY35f4fct6+nG+?=
 =?iso-8859-1?Q?NnntEDgxYPTB+6y5RGqGXsK+eHttitm/Q64hZEdaFUIY0E90UnGT2xZNmw?=
 =?iso-8859-1?Q?uDzJteUxfTNNbrMN84VbQbSg99oSoVKB4qvm2t+a95AlrQqM3ZxCA43dp/?=
 =?iso-8859-1?Q?lsbSrkhBf/1BAii3CMi2WS73CbNB/tsB0dAlxSocieWyTESIpO2WRTxnXn?=
 =?iso-8859-1?Q?soDgMgoTxkL0IJi9AyarBVO9EhS8uMfBiMRL+wbRc7FoInDNcVxAR6+tWs?=
 =?iso-8859-1?Q?pImhJ5uw++fIFOlPWMDOatftnAnZ86ZRwpV3xEqh+CQW4EzcKaSeovJY8F?=
 =?iso-8859-1?Q?Ulm5lmXn54hKH/7JBJ30FptADBEn5EoziFdytvBEZHLPO1dthMd67yF6Hl?=
 =?iso-8859-1?Q?WhbIiONQF/lh4ec1j+UeT5VbF5NyyLb+OyQCbk5KsV3aTD31jlL4EWqv6a?=
 =?iso-8859-1?Q?sxnGSlF13bzsgq9tCtK3gkF/16dehTPLPOx1bmpRa7CgtdcfZQGlX8mPO7?=
 =?iso-8859-1?Q?FNVYxhRHD3tpOPJea6sACuy+FRfRY4txV4VTFfRztNpzy5bdLqPP+DbGkC?=
 =?iso-8859-1?Q?gFENq53MTm/wrx2iC/RAd28I0+w+8bCgX7y0xpL7/mWkMugTmafBvacXjQ?=
 =?iso-8859-1?Q?4zYxY2eJszKqhd7E5y0pRPY56O0Rezigb6mMQzHJ2ki5gjAFemdHsOdTQe?=
 =?iso-8859-1?Q?sdV3g3PBSjYtqvlPUdF06b0EHRGywYINW2pTvDKSUUS2TaHW9nP/4UMPG5?=
 =?iso-8859-1?Q?ZpXjpU8ozz9TZ3wFtkTpndIixeBtitoBvY2QwpkdWn8Fo6bERM2JPnaTyg?=
 =?iso-8859-1?Q?GjCpc7OdOMi3zeLvVjb2/J2tfkvcjxkLdP+N/dMsZ2oYAYOfqsq3h4gTE9?=
 =?iso-8859-1?Q?83YwHZ3zwUTqaFXAR6fQo0BJ2kkUPntiWK8kJ2E3D2htB4qzsFNHPtkfpi?=
 =?iso-8859-1?Q?5Pn/ahw6Num/p5U2hb+ITfvryCPfonyVUWgFXNkhap4Ek7e6tQecBY46PU?=
 =?iso-8859-1?Q?oL389B8zNG575lKoum0y/o79uBl9lbTO1JRifA6pADzCDI5DR+T/3nykvg?=
 =?iso-8859-1?Q?T1Vfy4bfuJio2wVG1IwRbhGRvPm3CCVKymQ2BwW1q4hqrFdTl+b8du5qq4?=
 =?iso-8859-1?Q?RtEFd+W8Ib3epI2f8iUMjj4V2bUi0bXKMZEZNMPMmpFewwQt1YNDMVFDjG?=
 =?iso-8859-1?Q?Y6uPxCSt9+m2lfsmNHfsS5AwNh6oknemdg7ZVfYHCJ286btwr4HJj0KblH?=
 =?iso-8859-1?Q?WykDb8IJ6FNOmWYaDnBUgqLwOeM92Jfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DdmRIKG6QE4dIzfhsgWsx+a6AccwScBWBWXjxanMv4d0N5WAOnQBSVdXR9?=
 =?iso-8859-1?Q?Viozsd3Z/h9D0XI8BFZIkkpjVaQjXBMaiwMV4Hsh+j3E3xOOl+lioehIYi?=
 =?iso-8859-1?Q?FXDWwVVMwM61ukoaX+h/IIzDonfV2PAJ/Apv4Qv4A31mY21lzFHHzTwmLN?=
 =?iso-8859-1?Q?avANlgx6b9yvys6YfWSdn149I7ZTiriOu3iHYL2HcW1g/eChYixd2Q9YX0?=
 =?iso-8859-1?Q?da74ONMnHKaeKukw2fuGJUm2c46GxygFDNMeYAq8A85FdX9rxDN5yh6NYR?=
 =?iso-8859-1?Q?R0jd2G2HyfnHGCIE2khQmeS7scEQh4eEhn1CEVm67ooqfzmrjiLpCJ1avA?=
 =?iso-8859-1?Q?Z9n4DSLfGk4RS4GfsY2FYtYbwjPPnIEVtRiKUNOzf0cCHX8HLhlwpU64pQ?=
 =?iso-8859-1?Q?9cKmNPGHeW3u7zS1K/8lwves0ujWUWsmxpWXbQRqadBn2GNEFmZO0Z6E9b?=
 =?iso-8859-1?Q?88tThmemuCRrdkNk9DcLahaz2QUzOXtkaGUwUxWH1aFKtN/2xlY+VlSea4?=
 =?iso-8859-1?Q?DKmP+0IXklpvyT/whIBl7fHvjYSICbomFYgpEoZ/207KketxiqYHzOymTX?=
 =?iso-8859-1?Q?nxygtzg3nmyEXLL62PVBPcvnyy+I5MRV+uo161rZXRgTBTMZO4nqQGEo4M?=
 =?iso-8859-1?Q?LHcJeCBGTA/Io2sPDL3/f1ZM4rBBmJMHSpUrQMzKlH8OS5m5dGOAi5/How?=
 =?iso-8859-1?Q?rgmSLojWDSJmO3G6G3TVPETyYVEeygJ/+Sm1T9quTFE0vT0Is0X2CHlWvZ?=
 =?iso-8859-1?Q?TohhIAb+aLU4hfo3feNFyqWYPnrCn4ZloVIC5r5NsfZ8+JklYn5u9aS3wb?=
 =?iso-8859-1?Q?A1ZEQNuRITilNwUwZ7qDLg5hJ+j20T7/6OuqHJ6IvvVhxZN0UCIH43RuAe?=
 =?iso-8859-1?Q?r35dVi5XktgkNzJEKbtMKcJYe0tP1h5DCxihVHu2WuKBI9vHhsu7Kb12l8?=
 =?iso-8859-1?Q?gWwu/BC+jN4xS8sJB9nAjasqjW4VNQsfWgAB1p9+YImBrAw3/dmDQVFTtR?=
 =?iso-8859-1?Q?YEgO7poVdKTwPCDPe92a3xDVDOHI8dUKMb6I3hoK7ByP/ReQecyzkdWOf8?=
 =?iso-8859-1?Q?7OSubeYRG4FIvzKUh5SGjBQ/d62iZb6SlwGr5CN3OaZlAQ9wCSJudvh7Zn?=
 =?iso-8859-1?Q?YFUKGxWsdw/dsRCQmBM3/UC7ICRYTBoCQyVfSc9D+ZX1fgUW4vB3wYdAYI?=
 =?iso-8859-1?Q?g7N37e2ly3/Q8SHU36anKZ19IKvscxmqKdGfZ1VtIa0hCE/RgRWOtDymqr?=
 =?iso-8859-1?Q?tiYtXF19UUgeaqoWZtzeWRlPy1yInluIWbF77Cnch4+d2IqpvNW/acDP1G?=
 =?iso-8859-1?Q?VPfwsWsBp5w8LtezEiGRXBe9jiAClfGnp/uh79r0l1wSg8P6OQoPVnAeMj?=
 =?iso-8859-1?Q?1vMfD9dL9BC+iMK6F8skABdChq/Zkq1zGSBzsZnwk+iZm2zfkl3wZYNZON?=
 =?iso-8859-1?Q?tqHHWITfP1OqRPb8yK7PdrtHeX0EBRq3SH80H9ax+f/IOuo3O1cacv5jt0?=
 =?iso-8859-1?Q?2rWIvYx6Gd25cc1AHcLc7oZdrnYH276yXNvrMD6aM5sHGilGd3IZ/9P2Tn?=
 =?iso-8859-1?Q?RYRcTz/2GBJdxX/KW8+XEDfFvjsQiBiTBT8ujRVT6LzQybKpT+omSkGplS?=
 =?iso-8859-1?Q?BDuG1NzC8FZCMPnRY7Z3mOLuREfPc7llBQ+4rqHKIYpF/TrzCwZezI1A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea66480-3eea-4c76-f492-08dd1a613e08
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:58:31.4159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiyKxp9p8poAnO661o1G0IEj/NKBtG/V9CHpJzT0oIyfD5rvYEiRUlU6s1AXhXDPFHSYrJ0UBVcA1sB2X7kypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

On Mon, Dec 02, 2024 at 11:13:55AM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Add GPUSVM devic memory copy vfunc functions and connect to migration
> 
> s/devic/device 

Yes.

> > 
> 
> > layer.
> > 
> > v2:
> >  - Allow NULL device pages in xe_svm_copy
> >  - Use new drm_gpusvm_devmem_ops
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 150
> > ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 22e6341117bd..b33fd42d035b 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -6,6 +6,7 @@
> >  #include "drm_gpusvm.h"
> >  
> >  #include "xe_gt_tlb_invalidation.h"
> > +#include "xe_migrate.h"
> >  #include "xe_pt.h"
> >  #include "xe_svm.h"
> >  #include "xe_vm.h"
> > @@ -269,6 +270,155 @@ static void
> > xe_svm_garbage_collector_work_func(struct work_struct *w)
> >  	up_write(&vm->lock);
> >  }
> >  
> > +static struct xe_mem_region *page_to_mr(struct page *page)
> > +{
> > +	return container_of(page->pgmap, struct xe_mem_region,
> > pagemap);
> > +}
> > +
> > +static struct xe_tile *mr_to_tile(struct xe_mem_region *mr)
> > +{
> > +	return container_of(mr, struct xe_tile, mem.vram);
> > +}
> > +
> > +static u64 xe_mem_region_page_to_dpa(struct xe_mem_region *mr,
> > +				     struct page *page)
> > +{
> > +	u64 dpa;
> > +	struct xe_tile *tile = mr_to_tile(mr);
> > +	u64 pfn = page_to_pfn(page);
> > +	u64 offset;
> > +
> > +	xe_tile_assert(tile, is_device_private_page(page));
> > +	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >= mr->hpa_base);
> > +
> > +	offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
> > +	dpa = mr->dpa_base + offset;
> > +
> > +	return dpa;
> > +}
> > +
> > +enum xe_svm_copy_dir {
> > +	XE_SVM_COPY_TO_VRAM,
> > +	XE_SVM_COPY_TO_SRAM,
> > +};
> > +
> > +static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> > +		       unsigned long npages, const enum
> > xe_svm_copy_dir dir)
> > +{
> > +	struct xe_mem_region *mr = NULL;
> > +	struct xe_tile *tile;
> > +	struct dma_fence *fence = NULL;
> > +	unsigned long i;
> > +#define VRAM_ADDR_INVALID	~0x0ull
> > +	u64 vram_addr = VRAM_ADDR_INVALID;
> > +	int err = 0, pos = 0;
> > +	bool sram = dir == XE_SVM_COPY_TO_SRAM;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		struct page *spage = pages[i];
> > +		struct dma_fence *__fence;
> > +		u64 __vram_addr;
> > +		bool match = false, chunk, last;
> > +
> > +		chunk = (i - pos) == (SZ_2M / PAGE_SIZE);
> > +		last = (i + 1) == npages;
> > +
> > +		if (!dma_addr[i] && vram_addr == VRAM_ADDR_INVALID)
> > +			continue;
> > +
> > +		if (!mr && spage) {
> > +			mr = page_to_mr(spage);
> > +			tile = mr_to_tile(mr);
> > +		}
> > +
> > +		if (dma_addr[i] && spage) {
> > +			__vram_addr = xe_mem_region_page_to_dpa(mr,
> > spage);
> > +			if (vram_addr == VRAM_ADDR_INVALID) {
> > +				vram_addr = __vram_addr;
> > +				pos = i;
> > +			}
> > +
> > +			match = vram_addr + PAGE_SIZE * (i - pos) ==
> > __vram_addr;
> > +		}
> > +
> > +		if (!match || chunk || last) {
> > +			int incr = (match && last) ? 1 : 0;
> > +
> > +			if (vram_addr != VRAM_ADDR_INVALID) {
> > +				if (sram)
> > +					__fence =
> > xe_migrate_from_vram(tile->migrate,
> > +								    
> >    i - pos + incr,
> > +								    
> >    vram_addr,
> > +								    
> >    dma_addr + pos);
> > +				else
> > +					__fence =
> > xe_migrate_to_vram(tile->migrate,
> > +								    
> > i - pos + incr,
> > +								    
> > dma_addr + pos,
> > +								    
> > vram_addr);
> > +				if (IS_ERR(__fence)) {
> > +					err = PTR_ERR(__fence);
> > +					goto err_out;
> > +				}
> > +
> > +				dma_fence_put(fence);
> > +				fence = __fence;
> > +			}
> > +
> > +			if (dma_addr[i] && spage) {
> > +				vram_addr = __vram_addr;
> > +				pos = i;
> > +			} else {
> > +				vram_addr = VRAM_ADDR_INVALID;
> > +			}
> > +
> > +			if (!match && last && dma_addr[i] && spage)
> > {
> > +				if (sram)
> > +					__fence =
> > xe_migrate_from_vram(tile->migrate, 1,
> > +								    
> >    vram_addr,
> > +								    
> >    dma_addr + pos);
> > +				else
> > +					__fence =
> > xe_migrate_to_vram(tile->migrate, 1,
> > +								    
> > dma_addr + pos,
> > +								    
> > vram_addr);
> > +				if (IS_ERR(__fence)) {
> > +					err = PTR_ERR(__fence);
> > +					goto err_out;
> > +				}
> > +
> > +				dma_fence_put(fence);
> > +				fence = __fence;
> > +			}
> 
> I think the flow in this function is a bit hard to follow. Could it
> perhaps be simplified? If not, perhaps add a comment to the function
> what it expects from the input arguments and the possible corner cases
> that complicates it?
> 

Maybe? It may need to updated to do clears to in the next rev, so let me
play around with this. At minimum can add comments + kernel doc.

Matt

> 
> > +		}
> > +	}
> > +
> > +err_out:
> > +	if (fence) {
> > +		dma_fence_wait(fence, false);
> > +		dma_fence_put(fence);
> > +	}
> > +
> > +	return err;
> > +#undef VRAM_ADDR_INVALID
> > +}
> > +
> > +static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t
> > *dma_addr,
> > +				 unsigned long npages)
> > +{
> > +	return xe_svm_copy(pages, dma_addr, npages,
> > XE_SVM_COPY_TO_VRAM);
> > +}
> > +
> > +static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t
> > *dma_addr,
> > +			      unsigned long npages)
> > +{
> > +	return xe_svm_copy(pages, dma_addr, npages,
> > XE_SVM_COPY_TO_SRAM);
> > +}
> > +
> > +__maybe_unused
> 
> Is this __maybe_unused to be removed in a follow-up patch? If so could
> you add a comment stating that?
> 
> > +static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> > +	.copy_to_devmem = xe_svm_copy_to_devmem,
> > +	.copy_to_ram = xe_svm_copy_to_ram,
> > +};
> > +
> >  static const struct drm_gpusvm_ops gpusvm_ops = {
> >  	.range_alloc = xe_svm_range_alloc,
> >  	.range_free = xe_svm_range_free,
> 
> Thanks,
> Thomas
> 
> 
