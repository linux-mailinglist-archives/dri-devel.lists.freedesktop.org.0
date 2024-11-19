Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1179D1F76
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 05:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D06510E5B0;
	Tue, 19 Nov 2024 04:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcgevmJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8298310E274;
 Tue, 19 Nov 2024 04:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731992129; x=1763528129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBVU7HnFM7Fv86iCrSLClosrlyHWj1KsAviN66sUbL0=;
 b=hcgevmJVMzqKASxvFquM7TweRiPzcvLGzxNnFljuJRA1Ky01VKpfMeB6
 /F9IoMiSiMmpiOjPyAdpyIZnpsMUb/mvDMtvYUj3ErfPmVQBklVvknaKd
 9boXcyrFT5hKoycMwLOsjvZBF0cNgeSnq6I+dF1tUn3DvD4Zivc+hZZvv
 2ZjIDbuprii6x6llFS0Yg5TB/xqzkeqNcK42W4tOWf1RVRA3kOSV8bgDn
 5PfBrgkxYnRV1jaIRIEKuIbJTHY+7bxVee4XWxg8ZKTZI0FGFUtbAySl9
 +KrTjcxIezE0evzSF4i1sJ5J30xRO5APfMy3CJ3uWWrbzYdrniNZyQnKx g==;
X-CSE-ConnectionGUID: JTzfij6ySVmOb8Z4bIEetw==
X-CSE-MsgGUID: Ei4RKPESS/mksloiNYUigA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19585014"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19585014"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 20:55:25 -0800
X-CSE-ConnectionGUID: ICyUpprwRJ6AavHEPw3iKg==
X-CSE-MsgGUID: xy/HDUrBQ5+2IXIiMWvobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="93897890"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 20:55:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 20:55:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 20:55:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 20:55:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2noBvVr2rVP02G2Y+tisxkzKXLi34w3S8m4RumR5Hnl8mivGYsK8iOFEX7T3SKwdomVQW3OXdB6h4eJR/61lsdhx+pFuKn4/tVkCjdFCnKc/A7IR212fDrKrZ9My7uVjxAWDlpawCIAfFUWzy9fHPevQaAI6cilTtSo7ilnLW/cZE+0FNIcdVTKzCB7YMPWtGtR8kz/5aTSmIfOB3PnG3JNZ+Y3zHq9DhUfFw+mzIjPfZuVxYBmxWl/Z87bR1nLnkIKDZVV48y5Vevl5V3/XNlqFenw/slV9UyB+/UHoWxY05Npde2v7lirAWdf0MGhfV1jjHUKCM+QbM598kWurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYuoL3p2G3HTl7dSyxdKJAzThAO4ZeKznm/dzrdEAjE=;
 b=UHeno3QRD1lsUd3gCHvCmCdZ6z7aPXWCmlBkX9LhZzKuepZpRyKtomGwOgGBwtOm1dYMTmjqBnocvsoGO/3UWeldfbC82Cvs5XbfQw2n//VRaz4q2QKxReCk3aPvcEA6M2NNde3nOYVRCIE9FrQbB8QOYooc383QWc1tsFElYLroEdJ8pBGd65te5ZH2k7t55s5Nuk1wZhpHrCI/j5NfyygRJASwcooyCPoh6MaViBtJ9KYaYFtTnqebnDpGiu7mUz6m1JmwHS2+RX3k182ntWXfdypoSJIeC+cDnhEWQZs0FfnNckAWKEooJiqV4OiXPDrYlppDtSsanPP4MIZ9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 04:55:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 04:55:20 +0000
Message-ID: <9249af09-3943-4c72-ab44-08f08ea4807e@intel.com>
Date: Tue, 19 Nov 2024 10:25:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] drm/xe: Use device wedged event
To: Raag Jadav <raag.jadav@intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>, 
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <jani.nikula@linux.intel.com>, <andriy.shevchenko@linux.intel.com>,
 <lina@asahilina.net>, <michal.wajdeczko@intel.com>,
 <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <alexander.deucher@amd.com>,
 <andrealmeid@igalia.com>, <amd-gfx@lists.freedesktop.org>,
 <kernel-dev@igalia.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241115050733.806934-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::24) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e03a6a6-ef15-415e-dcb7-08dd08565e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azNEODJoZWNlZzZ0ZWNCWTd4d00vbWREd2VvTEp3VC83SHIvQStidWpnaVor?=
 =?utf-8?B?N2Rpb0ZEaHVVSll0WXJyODlxM2psL3pUYnVvb0pxODQ4cW4wOVliNUF6alBw?=
 =?utf-8?B?UG56RW01Zy9rd1dGcXk0SjkyODROWWRXMmJlN21UNDNsbS9hc3p2UnR5NDNW?=
 =?utf-8?B?WmRJZjV3a1NTWis0TUFYcENJMWExRDFCRlpHQVNOTlh3T1UyMzVWQktBL0l0?=
 =?utf-8?B?WHBhUy85STc5WnNWZFNwcXVwZm1CNjlWaHMwNW1pbjMwb0pPOGplc0ZPVFRX?=
 =?utf-8?B?V2pySG14U3pKK3R6MlozaDhVbDZXaDUzRUhXVEZwMkh3NlRJZE5zQTdnZkJ4?=
 =?utf-8?B?dXlMeTZZZUVScnBoTlJJRlVhQW1SRWRUQXl2U3pJVm5MR3Z3Yi9ZczdRWVZF?=
 =?utf-8?B?KzNsN1BIQlVDQlR4YTF1ZjRGUjJnbnVtSDRHQjB6d1RHd05ITDVJMkF0aStj?=
 =?utf-8?B?c0ZmTkxUR21mb1pkdmREWWhhMWNLOGFpbWdnS2gzRjdDd2M4azhpVzZZY0xM?=
 =?utf-8?B?S3NhVVM1WjczZFJWZmNQeTZlQXFONk9PaHhmNEZsY25EMWhrRUxXOWtYQ3Fj?=
 =?utf-8?B?N1hMVDlGZmYxYmx6VUtud1R1R21ZZ2ppVW0vZFlTYXo0WEtGR29aeXB1cnJn?=
 =?utf-8?B?N2lSNWtjMThhNWIxRU5NY0NRNlp3THhGdG5RMjRkbnE0U1ZWa0dLKzVBYVFI?=
 =?utf-8?B?TUFxVDRmRERacFFxaWZJemV5TkxSQkU5UVhtYjh1UnRuay81VlJ0N24rWXhE?=
 =?utf-8?B?R3hoWUVLR25uNnd6TDYvdFNCRUpzRjJySk83VVBMaUdTbHNaeHJEaitsYzRv?=
 =?utf-8?B?R3BPc1pkN3VjWnMvQlJ2M3lmMUpqUFRtYXVGd1BtUmthdlcyRnhGSnFNN29z?=
 =?utf-8?B?UGJTMytCQXZaL05RUWRESVVvQlRrRFYwQ1Q5NkFOeGpWZnRCdDAxNklmVndp?=
 =?utf-8?B?U04zbFhYTzNqVEpnRkNZbmNTQkthd2lxelUxZWQ0VzRtcXJsMXNIYXRTL3ZW?=
 =?utf-8?B?MGJreWFEQ3JkeHl1K2F1RWl2NzVDc0ZZWmNiN2hnc0pSOENWblBVZ0lnYmtn?=
 =?utf-8?B?dUc0azhSWG9URkdkTWRjNzNreVZ4ODV6dG01V20wVmRjLzN3RkpabEFRWCtr?=
 =?utf-8?B?RVNiT3NDSFE0MmdNOElXNktMbUlsdjhSSlpJQ0xPeGxJV01uTE0zTlNueWly?=
 =?utf-8?B?bzFGa3NQejZ5SjJ2alErWTYzeWRXcUJJWklvQUhWU3RXeWtvZWpIUGxsMC9G?=
 =?utf-8?B?UHhtWWRYSC84UU4yM0QxekgvcnorZXJia0VIS0VTTWU3WGo2cDdGRDFxZkNl?=
 =?utf-8?B?RURJTzZSMWhXUDlKbjFoaFRkTnZJWVBCU2NsZ3JSeTMwOC95amt2bHo1U3Iv?=
 =?utf-8?B?T2R2T3QvUmF0THdFSEgyZmUreWFLQXVWMzgvSkVkL25KUUtxVG5UdzJJWTNN?=
 =?utf-8?B?QWloMnRHM0dlckdYc3RvNndicG5yUCtqSVBwVWhlNElHUHlpS29XREJXOUpi?=
 =?utf-8?B?OVZuOG0xRldxaTg2YjVxMFRidXlwYUJ5czFvVG91ZXgweldyRnNRY1ZyYmtx?=
 =?utf-8?B?MC81ODlPaWRXYUtQbjJmSUdzSFdjdkRPcXBGRDQyY1pzNVlPc1lrbUYzSWJk?=
 =?utf-8?B?bTJ0eWg1N1Awa2s1NktzYi9oSzNrcEZMVFdLNVBOdTdibCsrZEpLODh1OFRC?=
 =?utf-8?B?bTR0ZWdjQUIrUG00RWY3RlVvbk5penVzcHhCRHhjK0toNVg0REtkUUxkMDFV?=
 =?utf-8?Q?L59A5Dy8QtG7blRtpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlvaEs1YXMzRXNrUEVmQTJ0K21lTzBNT2VvSmZxc1RnZzkxNmFXdkFaSGlB?=
 =?utf-8?B?ZEdsNDlXNU5tVWV2YzQ4b3FUdU4wdnkwSWRCYTdzR0VJdWFLNndpNnlRZGxh?=
 =?utf-8?B?Tkoycy96UEpVcmVlbTBqTU1aMmNqV21yVUdQUXlBUHdPNHNnTi94YitFWnRI?=
 =?utf-8?B?SjB2Um9WT1F2a3BPV2szZ2MyUFB0aDlNdUdlckszQ0FxcVV4UzBYdnRaME9m?=
 =?utf-8?B?eitNWlpYcjhGUXlrMjUwNUpVc3Vmbm5Ya09CWUwzZTN2T2JjcjlNc1lxN3l0?=
 =?utf-8?B?OGdIem9LK05OWlc3cHdxNlAvSE5GdmN6WHNSUndtYlhDSFZSUGhteSs2NG00?=
 =?utf-8?B?dWgvaDJHWW1xbnZabm9OKzE2dE5hY2RoWEFEcllTT3lqVGZqcGthbG0rbDNl?=
 =?utf-8?B?czZHSVdHdXBPa250a1ZKblduSTZhQzNYK2VPZEFzSERORzR5dXdObmxxZHR2?=
 =?utf-8?B?U0ZwYWFiL1FIaCtZblFJL2FuR3BTd1NxempnR2V1MndaYmJKNUphMUJtTFFO?=
 =?utf-8?B?THhRSDhBWTdQck1WNG0vWURWMG9idWFpNzU2Yzd5d2pZTzJlMEpTQlRMRDQ0?=
 =?utf-8?B?Z2owdW8wM3RKSjVSVW5Zb2lzOUkwUW5IejJ2T2lqSlFQeFYyNkFWK0NkSXFm?=
 =?utf-8?B?OW40TU9EOTFDZUxES3FTRWJWMGVsUG9qa01xblhpUVF5WmRBVlR0QnNhTisy?=
 =?utf-8?B?NXZiWFNYRmJjd2NRQ0Z6cS9wYWNVSEt2SG0yaEdLdm5hTjJUNFhuUFZRdkw5?=
 =?utf-8?B?SkpCM3I1bDI4SXI4Ym1lR2JpenFRM3E1bGlYRUlGdXJrTU1mTXJ2VEU5SnlF?=
 =?utf-8?B?a3RJSTdtTWwzdEpBOCtHbXYvU3V6WlRuaDd6TzJmMWlVTjUrc1d0dlZ3OWZP?=
 =?utf-8?B?aGRVeE5aWDF4MU1BQ3FLQnJNYmNpaW93TlhnTTI0THVvQnBZMVJ6TnM3ODhS?=
 =?utf-8?B?NVlITWZpR2llVSt4WU55TW5TeHF2NG9QSk9Ic1IwN2NNVUMxVVpyNk9xWUtH?=
 =?utf-8?B?bmp4a21WVUF4eWpObUhVeERqdyt6MXgyZ2E4VDhDbThadVJDOTRPZVlWQ0Vs?=
 =?utf-8?B?bFYydVRFSEVubC9neHpSOW84QWlhTE5MVU80NHQ5R3JoL084a01ZU1lmbEpt?=
 =?utf-8?B?NlZZelhVOTVKQmxrNUhuSE0vTWd2emdsZ05ZdWw0cWxsU2t6ZmhXMVVYZGdq?=
 =?utf-8?B?VEdhcDhlS1hsOTVZY1pJaHUweDlMWEtYWDFqeUdCTCt0eWtJZGNNT2xLcnhq?=
 =?utf-8?B?UmREZWtJOC9DNE5WMW9vaU1jV1cxL0NvdmJNVStDbnkrdkR5YU81VnN5ZXVX?=
 =?utf-8?B?MnFibFRQZ2pFVE9XS3RvV0xVbHpHbm9hVU9GY2N6d1F6Wnp0elpiSVZLSk9p?=
 =?utf-8?B?QWZ0OHNNSE5HaHZ0V1VnSFJhTFZscDBxaFQ0dG9TYXJSckxUMmNJU3RNc2wr?=
 =?utf-8?B?eXdKN0VOUG42dUVobnZlZWdidUlBNklaZnpTQ3g1ZFJQc3M5MWhuYlFNelVC?=
 =?utf-8?B?eWxGNXoyZmNFaDFzZzVrT09lTkJ6R0ZIMFBMRmFaWU5xV1RFNS9nVkJSM01j?=
 =?utf-8?B?WlhPWFFQem5IYnArNlg2OWhkNFlkTEZXODROdXF2VG5zZEZGODFwRXRSKzJm?=
 =?utf-8?B?T01vMGt1OFpvZTFZdUhYcFd1eFZ2RXkyYTk5em84RnZyQ2NoMElZUFIyRkRx?=
 =?utf-8?B?REFqcGpmUVM4OWdSKzFpVHlabU9QMmxJdVhXbnBGNTU1SUFUM1ZuaUVrb1Z5?=
 =?utf-8?B?b3d3YWhMYWkwdmluRk1KeVFiUFFJc2x6Z3hrMytsdmNqcm5icGI3VUQ3cjdw?=
 =?utf-8?B?OUxZTmMwWVFhNEQ5cEcrcWVTRjZUQkIzcGxCUU0rVDhHOTl6N3B2M2ViSTMv?=
 =?utf-8?B?U2NJbzlYZzJUVmpmR0FEMUFvbXVSZTBUa3VEcCtnYkZIUTFTOUw1bnBpMzVM?=
 =?utf-8?B?TjFOb1pnRk4vRk0ya04wNlR4Szd6NEx5ZG1CYnEraEk4UTJPek1zMHZuOHRU?=
 =?utf-8?B?YVZaTWYrdTV6SThnR09lZm9lYUFjTTZoblJRd1NrbTRiU3FYcWEwOFpob05o?=
 =?utf-8?B?Mk1acmV6OGo4RElPSTRSdW81aWZlNlNtSmNJSUhQOFltMHdxNld5ZDVYUm9a?=
 =?utf-8?B?aktVQWJKL0tPYzZqa3l2QkoxVXZ1ei9uZ3UrUFdYSnFLZ2tCbDcrLzRBYmkz?=
 =?utf-8?Q?/ovJjTTCKNDTKPmmS6g1jwo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e03a6a6-ef15-415e-dcb7-08dd08565e59
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 04:55:20.3042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCyeTqEeV68jWg3jy29+Z04QFk4PViLhUk+4Az92ngNTICD5VBlVUDIcMGhg1hh1ffOeplcJCwF9KGeZkIub6t9vrIpQ2oGwsO4qjz+Vg+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
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



On 15-11-2024 10:37, Raag Jadav wrote:
> This was previously attempted as xe specific reset uevent but dropped
> in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
> as part of refactoring.
> 
> Now that we have device wedged event provided by DRM core, make use
> of it and support both driver rebind and bus-reset based recovery.
> With this in place userspace will be notified of wedged device, on
> the basis of which, userspace may take respective action to recover
> the device.
> 
> $ udevadm monitor --property --kernel
> monitor will print the received events for:
> KERNEL - the kernel uevent
> 
> KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
> ACTION=change
> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
> SUBSYSTEM=drm
> WEDGED=rebind,bus-reset
> DEVNAME=/dev/dri/card0
> DEVTYPE=drm_minor
> SEQNUM=5208
> MAJOR=226
> MINOR=0


The patch in itself looks good. Do we have IGT tests in place to 
validate this uevent ?

BR
Himal

> 
> v2: Change authorship to Himal (Aravind)
>      Add uevent for all device wedged cases (Aravind)
> v3: Generic re-implementation in DRM subsystem (Lucas)
> v4: Change authorship to Raag (Aravind)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0e2dd691bdae..5878b331e35c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -989,11 +989,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
>    *
> - * This is a final state that can only be cleared with a mudule
> + * This is a final state that can only be cleared with a module
>    * re-probe (unbind + bind).
>    * In this state every IOCTL will be blocked so the GT cannot be used.
>    * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure.
> + * failure or guc loading failure. Userspace will be notified of this state
> + * by a DRM uevent.
>    * If xe.wedged module parameter is set to 2, this function will be called
>    * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>    * snapshot capture. In this mode, GT reset won't be attempted so the state of
> @@ -1023,6 +1024,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
>   			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>   			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>   			dev_name(xe->drm.dev));
> +
> +		/* Notify userspace of wedged device */
> +		drm_dev_wedged_event(&xe->drm,
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>   	}
>   
>   	for_each_gt(gt, xe, id)

