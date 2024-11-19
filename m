Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8779D2AC7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151F910E680;
	Tue, 19 Nov 2024 16:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hzking17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D04D10E673;
 Tue, 19 Nov 2024 16:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732033420; x=1763569420;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6aHd73upiM0bXvFWRrT6udURgnq61pL3Q1hSXLhDZcs=;
 b=Hzking17wp9UQ+qhXu5+OY1uysh54zAtIFkDj75NBX242vgWWGr3udeP
 PtuiR5H7pOlRh6jQqvKowCbA3cdyzCPSDVwL/OVmpU0g4q3NNo0VyXD5B
 FumzMO7RfsPQzGNbRBf1oQe2zOvteSG0xy+2HlKxdju9gTSuMp9LSCqMb
 Kf//NygxWVwgXP9hEzyQMUwbL1BjhBxAPuWUcKp6vYyZDQu7OuuyQuZy7
 7VrzoqZLZ4i2VbM8pCA5apMWfcFHX0AJtPHGk/rXz8oAaIlr9j/ehTmib
 ErToUNM25Ri3THHqS9NrkItSm1prQlkHYpeaXl70MfF1TxN8o/uj2uST2 A==;
X-CSE-ConnectionGUID: 24sj1egdT5C7xDFGqSOFEA==
X-CSE-MsgGUID: HLxmhOhMSy6pCXVn5ttx1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31971475"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31971475"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:23:39 -0800
X-CSE-ConnectionGUID: LdMqMJiZTMKvL75Qbg2Ewg==
X-CSE-MsgGUID: 6aIwrkAbTp+F/woP96WG0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90016650"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 08:23:39 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 08:23:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 08:23:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 08:23:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adqU7sLl09QqwDrJSlX/vay1/j5cXK2YAit+8s+NyUzEhoaMiK0ZVkg7nnhRwLt2havODCiCtk0qrquos0n37kL9FGl8H8vfYB1vEasFuRqsg5HrbjHGEjdrj/I18QiwJv9ZzX6afSF5uW3k9K98DTaYXy9m+vF0g+EzrasZnkgsSBMGKhlck/WUdpOT7XBILB52G83uOztFCiVsFUxdfkJCu+FKOxjrgDnmXptYskqBo7C2uPXJ6xG6GAacSfYeG/4yP55PUiWnDe6m/i0N7Ov8C32XEydZc9B2jKYEvu2BsfVTPUH2y9bwSNGZr4dy3wN457wdRepjAM/Fbkyqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROxHJDxcaJFYgN7jabv/hiZYg3ZunWO/1/1jEWdcePk=;
 b=JDYRlZBFhUCk6Xyyl9NVeC81f5rOGbz8anJx+CiAskZQbWDs/+9DOwKJpVhOt7RMX3lk9PPVj8GM4GRlYy44u91cebutpQn5M0mWfcS5xJyZjHD7Hh5NyzzxVT0aofk1iTF/Ly4RVWcxBlrF3jgc9iNCfvDUlvL+ldPMhB2Cw3NYNv2BaDi8LIM9C0iictAWZYR2BFtdmLdeP5hIcZpqZY3oxCam7UDwrZMkWlHPkrKHQcdi9LVGvcEf+GKFJsWBOxVsfzzKp4PF++cQSZ/NlDYfuOKv4HzGKMQsOaG9DFEI74SV7TgTgbU3NdesI7kanciDj2M+GmiQVq9/cfjPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Tue, 19 Nov
 2024 16:23:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 16:23:35 +0000
Date: Tue, 19 Nov 2024 08:24:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 08/29] drm/xe: Add dma_addr res cursor
Message-ID: <Zzy7qeYFP9hDwQXB@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-9-matthew.brost@intel.com>
 <7424e69f76d992a5ac69aff941a2afc8fc6b910c.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7424e69f76d992a5ac69aff941a2afc8fc6b910c.camel@linux.intel.com>
X-ClientProxiedBy: MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 060c70cd-673c-4f71-23de-08dd08b68413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?V7VjyGFzs7+Ql7DiUGIo1mCgdVX9YdXmX9VeAtQRTzBri0Ts7vIl4B7Oz2?=
 =?iso-8859-1?Q?EeIGyaksjnZhbO2dPqzvCOPA3AM12UxCB7l/WX/iEKNicvLfV2O73DQ6S2?=
 =?iso-8859-1?Q?eX6Pgc0LMg6Xqh9pj0a+XnUji3/MZ9ts5hKeMcJgFdZpX5urQx9WDtfOf0?=
 =?iso-8859-1?Q?Cv92Cqs/M0jXFyc2PlE5TgL5G0w9dzKQiM5MtvkvD03WiKzHtoCTi/QOYf?=
 =?iso-8859-1?Q?WrAL8eqGATQbMl6yCllMiYUCWlUlDtScDBhz9z6z22MWTQ7h8BVYI3CDhM?=
 =?iso-8859-1?Q?xQ9vVqYriCUbL6xJreTdiKacDrpB+GUQ0ICi4L0w7X/o9BSFxItuPX4axQ?=
 =?iso-8859-1?Q?XgxTRYI2lZn8e2MQ2kFLxlau9WTK+GHchNGS6t5CnCVfc2k8lwQxof6xkY?=
 =?iso-8859-1?Q?4PIxw5brsEGUfVw/pIWWlLl5S8RM2C54TXDdvSFbuyek4Ai0zgOJJPkdhm?=
 =?iso-8859-1?Q?yo3YoFt79o9WqnxrOoSKCgWFlELC/lsFlPKNm/ipIrjTPxasQrDQI/Q1kJ?=
 =?iso-8859-1?Q?8dIm7g7kQpInmYdiV4UWmTP2M1GsND9mOT1sYjd/TPN4CL1vVSJrlw6d1n?=
 =?iso-8859-1?Q?EVHX3u/7X9YgTlTeAEKtkAniTqcP2NyXFzxL/XNyLhWEyiYOpZQX5NA3Ga?=
 =?iso-8859-1?Q?w/fMYBOiupVwmtlHrfgIj5KdaY1ufhUKlANCZRvHLMP2Nw7RodnvWqTbmC?=
 =?iso-8859-1?Q?xqDYCkH643YqbTscuEOnPDSmK7VO0OneH7PsmWgI/GVxf3JHkdh7PMz+yl?=
 =?iso-8859-1?Q?hxV8OVHW45VM0iPWICBFCaU7NnXbdP++z18mJUdIdIWwR457aeOdzZKDMw?=
 =?iso-8859-1?Q?BwPNhmnwHtRGrG6DL+a94RT8eeJcUcG8CdIWF0FaUuoMy8qnjtZlc03cdf?=
 =?iso-8859-1?Q?8ToeYbQnKTVbcUmXE0AwBw9zwNJELtdl/DPsNNeRJOuOBZiHzMvQxyRsl2?=
 =?iso-8859-1?Q?GAx8PixJMiKPUhhL3YyLdeuUQXPuY27qBgQ6MBOKdCigMBtzdvKZAlp3J0?=
 =?iso-8859-1?Q?a2wDs1Qaqs9J7csxH88wZ3q8AVXfJcvyktroI6oGrK8Z/9xr6B0dxp+Mxk?=
 =?iso-8859-1?Q?KUPbUQ8AmfAFgWRWaw7v7Mi1XAU9IPRMUqdejSRUm6OFRWz+xS2Xmorf88?=
 =?iso-8859-1?Q?Xyz8QyTIR5jXSaHrCpFbyednUO6RAYsyDyqaToPzTIQ8TzcVV29xSpUzHr?=
 =?iso-8859-1?Q?ezXRzfTRdngOTdZnkO8d/ja4GDyTBi9Kvj6Q4o6k0VThca7GQtvRHvjLWX?=
 =?iso-8859-1?Q?LDniVwxXqtjKrZY4zdb0FtEKNQ2uonHXS/rNtkD4a97B7CxQErp1LBwc1Y?=
 =?iso-8859-1?Q?vUUfuM084vA20U/PizR9UKLRxtDlQsQgU8YXgslSI5ySIll7U43FksF0sF?=
 =?iso-8859-1?Q?k/3IWzJE8R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j9+zk/QQtjhGJZo+XoysGJLxrfdJztjDUwQ+HvxXe2hrHR7qmSxuSQHMc9?=
 =?iso-8859-1?Q?ylO4y13HdsTG8iz/ceYfrXO9lYlk37O14X5ECy6+jzmNdMTB7uifr1eSAQ?=
 =?iso-8859-1?Q?tvS6k+fziRhfaUF9KwIrAlBuhsW7HiaK55q4ZNdl+b4IykjbRD9RFIdN7p?=
 =?iso-8859-1?Q?aZ5kqkx6hdfV52VPWImIL9JcrFDqFMsoX8+KMgtMKPYpIRe6RsRR7U/N/6?=
 =?iso-8859-1?Q?jzfY3AaHNFLp2Y6v35VtQIJIeAG6zfPu7vehOsySl5EN572JmPiM7s4gBH?=
 =?iso-8859-1?Q?DszFyguM9JAQeIMy7Y2sDhPAHQbBVJ7f4E86T55d534yAuH00EbAsiUc8P?=
 =?iso-8859-1?Q?1ykRSQMLdUVmzqRpvRT5Gs+qy9Wtt5y8HIWrefr8e/3qjHZWAo5M9/F110?=
 =?iso-8859-1?Q?kLtRpz5X8cA7L741jgYB+HIKSlWHA5CYAa+fpVbnHaaDsQpYd5xe9pptaW?=
 =?iso-8859-1?Q?90c2hxQr2QM5r0RJnU+0arEmOFyflGDnky/Kr6BHD1mC0fSq7bmqtOPpL2?=
 =?iso-8859-1?Q?oo2BMHPOkxgmngDPsEJrxLDM8XK/7FzI3bl4KxBpmsdxkyldFJEI2fFKTY?=
 =?iso-8859-1?Q?/wLCfpL4t8oBvSwfIe8ouW5kR5A1eXIuariEZOjwRGgg7bb7bXtu3bcPzM?=
 =?iso-8859-1?Q?Ig6IIR5FHN26b8WKeR8sUCtAPkFCUdQdwkzJT9kjwXHFVCMMqzCrPg3qrN?=
 =?iso-8859-1?Q?G9PxV2MQ+GlhyOzpW85OCdh//VA3IS133JAARxH/dXPIRF8yWoQMnzUN6G?=
 =?iso-8859-1?Q?cMwHEMMvWNXYsmZZRDl/9DE4uG3xN9olTQtKYqeY8WTTKQYkww5WRgGkxZ?=
 =?iso-8859-1?Q?YixNJJU5rovg5VXjsy7RKb5knMrHIDRKU9FnsJHRMEYcG9l2CEFDDyCboK?=
 =?iso-8859-1?Q?wsukwbkQRQ2O7axcQwXRIH715CeU9eL24FAANlmaVvFY7lk0WEPK2NXkki?=
 =?iso-8859-1?Q?hbPzqJe5A+Q0tvZ0q80ba64lmiNpTBmfpI9ux2llOSxLxkie2oHN72yHLk?=
 =?iso-8859-1?Q?+VVUC6t150kbBu4hWwqyn519gkRV8RC/6LdxmnlSX3G5wwy4VYiGhjBU2G?=
 =?iso-8859-1?Q?7X9/xxEgWSdWmLDNmq4KzengEE37mrGdWzsvJhnZfiKrC+drQGBvjSffvU?=
 =?iso-8859-1?Q?DL2hsYFKtSc1zdNGgl9Gu2zgVB4GrsQhxQ2BTegQPgAAH8SNIpy3GrthPq?=
 =?iso-8859-1?Q?ckIReOZLU3PebDQ4dUVCFW87oLUn54ftWwnA9J2YnTyGltU+CAqovD+9t2?=
 =?iso-8859-1?Q?sgGxxGX9NvexYf+n+GJJ7WlVA1QnBJOcjrEJBil6UPJ9hZqgGQDaDKTGj8?=
 =?iso-8859-1?Q?ZhbyK44wj55dqUX+qiSmVz3YM3BWd9ccUm4VGEsbdnSPZ6QKr4AsTiMDDN?=
 =?iso-8859-1?Q?TzA5jkHBC+VjdBMlz02eflJucNjJeQNkcWRA70p5dEVnzCFi/Zx1BgfgAY?=
 =?iso-8859-1?Q?OGhBUmIbC9+gM4JlIxaEUMjnxgny9q4G0eZvPW2dwf5sFk0b8Pq1bEycLn?=
 =?iso-8859-1?Q?mQ35wnimiY+nKwH8lYsY3NnujtUnz9oO8Z1zIdu113rSyce64ZjRcfV9vd?=
 =?iso-8859-1?Q?f+YniCeuVFdyHmHaVTxkPr7AdVWG5uWHH8ubOT5XrEC+QdLu9uGMTX/eq8?=
 =?iso-8859-1?Q?I1tRCuK9sblGm3AQzlGCd9gyo1hrDMLu8AbKHgR33Y9fVN52aHSNxVlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 060c70cd-673c-4f71-23de-08dd08b68413
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 16:23:35.0927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UFmi473qOYKv4mQRFW9SsiadiLk9sN4mReO17QJ51qUfp/0lopyh2eSU5J8qWfllIHeTzTIGowJikf5ScCHTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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

On Tue, Nov 19, 2024 at 01:15:12PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Useful for SVM ranges in SRAM and programing page tables.
> 
> We should look at providing a better commit message.
> 

Yes, this is pretty poor. Will scrub all commit messages in next and
ensure higher quality.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_res_cursor.h | 116
> > ++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_svm.h        |   4 +
> >  2 files changed, 118 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index dca374b6521c..3faa3d9adb82 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -30,13 +30,18 @@
> >  #include <drm/ttm/ttm_range_manager.h>
> >  #include <drm/ttm/ttm_resource.h>
> >  #include <drm/ttm/ttm_tt.h>
> > +#include "drm_pagemap.h"
> >  
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_macros.h"
> > +#include "xe_svm.h"
> >  #include "xe_ttm_vram_mgr.h"
> >  
> > -/* state back for walking over vram_mgr, stolen_mgr, and gtt_mgr
> > allocations */
> > +/**
> > + * struct xe_res_cursor - state for walking over vram_mgr,
> > stolen_mgr,
> > + * and gtt_mgr allocations
> > + */
> >  struct xe_res_cursor {
> >  	u64 start;
> >  	u64 size;
> > @@ -44,7 +49,17 @@ struct xe_res_cursor {
> >  	void *node;
> >  	u32 mem_type;
> >  	struct scatterlist *sgl;
> > +	/** @dma_addr: Current element in a struct
> > drm_pagemap_dma_addr array */
> > +	const struct drm_pagemap_dma_addr *dma_addr;
> >  	struct drm_buddy *mm;
> > +	/**
> > +	 * @dma_start: DMA start address for the current segment.
> > +	 * This may be different to @dma_addr.addr since elements in
> > +	 * the array may be coalesced to a single segment.
> > +	 */
> > +	u64 dma_start;
> > +	/** @dma_seg_size: Size of the current segment. */
> > +	u64 dma_seg_size;
> >  };
> >  
> >  static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
> > @@ -70,6 +85,7 @@ static inline void xe_res_first(struct ttm_resource
> > *res,
> >  				struct xe_res_cursor *cur)
> >  {
> >  	cur->sgl = NULL;
> > +	cur->dma_addr = NULL;
> >  	if (!res)
> >  		goto fallback;
> >  
> > @@ -141,6 +157,36 @@ static inline void __xe_res_sg_next(struct
> > xe_res_cursor *cur)
> >  	cur->sgl = sgl;
> >  }
> >  
> > +/**
> > + * __xe_res_dma_next() - Advance the cursor when end-of-segment is
> > reached
> > + * @cur: The cursor
> > + */
> > +static inline void __xe_res_dma_next(struct xe_res_cursor *cur)
> > +{
> > +	const struct drm_pagemap_dma_addr *addr = cur->dma_addr;
> > +	u64 start = cur->start;
> > +
> > +	while (start >= cur->dma_seg_size) {
> > +		start -= cur->dma_seg_size;
> > +		addr++;
> > +		cur->dma_seg_size = PAGE_SIZE << addr->order;
> > +	}
> > +	cur->dma_start = addr->addr;
> > +
> > +	/* Coalesce array_elements */
> > +	while (cur->dma_seg_size - start < cur->remaining) {
> > +		if (cur->dma_start + cur->dma_seg_size !=
> > addr[1].addr ||
> > +		    addr->proto != addr[1].proto)
> > +			break;
> > +		addr++;
> > +		cur->dma_seg_size += PAGE_SIZE << addr->order;
> > +	}
> > +
> > +	cur->dma_addr = addr;
> > +	cur->start = start;
> > +	cur->size = cur->dma_seg_size - start;
> > +}
> > +
> >  /**
> >   * xe_res_first_sg - initialize a xe_res_cursor with a scatter
> > gather table
> >   *
> > @@ -160,11 +206,42 @@ static inline void xe_res_first_sg(const struct
> > sg_table *sg,
> >  	cur->start = start;
> >  	cur->remaining = size;
> >  	cur->size = 0;
> > +	cur->dma_addr = NULL;
> >  	cur->sgl = sg->sgl;
> >  	cur->mem_type = XE_PL_TT;
> >  	__xe_res_sg_next(cur);
> >  }
> >  
> > +/**
> > + * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
> > + *
> > + * @dma_addr: struct drm_pagemap_dma_addr array to walk
> > + * @start: Start of the range
> > + * @size: Size of the range
> > + * @cur: cursor object to initialize
> > + *
> > + * Start walking over the range of allocations between @start and
> > @size.
> > + */
> > +static inline void xe_res_first_dma(const struct
> > drm_pagemap_dma_addr *dma_addr,
> > +				    u64 start, u64 size,
> > +				    struct xe_res_cursor *cur)
> > +{
> > +	XE_WARN_ON(!dma_addr);
> > +	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
> > +		   !IS_ALIGNED(size, PAGE_SIZE));
> > +
> > +	cur->node = NULL;
> > +	cur->start = start;
> > +	cur->remaining = size;
> > +	cur->dma_seg_size = PAGE_SIZE << dma_addr->order;
> > +	cur->dma_start = 0;
> > +	cur->size = 0;
> > +	cur->dma_addr = dma_addr;
> > +	__xe_res_dma_next(cur);
> > +	cur->sgl = NULL;
> > +	cur->mem_type = XE_PL_TT;
> > +}
> > +
> >  /**
> >   * xe_res_next - advance the cursor
> >   *
> > @@ -191,6 +268,12 @@ static inline void xe_res_next(struct
> > xe_res_cursor *cur, u64 size)
> >  		return;
> >  	}
> >  
> > +	if (cur->dma_addr) {
> > +		cur->start += size;
> > +		__xe_res_dma_next(cur);
> > +		return;
> > +	}
> > +
> >  	if (cur->sgl) {
> >  		cur->start += size;
> >  		__xe_res_sg_next(cur);
> > @@ -232,6 +315,35 @@ static inline void xe_res_next(struct
> > xe_res_cursor *cur, u64 size)
> >   */
> >  static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
> >  {
> > -	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start :
> > cur->start;
> > +	if (cur->dma_addr)
> > +		return cur->dma_start + cur->start;
> > +	else if (cur->sgl)
> > +		return sg_dma_address(cur->sgl) + cur->start;
> > +	else
> > +		return cur->start;
> > +}
> > +
> > +/**
> > + * xe_res_is_vram() - Whether the cursor current dma address points
> > to
> > + * same-device VRAM
> > + * @cur: The cursor.
> > + *
> > + * Return: true iff the address returned by xe_res_dma() points to
> > internal vram.
> > + */
> > +static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
> > +{
> > +	if (cur->dma_addr)
> > +		return cur->dma_addr->proto == XE_INTERCONNECT_VRAM;
> > +
> > +	switch (cur->mem_type) {
> > +	case XE_PL_STOLEN:
> > +	case XE_PL_VRAM0:
> > +	case XE_PL_VRAM1:
> > +		return true;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return false;
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 979f2322eeba..376e86876a11 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -6,6 +6,10 @@
> >  #ifndef _XE_SVM_H_
> >  #define _XE_SVM_H_
> >  
> > +#include "drm_pagemap.h"
> > +
> > +#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> > +
> >  struct xe_vm;
> >  
> >  int xe_svm_init(struct xe_vm *vm);
> 
