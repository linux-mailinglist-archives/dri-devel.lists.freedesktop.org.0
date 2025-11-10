Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370D4C45453
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 08:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A465B10E30C;
	Mon, 10 Nov 2025 07:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="VsJe9Jaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023141.outbound.protection.outlook.com
 [40.107.162.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F116310E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrZvGdBLcvD8KrYNa5VWgdpWQA0SmalQMXqFxo/WazxABddgritLWpEFpbWa3znXQ5WoOc3P4YNvQTlOAcPc8Dpi/YPpAUP2NQwZzHh+es1jlVfABvDxL47wkhIXz3XdqGiyfHEMF9cXMGuR0WuOm+/zCjJIAKM6p2cjPk9SJrlpwujmYfnuWamqKXcd8k68ccASYtDi3gfjz2yYbS3Yxdk8EZHohcX/YazTdw1J59nag1pyEFsrWF03BLOWNrpi/D0ZzWgyBHCQoQcdW6ASndG5VnqqiC4SQb3s99uPoJ6LEdxBQGNE4L3YMSUzvX/qE63gT8QBKYwWDnt0yVdQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAcc4cr6+eYdPlXrVLAlKI0jgksXyGaiT4HctAcBvE0=;
 b=n28IaiOxr2i3qI6GxfePjuGg6TStNvPAWu6veQwzGnjizosGEbITHmp+bhvtg2AfH1PxOfK+ILHBplCCNnRVHJ5DitcXhW2sDy8cgfzHPa+DjrfAHnzRk7qMuomsebwLy09s5JWbEAtchlVmcjul0E6VnIWgVIP5vnofmWS9rX4M6VgD8qh52NFEcNJXabvF9bvb1CRInp88sxkfxq6TM4RxsIDrmW2c7mTTs9TeDwX8cTJaBbHBM26tkMNUov5I8I/hrUQJW9HOu/he/lxnSpiXrDYjqrKyel/OdwdYxGL1oaz3oB0nJPobH1Ajidf+7SzO4XrzJ5SipMWswDnxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAcc4cr6+eYdPlXrVLAlKI0jgksXyGaiT4HctAcBvE0=;
 b=VsJe9Jazm3nOPqQs+rVeWzPAFvyHFjeXIcF6OQVxBS1ZZNgzXRhuWlLB075X29O8S5FpTl+fcx8buzQa1WA9X+Vs/6Al6zo5tEezQ4zcRnO2LDPWtG234G48MC2NVodxRJdWhL00GXCOrqHAFeHpxISNDiG2R7iWXbl1kz7VbtekxHm7WsoTkj4DXYhhNAEsjmsN2MK8iI1J7d3eiWBImHHKqTyKDz4eMak7nb8r2vRcKnTduOsglgYlwLEpt7NdhWmDeLI7zyjBmMb3cXJEfYKrgk8SP+tIwyJwlrlJkQpTcjGAfVZQScx5JwvMQHr8ZudS2qxzBNDsJ3OqCmekIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by GVXPR04MB11068.eurprd04.prod.outlook.com (2603:10a6:150:215::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 07:55:19 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::c39b:dab3:ae88:c5ba%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 07:55:19 +0000
Message-ID: <88f9ef73-7eb7-4186-a436-9d8bbad52e9d@gocontroll.com>
Date: Mon, 10 Nov 2025 08:55:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 support
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
 <20251107-qualified-varsity-78953d06d7c6@spud>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20251107-qualified-varsity-78953d06d7c6@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::16) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|GVXPR04MB11068:EE_
X-MS-Office365-Filtering-Correlation-Id: d484438e-505a-4ed4-9489-08de202e7e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekZCNWpPRUR3MEJRTjRRSkRuYVErTWE5b25JbkMzcVZaSmlQa1RBRnBSbjNy?=
 =?utf-8?B?Mzc1cVdNZ2tmVXBmdWlXaXA1TXZyQ0MvaTBGMThPblBZL200K2xQcUVGTUpD?=
 =?utf-8?B?VTNkNEkxNFBBYk4zbWIzaFJBWE9XMmtZQldEMHc4K29pTFFQYVB6cjAzOW8r?=
 =?utf-8?B?NmxkZnlVbkFUZnJtZ3F3NVMrZXR5ZlpKYzl2Ky80SUdBK204Qk9McStnTWln?=
 =?utf-8?B?bnN2UllrNTEyNmFta0MzQkZyc3E0anF5U29wQVFiKzZmYTQ4SHF0SHRFTHY3?=
 =?utf-8?B?ZmkvRDlSWERLRzlSQWlaMlhBakhqTHlxdzRkVzNuN040R0RUZnhSMDdGQW9i?=
 =?utf-8?B?NFVsOEFGNFV3QzBMR0lGbzJRWTJva01IYm0xbEo1SUdLbFIwQWRaT0FITmZp?=
 =?utf-8?B?eVhxVDhCMFVGakwyYm9lN0VUY2ZFVGdFcFNyRlNvcE1iK0tFOXNpRXVuRGxy?=
 =?utf-8?B?UVR1Qk55dkpOYmJoZWVBRzZFTURwSDRJelEyRDlyYkdrYnhlb3M2bTlYUHdK?=
 =?utf-8?B?VUFzdlhYUGxoVmtrOFh5cmdFUGF1eEFNblBUaDQzNEJ5Z3pmM2UwMUxDeDV5?=
 =?utf-8?B?ZThScWsvSks1TG0wenIxL3JvRTY2RnNDMHNvYlFwRzlKcWd2MEhhY2ZMK3Ju?=
 =?utf-8?B?VkttYnBpWDd5ZHZ1aGdhRW9SUUJVYy9IenZmY1NkNlNLSjQ3UWpmeFpqNU5W?=
 =?utf-8?B?SzBhaG1pODc5WmFCa2w2bHYxVnlsWnFYSTdUazlPYUwveEFpeEsvNDk4UHU5?=
 =?utf-8?B?UjNrTEZCWkdqNjhtQW4yaCs3ZURrTW55SFZYelU4Qms1Y2xEekJSK3BEM1lJ?=
 =?utf-8?B?MGFSTENCbFA2Ymwzb2l0ZDBua3BKSjBqMjQ5NWNVWWIrNHhYbU0rZ3o2TUc1?=
 =?utf-8?B?aHFldjRPeHBSY1R0ZkhVUS9ERDdRbHJSTWVuVnU2aXNJazlqQUU4elZNUVpE?=
 =?utf-8?B?dXZCOXhJTUtaNS90OStnVXlnOU5uUFNsV1IyT1VhL21UR0FKK3B0WkNkWnYx?=
 =?utf-8?B?TWtnSXArc2c1VjNpZGVrbW11VEtMV0ZTUTBmV2hFaGhia0Y3SnhPS0dOaE5Z?=
 =?utf-8?B?dUp0cUJCWG01Zy9RRm9Hbm94bGY5Yzk3WllXZkJXQUVyU2NEZk1FODJMdkVR?=
 =?utf-8?B?dmZ6NGwxTk1rM1I0eUJ4QXBUUlFXZW1NUHRaNkR0T1BGL3JVQksvcFJveEp6?=
 =?utf-8?B?ZWZuM3BSaURJV3p5UUtXckxpS051dzJVRmp6cDFZZmVoQmFrV0cySkFDQ0or?=
 =?utf-8?B?dE16a0gvZ0pDbEZWU3NUN2RlQjJJRGdiaWkvczhTSEJyQWsvd01UU3RscGps?=
 =?utf-8?B?d3crVjJYckZrN09RTFBacGZlK21xakFhWHhtQUJHeXprSW9WSmpLVjV0aWFt?=
 =?utf-8?B?cmg1c3Z1ek40US81TERKbW14YWhrZm9YSGhXU3VHejBUeVlMR2hucndMN29w?=
 =?utf-8?B?OXJKV29GbVYvWmlMbHhEbEpRRVIyUE96L3JiZUFxcTN2Rjk0enpDQVlhaFRn?=
 =?utf-8?B?UENOQlhVekdrVndEeHhnZ1BBcVZTUU5zN1VRc0V5M05IUzdRWFdsbC9KaFc5?=
 =?utf-8?B?ZTEzWTlvOTJvL3paWkdobG1BOEROS2dtN2xqUlZWOE5sdnZGVXNOSFdEelAw?=
 =?utf-8?B?REY3SFhrMVgrcGwxOWNPMjVzaVFnT0pXRWx6ajlEYWEySWNUajFRSEZ5alUz?=
 =?utf-8?B?QUs0UVZxeDhuUHZqWEJJMHZodi9yaWJCTVN1OHppSitXUHJTQ1dNSXdlUGU5?=
 =?utf-8?B?WWsxR3VVUjcwY1RaQWlFOWlCUGFLRk1QMFRBbndCZmVkOG1Ca0NqTG1kMUJh?=
 =?utf-8?B?ZXlVajBaaGFBZjVUQmtPcGwyZzB4TXZ5Y0tWd2FvOTB4b3BqZEpsOXl0QXIv?=
 =?utf-8?B?WTBTVzBVZldrb0sxeWtReFJqMVAwRUxiVk9JaWVjcDJhNUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AMBPR04MB11741.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3QxSUF2RmFHeUh3aFVvazdPMFQxUTNpNTMyZit0dVFzQm9sV053VWh1K0hq?=
 =?utf-8?B?YjR4bGcvekQxK3A3T3R3U3daSWhxb2VrbjI2Z2NJWnpnQjNGdUFQMytsd3RY?=
 =?utf-8?B?SkhnMng0ZUhpRjViUjk2UVJzcHAzZVNveVhrWHpXblRXRVZaQk4zeHIzVmpP?=
 =?utf-8?B?WGdneWFzbmtFRGVFanluejVOSE9TbUdHY1ZjeU9SVnprQWdXandvaStEc2Zu?=
 =?utf-8?B?dEpObzFFTjJEd0FEVEVSUHY4d21OZzZvSFN0eTQrMWM0TERvOEMyNDgzdWVV?=
 =?utf-8?B?SVlieldTV2gzSU40bXRxMEVvQWpZbVg4KzVJc2ZlWSs5cjh5SldsY21MVEFQ?=
 =?utf-8?B?cmtlbWFZN1h6ZHJDZDJVb0ZGRzNtc0ZRWldVSW1DUmNmWSsreGRoRmFoWnFa?=
 =?utf-8?B?cDY4Vmk3ZEd3ZCt1My9ZSGdVbFFNOERhQ0pBS1djMmtUSFJRS2poNStJV2Fy?=
 =?utf-8?B?ZlNBVmUyM21FbmdVU3BWWisrU2ZNekI4SllUeUdXS2xOdlRTM080QjZzOEhn?=
 =?utf-8?B?MXNGS0tiRGF2bkRQaCtRU3F1QTNnWGg4TFdoajJOVEZpV3ljQW5pSlNkTmxE?=
 =?utf-8?B?VHNEd2RlOHU2UWMvcEUraGlLY2k5U1hBQTN6S1lmOHdZclBlV2hpdGNpUkxm?=
 =?utf-8?B?dUZmNTN0TWUrWEF6RTZ4M0NteXRUU0E2dkU4ZkNJbTBXOU1pdS9PMUZrL2RU?=
 =?utf-8?B?UEdZR1RRWlJnNmYyRGZOTm1RRXZBNjJGYTArZDZ5V1ExWXIvU1FIOStQelVz?=
 =?utf-8?B?TXg0Ukdwa0FPaHNIdVFsdkZwYmhyRkFEUDJBd21pQTZUMlVvR2IzK0VpZUdh?=
 =?utf-8?B?c2FGTk1lY3dHRUd1blpWby9TZmhvcmpPYm5wOC9qdzg1VG1Fd0t2OEtwOVc3?=
 =?utf-8?B?YXZtWkdKdGp0TkM4b1BQS0pKZnVNRXIyNGlrQlpqZEpRbHF4UVp4Q0pKaWtj?=
 =?utf-8?B?aFRBVVhjUFlzQ2pVeXNDaXVZSEJlTkNSV2pZL09BTkFGOEtBbDlNVjNSUGVa?=
 =?utf-8?B?dUJPR1BDV252c1RRREI2OW9Wd0JGbDJWWkV5VlVKS3lSWGxIb3ZmNisrN2xK?=
 =?utf-8?B?dUxqWHFOSHhLb0Q2bzRrdkE0bGc2THh4elRpYlpNUmpzNTlsNUtYbm5ycUFX?=
 =?utf-8?B?TkJ2M2ZzMXVua1U5NGFwVllUU0VXcGhJbTlaNXhIT0NIY2tNTjcwWDBMN1Q4?=
 =?utf-8?B?N085Y1ZFZzFvSEIwOWpZTko0NjA4VGRYZVhINjg5WW1yeWVaRmRlOS9Tc0Rt?=
 =?utf-8?B?T24rNkNWU2hFemt3Y1VqcFE4azNXNWZ4OHVxVFF6TVc1ZGFmS0VHbGxSTUc1?=
 =?utf-8?B?RTFKOXN4NmlUUENTdmdUUE5JOGoxSmJzS05uNXBvci91L3NQRUdYMjdFQmRI?=
 =?utf-8?B?NGNCdFZiOThVNDQxQlRpNzFkeUZadmxWNlUvYkZjQlFmYU51U3dUTStDTVBG?=
 =?utf-8?B?eFNyUTVwNGJkOVlKaDg2RE4wSE5NZDFEaStCcEMzKzZzNTJWYS9xYnlMTkc2?=
 =?utf-8?B?Yi9hTklIOFdBTmtjSndXd2xtcGZ4M1dqMVFWWk1EZVl6N0ZYUXk3eGNxRkRr?=
 =?utf-8?B?anVpL2Z3ZTdaTTlsRHVLVHhPRTh5eDdmMkZ3eGNQMlUySnJFMXRFaEJnY0Np?=
 =?utf-8?B?MUxhOGlPUkZCdWFUMGFDMlNRODVSaGxOSndFNkFtOWFRaVJSbUwwb2UxWmRo?=
 =?utf-8?B?NTY5dkhxWTYxcE5ldmxMMDA5NnRCVzdpUnIxN09ESHpxdHZoNHFWVmVGSVRU?=
 =?utf-8?B?WDZOTmJ6U1QvUlloTmYySmtDN3dKKy9GeFlJTkxmd2ZLOG9vb25waFpONXFS?=
 =?utf-8?B?QUFsend2SHhXUkgyOXgrRE5FTlVCSTBCdzN0TTEzUjZqdWpEbVNCZGZaTlJF?=
 =?utf-8?B?c3RnQVF2dHRhc3BSMlNoSS95d25yTlFSdDlMV0VDOTFrdWlVUllUUGxQbmM5?=
 =?utf-8?B?RHRuUXlhZFZGVGkvNkdvTVJyTkwyTmRuU0FheHhZclVGT0hjZjQ4RmxsVHdG?=
 =?utf-8?B?cUdzY0Yxc1hpTEx0NzJ5cWx6THhpWHp6UUtzMFhXR1RqUW4yY3V5YWQ2Wkhu?=
 =?utf-8?B?Mlh0WStxQU11MFZOdVlxblFmb3pIcTFQWjZjYmRWd09jaG1pcWxVTmk0SnNQ?=
 =?utf-8?B?Tm5aS3BkYjFOZUtkMkNwbVVTeUVSb3o3Wi9GejM3ZHpnN2dPSUQvUTVmZFNW?=
 =?utf-8?B?SVVRWEZPSU5lekM3aGRlcUtlSkhqd0tkTktzMHJMelhmK3JSTThtSnlNencx?=
 =?utf-8?B?aEoxWGxHMzlPUEtnYnhUanVWTXN3PT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d484438e-505a-4ed4-9489-08de202e7e37
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 07:55:19.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeD5Fg7YPJZG7sO+3EAbWCJKPzG2wAVWOVyTTUuQsSadADr1dQMyqkMelcF4yOZJ4UM4sc9S2Umi7f+RLXYyIebclapTl3o4jDBJHwePAtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11068
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

On 11/7/25 19:16, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 01:49:58PM +0100, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with integrated boost controller.
>>
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>
>> ---
>>
>> In the current implementation the control registers for channel 1,
>> control all channels. So only one led subnode with led-sources is
>> supported right now. If at some point the driver functionality is
>> expanded the bindings can be easily extended with it.
> 
> I'm sorry if I asked this before and forgot or w/e, but how backwards
> compatible is this? If they control all channels and it gets changed to
> only control channel one, how will a changed kernel understand the
> difference between a new devicetree that only wants to control channel 1
> and an old devicetree that is trying to use channel 1 to control all
> channels?
> 

The idea is that an implementation like that will add multiple led@ 
subnodes without the led-sources property.

So devicetrees controlled by one channel will still have only one led 
with multiple sources in the devicetree.

Kind regards,
Maud

> 
>> ---
>>   .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
>>   MAINTAINERS                                        |   5 +
>>   2 files changed, 112 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> new file mode 100644
>> index 000000000000..e83723224b07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim max25014 backlight controller
>> +
>> +maintainers:
>> +  - Maud Spierings <maudspierings@gocontroll.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - maxim,max25014
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  enable-gpios:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-supply:
>> +    description: Regulator which controls the boost converter input rail.
>> +
>> +  pwms:
>> +    maxItems: 1
>> +
>> +  maxim,iset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 15
>> +    default: 11
>> +    description:
>> +      Value of the ISET field in the ISET register. This controls the current
>> +      scale of the outputs, a higher number means more current.
>> +
>> +  led@0:
>> +    type: object
>> +    description: Properties for a string of connected LEDs.
>> +    $ref: common.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        const: 0
>> +
>> +      led-sources:
>> +        allOf:
>> +          - minItems: 1
>> +            maxItems: 4
>> +            items:
>> +              minimum: 0
>> +              maximum: 3
>> +            default: [0, 1, 2, 3]
>> +
>> +      default-brightness:
>> +        minimum: 0
>> +        maximum: 100
>> +        default: 50
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        backlight@6f {
>> +            compatible = "maxim,max25014";
>> +            reg = <0x6f>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
>> +            interrupt-parent = <&gpio1>;
>> +            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>> +            power-supply = <&reg_backlight>;
>> +            pwms = <&pwm1>;
>> +            maxim,iset = <7>;
>> +
>> +            led@0 {
>> +                reg = <0>;
>> +                led-sources = <0 1 2 3>;
>> +                default-brightness = <50>;
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 58c7e3f678d8..606ce086f758 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
>>   F:	drivers/media/i2c/max2175*
>>   F:	include/uapi/linux/max2175.h
>>   
>> +MAX25014 BACKLIGHT DRIVER
>> +M:	Maud Spierings <maudspierings@gocontroll.com>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
>> +
>>   MAX31335 RTC DRIVER
>>   M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
>>   L:	linux-rtc@vger.kernel.org
>>
>> -- 
>> 2.51.2
>>
>>

