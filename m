Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE28A76BAF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775210E14B;
	Mon, 31 Mar 2025 16:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="KbDzCzjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazolkn19010011.outbound.protection.outlook.com [52.103.66.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383A210E14B;
 Mon, 31 Mar 2025 16:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8fkRwRoJcdIGxfGCtR9Eg5LQ2XvJodzsR0R4YveuJA63rnlUOICGLoNJOUUHyfNRrqZzCYj6hAr5JI1CM4fRdrqOs1eGrEKgbhOSkr1OpVqjlKxspNApJWwIFb5xRH3Q/e5S9/J8NMbOczDfy4CUwRDoc1LAJPllcSukQ0HNimCM8zPP6CC/md5HGsp9JcHKgCA14jG/A1g0X+E5F1flSeGNxWcdtC5e450/403nvTPIxsyQLa5I4ApuEC26ajb1WpPQap/ycY6NEv6LVdtly2tG7gohiYpbN/1QGma8ELYoQktq32bFO23DlukE6xXOvAIRDwY3i/t3pSzvw0jSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmwW5Y901PPjOIRUHvQPvKFUAic3PKVWfAYQE80GZtw=;
 b=zISIbGWZidSJJYJ3pZtKrnrKWaUEJwqh+iokb1RPsFlC67vljoQMlDu5gvVOvXmUd/pDX272Os8gnVmBi1s5g4X+e8nxBnesPWP+igq9OpfpTq8LsuzabGF6f9sqqHchhdUb+C+hTCIYxkPCmr6HSiKqERUWkCagAxfwHouU+fvEY4GpFJK4cJZRfwW8NAWIddm7oisbhnsvizIDMqyoYvieAAqgX+wpZpcprdnF1J2PdI836Dk4Uk+YjmM5lMeJRqofrhltjOpnRwMZIhPQEptSq0xGC8QiCEVtDdPpybcjSUOpCGq3jnt4jFndsd7dgJ43jXd7W6Q87ZmrXelDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmwW5Y901PPjOIRUHvQPvKFUAic3PKVWfAYQE80GZtw=;
 b=KbDzCzjzl0/gKDOV/beTPJrnZLpTnP7dyu1DMAyRMrcS98IxEoUKpJWSuFouAkwEnblqElhxj4ZEM4g2G3YINRe2ZLaKLiF1FoFcqj8/ZbREUr6uiZ1H83wQCtzxWLD/0QVdCs6ucMMiMNHGnH+FVkdVtQPvXtJtj9y38Vj4rhznwuIM6fUXWJlzE8H1kS7CtYnqDFHQ4YQDXnFD2kmB7kvh7AWauth6uiRJ7kSXVEzkRRZFjFnGeOfiSkrgNHNFE0CWTPlLUk6XuukRPCGNWPL9xeRoWuIzLfU4tNJdR8XoGiKn71HGjDgwvZrkhiC6ImgeKcfxvgLnPzqqokqqcw==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by TYRPR01MB13293.jpnprd01.prod.outlook.com (2603:1096:405:114::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.33; Mon, 31 Mar
 2025 16:12:56 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 16:12:56 +0000
Message-ID: <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Tue, 1 Apr 2025 00:12:45 +0800
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
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rt8fulEx9xMFIzpN0FYdFm3Y"
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <3e77cf20-64cd-443b-be4b-17628b91e8d7@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|TYRPR01MB13293:EE_
X-MS-Office365-Filtering-Correlation-Id: 19df6eb5-540c-419b-191d-08dd706ee5fe
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|12121999004|461199028|7092599003|15080799006|6092099012|8060799006|5072599009|19110799003|20055399003|3412199025|440099028|26115399003|41001999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXhSRXJscCtWblFMRDlXYm5xMFNJQjJUajRUTUllSHFvYml5MTRhOUUvbkU4?=
 =?utf-8?B?cGhYYnFTMi9UK0o3K0d2WGdzU1MrcHNBTVBTNTlXUEpkbFdXZFIrYVVIMFRH?=
 =?utf-8?B?NEpYNXFzcVdyalZrZWFuWGs1aUZrSWJ4c1NNcnBpRytya0JhS3VHS25JUEdo?=
 =?utf-8?B?Vm9wMHZyYlh5eVRSUGd4dE5qZTZQZEJtVnBzMWprdUs4SVpYdTBiS3ZnNEtz?=
 =?utf-8?B?NWRLZUNJd3NvV0xUNWlPSTNVc1NEeUJ6a1hneHQ2N3hsRUNlbWllMFBEVjAv?=
 =?utf-8?B?MUZWZEJJYWdnTWFhZnZ2MkM4QXJNSFBVangxQktMQW1zQlVmVXNtU3l0VVBo?=
 =?utf-8?B?L3dOMkcxUXQ3cGlpZHBjS0wxcGJwTDF5Y05hanBka0ZoSGF1Smg4Z1NpNXZh?=
 =?utf-8?B?V2NqOEQ4eGRESUlXL3pUZ1BCZGFwaWNaVlVZZGsvKytkaldqdzZhbEdZZE42?=
 =?utf-8?B?cVBIVy9BQzVqelVPUTFYQkZJeDRGOElZWWtSQU10R0NKQ3lWalBVU2IrSDY2?=
 =?utf-8?B?TUtEQi9sVHFjVFcrNTIrNkQ2dnIzK09odzM4aVJid0lDK216cnRUS3UrSGtm?=
 =?utf-8?B?cVFqUnZwRW0xRVlXQTljSlJ1VE9jZmxCUFp1U3hXbVF2NjVOaWNqbFpubGtv?=
 =?utf-8?B?ZUdmbyt3YVF5QmlFMW0yWXkvZG9xSWErZUUwS3RtZDRZSllkRlFtb3Nxa2s4?=
 =?utf-8?B?Rnd0aDdUMUE5Ym9YUTJmb3htZXFPSjBkMCtXUGNrVjVEVXNDcVFwUE5ZaDZW?=
 =?utf-8?B?ZjVxSEsyVUd1TkhJNS9DR0d1ODZ3R1pxaXBuTkFJdDl0OTdGMVJoK2xySmJ1?=
 =?utf-8?B?cmFnbFg0N2lOUkczci9TbTF4V2FTZVZob25iaTFrckJYREZYQlVkSmdHQ2hL?=
 =?utf-8?B?NlhoVXkxMjBJcE5vYVNCL3l2dVhFQStlem9lWXlqSXIvMVV0YVlOcTNGdE1s?=
 =?utf-8?B?aGIyQmVsTmNWbk5FNlpQNHhYSXk3Y2hnNk9lNnRiL1NHeEVIUmlQT1dnRm53?=
 =?utf-8?B?ZEJsNUFFTGNxN3U1Y2hycndEUlBQN3o5WHNFUjJIaWZVSWRyVEN1Szh6Ui9B?=
 =?utf-8?B?d2ZrTVFMWUxZZWRSOVBGdjd3NTFmR1BCcHJxZXlCY2R1OElrU0RLWVh6blFF?=
 =?utf-8?B?c1NuTG9lTjZxbG9KQ0ZtdHJMeVJBWkdpV01pdVZtS3UwYVBNTUFGZDdJUGc3?=
 =?utf-8?B?NEZ1RFYzbHd1cVdoNFFBMzJqLzBtVks5ODhyMzFBWHd5OVVVUjI4T1pPZWRF?=
 =?utf-8?B?M1NCdFB6b3UwZkYwYkd4RnMrc2dhNitvb3dOaHVkc21rdDBBQkFGS1FQZ1VL?=
 =?utf-8?B?a1hOeEJiYUh1WnFQTXVFOWwrNVVUZzdRME9BdzN0ZXpIa0V5NzhhWndDZzNz?=
 =?utf-8?B?VXBTeENyUDJoZWJXQ2xHaEZNUjkyTm92dTQzZ2JhdVEwRzI3VUQ2VklTOGJQ?=
 =?utf-8?B?SVVSaURRMlpHdkpBOE5zS1pkaUhFWHBoVmJZd3Z6ckZ1QmkrNE04Y21ObFRW?=
 =?utf-8?B?cVBaR095V1h0bVc3MEQrSUtuTkI0Mk5MbC9CcGxjck9nd1A0cDl0VVpCR3o3?=
 =?utf-8?B?Mk9xNHZCZlBEdkJIU1l6Q2xCaXoxcXV3cWJxS0V4ZlE4WDlDYVpRUGhwekJ0?=
 =?utf-8?B?TFRyRnU2RGJib1Bud1FRbytvU25vMTlhQ0JBSktkRVE2R2ZTRHhBU0Z3M0dn?=
 =?utf-8?B?enRYblR0cUMvZW5iTnBpSm5QVFVPWDlRS2ZNOTM5bEh3N2VFa2dkVlFWYUpG?=
 =?utf-8?Q?JwOiyjLonrbQUGsp35Sl4tKll722LY/185n4FZ/?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkh3N2thYnU3UTNHZW9OZURtTXV2blRGZDRwK1R1ZnZaYklyS1MxeVN6cGJK?=
 =?utf-8?B?U1NvWThnOHdndnZCWHpxQ21NS0FQbE5CMStpbFhRa0djcUhnbzl3Sm52Ny9t?=
 =?utf-8?B?aEJGVkRpby9tWG1nbnRkU0hLcGV4VE52VFdxMGVpcnRkN3I0ZDA3V3dLVmNx?=
 =?utf-8?B?bGZNRFB2eXJzRHpZdG4xanV1d3VYUnZ4UmxxSG5xdTBLS1hyZ24zTG1YelQx?=
 =?utf-8?B?cktHc0QrZlhFVGZNamNNOWl1V2NncFVwZXIxVXdBL1dkRkZCWTIxSXl0TkFz?=
 =?utf-8?B?cC9kemlkTFo5eG52dE9QdGJhcnh1MDdUK29PZHNpRTRFOXc2UW1xdUxWbjZO?=
 =?utf-8?B?ZS9mS0xkZS9pUTZvT0t6bE5KbUF4MHE1eTAySHlGTU95K2k2a1NrM3hudm1p?=
 =?utf-8?B?c0dUV09BVmFuZWF6NEtsbFh2YjM0Z3djUlZqYldCQk5BR1htaDVualBKZTJJ?=
 =?utf-8?B?QW94MHpoNUU3WTdGTXdzT2tFT3hKVWlIMStGSFBjT2tpR2JKSFVFR2VBYzZH?=
 =?utf-8?B?eC84VzRjQnR1NG5oMVBpczZJSzFOL1dCUExrMElRTzZ6RWIxSW0rUjZvNXB0?=
 =?utf-8?B?bG5tN1AyQjlJd29FZWdqV3JKUTFwV0pvaGRhUjdDZU5PZG1UR3BicW5Ta2tz?=
 =?utf-8?B?MDd1L3BSRVNiZ2NCcUc4M2R5dHVpRjd6ODhENmRrWGJuM3BXQmoxRkhFeitp?=
 =?utf-8?B?S3puZzJTY3FsVDU0cW80dWJNMFZGN2RSOUM1S01HOEtVREcvUnRPd0sydjd6?=
 =?utf-8?B?bllIMHpyNHBsajZaeklQU3NLRXRmRjhoaWlWSFhQZjBKSk5ZMEdSVGZOcWZM?=
 =?utf-8?B?cGxrSThRYTd3T0M5d0pId1lxcXdkQVd0Ym5WM2hlMktIOHpEaTFwRkV2Wnhk?=
 =?utf-8?B?L3I5U1dFWTB5WVJUUVpXTHpLSzNFSWE3UXR6K3VVT2QyQnMwZ1ZPU095TTJN?=
 =?utf-8?B?bStENVlTKzdxRlNZaG5BczVKVUFPbnhnc2VVN0hrQ0ZLc1Nub0RFaThIcWdT?=
 =?utf-8?B?clNyVElacDZZMUFJZzVUYVNmMkJxbWRxc1N3UVFDbzl5b3V3MFlvYkVIaFFV?=
 =?utf-8?B?VzlTb0NJOXFjUW1ZZk83MHljNXBLWGpMRFAwdG1sRTJ6bjU3SEdVOXVwUllQ?=
 =?utf-8?B?ajhueFlucnVQM3Jjdmp3S0xheWpDeE1zL0VTb20zck10NzUvN3lMUXBOU3pF?=
 =?utf-8?B?YkRiaVdzRndBbi9wNVViMGl5bWs4UnpvNFlyOXBwaVJGTmFkQUlqeWJDMWFj?=
 =?utf-8?B?Z09DeGRZWUxoQm0yZ1NVclNMMXVaVHdQQ2ZLMU02b3ltYWhFTVRMNldyelhK?=
 =?utf-8?B?dFZ1bUlzZy9WeHhjQUZsWWo5UG5WcktZRkN3dXZ3TSs4SVIzYzQrT2FJekM1?=
 =?utf-8?B?ejgvelhsL0t0TUE4MlZ6U2ZSQkxucHJ4NnVqTnVrUVVpa1ZJMkQrbUg3OTFP?=
 =?utf-8?B?b0pDTzJtZlZJSjZZZzRHRnJ0Z3k5Y0N4Y2xmNE1vUHdiUDM3R0JSRTJoSE90?=
 =?utf-8?B?ZTJWNWJicW1nTEdNVTQ2N2ZvU08zWm8yNWk4Z3BNZ3JhOHNKWDQwV1M1eldQ?=
 =?utf-8?B?aDNwdVZNVGNJQXF1cHM3cVgxRzV1bFl6M29TNURidUp6Z2xZcXdqQ3ZFL3Z0?=
 =?utf-8?B?aWR3bktaOG9zell2MUhTdDd6bEpBaVB1V0ZrZEhSVjZVQURGN0JDN1BVZVMx?=
 =?utf-8?B?MWVaTEhaay84UDVVOVJPQVJGdERBMkt6SjRReUZRL1JlaTB2REppcHNIcG5K?=
 =?utf-8?Q?SopVF91Swhozp6lva4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19df6eb5-540c-419b-191d-08dd706ee5fe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:12:56.7515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13293
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

--------------rt8fulEx9xMFIzpN0FYdFm3Y
Content-Type: multipart/mixed; boundary="------------TxWSvyBjSj3O3fbbwS9NH40y";
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
Message-ID: <3e77cf20-64cd-443b-be4b-17628b91e8d7@outlook.com>
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
In-Reply-To: <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>

--------------TxWSvyBjSj3O3fbbwS9NH40y
Content-Type: multipart/mixed; boundary="------------HPbuIymEA40fuDmIJy9q3OGh"

--------------HPbuIymEA40fuDmIJy9q3OGh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U28gY3VycmVudGx5IHdlIGhhdmUgdG8gaG9wZSB0aGUgY29tcG9zaXRvciB3b24ndCB1c2Ug
DQpEUk1fUExBTkVfVFlQRV9DVVJTT1IgcGxhbmVzIGF0IGFsbC4uLi4gV2h5IGRvIHdlIHN0
aWxsIHJlZ2lzdGVyIA0KRFJNX1BMQU5FX1RZUEVfQ1VSU09SIGluIHRoZSBkcml2ZXI/DQoN
CuWcqCAyMDI1LzQvMSAwOjA2LCBBbGV4IEh1bmcg5YaZ6YGTOg0KPiANCj4gDQo+IE9uIDMv
MzEvMjUgMDk6NDMsIFNoZW5neXUgUXUgd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBUaGFua3Mg
Zm9yIHJlcGx5LiBTbyBjdXJyZW50bHkgd2UgaGF2ZSB0byBhcHBseSBjb2xvciBjb252ZXJz
aW9uIG9uIA0KPj4gdGhlIGJhY2tncm91bmQgcGxhbmUgb2YgdGhlIGN1cnNvciB0byBkbyBz
b21lIGNvbG9yIHNwYWNlIGNvbnZlcnNpb24uIA0KPj4gV2hhdCB3b3VsZCBoYXBwZW4gaWYg
Y3Vyc29yIGFuZCBiYWNrZ3JvdW5kIHBsYW5lIG5lZWRzIGRpZmZlcmVudCANCj4+IGNvbnZl
cnNpb24gY29uZmlnPyBPciB3ZSBqdXN0IGdpdmUgdGhlIGN1cnNvciBhIGRlZGljYXRlZCBw
bGFuZT8NCj4gDQo+IFRoaXMgc2NlbmFyaW8gaXMgbm90IHN1cHBvcnRlZCBvbiBBTUQgaGFy
ZHdhcmUsIGJ1dCBzb2Z0d2FyZSBjdXJzb3JzIG9uIA0KPiBvdGhlciBwbGFuZSB0eXBlcyB3
b24ndCBiZSBhZmZlY3RlZC4NCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzLA0KPj4gU2hlbmd5
dQ0KPj4NCj4+IOWcqCAyMDI1LzMvMzEgMjI6MjgsIEFsZXggSHVuZyDlhpnpgZM6DQo+Pj4N
Cj4+Pg0KPj4+IE9uIDMvMzAvMjUgMDY6NTksIFNoZW5neXUgUXUgd3JvdGU6DQo+Pj4+IEhp
LA0KPj4+Pg0KPj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0byBkaXNhYmxlIGN1cnNvciBwbGFu
ZSBjb2xvciBwaXBlbGluZSBzdXBwb3J0PyBJIA0KPj4+PiBkb24ndCB0aGluayB3ZSBuZWVk
IHRvIGRpc2FibGUgdGhhdCBpZiBpdCBpcyBzdXBwb3J0ZWQsIHNpbmNlIHRoZXJlIA0KPj4+
PiBtaWdodCBiZSBzb21lIHVzZXItZGVmaW5lZCBjb2xvcmVkIGN1cnNvciBpY29uLg0KPj4+
DQo+Pj4gVGhpcyBwYXRjaCBhcHBsaWVzIHRvIEFNRCBoYXJkd2FyZSBvbmx5OiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS8gDQo+Pj4gbGludXgvdjYuMTMvc291cmNlL0RvY3VtZW50
YXRpb24vZ3B1L2FtZGdwdS9kaXNwbGF5L21wby0gDQo+Pj4gb3ZlcnZpZXcucnN0I0wxMDEN
Cj4+Pg0KPj4+Pg0KPj4+PiBCZXN0IHJlZ2FyZHMsDQo+Pj4+IFNoZW5neXUNCj4+Pj4NCj4+
Pj4gRm9yIHNvbWUgdW5rbm93biByZWFzb24sIHNlZW1zIG15IG1haWwgaXMgbm90IHNob3du
IGluIHRoZSBtYWlsIGxpc3QgDQo+Pj4+IGFyY2hpdmUsIHNvIEkgcmVzZW50IGl0Lg0KPj4+
Pg0KPj4+PiDlnKggMjAyNS8zLzI3IDc6NDcsIEFsZXggSHVuZyDlhpnpgZM6DQo+Pj4+PiBj
dXJzb3IgcGxhbmUgZG9lcyBub3QgbmVlZCB0byBoYXZlIGNvbG9yIHBpcGVsaW5lLg0KPj4+
Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggSHVuZyA8YWxleC5odW5nQGFtZC5jb20+
DQo+Pj4+PiAtLS0NCj4+Pj4+IHY3Og0KPj4+Pj4gwqAgLSBBZGQgYSBjb21taXQgbWVzc2Fn
ZXMNCj4+Pj4+DQo+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbV9wbGFuZS5jIHwgMyArKysNCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS8gDQo+Pj4+PiBhbWRncHVfZG1fcGxhbmUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vIA0KPj4+Pj4gYW1k
Z3B1X2RtX3BsYW5lLmMNCj4+Pj4+IGluZGV4IDk2MzJiOGI3M2U3ZS4uYjViOWIwYjVkYTYz
IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1fcGxhbmUuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYw0KPj4+Pj4gQEAgLTE3OTIs
NiArMTc5Miw5IEBAIGRtX3BsYW5lX2luaXRfY29sb3JvcHMoc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUpDQo+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgcGlw
ZWxpbmVzW01BWF9DT0xPUl9QSVBFTElORVNdOw0KPj4+Pj4gwqDCoMKgwqDCoCBpbnQgbGVu
ID0gMDsNCj4+Pj4+ICvCoMKgwqAgaWYgKHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBF
X0NVUlNPUikNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+Pj4+ICsNCj4+
Pj4+IMKgwqDCoMKgwqAgLyogQ3JlYXRlIENPTE9SX1BJUEVMSU5FIHByb3BlcnR5IGFuZCBh
dHRhY2ggKi8NCj4+Pj4+IMKgwqDCoMKgwqAgZHJtX3BsYW5lX2NyZWF0ZV9jb2xvcl9waXBl
bGluZV9wcm9wZXJ0eShwbGFuZSwgcGlwZWxpbmVzLCBsZW4pOw0KPj4+Pg0KPj4+DQo+Pg0K
PiANCg0K
--------------HPbuIymEA40fuDmIJy9q3OGh
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------HPbuIymEA40fuDmIJy9q3OGh--

--------------TxWSvyBjSj3O3fbbwS9NH40y--

--------------rt8fulEx9xMFIzpN0FYdFm3Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfqvv0FAwAAAAAACgkQX75KBAfJsRl7
WBAArR+A7/pmVPuBG9U7w+I7jvxM0NCBWhzZuj4KwFk5wleJnvYJe6VnZD4R1l0ytySNpNnrg6Q/
Y4nojx4putmj9EPveloltYm8GQDDdrO+xxRGDTowLp/Gl4la58wG6u4k2pwBqRllDGJ8Kr2UysQo
pjErvzrAfOEYgkM5UFSEKNqTK5+Vca31tl4ARhgv5T7a8HyYDFZe53E8fRhAIbyB04SBH5jkqN6N
oMsWidaMqZMjRDt3FBr1f36JCRnsUCInoBLuSQ731HCfy1UF1KKpiDQiBJbHIPgHOW6eRG7Vjl6a
joI2DYKEFd6l6uLLb5W5T2u+SAbiyPnNvgb5Nu+HQe7T+lKtz1KS9Y0XrM5YfUE+/qm7W6d55j/A
AZhqlLRj/uIgkJJfyQRYY4SMUfyc+8nQuSJ8KSPKwmDkPXgEq7dJpoO30qmofnA+0I+ZMV/ph6MG
YeuuNzpT8/dy4i95d1CteqseJM85BGOqbvkfN5J7A5To4EgE+2zFNeQ/uSuX8h13C44KyZahNc76
WNYAM2DJ506/9w19MUP5eTq6t9LCcLXNnPEOmO7hiIblf8X2oJubJpfHjyMT/0cs4hwt82jJfMgC
sgOOaVUCNT670Q+/LJbU/BAYzbXZpENXq37BgYKAwTHgXeniqtS4t8Olswr+0b577cjRRAGKXHaM
Ioc=
=kU8m
-----END PGP SIGNATURE-----

--------------rt8fulEx9xMFIzpN0FYdFm3Y--
