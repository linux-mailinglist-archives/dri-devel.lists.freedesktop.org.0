Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F0AA60E1
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 17:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE50410E038;
	Thu,  1 May 2025 15:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbNb0fu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C796310E038;
 Thu,  1 May 2025 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746114306; x=1777650306;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YGWVErSMU18vDkLZtC7SHRmAKR8gnZw6nfdnTv6fxCU=;
 b=DbNb0fu5s67jYD+q8dVXLfM5+wdD1hCPAUW8S3rTKpZGyC4cLSrkCg+r
 KYh79HFarg5DooaHLGvwxvBII9OQg3l5U8SmMYyR2PpOHoaXpsuJg8RDy
 CSCmaHGbT9neaWNDlJwsrbOh8uDIpw9opB9s66YsMbu0of1mzabBl381E
 Z6O39uWe1yGbUQu1NAlq/XWGotrOjtEwr17lJsGmU5Rgrxpu0Ht6JfD2M
 XLU13vZB7DwTIWj/IO9lIQS6NuoiB733DnXXJota/yQeyJe/v3IWeeBfx
 VE1xSB4YzazxBf8yOLv5ky3+saLk7GJjGKT1tC9aMMOJqyX3dbdzkBQdV w==;
X-CSE-ConnectionGUID: Z+cJ4uAiTxiJAU4rIa/Z5Q==
X-CSE-MsgGUID: bFeXLvSPSt+qT4jg1+10iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47670460"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47670460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 08:45:06 -0700
X-CSE-ConnectionGUID: J8MENkevRpCrpbh1o0grLQ==
X-CSE-MsgGUID: s45ATng6T76RiQjztk1MYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="157638164"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 08:45:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 08:45:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 08:45:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 08:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMhD1fTXFGcc2/4ytYiYsfmoiJ8TtCUvCrUbv7X5ineGT2dVvuBYIvJRkZbpV5SsULCB8ESyu2UkOiKi0g8uokxPCMbMZL4yDQ997J7CAw1ozDTOVxH5vaJDVhXCp2d1djNSKQiYWWOKjH8j1r1URLJJGGN9b0tNoTftxDw1C/FQ50B2j5bwZBxcqzhcqD25o6ocpBdJCh3fstUFL2ob7Ntz2aymw7PondVG6ufoaCSHMFZ0FvLA5Ifea/M+DC26hGrhJBdEkGDdBz8ohSlUyBPUtASguJhnZpOEKRP5BOwf+y5T93zhanH8jGF/cBj9MbxGde0DGC0HX6TjA1QIWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXkR6EcIjS/tihJWuFCrz83AVuJIN3J37XDlAltmUTY=;
 b=lfcT45/NH/SN2fBmp+jJwF3jrqZBA2chiF+R34N4AmcFrovafEzP+umYRFqfsESdRIT8ju8w7T1InoN8qON0Uvnh0T7Hha7hY1OxyDukFJXwpKf97F6GZE8JV798B9Ta4WCbcWw7RTiXZXRlNiMgPR5GXEQ2IkrgHG9qp4zjeVEnzPi60QbnkuNODVLBhhmu+oT42wEXI3w2vZ0Iu0BiUchYKEIedCQvkWIiSocCsc9Bo8ivxTzGCt5WDnaaBW/8r+MxNlvuxEqwESYEdlYXRREMZ2Vf4nVW1b+I/v45SMIIqdGxqZ1m4StrtvpOzAnWvRX/je3kkiLXy8YTw62Y3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 15:44:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 15:44:47 +0000
Date: Thu, 1 May 2025 11:44:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Saeed Mahameed
 <saeedm@nvidia.com>, onathan Cameron <Jonathan.Cameron@huawei.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 <linux-kernel@vger.kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>,
 <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <aBOW6KblghsmwI_1@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429160956.1014376-10-badal.nilawar@intel.com>
X-ClientProxiedBy: MW2PR2101CA0033.namprd21.prod.outlook.com
 (2603:10b6:302:1::46) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd0d078-f879-45e6-61e6-08dd88c719d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ecojfPhz3CFy6oJGKo/b+DTkGoyjD8KhyslSCTzuJslvqA2gklHxo6+edG?=
 =?iso-8859-1?Q?bAc7Wtok+RROf82PtX0OdDY5V/1jMgTfx8dBPqQV+pqF2YMH58xz5rJHc7?=
 =?iso-8859-1?Q?CcWb/rn/A+O/7GHIFEjRT1KTAL0pwiEnugpm7NtV0VtlffwoRfdx090ltw?=
 =?iso-8859-1?Q?HDOF7+aNYRsyxlvmTA79/XCDNGA2GaFYrH00xXhJFtWZe+8RkXEd8wgaZZ?=
 =?iso-8859-1?Q?8/IEAGL+4PiFHl+ZWQNz0wLySPCBmbeSF+fQP7Ru9YHtbZoO5DNe6R4taF?=
 =?iso-8859-1?Q?5Y58AcrgqGQgS0L3/puqU4jkeiOl7PjI4WBmm6JAulCdyMKhJQLaBPSoiU?=
 =?iso-8859-1?Q?mQFjxISNp79APjMfIQIMHg5/pvMopGNaC4e3eWy1X2zUQZAAqrtyRx0d5S?=
 =?iso-8859-1?Q?tpplUSoKVIeQfX2+fIUGHyOuIPvKVh+LjLzpkilDWduv9Au/SrIcrVob7F?=
 =?iso-8859-1?Q?wM+eWcwLUPAFD0hKnGxOasjpoIS30IaTJwlKpFlo7ePFh+GYE9OvcXii9M?=
 =?iso-8859-1?Q?A/23+PBpRV3r+C10L6Zhhm1ofWkbB62ndqEnUQIROkWHUFZIY/KL4oGe0i?=
 =?iso-8859-1?Q?b4rdjN2sMBBp3CNH7Cpwn6/f4Rg/YiQuGq5GRK+qoRYDidoxL3x7nEJwmU?=
 =?iso-8859-1?Q?Ba1d200P3qU1NS59nenjUaSv+s/dAF8UZKT1REdiIqSnWq/G3IoHGqQego?=
 =?iso-8859-1?Q?NRmYHClDAW61fuvEURsLxAhde0y+tNM91Dhf4tcJ5Tzbo5+2kqjDcYsDgT?=
 =?iso-8859-1?Q?NCFyfDqzoEMsAygmLCLdeHNuabrL1vJ402xLYzdH1hjmd9jgL8/cHl/nxf?=
 =?iso-8859-1?Q?284sMC4iHmBoWpYxzz67fdND302jkQ7UXHOwBJg84aYeZaw3C/WPZbVbGJ?=
 =?iso-8859-1?Q?/Rn0dof04zxUYKw+c5HSg63vH/noAuVKdX4ujBf5N2vVFp9t/PCBDBeTh5?=
 =?iso-8859-1?Q?prryhPchytmHIfS6EXa58dfZDlW5HsE4WY67il/wKbjKjBYYUdjCbKRm5V?=
 =?iso-8859-1?Q?w1MZ+FHAmbP4hVAQOohM5J4bm6q4tZkHlnInwcmbSKvU9y7+BnOI/k7u3m?=
 =?iso-8859-1?Q?PRyvSeX8I+XxyWkv+LMSKILMNObJO9HcKSF7E/W9n13at8jLdetFAzcAb/?=
 =?iso-8859-1?Q?HZPsQsYR3NdJ2LjcAIv0M543t56jTmzCAHtOQwDoSJQHmaPkxQ4OWyid+X?=
 =?iso-8859-1?Q?XAKD7um39Rczk/E2Qf5aCJeSZ5IJUGNyC4hspkbRtAQ8TaTEqwixPetxNe?=
 =?iso-8859-1?Q?CzheWsBRJlSk2qF2WD7lXSWpWPOCwhfmiHYdAPR6URpjGtj+GEKQ8bbPL4?=
 =?iso-8859-1?Q?b09LmcO96EP0OEfrfIuim2ZUhM4B3dRV62sGPXgkzFF/tTQad1ikKKlRxF?=
 =?iso-8859-1?Q?akcS0lDhgS5pm7rHlvFdTHDcAdz2+bQ0LcM067nz7kjZNhqqobY1OdSvIc?=
 =?iso-8859-1?Q?9WVf9x7gPDXCDPMuw5Tx1tNoOAFvwacCzbSzXiLvH7Pjn8wvGzkjnBmqNH?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZQnHLTBJqNI555WcagBIJDNkn9BKUUN1uoVar21/UWCy6P9nHMn3GtGLmR?=
 =?iso-8859-1?Q?qrO6DyRfKCKhuJxLtJRCyzZ918hquryXVd+W9bZ9/XRAer5bLplTmrDMZb?=
 =?iso-8859-1?Q?LfkQRhOMbffWy5uazov4dJtuSDcDU0Y5zyWUUr1noV5De7bsB0waSLjIPe?=
 =?iso-8859-1?Q?zkzYsUswfe/bVmuki8xSQPSrdY9hrq59hDnvi22A6UfZ/lg4gZld1ofXXJ?=
 =?iso-8859-1?Q?dgPalOX4mCurFBKvnp/oe3hSADnoCq9WeKI337MaPLVlwj+xAp/J5r9BM4?=
 =?iso-8859-1?Q?dLxpdmilx9np3Xud4e+Y4xz/A6U1xGN3CPgfWPWgOSOjMOe00oBtbJT/72?=
 =?iso-8859-1?Q?H7a3X4/XHDrDeJsI3w6npw02myHlHKyfUgvq6KwxEIvwncsGfVdkd/ratL?=
 =?iso-8859-1?Q?/5tZ7BCSW2zL7yGL5JtL2JRUV1FJmoCsulTwYU6NpsW+OVLsmhx4Xp2vKw?=
 =?iso-8859-1?Q?bMbWlKBSqhM+nGM5FIsS2ehC5ufKR2UxJ6CTcbQFZOceP17i2/2a5Kqht/?=
 =?iso-8859-1?Q?NEnAnS/JC8nqyQ8mYwdK2dyfNJBNyJH8pEnuBmj43s9xQ8Wv7qte2xQe0l?=
 =?iso-8859-1?Q?GdFgKetoFXdcrDUuCfy4GL5t65XjLDyLLJJsKdtn4LYChR0b1Z4IT+qI76?=
 =?iso-8859-1?Q?n3n2ait24Y4lyWzzmnvD0mqOHjPgg26RmFMC+OlRB3N49DAtJNq4YnkFEU?=
 =?iso-8859-1?Q?hvtO/Tda1MJGEkXW3qBG30eN4UKyNdDjgEb4Jvz+FxX6uXbezc1ZDEioP6?=
 =?iso-8859-1?Q?a+a+Q3j38LKwdqr7H+RKrRWbtFogJPa4NF9SdRvWMIGwn9ftXOS5lQ3Kau?=
 =?iso-8859-1?Q?d1QQgU78bQHYrB74NLMPZHSGT9M1TqYSBxP/rM9RecFapCxKRTcHN3tyM6?=
 =?iso-8859-1?Q?sGjHbVZi0DINtMt3jHQSu3LJGzktPbnATDakg6DQippXMqxfcUC3Ss+DYq?=
 =?iso-8859-1?Q?sMj/jRFsliFy7ZL1geAZleig5N5gi+7bvSsQf4y9wxVPSvRgOLAB6GyMa8?=
 =?iso-8859-1?Q?omrOyzTvOOvjl0vdbbisxj6v+iEk5F+RPaXgddwbnTQK8kkDaBoidLTFPX?=
 =?iso-8859-1?Q?JgwPmONePe26WYYf31ZJW1ShXmvDK7IJbhdQGldlNqfrLRg8QFVAtR7NP5?=
 =?iso-8859-1?Q?YM1+eHaTbIKyZ+bCC6dbf1z0lHHwg7APF2sHQCMADIWhGkn6vu0p9VmkDQ?=
 =?iso-8859-1?Q?Ko++9el6Fwr4zYtjPDAmYX4Q1Sh1PsWavuxn0jrCzn/SIDvc9zvBFWleYZ?=
 =?iso-8859-1?Q?n+woo5/GhIM4/KVNi3Vo26N7snLUaqqm2jP2O2f3kq3X/ypSuSw9YPVd9d?=
 =?iso-8859-1?Q?KspihxAZ6ddx4MAetOziL2jBLEg3TWoBECicZ/WvZ+jgrPj5r2AoMbQiO+?=
 =?iso-8859-1?Q?784+E48S1Rid51ZNr9o4A6tddgm2rQ2xwwW1WipWWSOgfi6NyKy6ktGXXM?=
 =?iso-8859-1?Q?qkw7vAMs3m4Aexr3UdqWJmcc+sVIcl3VNCOfs/vU6qLIeIwAfKwIpHw47W?=
 =?iso-8859-1?Q?AIIAsJkg8FIahpIVz4hFB4n581IM3TjG+/CoixaCPtJS96sLZOZ4EdFpct?=
 =?iso-8859-1?Q?JP2xJzF+123TC0opA5mSoGHralEzdcoS0X2O8+EpYFzGobbs/L+O3UZiHn?=
 =?iso-8859-1?Q?NE6+JLcBLnbc+p5EdXEXtUopFsLj+Esuh9K+a/8vsS5Ja+SqmkJZioiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd0d078-f879-45e6-61e6-08dd88c719d3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:44:47.2399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n02u2HRpdk0XxC5aZlUmkJt2Ep6PBy+wb/1rE16e4fIc63Vq0PA3KOVsbHducJ5Gn+NMh52jQSCvQtCoJwRREw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
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

On Tue, Apr 29, 2025 at 09:39:56PM +0530, Badal Nilawar wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited
> access from user space (as admin) to some very specific PCODE
> Mailboxes only related to hardware configuration.
> 
> PCODE is a Firmware in Intel GPUs which is the main responsible
> component for power and thermal aspects of the Intel GPUs.
> 
> Each different Intel GPU came with different PCODE versions with
> different mailboxes and different needs. In the lack of an unified
> interface, the per platform sysfs entries at the device level is
> trending to grow, to allow admins to control different aspects of
> the Hardware.
> 
> In this first experiment, xe_pcode_fwctl only adds support for the
> Battlemage late-binding firmware information.
> 
> Late-binding is the name given to 2 other new auxiliary firmware
> blobs that for now lives in the Flash like PCODE, but that soon
> it is coming to linux-firmware.git: Fan-controller and
> Voltage-regulator. Then, PCODE provides some mailboxes where the
> status of both late-binding firmware can be queried as specified
> in the documentation that is added along with the new uAPI here.
> 
> RFC IMPORTANT NOTE:
> ===================
> Admins will need to query this information. This code here aims
> to be used by Level0-Sysman and/or Intel XPU Manager directly
> from user space. But following the drm upstream rules, the
> userspace code will need to be ready before we can consider
> getting this patch merged!
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  Documentation/userspace-api/fwctl/index.rst |   1 +
>  drivers/gpu/drm/xe/Kconfig                  |   1 +
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/xe_pci.c                 |   5 +
>  drivers/gpu/drm/xe/xe_pcode_fwctl.c         | 218 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode_fwctl.h         |  13 ++
>  include/uapi/fwctl/fwctl.h                  |   1 +
>  include/uapi/fwctl/xe_pcode.h               |  80 +++++++
>  8 files changed, 320 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
>  create mode 100644 include/uapi/fwctl/xe_pcode.h
> 
> diff --git a/Documentation/userspace-api/fwctl/index.rst b/Documentation/userspace-api/fwctl/index.rst
> index 316ac456ad3b..186f8cf17583 100644
> --- a/Documentation/userspace-api/fwctl/index.rst
> +++ b/Documentation/userspace-api/fwctl/index.rst
> @@ -12,3 +12,4 @@ to securely construct and execute RPCs inside device firmware.
>     fwctl
>     fwctl-cxl
>     pds_fwctl
> +   xe_pcode_fwctl

I just noticed that I forgot to actually include this file and add to
the MAINTAINERS list under xe.

But the important part which is the documentation itself is inside
the include/uapi/fwctl/xe_pcode.h

For the record, the missing file is:
$ cat Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)

==================
fwctl drm/xe pcode
==================

.. kernel-doc:: drivers/gpu/drm/xe/xe_pcode_fwctl.c
   :doc: XE PCODE FWCTL

uAPI
====

.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
   :internal:

.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
   :doc: Late Binding Commands


Also cc'ing FWCTL and DRM maintainers and LKML to ensure we get the proper
feedback on this first attempt of using the fwctl with xe.

Thanks,
Rodrigo.

> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index a8cc1876a24f..ee77039b9256 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -45,6 +45,7 @@ config DRM_XE
>  	select AUXILIARY_BUS
>  	select HMM_MIRROR
>  	select INTEL_MEI_LATE_BIND
> +	select FWCTL
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6de291a21965..c1f3b2e2da5f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -86,6 +86,7 @@ xe-y += xe_bb.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> +	xe_pcode_fwctl.o \
>  	xe_pm.o \
>  	xe_preempt_fence.o \
>  	xe_pt.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 882398e09b7e..222e75c7427e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -27,6 +27,7 @@
>  #include "xe_module.h"
>  #include "xe_pci_sriov.h"
>  #include "xe_pci_types.h"
> +#include "xe_pcode_fwctl.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> @@ -868,6 +869,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		goto err_driver_cleanup;
>  
> +	err = xe_pcode_fwctl_init(xe);
> +	if (err)
> +		goto err_driver_cleanup;
> +
>  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>  		str_yes_no(xe->d3cold.capable));
>  
> diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> new file mode 100644
> index 000000000000..d6443aa4a60a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_pcode_fwctl.h"
> +
> +#include <linux/fwctl.h>
> +#include <uapi/fwctl/xe_pcode.h>
> +
> +#include "xe_device.h"
> +#include "xe_pcode_api.h"
> +#include "xe_pcode.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: XE PCODE FWCTL
> + *
> + * Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited access
> + * from user space (as admin) to some very specific PCODE Mailboxes.
> + *
> + * User space first needs to issue the ```FWCTL_INFO``` ioctl and check for the
> + * capability flag, which will indicate which group of Mailboxes commands are
> + * supported on that current running firmware.
> + *
> + * After verifying the availability of the desired Mailbox command,
> + * ```FWCTL_RPC``` needs to be issued with in and out parameter both using
> + * pointers to a ```struct fwctl_rpc_xe_pcode``` allocated by userspace.
> + * In and out length needs to be sizeof(struct fwctl_rpc_xe_pcode).
> + *
> + * Any command that is not listed in the include/uapi/fwctl/xe_pcode.h or not
> + * supported by the running firmware, will return ERR_PTR(-EBADMSG).
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *
> + *  struct fwctl_info_xe_pcode xe_pcode_info;
> + *
> + *  struct fwctl_info info = {
> + *           .size = sizeof(struct fwctl_info),
> + *           .flags = 0,
> + *           .out_device_type = 0,
> + *           .device_data_len = sizeof(struct fwctl_info_xe_pcode),
> + *           .out_device_data = (__aligned_u64) &xe_pcode_info,
> + *   };
> + *
> + *   fd = open("/dev/fwctl/fwctl0", O_RDWR);
> + *   if (fd < 0) {
> + *       perror("Failed to open /dev/fwctl/fwctl0");
> + *       return -1;
> + *   }
> + *
> + *   if (ioctl(fd, FWCTL_INFO, &info)) {
> + *           perror("ioctl(FWCTL_INFO) failed");
> + *           close(fd);
> + *           return -1;
> + *   }
> + *
> + *   if (xe_pcode_info.uctx_caps & FWCTL_XE_PCODE_LATEBINDING) {
> + *           struct fwctl_rpc_xe_pcode rpc_in = {
> + *                   .command = PCODE_CMD_LATE_BINDING,
> + *                   .param1 = PARAM1_GET_CAPABILITY_STATUS,
> + *           };
> + *
> + *           struct fwctl_rpc_xe_pcode rpc_out = {0};
> + *
> + *           struct fwctl_rpc rpc = {
> + *                   .size = sizeof(struct fwctl_rpc),
> + *                   .scope = FWCTL_RPC_CONFIGURATION,
> + *                   .in_len = sizeof(struct fwctl_rpc_xe_pcode),
> + *                   .out_len = sizeof(struct fwctl_rpc_xe_pcode),
> + *                   .in = (__aligned_u64) &rpc_in,
> + *                   .out = (__aligned_u64) &rpc_out,
> + *           };
> + *
> + *           if (ioctl(fd, FWCTL_RPC, &rpc)) {
> + *                   perror("ioctl(FWCTL_RPC) failed");
> + *                   close(fd);
> + *                   return -1;
> + *           }
> + *
> + */
> +
> +struct xe_pcode_fwctl_dev {
> +	struct fwctl_device fwctl;
> +	struct xe_device *xe;
> +};
> +
> +DEFINE_FREE(xe_pcode_fwctl, struct xe_pcode_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
> +
> +static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_device *xe = fwctl_dev->xe;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	return 0;
> +}
> +
> +static void xe_pcode_fwctl_uctx_close(struct fwctl_uctx *uctx)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_device *xe = fwctl_dev->xe;
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static void *xe_pcode_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_device *xe = fwctl_dev->xe;
> +	struct fwctl_info_xe_pcode *info;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (xe->info.platform == XE_BATTLEMAGE)
> +		info->uctx_caps = FWCTL_XE_PCODE_LATEBINDING;
> +
> +	*length = sizeof(*info);
> +
> +	return info;
> +}
> +
> +static bool xe_pcode_fwctl_rpc_validate(struct fwctl_rpc_xe_pcode *rpc,
> +					enum fwctl_rpc_scope scope)
> +{
> +	u32 mbox = PCODE_MBOX(rpc->command, rpc->param1, rpc->param2);
> +
> +	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
> +			       PARAM1_GET_CAPABILITY_STATUS, 0))
> +		return scope == FWCTL_RPC_CONFIGURATION;
> +
> +	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
> +			       PARAM1_GET_VERSION_LOW, 0))
> +		return (rpc->data0 == DATA0_TYPE_FAN_CONTROLLER ||
> +			rpc->data0 == DATA0_TYPE_VOLTAGE_REGULATOR) &&
> +			scope == FWCTL_RPC_CONFIGURATION;
> +
> +	return false;
> +}
> +
> +static void *xe_pcode_fwctl_rpc(struct fwctl_uctx *uctx,
> +				enum fwctl_rpc_scope scope,
> +				void *in, size_t in_len, size_t *out_len)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev =
> +		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
> +	struct xe_tile *root_tile = xe_device_get_root_tile(fwctl_dev->xe);
> +	struct fwctl_rpc_xe_pcode *rpc = in;
> +	int err;
> +
> +	if (in_len != sizeof(struct fwctl_rpc_xe_pcode) ||
> +	    *out_len != sizeof(struct fwctl_rpc_xe_pcode))
> +		return ERR_PTR(-EMSGSIZE);
> +
> +	if (!xe_pcode_fwctl_rpc_validate(rpc, scope))
> +		return ERR_PTR(-EBADMSG);
> +
> +	err = xe_pcode_read(root_tile, PCODE_MBOX(rpc->command,
> +						  rpc->param1,
> +						  rpc->param2),
> +			    &rpc->data0,
> +			    &rpc->data1);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return rpc;
> +}
> +
> +static const struct fwctl_ops xe_pcode_fwctl_ops = {
> +	.device_type = FWCTL_DEVICE_TYPE_XE_PCODE,
> +	.uctx_size = sizeof(struct fwctl_uctx),
> +	.open_uctx = xe_pcode_fwctl_uctx_open,
> +	.close_uctx = xe_pcode_fwctl_uctx_close,
> +	.info = xe_pcode_fwctl_info,
> +	.fw_rpc = xe_pcode_fwctl_rpc,
> +};
> +
> +static void xe_pcode_fwctl_fini(void *dev)
> +{
> +	struct fwctl_device *fwctl = dev;
> +
> +	fwctl_unregister(fwctl);
> +	fwctl_put(fwctl);
> +}
> +
> +int xe_pcode_fwctl_init(struct xe_device *xe)
> +{
> +	struct xe_pcode_fwctl_dev *fwctl_dev __free(xe_pcode_fwctl) =
> +		fwctl_alloc_device(xe->drm.dev, &xe_pcode_fwctl_ops,
> +				   struct xe_pcode_fwctl_dev, fwctl);
> +	int err;
> +
> +	/* For now xe_pcode_fwctl supports only Late-Binding commands on BMG */
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		return -ENODEV;
> +
> +	if (!fwctl_dev)
> +		return -ENOMEM;
> +
> +	fwctl_dev->xe = xe;
> +
> +	err = fwctl_register(&fwctl_dev->fwctl);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_pcode_fwctl_fini,
> +					&fwctl_dev->fwctl);
> +}
> +
> +MODULE_IMPORT_NS("FWCTL");
> diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.h b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
> new file mode 100644
> index 000000000000..67386d7bf2ea
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PCODE_FWCTL_H_
> +#define _XE_PCODE_FWCTL_H_
> +
> +struct xe_device;
> +
> +int xe_pcode_fwctl_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
> index 716ac0eee42d..9e7e84aef791 100644
> --- a/include/uapi/fwctl/fwctl.h
> +++ b/include/uapi/fwctl/fwctl.h
> @@ -45,6 +45,7 @@ enum fwctl_device_type {
>  	FWCTL_DEVICE_TYPE_MLX5 = 1,
>  	FWCTL_DEVICE_TYPE_CXL = 2,
>  	FWCTL_DEVICE_TYPE_PDS = 4,
> +	FWCTL_DEVICE_TYPE_XE_PCODE = 5,
>  };
>  
>  /**
> diff --git a/include/uapi/fwctl/xe_pcode.h b/include/uapi/fwctl/xe_pcode.h
> new file mode 100644
> index 000000000000..8df6db34e5ce
> --- /dev/null
> +++ b/include/uapi/fwctl/xe_pcode.h
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _UAPI_FWCTL_XE_PCODE_H_
> +#define _UAPI_FWCTL_XE_PCODE_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct fwctl_info_xe_pcode - FWCTL Information struct for Xe PCODE
> + *
> + * @uctx_caps:  bitmap of available capabilities:
> + *  - %FWCTL_XE_PCODE_LATEBINDING - Command to configure Late Bind FW such as
> + * Fan Controller and Voltage Regulator
> + * @rsvd: Reserved for future usage or flags
> + */
> +struct fwctl_info_xe_pcode {
> +	__u32 uctx_caps;
> +	__u32 rsvd[3];
> +};
> +
> +#define FWCTL_XE_PCODE_LATEBINDING	(1 << 0)
> +
> +/**
> + * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
> + */
> +struct fwctl_rpc_xe_pcode {
> +	/** @command: The main Mailbox command */
> +	__u8 command;
> +	/** @param1: A subcommand or a parameter of the main command */
> +	__u16 param1;
> +	/** @param2: A parameter of a subcommand or a subsubcommand */
> +	__u16 param2;
> +	/** @data0: The first 32 bits of data. In general data-in as param */
> +	__u32 data0;
> +	/** @data1: The other 32 bits of data. In general data-out */
> +	__u32 data1;
> +	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
> +	__u8 pad[3];
> +};
> +
> +/**
> + * DOC: Late Binding Commands
> + *
> + * FWCTL info.uctx_caps: FWCTL_XE_PCODE_LATEBINDING
> + * FWCTL rpc.scope: FWCTL_RPC_CONFIGURATION
> + *
> + * Command	0x5C - LATE_BINDING
> + * Param1	0x0 - GET_CAPABILITY_STATUS
> + * Param2	0
> + * Data in	None
> + * Data out:
> + *
> + *  - Bit0: ate binding for V1 Fan Tables is supported.
> + *  - Bit3: Late binding for VR parameters.
> + *  - Bit16: Late binding done for V1 Fan tables
> + *  - Bit17: Late binding done for power co-efficients.
> + *  - Bit18: Late binding done for V2 Fan tables
> + *  - Bit19: Late binding done for VR Parameters
> + *
> + * Command	0x5C - LATE_BINDING
> + * Param1	0x1 - GET_VERSION_LOW
> + * Param2	0
> + * Data in - conveys the Type of the Late Binding Configuration:
> + *
> + *  - FAN_CONTROLLER = 1
> + *  - VOLTAGE_REGULATOR = 2
> + *
> + * Data out - Lower 32 bits of Version Number for Late Binding configuration
> + *            that has been applied successfully.
> + */
> +#define PCODE_CMD_LATE_BINDING		0x5C
> +#define  PARAM1_GET_CAPABILITY_STATUS	0x0
> +#define  PARAM1_GET_VERSION_LOW		0x1
> +#define   DATA0_TYPE_FAN_CONTROLLER	1
> +#define   DATA0_TYPE_VOLTAGE_REGULATOR	2
> +
> +#endif /* _UAPI_FWCTL_XE_PCODE_H_ */
> -- 
> 2.34.1
> 
