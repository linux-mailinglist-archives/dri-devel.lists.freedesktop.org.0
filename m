Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7173AEF128
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DC110E532;
	Tue,  1 Jul 2025 08:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7pR3i7Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751710E530;
 Tue,  1 Jul 2025 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751358747; x=1782894747;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4ucCJUKLzpb/diH59aaq9RhGNhDe1z2VcNbZkffI6mY=;
 b=L7pR3i7Zcho6lZ6PBow6r6OgudQLj0KIeCeHDSppcaOkxLslOvMNLd9l
 LVrF41r+6CoQ1PS/sGuTgVs3kWQW4HWV3Bn3VvcfLOMOATP3iPHM6IZSI
 FR1lmgm1HQQuZOBdHfAoup2JXP42UpNN+lTetWTTMhD06jL+e7aLGrL6L
 EXJ3aIPKp3iaypaJM/rCtot0SiwC+DDzekndsckMJgjuM9O/urS7h6mVf
 mohaDgn6f0ftCDjXCVizOyvuxaDwBaPvGJbFHsInV+RcL6rorEitVogxx
 1V/ueFT9CwTOA1TgsNmklPPhvbeQHs15/IGMqMlVYxiHmVpnkeSMpJVv1 Q==;
X-CSE-ConnectionGUID: zoC2Bv/XTGOsX5YHbhgNFw==
X-CSE-MsgGUID: eb+/8K26R0qpGDYNtJ6xqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53702378"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53702378"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:32:27 -0700
X-CSE-ConnectionGUID: GMJ0MnspSdGExyYJHFbcLQ==
X-CSE-MsgGUID: lZLrwCCiRjqLPW1uwOkdDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154011576"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:32:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:32:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 01:32:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qavfvHKLN1dwWbnpOy0+/itxSAaP28Z8O0yrwjzWb/oBkkE3Q+QVqBta0F8KDzwYvDHbQBMZ8PaC5glj2GGzDT0ichaACsX8JIAfMQBUjAvJ/NwVRcC9IqSZXkVgQDb1XDqzEnu0VivhWnMysWz/kOokCJ3G0s43RkIn9EvQBz9g794I1epijGFYHvVyFlZCrIqtfuIZiLErxB/o8hKqE7QUp92dPbw4UFNJ6V/segndb6ezs9ZDk4hopCatcLXycQgWNLWsp1l2k7+yJYlGZzeVt2MmvMjrsNh7q+4nbX3QSVES2C+ZTfBMWG63qX2BuwPfL93QEKCgGMA7XRQc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNDjQvIKpMUlnLrig3IYXKvCGjVeG7G1j85F1jBHaLM=;
 b=VWWz0kLLexqhqKKMMU7k9W7jOzd9BZlFqeU/kZ9jGC+QfGifQtfD3P4X2wccK27u9bw+PVrCMFHulwmT34rINWYjHPdKGvCrx8I8955pZF3F0WyOkj7A//jILZRmvI2RGnWNK2e+fgzyEgsUb5/TwThIyEfF7dqBvWi6hvF9ZV1Uic/6XxRmXcdgXNgIJl+WCKf2MfxNQCZNA667nHfk394U1e0HLhpUxFsxuxw5aCkh2mJwOrgWroE+p4sSFndaqpBw9FfHGyevcaW+nWADK9SnlRDZd5o4my8B/Xvx1HpZVWPeoRcCPxuM6RYo7fbLB/02FHFb9uDTXCO7Xn1uCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 08:32:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 08:32:23 +0000
Message-ID: <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
Date: Tue, 1 Jul 2025 14:02:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
To: Greg KH <gregkh@linuxfoundation.org>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <alexander.usyskin@intel.com>,
 <daniele.ceraolospurio@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2025062834-scraggly-barracuda-7ea6@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: ce92765f-c28b-4bf2-47ea-08ddb879cd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW1TT25teHdkMkhGSGJ2OE9IdytlTHZsODhJT1Frc29CMEJqT1JPWHRGN2tN?=
 =?utf-8?B?a2o0VzFRYkVkTThzMWtQaWxTZUhueTVGNlo3blZvb2Z5TmlteXFUT0JhZmc3?=
 =?utf-8?B?Q1VBM1I2M0NFYjR0T3Rsa3FhL3FkeXl6L0VoSEhwWEhaYnoreEZQOHlMZVc2?=
 =?utf-8?B?NnVKWFB3Y2poeUJrNjB1SDN3TFBvai9WSFNTZXN0STVOVm1oVk84dE9rNjlY?=
 =?utf-8?B?VVVrLy9zT04xK0RlUlUxeDZxYTZGWDNXQi9SdHdZMUU1OGRyRVdTc21hL1oz?=
 =?utf-8?B?ZXlDMDN3R1JhV1FiVU5UMEdGR3UrdFE1blhoTUVHdkJUNitxTDNtL0wvVjZZ?=
 =?utf-8?B?VFlwZDl0RStQWHBCZHFNdUJSekttU3YwR09QSlBNVEpOcFBRUlZmVUpWcDYz?=
 =?utf-8?B?Z0JLWnIxMWlOWmpoSU1LbWtCaG1zcDZIRkphNDR3ZVpJbkRJdFg2ekF3ZCtJ?=
 =?utf-8?B?enJxeEdBUnpYUHRnWUZLSm9MNWw0Z3U2R0JXTEhXMnhiYWUxQ2dtN3pqS3p3?=
 =?utf-8?B?YW5QOEYyR2psVnJ5VlJoaE1kR1c4MEp1eVN6Y21CSUxiS25relN2Nno2aGJl?=
 =?utf-8?B?T3ZVWE9RM0Y4UkhLeVpDM3o2MjM5NU11YUkyV25Qd00wV3RyRXEwTHpZbER3?=
 =?utf-8?B?SjcwSjMzTU1hRWtYWDZCMCtNdlRFZm9SSnk4Qk90bjMvRkRMTDVpK0lpLyty?=
 =?utf-8?B?VzB0cjAvM1M1aUpXWWdON1VWekFCUSttT0lkZlVZdnc5Yjh2djVtZnhKWHRD?=
 =?utf-8?B?NmIvT1NDREtFcUdacjVnbnowNTFrQU1CeEpCUHBKaFB0ZXhJMDNLa2JhSWVo?=
 =?utf-8?B?U3lvUnhSRlM4bnpTbzBTUm5kQUxqWUNBVHRpZGFnWEx3aHE3eCtsUDA1WnJR?=
 =?utf-8?B?OWZXdWFhUEsvWFB0YldzMzBIWnZJQXdxbk45Ykt6cVMrTXNnM1E2dlV3eHlq?=
 =?utf-8?B?UFdKTzhSeXFSSHdLdHR3Ni9ZR2hDejlWcVhYWms5NXFrczc2OG44UzNsUnJG?=
 =?utf-8?B?QjRYdWpSekcrYTBNeHVzcWFTZysrcG5GN0lZMS9rY2wrelcvTG1WRzdqWlJk?=
 =?utf-8?B?aUhZTkFsUTIvNUFXR2xqZWJCOS9qY2Z3RTRXUjhKVnhRV05RRVMzdnM0bFJL?=
 =?utf-8?B?Ynd2VS9zSWpYRmxaajdxd1pMcXo0eEVHRWNuWFdoWTNMb1JwYzJtZkcwMmoy?=
 =?utf-8?B?VVJHZ1doN1kxVFhJcEd4cjVETzhNVnRuUDZJVEwzNGdBRDlObG1Pd1FWQXo1?=
 =?utf-8?B?RjZFWngvVWFXMS9ZSC9pd0hMTHQvTXlKN3NMT2VqcUROa0R0cTVwRnNJMm1P?=
 =?utf-8?B?bTZYd05ESTNMdjFUdzhDajVMTzlhR3Y4RnN4enM0S01zRk9pMCttZ0IxREdv?=
 =?utf-8?B?ckh4OFFRZ2o3VER1WXFUUnZjcFhDeW9DVGc1RDV6Q2RwbHp5dGhrUmMzVTM2?=
 =?utf-8?B?Umo2Vmp3NzJTaXNRWnIyQ0xLTnpaM25YeS9ZMktxbTZWbXJsUmJhcVhKN2Jt?=
 =?utf-8?B?K2NtaWVHOUdTcThBcTFMQXpwbXMwaE10d2tON2FNL3kwYWZWb2JFdFV5Ujl4?=
 =?utf-8?B?THFmallBQmJmOXRwTkpQbGx3TkFxRFhlT2lrRWxYZTg0bDdkSnNuSnFnSjV1?=
 =?utf-8?B?bWtjcHV1ZHlFalVJajN3amVBVTJGMUtUNWU3cWtjNmNPYllzMkFndEFZRVdi?=
 =?utf-8?B?RkpwUkRGbWwvSUpBaE9zeTJ4NytKTHJEd1g2clIxN0NRUDVWQzhxVm5WTzlF?=
 =?utf-8?B?MGJVdHBHdGJDM3Q5RG9CZFU4SEJnN2c4bEtjZjU5RzVOems4SjV0UkpkRjFy?=
 =?utf-8?B?cDB6d2MxemlwQytwOTBWVzg1VFJkbngxVGlOaTZvYWVMTTIvZEFkelA1a2hR?=
 =?utf-8?B?eEtFUGNwdmRWUS9RNXNVcG9PL3M0ZW9KYVFPRHR1Y0o5VFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1JK2tFYzNoSWd3WFlpelArSmZ6ejhtMEdoNVZMeEw3dSs3dUlJM0VBS3oy?=
 =?utf-8?B?L1pjOWFLWFNVSmhsa3Z5THZHQThsTTY5MTN4T1ltZ1hCMW8yMmZnb1RJNVY1?=
 =?utf-8?B?cVpYSE52OWNUaHNrYlhVYzRKTjlNKzJwc1djT3JjOVNvSklLYnBiWWRSL1dH?=
 =?utf-8?B?NDVWeGtqcGJvd1R2Wm5YQ3dHR3c3L0g0Qk40YnBSQlRkTHZMREQ5RUczVUo3?=
 =?utf-8?B?WUFVRTkwdU1RbWhtMG51NHdZS2N1d0NxcUFzMGsrd1RWSjZWcGl4am5ERWhK?=
 =?utf-8?B?TU9ESFQ2V05ITzJKbFZkUHJBYzQ4R3FocjVsN2ZRWVpMSnI1TW93MkM2Q0Zp?=
 =?utf-8?B?OW1xNFVkU09GK2dRdkwxTXYxUUZRTlFqQmdhV0tGc2VtNjVSMG1NcGlCcW51?=
 =?utf-8?B?R0w0eTl5YWZqaGxTaUUxQXBEQWVuSmRuNEFST2wwZ3o4SHIvT2M0SkRQRWpL?=
 =?utf-8?B?REYwcDFLZnNFT2hGVkhOK3ZCKytZK0FVQ0kzMmxTVENmZE0vRVZLSE1sTXRB?=
 =?utf-8?B?OVRsOXpGMjllakFOKzdUeDg3dmY1QUlYemtwcFMxN1hYNzZEWmhvTm5GNjJB?=
 =?utf-8?B?N3R0RlZXbDVmTXc5NDVlZGZ0d1Y4VjNiSDNJcXhXVGxTc1pQZGpxSVJTdCsx?=
 =?utf-8?B?R2h0dGdhN1FLWkRhL1grOGVzQjY4RUpFanFQUXNrQWZEV202YWE2eW4rUTdN?=
 =?utf-8?B?ZEFiY0Z6VHdZSEVjSW5iR2FIaVpYcDRmVXNRVlRiQk02Q0d6RlNiR1Z1QnBv?=
 =?utf-8?B?SmttU1JYaTE5WGFCMk9wQmY1aWtHQjcxK0VNdEM0Z0xrOTNia0hjcUc0d3JM?=
 =?utf-8?B?ZmgwVGx5dnB1a1JYbWtvS2ltelBGaEhFT2ZrOFcyVnV3QjY0MEd6cXRyMWVG?=
 =?utf-8?B?WW9Va0FKTlF1TnZBYTJBSE5SQmlPdHZocWNhQjQrVTRsZVVEUmdRREplU3F2?=
 =?utf-8?B?T0Y1U200M3UxUlVieEVXeDV6QkxrOHVXWDEwblM4a3M5S2twVGZoUHZhYzQx?=
 =?utf-8?B?TExzSUd5MlVNcEZRWSticWpVSktYQVJCMWVwZkdzVzZSeEJkSUpQYXZEai92?=
 =?utf-8?B?QzVlY0Y1Tm5qRmtwMHJJOG5IdktqdlpLS2I2RzZxTTZhV0h1R3NhbXNXRnMv?=
 =?utf-8?B?VE1XU1NPYXFIWDRFSmNGemlaSjhTamJ2MWduSmoyREZVc1V1djJUU1FIVGVV?=
 =?utf-8?B?RVBkTitlM1Bib3hEaEdYd1RUbTZhcUdwZk82bkMzbVJBYVg5QS9ick1WVkFF?=
 =?utf-8?B?VysxSXdQTjRZNlBaREx3enhXd1psd2VZVnVSNEdORmFHRFRyS0pXV0VNVXVH?=
 =?utf-8?B?M2d1UGw1dUwya1RINUQzbkk0dlpSRE9ab0tOM2F4cEV1cCs5RGkvL2kvUkY2?=
 =?utf-8?B?VkpSS1AyN3VvQVByNms4enc4S0JFSzZheTNVKzZ6T1pxLzdVcWRaV3RjbXUy?=
 =?utf-8?B?U3plU2JZbkhmcGNvbDE1WXRlUE8zSnZHWEppdWtiNU1FKzFWd0JwOVQ4akl4?=
 =?utf-8?B?bE8yMWk0bmtOZXhTMjFIQXF5UElPdGRtUUgxckNxTHRpWWlOb3U2Y2RDaHph?=
 =?utf-8?B?WEhia09LN2NjM2FpZjlaWElYUzhEbEYzSG5qUnM1QzJFc0EvMGZabTU5MDNv?=
 =?utf-8?B?aU9PaDllZCtROEJlMVdEeVE5Wks2aVkzVkJET1Z6aEYxTTVPekRsVFhuQ0xQ?=
 =?utf-8?B?YTNWY3JBSCtYKzdzK2g3UTJGTHJaWUdCV0locHVobzlJUVFYQ3RlWmo3bSs0?=
 =?utf-8?B?TW91R3NmK294dERsNFhQZ0lCd3ZWUU9FanhQWTk0UTR5OEZKT1VCeUNmaVJo?=
 =?utf-8?B?NnFGdnVSam13eTZkeSs2T3ZhODRZdWhFV1NoMGtLQUhTMERobUIzYmxabjlZ?=
 =?utf-8?B?ck85WEl3QktmNFhGck9DWG1kcHFBL2d2eFAxS1U1VGpoTHVHS1lxT2ZhYmlI?=
 =?utf-8?B?cStucHBnZXZ3RTV2UjRyb1FTelVpdFh6Q2NJZEZzdG9zaGZPc1U4TThUTm50?=
 =?utf-8?B?c2txUVphT1ArZWwrcjJqU2dHRjdUaUsvVklmWDVoRTlGeWVVZ0tqeHU1RXNn?=
 =?utf-8?B?RklTTEJBU0c2YmlDT09DZE9ZcFNqV2Z2OXBwcVBwRm05TkQrNStYWUtpeGY1?=
 =?utf-8?B?dlVUL2hWbStLMXl3M0o1V2hSQ01YOVQzRW9UWkpUNk1YWElyNDBtZVpwcmxp?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce92765f-c28b-4bf2-47ea-08ddb879cd39
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 08:32:23.2986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+7eiSfeO79SUmPhe+NV9K6RmWLe72Ggm/lOeQeywA3UjTeRRVgqxQG419g3Vj83bIAQ360jZ5s8SMX05w1CJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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


On 28-06-2025 17:48, Greg KH wrote:
> On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
>> --- /dev/null
>> +++ b/drivers/misc/mei/late_bind/mei_late_bind.c
>> @@ -0,0 +1,281 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2025 Intel Corporation
>> + */
>> +#include <drm/intel/i915_component.h>
>> +#include <drm/intel/late_bind_mei_interface.h>
>> +#include <linux/component.h>
>> +#include <linux/pci.h>
>> +#include <linux/mei_cl_bus.h>
>> +#include <linux/module.h>
>> +#include <linux/overflow.h>
>> +#include <linux/slab.h>
>> +#include <linux/uuid.h>
>> +
>> +#include "mkhi.h"
>> +
>> +#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12
>> +#define GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD | 0x80)
>> +
>> +#define LATE_BIND_SEND_TIMEOUT_MSEC 3000
>> +#define LATE_BIND_RECV_TIMEOUT_MSEC 3000
>> +
>> +/**
>> + * struct csc_heci_late_bind_req - late binding request
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @flags: flags to be passed to the firmware
>> + * @reserved: reserved field
> Reserved for what?  All reserved fields need to be set to a default
> value, please document that here.
Reserved by CSC firmware probably for future use.  default value should 
be 0.
>
>> + * @payload_size: size of the payload data in bytes
>> + * @payload: data to be sent to the firmware
>> + */
>> +struct csc_heci_late_bind_req {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 flags;
> What is the endian of these fields?  And as this crosses the
> kernel/hardware boundry, shouldn't these be __u32?

endian of these fields is little endian, all the headers are little 
endian.  I will add comment at top.
On __u32 I doubt we need to do it as csc send copy it to internal buffer.

Sasha can help to answer.

>
>> +/**
>> + * struct csc_heci_late_bind_rsp - late binding response
>> + * @header: @ref mkhi_msg_hdr
>> + * @type: type of the late binding payload
>> + * @reserved: reserved field
>> + * @status: status of the late binding command execution by firmware
>> + */
>> +struct csc_heci_late_bind_rsp {
>> +	struct mkhi_msg_hdr header;
>> +	u32 type;
>> +	u32 reserved[2];
>> +	u32 status;
> Same questions as above.
>
>> +} __packed;
>> +/**
>> + * mei_late_bind_push_config - Sends a config to the firmware.
>> + * @dev: device struct corresponding to the mei device
>> + * @type: payload type
> Shouldn't type be an enum?
Sure will make enum.
>
>> + * @flags: payload flags
>> + * @payload: payload buffer
>> + * @payload_size: payload buffer size
>> + *
>> + * Return: 0 success, negative errno value on transport failure,
>> + *         positive status returned by FW
>> + */
>> +static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
>> +				     const void *payload, size_t payload_size)
> Why do static functions need kerneldoc formatting?
Sasha can help to answer this.
>
>> +{
>> +	struct mei_cl_device *cldev;
>> +	struct csc_heci_late_bind_req *req = NULL;
>> +	struct csc_heci_late_bind_rsp rsp;
>> +	size_t req_size;
>> +	ssize_t ret;
>> +
>> +	if (!dev || !payload || !payload_size)
>> +		return -EINVAL;
> How can any of these ever happen as you control the callers of this
> function?
I will add WARN here.
>
>
>> +
>> +	cldev = to_mei_cl_device(dev);
>> +
>> +	ret = mei_cldev_enable(cldev);
>> +	if (ret < 0) {
> You mean:
> 	if (ret)
> right?
yes
>
>
>> +		dev_dbg(dev, "mei_cldev_enable failed. %zd\n", ret);
> Why display the error again if this failed?  The caller already did
> that.
>
> And the function returns an int, not a ssize_t, didn't the compiler
> complain

It didn't. This is for debug from mei side, this can be removed or will 
fix format specifier.

Thanks,
Badal

>
> thanks,
>
> greg k-h
