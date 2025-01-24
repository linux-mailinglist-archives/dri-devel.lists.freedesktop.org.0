Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB5A1B0C0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 08:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD0110E09B;
	Fri, 24 Jan 2025 07:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjK+bnW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8569810E09B;
 Fri, 24 Jan 2025 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737703194; x=1769239194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GTZ4Y46XgzGwHLYCoSLXElfxOgjE+BpR1fcaENdpixE=;
 b=AjK+bnW2QSqsUEMbxTZuAb0+P3TuFWnfE/MNM39ZOImJ/Z45mxC6CeJr
 AFUuKN044vJkvjbkdnrGNwm/VhE23oXjBNWmEGnceFEXqJ4Y74uEKPiHm
 Eg346laHOoxwq6Vb41kzBKmiket4J8GY2CvOV1litVFa8czPZnSF8qob3
 4TZCV5X1LKUT1+s2OgWcExU5P7YAR76aZJU2o1tS0nbwBVMEy4v6uStf6
 hDzviKpaHs5nAblgTt+mh2Ui4uC0pAg9q3hbLlt4Yo0uTGhIouMzsO+gf
 rIrYHrQ/LEnp4l7RGJ5GW8zYYwq+Vn5l0CgIck24MRqwnCb9EN9mGK3dV Q==;
X-CSE-ConnectionGUID: gwcm0GBLQ/Gy5qryzwiOOA==
X-CSE-MsgGUID: /yBObppBQY6Nea3KtJz+xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48735809"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="48735809"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 23:19:37 -0800
X-CSE-ConnectionGUID: AVbZs7zCTsWQNDlYt9JSdA==
X-CSE-MsgGUID: kub1CFGySg6TG8ZwyopJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="107612662"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 23:19:31 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 23:19:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 23:19:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 23:19:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SusDLp/KVpmCE376MCulcDN7a401BLsAuHtH/edo11cJ+SNIlYONcGp4Vi2kdS+c3rc3ODRE4b3LmdfUlpJB2yfxniyOipeorgOTtyYFB87SVMV+QUwoofSAdcb93V3EWuGv9xq9PI5uJz9ATmZY3pxQug8KTyZjkv0qJBY15n1A+Ru5yQe43l00yqW6+F1mIzlQCHO9z/RfTPib1m4ZjTQPvYZnXw3g3WsTJYf8PhFd/1ZP4E3x2RNqK+/k5zkkPhzeSafKuog1LqGR21/cZ/SesARnGAF9wJbq3qtbRea8FKWN6wgzcnszR1mug91A3TbsonBfI2f4HjEF0BAhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUbmAesplDHUziEDtAuiJTU+Rlo0V+fdPINrHApogSE=;
 b=VuxKznrykEqSMS1JGmHbMShJh5ctGKFTsAFPuFL8vBcuak0Exb4FaRAC+MnLfVnVugHkVjPHAXxoWciCnMLk5kZZxbK3k0i66s6QLag5zXoBOEIWvj2XjjB4yPOhZ5QrCzj4iqAy39bXYBUyOMGnysp0FpL5sBUPPayegDpfSjQ8hXvnr22cVZ0q/FcSy7ZSaHfSa6VOSNzQIcHk7yMRBzkdRozlS3wNtJEqsIF/SBgpVnpZbdAF4foKOur/qtfurgH7UpT/QLnQcIhzUOCT7l7gCUaAKk1q4w2lrIP8gLkNYF/bU+VvJ6xKjkVAgGtICnOHvBRlumOPfGcPSkQNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.17; Fri, 24 Jan 2025 07:19:26 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 07:19:26 +0000
Message-ID: <65d526d9-0c9c-41e7-98b1-5e158dc5754e@intel.com>
Date: Fri, 24 Jan 2025 09:19:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/30] drm/pagemap: Add DRM pagemap
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
 <20241217233348.3519726-5-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20241217233348.3519726-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::11) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 319583d4-f219-4548-1ac5-08dd3c476ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXcybWFVNEp5dUFocVBBMXQxcEkrOVUzS3BWNDJSQmI1RTdoWFpDOE1DL3Z6?=
 =?utf-8?B?TUpKdHkyTmJpZXAwN1l4TmRzaCsySHpUdGNLMzdNQzhEN202WWJXeTRKOHJ2?=
 =?utf-8?B?dUZueHJUVnBNV1dxcXBaYmJLVUlPRDdBRFJZdUZIL20rTVNsV1huTGxwQWxL?=
 =?utf-8?B?ZTc3dTRPSTNUZ0p3NU12RFltaER4OWZoVjFBM3B6S1Vwek5MY3hrT01rbm11?=
 =?utf-8?B?ODA2REkvQkhnL2wySEROZFdPV3pCR3A2U2RYUW1tUGdJVXJXMWxYR3QxLzNP?=
 =?utf-8?B?NzVkazd6QUR3eDR6U2E1OGt6WElwMjZZb09JV0tGQXlUdDBKRVlqUDFSRCtH?=
 =?utf-8?B?UThpQXEyektOT1ZUS01TdmxoRDlFcjQ0VmhmQ09RVEVFRGM4alkvVmZCU3dU?=
 =?utf-8?B?djZGaVVNWENBU2kxSm5WdjJyQ0pERmdQQUFVUC9FdksyQzdKTEthZU53TXhP?=
 =?utf-8?B?bG1aSUh3S08rNWRURkRsSEg5eW5QejZzcko3QmZOV2VFdXBUODhjanliVnNi?=
 =?utf-8?B?UmRvOWtTclU1YXBqQzllaXhOcXkwczRYMjJlT2JQbVBaZVBpZXVYTWtPQytx?=
 =?utf-8?B?UjM4STJGdllWdmQ3WDJRWUg4NStIaEdtUlVjZmRkeVVnZ3BpRS9UUVhqV0V2?=
 =?utf-8?B?cjJZVzhVaXpoL2tMaVdYbDY2T3p1aUo4dldULzJyN3lseEtQbXhPQ3lkK1Rn?=
 =?utf-8?B?M1BzSzBkT3pVbWxjcDdTT25IdXhURkM3c2xjeWtaenVWQ2U3UTRLT1dUUGdy?=
 =?utf-8?B?TUphZ3F6ZXI5d256VVRrdExzdVRyUzlTYVhOaGlGakRnSkNtdFBEMHZlZit2?=
 =?utf-8?B?UVArYmR6N05UWjlSdTVmQmZmcitPeXg4dHRlY2U1NGVYUE5qWWRja0liWDBn?=
 =?utf-8?B?WTQyQXRmc0diem9MMlZYS0JzZUprN1RnUTR5UXFPVlpVVmZvSlRXVHVaaXJr?=
 =?utf-8?B?S3hNWXVCVzZNWXRXVzNBQzhGOUVObDlyWDlBVDlhNFlDNE5MSmZ0R0lWQjFP?=
 =?utf-8?B?Z05JUUZpekhQZERtWkdkRkJPVFI2TVc1WktQckc4MGRPZU94cFI4V3ZTY3R3?=
 =?utf-8?B?T0JLMytHS3ZnaDNkVG11YldTNnphZTlZQ2dpVTdqNHN3Vlp3MWRaYXF1VGJt?=
 =?utf-8?B?Z3lSWmJoaTNEZHpOT1ozbkUrSmFKUFlmaGZWdlBVNE9FVXlZWnIxa2Fob0dn?=
 =?utf-8?B?ZGRmRDVNa0FWUkZUdEhXRDVVUkwzZjhEY2QvMG5JRlJncTZEM1psNXFsemlj?=
 =?utf-8?B?ZTZYTXBXSjhidjVuMHZURXdVaURmWHJpTEJkKzhkWVAza2lBM2s2R2ttaVZQ?=
 =?utf-8?B?aXNFUHowbDRDOExNeTlBVDJVRTV0WHZEelNSUVE1L1BnK0VDaENxOWp6UFho?=
 =?utf-8?B?ZklWRkp0bUNVK2J5Q29JTVJYTmdVczErSkd4VWVKVy9ydENFYXZ4S3ovd2FQ?=
 =?utf-8?B?TlJuTXk2bDduWXVFbzlRVnlpWkRDQ3U3ZktDbnQyZmI3bHI1MEhWQUMxSDgw?=
 =?utf-8?B?SmVVN3J3Rm1aNnBXYjhVeDJzYmIvT3ZuOEs3SUM1Nk9IMm5PMEpNanFRd1pR?=
 =?utf-8?B?L3d6MjVoclFiUUdXeW8xVnBpZCtoMHZTYllUblREM2lqVWgxMGZROWxLWnQ5?=
 =?utf-8?B?QlRML1l6dzVpMnF4V2JvaTJVemp1NFFLZDdWNi9OaktwSHNJWkVGR1YyTFVz?=
 =?utf-8?B?Q2NnOHBBUGkwVmN0NXdLcE5GNlFiSy9qaWlHTjBFR293c2VtNjRKNDFDMVFv?=
 =?utf-8?B?aEtpNTNiczJtNmVBWGxpY29DeHZsdlRVSVVFZzFLZ1F1MjQ5eW9lcnpNbHgv?=
 =?utf-8?B?THNWVmVnVXN6c2FXVHpReTB2S25YMGV4UlBjSkh0MDRhaTVzZUp6cGx4azgz?=
 =?utf-8?Q?FrokoKmuRcGuf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdjWHYxYzRja2lNbGZmbW1ZajBkL2NFdWZmQnFTeHJyT2lEemoydy9jeWNm?=
 =?utf-8?B?b2NqbkMwSTNPd1JDYWUyQVpXVTAwUlkweGFHYlRvYzJQVW1OME5EMEZxSzRn?=
 =?utf-8?B?VmxvUFN3dHpLK1FBUG5YYnNjYi9VL2VNRHpWTUozdWc0Vk41S0k0WHJWN3FS?=
 =?utf-8?B?YThaazVJWG5kNEJkL0pBZVYxYTB6bWZZYXdRTGhielJZbmVFUExsbkJpcU95?=
 =?utf-8?B?VHZZS0hDNEVkNlJWNjQ2MEpaNHFUNmJuemhhaGpJbXJZOWlKNzFncWV5bWlB?=
 =?utf-8?B?d0JiZGJZSXFnMitBajRNcTdtQUQrODRPVHNrZUJ2NnlMbFFLeVZ1L0VWZ01G?=
 =?utf-8?B?OVdFYW5GdE05cnhwK2Q3eGJTUlRiYzJOSnA3NEFNWW81Qi9WWXErN2t2SXdk?=
 =?utf-8?B?ZUE5TFhtQjNkdXcvUEJXT3dxcDJXc2J3M2RqbGpWQjVwK0dGZXNpczc0eDQ4?=
 =?utf-8?B?RGhmUlBhZ0FVdGwxRjRQTTJXeHNqczVaSmIyMEo3Q3Z6L0ZVVG5tZjdMVVhJ?=
 =?utf-8?B?OE43UnZ0ZlM1VUhzT201YUVuODRCckMzV01VZExqRklHYmczaFBsUXpWNkMw?=
 =?utf-8?B?bkdEZmJvT2xTZVFkUnBWM3FveE4vUm1MQTdjMW5nN1RoK1RyL0NEUElkK2h6?=
 =?utf-8?B?YVZLeit5VS9lNnA4WDhKWnlSVTlTVEhHNXZadGRFK3p2aWthcWgweHc2bVBV?=
 =?utf-8?B?cDV5b3lOZFlxY21sZG1qdmhqQVlsL3h6d1kyRDYvVU5tbzBuVVdKbDBlZ0dV?=
 =?utf-8?B?UFZpT09lMEg1VVJ0Vy9SOHFkT3JNSUpxVGtkeVZ5VEpxdGtNNldXVW4xS2xk?=
 =?utf-8?B?ZGNrdGxXc2t0Tzc3WjdIalNxQnB3UEp2WHdoWTIwVEROaUdIa0xXcVFmZGpp?=
 =?utf-8?B?bHdha2tmVnFqNG9VS2VVcFlkdjZhMnNDUENBbFBYOFJxaXBTN0x2RnVxdnpj?=
 =?utf-8?B?WWlWeE5pZ25YZW5uMkdPejVwSitNY3RMREgzUVIvVUZ3TTlra1VEb2lQOUlB?=
 =?utf-8?B?M0lTeFVoSFpyaE5XdzdEVWF6cTVield6YndDelQ1S0lSY3dvUjlSTUpWUkdt?=
 =?utf-8?B?NFcrakVBV2dDeExsQmkvQk80YkZrWGtzeEllTDFxV0FSZWxKNThsMnoyczRY?=
 =?utf-8?B?VFlJbnFDQjRkQjkzYlB3Y3ZEYXV3Yklkd0JZWFRna2ZlTjhXdG40dTJ1UWwx?=
 =?utf-8?B?YzF1blZ6dG4yZDE5YTRKUjdZMUU0ZWxCZ1JIZFpDMFNMYytNUzJrcSszVzJD?=
 =?utf-8?B?WVIrUXRWZXREQzREbG81QktYQ1U4ajk5MnZMUVpCdWFTNzVxVTFTbURUTmtm?=
 =?utf-8?B?MGUrRjFZbjcrZGxBcnZPeVFzZVNTMDlWeHdkK0hlZEc0NFdZbW8yU1BHeDhH?=
 =?utf-8?B?Sm1rTXVGM2VDRUI5NGtwVk4yUFV6LzhTdVUrVitJdUhOckpQMlZydGs2Mko0?=
 =?utf-8?B?UExCUjBZMEFIbGY0cEVaWTFHV1Y5VUkxRDk2UGEvdm1OY2FPdlRaeTlxZHRI?=
 =?utf-8?B?SmFLSnFvWDZKcTBMcFZJaGkvRXFxN1hRVnpReW95NXpCczExTmVCeVc4dnNv?=
 =?utf-8?B?dStyQytjcnYrSzVEWXBsS1hqU2JEUHZKbEpnZFhDTkd2cW5hMnkrbnQvbkpS?=
 =?utf-8?B?MzJEVkJQMFJpTWhUQjFKV2N3VXBFVmlBaWNFUTZLMkFzNUlaWnhhcTZhQmRn?=
 =?utf-8?B?YzFvZHhud2JBdVJnKzNWeVNhcFhwdGE1eXZ3YmlnVytpYWloRlZXaXlmR3Rh?=
 =?utf-8?B?YUNIR0x2K3NKMUdIOGdFSFIxVDNTeVRtTmltQnVid1BqRTIvc25uSGFrNFpL?=
 =?utf-8?B?clZjcG5nUVUxSm9OcXFMQkh6QjBwYzdycFVKY09yQ2kzWkV4L29ERFREK0Qy?=
 =?utf-8?B?WXVWZlprdW5Ed3dHVXh4ek51QndFNTE5dEsrVjlSdXNGOVg5TmlnR0RVWmZL?=
 =?utf-8?B?VGZwcmQ4RWFnZkh1bGRsMURPa0VOOU80TzNuUkhGV3NMTFVJOWt6SWpjaEIy?=
 =?utf-8?B?NktyOTdjb1NQWGlNYkEwbTl0MDE1ZHB3MHFvY0FaMlF4Zk1rNEJINlRocWJU?=
 =?utf-8?B?SGs4T0VuYnkybnhRN0ZENGp5QVpDa2J3MnJXMmVSZU91STlYTHNyTzdvWWVv?=
 =?utf-8?B?YTBrTWdjTnNFUVUrOVo1MlRiT2tHN1o2VTNQWmtqRVplM3Q0MWViR2FqVUlC?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 319583d4-f219-4548-1ac5-08dd3c476ed6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 07:19:26.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzvk+3jqQ6ipIXCUNViv8EnOOf3qoSKb0hWxCanKo2WaF8h7ulz5gxXOE9qh+kVb44zZfarlmlcPmDytoJeQZi6wLzOT3706w38FB4AEgzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
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



On 12/18/24 1:33 AM, Matthew Brost wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Introduce drm_pagemap ops to map and unmap dma to VRAM resources. In the
> local memory case it's a matter of merely providing an offset into the
> device's physical address. For future p2p the map and unmap functions may
> encode as needed.
> 
> Similar to how dma-buf works, let the memory provider (drm_pagemap) provide
> the mapping functionality.
> 
> v3:
>   - Move to drm level include
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   include/drm/drm_pagemap.h | 103 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 103 insertions(+)
>   create mode 100644 include/drm/drm_pagemap.h
> 
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> new file mode 100644
> index 000000000000..b6b387b81479
> --- /dev/null
> +++ b/include/drm/drm_pagemap.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef _DRM_PAGEMAP_H_
> +#define _DRM_PAGEMAP_H_
> +
> +#include <linux/dma-direction.h>
> +#include <linux/hmm.h>
> +#include <linux/types.h>
> +
> +struct drm_pagemap;
> +struct device;
> +
> +/**
> + * enum drm_interconnect_protocol - Used to identify an interconnect protocol.
> + */
> +enum drm_interconnect_protocol {
> +	DRM_INTERCONNECT_SYSTEM,    /* DMA map is system pages. */
> +	DRM_INTERCONNECT_PCIE_P2P,  /* DMA map is PCIE P2P */
> +	DRM_INTERCONNECT_DRIVER,    /* DMA map is driver defined */
> +	/* A driver can add private values beyond DRM_INTERCONNECT_DRIVER */
> +};
> +
> +/**
> + * struct drm_pagemap_dma_addr - DMA address representation.
> + * @addr: The dma address or driver-defined address for driver private interconnects.
> + * @proto: The interconnect protocol.
> + * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
> + * @dir: The DMA direction.
> + *
> + * Note: There is room for improvement here. We should be able to pack into
> + * 64 bits.
> + */
> +struct drm_pagemap_dma_addr {
> +	dma_addr_t addr;
> +	u64 proto : 54;
> +	u64 order : 8;
> +	u64 dir : 2;
> +};
> +
> +/**
> + * drm_pagemap_dma_addr_encode() - Encode a dma address with metadata
> + * @addr: The dma address or driver-defined address for driver private interconnects.
> + * @proto: The interconnect protocol.
> + * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
> + * @dir: The DMA direction.
> + *
> + * Return: A struct drm_pagemap_dma_addr encoding the above information.
> + */
> +static inline struct drm_pagemap_dma_addr
> +drm_pagemap_dma_addr_encode(dma_addr_t addr,
> +			    enum drm_interconnect_protocol proto,
> +			    unsigned int order,
> +			    enum dma_data_direction dir)
> +{
> +	return (struct drm_pagemap_dma_addr) {
> +		.addr = addr,
> +		.proto = proto,
> +		.order = order,
> +		.dir = dir,
> +	};
> +}
> +
> +/**
> + * struct drm_pagemap_ops: Ops for a drm-pagemap.
> + */
Hi,
In the following comment, the protocol should be removed and an 
explanation of order should be added.

Br,
G.G.
> +struct drm_pagemap_ops {
> +	/**
> +	 * @map_dma: Map for dma access or provide a virtual address suitable for
> +	 * @dev.
> +	 * @dpagemap: The struct drm_pagemap for the page.
> +	 * @dev: The dma mapper.
> +	 * @page: The page to map.
> +	 * @dir: The transfer direction.
> +	 * @protocol: The protocol to use.
> +	 */
> +	struct drm_pagemap_dma_addr (*map_dma)(struct drm_pagemap *dpagemap,
> +					       struct device *dev,
> +					       struct page *page,
> +					       unsigned int order,
> +					       enum dma_data_direction dir);
> +
> +	/**
> +	 * @unmap_dma: Unmap a dma address previously obtained using  @map_dma.
> +	 * @dev: The dma unmapper.
> +	 * @addr: The dma address obtained when mapping.
> +	 */
> +	void (*unmap_dma)(struct drm_pagemap *dpagemap,
> +			  struct device *dev,
> +			  struct drm_pagemap_dma_addr addr);
> +
> +};
> +
> +/**
> + * struct drm_pagemap: Additional information for a struct dev_pagemap
> + * used for device p2p handshaking.
> + * @ops: The struct drm_pagemap_ops.
> + * @dev: The struct drevice owning the device-private memory.
> + */
> +struct drm_pagemap {
> +	const struct drm_pagemap_ops *ops;
> +	struct device *dev;
> +};
> +
> +#endif

