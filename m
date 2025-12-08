Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21ECAD0AF
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 13:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481E810E440;
	Mon,  8 Dec 2025 12:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYHJboch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7434110E43F;
 Mon,  8 Dec 2025 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765195815; x=1796731815;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Ls04lRhZ3c2pU4hRnWPHeuROdOIlSzvwOy87IPn52YU=;
 b=RYHJboch8PvsssFXm1JrNvDIxnACDb6LMj+1vjs2CFpQT31+jb8j8Z2J
 kEt8l+UQLZkMt5bLD/vqNg1+ox5fPFP9DqWDPhz2IGagL8akckkT+7WLT
 yptOW1tLbTd9Lx/441XqNhJ8l+/DU2u5fnOQM3hE/XcEu2/XTKcjrNETH
 nFJXMotdwRO+5oj9PQ6k1cWVPzjt0GzawtHVl+tmR0HfBSG3Zwb86YmLx
 u0NemnCy2eTpx1XFNH6GEaeIguocR3DF9cBKYha/auY/0lmtjQW1Z5tcy
 XGjaAAb6idekE/MSDpe3dsmrOj53OKmB/fB0r/8d6YUIceNTDL+ify5Fa w==;
X-CSE-ConnectionGUID: aCCvR8pPTHOE6P9WIHPGtw==
X-CSE-MsgGUID: W12EIBxGSWeHdN/Yq2c3hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="69726966"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="69726966"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:10:14 -0800
X-CSE-ConnectionGUID: pE8Zx4eBQmaDzoKFBsA8YQ==
X-CSE-MsgGUID: MLWhRW7NTYK2t06ATQBNfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="233290594"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 04:10:14 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:10:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 04:10:13 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 04:10:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fI0LQImPjZcGIHoOoxFH2b5ukEfoCGGlyUJwUQzgJT3USFyI2O+l47aF2WZPCdqSnzxJt0e6PUdDrJJy83AlGpIH2eDE0eTVX+bGoktp8u4zFMWptnKxB+mFT5hgNp513ZI4Vl8MH7aRYPp/BAWV1lBegR+xj8jm0/3QTpxuH9u22qLNfVV7LB3e7fOAXmTs8HunCxnJ/z8cSZXpqaFcHKJCI2Oebj0vWloYWtgXe7FkhA0q33kkryfT/rq00F1bvrXURZCs386IS2PjYCWl/1PqoYmsXXOotNUg8aHUhS0RJpXD4vEYW5pZpSYOcXom8OrTtqzQw6g9LfOsoSM+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neHedEP5AsXVhytIXpf6qhospvosJR9fiznkitcmRTA=;
 b=aX66FAtXGbU1TrldPkStK8meyCqmcgA+v82PkwvF3kC7wvRf7f2dCZAvGPyyPiCn3yHYOJSehAQYi+28uKzi2VoCuv/8ZUb1fdG20tBh51z0ijuCDgDAK+1U7UHGW/SkUESXtuiy02+rDR8ifMkaGqZqvdRvRRuTYW6r3p0TKqKTRRBWnDeXLifASOu78Q826saLMxdwMkE3VcTQkzHVGvzJOkyrDAorjFon54jK/hkVQPluT3kyTnhTxMrK4rS9OxLXvjH4XAc4wmnuiUnJPKcE9q5P5gGMcdrE8FXMeH0oxmz8x/cDzNpPqdPd+9jqqh582X7kvHOD6u1lrfdtAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 12:10:11 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 12:10:10 +0000
Date: Mon, 8 Dec 2025 12:09:56 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [RFC] drm: unwind drm device registration upon error
Message-ID: <oi563j5djez5facxbrmkkyy7hvtb6lijurrebxffqqjfxhjjnu@7f7mrbufdcbv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: TL2P290CA0027.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::11) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e86582-1d91-4175-bf38-08de3652bc2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2xEc1h6UHhQcFZGOUR2VmpjdmEzdmNqd1lqMVhqQTRzTVNaMGhNZEE5QXRP?=
 =?utf-8?B?SXhYUFlsWXlaWHZiZ2NjRXovQ1p4MmlTKzFrZ2M1TXI5ckRhWEpsRVVzVE05?=
 =?utf-8?B?SnNqTzZueU9OUWRGb2c1OTBBQ2REV2J0L0R2Z0pNWjhOOUNCbUUyVC8xbC81?=
 =?utf-8?B?VTJXTkl2bDJGK3VzSHdwcWNlYnZmb0R4b0VLenl5YmJ1clJFbC9NNzlwcnhw?=
 =?utf-8?B?RVRTZlhvaWs4cDJoQnovenhIYUliYXcxcklxQWdpNzJ5MjlFSUNqblRWbEdY?=
 =?utf-8?B?bUU1WGZOWXJWcmRDL0hRZTZJZjNkNU40dEk5WU5qSHArZ1ozcjMvUXc4Rk5t?=
 =?utf-8?B?blE3OWZIYjE0L24vTzFBMjUvcjhFVThrQ1VsUFZ4MWVSWUtldGVaQUFIekhn?=
 =?utf-8?B?bWlyNmdpVVd4VXZVLytEK2Nudnd1a0FZRFRITkxKc21LSC96cFBXOHN5M0hu?=
 =?utf-8?B?TU1aNjJXTXcvS2JrUEtGUWZFcW94U0wrdXA2a1VJdXlBbGU2ZTRoUTFST3Nv?=
 =?utf-8?B?aGcyd0RrS0Y2N01vdFRGRTVVSjFpd1FrcG1FWlFxUy9Bc0tLby9jMzBJQmFo?=
 =?utf-8?B?dVhnS3lFWmZMWS9WbERxby9GaS9hSHV0UnlSbDhNb2hnejZhUVlFamJ6VFVI?=
 =?utf-8?B?d0xnY1hjeWRPRGdMREswZVNmZnJwUnBwcFNZWXl6eSs3UDFnY3o2ZGFMbVBQ?=
 =?utf-8?B?YnRnVUJxUExlZVA0K1ZudUx4UW9YT3NSSGdyQldFWExnZFhYa1h4bFY2TG82?=
 =?utf-8?B?c2RaZHc1RVlGUjh3QXlIeUgyREJoZUlzZnJFKzcxWkk2emRSR1g0Q2pKN0sw?=
 =?utf-8?B?d0dINmtjR3NFUVJBVnhLTm4vTEFWRkVUVm1WWkJUUjcySWVTOVI2V2xVOEo2?=
 =?utf-8?B?UlhtL0N1YjNVK2RmaGdrcXN1VjlHR2syRmc4MllYbXZmLzhDZ25lOVFmODBJ?=
 =?utf-8?B?WnhiRGdMdnlqOUFNeGl4UzFXSXB1MFZYMUlQVmFCVXFWWlNjQnRCSnp0MGVo?=
 =?utf-8?B?WGx5S2I0cUVuQXMybjI0WTN1MUtEdHVpZUFkYWd1ZytCM1FQVU1WeDNYcmdn?=
 =?utf-8?B?cXlobno4bDAycGJyL3JiWGh6dE5iYjRJekUzNHBpTXBtMm0rUUd3Qkw0VTE1?=
 =?utf-8?B?UmZLUTZXbzVwYWc2Y2xydmc1blU1TTdHTkZhWXV3dldHMjVETzZyRTRKSy9I?=
 =?utf-8?B?dnVQVHE5c0VOYmF2TUtGZ2x5bGtKSUVsWFZNbHArOUJRYTJyNVZpNUR6eThL?=
 =?utf-8?B?NktHd1E2ZlFYWUFnSHptd3lYOGhtM3NkY3d6Vm8rbmtiQlA0WEVtZk5jVWJ3?=
 =?utf-8?B?ZzhWZ2YzNW9GL3V0akphMjZGTmtSelRZRXVVUkd0MVhpc1hsR0RrNnhud2E4?=
 =?utf-8?B?TjlIM051NFJKYzdoTkMvTUk1T2hML3N4Rmw0UjRrak5QeWxleFRrZkxud1hZ?=
 =?utf-8?B?MDhleVZjNktwcEFoQTV4czdGdUdzTlFLaXF4bFh2VDZFRWNnSCtWbTlGWFNG?=
 =?utf-8?B?NEc3VmNxVTNDa2lMOVp2cXdxTUdjREN0clM1aFdvZHNXY2JtcnI5eXBaTUdU?=
 =?utf-8?B?NzhyaVpJOTVXMDRJTzNZazQ4eGF5REpEOVY2M2tzalhEWEdYU0pwRTVRengz?=
 =?utf-8?B?dWlBbmx4OUZwTFNsRmFUdnNvYS9KMnJVQm42Ylk1dmxrNUV6M0JZbG1jekhw?=
 =?utf-8?B?QytHL0dUT3F5K3ZJeUVjaFJvb0VGcUlkeHJSV0NHYnJCNnZuSjZGeUlKSDVI?=
 =?utf-8?B?dloyM0VXUGZ3Y0hwUit5OUhUdDJkWVA3WFdHa3lhTlV2N1I4dG5CcHlvSmYw?=
 =?utf-8?B?bFA5UUNNbE9uQWdwemlnR3lUUVU4b3hjc0lCTDJNVnRjTDV6TUhwczFXbnV4?=
 =?utf-8?B?NGhrQ2ptMjFGWmxrUTB6NnNhUWtaVk93MUVkWkJVVWpObnJLRXdGZnptRkcy?=
 =?utf-8?Q?6P0ScU+qFN6Qo/RJ+FZiS1PgYa24ZAXf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2kxSXBXMCtpSVBsd0VvcGRDajErQmJvY1JWNCt3cWRDNEQrVm51bmtYN1VO?=
 =?utf-8?B?RUJ5TkNhNXloRUhwKytlTnRBYU5nb1FYQ2QyMEp2Q1dHYW5sUWZrQWkxbjFH?=
 =?utf-8?B?WVhZZDQ2M3gycWMrZTlHdGl4Q0xwVzFPK0lJdExUNWo4b0o4QzBuTWlqTGJK?=
 =?utf-8?B?dTJUMEplSXBjVjlkclgwZlZlNUhpWVRWMVJCZ0kwNWxKaEFtcEtZRkU4SHBt?=
 =?utf-8?B?dENlcUhnQXVaNHpnQlExbDNEU2x4aFE5UUo5WmpoRDB2TDd2bldkcWFJSjBB?=
 =?utf-8?B?SmJ0dkRWK09UT3k3UEl5SC9DcHU0ZVlxdG5pcjN0dGZBeVB3YUJYUnIvMXg4?=
 =?utf-8?B?TFppL3diOWEyVGx5eDBZbUFYSFRLTW8wS1JYY0hVZzZESm1iMGtqTGVlQU1I?=
 =?utf-8?B?YUtzSmFnNzZGNnR3SHRWeVVXWHlVN0ppbFpqU0poSlAxY1JPbWJYQlkxam40?=
 =?utf-8?B?ZWx6T0k3Q0d0WllmVGxuck9vK0prZGhnNFJHUGVrTDZLaktDT0t0RDdFTXM1?=
 =?utf-8?B?aU9hZUZubG9GVVIzYjVteDlBajE3MFN1QkliZmFaUGx0TlRTNS8zWUxnMzBY?=
 =?utf-8?B?TDhsanpoM2ZrVGxEb1ltdkE2RWZhbk11VnpLbDgwaWdFWDBEd0xYcGJpdXNM?=
 =?utf-8?B?OWxGUXJjYkM2SkxJT1JEYkNERHRWaXdjaFU3UE8vaUZmWEJmME5Nd3VTS0dO?=
 =?utf-8?B?c2FQLzNNTzBZdHBwbjJidG1hcW9uUmJOVUtpQ2tXLzlrTElMdDFWdk5hekNx?=
 =?utf-8?B?UUpBWmdGT0VpOHZqSFROWjJVUDlhdnpTRnFhQWMvY2VJVVcyNDJYczZnTjRE?=
 =?utf-8?B?dDU3V3NGV0ZLUWJETjJIcHZoNzFUUjZHMXFiMGpnNTJWQzhrYkxTSytkNUMy?=
 =?utf-8?B?R2xKUTZhUFd0a0dPK2J1UjVXK2I1V0pDdUo4ME1ub3VWWEErMVNldWtlN1ZZ?=
 =?utf-8?B?Zm83V2hBQ1NOaTJsYkRQT09kd1Z1dndYM2xHNUhYbjNJWFVaWUk5U2thRU5I?=
 =?utf-8?B?TXFpb1hINHJNVTNPVjFFT0h4aWRqazdUNlZHVHEwcmEvWjYzMDdPcmRJdHNV?=
 =?utf-8?B?Vm9WbTByMld2OEo3VVFMUkxTeEZzYjVIMkgyWmIvWDRiRHUvK2xJVHoxbWpF?=
 =?utf-8?B?V290Z2h2d1BQdmQzblJPYUVUZFNaMHRGVUNhcGpMNFA3MHoweWg1eG1GMkox?=
 =?utf-8?B?QVBlSG0wcENLT3lXL2xabms2RUxPbnI3dkp0Rlc2bEFoZERJYkFvTWxjR093?=
 =?utf-8?B?cThkemNCRlJTbmZTTHpkN21EQWFoSHBkdlFxL09NMHo1Nm9qVGV3ZHFGUTl2?=
 =?utf-8?B?NDBkTEVJS0RUdmF1Slc5RHZpVm12cXQzM3l2TDJzQWJMNEIrTFdoZ0RoRVhx?=
 =?utf-8?B?dzNsWHpsZzJXTEtoS0c3SDUwSFFuYTBFb2NZWG0vUGwweTgxWmprSElTSHBi?=
 =?utf-8?B?VFc2Z3BCK3pEZmQ2QmpQNjlXSkVFWVFmZnd4RjJtM0o4elVsSHlROWdNMzYr?=
 =?utf-8?B?enBJMFQwUklBSUdTMXVuU2RpVWlZTjNvZm5hOWtKdXlLdnhvV1hoVHNCTDJK?=
 =?utf-8?B?cGFZZDBjdFlLeEovWHMxZzRHVkNTV1A2amIwam5JY1M3L2wrd0tjTjJBMnhR?=
 =?utf-8?B?MThFcXRzYkZtQmNmdER5a0JVTFZ3RlhLUVhzZWNiUTlxNm9FZGI1bDVWYkJE?=
 =?utf-8?B?eDBkZGZvTk9TTm1NTWNPcnhDSGd3VWxUeDRSRzErVGJKQmpYbDFsVkJBcmVw?=
 =?utf-8?B?RVoyY1BoZVd5a2JRRC8vZFFOWkcrY2MxejByOEJOMENSNlNJNFhDc1Y5R3BG?=
 =?utf-8?B?M0ZHNUllVkx2a2VYcm4xWDlQT3RRbzRGYjFDN0xFMVFOK0xhUkJUenFod2FP?=
 =?utf-8?B?eW1YdmpiS1FJZWpaT3lDanFHL3hYWFV0WjNTMTdMQWRVSnlBZCtLWVYzbTZI?=
 =?utf-8?B?ekgrNFFGcmNQaURKZGk0WW5pMG8rVnhISXFmSm9kMFlmWDltaTdGclYyV1JJ?=
 =?utf-8?B?RU1YdzFZSGM5ZERpQ2d6V1c1SFR3TFFBUno4NzNoYUQxQkhmSEFGd3FVNFBI?=
 =?utf-8?B?blhWekd5T2IvNHFrK213Yi9kS3BMV3lHejNtcU11TzNMRy85TENNWGtMUWJ0?=
 =?utf-8?B?akRNeGJkaHFORnVPR1hLaU8xWWlGYzVYUkZyQUt4Wldjamo2STNIU2RRbXNN?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e86582-1d91-4175-bf38-08de3652bc2a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 12:10:10.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 74vMzZi2AShOiML0bDGC4vNH0MHoeMV4cVkjlIfSIz+Xc1lg1e2Vw6Q/UrANN+EHRIJ4qs5bP9nftM1I+RNUnH4CK1rrGA4SwQ/vVuVIdB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
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

The drm device registration is done via drm_dev_register().
This function attempts to undo some of the initiatlization steps
under err_unload and err_minors labels, but this process is
incomplete - debugfs entries remain and the dev->registered flag
is still set to true.

On the other hand, drm_dev_unregister() tries to tear down
everything that was initialized during registration step.
This is confusing when considering a failure in
drm_dev_register(), because not all steps will be undone
before returning, so it is unclear whether a call to
drm_dev_unregister() is a requirement or not.

What is more, during the drm device registration client sysrqs
are added only when drm_dev_register() is sure to complete
without failures, but drm_client_sysrq_unregister() gets called
every time during drm_dev_unregister() and prints warning 
messages whenever the caller attempts to clean up unsuccessful
registration with immediate unregistration.

Amend the problem by removing debugfs entries and setting
"registered" flag to false upon error in drm_dev_register().

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
I noticed that some drivers use drm_dev_unregister() whenever
a call to drm_dev_register() and many do not. It is also a bit
confusing to me why drm_dev_register() does not completely
unwind all the initialization steps it performs, which leaves
me wondering if drm_dev_unregister() is required on the error
path or not.

The WARN_ON introduced in 6915190a50e8f7cf13dcbe534b02845be533b60a
exposed this problem, because previously there were no
notifications from these functions, so I noticed this mismatch
only thanks to the warnings.

I think the other way to solve this would be to require an
unregister call for each register call, but that would mean a
series of changes for the callers that currently do the cleanup
in their own way.
---
 drivers/gpu/drm/drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce..a502110696a3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1119,6 +1119,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
+	drm_debugfs_dev_fini(dev);
+	dev->registered = false;
 out_unlock:
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_unlock(&drm_global_mutex);
-- 
2.43.0

-- 
Best Regards,
Krzysztof
