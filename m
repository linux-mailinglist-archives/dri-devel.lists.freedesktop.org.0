Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53FAC4324
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 18:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3285310E06B;
	Mon, 26 May 2025 16:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erqb21+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148B489D99;
 Mon, 26 May 2025 16:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748277940; x=1779813940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nw8NArQoRJD34oeFtLhJ/jJQ6sx4rCntbdkMu09RF/Y=;
 b=erqb21+FtyUJzr7DSr98pRRdE29vjEvR7qK8cxsHnEJYNWsCDyOS/aF8
 x4LZJsQpFU4I22Snb66b33uaJxLKlMEg/etWYzqITCIA8hNLczc0gbahb
 G+vxuyU4vjoXz8pvmBxdVs5TjESoCGNk8hlzM37Dr6p44LnaOm3Qy6zq8
 AvePLt7TnVzG7elD22FyS4I6P/gB6mnNGYDs/sGC0d1A6x8buwhfZFU2l
 lnJUoRayQrBOFyW5ZB/IXL1SseitMr4ZCLDQCRfGhrT5aR4ZT4bT4PdyC
 Gbza5697krbY8kgsXJ3h6XDVXUMqFM1vNEiJt2ijpRNfHrz069wbJHCSc g==;
X-CSE-ConnectionGUID: Pzn01T0XR9SHEOukTTtriQ==
X-CSE-MsgGUID: 4v4bLaJkRoSLFL2dtsVK0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61316115"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="61316115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 09:45:39 -0700
X-CSE-ConnectionGUID: c/Wak26aT1Kz8mHjjxDKew==
X-CSE-MsgGUID: LYtO6d53RNecniEJpdKW9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="143392719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 09:45:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 09:45:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 09:45:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.69) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 09:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG3/p6y7poBkvJ6hkQgTuRTGXtD/fU1Xktc+3IQPeJ/4J+LemmJ/l4HA+Ff7WML+BxxAeXUVAMKTUOP7eeUBorx5OsDqQRpI0UjTxcexuioIMchwc6Q7Ve0jVoD2E0Jiz9Qft7qMW6S04Owqh3I8wiWLSoadHqq1A3OgBrt/85hhX2N4W3rLNepxU3S2LLh9apa5TwnZYOdTsRxnEDW2l7y7Logp6KxisndwaxNPie3e8a4SllEarDdAzOK0V9TysvJ83ZG1yjYPOz+/kcoqqS70ReTv/9wSTuwKEOZZHQf2JDqHXEqH+UO+Ev3ljmi+Cz1gBhjkaU3WqjWuFK59RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVGD28jpZLpztKsZC6ewZkOWxraTDnEMKP93bNDkOP4=;
 b=IckSNWRbKMYgpNfEQkzAyZZ+F+oOKLXIwyaETv/KdZV6ELCFaHCbPxASjPLrZddnWvJ4oW/Y7eJ6SHzCSnjCn7DTFZCeNoM8vuab280R2C9txqc+/jtKdXjNzzAiLar42319fX9WQdZJj+ejrnTW7piKDkrIKHQrSFnX6AVF1dHOJnn2lizt+fCDiFrFSjet/3O700VNH8U4+kYujJ3Xdd6pkJaw+mgqPMtxY3Bo33HV5RE8xdelM6B7IWx6WXYGw1arAddLn+3+vMMCsw9hi7HUYDAdZejkmaS0l2IUJwThsFLWUaCUNzE5jX9Feq8EeJl9lmXMBryNXJgLsgSozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 16:45:23 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 16:45:23 +0000
Message-ID: <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
Date: Mon, 26 May 2025 22:15:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
To: Dan Carpenter <dan.carpenter@linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDSDfusiM8QGQwFS@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: de23d4a4-c013-4295-2cb0-08dd9c74b596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2FFbzRobEhMdE9HY01mL2o0bnU2blFYRTgwcWkyTWhVajE0bmxHRmxqbTBQ?=
 =?utf-8?B?cUJzZnlkWE5ibFhadkdsWE9wQytOWVJHTE8vVGtaSW1QV1dESUF4enNiVG9L?=
 =?utf-8?B?MFdiZ1dVUVlpaElDK3dEMWQ4QTBQcERWRXBIUW9BMmsrbkRmQTcvWlJNUGMw?=
 =?utf-8?B?RVFwWURUbEFqeGpUdnhWNXNSdUZwL28rTldlMVoxYXBnSXRBaHMzZ2NIemRh?=
 =?utf-8?B?cXkwcmczckZzTnFmdjlaL2tpMnVzN3FiLytkaHJhNGhrY1N2VDBZQnpENmY0?=
 =?utf-8?B?N2lvVmpORDY3OVhUQW95RjB0TlBSZ1ZCb0FkQUZETlNsMXd3eVhSOEFoaHVS?=
 =?utf-8?B?K2dkT0ZNMjJMbVRRR2F5NEFqYXB5dzVlMGk4OUtKNWJ5TFZEcmxTb0hwb3dy?=
 =?utf-8?B?U2dmK0dnSDZNcVBobDhLaGNpRnpsWWxLQUFwVjhaU2xrZGgxanVWMjZiMzV5?=
 =?utf-8?B?YzM3czZZZkNTT2JkYUpHTXBSMXZNeStReHJQQWFSNXZwYU5XYkttejVDNG1i?=
 =?utf-8?B?NnVyVDlqTHh4Y2V3RkxqZ3RsbERLS1Vsd1d3Y0tlMjRxTi95QlNlZXVYWklz?=
 =?utf-8?B?R1V3RXNBL1FFWGFNb1U4Qno4SmtVVzVwWEZqMHBUeThoZGRnU3IzNENobTRE?=
 =?utf-8?B?RGYwWHRidXR0cVpuRko0V0xlQjZGV3ZGMUFDd1BpNU9GVVZpcHpwWFpVeEov?=
 =?utf-8?B?R0lhalFtVHhZSlNVRjJ2TlFpQm4vTWpUVWZmekFXbjFMSUI2ZzRnTnQwVmVj?=
 =?utf-8?B?MjJTc2ZXQnh2akhXNEttZHlkSzRBQWQ2YkxYNHZSdGRPRS90d2tHS2svV2RP?=
 =?utf-8?B?emlHMlpoU0RhR0p5TGVhQnk2elkzNkZQd2x1V1NxbkVVQndEOVhVaFg0UjB3?=
 =?utf-8?B?aDdIQmhjWU05bDlBQmREaVVJSjZTOStNYUhVZmh1TkNjaVdyMDR5cVZjMkxm?=
 =?utf-8?B?T1NqMEwvZXlqMHFVdDdlL0RQSWpUb1lhZzV0bFovVHRqQVRlRFVvYXhnZ1NL?=
 =?utf-8?B?ZTJ4aGJubThpQWUxL1Q2U3BhZ1VIb0JqUTVtU3p5VWdpcmN3TWhuZUd5WVBz?=
 =?utf-8?B?VThWNjk0dmFpTWFtemt6T2I0WEl4WGZ3aW0yS01vWjRIeGkwR0U5Mmp4UVFi?=
 =?utf-8?B?Mlh1UVZ4ZU5rYnRBTHhxMWg3ZHRmSHNuMGp4dERmNjJRbXBGTmFwRXZLaHEx?=
 =?utf-8?B?TWs3L05KZy9JVW5FSkZhMXlKRTh5ZUV6K3B5TUNGeXEzWWhLVG5QeEpLdFll?=
 =?utf-8?B?QUNOVitQMTJlbGdPT3A0WE1NcWhudHp2M0tNSDBNQW1DdkVFeFVwcXlkUHJl?=
 =?utf-8?B?TmxrL3pIdElMWldoK2pIeXFDK2Uwb0xiNHJrcmgxZHgweW9OejlSeWNVdE92?=
 =?utf-8?B?dWE4YzdtM0R5bTh4WFVCbXZaTUxPaXh3UmZYazhVZ05ZT09vSG82Nzl0Sjcv?=
 =?utf-8?B?UlBZK2dFdWNveEkzZEM4bzVocXQydXNQWVpXUFlPYVdQWUt1cThLUTBEUmdG?=
 =?utf-8?B?YWtEZ1gyeEM1YnVTN3FlTXZnNG5mYzhqWkp4cEdOU2VMeVFQRnI5TTlkRVY4?=
 =?utf-8?B?cXRxNDJNTWJEWVp1OUs0RDJSaXRsK0REdVppU1hxZTNrd1JEbUJGT3B3UlZj?=
 =?utf-8?B?Tmw5L3JLby9ZL1RmVkxqeld6Z2x4UkpCYXp4M0xHSVd6ZytTeUhmZStTUSt0?=
 =?utf-8?B?OGg5NWpUK0ZzQ0UxL2JlbFljSjd5TDlDN0ZxMW92RWRoTlFJTmlpM1lRUUkw?=
 =?utf-8?B?NGxOa1ZITU9IWUFzNExXS0tyWk0wVE1ZdDhjY2psdEVsVzJKNWl2R1FOOHlO?=
 =?utf-8?B?N21aMjZlUyszOEMvK3QwaU5RN1g0MVZYVnRDK3lGZ2lXZ3QzYVJUZEZSWUlM?=
 =?utf-8?B?RkZTc2NndDJjZi83VktFNEgrRG4yT2NleU9VMy94ZGdPN2lzRHFIVEludU9x?=
 =?utf-8?Q?6pVd6DAuGYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2pIOVZZUjFmQmtUa1ZuS3RhNUNFL2JYbTROQ1dGQTJVUlZtWUh4MUhFOUU4?=
 =?utf-8?B?aGhoNWFMKzFHbUpCUGxuRVVZeUZha0UreTlObnhJL2RCd055SFJMZEkvZDU4?=
 =?utf-8?B?WUVWRjNKWlhvMFZDeXpJOW02ZjBuRG9hUjkvOVpUT2xDeXNSRFg3Z1NNSXo3?=
 =?utf-8?B?K0pXK2NVaFlrRlN1NVVySS94ZjJBQUJJcjJieEtuQ3pERVg4TW5Sc0ZYWEM2?=
 =?utf-8?B?bGYwcHE2bmRmTHdsTXlVVjRkckJSQlNZbE9oRFRlWEp0c1ZvdEhqT0RNTk5q?=
 =?utf-8?B?MXVRbGN1UENzTnlvRnBoOVgwd2lVZE84UzRjQU1BWDhDdHFQOUJOY09zc2lm?=
 =?utf-8?B?aVFwVDFKOVhtb0JxV3BPMUg5MHJ2SndkVkhWWTcxOGxZVFVaVE9tRGxsejBy?=
 =?utf-8?B?aXVnSU5xMEJVOEdPbHdZYlc4djhiR3dNSUpXdkQyN0l1VEoveDlQZ2ZzUlVu?=
 =?utf-8?B?T2FrK2kwNVBqbVlpZlEwcmwzeXQ5NVJYNG4zOXRTSzRzZ3JVTWNEZmdXTDFw?=
 =?utf-8?B?eHVxOUg4bUZXbytWVG5LSlBjZ3lGeXIxWUsxeFlIR2VyQmtDY3F6TWJyVTlW?=
 =?utf-8?B?THc3NEw1R3JZeVB5QlFrWkRablBGREhhV0tIeFNqcGk0UjJTUjlHL1F4dUZO?=
 =?utf-8?B?bE1CdmE5M3J0RFd0MXV0KzFuMHhDR1dKSlEvYnJUK1p6TFNtZHlqKytiTk92?=
 =?utf-8?B?WDBjYXVhNlYrNGhzMUdENndzK1JuRjc2OHJKMzQwb3M1NGMrRFBaYnB5cGxn?=
 =?utf-8?B?RzVUQ1V1ZXczaHRqK3BaTXg5N1FlU3I0NjhobXk0akJkWWNHNFdhMzNPeDJP?=
 =?utf-8?B?MTBaNDQwZUUrUmpwZ1pZbDkvRy9FaEdyKzRIK3Zlc09LdVlUaUgyS0t2S09M?=
 =?utf-8?B?eXR6aHE3YUo3VHlNQUoxUzkzVTRjS1dHRjNlZ1lBakVVLzdsZzFhRlQvNWNO?=
 =?utf-8?B?cEhkcnd3bUNaZVdqTkprVGhlcFlzOUlkQmZ6SXhsUVEzNTZDeitEMHVYbG55?=
 =?utf-8?B?Ryt0UUQwWnkzdVV6clpBemk5dlVHdTloMDRvOGJuZlhuUGViQk9VZzRDMTFn?=
 =?utf-8?B?S0lTcTJvNVpjd1BIT2JBTVNZbVc3MHRqYTdLN0c4YUowMlZqbnRBT3hBNytL?=
 =?utf-8?B?cVA3VmQ0VC9LbjZqblhTd29rcDBoUnRSaG1WUTNCY3BFZVZickVzNmxtb0dQ?=
 =?utf-8?B?NjRwTFROeHZrdjZnVjdoaUhMSlB6dWVjaXdEaFc5WDhmMDlyT3gwRy9HQU0w?=
 =?utf-8?B?Y2FmT1ZXMm5LYnRiWGREZTM2VTFXUytxc01MM2psdld5QkNmenN3bGNUZXRr?=
 =?utf-8?B?a1l1c1RYbHFZa0ZzT2VjQTBkaXVsUXR2bmRFbFFkeXJSRmtFL2dNdy9LZnlJ?=
 =?utf-8?B?czdtNVZpc29KVHdqd2ZzS1JCbXFlYnhkQ3ZmUTRiclNaMXZSdE00YWhyVlZl?=
 =?utf-8?B?K3RTT2RNVkVsaTlSUWdMT0huRWpRZmNNaklwdmZKdkZRdG94MjdXTlc1dUJN?=
 =?utf-8?B?Z1pPZXlhSGFGRVdxbmdRV1hBaDlOay9KVElSeU92Um05OG5rNjZ5dE13ZU1T?=
 =?utf-8?B?d3hvMGRPM2t5TG1VR0lOcUFNenRkMDlRQVhoRzk4OWJqdEtHK1gxekhnZGZq?=
 =?utf-8?B?a2c0aVRtYWhCWFNJaGp6djk3SCtkQTI3UjFzeHJ2ZGV0ajduVnF0OHlSZXFr?=
 =?utf-8?B?a1VXRlhpNTlUTEJFd0RvQUExZzNNc3NxTGtPUlJuanJOWTN5a2c1ZXNvNTVJ?=
 =?utf-8?B?enZHaVc2N1VIZjV6YU4zeG9mZDg1OWt1eWVFMm0rVmR0cXdSOWIvRkd3eHhH?=
 =?utf-8?B?eGpBQXEzZGIrWkNNT1lFN1liWXNSdUU1TUhQZ2JUK1laVkxLeFI2ejM1M0th?=
 =?utf-8?B?c0R0d1JZY2cydjRneXQ2aTNUWDRUUnJRdk5jTmFPeW5KQUxHSGhtSVpJNDly?=
 =?utf-8?B?cys2NDU4ZDJjajArNWo5VXduMU1Hek5HYVNmVTRzWnhkWi9sL2FheG5JMjBS?=
 =?utf-8?B?dnhuSUdNUTg3MGdzOGMwZHgrbVhERk9kemJLN3J0UEhSZ050OUJDcTU0bEph?=
 =?utf-8?B?NWE3bGpJVEt3aFROcEhVQ05VSStIUXZxN212VS9vdFZJV01md1FKOTJyMDJV?=
 =?utf-8?B?Qy9VTHJZUURhYXFOdm9kSFFuOWIzTDg5bVowV2hzbGg2N0lZM29WZFdQS2J2?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de23d4a4-c013-4295-2cb0-08dd9c74b596
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:45:23.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVI8lxi6EKapxq3VdviR4LpnkJuRmbsIzG+mWprPn+Qr4gZyGpW+Y7QscMjZyeaGh+RScLqJW74EacwzoMTtc4RASmZszCfrgGCS/ogPmdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
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



On 26-05-2025 20:36, Dan Carpenter wrote:
> Hello Himal Prasad Ghimiray,
> 
> Commit 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM
> ranges") from May 13, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/xe/xe_vm.c:2922 prefetch_ranges()
> 	warn: passing positive error code 's32min-(-96),(-94)-(-15),(-13)-(-12),(-10)-(-2),1' to 'ERR_PTR'

Hi Dan,

Thanks for pointing this out. I see there's a gap in how 
hmm_range_fault() adheres to its documented behavior. I believe the 
function should sanitize positive return values from walk_page_range() 
to ensure consistency.

Jason can comment further on same.
  >
> drivers/gpu/drm/xe/xe_vm.c
>      2917
>      2918                 err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>      2919                 if (err) {
>      2920                         if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
>      2921                                 err = -ENODATA;
> --> 2922                         drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
>      2923                                 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> 
> The comments on walk_page_range() say it can return > 0 on success but
> the comments on hmm_range_fault() say it can never return > 0.  Smatch
> does a naive reading of the code and thinks that it can return > 0.
> 
> Presumably the comments are correct but the code is too tricky for me.
> 
> I can easily silence this in Smatch by adding deleting the positive
> returns from hmm_range_fault() from the cross function DB.  Can someone
> confirm that's the correct thing to do?
> 
>      2924                         return err;
>      2925                 }
>      2926                 xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
>      2927         }
>      2928
>      2929         return err;
>      2930 }
> 
> regards,
> dan carpenter

