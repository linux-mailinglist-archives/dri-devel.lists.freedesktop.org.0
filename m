Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18854CB9588
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F0B10E905;
	Fri, 12 Dec 2025 16:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=advantech.com header.i=@advantech.com header.b="jfJYtbSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11022104.outbound.protection.outlook.com [52.101.126.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DFB10E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jT6J372+Nfda//vnPFWfU6ulwCpBeNU5TlBxjiJGYfUkNQX4eFTLm445PeJdl5B7cpx9snOizW0RFAflQgnyuzKH2fHxuM/grHP2xgSmiuP9e5XeplxeK/1mDCmBtnoznQN0i46bR0mmp/c9lAnxyrNg5yt9suFt2LG54Gew8I9AZ0EZcJZsMRa9pAUk4mKyXvaP60pLvn2WGM2zCRFt1a74o95mvVS1cdy0ostIlc3iGFT/c3p8LaXEK4L3VlgJxqQVAidJUFvVJbn/BFUjRjnwF4GxOMkZg+ccEuk50uwdZxuy+rWdPAJwkFlCS7PL9/3y4Ri7oRDfGPozuCtuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBw35jX0aADda8kMdZRemBJOFN8CDdDIL5muHhBSfoU=;
 b=u1hB0d9nrd9cmIGhkP11zcBBPF/OZhfk7SUzEB5hdNbTqDyXt5K+P4TFZDR0N2ON/7zs7NC+JPTx3UobNt/GRuLMJEIbcM4JEh1bAXWcavd7Lt0lc8mXMcRqN5k3D+U/yUsna4DsG9HiTEurXhq9nlEDem12ncAcGaRM3BtCMMndfXzyf4X5xCE6BlMyFbDK0ZXLM4Z67ePPBZ8HrfN5jXKIn2GklwNbZMLWgCoTYGRTZW9xeZ2uIvPy1+kDUpW11r7jKNplZ94HYrtZdeYM+ijoaVzT76eHtguWEpo/rqE+yvgg6uSP9iOVp+3g9/nnMvGWwEvuCYYeQKysNVs6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.de; dmarc=pass action=none header.from=advantech.com; 
 dkim=pass header.d=advantech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBw35jX0aADda8kMdZRemBJOFN8CDdDIL5muHhBSfoU=;
 b=jfJYtbSYgFG3I6uQUjyT0TRSUPhysL7G17RGSjc7Zt6yZQcO16+bpTZGgCVNgZY4VMM39jo54KsPSmZW9DaZ1H3bp1VFqkIz8UUy0EQmOuY4HNSYpE4pieyCxCdkDy9WbdmAt+pzRjbp0LljnYoK+EFz8nPU6j3uFy6CdHxlYZydcJOFG8kDDMU8n6KPSnsD6r3nMkUovlozYn+h4fRfm0LXqkQjsOJQTIDi/XkIJQ2tNjKpYv3eXWUF1/3TH0vkkBiP9tdJIeXX0/t2lSFMwWyjANKz3jNchYUmpYh0hD+wRUZfMtQiNCLJ2z67L5W1gxWP3ppeOrGK8kUb+07kdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.com;
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com (2603:1096:301:21::6)
 by JH0PR02MB6564.apcprd02.prod.outlook.com (2603:1096:990:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:41:12 +0000
Received: from PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b]) by PSAPR02MB4502.apcprd02.prod.outlook.com
 ([fe80::59c9:fe0:25f6:702b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:41:12 +0000
From: Ramiro Oliveira <ramiro.oliveira@advantech.com>
Subject: [PATCH 0/8] Add support for Advantech EIO MFD series devices
Date: Fri, 12 Dec 2025 17:40:51 +0100
Message-Id: <20251212-upstream-v1-v1-0-d50d40ec8d8a@advantech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNFPGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mj3dKC4pKi1MRc3TJDXQtDY2OLZDMD4zRLEyWgjoKi1LTMCrBp0bG
 1tQAUh79LXQAAAA==
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, 
 Wenkai Chung <wenkai.chung@advantech.com.tw>, 
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>, 
 Hongzhi Wang <hongzhi.wang@advantech.com>, 
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>, 
 Thomas Kastner <thomas.kastner@advantech.com>, 
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127;
 i=ramiro.oliveira@advantech.com; h=from:subject:message-id;
 bh=tqrbnySbjMRENl38Nd4S48Y/BorR0TeZnjCANdZ+NzA=;
 b=owEB7QES/pANAwAKAc7t0Ke8vbAJAcsmYgBpPEWcFoSvX7yazNRXEe724p+7U7pEGW5e3KmM1
 oPYAb32SsuJAbMEAAEKAB0WIQS1Nkng0ZvJmBKh6GLO7dCnvL2wCQUCaTxFnAAKCRDO7dCnvL2w
 CcYuDADJyNToPIL5BmMJ3Hx2hGZOISjg93iuFZyC7dDJ8a1z2cw01WxKbwqSOofNjyJ2eL3fBRG
 XpOtKZNm/4C3UHovpgPNy//u/pZBo4Embr4yN0gm9Rmyjls4UP+0StOwHdUKcm/HddZiagVsVFD
 6mYZTSlsDKoCn5CvPAuPc0o01QHnJ/VWLdUSoNpOU8/6NTqo9s9abGhi8gn8Iw5TawgRwT8PKID
 iepQSuDmiCcbf1oArqKoK72XjL2McR/OxAtVed7qELCosWTG+6Q3YAbECIILkcIWZMUXJUJtMci
 VCIdc5RIDOdr/PArKnz2fzLL45KIW/sYMlTDVHsoQuOE6Qfg9WJL77gsAMn78gJRWWT1qZTCI8w
 fL42w55yPWBvZVObV6EbE32HaSiXbypPvsKhLGTiBFxPvr1aDHJ9jSH1Do8dCvusFi0RX3aC523
 BZdNTfBbdvfT8ccG3LWRggYpTCf6zOikA2uGtNlyJiSsQJrDfxnC28s1dYn8GUX/1BxEI=
X-Developer-Key: i=ramiro.oliveira@advantech.com; a=openpgp;
 fpr=B53649E0D19BC99812A1E862CEEDD0A7BCBDB009
X-ClientProxiedBy: FR4P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::12) To PSAPR02MB4502.apcprd02.prod.outlook.com
 (2603:1096:301:21::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4502:EE_|JH0PR02MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d4c07c-8167-4aea-9e91-08de399d4289
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0czeVFpN2VUTFhqenJyLzlFYksvU2lrd285bjZQZlNKNDBQMlJoSDJFVStv?=
 =?utf-8?B?aXYxZGdLcUdwTFVnR1NpZWdIc25NU1ArTC9JUWwyMHpKQ1gxTzFRSjhkT1N3?=
 =?utf-8?B?bFQwMHc5QXVjTS9zdUhDQzB2OExOcFgwR1czd0UrclZEMklZUkllTDc0Nm1H?=
 =?utf-8?B?dFR6aUFCdkY5RjAwc1NERTJtTGJ4VnpkZ3EwUnNIRGZCaXE3NXpsckRuK2M2?=
 =?utf-8?B?RVBzcmd2MlJnck96Rzk4VUFCVG93dWpKbXZ1bUpoOEVZenR0QWhLOElSelpN?=
 =?utf-8?B?Zy96ak1OOGhKMlBVWTgvMVRMem5XblV4S1phTHNFcWpiZkR6TDhKc2NIaWV0?=
 =?utf-8?B?N2o4SnEzOEQzdzFRN09nZm1nT1haYTBCL0FmYmNmb3VKU0UzUFRWaVNZSW10?=
 =?utf-8?B?Z09WWGhhb3VxZ3VWeHQ3ZVBlaCs4SkV4RCtFNXp4b1JHU2J0QWQzWWU5dzF0?=
 =?utf-8?B?ZDlQNjRxa21NWm9iaTBSWjdCaEdPRlUxR2tVVUxDR2g1cnBhVy82UVlBWVhn?=
 =?utf-8?B?V1luNmhDMFMyQ2ZMZXRWM2lFTmxNV1h2L1Z0R3loRjB3TmdjRU5VKzJUdWo4?=
 =?utf-8?B?WmNKR00xU0NPZmtPMHcwT1RYRmlTN2pCK2ZmbUpuZk1JdjllVEJrOWdoK0V5?=
 =?utf-8?B?WFArSDBFK1diNUtuL0g3ZGh2aEFXb3pzN0U2Q1Z3aGNOVSsrajNCMjlLYzhm?=
 =?utf-8?B?TEdxaTdQcWsvWVkvUFc1TFR2Z2ZnRE05NWFxT21ZZ1paZnJLc0Q0eG1VRFFD?=
 =?utf-8?B?T1V1UXZIRXR5eTZDVTB1cCs3bElHNXJtY2tBcW5uQVJVejRmL2o0b0orWGpO?=
 =?utf-8?B?MmhqVGhaeHJxOXZ1TVV0R1c0MkJsTEFWcXBaNFdudU83ZU9PNG9vd0xtMVVq?=
 =?utf-8?B?TURXUUk5K3k1VVk0TmYwQU5kZGNLeG1rcEp0S2NFcjFzOEQ3S0l1NjNRb0ZB?=
 =?utf-8?B?blZJdFVtbkVVUDZ5eFVCbnF2VGV3dFh3UmdzTnZpYkwzN09walZBSmMrSmFh?=
 =?utf-8?B?NmZiMkoyWVYwazFJVjBaMEplcHpFVXRxbDVhaHZVLzZ4ZWtIZXI4ZllId2d2?=
 =?utf-8?B?c2lqYkNjOEFqVjhRT0o4anREclJhbE91U3lXVjNDa2YxUWRTUnhneDJpWnU4?=
 =?utf-8?B?RFlLYWJXamNHMXc1SHp2dnQrUWt1M1AzSlZ2T3JvUWZZaGk0c2NGdEN6Z1lJ?=
 =?utf-8?B?Q0JJQURBdHl3bDF1NWxxeDJZS3RHV2hpVG0vMXBpWGt1ZndrZ2hzUTBpUmht?=
 =?utf-8?B?aDM2MDJ1aWF3VjAwRWdyeVJQSkN5UkdrY3pleUJqb004eCt2S201UjMwcTVK?=
 =?utf-8?B?RTFrbk5oZkZFWGJiU1A4NExBSkNybFZyR0V3ZmdiM3NZZ1h5ckhaaWRnYkdZ?=
 =?utf-8?B?bTdJamloUVFYc3l3Qms2UzZ3RUpnWXZ5dklIOC9NK3dQTXBiNnhIYXV1LytK?=
 =?utf-8?B?QkxROW5DWXk5RmFsTlNwTHNSTGExSmVWSk9YWk9zOFFwMlNqQngvUzVMWUli?=
 =?utf-8?B?Z1ZlZ3Q5RlcrNit6MkRyMStMcWtJMHJiR2ovMGZYNTFGT1lkQ1kwRldpZmNR?=
 =?utf-8?B?azR4ZkRWUjZ3TXk4RmVHVVduVjFiQW1ONHkzNUhVRFNLS2VjZjV5RmkyVFZj?=
 =?utf-8?B?dzV0R1NwNWV4Y2hBbjIxSUlXaFpMRm1lM0VYOXlGVVl2UWh1VmR1c2szeW9r?=
 =?utf-8?B?MXAwNndtODRGMjNDY1FQc01aRGNITUtreFpsWTJmWHROdVNTRzhENjBUc0ta?=
 =?utf-8?B?Nmp3azhMRXRhVHcvSDhaOFlsbGtadHdlcU9LUGFYR2t1QWlJNjVFVUd1ZWFG?=
 =?utf-8?B?Tjd0VjdtNEpNZFpsdVJiMnlDdFo3YVkrSThyck1VMXNtSW1kODJncWVUN3Q2?=
 =?utf-8?B?ZnV2aHdGYU5pS0dRbzNDTm94Y3o3cVNUMmFxL3JKMm9YSXBjUHQzcDRlRjcv?=
 =?utf-8?B?bW1RNmtnWDBiWnJ1Z1cxYjRNb1AybVBoL2QydnoxZWRQSWI3UWZIUHB2Q3Nl?=
 =?utf-8?B?WERYVUcySWpmMmJHNVl0YytlcnJJd3RJbzh3MnNQNm1hcVJhNXFQUmsvOFdz?=
 =?utf-8?B?b2JIR2pnbWttUWhmbEV0VEhFRzY1ZWlBSllRZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4502.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzdWcTVycnQzR2xuSmlMT1I1MGJ6WENCZHg2Wnl4bHdpY1VvTzlZUThsMHdk?=
 =?utf-8?B?bVBoWmVPRy9HdVBVOHJVb2lhSkJrRjluQ2s2NmxncUZvSk40UVloOTQ5clpu?=
 =?utf-8?B?d1FhRUN5bmlVUDlvYlBUM1ZJd0FPc0RvaUVtdldGMm4xa1A0N2ZGYTQrcTRC?=
 =?utf-8?B?WHRITHdOK3N2eStiMjBTR0w1WHZ5bFVXV1VhU295bExnZlcyTHJhV0dNWERh?=
 =?utf-8?B?aXVScnAwanl0Z0pjeFhpZUU4M2pNdy9Ta1A0ZndGcGFzTmM3SENJOUpXdzEy?=
 =?utf-8?B?TlN5bXRhZzVmKzV0WU9TTWp4TUw1VHlLUlF1YUp1RkdZVld0NEZIY25LQ3Bz?=
 =?utf-8?B?cnQxSnd4MTcyTHZvdEliemZmUVlZL0cxdHlENFRFMXNBWTdmMU5XdzExOWly?=
 =?utf-8?B?enRIT25OakM3Z01MUE42ZVQyTVY0ZnpjSmROL3hWU3Q0SThwbG5zQnZnOW01?=
 =?utf-8?B?aGUzaGxpWmFjYmxPcDlBWHBmWXhpdytZcjlWeWJvMjROd0NHT1d0LzVWaG9j?=
 =?utf-8?B?RkdibGt5U0kxN2xGTExDbk9pUkdqOXhrN3JCVGxoTmdkUXlnY256RXNJZERv?=
 =?utf-8?B?Y3J3ZDVlRDFPQWpxZUZUUTIzMVpGRGM3QjBhTVJxZHdpcUtuYzByVG9rb1RO?=
 =?utf-8?B?N0thWE5wdXVlbFNBb055a3pXREUxNG5PT3Z6ai8zR2wvRlJ4bTZ5MEg1Z0ti?=
 =?utf-8?B?U1RmS3BHNG55UVJCUzZOcjhWZTErT3UrQ0JzdjBvWXlQSWdITTU1T2llaGxC?=
 =?utf-8?B?Q29qaDJ5d2dqQkZBOERhSXpCc2xFT2RtdmZtTS84U3VRRlcwMWEvOTYwdnpF?=
 =?utf-8?B?QWs1ak9ZOXVLMEExZExWcE1yYTB5OGxTVWtOdGNnSzk1VXNMZVRucGdUWnpQ?=
 =?utf-8?B?OCtoNGlvKy9LZFcreE5veWpJaDQ0anQxaWdKaFNCTDhLWFE3SDd4YmJzNkV3?=
 =?utf-8?B?UmdsdVZLQ0VtRGVOS0dVUFVlbVRqNzFHSkthM2gyblN1ekxURmdTYmRIL09z?=
 =?utf-8?B?MW0wOTdUclRqSzZFSktoOGZzaWJMRlpHN1BBU3pEaTFxSGNTUFphRVRsRVhk?=
 =?utf-8?B?OE52VU1iaWRsbEF6VlBKZFZNRDllQzlmS2FFZk5RZTAwQk52aVZRbE9QUW4z?=
 =?utf-8?B?bm1ESTdpK0hpMlhXTDVxWk40NkdVWWdZcTFGMEx6alBycTFMTCszbGZyOUlE?=
 =?utf-8?B?Z2dNZmgyVGJIWHMxNWFnc0xJUDQ0ZEZCSEJadnlWakMzWmZVQjJia0p4eU1D?=
 =?utf-8?B?Z090MnpLbURNb2pkUXU3dllwMmdVNm1QcEZwdkZxMy9TajBkdjgxZ2VxN2Yv?=
 =?utf-8?B?dkFCQU5KYzhxQXlsejVicG1YRUhyejRZVHNuRHQ4Q2tpSkRLenBDb0p4VG9X?=
 =?utf-8?B?a3UzSzJMdzNOalVoZEU0YjZHbk1LOSsxM0NpSlhDM0JZSW1BVU1CWlJJQUFt?=
 =?utf-8?B?WmtVaE1ZaEs0em8xNkdCY1F4MXRaZHVaYzJDcHpIS3R1eFVORVFRNmczSFpJ?=
 =?utf-8?B?ZEVLWnZRekF3THNhc1BBalZ6b1RUU1dDR1pLZVAzdWFBc2JkM1I1ZjdxZEYy?=
 =?utf-8?B?T0NRMnVadWJtRG9QbVRpTVJSdXlLRzdCUndzNkJKbXhzVlBVRmhlS29pTDRT?=
 =?utf-8?B?UGowUUFVd2h4SkgrMUNHZzRaaVdGZXNMd2dvMXRqckwrWFpkc01GWUpHTUND?=
 =?utf-8?B?Y2M3ZjA3SmNFbXpwWlFsN2piWGloSnRsbndlSmRGRkVXWG85bUdoZUVCZFY3?=
 =?utf-8?B?MEMrZnI1THRQUGg1emkwWk1obzkxTWdqUG5uQUlpMlRJYXREMHlDUmNjaERN?=
 =?utf-8?B?UUNYd1JiblNJQzBzYWdLVXl2Mktla2Vwc3BjNDQvTVN3TEJyVkNwNitFd0l6?=
 =?utf-8?B?a2grZW1UNnZTcUFLTFhLZGpQRDZ1Q2NEVTY4SlY0cE41YWxKVEtUejg1ZFps?=
 =?utf-8?B?VWZUV0xXYjZCcWRYdWR1NTdDOENXRVhyb0IrVlFJTmJpZkdTWUhPMU1Wendm?=
 =?utf-8?B?dlFIT1poa0dibG8reWxuY0JHV3ZNdnVlY0padUxWeHBCUFI4NUh5OEgwaXJ5?=
 =?utf-8?B?WWRmU2ViVXl1QThoOWFMc0JkM1liZUN0RmtMdzJOTW1ybWRkTm96SlpTMFpx?=
 =?utf-8?B?RWRZdDE5aUJEY0h2NEJ0bmhyVjFkck5DSFJybnRWM3pNQS9xdUNObytzbXpC?=
 =?utf-8?Q?xMjIwQD5hWTD3XaIngXOc40=3D?=
X-OriginatorOrg: advantech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d4c07c-8167-4aea-9e91-08de399d4289
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4502.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:41:12.4025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TVYUEO4yKp0UeH+FPUknd8qdUHr9JlXCDv50e9Hs/s74Huanso69J7TdPJDhIfx94DY6g5wSlw3hqvfIoyNyxmsjZ7jtEw2ov2IWNSI5KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB6564
X-Mailman-Approved-At: Fri, 12 Dec 2025 16:49:07 +0000
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

This series implements a set of drivers allowing to support the
Advantech EIO-2xx series of devices.

This includes GPIO, hwmon, I2C bus, backlight controller, watchdog,
thermal and a fan driver.

This series of patches targets several different subsystems, but the MFD
subsystem is the main target.

Signed-off-by: Ramiro Oliveira <ramiro.oliveira@advantech.com>
---
Ramiro Oliveira (8):
      Add Advantech EIO MFD driver
      Add Advantech EIO GPIO driver
      Add Advantech EIO Hardware Monitor driver
      Add Advantech EIO I2C driver
      Add Advantech EIO Backlight driver
      Add Advantech EIO Watchdog driver
      Add Advantech EIO Thermal driver
      Add Advantech EIO Fan driver

 MAINTAINERS                      |   13 +
 drivers/gpio/Kconfig             |    6 +
 drivers/gpio/Makefile            |    1 +
 drivers/gpio/gpio-eio.c          |  273 +++++++++
 drivers/hwmon/Kconfig            |   10 +
 drivers/hwmon/Makefile           |    1 +
 drivers/hwmon/eio-hwmon.c        |  344 ++++++++++++
 drivers/i2c/busses/Kconfig       |    6 +
 drivers/i2c/busses/Makefile      |    1 +
 drivers/i2c/busses/i2c-eio.c     | 1142 ++++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig              |   10 +
 drivers/mfd/Makefile             |    1 +
 drivers/mfd/eio_core.c           |  621 +++++++++++++++++++++
 drivers/thermal/Kconfig          |   17 +
 drivers/thermal/Makefile         |    2 +
 drivers/thermal/eio_fan.c        |  490 ++++++++++++++++
 drivers/thermal/eio_thermal.c    |  352 ++++++++++++
 drivers/video/backlight/Kconfig  |    6 +
 drivers/video/backlight/Makefile |    1 +
 drivers/video/backlight/eio_bl.c |  268 +++++++++
 drivers/watchdog/Kconfig         |    7 +
 drivers/watchdog/Makefile        |    1 +
 drivers/watchdog/eio_wdt.c       |  672 ++++++++++++++++++++++
 include/linux/mfd/eio.h          |  127 +++++
 24 files changed, 4372 insertions(+)
---
base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
change-id: 20251212-upstream-v1-81338c603f94

Best regards,
-- 
Ramiro Oliveira <ramiro.oliveira@advantech.com>

