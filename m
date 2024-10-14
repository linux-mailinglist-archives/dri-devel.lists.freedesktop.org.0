Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEFF99CCA4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88A410E2A8;
	Mon, 14 Oct 2024 14:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="wQ7OqUQ+";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="HyZydt2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D1D10E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:21:05 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E69Vu7004748;
 Mon, 14 Oct 2024 15:20:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:message-id:mime-version:subject:to; s=
 dk201812; bh=5t7E+9JDM6vaYYUfGvEC3x+LDJR5Du51uwPF4XFdogM=; b=wQ7
 OqUQ+MnYJ6p3Is+dczOGbFK1Qk/vW7BZmKYHONnqCSj8sNZFf+qJsxSUAjt1zKrZ
 ZMY03F0Kt9ZXxUICWh05EaQSZgXHxitI34Y4NRsmExY7zP/2h3HyqbDv5wVKongi
 j8lNVX8DecNLnDXLBCrAUWkiprO/cCudeMjq3GrJS3mu9D8GWhUR6nDEmd8mk8Yx
 C19E2+H5neff4CweZ1DbF8T05ZvhBCyzeIaltgefbhAOyPUXka8PyERAP+hqWEPH
 Ki4Gw0eADfsCoCQr/fwylmxjsjDjrpzVamJx+xa1eew3cDPVEWZ0tdWwrwOB/5bH
 FGwF1OIIbrrBDSTCn7Q==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazlp17011029.outbound.protection.outlook.com [40.93.68.29])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 427h6w29bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 15:20:45 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGQ4kGx8F+rodgg3WZfflz9KDJxQ+CkQrF1VgrRu+X40HlBpA0TSVKdT5W6U43puoDDmb7XozwZ8Tz1xrxLe6odqklDmLUYKJEF5yB4dfEgieLt021ZIyfmWqJl38wGjk06HqkCTzs14EdFfFFGviR6ynzFs6Y5BD8qVafIycl/4jp6xVDAWqAKliZwrdgBt9CsvIEN8zGTr3+sGdm7lTpyCLPlNMx9rnevDOsy3huI8K76QWIueVkBYcdZQo9/aJADyBmnESQoLtE9w/WGuYygdPk8p4vZc4FPj1fe7vwO2KcDNbICF8eRukouScjnhCo+tx48fIBw1nT2CxJtMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t7E+9JDM6vaYYUfGvEC3x+LDJR5Du51uwPF4XFdogM=;
 b=XEmR3gJ8PnrEoK0CYbVZTNOXir+0TvCgQl6+1YrXfDDg51scvvK8jZMbmVvPY99nPmSYYykrFnxlR5I/xwFK016AFnx9csXlw4C7zSu+c3apyV2jbJ8elj4O1pz9s537211dhaAMZF+ykItr3SL8JcMKZcc1JkvmCg7iVtWi+Op+U702vYj4VxwDuL6Og3ChXoXTpAlm4zJdtBTXUI+KsMBM9SN0P5uokaVSnNUs8xKdsQ8JA4szVyVXIn9wpKCv1iC41+q0SL4RRu39VNRMZDpeDUijflSCg46nh9mDTgacn3krrZBk2Kq6yHeTRQrbQOUfSQUDe/KK0S4lacMDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t7E+9JDM6vaYYUfGvEC3x+LDJR5Du51uwPF4XFdogM=;
 b=HyZydt2ch0QZzEWfL8yn4czPL7veoWpH3CRaX0XgRDXlaL25+uRWq0sDRieXLakpZ2d/dtwKn9WpidWky+eZe1j1KUHb2hiZcKISCbU7REN8SSKjv2PMpnzC39YcKqOGxza+pl56n6K19R8c46vDXvzZB3oNpw09aNE70PSqV2E=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5894.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Mon, 14 Oct 2024 14:20:43 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 14:20:43 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] drm/imagination: Break an object reference loop
Thread-Topic: [PATCH v2 0/2] drm/imagination: Break an object reference loop
Thread-Index: AQHbHkRAIAi6pdoi70ekZqOZ7q7PKg==
Date: Mon, 14 Oct 2024 14:20:43 +0000
Message-ID: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5894:EE_
x-ms-office365-filtering-correlation-id: 542fcdfc-12b4-4804-90bb-08dcec5b6358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Yzc0ajVxaXgwM3AzK1JsZm1Iak5LUW0rdjNUNU1VQzNxWWZQNE5HbTIzOS9u?=
 =?utf-8?B?SG9jUUt6aGhFQ1ZTdlh5WHlwTmRsQzVEcUE5R2NPUkYzUDVvWnZrR1BPVWFW?=
 =?utf-8?B?ZE9jSXRvYjBVWnVUZDNyNjBnUmRudWVORG0xK2RGenhZL1k5UGRDbGtGbVZw?=
 =?utf-8?B?YnRvVUNuQ09kdVlhWTRGditmY042TUY3K2xJaExlMWFUQ3pEc0JHdjl4TzZW?=
 =?utf-8?B?Z2N4V1VvWkRCRjl2am5pd1c2OG5iZC9JT1JUWWdWNW0vZ3hrTU5NVVlQZy9x?=
 =?utf-8?B?RERGRk1tYWxQaVRuM09ONjhOSkhtTnZNV3E2OStXTS96b0dETzhrRWJNMEtt?=
 =?utf-8?B?T2ZON2VRRUh5VUJFbVBkOHNtVERCNnpudDRFVUt0czlMSXltVGZxSWRxNkNV?=
 =?utf-8?B?WExOVjlxd2xVRlJ0amtXZVBpb0k4UDVsM0pKYlZhRHlEREhkL3BHUmMxL3c3?=
 =?utf-8?B?b09LcUZIbkVWcGd5aGNiTURDTnF5cTc1QTh4UnBPMnREU0toclhicFYydlFr?=
 =?utf-8?B?L1R5bC9TRitLcU41MnFSUklqdjZaL0RtY3o0VDJTYk5nOTZXTzQwbmN1b0Q5?=
 =?utf-8?B?TDJYT2Q4S3JxVkl0MmhLWk9BMEc1Q1pxbFREYWsvWDJnQmVWQ0hHYWtlazhF?=
 =?utf-8?B?SU9aUGdNMG9rM3I0aTcrUnVwdG1ad3Y3QllPckVlV1RBN0JZdmxrSFpqeHFk?=
 =?utf-8?B?Q09rSTVCNHViZzBiVyttZ0VyUXlqRVlsY2xaZmtZK1dXZ1lpY2JPbEhoS1pC?=
 =?utf-8?B?VXNOM09UR3lCTDBnQnZzS0cyUVJQUFpBaGVHNXh4cjlCbnY2em9LeVlEOTVP?=
 =?utf-8?B?V3VMUzZsVExIckFiZ1NPaHZZWEhyUjBSSWUyVUpoTzlEYUVRM0FTVG50Yy9x?=
 =?utf-8?B?T2d1VFcycThOeTNOSmVDSkdHcXFHNWo5R2xML1pPVWtuZWJqeFpzWlF6WEJW?=
 =?utf-8?B?clJXV0ErOWFnaU50bEdBd0czZ0RBYlpUcnRpc3pVWm5GeHp6bVcwS0orRjdI?=
 =?utf-8?B?Um1JQWVSelNUZXRuZmNzVzgwRXJwSWRvKytycjEwOW42UE1ibTF1Qy8vYjJS?=
 =?utf-8?B?amgyTDJ3cjVZejB5TXlRS2tzMnBDOVRTQnNaS0RqR3hUN0MvM3FXSXVwUHZE?=
 =?utf-8?B?RGlNWFQzSmpOWEc2a0l6TzFFaUhwOXlRVnFKSE94RmVLYXBjVTJIR1paalEr?=
 =?utf-8?B?eXF4NmNvN2FveHlEN1hEc2oxOFhTR2Z0Qi9KekZTRWVkSlZVbG1QaVRQVHYw?=
 =?utf-8?B?Mks0bUZ6dkQyaTlqcThkTzBFcnRpcGwxdVdIOWxYT2V2aE8yRXptUlM2SHh4?=
 =?utf-8?B?aUtoMDFhNWVlakc4ZzJxQUlDaFFQUTZDVW5hZ0UwVEdoekU1RCt1MkJEQW1x?=
 =?utf-8?B?SndSMU0rU3RZeGxONXB0QnoxL2JFYXF4M21OdnArUXFuekxRQUw2M0ExdCtK?=
 =?utf-8?B?Q3M2WXdyN2c5Ynl6dDlyOVZ3ODhZcjZ0eUNzWUdCczhtL1NCVUh5UlFGQ2U1?=
 =?utf-8?B?aHZnUEpwSU1sS3ZxOHdIWXllN084dStmdnAyT2FQVjVETjh6N1dya2thRVRt?=
 =?utf-8?B?a3dxNHdScWhwbmE2SDM0eW0wV3BrcXN1bUd6Z01XV3EyRmNRTlI2QmRlSnZS?=
 =?utf-8?B?VlppckdnL1JsSFR6YktWS3Zac1dtVk9XRHg2a3BDaFF3TC94cEJaSHVrdnR4?=
 =?utf-8?B?eFAraXcwMjVFMnJqdVczMWo3NXRQZ0huOWJJQmlmSldnNG1LVm5EWTBxT1c5?=
 =?utf-8?B?M00wcWpVbXY2bEtHRnNKN3lpNnhBalNiVlcwZ1cwd29HWVVzUGZXVHdCVE9Z?=
 =?utf-8?B?V0FRTHA3bzFMZTZES2xoQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3JUUkt4QUFqeWNPNSs0aXZCak1pcjF4WXp1bEUvWnFiK1E1UTg3QnZHQ2F2?=
 =?utf-8?B?K3U5cklVMUttMlNiL3doUWRmQUNOODB0YUJFVEpDRVhPcHlsRU1KM2Y4WjNI?=
 =?utf-8?B?cGp1SXVEQ0E3OGlNS01CSzNzMWlLa2Z1bHlUc3JzbGdnQUhpUGtxMjdHNWxZ?=
 =?utf-8?B?b21kZ3dzVnVtQmdIRDdNUXIrU1NxUDJvTXFTczdkNnBnV25PeFAxVld2RTBB?=
 =?utf-8?B?dDArcmdHUVh5Z3hCTnhQdHl4SVE2dWppMGI2UVRpN1dCOFdyOWNxUlJqbXRT?=
 =?utf-8?B?Skp2Q1pCYnQyZkF5bmdwR29XY1AwVXpQbWR1UnA2WkdqSWtiS1hwbGYxRXBT?=
 =?utf-8?B?T3FWTnAzelZkVVVNcjFzUXNMd205MTd3clJJb0ZtUUVDSm1tZitmZEVXRW1r?=
 =?utf-8?B?b09OMnZRRDVsWlV5UUpVMk1mNnlqVi9qYy9DWVNja0ViZGZoMzVFZytENjdL?=
 =?utf-8?B?K3NxY05iQVp0VFVnN3RqNkJPcUVHdmw5NEREOU5INndHMHpXNW5nL1V1a1pm?=
 =?utf-8?B?NnRweGg0Ym5wc0VvZnZCLzY3WE41Q25lK0ovcWRzZ054cUl0cFlaa1ZXZEdx?=
 =?utf-8?B?enphaTB0QXRNbUJudGZSK0t1V1Q0VFJsSWNTNEx0Wm5vV0grbEMyT2M1cjZz?=
 =?utf-8?B?NHdaQmNJeVd4dk5jRm1XNlROWmV6ZUNsblJjNGJZUmNIQTlORWpVdnh2RWdB?=
 =?utf-8?B?dXR4T25BbkN6TGlmRCtUaFhMZTUrRzBWOEUxN3huSWsyVFIyV0MwVEVhN05C?=
 =?utf-8?B?U0tTSjBad0ZRMDhqNzRMaUNEbktpWEh0N0ltdnlGeHdSaTV5aGhuZ2pPbUFR?=
 =?utf-8?B?cmViS0c1WUVWMUZHME50dVFzSUxVZmxNL1A4VFJBSjNEK2xkc2VtWmZ3aGpw?=
 =?utf-8?B?ZFpVM08rcjFkcWs4VGRwMm9nUStMYVdoSEt4MElHQS92eVpnMXRtWXlWYW9u?=
 =?utf-8?B?MjAyRXVPUk0rZFdzQVVvVlNtYzVSM0N2QUVkVHJZRW1tQi84REtJSmVlVzBI?=
 =?utf-8?B?dm0vTU0zN1VCd2xSWVV4bEtEeTlEbndDNE9zWjlRVVZDSjNHZ05WTDl2MGh6?=
 =?utf-8?B?eHI2cDVITThkUlh5aldGR29RSldNUlBpM2VlODl0Z3Vzb1BSb012T255V1Fn?=
 =?utf-8?B?blBJVzJCQnlEWEVTSWdmaG9UZmdHSjJjb0xTY0hQL3JUYzBNNTJhMTRJNnNr?=
 =?utf-8?B?MHBiK0d1MnFlTWRMcklPdGY3T2tkbDVpVGV3S0g1U1hGOUE5L1lUVDk4NkFp?=
 =?utf-8?B?N2RuVlZ1RGx6S1lTVTNZOFQ0OTRDNTc5RkNBYlJGTklvRklOREdMRnJnY3Bk?=
 =?utf-8?B?KzQrbnJYeTQvQ2ZJeHluWFdvaDh2MWZldGlFR2libVpHOTFmRC9YWnk3ak92?=
 =?utf-8?B?eGRxS21jZjVISW5HWVExamNqTnc2R016a0FESUo5UnVBWjVKT3cvY2VXNElT?=
 =?utf-8?B?d1RyeVNYSFpVWGFrZkluTHpZSDFCTFA1MFp1MGdNQWlLMjN5UHJ0OGJvRHdn?=
 =?utf-8?B?amlRZHVIbldXVWYxaHZZSm1DYXBUY3FkVW1CNEdHS3NNRlBMWkZDMk1iNkV5?=
 =?utf-8?B?bjVTaFJsWk4xZlpta2ZQRlFieGRtMUx6TzdvVWlnMTNlamVNMmJJM3UzUWtz?=
 =?utf-8?B?K0hvdENPcG5obXQ1eGprTnJ5MjNHdEJhMSs4UTg0eDIycmIreGpzQlBwVEtY?=
 =?utf-8?B?L3dXb25EQkJtRkZlcGtHdDY2YkgyN0tyUU9hQ1RiOFNCZ2VGc3Q2WTVuejB3?=
 =?utf-8?B?dGRVclN5Ym5vdFRnRUpFN0JMdjFXdC9jT3AwVVUvVGpqeC9XUzd5ZkRBWTBM?=
 =?utf-8?B?MDYzUFFpaWJvMFd6bGZSN243VVFaTTV4OVpJNTZUZzY1N2wxL3ZDNWpZK1B0?=
 =?utf-8?B?RlN4QWNPZ1l6UXJhbk40cUVUYko1OG9XQThXSGNrdXhUY3ZzNVBaWEJUQkIy?=
 =?utf-8?B?aVBxSHVMdm43dVNyNUtiOUs1YnRGOGViajl2OVNMUHpRT2o3MFZzdGtRUnBE?=
 =?utf-8?B?OWNrK3czdGZvZ1JDMGlVWi91VWEwMXFLWjFBRXVncDZ2a1UzaTExUkd1RjBV?=
 =?utf-8?B?aUxBTG90MmQ0Y0JpdmxNV2VGSFRzLzFBVWVLMzZPVmsxYitIdlZINUYxV25F?=
 =?utf-8?B?K0Y3dUlyMUsrVDZ2ZDFldzloWGt2cUlKNkRCbTZzK2dnd05aUjRlWDFjZjFt?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qmzamMNA83kafhU0rJ7akgQe"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 542fcdfc-12b4-4804-90bb-08dcec5b6358
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 14:20:43.2471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Ullg6ks3rDK9GTIMqXwKtFpiOqWA24OS6pINhWIB9nG0IwPafHwBRu916sbZuj7Ixxdr8bCjV+s4eO31RzBLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5894
X-Authority-Analysis: v=2.4 cv=LbZu6Sfi c=1 sm=1 tr=0 ts=670d28bf cx=c_pps
 a=s6ZNmHls97cRxtl1EbDe8w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=iqgTQx9cwIf3F_hPsnoA:9 a=QEXdDO2ut3YA:10
 a=r1F_2ppSMWYV7n5Q7t4A:9 a=FfaGCDsud1wA:10
X-Proofpoint-ORIG-GUID: kPhscxk4G7Sj9hCNfxbC9bdDpzP7pCb4
X-Proofpoint-GUID: kPhscxk4G7Sj9hCNfxbC9bdDpzP7pCb4
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

--------------qmzamMNA83kafhU0rJ7akgQe
Content-Type: multipart/mixed; boundary="------------kkAMjZYKiJhA6V0ObVqerUOc";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
Subject: [PATCH v2 0/2] drm/imagination: Break an object reference loop

--------------kkAMjZYKiJhA6V0ObVqerUOc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When remaining resources are being cleaned up on driver close,
outstanding VM mappings may result in resources being leaked, due
to an object reference loop, as shown below, with each object (or
set of objects) referencing the object below it:

    PVR GEM Object
    GPU scheduler "finished" fence
    GPU scheduler "scheduled" fence
    PVR driver "done" fence
    PVR Context
    PVR VM Context
    PVR VM Mappings
    PVR GEM Object

The reference that the PVR VM Context has on the VM mappings is a
soft one, in the sense that the freeing of outstanding VM mappings
is done as part of VM context destruction; no reference counts are
involved, as is the case for all the other references in the loop.

To break the reference loop during cleanup, free the outstanding
VM mappings before destroying the PVR Context associated with the
VM context.

This is facilitated by tracking the live contexts associated with each
list, implemented in a separate patch to make the main patch cleaner
and easier to grok.

---

Changes in v1 -> v2:
 - [PATCH 1/2] Add justification to the commit message so it stands on
   its own (e.g. during bisect)

---

Brendan King (2):
  drm/imagination: Add a per-file PVR context list
  drm/imagination: Break an object reference loop

 drivers/gpu/drm/imagination/pvr_context.c | 33 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h | 21 +++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h  | 10 +++++++
 drivers/gpu/drm/imagination/pvr_drv.c     |  3 +++
 drivers/gpu/drm/imagination/pvr_vm.c      | 22 ++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.h      |  1 +
 6 files changed, 86 insertions(+), 4 deletions(-)


base-commit: c5e8e93897b7bb0a336bf3332f82f8d9f2b33f14
--=20
2.47.0

--------------kkAMjZYKiJhA6V0ObVqerUOc--

--------------qmzamMNA83kafhU0rJ7akgQe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZw0ougUDAAAAAAAKCRB5vBnz2d5qsDPV
AP9PIPbbAJkAcgqFBE2rV18GcNh5/SfcunCptuGrIn+wKQD/Vh/5FrFsOQ3sw5gwIuJ7ks68wKEA
inxzqRH5Qfidlwg=
=hQji
-----END PGP SIGNATURE-----

--------------qmzamMNA83kafhU0rJ7akgQe--
