Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C92BA359D9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D464A10EC13;
	Fri, 14 Feb 2025 09:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kowqi8zH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0EA10EC11;
 Fri, 14 Feb 2025 09:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739524300; x=1771060300;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OsEk3HPw658GWmgbpi6Jc4WKr5KQsFRmDxKQDLvCWHo=;
 b=Kowqi8zHNYy+SOqZ0miEmQDTqs+8Q86wx1+9SffskTPyl5YK79xKjHft
 Tm1faQjHxw9UDZki0loPnpSQOjtu1HbnfRBApktEwWxeJsoeRNe856UDP
 RLQ5nYlFRWjidBMvOQDpyNV9hVfOoHU0auoSvxjk3QGC5CynlWjLi/HWV
 43KPGc96NqZxhF51H4WoiDf6NzKjFSXdq2RCv9uP9lE8DwbDna9V62yjn
 fY321RBHqw7wZmCUQemZxw0KIv3K7c8V7ZybToNBsL+Y6XsiwwWL+N/tm
 PAFMBJUl4DtxhjrVkBFrXdx78DzHP2khRzbnrfOTl+NUFPgP2LJJAddUT A==;
X-CSE-ConnectionGUID: TbTTlMAVRfGvAZYeNZOHqA==
X-CSE-MsgGUID: hdpOWqwkQy2XhVDmqplR0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50912560"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="50912560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:11:39 -0800
X-CSE-ConnectionGUID: b2//Q0CBQFGoknnFwozHbw==
X-CSE-MsgGUID: PQCCbQ6ZSRmETiqpO4+ypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113270184"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:11:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 14 Feb 2025 01:11:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 01:11:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 01:11:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vL1WYjBYNG5rYRft9T9j8TycGKUR8E5o3ZzgsYn3+4d/cwPeUcYWpYlxC4RQWrNWEl64FyTefsg8DFcCoL/a7Pwl3i1TL+/nKH9kIB2vXVcgY6iM9XsuyrfAXRROntdd9GEMnQNYDcd1MvFrYE2HzZPiyds7cZh1mNrrFFMdPwXNYjoTLgg5BjqWa+mukzKiQC1KyH/h0DWapKlWYPmeCoji6DLFulgkTCoR7Mnd37WG042xwBn8J/JVD+/ndjk3UH3dXWC285+/KT005I0w0Rbthf2cSIixfTn4wYIZf8GwoDaOd3T2IoI+nQSvUDAuID0P7qjFkFUZbaF1KdDAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsEk3HPw658GWmgbpi6Jc4WKr5KQsFRmDxKQDLvCWHo=;
 b=iYVH5c8toxO+XXDCfwhiS8bl/IaIzmeHDRvj2HSPpvyvNCQM/s1d/378VKZ9U/8IqGXSvMzFP3SJkPw8Uyw0qefCfbVeUtRLoM2cjpAQ8qX1MGp9ayMJlc/UXndvVRyN2XZFFAlnT7agine8GR9VTXP8kfBTJK5MvUYTFDzcT7uL0OiaC+koP45ERvFUxq8Ue3YDgUBAN6KqyLU2q5u+HaI6lYhvJXtFPgwsEjewfOfcYiW6aUEGD6tFy2Ns+qv1aORtY03j26qRbR3kGsXARXCPtrTMLTUCrXxkNKQww1yLv8Jdus4yFuBn+rRv6Ojnzyirhb7T7+ISYJXPIi0jpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 09:11:36 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 09:11:36 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v8 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Topic: [PATCH v8 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Index: AQHbcZ6IUCjPfJat7kCU6aRfqws5ObNGnLEA
Date: Fri, 14 Feb 2025 09:11:36 +0000
Message-ID: <SN7PR11MB675087217709EED0E1BD4960E3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-2-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-2-871b94d777f8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH7PR11MB8600:EE_
x-ms-office365-filtering-correlation-id: 86406d32-a868-4e52-c56e-08dd4cd79565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MXdJTGxvSGRkUUFjekVMRlZaNk9DODZZV1dEbklrcU5aL3dCTUlwcUxEcUlp?=
 =?utf-8?B?Zm81NFlENXpMUTBEQVRrYytTWkdVbU45eExnNzdRZXVDeUdla25rTEhnanhP?=
 =?utf-8?B?OGNhczVZdVM2OUZYSktuYW40YWtRSDRXWUVSVStTK2FKSW94aFNxRnVkeVd5?=
 =?utf-8?B?aFpNWVd6STQzR0FwckFDTnZNM3ZNa2J4azczZDFqSW44RCtsTmQzQ1dKQVZH?=
 =?utf-8?B?RlRhbXZyT29INFVsd2FqQU1YWVBiWnhIWjhXMVpucTJEazhMd0NTRzBFZjZJ?=
 =?utf-8?B?dExIak1QNFdvUTdsaHIyUG9UY0VuejlKN3N0TGlMc2ZZbXhUclhzaWh5QnpV?=
 =?utf-8?B?OXRDZTNVRnZHVWxLNmxVK2l1eWI0M0NoUENLZDh4Sjgrd2dxaVhxcHBUZUNW?=
 =?utf-8?B?WTExbDdPL2Jmek9tL1RBcmkzOFBXY2prQUdyV3VMdE40RUF1SmxtRENQQnBi?=
 =?utf-8?B?Z3VVUkc0M1F4REY2Ym9ZQTA3ZTRjWjdkS2htellpVXc5am5reDlEUXVFd0x2?=
 =?utf-8?B?UHlKZHV5ZUVncnpjWm1WT2FxTlZKZEF0VEZmUEpwN3JqdU02aEVoMitHMUtR?=
 =?utf-8?B?VkhleWVneWRIa2F4bWE1RHJvVThmclR4VmN1UEdjWUlRNS9wQVp4M0tUMDNZ?=
 =?utf-8?B?eGZ6R1ZXbi93VGN1M0FZdGs0S0NXNFdPcmRuYmdNcjVneHFJdVVyOWJ4b0JK?=
 =?utf-8?B?WVNOUzNWaGZmTnFqR0Y4ekwrdDFnUGMwZmlTdmczNVdkWDljcmkybmVPSDI5?=
 =?utf-8?B?UGZEcXFSc3U4QUx1bFR3bkRQaDk4RUNYZU1uNnZDclpkOXRCTTdoQWRRbENz?=
 =?utf-8?B?MzE3OS9DZTlSbW5ZYVd3Q1FJUkR1RklLU0dxVlkrSkQvelBXRHBDTGVONnhU?=
 =?utf-8?B?NW9wdExJRmJNRERFandLOHdWcy9pek9iT0NJMEI3VnRIYXN6YnVmTDVFTHpW?=
 =?utf-8?B?dVVUYVgxQ3Q3NXEyOTNrUzk0T2EzSWJWcGVINVA5Vkt5MFJMSFRMc05CSWtn?=
 =?utf-8?B?WURQTzdNNDZUZ0ZiWWg2VjZtSFpBbUJZSHNzRUN4dHgxQXVXbXMwaEExazhH?=
 =?utf-8?B?SVB6cUJuVi9kN1dyT0h4SUxGZFNNR1ZkK25KVlhERkl6MnBsSTNVRWNvVEVL?=
 =?utf-8?B?elVoUGhVK3k2UDZpb0NlbTJpNFZxK0dvdDh4cEZzVXBGSWVheXpuY2VXd1JE?=
 =?utf-8?B?dmRhNVZHdXNUM0hBVW1yK0M4OVBGRmJSSWxKMVFKN09MTTRrbnBSYUlRMTJQ?=
 =?utf-8?B?ZkVsb2U0TkdzVDYvd2FXZ0ptZ1A0VE5iSGI2SmFuSXlMNHljV3k0Q05pWHds?=
 =?utf-8?B?VlZDUmU2dTNJR2RFVmhDcGIxKzNKRndHbzBtTFUzOVg5N1FFTkRLRVpOdDRB?=
 =?utf-8?B?cTllOVhhazVlMFJ0c0tIa1ZiVlphSGpPdWJiYXZVWXBOMytLTWhqck50U3Nu?=
 =?utf-8?B?WUVaV0VWMUNUSkU4V0tSSUtWWHNFczNrbTY4NHVBR1BnVFl2RHRpblZ5UnR3?=
 =?utf-8?B?TzhIdXUydFU2V0NVb3JIbTVJcGVSYm16VGRZQ3dmMnJYQllIN3JQOVVUUi9G?=
 =?utf-8?B?SnhQeXl3emhqWUtuTElWSjRPSCtncERYVjA1U3ZDNHo4M2JXSzJKTEc5bWRW?=
 =?utf-8?B?NFhhdzM3bzN6Mms5aEpnZ3hiK1hNRWpFdWtOMng2ckxLOE9wNStKTUdDUEIw?=
 =?utf-8?B?MEtOdXNQaTFsci9FUWpmVzl5bU5OWi8ybHNORFAvZUdvQXFrQXNhaXhmNm50?=
 =?utf-8?B?YzBlVlBGR0Z6eEZGekZkZTJCMDkrZEJwMC81TXlsR3NSTHNnZGtFQkFzNGZI?=
 =?utf-8?B?NFBnOE1LYnRxUTFsdUpDRnNIYUppb3duL1c1S1dFaC9YRDIxeTRLY1dyYjNs?=
 =?utf-8?B?K3pwYzNXRjFjK3pjVGk2UEw5TENKOUc0NlNUb2R4UWQ5RWtkN0E2dVhHNXRS?=
 =?utf-8?Q?JslEFqXuu9OoGcXWP+WPsoGAyyOoIPLU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3Y4TDg1RTgxdC8ybkEvZlhFZVd6cTQ1ZjhlbEJGZXRjdjBoNC83MHdZbzgv?=
 =?utf-8?B?YVIwQXZLRXMxS3JzTE1TWkJ1ZFJ6SnJDSzBlM0xLenBKdzVablhMbFFVdTJW?=
 =?utf-8?B?TkZzUHpDaE9GcFJyZUtoYUo1clp0WVd4Ly9ydlF6NWhic2FYUGMwbnlrQVhW?=
 =?utf-8?B?b2ZkNDZ3Vks4T1ZUNXBnTElnaC91bmlCaGdhZWcvd0Q2cW54Yy8rVmVBQ0Vh?=
 =?utf-8?B?Z2RVRHo3NE04ZnI4UkFNalVhdlJDWXd5d3M5azhXc3M4K09zZGQ3TTREQUpu?=
 =?utf-8?B?MzlMaEJLanU1YXBteVFrTzRsRW5jS0xYRGtpMVBuR0ZTek1hM2wxRVdzWHpr?=
 =?utf-8?B?OFB3ckhOanpjWVI2TTZoRVFSRVo1em5CQkx1QmF6TUlhdUFGdkVyT213S0k5?=
 =?utf-8?B?ZUJYVGQ3M3hLNEFIZncvcTFCYVZRSHRzR0lGUFFtNG03RFQzV25HWmdIeERF?=
 =?utf-8?B?WmpSaThEaWM3U3Z1RHR0VGRlTENnZnNFbkdQLzJMV2JwUjY4UHNNZVQ5VU9P?=
 =?utf-8?B?Sjl3SlQ0RFRBRlcrRmZSZGpERXQxZnR4Q1YyVjR4aHRkOUdzeTVUWHFPQ2Ja?=
 =?utf-8?B?WElsVUFYN3RCaENIVFBVRkVVL2g4V1ViWHJpVmUrNi90a3ZRVVlwbGd3bHlP?=
 =?utf-8?B?RW14Kzc2UHdGRC9odWtJb1hDbFR0ZFFFdTVIY3g3M28zckt6S0s3TENFbEVB?=
 =?utf-8?B?UWVBSGRDZkF0UWFwZUM0WVFsdHFTaHhLUGhIazRjYVZYVCsvZjFQRXpVOFpV?=
 =?utf-8?B?SlRuUFNYVGJFVExDSE01VlFoejA0VmhXZUFpVzhXbjJ5c1BtN1ZxdytWZUhj?=
 =?utf-8?B?b3NsTTV5eTRKWTNqTUNtZGs2MGUxbENvbXc1TDY5cnBEc21uUUdERFVab2ZX?=
 =?utf-8?B?dFp6SENYMjRLTkZJTlVWN1o5aElZK1RWdmtaYmNoeURsUzQ2ZTFGblM4ZHZt?=
 =?utf-8?B?Z2JZeWNoZWtzYkJOTUllQXNGNllPSmdtNDQzQmRVdTVxdDR2d0srWE5iSGRt?=
 =?utf-8?B?d1BTTi96Z1daTWd3UkozSlNaOVB1akFUL2VzK29TUXVsaUtla1dmSlB2RmNw?=
 =?utf-8?B?RVdHUExFcDVIeUgwZFAzUG1WTEV6RUlRZVBDRXZ4SEMzZ3Z3cEY3eUxhakIy?=
 =?utf-8?B?dHVQMFY0K2htOHo3bm00bWJMSkRjdVpvUG44ZDBzNXNCSlIya1RSam85NjRv?=
 =?utf-8?B?dFB5MldyRkdVdzczVTlnbXBla214SlVmNmNlZVlJM1FxaFdMWlA1NXdnMTFG?=
 =?utf-8?B?UVB3b0FpWFB4enUrOGtremtsNTlBUktobDBBVit0K0Y3ck5QZkU4ako5YjRI?=
 =?utf-8?B?eVpoSzZDNytSTWVlYlZrY2xIakVlb28yVm11cjRpc2hpZ3VKNlQ2dk0yS3pW?=
 =?utf-8?B?RCtxcUJlZWo1V1JzR0NtMXBtOWFSMUtYREhwMlg3THNiTWl3VEQvSDRCUDdv?=
 =?utf-8?B?T2lEZ0FzWkFXdmNOcVlIUGlRRXBKODhLWWdUTGRRdzFDVlA0bFBHaVY4V3I2?=
 =?utf-8?B?cTFaSjNOb245ZVdqU3RCbmdPMlVJaHArcHRQU0FJNXN1eWVDTkoyNVR6T0FU?=
 =?utf-8?B?ellJQ0RmM1pGWUEzRUM1cGJKTVlWdFZER0ltbmR6dkc1czEyUlkrRVRpNk1y?=
 =?utf-8?B?dytpdnVFS0dlck5nU0wwTEkrdnB6d2x5K1BjSERvNGtjOG9tTWRxUnRHMUlV?=
 =?utf-8?B?b0t6SWRidzh3RTVZYzdYOUROUFJZZDZSWk5QZStVWlBxVmdWNkgvTlZBVzZZ?=
 =?utf-8?B?UUpzU0FkZkF4b0d1dmVYWDl1L25pQnlmbnIzTG9NQVhNWUxXdUsrY2VaY0Vn?=
 =?utf-8?B?R0VWWldjazMya3VSNW5QZDByc2xvL0pLL3d2OWFnQlpjbmZrbFA3WkJVUTZk?=
 =?utf-8?B?dlNZeU5hQk83Mi9jZFZRcStDbWlsT2plQWY2SzVIMHBQcU4zSysxN040bnhr?=
 =?utf-8?B?SWpZT29lYmpTKzIrSS9vcjdpdTdqR2REWURuM0JGVENXdm5mQndJL3Q2MWhw?=
 =?utf-8?B?QnpLeGVsYU5tMFRhNy9ac3hlQ2ZtWDdROHoxYWF1MmRscnRQSUZwQnhNZmFu?=
 =?utf-8?B?NnpYa1VMckR1QmlPU1d3clF3TEdWcnYrdkhiRlp1c0VSZ09mYlVOWFhpKzBl?=
 =?utf-8?Q?uzUeAKwPmRQmwypg6RLUqPk5G?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86406d32-a868-4e52-c56e-08dd4cd79565
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 09:11:36.4202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sfn0x4MjVp/XN1LPRTy6gHOdy9LO/kw7ZHvzv03FSIKuug5rtqevwaZCQ/0O8QttJ2u1ab8hVfB3sRP0NWIMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI4LCAy
MDI1IDk6MjEgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gQ2M6IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47IGRt
aXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsNCj4gTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjggMDIvMTRdIGRybTogRGVmaW5lIElt
YWdlRW5oYW5jZW1lblQgTFVUIHN0cnVjdHVyZXMNCj4gZXhwb3NlZCB0byB1c2VyDQo+IA0KPiBJ
bWFnZUVuaGFuY2VtZW5UKElFVCkgaGFyZHdhcmUgaW50ZXJwb2xhdGVzIHRoZSBMVVQgdmFsdWUg
dG8gZ2VuZXJhdGUgdGhlDQo+IGVuaGFuY2VkIG91dHB1dCBpbWFnZS4gTFVUIHRha2VzIGFuIGlu
cHV0IHZhbHVlLCBvdXRwdXRzIGEgbmV3IHZhbHVlIGJhc2VkDQo+IG9uIHRoZSBkYXRhIHdpdGhp
biB0aGUgTFVULiAxRCBMVVQgY2FuIHJlbWFwIGluZGl2aWR1YWwgaW5wdXQgdmFsdWVzIHRvIG5l
dw0KPiBvdXRwdXQgdmFsdWVzIGJhc2VkIG9uIHRoZSBMVVQgc2FtcGxlLiBMVVQgY2FuIGJlIGlu
dGVycG9sYXRlZCBieSB0aGUNCj4gaGFyZHdhcmUgYnkgbXVsdGlwbGUgbW9kZXMgRXg6IERpcmVj
dCBMb29rdXAgTFVULCBNdWx0aXBsaWNhdGl2ZSBMVVQgZXRjIFRoZQ0KPiBsaXN0IG9mIHN1cHBv
cnRlZCBtb2RlIGJ5IGhhcmR3YXJlIGFsb25nIHdpdGggdGhlIGZvcm1hdChleHBvbmVudA0KPiBt
YW50aXNzYSkgaXMgZXhwb3NlZCB0byB1c2VyIGJ5IHRoZSBpZXRfbHV0X2NhcHMgcHJvcGVydHku
IE1heGltdW0gZm9ybWF0DQo+IGJlaW5nIDguMjQgaS5lIDggZXhwb25lbnQgYW5kIDI0IG1hbnRp
c3NhLg0KPiBGb3IgaWxsdXN0cmF0aW9uIGEgaGFyZHdhcmUgc3VwcG9ydGluZyAxLjkgZm9ybWF0
IGRlbm90ZXMgdGhpcyBhcyAweDEwMDAxRkYuIEluDQo+IG9yZGVyIHRvIGtub3cgdGhlIGV4cG9u
ZW50IGRvIGEgYml0d2lzZSBBTkQgd2l0aCAweEYwMDAwMDAuIFRoZSBMVVQgdmFsdWUNCj4gdG8g
YmUgcHJvdmlkZWQgYnkgdXNlciB3b3VsZCBiZSBhIDEwYml0IHZhbHVlIHdpdGggMSBiaXQgaW50
ZWdlciBhbmQgOSBiaXQNCj4gZnJhY3Rpb25hbCB2YWx1ZS4NCj4gDQo+IE11bHRpcGxlIGZvcm1h
dHMgY2FuIGJlIHN1cHBvcnRlZCwgaGVuY2UgcG9pbnRlciBpcyB1c2VkIG92ZXIgaGVyZS4NCj4g
VXNlciBjYW4gdGhlbiBwcm92aWRlIHRoZSBMVVQgd2l0aCBhbnkgb25lIG9mIHRoZSBzdXBwb3J0
ZWQgbW9kZXMgaW4gYW55IG9mDQo+IHRoZSBzdXBwb3J0ZWQgZm9ybWF0cy4NCj4gVGhlIGVudHJp
ZXMgaW4gdGhlIExVVCBjYW4gdmFyeSBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlIGNhcGFiaWxp
dHkgd2l0aCBtYXgNCj4gYmVpbmcgMjU1LiBUaGlzIHdpbGwgYWxzbyBiZSBleHBvc2VkIGFzIGll
dF9sdXRfY2FwcyBzbyB1c2VyIGNhbiBnZW5lcmF0ZSBhIExVVA0KPiB3aXRoIHRoZSBzcGVjaWZp
ZWQgZW50cmllcy4NCj4gDQo+IHY4OiBkZWZpbmUgZW51bSBmb3IgaWV0X21vZGUsIGFkZCBtb3Jl
IGRvYyBmb3IgaWV0IG1vZGVzIChEbWl0cnkpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIg
TXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL3VhcGkv
ZHJtL2RybV9tb2RlLmggfCA2OA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fbW9kZS5oDQo+IGluZGV4DQo+IGI4YjdiMTg4NDNhZTcyMjQyNjNhOWM2MWIyMGFjNmNi
ZjVkZjY5ZTkuLjAwNmJlNjIyMThiZjFlOTg1YzJjYTYzNTINCj4gY2IwNDExMGEzOGQxZTg0IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gKysrIGIvaW5jbHVk
ZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+IEBAIC0xNDIwLDYgKzE0MjAsNzQgQEAgc3RydWN0IGRy
bV9oaXN0b2dyYW0gew0KPiAgCV9fdTMyIG5yX2VsZW1lbnRzOw0KPiAgfTsNCj4gDQo+ICsvKioN
Cj4gKyAqIGVudW0gZHJtX2lldF9tb2RlDQo+ICsgKiBARFJNX01PREVfSUVUX0xPT0tVUF9MVVQ6
DQo+ICsgKiBMVVQgdmFsdWVzIGFyZSBwb2ludHMgb24gZXhwb25lbnRpYWwgZ3JhcGggd2l0aCB4
IGF4aXMgYW5kIHktYXhpcw0KPiAreT1mKHgpDQo+ICsgKiBUaGlzIGYoeCkgY2FuIGJlIHRoZSBh
bGdvcml0aG0sIGRlZmluZWQgYnkgdGhlIHVzZXIgc3BhY2UgYWxnb3JpdGhtLg0KPiArICogV2hl
biB0aGlzIExVVCB0YWJsZSBpcyBwYXNzZWQgdG8gdGhlIGhhcmR3YXJlIGl0IHNpZ25pZmllcyBo
b3cgdGhlDQo+ICtoYXJkd2FyZQ0KPiArICogc2hvdWxkIHVzZSB0aGlzIHRhYmxlIHRvIGdldCB0
aGUgTFVUIHZhbHVlcy4gSW4gdGhpcyBtb2RlIGl0cyBkaXJlY3QNCj4gK2xvb2t1cA0KPiArICog
dGFibGUuIHgtYXhpcyBjb3JyZXNwb25kcyB0byBpbnB1dCBwaXhlbCB2YWx1ZSBhbmQgeS1heGlz
DQo+ICtjb3JyZXNwb25kcyB0bw0KPiArICogdGhlIG91dHB1dCBwaXhlbCB2YWx1ZS4NCj4gKyAq
DQo+ICsgKiBARFJNX01PREVfSUVUX01VTFRJUExJQ0FUSVZFOg0KPiArICogTFVUIHZhbHVlcywg
eCBhbmQgeSBhcmUgcG9pbnRzIG9uIG5lZ2F0aXZlIGV4cG9uZW50aWFsIGdyYXBoIHdpdGgNCj4g
KyAqIHgtYXhpcyBhbmQgeS1heGlzICh5ID0geS94KS4gVGhlIHZhbHVlIHBhc3NlZCBieSB0aGUg
dXNlciB3aWxsIGJlDQo+ICsgKiBpbiB5L3ggaS5lIE91dFBpeGVsL0luUGl4ZWwuIFggY28tb3Jk
aW5hdGUgcHJvcG9ydGlvbmFsIHRvIHBpeGVsDQo+ICt2YWx1ZQ0KPiArICogYW5kIFktY29yZGlu
YXRlIGlzIHRoZSBtdWx0aXBsaWVyIGZhY3RvciwgaS5lIHgtYXhpcyBpbiBwaXhlbHMgYW5kDQo+
ICsgKiB5LWF4aXMgaXMgT3V0UGl4ZWwvSW5QaXhlbC4gc28gdXBvbiBtdWx0aXBseWluZyB4LCB5
IGlzIG9idGFpbmVkLA0KPiArICogaGVuY2UgbXVsdGlwbGljYXRpdmUuDQo+ICsgKiBUaGUgZm9y
bWF0IG9mIExVVCBjYW4gYXQgbWF4IGJlIDguMjQoOGludGVnZXIgMjQgZnJhY3Rpb25hbCkNCj4g
KyAqIHJlcHJlc2VudGVkIGJ5IHUzMi4gMzJiaXQgaXMgdGhlIGNvbnRhaW5lciBhbmQgaWYgMTYu
MTYgaXMgY2hvc2VuDQo+ICsgKiB0aGVuIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBib29zdCB0
aGUgcGl4ZWwgYnkgMl4xNi4gSGVuY2Ugc2V0DQo+ICthc2lkZQ0KPiArICogOGJpdCBmb3IgaW50
ZWdlciAyXjggdGhlcmVieSBib29zdGluZyB0aGUgcGl4ZWwgYnkgYSB2YWx1ZSAyNTUgd2hpY2gN
Cj4gKyAqIGl0c2VsZiBpcyBhIGh1Z2UgYm9vc3QgZmFjdG9yLiBSZW1haW5pbmcgMjRiaXRzIG91
dCBvZiB0aGUgMzJiaXQNCj4gKyAqIGNvbnRhaW5lciBpcyBmcmFjdGlvbmFsIHBhcnQuIFRoaXMg
aXMgYWxzbyBvcHRpbWFsIGZvciBpbXBsZW1lbnRpbmcNCj4gKyAqIGluIHRoZSBoYXJkd2FyZS4N
Cj4gKyAqIERlcGVuZGluZyBvbiB0aGUgaGFyZHdhcmUgY2FwYWJpbGl0eSBhbmQgZXhwb25lbnQg
bWFudGlzc2EgY2FuIGJlDQo+ICsgKiBjaG9zZW4gd2l0aGluIHRoaXMgbGltaXRzLg0KPiArICov
DQo+ICtlbnVtIGRybV9pZXRfbW9kZSB7DQo+ICsJRFJNX01PREVfSUVUX0xPT0tVUF9MVVQgPSAw
eDAxLA0KPiArCURSTV9NT0RFX0lFVF9NVUxUSVBMSUNBVElWRSA9IDB4MDIsDQo+ICt9Ow0KPiAr
DQo+ICsvKioNCj4gKyAqIHN0cnVjdCBkcm1faWV0X2NhcHMNCj4gKyAqDQoNCkxldCdzIHJlbW92
ZSB0aGUgc3BhY2UgaGVyZQ0KDQo+ICsgKiBAaWV0X21vZGU6IHBpeGVsIGZhY3RvciBlbmhhbmNl
bWVudCBtb2RlcyBkZWZpbmVkIGluIGVudW0NCj4gZHJtX2lldF9tb2RlLg0KPiArICoJICAgICAg
TXVsdGlwbGUgbW9kZXMgY2FuIGJlIHN1cHBvcnRlZCBieSBoYXJkd2FyZSwgdGhlIHZhbHVlIGNh
biBiZQ0KPiArICoJICAgICAgT1JlZC4NCj4gKyAqIEBpZXRfc2FtcGxlX2Zvcm1hdDogaG9sZHMg
dGhlIGFkZHJlc3Mgb2YgYW4gYXJyYXkgb2YgdTMyIExVVCBzYW1wbGUNCj4gZm9ybWF0cw0KPiAr
ICoJCSAgICAgICBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlIGNhcGFiaWxpdHkuIE1heCBiZWlu
ZyA4LjI0DQo+ICsgKgkJICAgICAgIERvaW5nIGEgYml0d2lzZSBBTkQgd2lsbCBnZXQgdGhlIHBy
ZXNlbnQgc2FtcGxlLg0KPiArICoJCSAgICAgICBFeDogZm9yIDEgaW50ZWdlciA5IGZyYWN0aW9u
IEFORCB3aXRoIDB4MTAwMDFGRg0KPiArICogQG5yX2lldF9zYW1wbGVfZm9ybWF0czogbnVtYmVy
IG9mIGlldF9zYW1wbGVfZm9ybXN0cyBzdXBwb3J0ZWQgYnkgdGhlDQo+ICsgKgkJCSAgIGhhcmR3
YXJlDQoNClR5cG86IGZvcm1hdHMNCg0KPiArICogQG5yX2lldF9sdXRfZW50cmllczogbnVtYmVy
IG9mIExVVCBlbnRyaWVzICAqLyBzdHJ1Y3QgZHJtX2lldF9jYXBzIHsNCj4gKwlfX3UzMiBpZXRf
bW9kZTsNCg0KQWdhaW4gZG8gd2UgcmVhbGx5IG5lZWQgMzIgYml0cyBmb3IgdGhpcyAxNiBzaG91
bGQgc3VmZmljZQ0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICsJX191NjQgaWV0X3Nh
bXBsZV9mb3JtYXQ7DQo+ICsJX191MzIgbnJfaWV0X3NhbXBsZV9mb3JtYXRzOw0KPiArCV9fdTMy
IG5yX2lldF9sdXRfZW50cmllczsNCj4gK307DQo+ICsNCj4gKy8qKg0KPiArICogc3RydWN0IGRy
bV9pZXRfMWRsdXRfc2FtcGxlDQo+ICsgKiBAaWV0X2x1dDogdGhlIGFkZHJlc3MgaW4gdGhlIGZp
ZWxkIGRlc2NyaWJlcyB0aGUgZm9ybWF0IG9mIHRoZSBkYXRhDQo+ICsgKgkJY29ycmVzcG9uZGlu
ZyB0byB0aGUgQGlldF9tb2RlDQo+ICsgKgkJSW4gY2FzZSBvZiBkaXJlY3QgbG9va3VwIHRoaXMg
aXMgTlVMTCwgaW4gY2FzZSBvZg0KPiArICoJCW11bHRpcGxpY2F0aXZlIG1vZGUgTFVUIGV4cG9u
ZW50IGFuZCBtYW50aXNzYSBmb3JtYXQuDQo+ICsgKiBAbnJfZWxlbWVudHM6IG51bWJlciBvZiBl
bnRyaWVzIHBvaW50ZWQgYnkgdGhlIGRhdGEgQGlldF9sdXQNCj4gKyAqIEBpZXRfbW9kZTogaW1h
Z2UgZW5oYW5jZW1lbnQgbW9kZSwgdGhpcyB3aWxsIGFsc28gY29udmV5IHRoZSBjaGFubmVsLg0K
PiArICovDQo+ICtzdHJ1Y3QgZHJtX2lldF8xZGx1dF9zYW1wbGUgew0KPiArCV9fdTY0IGlldF9s
dXQ7DQo+ICsJX191MzIgbnJfZWxlbWVudHM7DQo+ICsJZW51bSBkcm1faWV0X21vZGUgaWV0X21v
ZGU7DQo+ICt9Ow0KPiArDQo+ICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykNCj4gIH0NCj4gICNl
bmRpZg0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
