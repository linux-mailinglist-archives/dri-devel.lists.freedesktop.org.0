Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D445A313CD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 19:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E5910E73D;
	Tue, 11 Feb 2025 18:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZwQl7Iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1529C10E260;
 Tue, 11 Feb 2025 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739297613; x=1770833613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sJv5EsfThndYA3MUJy/lJQ7P+xrEXdhAbPtdGa6YIi4=;
 b=OZwQl7IwbHp30AdlNjovsdxVo7Q7a3XvOFXjAEDdP1OAiA075co1QAx7
 6+RiGlIETbypLffwDMszxEQKy21s9m8+xLDtZ/hMCILEZ2JRvkcg6AoTB
 Wu4OuMQKwUc2/K9s8S6UzilqNYAh7oCsbiBijE6lbH/d6qRg+UYT+wpNj
 i2/rhS/6zpTSjTBWW5NBmpMauPpMPV2unv1drQ6R8KZKFis/KvIyN6FXr
 TKizDTb8U5GDNVYOZn7gc5cc2IYJ4iFz3yJuM+gt3OwwokcEPcjVXteIN
 NYWgcowwzGP7OrU3ywJieCW7mmOSd3k6BoRDZbmJ2isomohd4CU01ffhr w==;
X-CSE-ConnectionGUID: Y/8UQdwpQ5OnqOtmfX5LMw==
X-CSE-MsgGUID: gDxJXS3PQU6uvOgLhGA8fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51360073"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51360073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 10:13:32 -0800
X-CSE-ConnectionGUID: iGnAiO0+S8WJKCTmLGNsIg==
X-CSE-MsgGUID: FpuqRclpRz+U3Ciss0i25Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113480292"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 10:13:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 10:13:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 10:13:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 10:13:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEkBU7XE98561lAu517xSPUU1VdajMTkwnJK/wjAlEVYtwSblaDSu6gNqYWoRRMXdvjqMjHUJeSzJYybVwTf/F2Wu0IxHVgUQ+6lUKfNc3d+m26MwOoN/066Bl73R0r9z7vFgRar5LEpKzbGOtwNYKoMhcHn8heqEPilEgQtmizkN5Mxddk30leLXnrP2rzN1s3exnZ1jIXCHzYKiUCi/SqrMvc/ktrvwlZ2L4BIpkt4GCY3Z9S/NoogzD3WXemvPabbFy9iMeYJZi1csAZydFUSKXZmD2SKABgkwB8P/aGAjyRUDYkjzYeT7LGiJq/yWrdr+V1/t3k59UG6AuG2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHVgf8JvoUNdKFx04KImEN1jd8u8I8JbDZKofkXslZ0=;
 b=TcP/ZSKSfjoCxQqcabWR3wiqKTMXLL0NeONfDAQW26E0ik9rnQLQJDFSvlTH8G7seb4tWW0ShrTT617T9qD4ggYoI7SMmfsGId80PLP4/ZVIN4yIYG3ysDFuYMubyBT+MyUG52yw87hydwrVW4aK0sBSLeYRzWyBBY57fchPF4GZ3cfYAthE9gsvAnKNfkl1VCyBzqfvC4+7cliIq4ijWl6RfHfsETHJ70NIob2y9SIua7Dt/D3VyEAmL0IuWPL/V7dJ4oK8SrSRnr3COABryeC9Mm/gs+p8JE4czthUMRcDXg6lzkhvnTUaIgAISx/WQebXtwexW/kvXZidPj1sZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 18:13:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 18:13:26 +0000
Date: Tue, 11 Feb 2025 10:14:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>, Danilo Krummrich
 <dakr@redhat.com>, Philipp Stanner <pstanner@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC] drm/scheduler: Remove mention of TDR from scheduler API
Message-ID: <Z6uTgSWp0W9EN7q3@lstrano-desk.jf.intel.com>
References: <20250205111427.8043-1-tvrtko.ursulin@igalia.com>
 <76739b4e-a1e8-48f9-b547-69b1e2a2504f@amd.com>
 <Z6RabijQPbaPDIjn@lstrano-desk.jf.intel.com>
 <2c9c08ad-0fd8-4803-a1c0-ae3e4326ad26@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c9c08ad-0fd8-4803-a1c0-ae3e4326ad26@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 49693546-9960-4475-3b04-08dd4ac7c735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ot7Y0FLpnKifd3b72LPZNnq7p79qkDyZl3RiqFAxR/DM3dd5gm5mrVFa2X?=
 =?iso-8859-1?Q?ICJslUg8vSD299K8FOHc0JAIhCYsWbZy41HvQ/tkTwNO8eL/1DEphY2uGt?=
 =?iso-8859-1?Q?kNhGPIlIkuXAePEZW99cfSFC/cLF0SFfmApUlMJFOeLHmiopd1jyXPkbN7?=
 =?iso-8859-1?Q?DSmYWrYwsmIuNZ4lXZNv8NVUIMRZjEuvb7dubsPmpPYJxnxYtTZDWWnLmr?=
 =?iso-8859-1?Q?1f4Ts205SF+NJLXowBkgLW9IrG1JfRxxl1j6BxG51f+ri09kIbDtqZGBh8?=
 =?iso-8859-1?Q?F5XqF78RchQYBOnUIBy9IkV5m09WZYLvcfmFurgAH0UbRRpDSWfQuj5VIj?=
 =?iso-8859-1?Q?AiDeT7L5X9tBK1yP5OTevTaTiR40+ocYM7EfAqJ0U6O3tCjuv9ZEPg9iAd?=
 =?iso-8859-1?Q?BvlvETOKXWQzfy/K2wzO/LexVSR664khxo9yO+b4iK7H0ndH0aT2x/nQKy?=
 =?iso-8859-1?Q?WGQhFh0HTuKA1ruMkmUR5cdGeB0PZbl0t5qnTDWZVyKoNxaj3ZPEB6HxMr?=
 =?iso-8859-1?Q?zzSTbRg/dsX9Fsz4YbgLgm3dZ2ZHyLlSF3fEi8bNmlFl/1jtQXILS+h+tM?=
 =?iso-8859-1?Q?rsIQiFoc/FYDvM1xcKAKpME95u3J1qSdBq0QiRCgS+JRpPheX7lDpDLPQJ?=
 =?iso-8859-1?Q?CVCLn4i0seRKd7hXKCcdwFKq+F1OXSWZ60+d3oDVmczkdZDeoOnAqO1HQt?=
 =?iso-8859-1?Q?6azD8/ym/l+zV4t4+CeBKx8Q/b4NkwiJZ9WgkK9CAMcRn/gASdLrNN1KLg?=
 =?iso-8859-1?Q?vYT/Ma7UUGLsj6nDSkJ3l/jBAZny3Jgufj0nI+tMKEktFkdz0pxqykHIms?=
 =?iso-8859-1?Q?Kw6/XlB5vf89gl/PrZqszK5hgBpXmA6Hx7rl5S8PzNRUW4/dpVRoX+v82a?=
 =?iso-8859-1?Q?nOSm/SomyIrCrlx81ItB7yFbYXThrBXLzK+ryT6coVNDVBHnQGn1QJEsTA?=
 =?iso-8859-1?Q?R1QCNSWe1IRR5AmvPbPEywaZPpwHuG1t1Ij3gPjoZa8CHoxLzT66hrgfdx?=
 =?iso-8859-1?Q?ucN6llLRC0SCwcUJOwbA6ZQcZhvUYnNbZYUPCHOE2dfxt0KoKJJ+qhLJdG?=
 =?iso-8859-1?Q?jT1ITiSDcvHl7WLfViyTx4BwHfr/fRbGwUGanRzmmZSeTgf2OWCeeT8tQP?=
 =?iso-8859-1?Q?mJtKP1kdzlqGIpijrxzk4CKnXXPo8b+WQQCuQ1JPGYvj2JI5H1WoIoy4h4?=
 =?iso-8859-1?Q?HYOCMBCgA5H7CAzhqWTsjuG3U3qdDWio7R/cXK4Uie/KXUT8UAEg82MBqb?=
 =?iso-8859-1?Q?uhjtH07T/kAtkcre//TRUqC6HJFhzAZUl4FCH/RF/Aeee4Va2OB1hheit6?=
 =?iso-8859-1?Q?ipLI2M8HUGQqlVp2gMtFT9vtQWq3Ib/PL9/onzem4PHfXaWpKQTrz05rGE?=
 =?iso-8859-1?Q?htK06Fpu+9ehXVDWZ4vE1621BX/Q3qiT2iHx18axo4h/z6mb4rNb4kedyL?=
 =?iso-8859-1?Q?uDaxqGnrERTZ4RGy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vc5pIqhUIwBRjEsx6lgli8yH9mt6LH1ZL9S1IXoDIjnSYfqG8KihRnruRV?=
 =?iso-8859-1?Q?ZOu15ASL1XFVql2TaxmrQHQbB/mxM/qlHQI9uJAmv2uQbx8ecLoX8a85x6?=
 =?iso-8859-1?Q?faLpofxhZhkT8mNvhnYoTmjuLAiaHcqk4MBf2kz8le7fDpD1Zo7CHY42cD?=
 =?iso-8859-1?Q?EzSVzPvoAQPh6wE6If3kyTx31FVYpoboxt65canqSX13TD2EGznpAhHSXR?=
 =?iso-8859-1?Q?5Ryz+cR5XkGwkfOZQWcNt7Ao0+tUMPJsa9DdmEB+6GkFFh+Vq4IbcBLlDc?=
 =?iso-8859-1?Q?msiDA25g9cI1G/PAsTxYojD7PRfYnQqFoKjL+bgbFUgE+RY1hWLmeaDvba?=
 =?iso-8859-1?Q?vsbrtGia3xkyryfHSjZ4AXpiqQFWUfDwPnJ9M6+9qwwljjIiMmgni8azT5?=
 =?iso-8859-1?Q?OXqioQXS7DsETJVEM49I+V97fkGuNgzb8ZkBmuzmzmF0C3TQyygMpbAcdE?=
 =?iso-8859-1?Q?wdfUPqxVeQoH9LoC5HRxYxAfZl0ls0XG1q71DfPKOB4LZX5kVvVgZuNrml?=
 =?iso-8859-1?Q?hXHjnQvXTTlhfuM/+n+/EZC4+W7d+F/JWAjB9jkei/CJ33R3KTFSA80JZB?=
 =?iso-8859-1?Q?5g9mhscN4CFqmwecgMRGmmIqQqhfQ6M33y+Oc4RxqiPAK9xMjh1ZYCaSMA?=
 =?iso-8859-1?Q?zkKzq8ME3p0UZor80a1L76OtyXHULhTvHGAAYboG8cvT/sE9PUgpSa1Yed?=
 =?iso-8859-1?Q?ko5gt3CDHKCCqqDTBglIbIQQV3/9pCw78I47UJZM1TBYIA0QYuPCD58ALy?=
 =?iso-8859-1?Q?7MtZ86vM2YjR6o8hEkHfZtoKwirfp26iHCR1Yul+PiQfKMjZqJC4Ul5oUz?=
 =?iso-8859-1?Q?NSJdpVyigqHLf4OaVmEfwLVirqds+dIjnovNSqzLV6V4z+WgRNZmSwWjPr?=
 =?iso-8859-1?Q?kOjpI49l79Z1dps3rrH1K+ALuDbdCwmngYapvgkbRW0OyJCnCIFvnMjwTF?=
 =?iso-8859-1?Q?6P/TvnfdyeFseYg4CCA5NasCVK5gMErrfJ6fgEv+KIbUJzVp+3F+XJ9PeH?=
 =?iso-8859-1?Q?C5w0xWtR5wAF5wSA7XY+HQBviTT4pjmlVzdAU1okAkoDyIDHUkEqNTFe0D?=
 =?iso-8859-1?Q?Zf+kyAw9ZNLeiF0RIVluAZrSwK2JNYTyQgCa8irzPzcGVvpY0rT34goBlm?=
 =?iso-8859-1?Q?PHaehgDg9c+JRZocqKinvT5qsxWM51XsG1iotWgNl5wxZaUlS2sEe2it7f?=
 =?iso-8859-1?Q?tyK7yMLL9Cd8tldjsCuaUWqEO9ivtjKzXLok5aW3DtD0fpvIz5C23e4koA?=
 =?iso-8859-1?Q?6tZ9yQWlIEvJnxmTjdpJFkm1r5qSsG6S+IQ77yf6wFFAbR1HZSqM4a0oVV?=
 =?iso-8859-1?Q?WDjices+Ip2GKMxLBfma9tWkrSALZaUi+aDYvDxGI9UeCgPRqZCwoc9O8J?=
 =?iso-8859-1?Q?5z1n5aXsO4beASlJAyjLFdv8KsOiainlvy+O3rFM3+jYaNQKFF4y8RFY6i?=
 =?iso-8859-1?Q?DSSUCdIZVJW+Xf6ViV8JnSb3qC8BtWgDnKXRERWH0UHz0OXiDUv2VFIc0v?=
 =?iso-8859-1?Q?MtsuRfpYZg9JDa7vIsvkbLMsF5AjEN6+DtToqwCEaC06Gmjv6f8cFVEqvm?=
 =?iso-8859-1?Q?RLax5y3hWvFyUU2czVzpnHqOhXXyunaOeTOZ7lf/FdmvrYTXvnESw7t1iQ?=
 =?iso-8859-1?Q?oc1q6ylDlK8fA5xIewgq6ybw7RRSjLn7CrokN6Vu9sk0Zwl0UxK6gAAQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49693546-9960-4475-3b04-08dd4ac7c735
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 18:13:26.1430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+6AvCFsyOI91FETusR9s2nJFtLZLTVIdTpERqXE+/44b+OReMKrxT7MjJw2pP/ePK7cT6Mfnh+NU5OCXPzFHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

On Thu, Feb 06, 2025 at 10:20:43AM +0000, Tvrtko Ursulin wrote:
> 
> On 06/02/2025 06:45, Matthew Brost wrote:
> > On Wed, Feb 05, 2025 at 01:44:48PM +0100, Christian König wrote:
> > > Am 05.02.25 um 12:14 schrieb Tvrtko Ursulin:
> > > > Christian suggests scheduler should not use the term TDR because it only
> > > > can do basic timeout detection on it's own, not the full blown timeout-
> > > > detection-and-recovery (TDR) as the term is generally understood.
> > > 
> > > There is even more to the term TDR on Windows than
> > > timeout-detection-and-recovery.
> > > 
> > > For example it includes a certain signaling of errors which works totally
> > > different on Linux.
> > > 
> > > > Attempt to rename it to a more basic drm_sched_trigger_timeout.
> > > > 
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > Suggested-by: Christian König <christian.koenig@amd.com>
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org
> > > > ---
> > > > While doing this I have however noticed the pre-existing drm_sched_fault
> > > > API sitting right below drm_sched_tdr_queue_imm() added by
> > > > 3c6c7ca4508b ("drm/sched: Add a helper to queue TDR immediately").
> > > > 
> > > > It does not appear to be documented in the kernel doc why is the
> > > > newer API setting sched->timeout permanently to zero, or why are
> > > > both needed and what are the considerations to use one versus the
> > > > other. Perhaps Matt can clarify as the author of the newer API.
> > > 
> > > Oh, good point. I wasn't aware of that duplication.
> > > 
> > 
> > The newer API in Xe is used when we ban a queue to flush out all
> > remaining job's on the queue - even ones yet to be scheduled. Unsure
> > how the old API is used in other drivers but it doesn't work for Xe's
> > use case.
> 
> I am not sure how timeout handling relates to jobs not yet scheduled.
> Timeout worker only looks at the sched->pending_list to start with.
> Drm_sched_tdr_queue_imm will also only queue the worker if there is
> something on the pending_list.
> 
> I think we should fully understand what exactly doesn't work so we can
> formulate a plan on either how to document the newer helper better, or how
> to remove and consolidate.
> 
> Is xe using it as a one way transition - ie when it sets sched->timeout to
> zero it never restores that scheduler instance into normal operation?
> 

It is a one way transition. So all future submissions immediately timeout too.

> In which case one option could be to remove drm_sched_tdr_queue_imm and add
> something like drm_sched_set_timeout. AFAICT a sequence of
> drm_sched_set_timeout and drm_sched_fault would have the same effect as
> drm_sched_tdr_queue_imm. But setting the timeout to zero to start with
> sounds dodgy so not sure.
>

Yes, drm_sched_set_timeout + drm_sched_fault would have the same affect.
I think at one point before merging Xe's DRM scheduler changes I had a
set timeout function but the review comments lead to
drm_sched_tdr_queue_imm.
 
> Are you perhaps simply wanting a "draining" (as opposed to re-queueing with
> a timeout) version of the timeout handler? In which case
> drm_sched_tdr_queue_imm and it's kernel doc should have as minimumn explain
> that. Although personally I would prefer a more explicit helper for that.
>

We never re-queue anything in Xe aside from an entire device reset. Once
something bad happens on a queue we ban it from use at the exec IOCTL
and call drm_sched_tdr_queue_imm will has the affect of immediately
timing out jobs. The TDR (or whatever we rename this too) kicks the
queue off the hardware and signals all fences.

Will on the topic of renaming things...
s/drm_sched_entity/drm_sched_queue. I think that would be good change
too.

Matt
 
> Regards,
> 
> Tvrtko
> 
> > > > ---
> > > >    drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++------------
> > > >    drivers/gpu/drm/xe/xe_gpu_scheduler.h  |  4 ++--
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c     |  8 +++----
> > > >    include/drm/gpu_scheduler.h            |  8 +++----
> > > >    4 files changed, 27 insertions(+), 25 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index a48be16ab84f..b01792fe6141 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -433,7 +433,8 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
> > > >    	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> > > >    	    !list_empty(&sched->pending_list))
> > > > -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> > > > +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
> > > > +				 sched->timeout);
> > > >    }
> > > >    static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> > > > @@ -444,20 +445,20 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> > > >    }
> > > >    /**
> > > > - * drm_sched_tdr_queue_imm: - immediately start job timeout handler
> > > > + * drm_sched_trigger_timeout: - immediately start job timeout handler
> > > >     *
> > > >     * @sched: scheduler for which the timeout handling should be started.
> > > >     *
> > > >     * Start timeout handling immediately for the named scheduler.
> > > >     */
> > > > -void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
> > > > +void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched)
> > > >    {
> > > >    	spin_lock(&sched->job_list_lock);
> > > >    	sched->timeout = 0;
> > > >    	drm_sched_start_timeout(sched);
> > > >    	spin_unlock(&sched->job_list_lock);
> > > >    }
> > > > -EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> > > > +EXPORT_SYMBOL(drm_sched_trigger_timeout);
> > > >    /**
> > > >     * drm_sched_fault - immediately start timeout handler
> > > > @@ -469,7 +470,7 @@ EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> > > >    void drm_sched_fault(struct drm_gpu_scheduler *sched)
> > > >    {
> > > >    	if (sched->timeout_wq)
> > > > -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
> > > > +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, 0);
> > > >    }
> > > >    EXPORT_SYMBOL(drm_sched_fault);
> > > > @@ -489,14 +490,15 @@ unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched)
> > > >    {
> > > >    	unsigned long sched_timeout, now = jiffies;
> > > > -	sched_timeout = sched->work_tdr.timer.expires;
> > > > +	sched_timeout = sched->work_timeout.timer.expires;
> > > >    	/*
> > > >    	 * Modify the timeout to an arbitrarily large value. This also prevents
> > > >    	 * the timeout to be restarted when new submissions arrive
> > > >    	 */
> > > > -	if (mod_delayed_work(sched->timeout_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
> > > > -			&& time_after(sched_timeout, now))
> > > > +	if (mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
> > > > +			     MAX_SCHEDULE_TIMEOUT) &&
> > > > +	    time_after(sched_timeout, now))
> > > >    		return sched_timeout - now;
> > > >    	else
> > > >    		return sched->timeout;
> > > > @@ -517,9 +519,9 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
> > > >    	spin_lock(&sched->job_list_lock);
> > > >    	if (list_empty(&sched->pending_list))
> > > > -		cancel_delayed_work(&sched->work_tdr);
> > > > +		cancel_delayed_work(&sched->work_timeout);
> > > >    	else
> > > > -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, remaining);
> > > > +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, remaining);
> > > >    	spin_unlock(&sched->job_list_lock);
> > > >    }
> > > > @@ -541,7 +543,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > >    	struct drm_sched_job *job;
> > > >    	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
> > > > -	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > > > +	sched = container_of(work, struct drm_gpu_scheduler, work_timeout.work);
> > > >    	/* Protects against concurrent deletion in drm_sched_get_finished_job */
> > > >    	spin_lock(&sched->job_list_lock);
> > > > @@ -659,7 +661,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > >    	 * this TDR finished and before the newly restarted jobs had a
> > > >    	 * chance to complete.
> > > >    	 */
> > > > -	cancel_delayed_work(&sched->work_tdr);
> > > > +	cancel_delayed_work(&sched->work_timeout);
> > > >    }
> > > >    EXPORT_SYMBOL(drm_sched_stop);
> > > > @@ -1107,7 +1109,7 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
> > > >    		list_del_init(&job->list);
> > > >    		/* cancel this job's TO timer */
> > > > -		cancel_delayed_work(&sched->work_tdr);
> > > > +		cancel_delayed_work(&sched->work_timeout);
> > > >    		/* make the scheduled timestamp more accurate */
> > > >    		next = list_first_entry_or_null(&sched->pending_list,
> > > >    						typeof(*next), list);
> > > > @@ -1325,7 +1327,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > >    	INIT_LIST_HEAD(&sched->pending_list);
> > > >    	spin_lock_init(&sched->job_list_lock);
> > > >    	atomic_set(&sched->credit_count, 0);
> > > > -	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> > > > +	INIT_DELAYED_WORK(&sched->work_timeout, drm_sched_job_timedout);
> > > >    	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > > >    	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> > > >    	atomic_set(&sched->_score, 0);
> > > > @@ -1395,7 +1397,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > > >    	wake_up_all(&sched->job_scheduled);
> > > >    	/* Confirm no work left behind accessing device structures */
> > > > -	cancel_delayed_work_sync(&sched->work_tdr);
> > > > +	cancel_delayed_work_sync(&sched->work_timeout);
> > > >    	if (sched->own_submit_wq)
> > > >    		destroy_workqueue(sched->submit_wq);
> > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > index c250ea773491..3fd728b1bfd6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > @@ -44,9 +44,9 @@ static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
> > > >    	drm_sched_stop(&sched->base, NULL);
> > > >    }
> > > > -static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> > > > +static inline void xe_sched_trigger_timeout(struct xe_gpu_scheduler *sched)
> > > >    {
> > > > -	drm_sched_tdr_queue_imm(&sched->base);
> > > > +	drm_sched_trigger_timeout(&sched->base);
> > > >    }
> > > >    static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 913c74d6e2ae..968709fd6db4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -778,7 +778,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> > > >    		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> > > >    		xe_sched_submission_start(sched);
> > > >    		xe_gt_reset_async(q->gt);
> > > > -		xe_sched_tdr_queue_imm(sched);
> > > > +		xe_sched_trigger_timeout(sched);
> > > >    		return;
> > > >    	}
> > > > @@ -807,7 +807,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > > >    	if (xe_exec_queue_is_lr(q))
> > > >    		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> > > >    	else
> > > > -		xe_sched_tdr_queue_imm(&q->guc->sched);
> > > > +		xe_sched_trigger_timeout(&q->guc->sched);
> > > >    }
> > > >    /**
> > > > @@ -986,7 +986,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
> > > >    		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> > > >    		set_exec_queue_banned(q);
> > > >    		xe_gt_reset_async(q->gt);
> > > > -		xe_sched_tdr_queue_imm(&q->guc->sched);
> > > > +		xe_sched_trigger_timeout(&q->guc->sched);
> > > >    	}
> > > >    }
> > > > @@ -1144,7 +1144,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >    			xe_exec_queue_get(q);	/* GT reset owns this */
> > > >    			set_exec_queue_banned(q);
> > > >    			xe_gt_reset_async(q->gt);
> > > > -			xe_sched_tdr_queue_imm(sched);
> > > > +			xe_sched_trigger_timeout(sched);
> > > >    			goto rearm;
> > > >    		}
> > > >    	}
> > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > index cf88f2bd020f..666968cf505d 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -494,10 +494,10 @@ struct drm_sched_backend_ops {
> > > >     *                 finished.
> > > >     * @job_id_count: used to assign unique id to the each job.
> > > >     * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> > > > - * @timeout_wq: workqueue used to queue @work_tdr
> > > > + * @timeout_wq: workqueue used to queue @work_timeout
> > > >     * @work_run_job: work which calls run_job op of each scheduler.
> > > >     * @work_free_job: work which calls free_job op of each scheduler.
> > > > - * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> > > > + * @work_timeout: schedules a delayed call to @drm_sched_job_timedout after the
> > > >     *            timeout interval is over.
> > > >     * @pending_list: the list of jobs which are currently in the job queue.
> > > >     * @job_list_lock: lock to protect the pending_list.
> > > > @@ -527,7 +527,7 @@ struct drm_gpu_scheduler {
> > > >    	struct workqueue_struct		*timeout_wq;
> > > >    	struct work_struct		work_run_job;
> > > >    	struct work_struct		work_free_job;
> > > > -	struct delayed_work		work_tdr;
> > > > +	struct delayed_work		work_timeout;
> > > >    	struct list_head		pending_list;
> > > >    	spinlock_t			job_list_lock;
> > > >    	int				hang_limit;
> > > > @@ -571,7 +571,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > >    				    struct drm_gpu_scheduler **sched_list,
> > > >                                       unsigned int num_sched_list);
> > > > -void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
> > > > +void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched);
> > > >    void drm_sched_job_cleanup(struct drm_sched_job *job);
> > > >    void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > >    bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
> > > 
