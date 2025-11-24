Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F396C82822
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 22:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39310E263;
	Mon, 24 Nov 2025 21:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bioE+OmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CD210E262;
 Mon, 24 Nov 2025 21:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764019168; x=1795555168;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JrKSR7IfG1pigxwANLOItVabXSoyjc+7xiaJe4InDZ0=;
 b=bioE+OmCO7UoeN8JZFht8JyT2ATyg0LQ2GeR+sDYQ+ixu9nlr58Y1qad
 mB3XWd75RxHn9waYL9c4q8nh2Th3baxJgXx1F6xc9IlCDXP4/9MmPGk59
 E2vkilPQj2q1CnzNbLjKfXDHlIMoBs9gKxjvLMO0cOOvN00uAdudJAAvr
 B+ubsYZlu7AVDm2gQBSZiV9YMpzadOVn1WI+A9VsHwkskcq205moFZvR4
 tcilsPIV93Vno2uIjbXDtFQgUYMQkL5HvcgumL0ahJK/rxxVJFRsMFXjT
 lmwYHG8mQkOapS0xNx+EWXnOyBzv1xUegkzWbCONxYqr58Ifhd6SlAr0n A==;
X-CSE-ConnectionGUID: fL3RbJNVRq+8I2mpiHfSNQ==
X-CSE-MsgGUID: vBQcRzYBRIK0A2byw/wx+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53599146"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="53599146"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:19:27 -0800
X-CSE-ConnectionGUID: 5etkEjY7Qs+94K/nehiIhw==
X-CSE-MsgGUID: guWY9uW7RN+Ku1LdO7ZNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196624492"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:19:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 13:19:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 13:19:26 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 13:19:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgTTggjCqlXaIZFmq2lf/30OHxmlONBcz6HT3px/iLZi6I4XNqn0MBPcFx/TuLdg2mt+FAedIPde8jPdqK5lzfNNPqK4lBjGHbJ+JavQ8+34dD9s3NQg+TI1kcKfJaEPsYU4voP2Qtw2MhAbkB9NW5rx6Wccgtg4vFidas/0LgzZN3rAwrxqzGnr1/Z/QnHiX9m0WJodROSmZorf64quGZJSCzJAtV0GjAeBqv2li11gG1URraWWezaMlfAltLXzigphTtqxMf/X+MLm5j/UziDT5Eda2JlOTZdzojDyHmvzreZIBptlSO9bzls2sdwpTgtYfEeGYgoz9nitY0v8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo0NsGnTAhF1BhY0Dk6X8j6tS+viNXff231RcIjW/Zk=;
 b=IJviCqIzKEnX8QdaIPDZjHAU8XNxG1JFTWgpmNYRYgqPtX7Jwo+UKa9WG2LIRb8C2oMZSw0H4Lmwcurg+nfdMMvOCuRhWWZU6bbugXs6i26q9b235Os86N2j4pkMjMnyATlTBQYK7M/02/vuajHDqYVvJrWbheIhou3jrQjIeHA56IxmGdWLzhk+qbHCU9BbMv0wFvgwzcDyBXa7Ht17Yo427Px1TekIGwbMBug0NRnk7uHYcLCYwCH6f/F+h0ebREV6IG2Bfz4Qknfc+Js46VsRN7WZU+FH1HnxlJ8/2yQ+XIxCso/+F9JOoKwZHTNLI2HNRuTEQB+1BeTfJBHjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 21:19:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 21:19:21 +0000
Date: Mon, 24 Nov 2025 22:19:18 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v5 24/28] drm/xe/pf: Enable SR-IOV VF migration
Message-ID: <nf57kitild3fivbnoldhng6yj4wtsgfsigg25ab6qyq7phrmnh@anot4kknq5he>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-25-michal.winiarski@intel.com>
 <ced3b341-cecc-45e6-bed1-04f5dfdc93d8@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ced3b341-cecc-45e6-bed1-04f5dfdc93d8@intel.com>
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a49da29-7a23-436b-5cee-08de2b9f22d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG1YYklkSzlXcWd1TWJtdk9qRkFIL3M0WThxcmVRRElmRmNzTmtPZmpMYkY0?=
 =?utf-8?B?U1FjNWRmbDArSmp5WndLcEg3a2pDZzlEdUFraWlsdWVUMjNZZmJwYWNLNisz?=
 =?utf-8?B?NzJqM2M1M1M5Z29seWF6U0MvWkpEV1pFOHdDNDZBT1dENGRNMndkbGwwOHdX?=
 =?utf-8?B?cE1EQy90ZHdiTHNHYjg2ekNacWU0K0hsUGxhNlRzUHJFa1FycysxWk0xclRP?=
 =?utf-8?B?YitTS004dFRMM1VpL1lpSWVtTFFzc0dFUkZ6amUwRWNuMkQ1dEpJLzRhbjdF?=
 =?utf-8?B?djduMXZDSHVHdFRPbzZTbXI2SE4xWkhKZFJoNTMxb0VkWVhTaFN0Q0ZFOWFh?=
 =?utf-8?B?ci9XdVUraC9JOGw4V2ZaeWltL1ZXMVVSN0FQWFo0R2svY1RyQmhSRXV6VTRV?=
 =?utf-8?B?bTVsbERlcEtiekYwM1pqTnhUVUltQ3lEcm9PTkFDYXBCSHQ0MlVrbmVpMnZF?=
 =?utf-8?B?a2tsWDlGK00xaStjY2E2NDBFZHVSQWdDZGV2eDA4aU9hNDE0RStVV0dxbHND?=
 =?utf-8?B?UDVReXZWWkhzVUFMdloydlRWdVNCM0pIcFUyUHZaTXI2RXArb2hZeG9LZnNZ?=
 =?utf-8?B?Y1RYZWxKSTVXOFhsVnFleTA4WGlFdTd5QzF6Y3JBdkYxSWtLWi8waG9BSk5X?=
 =?utf-8?B?RzRRUGhmVkpOa21XeFNWSlRsU0xYZWpIM2FuZ2RnQURWc2RjZkw3RVFwcXJy?=
 =?utf-8?B?Qm4rV1BSaGNFdzI1b3hsKytHUmtiWUlKalgzOUV6UFdya3VaVzJjUVkwTkVu?=
 =?utf-8?B?UmFwVDFGbkJJMWNmK1VFQVJpK0h0R3NoanR4RkFDWkhDcVd5NVhOb3FhYmx4?=
 =?utf-8?B?QU93NVF2WDV4TW1vWksvS2QvQUNtTG5ad3JvbVRLSTEycXBxcVczY3AvMDBY?=
 =?utf-8?B?dnBOc05CNjREdkVMRjZJZVYwbXpKd2JrWHFkbkZCSklTdTZQY0w1M0hYZE1z?=
 =?utf-8?B?bXUvTjdLc2JtL291K2MrcGIybUpIWEVSakhKc2pVNnFWcDc3YzZ6cTcxZW5a?=
 =?utf-8?B?c05aVW4xM2RIVmR2dURCelJHMWYwTkJmOHpNSm1MSVA5SDFqWkw2Q2FWN1Zw?=
 =?utf-8?B?Sk9TczVhNHd2ZVpqK1JSNW5CQ3I4cFpRYVNSZUlzM2Q4eGpwWSt6Q081aDBz?=
 =?utf-8?B?MzhvdmU0ci9RRElGdHdZRTdqaWdxaVJyOFQ5Uy9uRUFYMFVVMDhFa2NKS294?=
 =?utf-8?B?ZkVMbzZLSnFXMVB4eEZ5NTB3NUVvVE5PaXRhem9MclRSWDBmcU0xTWVEVVgx?=
 =?utf-8?B?YzFIL0h5MGczMmM2SmJScXFnTUlyNUE3eHB0TytpeExzdGlFcU5Idi9zMGFE?=
 =?utf-8?B?OCtSUGZmMkYwdkFVZGw2MC84RFl5REo5Rk5UUWxmY3hjMVJ6L0NuOGpWbTVF?=
 =?utf-8?B?MEsySEwvRnFiTEhJQTFCYjUrT0hIRVZGMFJWQ1hIMktZdXQ1VmtEczBBaEg0?=
 =?utf-8?B?N2RjajBzT2JDR0lXdDdCTUZjczN1UDMwN0FjL1RPUEV3MVVNUVVRaDJ6K2p3?=
 =?utf-8?B?RUo5NmhCZnVyZmtBUzFuNnk3Y3BBOEEyRy83UC9FcTU4TzNRaW9Jc0xSbTFK?=
 =?utf-8?B?UlhJSnV5Mm1oQ1JHUXpkNnhxd2k2MzFsUVJoenE3YWI4ZW9RUURpQzM1MFZG?=
 =?utf-8?B?Uzh0ekpJL0xPZzJMQ2pHenhNNmNtVEZ3NUNtdjhQelFZZm9MU2x1LytZZ3M1?=
 =?utf-8?B?cVh5dFpkdjQxcmxQaEppdDRhZUgzUDRIQ1ZWdWVCazl1SEp0bTgwOElFcmYz?=
 =?utf-8?B?dVVJYjZ6QWJ0QUFlektsd1d4ekdWVFJFL0RUZk43VVpzbUhDSTB1d3BwZVV4?=
 =?utf-8?B?aWRTOXpsRnlWSWZ1LzNSekNTb0tvY1BjMU9MbEF4anpJMUtBcTlrN0FHMlBm?=
 =?utf-8?B?THhmbk9uODVlT0ZsbW5pazRSNGQrLzZweXUyUHB1RGcyWkJzZkpFY3NlcU9X?=
 =?utf-8?Q?zG0IiHtkH5aiokJv6WbaogO1t8+6v0HO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGFxZXRuNHFyNU1hcHN5Q3hOMUpISEkxWExlUzhXbHRMUERqRjlyK2FrYWNl?=
 =?utf-8?B?Sitib0NOYU5mRXQ2cjJJMlQvRDhwNVl2c1FMdDJDL0Q4eGhPNEhnQkl5ZEJw?=
 =?utf-8?B?WC8wemZSQTU1NXgwTFhVVlZoYlk0NXZMa2R1M2p2Nms1aVJoTGkwSkcrczlE?=
 =?utf-8?B?bngwKzhGT3FlRmVTZ1RHdHdUQzBmUXQ4WkoweEVNZnBqT2dwQW1wcUx3SkN2?=
 =?utf-8?B?TnR0ejdFb0RBUUZsZ3h6R1phajJGVUFHZjRCajBtbkhGZEczbWVsZUE0a3Ba?=
 =?utf-8?B?U0huN1U1eGN2V2x0RkF1SGNJNzk1RTZ2UUtpcEJlQnN6QlNHYXBIQ0YwNk9G?=
 =?utf-8?B?M29FY3pBTTEraC9jUEVHUVphbklZemw1OXVzT1QzdDlIaEQ1OWlBVVdENUw5?=
 =?utf-8?B?QldTVWU1bXkrVmJqME5hMzV6SkQvalpGaDZJMkNhanRwcW5jcFlVRVJEWWZh?=
 =?utf-8?B?bXVwSFU0SXltK2NZL3JmOVpSaG5xSDI4YTRVRHBSbHhQdGxiSFdSOVNLVU5I?=
 =?utf-8?B?NzJvUVVENUM3RzJZVm9jSWg3UWhaTHE0SVNkSHVqVXV4QTZYMHFIc2grT2Rh?=
 =?utf-8?B?My8xelVXQUZXNWtkUTlidXdCaW4wT3BmNUdTZ1VCR2hpbm10OXphaXpiWmt4?=
 =?utf-8?B?cTdSUSsxRWlGWFZDRWZNcVZvWUtOZXlRSndvWncrQjV5OTA3ODYybjlBM2pv?=
 =?utf-8?B?NGlxN1NRcGZZZ0VMYUZCUk0vdW1RalA4Q3U1ekU4bGtxS1JwWVdmcmhmK0s1?=
 =?utf-8?B?Wkd1bjd3b2Q5UUp1ZElGY0phcDdpM29ORlFSc3RxT0NJTmE3eUxoQXhwTENq?=
 =?utf-8?B?c2NsTHNyb0EvekRQMzZQYng4WU56OUZKdXhpVW44WVFqaE5qaG1VOW1BNjN2?=
 =?utf-8?B?eDk5QlQ0NkF5a1VnMS83ZEdHUWM0dEdRQ1JIS1NMVnVwbHZ1QytTWmgybUY4?=
 =?utf-8?B?bTRMSlVjVFpHRnJja2hOK0p4RlRObWFlYzM0YVFDZ1VsdTZYZVBTN1Vla1RI?=
 =?utf-8?B?MDhtUi9adEo5dkM0K3lPbVJjWDJSZVliRkNYbDJwV1RmbkNVcG1pN1NIdXJh?=
 =?utf-8?B?WUVGdENzTXJkSnJLZUpZN3VObnkyNDhpeUFrMzJJa3did0lDRUtTZVYvTDJw?=
 =?utf-8?B?dzZtbFZyUGtheWdEeCtvQnJsMWR1WE83RkRPMTRhWlQyQXZOaERNK21ld1E4?=
 =?utf-8?B?MUExUW8wemlXcGtGTVJmTU5nVFpGUStmVVdTQmpBaUxuOFZhd0h2N3djSFhJ?=
 =?utf-8?B?aC9nWDcvUXlkVGNvZWFQMDY0aWNRYzlaM3lXdFV6ayt4RmdFWGY5cG1WaWVE?=
 =?utf-8?B?QjdQdkFoZnV3R1ZmNjkwWnQ1REZsNXN2TURqU0VNeXJRanJxb1pkM0QzeWNn?=
 =?utf-8?B?TzNhVjkvWmhQYWNtQjczN3M5RUZoWnBrT00ySlhMMlNWV1g0SDFXdWRYRDRW?=
 =?utf-8?B?MFNGKzh1QU5NTGNMb3BGUlFFcW1hWkdQM05JK0cvc3FmR2VuNVZSK09uNVVT?=
 =?utf-8?B?cnhvaGJZZ245WjEzNkpEZFJrdVQvRjJUMEJ5VE9FQkxpM1lqUEIvNjBzNlUz?=
 =?utf-8?B?ak9RaElDOWlyL09Ddm1kZWwxVjk0b0dhTWk4MzZCclFDRm1GSUtoWnJrN3pY?=
 =?utf-8?B?aFcxVm93UnJnMnoyb01hU1EwSGpZQlFPTkQyc3RkaWw1VGNTRDZTRGlEN0Js?=
 =?utf-8?B?Y2xUOGZESEpQNVF1dkh1Zjh6QTFnWmg0UmpNb0J1WU9SRGt1R2FHaWFBRkhU?=
 =?utf-8?B?NU9uVHFFa2ZOQU9URlVKeUJDbWlFejRnZnVBZjJ1TXdxb0tOQWx3YTlJb1l2?=
 =?utf-8?B?YXhmdVlmcW5GSStlWDluRGVOY2V1dGpjTjFqYWY4RGZhV25RUFFaSjVlTnpr?=
 =?utf-8?B?T29Xc2lBL2VEME1QbUJyVlYyVlFJa2p2bTBxcnhDMTg4OU9UZEpkRTNKNGF1?=
 =?utf-8?B?cjM0eGd0MWZrWWl3UTBETFhwbDBCenVLTkVpMlRFZHZtK3psclNnckZBNE5j?=
 =?utf-8?B?NHIvZDVKbVc0RFlBRG44MWUveHRYY04xeXVRRVZ1N1prWXdQL2FybkVoVDlx?=
 =?utf-8?B?cEFSQ1QyZ2VRbzQzUXVhT0Z6UWpKTmMzL1JZQlpOaWg2MTlndmRLV1ZZNXF0?=
 =?utf-8?B?VzdGc05JSm8vd2RIaHdMU0twMXdNdU9xV09FbHVGL1Y1QUhKOW1YUGdrajJu?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a49da29-7a23-436b-5cee-08de2b9f22d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 21:19:21.8575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7I3CN6XAoz2JLzikqa+3JPdlOi9uYCIRV0bGkyKx0CMZpXITQhwu1LxY28DegIbSV64yPy9wShMrLtMf5e9s7qg7uP5z2HKhy3lNaUtB4gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
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

On Sat, Nov 22, 2025 at 07:10:12PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/11/2025 2:04 AM, Michał Winiarski wrote:
> > All of the necessary building blocks are now in place to support SR-IOV
> > VF migration.
> > Flip the enable/disable logic to match VF code and disable the feature
> > only for platforms that don't meet the necessary pre-requisites.
> 
> typo: prerequisites

Ok.

> 
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 32 ++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  4 +--
> >  4 files changed, 42 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 6ad948e96fd45..0a0c3145e1274 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -17,6 +17,7 @@
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> > +#include "xe_guc.h"
> >  #include "xe_guc_buf.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_migrate.h"
> > @@ -1008,6 +1009,15 @@ static void action_ring_cleanup(void *arg)
> >  	ptr_ring_cleanup(r, destroy_pf_packet);
> >  }
> >  
> > +static void pf_gt_migration_check_support(struct xe_gt *gt)
> > +{
> > +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> > +		return;
> 
> maybe instead of blindly ignoring all checks in the debug mode, let them go
> and just in xe_sriov_pf_migration_disable() don't set disabled=true or
> ignore .disabled flag in xe_sriov_pf_migration_supported() ?
> 
> then we could still experiment in debug mode without any restrictions,
> but have some logs about missing official prerequisites 

Yeah - makes sense.

Thanks,
-Michał

> 
> > +
> > +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
> > +		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
> >   * @gt: the &xe_gt
> > @@ -1024,6 +1034,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> >  
> > +	pf_gt_migration_check_support(gt);
> > +
> >  	if (!pf_migration_supported(gt))
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index d6c24bea759af..7dd7625e5aeed 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -46,13 +46,34 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
> >  {
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > -	return xe->sriov.pf.migration.supported;
> > +	return !xe->sriov.pf.migration.disabled;
> 
> 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG) || !xe->sriov.pf.migration.disabled;
> 
> >  }
> >  
> > -static bool pf_check_migration_support(struct xe_device *xe)
> > +/**
> > + * xe_sriov_pf_migration_disable - Turn off SR-IOV VF migration support on PF.
> 
>     * xe_sriov_pf_migration_disable() - ...
> 
> > + * @xe: the &xe_device instance.
> > + * @fmt: format string for the log message, to be combined with following VAs.
> > + */
> > +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list va_args;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	va_start(va_args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va  = &va_args;
> > +	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
> 
> 	"migration %s: %pV\n",
> 		IS_ENABLED(CONFIG_DRM_XE_DEBUG) ?
> 		"missing prerequisite" : "disabled"
> 
> > +	va_end(va_args);
> > +
> > +	xe->sriov.pf.migration.disabled = true;
> > +}
> > +
> > +static void pf_migration_check_support(struct xe_device *xe)
> >  {
> > -	/* XXX: for now this is for feature enabling only */
> > -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> > +	if (!xe_device_has_memirq(xe))
> > +		xe_sriov_pf_migration_disable(xe, "requires memory-based IRQ support");
> >  }
> >  
> >  static void pf_migration_cleanup(void *arg)
> > @@ -77,7 +98,8 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > -	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> > +	pf_migration_check_support(xe);
> > +
> >  	if (!xe_sriov_pf_migration_supported(xe))
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > index b806298a0bb62..f8f408df84813 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -14,6 +14,7 @@ struct xe_sriov_packet;
> >  
> >  int xe_sriov_pf_migration_init(struct xe_device *xe);
> >  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...);
> >  int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> >  					  struct xe_sriov_packet *data);
> >  struct xe_sriov_packet *
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index 363d673ee1dd5..7d9a8a278d915 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -14,8 +14,8 @@
> >   * struct xe_sriov_pf_migration - Xe device level VF migration data
> >   */
> >  struct xe_sriov_pf_migration {
> > -	/** @supported: indicates whether VF migration feature is supported */
> > -	bool supported;
> > +	/** @disabled: indicates whether VF migration feature is disabled */
> > +	bool disabled;
> >  };
> >  
> >  /**
> 
