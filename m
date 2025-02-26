Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A039A45485
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 05:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA2D10E201;
	Wed, 26 Feb 2025 04:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4rCWYmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762FF10E1B8;
 Wed, 26 Feb 2025 04:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740543476; x=1772079476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8/IhRKwL5N5w8DLc3UYAmiEJTp7ALrcYkaxLRcbzcv0=;
 b=R4rCWYmKbQOYvV4Vw91/IEbyODs3M/opWmshtbSwqeBkx90+GrznUb8m
 7dKemIS8clWBc0Fb1zv9YzG25fNC5oytA4H/pKNB+w2qVLBj8kLzcQi5A
 S/PfYqzNnaHVWIvPaPE5waJ1nsSQQPJTqVkryG3dp5KLpQmOA8quCkBNd
 YoXanRx2bWEguLSITIAAvfqZD1ixs6g9pxJldE/Q2VUcgGcC6gx5sfcqh
 TL/OdLySsr1sWjB7/0r57QtcJ5sin8Z0fqe1KX0asPEe+XiSP41u57IZP
 6JRk2/aDQau1jL3OS0oppcYEu/4aZrVHI8IXH+IVoSwt4qkV1521q5N6v Q==;
X-CSE-ConnectionGUID: 4oGqyLIUScqR10QjSbzwvQ==
X-CSE-MsgGUID: JHJckHXyRTOrBQZ/e0Xuww==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52772415"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="52772415"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:17:56 -0800
X-CSE-ConnectionGUID: Dftf0Ov0T4qjzYPOwbg80A==
X-CSE-MsgGUID: PgL6zTTiRky1j/K+3K6y2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153763064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:17:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 20:17:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 20:17:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 20:17:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2P8JlhPjMLJmhytKs1AE6lPe41G0xO1kom9ONxRNZi/9kLaJsoV4IZeqKC5faANZcpsH3SDjsN7bpL50u1gfYx03UnUjBAkmpWlg8fn6togItytM681CXWjlln3rSS5ds97NqqmCirFTeH/REfZIr2cx3EUaZTqINWo6vXQCTOpgsh6jds1s7oVTElp8y6LP+zdfi2mtq1gThYfPmlKII5G7FJJawVgYzo4GODnZPkXJfYC1TQianzhNM98uaT8dcYRUyA+J4dWo5nioUBOsSYG7yj9CVVKcXP5DnP5qQJDGGYXhO5txyepcjvJHXmg0ot217+9zal+yLROGSH8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6HZHH3aVaxut5qhn+mIpAGwY8Zg08+6O0fkQJCLkL4=;
 b=wxtyGZ9P4+3OjauKEW7NMxK8fppjm/MBHeIXsZszCa89IGPi+zDrPnSHe2sKTJrbEwkc9RRxem/j+8AKTFohyAS2+h6Klko/4POErtN7pNRcecev9wZpN2MiQPKDDC5UDMil8q9KYnKSCdLA2JPsrXduw9dAsrYvhMPaO0N7nq3N/AjKGqKP4biXl+bIQ23yXOG5+KUvyzVQ1vW73NKtl2PsAzNp2bRPnX9bknIfHCynEq+b2XFqq18ya984xXVrgFxmsZx3UiGLs5vW3DfBQ5Bbytvo6g573XYZ8Mx5kyowfewVFyzoXk5Ab7j9L0PMVJwUtwIjckOD8SuwLtUtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB5974.namprd11.prod.outlook.com (2603:10b6:408:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 04:17:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 04:17:39 +0000
Date: Tue, 25 Feb 2025 20:18:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <jeffbai@aosc.io>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "=?iso-8859-1?Q?Jos=E9?= Roberto de Souza" <jose.souza@intel.com>, Francois
 Dugast <francois.dugast@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Mateusz Naklicki
 <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
Message-ID: <Z76WIgGvvhlbYl/j@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
 <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
X-ClientProxiedBy: MW4PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:303:8c::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf8504c-c4f5-48c3-e3e6-08dd561c81a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xjOcdPvfT9g9d6OdA5Hv59wx/u4obNcuGFFg/qKgPYrd29cCTjv0/xBYFyye?=
 =?us-ascii?Q?5S5U29lwu7fN8Bf8ABqZJlgQYDJnM+h16rsjNnzMuzE61AnekPZ+DEBdJJyS?=
 =?us-ascii?Q?OHLzSVGWJALuGX5UUlZ1BoUADhDulJdIPifoDIo7hUjyQyRy7ccDcqQ+sedh?=
 =?us-ascii?Q?g4U1jIYEVzemOPTz+P8Z+1JuUtFh65W2uB87YG2OuxB6UUkkC9RdjU13X21x?=
 =?us-ascii?Q?lX8z+AnUJ/wHF3oViPaLsRXVnzLCAK9LstZARCfaTpN3ZddHuRDhSPVHOX+k?=
 =?us-ascii?Q?+UIahRh8ivV7R1VH0MwDGZjIH4v5+x3ZnQD++eYajn2LmEhisCuwV1U48LOJ?=
 =?us-ascii?Q?yuLAppoPWKdtnSeGxugXAyoCyLZ2svH/OEH3ReYz1Cigi8+T9xGtCQPFrT70?=
 =?us-ascii?Q?ZMY6x+H4a23GNbCWCowGid6BphqhrJau+eIFvkOMYl2oo9yonVY9Fj+rktaf?=
 =?us-ascii?Q?GO9Qmkxt6l7uzt+bLkTRM7y9PRnfbdocM8OnV9TSEneTs5q4GWjSTmbW6PXq?=
 =?us-ascii?Q?xiOLjqrfsYVxBPujh3DWLixB4HSERl6jvCOqwU1YqfbxjbCK3BsrEVg+McO3?=
 =?us-ascii?Q?pLDyq973v3jykWGyAB+M6T2xh17zNOQxGCYG5zhAhaBa6nZZMDdYg4PlnLm8?=
 =?us-ascii?Q?06e8XCBPoX5n4M18yS1JAIXAIUpip9GLd6SH/d0EfAiPCSz1hRO4+0dR9AIl?=
 =?us-ascii?Q?E6e+rqN49Lh6oJnfrDkkAKgmyScVVzzGKGAcYlnsb7m7kb4JI1Do808U3Vn2?=
 =?us-ascii?Q?dzT4CdjLVbFe4hJ8iuOZfVF5VWlEDCpwRL7brmAF25XndxiekQPtPIkIX9d1?=
 =?us-ascii?Q?c+VKBDs0VEv9tT0q0Z20ggiGD2KDf1FKowgkPchnnPAFePGyf5MpPa9Erq8b?=
 =?us-ascii?Q?rI6csji3o7jjj0R/3dx74Qi+4xT9iFS9p6/I+NEE7+lS3yHaXZiNkksod3Jl?=
 =?us-ascii?Q?wlCKMNfaWNOvNG+jaLUsTbLGbPS3hn4nIXSNUuZ1SQ80HatTR/0UAxnFDG2p?=
 =?us-ascii?Q?beVa+D9fbGAN02XbLlhQDevS58GffBVRiOIcT5XdRtZDlAAd0ZyokQjCU2Fb?=
 =?us-ascii?Q?wfxkwPC3wqMsK2jov1nyykcJ1XI/aLf2CY6b2fUR6+udwPJgT/+XDAdEcu5w?=
 =?us-ascii?Q?Gf6QL9Nr+B4+SBGZYd55eL0ZvAJLZ2Rg83leSuWrF7txOxTqyyetsMVdaURz?=
 =?us-ascii?Q?pMA4zqCmz2rZIqqdTmrM2hgp6IPv7jKMhOLf8D7J8VJdDP5dWngLQk1Ec9Jx?=
 =?us-ascii?Q?x0p0rMGp5Y+gOBEJfYuG6Rgww7U3PzVWsU/3chXIut8+BzQ/rK7s1b+fU/4j?=
 =?us-ascii?Q?OS8LUgRTjLOTAqcEBwv9g3gZmfAZ3QhYnCBJ8Xp1v/WrT8Yjxvt2y4G2XDfF?=
 =?us-ascii?Q?urK6NBO4MKh9qG1q5rdswoJ3cyyo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E5DgbbRW5+6vKuO8e7jN+WssXT9djLGEjzByOGT9VvZhaP5Yl3ekG6XFETEm?=
 =?us-ascii?Q?KD9IIbkGq9v7zbiTAIusnJ9oh9+6t1hYzKJUrCvDh32JWeacwTVkq02VycEO?=
 =?us-ascii?Q?+NtyRtzCBl9QCmPZaN7ipOBn9rpEWyb794F8kjJjgTWcbnnETyfH/B33CUf/?=
 =?us-ascii?Q?oJjBfEhn6dPPtZxN7AkM6wdVgzH5BAlvmEg/Vyx6svXcN3lsSGt34AL4s6RW?=
 =?us-ascii?Q?aFSOa4xpNa4XRfQ3d5Qb7PuiWMVfC7jpzZbGp7A4aSFIH/dxyyee54ApxQnJ?=
 =?us-ascii?Q?5s43zM4Gt5W4PCEU2Bni6/PushWZKvP/XK6OS1trmAF8NjB+4cn9+720kaxV?=
 =?us-ascii?Q?sf9iStylsyctcU2BBvehspgLsNHeS5lDZP9mtBFW49+MWj78WmMmY+6y73Xy?=
 =?us-ascii?Q?a1UTQtSSEK7wQ9nMF7VttQDcxihveMi80LacQPrZ65kb6/LLsD2extfyCb4B?=
 =?us-ascii?Q?6blWMDNrGyyVeUxVUhCBrTZM542tqIbYWaSGGbwl5mj67cxk3s36sz1H0GQ7?=
 =?us-ascii?Q?p9je/r70jq650glkV7LHUKbOK+Bw6/Dt63L+/LiU6oI3WedM6FpG2ldf9k+Z?=
 =?us-ascii?Q?L0BHAa8sF9taqQNP4832sSBZCWAXXepl4JAeCXsyBm2JJ0XFLFGbmSLtfGCz?=
 =?us-ascii?Q?YudA3LAUQeblibpTSl58hJ8HqMyj3suHHMRITc8lv0v8W2Jwg3PWu+S1K5eX?=
 =?us-ascii?Q?A+zLg/IlkgCd5mzBA2Zspe3KKDycIwMXD3z4WUF0wMxeW700gewAGr+8J55j?=
 =?us-ascii?Q?qcjyCVW3oW1olnYrKrMFCyiKzo39hHIz24nkcDkmtf9O/mHMKCzGzXNGbZdZ?=
 =?us-ascii?Q?T9ReGmZoDTXIkBA8WCxVP7s3WU1ArH93rzS+xAHKnSXvqaJG8vCrE040mBkU?=
 =?us-ascii?Q?VkdnKoLO1wauSduDCW2JjYT6MYSKUcbfAI72YBrmrxmPRRkrNrTykHWQo27A?=
 =?us-ascii?Q?MKD4GRy+aB7KYoEPB3Pf/sFa08glNT9Cp8E3W0y9WiY0IGfhKTGMDvgbwIUf?=
 =?us-ascii?Q?I77uZzWXObwrLW2MFqcgePtQDjcUJN1w3zGmafjN1PGHJ9KYMKMRXNDU/gWl?=
 =?us-ascii?Q?2y5+mvxbhI8j5NP+ZQiqTAHLjtMb6K7+tBTqCexAPbl2r7QfGDHCcGS3LRm7?=
 =?us-ascii?Q?0x2i/uVEB+f37O+3XmCva2HST8ZcbwNiFLvVVmVhRvnG08TfN3ggGV5dykGB?=
 =?us-ascii?Q?n72JGsy63wOavgCbTqeEgxGGuLU19Ct7q9x58XJjHUmo0nPD/5kJ4mJKyRyt?=
 =?us-ascii?Q?TL8CvLSoC6Xj1Q2MpDPo0/4htjajhwgZj9+Fr4SpkaueaVNLRKqZZWVoANhv?=
 =?us-ascii?Q?ys7ESts0ReJNoDPV4sqJoIMDLhhIgOAqVJtro5gRoZSu6Iwr7us3DuiFcres?=
 =?us-ascii?Q?ekg7+kQ8WOW0fgkq9ecpFW7MKhZpQOBpHcS9MVqKagtHkxOui4q4p0I5CiyX?=
 =?us-ascii?Q?RMLELRVrWqLOVXlcSzDQ1FROwCaMh/y82AqQeBfLi3/xHCNBQZahYHhZZxq4?=
 =?us-ascii?Q?1DTaLzKAqbrBY0coSFW5JvrWbQgVyNo3MJEL5dc8+tHr5A7ygP7QztDkPdmU?=
 =?us-ascii?Q?1N4zgbgMbJK8fPTB8cW2Zwa25LICYJdTL95svA8TnjaKBD7FSFuM2wE4Iu48?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf8504c-c4f5-48c3-e3e6-08dd561c81a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 04:17:39.1947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WBQlvuB0pRhkF3DJi/BrLFETqNicP6wuhaVEafYlZbt6W02nnyopgaoQR69sIlEXZ6cz2CprKsWOE4vPZxSew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5974
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

On Tue, Feb 25, 2025 at 09:13:09PM -0600, Lucas De Marchi wrote:
> On Wed, Feb 26, 2025 at 10:00:18AM +0800, Mingcong Bai via B4 Relay wrote:
> > From: Mingcong Bai <jeffbai@aosc.io>
> > 
> > The bo/ttm interfaces with kernel memory mapping from dedicated GPU
> > memory. It is not correct to assume that SZ_4K would suffice for page
> > alignment as there are a few hardware platforms that commonly uses non-4K
> > pages - for instance, currently, Loongson 3A5000/6000 devices (of the
> > LoongArch architecture) commonly uses 16K kernel pages.
> > 
> > Per my testing Intel Xe/Arc families of GPUs works on at least
> > Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
> > BAR" were enabled in the EFI firmware settings. I tested this patch series
> > on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.
> > 
> > Without this fix, the kernel will hang at a kernel BUG():
> > 
> > [    7.425445] ------------[ cut here ]------------
> > [    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
> > [    7.435330] Oops - BUG[#1]:
> > [    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
> > [    7.449511] Tainted: [E]=UNSIGNED_MODULE
> > [    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
> > [    7.467144] Workqueue: events work_for_cpu_fn
> > [    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
> > [    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
> > [    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
> > [    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
> > [    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
> > [    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
> > [    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
> > [    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
> > [    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
> > [    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
> > [    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
> > [    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > [    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> > [    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
> > [    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
> > [    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
> > [    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
> > [    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
> > [    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
> > [    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
> > [    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
> > [    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
> > [    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
> > [    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
> > [    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
> > [    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
> > [    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
> > [    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
> > [    7.701165]         ...
> > [    7.703588] Call Trace:
> > [    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
> > [    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
> > [    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
> > [    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
> > [    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
> > [    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
> > [    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
> > [    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
> > [    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
> > [    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
> > [    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
> > [    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
> > [    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
> > [    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
> > [    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
> > [    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
> > [    7.805591] [<90000000002bacac>] kthread+0x114/0x138
> > [    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
> > [    7.816489]
> > [    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
> > [    7.827651]
> > [    7.829140] ---[ end trace 0000000000000000 ]---
> > 
> > Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
> > `drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
> > before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
> > fix the above error.
> > 
> > Cc: <stable@vger.kernel.org>
> > Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Tested-by: Mingcong Bai <jeffbai@aosc.io>
> > Tested-by: Haien Liang <27873200@qq.com>
> > Tested-by: Shirong Liu <lsr1024@qq.com>
> > Tested-by: Haofeng Wu <s2600cw2@126.com>
> > Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> > Co-developed-by: Shang Yatsen <429839446@qq.com>
> > Signed-off-by: Shang Yatsen <429839446@qq.com>
> > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> > ---
> > drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > 		flags |= XE_BO_FLAG_INTERNAL_64K;
> > 		alignment = align >> PAGE_SHIFT;
> > 	} else {

} else if (type == ttm_bo_type_device) {
	new code /w PAGE_SIZE
} else {
	old code /w SZ_4K (or maybe XE_PAGE_SIZE now)?
}

See below for further explaination.

> > -		aligned_size = ALIGN(size, SZ_4K);
> > +		aligned_size = ALIGN(size, PAGE_SIZE);
> 
> in the very beginning of the driver we were set to use XE_PAGE_SIZE
> for things like this. It seems thing went side ways though.
> 
> Thanks for fixing these. XE_PAGE_SIZE is always 4k, but I think we should
> uxe XE_PAGE_SIZE for clarity.  For others in Cc...  any thoughts?
> 

It looks like you have a typo here, Lucas. Could you please clarify?

However, XE_PAGE_SIZE should always be 4k, as it refers to the GPU page
size, which is fixed.

I think using PAGE_SIZE makes sense in some cases. See my other
comments.

> > 		flags &= ~XE_BO_FLAG_INTERNAL_64K;
> > -		alignment = SZ_4K >> PAGE_SHIFT;
> > +		alignment = PAGE_SIZE >> PAGE_SHIFT;
> > 	}
> > 
> > 	if (type == ttm_bo_type_device && aligned_size != size)
> > @@ -1457,7 +1457,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > 
> > 	bo->ccs_cleared = false;
> > 	bo->tile = tile;
> > -	bo->size = size;
> > +	bo->size = aligned_size;
> 
> the interface of this function is that the caller needs to pass the
> correct size, it's not really expected the function will adjust it and
> the check is there to gurantee to return the appropriate error. There

Let me expand further on Lucas's comment. We reject user BOs that are
unaligned here in ___xe_bo_create_locked.

1490         if (type == ttm_bo_type_device && aligned_size != size)
1491                 return ERR_PTR(-EINVAL);

What we allow are kernel BOs (!= ttm_bo_type_device), which are never
mapped to the CPU or the PPGTT (user GPU mappings), to be a smaller
size. Examples of this include memory for GPU page tables, LRC state,
etc. Memory for GPU page tables is always allocated in 4k blocks, so
changing the allocation to the CPU page size of 16k or 64k would be
wasteful.

AFAIK, kernel memory is always a VRAM allocation, so we don't have any
CPU page size requirements. If this is not true (I haven't checked), or
perhaps just to future-proof, change the snippet in my first comment to:

} else if (type == ttm_bo_type_device || flags & XE_BO_FLAG_SYSTEM)) {
	new code /w PAGE_SIZE
} else {
	old code /w SZ_4K
}

Then change BO assignment size too:

bo->size = flags & XE_BO_FLAG_SYSTEM ? aligned_size : size;

This should enable kernel VRAM allocations to be smaller than the CPU
page size (I think). Can you try out this suggestion and see if the Xe
boots with non-4k pages?

Also others in Cc... thoughts / double check my input? 

> are other places that would need some additional fixes leading to this
> function. Example:
> 
> xe_gem_create_ioctl()
> {
> 	...
> 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
> 		return -EINVAL;

This actually looks right, the minimum allocation size for user BOs
should be PAGE_SIZE aligned. The last patch in the series fixes the
query for this.

Matt 

> 	...
> }
> 	
> 
> Lucas De Marchi
> 
> > 	bo->flags = flags;
> > 	bo->cpu_caching = cpu_caching;
> > 	bo->ttm.base.funcs = &xe_gem_object_funcs;
> > @@ -1468,7 +1468,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > #endif
> > 	INIT_LIST_HEAD(&bo->vram_userfault_link);
> > 
> > -	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> > +	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, aligned_size);
> > 
> > 	if (resv) {
> > 		ctx.allow_res_evict = !(flags & XE_BO_FLAG_NO_RESV_EVICT);
> > 
> > -- 
> > 2.48.1
> > 
> > 
