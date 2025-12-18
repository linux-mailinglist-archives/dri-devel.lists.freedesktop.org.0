Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD4CCD1EE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A374010E646;
	Thu, 18 Dec 2025 18:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="illpVWml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944AD10E2A0;
 Thu, 18 Dec 2025 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766081804; x=1797617804;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WCBVMUkQEnIGbLp0OJk3Mw7Q7hypFYeSPM14ICKqliY=;
 b=illpVWml5ZoOiNrEqr6tDIuUuwPI/BYmFff4Zwt4xlFI7kKo36LKN3dq
 NSDgpxsub13s+lpMtLzJZijZLPFIJ0lt5E7yLESk3id3YfUY5ef3gaEyl
 4/tQ35ZIdPnk2IRO3NoKWl3M8rQrJVDSnSAEYy0avLNcSyc4nEnPSB9N4
 cXKguy6w1YuZwCPgMIsFgqu13LCTIr+kC4WEJLGTcIYCn21+YkukjUByH
 VHPt/XsNUuqNs9mIFniUCHRLzQPMEN+UtJ4ujmBhMlwHu06zmJatFQkYP
 TPn4b+23IBbwVun15RgWHvS72dpXsZHVbhEGWudz57piV1Jk/oREeXbUN Q==;
X-CSE-ConnectionGUID: nKiCPsrzTQmrwEAjMFTb/Q==
X-CSE-MsgGUID: komxiGt9SRqDFXpZGwuFKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67040623"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67040623"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:16:44 -0800
X-CSE-ConnectionGUID: uIewY8CgRPSIjSP+qpiUbA==
X-CSE-MsgGUID: PZRo98gvTka72ZpFQMFrRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199126563"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:16:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:16:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 10:16:43 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:16:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LG9nc5KuSkiVt9ToQW54LIhB8HtCg7ArdT6w2w2cl9igF6WRxkXSWtKuwS1w2TKxfLriBhJQYud5DcyYksDybfKsLgJDFKy05X5iDSuBrELPUS4ILREtIuGBpKSl6q55nK4sbmf13063KkrgS415TpU+F3RU9nrQ4BACcNbshDD+GhM4AERmocy+o6SrE3r4mb93+zJG8OitfeuXmn+VdZVTx0+8EJZyGtpnji4hyAc+7LnwfgHs5KQ0ieyLqfQiFNq+C0IPfEb4lgbfQLMxX8tQ8RWhwZS4crSnBF9HvdlCHBi0Xx10Saosl2PvP+0/RQfYvPYUVKS7tTpZUPKM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdX4sh9gOiSIl9u+OtiT853O1fdjPnEOXevQbE7CKfs=;
 b=Tx2cmwpQAokQluHUgqczgyvWFx7IkAy8fKyUNVP6O3se7n+G+4lvFgSJYPUkDsOeuzOs6S/p1tHKnmnzVUuYjao/YNQxy1gouU0MAFquM1LDOELCUatOufWreFe42gF9LN43KezVrZiExrn6zpQNRELjmZ9x0PsFVw+D/pV9K4fvKN57RcyB2WswzyAgQfY9GoElWp9thrUah0fXuhmv2lPcGSEdOd5zRJQQVnSSUK5o4KX+hIvZrhJRuqo35gEpHqRYXvUjAOdwH2afjuyt8UBvPJRpDrRWIb7ystRv1MyQQ6b53v3vUeMyozKY1ahjRNKBR+XQbqxSrrezBf+CDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:16:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:16:41 +0000
Date: Thu, 18 Dec 2025 10:16:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 02/24] drm/pagemap: Remove some dead code
Message-ID: <aURFBiurtyD/mccp@lstrano-desk.jf.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
 <20251218162101.605379-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218162101.605379-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eb6c93-c6fa-40e4-ab19-08de3e61977b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lFPZuqmcr6mT3v9+zTHz5zVIE5ULT1piAhYziPVFOLB0qIjgBBDjf3+Rr6?=
 =?iso-8859-1?Q?gJJ22yYdCWtQAS+JqkdylK+m6XVp6B5jukh0TjHodUI3bC/Vm7X5Bch83F?=
 =?iso-8859-1?Q?+9ArY9Jn7iNtdXY4gQPnntCMrUruHlq2JDnExqCbJWDJ8y/x72IuXXWq4g?=
 =?iso-8859-1?Q?oKUy822ImobSHeiUPllWhDkp/zsUwh/4LyEWTxgAALTDVuQH2bkAMP2H+Y?=
 =?iso-8859-1?Q?B8m/gn4L2L0UsuL7BAOD1kKSJqpvscECfJUMBnCW4o0Oiqa6+SItvBeN4z?=
 =?iso-8859-1?Q?8JHqy+/GVxh+VG8X9dx6+Rhhfo5pOvXJTGXHEDYxIsLK2rSn9dsUlQS7NN?=
 =?iso-8859-1?Q?pUUWVh8jFYLvhUmJMiU7v7yx8/XpOxM+mrrrF9nqeBIbwdmNYVEfKv8vBC?=
 =?iso-8859-1?Q?sdgJXn12vl85Xanyd8o0w+PlF06LtnhDzbg6cgaNeW5xLOpKH02MGDrAIz?=
 =?iso-8859-1?Q?zc91LQk2IleV34gGOGQuKPtpbKWqNjHCXP4E0z0We499RINlrUaI5QKQ77?=
 =?iso-8859-1?Q?SnQE3JLWOD79B0JaT+yw3G/E7/3BUkRgnyHYA7QkeMX9JmY73/7cDwQk5o?=
 =?iso-8859-1?Q?unOj0chvLnUbQouAT1SXa2kxdUqvrcqBNxkfSev5dmOynVE/fViKTp9Rn8?=
 =?iso-8859-1?Q?TGNutXedBVsNMdIcX/ecH5VA5aaQq6U0wI9QSN8tqCVqUrChxBCAg9gXcQ?=
 =?iso-8859-1?Q?g2KtUioCaicKGjhCd6Ta518khqa6vqI8hUdc8oEHkJ+uaxVau34ERhex32?=
 =?iso-8859-1?Q?gvRYSVlLtnrNiRz0zhHgGGsWJWCIwB86RZUUd/Ieab8aq77e9joW/IBO/D?=
 =?iso-8859-1?Q?uCpqm2Sh/iTlHg0B6/k4g9lJruXvQC48ywzxorAKUvHD/k6UXcV8Awh92p?=
 =?iso-8859-1?Q?UFT+K1y8/NSg76/mb6QASCccaXbzpQ8S8rQlaTcbzzvJ9G+AASh9l/Ldmk?=
 =?iso-8859-1?Q?oj9dfeaBFl3syk3k/M6bESv9+kmt53fYMufnUPSDenaeS7NuSG50rUH4Fv?=
 =?iso-8859-1?Q?eeDis+LusMDsYQIXVC9i5XXRoawQYIYR345mw8FDI4hoE4tHhkxAPhFtTH?=
 =?iso-8859-1?Q?PdhAWdyGlJmeLTX8W8nmBzz0HaYlmTBXm7vzkSn/JYujZnNCkgJSgP4A3O?=
 =?iso-8859-1?Q?+Qma5qIkQnVd6FQvOW1OIc9+b2vhvnHMzPl18ZlDSdRxarkbQxwEe4b5Np?=
 =?iso-8859-1?Q?p6R8v/heCJo+OeFmqJWEFEmUjxaWXnBcdS7lU6AeUu6bs4MpZalQ65nJbh?=
 =?iso-8859-1?Q?h5Z+iBytLWP/lVoDfbcEnpcbodkM2Y2aC8GVVwstVjSQ/OuZSO/vQHXiZe?=
 =?iso-8859-1?Q?spLeh2Ts+eP8qoaODqboO1D2bhluPdEqh6dMjLXKkFjklc/9gz4CRxMr+s?=
 =?iso-8859-1?Q?TZlZtSrgJSMk6ww+AGXLupsILhkDqrWPqy5S8CqZIHXCD4hZVXklx5PNJ7?=
 =?iso-8859-1?Q?sxmEtLaDPUEHczmcfs6qNxVx13+Q03r5mAJKmSPBxNj55kY+Upq1XYpaul?=
 =?iso-8859-1?Q?Trb++X2RYO53kh96PyO+zB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mEtdVgxhxQXSZRvgRZbAIxBIVIn6+qC8q13auP3CWLOgbueMUjhfViyc7A?=
 =?iso-8859-1?Q?ndbWbrESzRsmqPBsMTbG/I81FlR4L48oc5fdssOjm3zTr0zEDRNg4I7OZt?=
 =?iso-8859-1?Q?ZyW0TUiakuFuruOHnGaTLTrZdSBdoYk9nbh1hbYuHnXeSsX+bj1f4Bh/0E?=
 =?iso-8859-1?Q?xUUewD9/7SMhPnt2iQUwMbgvc20tmvQRnbFXrcVduZxG6iYbIMtdyYOSQs?=
 =?iso-8859-1?Q?7lJqr8c4oEpdlvVYNs0Pz8U94fxvwSLqts6Fnt08tf42MjIbmyeedM1yJb?=
 =?iso-8859-1?Q?RNgj7bpQ74gxai5RmeB0LbP4RuZTuJ2u5ViNbLYXCa92AdXAgvmDoKrK/+?=
 =?iso-8859-1?Q?FYNewDEzbgutR2slXCNB7U5juTaHKj8vhuvvA/vN1P7JjsHb7eDoSRfCXk?=
 =?iso-8859-1?Q?TbikbQyn4qoAmblNLU1pYDnPqPyMlmnuUqRwhgthZeRdGM8FKcbHX75HlR?=
 =?iso-8859-1?Q?FKWZ6zkPHgaSGAb1lKb1jSRH30H577Tj40Ia2JAE+mnsTmHW+7lPGbBnx1?=
 =?iso-8859-1?Q?AGTUY3WO320d+2BCgT4Iptz2Bo/y9ZMoB2oiufHbZwmilrQlLttk8VgUs5?=
 =?iso-8859-1?Q?IcGLWtTE1C+OEHGd9/ng/P7lME8OLK/QNBektvBpFE+0FNwFry94fwTXHy?=
 =?iso-8859-1?Q?CwZ9Wy+lxGiNzQR2pj004aitSfbvWQhsKjID6sua9p53tWUogKkDtzcgcX?=
 =?iso-8859-1?Q?EMHLnQrAgsF29sPLjwPD29LfOehACif4PKQoHli0P16G5oBaLytbQOBIV3?=
 =?iso-8859-1?Q?dYR0ufR7xHecuhh9bRrPU59hEx/GIUVR07fF6K1wiRUAGFETDxbrac5fc9?=
 =?iso-8859-1?Q?bEh5upT/pls63p5HtqVthknGXBTffe2JQOhNrusVeqemgFAux9G1bdmp73?=
 =?iso-8859-1?Q?88gj54EUbBQj611bM5kCSOWirATtio+rI0g/zWXfZnEbXqnSfVLxOd+KBY?=
 =?iso-8859-1?Q?VqAY3mdIC/RomFhLaBseYnra3LSnraEqD9BFojBRVUhzLfvMtbLRzkAhnG?=
 =?iso-8859-1?Q?Bgi3L2eoq3VpRtjK6BQHT/L6Wb4i2cOsPJFjfmEK7OG1wvnHqRfyMQXwl9?=
 =?iso-8859-1?Q?fMTBYwYdfS2Qh3PaUe3lG73XUcvgRR+MVYlLr1M3jLQjZzc9uDdAv9BHd+?=
 =?iso-8859-1?Q?s65cqYT26HFJbYLEmpVx/zWeiap4FFRmeijNfmag2QJ3BvQqguPdvz9zSi?=
 =?iso-8859-1?Q?4tDtq/UtOwipizssDwl4M+lOCxGOj2f8IW0MX7YB5gd3J6fdaXRmeeJdCs?=
 =?iso-8859-1?Q?e85C12Zg/6oeBuBbiSJKls5aaXRef7tlXaQZdjRLJ5jMgU2n90VzGNtJ27?=
 =?iso-8859-1?Q?nOp14rPArombok/DL0g4S+pjiCS4XEp1VmA6GCBadPhrgFixSRKz4eB0wE?=
 =?iso-8859-1?Q?+c7+bTrTuFoCn7vSI0JOfEBETFLok1sIjMaVv6IuWpzH+20j4j5QzGCpQh?=
 =?iso-8859-1?Q?HteIoxaDKV5kaggFnEZW3Ko+XpKmb08WTqXqrsK+lVC37cZF3XICe40Q/0?=
 =?iso-8859-1?Q?t6nm9uJFwz2vfbnUt3E2zzmRHykmeKTk6/HgalaqKIYiPilQWdtqUZZ7NG?=
 =?iso-8859-1?Q?O9mSn5i7x8GFzVEX0QgPEFhKoMtjowL6JTqGm3t2rc1kOy8uyMklz/TJ00?=
 =?iso-8859-1?Q?2qlogjdHRzEScfTPAPII2h5rdSQrAN2DeakkkYN1GIr4bxAKuHxJhWjQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eb6c93-c6fa-40e4-ab19-08de3e61977b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:16:40.9318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KagWpmWF9wXUGD2JOf58ffPkvNZ7nLv+Xs50TpC2MdYXt3ZtgpS6Aik5QGamPENWxrJAisdlUbaA6td8ha3i5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

On Thu, Dec 18, 2025 at 05:20:39PM +0100, Thomas Hellström wrote:
> The page pointer can't be NULL.
> 
> v5:
> - New patch. (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_pagemap.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 37d7cfbbb3e8..4cf8f54e5a27 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -702,19 +702,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (!migrate.cpages)
>  		goto err_free;
>  
> -	if (!page) {
> -		for (i = 0; i < npages; ++i) {
> -			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> -				continue;
> -
> -			page = migrate_pfn_to_page(migrate.src[i]);
> -			break;
> -		}
> -
> -		if (!page)
> -			goto err_finalize;
> -	}
> -	zdd = page->zone_device_data;
>  	ops = zdd->devmem_allocation->ops;
>  	dev = zdd->devmem_allocation->dev;
>  
> -- 
> 2.51.1
> 
