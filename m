Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA4A77231
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 03:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A683C10E1B9;
	Tue,  1 Apr 2025 01:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="pCWlmXY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19011031.outbound.protection.outlook.com [52.103.43.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290AE10E1B9;
 Tue,  1 Apr 2025 01:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T53G9pUNWPykJN0K4MrR+aGDKcPrznpu6BcmCarcIsxzJMPIf7vO+KHLvdr7DszTC+8gOEBkG5DFvUlFGIRogQgpK8685Az3LEjsrXjITTZs7B69mJ5z2S/xo/SmtEwNcSviOpRJ3fqWvcvbh/qfQJ6pkV3ZPypKyLOnUi5GGFpAiHxvMGTphoMY9sMro0yh2HZhDoFgbPwUKTeiKTpyiKKGC1BXMRtviDHkiUznh1V85cTjf+5rI0v4lUpY5TIwEm2nftS+6M5pmWXxZFkOIonySUHVYOtPx+JAmQQKYzZ4Znozc/fzZgHjsCS5XiC9kqBB1YEiKoYmLRsxN4iERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiWvuvB9VHyFfF1IpxDCeZTyN+QVziTT1bLWGfd/4OM=;
 b=K44EgRXcITpcuTfiCGgyH42WYO8m7isga+ZICPx+wifsLjtsuh44XCrGkrt40EkbIzjtMNzGN76JQZKgRJOTqoy/q30cnRL3npgEXs6Q00EvvJZqGjYPXKl4ijBpLd3GYnTRT4ICIC+pVbziIaWtlWMYgI3FgsOUK3QWoGrkXsjlDm9r30L/vva96uGEmbDWe72/mY0o5bl2eCmKJFf736oeGp9mRxLSpdMqrKmMNN9Zn9thViP7/tTIHpKjBrmdlJA0d3tz0CqJpgzfqTR8nGtSEphVZOIQ6ElhiYFCle2elsQbcDRnEyTGPLpsrgRUtXv+UH6I6wIcwvpaxMt2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiWvuvB9VHyFfF1IpxDCeZTyN+QVziTT1bLWGfd/4OM=;
 b=pCWlmXY+jnMpn8xUSpCw8nPrypBscB88Tv5VaViWom3qcbVod6O0g7uDuaYBc2M3AmAapM3UkvyLz5tyTg9LuEefKcf1cppz70RE2kzR099x6FFMnWDmRldBPGrKjqD+IYk6euDNFAKJlMUUNHP5AOrq5ER08p4SLmZp39+7IEsGO4LWZJU+s5RzvDNbJJFQvCDGRy6nAyE8xesDTgbGLCeB/dA8MTJWn5aWZr0JDJ7kj/fku2sSz+cOdDt0W3UfAakg3qFrGT9TWV97qGa1pkF/MPhYYgETUx8yTuoMjIgQ21E3RLTJi9XvnNszSkXfbkx10XGLrraRLUhe1PDUyA==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS7PR01MB11807.jpnprd01.prod.outlook.com (2603:1096:604:244::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.31; Tue, 1 Apr
 2025 01:04:47 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Tue, 1 Apr 2025
 01:04:47 +0000
Message-ID: <TYCPR01MB84376CBEF57BE8D6E1C6830998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Tue, 1 Apr 2025 09:04:39 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n2LwRiUuLrgrQ85e5THMTb0W"
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <89ae6d23-2a1d-4a54-a0aa-e0ec0f05d387@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OS7PR01MB11807:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8ce7c1-caa8-43a9-e8e4-08dd70b9321e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7092599003|19110799003|6092099012|15080799006|8060799006|5072599009|12121999004|461199028|56899033|13095399003|440099028|3412199025|41001999003|26115399003|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTN4Y0VnOU9nMzg3bDc0RElVSk8wdHY0VVFQbDc1ckNzTm1YVWJkRTAzRWZU?=
 =?utf-8?B?SzZnSTFhYkQ5TkRwbUk5dGk1OGlQYUJLRGN3TFFhT25GN21ZcE1HdjV6Rzk3?=
 =?utf-8?B?SW9mOVBjZmxWc1laWnZSdmV1dlA0RjlSMS91N1p5U0VhQzdwbUV2ZjFhekRB?=
 =?utf-8?B?T0JIVCthQUVmNllXUzRBdS9GR2lXRGJ0NmY2a1B3M3hqTUF4QUw4VnhvZG55?=
 =?utf-8?B?Sm1BdVZyQTZvMW9ma1NsWndoSW83WTBBaG4rdU9TMVBuaXB0TTFZKzdmUlU5?=
 =?utf-8?B?cE84UWFLdEQ4bkRrZDBieVk3QTRxRWJ2ZlhSaE5tRVVvSzRLc3JEVllwVE40?=
 =?utf-8?B?djlSR3M5MGFFajN4My9rRVdrY05DelZoUjhWdW1ERnMwcm9oVHEyNzNXdXNq?=
 =?utf-8?B?dnVBb2U4bGcyZXNzV0djMzhhZ3kzME1SWHZXUVBGZk5NaFVGMDJDNWhvZkcw?=
 =?utf-8?B?OG5YZDJOMXo2UUlDSlFjRUlnaExISzduMTB6MUFWSjhtdFdXR0t2MWZuYVhH?=
 =?utf-8?B?QWtNVEZWeWRjYkVKcE1HVHRxc1FuWEUrMTNMbzBYbEgybjlPcGxuand0Mzd0?=
 =?utf-8?B?bWJMMWd1cThweGxORnBwd2RGeE1rUjdUeGFkRjRRWVhrZGNuQnhEeXZONHdW?=
 =?utf-8?B?L1NrWW9OTHZFWVdRTUZiS0ZmMHhtcVJ4UEVZcWxEUEhNaFpNeEp6MDMwbjVC?=
 =?utf-8?B?Y0dSend2V0tlWjErUHQyc0RGOU1pUzVyM2w0WGdjdElQMHBVc2lOL3U1aUFX?=
 =?utf-8?B?NVB2eVFqMWRlTGY2NVI3N2h5YVdiVHhMSFpReC9ZWkZVa1pDdVpHMTJpM2tw?=
 =?utf-8?B?SEp0TlhYZWt4N1lwWnM5SXRTM3lhWnZvWVhpY3EzVWZEdno2dHh4dlFIazZN?=
 =?utf-8?B?ckwzZ09xcWRvTEhrTDQ2QmIvSlJOUG01VmVTbmxSYXZpNDR0WDZMdi84N21Z?=
 =?utf-8?B?V0ZPWnRjaCtHWjdacFUrWVBJN29MdngvVk5ab2dXTjF6TS9HNFFoMlYvbSs4?=
 =?utf-8?B?b0o1N3NJWmkwNHM5WTVFand1bjVmNjFtUkJTVENWbndxcVFyZFIvWElsS1Z4?=
 =?utf-8?B?ZjJ1SHpNRjNJVEdFaHIwVkN5a1NNdjNYYjJSdG9oSjkyRlZvY0dWUUp6eXJ5?=
 =?utf-8?B?bk1PL0JnV1h6SGZFMDNYdnZYZHlQYzlIUzR3ZmdRUDlnZFdLSlF5M0FJOHB1?=
 =?utf-8?B?VlpuNzNnS3Y3bTZIdk9hVTJ5NWZmVmtYMTNnZVo1bmdGZWNNUEZnaWgxOUZl?=
 =?utf-8?B?ZEVORlBnODdCN0Zpa2VaUGQyQWZ5Y09JQmxsWUNmKy9JbmtmUW1KRVlyTnkz?=
 =?utf-8?B?MGZzZmhwU2wwQ3ZYWVlYSkVneGtNZnptYS85c2lpMVFOWXN3UHZCblZkaXMv?=
 =?utf-8?B?RlFpeFdyR3FOYSthcXJySzcwNnp2bkcvOGV1WmhLWVBoNUl5VjJhODgrQndj?=
 =?utf-8?B?ME5kQnloM3N6Y0ZJbFg3WVZGbXgxN29WTXhwd1F5NVZCbkQwUmhGem85OGFy?=
 =?utf-8?B?WEJyOWY3c0hPR3VwMk9raXd6UHZKbXBhUC9uRGFCWWsvWlRmNzNJc3J2azVa?=
 =?utf-8?B?dTNtOGQ1bi8rbDBacHYvdlg5blAwRDFWZmJtNEVhcldTTE1VbVl0WDBSckhF?=
 =?utf-8?B?TE02dXEvZktZRnVhb3JpdjRnYTFNZGNPQS9YL3JiMjM1R0htb3BxUzZEZmRo?=
 =?utf-8?B?UkRHTU5xMUFRenh5KzFNVDJ3bWFST0tad3hacjE1VmVrVXZvSmRqVHBMenJz?=
 =?utf-8?B?MjZ5RGFpNHRnandMQWNoemU5dzhRMUJzUnRxTmszY0pta1Y4WGQxVTFyU1RO?=
 =?utf-8?B?cU1oOWQ3NHlVV3lleUlqUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2wvb01sKzQwbnlCcHE4Q2phUU9uSWp0UExtL0xBYVdiVytlSm1aNnZjaFpX?=
 =?utf-8?B?SW5rc0pHbFBhRHZhb0g2OTBjNWtGNExzSEtpSm9uVzZPNVBQMnlUQUhBR1hL?=
 =?utf-8?B?K2oyMkVSNVljam9oYVpMczBUb21mczlpTWVnUzhnWFgybWJRelJNWU1Zd0h4?=
 =?utf-8?B?WTM0Q1ErWTN3Nk1kTkhBWTQzaE1pUTdWWHY1Kzl4Z0xVSmJvNEVTUEw1dkZQ?=
 =?utf-8?B?ZGdPdzhNNTF4dGlJazdaa3lnVXBoS1JnV0dxaXk4eWttRWI3WlVRQm42YUht?=
 =?utf-8?B?QysxZTRNT0grZktDRkI5ZWJpVnNKUWl3LzhydWRTcUQ0Tnc1d3llSWJyQzRs?=
 =?utf-8?B?dytzL1FvaTdtSHdqZnFWaUxRSnBlM21WeTlPY1kwLzZGUHN2Sm0zU1M1czlL?=
 =?utf-8?B?M2wrclRjTnJ1ZytEelI0RUxydFZyVm9UQnpDbGNQQ2lEclNCaEUzYUFZcmpz?=
 =?utf-8?B?L0VUcWVUVEI4dTRGK2Y4SnVIUU5RWTFuZ3ljakF4cG5ZZjZuSlluSFZQL2xZ?=
 =?utf-8?B?bVFYaS9QQm1GZHNXcWtKdFllTFJPSWhnV200cUxLRmt2a0s5THpFZ25FWEFl?=
 =?utf-8?B?SFloaGM3TG9YZXZvd3V2cDcrNGcrTFVLcHU1eFRSL3FPd3ZMMy81UUx0ZHlE?=
 =?utf-8?B?THFIclZaMjBoQWNKQzZqaHY1UUo4ZUVqM1F0cUdLN0ZXcURkREpwV2FTdWx4?=
 =?utf-8?B?clpzK01FK2FvY0JHaVdQMW1OcDFsY0ZSTlRHcFZZa2ZOM0lWNSt0MlRWVFFT?=
 =?utf-8?B?bVJKREdPTzFmNVI2cHNVbDNwVHVjajA2YXc1UktRb0NaUDZsdjBFNE8wSDIr?=
 =?utf-8?B?a05DZEMrUDEwUWxja0d4TWtkUmdQcS8rWjdYSFM5QzB4THNaUWQ5ejBNTGl2?=
 =?utf-8?B?Y1dneFlCcUVOTUJlUlEyZmt3UTQ2V1pxbllyVXZ6dEhzYWMyeWI5Mi8zRi83?=
 =?utf-8?B?c2RUNXlNckVTNlRDejNqQ0RpZ0g3enFWem93N0QxMWl4RnN3Y0ljYldaTUV3?=
 =?utf-8?B?RStyZk54T2hRekxrc1duUWlzMTcwVWd0b2dmcUhNUWJVWFF6YUMrNWNrQTNE?=
 =?utf-8?B?UkRYYWE4Z0JGNkJEekpUeXcyZHBMbjNGenI4Y2ZVOHRaeVcyejFXR3ZUYktw?=
 =?utf-8?B?eXBpZUFzRDF0VzBHaHRqV0l3dEhmU3pqWG1oVXdJM3dNMUpyWUpiZ1hNeGlr?=
 =?utf-8?B?YU5SQlBqd2ViellJUmxsTG1QOHhadnlpbzZsdndBRFN6SFJKV2JyQ3JNbkt0?=
 =?utf-8?B?L0tlaXBwazJNUS9pTlhUTkxhejNpWGV4SmpYTk9qVjczd3d3czQzM2ZmL1Iw?=
 =?utf-8?B?dnlzRUFkaVVnUnQwbUlaS2s2ZFBWVVJCekQ1alIxcWhrWmY2eFVuQUt3b0Rp?=
 =?utf-8?B?Q3RQWXFFSzhBcjVYVnE0VGo4KzNKa25yNUY2dmc3QnhMNE5jUjhLakExRHZV?=
 =?utf-8?B?TnJxU0RQaGpVUHFXYUhUWmM5MjAzZWNWeld6K1d0TmdHMW1CeHVyVnp6azBF?=
 =?utf-8?B?aXJtVC9hanVPUElTaVhjTXljN041a1BITjNsR2JCVDNOTnlSd1BkVUp2eDBP?=
 =?utf-8?B?OFhyN0Nsc1JrdXdsV08vc3JCNkpFc3lHUE40WWtCYnRwNldPOVBVVmRJWVVY?=
 =?utf-8?B?NHNrZjRwZzdtNThoc01aL3YzcXA2emFWbDcxTEJmMG5VbXFxWmdjOXFwQk9L?=
 =?utf-8?B?ejZNdEZRNWpNak1NWGRVZ2FsazRyRUN2VU9WK2lmY3V4bk0xWE1Va1VFRk5S?=
 =?utf-8?Q?qunK9KVA4yKVvwCVis=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8ce7c1-caa8-43a9-e8e4-08dd70b9321e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 01:04:47.3808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11807
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

--------------n2LwRiUuLrgrQ85e5THMTb0W
Content-Type: multipart/mixed; boundary="------------tWa5fZRVZLT9Fz0EzY9TKD7b";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
Message-ID: <89ae6d23-2a1d-4a54-a0aa-e0ec0f05d387@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
 <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>
In-Reply-To: <5eac0bab-60c2-4e94-9ab2-bad5f451c8c9@amd.com>

--------------tWa5fZRVZLT9Fz0EzY9TKD7b
Content-Type: multipart/mixed; boundary="------------1i3KsCahNMaPJmf20TUGfJzq"

--------------1i3KsCahNMaPJmf20TUGfJzq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCuWcqCAyMDI1LzQvMSAxOjQyLCBBbGV4IEh1bmcg5YaZ6YGTOg0KPiANCj4gDQo+IE9u
IDMvMzEvMjUgMTE6MDQsIFNoZW5neXUgUXUgd3JvdGU6DQo+PiBPciB3ZSBjYW4gYWRkIHNv
bWUga2luZCBvZiAibGlua2VkIHdpdGgiIGluZm8gdG8gcGxhbmUncyANCj4+IENPTE9SX1BJ
UEVMSU5FIHByb3BlcnR5LCB0byBsZXQgdXNlcnNwYWNlIGtub3cgdGhhdCBjdXJzb3IgcGxh
bmUgYW5kIA0KPj4gYmFja2dyb3VuZCBwbGFuZSBzaGFyZSB0aGUgc2FtZSBjb2xvcm9wIGNv
bmZpZy4gU28gdGhhdCB1c2Vyc3BhY2UgDQo+PiBjb3VsZCBkbyBleHRyYSBjb252ZXJzaW9u
IG9uIGN1cnNvciBpbWFnZSBkYXRhIHRvIGF2b2lkIGRpc3BsYXkgd3JvbmcgDQo+PiBjdXJz
b3IgY29sb3IuDQo+IA0KPiBUaGF0J3Mgb3Zlci1jb21wbGljYXRlIGFuZCBtYWtlcyBsaXR0
bGUgc2Vuc2UgZm9yIGJvdGggZGV2aWNlIGRyaXZlcnMgDQo+IGFuZCB1c2Vyc3BhY2UgYXBw
bGljYXRpb25zLg0KPiANCj4gSWYgYW55IHBsYW5lcyBzaGFyZSBzYW1lIGNvbG9yb3AgY29u
ZmlnLCBhIGRldmljZSBkcml2ZXIgZXhwb3NlcyB0aGUgDQo+IHNhbWUgY29sb3IgcGlwZWxp
bmUgd2l0aCB0aGUgc2FtZSBjb2xvcm9wcy4NCj4gDQo+IElmIGEgcGxhbmUgZG9lcyBub3Qg
c3VwcG9ydCBjb2xvciBwaXBlbGluZSBvciBhIGRyaXZlciBkb2Vzbid0IHdhbnQgdG8gDQo+
IHN1cHBvcnQgaXQsIHRoZXJlIGlzIG5vIGNvbG9yIHBpcGVsaW5lIGFuZCBubyBjb2xvciBv
YmplY3RzLg0KTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGN1cnJlbnRseSB0aGUgZHJpdmVy
IHdvdWxkIGp1c3QgcmVwb3J0IG5vIA0KY29sb3JvcCBzdXBwb3J0IG9uIGN1cnNvciBwbGFu
ZSBhbmQgYWN0dWFsbHkgaW1wbGVtZW50IHRoZSBiYWNrZ3JvdW5kIA0KcGxhbmUncyBjb2xv
cm9wIG9uIGN1cnNvcj8NCg0KPiANCj4gQWdhaW4gaXQgaXMgdXAgdG8gY29tcG9zaXRvcnMg
b3IgYXBwcyB0byBkZXRlcm1pbmUgaG93IGNvbG9yIHBpcGVsaW5lIA0KPiBhbmQgY29sb3Jv
cHMgYXJlIHVzZWQgKG9yIG5vdCkuIEZvciBleGFtcGxlLCBib3RoIHByaW1hcnkgcGxhbmUg
YW5kIA0KPiBvdmVybGF5IHBsYW5lIGhhdmUgdGhlIHNhbWUgY29sb3IgcGlwZWxpbmUsIEhE
UiBjYW4gYmUgZW5hYmxlZCBvbmx5IG9uIA0KPiBvdmVybGF5IGJ1dCBub3Qgb24gcHJpbWFy
eS4NClN0aWxsIHRoaXMgaXMgdGhlIGNsZWFuZXN0IHdheSB0byBsZXQgY29tcG9zaXRvcnMg
a25vdyBhbmQgZGVhbCB3aXRoIA0KdGhpcyBzcGVjaWFsIGN1cnNvciBwbGFuZSBiZWhhdmlv
ci4gT3IgaWYgY29tcG9zaXRvcnMgd2FudCB0byB1c2UgYWxsIA0KcGxhbmVzIHdpdGggaHcg
Y29sb3JvcCArIE1QTyhmb3IgcG93ZXIgc2F2aW5nIG9yIHN0aC4pLCB0aGV5IGhhdmUgdG8g
DQpkZXRlY3QgdGhlIGdwdSB0aGV5IGFyZSBydW5uaW5nIG9uIGFuZCBhcHBseSBhIHF1aXJr
IGZvciB0aGlzLiBUaGF0J3MgYSANCiJkaXJ0eSIgaW1wbGVtZW50YXRpb24uDQoNCj4gDQo+
Pg0KPj4g5ZyoIDIwMjUvNC8xIDA6NTAsIFNoZW5neXUgUXUg5YaZ6YGTOg0KPj4+IFRoYW5r
cywgSSBtaXN0b29rIGFib3V0IHRoZSBNUE8gZG9jdW1lbnQuIE1heWJlIHdlIHNob3VsZCBh
bHNvIA0KPj4+IGRpc2FibGUgY29sb3JvcCBvbiB0aGUgYmFja2dyb3VuZCBwbGFuZSBvZiB0
aGUgY3Vyc29yIHBsYW5lPyBTbyB0aGF0IA0KPj4+IGNvbXBvc2l0b3JzIHdvdWxkIGRvIHN3
IGNvbG9yIGNvbnZlcnRpb24gb24gYm90aCBjdXJzb3IgcGxhbmUgYW5kIA0KPj4+IGJhY2tn
cm91bmQgcGxhbmUsIHdoaWNoIHNob3VsZCBrZWVwIGN1cnNvciBkaXNwbGF5IGNvcnJlY3Rs
eS4NCj4gDQo+IEN1cnNvciBwbGFuZSBoYXMgbm8gY29sb3IgcGlwZWxpbmUgYW5kIHRodXMg
aXQgaGFzIG5vIGNvbG9yb3AgZWl0aGVyLiBJdCANCj4gaW5oZXJpdHMgY29sb3IgcHJvY2Vz
c2luZyBmcm9tIGl0cyBwYXJlbnQgcGxhbmUuDQo+IA0KPiBZb3UgY2FuIGNyZWF0ZSBhIGNv
bG9yIHBpcGVsaW5lIGZvciBjdXJzb3IgcGxhbmUgZm9yIHlvdXIgaGFyZHdhcmUuIElmIA0K
PiBub25lIG9mIGV4aXN0aW5nIGNvbG9yb3AgbWF0Y2hlcyB5b3VyIG5lZWQsIG5ldyBjb2xv
cm9wIGNhbiBiZSBkZWZpbmVkLg0KPiANCj4gDQo+Pj4NCj4+PiDlnKggMjAyNS80LzEgMDoz
NCwgQWxleCBIdW5nIOWGmemBkzoNCj4+Pj4NCj4+Pj4NCj4+Pj4gT24gMy8zMS8yNSAxMDoz
MSwgU2hlbmd5dSBRdSB3cm90ZToNCj4+Pj4+IFNvcnJ5IGZvciB2YWd1ZSBleHByZXNzaW9u
LiBJIG1lYW4gdGhhdCBJIHRoaW5rIHdlIHNob3VsZG4ndCANCj4+Pj4+IHJlZ2lzdGVyIERS
TV9QTEFORV9UWVBFX0NVUlNPUiBpbiB0aGUgZHJpdmVyLCBhcyB3ZSBkb24ndCBoYXZlIA0K
Pj4+Pj4gYWN0dWFsIGhhcmR3YXJlIHN1cHBvcnQuDQo+Pj4+DQo+Pj4+IFRoaXMgaXMgbm90
IHRydWUuIEFNRCBoYXMgaGFyZHdhcmUgY3Vyc29yIHN1cHBvcnQuDQo+Pj4+DQo+Pj4+Pg0K
Pj4+Pj4g5ZyoIDIwMjUvNC8xIDA6MjYsIEFsZXggSHVuZyDlhpnpgZM6DQo+Pj4+Pj4NCj4+
Pj4+Pg0KPj4+Pj4+IE9uIDMvMzEvMjUgMTA6MTIsIFNoZW5neXUgUXUgd3JvdGU6DQo+Pj4+
Pj4+IFNvIGN1cnJlbnRseSB3ZSBoYXZlIHRvIGhvcGUgdGhlIGNvbXBvc2l0b3Igd29uJ3Qg
dXNlIA0KPj4+Pj4+PiBEUk1fUExBTkVfVFlQRV9DVVJTT1IgcGxhbmVzIGF0IGFsbC4uLi4g
V2h5IGRvIHdlIHN0aWxsIHJlZ2lzdGVyIA0KPj4+Pj4+PiBEUk1fUExBTkVfVFlQRV9DVVJT
T1IgaW4gdGhlIGRyaXZlcj8NCj4+Pj4+Pg0KPj4+Pj4+IEkgYW0gbm90IHN1cmUgd2hhdCB5
b3VyIHF1ZXN0aW9uIGlzLiBBIGNvbXBvc2l0b3IgY2FuIGNob29zZSBvciANCj4+Pj4+PiBz
a2lwIGFueSBoYXJkd2FyZSBmZWF0dXJlcywgYnV0IHRoaXMgZGlzY3Vzc2lvbiBpcyBvdXQg
b2YgdGhlIHNjb3BlLg0KPj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IOWcqCAyMDI1LzQvMSAw
OjA2LCBBbGV4IEh1bmcg5YaZ6YGTOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBP
biAzLzMxLzI1IDA5OjQzLCBTaGVuZ3l1IFF1IHdyb3RlOg0KPj4+Pj4+Pj4+IEhpLA0KPj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4gVGhhbmtzIGZvciByZXBseS4gU28gY3VycmVudGx5IHdlIGhh
dmUgdG8gYXBwbHkgY29sb3IgDQo+Pj4+Pj4+Pj4gY29udmVyc2lvbiBvbiB0aGUgYmFja2dy
b3VuZCBwbGFuZSBvZiB0aGUgY3Vyc29yIHRvIGRvIHNvbWUgDQo+Pj4+Pj4+Pj4gY29sb3Ig
c3BhY2UgY29udmVyc2lvbi4gV2hhdCB3b3VsZCBoYXBwZW4gaWYgY3Vyc29yIGFuZCANCj4+
Pj4+Pj4+PiBiYWNrZ3JvdW5kIHBsYW5lIG5lZWRzIGRpZmZlcmVudCBjb252ZXJzaW9uIGNv
bmZpZz8gT3Igd2UganVzdCANCj4+Pj4+Pj4+PiBnaXZlIHRoZSBjdXJzb3IgYSBkZWRpY2F0
ZWQgcGxhbmU/DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVGhpcyBzY2VuYXJpbyBpcyBub3Qgc3Vw
cG9ydGVkIG9uIEFNRCBoYXJkd2FyZSwgYnV0IHNvZnR3YXJlIA0KPj4+Pj4+Pj4gY3Vyc29y
cyBvbiBvdGhlciBwbGFuZSB0eXBlcyB3b24ndCBiZSBhZmZlY3RlZC4NCj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBCZXN0IHJlZ2FyZHMsDQo+Pj4+Pj4+Pj4gU2hlbmd5dQ0K
Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4g5ZyoIDIwMjUvMy8zMSAyMjoyOCwgQWxleCBIdW5nIOWG
memBkzoNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gT24gMy8zMC8yNSAw
Njo1OSwgU2hlbmd5dSBRdSB3cm90ZToNCj4+Pj4+Pj4+Pj4+IEhpLA0KPj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4+IERvIHdlIHJlYWxseSBuZWVkIHRvIGRpc2FibGUgY3Vyc29yIHBsYW5l
IGNvbG9yIHBpcGVsaW5lIA0KPj4+Pj4+Pj4+Pj4gc3VwcG9ydD8gSSBkb24ndCB0aGluayB3
ZSBuZWVkIHRvIGRpc2FibGUgdGhhdCBpZiBpdCBpcyANCj4+Pj4+Pj4+Pj4+IHN1cHBvcnRl
ZCwgc2luY2UgdGhlcmUgbWlnaHQgYmUgc29tZSB1c2VyLWRlZmluZWQgY29sb3JlZCANCj4+
Pj4+Pj4+Pj4+IGN1cnNvciBpY29uLg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBUaGlzIHBh
dGNoIGFwcGxpZXMgdG8gQU1EIGhhcmR3YXJlIG9ubHk6IGh0dHBzOi8vIA0KPj4+Pj4+Pj4+
PiBlbGl4aXIuYm9vdGxpbi5jb20vIGxpbnV4L3Y2LjEzL3NvdXJjZS9Eb2N1bWVudGF0aW9u
L2dwdS8gDQo+Pj4+Pj4+Pj4+IGFtZGdwdS8gZGlzcGxheS9tcG8tIG92ZXJ2aWV3LnJzdCNM
MTAxDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4gQmVzdCByZWdhcmRz
LA0KPj4+Pj4+Pj4+Pj4gU2hlbmd5dQ0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IEZvciBz
b21lIHVua25vd24gcmVhc29uLCBzZWVtcyBteSBtYWlsIGlzIG5vdCBzaG93biBpbiB0aGUg
DQo+Pj4+Pj4+Pj4+PiBtYWlsIGxpc3QgYXJjaGl2ZSwgc28gSSByZXNlbnQgaXQuDQo+Pj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4g5ZyoIDIwMjUvMy8yNyA3OjQ3LCBBbGV4IEh1bmcg5YaZ
6YGTOg0KPj4+Pj4+Pj4+Pj4+IGN1cnNvciBwbGFuZSBkb2VzIG5vdCBuZWVkIHRvIGhhdmUg
Y29sb3IgcGlwZWxpbmUuDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPg0KPj4+Pj4+Pj4+Pj4+IC0tLQ0K
Pj4+Pj4+Pj4+Pj4+IHY3Og0KPj4+Pj4+Pj4+Pj4+IMKgIC0gQWRkIGEgY29tbWl0IG1lc3Nh
Z2VzDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wbGFuZS5jIHwgDQo+Pj4+Pj4+Pj4+Pj4g
MyArKysNCj4+Pj4+Pj4+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
DQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS8gDQo+Pj4+Pj4+Pj4+Pj4gYW1kZ3B1X2RtX3Bs
YW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtLyANCj4+Pj4+
Pj4+Pj4+PiBhbWRncHVfZG1fcGxhbmUuYw0KPj4+Pj4+Pj4+Pj4+IGluZGV4IDk2MzJiOGI3
M2U3ZS4uYjViOWIwYjVkYTYzIDEwMDY0NA0KPj4+Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BsYW5lLmMNCj4+Pj4+
Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9wbGFuZS5jDQo+Pj4+Pj4+Pj4+Pj4gQEAgLTE3OTIsNiArMTc5Miw5IEBAIGRt
X3BsYW5lX2luaXRfY29sb3JvcHMoc3RydWN0IA0KPj4+Pj4+Pj4+Pj4+IGRybV9wbGFuZSAq
cGxhbmUpDQo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9s
aXN0IHBpcGVsaW5lc1tNQVhfQ09MT1JfUElQRUxJTkVTXTsNCj4+Pj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgIGludCBsZW4gPSAwOw0KPj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKHBsYW5lLT50
eXBlID09IERSTV9QTEFORV9UWVBFX0NVUlNPUikNCj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7DQo+Pj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqAgLyogQ3JlYXRlIENPTE9SX1BJUEVMSU5FIHByb3BlcnR5IGFuZCBhdHRhY2ggKi8NCj4+
Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgIGRybV9wbGFuZV9jcmVhdGVfY29sb3JfcGlwZWxpbmVf
cHJvcGVydHkocGxhbmUsIA0KPj4+Pj4+Pj4+Pj4+IHBpcGVsaW5lcywgbGVuKTsNCj4+Pj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+
Pj4NCj4+Pj4+DQo+Pj4+DQo+Pj4NCj4+DQo+IA0KDQo=
--------------1i3KsCahNMaPJmf20TUGfJzq
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------1i3KsCahNMaPJmf20TUGfJzq--

--------------tWa5fZRVZLT9Fz0EzY9TKD7b--

--------------n2LwRiUuLrgrQ85e5THMTb0W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfrO6gFAwAAAAAACgkQX75KBAfJsRl5
IA/+PUKi2Cn74pXYCAoOstmkQYrqgHK11Z4/uUUQlVaymiTJbpOvcWlU84STSI0KGSEoX3KmMMAF
kQndENyHfzZw+vApkFe60Zr1LhKesTHtd5HbDq4ZgKbIyLMG0Jwg0syTE4puTxCkZzS1xRC4DR8r
pzY132Bu/IIeiyIFNx4mb8cOKUARCGPz+ZmL56j4s8jJm7TIZ7gKmQ0SCUdhS6CoGFKfQTrkdxyV
uqqVv5K1LOfyUoGE7EfVD02hYjDs2xlkZP2kzRy7XVUJBBdFTD+mEwI/STGArbhZjbaVspq1t4fg
up5HmKglDH/p/cAhg9OS/RwWo2oEng/Uy/sEXteOb8mAryIJPQVgsvIqZ7Q8HIYGW/vxBG/mLqO4
/sotkgK30zgflr2KHP0lJwNAl+qoVNOzYmpiYW/8sGWEt+y+O1HkdxHsSTeCguQAnqxKs8/z89/M
xq1iaVD1abOUh8Zs3XbHd/2ldR8Qr8MgW9xrEl3R43SZFz3FQ3chiS6ZMpC5mcxP4e+SdxJseWYh
8mVbbwVHe1egaar9eY3OWkXAFLOTHBqy3W56AckTiSlHxbDhKBUhXMusI0jxnK5NzxsEvywh2PX6
CfPiZQaOBl/CoMEFEC6LWVlHqiepqoi2f15FZU+1WYQeznnBSvt3yX1qed3Cru7lQswnF7gOmxaz
8x4=
=Fwls
-----END PGP SIGNATURE-----

--------------n2LwRiUuLrgrQ85e5THMTb0W--
