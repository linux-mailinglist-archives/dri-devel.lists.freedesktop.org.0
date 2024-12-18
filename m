Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF79F8DC2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 09:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F6110E65B;
	Fri, 20 Dec 2024 08:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="gUEVDoPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 544 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2024 10:41:46 UTC
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF2710EB5D;
 Wed, 18 Dec 2024 10:41:46 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI9nl3l004360;
 Wed, 18 Dec 2024 02:32:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 s2048-2021-q4; bh=K61JilMH2vMlrh6EW5iPtT0vQC3k4Mx4q4kBIS2md2c=; b=
 gUEVDoPYMgDzhAGpv7rHqTZwHs/+P+pWsdc83j+7yqqDbTUflm8kUknRWJHmNHhT
 r/SOqj46l+6O6N7trTQHV4ofSZlPPhvi5FUCX1oZ0+i5u1qIyUEMWdAV20sqLcfD
 FV3oHxpCpfhm55gN3GdquZEzuVI4ItWW76Pt3QGEUs7AWKtX+kkKqWxFT3tbn+Lf
 CxARUD7LUF+rDeKXnmd0TEpYzcZvm7o3aLfpkG6wAVnNTJ1QRQCRdGKbOLZcR1bT
 398Mlr8ziV5cCy1Yz1BXG8MHnPA4HzTsKOCLlQ2bsnw3kTd9Qhu7/hHopGQTIXO/
 fYEqAjiDQVO4MW8o9QpBvQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 43kv3j86v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 02:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjXALnWTwxJDQ59ER0slVnVvHGyuVBg7zSHH3CzRtL1TC301wd3MT2RpXFfGxyv99SOSALLp4aMNmZGX0GCzHKAbtCmY8dPE4L80ORFcke4Fy3WwWEgjCLSd4iG6BrCxpyJWIdHMevhGT2RloSXm/GTK1fm+LDCNY9qdgHun3PLKQFEJPMfy4vizLGCfng2nh9PKRIJw2Pkmp9St+awnqsWI3P9SP99YR6J5cpmSsx6WSM1euqzoBZrK6ZCTnZ54jr3Qt6/LHb4pJ8O6YuIxPuZZqeRpp4XZVd5zQA+ngE4CVi5bETFyH4uKHPF16vZY4hxrEfI2wVy7RJjLOdkxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwSC8hnKT9bIUElyoTvfq0v0Z3tGTTJyFQJ5cI164Ao=;
 b=m6RmYLm1v+ADQIpF7EXnplD6waZ7X67qF3olZDHUOk4mWOhJ2650zCy0NTZ4fnbn6gwGTtvm3Ow0NtsPLiwzW3RS2V74qFdH5+Sb1W28cwJ0FBhNDlkEjh9hlf0BsIhHZDEBRX9y9S11onfP8mi+Sy9x5v5yIE7NzCFQkSJ8323hqOOMRlPLg+HZkN9tD42R74g3EhosQr3wQeXckWIROmTwobNa5thFR6kpmlGicIH7I9zg9wjExV3lw+8MF9V0VJJLDq6nFxiGiYbFB+CmAhWx7tL2Tuj5A+ZBlUbN1m9lhzgzFCj7THSnHTdnb/TTlXVn3g5MrHUYG0+AGWJspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ2PR15MB5669.namprd15.prod.outlook.com (2603:10b6:a03:4c0::15)
 by DM6PR15MB3894.namprd15.prod.outlook.com (2603:10b6:5:2bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:32:37 +0000
Received: from SJ2PR15MB5669.namprd15.prod.outlook.com
 ([fe80::bff4:aff5:7657:9fe8]) by SJ2PR15MB5669.namprd15.prod.outlook.com
 ([fe80::bff4:aff5:7657:9fe8%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 10:32:37 +0000
From: Mark Harmstone <maharmstone@meta.com>
To: Mirsad Todorovac <mtodorovac69@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Victor Skvortsov <victor.skvortsov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Xinhui
 Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chris Mason <clm@meta.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] btrfs: replace kmalloc() and memcpy() with
 kmemdup()
Thread-Topic: [PATCH v1 3/3] btrfs: replace kmalloc() and memcpy() with
 kmemdup()
Thread-Index: AQHbUNe29CYNbCCtS0e9Zm+mQkMSO7Lrzp6A
Date: Wed, 18 Dec 2024 10:32:36 +0000
Message-ID: <2b4d265c-0efe-43b4-890e-dbab59d9d7b0@meta.com>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <20241217225811.2437150-6-mtodorovac69@gmail.com>
In-Reply-To: <20241217225811.2437150-6-mtodorovac69@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR15MB5669:EE_|DM6PR15MB3894:EE_
x-ms-office365-filtering-correlation-id: c433ed1e-ce54-4eb9-3784-08dd1f4f4a83
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UE1ZbHNxTGJydnpZZ2REdU4zRXFwcmlvcitNd0pERzlOaWtqWE5Nc1NUaVNG?=
 =?utf-8?B?M2VueURJSXI5MzVQb0FSdGZKSTkyenRjRGpMV2F5SFRMVkpsSm9SMFhxMjdS?=
 =?utf-8?B?TTRtMXY4NkdQTkRxSmVWZU5kak5ZRzVJYlg4b1FrRld3S0xrZldVZmJ0SjIx?=
 =?utf-8?B?RFl2SlpkRkdXNHVKUVRrdGRnRzVnZ3pRdFF6aTdxY2xqOUlHU0wzT3g3OGhE?=
 =?utf-8?B?eTFRN0ppV3BWYUJvYXFEZkgxU2c0QVRPUkN4WGQyeHBpSnVFbjA4VGtjYUN1?=
 =?utf-8?B?SGVaakxaSldCSEhmZXFmbGM0RGw1WmtBTzh1R0tKN3gzNEpRKzl2STdscGkv?=
 =?utf-8?B?S2JIN0lvQmxkc2U5UzhPYklQbjd4VVMxaDdkb1FDRUpvdmU0Q1lJRVR6aldz?=
 =?utf-8?B?Qmo5S3BMK1AvVFZONU4vdWViMDROR1k1WW5pc2xkVSt4bSs4SzNzcGdDTDJZ?=
 =?utf-8?B?S2ZZdXlFSElRNDRONVRKblgvUENVNUI3aDBVd2tWaHNJUjZFeVBSa0svSTYz?=
 =?utf-8?B?U3dRQ29adS9kWGpzVXVrVStxQ0dXaDJUNXRRRnliZVZaalBUd2tmM1F4Z2FK?=
 =?utf-8?B?Q1luOUdQWkhjYWI3WWdMWFQzRlJaVWdBN1kxZExJZkV1THNheVEvMTM4NkNB?=
 =?utf-8?B?R2dXUjdPTmdpQ0pSTElHem00OHg2blZOQkh1cUU1bTlHSkJYT3RoVWVsTjli?=
 =?utf-8?B?bW01akRtRUFRYVlCekJSWnU1T3k4MkYraW4yTnNxNWoxczRqc1JjVkhoTTQy?=
 =?utf-8?B?MXZuMVQ5WHVwS2w5amhGQS8vemFGK2V2MjdGVGVKcGl2RHhTUnE5N09aKzF3?=
 =?utf-8?B?dUJreEg5NGZINW1aOENoNElHRi9yZmF0emVMK1JiUllyRTNGUk52WktJeGhx?=
 =?utf-8?B?UmFCNXdtaEd3VktYWnJmZWhGREJJdCtEQVRYV0xWU09mdUxNMXVUN0NQZG1p?=
 =?utf-8?B?NUlFWGFJcHR2N3A4UFVSS2JSN2ovVktkd3VWVUxCUENkV3FEUzV5ZTRvSmc5?=
 =?utf-8?B?R2xkZ1ZHUy9UOGVZUEFDWnRvM2JPaDhLa0Z1ekFpRXVBczU5bzZXVUxsbmZP?=
 =?utf-8?B?a3F0Mkw1cDdVQUZoM21pcUV0SGpzS0Z4aXUxUlBsMVcrUUgyVDFUbGlVWnBs?=
 =?utf-8?B?QXlIeWtBamtSS2J2alQyMDB1d1pGVlNXVjM4aHNRY21HSlQyTTdwTlNVbEZi?=
 =?utf-8?B?bHFWcEVCZS9OempoREZaenh4OGl6K3lUVXdndzZscGNjNURaOWJCb2IzajF3?=
 =?utf-8?B?SE9JalZQMVdqeDZwYzNFYUN4MUN1TlZHSmkvSFl6NjUrNmY4TVJTcWd6OFlS?=
 =?utf-8?B?LzlXUFZvSStsWDNSbkpmeGZ2cFV2c1ZzMGU2UHN0dGhFKzVUbi81ckJoR3Rq?=
 =?utf-8?B?Yk1BeHhhaXJQV0w3cnloZmJQSzljcjNScTRza3ZOZy8zVGtpUHh4RHdTM2sv?=
 =?utf-8?B?ZC8wQ05JTUNTaTFmTUltdSt1U05ucnNlSmhmWGY3S0l2OURUaWM2cXFzdExK?=
 =?utf-8?B?T0QrOGt4ZGVqSlFucG9TY1JEVys1TFJvcm9DQldRN3VJK3pGZHRISFd4TDI2?=
 =?utf-8?B?V09DMzFwTERldXRCYXMxaSs3dlV3ZWFhc2ZyOFJRVHhNbDJ0dEh1Y2ViY2dW?=
 =?utf-8?B?SkpwQmFWQXVjNFlVVmJLcnZFeGlQQlUzQ054eXdVWGYwMnRtRU02VkJFREE2?=
 =?utf-8?B?K2o2VnZBU0d2b1hLUlBScHRCMUJpL1BYd25ZUjhmbWRMUFVWdVM0VDdWT0JI?=
 =?utf-8?B?NHh0UDBvWFlOYmg2YlRFZ3dZVFJUMmtRL3BmNy96aCtLRStKZk8yNkd4VTE5?=
 =?utf-8?B?bFU2MDZyZ2J3QUd5OXlxRk1JOUEydFJHekJnMm15ZjVpN2FraXkzVHE3cURO?=
 =?utf-8?Q?2ehNGbYo7FcOY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR15MB5669.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjYyRXRsMVovdm8zOTdCcFRoRVdMTDV0ZFVhYmZTbE5VL0huaXVFTytyMWd0?=
 =?utf-8?B?Q3ZPUGgxTDZzM3d5QS9hamJ2Tk9qcG9tTTBVMHkyQnBMT1MwOUtRSVlZd1JL?=
 =?utf-8?B?REUwemJtZmozeXByUnV1dkREK09wRTZaeDRGSEFXMDZyQ2ptb3ZCSmU4dlc4?=
 =?utf-8?B?R1dUdXBtQ2kzdTlLM3MxREpMYlBRKy8zSUNUUHl0c0s5SjJyMlg4cEhxMktm?=
 =?utf-8?B?WnlMWGRxVmk3WG10OHBFNnAyeXdYRUZIdThPTWZQMGJNVlZEbmcxajB4Tm4r?=
 =?utf-8?B?OThpUnQxUCtVMGs0ZVlKNUoyL09ZeVZEUkNiZk05UDVXSzRpRThGZm1TcEcw?=
 =?utf-8?B?b0JFVHB0YXVZcGwxOWhzMUkweWJsM2V5V0F4NTB1Nll4UUw2S2k5Vy94TU1B?=
 =?utf-8?B?Mmlzc2todGhrRmdYV0hpbHJ6WWpkUkVIOUZZMmxPV25mb2lKUklieENBQ1F4?=
 =?utf-8?B?Wk52MCtVYkNLNUhDbjI0TlRleUE0azhoWFk3Y2R3OW55eTZKU1lyOEZWbm1D?=
 =?utf-8?B?WjQzRDBVL0RJQnE1NUJnUmthRDFIQWhxdGIzbXJWZU0wMGtjY2paUFkvaGJM?=
 =?utf-8?B?TDcvTzBGRHJVNUIwYzhyL3RENHdJblhlN2NHVzZKbWVBd1NCbXR0dURqZkg0?=
 =?utf-8?B?Ni9aa0lpR2Qzd3dGeDFtckpMRUVtdlFGNXRJczhHRmhaVGdnZnZUU0Zldlcw?=
 =?utf-8?B?Z1d6TGZ0Q0JBZldoUUEvRW1MYXRtZWx2NGowOCtjOFE0eVFMZnFBVXA1c1BL?=
 =?utf-8?B?UGVibFNHRUVYdVBCZzRsdE0wVWorS1JqTEpyNzJiNWtxR09ZUUJoKzl3YXlp?=
 =?utf-8?B?c3VMd0hneENaNzVGYThibVE0MG1wVmsycTBtL0w1VDE3TFRsZnBDNkZpdHlm?=
 =?utf-8?B?YmNWdy9IS3FHYkF6bis5S1VoYStWcVNLUGhMbUJsVndxV0NHazRocTNsWnJY?=
 =?utf-8?B?Y1IxbkFvT29LU0F1ODR0WUJORFE5N3dHSEJqdE8yRjhUWVNYd2VaeWQrNUxX?=
 =?utf-8?B?RnJJclpxK0Z1UUR3N3pUKzUzNmxzNzFraiswUU9teUpJOHF1K1Zsa1hPWDlE?=
 =?utf-8?B?L2lyM2I0ckR4UFdHWjJqZlNGR0V5cDNqOUFVYkcweWpESGx3dHlXR1I4Z0lj?=
 =?utf-8?B?NmZvUnhiNzlSU29TNk5WUDM1QzhnbG8rcENpZUJMUXBBU2VsTFN1dyttSVc2?=
 =?utf-8?B?ZHFJeGRIamRBa1B3VGNoMmVnb3dneHR6YWdiZTIwZ0lERUxvZkVRMWx6c1oy?=
 =?utf-8?B?ZG94bE01SzhZdkc3ZWRSdlUycUkrVWNNdi8wRW0vallWWjBVRzF5UkpUckVE?=
 =?utf-8?B?QnRXUDVOcmVDN0wyMmtpcktBRStOQkxWVWk5d1NsWldYZ0JabTJXbWxmS2hr?=
 =?utf-8?B?RmdpeDF3S2ZNT0FMbnBPQzFjV2lJU3lQdUFOVVloaXg0Sm8yTlUxK2R3UlpD?=
 =?utf-8?B?L2FVbHhVa3NlK1FwSTF4ZXZqMXUyRHN1ak9ZbW1JU204VnV6TXQ4c3M2dUxy?=
 =?utf-8?B?bWVoQnAvNVFlSG9SbXpoRURiZXJ4MUFtRUtiaitWNzNINVZQMFJrdkFORVN2?=
 =?utf-8?B?UGFrYTJpclozdzB0YVlkZE1YV1IyQTltNzZ1TmpaeGkwRTJBWmZPeTdudENm?=
 =?utf-8?B?dzJaZlpCZE1XNTJhTGpDeHo5K3FVRTZlYzBOakRDOWphZEVWQVd3aVJiUTdU?=
 =?utf-8?B?THlZMVYyQnR3NFJZTllTWTJPa0JEb0xEb0g4a21PQ2Q0citvSEpaSDkyaUIz?=
 =?utf-8?B?Q0ZOY3Y2WElNdDhpa09Fc2pXcGk0emZuaFlPZkN2SWxub3lyZStxQUhjZjZk?=
 =?utf-8?B?d28vbk93cGtvd050Q0tGNmV0TEgrZE5BV0liUVQ2NllrMXpYS1VaWURoS09a?=
 =?utf-8?B?cWJPeVA2Vklpd3BwWEhKQ1VqRnJ2VmVzTG5iY2d6VElpOHZ2UDVvWm9Tclgv?=
 =?utf-8?B?L0NGYzhwS1YxOGNSY2tSaGtubkU3OWNuOWxTQW5TQ1lXUU5rNHNoNmdiYkxE?=
 =?utf-8?B?Qk82dTNiNVdEcG9BM3lTMGFhQlRENHU5cm41TVZjTHJKTi9xajByS1JPZzdE?=
 =?utf-8?B?NTQvMUdIaDc1bEk5d09RWTNUaUNXUXZMYmkzckg5MmVZSnZUdUorQXovTDNa?=
 =?utf-8?B?aEZEc0w1R2NuNzBvMllXQ2pCVjhvUlVKdEI4VHdrTmRVVWhVRzkrWHFnNE5i?=
 =?utf-8?Q?/5LR4QS5CujP/88rnKWfy2s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR15MB5669.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c433ed1e-ce54-4eb9-3784-08dd1f4f4a83
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 10:32:36.8842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DDhHJD2FYLz5FbcMDRk8OizRPiDQNFXKEPx7BM/GYMmBuS1v/Cf5u2SYEeuAVU72TsJckphoSBis1QWS0SfrOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3894
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-ID: <2CC97B41C1992C41A9CD97B5E6F732EF@namprd15.prod.outlook.com>
X-Proofpoint-ORIG-GUID: _vg-cbVztfGQK9aAHRiALiO0-RUtfg-N
X-Proofpoint-GUID: _vg-cbVztfGQK9aAHRiALiO0-RUtfg-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Mailman-Approved-At: Fri, 20 Dec 2024 08:15:04 +0000
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

There's a fix for this already in the for-next branch:
https://github.com/btrfs/linux/commit/1a287050962c6847fa4918d6b2a0f4cee35c6=
943

On 17/12/24 22:58, Mirsad Todorovac wrote:
> >=20
> The static analyser tool gave the following advice:
>=20
> ./fs/btrfs/ioctl.c:4987:9-16: WARNING opportunity for kmemdup
>=20
>     4986                 if (!iov) {
>   =E2=86=92 4987                         iov =3D kmalloc(sizeof(struct io=
vec) * args.iovcnt, GFP_NOFS);
>     4988                         if (!iov) {
>     4989                                 unlock_extent(io_tree, start, lo=
ckend, &cached_state);
>     4990                                 btrfs_inode_unlock(inode, BTRFS_=
ILOCK_SHARED);
>     4991                                 ret =3D -ENOMEM;
>     4992                                 goto out_acct;
>     4993                         }
>     4994
>   =E2=86=92 4995                         memcpy(iov, iovstack, sizeof(str=
uct iovec) * args.iovcnt);
>     4996                 }
>=20
> Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
> Original code works without fault, so this is not a bug fix but proposed =
improvement.
>=20
> Link: https://urldefense.com/v3/__https://lwn.net/Articles/198928/__;!!Bt=
8RZUm9aw!4OVzQmIUbyH-UGdUwMAL582hR4Q-7HN2fn9IpyxeA1T8qrcC8RdBVz4xuL4m35_kks=
UllAi6OmdbRehcFpwfHw$
> Fixes: 34310c442e175 ("btrfs: add io_uring command for encoded reads (ENC=
ODED_READ ioctl)")
> Cc: Chris Mason <clm@fb.com>
> Cc: Josef Bacik <josef@toxicpanda.com>
> Cc: David Sterba <dsterba@suse.com>
> Cc: linux-btrfs@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> ---
>   v1:
> 	initial version.
>=20
>   fs/btrfs/ioctl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index 3af8bb0c8d75..c2f769334d3c 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -4984,15 +4984,13 @@ static int btrfs_uring_encoded_read(struct io_uri=
ng_cmd *cmd, unsigned int issue
>   		 * undo this.
>   		 */
>   		if (!iov) {
> -			iov =3D kmalloc(sizeof(struct iovec) * args.iovcnt, GFP_NOFS);
> +			iov =3D kmemdup(iovstack, sizeof(struct iovec) * args.iovcnt, GFP_NOF=
S);
>   			if (!iov) {
>   				unlock_extent(io_tree, start, lockend, &cached_state);
>   				btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
>   				ret =3D -ENOMEM;
>   				goto out_acct;
>   			}
> -
> -			memcpy(iov, iovstack, sizeof(struct iovec) * args.iovcnt);
>   		}
>  =20
>   		count =3D min_t(u64, iov_iter_count(&iter), disk_io_size);

