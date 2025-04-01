Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E53EA77B0B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 14:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E4789F08;
	Tue,  1 Apr 2025 12:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="sf7BrNgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010013.outbound.protection.outlook.com [52.103.43.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B5210E2DE;
 Tue,  1 Apr 2025 12:32:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDQJjQTqYdZRxFmEDlBTliGPgRhQbuNibbZJhj8h1DAkFwAQPofao1ud8d0yBpjICwSN0hubz5bHTLrpQYXT3IceeGoqUqogsoJZTEyyzuoxhQhHqQbBXL9ubfxdVq8fbCwLaEmomhM0hNzrkwN5A1fTT38TNk8IX2T/4vm8ul/vKM2PpX6kLAvRMrjzuI/YRXVAD1kRx7MlPpilr1dZodaEaCDFTuBSzLoWokQMv/akfXAYgfDjSZh+ZoFzVawkL7i82MZzQt/cuPnWME8xx+oFqVfT6cgu2xOGquEOlI+GXTmTdcgjM/SyVTA3jf4FT6vgzhaa3/JXwvGigcegwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxIO248E6np9JCC+Ye7huS3gWxWCrqYa31hMoSdEf88=;
 b=h4sQesfEmbB/INAqXmPeDEupncPtevH3NDHjQSNxw7ghyDwQGImQp3SNOJYOyhyUMgNRD+1trkB0cgwgqhU+wSDBLZw80ojY+B81lPV1svH00C8JamSETWssBIloD0xTCN8gi/ZJW2v80b498RhsbF5NEV3ILj2FAIRZKsE+u77PObEkCDSDvjVky8UAjVbF/7RVv5l0fQnVgmTu+p96KKxKMjJi9a+jv7QxJr5K0gNpbxsgc2GGKe4CPksiHDUSSCzB4InL7dXVl1Ls/+KjhCIk/TBbiFIIxnyNKq8JzheKEAAXXTX7D0PaC/XnoLro5TKcs6kExtUXxgAj+fYufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxIO248E6np9JCC+Ye7huS3gWxWCrqYa31hMoSdEf88=;
 b=sf7BrNgfSd64hzQ6IE+w+5qj9UZ6p3ConPUdHCbPHQyUkXLXw7+GaT3Jkmz6giZZ4+3WfdvvFk8a5/psSlISOMyvqMo363y6c+6NoJKYGNNFTXmQ1UUxAjznzrlZfbTCF+/JUMTJvupQKRBOLte8IekDT/sD1tXub6sgwdyc2IKcyMz/nUy6ujwuyKPgeb7fgAn2X3UB5dEjt55Y0nT3MxQIzpYX7R9wXvhEWaQ1PJVF3a1ytmA+mNH2ImL6ZUa1+9xaVRSAj44NtePDdifZDDUuxCFup4sPuiFZUgtQOB3jMwEA/uYhWjb+AcQKoQJx0hehQ0blNjGcwGY6GPiFgw==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS3PR01MB9754.jpnprd01.prod.outlook.com (2603:1096:604:1ec::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Tue, 1 Apr
 2025 12:32:30 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Tue, 1 Apr 2025
 12:32:30 +0000
Message-ID: <TYCPR01MB8437C142C860FA03F06B5E6998AC2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Tue, 1 Apr 2025 20:32:16 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
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
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9X5w3tCPiwFtje2KZb60EE1O"
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <534c4008-08bb-4ee9-8f18-3a42b9f31572@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OS3PR01MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: 597c9518-82f2-4709-af29-08dd711944f3
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|461199028|15080799006|6092099012|7092599003|12121999004|5072599009|19110799003|8060799006|56899033|13095399003|3412199025|440099028|12091999003|26115399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0YxVlFraEQyb0Z2eHJQR3ByMDZTSldDSElsM3E5YlN6TGkzNVNQVEJSWmJB?=
 =?utf-8?B?d1ZOOU4rNzdoems3TUkxTzdxWW9xdEJYTXVDbjhKeURPL2tsREE4ZjNmcjhO?=
 =?utf-8?B?cVJyRm1zVi9iTXpsWldXeHgvcENCVkNGT0pGWkJLLzlwckoycEw5UHY0bE5K?=
 =?utf-8?B?eHpCVldCaXhXaEdQeVFudGFQZkx0Mk5mK0hnbFZ6VjZYSkljVW82c0xlQUo0?=
 =?utf-8?B?L0t0R0pzM3ZWOHFUVzlLRlRhRTRJamhYbUt5ZVIxNkVEcEN0MFRZbFV5c0tX?=
 =?utf-8?B?cFQ5b1B1TmpwVEFKbTUwYXozcEMzU1hYZ3JCVVBMRVlMM3d2MXgvTEFJdGlN?=
 =?utf-8?B?cW56anFZWnNtdkw2VFV4QlBHcFpQVlhYa0tTRjlHMVkzcHlUczhuY2dIQVBu?=
 =?utf-8?B?V3lzNjk4SHEwWjM2ZVByTnlzcUtiNnMyOFVZa21EbUMvUUtmdXR2SERSVm8y?=
 =?utf-8?B?UWpnUExmQjMzY0g2eGN2VTBidlJtUWh6bUZETGo2L2xoMFNobENpNnY5ZnRt?=
 =?utf-8?B?WGFqMHV6cVBibkxvN2szZlBCVS9maUVHcUVHZFA4M1BkYzF2b1dXanJFWlVZ?=
 =?utf-8?B?MDBjNFhKb2kvblgwa1ZETk90VGRMRzVFZGVVRlN6RUwrUVVPaHlKMkRQOHZ0?=
 =?utf-8?B?bWFTQTA1K0F2K1JLUUxjY3FBY3k1emxJRG41MUFCbmZ1WHltVEZER3ZOdS9R?=
 =?utf-8?B?OHJpVGF1N05LZGRYNHFoNlpFQmE5VWxtVzc3dUpwa1R0cGl4OURPd1dTU28y?=
 =?utf-8?B?R2MrUUd4ZnhUN3VtYzJmcjBrV09CV21sWU9oOGhSUmVJRFhsVGkyQjFqTTR2?=
 =?utf-8?B?RzdqZmJQQ2JNVHRCcFBUSUdMZEk0L09YYzBlQW1jRncrRlNqMHFjSXg5eXJt?=
 =?utf-8?B?VHVBMkxtVnpQYmxpbGlwVHZObjdNV1dYZ0pIZHVoblZrV3NjVmNYTkhkc1FM?=
 =?utf-8?B?ZFRwc25sZ0hld1BNbHpjNnpPMmM1dmdBNGNGUWxHc0cxdHhVWjB2OGhsNjEz?=
 =?utf-8?B?RW9wT0hyQnAxdXFYc3p0YTVKYkRKUjhmSTBJUGd6Yy85T3M2YjVQdE51WGgw?=
 =?utf-8?B?L0NsV0pleXYvMUYzQTJPZm1LT2lSZXBCUXFXQjE2Yk9kdkhQSHQrRXh5emxi?=
 =?utf-8?B?bG85YTR4cmhLczZUQzd1VU5nNmlpd2doSDUraTZkNTQ4bVdneit6QkowUmZt?=
 =?utf-8?B?U05hbkJjdXVTWUV1ZG5lYWNtSGlmaVBmUFNoVXpVNXUrYUx3OTJ0dy9QcGxu?=
 =?utf-8?B?OFoxQlM0SlJJUWU4Vmgza2s4UlJCYlg5RDlxaVZvanNBRzZuNHl4WVdYNzdu?=
 =?utf-8?B?V3h3a0JZTmV4dmlxU25OTXBoVXRHbUlobW9KWGFpTG9RdlZROG5HVUwvdWJ2?=
 =?utf-8?B?Z21nYzQ3Y1BCcjgwaElZcXlvREVXLy9WcDNrc3RnbUxNNm9VSnpQOGEyZ2Uz?=
 =?utf-8?B?WndFeFp2emF5aVlHVmVkZ2FsTk9yT0E2Qmh1RjRQYjNoOVh5eGU4enAvYmNB?=
 =?utf-8?B?OURRQkkyU1hSSUZSRWxMQXd2R0pVNTlJcytUeFM3dzVIYy9WWFlmeGRZTzZQ?=
 =?utf-8?B?RzZmM1g1VUcxT2lNRHVxUGE3U3dXRk1tUzMyelZwR05XaFpnRXE3T3Q5NWc3?=
 =?utf-8?B?cmtPTUF0cVVadzhIVTF4Ukd6b3NLK2hYVDRtMXBUMkFrRWdSQXNvQ2V1MXk3?=
 =?utf-8?B?NkJ2NXNKeGtrNEVrS1d4V1YvSndQQTROVEJab1ZHdWltWFhDY0NDaFNRSWI1?=
 =?utf-8?Q?bKADh1jRKPjznwQQYM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnNwSlFTRjFTSVBndDNYZ3pwVFNOV0JFSjZlRU5aay9hY2luajRJSUJLTCto?=
 =?utf-8?B?UFBQMEZQdVBKVmRLcTdIUHIyMktIOXlPQUVpTmppaDI0dXF0OC9vQnVoMEh0?=
 =?utf-8?B?RGJXOW85ZkRrZ21vVUNXdUFrbFdBcWhCTk0wbGd2c0hFaVkyMEVTaUZnN0xj?=
 =?utf-8?B?emdkV2w3ZUR4SjY5eVFIL2M0eVJOL3pqd0ZzVlhDdzVtWHVJbWtydjJlb1U5?=
 =?utf-8?B?b0pVN2oyTTQ1VlkxeWdrT2h5ME5vaHNzbndXYjVCN3plT1o3YW9jNDNNK25R?=
 =?utf-8?B?RDlZQzlwRWQ5eE53dVI1alpxak8yZHdaZ1B5UFFtd3lmTVFRMnB5T3pmbVdF?=
 =?utf-8?B?YkNaSFo4MW5kcUY4YXhmWmhZNkNWSEpxbUtZNnExa0l2RnF3OEk0KytpMVBT?=
 =?utf-8?B?dFdWdmQvM1lOMjArUEdlS3JRQmlLY1FvU1Nxc2V6MGRhSzljUW9lZ1o0NW54?=
 =?utf-8?B?ckZDeDRoWjBJOWFOTW1DdkZwcUNlZGVTWlE0RjF6ZklDclFWWGVpckh2Skc2?=
 =?utf-8?B?TGNJRWRKN2dNbWpPbGZnTjNDOUs4YjdBaDhOV3BpYmNjRHl4QitBK0gwbGtM?=
 =?utf-8?B?TkxjWnUrUlhONkNoUlpuckVXRzdXbE80cCtETVoxZUo4aS94SDdQWnZ0RzJH?=
 =?utf-8?B?cW9MeWt1TFg0QXBnMW16REUxUXNCdHB4QjViVTZCVjFjcFBvUjZoSC9pWDdz?=
 =?utf-8?B?MXhBU0o1aWU4ZVhFYnFOdnZMc0NUNUFOb0JnZndNbHI0bEdSMjJwV3gvTHYr?=
 =?utf-8?B?Nm9CZXFQM0EyOEJoSzhrY0I5cWgrNkxDZnVBbjJLVWFqMVpidkxpaFBsT1RY?=
 =?utf-8?B?TFBjaXJOWmw2b1haRmtkQSsxT2M3aDJCR05ZTXpOU1hPcktKWlZtVm16M2FD?=
 =?utf-8?B?azZRcFhRazdxdWovZmVxY2FYZG9wWEFlb1YwYzFURTFDcTZjd3Jkbm9BeHlo?=
 =?utf-8?B?K2xIRlVkVWhRVzJRamg0MEN1UVYyN0srdlhMQ0JNUndFeXpCaHcrdDk0KzR4?=
 =?utf-8?B?ejgreGlidDI4M1krSVJPeGJhYVJDVDBWNGlUdEVuMlpvNkxnY3NGejZjMHNB?=
 =?utf-8?B?TFBoYWxqNWVFbVBobk9LSjVGWm5ZNklUZkgxZmQrWThYa1JtTEthTVRWRDRp?=
 =?utf-8?B?NnorVEN3OFdCYm04bzI1d1FEL2VTdnNxRFRXWkErUmxUOWdNS3VGdk9PZnFI?=
 =?utf-8?B?UnBsOEE5N0NCTDI1WWRuOEpLZDZZRytTNmRYVklJdjVEYlRzODlkMG9tcTB0?=
 =?utf-8?B?N0hrcE9qdE15akk5bk1OWTc4WXpJMWhjbCtTejVmMnFYK3g3bHRIeEFDcnNN?=
 =?utf-8?B?czVCLzJPMFJjNWJuUWZyOFZUVldreEVwNnF5NTZha0kzZERxUVVCNzhTY1FO?=
 =?utf-8?B?YWhvOWRpY1pudTcwWkRVYUpTelE1akRFRzE5dkQ3MHlIZk84TThTOHo2WjJO?=
 =?utf-8?B?eTBWaGFVbFVUSmtYaHUwdk9GNHBOTnZuUWtjaTB5RDRURFoyOXVKOTVrcEwv?=
 =?utf-8?B?UlR4YW5zWXlZbWRTdU1YMDc5TFY4TmUyaERRQmcvRmswZGhFQThlemRsemNp?=
 =?utf-8?B?V3VoNXlzZlVrejZYNGQvaVNjaUtmWHZSOVVzZUFVbS9wemtJZExoZ2hzS0lr?=
 =?utf-8?Q?TjCKXphJxaCAWrjXFqS2cmvt05d74T9xcbKQHpcz2k0A=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597c9518-82f2-4709-af29-08dd711944f3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 12:32:30.4537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9754
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

--------------9X5w3tCPiwFtje2KZb60EE1O
Content-Type: multipart/mixed; boundary="------------RwdbOXaDmVkS4phYZYvHnoIF";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wiagn233@outlook.com, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com
Message-ID: <534c4008-08bb-4ee9-8f18-3a42b9f31572@outlook.com>
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
 <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>
In-Reply-To: <63d2a14e-759f-44b6-99b4-de42b8d6b1e0@mailbox.org>

--------------RwdbOXaDmVkS4phYZYvHnoIF
Content-Type: multipart/mixed; boundary="------------6L17rXWWWU6r0CkBN0ZzSg8e"

--------------6L17rXWWWU6r0CkBN0ZzSg8e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QnR3IHdoYXQncyB5b3VyIG9waW5pb24gYWJvdXQgdGhpcywgWGF2ZXI/DQoNCuWcqCAyMDI1
LzQvMSAxNzo1NiwgTWljaGVsIETDpG56ZXIg5YaZ6YGTOg0KPiBPbiAyMDI1LTAzLTMxIDE5
OjQyLCBBbGV4IEh1bmcgd3JvdGU6DQo+PiBPbiAzLzMxLzI1IDExOjA0LCBTaGVuZ3l1IFF1
IHdyb3RlOg0KPj4+IE9yIHdlIGNhbiBhZGQgc29tZSBraW5kIG9mICJsaW5rZWQgd2l0aCIg
aW5mbyB0byBwbGFuZSdzIENPTE9SX1BJUEVMSU5FIHByb3BlcnR5LCB0byBsZXQgdXNlcnNw
YWNlIGtub3cgdGhhdCBjdXJzb3IgcGxhbmUgYW5kIGJhY2tncm91bmQgcGxhbmUgc2hhcmUg
dGhlIHNhbWUgY29sb3JvcCBjb25maWcuIFNvIHRoYXQgdXNlcnNwYWNlIGNvdWxkIGRvIGV4
dHJhIGNvbnZlcnNpb24gb24gY3Vyc29yIGltYWdlIGRhdGEgdG8gYXZvaWQgZGlzcGxheSB3
cm9uZyBjdXJzb3IgY29sb3IuDQo+Pg0KPj4gVGhhdCdzIG92ZXItY29tcGxpY2F0ZSBhbmQg
bWFrZXMgbGl0dGxlIHNlbnNlIGZvciBib3RoIGRldmljZSBkcml2ZXJzIGFuZCB1c2Vyc3Bh
Y2UgYXBwbGljYXRpb25zLg0KPj4NCj4+IElmIGFueSBwbGFuZXMgc2hhcmUgc2FtZSBjb2xv
cm9wIGNvbmZpZywgYSBkZXZpY2UgZHJpdmVyIGV4cG9zZXMgdGhlIHNhbWUgY29sb3IgcGlw
ZWxpbmUgd2l0aCB0aGUgc2FtZSBjb2xvcm9wcy4NCj4+DQo+PiBJZiBhIHBsYW5lIGRvZXMg
bm90IHN1cHBvcnQgY29sb3IgcGlwZWxpbmUgb3IgYSBkcml2ZXIgZG9lc24ndCB3YW50IHRv
IHN1cHBvcnQgaXQsIHRoZXJlIGlzIG5vIGNvbG9yIHBpcGVsaW5lIGFuZCBubyBjb2xvciBv
YmplY3RzLg0KPiANCj4gSSBzdXNwZWN0IHVzaW5nIHRoZSBjdXJzb3IgcGxhbmUgaXMgZ2Vu
ZXJhbGx5IGhpZ2hlciBwcmlvcml0eSBmb3IgV2F5bGFuZCBjb21wb3NpdG9ycyB0aGFuIHVz
aW5nIG92ZXJsYXkgcGxhbmVzLCBiZWNhdXNlIHRoZSBmb3JtZXIgaXMgY3JpdGljYWwgZm9y
IGEgcmVzcG9uc2l2ZSB1c2VyIGV4cGVyaWVuY2UuDQo+IA0KPiBUaGlzIHJlcXVpcmVzIHRo
YXQgdGhlIGFtZGdwdSBEQyBkcml2ZXIgYmFja3MgdGhlIGN1cnNvciBwbGFuZSB3aXRoIGEg
ZGVkaWNhdGVkIEhXIHBsYW5lIHRob3VnaCAoYXMgaXQncyBhbHJlYWR5IGRvaW5nIGluIHNv
bWUgY2FzZXMpLCB0byBlaXRoZXIgZnVsbHkgc3VwcG9ydCBjb2xvciBwaXBlbGluZXMgZm9y
IHRoZSBjdXJzb3IgcGxhbmUsIG9yIGF0IGxlYXN0IHByb3ZpZGUgcHJvcGVyICJubyBjb2xv
ciBwaXBlbGluZSIgYmVoYXZpb3VyIGZvciBpdC4gTGV0dGluZyB0aGUgZWZmZWN0aXZlIGJl
aGF2aW91ciBiZSBkZXRlcm1pbmVkIGJ5IHRoZSBvdGhlciBwbGFuZXMgd2hpY2ggaGFwcGVu
IHRvIGJlIGJlaGluZCB0aGUgY3Vyc29yIHBsYW5lIGlzbid0IHVzYWJsZSBmb3IgV2F5bGFu
ZCBjb21wb3NpdG9ycy4NCkN1cnJlbnQgYmVoYXZpb3IgaXMganVzdCBkaXNhYmxlIGNvbG9y
b3AgZm9yIGJvdGggYmFja2dyb3VuZCBwbGFuZSBhbmQgDQpjdXJzb3IgcGxhbmUuIEknbSBu
b3Qgc3VyZSBob3cgbXVjaCBwbGFuZXMgZG9lcyB0aGUgaGFyZHdhcmUgc3VwcG9ydCwgDQpi
dXQgaWYgdGhlcmUgYXJlIHRvbyBsZXNzIHBsYW5lcyB0byB1c2UsIG1heWJlIHdlIHN0aWxs
IG5lZWQgdG8gbWFrZSB1c2UgDQpvZiB0aGUgY3Vyc29yIGJhY2tncm91bmQgcGxhbmUgaW4g
dGhlIGNvbXBvc2l0b3IuIEFuZCB0aGVuIGhvdyB0byBkZWFsIA0Kd2l0aCBjb2xvcm9wIG9m
IGN1cnNvciBhbmQgYmFja2dyb3VuZCBwbGFuZSB3aGlsZSBzYXZpbmcgYXMgbXVjaCBwb3dl
ciANCmFzIHBvc3NpYmxlIGJlY29tZXMgYSBwcm9ibGVtLg0KDQo=
--------------6L17rXWWWU6r0CkBN0ZzSg8e
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGK0ObIBEADaNUAWkFrOUODvbPHJ1LsLhn/7yDzaCNWwniDqa4ip1dpBFFaz
LV3FGBjT+9pz25rHIFfsQcNOwJdJqREk9g4LgVfiy0H5hLMg9weF4EwtcbgHbv/q
4Ww/W87mQ12nMCvYLKOVd/NsMQ3Z7QTO0mhG8VQ1Ntqn6jKQA4o9ERu3F+PFVDJx
0HJ92zTBMzMtYsL7k+8ENOF3Iq1kmkRqf8FOvMObwwXLrEA/vsQ4bwojSKQIud6/
SJv0w2YmqZDIAvDXxK2v22hzJqXaljmOBF5fz070O6eoTMhIAJy9ByBipiu3tWLX
Vtoj6QmFIoblnv0Ou6fJY2YN8Kr21vT1MXxdma1el5WW/qxqrKCSrFzVdtAc7y6Q
tykC6MwC/P36O876vXfWUxrhHHRlnOxnuM6hz87g1kxu9qdromSrsD0gEmGcUjV7
xsNxut1iV+pZDIpveJdd5KJX5QMk3YzQ7ZTyiFD61byJcCZWtpN8pqwB+X85sxcr
4V76EX85lmuQiwrIcwbvw5YRX1mRj3YZ4tVYCEaT5x+go6+06Zon3PoAjMfS1uo/
2MxDuvVmdUkTzPvRWERKRATxay28efrE5uNQSaSNBfLKGvvPTlIoeYpRxLk7BN0x
i/KZIRpSlIf0REc1eg+leq2Hxv7Xk/xGwSi5gGxLa6SzwXV8RRqKnw2u6QARAQAB
zSFTaGVuZ3l1IFF1IDx3aWFnbjIzM0BvdXRsb29rLmNvbT7CwY4EEwEKADgWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ5sgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
AQIXgAAKCRDjUgzJGSnI57GwD/9O6kei9M3nbb1PsFlDE1J9H27mlnRWzVJ2S3yJ
8G1oJo8NSaRO7vcTsYPBYpEL1poDQC5MEGh6FXSiOnyyHrg8StmGLksQE9awuTnl
nQgvXDQMVtm87r1abBAavP5ru2R9x/Tk63+W/VT2hPekMfHaJwFi1KATSI1AhsF3
CVoj0yDulz1u0uZlircKdbeEDj+raMO0LA12YxWaWtL/b9XaoAqV9voraKhx+0Ds
ZS5bWoUvs+715BArPBr4hPqKavsBwOWfzWDTKln2qv8d+glWkmk6dgvZFcV/9JEJ
Q8B7rOUMX614dqgwi1t71TI0Fbaou3nhAnES1i1it/aomDUCLvRwjGU2oarmUISF
gvZoGYdB9DfVfY3FWKtfDJ9KLUk9k3BFfBZgeAYoLnFZwa3rMyruCojAGTApZtaa
LZH/jzQf7FpIGGhDYnvGKXS01nLCHuZSOEvURLnWdgYeOtwKW1IIcnWJtB12Ajz2
yVu3w4tIchRT3wekMh2c3A3ZDeEjszezhFyXgoRpNYDBzNl6vbqhnopixq5Wh/yA
j6Ey0YrIUbW9NOhIVCGkP4GyJg756SGzyPny0U4lA+EP7PS3O7tE0I3Q5qzDH1AE
H2proNlsvjZeG4OZ9XWerI5EoIxrwZcOP9GgprB4TrXUR0ScTy1wTKV1Hn+w3VAv
6QKtFM7BTQRitDnpARAAsPFINiaOAxfatzRTme/1cG+kpSqY9znQYxkz8EWY1eAO
Qs2xKl65JUyhTRPQkW8cqDVzdVF16wW+1RyoMrtK5xj6jm9K7VAAc/sDL2LkoSjj
3FpoOp/RMfVBiLGATCdNSEDFPO6nGVJn8aOXmH54sgZzhgfqW1X9Y4ToWViF5VXZ
sWGzHPsXoVvlRyPfAYi9eL11hZqQVhXPOQTuAG4ow8z7ZGYT7wfZo9oXvs/11DQ/
pxt7aO8QGCNCsWnMOecPBy9+Tbr/huxLVFl+boaTv3QwdATHFtObOi+q3m6RAADB
VQSiACVCsqb02HADfhO8n0AM75fJjbXFTLBR06+eME0h0dF8d9hu9gHe3ZHqsvB4
X5E9UP+Vf8c1M9aoJrULVoAOo50gmCEhjlzI5xYczBtw1bhOXCP0Wj5cmx3wbKq7
UKMXjDKF9ag907d078BaIzhMOChN6s9c03KM6ix0nLpBGzYZXC0VL+yqKkiHJzee
mBJ4YzLvf8rCGxbg8kKPQ2ongQVpcE4rr6uS/kCoB7BpVSaHraAHA6IwpGccOlU+
0v9rBghE1QzIlhkzcxwzxlb7rTZsedxSPQLVdPaRG9rkz3Qw3mWYYs2w7dJahgIm
p1z/v9qdTWYdHzKRyafluFlz0PoUcVuGz6PwFzDxGV5Gqqg6zHLEx68KxKwoyecA
EQEAAcLDrAQYAQoAIBYhBJfk9RVdQ1JoZVPYf+NSDMkZKcjnBQJitDnpAhsCAkAJ
EONSDMkZKcjnwXQgBBkBCgAdFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmK0OekA
CgkQX75KBAfJsRlTUBAAjQoMom0dfgWNNIXpvQgiGRh6slnyZ/QH4j2CGNTgfNC1
CV4SVC7U/A3lFDoDGbcsISb7uKyLnjrn1c3rguT9JXzuIbQZotgE0LvG09odGMXD
S92CmBaKnvhYlSO0cUdRtgvnw3nMgl1Kz7a8vvjYl3S1XhXQ8bpgrh2Sn36oqhaS
//Mgy52qHN2lRz09lr9Ig1NSXkjguSyj1hTc5wOWV+rsX4is0nOBNaov76/tbcF6
sIsHyHPSGzZ4jefZs318ineuBnrtVE9sH9XWc1QHLF1gzOKKwssddXlYe2Sj5plX
vZqcHHYfrOLe+v1gxW21HumUosTsCDUVJ9egr1DQcaQiiOUV5qQi4/GfqFAacken
NbHcNLpOxaOE3IwbL0F7aZHsKsl18suDXAqb3ljyAm4fEZr2ceEnE7n1x9BZizJL
YbkYB/k6gxxxbyjcoR6F1niEE+6Hs9vKGNmvNQikPpv05IDXgOr6pgWWCdZCiup3
N72xS3OCZNkkVQjaSL6/hN/IcR8+Xtp+nbYH4Agm9hBAPN045l/P9nVmSQOJ3TC+
wGgo8N16qzW061YD/faB/g/u7RcSfi5SwISIyrNXnyhBZTrFx+0KsjtdwVGJXYRS
/tio6zRaBl/bO3+e8SGqsHU3f6JH+HgTWJINfj3I/wDIBAL0XGoDAE8tqQBpsTBd
mA//WestyKDwfpZEqz9wBNX4QUS/zh+1GiweKcgqXhi4RuV/MXTPXcET1/pGnX5S
h9hdBj6lIseTtbSVDBHQm/1qUPYFAG+grdWZ7YrPIXfKTUCBlE/pKcJ6Yi1RIW3o
OQ1+OfYaPDfqOnq2Ed+HFM+KNFhWtU1TRUBikU1n88lMcRlFHFtkAuZgsDwj2b+v
c71uXNA3YkcFHGBhq7rJQu3B1l2zvM0P0ds0HAo58iJ4qqMkA07EJStaATOokDAC
4Xo+n7DHu81pQPP9BTY9u1G+m4mlpivWqIVk5Gbb+2w9yCmkEWqv5QYPtjpgxq0h
zURLeU+BDvOUKjCS5480NvxWwOthPqYls0WgoSVVMtDpeklSRxmrHJ6k+H1gV9Ja
WcfQO/l0IQrQm1+xE8xz87oHl18gIVbpXmlfss6EnPfmhdst/FqxXM0sxV+QD3oF
mf/CcRG4SSqjsKkpQviDMG5TwN52mWwoirk2MYlNGLNwknWXhRb0l7r4SyZNfOWp
0EI0EvO+CfKZL03drnmMaeOoXXtKwmWgCpYTa6dxtTTVKbeUKYy2p+jYZqUONl3y
CwuL9UIOwE+LxhtED4ZjIWxoD5/uOBGLofP/eNZpMmmC9H18rupdh6ChGYi3q6/L
6oHNPDbwJUFv9UJys+MwOV1Lzq8ULCxRfYntnhug1iZHYdTOwU0EYrQ6CAEQALWU
YW4bgH3p7jUtpD8rUoaHTJ+G3z9ZUjYvz+r0llcpurPm0DyG7kWHzbzGTCkdYTxf
dxEaUggMfWxLC7Vyd8PadoBTlJJ++7MP9eL9IzyaJEG034N3TtDym/v/PataFbjs
hi4YF1tT/2RnSK3neeotr7FX8+zZrz5EgE69Wz06HGIKanRn9fhUKfKQzetGl0NE
Se62aTkxsf+Qb4Hq2i1wm6ct4m2iRfdhw1OUDNQHgbOy6V8mxXPg2fsJLVC3inpg
BdhA5xWrkAnxouujB1xs9g4Mu+5WnUqc/jr6S0zKbm81Xohl8JDbGvxbOpb9fmq2
NnVLR4771NJC3/2qzU/pjgjA/HNmjmqYFEIToTNlNjsEYGydcujlSsjdFDe+pA6S
kqUrEHpaVf031JOCzEzgfqyH3gMBtDXyrGAs8Vdnb1/ROMIALqbK8nh2IYnRblME
J3D6nJDlYMVwsDgOhhrTFREBUdLJ7lZ+LpS4ACctKyV22Eo/L2nOFeu1+pdgivMb
4L2VIJtgvzKFfV3I6MUMzSDMkhQzQZjPq7Uzlu0cZ9ZpSO7HuUzigJZ6vnE7iwLv
i/yyjUUqHnSmLFFE4xxpnsMlDZXBxx0HIzEt48M2dmvfmD+SqSiQrE/3qgWaIjwC
+lfYggYjPtNgSntkfOsCvDqnob8b0dpqRcFT5Px/ABEBAAHCwXYEGAEKACAWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ6CAIbIAAKCRDjUgzJGSnI5/3nEACdQ2vO
zmUJ2LoFq7z0Dn7HVfUX8slzja7LBl3vCw/2Oq5s2VbvgZuPRfUxdEMXPlTqyab/
VVbHzqhSYtMMpDsMhEnVZ4DawFvWVs3yL5BA0qU5Wsb82zRGO6Qab29cRaEjK6Lt
a6N9vfVyn7ZQNvUWB4sB9RyAtSTyQVrEuLZWoWfQLRqOaecFaBCsTeg/0q4ywnBY
kCZR9ciEnLGVRZt6oE7qNoNLsyTNKNWNge0/Jiv67Jt4VByZWwqz5f65GBAJYUlC
qWsCoZXUYTnqlFAnI533ZhYEx/x7UzCJREAPgpP0/DOfmaf54QqTwsdKU7g3VE0a
N7Vhy/ja4sCvgLmTUftKXr7k2Dsg+gldB54P95VPOot4DdehlcTVkI1HUNabPSJ2
kIS8bIHr0JrIMzqqOhlIh0CHcbwLXBu6V7+x0YcbGQPuvIfJYsYjHhNVt9Dx9Z8Z
+YDfxJJXY3ORfcQbtf700l/XRs3q9c2WRZ+CfJWw+kfpHjmq6BfEPUtXGJ0G4d7w
ErIZszYIviEpi7UdWuM48WNgJSjb/o5HaSLY6LeXXsMVXlOceYtbF1idw7eMTchU
rNj2bNSLj0qJZstNIVWXRYhpq/ELjJjqOmGoEnVb668sPNdpObwLJA+QDAvRBq7t
WPHvRXXbC5TEqFVd89bPHQNQyvecpEnSBbVWU87BTQRitDmyARAA0QGaP4NYsHik
M9yct02Z/LTMS23Fj4LK2mKTBoEwtC2qH3HywXpZ8Ii2RG2tIApKrQFs8yGI4pKq
XYq+bE1Kf1+U8IxnG8mqUgI8aiQQUKyZdG0wQqT1w14aawu7Wr4ZlLsudNRcMnUl
mf0r5DucIvVi7z9sC2izaf/aLJrMotIpHz9zu+UJa8Gi3FbFewnpfrnlqF9KRGoQ
jq6FKcryGb1DbbC6K8OJyMBNMyhFp6qM/pM4L0tPVCa2KnLQf5Q19eZ3JLMprIbq
KLpkh2z0VhDU/jNheC5CbOQuOuwAlYwhagPSYDV3cVAa4Ltw1MkTxVtyyanAxi+z
a6yKSKTSGGzdCCxiPsvR9if8a7tKhVykk4q2DDi0dSC6luYDXD2+hIofYGk6jvTL
qVDd6ioFGBE0CgrAZEoT0mK6JXF3lHjnzuyWyCfuu7fzg6oDTgx3jhMQJ2P45zwJ
7WyIjw1vZ3JeAb+5+D+N+vPblNrF4zRQzRoxpXRdbGbzsBd5BDJ+wyUVG+K5JNJ3
4AZIfFoDIbtRm3xt2tFrl1TxsqkDbACEWeI9H36VhkI3Cm/hbfp2w2zMK3vQGrhN
uHybIS/8tJzdP3CizcOmgc61pDi/B6O2IXpkQpgz+Cv/ZiecDm1terRLkAeX84u8
VcI4wdCkN/Od8ZMJOZ2Ff+DBbUslCmkAEQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1Jo
ZVPYf+NSDMkZKcjnBQJitDmyAhsMAAoJEONSDMkZKcjnnIcP/1Px3fsgNqOEwVNH
7hm0S2+x/N/t3kz50zpKhczHZ8GWbN3PPt4wkQkdbF+c7V4uXToN4a17bxGdUnA9
qljxt8l3aEqd4jBqLn2OJriu21FSnrZOpxb1EwWwvnVUwrLxCuV0CFQJdBlYp2ds
64aV8PcBOhQ62y1OAvYpAX1cx5UMcHsNVeqrWU0mDAOgvqB86JFduq+GmvbJwmh3
dA8GnI2xquWaHIdkk06T55xjfFdabwEyuRmtKtqxTP/u6BzowkV2A/GLxWf1inH5
M81QgGRI2sao6To7sUt45FS+y2zhwh62excOcSxcYqKzs/OiYEJjWMv9vYRwaqJG
EVhbfGFOjeBOYr+ZCCeARh+z4ilo1C2wupQT8VPsFiY9DRYgkAPKlbn9OqJvoD7V
hvyelJagSNuRayrrmnEaZMsoRdS22fneCVWM0xlGSgPCVD0n9+6unTnVbmF/BZsE
g5QufQKqlFSomu1i23lRDPK/1aPc2IoxcQPh2fomy8spA5ROzOjLpgqL8ksEtQ75
cBoF1K5mcC2Xo1GyDmdQvbIZe+8qwvQ3z9EDivvFtEByuZEeC5ixn4n/c9UKwlk+
lQeQeN+Bk7l8G9phd4dWxnmWXQ/ONR/aLzG+FguuGNZCPpu5dVQH44AXoFjoi9YV
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------6L17rXWWWU6r0CkBN0ZzSg8e--

--------------RwdbOXaDmVkS4phYZYvHnoIF--

--------------9X5w3tCPiwFtje2KZb60EE1O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfr3NEFAwAAAAAACgkQX75KBAfJsRnM
Sg/+KbiSTcLQ0PeUGJJZELLiJii/mTqGs8YtPlWiFwcJcUdkeLgNnvhzy4UFg8BXQJE2eeBUUNMY
qg1kM3SYzqy48ME7ozicP3pY8wVonSHFdf1X8uRO5TDN42KSd4VJicCRxQ5AmGo7Olwpee2qPLP0
Xhza428UUE1KNlLhRmWbKNUHTDEnYc/yL0WSlBLaCAIdFspDPh3NJIGr9RRWbCtwCu3DHiKmRPRE
HImr/ACfl0gwxHE/Wl9VBoolZDAllggtBODLP0HMEl2+wiAeSnH1uO3XzT+3Pb/Em9M8nu53OnII
J2Q6sUfEO5PoHOXSDOPRL6k0+R0NwgD4zoV+w+AW5HlMl7D5BGHv9Ye9NDy6iFLNs9FdJOUWKQDi
UvRQYy4d6fNef82DZ9a0PKUPJV/HtawagXvuGHRmLKjehthAiRWGC2NLXi6/wcmbUoK2xLVvQMkq
rU3TCJM9IeE2pSn45QJBXQnMMJdSwUKg81ehg8ZAFEPPGtmpotqDE3114Qm7a+RpQojDiY+eRwQz
wXHJ+CgOXVzfZ/akJu2dnbKutnGZwpnY7sJb8wKTeg85/ITC+HbKVEUSqEex8kPBi76Kyi8DYDhe
rZg5dxgQyd73FCvubEJtVmA0YV8WC34GjXrU7VOew8EIgB9rEpQ3rVehKqeqhwKcMr0i0zBxUrMW
J5s=
=Iu2V
-----END PGP SIGNATURE-----

--------------9X5w3tCPiwFtje2KZb60EE1O--
