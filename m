Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44246A76C3A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F1E10E470;
	Mon, 31 Mar 2025 16:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Ot9lmeoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011025.outbound.protection.outlook.com [52.103.66.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E609010E46B;
 Mon, 31 Mar 2025 16:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTSyX2StJibh0snhv5P+Yeu7vh4qJCaa5TPZLuScYiN3L+GaObNbZNXXCJaftWxXon9bioKYUQetqzudFJ4FDXxsWwwjya95M/5xJEFqxnk8+aDKKDQk364Tqeb95paBYgo6B/SrNBcYL0a26ACNOThdjfArIhSjjvVcQliz49RLTmRmU5xAVkBJ3g1JFxvBpUgW8r4zK7cI8C60Dhj6OQwzGiOpNVXC3Nd4EG6FyWAMIvxVne9q4bgfFX4C9uYaDdt90lORDMoUI2896rUS4PwOPVXFe87BTFootYu0lS3BlMMkOgxue1DA3JG782LmOF5REw6GB/IMuZOfOGVwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HsKsY44rtw6g1wRdZ3heqwGlsYJ562YQJDqgPVOxWU=;
 b=WJs16wh7+0zVFZU2PMotztgAElQgdlc/isI/zmIVNzMZhvn/V/6b4UonpLIPbwegeQ04e1d55NUZz/lCNSHixsBLESfRf+wjw7xYi1CwLN7kyZc42aw0ESSnd21j+Z1lb7HZKhnTk9Swu+Q+HaLzb1969ilNHQktY+sksP4/eWYTruqhgD/WOcDBLsJNd5ntF0OqwdViW0z8bFRN9FVVT/tRbrqqgVzcHYPSInkO8kVhDBBTdz32FC7QciFV5K6n6tNfLhVJU0X7mN45jxPDS9ghAVRgYNexA7i8vtm4KDhSM+hmo5+9RuQli4qu232AvufZxqDE7C4qrWIcPL0dqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HsKsY44rtw6g1wRdZ3heqwGlsYJ562YQJDqgPVOxWU=;
 b=Ot9lmeocD4dV4/podoq7VBjifDLow3WgrZ+JUT1gEs6Yx8r1cMfom2WP4QtGefu++jaudW94IMRNpJKcTmMaHl+vu0Oi8KSIjwRdqDepePzlr9qLVxK1R/2RasL/kEyyJc0QgsdQrDadDfXel/Rt1O4F5TMmjtPYXmPaRSY0zc7sl/zcDTmFWC3HkPm708ke92NpQxZlgGeydWUo75JbARFeSSQKTLOWK6S6cDFUEAoQ5683ka+YvSbv5cAMt/tuVaBNZSHXfHsVZ3lHJLkiZ50o1aDt7rhIJaqZCvXYIYcC24YD+54nkk78ugf5GJzoJ1J2SA0HtRuzDuBAyBj7Cg==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS3PR01MB8398.jpnprd01.prod.outlook.com (2603:1096:604:191::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 16:50:47 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 16:50:47 +0000
Message-ID: <TYCPR01MB84372C5EFC66F7CC9259FBBE98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Tue, 1 Apr 2025 00:50:39 +0800
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
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iVzWKmkuuD2lLR88VZiJAbbT"
X-ClientProxiedBy: TYCP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::19) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <b6d7ef3e-55ea-4c02-9953-3c8a07bb2dc0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OS3PR01MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 536334de-958a-48c4-7fb0-08dd70742f5e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7092599003|6092099012|19110799003|8060799006|5072599009|15080799006|461199028|12121999004|13095399003|3412199025|440099028|26115399003|41001999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THJUQnkyZ0ZQQWJqWlVpNTU3Zk5tTndGUyt6V1cxa01qcExzRCtaY29VRXRQ?=
 =?utf-8?B?TjcwQUV4Z3NSR1I2SXlFdzI3bUxqQW02YnN5Ny9oOUV5Rm5uL2l0S0lRd0xF?=
 =?utf-8?B?MzEzcUd5T01xWHlDME5vdFBadGNNd0gvL3dWdGQzLzU1dWF3Rjc2R29JS1l2?=
 =?utf-8?B?RGV6ZDRaYTBTYXhXY3h6QlFaNC9wNUlTSFJUZW9NSEszOXAvQytGSStBemJx?=
 =?utf-8?B?YzdOSEpUQVVnbXNiZXZDSkhDTHRXS3hwVGFBMExJRGxmZUhTSXdySnp6Y1dq?=
 =?utf-8?B?QkFWNnZLOW4vVzFFNDREVnZuaXRDMjBObVVFcm9ycHFTRTBGcU1UMXpUQ2Jj?=
 =?utf-8?B?T0VYd2o1M0NBMW5ZME4wUzBQOVhvWjA3VXFnWFlrVlMyMDBoeUtWZWpBTzFk?=
 =?utf-8?B?emhvc1R4ZmhoMk1USnZnbVJKdmpSZlYreFJNc25iS045MitFbHdJZWVpeERN?=
 =?utf-8?B?RzBpN0gwcCtUMlJjbENNRUluQzhGQStLNFFWRE16am5QeWxiampTdEUwYmps?=
 =?utf-8?B?NUVQVmhReWgvc2FrZUNXT3R1UDJXUEtFRHJMWDFRVG5PREdHNno1VDByYngz?=
 =?utf-8?B?V1RtVVlwcWtBUWNUK2lRbXR4c2ZyN0JFMU5wMG5meXd2LytDRkU5NER1KzFC?=
 =?utf-8?B?YzRnVHhEWWlnQjJXRE1nV3poYnBHajd6RDNnV1VncFNRT255Y2lJRHMxenUz?=
 =?utf-8?B?ZjNHTDE4dG9KTG9WVW9SNWNtOXBnWnBrNWIvMGUwNHA5dzQ1bFpPQWNMUUJN?=
 =?utf-8?B?dVdvaGdpNmU3VlFrdURHOG5xRTRCNFpHUUtaUjNEbENTeGVndC95Q0syVXJs?=
 =?utf-8?B?Umt2RUY0bWR6alRIc3FGcTcwMDJ1N25TSVkvV0U4YllpMVU1SzJsNlJkV0Jq?=
 =?utf-8?B?RmovL1hQd1VIdzh3bkpsMEJTS05JeVc4cG1IOGxLMEJvbUI4aDR5Z0dQZXlB?=
 =?utf-8?B?UkRXZWdmZWRHaHFBZXcrK0Yvb2lhVGYyYmlFK0ZqSm9PbzNPR3JHTVhQbWRW?=
 =?utf-8?B?VmFmT3VhYnJPVDJkakVqekJ6cFpvNzNWcHZWUXAxNTMza0RKMHZYaDZCM0Jk?=
 =?utf-8?B?OWhjUHpuRzlvMWRPZkpvVU91d0loSFhhcTFoMFpvUDY2eGwrNW83Z0NTZVNh?=
 =?utf-8?B?L2hIK1E5dXp3NUlibVpBTGpZOEpoZzZ1WExwWmJTdElyclhFa09vUzdsaUg1?=
 =?utf-8?B?SWpmZWdKY1h5WnZsOFNwcUlCUUJBY1pneW5iVXRxalFONmFxaW1kemxwYWlK?=
 =?utf-8?B?ZksvRkpWVVR0UGJPYVoxeEhndWh1c1pGd2wwUWFSKy9RdE5vWWc4eGplTkp1?=
 =?utf-8?B?eHg2eVMwbVhjWlhjNC9PZy9TR2xQQ3JsVS9PWUpnVnFhaUhkdWVGV3EyWTFC?=
 =?utf-8?B?WHF1czFSZEtqNXYwQzhwMkFBMEZvei9ENlUwdllzczZma0w5b0plUU1BMGgw?=
 =?utf-8?B?SzNsZmU1b05NUUk5eG9GWVNLd1hraWF3WjVxWHpML2ZFQ0dhbHo2Z1NBVVZY?=
 =?utf-8?B?OUxaUTF6U1VoVlhWS2R5emx0U1BsMllaRTlTVDJsMng3b2pVNXlaVmRnbFhE?=
 =?utf-8?B?aDQyUHU0S2VxMUZrYVM3YmpRWS91VldsZXhQazBEWTZXc3JhODVsVWJjdlFO?=
 =?utf-8?B?QVNXTFlQV3VTeGR1WE1Ua3JFc3F1N1RFUEo4SUROdFVnZ1NDdklYR0V2Z1dw?=
 =?utf-8?B?RUg3M2ptZjhjQlppaGYxbzR4cHlQREFxcXRIOVU4VGoyNnRwSUdOWDI3WlRr?=
 =?utf-8?Q?ROYBerS6FHIYgHIW+Y=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU13bFdIdnhlamdkT2RIMDczLys2bnh4SkFJODdhMEZmMWdSNm9QRnZyVmhH?=
 =?utf-8?B?ZzUvYWpJY3oxK0lVSnZqZUdJQW5aazRBYkRyZlFrcm94VUpsZ3dwSytqRHc3?=
 =?utf-8?B?VmFvbE53UTVxV0lacFM1U0lycHNMMDVqNWZibC9IeGxBOTVtcnRYZVFyL3dZ?=
 =?utf-8?B?YUV6WFhDTXFUWkE3MmFMTm1nZ3hsazZEb1RLY21QUXcxUzV0MHFPQUNsdEJU?=
 =?utf-8?B?NkFsNzE1aDVpb1AweU1JbStGYUdtNGd3WFlwak9EWi8yWU1jSG9iZm1DRDJO?=
 =?utf-8?B?cW5ZeU81Vk8wZ3RLUDZCQ21WNDFhUzdvOE0zZXlQejNnNmZvVGNXMWhvSVNR?=
 =?utf-8?B?d09aNnpRZmpUYW55cVNZdVk3WlhxN2xFUkI3OHlzeXhCamRLcWE1T2RNU2t6?=
 =?utf-8?B?SUsybWZ6dDdhUXlST1lKQ2kvNDhlTkYzSHJoTVNzcFNHSWRmbldSakRBa1dC?=
 =?utf-8?B?UktsSWp6N2xaZTNFNVkxWWMraVNBdDMxTmlvTUNGZ1kzd09aM29XVllFVmt2?=
 =?utf-8?B?TFJCNFlCQWFyRE80MTlJQmhWam9Fa0EzN1pSUXRVUUM0ZzVjUk9TMXl4MU9h?=
 =?utf-8?B?elFndXBFbm9VUjNST0NyNnQ5TVJGQ2FTKys4UDBaUDNqL1NuUjJtOGZCSUwr?=
 =?utf-8?B?QVhIS2JIQ2dhOHlBVGtobGgrWW95eW4veDcwc1JmQ0Z4cm5UdEh4eFBwenVr?=
 =?utf-8?B?Z1RtcnI2bVpyU0xXSGZRb0R2M2RmWGNlSUJUZ01CL2RTQXBuTTgvT1BUSmFD?=
 =?utf-8?B?d2VuNFRrMHVyejd6d3FyYXhUeG5KYStBTUh2UEJIZTRhWU14V1RGbGZ2bjFH?=
 =?utf-8?B?aGdxVEJ5cmZyTmxWL0NTMndPK2FLbkFTRGZCM0VWTEJFdHBQL01keE11VTNz?=
 =?utf-8?B?RWdJTXFjK1FtQUhYaVV2WlBhMEcxUnZwdnhDazZ1U1ZkcHc5Rlo4VTlqaFJW?=
 =?utf-8?B?MVc3UmxaRFUwdUExakljV1YvbjV1NnlhTlpsS0g3cm51V2ZIZXdlSWQzeVY5?=
 =?utf-8?B?clRRMDJFNmJrTnpBWDJSVGF4dE40MFgwRzgyc3B3ZEYySUo1a0taTllqaGh2?=
 =?utf-8?B?UmV4d214cXRLUUxHWTdtWHR3dXBDSWZ0UkdrbGtjTVFaeXdOL3FNQm11M2Zz?=
 =?utf-8?B?UG9lRXpYanAvKzI0QXBBcFN2cmd1RzgvTnFFK050aE9uMElycGlRcFo0MWtS?=
 =?utf-8?B?dVRweHRMV0I2Z04xYXdVTThsbmJYWFdRd3p4M2xjNGZHZ2ZocE0xVi9rUzRa?=
 =?utf-8?B?eEVxYktTSFBWa2ZxQVM5azhadXhzUnJDZ2pHWTdFRzhzdFhHbkpZb2xJZ2xJ?=
 =?utf-8?B?R2R4dWFsUUQwUENNZXhWR291R29zVHZ1S056aGFjUFlDZWJoQUYzZ0RNV0ZB?=
 =?utf-8?B?L2tHSHRWSG5NR2FSM3M0d0NCbnZHVlJaa2MzazdUOWMwZHlBS0hJZnEzWS9w?=
 =?utf-8?B?QmhjYzlMVU5wYzZTVEV4SGkxSzlXSFYwUjNXT1pPWDJHL2I2amtVQkR6MTVu?=
 =?utf-8?B?OVJZeTRqQm1YaHFUQ2cwb3ZtTnVtNXR4S1ZPR25CZUx0eVNvNFA3d1VUTncr?=
 =?utf-8?B?cGxVZk9pc1ZjQnVFdDJUOHlSc1NFQU1XMmhaRW43b0tva3BKVi9ud3dCVVlE?=
 =?utf-8?B?d0R1VDhIdVVNejNlVWpmMUJnWDNsQWZuSkV1SHpud3ptL1grVU80dVRoVUh1?=
 =?utf-8?B?RldSZ0xSdWN1cWJlODhJMlJ4U2p1RTVRMTQveGIyYmVycVRiYmYyUGlqaWl6?=
 =?utf-8?Q?cZw1lLBSTVrmnFic/I=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536334de-958a-48c4-7fb0-08dd70742f5e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:50:47.3365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8398
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

--------------iVzWKmkuuD2lLR88VZiJAbbT
Content-Type: multipart/mixed; boundary="------------PKOigoZdovU6QI3Q41peQ0R0";
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
Message-ID: <b6d7ef3e-55ea-4c02-9953-3c8a07bb2dc0@outlook.com>
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
In-Reply-To: <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>

--------------PKOigoZdovU6QI3Q41peQ0R0
Content-Type: multipart/mixed; boundary="------------Aa7kVu2W91qsdxDT0Dq3R648"

--------------Aa7kVu2W91qsdxDT0Dq3R648
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhhbmtzLCBJIG1pc3Rvb2sgYWJvdXQgdGhlIE1QTyBkb2N1bWVudC4gTWF5YmUgd2Ugc2hv
dWxkIGFsc28gZGlzYWJsZSANCmNvbG9yb3Agb24gdGhlIGJhY2tncm91bmQgcGxhbmUgb2Yg
dGhlIGN1cnNvciBwbGFuZT8gU28gdGhhdCBjb21wb3NpdG9ycyANCndvdWxkIGRvIHN3IGNv
bG9yIGNvbnZlcnRpb24gb24gYm90aCBjdXJzb3IgcGxhbmUgYW5kIGJhY2tncm91bmQgcGxh
bmUsIA0Kd2hpY2ggc2hvdWxkIGtlZXAgY3Vyc29yIGRpc3BsYXkgY29ycmVjdGx5Lg0KDQrl
nKggMjAyNS80LzEgMDozNCwgQWxleCBIdW5nIOWGmemBkzoNCj4gDQo+IA0KPiBPbiAzLzMx
LzI1IDEwOjMxLCBTaGVuZ3l1IFF1IHdyb3RlOg0KPj4gU29ycnkgZm9yIHZhZ3VlIGV4cHJl
c3Npb24uIEkgbWVhbiB0aGF0IEkgdGhpbmsgd2Ugc2hvdWxkbid0IHJlZ2lzdGVyIA0KPj4g
RFJNX1BMQU5FX1RZUEVfQ1VSU09SIGluIHRoZSBkcml2ZXIsIGFzIHdlIGRvbid0IGhhdmUg
YWN0dWFsIGhhcmR3YXJlIA0KPj4gc3VwcG9ydC4NCj4gDQo+IFRoaXMgaXMgbm90IHRydWUu
IEFNRCBoYXMgaGFyZHdhcmUgY3Vyc29yIHN1cHBvcnQuDQo+IA0KPj4NCj4+IOWcqCAyMDI1
LzQvMSAwOjI2LCBBbGV4IEh1bmcg5YaZ6YGTOg0KPj4+DQo+Pj4NCj4+PiBPbiAzLzMxLzI1
IDEwOjEyLCBTaGVuZ3l1IFF1IHdyb3RlOg0KPj4+PiBTbyBjdXJyZW50bHkgd2UgaGF2ZSB0
byBob3BlIHRoZSBjb21wb3NpdG9yIHdvbid0IHVzZSANCj4+Pj4gRFJNX1BMQU5FX1RZUEVf
Q1VSU09SIHBsYW5lcyBhdCBhbGwuLi4uIFdoeSBkbyB3ZSBzdGlsbCByZWdpc3RlciANCj4+
Pj4gRFJNX1BMQU5FX1RZUEVfQ1VSU09SIGluIHRoZSBkcml2ZXI/DQo+Pj4NCj4+PiBJIGFt
IG5vdCBzdXJlIHdoYXQgeW91ciBxdWVzdGlvbiBpcy4gQSBjb21wb3NpdG9yIGNhbiBjaG9v
c2Ugb3Igc2tpcCANCj4+PiBhbnkgaGFyZHdhcmUgZmVhdHVyZXMsIGJ1dCB0aGlzIGRpc2N1
c3Npb24gaXMgb3V0IG9mIHRoZSBzY29wZS4NCj4+Pg0KPj4+Pg0KPj4+PiDlnKggMjAyNS80
LzEgMDowNiwgQWxleCBIdW5nIOWGmemBkzoNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gT24gMy8z
MS8yNSAwOTo0MywgU2hlbmd5dSBRdSB3cm90ZToNCj4+Pj4+PiBIaSwNCj4+Pj4+Pg0KPj4+
Pj4+IFRoYW5rcyBmb3IgcmVwbHkuIFNvIGN1cnJlbnRseSB3ZSBoYXZlIHRvIGFwcGx5IGNv
bG9yIGNvbnZlcnNpb24gDQo+Pj4+Pj4gb24gdGhlIGJhY2tncm91bmQgcGxhbmUgb2YgdGhl
IGN1cnNvciB0byBkbyBzb21lIGNvbG9yIHNwYWNlIA0KPj4+Pj4+IGNvbnZlcnNpb24uIFdo
YXQgd291bGQgaGFwcGVuIGlmIGN1cnNvciBhbmQgYmFja2dyb3VuZCBwbGFuZSBuZWVkcyAN
Cj4+Pj4+PiBkaWZmZXJlbnQgY29udmVyc2lvbiBjb25maWc/IE9yIHdlIGp1c3QgZ2l2ZSB0
aGUgY3Vyc29yIGEgDQo+Pj4+Pj4gZGVkaWNhdGVkIHBsYW5lPw0KPj4+Pj4NCj4+Pj4+IFRo
aXMgc2NlbmFyaW8gaXMgbm90IHN1cHBvcnRlZCBvbiBBTUQgaGFyZHdhcmUsIGJ1dCBzb2Z0
d2FyZSANCj4+Pj4+IGN1cnNvcnMgb24gb3RoZXIgcGxhbmUgdHlwZXMgd29uJ3QgYmUgYWZm
ZWN0ZWQuDQo+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gQmVzdCByZWdhcmRzLA0KPj4+Pj4+IFNo
ZW5neXUNCj4+Pj4+Pg0KPj4+Pj4+IOWcqCAyMDI1LzMvMzEgMjI6MjgsIEFsZXggSHVuZyDl
hpnpgZM6DQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIDMvMzAvMjUgMDY6NTksIFNo
ZW5neXUgUXUgd3JvdGU6DQo+Pj4+Pj4+PiBIaSwNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBEbyB3
ZSByZWFsbHkgbmVlZCB0byBkaXNhYmxlIGN1cnNvciBwbGFuZSBjb2xvciBwaXBlbGluZSAN
Cj4+Pj4+Pj4+IHN1cHBvcnQ/IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBkaXNhYmxlIHRo
YXQgaWYgaXQgaXMgDQo+Pj4+Pj4+PiBzdXBwb3J0ZWQsIHNpbmNlIHRoZXJlIG1pZ2h0IGJl
IHNvbWUgdXNlci1kZWZpbmVkIGNvbG9yZWQgY3Vyc29yIA0KPj4+Pj4+Pj4gaWNvbi4NCj4+
Pj4+Pj4NCj4+Pj4+Pj4gVGhpcyBwYXRjaCBhcHBsaWVzIHRvIEFNRCBoYXJkd2FyZSBvbmx5
OiBodHRwczovLyANCj4+Pj4+Pj4gZWxpeGlyLmJvb3RsaW4uY29tLyBsaW51eC92Ni4xMy9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LyANCj4+Pj4+Pj4gZGlzcGxheS9tcG8t
IG92ZXJ2aWV3LnJzdCNMMTAxDQo+Pj4+Pj4+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQmVzdCBy
ZWdhcmRzLA0KPj4+Pj4+Pj4gU2hlbmd5dQ0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEZvciBzb21l
IHVua25vd24gcmVhc29uLCBzZWVtcyBteSBtYWlsIGlzIG5vdCBzaG93biBpbiB0aGUgbWFp
bCANCj4+Pj4+Pj4+IGxpc3QgYXJjaGl2ZSwgc28gSSByZXNlbnQgaXQuDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4g5ZyoIDIwMjUvMy8yNyA3OjQ3LCBBbGV4IEh1bmcg5YaZ6YGTOg0KPj4+Pj4+
Pj4+IGN1cnNvciBwbGFuZSBkb2VzIG5vdCBuZWVkIHRvIGhhdmUgY29sb3IgcGlwZWxpbmUu
DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEh1bmcgPGFsZXgu
aHVuZ0BhbWQuY29tPg0KPj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4+IHY3Og0KPj4+Pj4+Pj4+
IMKgIC0gQWRkIGEgY29tbWl0IG1lc3NhZ2VzDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wbGFuZS5j
IHwgMyArKysNCj4+Pj4+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS8gDQo+Pj4+Pj4+Pj4gYW1kZ3B1X2RtX3BsYW5lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtLyANCj4+Pj4+Pj4+PiBhbWRn
cHVfZG1fcGxhbmUuYw0KPj4+Pj4+Pj4+IGluZGV4IDk2MzJiOGI3M2U3ZS4uYjViOWIwYjVk
YTYzIDEwMDY0NA0KPj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BsYW5lLmMNCj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wbGFuZS5jDQo+Pj4+
Pj4+Pj4gQEAgLTE3OTIsNiArMTc5Miw5IEBAIGRtX3BsYW5lX2luaXRfY29sb3JvcHMoc3Ry
dWN0IGRybV9wbGFuZSANCj4+Pj4+Pj4+PiAqcGxhbmUpDQo+Pj4+Pj4+Pj4gwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX3Byb3BfZW51bV9saXN0IHBpcGVsaW5lc1tNQVhfQ09MT1JfUElQRUxJ
TkVTXTsNCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgIGludCBsZW4gPSAwOw0KPj4+Pj4+Pj4+ICvC
oMKgwqAgaWYgKHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBFX0NVUlNPUikNCj4+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+
IMKgwqDCoMKgwqAgLyogQ3JlYXRlIENPTE9SX1BJUEVMSU5FIHByb3BlcnR5IGFuZCBhdHRh
Y2ggKi8NCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgIGRybV9wbGFuZV9jcmVhdGVfY29sb3JfcGlw
ZWxpbmVfcHJvcGVydHkocGxhbmUsIA0KPj4+Pj4+Pj4+IHBpcGVsaW5lcywgbGVuKTsNCj4+
Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+DQo+Pj4NCj4+DQo+IA0KDQo=

--------------Aa7kVu2W91qsdxDT0Dq3R648
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

--------------Aa7kVu2W91qsdxDT0Dq3R648--

--------------PKOigoZdovU6QI3Q41peQ0R0--

--------------iVzWKmkuuD2lLR88VZiJAbbT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmfqx98FAwAAAAAACgkQX75KBAfJsRlc
Yg/+OKy1mDezVepMvrOeXVsFrTIrIhdU4pKOZYmTHLwAqe2fUTMpd+/PcSLzqmCIQHfb15SlcVyx
VCKW0CoJoSXYnF4+l6LjYnlj6Cc4gP8c7VJq+lpxC2aka5ZP3BaVkZ9ygPV2Lpi12b4IW5IEDPl8
3Uw0U8ph4seyncND+7uTMrp22R90jLovAIpm5f92JwnQw0GHDMAhSo/Yp8A1ICTQwHSwgjZfvGXD
AxLYq5g7vpNcrVtSowLQMBR7KK7iNj5HEgIlMalsDxnpRbtigg7Gl8LnHkkVip0wwLB8FUqWz6mp
q3puayiWe7XiQU7zCFMZK7WXaCmc+l5itJqmV+ZFfVlODW7Kzeifh7yP2/fch5zXp04Oegh1r7Gh
eKR+IwEKuWR0uF8xgHCRCED4z6Ewv8qta7LMnitWWLHtngsxvkOcjJrCi9Oh5l3Av4iZ8ZcfFcvO
eKKCWTi2Zt5gPxDMyDvxoE+QB/+r9bNU7PreZwYRELkwsUWr5O/9i8ceEAbcYaivoIHAnE+85l9+
stReEeZd/KIAJ/ic+0pxzQH0WvdZUtqiCxBqKghlZCs8wioJcs9IBVYS56e7wzFIypJitZ7WWUfC
MHUYActzSxZGTSReI3aH3EfE1StAe1TdrZTlCXzKChOnoi1SvSfqyJYHCXQLicWFDGZrGr12hsNP
1Xs=
=SqE/
-----END PGP SIGNATURE-----

--------------iVzWKmkuuD2lLR88VZiJAbbT--
