Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB7C67A61
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E715F10E1F3;
	Tue, 18 Nov 2025 06:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAFOUbGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2913010E1F3;
 Tue, 18 Nov 2025 06:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763445993; x=1794981993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V4+JFUrcZRyUXlBu/hKg2Z3mTfXu+/sNoiUKY+h1PRg=;
 b=TAFOUbGq031QqbICrizBWMfE0vMlbMQ0qr4J/FMnKo8DUOihj8Zj0CJs
 KiQMaGZeAq0ofo51JrAtQLKClCBZC/cJBi5jh5R7iLbX1Sqoy+onzv9XA
 OWY9FFiQ98HAW7MYVc+rU2PH1MURYPXhNArEd08zc5BBE18WZkcDN/5uz
 m+6ujyQKGIGL7REH4K1bAWqaMEWvN+hHTbMatfZv7duj9pxEeTddtG6nC
 d9uIVev2d2oVOjBRXF0Qd+mevusUxcpRUDN3948GMTYctQVxL479dLwUi
 Boz0R29FBG/ImoaqKxbSlH/D8pm4WQ/YV4GM9ZEeYifiAJlcgLbeExmn/ Q==;
X-CSE-ConnectionGUID: OQj7j7qsTVyPsKvxGe7xQQ==
X-CSE-MsgGUID: mp8oA2OoSo27bHgxpNi4Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65614234"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65614234"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:06:33 -0800
X-CSE-ConnectionGUID: o+aB91UFR6C00JyNnWwrPw==
X-CSE-MsgGUID: aAXTlNt8Q360MK0/aachgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190830841"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:06:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:06:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:06:31 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:06:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFyL7BnroSwjHn3Gt4Tv+pKB1rnwQ8cwhWPd9bi2qd44kmpiqPwh7ZQzInHThjxXihZFrrXy85+PM9mShwbXO3hZTqWHDExz1Q7xaI7nvOP3vFnV44WJabxO4FX/tRUSrMPqZDTycFwmTmObBKy75fVplBpjuBTHNmI1GhPXN+PTM9EkTGf3vevW7MBaaNTxItIFmq0P8CSbWwjXyiHPkxB5V/mghDxVN3UiW8cA6UPwoHrsEYMFuJ9tL+rxOARu+xgXecZGYyt/uk6x2c+u/Cn/tBuX0xRRMaVBhPg3QUsUaktPjNR7nygSdBlhijF4LtTJYLOqqGgbrvaVKWz5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4+JFUrcZRyUXlBu/hKg2Z3mTfXu+/sNoiUKY+h1PRg=;
 b=cKiBtl2KAc1QdYRhpuWVnLzLCgYXKGjDgxmQ/DxtAsRbCGJlgIiw89MFn89JKiCN3R7nIZOvFYRUGKpxDFp0U7NSypiIBV11J97Ks+egEa+Z6Y43z2N18c0en/oWx01djpxl9fdGp7HX/J1YKjkyZOqTLNwbEMDWyZzDhcxnP72FBQt53CEVCTB2iNEK6s96ZBsBiWnHk7Bs8ZXhE0GPQqZXvy25m7/GmOLHjCAu8ybUUCv6hYuUbHsvEU2sAm5RrCUxfpLDnzGFqBQKU1ZZmyAds9wFSEw61LUUM3lgDz4iZUenbRpVU2S/oYKUrd1PtKrGCK95uuBkUNPctNRs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA3PR11MB7653.namprd11.prod.outlook.com
 (2603:10b6:806:306::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 06:06:22 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 06:06:22 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 03/16] drm/i915: Add intel_color_op
Thread-Topic: [v6 03/16] drm/i915: Add intel_color_op
Thread-Index: AQHcTk7wwEMg81Xd/UuzFvfMfe+Jr7T4Bi4Q
Date: Tue, 18 Nov 2025 06:06:22 +0000
Message-ID: <DM3PPF208195D8DE0E3DC181A5D5B118604E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-4-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-4-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA3PR11MB7653:EE_
x-ms-office365-filtering-correlation-id: 3fb6c9ad-0dab-417c-0d47-08de2668994e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?LzZ5MmhqblF1TFQ3dXkxVTBONGlVdUxmbFlocTlIelYzZWN4akJ0NTVKY2RV?=
 =?utf-8?B?eVdSaGJibGtkb3M2d0hkUlRsSHpYalgrb1VweEx5UHZJZHVsUGVBcGZDTjVQ?=
 =?utf-8?B?OUpxWXkvV0YzQlJPcHlmeU9Qd0dBSGt5bGliLzVIZjdud3gyWFJhT1VXL0px?=
 =?utf-8?B?L2FmeXJkb21Gc1dkZitjbkY2aVZod0I2Z2R1NUlpNys5ZXhMbHVEaGpPSDUz?=
 =?utf-8?B?NXNDVjBndEM2c0RwcE1aVjBMRDBoVUxyNVFaTXdlc3NINnB0Z3NhenFQWTRv?=
 =?utf-8?B?UWpBYlZSVmhhVHVZbjhRNUdhODJPNzQycDg1Z2IvVS9vaTBWbWhDUmdxZ01W?=
 =?utf-8?B?VHRTNm0reTZEYVJ1d1B0WjM5RFI2L0JBLzdlVTcrR3ZHUGRmR0dwL25DM2pQ?=
 =?utf-8?B?NThZMGx3bHZYTnpyaVJnMDhzamZyQmdzVG8ySzI5dEF6RzhJei9iZTBCUVIx?=
 =?utf-8?B?dGZsdlIvSitYYTllZ200c2FnOTN2SmRvWHdjVzNiZjhUbmJsbm9Jcy9hTitw?=
 =?utf-8?B?RS9CaGs2M21tL3J3aDlDdVcyYzVRdWxqaWpFVDA4SkRLbXpsY0RrMUNFRzFi?=
 =?utf-8?B?dC9kZ0VsVDlFSFU0N2Q4Q2NMSmlCUHZkeHcxTk9mbEtwL3c3a0hEeW1aRlBO?=
 =?utf-8?B?bVFPSTBLUUFwZnBwZ0x6TDNKWWZGODJRcUVhZVFBU3VQaVlrY0QreGxuSnlt?=
 =?utf-8?B?MVM5V1ZqdWpLa2E1WUpMMjVHL2tFMXlWL3BacDBZMitQR2l1eWFCdnhHa3Np?=
 =?utf-8?B?eHZrcEUrQUNBa2w0ekdxaEVqTHdWVkEwZHhjSFRBcUc4NzYxc2NVK21oZWw0?=
 =?utf-8?B?d3dqemJsZFAxVHh4TmFIRjN6NlBJNUEwVWpPR21pNTNEbkFSTWlSUnkzSFRi?=
 =?utf-8?B?ekRUV05BWTFEZk1JM0tEaWZFSU1TYytwSmVSU000bWdiaUM5N2dUWkVqdytr?=
 =?utf-8?B?OGVEWlIxOVpmOThHZW1UWXg3SjFIRmJJc1pna0pJNHhQYVVmN2RLQm9YVFkz?=
 =?utf-8?B?QzZsZldrOEZseFpvTWxVL1M3OGczRnVxVDRXcDNpYVgrSmY0V2FHWmVobHNt?=
 =?utf-8?B?ek0xQUtSTTFwb1RmTDdHNGIrNFlxSVJoajd4UVJZWWpnWVgrdWpHOGxxQUdH?=
 =?utf-8?B?TUdtdEFQTDluTk9yTFpmdlFzdnNCZi9IanpPY0ZXaFJEcFlERE1OQXoyRHR3?=
 =?utf-8?B?VGZ4Tk9IWUtRbkQwNmVzSDVKeXovNTFrVUJaRXlpeWk5TVhkNmhpT2lyTmgv?=
 =?utf-8?B?aGhOejB2VDJNUlJhdWIzcmFQaHNCbGlVa3hNYnlMM0FDTDF5SXUrRzh1cHlU?=
 =?utf-8?B?c1dtL0pCdlcxcUlENXRtQlU2UVJQZ09Qbk8vTUZKY0pUV2dyUk5ocVliMFFM?=
 =?utf-8?B?bU1yMG1ZSnFodEd3dU9ZZFY3WUY4R2d2alhFS3ptRTdZYkxqMVJHWU4rRzJt?=
 =?utf-8?B?VUN1YWEvTFJNNjY3R1NQZ3BMTmxnZnROTnQxeVZuMVNadDhaU3JGOWRnc0I5?=
 =?utf-8?B?U2dvWXFlVmNLMU0xNkJjUTFFUStaWVNLOU1TL25SM0Z6STFrMWs3dmpWb1l5?=
 =?utf-8?B?ZDkwWjZzZEtKdlQrK0NoRnA4RUI5UjMzU210cXBxVWtESC9zSVZaZ3lSSW95?=
 =?utf-8?B?MnZJTkdoUnh1OExudk4xRkYzMTZoc25UZE9NY3JEa0tTZWx2eVp6MjhwRCtX?=
 =?utf-8?B?a3MrSjZuQlgwUllyUmdyL1BDc3gybXIwZ2wzVnhnZHlKMnJ5bk8vV0UrQ3Zr?=
 =?utf-8?B?VDA1bk05N1hyMFlKbnM5WkN1MklUU3MxSkowZXY5L3ZIWHIxOElXYXF6UTQz?=
 =?utf-8?B?eDdYQkQxOWhXNmpRMURxREladmhYempUV2xEVTRtZWRLTWFoblFBcUh2cjVX?=
 =?utf-8?B?RW44K1NDU3p6SjdYYnAyUmo2OHBrNFFQQkZ2VFFPSWlMdnUvS3VKanBVS1hK?=
 =?utf-8?B?S3FqVGVBU0NVQm5uRUVhTlY1Q3hpMVA5RzNUVzRjZUZ2MExHdFpOSnV1bWQ2?=
 =?utf-8?B?SkhiRnJORG9aMm9ubnl3aFM1cmdGbm1Ub1M1bXUvdVR2amRPbE0xamp2QytI?=
 =?utf-8?Q?DBun/k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azB1RmNxNDRobDhwYmh3dFZHQjlIWCs3clN2OHNxZlRBa1VLYVVYUEV0ZkZt?=
 =?utf-8?B?VmV0ZHQ3Vi8xMDNPU0FxMWJJeUo4aGJtOEIvMnNES3VNSkFIWjNEOC9sWFNp?=
 =?utf-8?B?Q203Z25ISHh4cVVjWWI5Y29UY3M4eXpXanl2UElUeE12c0FWTzRlVG1seGZL?=
 =?utf-8?B?a1J5NGgwTmZlZlc5REZXbE1qVFhEeHphdkxLZE9NQW5NZmN6UkZlL1AxcTNS?=
 =?utf-8?B?ZjgxbXVLZzRiMTRkVDR1eUI5Qmc3WGlMNzRWcnROQlVVMHhLMlJ4OGNRQk13?=
 =?utf-8?B?ZklrMWNRVFVVS3NwQlE1RUVta21zaXIvaE5oRjl5Z01UWFBRZEVaTkdaRURi?=
 =?utf-8?B?SXVMZU5ydG9LSjNJR3pjWmNoQjJMY1QxSFlMbmRLM0VXL2gwa1R2Z0pOMm9s?=
 =?utf-8?B?bXltNW5kTU5sVS90MktoeVAyMnlBSlhETzZHSndoNjlSUGpIWkpvZnBmemxW?=
 =?utf-8?B?dkpvTU9RTGpqOWk5VGpFRlg0UXdWRUpLeCt3eDgyc1pybWIyb1dVZ2ttYSti?=
 =?utf-8?B?WExKMlhrRHZjU212aWZtdkFLdlhoNDczUGd1QnJMM0puRmRmVmVkcE9oVG5Y?=
 =?utf-8?B?SjcyZ25TcU5VK0NwNDNhNnpObjR5dVBMaE95RVU2Smo3ZGsrOHRhS0QyaDJZ?=
 =?utf-8?B?dlhSVXFwQWRNNjcwc0Z4U1FpVGRpa1VhNVFYVHp0bjM4OGh3Z0ROakxVSWFG?=
 =?utf-8?B?SjlhQlIvOEhISE9nTk1mRzMyQWRGZ3hweXFsOU5Db2U3RzJWem52b0pyK3RX?=
 =?utf-8?B?Umxzc0VlQUkxaUR0cmtLbDVUdUxCcmtjMlBPT1ViV3ZrZ3FySSttRDNaa2k3?=
 =?utf-8?B?b1ZJOW93bWRXRUFnUk1MeTVSRXQxYzNRd2tidVFwc01HTDRNTTRYRk9GTUI4?=
 =?utf-8?B?b21GRDRYV3dkclBUVXhVaVhmdHZjK2gyS3o3b0x2djI0SzE4S2pCSzkzNndu?=
 =?utf-8?B?V3pNeEcvZ1hYVmJ1Y2pUVU40TDRvbSszT3FrRzFHcEFHUkc2V1Z0NjdlcC85?=
 =?utf-8?B?SjI5anUwclllck9XSWZpeUx1alNFZUNKUjJ6SjF0R2trM0YzbUJ2R3kvVHV3?=
 =?utf-8?B?U2VvRkhyd0dFbXc0ZjBkSjdRbUFNREU5K2pMRDhyUW55YXR6c2hYVmxKMVRP?=
 =?utf-8?B?ZEdCU0VnbmNyZjNrWjNLSTBCN1JET1hkbDNUWWQzMU1makcvbHcxOHYwMDdB?=
 =?utf-8?B?OTNacElwenV4K05KQ3F1a0RVZVpRZVpSaVA2ci9UaGxkZHpWWi9zb0RveVN4?=
 =?utf-8?B?MXVsa0xMQTZCcVBWaDN0akdOMG90Zm4xNGRZeHV3QVl6QWs2ZmlrK3pFNlZy?=
 =?utf-8?B?T0RvT2FnQU5YSWVrMDJxZHVzbHFVeHVZS2prOWRMS0RWNEZLUzBUMVFqN3U3?=
 =?utf-8?B?YmtpOEl2NWxhSkRkWmRVejNXNHhrVGdNd05OZUllRnJ0WmlLZUVKTGwwRE1m?=
 =?utf-8?B?eFhiVi9INXVrKzBVU3UzZXdQRndJN0NYdDgwOEViU1h1eENBT1NJSjlKR21n?=
 =?utf-8?B?eCtOWVZZdnVEcWxXWm80TE5Ca0I0MGFoSzdkT05IQjdCc08rUytPQjNEZEZx?=
 =?utf-8?B?ZW5WbDN4Q0RwUk5za1BSUDhZeWh2NjFyb2NFNkZEcmVobDJjOFNUckJGbWJv?=
 =?utf-8?B?Sk9QSjQxa01icXVmNmE0YkFrZTJaMy9rL3d3c2x4WTQzWXAwN3JJQi9pZlM0?=
 =?utf-8?B?OTA4eTQ2OXBPY1J3TFFVVUFxcVZxZm9UdXZhNVpyZFNRcVdoRTQrOFVQQzBK?=
 =?utf-8?B?YmUvb1V6TkJxUHhNMUNLNVZFait0N2NCUTF5YW01dlJscHlBa2hubVF1bFBl?=
 =?utf-8?B?NTNqVktuWmh1VFNSWWJTcFltcWFXZEtTcTBRVkR3b1E4djdMUjBtZUNVZXFj?=
 =?utf-8?B?cWtGOEhIMGg2a3hhY2lzMzRhRHhiSDhXclBCOTdVYmhYQ3lGRldrQytLaExh?=
 =?utf-8?B?M2VKcFZ3ek1yYjVyTVliOEpRekV6eWcva1ZxcUEyZDVoLy9FWEsvcDQ2Ym9j?=
 =?utf-8?B?aFUwaG5DaEE2QlpFNVc3SXBZeWFMa2VkZ0htNG1wdXZ2aHc1VDNjZlljWXYv?=
 =?utf-8?B?cVN0VE1wWWlaQXpHV2pGYVZuUnpQcUtnUlZYUHExNHgvalBXWUJuZTNrVXQv?=
 =?utf-8?Q?ec7lNDl0BKS++dDeovb4Oduug?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb6c9ad-0dab-417c-0d47-08de2668994e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 06:06:22.3097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4tERVanoCAkI8XO9Hfw0XCcv9rLbZe73e4FeDtI2V7TjzF5mVf6NrqTFEFidJEhb5+c8MiBER/LQj1rvCchtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
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

PiBTdWJqZWN0OiBbdjYgMDMvMTZdIGRybS9pOTE1OiBBZGQgaW50ZWxfY29sb3Jfb3ANCj4gDQo+
IEZyb206IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVs
LmNvbT4NCj4gDQo+IEFkZCBkYXRhIHN0cnVjdHVyZSB0byBzdG9yZSBpbnRlbCBzcGVjaWZpYyBk
ZXRhaWxzIG9mIGNvbG9yb3ANCj4gDQo+IHYyOg0KPiAgLSBSZW1vdmUgZGVhZCBjb2RlDQo+ICAt
IENvbnZlcnQgbWFjcm8gdG8gZnVuY3Rpb24gKEphbmkpDQo+ICAtIFJlbW92ZSBjb2xvcm9wIHN0
YXRlIGFzIGl0IGlzIG5vdCBiZWluZyB1c2VkDQo+ICAtIFJlZmFjdG9yIHRvIHNlcGFyYXRlIGZp
bGUNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoYWl0YW55YSBLdW1hciBCb3JhaCA8Y2hhaXRhbnlh
Lmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVt
YS5zaGFua2FyQGludGVsLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFs
IDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvcm9wLmMgICAgICAgfCAxMCArKysrKysrKysrDQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yb3AuaCAgICAgICB8IDEz
ICsrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV90eXBlcy5oIHwgIDUgKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNl
cnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9jb2xvcm9wLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yb3AuaA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUN
Cj4gaW5kZXggODRlYzc5YjY0OTYwLi5iMmY1OTFlMTU2Y2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01h
a2VmaWxlDQo+IEBAIC0yMzgsNiArMjM4LDcgQEAgaTkxNS15ICs9IFwNCj4gIAlkaXNwbGF5L2lu
dGVsX2NkY2xrLm8gXA0KPiAgCWRpc3BsYXkvaW50ZWxfY210Zy5vIFwNCj4gIAlkaXNwbGF5L2lu
dGVsX2NvbG9yLm8gXA0KPiArCWRpc3BsYXkvaW50ZWxfY29sb3JvcC5vIFwNCj4gIAlkaXNwbGF5
L2ludGVsX2NvbWJvX3BoeS5vIFwNCj4gIAlkaXNwbGF5L2ludGVsX2Nvbm5lY3Rvci5vIFwNCj4g
IAlkaXNwbGF5L2ludGVsX2NydGMubyBcDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yb3AuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY29sb3JvcC5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uZWFhYjUwZDJkMTI2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvcm9wLmMNCj4gQEAgLTAsMCArMSwxMCBA
QA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHly
aWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKyNpbmNsdWRlICJpbnRl
bF9jb2xvcm9wLmgiDQo+ICsNCj4gK3N0cnVjdCBpbnRlbF9jb2xvcm9wICp0b19pbnRlbF9jb2xv
cm9wKHN0cnVjdCBkcm1fY29sb3JvcCAqY29sb3JvcCkgew0KPiArCXJldHVybiBjb250YWluZXJf
b2YoY29sb3JvcCwgc3RydWN0IGludGVsX2NvbG9yb3AsIGJhc2UpOyB9DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yb3AuaA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JvcC5oDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjNhMjlhNTY1OTQ5DQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jb2xvcm9wLmgN
Cj4gQEAgLTAsMCArMSwxMyBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAq
Lw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsg
Ki8NCj4gKw0KPiArI2lmbmRlZiBfX0lOVEVMX0NPTE9ST1BfSF9fDQo+ICsjZGVmaW5lIF9fSU5U
RUxfQ09MT1JPUF9IX18NCj4gKw0KPiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCIN
Cj4gKw0KPiArc3RydWN0IGludGVsX2NvbG9yb3AgKnRvX2ludGVsX2NvbG9yb3Aoc3RydWN0IGRy
bV9jb2xvcm9wICpjb2xvcm9wKTsNCj4gKw0KPiArI2VuZGlmIC8qIF9fSU5URUxfQ09MT1JPUF9I
X18gKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV90eXBlcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmgNCj4gaW5kZXggMDA2MDAxMzRiZGEwLi5mYTM5ZjMyMzY1OTcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBl
cy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5oDQo+IEBAIC0xOTg2LDYgKzE5ODYsMTEgQEAgc3RydWN0IGludGVsX2RwX21zdF9lbmNv
ZGVyIHsNCj4gIAlzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3I7DQo+ICB9Ow0KPiAN
Cj4gK3N0cnVjdCBpbnRlbF9jb2xvcm9wIHsNCj4gKwlzdHJ1Y3QgZHJtX2NvbG9yb3AgYmFzZTsN
Cj4gKwllbnVtIGludGVsX2NvbG9yX2Jsb2NrIGlkOw0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqDQo+ICBpbnRlbF9hdHRhY2hlZF9lbmNvZGVyKHN0
cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvcikgIHsgZGlmZiAtLWdpdA0KPiBhL2RyaXZl
cnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBpbmRl
eA0KPiA3YjRjYTU5MWE0YWUuLmM4OWNhZmJkMDBmYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0K
PiBAQCAtMjQwLDYgKzI0MCw3IEBAIHhlLSQoQ09ORklHX0RSTV9YRV9ESVNQTEFZKSArPSBcDQo+
ICAJaTkxNS1kaXNwbGF5L2ludGVsX2NkY2xrLm8gXA0KPiAgCWk5MTUtZGlzcGxheS9pbnRlbF9j
bXRnLm8gXA0KPiAgCWk5MTUtZGlzcGxheS9pbnRlbF9jb2xvci5vIFwNCj4gKwlpOTE1LWRpc3Bs
YXkvaW50ZWxfY29sb3JvcC5vIFwNCj4gIAlpOTE1LWRpc3BsYXkvaW50ZWxfY29tYm9fcGh5Lm8g
XA0KPiAgCWk5MTUtZGlzcGxheS9pbnRlbF9jb25uZWN0b3IubyBcDQo+ICAJaTkxNS1kaXNwbGF5
L2ludGVsX2NydGMubyBcDQo+IC0tDQo+IDIuNTAuMQ0KDQo=
