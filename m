Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBCB99CCAA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A420F10E464;
	Mon, 14 Oct 2024 14:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="M9I48B2w";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Y7qjiG6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D2D10E360
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:22:52 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E689cD003071;
 Mon, 14 Oct 2024 15:22:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Y1W73LQbn0Pua5uG7QH4AADD2
 X8OHkLtOO++ToKXmvo=; b=M9I48B2wqWSkQXyYp4Gw7T83NsuhFw6uKOh4MOehL
 QM1btgNeRxlEquPnfj9kPwwRDGL6p80g1ga0Wblr8OFbH+/HAHaBM5H3/xpyxQWb
 67WDDiVRIRAq70Us4KbsyB64+2r4DGUgClI6Q0LPRDvmFZT+WGsgwpqIOuKSn9RS
 uviAye95+LWM+RzoIpaZf/HdXYeurdD489RktrT4WuToEYsndO3EBw/63EXrAxcq
 N+g24kq+yNckxDrIp0fbHJiZnwlHca6w05qzG9WU3ohxAkSPuG0KMBADYmYjHagS
 pxIEc49fDIY04NeZo+AJVxgvT05tjKuTt2jehNvituwpg==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazlp17011027.outbound.protection.outlook.com [40.93.68.27])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 427h6w29dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 15:22:41 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SauoFDARB9R8AjAUbkIa6PJYGujdU9K3nU1dJFmDCEXQpHRZhz69cf1xoXPU5DNmEh/qX5RocdlYplrUw9YPwoH1M0xm6vyuzJRSW3Vler4vNaNPE1tbDDm0ySE3kjhtTceyqh1StPAcT4gploKOeOytFfMnEvFirwz4Yr4+gyT8KE/nKQ0euTnvEIJDlC9g2b2n0bASBSU+db7bEkMzF2t4GBfpr5X8aAG53Ldjxj+FYqDz97VGZVzlKQnE9mdvRvY9iBe/16QwoKwlAo3PB4Zk81ZVkgo77OtlzXnroX2nx6d2490EM4ZoDj+Nj41SvuWJylKEhUT6iTpfKgFeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1W73LQbn0Pua5uG7QH4AADD2X8OHkLtOO++ToKXmvo=;
 b=xTt2jC4D+Gde2UfbdEyXvYtdUvzrH70O8eZciRnjJ+LZ49/ZOBMy98/gAJZIhXzyPJz3ef79C0K8+u/X0Tuankjt96c9saeGRuEFb+nAC5CzDeRjQqtJ3xpUq+WPWKqJc2B4rdWsa95ypE/x3Lo3fUiwEi2pQ6bAy/NE4xnSEQLkeSCESbVGStuCfijWaANDJ7BsDbObkonfnyLkuQeE546KYLk0GKTry+vKwBZgRSzPIIygK9YeSZipQGaD26YRgQadc55jrdK6dS7rX5Phi062tpf7/fwIuf/VcQmrl0wIjpwlrn2D4ifSHZC4n2pU7VzuhXAfM9aKdmYoMIBAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1W73LQbn0Pua5uG7QH4AADD2X8OHkLtOO++ToKXmvo=;
 b=Y7qjiG6Wgj6LVxro2gUV8xKYTJgYaGU9aM6MWR9aAwQbdVTotvV2TlanH+Ov6bLmfHRNi+4BxSjLEeQrONMv5x84Ffzy9CDaXbrDtxUQTCTyJBlRhRp5lwfzyN5b4yEzW66JCMQ654hbWMn+BGR/lRcWM0FChlWbXwmvaOYHAjE=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5894.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Mon, 14 Oct 2024 14:22:38 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 14:22:38 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] drm/imagination: Add a per-file PVR context list
Thread-Topic: [PATCH v2 1/2] drm/imagination: Add a per-file PVR context list
Thread-Index: AQHbHkSFDE160/GjWkq3Mfb72eyJpg==
Date: Mon, 14 Oct 2024 14:22:38 +0000
Message-ID: <e0686c53-b16b-4202-9f74-abe5139e24d3@imgtec.com>
References: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
In-Reply-To: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5894:EE_
x-ms-office365-filtering-correlation-id: 5ba05169-b26b-4c42-f80d-08dcec5ba80b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OVNrOUx1VUtzdUlhalE0K3oyZXZOU0tLZlk4Kzg0Qi9WT08wQzVsSXFqWGpz?=
 =?utf-8?B?YXZlS2pBYmNubjhWUExDTkdrZnpCUUpicTcreENHaDlKdEtrWWRKNTRVa2Vi?=
 =?utf-8?B?c3pIRnM0eUF2MlFXOGVFbGNpaUg4Y0xMazR3QmxTdzVJMkVHOXBpU0p2NW9u?=
 =?utf-8?B?dUxkTWVMQUxWbXg2UHIreFBMZkYvcW1FWXdmV3pkL2hVNUkzZ2pBVUJzUUhS?=
 =?utf-8?B?ZTQ1SmM0cVBjYTQrWGgydE9McWYvalc2c2VMSFVxd0luQkFBWENrRW1UUStN?=
 =?utf-8?B?TjhSZzBxdHg2MVNBTW5rdEZ6UG4zNXdZSG91V0haM01LdmROS0VhMDZGWmFh?=
 =?utf-8?B?TlMyT244c0s1QkJmM3JGT0pvQ2JhV0s4M09VVWRFZ3p3ZVZJRzM4UUIzSmdU?=
 =?utf-8?B?UGdPU2tEK2ZKemkxdDNOckZUM3dWSGk1MmYxZTZsazl2OURhYlpsbHpGQmMw?=
 =?utf-8?B?d205OE0rTnJkOS9SdU9LRENpVWx3cFYwUTY3ckc2L0dvN29qYWtlNGRlREk3?=
 =?utf-8?B?VHVhZDFBcVVKT0xSTUNRaXdJWk85TlpmcEgweGNyTnA3TEQvM1JFQWZaemtO?=
 =?utf-8?B?M1RCbWZ0YWd2UWJyaG9FVEhNT0pacG4zS1dWNy9mN2xXLzFWMDUrVGJaemxQ?=
 =?utf-8?B?RkNJcXVBNksxQnZWRTZQZjBibW9kNVFUUk11N2JCN2J0ZmNjUFJKbU9pQkNW?=
 =?utf-8?B?MFFRZWwwVXVpNXBUWk40NzVOcDl3SlVjZU9yRXJFQlRlNllRVnJLQVZYNWVH?=
 =?utf-8?B?amVMNkVkQWNsaUUrbWZyZDJ0QU9ZbURFRDg4dlgrQmVBNERSS2Zxb1F2d0hR?=
 =?utf-8?B?Q2lBcDh1eG9pakFMTXIvcjJyaWhCV21zTzE5ZWZIT3YyMitsaVNaVVNUSjFY?=
 =?utf-8?B?c2xEaDgrVWJ1emNmd3FHQTIrWFpjaXdtZ1liU25DZDN3K2ltcXUvcmJZTVhI?=
 =?utf-8?B?R1VNOVpybm1scFRhRFVTbGtQZzE0Uy82elYvclkrSFhmZVRKZjNOMWdQby9U?=
 =?utf-8?B?c0oxOXJOUmkvZjB1RUhDZ1NlMTZVNE9Uemk5bkg1VWJYeFpNM2FrbloyNTJL?=
 =?utf-8?B?aVdUVHIvZXJHY3V1RFpRb3h6Vko0SUNlRUJWVXNxTTFYMmVNRllSWHRuNkRU?=
 =?utf-8?B?T09uQUZFU25IaCtDcGx1MlovTThCYlJYdk5LaU1GYnJETmFybkF5TzJTN3Va?=
 =?utf-8?B?T1R1OXdhNEQxcWZ3QWFSRHdOOHh1TkZKcHNLMk1VZ0ZyUy9wNnRGcng0Y3dn?=
 =?utf-8?B?R2JpUlRmcHVqdmhDNld1cTJSd24yVDdIcklKNnYyMkpwOVpSQnBrWnpSM2dU?=
 =?utf-8?B?aG1JZDc1UU94ZjVOUGlleThqbVNBRUJvOVlUNHhmUklaakwvUG8xK0d2dlRG?=
 =?utf-8?B?SkIzaFZTWEJuNnNnaHREU3dGNDVEQ2JBYm9lNFBodVh6WFEvZnh6bFB1dGhG?=
 =?utf-8?B?SWtIRDJmaGx2WTA2dy8zYnlDVHJ2TExGMmpQbWFLdkFVcWpVSW12RlFBak15?=
 =?utf-8?B?U0tTZ3lIQ0ROMWluaDE5dER2Mkl4NEp1Z3c1REs2N2NTSGhhd25wdDFSM1Bm?=
 =?utf-8?B?NHB2dzFaK0dNa1JuUCtBMzVrVjJWQlowZnNCeU1NdUtWWUtjMHR3UFVOcnlS?=
 =?utf-8?B?NHhEOElzU2l4ODduL0FvMis0WGppTE1sM2hPbFFZU0pBdk44K3JFNGVYKzZ5?=
 =?utf-8?B?RWNFVDhBSmh5a3RwLzZiY0wyeWtjU1JiSHM1TXhQRU5SUk4raXNFeGgwYzl0?=
 =?utf-8?B?c290aWwxQlZqVnFGR0Qrc1BLZ29FOUpXbjhmNHNOVjZteWY5QjhBalcreEFy?=
 =?utf-8?B?ZjRRbWFjV01hRzMwczUzdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXpyK2hVK1lWUHdZVlBDM2xrcitDSXllc3JoWjIvTjc5cXk3YmliQWRlVFBT?=
 =?utf-8?B?Yy9oSnFValQvYmxITWVaa1pRZlZocGtwS2xYaFpvRTRuNXA0QVpkbjdCV2Fr?=
 =?utf-8?B?T01PeXBQaGE3VjlHSUVEM2J1dGFIcTlWTkxKY2F3VXd6bkc0MmxML2w1V1gz?=
 =?utf-8?B?Q0RKL0V4UGorcmNrUEtCaWtGZ3JQQ2NWSkMrZFM2dGdnU3pFd1Nja25RTXJ5?=
 =?utf-8?B?VTluUkFXVFNFZjN6eTZnZ2d2cmZRS3VEQWQzN2NQYjdwOTlISGVLUDdMaVJX?=
 =?utf-8?B?M3pndTFUeXdaallaSEtSWDJ2T3JVV3VIS0plOTZMQjUzVzJtSUxGdm81VHBn?=
 =?utf-8?B?czNsaDd5VHhXa2N5Q1VwWXVEZWZybFV1TlRyaVhGMHhSRklTKzFRaTVuTEs0?=
 =?utf-8?B?czVWa3cvVG8wcmJjazgwVW9VR21pTjZFZEU1L3YvdS9xTmFySTQybE9Qbjlw?=
 =?utf-8?B?ZEVJQVhNWTY3djVZY0g2MUp6NXhQYmlzaUtzZnNHWS9hanpWa2RnTDAva200?=
 =?utf-8?B?bndSd0ZaU0pkZGladTI3MXJyN0JXOENtSEdkQkdxVE1iRkEwdC96Y2U4TkVR?=
 =?utf-8?B?OEZuL21SaGxHM0N4N2swQldIbXhzZXltYUZjVHVMWWE5aGpzVEh6Wkx1My9S?=
 =?utf-8?B?U2tiY0t4VU1TUndPSnkwQ2pGWXJsc2Y2bjJaOG9jcWt0Q2xiUURPUXZ0R01p?=
 =?utf-8?B?d0hjOTN0UnB5ZVZiL1dkcGtUVXZSWm9IVkpIYUQ3eXE1bStzK0JzdVVqQi9w?=
 =?utf-8?B?b0wvQVZWeWdVeGlLSE1KS2xHUStLenI0Z08xMFZyUDIxRXlIbDQ4Qkd3dzkr?=
 =?utf-8?B?K2cxRytPSHFHRWxGc29sS2w4Z2cxbUNkaG9rL3RmL3Y4N3BQaVdBZElFRjFv?=
 =?utf-8?B?ZjQ1MFp1b2s0RDZIQnZ3VlBUSEs3WGYzbk8wY3NrWWttYVF2czlLb3Q4S00x?=
 =?utf-8?B?UmVpYVdNT1BsSm9pVFBqWHdHU2xFRmk2OVFZbFFUZmNtY3NHWll0b2wyTnZQ?=
 =?utf-8?B?dE9ZZm9MaFdKYWQzRFpNbGh5Tm13cFczSCtFa2tobUluVFhmeFRndUowd3Ur?=
 =?utf-8?B?blhONTN6VWEvWmtXTkVQaTRQcGorTE4rYXRBL29iOTVaUUs4aGRySjlrZjNu?=
 =?utf-8?B?dFNvdEtWZVZHczF1ajBQZTF4cEpUL2ZxT1l3UUdoR2dONHVHd0ZteFVUV3VW?=
 =?utf-8?B?YW5xSjd5aGJETXd2NkNYZkozempZSjZ2Y3ZWR09GTmdJZ1VmbElUeHNLUjhW?=
 =?utf-8?B?ODRKS09OU1JjVnhiRExoc2NFSGNncGR4YitMT2Y0ZTdBR3NrblRmVWNnbWFC?=
 =?utf-8?B?T1Zqb2RFY2pQOHV2UEEzZUx1K1BrSkkxWHhYY0h1OEE0WUQ3OXRVTElDbEdl?=
 =?utf-8?B?TW42ckZPOXBKTDdZd3hIT3VweGFNSVdYdFpDWGhlUmlSZVFVSVpFd0t3WXN2?=
 =?utf-8?B?M29LS2ZaT0NiVlMzdEg2RnhHWjduRVhSZldHL2xzZlYvL1ZYU2l6NktjQUxp?=
 =?utf-8?B?RHp2N0llSGJDT1VXbm04bmJUMWY1dlVkakx6Mkx3NXNPaDZReFBaazVzNDA3?=
 =?utf-8?B?MHJDcHJJOURaRjhSbHVubFp0aEJVYjBEYVFqSFdQN0loeGVFRTVrQkpUQ0Ju?=
 =?utf-8?B?MUt3SkwyOU5Jd3IrTjA1VVFDdWwzNmZXM3paWS9MR2NoKzVZL0dRM29KMitm?=
 =?utf-8?B?TkxMcXlmN3ZnVzhmNE03SkVqcVBYVWtMaUtVYzJCanZkSGNmSEJSQ1VmY3Jm?=
 =?utf-8?B?b0ViaCtYVnZpYzZ5cmdPRzlaSE9WMFkyaVIzZFBTQ2crb2RVNlhOWEp2K0N6?=
 =?utf-8?B?aW85cVFYTlpySmNKWSsvSjNGMXVwek1nbjJSczlwS0NIb2NkK2FhZnZDaU1Y?=
 =?utf-8?B?WFVrRklZR2hvZU5INjRIdzdsYVpMMXR4dTkvc3FlaHBKV1d5MUR2bm1qUUI5?=
 =?utf-8?B?bkJ5MjNaekNDaStWa25yMmJVelM3NGtkc3BhaWZlMWFIdGthc2NSRTBYVnVI?=
 =?utf-8?B?Z3lHRWVMTEpxVWFpK0Z4Q2pTdmcweCtib3d5WC9GSDcwL0lta0toOGZJS01v?=
 =?utf-8?B?TjZGOHhYaExlUitrWEN6amhOdnA4VHR3cHJEelRTamdNTHZkOFMvNGF5T0xz?=
 =?utf-8?B?SEEwaEI5RHZTS3VhMVkza3pyVEQwOWxlT3UyWEpieUE0K2g2MGZYUEZWMDhS?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vUxJuVnRFiGBB4ltNmZwLKMK"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba05169-b26b-4c42-f80d-08dcec5ba80b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 14:22:38.4687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0uSY9D1bynJ1Y3MF1JhMj+Q+CjNdQXTmrasMZC+0kect1Tckc/IluKUDEZOcWv5DkqRvADEEfy35aF6ebuj+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5894
X-Authority-Analysis: v=2.4 cv=LbZu6Sfi c=1 sm=1 tr=0 ts=670d2932 cx=c_pps
 a=OsxvgCVCPgftFDG+4S7SsQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=2zjTdtMHGxF8P-iNuwwA:9
 a=QEXdDO2ut3YA:10 a=lyOg1_WVnN3a3aLNPZIA:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 6BKH6nL-rZfBRCRV4uujK9O7Ump1k5dJ
X-Proofpoint-GUID: 6BKH6nL-rZfBRCRV4uujK9O7Ump1k5dJ
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

--------------vUxJuVnRFiGBB4ltNmZwLKMK
Content-Type: multipart/mixed; boundary="------------o50onOTlKGAl0QaRkrN6eO2i";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <e0686c53-b16b-4202-9f74-abe5139e24d3@imgtec.com>
Subject: [PATCH v2 1/2] drm/imagination: Add a per-file PVR context list
References: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>
In-Reply-To: <bf5cdfa3-5196-485a-b5ed-5a0e698dfc40@imgtec.com>

--------------o50onOTlKGAl0QaRkrN6eO2i
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Brendan King <brendan.king@imgtec.com>

This adds a linked list of VM contexts which is needed for the next patch=

to be able to correctly track VM contexts for destruction on file close.

It is only safe for VM contexts to be removed from the list and destroyed=

when not in interrupt context.

Signed-off-by: Brendan King <brendan.king@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v1 -> v2:
 - Add justification to the commit message so it stands on its own (e.g.
   during bisect)
---
 drivers/gpu/drm/imagination/pvr_context.c | 14 ++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h |  3 +++
 drivers/gpu/drm/imagination/pvr_device.h  | 10 ++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c     |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/=
imagination/pvr_context.c
index eded5e955cc0..255c93582734 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -17,10 +17,14 @@
=20
 #include <drm/drm_auth.h>
 #include <drm/drm_managed.h>
+
+#include <linux/bug.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
@@ -354,6 +358,10 @@ int pvr_context_create(struct pvr_file *pvr_file, st=
ruct drm_pvr_ioctl_create_co
 		return err;
 	}
=20
+	spin_lock(&pvr_dev->ctx_list_lock);
+	list_add_tail(&ctx->file_link, &pvr_file->contexts);
+	spin_unlock(&pvr_dev->ctx_list_lock);
+
 	return 0;
=20
 err_destroy_fw_obj:
@@ -380,6 +388,11 @@ pvr_context_release(struct kref *ref_count)
 		container_of(ref_count, struct pvr_context, ref_count);
 	struct pvr_device *pvr_dev =3D ctx->pvr_dev;
=20
+	WARN_ON(in_interrupt());
+	spin_lock(&pvr_dev->ctx_list_lock);
+	list_del(&ctx->file_link);
+	spin_unlock(&pvr_dev->ctx_list_lock);
+
 	xa_erase(&pvr_dev->ctx_ids, ctx->ctx_id);
 	pvr_context_destroy_queues(ctx);
 	pvr_fw_object_destroy(ctx->fw_obj);
@@ -451,6 +464,7 @@ void pvr_destroy_contexts_for_file(struct pvr_file *p=
vr_file)
 void pvr_context_device_init(struct pvr_device *pvr_dev)
 {
 	xa_init_flags(&pvr_dev->ctx_ids, XA_FLAGS_ALLOC1);
+	spin_lock_init(&pvr_dev->ctx_list_lock);
 }
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/=
imagination/pvr_context.h
index 0c7b97dfa6ba..a5b0a82a54a1 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -85,6 +85,9 @@ struct pvr_context {
 		/** @compute: Transfer queue. */
 		struct pvr_queue *transfer;
 	} queues;
+
+	/** @file_link: pvr_file PVR context list link. */
+	struct list_head file_link;
 };
=20
 static __always_inline struct pvr_queue *
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/i=
magination/pvr_device.h
index b574e23d484b..6d0dfacb677b 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/math.h>
 #include <linux/mutex.h>
+#include <linux/spinlock_types.h>
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -293,6 +294,12 @@ struct pvr_device {
=20
 	/** @sched_wq: Workqueue for schedulers. */
 	struct workqueue_struct *sched_wq;
+
+	/**
+	 * @ctx_list_lock: Lock to be held when accessing the context list in
+	 *  struct pvr_file.
+	 */
+	spinlock_t ctx_list_lock;
 };
=20
 /**
@@ -344,6 +351,9 @@ struct pvr_file {
 	 * This array is used to allocate handles returned to userspace.
 	 */
 	struct xarray vm_ctx_handles;
+
+	/** @contexts: PVR context list. */
+	struct list_head contexts;
 };
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
index 1a0cb7aa9cea..fb17196e05f4 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -28,6 +28,7 @@
 #include <linux/export.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -1326,6 +1327,8 @@ pvr_drm_driver_open(struct drm_device *drm_dev, str=
uct drm_file *file)
 	 */
 	pvr_file->pvr_dev =3D pvr_dev;
=20
+	INIT_LIST_HEAD(&pvr_file->contexts);
+
 	xa_init_flags(&pvr_file->ctx_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->free_list_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->hwrt_handles, XA_FLAGS_ALLOC1);
--=20
2.47.0



--------------o50onOTlKGAl0QaRkrN6eO2i--

--------------vUxJuVnRFiGBB4ltNmZwLKMK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZw0pLgUDAAAAAAAKCRB5vBnz2d5qsA3j
AQDpHZXgelDi+95aNWJLjHSgoxQjugN9MCMkXukMViBJAgEAo205ysrQY7iPmp39pN6sKwhvKhXW
dySf6C5vI9YnQQ4=
=o+H3
-----END PGP SIGNATURE-----

--------------vUxJuVnRFiGBB4ltNmZwLKMK--
