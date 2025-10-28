Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A567C1762F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E64210E6BF;
	Tue, 28 Oct 2025 23:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xb0ccN4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177710E6BC;
 Tue, 28 Oct 2025 23:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761694857; x=1793230857;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ufog7xXYMd2Poe31oBJuDctJbGlHzCXVpt2E07QH29c=;
 b=Xb0ccN4SoCSZw4yaa5L7w+tl3TpnOyyHg7DgbxgLbmrackDEs5kmdJvh
 tGGf9vTIZJKn0ofpPHNzY+KRMi93owdUMtQZmGHU3uwxdwhgg7s+c9Mee
 4c4yiHr1DehHdDYLdpxdPYZmr4VPExOgiWOm9AmLgvpzLy15xD6TwNKUE
 qVVG379zIjuyevTHLZU3rcPgl+yvvZuzO3zJ2Zlxj/eAAFTbHbQ1jPJla
 GoEYKKHBAz7J+F7U2U7OOoljRF348Uov8utChhA00v9oV+fE1FCg548f8
 S38dmHzNLjtpPoyb/9yucuPd+Uab/B4xV8kxuJlqzbJguew/PC09kGMuN A==;
X-CSE-ConnectionGUID: NN/+YnieTwuZunBKAQFOdQ==
X-CSE-MsgGUID: vp0rEFh/RdaGmFZ29GOs+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63509051"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63509051"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 16:40:56 -0700
X-CSE-ConnectionGUID: 5W1pgdGXSZym0kZXaGuAIQ==
X-CSE-MsgGUID: CB6NK0T0T5ez3G2ooNUwBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="189845392"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 16:40:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 16:40:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 16:40:54 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 16:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMWjexCaT3CexjGaq93/cpX1eYmzeSadwHYxel4PxwqMokhS6D5CKY0kY8r/Ufp+qkVHa8L0YDZRs3T1+eIeJeUy6ozdUNPp7omNef7kKHuICRD1q8amzW5YYQBGE8TBC4XWZBM4stcTg37Q3+pfHQXzoZuGgsx01iGwb0w+H7xz7nE5M8W1xeiNPkZkTKFN66wwP54XXkBSSv3my7voxfFuVQi2rMDfj5cVItmbVGIiE/uribr145zUK2+P40ttH6GZsxEhryabYI+BTfm0Syl9k86ib63tgK32k5dsA5TRtvHkvdYKAIYmOomqfbtksIRZI37a4VEp9h6sh5X+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7uhXJkMjh7YudgbaxmbRyIHq/0XY8AopE0zBLeNEvo=;
 b=Nhf6Wtea/YqrfqKs0WUDKqyHmJ8TtZnlZ84v+0uVJPkHv4ME8OeMAGLN72aOeXfI7cWlTifFqYm7mVd7d0KZryC5kMM8paxijr+Jz2FxLBVqe2Wu6RqF4Qog8ByfCmso3xXc4ncuui581FD520iEXjZwgSqMqqGG3/M4khO6aKFC8+lCHo90wzoXCIfTlyQQMhpGVolzFEITQscTqRHjH/Cs7YN/+oT5VQvk6BGAd1F8CfTi2rBvZv/TiaKxLsIS8UI9wvuNQzkGeKzejb4UAWE5MHup8R9NMTIjE6sxPH2Go39HSkij/FL1TxjOHEN1HTBhQtb5ZzJHT3+wevHtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 23:40:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 23:40:53 +0000
Date: Wed, 29 Oct 2025 00:40:49 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH v2 20/26] drm/xe/pf: Add helper to retrieve VF's LMEM
 object
Message-ID: <qq4byit4dn7dd4skalc3oatkn6dwcjo27uah46nn5eo64byho4@s4wwacdsgfc7>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-21-michal.winiarski@intel.com>
 <db1669c3-a1d8-47cd-a321-b6cecffd8c6f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db1669c3-a1d8-47cd-a321-b6cecffd8c6f@intel.com>
X-ClientProxiedBy: BE1P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: f39c71b5-04a0-4423-1ce7-08de167b6e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWF3LzBoZlFhUGNyaDhVRXRxUjhuaU5qMDBualdNVVF3SmU1RlU0NDdLZDNU?=
 =?utf-8?B?K0Jjd294TmZpR3QvNndXVGVsa0hpemJOa2twRmQ1UjhnbkUxMWw5T2ZiS0pr?=
 =?utf-8?B?a0xQRy9ZamxDc2lFK1JCR1JHVFkvamdrRWcxaVN6Y0MvMHlrcW9uSHh1ZGJH?=
 =?utf-8?B?dXFZM0VqR1BBcm1PM1pSTGNwa0cvZHczWjFQbnFTelZjZzFSTlJYTWlnYU1D?=
 =?utf-8?B?Q0tVL1R4WWhEMGp1WDBCd2ZZWG1MaDdjS2VWMjF5UUh4VTZxZnFVRWIzbTRo?=
 =?utf-8?B?Wm01cGNQalc2WGpLR2hmd2lUOGdUYVMwWGVwV1djNCtDRWZFOWZWSFdwV2dS?=
 =?utf-8?B?dFpNcGczNGxZTUEvazVQQStqRzlHUysrdFl0N2ZPRmIxay81d3VGYkF0VkdR?=
 =?utf-8?B?MVRJQ0hUM0tHeWdpN0pPdTFwenJnVWxJUTJlNWFTK2lCb3BXVEN5WkEwY1Nt?=
 =?utf-8?B?V2x5UGtVQk1FSnI1NGdNZzZMWjlWMGN3VkdLUmpuWWdYaHVWaCt1TjkremE2?=
 =?utf-8?B?YkRxVmMwU3FPSktxNHpWK00vRlg3L0c0NVAxdVRSdDZQdDZ3bzk3UzYzNXpF?=
 =?utf-8?B?UlNZMFJTNjUycGhCNmw0TVpJbjN3UnducHdCSSs0RHNNcWtjTHN5NjFhNS94?=
 =?utf-8?B?YnlnZnpPamhENTdiZS9LNklFTWw1L1FWUUg5TVh0WktISEJsK0VrYi9hMlk4?=
 =?utf-8?B?NjdRTVdIYkx0OUowcUNKUVhqcjB0OUJINldPZ2ROVFBGMVNmOEhxN2hycktw?=
 =?utf-8?B?NHlVazNuUWQ1Z0VaYVZ3a1JRK2NWNHcyQzJYbTdBUUJzbW84SEl3TXhMMzVE?=
 =?utf-8?B?OTRVbldWa3N6Z1lFamQya1VGcjBwQUJ1ekU1ckRJNVV0dEd0dWxpZEk0Mjlo?=
 =?utf-8?B?NUgxYTVPVUJERHhjMkZuTlFGdVFkMDVzamZQekVkazUwTW5TYlJNOWdZMUkr?=
 =?utf-8?B?anBpeDd2U282M2pVaE16cm9TeFZ1TlFWb2RnOWtvVWRrMlIrMDdLRmxYRGVY?=
 =?utf-8?B?QVIrTXNmcHJRWVBsVHVmcnhaSEJKSitjejllZ01ZUWtvcnpXRFAyWjZDUXVE?=
 =?utf-8?B?MUw2WldRT291b1FTQ2lOVkFQK3VDb0dBNUFFMnZYUFNpVVNpc2dGQ2lhQ3Iw?=
 =?utf-8?B?TW5MeDNFMWp4a2Zxc1g3UkdyazJObnBMa2UxUzI5T3VGRlExNzN0RUZGOHR4?=
 =?utf-8?B?U0NteHgyUS9QZEV4eUJJd09RdTZTZmVBdzV2S2c4S2Yya3o2QzkwNVRvamVB?=
 =?utf-8?B?b0FLSlIyeFB4azluSGtGUUxYdUNrTFFreWtvN3pxMHNkZU9lS21qeC9mTE1F?=
 =?utf-8?B?cnhSSzlkMFZsZ2ZSeXg0SzBNeEpnb0hoeC9CZlpuTmhOOS95dWFiZDlnVjRG?=
 =?utf-8?B?ZnJjQjdwTStsbUdTdWE4c3NWeXlUSzA4RjRUWm40UEd4QmZKaXRubGxiSmJI?=
 =?utf-8?B?bDlReVNsdkFsdUtwT1BZMVhSSThScmVFZEZzdGkrN3NaNktVU25ETWlRbmJE?=
 =?utf-8?B?aWRDT1YzWTJuRkJ6aFEyTDhUZFBEWG5JcXNkUU40WVNkcFVyRGpnNEF3Zmpn?=
 =?utf-8?B?aEhzT2dwQWRDRVpNSU5UT0FmcENqUXh3L0xzZFhsR284dWM3VVNCOUpxZTR2?=
 =?utf-8?B?aFBCdFpqQlpQQkxmLysyb1dFblphRnpaa3Q4VGZJbzMwc1ZDWThtdkNZV1JR?=
 =?utf-8?B?WEYwU0c2MnVnNVpDWTZTK084M3h0a0lnMkQ1QWVEYlV1NWF2aHpmS0hNY1Fz?=
 =?utf-8?B?d0xnVHl5aGJ6TnhmdjJOa1FmU3NzODdTWWhTbnB4emJiWWk5OWFXOUlEOU8r?=
 =?utf-8?B?WEFjNC9VcGc2OEsvalMwSUwvWFJXSkxxdTJvL3YxUkxhaldUemVHdWZzZlhX?=
 =?utf-8?B?NUs5bTVCcmFUOG9FWjhUcFBwUk1ZNUxiQzluSnhEMTNwR3hTNmMrWlFUWDRl?=
 =?utf-8?Q?AY29kB45sxXuMN8a/Q0eEWc4pQ1yhCrY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHdaWUNoQktxMDRRQTBaT1N1NGt5UXdGQkVMaTR0VElFMThMSXpHR1RFZE9N?=
 =?utf-8?B?alBrQzJsQWNpREdBazBMRi95QlRjVnY2Y050U28rWUxocmJZTGpvbW5TWjV3?=
 =?utf-8?B?NzdsS24xeEwyTnVtOXZUMC9KM25FR0RUeDYzTVRBTGgvYVZxUlowb1ZTd0cv?=
 =?utf-8?B?YURvUUVlM2g4WENkMjQ5cWpJelgzMlZNbzFwa2FBY2IrbTBXdFBGaW5tWk42?=
 =?utf-8?B?Q3ZKdmJ1TXJhUFhISUFxYTNJd1MyeG5MMXFWaWlBMGdiT05pUGxjR09wU1Ax?=
 =?utf-8?B?REdPaklYRlFWbUxsS1JVTVI5eXl6TStsa1ZmVkI5Z0oxeEp5emVEVklsMktx?=
 =?utf-8?B?aWc0cUtZa0dxT3hBVzR2aTltaDZCTGJGUGM4K0s1MWJTcytOSmxmbG5NNEUw?=
 =?utf-8?B?cFRsNSs0dDNJVkdnVGUycUd2b3E5NDF6V3B5YXhMbS81N3JyNmJMbWVOZGNG?=
 =?utf-8?B?blY0TWlNNVNFc2NFaGl2em5wcStUbWRHemFUMEJzWjdRc3RKL3lSRVlLb3NC?=
 =?utf-8?B?cCtteFlnZm1TSzc1Um4vcERzQnQ2Y2ZTNnljMXJuY3lBME96Z0JLQnZoS2hi?=
 =?utf-8?B?U3lUQ1E2V3Q2b0FuNVVOQ2d6eEJYM2hqY2pJdStlMDh1akk1RzFlZ1dYRnhm?=
 =?utf-8?B?NUdKbG1NZmtPaTFtNzBYd2toWlhmOHVydE9aMjdSci9zTjVvUkNPUlFDb0dX?=
 =?utf-8?B?WlFIOHFOY25uSXhZaHIxYytCTGJCbWZqaVh3bGMzdFdLalRHc1RKa2xLZGlF?=
 =?utf-8?B?SVJxWnhUdGtIUHdrTy80VE1BN21CWDdCVFFOb2NWeDZ3a0piUlFaRnJwL2R1?=
 =?utf-8?B?Y3YrdytGK3E5UlA4ZzM0Yy9xblE1YVZDaE5jZEpNZFVoUWw5bUlqZFVCS1Fn?=
 =?utf-8?B?c0dnNEFoU1REeU9OR3g4OTRONWlITlAxZFZRMGJDeUZaUVAwZUV4Zy8weWtJ?=
 =?utf-8?B?MVlHNll4ckdpMWZwOFVSemdaOGZ6UmFrUkV4NUtmVmY4STdWcUtZb3lDNmxY?=
 =?utf-8?B?VUlCT1pLU0hWYit3bWtHVitYdUJGRDEwY3pWdG1jQVNpWFgwT1ZHMlZOdWV5?=
 =?utf-8?B?bmhqMWJDeW1URGJwdm9tbC9HV2VhTFo4VzMrbmVDTFNqWW94c21KK01hNjVL?=
 =?utf-8?B?ZGFES3E4Q1FaUzZCSTV6eWJ1QS94ZjlKSGg2eTVlMTg4L2N3cHNpQ2JlWkRN?=
 =?utf-8?B?T2VpVmlialJSdHE4VW5zQ2tGakpWZEFqQWxPOTlTYnZpRHZ5S0NVR2swQkc5?=
 =?utf-8?B?RDREaGwzRjlxRDNQa0cxQ1R0MXZsUWpMV0FQTGhmdHo0c1BkYU5IQ3grOXB1?=
 =?utf-8?B?YWg2ejZJTUQ3Z2F0dDh2ZUJHQk10WTgwbytkOGtwRzBzdnByUW92ckVLVTZh?=
 =?utf-8?B?dFYwM1Rud004aVpPZHFzUVhFQlNaaitpcnVMcjdnS1l3OEpjQWhPbWxHMUhI?=
 =?utf-8?B?ZHZIVEpjTSt4WlBldkMraVVkSnhCOTRQRk8ybEJmdmlLbE5iYzZsbERDTlVh?=
 =?utf-8?B?RThhWjNJaEcyOTU3ZXFWaWl5bWJxVm9iektBbVhOL05sdjJtdnl4TzZiaG9M?=
 =?utf-8?B?R1VGdlNkTVJNRHVkUUlJQWROTy9NSGxFdFFidWtYd1NYSTJJTkRXdDFDQXo0?=
 =?utf-8?B?ZjlLK0ZXWUZ1bjhaYU0zeXY5NG45dFk1WExTSFpOQkZyMW43eENIdE5INHha?=
 =?utf-8?B?czRacHdtN3ZVS29CaCtDOTJ4dmtGU0Jibm5naERVZlZySW5oL05vYm9GekFo?=
 =?utf-8?B?bDhBcGNieTFwR1d2amx0NERsMGluQy9TUk1NQkpzY0F1cDNZams0Yzh3NGVk?=
 =?utf-8?B?cnpIMFFDMTErR20wSFd2NWt0YkZ1RUg5WFlxN0hJT2QrY3ZaRkdRQXVybzUy?=
 =?utf-8?B?RnNzaXBMZHVmT1ROY09mUHlrKzRxVDNXRzRUM3FoUHZEQ1JYbnlvclpobWpQ?=
 =?utf-8?B?QVNORDdvYTZ3OXZhcG5vSUZ5MTRmVU4vK2htaXk5b200dGxqbUorbFU1MElW?=
 =?utf-8?B?WkZRYTZoeVJDV0g1MEMxT1N6dERtbkR4eDhmK0h1Y01rdS8yVEw0QzdNWTZY?=
 =?utf-8?B?RTZLSytreGlmUHBSdHpSTSt1d3lEQ3FmOUVIZzBsNFFjdE8zRVl0dDlpNEF1?=
 =?utf-8?B?aVlzY2xvaWVNVDJmSEZGaFFWaDU0MGxXSmdPekpaZGRKTmJMc25zZi8rSlFO?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f39c71b5-04a0-4423-1ce7-08de167b6e9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:40:52.9593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHFRkws+Y+iUHoagGm8yIevZnNlWtJBguWcvu9yK3L5E364vRpllVnIgj3WJ8XBm/ncX5MvI8tW4mgtUNENKG/qiYBs5bLLJEdXqhTo29go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

On Thu, Oct 23, 2025 at 10:25:08PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> > From: Lukasz Laguna <lukasz.laguna@intel.com>
> > 
> > Instead of accessing VF's lmem_obj directly, introduce a helper function
> > to make the access more convenient.
> > 
> > Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 31 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
> >  2 files changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index c857879e28fe5..28d648c386487 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -1643,6 +1643,37 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
> >  					   "LMEM", n, err);
> >  }
> >  
> > +static struct xe_bo *pf_get_vf_config_lmem_obj(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> > +
> > +	return config->lmem_obj;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_config_get_lmem_obj - Take a reference to the struct &xe_bo backing VF LMEM.
> 
>     * xe_gt_sriov_pf_config_get_lmem_obj() - Take ...

Ok.

> 
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> 
> since you assert vfid below, add "(can't be 0)"

Ok.

> 
> > + *
> > + * This function can only be called on PF.
> > + * The caller is responsible for calling xe_bo_put() on the returned object.
> > + *
> > + * Return: pointer to struct &xe_bo backing VF LMEM (if any).
> > + */
> > +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_bo *lmem_obj;
> > +
> > +	xe_gt_assert(gt, vfid);
> > +
> > +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> > +	lmem_obj = pf_get_vf_config_lmem_obj(gt, vfid);
> > +	xe_bo_get(lmem_obj);
> > +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> > +
> > +	return lmem_obj;
> 
> or just
> 
> {
> 	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> 
> 	return xe_bo_get(pf_get_vf_config_lmem_obj(gt, vfid));
> }

Ok.

> 
> > +}
> > +
> >  static u64 pf_query_free_lmem(struct xe_gt *gt)
> >  {
> >  	struct xe_tile *tile = gt->tile;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > index 6916b8f58ebf2..03c5dc0cd5fef 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> > @@ -36,6 +36,7 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
> >  int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> >  int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
> >  					u64 size);
> > +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);
> >  
> >  u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
> 
> probably we should block VF's reprovisioning during the SAVE/RESTORE,
> but that could be done later as follow up

Yeah - I ended up leaving it out of this series.
But the general work-in-progress idea was to block provisioning access
from userspace if we're in any WIP state.

> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
