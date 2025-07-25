Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C728B11FF4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 16:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACC310E211;
	Fri, 25 Jul 2025 14:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="GZduoj7P";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="PuI4Mllw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E66C10E211
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:17:17 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 56P4tKud4156671; Fri, 25 Jul 2025 15:17:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=OleIDt9noifdreEcJ6c3LjIJY
 Pvb10klJqDUqYbE34A=; b=GZduoj7PduuJPOry8VRtAqwg0V5NC+bnNF4pp72eN
 03naxj+CLItBsIBXld7nPLP2WwX13g2a85kchgjUAEF1/Kr5LNBcdDKN/nlDv0Ba
 fInFCGC/mVEf7BjSchN9PZykkiwEcIX3O8svx1waDvUredK52wKzr5NKoc5YUQJ1
 XF0t1NvwTq2rZVYMQmO3ERz30aELkdndcFEBHmA1PSKYKIK701UEWXvZ9MQQ7w4S
 wJy+bJqsWASWvm8SCq0K8zS6RWWWXL3xKACpAim+9NXN0MSbfhK/lnUnJa2yKNpB
 xkehCXBH6D8OQZ831ExSpuxs/LGaHQkuNmhoG55+QzzIw==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021076.outbound.protection.outlook.com [52.101.100.76])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 482jw32u9p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 15:17:02 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lw5OjbJplJKEDtS5iaN+9XujXZBnLkjfTa6uok05gWhKA4d0Ny99pNK8cyPbcVv9DtDEptZ/hj2mdoIV6MRkRdr+364/ZwGNh0ZGXS25k+OtoXPHkjXfl1Jg+c2ORcH24dWEJKNs7Q/+bmJCOGNaWDtqQ03Qcj6QBjo3nihFbTIs5h2o+uYn2pNRtdmQCsUuaZq/zXGPoo34xskK/sKLIAH858+WQD9vq2VEPWkRdFzE+B8jxINafg/01rZdW8PSMA2dq+q+T7mTtDE/Z0Q7sc4ZLtm/lv/SMuMD8robELoMaMCoaWFbCZoInKk5PQNZnmjrAGb4IhD2nZY+5fKLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OleIDt9noifdreEcJ6c3LjIJYPvb10klJqDUqYbE34A=;
 b=iEOcijZGqLO8PotPrrWXXnnViGaqmh/4K8d4lil3olzsmIQ3gVhL3RZ7H8WIdkDF654vej3trn/cMpxaZ/HFpDPuDG7x0hWPZL/u+Vx5N+06bS+fLqTnOmddKVPSOXXkz9OxnzGrc+kUgv3EiaGzD6nziFyfGkMyDG11Ne4fsNgJqDpNcGoPUO42hkJ09VZbsVk7scTJVa1k+bxB7n89GpK0NmGg5hAQQVpizDB1ElrEm6GeKyfipIfXNEm/Qvlze7ItBRqJQapTyxAc6HLDmlW1XAYHpQyFg5f+38tGYsp4gh9Sfno+F1+IXGTY71ulZI08JZU+XiMKGAslC17KTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OleIDt9noifdreEcJ6c3LjIJYPvb10klJqDUqYbE34A=;
 b=PuI4Mllwi6yvEkjkcXnxSvAgV1dAaTXCqCc5T3jicDHTo+t9MAj8f77zgp7xxhwRkqY4MJPVAwnGg3dUcY+ce2aXcZaJ37IH5N658x7FStkuA2Y7qOLjlgLvlkjjtqCrPoWumJs/WmJFfnobBenDPpPO/HP6NBeQF2y4t1/dM3I=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CW1P265MB7689.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:219::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.24; Fri, 25 Jul 2025 14:16:59 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 14:16:58 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michal Wilczynski
 <m.wilczynski@samsung.com>
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
Subject: Re: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Topic: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
Thread-Index: AQHb/W7IrTxNzJ63ZE+S8Hb10tAAhw==
Date: Fri, 25 Jul 2025 14:16:58 +0000
Message-ID: <2e60530d-e214-4044-8dfc-5293832ac4fd@imgtec.com>
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
 <CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
 <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
 <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
 <4461a785-b593-429e-b436-44cd2f1c96eb@imgtec.com>
 <4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org>
In-Reply-To: <4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CW1P265MB7689:EE_
x-ms-office365-filtering-correlation-id: e2ef89a9-1569-4944-e998-08ddcb85eabf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bnNhMDVSaHpJNU9CU1dEUVRwSlpXSW5JT3oxNlF0VWpQSmpEb01SdWh6NnQ0?=
 =?utf-8?B?amI1S0RKU3BIZ2puL2x2ck9FdGpzL3A1aWZVZ09RZ044V2tyV3UySmpIUzhR?=
 =?utf-8?B?Z0RZV3FFU2kyelZiZHlSYmZybysvRm12TytxV2VjbHZoM0JoMHUwbWF6dmYz?=
 =?utf-8?B?SVM1Q2paM3JoVHZFNjJaVUtrUTFHYWoreG14RURwaFJXSmJ3UGVvVEFJTnZV?=
 =?utf-8?B?QkMrU0dWYm9IdDRqZzlSWGl3QmowNk8zcTJ2Y3c2SUpoZzVVQ3NtUzY4N1dQ?=
 =?utf-8?B?NE4yYzNpdFhVZHV5TDJ0aXZ6SVRXbktvaDdYRzc4am51U29tbHRzYTgvemE5?=
 =?utf-8?B?cmRiQmJMaGhCZUxnQ1h6TGpOTEs4OXpTUWxXSHNIeHd6NXkwVzNRdGludW9G?=
 =?utf-8?B?NmVtVDNQcG1hRVRPUlU3SFFSbDVjbGFmNkZpbG1pdGFtTG1qQmlQRThEcGFt?=
 =?utf-8?B?VjBxMU5iR3g5SGhmR0NXRGdReklHZitBSjBJM0puS09RdUE2ZllKWWFsWnpU?=
 =?utf-8?B?bkRjNG4yMWlXbnAvTElvWWk4VExxZzFWUmQvRGppNUNuRUlIZ25IYkpwU01L?=
 =?utf-8?B?aFB1VmJwOEQvSE4xbWFESktMK3I4NHRuaGVPcUU2TEkvOUlXN0s3aFZmczQ5?=
 =?utf-8?B?Z1F3ZjBTeWNaU3doYWRXNGhpMXJGTVJ4cTdRZi9jOXBwTllKTjlCRGRPcFRm?=
 =?utf-8?B?Nlp6VXZTVDExNmhmY3l4M25yREt1Z2N0b3Uzd0ZzMmtJVjQrM1NtRVlMZi83?=
 =?utf-8?B?SGkrVmVTVFNiVktSWFpaZVNMVTRNU005Y0JoVE9yNjVQZWFmb1FlRUltVkd5?=
 =?utf-8?B?NkdmZ2lLZG0rbytZVlZCNDZnK2xZWHBuQ1FoTytubW56VzltVE5FZU5kTVhp?=
 =?utf-8?B?TlA0OE9weVBhMHVLRVRYbVp4ODhtUnNFNUFPVENzWmowd0ZJVU9Sd2dnRlVP?=
 =?utf-8?B?enhPeFNmOXhIUnIyVlA0TnZpd0FWeWRVaS9jTUdGRDI5dWthTjdsT01KTUEw?=
 =?utf-8?B?YUxIRmN6WkFSQVRPa2ozVzhpS1ZIZ013NDBiaVpmeFV0azRSWG5UYXRoUVFX?=
 =?utf-8?B?bTdiaEM2dlZZQVRRQXh1ZHpROUxvaGxFM0ZmY2NLMFFRLzJGUDZmQzNVSlRD?=
 =?utf-8?B?WmszY0lnZnpXcWxqZmIyS3ZrWUdtUks4bHF4d3RaYTQyaEUvNG9TakFPbmxW?=
 =?utf-8?B?c0w1S3VCSTZDaUR3NnFkeXlQbVRrV0N2S0Q3bFkzNHJSRDVTc2JpcVRwdWZK?=
 =?utf-8?B?VC9mWDVDT3Jldjk2TWNTWlIyTStid2pnckpvWkVmdlNMYnJpK2FmM0FCa25s?=
 =?utf-8?B?a1BrT0F0cFVTb0h3eHFjQUFvY0tobnJCUTdjb0J4QVJpQ3p6YzF4YW9CcUsz?=
 =?utf-8?B?eXNzVktva0FqV1U0NGEzYVZtUDUxSno4NVA3aWl1dTBMUUJ1V1Jmak9WZTNY?=
 =?utf-8?B?TkdVcGM5aXhBeFNKYXVXa2hxL2xnbUhoYmRadnJreE1xRzFVamlCa2VpVGtF?=
 =?utf-8?B?SjlpdW83NE5iN1dLT3Aydyt1aGYzR0FrRTVJTFVwNjJONi9oZy8zTUR4eGds?=
 =?utf-8?B?Z3ptYm5vRUgyRDBZUHZaL2JlV0I0bjJvVjBBUWFhMHR0L2lMa0YvLzRtVTht?=
 =?utf-8?B?MHY4UWRPM1JOYS90SGFLeEIyc2REK3lVMVJ2S2V2dEdGMmxMQ0VYMm5UMXhl?=
 =?utf-8?B?dDFReDRzV29NWUhoMnNFbU8zOER1aGtTWko2Rkhnd3ZkeUhVcjFpcFp2YVVT?=
 =?utf-8?B?a2t5d2dHb083TGpWZkNadVFoTjVMMGJjTFkvRDdZK2Vic2lhLzJZV01nTnND?=
 =?utf-8?B?T2dQamRlVEpYYmgwVzRlWnBZSU43OG9EMU9PR1pWOEU0NkhyZ05GWTFvMytj?=
 =?utf-8?B?K25LV2JoaDhuNUMxNDVCR1lnRG4vdzJ1dlFPdmhheFB6dXZSOCs2TVBqMlJL?=
 =?utf-8?B?NTVnRzY1WDBqVDhTWDlmak1UNFRlVjVoRTRoeTZMMk1FZlkxMVBvSnZJMUNl?=
 =?utf-8?Q?4uNouWuhKJAdUFz2PsjMuZ5v7vNEAE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTM2OXN6cW5IcUczcEFJVUo0b1c0RTNqQkYyRVV1bHhxaFZHSGE5RCtQd0Vm?=
 =?utf-8?B?RjJmMVlFMllKUnZianl4Q25FWmxJUjZIaWJ3cGNrTFRiUTh6L2tUbjRLMnFL?=
 =?utf-8?B?bmJjUlN1UFk2Y0MwQmxaS1dTc2FtZ1Z2OVViNFZxTHk1WDNlQyttZUs4VnV6?=
 =?utf-8?B?dFJQMnVoRnFxM0dDWVV1cFVDeWNSWHpZendTcGpYeDBrKytJK3U2RGFBbWZ2?=
 =?utf-8?B?RFVJMUZqVTl3UmNVOWVJSmNJOWo0VzVraDBPZnBPc2RMSkJDcUsvUUJ6dGph?=
 =?utf-8?B?K21PNG1VMktlQXYzbDk1V3NLRDQ1aUdva2RTZ21uT1JXZVRXZUFSMnUvOUha?=
 =?utf-8?B?N0dHcHl4cGxFcGlDKzdMNS9zMDNZTTZhaXJOdTkvU0p4Q3hzb3E4cGhaR0Zp?=
 =?utf-8?B?R3BqbmNqRzQyU1Jzc2NHMVQzWUFKTGRvQUdrQ3M5a3VPYk1aeUJwTnR5NDlw?=
 =?utf-8?B?U29zOXFsaGw4ejMvdDNUZktLNjhsTWVvWitqNzdNb3lheUJ4TTBHOGI4bWZZ?=
 =?utf-8?B?UStHbmt2cnc1MG8vbzNjd3ZTWjg5emhwL0hETFByZlJFcTdLY1dJS1ROOHF3?=
 =?utf-8?B?SWMzWnJpekhwMkd6Vi9DNGY0dEo4K0o5Q1lCWnA2ckp0cVV2ZDRBak91d2E0?=
 =?utf-8?B?dlZxSjZnUGYrRmtiTUlXZ1l6OUg2UTdvSWVGOEZNSktiNWY5VXNOYmJjcVRu?=
 =?utf-8?B?TDRCVzc4VElMU3F2K1Z0ZlNrWGhQdWYzY1Z5bWVBSGZXYU9kUjBjaGdJc1FT?=
 =?utf-8?B?b3lsSTlzdUFsVTZHbWd1VFZ1ZnFCR0NXNDZOU2hvVlZkNFdGQXFmRDQ2MW9M?=
 =?utf-8?B?S05iN052WC9jeHo0NjRVMEE4SGdUeEVlUllNR2h2TTd4ZEVOL1BCOWhZQnR5?=
 =?utf-8?B?YURoU3dDUlR1ZkplRGpTa3BTODRmL2txZUVBMEFGam1EcGhac1ZOR2U2amU0?=
 =?utf-8?B?Zk56MHhiQTRoRGxHUzM5elFKUnJyNi9udGhmWUFaUVJza2ZSdGRqaUU0NDZE?=
 =?utf-8?B?Ujd3RUNVYnFVVUp4dFE4L0pCMTB1bXFaZWVXUFMyR1NoVVVLKzRIWXk2aENn?=
 =?utf-8?B?TGtIZW15SVFLNm1jbThaQy9uaTBGOWFYYlRNN01iR1JSNHROWXd4c1Bhd2Ja?=
 =?utf-8?B?b1QxbGdpNUJzVmNva1hidS9OSzByYjBwdGlyU2dlVXJZRC9JVlFCUUU3YmFm?=
 =?utf-8?B?TnpoejVobVg0TloyQjhZT05paU5IOXBQem12a1FaQTZmeDF3bnk3NG1xWG0z?=
 =?utf-8?B?aUFRdFdVZFJoZWtJQ21Ra3l5UExIQTF4T1FrV0Q4RGFvZWVPeE5iRkR3L3pV?=
 =?utf-8?B?bjBUWVM4d0RBaWVDWHZQUW1kWHUxSUN1bFhqUytMUGUvVmlsQzRMZ0FmaXZ3?=
 =?utf-8?B?WDFFcEc5Y2x1bTM5NEZVTHNXNGhpTWRRNmV6KzRSeUxNdC9DMmtJRDlTUjly?=
 =?utf-8?B?THpZMFgrbmRyR3ZzL1JsZGJ4YXYvSGlQSUM3bUJMVWlEMjlkdXRJN1RzT3ZM?=
 =?utf-8?B?c1ZLakVpRmVmbDRTUGgvREhIemxXdXpVSzB4VEtzSGVHV0g4NWNPWVU0RkVl?=
 =?utf-8?B?bGJ0TVYrNTExYnZpZFRjQy9OOWVpM0lxZUtiS0VETi9BalpyVDQxejJTei9L?=
 =?utf-8?B?QmFISWE5MnhhbjFodnRpNXV2cEJlR1ZIVENsZEQxaWhZNDc0a0Z6SE83d09I?=
 =?utf-8?B?K3crYzV0M0JJYk5QT2RlN1hNRzc1S0xUMXFZZHFqUjUxaHJqU05qSGFhSzQ4?=
 =?utf-8?B?Snczck9VZnB1ZEx3UnVER3FDclA3T1Q0ODlDMWpCdmRXYytOSHR5NVo0dG02?=
 =?utf-8?B?eTBYTG13K283SWJNTWJ3Y3pFT1BNVWFINmZZb095OWkveTJOV2tyanJmcGhR?=
 =?utf-8?B?RnI0VzlPMFNYcEgvSENLN1NEam9NTTJBWkJiNXdoYnJWTFlUdG93VUJXZTFT?=
 =?utf-8?B?UURGUGtTeXB4MnNIaUxLSi83QXNBdU95clptSlhyczNyVW41MG5GUUhZVjZx?=
 =?utf-8?B?V3RtMkxVMGlyNWVlOHpCVStCRGdhOUVUSktmOUY2cHpmTmM0QUZiZ0JRcFRa?=
 =?utf-8?B?bjB3S1lvek4xVjZLdDN6MW1zeGN3UkhJYjFWQlVWNnZLYnI5MURQZTdFMTkr?=
 =?utf-8?B?NVJkODlqcWFDYjZlQnJ2VGs4SEZhMjNWOHlXYkUrUE1SY3NoajVVWXZEWTZI?=
 =?utf-8?B?SFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fTSpL7TtdmF7FYN80vuOwDhq"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ef89a9-1569-4944-e998-08ddcb85eabf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 14:16:58.5448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qUGJpv3hwSWJejF8MQ6+c5xqzc+bQFRlxR3vd9L596qZyXGvWblgCA+146uws0a4ROzkGwEZPwX+zxM/d+Wj1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7689
X-Authority-Analysis: v=2.4 cv=X9dSKHTe c=1 sm=1 tr=0 ts=688391df cx=c_pps
 a=9pf6/MKQJKtzaz4D7rlEAA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=8PkGLvUhKMV_mwe1H28A:9 a=QEXdDO2ut3YA:10
 a=sJuZmowIBy-6Sks4fJMA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: tzbPflPB-MVqOrjswHq3hUebUyKhCY2J
X-Proofpoint-ORIG-GUID: tzbPflPB-MVqOrjswHq3hUebUyKhCY2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEyMiBTYWx0ZWRfXwsZDIXz23g2F
 ToMuxW2yx0sfqFVqZ7neIIjmVxxZSaHrhTAzy48EQ3dXCqOjcOYL0lojWcfUL2lJ9v8Xx97owPQ
 2hSZdcZUjqhtg4W49jkZIOhkjhshvNjvKlxYn4hLmGzaxIjSq05KKEuCS/z1aVaCTFltDCwVwkf
 3y314UeCyhkRPnc1i2tyqNZV45AjRz8G/hQcUAXjCkna+oTL2mGah2awUlzAT6zPmt8O/IbzqVo
 9W/921/nwnDknkkkDvGOZsRG4xD1oyVKHeOMYojPCTyrBvJyoxaAgCje+QI4G5aBSX7+0RRcAjW
 hcdsb/7kD+hDaQAyUkItdImWguTvKcPQY0w+mP3a+V+P0oh8l5bMthQZ2G+q/PU0xCD7QbHFNZq
 mKJAygkh
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

--------------fTSpL7TtdmF7FYN80vuOwDhq
Content-Type: multipart/mixed; boundary="------------18nbOxbUWKB4bOITwWe5u0iT";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
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
Message-ID: <2e60530d-e214-4044-8dfc-5293832ac4fd@imgtec.com>
Subject: Re: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
 <CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
 <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
 <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
 <4461a785-b593-429e-b436-44cd2f1c96eb@imgtec.com>
 <4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org>
In-Reply-To: <4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org>

--------------18nbOxbUWKB4bOITwWe5u0iT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25/07/2025 12:08, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:00, Matt Coster wrote:
>> On 25/07/2025 07:59, Krzysztof Kozlowski wrote:
>>> On Thu, Jul 24, 2025 at 04:18:59PM +0200, Michal Wilczynski wrote:
>>>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's=

>>>> specific GPU compatible string.
>>>>
>>>> The thead,th1520-gpu compatible, along with its full chain
>>>> img,img-bxm-4-64, and img,img-rogue, is added to the
>>>> list of recognized GPU types.
>>>>
>>>> While the BXM-4-64 GPU IP is designed with two distinct power domain=
s,
>>>> the TH1520 SoC integrates it with only a single, unified power gate =
that
>>>> is controllable by the kernel.
>>>>
>>>> To model this reality correctly while keeping the binding accurate f=
or
>>>> other devices, add conditional constraints to the `allOf` section:
>>>>  - An if block for thead,th1520-gpu enforces a maximum of one
>>>>    power domain and disallows the power-domain-names property.
>>>
>>> Why?
>>>
>>> This solves nothing, because you did not change the meaning of power
>>> domain entry.
>>
>> Hi Krzysztof,
>>
>> Just to clarify, is this an issue that can be resolved by documenting
>> the semantics of ">=3D1 power domains with names" vs "1 unnamed power
>> domain" in the binding file? Or are you suggesting an alternative meth=
od
>> of encoding this information in devicetree?
>=20
> Currently, through power-domain names, the first entry in power domains=

> is the 'a' domain. We usually prefer this to be explicit - listing item=
s
> - but here, probably due to obviousness of names A and B, it did not ha=
ppen.

I'm probably being slow (it is a Friday afternoon after all), but I'm
not sure I follow. For context, see my response to an earlier version of
this series[1], but I'll include relevant details here.

The "typical" integration of a Rogue GPU involves minimum two power
domains. Annoyingly, we literally call these A, B, etc. Domain A always
contains the firmware controller, which can control the gating of the
other domains in hardware without getting the host OS involved. The
purpose of declaring all these domains in devicetree is that they must
be powered on in order (it so happens in Rogue that A->B->... is always
valid so we didn't bother adding more complexity here to define the true
dependencies between the domains where more than 2 are present).

However, there are two exceptions to this:

 - The AXE-1-16M is a tiny GPU that only uses one power domain. It was
   also the first GPU we added support for, and as such we didn't
   consider the ramifications of not requiring power-domain-names in the
   bindings. That's the historical context for power-domain-names
   currently only being required for img,img-rogue compatibles, we
   introduced that top-level compatible as part of an overhaul to ensure
   we'd be able to describe all Rogue hardware more accurately. Where
   devicetrees containing AXE-1-16M have been updated to use the new
   compatible strings, they also now include power-domain-names: "a".

 - In a few integrations (possibly even just this one), the SoC
   designers chose not to take advantage of the firmware-controlled
   power gating and placed the entire GPU in a single power domain.

The latter point is the context in which we're talking about allowing a
single unnamed power domain; when we have exactly one and it covers the
entire GPU. Semantically, this is subtly different from the first point.
Is there any practical difference? Probably not, but devicetree is
supposed to describe hardware so we may as well get pedantic.

In my previous response[1], I also suggested the alternative of
specifying a name for that domain (IIRC "gpu" or "top" were my original
suggestions), but Michal (reasonably IMO) didn't see the point.

>=20
> Disallowing power-domain names does magically change existing binding.

Does this refer to the explicit power-domain-names: false? If so, is
there a good/proper way to say "don't name this domain" or are we better
off falling back to the alternative of giving it a generic name that we
can enforce in bindings?

>=20
> I think you should list the power-domains items explicitly for each
> variant (see any of my other standard examples how this is done, e.g.
> clock controllers).

We could re-jig the bindings to do that for sure, it wouldn't change the
semantics we currently have (prior to this patch). That would probably
be easier to scan than the current method of having "a", "b", etc. at
the top level and requiring the specific {min,max}Items by variant.

[1]: https://lore.kernel.org/r/f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgte=
c.com

>=20
>=20
> Best regards,
> Krzysztof


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------18nbOxbUWKB4bOITwWe5u0iT--

--------------fTSpL7TtdmF7FYN80vuOwDhq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnoEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaIOR2gUDAAAAAAAKCRB5vBnz2d5qsEQ6
APdnj4q7AaHUMNGg2uvPGfDbl85Cv4VTz1KKr4j0iH1wAQDVNHlaClHkxLw2ui+OOS+6AlkJeafh
bkLDWXIkBny6Dg==
=UVUf
-----END PGP SIGNATURE-----

--------------fTSpL7TtdmF7FYN80vuOwDhq--
