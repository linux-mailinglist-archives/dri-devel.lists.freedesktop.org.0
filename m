Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC67A0C06A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 19:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158C110E7A7;
	Mon, 13 Jan 2025 18:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhRKXhzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5ED10E0D1;
 Mon, 13 Jan 2025 18:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736793889; x=1768329889;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hkXuQuiN3Xe0eTOCsy1/1rQ2ft1RUGYtS1Q+x2rFs/w=;
 b=YhRKXhzVRRABaT6PASo29CbCieNXuV0/aR8+1HRSkixrEUm/1S++ZF3l
 FoyV+1SRg5wmHV1KEtSVh2GlruNCaQnooiBt+P8GXSr6Xe6e3BYOJLDWy
 0mj6KQDL1irffMkSrDe4CgHTNvaYKdrYhgRt6cNAQY7UAWfSjHBMRJbyi
 q1cDHtk1Z1sOQyioV8vZB6xH7F0MZC6hOuHqaTW3E+Poiu2blnVuFbKeV
 h/VdfMwbkJ/DVip2HRLyB45xKzKcxRuRleVmaqYOGicry+pXebSBVQ/ff
 xOa4+yg8+faCxzrni2ZQeBdbI2oulKhCbFAzfKQWINiUCcf5+b65Ab2Ge w==;
X-CSE-ConnectionGUID: KAVpHaH5Q/+x8fnxvVXpmA==
X-CSE-MsgGUID: M+XQ7ZjWQa6iUpz1bC3zSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37231806"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37231806"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 10:44:45 -0800
X-CSE-ConnectionGUID: o7CjsX6oTXW1kUj6E0Vg2g==
X-CSE-MsgGUID: K6SinguOS9WsNM1to5QroQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109699922"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 10:44:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 10:44:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 10:44:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 10:44:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekes9NeKfaBUtH7VTaowqVGdlUToseW7p6eCuvsWjoJ5/Vt06joSRaaXHqN2Bt8JpJw3Xfu+FG6ycyO/1bWZvj+6q7MgGRzHQE1a1MQ2hPi2aDEBAbrfOsAQeQJue1aTkHnGrdSNqpsgKvECK8gyYsZsAdBoTBPw2dYOceL2DTWzuqpdYNVrO4OC+TuixbviHYrmXVPu3zvsAMOSvqxlsLOnSMQKtJ8AcMAX+V+EfRcM8F5zQAfejs4Rt2hXF/O14s378qlhedY46PleUX7Z/puBXA6AjSFDiajIzbxrs5rcX3Fr3HaEUx4jh4XA49a0YgYaNSwfrV0B/zh7ey/WjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkXuQuiN3Xe0eTOCsy1/1rQ2ft1RUGYtS1Q+x2rFs/w=;
 b=TXn0HDxBrjeIplcZQlMVNrKfylxve/eW7o7sqNj87s7kbznZJB7NAKYWOgL7xyjgeKeVJIccjZHzVvdhAWlm+aSI+9XVaodpHL7HzKJa79qJTX0QtuEXL9FRFBEQ+S5qJvW7cAooYjsanGl4Nvy+MWTPqSrIgtnzzDYFXdzjppsxl4ePSMlKHyco1xTMvdusDTsKXopSshYoFT37IJGbiJYDdPa8MPPbgEkRFW2Do81nEKHx2kqTebQNSXVZHbf9vPgrgq4KMitDsz8uUNluNbLJiTisfWORQEPmCqtQchPNo1RtG/YqnOHtceHxxov03JTvm7qVHGiqINhxk0YyYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 13 Jan
 2025 18:44:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 18:44:34 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzWpcbHJL1pUi0hPF0y6Z5nbMSs/1AgAGxVICAAJuHcA==
Date: Mon, 13 Jan 2025 18:44:34 +0000
Message-ID: <SJ1PR11MB6129F7B51AD33A31D6A07B95B91F2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com>
 <SJ1PR11MB6129D345A6E295DF51F48643B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <IA0PR11MB7307837C9E598D7E2563750EBA1F2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307837C9E598D7E2563750EBA1F2@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ2PR11MB7454:EE_
x-ms-office365-filtering-correlation-id: 32eac7ed-d5e3-4e89-d574-08dd34025343
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R2JSeU5xUWVrSGc4T3ZTenA3T3ZvZkF6RFRFSjE2c3E0ajQ4dGVOdStLblZG?=
 =?utf-8?B?ZjZVMXl1eHplRW53ZUNEMXFKUGdPSi9kaU1JeFhkRGhUR3NzenoyTkdqOEpp?=
 =?utf-8?B?b1V1RW4rNW4vWTAvRFRtRlFybHV1cWxIMjJRbTVqN0JiSnVJM0ZQNXhIQ3hz?=
 =?utf-8?B?aVFUcTR6OVV1T09zMFdOSmdpTkxWODhwaVgzTnNDaDZQK0lCUmNjL1g3N1pi?=
 =?utf-8?B?a2N6Yys3eDBaS1VmSStrNG1ucU4yc2kxQVJJdnNjQ3gzUFhibmhjSGoxT1B1?=
 =?utf-8?B?dWNodmVOWnY0UytZZ1dBU2xISnRWamJnb2ttS3BBV0t6cEkyWG9FSkpnd09z?=
 =?utf-8?B?S1F5QmpxVnVaS1Q2TkxydzBnU1FRUFd5aVB1QTdERlljK3Q4cHNsYlJpcGp5?=
 =?utf-8?B?WStpWXErS0hIQktqMlluSlBad1FnTkYxY3ZzcVRremdiM0l1UTlDQTVuYWo2?=
 =?utf-8?B?eDlKZ3lVbi9ocmcyQUdzZ2NHTlRNWkRrY3VnT0dlcG9QNDJ0SVhwaW5MYzFC?=
 =?utf-8?B?ZXd2Q0hEOVNnd3N5Rkc5aHU3VTZlMENnRDFVdkx5VC9DMzNNZWFwWUNBclJt?=
 =?utf-8?B?a2ZjdURXRG4zV0xKajB5QVNpTlhNKzVWUTFmbTl6UkVhN0hkRXZrYzlWeTcw?=
 =?utf-8?B?dU1LUHdZY2wyekpnbkdoU3hYV1F2eU1scm0xY3pEYkZoK28wOHAwSFgwSzZS?=
 =?utf-8?B?MmxiRzIvWnRVYjJNS3NWQm9XcncxMkk2RnFWbm9GK1pydERMOWZHSnBSRWcr?=
 =?utf-8?B?UjJ3eE16S0x0WHB5aUF1c1BWeDNQbkFEckFqRG5QOVFQdE9vS2JvcWthSkVB?=
 =?utf-8?B?ZDlVZnF6NUUyRUdPSWM0ekhsSGVOVkRZeTZwaE1pVnNSQmZreTArclpObnJM?=
 =?utf-8?B?aVB0MFZ0dm9HWGRhcHFkQXk1ZjJBTGRNNEhCK2JOVkNUSFFKRVMrMHZtemp6?=
 =?utf-8?B?MVNFR1VZMWxLZVR1SFlaYmc5RFprNUxVZDI1TVk1TlJRUFp5emovczJ1VlFz?=
 =?utf-8?B?UVJkcFBkMkxEN2NHV0NmcVlFRUJEZktGNDdDdWJ2Z0hVRzc5T21jSWsxYUM4?=
 =?utf-8?B?VWJ2azdwVUFtTlJVYkEweUdFNFk5QmNmdVVEamRKTC9zSThZdlBJelQ4NUor?=
 =?utf-8?B?SHFKWDhlbWxIRy9HVmtFU0ZNTERiSGpmaEx4ZFY2eUo1N2NVMHpEVUdrQVVH?=
 =?utf-8?B?RTFFOUNla2RsbkVnVDBkSGErL2w0b0lMdVJPcUJteHM1L0diRzdXeHhINXZo?=
 =?utf-8?B?SUJpTm1KK3hydzJESUI1eXZvWTZXYytscGczbjhnaXJtSS9kdjBWYnFLSkdx?=
 =?utf-8?B?Qm8wMkc2bkkwYm5qUzAvejdJMVNIZ2F2R0JBRjFRb1B0S2VNTnlOQTl6YnpB?=
 =?utf-8?B?Tll5WDNyeWNibEpqQmIzOTQvdDIydUVIVUtCME45Q0lnL1U2dVIrS2RadzZw?=
 =?utf-8?B?RlhnUC84alRNS2ptNVZ5QjA5R2ZDYnE2TnhxSkdJeXhYWU1BcTlkRy9oR0lR?=
 =?utf-8?B?ZXR1cDhoRlJ0QU51ejJSTEx2SEFzeDd0WVFSQmVlbTNYZDREVGE5ZndJQ1oy?=
 =?utf-8?B?WlVPekVQTDI5YnIvVWpqRmord2tuRVpjWkwrNUx2Rm5uUG96Y0xUZkptK3dr?=
 =?utf-8?B?WTBZUUF1aktocjdHVmF4MlFBbkdyUjdKYWJoR1dNTXFMaVBmYzh4RlVCbVB0?=
 =?utf-8?B?Yi9weCtOaVZ0NUZ6Tkh2RnYzVnpSZkYwYkpRWENMVmtwdnp6a21iNG5xcTJ0?=
 =?utf-8?B?MjNIbXVqLzJMR084UjJXTmlnUDdFNnB6T3FYZ3I1QzJSbmdVdWxIY0haOHMr?=
 =?utf-8?B?Rm1zMHJHTDFNSkdrbGQ1WXZpM2VJTnZhN2Q0R21lSGU1WVhwT3phNHNkZzlD?=
 =?utf-8?Q?xBTGqPYGQchq6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajdhODE4R0daK3NIeWg5NzRid2dqYVlGbFZIOFg2WWd0SkJWcjNnQ2RpSjFB?=
 =?utf-8?B?bnZYYXdtMnhkdWE5MWtVM1FES3Jkb2sxOWxRTzJ6bjdzbTJ6cm5nWExpM3ov?=
 =?utf-8?B?WDdzMFJWMnU5WGh2TnVVZnc5a1VjVHEvM21mUjEzbWlrUkpudzk4YjBrQW42?=
 =?utf-8?B?RjlIVzZTRGk2VlVsRXB4SnFOdHhQSjlmdXE0UHNNK3NIeTUvWC92RVRsZ2ZN?=
 =?utf-8?B?djc4SVZsSlVGY2RvdENZUDlPNWFDWXMzeTUrem9OemJ0eFhIMzJWVExUdUZ6?=
 =?utf-8?B?SHpEOHlnMEhWTTY0T2tnOEovRjI3VlJXbGcvTTN6T2tBbElQV1pJaWJpWGhW?=
 =?utf-8?B?Z2hkdmlib05sWGV2WlVGTGJlcjVsWGlTYVFWTkhnYlZDaUwvT0t3Ym5nUFcz?=
 =?utf-8?B?NFZ6K2dXSzZyUVU2OXVqRU5JdzlNdkEvRkpMTkFXeS9UVmxBa1ovTGNTVmQ2?=
 =?utf-8?B?emlyUGN3VU9jSktrRFlmaHFpNmZhWERXNk5mKytQQ0VleVc5aWszaFUzNzk1?=
 =?utf-8?B?M2d2dzlQMjlMOElpN0dLQlpBS2RGK2pwSmtwRWxIS0xVZkVRaEQvRDlyQzhp?=
 =?utf-8?B?WTBveFVFd1p0aDFSL041enlTMm1uY0JsUm9xN2EwRkUyalY4K0RkTDlVSUd1?=
 =?utf-8?B?aTBEV3hOQzFsaHFocDMzdXZqWklkL2FQc0JscHBhenZJMmIvckNFYlFud2xn?=
 =?utf-8?B?R3BqdEpYbmN4YXNMSnVRSzZ5STYzSGxuVGo4V1BaRjFsZFFFMHRmZXFZRFpm?=
 =?utf-8?B?Ylg1Z215RWVuOStudmczZVU5Ymo2Y0h4cUM4NG4wU3YyaWoyZTQ3SzNwTE82?=
 =?utf-8?B?b0QvKzdmczVadjBrQzhoeWtER254aDB6b3RQT05yMHd1UlpJYi9Mc2pXTDBU?=
 =?utf-8?B?VUIwbXEwT2orMjFpQ2JFMks5OHd5QmMvbjhISVpKOUxsVVRTckZLVGpCbENH?=
 =?utf-8?B?ZXlGNTUvZkUwbTJiRHV6Q0hXdE55ejdGSi85NTUwNWNLVzhQR0s2UStmRVV6?=
 =?utf-8?B?NFBxTVIrT3JQZEwwc0RQQ09KRllxR2J3TmdrNmxML05qZ0NkdFFuQkRmbFdh?=
 =?utf-8?B?RDBGK0dsRkxiamtnUlg3VlpqVi8yOVVrYnhmQ2JMWXpKRjVPeUtwbXNuUGly?=
 =?utf-8?B?UE1EbGRFa1NIcW1Rb0FPa3pFWUIwNEdtTzhGendwenpSYXlzYUFhYzhkbWha?=
 =?utf-8?B?aEFsY3l5enpTc1I1K1BGMmVZTmtTcnhiZ01RYXRqSkJLbFl4Zzk3T1FZZTdi?=
 =?utf-8?B?T1k5eXp5UzJXOEhqOHJxdjk1SHEyZ3huOHB2YmIrMTVjbHFWeHVvOGlaQ1BF?=
 =?utf-8?B?T0VMeEplODJ4YTljNU5FT240a3FqV3B4SllOT1g3TWxZNGdrdjBITlUzaGZt?=
 =?utf-8?B?U3pUbDNDZWhwamRkSzJIL0pxbkNPZ0ZjMGVudkN1eUR6RXNHaTVPdk1uM28z?=
 =?utf-8?B?ekthbUluVERYV0FGMXp0ZXpXSlNlWENPdDFjejFTYTl2bVZJYlBZb290SURP?=
 =?utf-8?B?UTFQMTR4YzFSVUo0U1BRaVVBaTBXMVVhYzNRVGVraUprN2JSRU1meVBheUp0?=
 =?utf-8?B?bE5HV0RlMmVDSjFwNmhjU3JNRGxaY2xUKzFxUEZWOFZxczJHaHUwNjA4emli?=
 =?utf-8?B?SXFBcFM2bUxJQ21xOFo4TnVST2s4dFcxQ0lvU0cwNzh1Rmh5ejNsNll2WXRt?=
 =?utf-8?B?WWQ2YXIveTA5QUs5WkxuYWZqYzFUSlgvbGRlWW5uWkhsaWZOdEhJUmZxM0Y4?=
 =?utf-8?B?SXJrMUJqVkVHZ3c1Nm1FNG5ib0cvK2dwTkxBd2NEbVpaUGJHa3Q4eUpEbDdW?=
 =?utf-8?B?WjlGQUVPakJQSHAycjIvT2VpZHdFaGFKTmNZelJZbzhBb0hFbm1PLzljaDJT?=
 =?utf-8?B?V0dlWGlmZDd5b3ZpQ1RDT1U3YlBIakg1MWNEbUdNV0RZVUtGMkd1R1pYR1ZB?=
 =?utf-8?B?YngxZ01PZ3pJNURsN2VWZVQ1WTk1djYwcldoUkxmRFBqdmVlbmVtMnBQU09p?=
 =?utf-8?B?cWRaRE4rMWV5MHp0RzZITmEybmRWUGkrSEJxWmZFaFUvTE5veFNORzJabjhh?=
 =?utf-8?B?YUhRMkxPSEZSTEtpRWJ4VmQxNVluSXFsL3Roc3FGdHRTN0JPaERKQUNWSG1x?=
 =?utf-8?B?NTJ5K25UZmU5OGdFQnE5UFJuamV0ck5ZSXR1RFdsampKTHM2VnlabGVQRmRU?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32eac7ed-d5e3-4e89-d574-08dd34025343
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 18:44:34.7646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F0yBOhahks99CSwCxc++8lgxHe4bLwjSur6cgw6O0Aekkl56nRSpOped1lP8Vj47JqKzvsMHx13KE+bqk8QZ34n6/F7Jzxrn76wBkKCU8hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMTMsIDIw
MjUgMTo1MiBQTQ0KPiBUbzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFy
LmJvcmFoQGludGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjMgMi81XSBkcm0vcGxhbmU6IEV4cG9z
ZSBmdW5jdGlvbiB0byBjcmVhdGUNCj4gZm9ybWF0L21vZGlmaWVyIGJsb2INCj4gDQo+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRlbC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+ID4gT2YgQXJ1
biBSIE11cnRoeQ0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDgsIDIwMjUgMTE6MDkg
QU0NCj4gPiA+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+ID4gaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPiA+IGludGVsLSB4ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gPiA+IENjOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRl
bC5jb20+DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMi81XSBkcm0vcGxhbmU6IEV4cG9zZSBm
dW5jdGlvbiB0byBjcmVhdGUNCj4gPiA+IGZvcm1hdC9tb2RpZmllciBibG9iDQo+ID4gPg0KPiA+
ID4gRXhwb3NlIGRybSBwbGFuZSBmdW5jdGlvbiB0byBjcmVhdGUgZm9ybWF0cy9tb2RpZmllcnMg
YmxvYi4gVGhpcw0KPiA+ID4gZnVuY3Rpb24gY2FuIGJlIHVzZWQgdG8gZXhwb3NlIGxpc3Qgb2Yg
c3VwcG9ydGVkIGZvcm1hdHMvbW9kaWZpZXJzDQo+ID4gPiBmb3Igc3luYy9hc3luYyBmbGlwcy4N
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5
QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUu
YyB8IDQ0DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ID4g
PiAtLS0tLS0tDQo+ID4gPiAgaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmggICAgIHwgIDQgKysrKw0K
PiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0K
PiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgaW5kZXgNCj4gPiA+DQo+ID4NCj4g
NDE2ODE4ZTU0Y2NmZmNmM2QzYWFkYTI3MjNlOTZjZThjY2YxZGQ5Ny4uNGYzNWVlYzJiNzc3MGZj
YzkwYzNlMDdhOTANCj4gPiA+IDY4YjMxYzA1NjNhNGMwIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMNCj4gPiA+IEBAIC0xOTEsNyArMTkxLDEwIEBAIG1vZGlmaWVyc19wdHIoc3RydWN0
IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYg0KPiA+ID4gKmJsb2IpDQo+ID4gPiAgCXJldHVybiAo
c3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIgKikoKChjaGFyICopYmxvYikgKyBibG9iLQ0KPiA+
ID4gPm1vZGlmaWVyc19vZmZzZXQpOyAgfQ0KPiA+ID4NCj4gPiA+IC1zdGF0aWMgaW50IGNyZWF0
ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QNCj4gPiA+IGRy
bV9wbGFuZQ0KPiA+ID4gKnBsYW5lKQ0KPiA+ID4gK2ludCBkcm1fcGxhbmVfY3JlYXRlX2Zvcm1h
dF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gPiArCQkJCSBzdHJ1Y3QgZHJtX3Bs
YW5lICpwbGFuZSwgdTY0ICptb2RpZmllcnMsDQo+ID4gPiArCQkJCSB1bnNpZ25lZCBpbnQgbW9k
aWZpZXJfY291bnQsIHUzMiAqZm9ybWF0cywNCj4gPiA+ICsJCQkJIHVuc2lnbmVkIGludCBmb3Jt
YXRfY291bnQsIGJvb2wgaXNfYXN5bmMpDQo+ID4NCj4gPiBXZSBjYW4gcmV0YWluIHRoZSBvcmln
aW5hbCBhcmd1bWVudHMgKGRldiwgcGxhbmUpIGhlcmUuIEFzIEkNCj4gPiB1bmRlcnN0YW5kLCBw
bGFuZS0NCj4gPiA+Zm9ybWF0c1tdIGFuZCBwbGFuZS0+bW9kaWZpZXJzW10gYXJlIHBvcHVsYXRl
ZCB3aXRoIGFsbCB0aGUgZm9ybWF0cw0KPiA+ID5hbmQNCj4gPiBtb2RpZmllcnMgc3VwcG9ydGVk
IGJ5IHRoZSBwbGF0Zm9ybSwgcmVzcGVjdGl2ZWx5Lg0KPiA+DQo+ID4gVGhlIGdvYWwgaXMgdG8g
ZXN0YWJsaXNoIGEgbWFwcGluZyBiZXR3ZWVuIHRoZSB0d28gdXNpbmcgdGhlIGNhbGxiYWNrcw0K
PiA+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkKCkgb3IgZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMo
KS4NCj4gPiBTaW5jZSB0aGVzZSBhcnJheXMgcmVwcmVzZW50IGEgc3VwZXJzZXQgb2YgYWxsIHRo
ZSBmb3JtYXRzIGFuZA0KPiA+IG1vZGlmaWVycyB0aGUgcGxhdGZvcm0gc3VwcG9ydHMsIHdlIGhh
dmUgc3VmZmljaWVudCBpbmZvcm1hdGlvbiB3aXRoaW4NCj4gPiBkcm1fcGxhbmUgdG8gZGVjaWRl
IGhvdyB0byBwYWlyIHRoZW0gaGVyZS4NCj4gPg0KPiBQbGFuZS0+Zm9ybWF0X3R5cGVzIGFuZCBw
bGFuZS0+bW9kaWZpZXJzIGlzIHRoZSBsaXN0IG9mIGZvcm1hdHMgYW5kIG1vZGlmaWVycw0KPiBz
dXBwb3J0ZWQgYnkgdGhlIHBsYW5lLiAgKFRoaXMgaXMgdHJ1ZSBmb3Igc3luYyBmbGlwcyBvbmx5
LikgRm9yIGVhY2ggbW9kaWZpZXIgYWxsDQo+IHRoZSBmb3JtYXRzIGxpc3RlZCBpbiBwbGFuZS0+
Zm9ybWF0X3R5cGVzIG1heSBub3QgYmUgc3VwcG9ydGVkIGJ1dCBhbGwgb2YgdGhlDQo+IGZvcm1h
dHMgbWVudGlvbmVkIGluIHBsYW5lLT5mb3JtYXRfdHlwZXMgaXMgc3VwcG9ydGVkIGJ5IHN5bmMg
ZmxpcHMuIEluDQo+IG9yZGVyIHRvIGdldCB0aGUgbGlzdCBvZiBmb3JtYXRzIHN1cHBvcnRlZCBm
b3IgZWFjaCBtb2RpZmllciBhIGJpdCBtYXNrIGlzDQo+IGNyZWF0ZWQgYnkgdGhlIGZ1bmMgcG9p
bnRlciBmb3JtYXRfbW9kX3N1cHBvcnRlZC4NCj4gVGhlIGVsZW1lbnQgZm9ybWF0X29mZnNldCBp
biBzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllcl9ibG9iIGlzIHBsYW5lLQ0KPiA+Zm9ybWF0X3R5
cGVzLiBTbyB0aGlzIGlzIGxpc3Qgb2YgZm9ybWF0cyBzdXBwb3J0ZWQgYnkgdGhpcyBwbGFuZSBh
bmQgaG9sZHMNCj4gZ29vZCBmb3Igb25seSBzeW5jIGZsaXBzIGFuZCBtYXkgbm90IHN1cHBvcnQg
YXN5bmMgZmxpcHMuIFdlIG5lZWQgdG8gZ2V0IHRoZQ0KPiBzdWJzZXQgb2YgZm9ybWF0cyBmb3Ig
YXN5bmMgZnJvbSB0aGUgc3VwZXJzZXQgb2YgZm9ybWF0cyBmcm9tIHN5bmMgZmxpcHMuIEZvcg0K
PiB0aGlzIHdlIG5lZWQgYSBzZXBhcmF0ZSBsaXN0IG9mIGZvcm1hdHMgc3VwcG9ydGVkIGJ5IGFz
eW5jIGZsaXAuDQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgbXkgdW5kZXJzdGFuZGluZyBp
cyB3cm9uZyENCj4gDQo+IFNvIHdpdGggdGhpcyB1bmRlcnN0YW5kIHdlIG5lZWQgcGFzcyAyIHNl
cGFyYXRlIGxpc3Qgb2YgZm9ybWF0cy9tb2RpZmllcnMgZm9yDQo+IHN5bmMgYW5kIGFzeW5jIGhl
bmNlIG1ha2luZyBpdCBhIHBhcmFtZXRlciB0byB0aGlzIGZ1bmN0aW9uLg0KDQpZb3VyIHVuZGVy
c3RhbmRpbmcgaXMgY29ycmVjdCBob3dldmVyIGZyb20gcHVyZSBjb2RpbmcgcGVyc3BlY3RpdmUg
aXQgd2lsbCBzdGlsbCB3b3JrIGV2ZW4gaWYgd2UgZG9uJ3QgcGFzcyBkaWZmZXJlbnQgcGFyYW1l
dGVycyBmb3IgYXN5bmMgYW5kIHN5bmMuDQpJIGFtIG1ha2luZyBhbiBhc3N1bXB0aW9uIGhlcmUg
KHBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcpIHRoYXQgYWxsIHRoZSBmb3JtYXRzIGFu
ZCBtb2RpZmllcnMgc3VwcG9ydGVkIGZvciBhc3luYyBhcmUgYSBzdWJzZXQgb2YNCmFsbCB0aGUg
Zm9ybWF0cyBhbmQgbW9kaWZpZXJzIHN1cHBvcnRlZCBmb3Igc3luYyBmbGlwcy4NCg0KSW4gY2Fz
ZXMgd2hlcmUgbm9uZSBvZiB0aGUgZm9ybWF0cyBhcmUgc3VwcG9ydGVkIGZvciBhIG1vZGlmaWVy
IChvciBhIGZvcm1hdCBpcyBub3Qgc3VwcG9ydGVkIGF0IGFsbCkNCnRoZSBiaXQgZmllbGQgd2ls
bCBlbmQgdXAgd2l0aCBhbGwgIlplcm8icw0KDQoJCQkJaWYgKCFwbGFuZS0+ZnVuY3MtPmZvcm1h
dF9tb2Rfc3VwcG9ydGVkX2FzeW5jIHx8DQoJCQkJICAgIHBsYW5lLT5mdW5jcy0+Zm9ybWF0X21v
ZF9zdXBwb3J0ZWRfYXN5bmMocGxhbmUsDQoJCQkJCQkJCQkgICAgIGZvcm1hdHNbal0sDQoJCQkJ
CQkJCQkgICAgIG1vZGlmaWVyc1tpXSkpIHsNCgkJCQkJbW9kLT5mb3JtYXRzIHw9IDFVTEwgPDwg
ajsNCgkJCQl9DQoNCkFuZCBpZiB5b3UgbG9vayBpbiB0aGUgcHJvcG9zZWQgbXV0dGVyIGNvZGVb
MV0gZm9yIGV4YW1wbGUsIGl0IHdpbGwgbGVhZCB0byBhIE5VTEwgZW50cnkgaW4gdGhlIGhhc2gg
dGFibGUgZm9yIHRoYXQgcGFydGljdWxhciBmb3JtYXQgaW5kaWNhdGluZyB0aGF0IGl0IGlzIG5v
dCBzdXBwb3J0ZWQuDQoNCkhvd2V2ZXIsIEkgZG8gc2VlIG1lcml0cyBpbiB5b3VyIGltcGxlbWVu
dGF0aW9uIGJlY2F1c2UgaXQgd2lsbCBhdm9pZCBjcmVhdGlvbiBvZiB1bm5lY2Vzc2FyeSBlbnRy
aWVzIGJvdGggaW4gdGhlIGJsb2IgYW5kIHRoZSBoYXNoIHRhYmxlIGluIHVzZXIgc3BhY2UuDQoN
Ck9uIHRoZSBmbGlwIHNpZGUsIGl0IGNyZWF0ZXMgbW9yZSBzdGF0aWMgYXJyYXlzIHRoYXQgd2Ug
bmVlZCB0byBtYWludGFpbiBmb3IgZGlmZmVyZW50IHBsYXRmb3Jtcy4gKFRob3VnaCB3ZSBjYW4g
cGVyaGFwcyBhdm9pZCBpdCBieSBzb21lIHNtYXJ0IHJlLXVzZSBvZiBpbnRlbF9tb2RpZmllcnNb
XSB3aGljaCBJUkMgeW91IGhhZCBpbXBsZW1lbnRlZCBpbiBhIHByZXZpb3VzIHBhdGNoKS4NCg0K
U28gYXMgZmFyIGV4cG9zaW5nIHRoZSBhcmd1bWVudHMgSSBsZWF2ZSBpdCB0byB5b3UuIFlvdSBj
YW4gd2VpZ2ggaW4gYm90aCB0aGUgb3B0aW9ucy4NCg0KWzFdIGh0dHBzOi8vZ2l0bGFiLmdub21l
Lm9yZy9HTk9NRS9tdXR0ZXIvLS9tZXJnZV9yZXF1ZXN0cy80MDYzL2RpZmZzP2NvbW1pdF9pZD1j
MjFhNDcxNzVkN2VjMGY0ODQxNDMzNWNkMmRlMDEwYWU5NjcwNjI2IzA4MDZjNjg1OTdmOWUyNWMx
MTBjNjU5N2FlMGM5ZTY5ZDljMGM1YThfMzc4XzQ0OA0KDQo+IA0KPiA+ID4gIHsNCj4gPiA+ICAJ
Y29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZyAqY29uZmlnID0gJmRldi0+bW9kZV9jb25maWc7
DQo+ID4gPiAgCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqYmxvYjsNCj4gPiA+IEBAIC0yMDAs
MTQgKzIwMywxNCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QNCj4g
PiA+IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUNCj4gPiA+ICAJc3Ry
dWN0IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYiAqYmxvYl9kYXRhOw0KPiA+ID4gIAl1bnNpZ25l
ZCBpbnQgaSwgajsNCj4gPiA+DQo+ID4gPiAtCWZvcm1hdHNfc2l6ZSA9IHNpemVvZihfX3UzMikg
KiBwbGFuZS0+Zm9ybWF0X2NvdW50Ow0KPiA+ID4gKwlmb3JtYXRzX3NpemUgPSBzaXplb2YoX191
MzIpICogZm9ybWF0X2NvdW50Ow0KPiA+ID4gIAlpZiAoV0FSTl9PTighZm9ybWF0c19zaXplKSkg
ew0KPiA+ID4gIAkJLyogMCBmb3JtYXRzIGFyZSBuZXZlciBleHBlY3RlZCAqLw0KPiA+ID4gIAkJ
cmV0dXJuIDA7DQo+ID4gPiAgCX0NCj4gPiA+DQo+ID4gPiAgCW1vZGlmaWVyc19zaXplID0NCj4g
PiA+IC0JCXNpemVvZihzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllcikgKiBwbGFuZS0+bW9kaWZp
ZXJfY291bnQ7DQo+ID4gPiArCQlzaXplb2Yoc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIpICog
bW9kaWZpZXJfY291bnQ7DQo+ID4gPg0KPiA+ID4gIAlibG9iX3NpemUgPSBzaXplb2Yoc3RydWN0
IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYik7DQo+ID4gPiAgCS8qIE1vZGlmaWVycyBvZmZzZXQg
aXMgYSBwb2ludGVyIHRvIGEgc3RydWN0IHdpdGggYSA2NCBiaXQgZmllbGQNCj4gPiA+IHNvIGl0
IEBAIC0NCj4gPiA+IDIyMywzNyArMjI2LDQ1IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1h
dF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlDQo+ID4gPiAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZQ0KPiA+ID4NCj4gPiA+ICAJYmxvYl9kYXRhID0gYmxvYi0+ZGF0YTsNCj4gPiA+ICAJYmxv
Yl9kYXRhLT52ZXJzaW9uID0gRk9STUFUX0JMT0JfQ1VSUkVOVDsNCj4gPiA+IC0JYmxvYl9kYXRh
LT5jb3VudF9mb3JtYXRzID0gcGxhbmUtPmZvcm1hdF9jb3VudDsNCj4gPiA+ICsJYmxvYl9kYXRh
LT5jb3VudF9mb3JtYXRzID0gZm9ybWF0X2NvdW50Ow0KPiA+ID4gIAlibG9iX2RhdGEtPmZvcm1h
dHNfb2Zmc2V0ID0gc2l6ZW9mKHN0cnVjdA0KPiBkcm1fZm9ybWF0X21vZGlmaWVyX2Jsb2IpOw0K
PiA+ID4gLQlibG9iX2RhdGEtPmNvdW50X21vZGlmaWVycyA9IHBsYW5lLT5tb2RpZmllcl9jb3Vu
dDsNCj4gPiA+ICsJYmxvYl9kYXRhLT5jb3VudF9tb2RpZmllcnMgPSBtb2RpZmllcl9jb3VudDsN
Cj4gPiA+DQo+ID4gPiAgCWJsb2JfZGF0YS0+bW9kaWZpZXJzX29mZnNldCA9DQo+ID4gPiAgCQlB
TElHTihibG9iX2RhdGEtPmZvcm1hdHNfb2Zmc2V0ICsgZm9ybWF0c19zaXplLCA4KTsNCj4gPiA+
DQo+ID4gPiAtCW1lbWNweShmb3JtYXRzX3B0cihibG9iX2RhdGEpLCBwbGFuZS0+Zm9ybWF0X3R5
cGVzLA0KPiA+ID4gZm9ybWF0c19zaXplKTsNCj4gPiA+ICsJbWVtY3B5KGZvcm1hdHNfcHRyKGJs
b2JfZGF0YSksIGZvcm1hdHMsIGZvcm1hdHNfc2l6ZSk7DQo+ID4gPg0KPiA+ID4gIAltb2QgPSBt
b2RpZmllcnNfcHRyKGJsb2JfZGF0YSk7DQo+ID4gPiAtCWZvciAoaSA9IDA7IGkgPCBwbGFuZS0+
bW9kaWZpZXJfY291bnQ7IGkrKykgew0KPiA+ID4gLQkJZm9yIChqID0gMDsgaiA8IHBsYW5lLT5m
b3JtYXRfY291bnQ7IGorKykgew0KPiA+ID4gLQkJCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRf
bW9kX3N1cHBvcnRlZCB8fA0KPiA+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbW9kaWZpZXJfY291bnQ7
IGkrKykgew0KPiA+ID4gKwkJZm9yIChqID0gMDsgaiA8IGZvcm1hdF9jb3VudDsgaisrKSB7DQo+
ID4gPiArCQkJaWYgKGlzX2FzeW5jIHx8DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGxvb2tzIGluY29t
cGxldGUgYmVjYXVzZSB0aGUgaW1wbGVtZW50YXRpb24gZm9yIGFzeW5jIGlzDQo+ID4gc3BsaXQg
YmV0d2VlbiB0aGlzIGFuZCBbMV0uIEl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGhhdmUgYm90
aCB0aGUgcGF0Y2gNCj4gc3F1YXNoZWQuDQo+ID4NCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82MzEyNjEvP3Nlcmllcz0xNDA5MzUmcmV2
PTINCj4gPg0KPiBJbiB0aGUgMXN0IHBhdGNoIHByb3BlcnR5IGlzIGNyZWF0ZWQgYW5kIHRoaXMg
Mm5kIHBhdGNoIHRyeWluZyB0byBmZXRjaCB0aGUgZGF0YQ0KPiB0byBiZSBleHBvc2VkIGJ5IHRo
ZSBwcm9wZXJ0eSBjcmVhdGVkIGluIDFzdCBwYXRjaC4gSSBjYW4gc3F1YXNoIGJvdGggdGhlDQo+
IHBhdGNoIGluIG15IG5leHQgdmVyc2lvbiBpZiBpdCBtYWtlcyBzZW5zZSB0byBoYXZlIGJvdGgg
b2YgdGhlc2UgaW4gYSBzaW5nbGUNCj4gcGF0Y2guDQo+IA0KDQpJZiBhdCBhbGwgaXQgc2hvdWxk
IGJlIG1hZGUgb3RoZXIgd2F5IGFyb3VuZC4gRmlyc3QgZmlsbCB1cCB0aGUgZGF0YSBhbmQgdGhl
biBleHBvc2UgdGhlIHByb3BlcnR5Lg0KQWxzbyB0aGUgcGF0Y2ggaGFzIHNvbWUgcmVtbmFudHMg
b2YgdGhlIHByZXZpb3VzIHZlcnNpb24gd2hpY2ggZG8gbm90IGZpdCB3ZWxsIHdpdGggdGhlIGN1
cnJlbnQgdmVyc2lvbi4NCkZvciBleGFtcGxlIHRoZSBwYXJ0LA0KDQorCQkJaWYgKGlzX2FzeW5j
IHx8DQorCQkJICAgICFwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkIHx8DQoNCk1h
a2luZyBpdCBvbmUgcGF0Y2ggc2hvdWxkIGJlIGdvb2QgZW5vdWdoLg0KDQpSZWdhcmRzDQoNCkNo
YWl0YW55YQ0KDQo+IFRoYW5rcyBhbmQgUmVnYXJkcywNCj4gQXJ1biBSIE11cnRoeQ0KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLQ0K
