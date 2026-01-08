Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2FD01388
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 07:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96110E2F7;
	Thu,  8 Jan 2026 06:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLouGoqt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4085210E27B;
 Thu,  8 Jan 2026 06:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767852803; x=1799388803;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0U3isMvfx1lX3rJ2OZa3s7oLUfN8r+ZPDk15vl+jVr8=;
 b=NLouGoqtGMQOcX+CRWWo+hKkt/R4y5HoOlS3PBUnSUj+WbNLQwlKW+kW
 YTCA4136oHHfCI0uUL1LE/BCjPXNXCcn1ab794r9WYw6howKlYl0JzOLG
 bHXVq2b6z5HdlUa/e+OvCG+JqXtemk1MSeH9ch7VMqZzvReTgOUgm93yW
 6ZcYln5/Kq0iFo1swLZuGOzXmnIosUbn3EMY8WR8EF8AOrtGaI5SVeN94
 QWAc4S2oZvI1kY205J1xi3607rRdmyzjwlCQxOFUSeJSlJe1RVgcjgbhA
 0aPK7PzeCj3xbFnWWzOKd+WjdY2mDqH0E4jAY7O0WN95SjQh/djFg4NHh g==;
X-CSE-ConnectionGUID: IYMF94/OTiiqITsEOPGL/Q==
X-CSE-MsgGUID: X0Gd6c3gR2yARadyajTbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69160578"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="69160578"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:13:22 -0800
X-CSE-ConnectionGUID: fUImlQxBTdKSLq561B2GCg==
X-CSE-MsgGUID: d9dXLMb7R7Knbx3H2OQXqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207600401"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:13:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:13:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 22:13:22 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 22:13:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWMzQ9dDiIh9UN3XtC8xs7J5wHe96fxSwd6FZLoehf0tU/SKSbCtiA2cQHZZyLst3ser5mpc80dETBIr+Lglurq4MUxv7iWEtg12fDhZy02yX7HumomlAdOmwVCP1AdLlQXqVftIInYgMSFgz6u6X19C/6rtMq6AekQT0fDFPlqbiEhzJJ8Dm8EJudMpDXxXuopt4g0TNL19+kl6u/I4euniOI1heyLVqlVN/apGsUxyZG6G6HUdaHRthlgjSnXYchax6ciwkvRssF+vug+wFPeORZ1DDh6hMbLdUJJE411nN/ZtMISRtsYZuc2Rl95Ajrkr4VVYx9I2Ylcq0rOykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0U3isMvfx1lX3rJ2OZa3s7oLUfN8r+ZPDk15vl+jVr8=;
 b=VV+j1JvI0xN0MTj/m73UKLTzwDdsNtBMThJ1YJdxbAAK7tDSiXrxxjS8Ym9ACXWWLBrvUYRwHSLCQgQe2EBsSTGnJ5aa6ZRf1W35XZpKtYJiz/eLMi6p2aaz0XDkvHaKoOE4PWQ4Zh+WfQDIolvjVKb5+5OEyU4zleadS+r2ORuXLcxv+kgfPX3JCl2dx4Ok2oxEPLMI3B9MljYUi0L1lh9FMuxHkd8KYvWZD1lYDSSUkiOg6gcT3iqiVa9k+/o3ItozcY46+ylZZT9EoZM6t8NdUWrw7PKoKeo6vI1q8Rj350u0FopMAiV8W6hs+OTGN4kaPSnrbruuQqmdRMKWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB7114.namprd11.prod.outlook.com
 (2603:10b6:806:299::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 06:13:18 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 06:13:18 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
Thread-Topic: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
Thread-Index: AQHcfsaP7xV7d87WLEm19Vt62y+IN7VHzcNQ
Date: Thu, 8 Jan 2026 06:13:18 +0000
Message-ID: <DM3PPF208195D8D2A4D78D1F6F78E4932D0E385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-1-d51d9a351684@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB7114:EE_
x-ms-office365-filtering-correlation-id: 9c8e2d79-c17d-43e7-1189-08de4e7d0445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?d2NrbXVud25rdVBnYll1UXVPa0lRaVpobnhqcHNQZThaMzdvWGRUYkR2UnUz?=
 =?utf-8?B?MnYwWmdHZm5JQkRKNXBEU2VzUkxBZzc2NDd0S0ozTDhrQjhIT1I5cnUycTBw?=
 =?utf-8?B?Wjd2emlkanV4Z1hXd0w5Yk5jM1UxMXpRVkRIcDl0MmN2TnlqUVpKbi9WMDE2?=
 =?utf-8?B?dE5Bc1hpMUovc0RaRWRONWpxL2VFdmR2NGh1TUJZSjVlUXdQWksxcm5MS1lZ?=
 =?utf-8?B?TERQMVIwZENkcWN2anFldktxdkU3Ryt0SjFyUlNFVy9Oa0pEbWFMM0R0b3gr?=
 =?utf-8?B?ZXl5OWNaN1RjUVB1T0dkR0hhMWdudGlGUjU4VFIrSmM3NEJOcWdIWUZDYVJH?=
 =?utf-8?B?ckdLRkpUVjEvV2V6aDduR1kyWE13TkJaWitxYTZqaXk5ZlIrYW0vSWMrRCtL?=
 =?utf-8?B?Z2o5YnJrV0d2U2JMYjZudUU3ckdXOGhEcE0ybGJKTzh6cVRGbDl5UlpRRVpu?=
 =?utf-8?B?VDBlcTMxTklMUmJMZklTSHo0WElrTnhvVk1UQVY3elA5ci80eGt5Rm1FL1Y0?=
 =?utf-8?B?QVgxR2xhZ0tNZHY4WjMrcFJRbkdPa2VKS2RKRkhnbUR4d0JidU5MeTAvUjV4?=
 =?utf-8?B?YlpTYUg4WEhSQ3dWZkRaOFBhRkR1dk1DTVBpbVdjaE9wVG12N2ZtejNqa0lY?=
 =?utf-8?B?UWFpTWd6eHh3b2xKMVZwMEVjR25aaFlJYStROVFwOWxGVExKS0V2WGZrR3Jz?=
 =?utf-8?B?cGRpWUQ5Zlp6WEtYdThrVFQvSUsxeVV2cmpsbjFrcnFVb244RjkxMWJ4MXdZ?=
 =?utf-8?B?MklDeElBcEM0T2ZSTXFDWDRhL0hERjNxZEJnenpraE8vOC91cTJzMVpjQUFm?=
 =?utf-8?B?eEwzQVRpRkRVUkpVeVRaV1hPRmVwTlpiTjNBR2tyZ2pRR3pUTnl0cDNDWXM2?=
 =?utf-8?B?RGduRnMzL1RuYnExdTJxZFRubmlwSkR2dE5IaHNpZGdoS3k2MU9MblliUnE1?=
 =?utf-8?B?bndNUFh3L1ppdWNKNDJCcnpZZlpuRTM3cHE5U3FhVXVHRlJmTm5XbFpRR2tK?=
 =?utf-8?B?V0tuQUxOYUFaeGpjOW9OOGdBNkZGZk5ZbXRYWmxxUHNXUzkzMmpvVFNXQi9T?=
 =?utf-8?B?blhzUG1jZXlJcVZSOHAxKzNQS2ZRNW4wVDgxeXoxZmVKL2F6ZkJHVlhIZmFi?=
 =?utf-8?B?c3B4R1JQOC9DaFpjWHJBY0J5NWpHU29BeXVsbkNEYkNoOW9qYjZSZ0ZwdkNw?=
 =?utf-8?B?R3VJT1NBOC9tK3RSc3ppVGVBTXFNTGlVNk1jNS9DZGdCSkhJUCtaT3NISW0r?=
 =?utf-8?B?S2VERFhmR0Q0a010Wklab0F6cmgvSzlMVTFVN3RWTXlqVVRkZUttT202RGRa?=
 =?utf-8?B?amZQOVB5TlFxc0lJdDYveGd4L1ZNcUJPMHBMZWtFS1dlMVZUTlVOcjU5UXN6?=
 =?utf-8?B?ano2L0pKL2VZcTlmQmU2M3hJQU9pTzVjU3gyVEZ2bFF0dlU4WWIwV1g3VFE1?=
 =?utf-8?B?STJGcTNoUXlnVjY4T1ZDT1libFlOcCtIajRHYkJENythbXZoM2tXN2tKYzZT?=
 =?utf-8?B?bUxpeG5hNm0yYWNNTjVVUkY1QnduNGZ4Z0kwUXNhTm9iQ1RmU2ordnlYOFY3?=
 =?utf-8?B?ODFXRUhwT0RRZ0pFKzVhSzRISzVFTlJJOW1iVWI3ZHRMZUoxYmlJOW9LejdG?=
 =?utf-8?B?SWYvVU5SVzlNN1ZiZ3d0YXlNNnZ2SnBsNGdtTlBqcWE1cXVrc0Q2M0RyWEND?=
 =?utf-8?B?emNMNTBlUXM5WFI0ZnFKVUgzam8wZURIODI0ZHJ6dWdpaVZGV2h0ZWw1S3hZ?=
 =?utf-8?B?Y3pzOW1tSFRnaHhmQUd6OHlncEoyMVhnNWs5SGl1eHNQOEdQSGZrTTdNdVJK?=
 =?utf-8?B?K0EzdUlmalNEZGE4T0lVZWVtK2F1dWVQT0dGT05oVkVzd0toS3BxRGs2OHlI?=
 =?utf-8?B?MEN0ZEZUWVFWak9CeUVYM0dyTzJwTld5OXJCMW9jd2c0bm9UYXl6MFY1cHdE?=
 =?utf-8?B?OHJlUElQMWkyWnhoQ2NjU0VWM3R0YkVybWcvVHZTYVFUY0RSRlZZK1RJcDYy?=
 =?utf-8?B?Z2FMZjBMT0VDTTgzUXJPUWo3Qm9xeVJxSXVBRVBidmxPOGptY1JQU1FhNjNh?=
 =?utf-8?B?K05QenNJYU43YTVRTHBWOTJOQTBaSUx6RTNFUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmNtY05mQmpIcEFydTlBZmgwemF5c2F0TDFPWkZvSzdRSnRhaHlZRFltV2Jh?=
 =?utf-8?B?NitJSUplc0M3RklUaFdUek92Q01nQWhKTW0rUyszN1FXcjdVbXhoem1IemxK?=
 =?utf-8?B?Z1hpNm5HaTRUUUJiMXZzRzdlTUpGbzM5UWY5dW5laWIreFZyVUNEWmRmekUw?=
 =?utf-8?B?SWRjb0U2QUNjM0k2cjh3Vlc4SzRMV0NqNEJLRWhmQ28xYTRlNEFSK2VGTFJr?=
 =?utf-8?B?aWRhM2ZKR29ZTW1JSGhpeE9OdGcvcTFGK1N2bk40VEszSWJFQWxpSFBnUndp?=
 =?utf-8?B?andaZkRyMHFuU0VrMmNuUTVyMXVlRFlFTCtKVSsxZnpZYWRHMzFaVVJHU01Q?=
 =?utf-8?B?ZHZoNFJvcVBsbkIwcWtBUjZFQkw4RGtGdHBnbXZVZCtvbXp6cC80REtkbjh6?=
 =?utf-8?B?NitGbk5hc1IwUWppZmhXN2l2QnY0UXdVR1Fnd0VyN2FoTWkzVktPU1pidjBt?=
 =?utf-8?B?M1lhcUpSS3hhSUtVM2RmUkVDSXl2OWdVREhPWDdLRks5UDF0UitYRE9kandT?=
 =?utf-8?B?c2s2MkVXbndWeFJTS24vZ1k1Z0tVazkrK1B4d1JsZGk3bi92K00wNi84TDVz?=
 =?utf-8?B?S1hiVjUzc2tJbm9YajNlQzBQNHJRSDVzMmRDRForWTRIQzJMdmRvc1YxaGc5?=
 =?utf-8?B?SUxiVHQ5cnJ0b3pCVjdlc1lkdFlxUEpHUmxBcHFrUm1xWVQ0NFdGWmJ1YXIz?=
 =?utf-8?B?RlVLczd0bUJNTWhmcHJCZ1czaXIxMC9Eczh6YnF0RDRiY2x6a1BsMEtOeUZK?=
 =?utf-8?B?UFpqa2dKVGFVTHZuV0l4ZjlyVnFrTTNDVDh2R1VYNnJHRXNZMlJxWjNJY1dv?=
 =?utf-8?B?U0xUZjlSd2hTdDBpU3FneXFRYWdTbDh6M251QVJBMS9iNEcrL1ZYbHZpSUFj?=
 =?utf-8?B?WFYycEVvUll5bStQdTgxZFVBZlhSNHVRRnUvaXorazR6NllNV3k1angwNmVz?=
 =?utf-8?B?U2lXYVFOeWtiWjkxdkRna1ExemNmaEZxSTQvOThPK3lOSk9NRUxaZlVTSC83?=
 =?utf-8?B?N0JsQTdnU1dITTJPcU1VUHB0NnRLMVhza0Nmc0xZZ1Z6OUk3N1QvQW5QcERu?=
 =?utf-8?B?VDlET2w1K3FEOVdpdG5lNUlTbE9sOVhtbkl0UU1iOUpJdnNwUEVTRThhZTRT?=
 =?utf-8?B?bVlYbkIvZm5GajlZOUk0bjlycTRCelhFRWxKWXhYeFVMaDdLWFEvQ1FOWkJk?=
 =?utf-8?B?K0VSZGZNZ3dBalR4Qm5vK1RTVXk5ckZsMnRSaXgxR1h1RXNaN21CYzhvU25l?=
 =?utf-8?B?OWp1U1Urck8vRVpLQzlUQ2V0R29JL0RHZVFwNTcrb0ZBczlic2lxVUVqZ2VT?=
 =?utf-8?B?RmRWNjVCUk55LytuOG9IZ1JyUStncmdlN1NIeHRyRE5QaTI3SDI5eWllcDNy?=
 =?utf-8?B?VzFKOC9wb1kvNUlZMy9qYmY3dVVwZ29saTVsTjdWYUFrQ29YNkVGSlBQZXVp?=
 =?utf-8?B?T05aMUZBUm40S1RBZnpUcUxvaFB2R0k1a1NDVCtNbkpYVEJtanAxVEpMb3NW?=
 =?utf-8?B?SlhNd2lCbDB0VHQrL3lKaFVodlZQSEUwN20rLzF1alU2VzhCMndxRFpQakl3?=
 =?utf-8?B?M0RKdVNuNUVaS01SSXltWk1ZVzh6dGZhNldwWlBhU1l5eStVUGVqZHo0VUN4?=
 =?utf-8?B?dnNqa2xWUkVBeTdTTHVPb3BTcHZpQ1IwR1FQMlJMUEdJbkU3VXlZZGkvaTF4?=
 =?utf-8?B?VDgrUHdBUUtiVUN1NzNKSHpxaGdIYzBMbFNCZmt0V09LbDN6NnpRbURDRy9K?=
 =?utf-8?B?SEg2VG8rQyswcWR4UlNNSU9LWXBqaFgwR0NQeXJJYjh0QldaSS83UkQ0WHhh?=
 =?utf-8?B?dW5LVWdHYnpWb3Zrc2dVU09ZZGZOWkV0VGNxKzMzSVJNNVJiNWhCdysvV1Qw?=
 =?utf-8?B?bzI5TGRPdXJKaDIxeEF3anJWL0pseWZDRmFWV3EzOXZpWUY0L2VDUXlhMWRX?=
 =?utf-8?B?Z3BESWNRbGUzdkZER1BKdUNYNVpWeFR4UTJuTFdMa3dqQlVCdkFMMVBrR3Fk?=
 =?utf-8?B?OE9JalpocHFmZlBOQ21TRjJRbkx2L0hkdkMweVFTS1g2bTlKeCtDc0ZHVVk2?=
 =?utf-8?B?ZXVQMld2Q3RVV2hMZGcwdkpDRU1aYnpMZEVxMmRITkNNaEpacGd5TDJ2V1Iv?=
 =?utf-8?B?dG15YUNPcUltTmhUL09VUCtrTitFL1BRS0Q2WmNoNU5JVUF3LzhKbzFRaDd1?=
 =?utf-8?B?M1ZoMllERkJYZFNOeWJpNkhHWnpjUUNMVTQrV1d2Y2ZoeEw4a3FqMk94M293?=
 =?utf-8?B?RStDalJONURZc2JUdWtuamtRM2UwWmFpNWlUNjZGZnEyelQrV0Mwblh1bzBR?=
 =?utf-8?B?MXZ1RzJ0bnZIOVZobXM5OXJ2WVpwREJzQzJCUFZhVk5XS3pvRE9iQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8e2d79-c17d-43e7-1189-08de4e7d0445
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 06:13:18.2281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4Ra0Oqz/qzGhcydfGawBIn8ZGfav9a41Y61oBKnwExnbqF48MwoFPvUWT/P0Icl/cpxQvplXKZzIraH2GfNcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjcgMS81XSBkcm06IERlZmluZSB1c2VyIHJlYWRhYmxlIGVycm9y
IGNvZGVzIGZvciBhdG9taWMgaW9jdGwNCj4gDQo+IFRoZXJlIGNhbiBiZSBtdWx0aXBsZSByZWFz
b25zIGZvciBhIGZhaWx1cmUgaW4gYXRvbWljX2lvY3RsLiBNb3N0IG9mdGVuIGluIHRoZXNlDQo+
IGVycm9yIGNvbmRpdGlvbnMgLUVJTlZBTCBpcyByZXR1cm5lZC4gVXNlci9Db21wb3NpdG9yIHdv
dWxkIGhhdmUgdG8gYmxpbmRseQ0KPiB0YWtlIGEgY2FsbCBvbiBmYWlsdXJlIG9mIHRoaXMgaW9j
dGwgc28gYXMgdG8gdXNlIEFMTE9XX01PREVTRVQgb3IgcmV0cnkuIEl0DQo+IHdvdWxkIGJlIGdv
b2QgaWYgdXNlci9jb21wb3NpdG9yIGdldHMgYSByZWFkYWJsZSBlcnJvciBjb2RlIG9uIGZhaWx1
cmUgc28gdGhleQ0KPiBjYW4gdGFrZSBwcm9wZXIgY29ycmVjdGlvbnMgaW4gdGhlIG5leHQgY29t
bWl0Lg0KPiBUaGUgc3RydWN0IGRybV9tb2RlX2F0b21pYyBpcyBiZWluZyBwYXNzZWQgYnkgdGhl
IHVzZXIvY29tcG9zaXRvciB3aGljaA0KPiBob2xkcyB0aGUgcHJvcGVydGllcyBmb3IgbW9kZXNl
dC9mbGlwLiBSZXVzaW5nIHRoZSBzYW1lIHN0cnVjdCBmb3IgcmV0dXJuaW5nDQo+IHRoZSBlcnJv
ciBjb2RlIGluIGNhc2Ugb2YgZmFpbHVyZSwgdGhlcmVieSBjcmVhdGlvbiBvZiBuZXcgdWFwaS9p
bnRlcmZhY2UgZm9yDQo+IHJldHVybmluZyB0aGUgZXJyb3IgY29kZSBpcyBub3QgcmVxdWlyZWQu
DQo+IFRoZSBlbGVtZW50ICdyZXNlcnZlZCcgaW4gdGhlIHN0cnVjdCBkcm1fbW9kZV9hdG9taWMg
aXMgdXNlZCBmb3IgcmV0dXJuaW5nDQo+IHRoZSB1c2VyIHJlYWRhYmxlIGVycm9yIGNvZGUuIFRo
aXMgcG9pbnRzIHRvIHRoZSBzdHJ1Y3QNCj4gZHJtX21vZGVfYXRvbWljX2Vycl9jb2RlLiBGYWls
dXJlIHJlYXNvbnMgYXMgYSBzdHJpbmcgY2FuIGFsc28gYmUgYWRkZWQgb24NCj4gbmVlZCBiYXNp
cyBieSB0aGUgdmFyaWFibGUgZmFpbHVyZV9zdHJpbmcgaW4gdGhlIHNhbWUgc3RydWN0DQo+IGRy
bV9tb2RlX2F0b21pY19lcnJfY29kZS4NCg0KWW91IHNlZW1lZCB0byBoYXZlIG1pc3NlZCBhZGRp
bmcgdGhlIHZlcnNpb25pbmcgY2hhbmdlcywgc2FtZSBmb3IgYWxsIHBhdGNoZXMNCkluIHRoaXMg
c2VyaWVzIHNvIHBsZWFzZSBhZGQgdGhhdCB0b28uDQpPdGhlciB0aGFuIHRoYXQgTEdUTSwNClJl
dmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIHwgNDENCj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MSBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9k
ZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+IGluZGV4DQo+IGNiYmJmYzFkZmUy
YjgwNmM2NDFjNzIwYjAyMTVlODI1ZTM1MGJkMDMuLjAyNGMzOWViYTZiMjVlMTRhOTliMTQyMjQN
Cj4gZDk2YjcyNTRjY2ViZDYxIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9t
b2RlLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+IEBAIC00NSw2ICs0
NSw3IEBAIGV4dGVybiAiQyIgew0KPiAgI2RlZmluZSBEUk1fQ09OTkVDVE9SX05BTUVfTEVOCTMy
DQo+ICAjZGVmaW5lIERSTV9ESVNQTEFZX01PREVfTEVOCTMyDQo+ICAjZGVmaW5lIERSTV9QUk9Q
X05BTUVfTEVOCTMyDQo+ICsjZGVmaW5lIERSTV9NT0RFX0FUT01JQ19GQUlMVVJFX1NUUklOR19M
RU4JMTI4DQo+IA0KPiAgI2RlZmluZSBEUk1fTU9ERV9UWVBFX0JVSUxUSU4JKDE8PDApIC8qIGRl
cHJlY2F0ZWQgKi8NCj4gICNkZWZpbmUgRFJNX01PREVfVFlQRV9DTE9DS19DCSgoMTw8MSkgfCBE
Uk1fTU9ERV9UWVBFX0JVSUxUSU4pDQo+IC8qIGRlcHJlY2F0ZWQgKi8NCj4gQEAgLTEzMzksNiAr
MTM0MCw0NiBAQCBzdHJ1Y3QgZHJtX21vZGVfZGVzdHJveV9kdW1iIHsNCj4gIAkJRFJNX01PREVf
QVRPTUlDX05PTkJMT0NLIHxcDQo+ICAJCURSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VUKQ0K
PiANCj4gKy8qKg0KPiArICogZW51bSBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgLSAgZXJyb3Ig
Y29kZXMgZm9yIGZhaWx1cmVzIGluDQo+ICthdG9taWNfaW9jdGwNCj4gKyAqIEBEUk1fTU9ERV9B
VE9NSUNfSU5WQUxJRF9BUElfVVNBR0U6IGludmFsbGlkIEFQSQ0KPiB1c2FnZShEUk1fQVRPTUlD
IG5vdA0KPiArICoJCQkJICAgICAgIGVuYWJsZWQsIGludmFsaWQgZmFsZywgcGFnZV9mbGlwIGV2
ZW50DQo+ICsgKgkJCQkgICAgICAgd2l0aCB0ZXN0LW9ubHksIGV0YykNCj4gKyAqIEBEUk1fTU9E
RV9BVE9NSUNfQ1JUQ19ORUVEX0ZVTExfTU9ERVNFVDogTmVlZCBmdWxsIG1vZGVzZXQNCj4gb24g
dGhpcw0KPiArY3J0Yw0KPiArICogQERSTV9NT0RFX0FUT01JQ19ORUVEX0ZVTExfTU9ERVNFVDog
TmVlZCBmdWxsIG1vZGVzZXQgb24gYWxsDQo+ICtjb25uZWN0ZWQgY3J0YydzDQo+ICsgKiBARFJN
X01PREVfQVRPTUlDX0FTWU5DX05PVF9TVVBQX1BMQU5FOiBBeW5jIGZsaXAgbm90DQo+IHN1cHBv
cnRlZCBvbg0KPiArdGhpcyBwbGFuZQ0KPiArICogRFJNX01PREVfQVRPTUlDX0FTWU5DX01PRElG
SUVSX05PVF9TVVBQOiBNb2RpZmllciBub3QNCj4gc3VwcG9ydGVkIGJ5DQo+ICthc3luYyBmbGlw
DQo+ICsgKiBARFJNX01PREVfQVRPTUlDX0FTWU5DX1BST1BfQ0hBTkdFRDogUHJvcGVydHkgY2hh
bmdlZCBpbg0KPiBhc3luYyBmbGlwDQo+ICsqLyBlbnVtIGRybV9tb2RlX2F0b21pY19mYWlsdXJl
X2NvZGVzIHsNCj4gKwlEUk1fTU9ERV9BVE9NSUNfSU5WQUxJRF9BUElfVVNBR0UsDQo+ICsJRFJN
X01PREVfQVRPTUlDX0NSVENfTkVFRF9GVUxMX01PREVTRVQsDQo+ICsJRFJNX01PREVfQVRPTUlD
X05FRURfRlVMTF9NT0RFU0VULA0KPiArCURSTV9NT0RFX0FUT01JQ19BU1lOQ19OT1RfU1VQUF9Q
TEFORSwNCj4gKwlEUk1fTU9ERV9BVE9NSUNfQVNZTkNfTU9ESUZJRVJfTk9UX1NVUFAsDQo+ICsJ
RFJNX01PREVfQVRPTUlDX0FTWU5DX1BST1BfQ0hBTkdFRCwNCj4gK307DQo+ICsNCj4gKy8qKg0K
PiArICogZHJtX21vZGVfYXRvbWljX2Vycl9jb2RlIC0gc3RydWN0IHRvIHN0b3JlIHRoZSBlcnJv
ciBjb2RlDQo+ICsgKg0KPiArICogcG9pbnRlciB0byB0aGlzIHN0cnVjdCB3aWxsIGJlIHN0b3Jl
ZCBpbiByZXNlcnZlZCB2YXJpYWJsZSBvZg0KPiArICogc3RydWN0IGRybV9tb2RlX2F0b21pYyB0
byByZXBvcnQgdGhlIGZhaWx1cmUgY2F1c2UgdG8gdGhlIHVzZXIuDQo+ICsgKg0KPiArICogQGZh
aWx1cmVfY29kZTogZXJyb3IgY29kZXMgZGVmaW5lZCBpbiBlbnVtDQo+ICtkcm1fbW9pZGVfYXRv
bWljX2ZhaWx1cmVfY29kZQ0KPiArICogQGZhaWx1cmVfc3RyaW5nX3B0cjogcG9pbnRlciB0byB1
c2VyIHJlYWRhYmxlIGVycm9yIG1lc3NhZ2Ugc3RyaW5nDQo+ICsgKiBAZmFpbHVyZV9vYmpfcHRy
OiBwb2ludGVyIHRvIHRoZSBkcm1fb2JqZWN0IHRoYXQgY2F1c2VkIGVycm9yDQo+ICsgKiBAcmVz
ZXJ2ZWQ6IHJlc2VydmVkIGZvciBmdXR1cmUgdXNlDQo+ICsgKiBAY291bnRfb2JqczogY291bnQg
b2YgZHJtX29iamVjdHMgaWYgbXVsdGlwbGUgZHJtX29iamVjdHMgY2F1c2VkDQo+ICtlcnJvciAg
Ki8gc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZSB7DQo+ICsJX191NjQgZmFpbHVyZV9j
b2RlOw0KPiArCV9fdTY0IGZhaWx1cmVfb2Jqc19wdHI7DQo+ICsJX191NjQgcmVzZXJ2ZWQ7DQo+
ICsJX191MzIgY291bnRfb2JqczsNCj4gKwljaGFyIGZhaWx1cmVfc3RyaW5nW0RSTV9NT0RFX0FU
T01JQ19GQUlMVVJFX1NUUklOR19MRU5dOw0KPiArfTsNCj4gKw0KPiAgc3RydWN0IGRybV9tb2Rl
X2F0b21pYyB7DQo+ICAJX191MzIgZmxhZ3M7DQo+ICAJX191MzIgY291bnRfb2JqczsNCj4gDQo+
IC0tDQo+IDIuMjUuMQ0KDQo=
