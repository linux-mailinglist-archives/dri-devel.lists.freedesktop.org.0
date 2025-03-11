Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F40A5BDEC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 11:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72F110E14D;
	Tue, 11 Mar 2025 10:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="KwPpmmqW";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="i6AKt1wd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601F510E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 10:33:41 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7XLPM005315;
 Tue, 11 Mar 2025 10:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=rlqqn/zV6dW+PVMvvzejjC3Tq
 +ob+1gisKYrjIJdjEA=; b=KwPpmmqWqzI3h0FM+fuIdMGV7aKY+2+yiSnB2agGJ
 jZbm5oWZNlYCMubjg3HiSmF5pIyqB95JBnnD8FJMfkl/zOcRApIpmCNyClofvpkX
 +jGwutu3AD7okyWXUssOdcfMDh4oFsXMlll7rwkmgu02w/MZwmLeN44QRFKwPnaj
 wPV/Qfa+p9Nx8YGs5nxjxaJOD/Psb6Ogdmi3Y0Tk+lkMiOoRD4xNO5iW8kRT18Dq
 tFv57z9eaFgjhsyS62oREVi3HnR4b8P9WUgQfTcecQOZ6nxqAv5jLXOolJYS2AZn
 yvzsXy/mKKjQjBX6fEujuJiDhBVRnsStwM4fjhjs5M6Yw==
Received: from outbound.mail.protection.outlook.com
 (mail-ukwestazlp17010004.outbound.protection.outlook.com [40.93.68.4])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45a224rhjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 10:33:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqUlHdQ3lHwF5CsM2z2v/wxjPwsPfAx6h4LWVSFtUe4S553hp4DUqck69rGnN5x6oMVB+mm7faVTAetX7bORzyJDATBkCEzv2DoZF72E+gRlIhQbeZdaYDSikQZ8xBtqb+06RHe2J1tYL2glqj5JrK7bLLwtFNEOw31J59CkTRJ/KuhB0dBuPdjVNj/kOQbefik4pe1snzcBAWi1ZmcrGYCc8aPbQQ2mx5voM0VsA5sDID6k7q3PKP0NNhFsWHhjpM3AAefQ/OVUeCm1M8BNgig4zS+g3hLZmJrXwgcQkldyb3l+vqgAoRmoKu4KJlKYCfpM/QujDxpY9RV7TI7COA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlqqn/zV6dW+PVMvvzejjC3Tq+ob+1gisKYrjIJdjEA=;
 b=mK4Ay3lLP8mj40BNuLyK9hWfjkPGm3Nemb2W34zKKxfFY15nz9G+uMBWrhwN4nVkTSHSpD6lWdSewMU8tcsUDMZjlrZS3327pNT+++Vv5C0eVyzsAEpxQYJXbjCokHz5+GiKeb74UIafsWInNRg4yOkUiCIPvRAP3TSMRP/EHLlQIWQ45X4octkBJ4HGNyULWulVGkMyuoDeACJ9INAKvi+lhHYJVYai3oy/8nx1kyl1WHml1FvPFTGrG37bll10ULqDssW21D9eyHCOPHUHJWFRt4JfgTPqt69OYS3bN0d/hOoiD97uGwFkBLOnEIR9i5t/BLAuHt55DV2bK3mJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlqqn/zV6dW+PVMvvzejjC3Tq+ob+1gisKYrjIJdjEA=;
 b=i6AKt1wd3fPAkow0KhwtHd6CtNRNkJEsRaTnocAYhfJ+KWDtH8sXzxVpnE8fHwcGzNVSbomu2P3B1O4s64tS151N6Qs5KbjVLxCc//cwLV3dblcPRHdyLfikwdeaENiD1tbWIN55emHUz8L2HhsY/4UtQLvGM1aE+jEEpt0pKK0=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO7P265MB7637.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:412::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.21; Tue, 11 Mar 2025 10:33:26 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%4]) with mapi id 15.20.8534.018; Tue, 11 Mar 2025
 10:33:23 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Randolph Sapp <rs@ti.com>, Darren
 Etheridge <detheridge@ti.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>
Subject: Re: [PATCH v3 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
Thread-Topic: [PATCH v3 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
Thread-Index: AQHbkb3XF6GcdeLkqEaOsDCRsFWB5bNtkQqAgAAtgYA=
Date: Tue, 11 Mar 2025 10:33:23 +0000
Message-ID: <cc6a19b3-ba35-465c-9fa6-a764df7c01c1@imgtec.com>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-1-143b3dbef02f@imgtec.com>
 <20250311-flashy-rattlesnake-of-rain-dcc4f6@krzk-bin>
In-Reply-To: <20250311-flashy-rattlesnake-of-rain-dcc4f6@krzk-bin>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO7P265MB7637:EE_
x-ms-office365-filtering-correlation-id: 59f4621a-efce-4fdc-5d87-08dd608826bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UmJOKyswaENZQUZpSDR6SlIyWlBZSGwydVRRT2tqcUIza1NaMGgxOUkxZE5O?=
 =?utf-8?B?VDVQRkx2OGl1V2tROU94dXBQUG1XRUxmc0g4VjlOUk1PbDlIbmVmbGJYUE1n?=
 =?utf-8?B?UlpzRnJ4U3ZhTTlPZjErZWc5TVdMMU9QUDhHcTEyUlN1S2lLNnpFYitUUDIy?=
 =?utf-8?B?bGlIbC94VUdqbGUyVXEvSDVyRmNSOVRMbEhnNFludGJBRU1sS1NOcnFSbTBU?=
 =?utf-8?B?U3dKNXZkVy9MSGJUVHUwNlJ4Zm1JUGdTaHg0czhNdFVTT3F5WXh0VXNrUzky?=
 =?utf-8?B?TFJ6UUtab0llSWNHbVJLSEFGNmxXcVRjUSs5RS80WVMzZU44NnhyUTA1OWRF?=
 =?utf-8?B?TEVKMFRoZWE5NnJraGltQlowcHdUQndGZTNSd1hnUy9YS05rZ2lsbzF5c0FE?=
 =?utf-8?B?eGNrYTdudkw1WW9MYm1MVDJ1OWdRNVRyNUxHTVM5Tzc5STlMMHE1aVhVeTNJ?=
 =?utf-8?B?a2lkNGczM1ZSam1mVTlpS09JWEZiWFc5OEs1c2pQVzZvWW04cjU4L0xBQ1BU?=
 =?utf-8?B?Q2h3TEdhaXAyV2FLSDBBT1Nwc3pvWmJBYXVMZ3RCS21LSjh4N1EzNXlONTRX?=
 =?utf-8?B?Z00rYjdvZ1VFL3AxNWwvVFB0QkdVdkYzNUlrSDdhbHhWWDNvOWs4WSt1L2l0?=
 =?utf-8?B?OFJUaUd3SXZocHFmdE43K1phdm1qbjN6SXhuVzFaSDV6bS9NY2xVb0xGZlJT?=
 =?utf-8?B?eWFDWDNnL1E4ZnNFQW9Bbm9wd1BrRkRkaXA4bGlXczg1Ny85d1lHclFEajk1?=
 =?utf-8?B?MmRNZWRBRk9WTkZTWFd3V3EremJXSVpES1QxNENpNWhCcGlJUEJBVHNjNXFN?=
 =?utf-8?B?YnZ0SXoyQmVlbDI3bFBsUUJoMlhDaTN3alMyQllaM3BhM2tSS0hKdUVUT3J0?=
 =?utf-8?B?T015a0lhdU9nR2dMc2hkdVMyYWtxSzVtaDI1czlwRThWcGNCaEl5UEVQWFN2?=
 =?utf-8?B?VFFQWlJHeG5TaGVHT2FyaWRyYmIyRHBxenFrcUhCWDdtUFQ1NVdZaGVaMWlh?=
 =?utf-8?B?aXdNS1N0MUVOd2hNUk8vK3JYTkpnRmdjd21xR3Zua3VMT1VUNDk5aVJRV0pp?=
 =?utf-8?B?UG12bWswMjRqdGdaZGVFZGl6b0ZWVWViRkgxZUhoWDNNWW5ORms5MWc2OTJ1?=
 =?utf-8?B?cXcvZzdCM2FrVEM4Q3pBck1icnJYazNxMzdwbzNRQzJMTkpCN1MxcG13NkJ1?=
 =?utf-8?B?MkdTdVIvZ2JseXZoWFIzTHdkUDBwMHBOelZiR3RQK3VnMWNBS0d0S242eHRZ?=
 =?utf-8?B?SzZON1FUa3F0UUQrRnJqR2lmd1lnR2FYdnBDL2V1ckhLV0J5cGRoaVN6LzFo?=
 =?utf-8?B?UWxGYlFWVzR1ajJ3YWdIZXNKbk1VdGhCNm1qU1YzY3ZzUmtDWUJ6L05ITnht?=
 =?utf-8?B?WmFxQU55VEIweDVJMFJSUDR0V1JHYVl5eWN4MjFNaVU4ckJtTmxENUVLWThS?=
 =?utf-8?B?Rm8rK0dIVlJhbHNBR0M4WlI5dVd5MDFWWlZyenVCTEdDT2J0bW9sVXZuczlr?=
 =?utf-8?B?d3FCdzNMWlZvZkxISFJqY3REaHlyTVhNcFhsTHZzZzY2S2d4cytIc1VQbkhN?=
 =?utf-8?B?ZlArZWd0aEVMSE81N3d0SjNRMGZCMWorWlZrUWVJQkdNbEtMVW1YMmNQZ2Fz?=
 =?utf-8?B?Zkc0TS9PWDJZNWEwQ2J1ZjV3TjNEcEVHanM2RXA0TkduOUdTdVVqNWkraUpy?=
 =?utf-8?B?b1MxY3JMcUhXeWM2NXFqdUM2U05FSW03RE03WXZ4MC9UemxOYVIwemt0TjFp?=
 =?utf-8?B?MUNxM052UTJqdFpXUXh3N2pLVFNmTTVsdG9jengyMW1iRzdMTURzYm5rcGlD?=
 =?utf-8?B?eVc0SURpbjNWU0NXYis2NFNweER4bFhHZStzYk1MblFaUThSaDg3emZCUFN4?=
 =?utf-8?B?WTRoemR6Znk0bG9JZ1IvYkNZRFhaVG9vUlp5ZDZaUnF6N3NRZWRNVjFjR2h6?=
 =?utf-8?B?ZEpUYmNlTG5zNkFwYVdpTktZVzRESFdBcU5qR3o2WGhGK3VUS3N4WGNEWWVW?=
 =?utf-8?B?dmV3MGlBdzRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elkzOTJmeXlpdGZOcDhWZU1KV20yMjU4VzRoS2Q0dTdReTB0eDNuUEVRQjhk?=
 =?utf-8?B?dy9MK1dZcVBjWFF5V2ozMnUvZWpSYkZlUEkxTlZxMkJuN3NTT2NKaCtTYmVq?=
 =?utf-8?B?K1Q1cHdYTG5JVWdtTDI3RnNtTjR1Z0hMa3VabXdSM3VKUGVOUWtKdTBESktP?=
 =?utf-8?B?OG9PM2p4YVZhSFUrQnhWQVhyOXJheCtDbS9OMk5ZemN0OWFaU3h2ZDBKekRt?=
 =?utf-8?B?Q0ppRmx5Sktpd1ZxNlk3VjNQNWxrcXE0MmhTcjNMNlIyUnZId29zdnF2NW96?=
 =?utf-8?B?MW1Bb2dlS1ZOZFA5TGRzOUZGU3FlcGxXdEVqck9jbGxOSkJDUzZEd2hHT3RB?=
 =?utf-8?B?SUZQUUROWlRGZERKU2dDQ3g0NmJlU0VWR0pxM3Fka2pGcmhKVHdYcnZ4VlhM?=
 =?utf-8?B?UE8rYXRjQnQ4bGN3QnAzTEFxYXJjYmhpa1lTYUZWaGcxTnIrekM2dE1VcEtB?=
 =?utf-8?B?WmIzR3JmVkJ4dTJIWUJ4SW1DTmtQZDIwV2hySGI4K00rNTA0OUw5UzlTNXdK?=
 =?utf-8?B?NnVOZ0tSWjJrZHBSaGh0VWYxZVFJUmNZd1B1dG1xcjVIZnlEWGE0MzNPSU9W?=
 =?utf-8?B?bTZxMG90VGNldW5SK0ViNGdtRmRFQ242UFdGaUpsWHNnaW5MYTFGR2ovOEZP?=
 =?utf-8?B?R0RhRFF6RlpaZUtzdW12NjdZUDJFRkI4TnY5TkFMN1N1ZjZZKzFnV1ZkQkFN?=
 =?utf-8?B?NmZlaVp1cFFuNnFtaXZvZWJqd3c3SXErQjk2NnRqcVhnUWRIMjhhN2NxWlh5?=
 =?utf-8?B?dCttQ2pTNzRwNXIxN3d4ZDMrclhBRXBNZHd4dGV6V3pKNVJ1NlJlb1d4cjda?=
 =?utf-8?B?L0NEa3duTzJpZzRJZVFOZXhYTmU5czV1QnRGY0NtZmxqM2wyT1g5UHp1QUZS?=
 =?utf-8?B?Zkh2Rzd5QzEwV3d4ZU41cXJEMzVYd014N0QyclBXVVZpOVM3eFdxckdZVDM1?=
 =?utf-8?B?Zkt0aFo0R1RUdm1Vc0k2Qk9DOExiQmRCUVMzZ3dhRUZpcGdrVC9va0U2ZFBn?=
 =?utf-8?B?MXNBMEErYWJVM1I2T0JtNnVDdE1kUTJ5ekVWdnVqbkQ4MFJjc2hqMkNqelZR?=
 =?utf-8?B?OEJNazdzWFd5emNNbWRYVHZzSk5rMkZPMHhLd3JGbnJRWXVWRk05SmgyTSs4?=
 =?utf-8?B?RDJzSGRJV2NWZTRSL1RPc0Jhbjk1L2pzenBGVjhWVEFYcVd4UFkveitaSUNv?=
 =?utf-8?B?K05JSUlZY1JQZm9CdVNqcjNxYWFZOFJCTkM2b2ttdXF5U1I5S3lJakR1QmEx?=
 =?utf-8?B?MHZKa1hIQlZKRjNYTnZoWkRMR2tER0prMG1PU0RLWUtDNWlzREFRZEUrRmtN?=
 =?utf-8?B?b2hBVlFOc0FhekthUlVHZFJIT0ZMWjdxV2NtUXljYmkxU3pFRzRXb1pKQ3Vm?=
 =?utf-8?B?TytLQWJNMExGRTdpYW5Qa3kyQ3NEcDVidFFUbWFxTm51dXFvemE2Y0g0MEg0?=
 =?utf-8?B?NlJCUkJOR0Nqa0l2UGc1SzV2M0hvUlUwaUhjRVN0TmF3endsT2tZaitPRWNp?=
 =?utf-8?B?czAxdGpUZjRmeTZ3RGxxejBmZEZHWGhERFlEc0c3VU95QURydFFvdFdjcW15?=
 =?utf-8?B?YjdRMWJWSjEyYWM4eThxMk44NjViL21CTEp6ODlzRGFUVnQ4QUFZOUg5Q3g2?=
 =?utf-8?B?K3hIUU5KN0lvN0ZSZ1pKUi9IM25kSW4yVzg4Q2JEdkYxRk1QQ2g4bWhjd2FS?=
 =?utf-8?B?OGVmQ1dNMlpuTE9oN3B6S250WDVCT1JxTlJmZThjT3h3UUJHTXVseTc1ZGZP?=
 =?utf-8?B?eXBKRzhkbjFtV0wwK1UvcmNqcW9FQUp1ZUlnNEtCU0cwVVVMOG8yWVNXTERD?=
 =?utf-8?B?SXdaQkpLdENJYXhLaDN6TGFLVEVBcXJKZTlvUjVrQkx6S2t3elFtZEU5UVAx?=
 =?utf-8?B?a2VnT1orbzZHOUNKdGRaNmsxT1VDRXZyMlk1RlNXRXd4ZkM3TWFWbDlOZ1c5?=
 =?utf-8?B?N2lWbmZxNGNXYmpJRlR1OEtJd0xRdkhwenFaR09CZ1NPQ0xxbXZLakhQSWti?=
 =?utf-8?B?Qlovb0JOdW1xemJDMnJlcDRWZ1dyQVRZc3FicEJYZTBxZytDMWNHTTM5TERD?=
 =?utf-8?B?RkJhS0kzUWhCcE4vZHBTeEJUZE5OeGc4QnA3OXljeERrbmx5Zm5UaUx4V2E1?=
 =?utf-8?B?QldFZVpzMnNRaEgzcjNyYUVNcXNvRjVpTFhhMFhwWHQ1TVYxSFJGdGVHa2th?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BIQGar00IJmhu2u0nlgGln1w"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f4621a-efce-4fdc-5d87-08dd608826bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 10:33:23.8277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5R3LC1CgwxmWpP0z5Ns/bPkXfX1Z8xXvaOHQ8xfp8YeXHEqNMvyeOAn53Nug6ZT3tBDj1wcZ+GLaQWa8afJaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7637
X-Proofpoint-ORIG-GUID: qa5IKub6wgxuRO9DMe69z5uOpbslksiL
X-Authority-Analysis: v=2.4 cv=U+eSDfru c=1 sm=1 tr=0 ts=67d0117a cx=c_pps
 a=tbUAc5YXJZE2aXMCunvlBA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=rntjs3-v37qsdkEPFO4A:9
 a=QEXdDO2ut3YA:10 a=1zhuFutDXnl0JYzLNnYA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: qa5IKub6wgxuRO9DMe69z5uOpbslksiL
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

--------------BIQGar00IJmhu2u0nlgGln1w
Content-Type: multipart/mixed; boundary="------------1WpGWfr5QTDpGaYBknF1PKu0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
Message-ID: <cc6a19b3-ba35-465c-9fa6-a764df7c01c1@imgtec.com>
Subject: Re: [PATCH v3 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-1-143b3dbef02f@imgtec.com>
 <20250311-flashy-rattlesnake-of-rain-dcc4f6@krzk-bin>
In-Reply-To: <20250311-flashy-rattlesnake-of-rain-dcc4f6@krzk-bin>

--------------1WpGWfr5QTDpGaYBknF1PKu0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/03/2025 07:50, Krzysztof Kozlowski wrote:
> On Mon, Mar 10, 2025 at 01:10:25PM +0000, Matt Coster wrote:
>> The first compatible strings added for the AXE-1-16M are not sufficien=
t to
>> accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
>> string refers to the entire family of Series AXE GPUs, but this is
>> primarily a marketing term and does not denote a level of hardware
>> similarity any greater than just "Rogue".
>>
>> The more specific "img,img-axe-1-16m" string refers to individual AXE-=
1-16M
>> GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16=
M
>> only uses a single power domain.
>>
>> The situation is actually slightly worse than described in the first
>> paragraph, since many "series" (such as Series BXS found in the TI AM6=
8
>> among others and added later in this series) contain cores with both R=
ogue
>> and Volcanic architectures.
>>
>> Besides attempting to move away from vague groupings defined only
>> by marketing terms, we want to draw a line between properties inherent=
 to
>> the IP core and choices made by the silicon vendor at integration time=
=2E
>> For instance, the number of power domains is a property of the IP core=
,
>> whereas the decision to use one or multiple clocks is a vendor one.
>>
>> In the original compatible strings, we must use "ti,am62-gpu" to const=
rain
>> both of these properties since the number of power domains cannot be f=
ixed
>> for "img,img-axe".
>>
>> Work is currently underway to add support for volcanic-based Imaginati=
on
>> GPUs, for which bindings will be added in "img,powervr-volcanic.yaml".=

>> As alluded to previously, the split between rogue and volcanic cores i=
s
>> non-obvious at times, so add a generic top-level "img,img-rogue" compa=
tible
>> string here to allow for simpler differentiation in devicetrees withou=
t
>> referring back to the bindings.
>>
>> The currently supported GPU (AXE-1-16M) only requires a single power
>> domain. Subsequent patches will add support for BXS-4-64 MC1, which ha=
s
>> two power domains. Add infrastructure now to allow for this.
>>
>> Also allow the dma-coherent property to be added to IMG Rogue GPUs, wh=
ich
>> are DMA devices. The decision for coherency is made at integration tim=
e and
>> this property should be applied wherever it accurately describes the
>> vendor integration.
>>
>> Note that the new required properties for power domains are conditiona=
l on
>> the new base compatible string to avoid an ABI break.
>>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>> Changes in v3:
>> - Remove unnecessary example
>> - Remove second power domain details, add these where they're used ins=
tead
>> - Avoid ABI breaks by limiting new required properties to new compatib=
le
>>   strings and making all binding changes in a single patch.
>> - Links to v2:
>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-1-3fd45=
d9fb0cf@imgtec.com
>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-3-3fd45=
d9fb0cf@imgtec.com
>>   https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45=
d9fb0cf@imgtec.com
>> ---
>>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 43 +++++++++++++=
+++++----
>>  1 file changed, 36 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> index 256e252f8087fa0d6081f771a01601d34b66fe19..5c16b2881447c9cda78e5b=
b46569e2f675d740c4 100644
>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>> @@ -12,10 +12,20 @@ maintainers:
>> =20
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - ti,am62-gpu
>> -      - const: img,img-axe # IMG AXE GPU model/revision is fully disc=
overable
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - ti,am62-gpu
>> +          - const: img,img-axe-1-16m
>> +          - const: img,img-rogue
>=20
> That's still ABI break. You got here NAK. You ust preserve img,img-axe.=

> Your marketing troubles do not concern Linux.

I think I'm misunderstanding something here. Is keeping the existing
compatible string around in the deprecated item below not sufficient to
maintain the existing ABI?

Would adding img,img-axe back into the updated list (bringing it to four
elements) be acceptable?

>=20
>> +
>> +      # This legacy combination of compatible strings was introduced =
early on
>> +      # before the more specific GPU identifiers were used.
>> +      - items:
>> +          - enum:
>> +              - ti,am62-gpu
>> +          - const: img,img-axe
>> +        deprecated: true
>> =20
>>    reg:
>>      maxItems: 1
>> @@ -34,8 +44,13 @@ properties:
>>    interrupts:
>>      maxItems: 1
>> =20
>> -  power-domains:
>> -    maxItems: 1
>> +  power-domains: true
>=20
> No, widest constraints always stay here.

Ack

>=20
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: a
>=20
> That's not a useful name. Are you sure that datasheet calls it power
> domain A?

Sadly yes. With the Volcanic architecture the power domains get real
names, but until then we were stuck with abc. I shared a snipet from the
BXS-4-64 TRM with Conor in the replies to the V1 series in [1].

Cheers,
Matt

>=20
>> +
>> +  dma-coherent: true
>=20
> Best regards,
> Krzysztof
>=20

[1]: https://lore.kernel.org/all/ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@img=
tec.com

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------1WpGWfr5QTDpGaYBknF1PKu0--

--------------BIQGar00IJmhu2u0nlgGln1w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ9ARcwUDAAAAAAAKCRB5vBnz2d5qsLP4
AP9IpADjYkcJBxf2TbZu3S3oAJxkIuvu0dy1AhKw7cB1aQEA715g7+3Zb/78xF2DWdj0V7l5Tu72
OlkyLJIxFjjWyAQ=
=ukCL
-----END PGP SIGNATURE-----

--------------BIQGar00IJmhu2u0nlgGln1w--
