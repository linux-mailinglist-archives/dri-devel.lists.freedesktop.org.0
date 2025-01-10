Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AFBA097A9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 17:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBB910F127;
	Fri, 10 Jan 2025 16:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LCGJHmiE";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="O1AbH0HS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1174110F127
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 16:39:20 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AEdSOw022408;
 Fri, 10 Jan 2025 16:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=HNL+GzF9hHV85RxPb1EUK90Rw
 XT6WTHob9iKvud19MQ=; b=LCGJHmiEloXkRf0t35diTfm5IcHwdvSJTdO21FXUc
 5INHeRza361JfqN6pO6j8yIyEMsbkHYYdhcfboou5+DDPSPXAbyTZF091o7bjFI7
 wzRuwEEdLnXoDu4MTu5Yo5i4dNWKdLERaQPNYVi7O/cD4jS4dZ1RDW3x8sTQO13R
 PFeq6tJHim3VyCMH+i7uzdyQY8V6ggNeCaBS+1i+bZcWMkAT5hBMm/rYsbNM7m5y
 G88Rp/k6VnxerBYwN6M2bGT2gPbyqhEw+72KhcnHdRdRk5dd1Qp55Qgnwy1GqX14
 0fsbvsicW6BCfF+3hT+gIhPe8Hvb+1maV8EsOKifAUrSw==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012054.outbound.protection.outlook.com [40.93.67.54])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 441fna1upr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2025 16:38:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUzJXAmAW9DhWwi4TP25NsfEZPtykhs17m3vx3h5GQCguJQGw4cdhC1U1bi+aWrb69oPFydMRwTq6I1cg78VnAKs/66JxTBZxKhmR1GdBFifILSXurU5d04r5nyVIWA3SdGpsvC+zdsxlqfohy5qoJK2h37LMXjoA1Uqb+hnKyMBLjtIYJldInL8cEjkaE9RE9wnlbVoUq5X8YAfrhXfBXV/CIECwgTsHtOfkrfbgYTD9uvBv74MyCsW5a58NDsh8w5Sa4sIbylBvmf/chKjDxQxTAR7OZWnYNJzgkKX2S1jKKVodVI+MJTnQvYX1yoeVdwitQLD+my82VuG1/GwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNL+GzF9hHV85RxPb1EUK90RwXT6WTHob9iKvud19MQ=;
 b=TMZEUPHnsIWKyGL6IJL9KT+0X3FTTOU4G1u/fYHJC+Wj4jEoGQX84/dfOFuv7QLLL93MTtucHZt0sfyhWIz9tDUknsSrDQLPTsapVZSnJxwjcSzNsYrMrDXxHOGyfoRhcudDC45+VGSNNT1oSz2fIa7pE3hqiC9FAJ4SgTZmiy9rnwjpEyQK1z/Hg7ppO0zTnyALDjUKIuvWoILi5u6MdC08qezLenEt7Pw8j6swOUM8r/tQWxdgGg/A9Cc2etiNtt2NS+9HfKXQueJfCW9PqierblaLkD4LmvHbSMRdQlwD5wJRIF1FY0FSLTuttHByzO0eqdzVVYzm3CKor+vJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNL+GzF9hHV85RxPb1EUK90RwXT6WTHob9iKvud19MQ=;
 b=O1AbH0HSiGeCIbjl4vXfgwTBIDEqiBe2awytt3sfKpLFV9E13wrie64R+D8k73Ov0p9letrSGIe2CfVIb6FFBhYBbMdyrfeHvon5io3FRD6NAo2dkiemi9GkmbLvUfl3z0dE4242LwyuAT3IAHv9gNqWSLRXBWgNeG7uL7ifwEc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LOYP265MB2351.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:113::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.12; Fri, 10 Jan 2025 16:38:55 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 16:38:55 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: Re: [RFC 06/18] drm/sched: Add helper to check job dependencies
Thread-Topic: [RFC 06/18] drm/sched: Add helper to check job dependencies
Thread-Index: AQHbYfwkPBiRjkkHz0qZJfHHjJzSiLMQOE0A
Date: Fri, 10 Jan 2025 16:38:55 +0000
Message-ID: <1941a000-f170-45c0-9df3-ab8aefc664db@imgtec.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-7-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250108183528.41007-7-tvrtko.ursulin@igalia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LOYP265MB2351:EE_
x-ms-office365-filtering-correlation-id: 02d80d3f-e630-4b01-37c9-08dd31954639
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z0t2ams4L3lDMjRQR0FpeEZ4cDlHQTNNRHVmMmFTUXVkR3Q0ME1ONlRtcnJ6?=
 =?utf-8?B?aGx5TTIxTXczTTlDZjkwTjdFdk5yd3RrK09jbk5kRDhaWW5xSHNYNHdUVEJ6?=
 =?utf-8?B?VURmYkRQSUVqb3J2Q2IvMFRBY0QzUVJtMmZ2eC8rUEpCR214RXF5WUNOdFVy?=
 =?utf-8?B?RXVRWUpGZlhGbnE1Zis5VVhwNC8waHB3cmN0aHdHUzBMTUI1TlhoS0RNeUJN?=
 =?utf-8?B?TmFXRTJtRSsrYnZDL3V4QzJuWEYvMCtoenJkcElSdWppOCtQd0xKdURSZWdE?=
 =?utf-8?B?WWZHM1ZRZEJCdjVqSDZNZmlkRG0zQUZhUGU5MER4K1FzZU9uQ2JlVUdNeEZa?=
 =?utf-8?B?bVVWV3hYbCtjdFhTM0JTUTV1OTJDN1c4TlpQcFU1czlyZDBiM1pIRFlHc3Rt?=
 =?utf-8?B?MFAzRi8ySlFOTk1xSXdhYllpa0NDRGNaeTNqVXlFRjhJQ1dMcmZtVXcwRDZh?=
 =?utf-8?B?NmloRmxObUs0ZkZvRDJ6ei9KZHNxcE1TR1VnUWtveWF4NjFkNm9EeEZUQ085?=
 =?utf-8?B?NGVWclNHdGdZRTkyOFF6SzZEeksrN0ZGMm4rMmc1SkpiTXNBL1ZjQnEvNVV4?=
 =?utf-8?B?b2M4MFBwNWJ3UC9hTlIraDhadXVhYTlLaThrZGdmKytYZWFmNWN5bWdNaEl2?=
 =?utf-8?B?Zi9yeUFjWExGVnAyVG1NTjJGd3htVCtVQ1VDVFNNZ2lXK1ByNXRQalZpRGk0?=
 =?utf-8?B?T1M2bjRwWjZjY2lBOE5SUFdMWHhDWGJ3OWJOZjhUSUZYbklQQ3ZXUmZZNk9k?=
 =?utf-8?B?WEwwdWpFYUFEYTY1bzZaandWUUJYWXl1Qk11WjFuL1VlRjF6eUg2bXo4Yjli?=
 =?utf-8?B?MnJBQXVoa0NnWENyRGgvbW4rN0p6SE5KOGhDV2FKT3hycVcrZzIwQS82M0NH?=
 =?utf-8?B?S3hNcFRqczhJYmYyeDJDQ0lXOTBPb0M3dG9pYVdUV1FKY1hZd2haZGpnUnM3?=
 =?utf-8?B?N1NlNFVCS0lnSjhFc1IvZGM1YUpTOUU4d0E2NmlBUHdVQUlkcFpZK2NzWUxD?=
 =?utf-8?B?TnhLNTQ5TVlObEc3MlZldkJEUEFXZTdUbzM5Z2FNaWo4YXd6K2pQR3c4cWNU?=
 =?utf-8?B?WDZKVWl4NmJSVTVQNVJxbmQvZXN3NWI3ODRXZ3N1Lzc3UmVyL2x6eG5ZNWtj?=
 =?utf-8?B?TnZGRzNoMzhOUjJSZ3BubHFIWHk1TnhUckVWNUNPMTFvN0gzV1UxTU9MWXJv?=
 =?utf-8?B?TGNvMldSTXgyQTM3RHhuMEdIWnkvRktubTNPVnNwR3NKSXN3bHRabjRWa0Vx?=
 =?utf-8?B?RXhhWXU1OTA4amlWcEIvWE9ZMWN4eXUzU2VZaTdFRUFwSVBwVzNabGxZNnJa?=
 =?utf-8?B?NkdxaGhySUF5VWlkcUxXcVB0QzhubCtBZGMzMW83QUM5MEU5RExiZUNNd1Vi?=
 =?utf-8?B?MnN4UUFaMUF6ZHYxTldLb3NUeFVFdjBCSG5qQVBIcEIwenlqOG5OaTlseHpE?=
 =?utf-8?B?bzBKMDVxQ280RkdiYU40MDFmM1Rlakh2Y05DdVJ6UFoveXRTK2FRcTVNaWgv?=
 =?utf-8?B?Zng1NHRONTJtZVQ1ajdQT3RnUXd0K0lzMHpMWm4yNnRFMWlYeU8waWNyaTV5?=
 =?utf-8?B?RU9lVTEydCtsalJvY3dDdE1PWkpyUzZ0MTNpS1FOOExLVzk1T09PMUYwMklG?=
 =?utf-8?B?NE1iMlIrV3JXWC9qc3NIREJPRnlqUzZXYlk2N3I0aUpiZlNCTkRIUTlVcXYz?=
 =?utf-8?B?TVNsRkxWczJpMnJZSkxNNklqK0tGMllaZmIrM1hDWDVscUJUc0Y3aklwK3hE?=
 =?utf-8?B?eDVFU052a3VOSmJUUjVEY0V1cldLQmwydW5OR0h1UWRwYjJNajhmaUtjSjVK?=
 =?utf-8?B?Q2NUWE52a2MzUi9tQklwaWM5eVpYWG9FL0VhbW5nMlVtUUFVQzRXMkNUdEtj?=
 =?utf-8?B?VVNmd2szWjRsTUZra2JSU0dIZEdFbWdZdml1QjBRR0hiU2JRQU9BUjlRUGwy?=
 =?utf-8?Q?h0kcl2LpwiBLk3RXt4dWuVzOLziKTOL5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEE5Z214NXhqTS9MdHlFd3BxM3RQbm9rOXB4VmVndXJxVHpoQ0xmd3U0b2NL?=
 =?utf-8?B?RXFKbVFpcU54dm5Ra1YwWmhHM3pQUVpsV2MxU0Y5SnF1NUx5dnhyaFNyUkFq?=
 =?utf-8?B?eVpueGhzNjBmWUtkZWorRC9vQTl3c1VRVGtmbWVHNnQvNzl1UVhuSWhhbHlS?=
 =?utf-8?B?R2FzaUtUaGFZTzNDNFpjR2cwekQyN0ZzZjVCeENvNE9MTVk1N2I4eVZSMWFU?=
 =?utf-8?B?S2c3WUNGVUZDY0IxVE9uM0IwYXFlVWJPTjBuOVc3czRQaHlRMU5PU2dVQU9w?=
 =?utf-8?B?SUV6amM3TElXSnlzN29mT1ozY3RmZTN0MlNsU0oxdVNtQTg5VW5NTzBCV1ZQ?=
 =?utf-8?B?N2tkZXZxRjZzaFFqYTBubTdJLy9FTmIzRFZFKzk0a2I5bTQ1Tko0c2wwZnNm?=
 =?utf-8?B?VjVFdzVyOS93cEFSN3RVQ3czVitibzd6eGRvVkluOGpvT0h6NWpxZ21HaXJK?=
 =?utf-8?B?VGRuY281MENyQ0xkM0MxbjR0bEJpcisxdkI1L244UXhCY3NPcUE1ektLUGwy?=
 =?utf-8?B?QXJjYm1QY05yQVpFYklrM2E0UUZ3UFpTT0dHbVpweGQvbExnbmJmcDFrMUZI?=
 =?utf-8?B?VHdyTHk5NmkzNUsyU3kzcUhlc2hLWTZVMm1tNTdrL2ZmYk1nS01SZFdvTC95?=
 =?utf-8?B?Qng2dXo5K3dGYWp1ajY4KzY3OExyQ1gvRys3cTBHbm4wNDA5eXI3azRqaFox?=
 =?utf-8?B?QjErSUxRdE1OQkpvMHlVeC9NMzIyV0dZVDNsUTVJM2YvNC9mRjkzeCtDV2dp?=
 =?utf-8?B?NVdXcmpGenNyNW41SnlhN3FUSnhoQWRFVXZHN3d4NDhIYk1uNVROamdNWVNw?=
 =?utf-8?B?REFBcnN4bXY3aUkwNUFqeTRXU0RaS1BwMkRkMk00N0VTTGJpMzh2d2R5eDc0?=
 =?utf-8?B?T2VHQWl6bXFOYUw1ZmJIS01uT2lGVzkzbDBva3lKakh1ZnV4TldVUk56ZVhH?=
 =?utf-8?B?ZC84K1ZwZkFGT3VBdFMweUdueUczOTRucEpod1hSODByMFVRakNFR3dDcUFY?=
 =?utf-8?B?RGllOEUvZlVHV1J3WmFqQXJuNXNPSlR2V3gwWjlaYlRsSit3U0duS3hMcDJy?=
 =?utf-8?B?cG0ybXlnQ01MYTRmU0xHSy9XVHNYVHl1bkZwNlp6dXREelNwa0pwRS9IN3Jk?=
 =?utf-8?B?dlJBdmd5S1I3SjIvRUVpU3VsbkRPZmhuYlVOMk5ZeDFGbjJoTXBQaE9sS1pw?=
 =?utf-8?B?NUxINmMrMDIwSGhvdXo2ekpUcHIySVVDc1RRZEQwaVZ1eTFuRm1XdGg4WEtK?=
 =?utf-8?B?a1U1L3lQNlBrSTFpRGtxWXBGTUhtUnJoOHFZUkJvWmdWMzJtT2RUWnF5NXZ6?=
 =?utf-8?B?TG9mM2t0cXhqWFB0NWZSZjltOEJIOEltQWY3ZnBBVGhRc1llZllNV0tGKzZI?=
 =?utf-8?B?aVpoSFR3UWU3dWQ2WmlpNGczbG5ha1dKdGpROXpaQVk1TnEvTy9XcUZ3dVNV?=
 =?utf-8?B?cjZKZ3BjbUlwUFJKU1UxTmdRZjI3cmprYXRwQzZNdjQwMjRkTVQrejVrcjJR?=
 =?utf-8?B?R0JFQjJxeWNzZm1QZFE0WUYvMzE0MGFBakxMelFhVVZSbUdGUWVtdEl5OE81?=
 =?utf-8?B?TklYVjlRTE5oTXAvWTNMTFZTZ1ViRjJFVm1haFVLWjJ4VTFmRy9sdGcvK2xC?=
 =?utf-8?B?anprR3EzVmo1MVVJcy9KekVzRWNjTk9EWk1YdXZPZHc0YUIwZi92VFY5cHBa?=
 =?utf-8?B?ajRHUlREWm1YUjY1c0FWVlBVdFZ5cUtMeUtnbmlFUjlLTW84RWRjaTJmV3o0?=
 =?utf-8?B?REtSVE5mNTUxeHdXL0N6TEoxb2VqZWd0K1RERUlici85UkUzQlRyVmZBdzhp?=
 =?utf-8?B?RlVXMTJGTVVzU0RzRjlIN3Z6Wm8wZEtFQU1pNnN0Mm1NU3loUTFMb2xXNmI2?=
 =?utf-8?B?RHBkMGQ0Y09zMElNYkowSlpLbmV4c2dHMFRaSEYyemljeHhDWllGZitkUFRR?=
 =?utf-8?B?MWR6MWZoRjloN0FoWXdxSzQrdTRHaUg3bjdVbGhkY0FXazBPdzRrUjNlbkty?=
 =?utf-8?B?TS91MEdzVk5zR3plWldJWHNBaHpxZ2dleW9zM1ZVTW5qdWt1TWNVSmdjVzgv?=
 =?utf-8?B?dXMxT3RrckFtOUMvM2ZZUWRiZWRaMjdhR3FNYzF1OTBpUUtRN3RmZitiNXV0?=
 =?utf-8?B?TUhDQUsySS9oNnIzKzRHZ2VQMTlYeE1VMFlOSGdlT2RJV0RTd1B1SUJmbmdK?=
 =?utf-8?B?emc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QAFuqvMXoLUtxzS0whl4eQ5X"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d80d3f-e630-4b01-37c9-08dd31954639
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 16:38:55.4352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wLLofsEaaGBB727TRbqOHwObYZnNNtLDxMNkYD0UTEtGc0VSkNTQyiByB9R2/rBp06P0+UTWSdJTrpuJq291kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2351
X-Proofpoint-GUID: pQDVmtIxrlNiVEsZtXtY-RDR8oARTW-8
X-Proofpoint-ORIG-GUID: pQDVmtIxrlNiVEsZtXtY-RDR8oARTW-8
X-Authority-Analysis: v=2.4 cv=QIKSRhLL c=1 sm=1 tr=0 ts=67814d22 cx=c_pps
 a=OWG4u28xvyK4UEmBMsNz2Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=V2sgnzSHAAAA:8 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8
 a=r_1tXGB3AAAA:8 a=Insu47yjnQx4Fr2-9twA:9 a=QEXdDO2ut3YA:10
 a=8OBcZRYu50wQG-W_CKsA:9 a=FfaGCDsud1wA:10 a=Z31ocT7rh6aUJxSkT1EX:22
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

--------------QAFuqvMXoLUtxzS0whl4eQ5X
Content-Type: multipart/mixed; boundary="------------7ksvf4uu29eyHnGzEODjuueN";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Message-ID: <1941a000-f170-45c0-9df3-ab8aefc664db@imgtec.com>
Subject: Re: [RFC 06/18] drm/sched: Add helper to check job dependencies
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-7-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250108183528.41007-7-tvrtko.ursulin@igalia.com>

--------------7ksvf4uu29eyHnGzEODjuueN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/01/2025 18:35, Tvrtko Ursulin wrote:
> Lets isolate scheduler internals from drivers such as pvr which current=
ly
> walks the dependency array to look for fences.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

--=20
Matt Coster
E: matt.coster@imgtec.com

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++++++++++++
>  include/drm/gpu_scheduler.h            |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 64cd79e1793a..f07b19c97d0f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -968,6 +968,29 @@ int drm_sched_job_add_implicit_dependencies(struct=
 drm_sched_job *job,
>  }
>  EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
> =20
> +/**
> + * drm_sched_job_has_dependency - check whether fence is the job's dep=
endency
> + * @job: scheduler job to check
> + * @fence: fence to look for
> + *
> + * Returns:
> + * True if @fence is found within the job's dependencies, or otherwise=
 false.
> + */
> +bool drm_sched_job_has_dependency(struct drm_sched_job *job,
> +				  struct dma_fence *fence)
> +{
> +	struct dma_fence *f;
> +	unsigned long index;
> +
> +	xa_for_each(&job->dependencies, index, f) {
> +		if (f =3D=3D fence)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(drm_sched_job_has_dependency);
> +
>  /**
>   * drm_sched_job_cleanup - clean up scheduler job resources
>   * @job: scheduler job to clean up
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e2e6af8849c6..a0ff08123f07 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -564,7 +564,8 @@ int drm_sched_job_add_resv_dependencies(struct drm_=
sched_job *job,
>  int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,=

>  					    struct drm_gem_object *obj,
>  					    bool write);
> -
> +bool drm_sched_job_has_dependency(struct drm_sched_job *job,
> +				  struct dma_fence *fence);
> =20
>  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------7ksvf4uu29eyHnGzEODjuueN--

--------------QAFuqvMXoLUtxzS0whl4eQ5X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ4FNHgUDAAAAAAAKCRB5vBnz2d5qsJgm
AQCULCMAVVZq6YvbCFiVUZ66xpCV3yVYHWFEzj89Q/440wEAr27u6URWCDNj3iSl80j+i188tR/g
FoRF0Mt1vpk/7AU=
=Uc6E
-----END PGP SIGNATURE-----

--------------QAFuqvMXoLUtxzS0whl4eQ5X--
