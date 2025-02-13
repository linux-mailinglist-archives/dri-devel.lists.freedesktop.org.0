Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A0BA33E09
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BB210EA5C;
	Thu, 13 Feb 2025 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAAOYtF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA5410EA5C;
 Thu, 13 Feb 2025 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739446097; x=1770982097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s3ajLmE1c/jUEvJZSABVu43EeahTS05CXesWbmYRHO4=;
 b=bAAOYtF3bsernBYqvomJinv0nJgxBNub+K3vqXsgULRfeqJbtKibk/ff
 Rzy+GEHSH/3I8zqxRoECFzq/QXQZ3kNkUcnupPRMiEJr1nsnqGWC94Edi
 jqpecOWwmWVw95h8BbCMZ13e+inTD80QWxk9mVyjjLWXttGGfOjAk+hnR
 Dkz+XHaI5fm5xi7coHWCdDAYy+VaEgSKPFMgbXTfcBaV6t1h3T2PS+TYy
 86wGyajlta6tzlEB75WXLA63U/jD/uHyUHLVbhGwG4Gg2j21csPOMdRoX
 68GHRQkOFDoeAEURh49k2Gjf5WqtGeOOKvRm3aryqvzw5tg9jHalAyqN1 A==;
X-CSE-ConnectionGUID: ZjjHIEJ9QOO04pbFCTbEKg==
X-CSE-MsgGUID: tT9jQv6ERiSxXrXYT8v37w==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43793790"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="43793790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:28:17 -0800
X-CSE-ConnectionGUID: YWtA9XcERNGXtVBBzaaq+Q==
X-CSE-MsgGUID: yJeafrQxSdSWk8F7tjXGNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117229403"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:28:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 03:28:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 03:28:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:28:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNnclk7t/eqS0sufKIrJj6Vles3LK3TR7xdPRZvsfckcVBpySYb2tR80M4dcMtn+r9dedE//re00zxpGrtGuNnjhaS1BMYms1E58EEyYVQB3p0Ny8h6Nhr2trrkdv2NWA535kXr1anvqjZrd95PC2qrUEve0RFq97heK9dLBqfaoLkMuv1Jmja41aCyrO+ckdAmLlV7dD/GLytGV/MdxdbOIGIksAnvpar4U+4O54zZwfzeh847oPWQXU0+4yeEmlzoVDwcL7UQbz1UX1V+KggLFrSZcJLDneFEF3aIictk7+M37Gz62khEQMIpyD/ZSRrjgGmVo4lcJneIj3+Jp/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeGpoTOoAc8xNIDX5+i33d4Dx4NZ9wd+OisZ5+sb8NU=;
 b=YnG2yE/9anzf0zpjrMSUOcTodth1l7kHkPZOi6n2luRtuahYIT8OaLcxSIGcaGrYMa0UNXXruRrxE5yP8A65/kf3YeeYTmrfWscGfCLvuiVCkcJpFKJTGNC91n+VALzAIBwJS6ULFcTzeKFKVr0uNRoGy547yb8LNXWH6glPwgOv4EYHCUtWT8GsVxniuxyxS6Z9JZBkWff1V4dVOGks0aFZZ0vuYu1wuiUrnlowIOZGfOHqUdpI7Yv2xhUpFyUXAb9E7YaB5qmUdkU9G2TQc6CHJnepPkM40Q9XTUQKwuInvioD3gbN8dNsWhajziMtqySRnQW2WynfefXktUQNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.23; Thu, 13 Feb
 2025 11:28:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:28:08 +0000
Message-ID: <306b4bad-adb0-4125-8694-41b75df87f00@intel.com>
Date: Thu, 13 Feb 2025 16:58:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/32] drm/xe: Do not allow CPU address mirror VMA
 unbind if the GPU has bindings
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-18-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-18-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e2ebfee-652d-4b09-a652-08dd4c217d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YytpZzFnWGIxeFJBQndhcEVwK3Y0Ti9vMHcvSFpwTVlGNW5lRUJpdVFkMzJl?=
 =?utf-8?B?cEt3TThqRTVXZVJTdytKNXc3NitZeVpwU1crTVFEbGIvR1cxWlpJT05UbVpy?=
 =?utf-8?B?UXBLdk5mQ3ZmR2FwR1ZEUFJaMEtEZVZpbFo1RFZhc0dVTHFBLzhSZVhCNGNZ?=
 =?utf-8?B?TlY5R05saC9pZ2tFVTJSWjZnUkFONWRNNzJmajdKamJsaG41ajd3RDNwWWhV?=
 =?utf-8?B?SUhQTk5CNDhTTkJNcDB2NUJvZGhjMHNRNko4ZDQzZVdTTUxEeGlPYUdDamRV?=
 =?utf-8?B?SFZHdUtGK3QvVzBaTFE5UDlJVEFyQldtOXRSMTFyT3paa21HcEdYaWE3Wk5S?=
 =?utf-8?B?amxTbHhTdnJid3d2UzdpMnlPeXVBbFo0WTZCWHhQUllRMXBORDMwbSs1anJO?=
 =?utf-8?B?WkswUmdtV0dHMS9CT1g1K2lJYU41OWhsLzBrL0ZlZGRwZ1hvRFZWemtlaldJ?=
 =?utf-8?B?UlNWNTVKTGVyR2huUExjQ0RjTU0wMURpdmlQeklwRHJ6NnhCU1JlcEtMbkRT?=
 =?utf-8?B?TXkydkR0YXl4V3F5QzRTS2QwMGl6VGt3UHpuM0lXZ2ZlRWpENVB6U2V0NGhE?=
 =?utf-8?B?VWJHZUo4R21Qb0E0NkdtSGVJcWQ4Q0NPTkpkS0xpbnc3YTI0MjZ0SWZ6Tksw?=
 =?utf-8?B?K29UVjVjdTA0cnE3NXUybWpsNStlRGl1L0JnTS9ENjk3ZEptSHVhcWJZZDBX?=
 =?utf-8?B?OVZXa29JTzVHK1pocHFGMUpuMWxMeVRTcWg3ZS81MEIyU3ZKa1BqU0RXdzlq?=
 =?utf-8?B?ck5YckVsSUMzSWpWbE1vRFgyZW5BSm9wMDJybFBscEw0MzlTNDBOdU02TzM1?=
 =?utf-8?B?RC9ib2trcjVRVXlxS3JxdElWcEtrdEVmcFcwNW53TGI3MXBmc0VkaFpSZDAy?=
 =?utf-8?B?TFVRV3I3b1RqTFcyOEhjbE5OTW5MQW1iSmRFTGN2a0tyZWdIQ1Y1MXJld0tU?=
 =?utf-8?B?Wm8rL1M0RGMxcU00WnluWkw4LzBzWFlMbk9HU2JxV0psMGswM1k0REczN3ZB?=
 =?utf-8?B?Q3BocDJSblY5MVhhNW9qVWQrZ2xEbjFwVlprSDFJMFFVNktDWUs2TFJHQ1pI?=
 =?utf-8?B?K3QrQTkyU0FSNVN3T1dpL1BMMmZYbHdJTGxxN3k0b2ZtR1FsVkt1V1J0Vmdp?=
 =?utf-8?B?RjlVZDVaVlErekJSTDhGWHBDRjRFRTFUY1duWGRoWERvVlpPLytPZnc2Skxu?=
 =?utf-8?B?WVhzdWhreDQvcDh2dmxzMy92bVlhZnNvdlJkNU9ieU10Ulo3dlNyeWY2Z3ZL?=
 =?utf-8?B?eHJYTDNFZkNqZHcyUlE4MDF6WmZvQlZ6aEJTTVRYaVcrNCthSTV1SUZKZjBt?=
 =?utf-8?B?eWhHQzg4T09NdVcvS0JMdHB1RHRxcU9yalFIRnF4TlZ0YURlYUhYakF2S2wv?=
 =?utf-8?B?cUNyaG1zbFBwVGMydUxqbVMzTTIrNnB2NUtseDlLbWszVFNrQkl0SFYrOHE1?=
 =?utf-8?B?ODR3MDJabUVCdGVEQ0Z6aEtlOGkzOVo4MExudzhSR1daUlNJMEdIWDIyVUE1?=
 =?utf-8?B?bjBPY0d2NThJTWdxTm9zLzZtaE1JbDZmZzVLWmg5Unl0YXZUcmZJTlgzamRx?=
 =?utf-8?B?TnZXSUpCNHFYYjVnb3cveDhBNFZhR0J2dGJ2cGFqZWg4b2dTVmFkU05oSTNv?=
 =?utf-8?B?NXF5d3pDbkdsZmR3bERpL0U2U0xhS3BLU1I0RkJ5Q2U5VENvSktNWGRDNEN0?=
 =?utf-8?B?UCtjVTczTGxUY0lTYnhPaVRFeUg1Zk8yazV1dEltSDMyMGdQWkFRRnFYdHlV?=
 =?utf-8?B?YmZQU2IwVmc1L01WdkVjRnJkQm1lRERTUXF2T3JKTDF1Z3pzSXhId0tzNE1R?=
 =?utf-8?B?cDdSOTNqZDlvRDlvNm54TEYwcGRudTdIVFF0SnRPRC94SUgvQldRSXF4WmRn?=
 =?utf-8?Q?8KM0L5w3RpapF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZyUDJ0c1k4UEFuMVJCZko2WElZR01VMmZOcFYvRTltVGlRRjEzUTZGS2Fv?=
 =?utf-8?B?V1h5TkRGUnExN3Q4UzJ6S3VtcER2ZUJsNks2di9KaFNiRVEycHB6Skgzd3M1?=
 =?utf-8?B?NXgrOVlhQmtyZEZtVHRCUWtQRmpZUGljbmUyT2ZZVC91dGoramlPZ09FbXNR?=
 =?utf-8?B?clRLK2hRYTdna1lhNURJVk8ydXh5Tm1zRXNvR0tHOXpHcDFuQVFXRUE3bG9F?=
 =?utf-8?B?azZmVFRNS3ZiN2w2M3oxcUJJK2t0R3hkOWZ1RlZSemRzc3dzeU1xejk3bmEy?=
 =?utf-8?B?aTl2MmwyS0liQUExZWdhQ3dYdVgvbzNORkRMN3YzVmtORjkxU2g3UnA4YmlB?=
 =?utf-8?B?QjlEUTc3c0xUbFBjb0FhbUJCcGVGQU8vTFBpMVpnemxSbVp0UHM1YmRuY3Bp?=
 =?utf-8?B?aFVhazd6UkJOUXJJeEIvOUQ1RDhUY0pVRzVYdFpkNWdLV1E4ekY3ejNHN3ZT?=
 =?utf-8?B?TmsyNnJSK05pRVFwaG5iOXJnM3lEVUdad2lVL2ExakFvaVI3WFVJUnlHVjVt?=
 =?utf-8?B?WFpsQnk1YUUvOFJRUHRVaDU2T1NIZmZRMGdtMUdZOVhsVEdDbWNzT3E1cFR5?=
 =?utf-8?B?SzZkMDd3YnJKV1gyam1rK0Z2R3VHbnVXU3dreHI1UHdHSWhsK1BLSHl3TTRo?=
 =?utf-8?B?aXZYeG9xQkVyV3dKbnNzQUFHQ01XZ0Z3MDRoSjdEejZaa20xYnhNRldTQnJY?=
 =?utf-8?B?Qm40S3JBM21Hd09NM0h1NDh3Qi80OG16ZWlCdG03L2NNK3VqV0ZyaXZjcXFJ?=
 =?utf-8?B?aFJPRS9ISnNOR0ZXUkp5emU2QUh6eGl6b052VHpFa3JYWnUwS3J6Nktoak5X?=
 =?utf-8?B?RmNCSlBGWEd4bzJDOThyTEFmMWN6QTJ4NUM4TWkySHN6QVVMd3NhUm5XNEIz?=
 =?utf-8?B?TWo1dUJMTDdZT21OazJPVzFVOGsxQmdWd2Y1VnAvZ1F6eUFjVExEOUsxSHRm?=
 =?utf-8?B?WmpWRzNjVjh4MDJ4WFF6STE4Y3NxM3ZFMk5pWkZycE15OHdkME4zb3R6WVd0?=
 =?utf-8?B?MjhOTm5kZHEySFYyeVp5aCtZYU01YWR3KzdVcG5HanNNWklNYzVCMmp2MGVr?=
 =?utf-8?B?b1FBejVNK0FDMEg1OFJ0V1lSUFpqWjVKaHlQRiszMXVkRFJmdXJPb0pQd2sy?=
 =?utf-8?B?cTBLQkNGTkVWYjl0THIrdXVFck9TakJlbWlvNW5WMlNvblB0S2tveXJUL1RY?=
 =?utf-8?B?MlU1S0RSU0ZzZkZ5UWhjbkJGZ1hIOWwwWkZpKzVUYlJmOUhGbU5nVlpYWm5V?=
 =?utf-8?B?QTVSUENqVWQweHFVV2djOFZNcmVvRjEwYmNINDVxdVg5eDM0a09JRmpjZDlC?=
 =?utf-8?B?QWdoMkhQY0oydmJJQXl5UWE2T3ExZW9tbURyaW9JVUpnSU44V2RXcXVXdk5o?=
 =?utf-8?B?UFVGT2l3dkRYS0h2UTdaNUFsbk5xQ2JVNEcyTnVHcHkvNTJCdEFnb0VWTit2?=
 =?utf-8?B?RWtGaWZZTFRYR3Yzd3pNUjlNSXRZazRpdVlsRmVFQmxNQ2FESVkxcUU4dnJp?=
 =?utf-8?B?Z1lXU09iRzE0UWNuRlhKbkcvRDRoNEEyTGZoeDVVc0tEYW5GYVo2ODc3WXR0?=
 =?utf-8?B?M0EzSkdtcVdQcVdUUFZHcERwNGFGWlNzMW5LM3hWclZERG54azRxcTU5RXIw?=
 =?utf-8?B?N1BNSVhKSHpWZUlWTE1aMldzejdaSE9XZm5BbG5kWlRNdEREWDlhYkQ2SVB6?=
 =?utf-8?B?SVZMQ1YyQ2JhNzZNRWhFQ1dyb0x0RE1xVzRJK0FMcFd5K05OQjZSOHBwbU1z?=
 =?utf-8?B?VkVwN2l3Nk1JUVlnQms4N2NLY2g5cnlQcjFkK1BVREVzU28veXZvS3FHMTQz?=
 =?utf-8?B?UWRHVU9KVUZjUmp3UTQ0dnhDMVNnRWFrZDNrU1IwT3NHeXFvbVpsc0VkMW9W?=
 =?utf-8?B?amRtR1RoUmFlb2U1amtORGFGU3U0RXh4T2tNd09oY3J4S3djZTE4aFFUeGFy?=
 =?utf-8?B?Vi84YzFJYUxTNjNTbEYwYzBtYkRaWjdrV29SdzdZSWpRSXpvU2JmbDlKZmhv?=
 =?utf-8?B?MW5HcnZibTE3NWxtc2xiUXZtTW42RUJDNWVtTkRSb2c1b0k5U1FmWU9QZ0tl?=
 =?utf-8?B?cnpkNmhSc2kweUJBWWhFbEZEdDhiWHVyc2daUktoUllWUWE0WGFWZi9vWUp6?=
 =?utf-8?B?TXFGZFFkVlhTZUtISXVWQyt2cm82V3JZRTl2dVAwRXNQZThsV21LRWticGRV?=
 =?utf-8?Q?3BmC+AVtnYO3Tkf6dbjdwy4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2ebfee-652d-4b09-a652-08dd4c217d7f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:28:08.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TokYPxJHd3atV0nngunOg3qX+Bksy65SbJyg2Tk/ytLuIkAZ4bD0xbYvf4HLATKEGFQdDKZ43g2PUp88j1JMa5CW3SwW2SQBQp0nbDvIabg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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



On 13-02-2025 07:40, Matthew Brost wrote:
> uAPI is designed with the use case that only mapping a BO to a malloc'd
> address will unbind a CPU-address mirror VMA. Therefore, allowing a
> CPU-address mirror VMA to unbind when the GPU has bindings in the range
> being unbound does not make much sense. This behavior is not supported,
> as it simplifies the code. This decision can always be revisited if a
> use case arises.

with Madvise we might need to reconsider this, for time being patch 
looks good.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> 
> v3:
>   - s/arrises/arises (Thomas)
>   - s/system allocator/GPU address mirror (Thomas)
>   - Kernel doc (Thomas)
>   - Newline between function defs (Thomas)
> v5:
>   - Kernel doc (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_svm.h |  2 ++
>   drivers/gpu/drm/xe/xe_vm.c  | 16 ++++++++++++++++
>   3 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 98130c0768ec..7b1076c184e3 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -438,3 +438,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   	return err;
>   }
> +
> +/**
> + * xe_svm_has_mapping() - SVM has mappings
> + * @vm: The VM.
> + * @start: Start address.
> + * @end: End address.
> + *
> + * Check if an address range has SVM mappings.
> + *
> + * Return: True if address range has a SVM mapping, False otherwise
> + */
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b3a4f2e82b50..50d47024d2db 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -46,6 +46,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			    struct xe_tile *tile, u64 fault_addr,
>   			    bool atomic);
>   
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> +
>   /**
>    * xe_svm_range_pages_valid() - SVM range pages valid
>    * @range: SVM range
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d482c0cafba3..06b013d1f533 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2417,6 +2417,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   			struct xe_vma *old =
>   				gpuva_to_vma(op->base.remap.unmap->va);
>   			bool skip = xe_vma_is_cpu_addr_mirror(old);
> +			u64 start = xe_vma_start(old), end = xe_vma_end(old);
> +
> +			if (op->base.remap.prev)
> +				start = op->base.remap.prev->va.addr +
> +					op->base.remap.prev->va.range;
> +			if (op->base.remap.next)
> +				end = op->base.remap.next->va.addr;
> +
> +			if (xe_vma_is_cpu_addr_mirror(old) &&
> +			    xe_svm_has_mapping(vm, start, end))
> +				return -EBUSY;
>   
>   			op->remap.start = xe_vma_start(old);
>   			op->remap.range = xe_vma_size(old);
> @@ -2499,6 +2510,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>   		{
>   			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>   
> +			if (xe_vma_is_cpu_addr_mirror(vma) &&
> +			    xe_svm_has_mapping(vm, xe_vma_start(vma),
> +					       xe_vma_end(vma)))
> +				return -EBUSY;
> +
>   			if (!xe_vma_is_cpu_addr_mirror(vma))
>   				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>   			break;

