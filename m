Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF6AF5F27
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7904410E762;
	Wed,  2 Jul 2025 16:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="nGuFCLtV";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="MF2qWX5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358BD10E76B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:53:10 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 5626FojV3263103; Wed, 2 Jul 2025 17:52:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=5eeme1SekgEqL5dewbFnYSYy8
 LQ003H75aeGsVBNfGo=; b=nGuFCLtVJOSMNwKWqVeBFy+X2A0opmbe7FbIv05QO
 auq+ntWnSPwFO5zV2DYwhJ8Vjcm3CeRD+7DATPtGu54ks+7+CYbY2dgMFkoWNYP2
 McFpMH8EtTFLh7z+IeqVFbXaT1vKscYFEJWA/nQAkfrz0y6El2sG6Zu0z7F0C7i+
 SUch2tBRt36g/zSpfMpek7M24imLJCARsdwBp1tAk+4hb5AgOdajvrzc1UmTCxtn
 fgOgfNVx6QbS2B761RvwAbBb612PgkRNvPxXp4ierJ6jzoTQh20Hd/1Gb4/j/gul
 snnOryzJsghprmCGZ4/let8m9y7kse4zZ8XqVT/DRgLRA==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022098.outbound.protection.outlook.com [52.101.96.98])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47j8ftb57t-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 02 Jul 2025 17:52:49 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVDBukXN8MVtd6FNUAHS2/kxpzmL4AHmwq0NZJ40gN7wazZ6ktm8HlYglNjOoby9DLxoX927/YDbcvl8ZxQJcClIkluPUGAZwXkMENgzbuxrDb8WhX+/7PemWiOD1URywLeBMYyYNUmjlCcjaVXuhb7IBJaQLEV/BR9m08uj4j1GpAezY+b5SmJXV6AoIceeO06/2+HKOb7H0Cf4zP2RfLWGkm88bv0C9O37/D7YN/40bv5efu6ZKamrKSj4eXx76SQYeHNrBYL1GAILjua/HZlcsY+VnfLi0NLBuYWV7ITvadLc27ASWDjtJPFQvX1NneyDzy0Sd5CNOwqZIAWOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eeme1SekgEqL5dewbFnYSYy8LQ003H75aeGsVBNfGo=;
 b=QACPuk1Em2io1xDLF+ceVIbu3fSn9DBusKQkVpN6rW0JsSzRkiK5u+/0mFxf7qyt/Npxt1vqGuGAs99QPFqzEMRGlxKRgtS8nZfpGLfjoNf/3kGhx+bN1O74tTDsXNMWR2VVtzCx6vL/rni1iBgwPORAAhsUKe80N6gs9/x8v+fYRl+/WovzXMaxHt+6OIOAaTQTuS8U8rl0CjP6nbVmmcXvXclqepHgc7OXG3gj7Re/gsVwnLBTAVZCKLKynJHEryVN1pjxhozc0/FLm3pRg3L+EV7nYBDtT2P89nTG+NaflqXQwahIYPROomXdRka5hgrP4+H6fKZ/bonKBzltSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eeme1SekgEqL5dewbFnYSYy8LQ003H75aeGsVBNfGo=;
 b=MF2qWX5J2mRfN2LSBF/WgPb59dkJxz6nr7oJ4TwjgexlDLA/V8yhPVK7IX5KWqOjhkSvfh4G5PE0+H3HcPEhcV9Ccnja8eSSi5offX9iw3MGGbIe7AVDiXXH5knKn+4BeraDPO42jpcLaf7SL6Ue39fcx7kRK7wI/tRzMWhv5yg=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LOYP265MB2175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:121::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Wed, 2 Jul 2025 16:52:47 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 16:52:47 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Alessio Belle <Alessio.Belle@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Clear runtime PM errors while resetting
 the GPU
Thread-Topic: [PATCH] drm/imagination: Clear runtime PM errors while resetting
 the GPU
Thread-Index: AQHb5Rjni4NRIz3NAEy6j5W+2HHAVrQfGUeA
Date: Wed, 2 Jul 2025 16:52:47 +0000
Message-ID: <f917fd14-dea7-47cd-922d-f0eaf17c5104@imgtec.com>
References: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
In-Reply-To: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LOYP265MB2175:EE_
x-ms-office365-filtering-correlation-id: 27c8a5a9-4248-4baa-0c4c-08ddb988dfa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bDVGYncwaVNJVExvUW56ejNDMEU4bGpnVGFUNTljMFY0UjhnVXNVSytoaEpK?=
 =?utf-8?B?c0ZZOUo5U3puSFYrQ2h1WnBuQUtjL3h1ZmlpNVMxMlJOY2NnWnFIcVU5aWI1?=
 =?utf-8?B?bTRsRFB1V0RKcHlEL1l3MVZXKzBQdFRPbzJVQWpZMjRWdHVsYS9aUmxqYy9B?=
 =?utf-8?B?dTM1VGw4UlRhVyt5alVTRXFYcExTa1RxamR2ZWxzQThPd2NwVFFIa2lubndu?=
 =?utf-8?B?eGNHbUVFNWtONHNUbVlCYlQvQnorTkFQYVd3Q216TXd0YS9TVTdlT0VsSWd5?=
 =?utf-8?B?cy93UlJBOGg3dnFuZHRWK3RralFtZDZGNHQ0NVJwT2dVM21GdkpsZmZJN3VZ?=
 =?utf-8?B?Nis3OXJLTDlKWW85cWRkR0JaR0J5b0JpZGNRMXpjbnAzYUpPUXlLdEZzbEov?=
 =?utf-8?B?a2hQREpiVmx0VjdKYlg3MDN2ellGVk9sSFpvTStnOXd0bnlpbGlXb3NaV2dB?=
 =?utf-8?B?TUZpSGNnZFk0aXFGczE4ZXJBQk5seWlFdUROS0M1L1NKeDA4aWIyK24yRzQ0?=
 =?utf-8?B?dlFWMXhzTnRIS1BkRVEyWFI0RkVodmdLL1RuRkVOZEtra25Ja2NWamIzbDB2?=
 =?utf-8?B?QW5CZkZkTjBUemhoU0g4bmFwUE16ck12L25IMzFRZXRNejVUZEhHc3pMOVJX?=
 =?utf-8?B?UmVGSUdZZXI4VzR0aXpZWUlnK0hwMFZDelpHQ2M0c2VOSzVWVHE0VVBESng2?=
 =?utf-8?B?TGgvNERJU2RXR1gxSUxnby92NVBwUDNpMzJiMElSQ3EzRGhvSU1PTlltMm9l?=
 =?utf-8?B?M1Q2cmx5L0R6S0pveTNKOWVtRXhsSXRRZDVyNjVBREpyNUxjK0lGdlpUNnd3?=
 =?utf-8?B?U0tpaHhhQkE1eGNrdEFWQkZRS29BazlBK0lteExQSTRiOEVRUnVuQTN2Rjdt?=
 =?utf-8?B?djVKVXBiVFcyK0phcDA4SlpVWC9nYzNYM1M4WjBxelo3ODRnNFZtM04xdXZu?=
 =?utf-8?B?cmExRVU2Sy8vR1JWYWV4NDVGMCtmK2tQK3JmNkMrdVkydS90ZW1POU5VUGlL?=
 =?utf-8?B?WDlYejhiYkkrSGdvWEs2WW56SWJ1eTkreEZNazdIZHhKRTZYWjNGVElhSnE1?=
 =?utf-8?B?SXlwaThSdG14djdGWnUzSGxGSTU3MFVVUUJxbUMyallidGRHVXRTVHpmWVZG?=
 =?utf-8?B?VDRmb3N3bmF3cjBqM3BpeTRwc0Fleng4RUYwbnlQV2J2M01DSzEyOGZydWhw?=
 =?utf-8?B?Q0VJYmkrREVkd0lPWVVrWTVLaFRmRGxuQ0FydTNmd3RsV0p5NVFJcWpxOFF2?=
 =?utf-8?B?OUZDWFBaYkdpR0l1M3k2R3I2VXlmMFBMVnprZ3pwaGhZdUdyUUxUenpXUmlU?=
 =?utf-8?B?R3pqM3NSQXNwK2kwL01OMDNVeU9XbHIwamVnbnczTm1wUm82UC9mOWsxSEJB?=
 =?utf-8?B?MnJPR0lrSUkwdWcySkZWRFphdy9wRjk2MXA3TXc1aVE5aEdoelF2ZHNYcnFG?=
 =?utf-8?B?WVpSZkJtUGlwYlBRaXFaS05sOW9mVkxJOFJoOWE2RXI2cXdEdmRWRnN6UjBT?=
 =?utf-8?B?bkM2QnBsMWZEamR3UHRtaWM0bzlWL204c3BJRTRwZlhHcjlpMEd5MnRxVnIy?=
 =?utf-8?B?cWZPNWlleFBvT2VCUDlIbE83bElJWWdtV1hnSXdRbHJiWm5yK0JRQytId0k1?=
 =?utf-8?B?Mmd4UE9HTnlsUmlUTG9yMHd0Z2FoYms3aEk3eHVKWU5zWnBHVXp5L3NZa0VG?=
 =?utf-8?B?OS9DbExoTzE3d2gwaGo0aDlRc1FmSXlEWlo0Y2R6Z2VJL2lYc29LTGNER3V6?=
 =?utf-8?B?dlVNMjlEZWFZYWlIVk16bHo5S2xLVWdjVVIrTmZqb2JITVF1dzZidlRTb0Zh?=
 =?utf-8?B?V0xxeDIzOFVxeTNuY3EvOS85UE9sOHczVHlmK0NUT2tIZHVQWTdSOG4vcWYv?=
 =?utf-8?B?bUdCWlVGdXhnTWJrbTBJbEVKT01MblIySEtqbUR0UVQydHJiSm8vZ04wOFlP?=
 =?utf-8?B?bFVqZWUybThuZ1VvWVRoOVR2WjNsOXlyT1dNaElSelpobTY0YndGL21QOGJp?=
 =?utf-8?Q?bhc3SyJscteWQY2YwnvcBp5nnXPtRU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnc1NFVsdVlDa2VqZzNlaktaVXBmZFpPSEZBMFI4WTJhTldyaXE4blU0aEJx?=
 =?utf-8?B?ajdyYzFid0kzN1hEWElDQzBIMXBOUlU4MG9vbEp5UFE0cVdCbytvNHFTa1B2?=
 =?utf-8?B?MytLaTdURjVqNndsNTJZMFhHdzZkY1dyeXFJRzcyU1pzQUR3WlY1RFR5VXU3?=
 =?utf-8?B?MHlMWmVCSFBmeGtPMmtxQTF6R2UyVmhrekJMV1NaYmJsYndXK1c2ODBxNmEy?=
 =?utf-8?B?L2NTS1JSUENsZWpGL3BGczFCQllVcE9KU2ZYL0hpOXcvYTdqTjFzeElUQXF5?=
 =?utf-8?B?ZVFkb2JMRzlBeG92aE9wR1ZRLzE0UkhWVjBlSXg3UHBKU0xMcmZsMHN5eUZN?=
 =?utf-8?B?STJYU0Vsd3IxWlNNUmIvK1BxSjA0bzFSZ0ExL1l0MmZ1QXA2QWRpMkgrd3ZT?=
 =?utf-8?B?MnAxcXEzSXFwY1Nrc1N2ZE5tT2VBbnpDMEdybS94a0pSK3ZUNDFmSS9GT0tj?=
 =?utf-8?B?R2VyQnlNNjRKQXFHMGNRaG5IdTNBRjh3enBlWXFUTmYwV0VHM29FUmdxMnUr?=
 =?utf-8?B?TkgxQnFya1VGem9KcHNwWnNwb0ErcFJBZDhUSUVGVzJVTWFtb0VwaGcvV3ht?=
 =?utf-8?B?UUFnYTYxanNlZFRhelc1ZXJaUDRwUktUR01aajFYa3VUamRDbXdtdEc1bHJN?=
 =?utf-8?B?dDUvQ0RKaGNFTnZwb21Xc2p3K3RDWHlqN1N3UDEyL3JMYmlqa29OSTg5V09R?=
 =?utf-8?B?SXpoWlMzaklDQWRmb1VKd1dmaTFJTHVoVkNrYTU2UU41UjlFUEMrcEFWMFF0?=
 =?utf-8?B?QXJ1M1N1U3pFKzcwYVA0SlZsUUdXNkxaZC84SWtIdkROYzNwYloxYjgrV2Zx?=
 =?utf-8?B?U05zYmx1czZqbXh4cXgwYkR2eGVyYTJCMFRpS1g4aVh2bVV5K05RSFlkNU94?=
 =?utf-8?B?VXZEQVg2ZElscVhRR0kxajVScGZ1c0RsQkRYRUw1YTJjdHk0RjdwSGw0NmNl?=
 =?utf-8?B?TEROUkdRaVZ3SFdLVjJsUTBWMGR0MnJLMlR2VWNVY1N0Zll0dTFzaHl2Y1dX?=
 =?utf-8?B?WEhxY1dNMDM2eTJCdGFTV1pmUnlVYkNIR2FrYkVLSGtPMGJJRW56M1o1NWoz?=
 =?utf-8?B?RlMrL1RWL1RSRFN4dy9ta3ZyS2Y0RXQxRHA5cnk4c2pYLzVmV2VxQ21NZGJs?=
 =?utf-8?B?ZHJiOG9aQXduUzJYTzllV2M2dmRML2ppd2FMVUU0b3o3NFkybGRHbjhoUy9G?=
 =?utf-8?B?K0xjT0NaYXFoeWZCS3VwUUFKd2ExM3d2Uk5oWjdidlpPNHp6S1d3ZXNDUm4x?=
 =?utf-8?B?MlMzNEQ5RHNjWkNWWEk0YUlXY0xQYkpDVnR5d3pTT2FIM1pva0l5S004NkQv?=
 =?utf-8?B?K0ltdENRdEc3ekdaNXBPcWpNK25heVJTTkhlYTg5d3NTSU9uVlJKOW1HQ0Jj?=
 =?utf-8?B?UEdacjNlckRVendPcnFTdlJwTDlFbGJIM1V6b1JySXEwZU1BcmN5WlMrYlRJ?=
 =?utf-8?B?UThHNUIxdnFOeDhFVmdzU28rTlpza3ptSnJnUUpZS2hYWitwU055Yzc2SE04?=
 =?utf-8?B?cXQzd04yMzVXSEJNaDdwVytUeTg4QzhiRDNTeENMcDdFbkk0M1ZvSEM1eEpO?=
 =?utf-8?B?cVE3RC9XZHp6YlhHNFQ3bGVPT1J1NjRVSEJ4ejBoaHdpQUw2emViSUJ2d3ZE?=
 =?utf-8?B?YndXREx4UDNjRm1vSEVHVGh4a1dFSnJuczdHczY3Y0ZvS1RqTUtzSHJJb0pn?=
 =?utf-8?B?SUV3VjBkUk5GMEFQc2VHZ2paS0NGV1hQQ1psa29aYkZsU1JhLzM3M0JEc21P?=
 =?utf-8?B?SFpNd3lscnFWaU1xTGI2NUhpaGVmTTI4SXlkYlpmcUQ2TThLSEpFYk1OMmZR?=
 =?utf-8?B?V0JtTGEwMHRPbmUyeFFKMjdKTC9pRnFlZ3lOY2JUT0xVY1ZOUlp3MlB3THhm?=
 =?utf-8?B?TEhFdDNoenB0RmtubVFIQmE4TEhhSm5OTnBxNDhoSUd2YWtvRk9zOHdJaHFF?=
 =?utf-8?B?ZDN1SHZXMUxHMllOWmNlbDhTUlk0d3kxZjFFTFdJeHpoOTZXZmppYmxQODdq?=
 =?utf-8?B?SHVOSmFCcHoyaEhBUlNRcGthTHI4TUFuS1prYVhJMVlMNmlseHc2WFdaWEls?=
 =?utf-8?B?M0RtelppZkZVY2ZRWUE2ek82UzVaelNseDFjNHNFRXl0K1RkSGN2T3U0Yzdx?=
 =?utf-8?B?a2hXcE9HYTdYVU5LRDRBdmZoMEZYSU8zclJDZ2Qzb1IvbWhzMFVxdnM4eDM5?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S715Ge2YeqWnkOqLKFLPtes6"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c8a5a9-4248-4baa-0c4c-08ddb988dfa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 16:52:47.4879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwsyAkcUbhLJ4FuXh1hrmrgIWyV51FIbltKMvu6SrOI9xZwb4HCUDkCKAs5vLc3Ifi1Qjfx0+FeslWCK12Wx+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2175
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyNiBTYWx0ZWRfX8ayRUIrxjsyP
 +xRi3tsGVgLtm8Itj7vSzNK5BQLwOAC1LWZNQHTK7I3Bv5yo8CVciCJoHBQnafT0IwtuKDif6ec
 0OFnGa7RCB4CqKyImIf16S8bjK4OeXCx+jJzfSGqHOFYWnM0ke0pWyiwGlJpRWDFE5kUJznV0Q2
 21Q9wyLumMt3VzAEpDSHbiDFp3KA+h7b16y4E+nj+tFnGLgGqf089B9dBuKiWOwmcoqKYS0vmlZ
 wdU4P8DQ8xezeTG9HatGT7nhe9ztEEofs9lmtRAdpkWMD3fmkWerc1OXDHZV1RvWTVJv7tLZvcD
 OPOYgPeemg2v+61LqattjbQdQsicNw8go6RYY45elkF107Xg/BXGeNMcFuyTGAMNnfpAnwFZO0W
 r/xKALEa
X-Proofpoint-ORIG-GUID: efIwPfkjxjtIe7lvzXgCNBpgqzOCIe53
X-Authority-Analysis: v=2.4 cv=LpiSymdc c=1 sm=1 tr=0 ts=686563e2 cx=c_pps
 a=7g/F+h/Y0x/HpfuCXpN0Zw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8
 a=Oe3lE1h_RTxt-04ef0cA:9 a=QEXdDO2ut3YA:10 a=FL4edEKKhhSzWUvZyIwA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: efIwPfkjxjtIe7lvzXgCNBpgqzOCIe53
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

--------------S715Ge2YeqWnkOqLKFLPtes6
Content-Type: multipart/mixed; boundary="------------KCPmi0SvFyBLwOOh88kkeI1C";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <f917fd14-dea7-47cd-922d-f0eaf17c5104@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Clear runtime PM errors while resetting
 the GPU
References: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>
In-Reply-To: <20250624-clear-rpm-errors-gpu-reset-v1-1-b8ff2ae55aac@imgtec.com>

--------------KCPmi0SvFyBLwOOh88kkeI1C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24/06/2025 16:01, Alessio Belle wrote:
> The runtime PM might be left in error state if one of the callbacks
> returned an error, e.g. if the (auto)suspend callback failed following
> a firmware crash.
>=20
> When that happens, any further attempt to acquire or release a power
> reference will then also fail, making it impossible to do anything else=

> with the GPU. The driver logic will eventually reach the reset code.
>=20
> In pvr_power_reset(), replace pvr_power_get() with a new API
> pvr_power_get_clear() which also attempts to clear any runtime PM error=

> state if acquiring a power reference is not possible.
>=20
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I'll apply this to drm-misc-next on Friday if nobody has any objections.

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_power.c | 59 +++++++++++++++++++++++++=
+++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> index 41f5d89e78b854cf6993838868a4416a220b490a..65642ded051db83e82e32e3=
c3e9f82508ad8d4cc 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -340,6 +340,63 @@ pvr_power_device_idle(struct device *dev)
>         return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
>  }
>=20
> +static int
> +pvr_power_clear_error(struct pvr_device *pvr_dev)
> +{
> +       struct device *dev =3D from_pvr_device(pvr_dev)->dev;
> +       int err;
> +
> +       /* Ensure the device state is known and nothing is happening pa=
st this point */
> +       pm_runtime_disable(dev);
> +
> +       /* Attempt to clear the runtime PM error by setting the current=
 state again */
> +       if (pm_runtime_status_suspended(dev))
> +               err =3D pm_runtime_set_suspended(dev);
> +       else
> +               err =3D pm_runtime_set_active(dev);
> +
> +       if (err) {
> +               drm_err(from_pvr_device(pvr_dev),
> +                       "%s: Failed to clear runtime PM error (new erro=
r %d)\n",
> +                       __func__, err);
> +       }
> +
> +       pm_runtime_enable(dev);
> +
> +       return err;
> +}
> +
> +/**
> + * pvr_power_get_clear() - Acquire a power reference, correcting any e=
rrors
> + * @pvr_dev: Device pointer
> + *
> + * Attempt to acquire a power reference on the device. If the runtime =
PM
> + * is in error state, attempt to clear the error and retry.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * Any error code returned by pvr_power_get() or the runtime PM API=
=2E
> + */
> +static int
> +pvr_power_get_clear(struct pvr_device *pvr_dev)
> +{
> +       int err;
> +
> +       err =3D pvr_power_get(pvr_dev);
> +       if (err =3D=3D 0)
> +               return err;
> +
> +       drm_warn(from_pvr_device(pvr_dev),
> +                "%s: pvr_power_get returned error %d, attempting recov=
ery\n",
> +                __func__, err);
> +
> +       err =3D pvr_power_clear_error(pvr_dev);
> +       if (err)
> +               return err;
> +
> +       return pvr_power_get(pvr_dev);
> +}
> +
>  /**
>   * pvr_power_reset() - Reset the GPU
>   * @pvr_dev: Device pointer
> @@ -364,7 +421,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool ha=
rd_reset)
>          * Take a power reference during the reset. This should prevent=
 any interference with the
>          * power state during reset.
>          */
> -       WARN_ON(pvr_power_get(pvr_dev));
> +       WARN_ON(pvr_power_get_clear(pvr_dev));
>=20
>         down_write(&pvr_dev->reset_sem);
>=20
>=20
> ---
> base-commit: 1a45ef022f0364186d4fb2f4e5255dcae1ff638a
> change-id: 20250619-clear-rpm-errors-gpu-reset-359ecbc85689
>=20
> Best regards,
> --
> Alessio Belle <alessio.belle@imgtec.com>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------KCPmi0SvFyBLwOOh88kkeI1C--

--------------S715Ge2YeqWnkOqLKFLPtes6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaGVj3wUDAAAAAAAKCRB5vBnz2d5qsL9H
AQDYYcSC7gt2omxv2nA7imwLmyXbY1HZMXY4Z3nY/HbMeQD/WbMdw46966D4VF781eaQ8k5fB7SK
50sPEgNMxFaExwE=
=n9Ad
-----END PGP SIGNATURE-----

--------------S715Ge2YeqWnkOqLKFLPtes6--
