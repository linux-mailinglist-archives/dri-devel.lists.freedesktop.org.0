Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD9A897B4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5314510E6A0;
	Tue, 15 Apr 2025 09:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="kF1GqHsT";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="YBEOLifl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3961F10E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:15:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F5YrMk014874;
 Tue, 15 Apr 2025 10:15:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=PGObreo/yEWaijscsYbYZHIpQ
 qswJCw6mKw7pKuwNC4=; b=kF1GqHsT3u37juBTFQk+yUImT8L0e/QoaP2o5bgzA
 uapghvF6P6bNonG29i66XEv6bMf6gKyw1nMDieVHl1MjuoeYje7/W7BVGPYVsoYM
 7E6tlc6isDYGdVpHUe8V2X081nCAtMC4WFsQE2+I9YC/t9kFFERXhKS+kpjZHy/W
 hfgZrEOZ++7Y/ClnTaApW1UNsNlvuHPZbUNM80geZOWWJEoqkiUolUqUFRx0HsLn
 xYLFlJn2YdAFz+T9M91TafLNOK6xNUeMMOZBaK5DA41VbEW9HViBz7X1qGeB7Pat
 EUpJ3CeF5WiTX5Oh0LE64ecRqphcfnfdXxdxrdevHsaaw==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012052.outbound.protection.outlook.com [40.93.67.52])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45yg8vt113-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Apr 2025 10:15:25 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YANrASPEPkz5sbzF0NHiDKDxp1gQMPw1t8y0m4dIX9QOVsb8ynQJghzXdpqB03oA4h6fEtC44qipzENFHgUW7/rzRc9RMGueKrI/WDE6kEOM3ZIE+uGJUux2lFVDHnfBKRtzoeG07JHUjEi3pAB5LmL56AQ2ifBnOTEadx3/w4ZCBGAPrX7UuZUnVCncRyXqmVQlWpo1wM6WXeoy6z36TMHGjks+WGS8wotuF5RzC4Tq48mVKsNZhW7LGu5IV1+FzyhxWJ78fDZm1Bh8GQ+hBRBGZnCSKGn/rPZ0+r0XIxoEaLp0bCjjJqP53D4zaXpecEnyVo31CNQ/AChfOMEr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGObreo/yEWaijscsYbYZHIpQqswJCw6mKw7pKuwNC4=;
 b=WLd0wMtbKRRHPZMJha+B16wCbJuIRfbLNS2X9+/78XVn3HiQ12zAMZmXgrD8WNTB769tf2wH/b96mUJJ6pNhk7L5NB3QCLpkwkR5KYbONBEpkwaN0MOjtPq4yjW4O/E2pB7Ilv4Hk8wptjnQYtrBdjwkofzUXHxWMzuqSBHQcw2ud9l4AoqVAMcMFRdb4gZ5y7+1V7RGUgc8ujRb65zI8+SOalQ4InddMK1wRP+eGbddiNdA95p7MMA3P/S9GyKiFtUUVF30ANVctgoby85CR9X8mHqCrqlLe4GQuRtS9200+I8wyytWe/LvfSbcVqnINCTYjzzEqtqKGxnwdisj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGObreo/yEWaijscsYbYZHIpQqswJCw6mKw7pKuwNC4=;
 b=YBEOLiflywKLJ/K/LybT9WHafpjtXGv+R9rdPC6g4+uzEE5elysRRqbJjQ7R/CVb0m2hg4d38ZCa35ppNAIhfvpV/W6qVXgldKkNB/PuAVG+d+be0PWvODgBDUcLS7ghOiciC5gOvZeNGXjeSKlJCsO/ohGCz4yY0Gug3jKP5Oo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO8P265MB7597.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a7::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.19; Tue, 15 Apr 2025 09:15:23 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.018; Tue, 15 Apr 2025
 09:15:23 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Maxime Ripard <mripard@kernel.org>, Michal Wilczynski
 <m.wilczynski@samsung.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, Drew Fustini
 <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/4] drm/imagination: Skip clocks if platform PM
 manages resources
Thread-Topic: [PATCH v2 4/4] drm/imagination: Skip clocks if platform PM
 manages resources
Thread-Index: AQHbreQa3V8I6/6Uk0avpnwvKJG4OrOkcgwA
Date: Tue, 15 Apr 2025 09:15:23 +0000
Message-ID: <1226d261-247a-4a7c-a414-7db4a24fab9e@imgtec.com>
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <CGME20250414185317eucas1p139284a38dc4418ac90bd081c2825142a@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-4-70c5af2af96c@samsung.com>
 <20250415-poetic-magenta-cicada-9d1ee7@houat>
In-Reply-To: <20250415-poetic-magenta-cicada-9d1ee7@houat>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO8P265MB7597:EE_
x-ms-office365-filtering-correlation-id: 2a38b341-5e78-47fa-37e1-08dd7bfe0d8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?bGRVWC9qVlllU3F5NSs3TkJlcncyMHBsaXh2RnhFM0ZCWGE4QThQYkFzMEsz?=
 =?utf-8?B?bzFnaVhmUGpMSjBjTUlmVDhXd1RYM3VhMUNqR1pUVVBvMDFSN1Z1Rk9FNys5?=
 =?utf-8?B?dmZ4ZisrcURhTmdraGNDaFArMExST0N0WUZ0b1hHNWNKMjR1amdKd2kya1BS?=
 =?utf-8?B?VTY5MENKS0pxcDB2QUs3VWhmVDBLSFlpdVRGWFY4b0piUVF6MFU1MkhtUnNX?=
 =?utf-8?B?OHIrbkFxbTFoL0tKTEpVUnNFNU9sQm51L1ZTZmFHTWEwR2VhaHcwUy9PcjFp?=
 =?utf-8?B?QWpWTGRqZEtVaCtxZkp0Y0UvUkhHRTBHWlJ2cElwTzlmcnVXeUplVHlKTFlY?=
 =?utf-8?B?QW1la2RqVHpGdDFydllMZkdwYTVBclVHVEk2SEVlMHNGSFlRa1hGNEp0Qjcx?=
 =?utf-8?B?M0ZiVjdPVFloR3dXTDg5b2pBVHBvLzg3d2xyeThrTzdESjRGY0tkLzRCanVX?=
 =?utf-8?B?MmdjZ3JZSS82YVVjRWxkVTdsYXNONEpUTkRXOWovanVPMi9VWUp3OTMyK1Z2?=
 =?utf-8?B?OTQ0aG9kYzBlVlNCQVFsL2NScDRLYVk3OVNNQUYyYXE3LzI3Mmx4UTk1NW1h?=
 =?utf-8?B?dTJTNkNncmVQVWtYamc0VGV0T1Z2ZjZWN3JseFZkYU1IYXFWTmZTRzdJS25T?=
 =?utf-8?B?bEZxVG9MYmRNL3d3NXZ3UndvaDdoNm9aM3lCam9LdmhKR25LK1ZzaFQrekNY?=
 =?utf-8?B?dFlCUkYrdzZvUU1mMHVjMkFZdzFVZEZsYk1SY1FhSjdhT09NUG1FQWRrMVNu?=
 =?utf-8?B?dWdmNXdTZVBFWlU3WUtPa3grMXFDTkF4czROTGFoMGlXQ2grWGV5UGppQzdY?=
 =?utf-8?B?OThSdXZhNW45NHcyRkhHWFcvbWVWOXpGYVVOK21qNnR2eWxNSy96Skw0SDhu?=
 =?utf-8?B?MHZaT1MxMVJ1eXhQTGo4STd4dTlkTGkvTGJFQnFMUHVIbC9BYS9zV2p0Rzls?=
 =?utf-8?B?ckRFSm4xNmRnMkl3ZlFVSDA3eC9vWTExRUJoZ1NhQzcxZjNENDZyVWFlKzVB?=
 =?utf-8?B?ZFR4ZE16RGJ3YzcyVyt4SVFZWXRYUEZzQ1FsNnY3M1pqdExQb2puVmJUcDZB?=
 =?utf-8?B?THZZR3pCZURVd3hOK0VTNVo2OW1IZE9nTTkrVFRJS2JMMm1zVlR1WWpJQS80?=
 =?utf-8?B?NmFIWVZZbk9jRldjK1BtSE1Vb05BM2thaEg2YzFXVEtTUmpjMFBJZDNETHNp?=
 =?utf-8?B?R0pWQ05VL2s5MlkwZFQxVmJSTzFUdWs3WThWblo3TVBUc0VUZjFIZDRmZXhF?=
 =?utf-8?B?SnF6d2htYm9Mdmh4Sk1XYTZkYkttYVMyZnpESWFSL3hNdUVIY1RWMDBDdzAv?=
 =?utf-8?B?SlVxV29Oa3lRUm8yVHBJQXB6MmpPa3FSVzJvWk8wRkkyeVlwM0lZdnVRa3Rm?=
 =?utf-8?B?WU9KeVkxTzUyOThnZFp2elZCeU1PNlpLRGU2d1FaSWNpeE1FR2lUTFJ3T0tk?=
 =?utf-8?B?TzBVcHVoQndpV2J1WE8rK0lVdWJRaVpFS2tlN1M5MXEwYlNjRFAwVFczRkxN?=
 =?utf-8?B?b0Q1K0tqcGNnMmZ3WnM0WUJ0b2tCQ0k1RDh4TXZuWDFxcWFyU1ZIdW85YzdG?=
 =?utf-8?B?d3hMU0ZPYzV5aEltdVc3MGJudEM2MHdmdGNNVVFHeXVwZWlobmV3V2NKZlBz?=
 =?utf-8?B?dzVHZGVacjB6VXJiZ2ZXSnc5enNDbWJxYXpNRUlZRGE1UzlHZnhoRFdOdDVn?=
 =?utf-8?B?b2Q0Nzg2dUxnajI5N0VCL2RnQWxISmdhVm5hMnNEYW5ONGg2VDdxcDZZUUxY?=
 =?utf-8?B?cXFJbU0vejFYZVlaVEtMY0pIbG9RKzdhVDlibE1FaHpDQWlkL2plWEtSb0RG?=
 =?utf-8?B?M0o0T25tNHA1R210djViVHFOZmxMZjJxVk9LclZHN2NDYlQ2OHZWSGpYejRZ?=
 =?utf-8?B?VmFYS0c4L1kzaER4YWNsb01Remd6d1kzbm5xZmN1aHl0M2VEdDVVNUpnV0RJ?=
 =?utf-8?B?eWM1cEp5Ty9WLy81TTk3Q05XR1lOdTNRTmFSZ0l6WlVGZ1V4RU1LVVVybHU0?=
 =?utf-8?B?SDlBZlVLVWVBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0N3S1BLYTgrbkxpd2JTZ2hIeHZEVlFPTkNseXdVelYyQzE4WnFGR0c1dDRB?=
 =?utf-8?B?SDloQUJCckF4ckxxZkZnTDMzRWJ4djBjdkJzTjY3ZWRHMng5MjU0djM0Y2pO?=
 =?utf-8?B?czVQRnVEeHR2MXhsM3NDYy9KTENCR0VGY0VLZXRtbHZITzlXc2trb0NuRHBH?=
 =?utf-8?B?NUFxdGh5L2NmNHBGTm5yaWR3TG5DQWJjTVp5RHdRZFM0TU9sRXVEaFMzV1lq?=
 =?utf-8?B?RnowWFp3cTBSdHNOYUpwMGdZMWo2OTZES3dpdWJFaDNmcUtqZ3I2UWhXM1RJ?=
 =?utf-8?B?RmduYUM0endydjNoOEc4NFpnSU9qYUN6Y3FPcVFFVWtIZndWVGVvVktwbmQ2?=
 =?utf-8?B?dFdHMGRva1c2ZTBTQkJPTnRMSlM1UVgrZzFEcU9jakZGMzQwd2N6ZGtFMDhC?=
 =?utf-8?B?cE9kRTNkdGhSZjVsMzJpcS8zaUFhSEFFYWQwWmxSWkhKSkRlVm91bHNOd0hN?=
 =?utf-8?B?aVFIY29ITFlaSjNabkc2YVhqaWx0ZUhQcDFHdk10Zml5YXI2bDJYMC9SZm1u?=
 =?utf-8?B?M2xsZE5hMFRnd1pFbHo2SXNJZkFmZXZkTWo4K202RVNmWVRBTUp5VU90a3BT?=
 =?utf-8?B?M3FNbDdiQVN0OXdHYTZkcGh6WWpSdC9PQmNTOUN4bWhyTlVFaUc2NkV5T1ZM?=
 =?utf-8?B?QVJ2bDFtVllOWHUyemg1UVhqTGNnM2pyMnFPVEZ1MmRGS2ZrMitQTmQydHJC?=
 =?utf-8?B?V2J2M0wrSFU1RUhCdUFZUVQ2MnRoazdsaEtRK3NJVkMwbEpMdWY5RDZ1ZDJT?=
 =?utf-8?B?QnFRQU5KdkQxZ1pzRGFvYlN3dzljcGJ6WVJlMWovOExaSFJlZ2VHM01vcDE0?=
 =?utf-8?B?dWxHNUVSSFhNTnhvcjFEU0pNSnY3b0FUaHBuWll1VzM1VDFKZUdTR0kxZEZH?=
 =?utf-8?B?cmNjVnVkY083SWZXcHlvUHROTjk2Mkw3UG5EbU1JQ3VoWFA4R3VrVHREdjFT?=
 =?utf-8?B?OHVJczUrQjJJazZSM0Zaa2FaZ1EwYktLSmtJMU9RcHpKbG1nbXZKSGp4V0NE?=
 =?utf-8?B?TVRMMEVMZGJaN1FQUDNwSkludjJRcHpQdStudzF4eE4yYlRIQkhjNHBqRjJr?=
 =?utf-8?B?alA2TEphSTNpRVhWRFAraDY4V0o0MzlLdVFPQUFVdHpVYjZPeGI3bTZiUUhJ?=
 =?utf-8?B?L2lIRUZSNFFEZittTk9LdmlsUG9UTGVwL2IwaEM2ZUh2dWxjUzI1Z3I3WE15?=
 =?utf-8?B?WXFUeHdTVGpsWi92clREb1ZFTSs0RC9MTnF5U2Z6eSt4SWRld2NibVJQeHdI?=
 =?utf-8?B?ejZoUXNGMktNYVN4eDhDZGxhSWZTcVozRnZ6NUNhZW1Td2tzUVRQK21xMmFm?=
 =?utf-8?B?NkFCSGd4OEZQRkhIayt5R3FrVVY1SG1pZE02NlRQVldkSXZtVkpQR0FPSjcw?=
 =?utf-8?B?eHlrNGk1SUkyRmo3Y0Nuc3B4aWRyQkxoQk1zN1pDWkh6T2VZZFYwWklpMkkz?=
 =?utf-8?B?c2lWUi9pSXNIU1k3ZTVtYjdzK3E2T2JxZDQwRWRpV3FvaVV0eXludnl0NlVP?=
 =?utf-8?B?bEI4emRvTlV3SHdFTmhJM1RhcmpuVk1ianpiVVI3Szh3TjFZaE9wWHpFOTli?=
 =?utf-8?B?ay9SM2FScGxOREt0eFE1WmRjUXZDeEQ1a2pLVFdTWUowME1DTFVoQ3RHbjhV?=
 =?utf-8?B?QmU5NHlaakhxc0JqL3NLb2xMTUdYZ0twNEVZblZmd0dhY01Vd3MxdStqbnI0?=
 =?utf-8?B?UHZOQjJMS3NRLzAzRUx0TXpmQmYzcWtVL3Rjb2dLMnZPR2FRd011T3R1NmlO?=
 =?utf-8?B?SERlVUVBck5MWG5sbHYvUkhNZXU5THdzMVlzQmlqc1hqcHQ5eHlaTmNzN0hM?=
 =?utf-8?B?OCtkaktuSC80UTErdCtheGovZDNZaTE1RVA1YXUzMnVYZGFBMEV4bHdaQi9Q?=
 =?utf-8?B?WkNzQlo4MC94dUZUdEhNRlZ6cUIxS2ZRVnYreXJlV1dBd0pjWHpKMFVac0Vz?=
 =?utf-8?B?U040VE5rRU0xZmJHQ0pjd2lGai9Yd2ROOE56enJ6WWxpUklFeVZRSWE0TmVx?=
 =?utf-8?B?cG1WUGkzaCtKOVk5VVNrd3dwcVBUQjQzQm1mY21RZjNCd2REWDFzTFJWMHhN?=
 =?utf-8?B?ZzFMZ3hhT2x5QkIvZzIxYUFyWXRNTjFvbDZVa3U2bkUzaHlVWVhyZzNJMG53?=
 =?utf-8?B?R2ZEdjArR3UvNFVmd2JDY3lubWF2OXJKQzZRdDRDcVF2QUIyUEcrY3EwTzJ6?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7eIK9eS3654lDBA7R0WfEFcK"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a38b341-5e78-47fa-37e1-08dd7bfe0d8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 09:15:23.5219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jclKssrQAtM26agJyrlFaVlIAoXl+C6b3olkYwMN4OG0thT23zFh0YCBaxjX2x6PUFbhCeN+MS9H5Dwu2gYDtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7597
X-Proofpoint-GUID: QMdwYOF3KSjUoWwJ0QoUg1R3ADa6VogM
X-Authority-Analysis: v=2.4 cv=OMsn3TaB c=1 sm=1 tr=0 ts=67fe23ae cx=c_pps
 a=+8G7KV7MoNjfk4g9SO/OOg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=cg-36aUXAHM9IJLQJ2MA:9
 a=QEXdDO2ut3YA:10 a=NGHoSze0NoZO2hb-OsAA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: QMdwYOF3KSjUoWwJ0QoUg1R3ADa6VogM
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

--------------7eIK9eS3654lDBA7R0WfEFcK
Content-Type: multipart/mixed; boundary="------------0T4pGmpUW4blsCVOiRdsA0ib";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Maxime Ripard <mripard@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, m.szyprowski@samsung.com,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <1226d261-247a-4a7c-a414-7db4a24fab9e@imgtec.com>
Subject: Re: [PATCH v2 4/4] drm/imagination: Skip clocks if platform PM
 manages resources
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <CGME20250414185317eucas1p139284a38dc4418ac90bd081c2825142a@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-4-70c5af2af96c@samsung.com>
 <20250415-poetic-magenta-cicada-9d1ee7@houat>
In-Reply-To: <20250415-poetic-magenta-cicada-9d1ee7@houat>

--------------0T4pGmpUW4blsCVOiRdsA0ib
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/04/2025 09:55, Maxime Ripard wrote:
> On Mon, Apr 14, 2025 at 08:52:58PM +0200, Michal Wilczynski wrote:
>> Update the Imagination PVR driver to skip clock management during
>> initialization if the platform PM has indicated that it manages platfo=
rm
>> resources.
>>
>> This is necessary for platforms like the T-HEAD TH1520, where the GPU'=
s
>> clocks and resets are managed via a PM domain, and should not be
>> manipulated directly by the GPU driver.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/imagination/pvr_device.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/dr=
m/imagination/pvr_device.c
>> index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..f40468b99cf14da418aeec=
de086f009695ff877c 100644
>> --- a/drivers/gpu/drm/imagination/pvr_device.c
>> +++ b/drivers/gpu/drm/imagination/pvr_device.c
>> @@ -504,10 +504,16 @@ pvr_device_init(struct pvr_device *pvr_dev)
>>  	if (err)
>>  		return err;
>> =20
>> -	/* Enable and initialize clocks required for the device to operate. =
*/
>> -	err =3D pvr_device_clk_init(pvr_dev);
>> -	if (err)
>> -		return err;
>> +	/*
>> +	 * Only initialize clocks if they are not managed by the platform's
>> +	 * PM domain.
>> +	 */
>> +	if (!device_platform_resources_pm_managed(dev)) {
>> +		/* Enable and initialize clocks required for the device to operate.=
 */
>> +		err =3D pvr_device_clk_init(pvr_dev);
>> +		if (err)
>> +			return err;
>> +	}
>=20
> So, how does that work for devfreq? I can understand the rationale for
> resets and the sys clock, but the core clock at least should really be
> handled by the driver.

I agree, this feels a bit "all or nothing" to me. There's only one clock
on this platform that has issues, we can still control the other two
just fine.

I thought fixed clocks were the standard mechanism for exposing
non-controllable clocks to device drivers?

Cheers,
Matt

>=20
> Maxime


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------0T4pGmpUW4blsCVOiRdsA0ib--

--------------7eIK9eS3654lDBA7R0WfEFcK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ/4jqgUDAAAAAAAKCRB5vBnz2d5qsFy0
AQD7qyOSrzvSOHUAM/T21E2D7ABo7J8ss23WclU9RHIAPAEAzjFTrQyLWtrOf9EwZkhvjuCekxRy
hIy7j0ms2ZfItw4=
=0hfU
-----END PGP SIGNATURE-----

--------------7eIK9eS3654lDBA7R0WfEFcK--
