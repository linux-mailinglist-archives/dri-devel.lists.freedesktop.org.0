Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B066A76C61
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 19:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D27410E46F;
	Mon, 31 Mar 2025 17:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Zswm5ka+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011033.outbound.protection.outlook.com [52.103.66.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97DB10E473;
 Mon, 31 Mar 2025 17:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pneHBHHIKPO8KN2PRIcWD/1j090KQHuIObVhIpU2zqtKziQGZJwq7VoyE17mdQrpLrekKHsdrVmQCebKtHEUDDP7XWmb5sNiRFPD8X0L1eEX7EP3gj0skWDugWd8juD5IO3zKIfvtL6UvxN9/nXrzqGusdeCdF6UEcxQkw65KYQmn6XzWFEM9HOo9h5QBo5qE9TAYKACzjnAUdyZX2e46D2V8xzzwe/tuHCc+9VL+Kq5sVsMud0cDHXaYB/SNnZq0HZVI/qGpmR+axe8JVMDj9sRO/fzO+Gwaoy2u6i8BHjSwvayqLGzzaTR/rANC7yOGE+xtFNX+WCJseVaEup46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hx2D/hzswfhBGCXujF3dwxEq8pd3EIfbCd+I3niIpYQ=;
 b=E1A6NOrqLLjf6dXpSfmSZO+T5ahOGkwCJS4FxbU8EYVsnZC7f+HkmPqOZiCRp8aS8ZHHgagMCVCR17jiW6rGSdnbNZa9neD/TgtzPzyYsAXFSc7YZAlDTzw03yng/uXOjutDOIvyaF7BYuaryjDXs+Ks9J6dwhhlg4YO3C8jSZXraAye6wqPZ7scfP69WNIzTyqjWw6/XRxSaqQ5+oz7pJwMuTxR/0EhV4XmZ/cALugPimJLH3ei8jqZYljxygx1hk9QYXtH5p5hvVmBwvE315BKVBp//7vcx02rt9aspLhp8fX+m1+hTSi/Fd51M5/79Edhl/ow3xQjlpZtjuNrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hx2D/hzswfhBGCXujF3dwxEq8pd3EIfbCd+I3niIpYQ=;
 b=Zswm5ka+D7un7vVFbe836rHvl4kh7KhHmKlUM+TzJdiMn6E5EqQFO6DctYurJoVM3EQIUacjHzSIS3eWNmblw5VXfDyrZM6NkikuBqyXAIeGaCss3M2UVp/ag0uiPWIHF+ZCAbto02jbiIWBdL/4muwvvlh0ntC1pv+HeZ1kXGyhiTSuKJYRPlFy3Gq7IqnwxNJTxt6dcSnqtTNLeDzivXSPLaiNzrXDmL4tNq5ieqc4Wou+2tZKWfKfKDTYYByUcCddtuKXTwI9KxuD6LWxCkvqYom4lXkcPr4tOdhSRWqiRlfE6EORUu2P1CTyXTrG4MuTzb8RxebV8frL/J51Vg==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by TYCPR01MB5597.jpnprd01.prod.outlook.com (2603:1096:400:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.33; Mon, 31 Mar
 2025 17:04:48 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 17:04:48 +0000
Message-ID: <TYCPR01MB843757F4E7BFF224712BD68F98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Tue, 1 Apr 2025 01:04:37 +0800
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
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p8fccFNIr4chNcZTDhppylhl"
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <fbe97ed5-9bd6-4d53-8ca2-0d2ba1fd1f98@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|TYCPR01MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: fb24faf7-31c1-4375-50f4-08dd7076239c
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799003|15080799006|6092099012|7092599003|12121999004|5072599009|8060799006|461199028|41001999003|26115399003|13095399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enFHVnVWbnZCbG4reTZhWGp1NlREdEk5SkprOVBoSTJPdnB1WjBxQTdNekxy?=
 =?utf-8?B?VVQ4VDZBMmwyNDFkcDhVYVBRUFJFaWkrbFc5ZG9iMFZRbGZVbWs0YmlFK05W?=
 =?utf-8?B?REl5cnNXTkNnK3NBZE44U05jMmxTNHVTQ1YwL2dDUXY2aWdTZTRuMkg1Qzdv?=
 =?utf-8?B?T1lPWENoNm51QTBueUgvQ2dlUlM1aW9tbVhTOStmQ3FvN25ac3VDaTQyT1V5?=
 =?utf-8?B?NGg2Q1pYdHROaDc1UmNoRDZrZDVLdjc1Mm04R3BXOTUwdHkyRHZ4Q0hCQ2wr?=
 =?utf-8?B?YVZ4Z3piTEliRkdUMUozaVo2c3FqbXo3NTNxdURnZU16UFptcldGb0NWSlJn?=
 =?utf-8?B?V3FEcWZuV2VRQ1MrbGorNzdsTkNjQURteHJMbnUwOTFqU2pKNDdLMVRGb0R2?=
 =?utf-8?B?SGFFOE42SW1rMUhKcXFWWXJUTExZbDBFK2FBUUpPYTZIcUJiZnhuSUtIQUln?=
 =?utf-8?B?M2lqK3paNXNEdEJUOHFWTHNydFlHUDRaYlRyOEtNU0IrTXZiRUViRHpqNlZM?=
 =?utf-8?B?UTc2TElpUjgvK05HM1hNbzVZZHAzOTdkR3A5SmJwMitRanA2NXl4ZDhKVWRB?=
 =?utf-8?B?M090aVBFS095ditsMFhyYUk1YWZFYU4rYnh5QUI3QTR4a1JCdzgwTHFpTjRY?=
 =?utf-8?B?SWY0c2tPZGNIcElJMHM0RmVOTjhYQWNkT0dhMWlzUkpXTDJCRGpDNHRya0RN?=
 =?utf-8?B?OHBFamtqblFTSXpMY3pIN2NWRHlDdUpRNHNXZVY1VlJTZEhkVHloRkFoU2M0?=
 =?utf-8?B?QTJzUjIybDBTMFU2TVN5eDh4TE10THhpeGpwcCtkbEJZekt2aUNEOG9QeFcr?=
 =?utf-8?B?d0Q1bnFaS01neVRGRHJQaE5kYzgrWjkxZDZ4MFhSV2g3V2tnWXhjSHFzUEt1?=
 =?utf-8?B?c3N0bVVQcERENnJJczB6UHpHc25PN1pndUx1b0J6SUM2T2JhQmdxT0NNQnJE?=
 =?utf-8?B?cDkwMjdFN1E4ZVB6UCsxaC9JdzZ2dmp1NkFwZjBRRFNsUUV5dHpqZzFlditt?=
 =?utf-8?B?K1gyc0k4SDFCdElzNEhCeWJjUjlnc2FIcTlFQ1hlQVNUVGdFTUpJZjZDdTJL?=
 =?utf-8?B?TEdreENwdktGd3B3T1N4MVVoM3EzWFQ3Z09SYkNMUi96TVMydEFoUUtLeHdn?=
 =?utf-8?B?NkYzVUprM1Jadk5HRXFhZ084Uk5CcGQ2ck1QK3NEN1ovdnI0VG8zRTlXRzhw?=
 =?utf-8?B?bE9YT3ZGaVJGMDRpS3M0L0Q1NGJXa3BIcnBXdmdNdDNMcmtyYlQwSnVlUVNu?=
 =?utf-8?B?a3p3dWk4RUxuYTBvd3NWQ29lZXZnaTQvZ0RhcjF6VnNONCtqc3NLRGUyMWZh?=
 =?utf-8?B?ZEJTT3pmU29MbEMrRDlMVFU4VmJ4QXBtdGRNWThYZXZzZTlGb3hUbXJlMUNi?=
 =?utf-8?B?aWgwM0xqTmE4VkxtbEZHV1pGZFFsRTc4aGQ4b01LUGU3MXYva1RRMFlSc0k4?=
 =?utf-8?B?K0VTTlF4aUVyM3doSWFhc0ZkMDVuS05oc3c5Nm5LR3JIOFRvVDF4aVIwbHJt?=
 =?utf-8?B?WC9Bd3pscGlSK1F5Z05SbjJhSlpFaFpZTkN4d0YwN1RXQVU1bkRIUmo1a3hU?=
 =?utf-8?B?Zm11T1M0QnlYQnF5dmpaTDRLLzNCY1NrcjNEM0lFdEJHODFJWXErdjVtNE1k?=
 =?utf-8?B?NGRCTmlqM0NhMTVLL2JIOStERThLRks3TW44S1dXTGkyZ3NwRXBzMHlIVCtQ?=
 =?utf-8?B?Q1N6SGpCbmVISUMwR3g1RkdxQ3ZTaGg5MXArUUVnNjlzSEZjTEN1ZEUvaFkw?=
 =?utf-8?Q?0DEpiASqzCE7Bvjnc0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzM4MWJvNG92ZHRsa0YrVXE5dW5TR2xaOTdqUzI0Ukh2alVGcE9Rc2R3WXR5?=
 =?utf-8?B?T28wckVoaElmMkQ3Nk1MelFmSnRRVllqa0ZCVitXY1JVQlVDQk5MSFJZSi9j?=
 =?utf-8?B?RUlyeUgzT251L1RXVnlxVnBybDkyRnNvVkZlNHNtOEx5Ui9vWWZkT3UxeGVi?=
 =?utf-8?B?bnhWdTQ1b3dHQXh3Mm5rakVvVCt6OTJYdFhsVTdaeTA3WWFXdytoa0hCSjVT?=
 =?utf-8?B?VW5ZVjZPa09DTHExZFQvSGFaNC9wMG9QeHBRYzU1QnNtVjd6VTZ3TGNxOWEr?=
 =?utf-8?B?bUlwTmZrY3B0UFhrcHBNaEF4b2RsS01PbGwvcW92emd2a3RMbDhqRU5TVWVz?=
 =?utf-8?B?SWJkTmdxWUFtQ0lOL1V0NlgxazQydEUzNnJZdTVwS3A3L2VlbUFEMHA0R0pM?=
 =?utf-8?B?YmdXWU5OdHhiVW5FY3ZTUDZtd1lYaitURWh5Smh2M21wUk5sWHRUUVU1Nmhs?=
 =?utf-8?B?WTZVNW1PaTdxN3lUWCszakpXd1cxakl2Q01ndTlUNFluanNnYW16Y3N5U1RE?=
 =?utf-8?B?Ky9hdUtJZXlpdy81SUxUcTc4ZHNXV3RMY1k5ZXhHWkpWSVkzZTFyK3RMb2tw?=
 =?utf-8?B?VzU0NkkxWGFXU3J0b09IT3JVdHJJeUFGSzR2UWk3d21qcnRtZFRVMmVaM3ps?=
 =?utf-8?B?VTZTOGJIdTJ0VExkV1EzU2NaQTBFSEhKYkU2VEl5OGM2UXRpbTJMSWhvYm9L?=
 =?utf-8?B?QVp4R24xdnF5T2g5M0dhOTJkMUlrVTBUUi82MDBKNlhoVW0xV2VhNEVMdWtJ?=
 =?utf-8?B?NVhMcFNlZDFRSVFoSUMvNXhxVDVZallhNEVBNkE3cUdRTFNWU3Jwc1BqMzZ1?=
 =?utf-8?B?TzBzenVSZkFxSmN0Sk4yaStpaDlqUTZqYTVBSitwc0t3NFNvR0xFS3JPdjcy?=
 =?utf-8?B?MjNJU2R4V0VndWdnc2Z6bm42dVNPY3NyU2pTM1cyUXR3eU5IZ3ZoMTJRdTB3?=
 =?utf-8?B?a2dmQ2lwNVZHTysvODJzSm9nWE84eTZVMy9zM21iZXZCYzdLazkvc0dYdzNk?=
 =?utf-8?B?dmVkUUNHdkE2U1VqUXFlQnZOU0tQQWljNXIrN0xFVThiRHRLVXZkSVoyUmx2?=
 =?utf-8?B?dFg1TXJmajduV29Nd3MwVG01TzRnTmpGQlpVajVtQzFicHlvWXlCREtpZlJO?=
 =?utf-8?B?RHVWZkh6WEJaY2gvWHFSRk1BRzBlVG5SQ0VLM2hBM3FaR240dVBiL3B0eHg4?=
 =?utf-8?B?RHBpWVhYd3NwRVE2RXdDVG45L2ZabldvYlJCSHM5LzZnWFRiVW9PRzFoM08y?=
 =?utf-8?B?eFg1RmVub0RUbnk3UnR3bytBSXF0M1FEeEFzNWRPUVd6ejZ0cHZKK2FwM3Z2?=
 =?utf-8?B?aUEvd3o3WkpGbUQyK1JCazl1MEtmZ3AvYkVMTTZybGRjMnBzdHZmZlJQWW0v?=
 =?utf-8?B?Ykt4UXA2d3ZyOERCUloxYmdTWkg2MFpBS3ZMT2kza2EvcGxsL05qeUFGY252?=
 =?utf-8?B?Y0JmU3lYRTROLy8rTWs3OFlTYmNySW91bEFXMUhBZjNCMW9TVFdldHc5R3dZ?=
 =?utf-8?B?MGMwLzJLVExoR295VWtBaGtjVTNYclVYSmhKbWFCM1p6UG9ndjNxZnE2bE83?=
 =?utf-8?B?YmI5QmRKYzArN2dHdGh2blVNbDN2aWhaaWVnZkFJaHFkb3BabEkvWHF0WG44?=
 =?utf-8?B?elRVWHJsaldXL1ZpYU9MYzdjR0tmL0drQ3JJVlVDcEhKdkgvM3BocDBHVTZW?=
 =?utf-8?B?U0N2aGgxai9GM2dSNXNqVFlkN0w1RHlaeFhkU2QvUE1MZXgyN3I1MVBSRXlO?=
 =?utf-8?Q?hrdBfpglXpWqJdE600=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb24faf7-31c1-4375-50f4-08dd7076239c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:04:46.5650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5597
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

--------------p8fccFNIr4chNcZTDhppylhl
Content-Type: multipart/mixed; boundary="------------hVvhTOIsMHF263t7wg8RA06D";
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
Message-ID: <fbe97ed5-9bd6-4d53-8ca2-0d2ba1fd1f98@outlook.com>
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
In-Reply-To: <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>

--------------hVvhTOIsMHF263t7wg8RA06D
Content-Type: multipart/mixed; boundary="------------fTlaBVlBL0dxpRYJdqBYhPGC"

--------------fTlaBVlBL0dxpRYJdqBYhPGC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T3Igd2UgY2FuIGFkZCBzb21lIGtpbmQgb2YgImxpbmtlZCB3aXRoIiBpbmZvIHRvIHBsYW5l
J3MgQ09MT1JfUElQRUxJTkUgDQpwcm9wZXJ0eSwgdG8gbGV0IHVzZXJzcGFjZSBrbm93IHRo
YXQgY3Vyc29yIHBsYW5lIGFuZCBiYWNrZ3JvdW5kIHBsYW5lIA0Kc2hhcmUgdGhlIHNhbWUg
Y29sb3JvcCBjb25maWcuIFNvIHRoYXQgdXNlcnNwYWNlIGNvdWxkIGRvIGV4dHJhIA0KY29u
dmVyc2lvbiBvbiBjdXJzb3IgaW1hZ2UgZGF0YSB0byBhdm9pZCBkaXNwbGF5IHdyb25nIGN1
cnNvciBjb2xvci4NCg0K5ZyoIDIwMjUvNC8xIDA6NTAsIFNoZW5neXUgUXUg5YaZ6YGTOg0K
PiBUaGFua3MsIEkgbWlzdG9vayBhYm91dCB0aGUgTVBPIGRvY3VtZW50LiBNYXliZSB3ZSBz
aG91bGQgYWxzbyBkaXNhYmxlIA0KPiBjb2xvcm9wIG9uIHRoZSBiYWNrZ3JvdW5kIHBsYW5l
IG9mIHRoZSBjdXJzb3IgcGxhbmU/IFNvIHRoYXQgY29tcG9zaXRvcnMgDQo+IHdvdWxkIGRv
IHN3IGNvbG9yIGNvbnZlcnRpb24gb24gYm90aCBjdXJzb3IgcGxhbmUgYW5kIGJhY2tncm91
bmQgcGxhbmUsIA0KPiB3aGljaCBzaG91bGQga2VlcCBjdXJzb3IgZGlzcGxheSBjb3JyZWN0
bHkuDQo+IA0KPiDlnKggMjAyNS80LzEgMDozNCwgQWxleCBIdW5nIOWGmemBkzoNCj4+DQo+
Pg0KPj4gT24gMy8zMS8yNSAxMDozMSwgU2hlbmd5dSBRdSB3cm90ZToNCj4+PiBTb3JyeSBm
b3IgdmFndWUgZXhwcmVzc2lvbi4gSSBtZWFuIHRoYXQgSSB0aGluayB3ZSBzaG91bGRuJ3Qg
cmVnaXN0ZXIgDQo+Pj4gRFJNX1BMQU5FX1RZUEVfQ1VSU09SIGluIHRoZSBkcml2ZXIsIGFz
IHdlIGRvbid0IGhhdmUgYWN0dWFsIGhhcmR3YXJlIA0KPj4+IHN1cHBvcnQuDQo+Pg0KPj4g
VGhpcyBpcyBub3QgdHJ1ZS4gQU1EIGhhcyBoYXJkd2FyZSBjdXJzb3Igc3VwcG9ydC4NCj4+
DQo+Pj4NCj4+PiDlnKggMjAyNS80LzEgMDoyNiwgQWxleCBIdW5nIOWGmemBkzoNCj4+Pj4N
Cj4+Pj4NCj4+Pj4gT24gMy8zMS8yNSAxMDoxMiwgU2hlbmd5dSBRdSB3cm90ZToNCj4+Pj4+
IFNvIGN1cnJlbnRseSB3ZSBoYXZlIHRvIGhvcGUgdGhlIGNvbXBvc2l0b3Igd29uJ3QgdXNl
IA0KPj4+Pj4gRFJNX1BMQU5FX1RZUEVfQ1VSU09SIHBsYW5lcyBhdCBhbGwuLi4uIFdoeSBk
byB3ZSBzdGlsbCByZWdpc3RlciANCj4+Pj4+IERSTV9QTEFORV9UWVBFX0NVUlNPUiBpbiB0
aGUgZHJpdmVyPw0KPj4+Pg0KPj4+PiBJIGFtIG5vdCBzdXJlIHdoYXQgeW91ciBxdWVzdGlv
biBpcy4gQSBjb21wb3NpdG9yIGNhbiBjaG9vc2Ugb3Igc2tpcCANCj4+Pj4gYW55IGhhcmR3
YXJlIGZlYXR1cmVzLCBidXQgdGhpcyBkaXNjdXNzaW9uIGlzIG91dCBvZiB0aGUgc2NvcGUu
DQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4g5ZyoIDIwMjUvNC8xIDA6MDYsIEFsZXggSHVuZyDlhpnp
gZM6DQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IE9uIDMvMzEvMjUgMDk6NDMsIFNoZW5neXUg
UXUgd3JvdGU6DQo+Pj4+Pj4+IEhpLA0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGFua3MgZm9yIHJl
cGx5LiBTbyBjdXJyZW50bHkgd2UgaGF2ZSB0byBhcHBseSBjb2xvciBjb252ZXJzaW9uIA0K
Pj4+Pj4+PiBvbiB0aGUgYmFja2dyb3VuZCBwbGFuZSBvZiB0aGUgY3Vyc29yIHRvIGRvIHNv
bWUgY29sb3Igc3BhY2UgDQo+Pj4+Pj4+IGNvbnZlcnNpb24uIFdoYXQgd291bGQgaGFwcGVu
IGlmIGN1cnNvciBhbmQgYmFja2dyb3VuZCBwbGFuZSANCj4+Pj4+Pj4gbmVlZHMgZGlmZmVy
ZW50IGNvbnZlcnNpb24gY29uZmlnPyBPciB3ZSBqdXN0IGdpdmUgdGhlIGN1cnNvciBhIA0K
Pj4+Pj4+PiBkZWRpY2F0ZWQgcGxhbmU/DQo+Pj4+Pj4NCj4+Pj4+PiBUaGlzIHNjZW5hcmlv
IGlzIG5vdCBzdXBwb3J0ZWQgb24gQU1EIGhhcmR3YXJlLCBidXQgc29mdHdhcmUgDQo+Pj4+
Pj4gY3Vyc29ycyBvbiBvdGhlciBwbGFuZSB0eXBlcyB3b24ndCBiZSBhZmZlY3RlZC4NCj4+
Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiBCZXN0IHJlZ2FyZHMsDQo+Pj4+Pj4+IFNoZW5neXUN
Cj4+Pj4+Pj4NCj4+Pj4+Pj4g5ZyoIDIwMjUvMy8zMSAyMjoyOCwgQWxleCBIdW5nIOWGmemB
kzoNCj4+Pj4+Pj4+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gT24gMy8zMC8yNSAwNjo1OSwgU2hl
bmd5dSBRdSB3cm90ZToNCj4+Pj4+Pj4+PiBIaSwNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IERv
IHdlIHJlYWxseSBuZWVkIHRvIGRpc2FibGUgY3Vyc29yIHBsYW5lIGNvbG9yIHBpcGVsaW5l
IA0KPj4+Pj4+Pj4+IHN1cHBvcnQ/IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBkaXNhYmxl
IHRoYXQgaWYgaXQgaXMgDQo+Pj4+Pj4+Pj4gc3VwcG9ydGVkLCBzaW5jZSB0aGVyZSBtaWdo
dCBiZSBzb21lIHVzZXItZGVmaW5lZCBjb2xvcmVkIA0KPj4+Pj4+Pj4+IGN1cnNvciBpY29u
Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggYXBwbGllcyB0byBBTUQgaGFyZHdh
cmUgb25seTogaHR0cHM6Ly8gDQo+Pj4+Pj4+PiBlbGl4aXIuYm9vdGxpbi5jb20vIGxpbnV4
L3Y2LjEzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2dwdS9hbWRncHUvIA0KPj4+Pj4+Pj4gZGlz
cGxheS9tcG8tIG92ZXJ2aWV3LnJzdCNMMTAxDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+DQo+Pj4+
Pj4+Pj4gQmVzdCByZWdhcmRzLA0KPj4+Pj4+Pj4+IFNoZW5neXUNCj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+IEZvciBzb21lIHVua25vd24gcmVhc29uLCBzZWVtcyBteSBtYWlsIGlzIG5vdCBz
aG93biBpbiB0aGUgbWFpbCANCj4+Pj4+Pj4+PiBsaXN0IGFyY2hpdmUsIHNvIEkgcmVzZW50
IGl0Lg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4g5ZyoIDIwMjUvMy8yNyA3OjQ3LCBBbGV4IEh1
bmcg5YaZ6YGTOg0KPj4+Pj4+Pj4+PiBjdXJzb3IgcGxhbmUgZG9lcyBub3QgbmVlZCB0byBo
YXZlIGNvbG9yIHBpcGVsaW5lLg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29tPg0KPj4+Pj4+Pj4+PiAtLS0NCj4+
Pj4+Pj4+Pj4gdjc6DQo+Pj4+Pj4+Pj4+IMKgIC0gQWRkIGEgY29tbWl0IG1lc3NhZ2VzDQo+
Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtX3BsYW5lLmMgfCAzICsrKw0KPj4+Pj4+Pj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtLyANCj4+
Pj4+Pj4+Pj4gYW1kZ3B1X2RtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtLyANCj4+Pj4+Pj4+Pj4gYW1kZ3B1X2RtX3BsYW5lLmMNCj4+Pj4+Pj4+
Pj4gaW5kZXggOTYzMmI4YjczZTdlLi5iNWI5YjBiNWRhNjMgMTAwNjQ0DQo+Pj4+Pj4+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X3BsYW5lLmMNCj4+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG1fcGxhbmUuYw0KPj4+Pj4+Pj4+PiBAQCAtMTc5Miw2ICsx
NzkyLDkgQEAgZG1fcGxhbmVfaW5pdF9jb2xvcm9wcyhzdHJ1Y3QgZHJtX3BsYW5lIA0KPj4+
Pj4+Pj4+PiAqcGxhbmUpDQo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9wcm9w
X2VudW1fbGlzdCBwaXBlbGluZXNbTUFYX0NPTE9SX1BJUEVMSU5FU107DQo+Pj4+Pj4+Pj4+
IMKgwqDCoMKgwqAgaW50IGxlbiA9IDA7DQo+Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKHBsYW5l
LT50eXBlID09IERSTV9QTEFORV9UWVBFX0NVUlNPUikNCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAwOw0KPj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAg
LyogQ3JlYXRlIENPTE9SX1BJUEVMSU5FIHByb3BlcnR5IGFuZCBhdHRhY2ggKi8NCj4+Pj4+
Pj4+Pj4gwqDCoMKgwqDCoCBkcm1fcGxhbmVfY3JlYXRlX2NvbG9yX3BpcGVsaW5lX3Byb3Bl
cnR5KHBsYW5lLCANCj4+Pj4+Pj4+Pj4gcGlwZWxpbmVzLCBsZW4pOw0KPj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pg0KPj4+DQo+Pg0KPiANCg0K

--------------fTlaBVlBL0dxpRYJdqBYhPGC
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------fTlaBVlBL0dxpRYJdqBYhPGC--

--------------hVvhTOIsMHF263t7wg8RA06D--

--------------p8fccFNIr4chNcZTDhppylhl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfqyyYFAwAAAAAACgkQX75KBAfJsRkO
kxAAqibpLYVfPhYQ3dCRS61BzD7nAh7V7cp3tkjZb53H1tjk+pTFahpst7c1sEp+fogSUnoy2ZHL
F6p5lnoZ+D9foSZB659vqb0EP2A8HG+g3mX9baWysYf1Kg0W/YIf96AIUcVoMAbFuE1Ku8srVXuk
kky23DxoQjd6DidU2YxCI5cj8QwsyQxJJ4inPFoiHOA6KCL28Vy7IpnWHhkbaA6cCPirxI+cD0Qd
v3g4X+iebAcxGBR4a9m/RT1xwfckrnvsQFZjgf5pzWQMcv261eAtrWG19Dpui/M16UsxznfNYbPM
LPmVJahvicz4Oy5BXSt6UGfL7TRZCox3r+ZLl+qrxRZsUDYbplcBHxV+hVwyiJ6rSkK8sK+GYw5S
I/dM1Bu04lrzidUfWnBkC5kM8s4ATSZpsJYT6MQPn/9s0hPO7guPzPYDRz9tKTlEvYEafgrWvSny
4Cdrb9qiLWuV4KOWc7q7KrZRSJ66580TpzHuDtWpbbHhZ+LsNhbn9usnq6e9G2VUXcWkO8k4l9wo
qhN/QU73AmZOHf8aGABB1inVV5Qpk0ldJUyFijDeLY0U5YEUjS/PMpLtrearaYa1FhQR6elw4ZqQ
elVGgA8pBNu0J3jjySnck/1YMnI3jg3EIOIam5XdsN4u4R5+ppQ6qOGwwKWkANS7NNNg4fwWN+CV
d3U=
=wjPX
-----END PGP SIGNATURE-----

--------------p8fccFNIr4chNcZTDhppylhl--
