Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB9CB31308
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 11:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607110EAAB;
	Fri, 22 Aug 2025 09:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="HAsydl0R";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="SFQBjRK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A3010EAAB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:29:06 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57M501l41142438; Fri, 22 Aug 2025 10:28:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=y52k4Sj6Jr2AeU/HvdogzM4Ad
 AVvxZ2sjOTWhuHudag=; b=HAsydl0Rp/zZml4pG44VvBjNWgWtTfLhzPd8bmi3F
 hDr5x9x1rABjMpVw5TmXz2VQvjMreajZtR/svn55rVGkWuFpPZqIX0HdtfK4BJwz
 lkfYCnEjZBkcIWntGN5szt1zWC+gGurWy9Cmr6T3VTjfiqjV3DSJVcP4oX+f+nSi
 dle+JMN8EA0BwR4a2cbBk8Acw5PD86aw4mtlbV3VUq4apON7Ui0FekpvLICXzSvH
 A2mVyxy8GLHMxtHzYcwBcWjvWdH/7V1/pAche8U5gkdh8LSU1y03m5zB66fd1MH0
 7RXvr63idvBngM6BjXheOQ2nwe8Z+e0m2bpQZPZAptV4w==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020128.outbound.protection.outlook.com [52.101.195.128])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 48jj2qpfey-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 10:28:41 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+/rOA/PyrWHO3xq4DV+OL19VOhO2Twi8462LvBZPf9A8A9RiHoC+PyJN1rly+FT7t5VeRTklL3rOdqrbrEKBEB4K40nmusmicFAXsfp2jck4bEDN7Xbiz4F1H2JgDyRQ23+0p/QIMkHC3P3cdCvYfDNJ9es1VLyV3urLrEyMRiRYH6Aw9BDd/D3Gm5d96HoawxyO8ABHSmTGjKl3CvyO3pHUmKk/i0XPWAWYzzYxf9k+1hKqAIYSv87+x5K0fA4aqhQ4PkR7LPvpexv4ZdKc+bZ2O7eDlVFqpZt1fsoDF2CGldUWhkAB9CRKSYVFai4mGqSjVQAPYXF5+7Z4zj71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y52k4Sj6Jr2AeU/HvdogzM4AdAVvxZ2sjOTWhuHudag=;
 b=dtw8qgwjj3NNr7G6bIXmd5qyj0FxsssRkCdBEmP0wRKTPavOeHhIcBfZt9gwBwQmm5EyA00LTw+XJKeEO2LlFju4qrOdYl2ShhoT9bdFdKUR1hUteRwvCpTtaeKPlSh/1dY9deUsuKbdndx2+5EcS3cooeGx4Or1+q8mNe1frB2QKJond7ORwral39j7fr3FZ4FzetjzbOWQ0F1z2El894kaOVmVvy4Dua3iQ7vsuEwfqYDyAQePLEuLhSwIZUClu3ZuXnDy+NQnKKXsHu3XY6AflSRlFpG/zM8Jzm7PTQy7BVoDfiJHcCXY1Qdru5Cu5hnnSNc6tzFPLeecDoixig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y52k4Sj6Jr2AeU/HvdogzM4AdAVvxZ2sjOTWhuHudag=;
 b=SFQBjRK+PxYNgVVEfze96DRR7vQg0ZyhH+k9NCTRD0pTfzZR/p5QdFLLaGuP0tgCQSauxbNT/+WuXgDZLvfq/lp8He3m5j6GD4O/32FP+RDEgAtxbnmE8BqAfkb5C5cNXs7GZ+7lOaEgxnu9pvrEY05Ka90nnk7er4HB9F4s7V4=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB3302.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.18; Fri, 22 Aug 2025 09:28:37 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 09:28:37 +0000
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
 Fustini <fustini@kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v13 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Topic: [PATCH v13 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Index: AQHcE0cjGRHtMZbs+02iUmGfZJD91w==
Date: Fri, 22 Aug 2025 09:28:37 +0000
Message-ID: <aa8d4ffb-4607-4bff-9d87-8635cd37d439@imgtec.com>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222020eucas1p20e40b85b991da0b4d867df76e55350ed@eucas1p2.samsung.com>
 <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>
In-Reply-To: <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB3302:EE_
x-ms-office365-filtering-correlation-id: a86b92e0-9da0-452c-f75a-08dde15e4614
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Qk1XamZxb3c4STlmTDNiNVBSYWd4Z2RJVllxUUpxb1dIVXgrWG1nZ3grODRt?=
 =?utf-8?B?aEFtVDY2ZDB2MWlkS0E1bXUvSzdPSkJ5MnloOW5lcnBuYmdDSlFzZzlFRVIx?=
 =?utf-8?B?eHFETUhFSFBCVkZEUk81ZE9MWE5TUzUrdjB6dDRvSVNYSkxHQmNuY0F2RmFW?=
 =?utf-8?B?YjltYm85WXNDN0ZMYy9waVY3c1orY25yMk9vT0NoSFpqSTRIQU5ZT2Jaa3V5?=
 =?utf-8?B?UzRObnpHWlBBY3FXZXgwbWJjbVpnY1Zmak9mdFBZTTIvYzVrS0o1ZlR2cHZ2?=
 =?utf-8?B?VTQrYk0zNXhUM0NDdmtuWHl3di9GajZqT20rb2JDdW1ZNmRVc2RjNTdES1Jt?=
 =?utf-8?B?a2FBbC9adGc2Rm93U3ZLbnpGTXRtNVdIeUhJbzZ3TlhpWkxuZHM0d0VOWW5O?=
 =?utf-8?B?Q3pPc3ViOFdTL1BlK2xKeG1ST2s3UVFWRVpTWlgrRnZPU1lOMHVZM2Zac3Jn?=
 =?utf-8?B?c1pvUlhMYzZ0RExSdzZnaGF1RXdvTVV1ekZtdzdla0lJMVJIbStJSVc4MU9i?=
 =?utf-8?B?R1FSY3Z1V1dVcDhVSlg0em5ESkxJYkNNOWR4VjNFa2l1OWRrTGIvYzF2dyts?=
 =?utf-8?B?WktlamZVR1dEOHcrZmFQU1BGQ2p0ZFMzMy80QTBMejAvZGVFK0V2eU5tbjM2?=
 =?utf-8?B?U2RXY25XKzF4WG9lSXVkQnA2VDNGc1R0SitzR0EydUNvMGd6Q2FwRzZsNjFa?=
 =?utf-8?B?dTVzNHBSL3h6eXY5eXFsb1lhSkp2b1dIS0ZMa05QMnBCbFlTMVVBOUYwTDVO?=
 =?utf-8?B?WUlKNjd1c2UvRmE2OVRDZ3pxbjRYZ0R0RkU3dG04WUpLYmQwYkNNWTdFTk95?=
 =?utf-8?B?TC9sVjBCWGJjaWxWNXBnWUdpMDJJUFlZOTZzMm9kMjlpcHFlYTdHZi9mZ1NF?=
 =?utf-8?B?dHRLelkzRG52S2lxbEo2Yit0ZU1xbHJzMUNmSjB3RjMxczFFdkZXc2VOUzRF?=
 =?utf-8?B?RzAyM1lIWUhISG96bEdLNGtvbThOZUtPOGsvUWthUUVqa3JVa2hHVUJlZkdq?=
 =?utf-8?B?V0lQTERPbkw1RkRyanVQOCtKL1VPd3R3dG54aXBMSEw2VTdaUFNNblhDL3RJ?=
 =?utf-8?B?M0dpTGJDRWNhdFAzRFBxeW9PbkJjWHNXY0U2VzFBZjdyWmxLKys1aG9kMkZN?=
 =?utf-8?B?V0p4ZzRGU0d2SDVMTHdIR1BQWFBqWWpZNU5NVUdCLzF4K0NwekJwR21rSjhp?=
 =?utf-8?B?ekZNVW9yY0Z3ZEtJL2FWb29kUXlPQjFlamhpM0hZNktSQzlPVDYyLzJ1ME5l?=
 =?utf-8?B?WFB0QnpJcG16d09helY4WWxyS3lKeDNBbUdEays3WnNhZllqanZySTdyUzQw?=
 =?utf-8?B?N0x0VTk2eFFyZHc5Vml1VDVEdi9WYlpwb2FlMVVJcFYwM3dWdzRVRFRldWhH?=
 =?utf-8?B?WG5XSjNvSTRlcmw5RGdZMmJ4dkxkRVJLVEg3eFhCZDY0T0RlT1RFUkc5K0U4?=
 =?utf-8?B?ams5ejRGRS82Y2RyajlrQWFlOFhUNVZ5TTFEMit6ZzlFaTUrb1dpYzROWG1E?=
 =?utf-8?B?QkZiWGZiQUJDMHpLVFloSUhTZDV1OSt2WU9kUktNa21mOCs5MVBhQzltN2J2?=
 =?utf-8?B?S0FiTGpIL2tnZE4xOGtKTEZSVGczUjhHa3U3SXJWbUduTTRyQThrcEViZlk1?=
 =?utf-8?B?SkFhRXorNDNyRGt3UVl0K3BCcWt0SmtUNlBCOVFraUdCR2M5cWNRcUtjMzlX?=
 =?utf-8?B?Z1FBeHAxZ01ZNDVIY2w2bGYrM2d2TFpUVFZIczlCZUY1ZTVweHdJSHgrYUxi?=
 =?utf-8?B?bkljZnNEVVBERmd1a3hQM2hYczdYTHExTUVqTFU3Mk01MXVHdDZrSjIxcjhT?=
 =?utf-8?B?dUc3N2Jhd05Lc21XZVRxOEpIZVRQcUlBVXVPcFdvU2dnMSsxQWNzTWlZR1lL?=
 =?utf-8?B?VW0yNk9jOTF1T3lsTGljMFFORWN3SmFzYnVhVktGbTRVaElMd3RydVduV0pN?=
 =?utf-8?B?VHJpcEs5aWpYL0FNV0hQd00yZzdscnU0S3NwNjduU2kxcmlIdVM0azJacUdO?=
 =?utf-8?B?cDFYcTkzZG1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWlGNEpDbmxjUDB0bzlJVXZZb0JxdktSUnlkd21XdE1vVll2RmcySGxLMkFS?=
 =?utf-8?B?QjZjeUwveUJDNysrb21wYVQyWUtrOVVjaVNGU2F1VGtScHJONmpEampJb2lp?=
 =?utf-8?B?R1BpdzVTbTExUlRwRG5wQXlIYU1LaVMzN1JXTjVLTkxxRGYzUFJxYmUwbFhX?=
 =?utf-8?B?U0h3enRna1ErRHZZcmZaR2xzUGtrWWJKenUyaUZ1TVdLcWFBbGxQSEIrbzV0?=
 =?utf-8?B?QkljRUlnWGdZbzNCdXZxaytJMk5VRThpOW9HNE9Wck9zb2xVSzhlTC96cGtQ?=
 =?utf-8?B?WkFncUF1VFE0eXVnQzMvY3gyMFFobHZLSXd0MEpaL3pyRzAyNmZTMUNvWE0r?=
 =?utf-8?B?d0ZDSE03TERWWGsrSHJPVWZNcmEySitIRi91RjgzUUt5UXZMWXZWaWRCSmNi?=
 =?utf-8?B?eDlER2lEK1A3NnMrTEZ0bU1OWm91cWRTSUlONGc4cVRjZjZLSEFpakR3SzdP?=
 =?utf-8?B?bzZLTUtZb096WHJ1Y1ZUMXUwRVJVR3FISXM1b0RGVkxOcHRZeml0TVRsRXlJ?=
 =?utf-8?B?S3dJcksreGZaUTd1S3RPY2JzUGV1VTV0NkFaUzUrTGJwclFtUVhZTElOWWs2?=
 =?utf-8?B?ZXNob2s3SDdDMzVoSi95YXMwUnJPWXE4cVFPN0c1Wmc4WHd4ZlFIZjEvQlU5?=
 =?utf-8?B?a1pXN3dIWTBmTXJLMlBmSUc1TVBsNng1bW83OW9nOG95MlBKK0pNUmZwZ0Iy?=
 =?utf-8?B?SlhQWE9rZFVSTWZnVXpEaS9uUFZXYWZ0eUdqWTdJeXNRRklaTE9aVTEyQmtm?=
 =?utf-8?B?eEk3TW1PRnhLTWdUR2szbVVGOVk2eWdCZzVCZGtkNnVFY09laEVsK1o0VGJH?=
 =?utf-8?B?MHpaTmNuajFJZ3dabGN5S2c2QWVQdE5oZENRTTlsbUtOSDFiK1Qyb3hVVVpx?=
 =?utf-8?B?MzduaVEwS09MZkVvR0NBeEtlcWhxYnUvMWFlK2NFL0NDV2NIY0tid1h1Zm5v?=
 =?utf-8?B?NVBCM0NZM3h6MUJwRzJJRDRJVUVXS3VVa0FnM0dxZXVERWdBSHJhakdYRUZ5?=
 =?utf-8?B?Nkl5aWJXRS8wU21TaXpzdEpJdHFxSkViRWJGTHVNa29QSmZIOXpCdUR3TENz?=
 =?utf-8?B?OWVFY0tZMmxZb1pzOEFRNVNaOUhGUVBMaUFab2d4VEdJL0x1dktlOG5BM00z?=
 =?utf-8?B?ZzEySGFndkYwczVOa1pES1VNSnJZeTNnV0NvZko1MWtDV2ZFT0M1dTZHRmtw?=
 =?utf-8?B?Y09zMTBnWlR5SjVaK2ZiNUs0a0FReGxlS1hZR3lCM3E0akkzaVBKaXNzdTJB?=
 =?utf-8?B?N3FnZlNoSCsrSWE5WlZkb2QzenNkdC9TMG5UYkloQjVzVnFueFNjU2hTblpy?=
 =?utf-8?B?U01pQ2R3L01IZjFNakJNQXl4dzZpdjZxbDVpN3JubGtwNG43VW9nZnZ5bGVW?=
 =?utf-8?B?bElRQnpQYlVmb0orZlZiRkpuT0NzUElZVy9mdW1aNU1NL2YrSVNBVlR1SGtz?=
 =?utf-8?B?S1haazhUSG1WemJhZ0g1Um5jM21sZlJUeDhTdk4vUXV6c1lMZDhtZUJpOEk2?=
 =?utf-8?B?Vkh2eTBOQUx0TUx0dE91eXM5MTFoY3ZnYnlOeDNFUWs0N0QzVXRaMzhyVU1h?=
 =?utf-8?B?UExKa2YxWG8xQ1I0R2c4VkhRMWdDVXB2QmFVWk8rYUJCdlh6ckFjcXdkMXdD?=
 =?utf-8?B?M0tDWmVodzJiR3VCK083RWppVWJDcDI2a1l5OWFpUGpNcGR4ejgzcjdLRGlI?=
 =?utf-8?B?V1lYelB1ek12b2FxZUViT0FQSFZCSkNaUUhpSk1xZUptSXlzOFdnNWw1ekJM?=
 =?utf-8?B?WUdkTjVHcVl3U0cyZVBXd1Y5a2V5eVZUQ1BOMnM2MVFVS3RPcXRtaUVjWGpv?=
 =?utf-8?B?UU1SbmZPdEM4ZURvYTFuMzZBNEhFWGVacXlFR2E2ZlU4MnRMZFg5VEJINUtm?=
 =?utf-8?B?TVdrV3pwZm5Xdys3MGc3NHBOejBMOVFwdHZBbGRMN2lrN0R5eWJEZHk0bUFn?=
 =?utf-8?B?S21JL25DYVJUN3dEZ1pudmZsRWpJSTU5eC9HTkNpTnJpblYzdjNRSXkvMmhi?=
 =?utf-8?B?THRrWEJRdXZaR1RqdFB6VHQ5OG5ueFhNZnRDZDdJcC8rbHRQOGg1R0tBYlF1?=
 =?utf-8?B?VUxMOTd5M0twQk1iYVkzcVVKbzEwV21ZMXA2SFpicXB3OS9GdHIzck81Q3lU?=
 =?utf-8?B?QTFveUFlQWx5UW9jUUJsWC9UOVUva0RlM2owNkNZSGxQZHpVdVdhWVhDd2xm?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kKJxzkDrURcIHkNRgSm40aqx"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a86b92e0-9da0-452c-f75a-08dde15e4614
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 09:28:37.5167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FF17MgnII1oBNg67YpcWVccm+eMu143sSatHA5kQNyyopDUq8IVeqxa55/UV5nSCqrvM+LLSP4fFkX6OBecOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3302
X-Authority-Analysis: v=2.4 cv=FodcP2rq c=1 sm=1 tr=0 ts=68a8384a cx=c_pps
 a=E97w5jz+2IRT4H1jtDRTXQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=Zornl2wlG5gKESBgaPUA:9
 a=QEXdDO2ut3YA:10 a=3aJdYfjQ7cC_OQ9j5skA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: BLVypNAaUGS-wkcwdHe9gyVG3U3FAXWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDA4OCBTYWx0ZWRfX4WugGpy9i3w/
 smepuPUOfjj94lSvrA3Aq7WvZpfQemCQMjTkdlk7v8G4hVpqPL06KsoCpII/hFmS6kUUqUaEj/6
 s/NzKtdDDCbuyaWEV8bE9n5F5Yb/KUfIq4+JyHTiQeiNGYScIgRgOssqZdUDsBAux7X5V9vSmGn
 BY6V8DlYAxoTSoQKyb++4Haq7LT9U8qvPlGmAWocf/FZoRb9sbRzfGmd3OaY3TBuCdEjHK3M9TV
 uIJpqJgr0UMfsn6VDpaXTKyfRE68d0EgWD0nhKGFwt4rH+cx+NyTKeJt+CRpAeZKz4dHxJqRkfo
 W0bVJHDvh9rw1KRrp88eL8Q5s2SQOCuXUH9m6WWQ5ZBXS7Qrg5BMqAJPDM0h73Fo5NodJqdA7yr
 z7eM4loO1sUlTZmgKL5SffXRPZe1Fg==
X-Proofpoint-GUID: BLVypNAaUGS-wkcwdHe9gyVG3U3FAXWq
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

--------------kKJxzkDrURcIHkNRgSm40aqx
Content-Type: multipart/mixed; boundary="------------JJd0FReICCRZ3UPVwu0kCzvo";
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
 Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <aa8d4ffb-4607-4bff-9d87-8635cd37d439@imgtec.com>
Subject: Re: [PATCH v13 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222020eucas1p20e40b85b991da0b4d867df76e55350ed@eucas1p2.samsung.com>
 <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>
In-Reply-To: <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>

--------------JJd0FReICCRZ3UPVwu0kCzvo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21/08/2025 23:20, Michal Wilczynski wrote:
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the complex power sequence of the GPU on the T-HEAD TH1520=

> SoC.
>=20
> To cleanly separate platform-specific logic from the generic driver,
> this patch introduces an `init` callback to the `pwr_power_sequence_ops=
`
> struct. This allows for different power management strategies to be
> selected at probe time based on the device's compatible string.
>=20
> A `pvr_device_data` struct, associated with each compatible in the
> of_device_id table, points to the appropriate ops table (manual or
> pwrseq).
>=20
> At probe time, the driver now calls the `->init()` op. For pwrseq-based=

> platforms, this callback calls `devm_pwrseq_get("gpu-power")`, deferrin=
g
> probe if the sequencer is not yet available. For other platforms, it
> falls back to the existing manual clock and reset handling. The runtime=

> PM callbacks continue to call the appropriate functions via the ops
> table.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Would you like me to take the non-DTS changes via drm-misc-next?

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_device.c |  22 +----
>  drivers/gpu/drm/imagination/pvr_device.h |  17 ++++
>  drivers/gpu/drm/imagination/pvr_drv.c    |  23 ++++-
>  drivers/gpu/drm/imagination/pvr_power.c  | 158 +++++++++++++++++++++++=
--------
>  drivers/gpu/drm/imagination/pvr_power.h  |  15 +++
>  5 files changed, 176 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm=
/imagination/pvr_device.c
> index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..294b6019b4155bb7fdb7de7=
3ccf7fa8ad867811f 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -23,6 +23,7 @@
>  #include <linux/firmware.h>
>  #include <linux/gfp.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> @@ -121,21 +122,6 @@ static int pvr_device_clk_init(struct pvr_device *=
pvr_dev)
>  	return 0;
>  }
> =20
> -static int pvr_device_reset_init(struct pvr_device *pvr_dev)
> -{
> -	struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> -	struct reset_control *reset;
> -
> -	reset =3D devm_reset_control_get_optional_exclusive(drm_dev->dev, NUL=
L);
> -	if (IS_ERR(reset))
> -		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
> -				     "failed to get gpu reset line\n");
> -
> -	pvr_dev->reset =3D reset;
> -
> -	return 0;
> -}
> -
>  /**
>   * pvr_device_process_active_queues() - Process all queue related even=
ts.
>   * @pvr_dev: PowerVR device to check
> @@ -618,6 +604,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	struct device *dev =3D drm_dev->dev;
>  	int err;
> =20
> +	/* Get the platform-specific data based on the compatible string. */
> +	pvr_dev->device_data =3D of_device_get_match_data(dev);
> +
>  	/*
>  	 * Setup device parameters. We do this first in case other steps
>  	 * depend on them.
> @@ -631,8 +620,7 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
> =20
> -	/* Get the reset line for the GPU */
> -	err =3D pvr_device_reset_init(pvr_dev);
> +	err =3D pvr_dev->device_data->pwr_ops->init(pvr_dev);
>  	if (err)
>  		return err;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm=
/imagination/pvr_device.h
> index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..ab8f56ae15df6c2888feb16=
b1d87b59510961936 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -37,6 +37,9 @@ struct clk;
>  /* Forward declaration from <linux/firmware.h>. */
>  struct firmware;
> =20
> +/* Forward declaration from <linux/pwrseq/consumer.h> */
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
>  	/** @irq: IRQ number. */
>  	int irq;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..916b40ced7eb0408fe985ba=
1b83b3be2eb024bae 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1480,15 +1480,33 @@ static void pvr_remove(struct platform_device *=
plat_dev)
>  	pvr_power_domains_fini(pvr_dev);
>  }
> =20
> +static const struct pvr_device_data pvr_device_data_manual =3D {
> +	.pwr_ops =3D &pvr_power_sequence_ops_manual,
> +};
> +
> +static const struct pvr_device_data pvr_device_data_pwrseq =3D {
> +	.pwr_ops =3D &pvr_power_sequence_ops_pwrseq,
> +};
> +
>  static const struct of_device_id dt_match[] =3D {
> -	{ .compatible =3D "img,img-rogue", .data =3D NULL },
> +	{
> +		.compatible =3D "thead,th1520-gpu",
> +		.data =3D &pvr_device_data_pwrseq,
> +	},
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
> @@ -1513,4 +1531,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
>  MODULE_LICENSE("Dual MIT/GPL");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
> +MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
>  MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> index 187a07e0bd9adb2f0713ac2c8e091229f4027354..c6e7ff9e935d3b348eff695=
3c633c72410fdf507 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -18,6 +18,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/timer.h>
>  #include <linux/types.h>
> @@ -234,6 +235,118 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
>  	return 0;
>  }
> =20
> +static int pvr_power_init_manual(struct pvr_device *pvr_dev)
> +{
> +	struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> +	struct reset_control *reset;
> +
> +	reset =3D devm_reset_control_get_optional_exclusive(drm_dev->dev, NUL=
L);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
> +				     "failed to get gpu reset line\n");
> +
> +	pvr_dev->reset =3D reset;
> +
> +	return 0;
> +}
> +
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
> +	.init =3D pvr_power_init_manual,
> +	.power_on =3D pvr_power_on_sequence_manual,
> +	.power_off =3D pvr_power_off_sequence_manual,
> +};
> +
> +static int pvr_power_init_pwrseq(struct pvr_device *pvr_dev)
> +{
> +	struct device *dev =3D from_pvr_device(pvr_dev)->dev;
> +
> +	pvr_dev->pwrseq =3D devm_pwrseq_get(dev, "gpu-power");
> +	if (IS_ERR(pvr_dev->pwrseq)) {
> +		/*
> +		 * This platform requires a sequencer. If we can't get it, we
> +		 * must return the error (including -EPROBE_DEFER to wait for
> +		 * the provider to appear)
> +		 */
> +		return dev_err_probe(dev, PTR_ERR(pvr_dev->pwrseq),
> +				     "Failed to get required power sequencer\n");
> +	}
> +
> +	return 0;
> +}
> +
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
> +	.init =3D pvr_power_init_pwrseq,
> +	.power_on =3D pvr_power_on_sequence_pwrseq,
> +	.power_off =3D pvr_power_off_sequence_pwrseq,
> +};
> +
>  int
>  pvr_power_device_suspend(struct device *dev)
>  {
> @@ -252,11 +365,7 @@ pvr_power_device_suspend(struct device *dev)
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
> @@ -276,53 +385,22 @@ pvr_power_device_resume(struct device *dev)
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
> +err_power_off:
> +	pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
> =20
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/=
imagination/pvr_power.h
> index ada85674a7ca762dcf92df40424230e1c3910342..b853d092242cc90cb98cf66=
100679a309055a1dc 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.h
> +++ b/drivers/gpu/drm/imagination/pvr_power.h
> @@ -41,4 +41,19 @@ pvr_power_put(struct pvr_device *pvr_dev)
>  int pvr_power_domains_init(struct pvr_device *pvr_dev);
>  void pvr_power_domains_fini(struct pvr_device *pvr_dev);
> =20
> +/**
> + * struct pvr_power_sequence_ops - Platform specific power sequence op=
erations.
> + * @init: Pointer to the platform-specific initialization function.
> + * @power_on: Pointer to the platform-specific power on function.
> + * @power_off: Pointer to the platform-specific power off function.
> + */
> +struct pvr_power_sequence_ops {
> +	int (*init)(struct pvr_device *pvr_dev);
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

--------------JJd0FReICCRZ3UPVwu0kCzvo--

--------------kKJxzkDrURcIHkNRgSm40aqx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaKg4RQUDAAAAAAAKCRB5vBnz2d5qsMzj
AP4/Jr16IB6GykZkM/5G23PgH+UU266PrN46tleziUznZAEAnCyLzMQFsAUWwPHlNweke5KXIfpo
7x1z4k5Tw+xoYAE=
=8xu5
-----END PGP SIGNATURE-----

--------------kKJxzkDrURcIHkNRgSm40aqx--
