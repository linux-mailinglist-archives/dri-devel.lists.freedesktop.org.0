Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B878B0F00B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A3010E7A2;
	Wed, 23 Jul 2025 10:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="G1BZCORE";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="CPgcgovG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500DF10E7A2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:38:56 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 56N6sIIf3466936; Wed, 23 Jul 2025 11:38:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=bNmhT8poUTzWLVo3XDKTDrIFq
 iHfeD9fYeI59HIGBzQ=; b=G1BZCOREt8u5czd4SnHh/YvJ+Ry7Y/LLifaVCCHJ/
 psyQY1jdjhO5Tj+LX/foz9SAVhanuIT5lmFRa8Y6zbEmuJDu3MLYOq2NwfEYUKxF
 +uq6jQRJA/2GnsevbbKZmaLlp/YuqJZjPWrCqt6Bt5Ebicdh14/JNcJEqP8xHw6g
 /iwkaydRKtBHDZ3KvnIZxZxPqqkN2rWUf6Kk8jJMqYmRwtXNTdiCOkKHT4aRjccI
 Wl0YX/yZD0AU8cdgCXyJpSQy3EwzRPADKzgZBs7xj4YY+uF7+MEGTPUJfXMlxkBW
 uBRfLJSR8mv0WbN/oPhECxPdT22aUC+ZgvcYVq9xYctag==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020086.outbound.protection.outlook.com [52.101.195.86])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 482jw30gv0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 11:38:31 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z62dnJi2o2S6xbR/6LdC2VVJXSxZyfzkl7K5HlxTabjbazDcPX6lwHkvQ1qbBY7A4zE2BevuCf7c2oF+llkhCOq3Tju6RVkVlZSqfgATCBVPsDgd+7BN1Wyp34olGNljwbktqnW272c41Z/8m9F2I31/E5aL/F2ic6J8HQ08HmhawYlS9DmTBjuzAh0pRg8WYxxRaguDIgtSA3wc3R60FvM3GZpOGga1GEQ0y0ixyPd/88wp4j/MTxI9ZweSMLU7aKhYkEU/A7N8SbxEaER3cuDUvzCy8l5syEopWBcrOReOLfDvglyreEcSfOotafmb22ZEzcTfULkXgQ9FL8xSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNmhT8poUTzWLVo3XDKTDrIFqiHfeD9fYeI59HIGBzQ=;
 b=HW9l6dZkCvo78u4QGXUscuF9tudIOUqmFvtKVRk9sTO0MvCmRD77A518Pd0WOAbV0Ls4n5C50mfamVXUiM4ca+PSfpKsFJD8ZsXHf17D3fl4RNh6PM+VcJm/nPkRTRUpp7MwhY9PJH+5fV/QTqixDJhV9qJIUXmVUKGcfV1ZgN9ikz/eDkgFWK6FQ04mJTDoMbKTaINbiy3zmQvfMT8ZnF8X3xpCbv75eQucDgk+f3PiVu4RNrCtb/xzG/VU6rGxdXrDXA+RKz84llpDc3WmBaAhiVWGVhPwFVixtoHO/42gRxv6lMmIF9Teh5MdaTFc4VveHiKFQ5fcql8rygXmvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNmhT8poUTzWLVo3XDKTDrIFqiHfeD9fYeI59HIGBzQ=;
 b=CPgcgovG0SSabiJ0rLzGs3zpmI68MK+pZmjf8s8TkeIQQZEdjf7xJM8dVPB9lOAuszznONGBoUzktefQre0z41nrwvX9XcYBMYmOjX8wtzEZUHT4uaYfWThgDP0aUXJDtjx1w+LvA2gDNolviDASXGhUVv7i5KAOUMjmN6xZsAE=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB5110.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:251::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 10:38:28 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 10:38:27 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Drew
 Fustini <fustini@kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 1/5] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Topic: [PATCH v7 1/5] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Index: AQHb+73saxRCydzAVkaouEaSwd4OTw==
Date: Wed, 23 Jul 2025 10:38:26 +0000
Message-ID: <6bbcc434-84c3-401e-8bd8-1b22718e7bcd@imgtec.com>
References: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
 <CGME20250626093356eucas1p1adfcd565173d939f82e15252189c316f@eucas1p1.samsung.com>
 <20250626-apr_14_for_sending-v7-1-6593722e0217@samsung.com>
In-Reply-To: <20250626-apr_14_for_sending-v7-1-6593722e0217@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB5110:EE_
x-ms-office365-filtering-correlation-id: 1047a613-9940-4f4d-8386-08ddc9d50ea8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?YnMyaGo2bEZrYlF0ZmlwNUxLd0lXbkhQMjVUVFA0YzRWOHZBWlhDMXpYbElU?=
 =?utf-8?B?MlptMXNxVnJzZ3FLcW5WR3l5czJCL3hZcmhWVk55NXE2RkxSZGxUNXRSNS9Y?=
 =?utf-8?B?NlJuK1o3dlh5L0tXNGdWNUhRMUFEeEVSbGdWT2VtdlNqS2JQYzN3c3ZBRExx?=
 =?utf-8?B?Y0EwMy8yWm9BM2c0UG1Dd3Ryd0FoWk9JbTkrS1BNWk15U0lXb3ZzSW5KcVBj?=
 =?utf-8?B?VjdjcTdBN0lyTFhQQzVLUEphS2ZTbUZWVXZLZUF6NmJEalI2NEN3eWRjWXVW?=
 =?utf-8?B?bXVQcmdLRUNJMTNYOUpkeEl3T3B0NFlDZDFLUlRFWm9SUWZZM3UvREtOaXFW?=
 =?utf-8?B?MzZEWk4xMllFTzNYY20zSnpLQVhpaUExU29oYTRFNTRKK1VqakZsdXlQSGNs?=
 =?utf-8?B?bDd6d0dJQzdlbld1UC9Fb1hzNHM3dy9WbWxQdERzRjJaa0V4ckQ3UFJQZlQ1?=
 =?utf-8?B?V1ozQXJTTVJVK2tTbExUZ1M1OFA4amlGVUM5cUpDUTVROTJQUzhNcmZQVlps?=
 =?utf-8?B?WDNSeDJLUG1vNnh0SUl1d1ZJRW96aktNU216TG5LMEFBWS9KY2NYbVN1d0ZY?=
 =?utf-8?B?T3VOR0hZSVEwamtQbHQ3VmdTYW1lNVRDSUtrcXVwUkJ0K3VCNXo2U1EzY0da?=
 =?utf-8?B?TGZTM01leHQ3QXl2Vmd3aVBUUWg1dnVxMHl6UkVWdjRRdEY4SlJWcHd1SG0v?=
 =?utf-8?B?ZzJ2NThZSWRtSkdPVW82b095WlpTWnBGd3FnbWc2ZkJQUGRQSGcwUXMrSlBm?=
 =?utf-8?B?YWl5eXNYZDFaNDZBbDNlRlFsY2pDQ3Y0RzZZYjV5ZDdvdUZJK1VtZHBSVnph?=
 =?utf-8?B?Vy9XT0JKa3l0VmFreUQxRklzQzlxRzRFVFhHZ2l0N3A4VDArZm9Xc3Y0eVhn?=
 =?utf-8?B?RHJhRVVaTW9FWk1PODVnZEc5NkNFcU9hVk4wVDdkQm85Nk5sTmhNZk0rVWQ5?=
 =?utf-8?B?RDJ0bzFDS2paTEFHOEpidEltQkZWRnk3amc0R2VrTVA4NllLOUovZVhtbkw1?=
 =?utf-8?B?ZXJsQm5jNzcvQ2k3QXBiSG9FeU5ZUHNtYWpsZnE2cEFmaWZBQXVXcGU3Wjhw?=
 =?utf-8?B?NnNGbXRZZlE2UkpMenN3V29xT3dMNS9WSnEyL05iRCtETDl1VVlrbFVCMTNU?=
 =?utf-8?B?NlNWQnQrcXNaZGl4MjVrTTZ6aDZHSzF5RTBWMW5kNnQyS3ZwQkZSUUthejND?=
 =?utf-8?B?U09kdTBBeXdnTHpoNFVYL01hVjJQSXJxQWVsQWhGVFZ6YUcvbmV6M2NlVit0?=
 =?utf-8?B?NGNkcGtQcVN6bGQwZE94UGJGZnJueXAvZEVvQlVqWnhBbXFEbGVQekJwSzRM?=
 =?utf-8?B?ZXhCQUkzbmJ5REJOOHV0Ty9BckVmd2dzdkF4S3B1ZzNaZE5NNDFEL251S0pP?=
 =?utf-8?B?eFRBOWdLdi9sNzlLTXlEMTVrdHg5bHp2WGd1eS9CN2IwNWpramRJeHRNV3cv?=
 =?utf-8?B?b0hqVG55WDFrNGpndmFtUXJVMnBZald3ZDJ1aWJwUUZCc1lidXJoYVpPcHhF?=
 =?utf-8?B?amllSmFENkNGc3FIc1d2dEYwQ3R3NStqOHRYbkVGNnIxcENwazA3ZlIwUGVW?=
 =?utf-8?B?dC9TRGg4N0hWb0ZjTTB4VUFWY01SQkF4eTFabzFUQlF3RTUxOHQ2MHNrTUJo?=
 =?utf-8?B?eXJDV0VTK051OGJ0YXRuK29xQkVHVU51c2JSZGV0N2IwSFU5SzdPQjk3VXF3?=
 =?utf-8?B?VkJ0SmluNjR2U0NUM0dCMGlMU1ZiRHpwTW4ybjFoNUE0aUJCRGJPZEVwQkdr?=
 =?utf-8?B?TFIvV0dxOEN4Rk1sT2tzSTJxVHhxRDVqbU5CWStEL0ZQcVJ2Mnd6cUIzallD?=
 =?utf-8?B?dm5yeXFOcWJjb0RlNURobFlFTExhNitreFZ3TGJjY3BtNjVWcHlzR1l3b2w4?=
 =?utf-8?B?VjhoYlpFR3lad2Yrekk2ZTZOU3ZMaW5HK0NOU2dUMitaK2swL1B3L05yR2tn?=
 =?utf-8?B?OE9BbmNqdkIxd0IvRTZZd3NmVkRuZy9rMHVXdUlCd21sN0hhd2FMcEh3bGN5?=
 =?utf-8?Q?cUaWFfiuqVIkbE0s7VAsOhyiavShYI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVdhUDY1MGsvREtBUEgrSlpsVHlEd0VCOW9TZllWQjVlUWZtNC8wUlhNckJt?=
 =?utf-8?B?am1ZME1NOTY5cFN0TGtvcFlPRGNlem1BZWg3anhDZXJabndlaTYwZUM3QU5O?=
 =?utf-8?B?WWlDVjczS2ErMk1taTQ5WjZQMFRkSmtkSDJmeFBzd3ZNR0tuUmNEMEppNUZD?=
 =?utf-8?B?TmcvNHlUajRLOHlVWDhaWi9nNGRNcmo5RVVJdERUNUxDMjZxYWNCTEhxS2I4?=
 =?utf-8?B?a1U3dkh3M0svVkN2aThHVVZML0xUdTkwTmlBVGZuTGpzOW5FSTlXckQwbkUz?=
 =?utf-8?B?aStXTUd5ZXI5USs3RWN0TWs4MWNtYWxnNi9tUGZtMHRKTHl4WGFGRWpQdnor?=
 =?utf-8?B?TUhuVHZYWTFsNWRJY2FvTXpISXRMb0ZkMjhlUUJBamtvZHp4blFNS1l1WFRP?=
 =?utf-8?B?RW5GdzBRWVZWTW0zNlFCTk5lbE9MeVc3SVorWXAwWkd4WnFxRUJwQkRTNUtM?=
 =?utf-8?B?ODUvNk1mU002dnorTE4xZlNqaDVZMUFPM24rTENJVDc2Y2QydGoyMUVQVUZh?=
 =?utf-8?B?MjM1SW5mcWp1Q1ROaUZzQ1J1ajl1SEVkREdyZkdYblJTYlg2RllMWkd5VjFC?=
 =?utf-8?B?TzVkVFFEc1ZUdU44ZG55cVNmQlQrak9iZGpuTjMwY2J5SEFKUUgvaWp0bVJl?=
 =?utf-8?B?a0owZzRHKzRRUlRJNkhPSnpEdlVoSUdHZ1BUcGxjWFJLSnJMZWZSbStsVWpS?=
 =?utf-8?B?SzBMY3VHMzd6K3h0WDcyN2xZb2ZtaVdYNmJITVhDZzJhaGxlcUNnUUNxVHJX?=
 =?utf-8?B?TXo1Ui8vSkcwci9ORXJzOXR3QmhKSytuK0E2TDEzcERaS2tjejZSZ29hUGdE?=
 =?utf-8?B?MG9pRnhWUXlZMGpCTHlUM3FpQWxzZnEzN2xqdjBlTEtvekg0NVV0YXdLTGNW?=
 =?utf-8?B?TThncW8vZkxxN3EvcXMwWXZJOU5WVFVxb3g1LzZlL2h3WWNtK1FPQnR3RlBO?=
 =?utf-8?B?Z2ZSaG5TNTBNa1p5azVQQWo0b1c0N3pzNVNUMm03MTAvbjlNQy9kaGRXaFBF?=
 =?utf-8?B?NG5RZ1BuUFpETE9KWUZ5TCsyU0k0aGdDcmlKR1ppbHFzb0VqejlRbFNkeXc1?=
 =?utf-8?B?TjFBa0g3d2tjZC9OQzQybmFUMk5qeWtPMGU0Um9mK2pKemNuVXVYWWw5cGVm?=
 =?utf-8?B?NWtTODlTUDAvZ3VqZ1UzNDRucXJ2elpVUlFQRHFQV01SZkZOY3BnUmFuOE5F?=
 =?utf-8?B?NXhYYmg1K2FVVjhzZzZGSVlFSTR6dE1ZNm5yUEE3cm82V01HODZ4SlExUEtY?=
 =?utf-8?B?WldiSkdFc0RKalVTQU5hZEh5MzEyRlMzeCtYYnI1NG9xVnZqTiswVlZLMFpW?=
 =?utf-8?B?eGllNUVyZThxV0R6VWdFU1hrd0JFVzIrMG1wTDZWWjV0UGx2VVJwUURkU24y?=
 =?utf-8?B?L2I4ZCtPVDVlcmtoN1dzaWxBUmE2RmgyODBpTUpVdFlFeVk3TUNXQmpPcFV3?=
 =?utf-8?B?bDJvWVZ4MUhGRGIvVCtDSmM1cndCOXRvQXJvQVovSUFjc0RMcTlHaEREM095?=
 =?utf-8?B?KzlyTzlFeGNidmdCNHJqL2lUTnU2VUFFNEdVTW9sVittUjdxNzhaUnF5ZWZE?=
 =?utf-8?B?YjNCQU1TdWlQN2xzYUNqdlIrbS85S2QxWVR6bE5mSHl1R204QVV2aGVGM1Zq?=
 =?utf-8?B?Q3AvTnF2bUlyMlc5eUNUZU5DSUNrNGMxOElMQWNOdk9tTzZRelllNWdmLytk?=
 =?utf-8?B?dXU4Z3pNMzQrSTFRVS9ITlJrZ2lKOTc2LzhmY04zZU1XL2c1N3NadGdVTzJx?=
 =?utf-8?B?aTBGbmdBNGRRMzdESFJzRkFoSEZzMHo2cnZ1ZEFnOE43OTVRdzZiVmUxN2NV?=
 =?utf-8?B?eUNiOXQrR3F2dVZhbDlraG1GZ2tvT0lEZnljUDAzN3NhaCthMVA5cFdDQzZJ?=
 =?utf-8?B?dUNGMW9zTzB2WnFTVlRPYURDMnVCd3ExVVVUVkN2L0R0UFRrODdEcWdXWm1k?=
 =?utf-8?B?SnBuTzI5eXNseTA5ZDBVNjlDNGJyamUvL3I0R3d0ZStKcm1zN3d2bXRKanpk?=
 =?utf-8?B?SmZWNTRqbGwrZ2djRE5TbWttV0x4ZFNNb1EweHQyS2kwVjRwQjdKUGVBb1Uz?=
 =?utf-8?B?ekgyOWdhZjdhbGU0b09LbndVRHB2RTl0b3dRTXAvNDBFNUIweHo2cEUwVjJG?=
 =?utf-8?B?S2hIS0lsclFPTy9BUDVMallwcjlaT0FkVGhlNHdxOHk3dFowYWRZQlNQdnFj?=
 =?utf-8?B?akE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nTsZwlFshtTWAjMb6dIgkLOZ"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1047a613-9940-4f4d-8386-08ddc9d50ea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 10:38:26.7398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijYsYxf5uy1lv3aWTBrm7kBdpVbl5Blei94kWf5fi4y7Rudtg8YNxtqwD6u90ilMUD14vR/3saNF6WRZdYjV3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5110
X-Authority-Analysis: v=2.4 cv=X9dSKHTe c=1 sm=1 tr=0 ts=6880bba8 cx=c_pps
 a=AV/7kzhiGDB5IWImBwApAA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=KKAkSRfTAAAA:8 a=hD80L64hAAAA:8 a=Pa9Y6layCR0FF3kXcP4A:9
 a=QEXdDO2ut3YA:10 a=VRfcG0BEiJQB5Hh0b2IA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gBN1jEeh7iNGnl_4RTGZQsOXeqbV3Cey
X-Proofpoint-ORIG-GUID: gBN1jEeh7iNGnl_4RTGZQsOXeqbV3Cey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfX2lpGvnllYjn0
 j9FqQbhHGgjivNt86OxnSF0NbJSszBvL0BmNS6NoTn65Tp0xpmdsvhBatTAiX56JXq1OeQ2Lkxi
 rYWh7TCdbOIksPupVYKXxmsqGkriwn6Ln1wF//QHkLcNOHf8nPYVG0CR+lC7C9GkzmDZXRm7nlD
 itNd/jM+VtxrVhorrD0GDGv2SyvETFC7+DLfcVj7Lt+McHarp7SuMtoWlD1F2ZfCXIdKMCZEndK
 vHnfP5TVvnuorRo09oB62rHDGqMO7eVEPl6ehlBfGooMVm79XaQRPMC4H9G8A1gVVicSYb7rwZ+
 yMWScARYcDuszXGk03MRWS+06sTfI7UhOrOo+i5tB2mNR6fdKdSr04bNGbJqJBDfo4YcDMGBoB8
 EHaFbfLb
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

--------------nTsZwlFshtTWAjMb6dIgkLOZ
Content-Type: multipart/mixed; boundary="------------LgIKQih4XJdKfcTUVGxqK0lT";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Drew Fustini <fustini@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <6bbcc434-84c3-401e-8bd8-1b22718e7bcd@imgtec.com>
Subject: Re: [PATCH v7 1/5] drm/imagination: Use pwrseq for TH1520 GPU power
 management
References: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
 <CGME20250626093356eucas1p1adfcd565173d939f82e15252189c316f@eucas1p1.samsung.com>
 <20250626-apr_14_for_sending-v7-1-6593722e0217@samsung.com>
In-Reply-To: <20250626-apr_14_for_sending-v7-1-6593722e0217@samsung.com>

--------------LgIKQih4XJdKfcTUVGxqK0lT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26/06/2025 10:33, Michal Wilczynski wrote:
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the complex power sequence of the GPU on the T-HEAD TH1520=

> SoC.
>=20
> To cleanly separate platform specific logic from the generic driver,
> this patch introduces a `pwr_power_sequence_ops` struct containing
> function pointers for power_on and power_off operations. This allows fo=
r
> different power management strategies to be selected at probe time base=
d
> on the device's compatible string.
>=20
> A `pvr_device_data` struct, associated with each compatible in the
> of_device_id table, points to the appropriate ops table (manual or
> pwrseq).
>=20
> At probe time, the driver inspects the assigned ops struct. If the
> pwrseq variant is detected, the driver calls
> devm_pwrseq_get("gpu-power"), deferring probe if the sequencer is not
> yet available. Otherwise, it falls back to the existing manual clock an=
d
> reset handling. The runtime PM callbacks now call the appropriate
> functions via the ops table.

Hi Michal,

I've replied again on the v6 series regarding the power domain
situation[1], it took me a while to figure out internally what's going on=

in this SoC integration but I hope we have a somewhat satisfying answer
now. As for v7, just a couple notes from me on this patch, plus whatever
changes are needed to solve the power domains once and for all. The rest
of the series otherwise looks good to me.

>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.c |  36 +++++++-
>  drivers/gpu/drm/imagination/pvr_device.h |  17 ++++
>  drivers/gpu/drm/imagination/pvr_drv.c    |  27 +++++-
>  drivers/gpu/drm/imagination/pvr_power.c  | 139 ++++++++++++++++++++++-=
--------
>  drivers/gpu/drm/imagination/pvr_power.h  |  13 +++
>  5 files changed, 185 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm=
/imagination/pvr_device.c
> index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..770fc32a6fe485aad41cd92=
fa1431dd233ac20dc 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -23,8 +23,12 @@
>  #include <linux/firmware.h>
>  #include <linux/gfp.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
> +#include <linux/pwrseq/consumer.h>
> +#endif
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/stddef.h>
> @@ -618,6 +622,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	struct device *dev =3D drm_dev->dev;
>  	int err;
> =20
> +	/* Get the platform-specific data based on the compatible string. */
> +	pvr_dev->device_data =3D of_device_get_match_data(dev);
> +
>  	/*
>  	 * Setup device parameters. We do this first in case other steps
>  	 * depend on them.
> @@ -631,10 +638,31 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
> =20
> -	/* Get the reset line for the GPU */
> -	err =3D pvr_device_reset_init(pvr_dev);
> -	if (err)
> -		return err;
> +	/*
> +	 * For platforms that require it, get the power sequencer.
> +	 * For all others, perform manual reset initialization.
> +	 */
> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
> +	if (pvr_dev->device_data->pwr_ops =3D=3D &pvr_power_sequence_ops_pwrs=
eq) {
> +		pvr_dev->pwrseq =3D devm_pwrseq_get(dev, "gpu-power");
> +		if (IS_ERR(pvr_dev->pwrseq)) {
> +			/*
> +			 * This platform requires a sequencer. If we can't get
> +			 * it, we must return the error (including -EPROBE_DEFER
> +			 * to wait for the provider to appear)
> +			 */
> +			return dev_err_probe(
> +				dev, PTR_ERR(pvr_dev->pwrseq),
> +				"Failed to get required power sequencer\n");
> +		}
> +	} else
> +#endif
> +	{
> +		/* This platform does not use a sequencer, init reset manually. */
> +		err =3D pvr_device_reset_init(pvr_dev);
> +		if (err)
> +			return err;
> +	}

Can you extract this whole conditional into an ->init() callback on
struct pvr_power_sequence_ops? That would eliminate the #if conditional
code from this file entirely since you'd no longer need
<linux/pwrseq/consumer.h> at all.

> =20
>  	/* Explicitly power the GPU so we can access control registers before=
 the FW is booted. */
>  	err =3D pm_runtime_resume_and_get(dev);
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm=
/imagination/pvr_device.h
> index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..0d7f7c78573a0766a467fb0=
c3a577ffe152d0892 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -37,6 +37,9 @@ struct clk;
>  /* Forward declaration from <linux/firmware.h>. */
>  struct firmware;
> =20
> +/* Forward declaration from <linux/pwrseq/consumer.h */

Missing '>'.

> +struct pwrseq_desc;
> +
>  /**
>   * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR devic=
e
>   * @b: Branch ID.
> @@ -57,6 +60,14 @@ struct pvr_fw_version {
>  	u16 major, minor;
>  };
> =20
> +/**
> + * struct pvr_device_data - Platform specific data associated with a c=
ompatible string.
> + * @pwr_ops: Pointer to a structure with platform-specific power funct=
ions.
> + */
> +struct pvr_device_data {
> +	const struct pvr_power_sequence_ops *pwr_ops;
> +};
> +
>  /**
>   * struct pvr_device - powervr-specific wrapper for &struct drm_device=

>   */
> @@ -98,6 +109,9 @@ struct pvr_device {
>  	/** @fw_version: Firmware version detected at runtime. */
>  	struct pvr_fw_version fw_version;
> =20
> +	/** @device_data: Pointer to platform-specific data. */
> +	const struct pvr_device_data *device_data;
> +
>  	/** @regs_resource: Resource representing device control registers. *=
/
>  	struct resource *regs_resource;
> =20
> @@ -148,6 +162,9 @@ struct pvr_device {
>  	 */
>  	struct reset_control *reset;
> =20
> +	/** @pwrseq: Pointer to a power sequencer, if one is used. */
> +	struct pwrseq_desc *pwrseq;
> +

Can you add a note to this doc comment explaining that
CONFIG_POWER_SEQUENCING is not a dependency of this driver, and that
this member should only be accessed behind an IS_ENABLED() check?

>  	/** @irq: IRQ number. */
>  	int irq;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..af830e565646daf19555197=
df492438ef48d5e44 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1480,15 +1480,37 @@ static void pvr_remove(struct platform_device *=
plat_dev)
>  	pvr_power_domains_fini(pvr_dev);
>  }
> =20
> +static const struct pvr_device_data pvr_device_data_manual =3D {
> +	.pwr_ops =3D &pvr_power_sequence_ops_manual,
> +};
> +
> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
> +static const struct pvr_device_data pvr_device_data_pwrseq =3D {
> +	.pwr_ops =3D &pvr_power_sequence_ops_pwrseq,
> +};
> +#endif
> +
>  static const struct of_device_id dt_match[] =3D {
> -	{ .compatible =3D "img,img-rogue", .data =3D NULL },
> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
> +	{
> +		.compatible =3D "thead,th1520-gpu",
> +		.data =3D &pvr_device_data_pwrseq,
> +	},
> +#endif
> +	{
> +		.compatible =3D "img,img-rogue",
> +		.data =3D &pvr_device_data_manual,
> +	},
> =20
>  	/*
>  	 * This legacy compatible string was introduced early on before the m=
ore generic
>  	 * "img,img-rogue" was added. Keep it around here for compatibility, =
but never use
>  	 * "img,img-axe" in new devicetrees.
>  	 */
> -	{ .compatible =3D "img,img-axe", .data =3D NULL },
> +	{
> +		.compatible =3D "img,img-axe",
> +		.data =3D &pvr_device_data_manual,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> @@ -1513,4 +1535,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
>  MODULE_LICENSE("Dual MIT/GPL");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
> +MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
>  MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> index 41f5d89e78b854cf6993838868a4416a220b490a..13aef27849d1a71df77406c=
8d7845836998a35a0 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -18,6 +18,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
> +#include <linux/pwrseq/consumer.h>
> +#endif
>  #include <linux/reset.h>
>  #include <linux/timer.h>
>  #include <linux/types.h>
> @@ -234,6 +237,96 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
>  	return 0;
>  }
> =20
> +static int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +	int err;
> +
> +	err =3D clk_prepare_enable(pvr_dev->core_clk);
> +	if (err)
> +		return err;
> +
> +	err =3D clk_prepare_enable(pvr_dev->sys_clk);
> +	if (err)
> +		goto err_core_clk_disable;
> +
> +	err =3D clk_prepare_enable(pvr_dev->mem_clk);
> +	if (err)
> +		goto err_sys_clk_disable;
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
> +
> +	err =3D reset_control_deassert(pvr_dev->reset);
> +	if (err)
> +		goto err_mem_clk_disable;
> +
> +	return 0;
> +
> +err_mem_clk_disable:
> +	clk_disable_unprepare(pvr_dev->mem_clk);
> +
> +err_sys_clk_disable:
> +	clk_disable_unprepare(pvr_dev->sys_clk);
> +
> +err_core_clk_disable:
> +	clk_disable_unprepare(pvr_dev->core_clk);
> +
> +	return err;
> +}
> +
> +static int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +	int err;
> +
> +	err =3D reset_control_assert(pvr_dev->reset);
> +
> +	clk_disable_unprepare(pvr_dev->mem_clk);
> +	clk_disable_unprepare(pvr_dev->sys_clk);
> +	clk_disable_unprepare(pvr_dev->core_clk);
> +
> +	return err;
> +}
> +
> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_manual =3D =
{
> +	.power_on =3D pvr_power_on_sequence_manual,
> +	.power_off =3D pvr_power_off_sequence_manual,
> +};
> +
> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
> +static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
> +{
> +	return pwrseq_power_on(pvr_dev->pwrseq);
> +}
> +
> +static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
> +{
> +	return pwrseq_power_off(pvr_dev->pwrseq);
> +}
> +
> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq =3D =
{
> +	.power_on =3D pvr_power_on_sequence_pwrseq,
> +	.power_off =3D pvr_power_off_sequence_pwrseq,
> +};
> +#else /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
> +static int pvr_power_sequence_pwrseq_stub(struct pvr_device *pvr_dev)
> +{
> +	WARN_ONCE(1, "pwrseq support not enabled in kernel config\n");
> +	return -EOPNOTSUPP;
> +}
> +
> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq =3D =
{
> +	.power_on =3D pvr_power_sequence_pwrseq_stub,
> +	.power_off =3D pvr_power_sequence_pwrseq_stub,
> +};
> +#endif /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
> +
>  int
>  pvr_power_device_suspend(struct device *dev)
>  {
> @@ -252,11 +345,7 @@ pvr_power_device_suspend(struct device *dev)
>  			goto err_drm_dev_exit;
>  	}
> =20
> -	clk_disable_unprepare(pvr_dev->mem_clk);
> -	clk_disable_unprepare(pvr_dev->sys_clk);
> -	clk_disable_unprepare(pvr_dev->core_clk);
> -
> -	err =3D reset_control_assert(pvr_dev->reset);
> +	err =3D pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
> =20
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> @@ -276,54 +365,22 @@ pvr_power_device_resume(struct device *dev)
>  	if (!drm_dev_enter(drm_dev, &idx))
>  		return -EIO;
> =20
> -	err =3D clk_prepare_enable(pvr_dev->core_clk);
> +	err =3D pvr_dev->device_data->pwr_ops->power_on(pvr_dev);
>  	if (err)
>  		goto err_drm_dev_exit;
> =20
> -	err =3D clk_prepare_enable(pvr_dev->sys_clk);
> -	if (err)
> -		goto err_core_clk_disable;
> -
> -	err =3D clk_prepare_enable(pvr_dev->mem_clk);
> -	if (err)
> -		goto err_sys_clk_disable;
> -
> -	/*
> -	 * According to the hardware manual, a delay of at least 32 clock
> -	 * cycles is required between de-asserting the clkgen reset and
> -	 * de-asserting the GPU reset. Assuming a worst-case scenario with
> -	 * a very high GPU clock frequency, a delay of 1 microsecond is
> -	 * sufficient to ensure this requirement is met across all
> -	 * feasible GPU clock speeds.
> -	 */
> -	udelay(1);
> -
> -	err =3D reset_control_deassert(pvr_dev->reset);
> -	if (err)
> -		goto err_mem_clk_disable;
> -
>  	if (pvr_dev->fw_dev.booted) {
>  		err =3D pvr_power_fw_enable(pvr_dev);
>  		if (err)
> -			goto err_reset_assert;
> +			goto err_power_off;
>  	}
> =20
>  	drm_dev_exit(idx);
> =20
>  	return 0;
> =20
> -err_reset_assert:
> -	reset_control_assert(pvr_dev->reset);
> -
> -err_mem_clk_disable:
> -	clk_disable_unprepare(pvr_dev->mem_clk);
> -
> -err_sys_clk_disable:
> -	clk_disable_unprepare(pvr_dev->sys_clk);
> -
> -err_core_clk_disable:
> -	clk_disable_unprepare(pvr_dev->core_clk);
> -
> +err_power_off:
> +	pvr_dev->device_data->pwr_ops->power_off(pvr_dev);

Nit: can you put the blank line back here please?

Cheers,
Matt

[1]: https://lore.kernel.org/r/f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgte=
c.com

>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/=
imagination/pvr_power.h
> index ada85674a7ca762dcf92df40424230e1c3910342..6a2f3f6213e5ac2254344ad=
24d9678334c8974ea 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.h
> +++ b/drivers/gpu/drm/imagination/pvr_power.h
> @@ -41,4 +41,17 @@ pvr_power_put(struct pvr_device *pvr_dev)
>  int pvr_power_domains_init(struct pvr_device *pvr_dev);
>  void pvr_power_domains_fini(struct pvr_device *pvr_dev);
> =20
> +/**
> + * struct pvr_power_sequence_ops - Platform specific power sequence op=
erations.
> + * @power_on: Pointer to the platform-specific power on function.
> + * @power_off: Pointer to the platform-specific power off function.
> + */
> +struct pvr_power_sequence_ops {
> +	int (*power_on)(struct pvr_device *pvr_dev);
> +	int (*power_off)(struct pvr_device *pvr_dev);
> +};
> +
> +extern const struct pvr_power_sequence_ops pvr_power_sequence_ops_manu=
al;
> +extern const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrs=
eq;
> +
>  #endif /* PVR_POWER_H */
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------LgIKQih4XJdKfcTUVGxqK0lT--

--------------nTsZwlFshtTWAjMb6dIgkLOZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaIC7oQUDAAAAAAAKCRB5vBnz2d5qsOsS
AQDtO/CBUzcKv5VgnqJEaUbd6KWYbTjb4oEv2mmpm0nSGQEA8LJh2jY56uTFlqzQBj0n4FSpJUXj
7JYqx0mRMPK2lwM=
=kiEm
-----END PGP SIGNATURE-----

--------------nTsZwlFshtTWAjMb6dIgkLOZ--
