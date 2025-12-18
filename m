Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE4CCC81F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 16:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0BA10E30E;
	Thu, 18 Dec 2025 15:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="PtRzijh0";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="JjlM1VZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA3B10E30E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 15:37:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIDNDmW477346; Thu, 18 Dec 2025 15:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=HhTZAw2hl6grVvS30/2aScRCE
 RRJ6bHa2XEAGVSVe3A=; b=PtRzijh0UjZcSY8sUQNGcCrTmkuiYpzDhPbhSUEr6
 ZXxMYhIJJBvCgerGhzyUlgHq4F7BKGdQPEqI6/bFb163hzRWaUWF83f+UZyuqHQx
 Tv9WDJgeDgN6ykgILcCO9bJPuSJtlrJ3wJ+K93jefyvpa1CQsngpvLVkZ9YcCIm2
 x6jaIAdLvqHCT4uyFt3Ix65+m3mb+TDT5sEzbst+/RRZd/jqhx+SzwC8QUKs07g9
 vmP/gPnya3/vYz4yhmeII5X57jDIpmf5ZQhdFDLCJ3evcU3spcRXW09H+/hB6aC+
 HAYG/id71d0+ccjGJ5SMNPEUzBZO1ZKNXdAKm2/BfhCng==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022137.outbound.protection.outlook.com [52.101.96.137])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4b41p10n4t-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 15:37:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fw4Ipp8Yu/7cBrNjuPQU+Y1c5A2ssXIseCTZCAFO4PWLRJEu98IXvbQrqBKTZCfIgvO6TnOV3noXRrySnx34+XLbyyyOi3BBT+qG3a7R1mat2hUMoNlpJfVWXnI+xUBeS/z4P+5sijWhO/l9uiCK2LPh2BUgX82HscGjBteP3jc41vwQLzCBFppGnbajQxXfYEizOyBTFs0DNSxZnlHTe1+0qw3vL8SeaymX9dd8eiZ7Rs5o2XxJpTH/EDlKGcuGpgB3Ed9vbPy2DlHuv1QuSkNAlYVku3zFcOORiZcr/aafiM3sNW644qmlhLwcZ1btFPaLhIMx24RsXZYYqzTZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhTZAw2hl6grVvS30/2aScRCERRJ6bHa2XEAGVSVe3A=;
 b=c0pmA14YLXTMF72mRvxABeHq1BHCJGmfvUYb1/inM3J6r/KceKMg9pR+4bdlGEYM3SfAtR+XpLU4IjseSRmVJLkQ/+CPC+YB68Xvm6DIFrZ+QDiXDbSqp6RYyGkueslHh1ukl7w8SpzA2SR5Q3bVK+zItJYwcNTaZ1/oN4chWRb6uRuIPpZdJEoROdXZRArpm6wNdBVyiXGikdexSa1ngC0rzuR+mV5Lr6FWb9DsnnKcrtq0XuDbtxTJ7caRZcFA2j5F/nRazMIkerTWT7vegk9E2F7S9xk1w7DiuXoHqu1BbWPiDvL5EGjX6FR5Q6eCg0p/+oc1RrEHDOY6UaFQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhTZAw2hl6grVvS30/2aScRCERRJ6bHa2XEAGVSVe3A=;
 b=JjlM1VZlHGZHnbrY1Yp5aQ/oE97z0tjrPwTNyQldH8r3LYZKoo9g/Kx3aAnZvBgb6Hx4MmLH3w3d9vYD+ho4fVGDzjlBbzGbMlU/58Pwp38NvZwYAWg7CFP9+SigsLGbdi2c2J9VZsP4NOsvfMRBMNScfDWbmHUE88Xnu7oshoU=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by LO4P265MB6823.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:349::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 15:37:01 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6016:e25d:b539:1ed1]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6016:e25d:b539:1ed1%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 15:37:01 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Alessio Belle <Alessio.Belle@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] drm/imagination: Disallow exporting of PM/FW protected
 objects
Thread-Topic: [PATCH] drm/imagination: Disallow exporting of PM/FW protected
 objects
Thread-Index: AQHcaCKqenCm4LKY8UaJCJpS9In7+rUnmAcA
Date: Thu, 18 Dec 2025 15:37:01 +0000
Message-ID: <689cc5d9-4258-4355-bd7a-69e1413c018e@imgtec.com>
References: <20251208-no-export-pm-fw-obj-v1-1-83ab12c61693@imgtec.com>
In-Reply-To: <20251208-no-export-pm-fw-obj-v1-1-83ab12c61693@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|LO4P265MB6823:EE_
x-ms-office365-filtering-correlation-id: 9e29e5a3-bd86-4a13-5f47-08de3e4b49d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bGpWUVpaT3VzamIzdTE0U09PZG94aUZSQ3p5OFpDNHNnWVZXanJYT3ZjMWlH?=
 =?utf-8?B?a0JvcnFESmxLakNFMFpFbUoxaFpOekE0WUhBb3lHejdhaEhDR0xmRDJHdWtn?=
 =?utf-8?B?enBLaVNTbXJQcnpNMStIVnk5SEJQdlB5bGhpdEtVRnZjejNmMzN6dUhFZWNa?=
 =?utf-8?B?MkRhaHJYOXh0NUUweE5PeGlxdHRIMVlUSk95NGUrMmpLUHVXWjRNTGZhdHdJ?=
 =?utf-8?B?c1F2VFNld0VaZXlSMnJNZ3RvVzF6RWRkRy9DSFZSNWdIYlVzNlQ2STEvYlpQ?=
 =?utf-8?B?dnpJc3huZE9NWTJ2bmZML2VpSE5vU2hWQVh2cHdQQ1pOSHVMMElBaXNrVDdl?=
 =?utf-8?B?UHdFb0Zpc0FBTXduZThBSkNqUFRsWngwTDVOdzFCMC9SMkhra0Ryc2U4SGNx?=
 =?utf-8?B?Nnd1MFV0SmVPelV1L1paN1hPazBoS0N6MXVSVTFFczBSN2ZZVDNhcHB0Wisv?=
 =?utf-8?B?ZFBrYmZzVW9SQjRsZE4vMmRNSHhsU3Ntck0ycFZSY0dyc2lzUHJjdjhwbGtq?=
 =?utf-8?B?eGo1c2ZxaXUrMVcveDhBZStYS2w4N29PallRTWhLci9USkNYV3RETHB6UEdY?=
 =?utf-8?B?QlJnWFZvQzFjaDlkSFkrUlZMMlA4QWg3aFEyS3k1ZmtWalVHMGc0Rys0eEdh?=
 =?utf-8?B?bGY5TWtCb0pGdURiSndnMUsxRWdTWEhMdUxycVJCUGlFaVd2dXc4bWhpQU9T?=
 =?utf-8?B?Umc1ZGlERTZLOW9wUDgzRWVNWDA0TnkwbWc0M3oyZWJNRGFWY3FSZkdOcGdU?=
 =?utf-8?B?c1BNeXlKcEhuNWZWY0Ixamh3bE0xamdrSEUyOExNOURGbWV2dWg0Nms1V0dI?=
 =?utf-8?B?SncrZ28yM0YzNnFkbTBQWG1xb3l6ZkRnTVRNMFVvOXE1OThWaXFIK2I1SGxk?=
 =?utf-8?B?N2FBeTlGZFA3NlJmWHl1dXFKU2l4djRQREFaMmJMUXl3WG1WV0ZKSzVzUU0w?=
 =?utf-8?B?RWJkb3czeXZVSWtmT1ZqaFF0QzVqVGFyeTdPTEk0S3RSLzZBcis1WHVLb0J6?=
 =?utf-8?B?RDdIZHFkYytyd2FoYThmRE5oSGhOTlRRL0l3MnkwUjYrekI2VkNjcW9Od2Yr?=
 =?utf-8?B?VzFWUFNJcm9RVjcvU2RvTjI2bHBiSlF5ZlhPWjBnUENOVHpkRTJ1Z0JlNUZP?=
 =?utf-8?B?dkxUbDRJbnh5NWVqUnhIRG8yUis2UWQrVVVpQ1hwL0xpbnFQOHZmRVdZSkQ4?=
 =?utf-8?B?S3NscnNUNHl2ek10VEhmTXowSHJBQVZ3RktWQnhKQmd0bmFuWi9vdkttQ25x?=
 =?utf-8?B?Z3lwenhud3RYSWV1UWs2ZUxWRld5ajhrQlVFbTRiR3ViWFpMeTYyRzVZa2VQ?=
 =?utf-8?B?bHQxTmhta0tPQVhrLzA4N25nVUU4OVFsUS83Y0tiUWV6Z2Q1c2hxUXpOM3FL?=
 =?utf-8?B?U0ppWjNZMSttOWRJL2cyUzVlR0QydHhYSm5qaCs2blFVR0tGRFhtSDU5UWtT?=
 =?utf-8?B?RDBzaC9JalYyWWdpQ3ZST3FYRkZ4RGR6TlE4a3MwSW9BTnFJM0o0WXpIMTUz?=
 =?utf-8?B?b1FPRzFMQ0I1Q2JHTXJjVW1ZSHVFeU14am9ibzQ2TkdqWXdvMXhjQWdkZFRV?=
 =?utf-8?B?TDJRamsvZVp1Y2hCSGNlMWYyL0EwK0xCc25XQmlESmkrRlljN2pkeVVjK2lP?=
 =?utf-8?B?OHc5a1phRnIrLzk2Z3h6OSsxSFZVYUQwNkxDU21penMyWm52S2ZCQzVRWlNy?=
 =?utf-8?B?dE1KVGZweUZVVlAyS2ZhbXZHS1A5RmFXcEZIa3FTZFR3ekttcWt5MmphN1N0?=
 =?utf-8?B?ZkhEY0NXK3J3MzFIbGpSNGk4M1JOZ1BZU2c3ZmVqMVFMVDZOaTNxQ0RJUTFa?=
 =?utf-8?B?d0hxSjk5R2RsZkNwejB0QUdoY25iZTNtLzVMTkRNWmMxcGhDL1BqZ2tUODlX?=
 =?utf-8?B?dGduZm9idGFmK21tdVpIUHdQSVFnTnJYSUVML1BCRVlLT0lIMGVKdDBGTDRV?=
 =?utf-8?B?WmpvZmVRVWUyeEdWR1E5RmZNcGJ4OTZsMk44OHRPeXBaV0ZSRmEyRzBvSzJ5?=
 =?utf-8?B?OUM3RUpaQkVlSG4vWkZwT0hOd2hRZkVCMFVCL3VKcDY5ekpGbkx3RnFzdHRv?=
 =?utf-8?Q?aPOUPO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkRKdEZDRlpaTUlvRXNvRGZ0UTVyVURxK1BlQ3JqbnlkMUUwTWxqM002QjU2?=
 =?utf-8?B?VGZySU9ON1p2NVdFZkFRQ0xwOFdlZElFOE15Z0pIbGRVYmZ1ckxGV3pEQkRl?=
 =?utf-8?B?S1ZOV3hTTHErNFBlM2xSVWY3dDcrUU5OYVlITlRMNk8zWmZYaDN4bGlKeTBv?=
 =?utf-8?B?dzNEd3lVVmtoeHVuaENxcis4N2hibmJ1NVdRQlNXNFpaRmwzYlRHSG1QN3lE?=
 =?utf-8?B?TVRENTFneVUrUkVXbDJQaEkwZGxDeWZQZFhWeEtVejBqRXdaWEdXR2l1d1pT?=
 =?utf-8?B?SG50MVpGRE5MTEw3NDJ3Y1FjUDVwWElTblV5MXFQNkgyV0xxVUFnd1dxMGpH?=
 =?utf-8?B?QXBGYStuejl4dFRKaVBsQXB3ZDFXRU1lNFpDMkhTUndsTy8zNW1ma1QyWWR3?=
 =?utf-8?B?OTdqTXpXNWJ6alhGLzA1VXRjVTR3TmZieVgrazRvaVBqbUowU05sQWhxM0lG?=
 =?utf-8?B?em1uVG1UUmpCZWJqZkdESUl2Qkw4MWFCckdscWgwSFdMR3NmUUhNNmgvMGQw?=
 =?utf-8?B?SUp2U3JxZitiU1hhMkwxcXg1czJyd3pJMjkxK1pmamhnUXhmZ1VBYUlmTHR6?=
 =?utf-8?B?SlNmdFRDK2czSE9wZmdta3FLTGRScVZWdGg1NS9ZT21xMVFDUWRrOHRiQVUr?=
 =?utf-8?B?T3RWc1l6SUtNSmJ1dVJWNnFpNVJPUTdhbDJDSExieHhtUkZyRUtLN20wb3k1?=
 =?utf-8?B?TjRJYVVta2RVcGpCZHJ2NWtlRlhOc05LMmp4YkNmK1ZmS1k5WTBGVmZpN0FD?=
 =?utf-8?B?VUtTS3NHTHdPOVRWMzZMNUowcHlVTWlnUzgzNU5ZMWNWK2piN1k3VTc5cy9J?=
 =?utf-8?B?b1ZVNGdvTTBLbmlYSWtGbnQwWnl2R3kyVkY3MUJLeGtpbDdXRjYzWDgvUWw5?=
 =?utf-8?B?aDYrUjY1b1dZVjQ3SWE4RjlrbkhNWXkvSzkvbjF1WmNkQ0szV1ZnWFh0TTNl?=
 =?utf-8?B?alYvNkg4TXlRbFdvNmJaRlNtTHVkWUtZakY0Mm1lQmdrOU1nSDZzQmdybjli?=
 =?utf-8?B?d0tmNjd0Y0pSVVpCc2t2YXVxNGJZS1g1ektaTUhiZnNheVhWVEsyTmEzR2g1?=
 =?utf-8?B?RU83S2hlRXoyQlBxOTJQbXBqL3pjYlFRa25oNVJLT0Z3TEtRTkFkQ1FxNEU3?=
 =?utf-8?B?Tm1qbmdBYmtaTlNqZzF1NTQxOEJoWEFYYVcweFhuOVR2cXg2bkRmaDIvMTR4?=
 =?utf-8?B?S1pDaUprM0JCblo1YUVIWUdPajlUVHFLT0pGcFVScmVMd0NON1ZsV05HYkho?=
 =?utf-8?B?N0hRWDhTL1gwWEwxUW5LcHFnc1BrMmsyVERpanVaM0hQaFFhZTFobG1tVy9a?=
 =?utf-8?B?MnB3cG5DZGI2NEIrK2hTK1llTEVGSGNUWWVlbVFFdFBObWNUMUdFY2s4ZzBv?=
 =?utf-8?B?MVh3R0RJekdNS3V4UTVjVTVPZHQ2bkMxck5DNURyY0VWRlJNeHk5VzI2TFN5?=
 =?utf-8?B?c04xcEdWS2xtWWc2TUdnakxGSWdyNU02ckRaVHJGWE5ibVloRHQ2a090bHZi?=
 =?utf-8?B?R2Y4QVQ1WWliRzdZMFA2aUFGN2RYL0toVTF4cXliQUdiSzNxK1RVQlFKbjlW?=
 =?utf-8?B?UC9PdDVqcUxCNFI0c3VieVhoUkNLRCsxMDFNdTJkSlF1a0FsUmJLaGJvc3g5?=
 =?utf-8?B?Tm4vYXpCTzRKa0R6ODR4d0wwSXdwUTBJUmlJQ01MK2ZTNEVWUHlkRW9FU2k1?=
 =?utf-8?B?TFNITTZ3aHJaWjZZZk1wS1JlU0NtNXhMSWN4cnF4ZWs5WHhSVkRQaXlyd0Fv?=
 =?utf-8?B?cC9lTFVlcXg4dzdkdUVNRHVHaUN2cnFBVFZzZFVGbFpvRXo5aEJmTUhnS1Ra?=
 =?utf-8?B?TXozTGxXK1VUUlMwSVlwbU9OczFFeCtTYms5T3NVVTY1NEJiRm9aK2ZvNUk0?=
 =?utf-8?B?cUpINlN3elFYa0lqWVk0TjllcitONTdlWm5xRVN1OWpnQzNpQ0ExMjRsbFkr?=
 =?utf-8?B?bThYc0h1eWI2MHBsc3hhYko5d2VzTFBBbzdUM3VFQ2lSRjMrNTRWY3FscE1m?=
 =?utf-8?B?L2Q4VTQyMkhQeUhZZC80aHJwWGVDV1JLbnNPZ01mdFVhVEtKRkZvNmhhOVRR?=
 =?utf-8?B?UDlDU2wrckJ3em9JU291SWd3c1B5MUt5a01DNFRpVTZHQjJjaktWVDFMb2xT?=
 =?utf-8?B?aXVWK2tJZ3B1bmEwOWlYeE1TaWYrUHFSSHFJZUFUNDU2U1F1eS80UHcySG1Y?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jhvjR04KSyAPOMOQeIYjxjsN"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e29e5a3-bd86-4a13-5f47-08de3e4b49d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 15:37:01.4996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XaoMHpF4jXIePL1/GZmySOzUU9UPMFv59nRmtcIZRXTz2MuXpTL4pdRuQlkBS0WTFaDHA/z3NEXPqP/aMac+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6823
X-Authority-Analysis: v=2.4 cv=S63UAYsP c=1 sm=1 tr=0 ts=69441fa0 cx=c_pps
 a=tVWoQxdeP5qkj9e4cQ483g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8
 a=9H7MbxIRqZcxT-4hp_wA:9 a=QEXdDO2ut3YA:10 a=6-ojWvZE_GU6EOPfLJoA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: NA_69MS6X5NqWBbzx10eHHPvkTq733-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyOSBTYWx0ZWRfX8W9SJhKUtfhI
 /WtMj4C7I14VikPW831JYSVHwGE8D3uLnmmIq5FqVzHgyKmv4o1b/3oyKvMvej98MF2TpsYRmgt
 jH3N0Dyecl1bgGNQXmg8dhXLsDEPRXWgtZxU3ifl19XrACk+/Nss16Th1Ks6LBF1H5MNgnwZChJ
 VCf2opKox45jfe4VfReCgI7Qt4bx48rbCAG5dszDUzaDHchtO0G5fhhcISMZDlNYL6r2KVUdCrw
 Gocn059LQzqSHS01any43nYH36AQseIA5C8gFJg/qkRMvE3wwLh4hu/8EUr+OgdNU6Ps3bxSyET
 rN8PoHRn29XVKY9r5YylGsco+8aCMPmZl5fbL6yxORYYuifngZfTEqBVzDOWwEuqEijbTn+TF1R
 DbAHc5BDQV7969kOtRUE22LtvssOD6CEvSGQQnQK98BLBRPYzS9WUt7oW7VipB3q4LTAwvS7uJS
 JNowvQp1e1i0dBlKE6A==
X-Proofpoint-GUID: NA_69MS6X5NqWBbzx10eHHPvkTq733-t
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

--------------jhvjR04KSyAPOMOQeIYjxjsN
Content-Type: multipart/mixed; boundary="------------PwYaiCHFVk6I9EIjPA4F6qpe";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-ID: <689cc5d9-4258-4355-bd7a-69e1413c018e@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Disallow exporting of PM/FW protected
 objects
References: <20251208-no-export-pm-fw-obj-v1-1-83ab12c61693@imgtec.com>
In-Reply-To: <20251208-no-export-pm-fw-obj-v1-1-83ab12c61693@imgtec.com>

--------------PwYaiCHFVk6I9EIjPA4F6qpe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/12/2025 09:11, Alessio Belle wrote:
> These objects are meant to be used by the GPU firmware or by the PM uni=
t
> within the GPU, in which case they may contain physical addresses.
>=20
> This adds a layer of protection against exposing potentially exploitabl=
e
> information outside of the driver.
>=20
> Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

And I believe we want this to be:

Cc: stable@vger.kernel.org

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_gem.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/im=
agination/pvr_gem.c
> index a66cf082af24..c07c9a915190 100644
> --- a/drivers/gpu/drm/imagination/pvr_gem.c
> +++ b/drivers/gpu/drm/imagination/pvr_gem.c
> @@ -28,6 +28,16 @@ static void pvr_gem_object_free(struct drm_gem_objec=
t *obj)
>         drm_gem_shmem_object_free(obj);
>  }
>=20
> +static struct dma_buf *pvr_gem_export(struct drm_gem_object *obj, int =
flags)
> +{
> +       struct pvr_gem_object *pvr_obj =3D gem_to_pvr_gem(obj);
> +
> +       if (pvr_obj->flags & DRM_PVR_BO_PM_FW_PROTECT)
> +               return ERR_PTR(-EPERM);
> +
> +       return drm_gem_prime_export(obj, flags);
> +}
> +
>  static int pvr_gem_mmap(struct drm_gem_object *gem_obj, struct vm_area=
_struct *vma)
>  {
>         struct pvr_gem_object *pvr_obj =3D gem_to_pvr_gem(gem_obj);
> @@ -42,6 +52,7 @@ static int pvr_gem_mmap(struct drm_gem_object *gem_ob=
j, struct vm_area_struct *v
>  static const struct drm_gem_object_funcs pvr_gem_object_funcs =3D {
>         .free =3D pvr_gem_object_free,
>         .print_info =3D drm_gem_shmem_object_print_info,
> +       .export =3D pvr_gem_export,
>         .pin =3D drm_gem_shmem_object_pin,
>         .unpin =3D drm_gem_shmem_object_unpin,
>         .get_sg_table =3D drm_gem_shmem_object_get_sg_table,
>=20
> ---
> base-commit: ca2583412306ceda9304a7c4302fd9efbf43e963
> change-id: 20251128-no-export-pm-fw-obj-aeca634ddd0a
>=20
> Best regards,
> --
> Alessio Belle <alessio.belle@imgtec.com>
>=20

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------PwYaiCHFVk6I9EIjPA4F6qpe--

--------------jhvjR04KSyAPOMOQeIYjxjsN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaUQfnQUDAAAAAAAKCRB5vBnz2d5qsGVR
AP9/MrDIsT7CP/OGKsRScVFKrkud18O4HP0mYzc5PlCTLQEAiY4PA0NfG8zj4RQdT2LvxFPQjR5I
NK4J9FgrLG8vdAs=
=i0fy
-----END PGP SIGNATURE-----

--------------jhvjR04KSyAPOMOQeIYjxjsN--
