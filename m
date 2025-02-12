Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75E8A31DB1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 06:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566B510E7AB;
	Wed, 12 Feb 2025 05:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPIqNOo6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEB410E250;
 Wed, 12 Feb 2025 05:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739336674; x=1770872674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wPHB62qHO0fGEG8T9pEONGBz3yPqMQ2/z+yqvS/bezo=;
 b=iPIqNOo6umPknIfDyyexCDcfv6sAgSq5o+95/Kzjwws8dRz814V4ZfiC
 PE7w4GmMYo255gRNuDoMLwdcVyIry/4qhE35fxlKvTLCOP6zwq/FzWpDk
 786tgs18Xwpujk0HSOYRx299S+YENeD9B+l63t2EGMzhuKg3U5z9XVtyU
 vQafsnSdzmGuzNRkhVn6Sgpodv70UShuh6KEKQQqzbt6QU9Kyavf2/eF6
 BDi+wmUMoG6GHRGnxadwCKJGp8wSNz5vOq6d7Wm524iUU5f8KViAM2AMO
 99IwOCqkxMJsHZygDAo9Sa9n+XQJe2Iq3GhC6Nwl/0cEY4tafz9vOn3pS g==;
X-CSE-ConnectionGUID: XkIhIPveRcmAcAEL8DZBaQ==
X-CSE-MsgGUID: Q/qNCz+9ROeMI8HMOQCN8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50612967"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="50612967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 21:04:34 -0800
X-CSE-ConnectionGUID: HIMkh8wHTc2WPKiRMLz2gw==
X-CSE-MsgGUID: fp6d8RCyTk2Y5INFN6FnoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116796155"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 21:04:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 21:04:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 21:04:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 21:04:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDQHdowQnZu5+fFo2FJDAljM3eIaRW4+kZ4vMZXK2zQjO0IdD6SXpKDv7McYgc/8EryEXuiS41a7Pej+mtrrlOMoji8ao0/n8yD1DeGMQEUbC+V9q76Oqnt60MIHEdVifkhVne+ubYYUkFVDS7I6phmMwFgc9BiWUjykgOZUd5siQlReCVWzzvzBXFriuK7L66h3AaXcEFptxbsQMgKs3oa2W1TgV5JVjhhSz2tm5avqhSgG+e57Tuea+l/O29IfFIOVZU8SjivWOYBwawPFnuo3bQ9X6Nqnty9OzCri9SdxvTSMsOqGuffbaazEiAZgaix6OaLjnWFM5rmOX8wPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYlLkc1Uq9+PfS/Z7whpAmBZRVtcdMqGkd7Vtfj8C+s=;
 b=SPXnqn0IJQXmlSmYfagk7y3y5JAXFuFVyZNhA1QADsYUdeIaF4+inuYdiXkHMsIVjooDFLO9jKsKTqzmMiqNdnLmzJ7lxDO9ni34yC74QB602ty3FZ+yaxTKcgdR0vG1eUuSZDUkwb6IMEZr/b5ppm8CJX1HaJT1qXy+cLiZadbCLglhVpzxtU/keieLUeY+5hm9tJEtx/QUQF9DMTrq6nU85lGONl5KitGLL4mmkBa4QTZuIRyLO1/pLu43ygP6Ty/9nmOor2me6VgPJUDWgj7n7n2t0Yy30BOFze5VXhWmrbHOMf61dYgbV2JXL8bgx/MrLRzQDF1QxXNIkYDGHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH7PR11MB7571.namprd11.prod.outlook.com (2603:10b6:510:27e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 05:04:30 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 05:04:30 +0000
Message-ID: <ed0c1f26-3401-4e7d-a054-4e5c17d924c7@intel.com>
Date: Wed, 12 Feb 2025 10:34:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
 <20250205-asyn-v4-1-9a5b018e359b@intel.com>
 <SJ1PR11MB6129A2E44D50C3B6D79D1D18B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <SJ1PR11MB6129A2E44D50C3B6D79D1D18B9FC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|PH7PR11MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 422772bb-8556-4a25-53eb-08dd4b22bb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXc3MnNPUU1wMlNkNVQxNUlxbndRWVBkVzlGVHdrV1kvVk42Si9jR1l1aUxo?=
 =?utf-8?B?YkZ4bjljNlRPaDNvUElzQzlQK1plUzhBSi9vbzRpWlllRjRFUWdNMXJmTjhG?=
 =?utf-8?B?YktUQ3d6M3R6RlFVekQ3SmZNaFZtTi9XTCtTaU1UQzV1b2lWYVg3STJjMHlR?=
 =?utf-8?B?R2VKUHNodVBXaXJvMDhEU3N2aGcvQW1yaXlaZy9XZXVPclFrSkt6TC9FY1lP?=
 =?utf-8?B?THRURW5OZ3BwNUdEWWM3THIwZ3NQSGZLR2VJSkxWVkU1YU05ano1alI0MlBs?=
 =?utf-8?B?ODMzZXFLcVZtMFQzSVE5Q000OUxaQVJMMDRvUFBPNG91cC9KeHRMR2xIdHJH?=
 =?utf-8?B?amNnMjg3RkxOOWJFZGNCLzJvdU1vTnlHOWNKKzVaUEEwQzE3dFZ2TzBxeWlY?=
 =?utf-8?B?QnMyVnptQytIb3dmakxaSDEvRittaG1qTEwwWC9wZjVRcnFGY2p3M1AwZzNS?=
 =?utf-8?B?YkV5UzlmWXpBMmNNWWs1UzkwbmRBY2FsdzZaWk5teGZoNlk5dUN3eUtCb0Fx?=
 =?utf-8?B?K0lnem9Qd3gwYlFFWmxzUmFORFpNTktuT3RXYnpXUStHYkFBWG5BV1B5cVd0?=
 =?utf-8?B?ZUlpUlFDSlNwc0JKdXplSnZqajV0ZGRWeGdNZzNieFRkY2pJRE5GUVBHcFpL?=
 =?utf-8?B?QUNUcXZUUDNKcHdMc05QdS9MYjhObXdQYndWOG50R2Y4bXFBME8xTzIyUU1G?=
 =?utf-8?B?V3hacUwybzl5K25nY0dPYWR2bk1FUjVqN1kzcnFiSGFMTXptZlJQWWlaL2ZU?=
 =?utf-8?B?aXkxUldrZGd1UTVyTW1MMCtIcmxYU3RmZE1JU1hlUklhZTg4em9XUmIzV2g1?=
 =?utf-8?B?Q0ErbFNQVzVWVFh1NEx6bDh1YmYyWTR2bTR6eFVzamVhc1ZwdkRDMlliY0JY?=
 =?utf-8?B?RU55R3ozc25tTzk0bUQ3d2ZNNDNjelF1NTJLMnVqNElReUV3YnIxTjlqN01T?=
 =?utf-8?B?ckZaQlB3WVZyVTZMTStEeTBOdzNjakVsdTR0cXVQbVlzMjQ3WjlDOXZtbHpU?=
 =?utf-8?B?aEZMWVIrQkE4NitROGJadnQrU0VpVmdWbElJNVFFOEZaMTFGMENDWGxQK0tV?=
 =?utf-8?B?eXFSL29FaytqZEI4SnF5SFVoQVhJaTk5SUZ6Wk12Vmd4T2FpRUd6VHJwZlJ5?=
 =?utf-8?B?YmlVQnN1cTVUKzQ2OGo1TUtZOXhQd3hDL3B6d1g3WlNLbUhlcFlMRFZlTEpT?=
 =?utf-8?B?MDhMbllsNGpjRCtxcW95TDZ5b1k1Y2NRMVIvSTlIV1Ewa1QrczgvN3hVQUpW?=
 =?utf-8?B?TEJZY2JSSDU1TUUvYXU3N2d6M21SOHZrNTQ4VlZDcGFCR01zTnF4eWZMV2xS?=
 =?utf-8?B?UmFaV2pwdnlkbnlEeXdpclk0OUNLNmdaMTBOMGxibEx2ZGFJZnptZWUxNEdQ?=
 =?utf-8?B?MDVpb2JVWVpPd3QzM1dvamJXTGlMekZidEFEOThXc2hhaU1KZloyRko2ZnN5?=
 =?utf-8?B?SHRLTHQvZlkvS2hzVnFkWkorcisyN25DNUlwZGd0Y216R3ljeE9FMGtFbVFu?=
 =?utf-8?B?U0QwL3pqK1hCQ3NBREsxdzNCTjY2QnR6UVJuY0NMRnJuZk9FaWhQcllDdDM2?=
 =?utf-8?B?RnBVOFZvWSs4MXlzdzRmNndlTVE5NW1NNW8rOFB1dXAwZTRDai9rQ2RqdFVs?=
 =?utf-8?B?ejBYYlc2SDQxOXZrcUswZ2hlVit2N2VRZURlNjRpV1FqNFFUQThGTlFvR0Rn?=
 =?utf-8?B?VjN6QmtrK0ZKNm45WklUY0t1U25UQXNEeU9qQ0UwUEMwd2FBdUR6ZjBOVmVx?=
 =?utf-8?B?RU10QjZqR3o3cnlQdEZnMWdNSi9IdGZYbHpIN3J4M2RhS2c1WVA0d3drVGh5?=
 =?utf-8?B?eHNFZWJJNFUwUklMYUtjVGpEbUtMb1VYTzVqb05xRVJuZGEvU05oaEQvZlRz?=
 =?utf-8?Q?d7XAe3Ge1+yBf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmpsOWwzdlpxNUFwSHFNS3pLcGRWSU1wbTI5UC9sejFvWUZZZExmems3d3R1?=
 =?utf-8?B?NElCTU9kVG43YXliNVF2TnRUK2o5cUtNd1NRWGlhSWNQdHVlWFpqY2V2b005?=
 =?utf-8?B?MGJ2WGl1aUJScTFudndvVk15TzZTdzNZNWkwdlc0b0NDeHNDM3F1a2F5dWVE?=
 =?utf-8?B?UHhmdFJpOFM0R0hvNVVuQXcwWkJpazVGdDBCQ2NCa0RjVGJLQkE2WkU4VmdT?=
 =?utf-8?B?eFRNeDZLWitkeE9SU3B1eVdNUWZ3ZS9TTnp0MkJVd0RydDRRUEhzc0JCbDV1?=
 =?utf-8?B?dEVQMlliZFpyUHFrY2xQa3dhcW0rNlcvRlJSWHRkMWR5cUlXVkgrYXhndFQ2?=
 =?utf-8?B?bnVLYUtwWmNUUlBEYk4zNTFYVGlMb2RFdlBvNVNNU2FrbDVVOHoySGlvVkVU?=
 =?utf-8?B?V1Zqb2lzOU5UZngzbU9hQ1htdmpMbmhXcGRxZTE1SmZjUG5NQVJmUU9DMlM3?=
 =?utf-8?B?RlhjcjBYeXZxZWx6Rll6RmI5cytqTE51Y1BWbThPSnI3YVQ3bkpjYTFTS2JD?=
 =?utf-8?B?QTIzYWhuK29Wekp2M0FpWUpMd0l2VlR6M0lrUFlsdWRUdzB6RFl0ZTRaMktr?=
 =?utf-8?B?Y1JLeEpKZHdMZDZtN25EaGUxOEF6QnQrV3RlSXZYT1pCeDJvYTEwbGZibGVk?=
 =?utf-8?B?Tk5RalU4VGUzOWI4MXBHUkxlQklnNVRzcStLVnoxd3BDQlZhMDM3czNDQWZl?=
 =?utf-8?B?NkRUVVVPUFprY0NuSmtKZjAyQWNwQXlxTEVxbWl4ZDFnMGIwaEdVR2VYYmxm?=
 =?utf-8?B?c3l0TDdkelhJeXZpVndJQ3RNMm1PTnF5cmdWQ3cySkZEb2RnKzR6NDFWSlFt?=
 =?utf-8?B?MTZXSHcvZGw0R2lpcXI0ZEJXSXV2MGR6RDZWbTZhK1k3U3JtQVY2Mk85cERo?=
 =?utf-8?B?TzV0Z1ZYVXJFSmdrM0d1QzdDN0FqcW1SSXg2R1hwUk9lYUVRZk1GMlNGTEhH?=
 =?utf-8?B?aUZuT0RuWE5JeVJnd3IzSFU3NUhYeDhpT2xmcGFPM1NSMmlCaTF1OXVIZzNw?=
 =?utf-8?B?SFFpM0MvY0JDeUVWcXB6VWtUVVR5T3A5M2NBUi9aQzBOUVl5Yjl3Q1lXVThI?=
 =?utf-8?B?WmdOYUZlR0g3QmViQ2ovVTNHUUl5eW0ycGtSb1NPK2VEWnJ4US9Rd2FVeXkz?=
 =?utf-8?B?SWJBRytOZ3g4alNlbFJPODQzbVNhWTlyWFRJYXYxVFZ1dk5XR0ZhZVZtdGsz?=
 =?utf-8?B?bHBCUWl4TlF1RElTVHZKRzNwSEtKTHg2TjNOSi9PcVlzVEtuOE45YzlDbW1F?=
 =?utf-8?B?ckVkcW5McDNxdUNobWROaVNUbXhJc3VVL1AxWTFUeTQvdytVZ0h3djNhYkRN?=
 =?utf-8?B?OXFEbUVSMUdqNzloUzJiYmZUWHZYb0hKVEpoNG12WXBMMlpnZE5tK0tTY1VU?=
 =?utf-8?B?NEllYTJaWmpJRzlINHppZVVSMm5RK3lycnRyYkdZb3RKaXdEdm9vTEtHZkxj?=
 =?utf-8?B?ZkZqSFJtNFJjbXFVRnA5c1gvVTB5SWhSMU5VTDBDWXFqc1p2Q2J3a25SL2Vh?=
 =?utf-8?B?TGJjMCtVRXVmTERDOFZiTStCRkFWcHZRbUE5NXc0U1VadEdjRUhJOFIvUmVv?=
 =?utf-8?B?VWFtczNPVjZsMTRXOEEva0xKUlVTMmdUcmduam42UDYzcEtSTU1rbjViZ0ps?=
 =?utf-8?B?a0QrUWZ4U1QvMXN4OWxrOHdKc2FteUJxSVh4YkdRci91NFljUTdNaU1CTHpl?=
 =?utf-8?B?YzhMOTQ1QkY2aDVVZjFuRVZkaGJxK1oxQmRjQnI1bXdWd0MyZ29UczJpcXNV?=
 =?utf-8?B?LzB0NGZsVU1mWk9TQVJyNjA0N1N6RjYvNzcvdCtPdHhyWm1oVE1Tek5HdWhW?=
 =?utf-8?B?OFdZZm5DWGkyZm1HVDh4VDloaHpwb3k0RWFCRFordXJmRVpoQk55Z1AwRXZ2?=
 =?utf-8?B?QkxRU08zSmpqQVJOVnNtVGx2UFd3c25XeVlZWlYyVFRtN2lHTkplWGR1ajhI?=
 =?utf-8?B?UndxU2FBbWJ1N0UwUzlmYVk5UEdXOEM2UnFNamtYM2Q0d3Via2ZDR254WFNQ?=
 =?utf-8?B?VG92WFJtWTc2ZjVqY3lWS2RJb3VzT251OG5DN3pzNVBXM1YxdWk3cEVIcjZx?=
 =?utf-8?B?UmFyREFrT2xOdTJSQzhGb2JGSzV2NVpqdEozM00wRlpWTkZkaitBQXpjTk1l?=
 =?utf-8?B?VHdQRVhNeFR6QzdsY0RwakVjR3hiOHN0SWpCK2FDYUR6Q3VUNUFkNUtqR1JB?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 422772bb-8556-4a25-53eb-08dd4b22bb31
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 05:04:30.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JC8ZR2ofBlQ8gLKVN16kiLp3fYwypPpc0l+c70rR0XJVm3CKq7dJTioQspyi6lrPMi/MvpJp5TykSIe3XjWQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7571
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

On 12-02-2025 10:23, Borah, Chaitanya Kumar wrote:
>> -----Original Message-----
>> From: Murthy, Arun R <arun.r.murthy@intel.com>
>> Sent: Wednesday, February 5, 2025 3:57 PM
>> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Syrjala,
>> Ville <ville.syrjala@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
>> Subject: [PATCH v4 1/3] drm/plane: Add new plane property
>> IN_FORMATS_ASYNC
>>
>> There exists a property IN_FORMATS which exposes the plane supported
>> modifiers/formats to the user. In some platforms when asynchronous flips are
>> used all of modifiers/formats mentioned in IN_FORMATS are not supported.
>> This patch adds a new plane property IN_FORMATS_ASYNC to expose the
>> async flips supported modifiers/formats so that user can use this information
>> ahead and done flips with unsupported formats/modifiers. This will save flips
> s/done/do
> s/flips/flip
Done!
>> failures.
>> Add a new function pointer similar to format_mod_supported specifically for
>> asynchronous flips.
>>
>> v2: Remove async variable from drm_plane (Ville)
>> v3: Add new function pointer for async (Ville)
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_mode_config.c |  7 +++++++
>>   drivers/gpu/drm/drm_plane.c       |  6 ++++++
>>   include/drm/drm_mode_config.h     |  6 ++++++
>>   include/drm/drm_plane.h           | 20 ++++++++++++++++++++
>>   4 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_mode_config.c
>> b/drivers/gpu/drm/drm_mode_config.c
>> index
>> 8642a2fb25a90116dab975aa0ab6b51deafb4b96..dbbef20753f834a85ae9ded
>> 748cff2b3f0e85043 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -388,6 +388,13 @@ static int
>> drm_mode_create_standard_properties(struct drm_device *dev)
>>   		return -ENOMEM;
>>   	dev->mode_config.size_hints_property = prop;
>>
>> +	prop = drm_property_create(dev,
>> +				   DRM_MODE_PROP_IMMUTABLE |
>> DRM_MODE_PROP_BLOB,
>> +				   "IN_FORMATS_ASYNC", 0);
>> +	if (!prop)
>> +		return -ENOMEM;
>> +	dev->mode_config.async_modifiers_property = prop;
>> +
>>   	return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index
>> a28b22fdd7a41aca82d097d42237851da9a0a79b..416818e54ccffcf3d3aada27
>> 23e96ce8ccf1dd97 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -141,6 +141,12 @@
>>    *     various bugs in this area with inconsistencies between the capability
>>    *     flag and per-plane properties.
>>    *
>> + * IN_FORMATS_ASYNC:
>> + *     Blob property which contains the set of buffer format and modifier
>> + *     pairs supported by this plane for asynchronous flips. The blob is a struct
>> + *     drm_format_modifier_blob. Without this property the plane doesn't
>> + *     support buffers with modifiers.
> As pointed out in my previous comment we should remove this line or replace it with something like this
>
> Without this property the plane supports all the format modifier pair listed by IN_FORMAT for asynchronous flips.

Done!

>> Userspace cannot change this property.
>> + *
>>    * SIZE_HINTS:
>>    *     Blob property which contains the set of recommended plane size
>>    *     which can used for simple "cursor like" use cases (eg. no scaling).
>> diff --git a/include/drm/drm_mode_config.h
>> b/include/drm/drm_mode_config.h index
>> 271765e2e9f2da62aaf0d258828ef4196e14822e..0c116d6dfd277262b1a4c0f0
>> 97fce2d719f43844 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -936,6 +936,12 @@ struct drm_mode_config {
>>   	 */
>>   	struct drm_property *modifiers_property;
>>
>> +	/**
>> +	 * @async_modifiers_property: Plane property to list support
>> modifier/format
>> +	 * combination for asynchronous flips.
>> +	 */
>> +	struct drm_property *async_modifiers_property;
>> +
>>   	/**
>>   	 * @size_hints_property: Plane SIZE_HINTS property.
>>   	 */
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h index
>> dd718c62ac31bf16606f3ee9f025a5b171cd1e67..179da19d602ac94cb6eeea3e
>> 6522ae5c7738bb46 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -549,6 +549,26 @@ struct drm_plane_funcs {
>>   	 */
>>   	bool (*format_mod_supported)(struct drm_plane *plane, uint32_t
>> format,
>>   				     uint64_t modifier);
>> +	/**
>> +	 * @format_mod_supported_async:
>> +	 *
>> +	 * This optional hook is used for the DRM to determine if for
>> +	 * asynchronous flip the given format/modifier combination is valid
>> for
>> +	 * the plane. This allows the DRM to generate the correct format
>> +	 * bitmask (which formats apply to which modifier), and to validate
>> +	 * modifiers at atomic_check time.
>> +	 *
>> +	 * If not present, then any modifier in the plane's modifier
>> +	 * list is allowed with any of the plane's formats.
>> +	 *
> This is a bit misleading because userspace still needs to consider IN_FORMATS.
> It cannot randomly pair any format with any modifier.

Done

Thanks and Regards,
Arun R Murthy
--------------------

> Regards
>
> Chaitanya
>
>> +	 * Returns:
>> +	 *
>> +	 * True if the given modifier is valid for that format on the plane.
>> +	 * False otherwise.
>> +	 */
>> +	bool (*format_mod_supported_async)(struct drm_plane *plane,
>> +					   uint32_t format, uint64_t modifier);
>> +
>>   };
>>
>>   /**
>>
>> --
>> 2.25.1
