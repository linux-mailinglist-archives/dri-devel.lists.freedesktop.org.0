Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D420A139FA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 13:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D1210E58C;
	Thu, 16 Jan 2025 12:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGCNuwEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462A910E583;
 Thu, 16 Jan 2025 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737030820; x=1768566820;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uF3QTF34zg5vEwRtJ1QZ7Cx7wTD+bpbtTZm83L1ilfI=;
 b=iGCNuwEIakPwLImvEwO4linMs9hdfVfzBhmSff456LmZudBgP+spfmvF
 9gvGKt5xGhg29JYzWVAHmv+8dCRb83wKOddk1I2EucJ//kUvFrIULrsQl
 nNYqlWa9Yr9ohciwjJkZ0ol/b5aRdMSx/mZ6Af1VcefjH+H/JF83HJNFA
 52uYv3+zeNbnrA5TCn1rjjX6DZMrEkMc16YGl4gX6okpfwStUUJW6ZSKn
 JY5X78FDC4TwL9ooNnZL/zYLxxDipCVbtGWGEnSvJ/63K0QXkGqH8UJ1R
 /m9tegmspoUw2IUM2Y8/MDxpehUMYNkQBp1sGQe9DNavEkpnq/OOvYcMO A==;
X-CSE-ConnectionGUID: sASJjal1TN6vsz2qennRjQ==
X-CSE-MsgGUID: K2YTHWsqS4evlOtYdIuRTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47903994"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="47903994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 04:33:39 -0800
X-CSE-ConnectionGUID: 0SBXNrwlSG+AzzyYwrkTvw==
X-CSE-MsgGUID: eT43pOCtT1i3nmzFiyZTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="106070792"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 04:33:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 04:33:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 04:33:38 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 04:33:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mego4bUyZSd/a6fiQ1POarBa53SJANPQL056rOFqTmqYUDWIv5DaSVCxbhP6QJD7jJ5roy5PS0ZlrkcgUmGBUXQmZEsdYdcdWxNv9sGJCsKcN+WKb+m51ZXHAX5s+vm0nHMj8q/U6121BXS381MiRVTbhGXEjEFy2ZtmbuiXXvW4bHXCtoV56DywEEWkQz6Ktoccj/4GOPV3R2YydBetdMweDdbAZkHB28q5uJBmUbuhTgsUa/tnXL87xCTj2sYWz37VKZzjDMckpZtBwGzn/8rCA0lAcvaqxc9yfrUzNCNPzVJeZIULOyjcA1sd27by7mWH9s08vr1dpKvZqB/nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uF3QTF34zg5vEwRtJ1QZ7Cx7wTD+bpbtTZm83L1ilfI=;
 b=R9UT2jhl4Ern8KH7oj95/qnNn+p1oUyuTnX6lJwIotTqa1HHKcIYAPKCI0xR8IYxX94Hv70UBze0yJ/lQQIXH9FNUYeZQOw4PWzz+iEz8d7WF7ffQmm1YTARhC5HHcp7iFse9YQjEQ6QnSkzbea5u78oq/LYfbiWGwNFDZop+Cqd6IgBzS/QucdvhLt1RC9bKdlDtJIuumbbESR7DTjsV0EHhmHAFRBRIayi9zFw4WAXK/o9Jqdb3idzP9Qd4ZnHiUpy1LjK2Q9OOh2ohIYjVg7yg/zcBdYRCxoYFYYeIvDbyHRT2g1h9Ujn/Dx907FHFhBE5etIBgFKmdef3p7AiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 12:33:20 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 12:33:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v7 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbYtFCB5lsX7WJdUO11PRG7LBZALMYRh8AgACXd6CAADEQgIAAGP2A
Date: Thu, 16 Jan 2025 12:33:20 +0000
Message-ID: <IA0PR11MB73070AE8FD9EAF5E47A56A96BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-1-605cb0271162@intel.com>
 <kwklrd2zjovabsa537jwg3bpqilvhfmxxyr4exmqbi2b35uxej@mhequ6ttibsd>
 <IA0PR11MB73079537444DAA9596F0A837BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
In-Reply-To: <CAA8EJpojDKtcG=amuwT7B+iaU_A9EwcvpkyyQ8nupKtsF_79gg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ1PR11MB6203:EE_
x-ms-office365-filtering-correlation-id: 833b0930-98e6-42fe-3bb3-08dd3629f622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SU5tbTVnamlaeVhFclZhdGNidjhXd05EZUpVOUx2Y0JjcnZVbFV1cExDVFBL?=
 =?utf-8?B?SDI4S3F1MS9mSCtsYTJXeTVnaE9LK05tSWJONVNJMlVPMEF6cU5ROFY1U3hl?=
 =?utf-8?B?SWt0a2g0NkxpaFE1dzh6MlI0RHBOTkF0bEdFMVFKWXMrMlh5cm91NFRDOE1N?=
 =?utf-8?B?QkwzZ2EyNzdqTlBYbDA5RUk2WUNZZmVDdTJLVXhhb0ZmMDlRYmZ4VVZmZFNu?=
 =?utf-8?B?WFo4by9xN0xwUkRBNU5xcW1IZG1iN0hkUHpIcEpUV0dLYXdqV0QyMkcvTGQr?=
 =?utf-8?B?Vm9JMk1rdjBwa1loVlpBOUozOTRLc3FiNml2dGIxYzloaVFaMHhMTjlESms1?=
 =?utf-8?B?MWlRWmdhbkV4U1J4ZUlMc1dKMTdhc1JHNmI3S3dlNFBvd1hZTWUraDVOMkEz?=
 =?utf-8?B?VForcXFtejJlc0NhdHI2NjhlSWkwcEV2MmU5L3d4anlXbXdQWXUzSlp5Mm1O?=
 =?utf-8?B?YmJtMzU5UWk5TXROaUNETUN2eGcwT3BvQ3FUaWxwMTdQMDljSDRPeHhCR1I4?=
 =?utf-8?B?TjFxS2pGdXRvRnVnRnI4Vno5VENRamQrRkRMdVEvTUp1S2tYT0djYzVyVjlr?=
 =?utf-8?B?YlJLRjhGenVBNmluYUtYWXBzSVR2NHY4NmRKODRacDRQVnB6cG1EcmM0QmpF?=
 =?utf-8?B?UzByZnpLSDN4WDJTMmtlQ3ljM2ZTRHJBTVV4L0ZqSjNSRlAycERvc050amE3?=
 =?utf-8?B?ejR2aDE1bUdkSDFpSlZvWkwvQjh5Z3lpLyt4Q0xmZ3dUTklTTWNqSHJUYktB?=
 =?utf-8?B?d1FoRy9TaXdsakdnSEFKRnFHSk9LOHVZZWQvSmdhNzZFUGFrUTc3OThTeFVQ?=
 =?utf-8?B?N1BPSEhGeGRtdmU1UTJ6VHEwSlVHUkkvYmFuUUZ5OWwydmVZWUdERFZ2Wm1C?=
 =?utf-8?B?bHhUVmxHVFRNL2orRE1mWk5hYmNTa0hDZkVqMXNuV0hvNmJ2QXU3d28rMkt4?=
 =?utf-8?B?OWlBNFo2WG1POVU3cThpV1pPT3htYnBDRkNZREwrVnFxc1M1VkhjdTVMOFZh?=
 =?utf-8?B?dWFUV3craEU5dHF2UFRyQ0xoN3QzNFQ1bUY0aVdHRUx1RDR1Z2xORGwyeVhW?=
 =?utf-8?B?TDhkYkZHL2NXR0tLK1JSUzE2QmpYR2xHRTZOd05EK09uaGhrVThMaTB3SWo5?=
 =?utf-8?B?TWQ1ZXdBZGNEbWtVOTQvV1ZVT2U2cEp5NVA2aUo4M1NleVVHbWhVL3VzTW5W?=
 =?utf-8?B?VEdBZ0cwcW9NbWo5L2RjaldmQ2NDNmNqcjJHQUZMZFM1ZVEwejkzdldVOUtO?=
 =?utf-8?B?STFGZFpGaVg0VWpTdEVmYWMvK2Flc2phSmgyV2I5SS80c0dBZE1zbWNEUEVC?=
 =?utf-8?B?YktWaEwwTDBMaUk0eE1XUVlIRHB5SEMvY2pqZFJmL2lhQUZkVFR4d2cvYTlY?=
 =?utf-8?B?a09ITUlTWGFUZjU5ZU9tejJBSi80VCt6L09ac05iZTB3Z1NQSHZybUI4RENS?=
 =?utf-8?B?b2Fka2VHNllsQ3Vmc080QkRGSHJwL3k5a2drR0UwdU5FcjFwWng4ZlBFekRG?=
 =?utf-8?B?djFvTCs1YkcyTjhDUCs4NHY5WnVQWGd2OFNPZjJ6YkRUejNGeSs0bldKakkx?=
 =?utf-8?B?OTlNVEluVEtoZTdxdEExLzlRRVQzNkY0MHJDYjFzeXNJNjNabnEwOGhXYlM0?=
 =?utf-8?B?OExEdDUyVlhZM3RmY1dJL2JraGgzRDd4K25xTnA2Um1DRElVUnBDb2laN3lv?=
 =?utf-8?B?RVlmTTBQdDRTbk5uckE0OEU1WlB4ek51dTdxczZvWUYzdXc0amREZEE4ZUFP?=
 =?utf-8?B?M0p2YzROTUw2c1ZHcHZPMXFKKzRleUo3M0hpUnRqSlpCSUx6TE9hZzgxM0VI?=
 =?utf-8?B?UFozTjgvUGdEdklNbnVIRXA2c3JYTkFURURaeWQzTnVHODVqTEpSVjcxc0w4?=
 =?utf-8?B?aUFWKysrQ3BMci9HRTdXSFNBdVF0bUxFVzFtZDVqL3ZRcG1lcW9ObDVDK0J6?=
 =?utf-8?Q?PuVvfIx4WYcYW6diKHhdXqmLeqs29bAM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG5NVVd2RGhiclNLSnFPRWFneUFoQ3VLbEtEUmlTSXBEWlZpMzlDbVBqNXZs?=
 =?utf-8?B?VUJva1p0V2RxWnFmQnlQUDR4cksvWlVoVmdZZU05NkJiMVBubHVIR21TRjJp?=
 =?utf-8?B?ZEhadnloQloxaDRzTlVFcWl2b05ueFAyS01tQ2F5Z0t3R2I1OC84cGdxdThB?=
 =?utf-8?B?QlovM3o0b1Z4UG9pd3lwd3o2cHBHNUZVRGVzaG4xU09sV2xTRjhkaVlsRnRp?=
 =?utf-8?B?c3A0Mng0c0UxM3BXb0hUbExuY0QrazJGeCt1RnlrWmtwUDlNdjViZUpRYVR5?=
 =?utf-8?B?UGRyMjNSQTJDVHFZNWZvZUcrTmtBaTdZdVE2U01FSVVidUVraEhUN1l0RGFB?=
 =?utf-8?B?dGg4T0Rpc1pkWi9yY3Y0VVJtdk44YU1SUzFsb1k3WWFjeXo2VFRRbytyckZF?=
 =?utf-8?B?eU5sS0Job0piQzRvSDhsQmFqTGlqYVVpSzkxU1dwcWlFcEdvWk4vS0dCTFl3?=
 =?utf-8?B?THlKY1pEMkd2NWNZRzQ2OE95Wm1BUzBqbTNsaTdjWHdHRnNrRUg2YVhva2Y1?=
 =?utf-8?B?WklrbmROdmpUZGhwa1g3T0ZWOHBPaG5TY1p3YnZyc3dpQU9XbU1xUVFYTUh5?=
 =?utf-8?B?MGMrY2lKbWFjOEFZd2ZJbEorTlJsMForQUdwSFBaK3llelVsb2NyNDd0TnBt?=
 =?utf-8?B?OTVWanF0RWY1TlgycUl0K1BxU0VQL1gvVWlDb05pSm9rSWd4d1NDQnlTNG9l?=
 =?utf-8?B?UDZ2d3d4MFJYQXA3YzNhOHlFbnpOUjBoanNPY3M2eHl1NmE2UEM4TTdQRDlK?=
 =?utf-8?B?SG50V1ljZUN5U2syaWFqMnFWODI4eGF4ZENpUjZTbzJkaGNRbXFDZTFhNnMz?=
 =?utf-8?B?eENWS0UrblVvMFBLaWQ5Mk1pbTBJVHErSVE1R0pGUUQ1M1ArMW40LythVFhH?=
 =?utf-8?B?UkZBYVova08zR1NNdVJKTElkbHNWOXhTMCtlTU1OQ1VVdk9zL2tqM1NNTytF?=
 =?utf-8?B?MUQ0c2ppeHUwU2VaNmdXOGVldEhUZCtzR1dmeXlpVTRHbmVpZVNVa3hVRzR2?=
 =?utf-8?B?TWxQaWF3MWgrNUlKRWFiY2FJaEZaeHRoQTdyQWNkdlBwR1ZlZVRTS0l5SEZn?=
 =?utf-8?B?R2tlNGdBZG80dThVN1l6Ti81YWZIZVFha2I4TkpSZkw5ek1OdDFlLzBKZGg4?=
 =?utf-8?B?VnVpWWtmTjh4M29ZSi9GVzVJQlJiY1FjVndrZjdQanFLOVUyYWx6aFVXTEZv?=
 =?utf-8?B?QVRQMThjRGEwVXpLMVFxaHFnZFcxQzUvN2hINzV0QlROMkhoMkE4d1E4UUxM?=
 =?utf-8?B?TkZZVEExZkQ5czJsZElOaFd0Nk55VGpDRUI5SEoyZlFvQnVUTUNjcTBQczNR?=
 =?utf-8?B?VEJKZXBLRzkxa1dtVTRoRWQydzRGYk9FT2tuSkNvcldTdEx4RWJVNHU0anJQ?=
 =?utf-8?B?VVF5VU5HZUNUS2NSbWRrMDZ6SjY4ZU4zZnpCeG5BVTJkZGt4T29EUzlmQUE4?=
 =?utf-8?B?QUY4NGo3YUJvNUxiUHJKb3R5QnVZSjVvVEFHcDFjaHBnbGNNRGVNNXh3WGhD?=
 =?utf-8?B?L0JadFlUeDNhMUU1NnRtMHdsV0JQSUtuWDNtL1hkTTAyYVFDYk9JQ1FZRkVC?=
 =?utf-8?B?RlhTU0dEaGR1eEJYQkFvc29Wd0o3YWZLQnhmVUM1ZWhENEdiZmd2eW15aWZj?=
 =?utf-8?B?aGhBR2FCMWE0Q0dxcVN0SlVFNm5RNEtkU2N0a2MxVVFxQjJqNlg0UXk0NzFH?=
 =?utf-8?B?VHh6NTRneGMrajk4MkNEVExva2U2OERCa3VDT0NybmtLNFFiT3lXVm5TSXpT?=
 =?utf-8?B?dVA5dUpMdWxjSS9KN05IN2VuZHFQOTQ5enVRbzNUNk5NYURJTWp0MWFHVjJM?=
 =?utf-8?B?ejVIcFRKUmhDSWE0dnlVdTg4amRRM1VscUwrbVpUa0JjSXR0NXBFcTVTcDlt?=
 =?utf-8?B?YnJsQy9xczdaN21MdndsdjVGRW9saEZxUmdUY21OTlY3WTZCbkZycHJzMGlr?=
 =?utf-8?B?eUtBWmlSc1FXNU96RVk3dTdWaWFLYU55ZlVaV3pyS1NLWkhoWkhUM3lCekFy?=
 =?utf-8?B?VVEvUHJIbVUwWk1OSXk1d1FGQ3RGcldHaERtQTBoelY1ZEYrck5ORmgwK1Rm?=
 =?utf-8?B?cVJocnVFTlR2TndRemkzNDJKVVRYRlVydTdKeGI0d2FZVUFGUWR0QmNKT0to?=
 =?utf-8?B?d2ZGdjV6YmJnVEVJY2pwaUJ6YzVLT3ExdEJRSFlVUXNzeE1hZG4yeGNEMUZP?=
 =?utf-8?Q?YpJJp0Zpvk8+RSAPk1prNBLkGADwIiwey8s+0ni3OOdd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833b0930-98e6-42fe-3bb3-08dd3629f622
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 12:33:20.6887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6NIPQdJ/PsIEPmczdp0RZco+CWSU+4irGLHspuXz0V9YBU5T8oKd2a22Ff/EyI2F8rIBGUs6T4/cV1Vf6ZJhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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

PiA+ID4gT24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgMDE6MTU6MjlBTSArMDUzMCwgQXJ1biBSIE11
cnRoeSB3cm90ZToNCj4gPiA+ID4gRGlzcGxheSBIaXN0b2dyYW0gaXMgYW4gYXJyYXkgb2YgYmlu
cyBhbmQgY2FuIGJlIGdlbmVyYXRlZCBpbiBtYW55DQo+ID4gPiA+IHdheXMgcmVmZXJyZWQgdG8g
YXMgbW9kZXMuDQo+ID4gPiA+IEV4OiBIU1YgbWF4KFJHQiksIFdpZ2h0ZWQgUkdCIGV0Yy4NCj4g
PiA+ID4NCj4gPiA+ID4gVW5kZXJzdGFuZGluZyB0aGUgaGlzdG9ncmFtIGRhdGEgZm9ybWF0KEV4
OiBIU1YgbWF4KFJHQikpDQo+ID4gPiA+IEhpc3RvZ3JhbSBpcyBqdXN0IHRoZSBwaXhlbCBjb3Vu
dC4NCj4gPiA+ID4gRm9yIGEgbWF4aW11bSByZXNvbHV0aW9uIG9mIDEwayAoMTAyNDAgeCA0MzIw
ID0gNDQyMzY4MDApDQo+ID4gPiA+IDI1IGJpdHMgc2hvdWxkIGJlIHN1ZmZpY2llbnQgdG8gcmVw
cmVzZW50IHRoaXMgYWxvbmcgd2l0aCBhIGJ1ZmZlcg0KPiA+ID4gPiBvZg0KPiA+ID4gPiA3IGJp
dHMoZnV0dXJlIHVzZSkgdTMyIGlzIGJlaW5nIGNvbnNpZGVyZWQuDQo+ID4gPiA+IG1heChSR0Ip
IGNhbiBiZSAyNTUgaS5lIDB4RkYgOCBiaXQsIGNvbnNpZGVyaW5nIHRoZSBtb3N0DQo+ID4gPiA+
IHNpZ25pZmljYW50IDUgYml0cywgaGVuY2UgMzIgYmlucy4NCj4gPiA+ID4gQmVsb3cgbWVudGlv
bmVkIGFsZ29yaXRobSBpbGx1c3RyYXRlcyB0aGUgaGlzdG9ncmFtIGdlbmVyYXRpb24gaW4NCj4g
PiA+ID4gaGFyZHdhcmUuDQo+ID4gPiA+DQo+ID4gPiA+IGhpc3RbMzJdID0gezB9Ow0KPiA+ID4g
PiBmb3IgKGkgPSAwOyBpIDwgcmVzb2x1dGlvbjsgaSsrKSB7DQo+ID4gPiA+ICAgICBiaW4gPSBt
YXgoUkdCW2ldKTsNCj4gPiA+ID4gICAgIGJpbiA9IGJpbiA+PiAzOyAvKiBjb25zaWRlciB0aGUg
bW9zdCBzaWduaWZpY2FudCBiaXRzICovDQo+ID4gPiA+ICAgICBoaXN0W2Jpbl0rKzsNCj4gPiA+
ID4gfQ0KPiA+ID4gPiBJZiB0aGUgZW50aXJlIGltYWdlIGlzIFJlZCBjb2xvciB0aGVuIG1heCgy
NTUsMCwwKSBpcyAyNTUgc28gdGhlDQo+ID4gPiA+IHBpeGVsIGNvdW50IG9mIGVhY2ggcGl4ZWxz
IHdpbGwgYmUgcGxhY2VkIGluIHRoZSBsYXN0IGJpbi4gSGVuY2UNCj4gPiA+ID4gZXhjZXB0IGhp
c3RbMzFdIGFsbCBvdGhlciBiaW5zIHdpbGwgaGF2ZSBhIHZhbHVlIHplcm8uDQo+ID4gPiA+IEdl
bmVyYXRlZCBoaXN0b2dyYW0gaW4gdGhpcyBjYXNlIHdvdWxkIGJlIGhpc3RbMzJdID0NCj4gPiA+
ID4gezAsMCwuLi4uNDQyMzY4MDB9DQo+ID4gPiA+DQo+ID4gPiA+IERlc2NyaXB0aW9uIG9mIHRo
ZSBzdHJ1Y3R1cmVzLCBwcm9wZXJ0aWVzIGRlZmluZWQgYXJlIGRvY3VtZW50ZWQNCj4gPiA+ID4g
aW4gdGhlIGhlYWRlciBmaWxlIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+ID4gPg0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgg
fCA1OQ0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+
ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gPiA+ID4g
Yi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggaW5kZXgNCj4gPiA+ID4NCj4gPiA+DQo+IGMw
ODI4MTBjMDhhOGIyMzRlZjI2NzJlY2Y1NGZjOGMwNWRkYzJiZDMuLjdhNzAzOTM4MTE0MmJiNWRi
YTI2OWJkYQ0KPiA+ID4gZWM0Mg0KPiA+ID4gPiBjMThiZTM0ZTJkMDUgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+ID4gPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gPiA+ID4gQEAgLTEzNTUsNiArMTM1NSw2NSBAQCBzdHJ1
Y3QgZHJtX21vZGVfY2xvc2VmYiB7DQo+ID4gPiA+ICAgICBfX3UzMiBwYWQ7DQo+ID4gPiA+ICB9
Ow0KPiA+ID4gPg0KPiA+ID4gPiArLyoNCj4gPiA+ID4gKyAqIE1heGltdW0gcmVzb2x1dGlvbiBh
dCBwcmVzZW50IDEwaywgMTAyNDB4NDMyMCA9IDQ0MjM2ODAwDQo+ID4gPiA+ICsgKiBjYW4gYmUg
ZGVub3RlZCBpbiAyNWJpdHMuIFdpdGggYW4gYWRkaXRpb25hbCA3IGJpdHMgaW4gYnVmZmVyDQo+
ID4gPiA+ICtlYWNoIGJpbg0KPiA+ID4gPiArICogY2FuIGJlIGEgdTMyIHZhbHVlLg0KPiA+ID4g
PiArICogTWF4aW11bSB2YWx1ZSBvZiBtYXgoUkdCKSBpcyAyNTUsIHNvIG1heCAyNTUgYmlucy4N
Cj4gPiA+DQo+ID4gPiBIRFIgcGxhbmVzIGhhdmUgaGlnaGVyIG1heCB2YWx1ZSBmb3IgYSBjb21w
b25lbnQuDQo+ID4gPiBMaWtld2lzZSBldmVuIGluIGFuIFJHQjI0IGNhc2UgdGhlcmUgYXJlIDI1
NiBwb3NzaWJsZSB2YWx1ZXMuIEl0J3MNCj4gPiA+IG5vdCBjbGVhciB3aHkNCj4gPiA+IDAgZ2V0
cyBleGNsdWRlZC4NCj4gPiA+DQo+ID4gVGhpcyBhcHBsaWVzIHRvIG9ubHkgU0RSIGFuZCBleGNs
dWRlcyBIRFIuDQo+IA0KPiBXaHk/DQo+IA0KV2UgYXJlIGxpbWl0aW5nIHRvIG9ubHkgU0RSLiBI
RFIgaW5jbHVkZXMgYSBicm9hZCByYW5nZSBvZiBjb2xvciBhbmQgZmluZXIgZGV0YWlscywNCndo
aWNoIGVzc2VudGlhbGx5IG1lYW5zIGl0cyBhbiBlbmhhbmNlZCBpbWFnZS4NCldlIGFyZSB0cnlp
bmcgdG8gZW5oYW5jZSB0aGUgaW1hZ2UgcXVhbGl0eSBvZiBTRFIgd2l0aCB0aGUgc3VwcG9ydCBv
ZiBoaXN0b2dyYW0uDQoNCj4gPiBSR0IgaW4gaGV4IGNhbiBoYXZlIGEgbWF4aW11bSB2YWx1ZSBv
ZiAweEZGIHsgUkdCICgyNTUsIDI1NSwgMjU1KSB9DQo+ID4NCj4gPiA+ID4gKyAqIElmIHRoZSBt
b3N0IHNpZ25pZmljYW50IDUgYml0cyBhcmUgY29uc2lkZXJlZCwgdGhlbiBiaW5zID0NCj4gPiA+
ID4gKyAweGZmID4+DQo+ID4gPiA+ICsgMw0KPiA+ID4gPiArICogd2lsbCBiZSAzMiBiaW5zLg0K
PiA+ID4NCj4gPiA+IElmIDUgYml0cyBhcmUgY29uc2lkZXJlZCwgdGhlcmUgd2lsbCBiZSAyXjUg
Ymlucywgbm8gbWF0dGVyIG9mIDB4ZmYgPj4gMy4NCj4gPiA+DQo+ID4gQWdyZWUhDQo+ID4NCj4g
PiA+ID4gKyAqIEZvciBpbGx1c3RyYXRpb24gY29uc2lkZXIgYSBmdWxsIFJFRCBpbWFnZSBvZiAx
MGsgcmVzb2x1dGlvbg0KPiA+ID4gPiArY29uc2lkZXJpbmcgYWxsDQo+ID4gPiA+ICsgKiA4IGJp
dHMgaGlzdG9ncmFtIHdvdWxkIGxvb2sgbGlrZSBoaXN0WzI1NV0gPQ0KPiA+ID4gPiArezAsMCwu
Li4uNDQyMzY4MDB9ICovDQo+ID4gPiA+ICsjZGVmaW5lIERSTV9NT0RFX0hJU1RPR1JBTV9IU1Zf
TUFYX1JHQiAgICAgICAgICAgICAgICAgICAgICgxIDw8DQo+ID4gPiAwKQ0KPiA+ID4NCj4gPiA+
IFdoeSBkbyB5b3UgaGF2ZSBhIGJpdHNoaWZ0IGhlcmU/DQo+ID4gPg0KPiA+IEJpdHdpc2Ugbm90
aWZpY2F0aW9uIGlzIHVzZWQgdG8gZGlmZmVyZW50aWF0ZSBtdWx0aXBsZSBoaXN0b2dyYW0gbW9k
ZXMuDQo+ID4gQ3VycmVudGx5IHdlIGhhdmUgbWF4KFJHQiksIHVwb24gYWRkaW5nIG90aGVyIGhp
c3RvZ3JhbSBtb2RlcyB0aGUgc2FtZQ0KPiA+IGNhbiBiZSBpbmNsdWRlZCBoZXJlLg0KPiANCj4g
RGVmaW5lIGEgbm9ybWFsIGVudW0uIFRoZXJlIGlzIG5vIG5lZWQgdG8gdXNlIGJpdG1hc2tzIGZv
ciBoaXN0b2dyYW0gbW9kZXMuDQo+IA0KT2sgRG9uZSENCg0KPiA+DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKy8qKg0KPiA+ID4gPiArICogc3RydWN0IGRybV9oaXN0b2dyYW1fY2Fwcw0KPiA+ID4gPiAr
ICoNCj4gPiA+ID4gKyAqIEBoaXN0b2dyYW1fbW9kZTogaGlzdG9ncmFtIGdlbmVyYXRpb24gbW9k
ZXMsIGRlZmluZWQgaW4gdGhlDQo+ID4gPiA+ICthYm92ZSBtYWNyb3MNCj4gPiA+ID4gKyAqIEBi
aW5zX2NvdW50OiBudW1iZXIgb2YgYmlucyBmb3IgYSBjaG9zZW4gaGlzdG9ncmFtIG1vZGUuIEZv
cg0KPiA+ID4gaWxsdXN0cmF0aW9uDQo+ID4gPiA+ICsgKiAgICAgICAgIHJlZmVyIHRoZSBhYm92
ZSBkZWZpbmVkIGhpc3RvZ3JhbSBtb2RlLg0KPiA+ID4gPiArICovDQo+ID4gPiA+ICtzdHJ1Y3Qg
ZHJtX2hpc3RvZ3JhbV9jYXBzIHsNCj4gPiA+ID4gKyAgIHU4IGhpc3RvZ3JhbV9tb2RlOw0KPiA+
ID4gPiArICAgdTMyIGJpbnNfY291bnQ7DQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArDQo+ID4gPiA+
ICsvKioNCj4gPiA+ID4gKyAqIHN0cnVjdCBkcm1faGlzdG9ncmFtX2NvbmZpZw0KPiA+ID4gPiAr
ICoNCj4gPiA+ID4gKyAqIEBlbmFibGU6IGZsYWcgdG8gZW5hYmxlL2Rpc2FibGUgaGlzdG9ncmFt
DQo+ID4gPiA+ICsgKiBAaGlzdF9tb2RlOiBoaXN0b2dyYW0gbW9kZShIU1YgbWF4KFJHQiksIFJH
QiwgTFVNQSBldGMpDQo+ID4gPiA+ICsgKiBAcmVzZXJ2ZWQxOiBSZXNlcnZlZCBmb3IgZnV0dXJl
IHVzZQ0KPiA+ID4gPiArICogQHJlc2VydmVkMjogUmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UNCj4g
PiA+ID4gKyAqIEByZXNlcnZlZDM6IFJlc2VydmVkIGZvciBmdXR1cmUgdXNlDQo+ID4gPiA+ICsg
KiBAcmVzZXJ2ZWQ0OiBSZXNlcnZlZCBmb3IgZnV0dXJlIHVzZSAgKi8gc3RydWN0DQo+ID4gPiA+
ICtkcm1faGlzdG9ncmFtX2NvbmZpZyB7DQo+ID4gPiA+ICsgICBib29sIGVuYWJsZTsNCj4gPiA+
ID4gKyAgIHU4IGhpc3RfbW9kZTsNCj4gPiA+ID4gKyAgIHUzMiByZXNlcnZlZDE7DQo+ID4gPiA+
ICsgICB1MzIgcmVzZXJ2ZWQyOw0KPiA+ID4gPiArICAgdTMyIHJlc2VydmVkMzsNCj4gPiA+ID4g
KyAgIHUzMiByZXNlcnZlZDQ7DQo+ID4gPg0KPiA+ID4gV2hhdCBmb3I/IEFsc28gdGhpcyBzdHJ1
Y3QgbGVhdmVzIGEgMy1ieXRlIGhvbGUsIHdoaWNoIG1pZ2h0IGJlIG5vdA0KPiA+ID4gc28gYmVu
ZWZpY2lhbC4NCj4gPiA+DQo+ID4gVGhpcyBpcyBrZXB0IGZvciBmdXR1cmUgdXNlLiBJZiB3ZWln
aHRlZCBSR0IgbW9kZSBpcyB1c2VkIGZvcg0KPiA+IGhpc3RvZ3JhbSBnZW5lcmF0aW9uIHRoZW4g
d2UgbmVlZCAzIHZhcmlhYmxlcyB0byBnZXQgdGhlIHdlaWdodGFnZS4NCj4gPiBGb3IgYW55IG90
aGVyIG5ldyBoaXN0b2dyYW0gbW9kZXMgb3IgZm9yIGZ1dHVyZSB1c2FnZSB0aGlzIGlzIGtlcHQg
cmVzZXJ2ZWQuDQo+IA0KPiBXaGF0IGZvcj8gUGxlYXNlIGRvbid0IHBvbGx1dGUgaXQgd2l0aCAn
cmVzZXJ2ZWQnIGZpZWxkcy4gQ29uc2lkZXIgaG93IHRoZSBDb2xvcg0KPiBQaXBlbGluZXMgZGF0
YSBpcyBkZWZpbmVkOiBpdCBoYXMgc2VwYXJhdGUgJ3R5cGUnIGFuZCAnZGF0YScNCj4gb2JqZWN0
cy4NCj4gVHlwZSBjYW4gYmUgc2VsZWN0ZWQgdmlhIGVudW0uIERhdGEgaXMgYmxvYiB3aGljaCBp
cyBwYXJzZWQgYWNjb3JkaW5nIHRvIHRoZQ0KPiB0eXBlLg0KPiANCk9rIHN1cmUgd2lsbCByZS1j
aGVjay4NClRoZSBjaGFsbGVuZ2luZyBwYXJ0IG92ZXIgaGVyZSBpbiBmb3Igc29tZSB0eXBlcyB3
ZSB3aWxsIGhhdmUgdG8gc3BlY2lmeSB0aGUNCnN1Yi10eXBlIG9yIHRoZSBkYXRhIGZvcm1hdCBv
ZiB0aGUgdmFsdWUgZGVyaXZlZCB0aGUgdHlwZS4NCkhlbmNlIHdlIGFyZSB1c2luZyBhIHN1Yi10
eXBlLiBXaWxsIHJlbW92ZSB0aGVzZSB1bnVzZWQgdmFyaWFibGVzDQphbmQgcmUtZnJhbWUgdGhl
IHN0cnVjdC4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCg==
