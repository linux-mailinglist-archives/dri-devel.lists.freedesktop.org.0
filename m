Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11557AF69A1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 07:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6A210E0F9;
	Thu,  3 Jul 2025 05:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7nmhklt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435A210E004;
 Thu,  3 Jul 2025 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751520093; x=1783056093;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wENJ6Q6OmULwENIS65WTcr+kin5GgEar10ALidfEP0A=;
 b=e7nmhklti8UIwg5RviIY70IM/0KMhKEUJEjOcsyEsMnLUSs4BF+Tv8/m
 OBYXbe9acibxsQHzoVtAAbn9570xMkkC3o5wvdNGpPEFWdnEhszY762bg
 6Ocw/yTvJFeGR4jsfE4AV404S0x0J3flkZdcLiKWOWidoMTxdIW8usKBz
 sDAyRUy8XpXgyN++A9DBWKf5BfB5u3ojqs6bfjjjvJEvyyoyJCUEdB6O+
 hC0dtGOM+9M6o/cJRL/4i3W4hQj7c7gqyY8QYVM8cq4dfhdZucNQqZkkT
 Slq74yDCN5bFvRnBPwUg1jxSm8CDAH5vsC9YsLFvhVq7/2XpWKWDRqPH5 g==;
X-CSE-ConnectionGUID: NQ7bNj5RTSGo+J3sji0BLw==
X-CSE-MsgGUID: t2WSW6efQ6Ctb4mMbCzqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71403914"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="71403914"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:21:33 -0700
X-CSE-ConnectionGUID: NoMUeCl6RnaHhJp+YMTaoQ==
X-CSE-MsgGUID: ZaKi3iDJR1qYlTSSJ7P9+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154404875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 22:21:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:21:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 22:21:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 22:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iw7OPoc060++5gchkuuaSlxM5VZDF9nrGvod1wBK2EIPItVympQVatgm9FPXv+GBsvXab5RIY3dyVzHX3xUDtqs34DzmU2kuG7Z0+TwOLWP8OScGbeZfKmUIQwh2ZUdmGKghHwHTYVIlunzzpC7Ud9kF2J49ZcxsS7ganhwTVDwviqJrpmWMSNhp04sRBBrCZoxwQZe1VM2YE/5TlQ758iclj+0V6qNX2P+7RpsEAGXWGzQI8PpDDyigkLSD9jvLIISEY2cYo6AV4fHtJW3if4xVoLZa5KjRzS7lZWbumrfBFfXW1dslAAYIJDqawu1W72x69vsP6rDxgPQ0gHtpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SlA3AuWyPUML8w/DM1g52L/epakyVzXUpR7yY7fUUA=;
 b=Ri2OOzY8NAWM5Gv5p81jpMimjqXMbqTVCsvCAfamPWjpBtMfVmvUyf4YR50mnCux7cMxQ5AeeTwi5hqFAYwYyyUWbtzsrfJZZSV2tLn7SpTkqviThVJjunXiS+A7TYLsfdGW+NfVmjW9QlbMYEjTYx4oudZPw3xxdTX2mSiFD6HdbfEDT9IUWq5J5hvxXZmWEhnpzRlqVaKoSxa08fUlGLQImIxyWDEwif+m9eUP+Mu3nanL98V71MegfS+RMEYWG5MuZPl/4hLNLS+mJJr6FMO9xRMo4VPoMQfg5EY31v/MMJwEfNM/11xlHie5LPLRQeFykN2V/I1sRLFoFLGDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 05:21:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Thu, 3 Jul 2025
 05:21:02 +0000
Message-ID: <170d80ad-a12d-4a31-bb6c-abb8a132a689@intel.com>
Date: Thu, 3 Jul 2025 10:50:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm: Add a vendor-specific recovery method to
 device wedged uevent
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-2-riana.tauro@intel.com>
 <aGYBu-6bAEc1il4O@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGYBu-6bAEc1il4O@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: eec26a40-a75f-4aac-8d18-08ddb9f166ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejcyZkp2blJmSjk4TCtYYzJIWHk1RGpnTmZvRXVlZGd1UUpyM1VtS0VPbldW?=
 =?utf-8?B?Y094WnJ0SlJSL3BjK2trS0lHb3hHZzNnUW8vOHFUdDBiRW92ZzlSdTV3MHVI?=
 =?utf-8?B?VWlia01hbEdpTVQ1WnhSd2NGR1VzMTZGRDE1K0RMUUwxb2VlQTQzeVRqMEVt?=
 =?utf-8?B?OENnMjQxb0RKMHZIeSs5MXdyanYxaVFUdkwvMy91ODE4NzNKYzRQcWVPaXgy?=
 =?utf-8?B?QmhneEtBbmxjVCt3ZGJCbFU0Umx2RDQvdHhqejErb3dXZDdUeXAvTjB0Z3h4?=
 =?utf-8?B?Um1STGxnZHdHNDBjdUplYUxjMzFya2tJSXloYXgxakl5TjlmRVc2V2NrK2xG?=
 =?utf-8?B?bGNYTFVmZ2lNZnBlbndNMWU0TEJONG9ud2tBeGNoOWxUamRlZFJkaEkyUkxV?=
 =?utf-8?B?bEE0VzJCRjRuUWliNXg5cXpSekJFTWJSZHY3T2NCeEpOY290ZS9YcGY1T1VN?=
 =?utf-8?B?R3dITS95VVNlc1lXQmFVTEZUSlg2RHJXUDg3MEFrd0ZyRi9QUnM4ZDJrTkJh?=
 =?utf-8?B?MUxWeTdXaTZZQ01EcTFjbFAwVWJKTXdOTW5qOU9VRitFVVFPWUpkVjd4enU3?=
 =?utf-8?B?aG9Oc09wRjlIRVpNR0hjWjY3eWdQc0NjWHRRcjlBd0UwaVZSdUNQaFp6Q1BH?=
 =?utf-8?B?cXRtY2xUaGc4cGx5SWFLQTIyOEhSWGhQRzYxR2YxMDRjMklHNEVFNVlKTTFT?=
 =?utf-8?B?RmtjUVpCbTZHeTNzeGJQYkVBcjhoMDhocThHZSttZGc0YVRKR1cvWlBQRUpG?=
 =?utf-8?B?b2ZHT04xSVM0RXdSWGNZOFgwallidWJxMDdCaGFkSVdjT2dlbHYyQ3VVMk9G?=
 =?utf-8?B?S1JnSDI5dVlwc01sa3ROOUZMR1VVZHdOSGgwQUltSVc5T1NWaFI1c1JqNThR?=
 =?utf-8?B?NjU5eUZvcEVwVEF6Z2tFNWlYYndKLzlIYzEydUdRenE4dDBhVExtWFc4UVR3?=
 =?utf-8?B?eTYyZzlCZDMxcWM1cVVUN3E0TWNEUkVqTWpkeXkzcGRHM3FaM1lGLzFYTDJy?=
 =?utf-8?B?RzhST08wK3BaVVRjRmEvTXlaS1grQTVTVTJlL05kM2tKT2VLL3NrNDB4TDRv?=
 =?utf-8?B?dU1pbDdmUmZQV3NPSllIVWpPajYreTg3YkVpN040VXhMb1VIazVyWHVmdE1w?=
 =?utf-8?B?c3AxSnl0REcrYkdGcTViYkRpRUhvcUtUbGRWdGUyT0xWeE1XVm4rLzRsVjRr?=
 =?utf-8?B?ZEtZbDJXdys3U0tHMWVuUlI0MTZFOU92QjJPa3FEcEs2QTRLSWNWV3VLdTlt?=
 =?utf-8?B?a3BJcmk4MTgrSkJsK3ZtZW90WGZrS1Z6TDhzTTJSRkgwVmZuV2JDNkZGRnpr?=
 =?utf-8?B?dE5wL1FSSExDWFlPa0hmUUVjcEprVW5KeUk3T3loS3FoWlQ1M1kzR01KZFlG?=
 =?utf-8?B?REx0T1J2NUZmMG5UQ2trYThGWTNiM3BzUlVjYzM0dis3dWV0c25ucDlaVyt6?=
 =?utf-8?B?SkROSjNPREF1WjBXdmFlbkd5TTZXV1M5SFhvNzFua21ZOHhqWUUyOG9VRGh5?=
 =?utf-8?B?MGUzZXJzSjVER1MxaEsxZHJrcmVoVmZIeFc0Y0I2a1hFY1l4aEZsbDZna0t5?=
 =?utf-8?B?aXZaUGxUNkRuVDFjS0oxeVM5Q0JBb1FtVS90VGJKUkFablI5VVYrM01iZlVx?=
 =?utf-8?B?M1ZpK0k0cHV1ZEd4NnpLYmxzTS81eDQrRU5CM05KUW1reUVWeDV2T3UwTFNp?=
 =?utf-8?B?Wkh1YitKakxtZ2xzS00zK3hSZXE5YUVpTExEdjV2MUtFNGJpdFAwQmxZSjFp?=
 =?utf-8?B?bkN2VFJoaDA4SUtKMHcvSzdCbmFUWHBCclRDUE9nbmpOUlFLYUl6dGl6M0kv?=
 =?utf-8?B?Y2IrcWowc0o2RkVpYnU3RlJwandKUDZ3ZENNT2sxcHZKWi81RG1iS24zNm5C?=
 =?utf-8?B?bVBZYnNseWkrV3dGVCt3UkI4OWM1b1RmTVozM1RZdi8xQTI2VUdrblVwYjB5?=
 =?utf-8?Q?FKdsF24fHBM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXVPNFhwQ3FxdWZydjZrdUg3Q2FCTEJ6bjJNVCtWSGNUY3VyUXNCV2V5RVBE?=
 =?utf-8?B?dzRvRWhvWWtseHlWYW1Rbkw0SnY4bWpobURNSmd2Z0JjbFRhcXl0VTF6SHYv?=
 =?utf-8?B?STBoKzlrYlJ6aU4xZWtxVlY3TGJFZmxLSFZkbkJweURUZVEwS1ViejZmTEZs?=
 =?utf-8?B?UkVxTmFLRWUwVjErRkxMb3pRVFBqZFYra1lNN1ZZbThTbGNRZjBYTDFlYjdW?=
 =?utf-8?B?dVJNVDRTUU14U0FGQ082L214ZE9CbFoxZGNYT3NvcDZwbEFXdS90QS90WXZq?=
 =?utf-8?B?OFZrVlF1L2F0b0ZYU0FjdVRJQTVaaStmVlVIWFI0cTl0cEVBeVI4ME9Uc0ZU?=
 =?utf-8?B?LzNDVXNkT3dFdkJIZWd5SHRoMHE3UVVMT0RXNk9iR2VxcHNDTTI4bDZGZlZR?=
 =?utf-8?B?bS84bjhHV0pSRzNXV1dRcG9RWXVENjZZWTJKKzRldUdpck50Mml4NE5oWHlL?=
 =?utf-8?B?T3NZbWg2b0syTkUvdG85d092dFgvSDV2TkJSditVc1hHdzRkb1oxOHpIdGFT?=
 =?utf-8?B?ZUpXYXBpYk92UzVrZmlPMDVPblpXZmZCdFlZWFJGaGpIaTB0ckxFTzg5SXZa?=
 =?utf-8?B?Vys0alkzNGswa3ZCYnhTdTRrcW4zcVRzVC96MWFydmhyUlBkQmJLTUV0UHlx?=
 =?utf-8?B?Ym5DZ09NZmY3cG5Ib2dramhqRUNsZytvejZmd1REdTUrYjdkWUlDaGgxKzd3?=
 =?utf-8?B?U2hxUlA4K2lZMnN3NjJCNVJKVlJhNHd0NEJQamFqOEhzeGdQQ0YyWEtDazhu?=
 =?utf-8?B?U3l2L1FSenFwbHh5Mkp1T01oVVBsTXpxenhmbnVDSkRIbUhMRTJQMEwvdCtJ?=
 =?utf-8?B?U1AwYnc1ODFpZ0pNV2tnb3VSSUtyWHlVVGpBZkRUWGZueEVXbmk4NVpJcDRk?=
 =?utf-8?B?SnBoSUNETWVQeTg5UUVJSmF3MXVyKzBBcGdmdGJtbVlJYUFWcXVjWk5xOWJS?=
 =?utf-8?B?TXhySzZBeTZRdEt2d1Q3UnRxK1FMeEtlNGpENnA4TFV1NkEwTDJiY3pFSFFl?=
 =?utf-8?B?ZFVBdnV4T3VXa1JCQ2hET0ZwWU9vd1QyY3R3SVlQa2g5dncxdXFRSG9DeHl6?=
 =?utf-8?B?THUwV2h4RE9KQmJ4N21oeExYVys5UlBodzdPaTFuRVhRVlVjNXNRNHhXSWZj?=
 =?utf-8?B?aC84VzVseDlSWXJiM3l1dGtEUXk0c2FmRThIM2tSNk5PSVdxWTMvWGtIL00x?=
 =?utf-8?B?U3NlYklLdG81ZkJLeEZsUDU1cnZUaUwvUVk0SVZHaFhGVXNzMVNDeVhranY2?=
 =?utf-8?B?TkZUZEdhR3JEUVVvV0RhOUJWRUFtNEJodFo1MzcwdkQ4SVAwampER2grZTVy?=
 =?utf-8?B?V1VKNmtNTnN2RkV6MHMwZ2VyREZVa2VkQlNXWWVjalU1aVRSK1MrQjJKalZB?=
 =?utf-8?B?ZXEvRUhWd21hNS9LQURjMU1uOVJrSUQ1VzIxK3JJRjBzMGRYUXd5cTNZUi9y?=
 =?utf-8?B?dUJIK3pCV2x5SFMzQ04yMktDRHBYbkZzUldTbEtjNVFXRmRyUVVnMzNHMWh5?=
 =?utf-8?B?dW52RWpGUDVob3N2ZjFGdFJOMkRMUnM3Ung2YUk1UTZLWTl6ODNENWNDeC9N?=
 =?utf-8?B?eEdybXhJRktlellBa3FSUUdYYVVkTkkxdy9rbGFCNXFOTGdUa2ZNc2ZKZ0Z4?=
 =?utf-8?B?Yi9FNzFGc053aEFZZGl4cTdsbFdZVGZCY1dBTWt4WmZVWHdVZWFDNWZabG1P?=
 =?utf-8?B?L1hDeG9PS3VtdTZjNE95TnBPUWlWMDAyWGQvSzFhOVZDbVB3NmpDcUdFL1F1?=
 =?utf-8?B?K3dobmhYT2lRb0V0aWlUeWQvZWJSckFjWFlleXFtZzVCcDBqWHpmUXVOMlZG?=
 =?utf-8?B?V3pjNFQ4LzhyNnZheXN3c1l1dE02QkdDQk9OV1ozNXNJNUJkSFRGWjRrdUYw?=
 =?utf-8?B?N3NKWHo0cDlsS2NrKzNYRGxqMU5qOWgwRE5IU0pzamhLelJuc2JPVGhGVUM1?=
 =?utf-8?B?NGZTRlRqbWpYdExhelIyNXlPZzVESkpON0JCU21JTWcwbGc4bGtiNUx3RUNI?=
 =?utf-8?B?anJhRDZkWG9EczBQM2l1emxzRE5DN3kwSHVGcVVIbU1kcGlXSlFPa1RCRmlD?=
 =?utf-8?B?NlIwVXZIeUNiTDZYQzQwNTBZMGNQWWd3eW1hcGFheE10dkVpS3Q0TDRFUlQv?=
 =?utf-8?Q?VHvnLtSbuQ/0FLaSFbxRz02f7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eec26a40-a75f-4aac-8d18-08ddb9f166ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 05:21:02.5206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55JU+IrkEeW4VrQ1yXq8jnsHSZESZVv+7MTHJQbWTZRZKkc0Fe6hSLhD0jjJJomMn1ek5K48VUPYBnjiaT0eGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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



On 7/3/2025 9:36 AM, Raag Jadav wrote:
> On Wed, Jul 02, 2025 at 07:41:11PM +0530, Riana Tauro wrote:
>> Certain errors can cause the device to be wedged and may
>> require a vendor specific recovery method to restore normal
>> operation.
>>
>> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
>> must provide additional recovery documentation if this method
>> is used.
>>
>> Cc: André Almeida <andrealmeid@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: <dri-devel@lists.freedesktop.org>
>> Suggested-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 5 ++++-
>>   drivers/gpu/drm/drm_drv.c      | 2 ++
>>   include/drm/drm_device.h       | 4 ++++
>>   3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 263e5a97c080..1ea835a3fc66 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -424,7 +424,9 @@ uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>>   more side-effects. If driver is unsure about recovery or method is unknown
>>   (like soft/hard system reboot, firmware flashing, physical device replacement
>>   or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> 
> We may also want to remove the examples for unknown method so that we
> don't confuse users in case any of it overlaps with vendor-specific.

Okay will remove this

> 
>> -will be sent instead.
>> +will be sent instead. If recovery method is specific to vendor
>> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
>> +specific documentation for further recovery steps.
>>   
>>   Userspace consumers can parse this event and attempt recovery as per the
>>   following expectations.
>> @@ -435,6 +437,7 @@ following expectations.
>>       none            optional telemetry collection
>>       rebind          unbind + bind driver
>>       bus-reset       unbind + bus reset/re-enumeration + bind
>> +    vendor-specific vendor specific recovery method
>>       unknown         consumer policy
>>       =============== ========================================
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 02556363e918..c72e5c67479d 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>>   		return "rebind";
>>   	case DRM_WEDGE_RECOVERY_BUS_RESET:
>>   		return "bus-reset";
>> +	case DRM_WEDGE_RECOVERY_VENDOR:
>> +		return "vendor-specific";
>>   	default:
>>   		return NULL;
>>   	}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 08b3b2467c4c..40a4caaa6313 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -26,10 +26,14 @@ struct pci_controller;
>>    * Recovery methods for wedged device in order of less to more side-effects.
>>    * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>>    * use any one, multiple (or'd) or none depending on their needs.
>> + *
>> + * If DRM_WEDGE_RECOVERY_VENDOR method is used, vendors must provide additional
>> + * documentation outlining further recovery steps.
> 
> The original documentation is sufficient so let's not duplicate specific
> cases here.

Added it here so anyone checking the code directly is aware.

Riana>
> Raag
> 
>>    */
>>   #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>>   
>>   /**
>>    * struct drm_wedge_task_info - information about the guilty task of a wedge dev
>> -- 
>> 2.47.1
>>


