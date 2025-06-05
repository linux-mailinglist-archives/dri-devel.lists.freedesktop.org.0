Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B93ACEDBA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 12:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4587D10EA29;
	Thu,  5 Jun 2025 10:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="rJOWZ2CM";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Oxv9E936";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486210E860
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 10:34:25 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555602B4030894;
 Thu, 5 Jun 2025 11:34:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=ilhRppOM1sHIBjX+YWzIzk6B6
 eA/7MR/BOXoMo42OU8=; b=rJOWZ2CMzFC41Ak7xdS9y4HuC6OCfgGdE4vlO1UNK
 3mTqJyfL9Ev9usDOmqDqH0tz4KQMOrjiTKywDqRyGkZ7/Lk3JBzLbjm2Nr+OxUxk
 8gBZYXGw7lYZOyDMGe7qBQZUy51FPZSK3zS2c2Sy1UwQgYUB8H497VvsXc25CIUA
 FnwfRcfnMLPphrEFrC/DS6LU3rha2FqQOhYaoGk1PC66wjwxhsRReJIpuRZuA3EB
 j9vzWMxofArBoNlg5kF6bIPsRZ133iFKkMGu98DmRxUkMNQLLf7kPhQI+IuNlzxr
 TecaFqpsRI8Rrj7u1Z/JBNDv7uxl/aIFCBEvDceU1C3cQ==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020123.outbound.protection.outlook.com [52.101.195.123])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46yr1s4vgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jun 2025 11:34:08 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfB1LGr5OpDsq96fjXsyfXsKYuz2oekeTP7NZlJ0xQVTgkCs5bPNGM47d89LLT5i0/fZperRrNTSTcRGVz+f2L71QpSCFFV250W7DlHTYZIz3S+znnJ5RDmtk88LrOKWK+lZsF4wys/eRC9F2UBgsE14E2w0lNGZWyz2XUAMEoJBuvJZBwCkrMGtxHJl0/Hzoyz25pwDll6CkWyKke6viyq+kHXLiOW3cWeXJWpFQUS8gLizypDBSfcdNsGSul2DQmCob95q+6CrFeXTLP23pX+gNJXIUY2e+OY/DXosFGEuM436/jlCLxBLuRC1gL33C16c8YxP+8DxvibsBdb71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilhRppOM1sHIBjX+YWzIzk6B6eA/7MR/BOXoMo42OU8=;
 b=vl3Nj71CJwQ/bbXFEinOzEUUwp3+3AK3lGzbwMrbcJEM/w3FuWZ9GBBFg9oC/yYrKXgiuIUHeAr659WAueyy+N+RYvo9YzH9F4FedAtwFu3BAIYUK36Flg2up3dsTj4qh1k4CZM82mLQ9NmX4vOGDag1DzG8xqIbEOhUZQ5j5aAgx1whvGZ7h98+2HDSueIDFDaeanCasEbmLMAngnHzE520fL4Ppc6nSdSHlEOlD8BvHfBse1IDcf91h1aJqJRBDFDezGWWJJuEdS2g5BhECN4LQwOf/n0G/kdg5NP2Dbkx9t/rakCrcmwV0SXfvKR+nLM7OTIya1DrPE/OLgFEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilhRppOM1sHIBjX+YWzIzk6B6eA/7MR/BOXoMo42OU8=;
 b=Oxv9E936S/fPZxJiQ/ntbh9ubAgLgLrrciVWXOT76IN3MOVHyqslTQG3zfqjXUhjl62lbO27sYGWlWLzBMgLFJ77fYCNrbkirk9DVgDCNft9DFQnMDgbRTIrgkQp/dozIsDKqS9md/IUFokiSaslpkoidQ4bQ7k68D4l1HuQFJA=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2897.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d2::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.19; Thu, 5 Jun 2025 10:34:03 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 10:34:03 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp
 Zabel <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Topic: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Thread-Index: AQHb1gVb+caWJSndXEKaeRT92mYEVQ==
Date: Thu, 5 Jun 2025 10:34:03 +0000
Message-ID: <b760bc9f-bb82-47bf-81f9-e196790f51f4@imgtec.com>
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
 <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
 <CAPDyKFrxqp30RWGoudVsy2NR7dSUoKwxc=nk3Bqp9RVZGZ6_vQ@mail.gmail.com>
In-Reply-To: <CAPDyKFrxqp30RWGoudVsy2NR7dSUoKwxc=nk3Bqp9RVZGZ6_vQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2897:EE_
x-ms-office365-filtering-correlation-id: ba01078a-50f3-416a-9879-08dda41c7de2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?dXVNQnVEUG5Wd0xaSWtmVVBUZ29aZ0xlUVB5QWVJckpuWUhaNzNGcjl1UXhO?=
 =?utf-8?B?SnpYSGhRNnVKRUkza3IrR0xJWCs3d2hOMXlQTWM5Ykovd09nTTFkYW90UUhk?=
 =?utf-8?B?OGc1dWV0NFpBZDZKZWJya1ZBbnd5dk1UOGltT3N6RDlCcTlVWnFkcXRvN3dF?=
 =?utf-8?B?Z3hvVXUwTkV6RHJ2OHNsZXIwZWNxc0dXSzM5Y3hIK3JlL3RUejJOc3hKYmRG?=
 =?utf-8?B?TVBpZCtkQVNIVGlOZFFyejNnbDhNc0gyVy9NbXZURVBMcnV6c09YR2M5VFB0?=
 =?utf-8?B?RCtjaVB0UUtORlZTQXlub3dTd211M3V6ZXhYbkJEdG4wQ2lCVTI3U2txNGRU?=
 =?utf-8?B?MHBVQnVjMFRHc1NudE54MDdRbmhRRUtRQXFORlFHKzAwY3VGQTgrVUdqaVZ1?=
 =?utf-8?B?bVV1cHZjdVdpVDJ0dXZOTlB2ejhIM3hQREh5YkxZekZOcmdOQkVwc2J2a0RL?=
 =?utf-8?B?WWF6di8zVEdnQ2ovOUlid3FsSkVqaTZrbnZ0REJ6bWVsSkZWeEo1T0RqTmps?=
 =?utf-8?B?clRiR3FML1FsYkt2Um1RM2p1OUpEVEpQVElWV2hZNHhxODVtRHRXdzdmV3ZC?=
 =?utf-8?B?SXhhYlh0cXVyODJJNHdIRUpxNDBBQTN2QndqQmVMRmUvdWxkM05ITmR0R2ZP?=
 =?utf-8?B?bTY4RXpnL050ZEpnMEg5WnRRUEZKRGR5S2hCZXJVK2hRbGZZTUxqTFRXR1Vo?=
 =?utf-8?B?cEZOcXM3UEpqY0tUWTFJNkt1RFRaQTBwWHZPV0QzMUpBS25QQ0VMNjhNdUJZ?=
 =?utf-8?B?YVJBa0pqU1dIWng2ODBQYlI3MlNHWE1TZVBUYkV6TS9wdTUyUmNHVis4cldp?=
 =?utf-8?B?ajRwdXRwYUg5RjAxSkZrMTVnTUpVL21hQ0w3MHJxbVF4bklSSEpFam1oN3dY?=
 =?utf-8?B?VThWWnBlVGtKZUo5Z295ODU2YWlRaFZhVXhESXJpWERIeVVZQUsvam5QNDBO?=
 =?utf-8?B?K0VTZ1hEV216MytFMFRkeWpQeVhPcXNWYVhXYTZSNVRyWklPRkZlRzk4VmND?=
 =?utf-8?B?UzBBMkpUVWsxalZEcVZ3OTMvL1JoWGJHaDJ0Qjl4VU0yOVVCdXQ4OEFrRjZD?=
 =?utf-8?B?emxGbkUzZGJRdkZJZFJ0c1ZWOE9ocmRTTHRqUlhZRi92bUJQZmNNZHFhRDMv?=
 =?utf-8?B?czJ4U2VEdkdLeTJGSjhNVHdKcExUbHRqRXR5THFVbmJlc2hzd0FDRXpsQ3hT?=
 =?utf-8?B?Y3VtK1crMGhoSW1uaDhORkFRR09ua1lsNkNaTHlqd0hNYjY1Vi9Maml4bkc5?=
 =?utf-8?B?WTZxWDhyeUJnVk8xNlE4NlQzQnlzdnhFTEJid3FXaHFjcUROVXg0YmMyL2U3?=
 =?utf-8?B?ZHl5Vm10ay96SlY1R2pWaXNjTDc4c01QYlYrRGVkYzh0YUp3QU9JTDY1WDJk?=
 =?utf-8?B?NWhvSlM3Zkh2KzNRNUJvazluZmpkS3pNMnpabVVkbU1XU0VUUnJEMWJjZlVw?=
 =?utf-8?B?TlBUZTUrMm1kLzNrdk1rdlhCYytlME9ZekFhbHdodzZUZ3BCejRxb2RzVUJ5?=
 =?utf-8?B?WTBFMXpCS0VtdVdqWUEzM3NUS0Qvc2w5MWhZVkVIaUNLdjFWYzdnL21tdVRD?=
 =?utf-8?B?WXJjU1c2bG55M203d2xGc3dSQW4yTDBEYm9aTnhQZWFJVlhpQTlsYlZaZTE0?=
 =?utf-8?B?dHZkeXRydGFaMGFLUlZXaDYvbEFkcHVIYzZidWxsS2luM2NudmhOZGhDR283?=
 =?utf-8?B?S2NMYTVzSzNVVTNLcFhkcFE5cXJHbWROVlk5aWpIejY4WEN2SnFybkRINThn?=
 =?utf-8?B?Y2lYTXpCNjVrKzJjcmhuZ00zVWdHaThlem0wUEs1K3p2Q1c3UGJBSDNnYm4v?=
 =?utf-8?B?aDVaYUQ2S2llYlh2cmpIUzhSdnZURU9udVZ0RmxlMDd5SXV4WlI0ODZWOE85?=
 =?utf-8?B?K3FhaG11SS9NU1BOUEJwV0kzeTJvb3RGN3V1RjdtVkhtY3NoYlduK0lNSmJu?=
 =?utf-8?B?dXluM2pYRXpmbjRILzFsR05ObnRHTVdPSHF0V2RMazQ5YktuN0RnaUJFM0ZL?=
 =?utf-8?Q?Qz9QZPZ92qwe+KSg5ptoPVLjfFQ+dM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjJpeGNwWlBjNFA3dkRRN2RBSnpJN0g1b2RWTmZ1cnFlOXdiS0c1NlZnNWJj?=
 =?utf-8?B?MTFVUHVBQjh1YktOcGJrYTBaeDZRT3BCU0ZjaUFXWWw4dW5Hb016eFN6aE1J?=
 =?utf-8?B?akhMRTBQMnB2cWtKK3VHeUphTElDQ1AvTUZnZzBwSkRJNi9MdEVqSHozSWVn?=
 =?utf-8?B?UkkvRjJjSHlGdUFxUjNOTkVianluZ1dVYlB6T1Z2UG1hMnlUMGR3ZlVaOTQz?=
 =?utf-8?B?VmlEV2hlenlDcGxBYUFCRHVKMWpoRjE3MnFoMy83eVVqN2JjSXBEVmRIMHA2?=
 =?utf-8?B?ODNqbDNMUW5PeWRCNHV4SGVDL0hmOEpaTHJuQzBBaU1mMk0xbFpUNjBOOE5a?=
 =?utf-8?B?ektqRUZUWWxndkg5MENwYXB5d29iK09nSVR1SXNtK3JwWDNYSk5MR1hic0dl?=
 =?utf-8?B?eDQralVtcDNTQUY5aitZTlZPejZrNUFPdE9ncWQydFZreU9ndElFaHNycE9E?=
 =?utf-8?B?ZnF1MzdRSjdLRDF1WGxuVVZuQTUxMTNCS3owTExOaEhqcUdiamd6NVpOOE11?=
 =?utf-8?B?aFBqb3ZIVm8vMmtIVmQ4cVlNNXhsV3FBTmJjOXNmaFZqbUFDVWd0MFpGMU52?=
 =?utf-8?B?Y2t3KzlHRXRieEo2WVJxd2hHK1p5THc3S0Q0aThyRzZta1RWK2xEYmdBVnM4?=
 =?utf-8?B?REduVEZ3RkkzSGRtemczWURtWUErYlhzckl6cWx1MDYvdGJadnB5U1N0N0lL?=
 =?utf-8?B?d1c0VHpkNXZDbEtVQzdPd2phbktab0R1OVo1M3VDZjFmZ3NXbGd2dWFVWTBo?=
 =?utf-8?B?OG81aW9yUlVES2dZTk44MUJYYlpPUWlvakxXbUQ4R1FmTEZoOTJsSk1Xejdt?=
 =?utf-8?B?SFZkbTd1NVI4UmZxZ2NvNHBSUy9TajBaL1lFMUsvRHY1MFg5SWVucWFINzQ4?=
 =?utf-8?B?b2MxNnM3amxnWDRBa0pObmlpV3lDZFVuZU9VT1RpNHZtd2tBWjZ3cjQrc0pF?=
 =?utf-8?B?RmtxR3ZONFMyNWtoRnF4MXI2S1RVWVVoY0dtUGxaak9CQ0VJVS94eGJMRVkz?=
 =?utf-8?B?YVJyMmdycWxtL1RNTEtYM0ZhemowaGlENHk3djlzNklKRWZLejVJL01IUExl?=
 =?utf-8?B?c3ZxaDY5dzc3YnFBQ2xkd2p0dG1vczRHSHVPczg5dFJBcmNFMTczM3FmUXpK?=
 =?utf-8?B?dnFYZnZDa1c2U1pGU0VRSFZackZsWm0vTUxnaEYwTS83YlpNaHhRekdrWUJi?=
 =?utf-8?B?ay9PMUY4R0tVVmgraEtxRGxJUkxQN2lWSDN3djZLT0I1Yi9BOU0wUGZjS2FE?=
 =?utf-8?B?ckJnS01UNmxPMGdyWkxTdXBlZnB2ems5YmdEQlAyeXhUd2tYZUJqMFdCRXg4?=
 =?utf-8?B?a1pYUEpVdTh5QnZOeFduekQzajQvRHI2bld3TDcrQnhGcXkya09xREVnN0Fp?=
 =?utf-8?B?UGxTZzdKUkdDMk9MRzk1OTNISEl4QVNTMW5FVFV4ZDlJYjJVVzZ4c0NqKzhh?=
 =?utf-8?B?ZURId1AzNHVVdFFsRkIxZ3BNdGU5cWVPOFdjeC83bVNEREM3ZDBaZVhUSGtU?=
 =?utf-8?B?ZGZ0QktkMUNuZ0xTTEF3NHBTMjBVbjZENjZEOFRkQzg4S3QxZG9laVYvbzBk?=
 =?utf-8?B?aWVROGJPRUtsMnNYamJzTDRuREpNR1VsM0F5NW5YdTc3VWE4SEgwZGVOanhU?=
 =?utf-8?B?N3h3VjBaUTZRakxwVyt0OFlIbkh2THFKQVZ3MzFWUUZnNExSSnQzUzRXcXdV?=
 =?utf-8?B?RE5sb1ZlWDQxRW81MStDcHNUUlM5R0kzZ3RFbWxGeGV6a2NHR2wyZ0owczhq?=
 =?utf-8?B?eVdXOEZFWDg2d3kxRkpDSk1MODRKcEJtSTlYMTkvY2dOWndOa3BUbVJ2U01F?=
 =?utf-8?B?dWNWUWIwbS9zbGdiUVF1V09UTGxKL2xIemF4a2JxME5TOFNYc0M4d0t6ODdm?=
 =?utf-8?B?V3VobmNWRWJYNlZEV29qT05sd3d0dndEd3d0ZE1sYS95TmR0RFI4ZUlUT00y?=
 =?utf-8?B?MC9tak1sT3ptOEVIYVUwMno4ZjgyRGRoMXVPQnNjNzl2YlREQUdpeGhMTjV4?=
 =?utf-8?B?SUZZZVRJMXRsSWpkVklZNHlTNWJiV2xvaERWcGdkcXMrQUFid1BPY3ZUVHlW?=
 =?utf-8?B?OEV6MjFIN2VYOTRmSnNyTWIrZy8zTktHd1JGOHRoWFJvNy9KbzB6SkZxMnFj?=
 =?utf-8?B?dXRVR3NtMmlaY0JjTjg4UHRrcWN0bnR3WHF3NGRvelVZVkc2S2ZOSUg2RVFj?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IcyHDSGAN0a9nRJhWjxVCYxE"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba01078a-50f3-416a-9879-08dda41c7de2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 10:34:03.4198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXFNxtw/WILRYxGZcviC/4EnyvFw2i0Ia3ZM3vk1Ynkx1uIMxCgrZvINNT2G1l5ZjWEaXpKbsKBo/dIcZ6P1kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2897
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA5MiBTYWx0ZWRfX/RjSK2UnMT3J
 rTyaQbSSeqlaSVCBmxuX0v+jpqeMpz9DqNqUYIY6Xxgkv3bPtStX9uDVT8sOm9Qi6sPW7/bowek
 jncdT8DgMGDcw870Kjcz5gErSh7Xz/DOjYapQQhPsLRBYxU1wqg4k6v2LDEwMNXvqxbppVA0V4T
 8fO8H4opukhOdq14mLKiPuf7t3y008kqkCen+fbW8ioO8YIUToEwrQ1s1K0QDZQYib9I8WWh7uh
 LyJi3SsvGRbi4fk/c2n693GNoPvSR+MVvtGcZ1WWDjvZuJt9hn7UqlqbQfROKzeHrXfo06dHlQY
 hGT80X7t4WIIVbRWcacrKrrYGKMg+HfuvoK+PCx7kNI5LZ81kNItVfspOHih3fwjwUWr5Y01lUA
 u3dXUX8yT992CJslZvgSuTc3ofDNCaQprgDNU05cwdfy1OSzOynp6K8MSpb0+Eazfkhr8MZZ
X-Proofpoint-GUID: _kPHmxYS_oHHDsmFQxsSV3f1q6rAm1hf
X-Proofpoint-ORIG-GUID: _kPHmxYS_oHHDsmFQxsSV3f1q6rAm1hf
X-Authority-Analysis: v=2.4 cv=ENAG00ZC c=1 sm=1 tr=0 ts=684172a1 cx=c_pps
 a=I24a1xGMGcjn4QSsbZDeDg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=hD80L64hAAAA:8
 a=gBKmmTWQTuWriMcqf4sA:9 a=QEXdDO2ut3YA:10 a=SSuPsVE0WplL5-l2PNYA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------IcyHDSGAN0a9nRJhWjxVCYxE
Content-Type: multipart/mixed; boundary="------------29PJwceBXTcfec3wOAv96off";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <b760bc9f-bb82-47bf-81f9-e196790f51f4@imgtec.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com>
 <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
 <CAPDyKFrxqp30RWGoudVsy2NR7dSUoKwxc=nk3Bqp9RVZGZ6_vQ@mail.gmail.com>
In-Reply-To: <CAPDyKFrxqp30RWGoudVsy2NR7dSUoKwxc=nk3Bqp9RVZGZ6_vQ@mail.gmail.com>

--------------29PJwceBXTcfec3wOAv96off
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/06/2025 10:57, Ulf Hansson wrote:
> On Wed, 4 Jun 2025 at 18:48, Matt Coster <Matt.Coster@imgtec.com> wrote=
:
>>
>> On 03/06/2025 13:27, Ulf Hansson wrote:
>>> On Fri, 30 May 2025 at 00:24, Michal Wilczynski
>>> <m.wilczynski@samsung.com> wrote:
>>>>
>>>> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEA=
D
>>>> TH1520 SoC used by the Lichee Pi 4A board. This node enables support=
 for
>>>> the GPU using the drm/imagination driver.
>>>>
>>>> By adding this node, the kernel can recognize and initialize the GPU=
,
>>>> providing graphics acceleration capabilities on the Lichee Pi 4A and=

>>>> other boards based on the TH1520 SoC.
>>>>
>>>> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can'=
t be
>>>> controlled programatically.
>>>>
>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>> ---
>>>>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>>>>  1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot=
/dts/thead/th1520.dtsi
>>>> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a703=
06f035b1cc82ddb4bae2 100644
>>>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>>>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>>>> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>>>>                 #clock-cells =3D <0>;
>>>>         };
>>>>
>>>> +       gpu_mem_clk: mem-clk {
>>>> +               compatible =3D "fixed-clock";
>>>> +               clock-frequency =3D <0>;
>>>> +               clock-output-names =3D "gpu_mem_clk";
>>>> +               #clock-cells =3D <0>;
>>>> +       };
>>>> +
>>>>         stmmac_axi_config: stmmac-axi-config {
>>>>                 snps,wr_osr_lmt =3D <15>;
>>>>                 snps,rd_osr_lmt =3D <15>;
>>>> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
>>>>                         #clock-cells =3D <1>;
>>>>                 };
>>>>
>>>> +               gpu: gpu@ffef400000 {
>>>> +                       compatible =3D "thead,th1520-gpu", "img,img-=
bxm-4-64",
>>>> +                                    "img,img-rogue";
>>>> +                       reg =3D <0xff 0xef400000 0x0 0x100000>;
>>>> +                       interrupt-parent =3D <&plic>;
>>>> +                       interrupts =3D <102 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                       clocks =3D <&clk_vo CLK_GPU_CORE>,
>>>> +                                <&gpu_mem_clk>,
>>>> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
>>>> +                       clock-names =3D "core", "mem", "sys";
>>>> +                       power-domains =3D <&aon TH1520_GPU_PD>;
>>>> +                       power-domain-names =3D "a";
>>>
>>> If the power-domain-names are really needed, please pick a
>>> useful/descriptive name.
>>
>> This isn't the first time our unfortunate power domain names have come=

>> up [1][2]. Sadly, we're stuck with them for Rogue.
>=20
> Wow, that's really crazy.
>=20
> BTW, are there any reasons why you can't rely on attaching them by
> index instead, via dev_pm_domain_attach_by_id() for example? Thus
> entirely drop the names in the DT docs?
>=20
> It sounds like the names don't really have a meaning, or do they?

These ABC names don't have a special meaning, indices would work just
fine here. I was thinking ahead towards our current-gen Volcanic
architecture when I added power-domain-names to the schema, since that
does have actual useful names and I wanted to keep the two as close as
possible. Plus it's nice for them to line up with the docs.

>=20
>>
>> Matt
>>
>> [1]: https://lore.kernel.org/r/ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@im=
gtec.com/=20
>> [2]: https://lore.kernel.org/r/cc6a19b3-ba35-465c-9fa6-a764df7c01c1@im=
gtec.com/=20
>>
>>>
>=20
> [...]
>=20
> Kind regards
> Uffe


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------29PJwceBXTcfec3wOAv96off--

--------------IcyHDSGAN0a9nRJhWjxVCYxE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaEFymwUDAAAAAAAKCRB5vBnz2d5qsJcU
APoCym3I98A2UxGPhvM/h0hZ50RxAidMM/E6jgpLp07++AEAhkHHJXc5DVQaQZ64pQYfIDjO5KYW
SeMmxAuVc3CLHgQ=
=da7x
-----END PGP SIGNATURE-----

--------------IcyHDSGAN0a9nRJhWjxVCYxE--
