Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CDFA23FF9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 17:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5128010E37D;
	Fri, 31 Jan 2025 15:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="xvqc/iSE";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="P2Hz8YKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A121A10E377
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:59:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF57SC028275;
 Fri, 31 Jan 2025 15:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=E2kqLpb6yR80iDCdcO1JkFrzz
 7udp4XX+Q/QSoqP73A=; b=xvqc/iSE/h9tpzKyjupxfr+r54q96k0zuABeSCNA8
 iGTwiLAVrFgvKwCujXGWDk2SKgCtvckhgr5p1Y27sJeIBbOn6INPczKepgfqamWH
 5sHiGYnfJ0EOva8a5dRtcsxW1j9hRai94p0R+ulynVRCxYub9zD0y+OEYkfeKdPb
 W6XnMROkuvC7RGkexmis3VJhedjwS8ufXeN/PUFJj6OZW0Rk9zhtLjGMfabg7x8f
 HblJeR2s2AEMDDKSILyx0DhzL2BjFmTjTYjjNgN9z3Xce/pO9Tce5T3F/2SibtOc
 /j2XvtRso8tqDoe/wIEx7Eq33QrAPVzvtZB462CckaAaQ==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011026.outbound.protection.outlook.com [40.93.67.26])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 44ep3c302v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 15:39:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRTgvOH2cSfGsKiFpuXZbggLYXPw5T9C86wjNGB9L6KJ1frw9gdEaex7HrN48I4TU6r8v6guZt1+FSbL6n+yw5NNAsGfK3X4KXJlWvKC3n5vPnv63pKLpm2+Up0hrgXmyaeqIGpouw0X+YrIHf6u8Zc/ji0DZ4eo4sXIg4vsFRwjBCczfVw7pSaTp3ThZh7lHMe3mHpcoNmPp9p/KCCeEzuRkcwQdrq7K0vIJNv3I1/U7saetnJ67gcRwMb70lYzHMJThdRjn5Mee2qOPMeMtG34kGZRizqLLhJQosADHDXjG1Poce4DU/ofvg7DJsUFBugTRolZZeTxeldnI9CbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2kqLpb6yR80iDCdcO1JkFrzz7udp4XX+Q/QSoqP73A=;
 b=LTKg0d+s0Da/oeWQVxQwthLrQZ5D7wG0HKQzGFNkLPMLT8kaGzGWMcz14aCYPU5wRQ4XBb2jAEqh0ZxygKHGL3DQv/BIMwg7VU0cepRnpl2TmkvgBoFNjtJjJvyFEiRrKLK7Qyq6eqVNpodqMgpOAA7OMmrKBdjweJ26bh1FzGuFobmPhPjYhMd4LBNSzJb9jHMoIgJiMnbqyv8xBZWc+Mgn8yJ31Qy3uroxJ3VEEGK4WHmA5dr6wYJeOpfha4arA6KAwYCXHudYziB6pWdxTo7waDdo86VeFQwCyETgsuBAETgEft1m3qX2qsiVQc1lOUhudaNaDNxTXwebHWMPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2kqLpb6yR80iDCdcO1JkFrzz7udp4XX+Q/QSoqP73A=;
 b=P2Hz8YKggOwJlb6UYMuvDBsltyobhhQkICbeLyRX6C2200BgSTdv32ncZ3plohUDz+rlEFDi21QkjMozoPfJAkguusbOvR508pU3d2MUZxWQ+c38mLZM3wBXPHWyAV+eZ5f6GUloyn8IRql4U1itM7g0YJz0oAWBZb3ap/52VPo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5503.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 15:39:26 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:39:26 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jszhang@kernel.org"
 <jszhang@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller driver
Thread-Topic: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller driver
Thread-Index: AQHbc/ZOhStD0GzR6Uu093CNg6Udrw==
Date: Fri, 31 Jan 2025 15:39:26 +0000
Message-ID: <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
 <20250128194816.2185326-10-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-10-m.wilczynski@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5503:EE_
x-ms-office365-filtering-correlation-id: 7fa9bdbf-dae2-4f92-bb5b-08dd420d7178
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?eTZqOUhsUytTNTJxZklNMVBiUHJaR3FaYzVUV3djUzJ0MWcvVGU5TGV3MVV0?=
 =?utf-8?B?eUxndDhiNEwxVm9YZm5JSG9oZFA0K1RpSDBxMDZ1K2lGb3Uzb0NPV1RUbmxX?=
 =?utf-8?B?R3hnY3lvSW1wWEpXTS9VV0UwYzhjSkJ1UTZrUUpqb2NPYVRjNDVWRTBDSTBX?=
 =?utf-8?B?ajRXb0NwZlVydmJLYzRmYUVGRmVhTlBRT1hrT2FrWUlmWldZdlhTTUc5bzZI?=
 =?utf-8?B?czFtb1dhOTdZenUwNUpGMHZET1NaeTJaaWFmejdMNUNGSDRGbSt4NFdoaEhB?=
 =?utf-8?B?NnZTZkpvOTI4a0FhcG9HWXFMZU53K2VZUU14bEVKWjhCRXVNYnJiL1NHVU05?=
 =?utf-8?B?UmI4RUVhVDlaVEtKSy9hdkFmTGF2aUFoWHFPcmw1eXM5MGxjWTFvNURHb0RV?=
 =?utf-8?B?UkZJSU5xOGJuTjZTMkRnZk5zVXhKWld2WkNsQmtuZnFkNmpZNmU0V3M3QUEz?=
 =?utf-8?B?NXRFNGY2NEZjVWszUVplUmR5MzhPM2ZSc2E3SXB4WEZGQ2pDNVU0d04wQS9m?=
 =?utf-8?B?ck1oNG9QOExtMnh4T1pkeXZIYjMrUUh2bWt3QjViL2NPZ2JMa0JoSUs3QkN1?=
 =?utf-8?B?cFJibmFtVFozSU1NUll6VWRlbFNjTUtPKzZUbGlHOTJXbVBuOHdlSnJ5aHJ5?=
 =?utf-8?B?djZ2WDhIcmx5OHE1S2U2VW1PSjhGTkhKdFBZNHdqYy8rbG82QVE2Vzk0Wkg3?=
 =?utf-8?B?T1MyalpiazdxYVJLTHVRMkZ2SXVabE02QkFadmlwemhISHpXaGF6ZG1Sb0Zm?=
 =?utf-8?B?WTlRQW4zOHBSb1Q2NlQ5eVkyNFAxN0FNV3U2Q2RDZXk1S2NNMmJWSHl6ZUhK?=
 =?utf-8?B?Tno1WFdhZXc3dU9Delg1ZWpVWmNsUXdvOW1WY0phWHJ4djFKTEZLSzloM3pM?=
 =?utf-8?B?cDZqdzlvVjQ2Y3JGalBPZWwzL293YlkxdEZpZjFqZXJGTGFqMnFjVVlLUm41?=
 =?utf-8?B?bkZrSUlQODZFRitsbFdxMnlBOGsvVzhLL20xekRSaHZIamVrM0d0cXpMZStl?=
 =?utf-8?B?M3ZRMFVvZEVRMTlYVVlwdEpMR2htWTkyVFhvR3RveFRDNHJMT1RRQUlIck92?=
 =?utf-8?B?amdLYzNjdU1wVTRuWldPTlo1cHNLaW53c3lzY3B4QW52LzZ4LzBRcXNQUXVh?=
 =?utf-8?B?OXlaMnhmNHlxQmc4dkMwWU92UVppRmw1cnNsa3h4a2JaNXZnOTlQU2Fkby84?=
 =?utf-8?B?WHBaWW1DaGxibkwzSi82VU1oaHYxSmYyR082bjhJdXBlZWx1bjhuVndBR2Nq?=
 =?utf-8?B?ZGdDSFBBb1hCQ1hsd0IvOWhXVVRtckNHUDd0N3RPYTNwTE54UEU3ZkZCZkk5?=
 =?utf-8?B?RVRhbWV1dTljR2RBQUNNRmx4UE9XS09id3p2dkNXandBY09EMGJkU2FBRTFO?=
 =?utf-8?B?QTJJM05PRm1VN1VvU2FFcVgyUnZIK2VlZG1MZ1lGK2p0NlV3cGlYV1N4UmxS?=
 =?utf-8?B?RlRpWkU5eDBGVmJya3dQUmo5ZVVOb0hPZ3phSzVhQnE3MUZBMTRFcC9YaVBD?=
 =?utf-8?B?SG1nVmFyck5IU0lzTUEwNytUOHNISzdIa28rZ1A2b244SVl1RGFVQ25zUms5?=
 =?utf-8?B?MUgvRm5Rdnp0Mmc1OXh4NkRBd0w0MXpRWXlQNlFndHJiWXRPYStqQTc4ZXZW?=
 =?utf-8?B?RDRCcnAzK1JtNU5pTHlLcE1Qd1JtN281ajJiZzFLaHgwTERtWXVnc1RLaU5w?=
 =?utf-8?B?QlVSVGxhTlM4a3pScnB2cjg4dkx0VWE3alJySjVZSkg3L1gyV0NaZWt4dWVi?=
 =?utf-8?B?YlhiMWNMWVlyV2d6WGRqSG1TU28zakhBblAvb1NQZU5RUjlkbk1ibFpkU01v?=
 =?utf-8?B?enlEV2YwRVkvUVFjN3R2alVzN0JQRGdhaDN3Z0VHYkhKSWRQZERuYUJ5SXJi?=
 =?utf-8?B?MlJCSkw0eWVHcklDUzdZWGdOTVFzcmpVd2ZpNU4yTnhEbEFLK1R6WTVFaFdt?=
 =?utf-8?B?dnJvM2xOSHRkd3VMWi9pZmkyZkEraE14N1Nudm1hMDI1YUJVMFE3N0MrTXVC?=
 =?utf-8?B?K1h4T0Q2V0ZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3ZJakxwMGFGVkdJQWpBSG9JcUdmK3ZPcUY2Q3J3c3JibWxVRjVFV00ybkky?=
 =?utf-8?B?NVJOVzRyUE9hbG1sYUxnVXEyWUxGNldrWlJFT1dSM2tjdUczaWF1WGNkWDRD?=
 =?utf-8?B?UmZGVFlRLzdZdW1ya0lDNzh4bGNZS1hka29FZDNaZmJVWFluaktKL25QYVI4?=
 =?utf-8?B?bW5NUVVHdkJqcncrTktBVUFBbGtHWllmWUo3cmJkV2ZvdW5RclFWRVhEUGRw?=
 =?utf-8?B?b2R3ZVk5YzlmMXhYb0xLNVhBNllxRlhWSzYza3l6eEUxTTVnMFpEa0E1YmNG?=
 =?utf-8?B?clIzVmo0WlpmVU43c0dYUTN3R2QvczlNQ0ZkcUlwM3FmS3M2WUptVEEzT0pQ?=
 =?utf-8?B?aytWdjZKbjhrbG1CbFdjRThIVFVWZHpVby9TT2xubCtoOXZmOC96c3NOVlJr?=
 =?utf-8?B?MnJGWFlEcUxRazBWN1h6RzdSNDVETkdBakk1TUhMZVh6WnFLdzAwNy9rS1V2?=
 =?utf-8?B?b3dJaHdLa3ZHdTBxRjhqVFZwbzZBdDkzaVdNM00rUXlUS3RWR3EzRkNpcDFn?=
 =?utf-8?B?V1pmaXpKWkNCbEZDcHRGOG03aWYrVTBqL2RtbmRmZ1VCZzhuRlhSWGpza1Ny?=
 =?utf-8?B?SlV3VGF4QTVQK2tMYWtuQkxNYmROcTR0Z2VlTmI0UjZlbFRmQjU3WE5mRzJ3?=
 =?utf-8?B?WEg1Wi9BN3NFd1J1L1V1UUdsN2Rwc1pYSlZTQkJKY3d6cXMwc1ZmZ0lOM0Jj?=
 =?utf-8?B?NFBzRWVaWlJlSHRGMmtURmdnNkxLRnIwODVmWDVaWGU1dGtnSUNCN1h4bXI0?=
 =?utf-8?B?VWpmZjFaUUlxR1huMHJEeW13cU9DN2lWWi9tUlQwTGk0cXFBS3JnbFdHWlRH?=
 =?utf-8?B?V3JOOXdFbFpqbkkyaWp3cHZZTmNJZ0R3SHhkdEJDdHNvWUdOTkJkOGVMUTNR?=
 =?utf-8?B?eTBEdlpPSCt2M0t0ekhDSmxWN1UxUkdRSWdraFkvT2R1T0pselJjN3M5VHZ4?=
 =?utf-8?B?OUZ1ay9yNlRpQVdGMW9SYmhPNnd2Qm5lUSsvMlRFb0ppM0pQVklOS3F0NUt1?=
 =?utf-8?B?TG1NUjB5dU5LTUdaeGNkNmNJWmFIQ2V2TXRBLzIwR2lxWW93SklOZkZ6VUMx?=
 =?utf-8?B?WmxYWWVGZ1p1anlUak9JRjhRWGtaL2paekxhYjAvMDNCL2tmVG85a1hwTnBt?=
 =?utf-8?B?MnIzWWY1UmVOVVV4RmRDWWZsOEN3UXlzMVNOcG5DRzRHSHpPMU5KSWJBNDI0?=
 =?utf-8?B?dGlra0lJZW9LV2d4eFh2THhjRlJKb1VaOStVK3EvZEJjN2dJcXhNc3locWxk?=
 =?utf-8?B?UW12RVQ3WlJ5emhvWGY5bE12R2FmNVNiRVd4TDdXTlgvVHZsL1lzbTlLL1FP?=
 =?utf-8?B?U1dySDQ3L055WXB3K1QwdmdGd0tqVTVWZW80alNtNXVYamJtMm9LVlpCbDg2?=
 =?utf-8?B?S1VBaGFDTkYwWWpqQnc5VkdkVDZObnd6STFzbTdMZnBRWUJvUjkrTXhNR2ZI?=
 =?utf-8?B?Q0dJSGdpV09LYlF0YXB1Wm9kTEZja3JqT0NxbEs5bHl2ZTR6cHlIWW4xbk8r?=
 =?utf-8?B?cnU0a1FJQ0dJcUV6MXExd051TmxLSWNzdWRpUE9sbzljVjNWM1dQd2lCM1Yy?=
 =?utf-8?B?SVdwN1FIUFJBcVA0REJhR3VrUUZObmx0YUlrOWY5V3RDNG04V3cvbmlpWDNB?=
 =?utf-8?B?bzRCUkxYaUpvY3lGRGVkMkVXYnBtdGpFNE5FTkVLQStGalRCa0E2aWRzZzZy?=
 =?utf-8?B?cmNpVUgvUm5iM3ZsLzEwV2hrbXA0Uk16YXJDQXpRWSsreTlUMVNvaGYraUJa?=
 =?utf-8?B?bW4wK0JMbkdXRkZZT3J0bjgwU2Q1NURpSjNqVUtBT3N5T3puOVBsd09zNUV2?=
 =?utf-8?B?cCtNdlRnMGt5RUtNQzBBUTlKYWN3K0FrcVkxOFlnQWZUTkRTQll2dC9Yc0RD?=
 =?utf-8?B?cEorZ28yVlNjZ3hTalJJeGs4c1VaQTJYQytiNjdhRUhhUXZiSGNoSzMyQzB1?=
 =?utf-8?B?Q0JvVHBlSlovbHhSalIyUkpER0t2SG5aaHFlaFZLL2dEOWtxWjlMMm5RSHI3?=
 =?utf-8?B?QXZnSmFXNHIreHhpSjNBVDFUQVI3UkQ4enQyUStBMVBJd3ROenhHZS81VEgv?=
 =?utf-8?B?R3YydEFsbGxFb3Z3UDkzczdaOWlzZ0xkeUREcEIyRDdiYWFFVG1XNnQwVnFs?=
 =?utf-8?B?Y0RXQTJjQXVma2FleWR5OG5OT05hQndxa0FLZ2sxdkhGSzdWTUhkbjJiNjNJ?=
 =?utf-8?B?blE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Eq0VbxlsoI0QTtXd7lSPZZ0a"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa9bdbf-dae2-4f92-bb5b-08dd420d7178
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:39:26.1616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiUJhdD6PeXJIuAxufajYjJYX9i6/HznHCKmiD5n5MIP2UGO8PBJWt0Jz9J9EU+ZgRwxHenJ6ER+p/TYA679qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5503
X-Proofpoint-GUID: Vdof7l0TVdwyVN1hxtkvwR4seTxytxNm
X-Authority-Analysis: v=2.4 cv=PoBpbxM3 c=1 sm=1 tr=0 ts=679ceeb1 cx=c_pps
 a=/lXe6HOdRU+sJltUoZpKYw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=JChVGnZoar0qVcAQ6v4A:9 a=QEXdDO2ut3YA:10
 a=vP7pQmnE2WyvIZqpF2wA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: Vdof7l0TVdwyVN1hxtkvwR4seTxytxNm
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

--------------Eq0VbxlsoI0QTtXd7lSPZZ0a
Content-Type: multipart/mixed; boundary="------------stfDEBxv52PnsQ3UmECCE0Oy";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Message-ID: <816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com>
Subject: Re: [PATCH v4 09/18] reset: thead: Add TH1520 reset controller driver
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194836eucas1p151c4fc83a17173fd1b79bfc959976301@eucas1p1.samsung.com>
 <20250128194816.2185326-10-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-10-m.wilczynski@samsung.com>

--------------stfDEBxv52PnsQ3UmECCE0Oy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/01/2025 19:48, Michal Wilczynski wrote:
> Add reset controller driver for the T-HEAD TH1520 SoC that manages
> hardware reset lines for various subsystems. The driver currently
> implements support for GPU reset control, with infrastructure in place
> to extend support for NPU and Watchdog Timer resets in future updates.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/reset/Kconfig        |  10 ++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-th1520.c | 178 +++++++++++++++++++++++++++++++++++=

>  4 files changed, 190 insertions(+)
>  create mode 100644 drivers/reset/reset-th1520.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b4e21d814481..d71b8c68ae48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20352,6 +20352,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	drivers/pmdomain/thead/
> +F:	drivers/reset/reset-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:	include/dt-bindings/power/thead,th1520-power.h
>  F:	include/dt-bindings/reset/thead,th1520-reset.h
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5b3abb6db248..fa0943c3d1de 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -272,6 +272,16 @@ config RESET_SUNXI
>  	help
>  	  This enables the reset driver for Allwinner SoCs.
> =20
> +config RESET_TH1520
> +	tristate "T-HEAD 1520 reset controller"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  This driver provides support for the T-HEAD TH1520 SoC reset contro=
ller,
> +	  which manages hardware reset lines for SoC components such as the G=
PU.
> +	  Enable this option if you need to control hardware resets on TH1520=
-based
> +	  systems.
> +
>  config RESET_TI_SCI
>  	tristate "TI System Control Interface (TI-SCI) reset driver"
>  	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=3Dn)
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 677c4d1e2632..d6c2774407ae 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o
> +obj-$(CONFIG_RESET_TH1520) +=3D reset-th1520.o
>  obj-$(CONFIG_RESET_TI_SCI) +=3D reset-ti-sci.o
>  obj-$(CONFIG_RESET_TI_SYSCON) +=3D reset-ti-syscon.o
>  obj-$(CONFIG_RESET_TI_TPS380X) +=3D reset-tps380x.o
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.=
c
> new file mode 100644
> index 000000000000..48afbc9f1cdd
> --- /dev/null
> +++ b/drivers/reset/reset-th1520.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/reset/thead,th1520-reset.h>
> +
> + /* register offset in VOSYS_REGMAP */
> +#define TH1520_GPU_RST_CFG		0x0
> +#define TH1520_GPU_RST_CFG_MASK		GENMASK(2, 0)
> +
> +/* register values */
> +#define TH1520_GPU_SW_GPU_RST		BIT(0)
> +#define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
> +
> +struct th1520_reset_priv {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +	struct mutex gpu_seq_lock;  /* protects gpu assert/deassert sequence =
*/
> +};
> +
> +static inline struct th1520_reset_priv *
> +to_th1520_reset(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct th1520_reset_priv, rcdev);
> +}
> +
> +static void th1520_rst_gpu_enable(struct regmap *reg,
> +				  struct mutex *gpu_seq_lock)
> +{
> +	int val;
> +
> +	mutex_lock(gpu_seq_lock);
> +
> +	/* if the GPU is not in a reset state it, put it into one */
> +	regmap_read(reg, TH1520_GPU_RST_CFG, &val);
> +	if (val)
> +		regmap_update_bits(reg, TH1520_GPU_RST_CFG,
> +				   TH1520_GPU_RST_CFG_MASK, 0x0);
> +
> +	/* rst gpu clkgen */
> +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_CLKGEN_RST);

Do you know what this resets? From our side, the GPU only has a single
reset line (which I assume to be GPU_RESET).

> +
> +	/*
> +	 * According to the hardware manual, a delay of at least 32 clock
> +	 * cycles is required between de-asserting the clkgen reset and
> +	 * de-asserting the GPU reset. Assuming a worst-case scenario with
> +	 * a very high GPU clock frequency, a delay of 1 microsecond is
> +	 * sufficient to ensure this requirement is met across all
> +	 * feasible GPU clock speeds.
> +	 */
> +	udelay(1);

I don't love that this procedure appears in the platform reset driver.
I appreciate it may not be clear from the SoC TRM, but this is the
standard reset procedure for all IMG Rogue GPUs. The currently
supported TI SoC handles this in silicon, when power up/down requests
are sent so we never needed to encode it in the driver before.

Strictly speaking, the 32 cycle delay is required between power and
clocks being enabled and the reset line being deasserted. If nothing
here touches power or clocks (which I don't think it should), the delay
could potentially be lifted to the GPU driver.

Is it expected that if a device exposes a reset in devicetree that it
can be cleanly reset without interaction with the device driver itself?
I.E. in this case, is it required that the reset driver alone can cleanly=

reset the GPU?

Cheers,
Matt

> +
> +	/* rst gpu */
> +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_GPU_RST);
> +
> +	mutex_unlock(gpu_seq_lock);
> +}
> +
> +static void th1520_rst_gpu_disable(struct regmap *reg,
> +				   struct mutex *gpu_seq_lock)
> +{
> +	mutex_lock(gpu_seq_lock);
> +
> +	regmap_update_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_RST_CFG_MASK, =
0x0);
> +
> +	mutex_unlock(gpu_seq_lock);
> +}
> +
> +static int th1520_reset_assert(struct reset_controller_dev *rcdev, uns=
igned long id)
> +{
> +	struct th1520_reset_priv *priv =3D to_th1520_reset(rcdev);
> +
> +	switch (id) {
> +	case TH1520_RESET_ID_GPU:
> +		th1520_rst_gpu_disable(priv->map, &priv->gpu_seq_lock);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int th1520_reset_deassert(struct reset_controller_dev *rcdev, u=
nsigned long id)
> +{
> +	struct th1520_reset_priv *priv =3D to_th1520_reset(rcdev);
> +
> +	switch (id) {
> +	case TH1520_RESET_ID_GPU:
> +		th1520_rst_gpu_enable(priv->map, &priv->gpu_seq_lock);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int th1520_reset_xlate(struct reset_controller_dev *rcdev,
> +			      const struct of_phandle_args *reset_spec)
> +{
> +	unsigned int index =3D reset_spec->args[0];
> +
> +	/* currently, only GPU reset is implemented in this driver */
> +	if (index =3D=3D TH1520_RESET_ID_GPU)
> +		return index;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct reset_control_ops th1520_reset_ops =3D {
> +	.assert	=3D th1520_reset_assert,
> +	.deassert =3D th1520_reset_deassert,
> +};
> +
> +static const struct regmap_config th1520_reset_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.fast_io =3D true,
> +};
> +
> +static int th1520_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct th1520_reset_priv *priv;
> +	void __iomem *base;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->map =3D devm_regmap_init_mmio(dev, base,
> +					  &th1520_reset_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	mutex_init(&priv->gpu_seq_lock);
> +
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.nr_resets =3D 1;
> +	priv->rcdev.ops =3D &th1520_reset_ops;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.of_xlate =3D th1520_reset_xlate;
> +	priv->rcdev.of_reset_n_cells =3D 1;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +static const struct of_device_id th1520_reset_match[] =3D {
> +	{ .compatible =3D "thead,th1520-reset" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, th1520_reset_match);
> +
> +static struct platform_driver th1520_reset_driver =3D {
> +	.driver =3D {
> +		.name =3D "th1520-reset",
> +		.of_match_table =3D th1520_reset_match,
> +	},
> +	.probe =3D th1520_reset_probe,
> +};
> +module_platform_driver(th1520_reset_driver);
> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 SoC reset controller");
> +MODULE_LICENSE("GPL");

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------stfDEBxv52PnsQ3UmECCE0Oy--

--------------Eq0VbxlsoI0QTtXd7lSPZZ0a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ5zurQUDAAAAAAAKCRB5vBnz2d5qsDp1
AP49IZ6CKPHDFz7d+wf06aIvtyJ6blscksofDOfdzx7YMgD/SYZInCl/c7DHc490x4D54cfVD/aV
SQ5qTs+pXv1oWgI=
=5t8f
-----END PGP SIGNATURE-----

--------------Eq0VbxlsoI0QTtXd7lSPZZ0a--
