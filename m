Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9ECB0F86C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 18:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C6C10E82B;
	Wed, 23 Jul 2025 16:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="E400n66J";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="bnP4j5bT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E949B10E82B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 16:50:29 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 56N72ihW3363460; Wed, 23 Jul 2025 17:50:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Nry3Nx8bmPSBZUGODpBA7vtNy
 8bA7Dyp6v+2r6shdHM=; b=E400n66J0hGzYE1wIgme7rqwHVAr/Er76eX+7M/BI
 tjRisETkMn5hUQqbMl1FKwcDolwmsp1rXPpYvDk1fkiOKbRmrVl7ywo3I1eOCXAZ
 OuoSQcagQFBEafy3/nUYU7BPSXqsHryFQgelZz5cbvdEzxbMqtx0H1OBRZy3zsJm
 eEWEHHy1VfwdYX19uOkMd7XsT70ULXU3UMO5vx/Oi4iTOu/YB6Uz3Y52KOlyYfpQ
 wqxyob6Vo0nD/JvnFK491F2LhkGh5Z0pVWju009T0UJqsGxeXKQ1xz1pVXWgH7al
 TZ+WBQXPZQVSCLMZjawL/9zMMBg+oLNM0b7l7B9Bvnbfg==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022117.outbound.protection.outlook.com [52.101.96.117])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 482jw50w99-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 17:50:10 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j72Skio4AgYgYuzx1bYDiqV+DSS2+6chVLgJGnJO2wQ2rxeFZtCrXnLj6lnzNxjytFjz3bww2LVbxti/tbLC/BzuACszVCSZWCofp5bHVQjTlo/COPiQrH5HoRNUyy1eUi4WfT+3HyCc0IwgwFZTWcBaWM5/I6E47R04sLp3YENHAmEsgFNikE6Ldq3IkCECpyici4E4rQ5Fj6DLMGQq+K1Og1ueCy++qx5eI36Wp2iVOGvERSvCkWobRPrsAVyQ2RsHFbagoeuFMMd8/+yMmuLWefFmff+OtfQqNM6rH6Ak9pkgMkyyaBE/iAdHfPYYjyJrLv/iGPROsKaFmv1qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nry3Nx8bmPSBZUGODpBA7vtNy8bA7Dyp6v+2r6shdHM=;
 b=oxuWB86CwTJ7xyrdMofKdK2XI6+JxCW5o0Zt4+GEENyfpyeBlqTW/UfyiYc8bB+rmS6dhYHIbDxRdkU86rTa3BRj+gXVYaPGJ/A/6VSbyZpPLOTO5SD5aUWS9kktQ7qpmmDPLVjuvpC4ECSvv1OoMSeAeb3kDiFNZHd7YxfrwGZ8wfzv3G3GCz5D2SMJbluGbHzfQPPcMT/uqDRQU3Lju0iR+l4S4JKSBkC0evrNMu/c+4gF6F6AppBFCKEf/w0HbG3+RuoqgxzMk8bUBSCHpDLGCcRVdNYIjdGaDF23Mc7sLiVZI/zrcfep71+TI6PSHiBCbEl7jGzCbW/cTjKpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nry3Nx8bmPSBZUGODpBA7vtNy8bA7Dyp6v+2r6shdHM=;
 b=bnP4j5bTnMjkMFM1WDAylFA9jHrcDvCg+ojFB2Fbsstlh91XpB5VtjBlIaxlUdRFy9/96GT9Q22Ty1Mz0n7J1+/RKs0SvKotMvi5551eMbVuCPKOo2sQdPwjUqzFy0lB7oboPrG44XNFCixxM/j88J+bc7rJGYbk0WI/Pq1sTus=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB6233.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:279::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 16:50:08 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 16:50:08 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Topic: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Index: AQHb+/HY3yjK/tPz4UisMcpCn+Norw==
Date: Wed, 23 Jul 2025 16:50:08 +0000
Message-ID: <9c4f962d-6877-4a53-b0f3-218930f94e1e@imgtec.com>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
 <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
 <f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgtec.com>
 <491b69ce-5a2f-4df1-95af-9318bbe6c9b0@samsung.com>
In-Reply-To: <491b69ce-5a2f-4df1-95af-9318bbe6c9b0@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB6233:EE_
x-ms-office365-filtering-correlation-id: 27704dd4-980f-4eb7-01ed-08ddca08fb5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TnowU1pNUE01UkgvSHJraWVvVjF3Mkg4VGEwY1VJY3lsTjI0dnNZd0JyZXdv?=
 =?utf-8?B?dHZsZEt3S2wzL2FpaVdBRmY1a1VvMlZwamJ1czA0RlFPQjFwc2thZ0U1cmg0?=
 =?utf-8?B?bWo2d2hTa29ZSXVyV0pPRG56VEVvTVR4cFp6MGNad201QVZvV0JnZVVpeGpk?=
 =?utf-8?B?UWNrTHV6VGM0VHR6TmVSZWdWRHlpZVc3bmN1SUxZYk05T2xFZ0VDWTlObnpt?=
 =?utf-8?B?VlRlaHRVZjZxdmM5UldOSnNEMmdVWG4vQmc3RFVtR2UzQ3hUS0pSYTNYb1JE?=
 =?utf-8?B?T1I0M1NTa1F6L3hmSDhvdlRBWFlqQU5GM2ozaE00ak40dS95b3JnNFYyUTdH?=
 =?utf-8?B?MzBWOGVvNGJaTEhDay9KNTFMdjhIWDE1bDM5bWJTVnpZVlFEcmNNRm8wOGN5?=
 =?utf-8?B?VW5aRjUxSDV2L2phcnZBUVROTTR2dG5KVGtPRkJhTW9xMUNiUC9zOUZtV2s1?=
 =?utf-8?B?NTgwVG0wckUxWWlza1VQOGxWODlaMTU1dmlrUm9lcndrTm1tNzdRTFVTZytF?=
 =?utf-8?B?Um9zQlRXdDFnaUhQT2JZOWYwQXpBd1lzem9jeDdEQlRDVE9MR0h4V1poWFI5?=
 =?utf-8?B?YlZUTmdIUDRibk84NWNhcWxmVWhLSzVQNGVQMDRGK2JudENvSG1lZ044OFVy?=
 =?utf-8?B?bDdLUlRGQ0pYU3hNa3lOdC94RzFKUDhsdDZpS3NadUZtUHFJK1lObzd2MDJo?=
 =?utf-8?B?QzUxU3JQRklPWDlBT3JDVzBvTHZZTXJ5S0xxSFRMRXBmKytrM2Y2UEdPV3Nt?=
 =?utf-8?B?T2ZDOUxVekVHSzE3T2pGdjFGNU9XUStzaFRIMFVIVkdCbjlOcElRbk9jRkZk?=
 =?utf-8?B?MDVwVkd3VTJldy9Gb0Y3WjBPdmM5V0xMQ3RCT0pXRUl6VWQxUTJDRXZDZ0Nt?=
 =?utf-8?B?RkhLWVMxS1B0MHhoTE1RWS92R09YM01nRmdrVW1BaU1SVVdQOU94OW1PclFQ?=
 =?utf-8?B?R09BdU1tdnNyVS9zQWRMaVc4dXVoWEwxaGV4YTFmYUZtdGduS1M2QmZHSG55?=
 =?utf-8?B?cm1vNVV3ZlNPa2pFZDlCalJxaTkvQk9rQTdZUU53WXlhQTlMTyt6ckljWU5a?=
 =?utf-8?B?c2RzQ0NCYXFVVnBRNXFjMjdJWmw5dnd6eWFJaDZyS3ZScU5KejJOWURSeDdM?=
 =?utf-8?B?bWlyL01Nd1ZaVzNlUndlUFR4blpva0kvNG4zQkJ4OFVsUHJ2QU9qeW1wR05o?=
 =?utf-8?B?bVBJN2tXQkE0bHlBN1Q5akFFSHZCTFUrZklOcy9YTVVZdjZSYURQbFZsOUVq?=
 =?utf-8?B?R2F6QkRFREZtNFlQcEp2UHRYQWJUWUhyOEt0RlJBZWpsdmN5c0dhak10dVdl?=
 =?utf-8?B?bTFSaGNKcHM2cDgvVVlUM3U0WkhCNGptWkVGSk5YMVBkK3NGRE1GT2VWcFls?=
 =?utf-8?B?SzJlV243T2Z0cVJUanIxL3p4L3JHbXlKZTRGZ0RDYW9tRUhIZnlET0VPRmU0?=
 =?utf-8?B?cFA4QkZycFd4U2VGcEhiMXBjY1BITllGWVVHWHJzZUZQYXorSWV5NFAxU0NV?=
 =?utf-8?B?S0ZNNU45M29qcnhzcHBLajl2czczdng0TzNOOEx1VktHdXhmL0o5VGcvMlBG?=
 =?utf-8?B?MVhQQ0FmVzdYYTI5UlpNNG1zMUpjekFSeXJVZ0VtZ0FFZGdROXE3ZzV3ZThE?=
 =?utf-8?B?aUJYMVRwbXZ4MGpBN2ZhRjFBeUhGTzV2T1N6VEU3QmlsbDhNMU1FcksxQjhJ?=
 =?utf-8?B?UnY2dFBsMDhQaERJOTFnMkgrbmtOQlY0dmcrZDJxaWZFbFZWSHlRTWhmQ3hC?=
 =?utf-8?B?MnV6d0QveEZxOC9ocnVvT25nTlg2bnYzNmVSOENTTUh5b25GT09QRnIyY2Yw?=
 =?utf-8?B?KzdHWXhFUm9TcXNTcHhxT2o5dmpPUGh5ay9vaDR3VGxYYk5HbjJtZkRVci9u?=
 =?utf-8?B?VEFrSTNkZjFHWGxNYlJMVDNHRVAyR0FlUmJXRmYwTm5SbkE0Zk1EKyszY1hJ?=
 =?utf-8?B?amxITFE4WEtwRjRyRUZ3azZaWkNVTnNiZmwrbnhIZy9xQ05wZWZIazBMcDB2?=
 =?utf-8?Q?L/Yow7izlRK95/a0RzxwkEuwdP2qBg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmdLMVQ0eVZSWmtIS3BIRDZER0FTRFZUYWxLRDY1TVNFdGZOMmJBVlp5TWpk?=
 =?utf-8?B?YksvK2JjdFFSOStYYjhzNWVteVMzT2xqMy92M1F4aHFwVXhmNXdIVHBhTWVD?=
 =?utf-8?B?NFVRc0JLRDFzdWhWdXdvOXVtWHdiVm9xTURkMXZLTVpjMXJpL3djUFBCSFdp?=
 =?utf-8?B?c1ZTTCs3c3orVCtiV1lxVnpzSzhLTytxeU5RVk1qYVY4VWh5L0xWWlZ2bmE1?=
 =?utf-8?B?T2g1anZOdGNQZ1FzMC9kYyt2UWI1djd3a1U5Ty96UFZZMDFVeHhOQWEyNDVH?=
 =?utf-8?B?MkgzMmh3RkJoeEdVdUFlNUxhNjJsYkcxWHFVa01RMzQrakVZb0l4cjRjajFL?=
 =?utf-8?B?eC9icC9UdGJLbmNtM2UzR3lPbVIrYVNSWk1Qb25OUnY5dUlFR2pFZTBTVitF?=
 =?utf-8?B?K0VwNmZJQ3lkQ1c2MXVYemMzbDVxZFRMeFpvWEl6TW80SVp3VysvZnA5eWlT?=
 =?utf-8?B?SndSYUhuRkJSNUZkbHZNVk9VQ1RBMHZMckV2T01OZXJYNHJ2NXgzWmRxbWFC?=
 =?utf-8?B?NE9lR1JjdDlicDZMd1FXTUFjZEJmR0RiRzNSTDkzdGZsazVNeWNDWnFCeGpq?=
 =?utf-8?B?ay9wNkZQb01qSll4QTBWU3dLTFkrd1pSQnhPaGVjTk0wYU0yUmdzckV0NlNV?=
 =?utf-8?B?OFJYM0ZqNnNBRVZJZks4MCtCYURFLzc5eWtJOHBaL3FSRENoN2xPaTNaRVNS?=
 =?utf-8?B?Titmb0lFUld1Q2tvN1NBcU5Lam5LdWVjMVY3UzdCTXN5VVREQVI5bFFjVmVS?=
 =?utf-8?B?UCsvaTIzUkZkSW03bElqc0tVbkdXVEx6TFNpSElqZnExRTFXd0UydU1pT0hj?=
 =?utf-8?B?YUdYZFAxRmVlcUNraFk2OVQ2UVAyUkc0aEtSNyt3ZDRaRWtGK0htZTRmbi92?=
 =?utf-8?B?K2FySUE3NFZHclVmWUZIQWZnYkxjZTNyWGJqbk9nYitVVDJ0aGkzZGJlK2NG?=
 =?utf-8?B?bVJqRkpwWlVEcm5XNGdOUUpCdW5MWkV5eG5maXJwaUcrSHVxeXRRZzNuM1lw?=
 =?utf-8?B?c3pNK3Z1cFpncS80UldZOGRGc1g2dXFsRnFoVkxNVTNXR2JjMXBMditoNDhj?=
 =?utf-8?B?Ri9oekJjV0Q5c2t6bjI5OHl5TCthL1ZDVXhFK0lvd2FLM1dQZUVPdjRKamRL?=
 =?utf-8?B?c1crWlhyRmJFT2VXQWJwNEc2N2hOcHRwWDhCM2tCY25mM3Q4MVpNUkQyZWJx?=
 =?utf-8?B?TVdnTFAxVjk2eElYR0NiMHVhSXZoOE54c2NDVDU4YnZnYnRJc1cwdnVrV0Vp?=
 =?utf-8?B?b29KSTlLT3N2RFpaaVJ4YWhUUWJ4NE1vYUlwYkE5bEJOLzc0Y08yN2JuOU0r?=
 =?utf-8?B?TlVxS0VoZTc3bDFENEYxNzRCWUZwclpJZzl5a2h2LzIxNnlkdEhTeVRMSXl0?=
 =?utf-8?B?SWE5VTRMQ1owR1BRSW1MbmJod0JIZ2N4aENJRlA1NmQ5RktwNW5CY0lGQ2Mr?=
 =?utf-8?B?QTZwTEVHdlU2c3VpbGdicVFlT1JRSElOYlZScnpRRE5mcVJJZmNpbkNaSFVn?=
 =?utf-8?B?VllscUsrL1VLQlR6Ym41cStySWpGWWRZL1lJM3g5TzNZT3owSU5YSEsyMTJv?=
 =?utf-8?B?Z1pRVUs0M0tRWDY5b3Zrb0RhSG1sUGI4dXMxRUxzNHErbWEwN2VVS1Rkai9n?=
 =?utf-8?B?QStCWlRyMlYvMm1sN3JFK1ZMNWptRTVTTnl2UUkrdTY5Mm9rSGRudzd0RmdW?=
 =?utf-8?B?WFFNSDVGYkVMeTB6T1pqaEt3YVZpQjlMRkIrS2ZhTTZVWlgxMWgrTTJrclov?=
 =?utf-8?B?YitzWkxtaE1oUE1laVVjVUl2VTZ6eWVyLzhabCtsNSs0SXN0bWtEWEUxWE9n?=
 =?utf-8?B?bVdPRTFmcmo5bHlONXVhTXFzaXh5UkNqTkV4YzY0R3NyNnFxYWhwUUtBWjM2?=
 =?utf-8?B?QkdONFFDQnhLK0VtTEswRmUxVHRnK3pOaGVxT2NNWGlEcE5EZ1JJNWxucmw0?=
 =?utf-8?B?NmFzbVg3QWpha3ZnY0E4RFd6Wm5yMGwwSkczY2FxTEx0b0hUT3RUaGxaekRq?=
 =?utf-8?B?QWxzdm81YjZpSXNMZnE5SEk3eHcvOTN1cjNTRmxXamVWWld3WTgrSXlYWU5W?=
 =?utf-8?B?Yys0OWI5YU53Z1hwMHRRdlY1Mnl3VFhUVk5xb0FZbERGYmVidmVCLzBTaFRw?=
 =?utf-8?B?UmNvT0hIb2EweHltcndHMnM4UFQ3L2hjK3FoVDdraGZiTW5sOHgxd1RockNL?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dXE0PDKVknsoEtR4e6oTSdv5"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27704dd4-980f-4eb7-01ed-08ddca08fb5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 16:50:08.2209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpSoaFrGce8PBh/M3Svd1lIkJ53F2W+MHY9sDjHUTAlnLeaAPxpsvpqWai/XUG4xIWzDhO5CzaburtuqLBKWog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6233
X-Proofpoint-GUID: r1QTU9oBosnM3Y-HQWQ1zBCrjpoX_Fzu
X-Proofpoint-ORIG-GUID: r1QTU9oBosnM3Y-HQWQ1zBCrjpoX_Fzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE0NSBTYWx0ZWRfX9TgN0Hl+hkv5
 FwhdTewy2HIFfaMVCWdxgXFREkY+DZud1T2PDi8CXr2hggoWo057tghKAmsSmLVzZEzGXndy4h2
 KepaT9j4NqjCES5N4pJ3F97t4imcyqo4vI3ERQR8tDpSlaCXzHkWMWmrblF6wyCA4U/rL6X9P6t
 2amqMPFWhz4jf3+lvdS8v4x4bkQdVzZ3WduDszDnJQ7udaXjoJOWYp+mX8YesJkJKqbc2itRhB2
 cqEohYyK9MnKURSvErF5/sXDIOQyuxZCgFzKjIYCUWyJb/MgkB3abrSTt221rjk4MEFXvOQFBkx
 WPGMx5ZfPO1ra47o7CZ4lP3WkwRgsCxZVCg/khJMTqSvgLhgG9vcCthMNPfirq6eldldfcJ9ODm
 uEK+P/4F
X-Authority-Analysis: v=2.4 cv=dp7bC0g4 c=1 sm=1 tr=0 ts=688112c3 cx=c_pps
 a=Z8r6FvoT1MCTxwa/Qa2FPQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10 a=KKAkSRfTAAAA:8
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=RJVilJnTEiqgVUiCq00A:9 a=QEXdDO2ut3YA:10
 a=io5peLPV2VESA3Ho10kA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------dXE0PDKVknsoEtR4e6oTSdv5
Content-Type: multipart/mixed; boundary="------------KIDoU6Hyq0NyMaoFf7FlrZKt";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <9c4f962d-6877-4a53-b0f3-218930f94e1e@imgtec.com>
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
 <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
 <f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgtec.com>
 <491b69ce-5a2f-4df1-95af-9318bbe6c9b0@samsung.com>
In-Reply-To: <491b69ce-5a2f-4df1-95af-9318bbe6c9b0@samsung.com>

--------------KIDoU6Hyq0NyMaoFf7FlrZKt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23/07/2025 17:26, Michal Wilczynski wrote:
> On 7/23/25 11:45, Matt Coster wrote:
>> On 25/06/2025 15:41, Krzysztof Kozlowski wrote:
>>> On 25/06/2025 16:18, Michal Wilczynski wrote:
>>>>
>>>>
>>>> On 6/25/25 15:55, Krzysztof Kozlowski wrote:
>>>>> On 25/06/2025 14:45, Michal Wilczynski wrote:
>>>>>>
>>>>>>
>>>>>> On 6/24/25 15:53, Matt Coster wrote:
>>>>>>> On 23/06/2025 12:42, Michal Wilczynski wrote:
>>>>>>>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 S=
oC's
>>>>>>>> specific GPU compatible string.
>>>>>>>>
>>>>>>>> The thead,th1520-gpu compatible, along with its full chain
>>>>>>>> img,img-bxm-4-64, and img,img-rogue, is added to the
>>>>>>>> list of recognized GPU types.
>>>>>>>>
>>>>>>>> The power-domains property requirement for img,img-bxm-4-64 is a=
lso
>>>>>>>> ensured by adding it to the relevant allOf condition.
>>>>>>>>
>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>>>>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org=
>
>>>>>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>>>>>> ---
>>>>>>>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | =
9 ++++++++-
>>>>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-r=
ogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>>>> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc=
58a1e23970f6d3773d427c22 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml
>>>>>>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml
>>>>>>>> @@ -21,6 +21,11 @@ properties:
>>>>>>>>            # work with newer dts.
>>>>>>>>            - const: img,img-axe
>>>>>>>>            - const: img,img-rogue
>>>>>>>> +      - items:
>>>>>>>> +          - enum:
>>>>>>>> +              - thead,th1520-gpu
>>>>>>>> +          - const: img,img-bxm-4-64
>>>>>>>> +          - const: img,img-rogue
>>>>>>>>        - items:
>>>>>>>>            - enum:
>>>>>>>>                - ti,j721s2-gpu
>>>>>>>> @@ -93,7 +98,9 @@ allOf:
>>>>>>>>        properties:
>>>>>>>>          compatible:
>>>>>>>>            contains:
>>>>>>>> -            const: img,img-axe-1-16m
>>>>>>>> +            enum:
>>>>>>>> +              - img,img-axe-1-16m
>>>>>>>> +              - img,img-bxm-4-64
>>>>>>>
>>>>>>> This isn't right =E2=80=93 BXM-4-64 has two power domains like BX=
S-4-64. I don't
>>>>>>> really know what the right way to handle that in devicetree is gi=
ven the
>>>>>>> TH1520 appears to expose only a top-level domain for the entire G=
PU, but
>>>>>>> there are definitely two separate domains underneath that as far =
as the
>>>>>>> GPU is concerned (see the attached snippet from integration guide=
).
>>>>>>>
>>>>>>> Since power nodes are ref-counted anyway, do we just use the same=
 node
>>>>>>> for both domains and let the driver up/down-count it twice?
>>>>>>
>>>>>> Hi Matt,
>>>>>>
>>>>>> Thanks for the very helpful insight. That's a great point, it seem=
s the
>>>>>> SoC's design presents a tricky case for the bindings.
>>>>>>
>>>>>> I see what you mean about potentially using the same power domain =
node
>>>>>> twice. My only hesitation is that it might be a bit unclear for so=
meone
>>>>>> reading the devicetree later. Perhaps another option could be to r=
elax
>>>>>> the constraint for this compatible?
>>>>>>
>>>>>> Krzysztof, we'd be grateful for your thoughts on how to best model=
 this
>>>>>> situation.
>>>>>
>>>>>
>>>>> It's your hardware, you should tell us, not me. I don't know how ma=
ny
>>>>> power domains you have there, but for sure it is not one AND two do=
mains
>>>>> the same time. It is either one or two, because power domains are n=
ot
>>>>> the same as regulator supplies.
>>>>
>>>> Hi Krzysztof, Matt,
>>>>
>>>> The img,bxm-4-64 GPU IP itself is designed with two separate power
>>>> domains. The TH1520 SoC, which integrates this GPU, wires both of th=
ese
>>>> to a single OS controllable power gate (controlled via mailbox and E=
902
>>>> co-processor).
>>>
>>> This helps... and also sounds a lot like regulator supplies, not powe=
r
>>> domains. :/
>>
>> Apologies for taking so long to get back to you with this, I wanted to=

>> make sure I had the whole picture from our side before commenting agai=
n.
>>
>> From the GPU side, a "typical" integration of BXM-4-64 would use two
>> power domains.
>>
>> Typically, these domains exist in silicon, regardless of whether they
>> are exposed to the host OS, because the SoC's power controller must ha=
ve
>> control over them. As part of normal operation, the GPU firmware (alwa=
ys
>> in domain "a" on Rogue) will request the power-up/down of the other
>> domains, including during the initial boot sequence. This all happens
>> transparently to the OS. The GPU block itself has no power gating at
>> that level, it relies entirely on the SoC integration.
>>
>> However, it turns out (unknown to me until very recently) that this
>> functionality is optional. The integrator can opt to forego the
>> power-saving functionality afforded by firmware-controlled power gatin=
g
>> and just throw everything into a single domain, which appears to be
>> what's happened here.
>>
>> My only remaining issue here, then, is the naming. Since this
>> integration doesn't use discrete domains, saying it has one domain
>> called "a" isn't correct*. We should either:
>>
>>  - Drop the name altogether for this integration (and others like it
>>    that don't use the low-power functionality, if there are any), or
>=20
> Hi Matt,
>=20
> Thanks for the detailed explanation, that clears things up perfectly.

I'm glad I could get to the bottom of this one, it was bothering me too!

>=20
> I agree with your assessment. Dropping the power-domain-names property
> for this integration seems like the cleanest solution. As you pointed
> out, since the OS sees only a single, undifferentiated power domain,
> giving it a name like "gpu" would be redundant. This approach correctly=

> models the hardware without setting a potentially confusing precedent.

That seems reasonable. I was very much on the fence for this one, so
I'll happily go along with dropping the name altogether.

Just to make sure I understand correctly, the change here would be to
move "required: - power-domain-names" from "img,img-rogue" to every
conditional block that constrains the number of domains?

Can we add negative constraints in conditionals? Then we could add
"power-domain-names: false" to the "thead,th1520-gpu" conditional block
alongside "power-domains: maxItems: 1".

>=20
> To follow through on this, I assume we'll need to adjust
> pvr_power_domains_init() to handle nodes that don't have the
> power-domain-names property. Does that sound right to you?

You should get away without making any code changes here, since we
already shortcut on "domain_count <=3D 1" to just allow the pm_runtime to=

deal with the single (or missing) domain directly.

If we ever start controlling the individual domains ourselves from the
kernel (rather than just ensuring they all come on and off in the
correct sequence), we can add checks/handling for the no-name case then.

Cheers,
Matt

>=20
>>  - Come up with a new domain name to signal this explicitly (perhaps
>>    simply "gpu")? Something that's unlikely to clash with the "real"
>>    names that are going to start appearing in the Volcanic bindings
>>    (where we finally ditched "a", "b", etc.).
>>
>> Cheers,
>> Matt
>>
>> *Yes, I know that's what we said for the AXE-1-16M, but that tiny GPU =
is
>> the exception to the rule; AFAIK it's the only one we've ever produced=

>> that truly has only one power domain.
>>
>>>
>>>>
>>>> This means a devicetree for the TH1520 can only ever provide one pow=
er
>>>> domain for the GPU. However, a generic binding for img,bxm-4-64 shou=
ld
>>>
>>> If this was a supply, you would have two supplies. Anyway internal
>>> wirings of GPU do not matter in such case and more important what the=

>>> SoC has wired. And it has one power domain.
>>>
>>>
>>>> account for a future SoC that might implement both power domains.
>>>>
>>>> That's why I proposed to relax the constraints on the img,bmx-4-64 G=
PU.
>>>
>>> This should be constrained per each device, so 1 for you and 2 for
>>> everyone else.
>>>
>>> Best regards,
>>> Krzysztof
>>
>>
>=20
> Best regards,


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------KIDoU6Hyq0NyMaoFf7FlrZKt--

--------------dXE0PDKVknsoEtR4e6oTSdv5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaIESvwUDAAAAAAAKCRB5vBnz2d5qsB7c
AP40Rq4/1Q3nnECslH5ueXKDlr3OeU4xkWYTaVkspXcglgEAnkaEUuNyALc1kBrslCWD2eF1vnce
K47RHWa4SbX8Rwg=
=LvfX
-----END PGP SIGNATURE-----

--------------dXE0PDKVknsoEtR4e6oTSdv5--
