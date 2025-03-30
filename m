Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C78A75937
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 11:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968F310E067;
	Sun, 30 Mar 2025 09:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="FpI3et2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011035.outbound.protection.outlook.com [52.103.66.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1520510E067;
 Sun, 30 Mar 2025 09:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMe9g4wUB49+XEfJ2V0N9TEfpXyOXnc5i+K7emEwCg+EKyoBv/yA2nEZ3a/9CZRcGCrDYbSjqrrX6Rm8N4lDGbE+7C9ChNBQGGXZepFR4mVrSOZTU13BUrHui/a1X00s8mohnZtzI7SMS2oPTjwUzVkeS1WvAoNt73X6DHWQ0+4StcB5v/p9pbYx7ZFgyFpcaK9HbSj3WMrub8OcwAqkNKbC023DX54oZP9V9itP0b2RUJ+hJlxjBDkAO10QyRCs7xK3COGGlbgp1M1CZt0PnjoQ86z8R+K1qepV8qhB4COwGosyg4lgikDWo21/kmFvla3CsVsuGqZOghR222fdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGi44OHb+fXBLYKGEyHyST1ElXTS0lNbhFPfJKFtljg=;
 b=EcfuIOOty/d5DOaRMfDmKjMiITDjnVjDKxkcLSWAOoqnNtfp7t3Y5ZFvO3AAP1SDpzFAyBfzkn/PyTX6I/SFSKAyRx1EOVTyQn2B4dhNu0+pkFctg9AmOPLXiMQVDHAKwxXuwleeywCOUY8vBzXJ39GHgjnzgWIab1TFGfFW7hBYEcLnF++8mpw2ZSTJfg+mde2g50vOydhjBgQjpItnL4OrkxdPN43JO9adL9H2v20Uccf9EWZTCcOOr2kDy7bP7epEo6n8L+Hx4iUXob6DjlY9Ugkq76QDegq28b9Ab2gVrPDdZfL5y6lMExYpGFY3ZcGWVz47QqI5ur7OMJA7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGi44OHb+fXBLYKGEyHyST1ElXTS0lNbhFPfJKFtljg=;
 b=FpI3et2q9qqUihVqpId+KOa2qzQ/iDFW+Xbu6A1X4aq9wq1h2Cw2lFsVJ6WpAqTAooUYpkJe2AeTVJtvllsYk4vn0q9bJEgIueDG5hRMf+9Ny8Cj53tVwgG99cNKUcDuY5gacMnHmxa09hObjZfSzZ2oEcIeaCnPLSjTmxyeckbwPs1LKpZmTcTPs1XDVd+CRog0Wx999PVSLKtZaa6FQ7xCsS8cAoPRQ40F7F4yMoNExBzfC7FprhWS3n8JrIFX4HESu+lCDlifC5bWoEyACg6JXY/kRe3mkAiN+/K4WtsyQNT7D21l+Efhmm57SxlocOfUD4YWHaFnUFjWA4T2Ig==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OSCPR01MB14550.jpnprd01.prod.outlook.com (2603:1096:604:3a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 09:48:17 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Sun, 30 Mar 2025
 09:48:17 +0000
Message-ID: <TYCPR01MB84378F5BFF112B8A48916E3298A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Sun, 30 Mar 2025 17:48:09 +0800
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
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20250326234748.2982010-25-alex.hung@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GSiQ1KYANLqfMTV2phK3EeDh"
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <2f87ffb6-2615-4887-adb5-51f906fc97bc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OSCPR01MB14550:EE_
X-MS-Office365-Filtering-Correlation-Id: 30455c19-479b-4099-03de-08dd6f6fff41
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799006|5072599009|19110799003|7092599003|15080799006|461199028|12121999004|6092099012|13095399003|3412199025|440099028|41001999003|26115399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGR4dllmOTM2RGFjWWJoWmtocnZjeVYxb0txeGdJV2h1V0FOOUVUSmVmTWYw?=
 =?utf-8?B?d2E4Z1RORGxkTVZ2Y3pubXV3b0NSc0syaEY5TmFhT2ltbTV4dUxKYjNqTVVr?=
 =?utf-8?B?ZVl1Mmh6bVVtUzM1SVZEeWw3OGFaQ21wSE9wZU55djBFWk9KMXJkL1JLMndu?=
 =?utf-8?B?a1lrbFlEY21NTVQ4bGk1L2hmVzFIbWxWSlhxaEhrSURWWVFEOHpPV3hGWDh0?=
 =?utf-8?B?ak5FVjhRbW1Md1hMYkV6cklaNHhpNUZmTHM3Q2hSQU5Mckp1T1JGcEFYdFVV?=
 =?utf-8?B?YkwrT3pIQzhMNGhkaWtJaXBaWlcwL0tQdzFCN2FieGpMcXErM1RMV2plU1I5?=
 =?utf-8?B?U29MT1JxcDBwcTlWNEZWRjdoMHFQYWpUemg0VGJuQUF6WDVvS1RuOTF5Z2hx?=
 =?utf-8?B?VzNlbzQ5OGJkWUdLZnhwZEw5ZjRWalhzejNEVlJjaENQU1drckc0TElJN056?=
 =?utf-8?B?OTI0VVp6c1QvQXliQThMd2czYXR1S2RDUDRXb2ZlVzJLQ3huZ2s0ZHhVZjEz?=
 =?utf-8?B?cXRWcGhDRVBiaEVTZFZqaHBxTG5mVHIzaGIzak5uczkzeVRSKzhkcnlYVkwv?=
 =?utf-8?B?U0x4WWNucUtoYVR3cTI3WWxUa1lxSGplTFZtd3Q4ZDFLc09pWm5PTmtQTlFW?=
 =?utf-8?B?Zm1FWkpmNTAwSkM3YUNDU1E1ZzB6L3A0YVpndEZma0luSzdyWXZtMGwrMFdt?=
 =?utf-8?B?NTZJY05HY2xOZmNZWDc2eHpXQ2Nqb0x6RWsvb2R4NDZiR3NOb2pVcEFyTEkw?=
 =?utf-8?B?OHVKV2ZpZkEwRHpLVTFhc280am1Ccm1RSnZjc1d6RE9uaFZKRXZ6VnMvSVZm?=
 =?utf-8?B?ZnBzUS9rM1B3dVlQTy8reHEvNncwbHYzMjVISG9mMW1hSElnT1FWWWhsL0N5?=
 =?utf-8?B?NzN1RlhBeDg5c3hublNETEdXeE1GL21sMnJUZ0tPUFhpeHZFck0xWDJ1VmxH?=
 =?utf-8?B?Y2VnWnFsTTgxbVY3ZkJQZE1ydTdsTWVqcjdJNHl1dlNEckcrMG51V2FacFpK?=
 =?utf-8?B?SmJsdWlqdjBsWVJ2NFBHbC9WV1NvZUc3NjV1Y3NSbWx6TnpBb09NNG9UNlo0?=
 =?utf-8?B?Vk9tVDhSNTRidFNSblRYcUt1NG5RZzFtTWQrN2tva1I4ay82ZytZcnp5QnZz?=
 =?utf-8?B?NTFnV2gzN0VQejJwQmRIc3oycThLd0R3U0s3VVRtTjB3dUg3Um9SV1kzaXR4?=
 =?utf-8?B?WEVES25tcVNTNnhLTVJDVUhLVlFGR054R2V1MUJQcjV0NFVnNVZjRXMzM1Qr?=
 =?utf-8?B?cXRieHJHQTNmWGVYRHVsdEg5MU55aVZuMUJKVDAwVmxzMjFxNVI1NGtsMUZK?=
 =?utf-8?B?ZEs1elU4ZFl1RGFQVUc3d3hRelNXd1hGK1RTdlBOR0ZYMDVvdmhBZmtlMy9O?=
 =?utf-8?B?bTA4T1k2YkNWUDFtUXQ5RFpOVW14eHJMaytRYjdWM2VjaU1rMytKUGJPOFJx?=
 =?utf-8?B?ejJUWE9FY0prR3hvZm1xSGlWYWZqaTVSS1k4aEdpY2ZaNTFodWEyOWFYelRN?=
 =?utf-8?B?M3ZaZHdrWXFnNWp2WDRqeVR4ZFpXVkt3cVF6K0Q5VkE4NExRd25xaWY1RDQ3?=
 =?utf-8?B?Z1ViZWkzNmZWV2tpRUNmWG9KZEFIWVkyZjFRSkVaVUlHbENoN2c4Sm9JSDh2?=
 =?utf-8?B?TDNmSnJZRnNQSHZONFB1K0xMRGc1R01VOUZuNzFyRC9rT2RxYm0zd0pHa3BD?=
 =?utf-8?B?VWZSVnV6S1phUmh6QWJnZm5Id0Y5M1NSN0FBMk5ER09sSG1sWW16ZjdWU0Jz?=
 =?utf-8?Q?Xoy48lWpzY2txtaSek=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFFLYWdUOFFMcmR3MVFyZTExanNIcWM1RXFxNWVrRjFGeUhRY01ldkRvWG1u?=
 =?utf-8?B?QUNWcFd5R3g1VTBNWHhLM1VrOWxMbURjOW1kUjZ5bHE4NXkrSk1LT1FMUFdO?=
 =?utf-8?B?c1F4ck9Lemh4VU84UkZQdWVoZytqZVhzSy83UnlOeG15WGQzTDc3engrem42?=
 =?utf-8?B?T0RTMFdseWdNNGRmdTRPUXpyNVBsckJXbmE0RUlsQWdZNndETGx3Y1RPTVdm?=
 =?utf-8?B?bFM2N2MyTmU3bnZLL2tPTUFLNDRKcWczRXFlZ3F6azR6VFdQS0hYY0FRdDlp?=
 =?utf-8?B?WlVVL1VLNzlMU2Vybi9GVkF5ZThoRTVZZEFYQlhha0ZoSXdVVHk0UE9JQjRD?=
 =?utf-8?B?dENmZ3NmUmRCL3p5MEF3NFhienBJZmo0QjVOYWFvUjhVVEttM09IZnF5ZEND?=
 =?utf-8?B?OWxaQSs5Q2pXcEZxeWFJczh2czZNcVg1Z1ZxQ2R2Y1RXUzhiRlVDNGdnbWlw?=
 =?utf-8?B?REVCTVRpTmwzL2sxcTlsdkJ2NzRVK1cycllVUlVQUU9WdHpVZENIa0dWRW54?=
 =?utf-8?B?OTVWZVFUL1dIbHEwdlU0QkE0WEVwM3EwVW8raEFoSFlvZWhuV2YwLzJnUlRx?=
 =?utf-8?B?QmsxeExpZXFEZlZzOFYxVXY0TG54UklXNVhFN2sxQy9HUFlCSWlhSDNxN1hO?=
 =?utf-8?B?S0luc1lFQXBIUWlJbUZzdSs0aGlkcjhYeEhpNm00M1l0Ky85YVBnUHZIbnMv?=
 =?utf-8?B?b0hmU0wrUC9KU1UrZVhadWxYWjJKUWNNUjdnY3ZSeW1ybFZhZjh0bGc0djI2?=
 =?utf-8?B?TS9KSlZQOFh0QXRvcVFleUpGVEQvK3NVUzBETFBlNnEza3FwZ2k2bk0yMXlV?=
 =?utf-8?B?eTRaNXJtakVPRXZIbFF0emNFN1lzV0Q3V0I2VTBQOE5LRlV0RVBMOHRGSzkv?=
 =?utf-8?B?TElsNEdxWXFYdm05Y20vbUIxczJuZ3lzWjVKMVRBOTR2ZndRaVdLSW1IeldJ?=
 =?utf-8?B?cXJBOW5HVEpPck85UUdIOHc2RE1OYXptVGNiSW5kQXllQ2lIb1VKWGMvMUZZ?=
 =?utf-8?B?dVh0N09jSTBFajNDRjM1RlBGVkRRaGhYdS9wL2xiNElmMTJRRld2WW5DY3BT?=
 =?utf-8?B?ZFlMb0p5bGRvd21aeUdiOEJZNFo3aDdBeEtneXNvNy9BMFlFMmFhTjF1b2N3?=
 =?utf-8?B?eHUzc0xjaWlhd240TWQ1bWtQaEtSb3c1ZjlvUmJNdkNXbWlPQzB5WEtrbGRP?=
 =?utf-8?B?VHJFNDE1MzAwTXBHQkVRZEowVHhnWDl5aVlWRUhuZVR1WnExQ1ZoSW1qVU50?=
 =?utf-8?B?dGJuRjZsQVBDVHBvWFVHQkN1VzdLTlFuUVlrZVRFNWNMaUFLeVRITFlSKytT?=
 =?utf-8?B?YXNkeFVYQkN3Q1h5SFRYR0ttQUlTTlc1bk5VL1BpeTc5ZHhSRkVpOXpRR2wz?=
 =?utf-8?B?UVllZDRKNURCUC9RWnc0R1IxVVRxRHBnZEV1K2JUMy9BZkZPNEM2c1QvS1Bi?=
 =?utf-8?B?TTdNeUxFOTRFOHR2SENxeUg2NnhsNG50SUM3NkJPV1JjaFNqTnpCeTRPUFVY?=
 =?utf-8?B?R0M4SE1ITmhMNDV2M0FsOHNUQWxvS09nWVpzQ1Y5Ylo5LzR0ZXVzb01jUUt4?=
 =?utf-8?B?cWkzcytEdDJlNzE1MS80akNrbDdoZld3bitnVThrU1JhdjhOSTRWUFhMY003?=
 =?utf-8?B?VGRkcG5wdDBqREhEZmo0Vzh1YTYxZGh6dmx5akVEZUxhY1VtTUdDUWFidlo3?=
 =?utf-8?B?cjNaWmhBUEJOcUpBM0p1c1ZnY0FMTGdsdnpVQlVFb1B2SGM3TWZZTG9KRWp6?=
 =?utf-8?Q?aEqa+9F8AzS4AT0cHo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30455c19-479b-4099-03de-08dd6f6fff41
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:48:17.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14550
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

--------------GSiQ1KYANLqfMTV2phK3EeDh
Content-Type: multipart/mixed; boundary="------------JTKP9hDuW13anhoBlk2qdRQ8";
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
Message-ID: <2f87ffb6-2615-4887-adb5-51f906fc97bc@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
In-Reply-To: <20250326234748.2982010-25-alex.hung@amd.com>

--------------JTKP9hDuW13anhoBlk2qdRQ8
Content-Type: multipart/mixed; boundary="------------SQlm4SeV1mNGjX6wrJZgMGfh"

--------------SQlm4SeV1mNGjX6wrJZgMGfh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkRvIHdlIHJlYWxseSBuZWVkIHRvIGRpc2FibGUgY3Vyc29yIHBsYW5lIGNvbG9y
IHBpcGVsaW5lIHN1cHBvcnQ/IEkgDQpkb24ndCB0aGluayB3ZSBuZWVkIHRvIGRpc2FibGUg
dGhhdCBpZiBpdCBpcyBzdXBwb3J0ZWQsIHNpbmNlIHRoZXJlIA0KbWlnaHQgYmUgc29tZSB1
c2VyLWRlZmluZWQgY29sb3JlZCBjdXJzb3IgaWNvbi4NCg0KQmVzdCByZWdhcmRzLA0KU2hl
bmd5dQ0KDQrlnKggMjAyNS8zLzI3IDc6NDcsIEFsZXggSHVuZyDlhpnpgZM6DQo+IGN1cnNv
ciBwbGFuZSBkb2VzIG5vdCBuZWVkIHRvIGhhdmUgY29sb3IgcGlwZWxpbmUuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPg0KPiAtLS0NCj4g
djc6DQo+ICAgLSBBZGQgYSBjb21taXQgbWVzc2FnZXMNCj4gDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYyB8IDMgKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9w
bGFuZS5jDQo+IGluZGV4IDk2MzJiOGI3M2U3ZS4uYjViOWIwYjVkYTYzIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9w
bGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX3BsYW5lLmMNCj4gQEAgLTE3OTIsNiArMTc5Miw5IEBAIGRtX3BsYW5lX2lu
aXRfY29sb3JvcHMoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpDQo+ICAgCXN0cnVjdCBkcm1f
cHJvcF9lbnVtX2xpc3QgcGlwZWxpbmVzW01BWF9DT0xPUl9QSVBFTElORVNdOw0KPiAgIAlp
bnQgbGVuID0gMDsNCj4gICANCj4gKwlpZiAocGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5FX1RZ
UEVfQ1VSU09SKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiAgIAkvKiBDcmVhdGUgQ09MT1Jf
UElQRUxJTkUgcHJvcGVydHkgYW5kIGF0dGFjaCAqLw0KPiAgIAlkcm1fcGxhbmVfY3JlYXRl
X2NvbG9yX3BpcGVsaW5lX3Byb3BlcnR5KHBsYW5lLCBwaXBlbGluZXMsIGxlbik7DQo+ICAg
DQoNCg==
--------------SQlm4SeV1mNGjX6wrJZgMGfh
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------SQlm4SeV1mNGjX6wrJZgMGfh--

--------------JTKP9hDuW13anhoBlk2qdRQ8--

--------------GSiQ1KYANLqfMTV2phK3EeDh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfpE1kFAwAAAAAACgkQX75KBAfJsRlT
SxAAkjb2d/ZT2mg2XHpITAEcU/4IHim+VekI29V0NrJBWxgn6MzP7MpsRbQrNQPCIVduJI70SjhX
5lldZtSa1AON4rlG63tV190RliqEsPJaqdcjuLy+yDrmFO8NmWxkTqp3WPrUiMev3+VflRnvnuuK
VhNxZiPjqnI4dJqbHYZxEp0jPLSF83Lesy3NGgDaCY3cHYcirwgesTgt+BXo7plCtBfVTLXVz0um
cHF3KRmHio04jlQfJnEQy40HjDaB9UTqdhZ/ebzbFkj2YaGVOn+cl1iM86uY58d7kwyhhpEvDCOB
vxlBLgSgJUoei81vcSTAFTRi9L/vL/J4zHd6JfOtnXk3/+oKxumU5hfGawxM4VmhcFi1F1IWJSws
m/4lF1PgQFajMwdSdfKml2DIp7rqGXb6MaAYbRG2XIYzT1WItvrSBYjD2fcJy3l09pa87Z2Ulptg
TsMyse2apPjygKJWCY9mJc4V1anHfBEiaV+Ll9F64tnaxRE8AwhSEhb8neo9MvIauV9Dmu1GNrbC
bnfycL138spaAL+g4d3c/3cujCL1vFyIv+6myhOfgODMG5010TUkS/tEqY+H5GsS/etOCz4rs2eL
6saEuTPoo/3ehJaAi8CICSEfCKKCB9a/DzRgmVzHTHZ2N+EgF72Rrmk11nXtf2Tl1nIS75khhLKc
Z50=
=B8ul
-----END PGP SIGNATURE-----

--------------GSiQ1KYANLqfMTV2phK3EeDh--
