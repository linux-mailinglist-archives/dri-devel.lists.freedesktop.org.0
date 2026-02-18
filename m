Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8iBUIVlnlWk/QgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:16:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC5B15394C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707A610E214;
	Wed, 18 Feb 2026 07:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rQu5doYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011014.outbound.protection.outlook.com
 [40.93.194.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CECA10E214;
 Wed, 18 Feb 2026 07:16:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWyXeKPhScJ7qdXWR2HmWXF2max5Rjitg4ouNcTU1b/4EB2uSECii5Q73OrAltT8glmrcsGj671mEG9w4hR3YP5vjK21/g0jY6LVhQm3THn4CQ657HUezsdfk3kx6F1w+LbS/zxaFnYcoCb1zL2ICvHwcszng3hr2G76c5MI3bcHPwZaqqMeKYK3b/ZNdZB99Dp8mQXwGmZzQEkTDcCP+Bo028IMKvv9ksP74ox8U/Fr0r5p4SL8RU6zRhatDD1aK/A5gjOA1VN/axxOHuzb1GjUK6NcOwNE67Ex3t5KoXIu691TBEZLnXooXuBUCBQ658cMy2OE/kd4Tl6vtWvGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Vvs9tk16pIQ+hU0+V86+YVNeFDmuFVJa9rHQWEvV/Q=;
 b=LPrC29KlX7WuSaDsOTJubN3DTWmfLpq2ZFLS/+GeeoOevjsxqGFHX3TfouB1mBaeS+P7o6NXKwiiONnO3udykafHUNGnmCxaVZyZsI0gXMWK6kmh72doXJCo9TsD0vXJRvrz+r+jxtaOc0dlY3IM2ClAu31bUpVVZnRlSW0SrYXadlWV0pTRqxtC59IMUdRiIi6IF/ygFU2Ftkmuv0Wh+yDmkzgMiZS23HYc1S36NQU/riS5jKyl1W5kKCvFD5PX+XmxsJo9+AbRV0veA9gzGs2XxYfuEQxvDn1e1WURbp2IDTfFp6YgE3LmaM4vBGmZpjme7Tk3sbUkqGdo9KZ+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Vvs9tk16pIQ+hU0+V86+YVNeFDmuFVJa9rHQWEvV/Q=;
 b=rQu5doYa2VKjI+rranE7t5qt8veyEPbowdtlIVENOJlBIq/DNJQ9ggVEsBmBz4IsTpTTMxT+mQx/gD+VhsnbLo1moys485kI+gGIJ+En5pPHD8szyRRVKqxLQpZsW7HS0+6ZDJtiw69ZslL24jQsxgqKfOExBL14Bwl7boGKPmFDlSbeIJn38UFnpQhcLAcAj2CkUxNxa9D2oFgvHDxd6r4sHoVrjGEXKWYbNRFF3huIHc6Z6EOvtWZbKG0h5vJl4MY6D0W/9S+zlF2WXEVJ+df+M+NGrcPg3xv1dLywIeo1ixu/Pyvj9npklWjPKgWN3otwIWlPmxbo0S4UERf01Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7805.namprd12.prod.outlook.com (2603:10b6:806:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 07:16:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 07:16:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 16:16:24 +0900
Message-Id: <DGHWJ721IK47.2OJRIZJFIVVB5@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: gsp: support large RPCs via
 continuation record
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-6-73079ded55e6@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-6-73079ded55e6@nvidia.com>
X-ClientProxiedBy: TYCP301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2267d5-f71b-4329-3ba7-08de6ebda223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGo0b0UxTG41TUR3ZUJHaHNjby9LQmY2cy8xYVkwalkwcUZjV3B2TTlqU0ZX?=
 =?utf-8?B?UHdSaFRSMTBnYlRBdHFMU3lRdXBHWHorb2xjRitGa1o5OWdkWnBSUkhXV0t1?=
 =?utf-8?B?aHNnWnZkbEdKeVJCNmxkK0N0NU1RcS8vK1o1dGRuNGVwV0dPREN6bDZvTitV?=
 =?utf-8?B?Sm5LRTNTTTNPTHZMRTlzOE9oVE9UNHMvU2ZoSHFUK1JHOTZkSVF3VHVMaEdY?=
 =?utf-8?B?WURlZTBmeE15bWJwd1h1Rmc1WFYxNXJvaTlKSGlDQ2loNzJDTkpQb1F0Vm12?=
 =?utf-8?B?d2h3UU9tanJLa21tTThLRzVWTSsvV0lUVHBsbWxtd1d3VE9LZ0EvUU9GVmRp?=
 =?utf-8?B?WnJ6Z3QyLzhaUHFaQU5BdjBtbzBIOWM2Y05VM0FWNTFVYng4cmNmT3IvTE5I?=
 =?utf-8?B?L0hPRnovR3pwVW96VXBMc1NIN21veitjVUN5bVJORUFOd2o3K0N1TGFyV0Jk?=
 =?utf-8?B?NVVvMUV1RjFIbS9WdXhuVU40bUpDcnhoWE10THJmWlVDYnRaY3FpVko4NVha?=
 =?utf-8?B?U0Jjc2llR3BrL0IvL0dPaDZ3Q2pNbC9VZVY4VFNUS3EwSkJEL2xHR0VPdlcw?=
 =?utf-8?B?OWdmWGFwSE5sUkxWR3FyV08wenBiN0xtSnNWTWZKTWQwcXVCSThmOElYeW9K?=
 =?utf-8?B?YXZiRk8yQUJQOEF4N2IvT3RZcW84ckRaczF5eG14OHZPL0VVWWRGYjVOVlg1?=
 =?utf-8?B?NWROcWl0SHY2aFFSV1ljeHJXcnU3OC91ajJVOUpscWxJaXkyeU9ZSW5FaDJj?=
 =?utf-8?B?RUFxVVZXZStOMEV2TU9kNkxwc0lodXJXUTN1dzkxYVpnT2xDNlUwYUc1VXk2?=
 =?utf-8?B?QWNvQzhxb2NIVzduZ3ByNU5wMFNPd2tHWGR5NmVFZGxWcEsyWFpYdDJFZXlH?=
 =?utf-8?B?bXRVRDhGVjBHSE9vOUh4OU5ndm1MTHEvY0NTYnk1QXNJc3F5Yko3Wm00RXV6?=
 =?utf-8?B?MFZDK2FkMUJiWDh0MW8rN2J6bUVWZEs0OGxRMURLZld0MDVzU05kdzg1U1gx?=
 =?utf-8?B?S0JFbEt6alRrdUg3aVFldzQrUEo1RjJRQ3A3ZHVnQ1I3U2w0TDIzSXhxWWxw?=
 =?utf-8?B?RUp0YlAzd0VBVzM3clNQWG5zbHJEQ0RYVXhmTWxaWGJlYmh6TFRudEgwc25a?=
 =?utf-8?B?Q3p3STRwdTVCUlRXT0ZqWi9OK3IzZ1o0ZlpyZTlWNWRoYmp4d2pTMlErKzdz?=
 =?utf-8?B?QlB3ZVVlZTdCOWVsWWFJRVBRYzRUR0dEdW04cDFpUTVLT25HZzlSOXhoRlk0?=
 =?utf-8?B?SWxGeTg5U1AzV0YyVVVIQVNiWnJhRUdUWTBtcUpwWVNRQkFVOGJvK1FFUE8v?=
 =?utf-8?B?TjhYNTlxNElrNXFMcnZLdlZ3Z284ZmIxZ0w0bStiV3EvK1pmMm9RVCtueFBJ?=
 =?utf-8?B?ZUYvRWpxNW1rVWxacHFFVWllcVQvQ2phT2dyWDh2ZFdsbVd5YVlzdVpHVVVB?=
 =?utf-8?B?YjVXbVZxam5KU0FpSXk4WC9OS2JQSmJIOE0rUUpIaTVQQ3V1MzZ6ak5wK0Js?=
 =?utf-8?B?MUpIc1YvYzA2WnN2Y0NkUTdpQVpJeFdRdklVdHZPdHJJZi9zVmxyYnNUampX?=
 =?utf-8?B?SEVXYUxqaDFZUUE4WUg5eW5UcTN3OUxqOTE2SGE3U3RWT1NNTFJvb1hlL3BH?=
 =?utf-8?B?OHFKZS9IRHR2UVRqQm5qTmQ5eGVFdVNmYzBKMU1wdXhHWEMybEZhY0V0ZC9L?=
 =?utf-8?B?ZHZINnZUb2JocktxdHBuRzdZMlN0ZGFHVFIxVGJIZlo0VUhhb2pZQzIxVXRI?=
 =?utf-8?B?T3Z2VEZNTXBkOXFTdlduMkhQUGl6MGJOQ0Q2S1BLM0N5aE85RytmQlgrcVp3?=
 =?utf-8?B?SFB6aU1sN1IvZG00SGJxc01BNzZVSmNabndWdFQxam1HSE91QmZSNGpGZEpU?=
 =?utf-8?B?WHhJWnZGMi9WV0VzYkd0RnA4RGpJVGZIYnYyMHUxRU1rWnlLRXcwMCt4b3di?=
 =?utf-8?B?Q1MyU2FLQmxEU0lJRm04SjRwaUZyYTdHSGhiUGVDWFA1TmtFSDNHeGl2MVVh?=
 =?utf-8?B?em8vYWFxU1BuSXFoWGtwZGNCRFFxTmRwdXM5S3NpVytQdUx2UWJwZ3Y1emxl?=
 =?utf-8?B?bnVRL29iY1pJbkNyei9Xb2pZRFJ4dVd2WUI2aFBBeU4vczZhNWcybXlGa0tZ?=
 =?utf-8?Q?5Y0I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TENJbXpzaWtITHEyV2poYjRicllFK2ZaVXlRTDAxQ2pscHNrd3RVbEZITDl0?=
 =?utf-8?B?QWd3WERHVVRqU2N6UUlVWGYyRGFDMTFhU1ZoM2U0cUl2WDZpYkJUTFlmYTUx?=
 =?utf-8?B?SGc4V3ozMzV4U1ZURkpJYWFMYm1iQjJxcUhHYlllZWdXL01IK2l6QndKUXZB?=
 =?utf-8?B?dVBtSmk2WTVzY2VSU1M3NEkxK2JlMjV6eTEvVHlQOEhIQWlXUzZzZ2FtR0ow?=
 =?utf-8?B?UmYyQ1ZxaFN1SE1UTE5EKy9tS05iT0pLMDdwTWhJVVZrZGZhZlV2M09Ga1RE?=
 =?utf-8?B?MENiSDh5YVJJNHpqSTBVNU1wRFBvd1grRWhMUjQ0a1VvYVRLWW5iRFlqNFhG?=
 =?utf-8?B?SmhJY3A3ay9xWVlvQVg4Uzdmc01ZeUZhUkhaQWxERjBGYkZxc1ZwYkFYbG5W?=
 =?utf-8?B?OElOYWJKMlo2WlVZQU5hbGV6Zk1LeUZDL2J3aTNvbk9YRG9zNERxSldYT2xO?=
 =?utf-8?B?VjN3SnNYOTREMzNnUUI1RGNWUE5yeE8xaVdnNXIvK2tGY040S3BZWXdPZ0xx?=
 =?utf-8?B?ZGt5UWJxV0kwSHhkY1FONEYwUEhuUG5pTlZhYnkzejZZQlhEdWF4eEZyV1ZQ?=
 =?utf-8?B?Qm9uZ0pYNHJmblN6Z3BBTkVrVWQrRmp1NVBweG5oNC9WQW4rc2ZLaTB0c1g4?=
 =?utf-8?B?dlE2TUlqUy9tKytsTU5TM1pxNk5jemFsKys1N0tZNHpWTEZuTWxlVVpHdnFW?=
 =?utf-8?B?Y0xGdFdZdHBUNGxGMEJZSlZXc0laOXJTc1VPUnUvVDRRRFBqeE82TW5qZE9L?=
 =?utf-8?B?bjczV0pWendLOU01RVBjOHI4TndjeldJdGRkYjZ4TjVVckl3VG55b3ppQWVh?=
 =?utf-8?B?MU85OVlzdmljN2ExYnNITW1xeVJrTDBwVndDbEdLSHhGTlF6UjAyam1hUUp3?=
 =?utf-8?B?TWlkRGpDei9mZlFVYVlpSjJlSDBrTGRpUFNGaDF3TXNXRGxXUEFUdnlKWjlI?=
 =?utf-8?B?bjRvV2lzbXBOdHc2ZDRNbnZmSGhsVld5VmQ4V1M2NzJ6VGhWdlgvTzdLRGpL?=
 =?utf-8?B?Y3VZTUIvejdNWXVLUno1cytaZ0xIN0l6OXk5cnlEM0hCZWdKTHNTQ0NqSGI3?=
 =?utf-8?B?M1dYeUlsT3E2U1czbzNTSk5DNmFyS0hRMSswRjFSQ3p2UnlTeFFrSkdJTjVG?=
 =?utf-8?B?Tk1iczFKTVUzanc1eGlJSUtMWVBCdXVweEpyUHlLMURDMi9zT1gxWThqUXJ1?=
 =?utf-8?B?cHR1R3orQjdBQlhuWGRzcWN0Rkh5R2xDbFRTZ2puV055elQ0TmMrRmJrZHY1?=
 =?utf-8?B?dHp6UmM1T0EzclZqdTNPMW5iNWxmNGNobm9UaytSVmdnZWpHRU1FQVRnaG1s?=
 =?utf-8?B?Uk9LdEM2YnNLd2NyR1I2RkVhSlNQeW13UmhNVXpodVcxYUFyNmxZV0NITUZm?=
 =?utf-8?B?YktQVXlsTzJJR2dWSnJBT0YyQVhEYnhVN3FmWDM1U3B5UEo1UWttcFhYOXV1?=
 =?utf-8?B?L1VxQnlnc2Yzdll1OWtkcTROZHBROW1SZXNaV0xMWUw1VHNuR3ZMWmhhb0FL?=
 =?utf-8?B?M2hhdE9rZFcvRGRua2dTeHIwSnhST1pLMFBUNWxXK0lTblVIMUpHcmZtUFB3?=
 =?utf-8?B?RHZSRDREdE9KOWhMUkw4TWE0MlZCQ2hmd1IrRlJ6SWY5NUJJNTF5T0o3UEYz?=
 =?utf-8?B?S0ZaT1FWTEFabnNsVkFHWUNKL3Rod2t0dXFzb3RiSHBKSXlic1ZNVlF2UXJy?=
 =?utf-8?B?VTJVRDVVRzFQSm1PYWNZY1BGZWp2eWppRytudElmUTQ2Q1FrYVd3TXhDaTRh?=
 =?utf-8?B?ajFFb29Tc09KTjhzYm5oWkhpZUdmQTRDK09YNjJXRmVGazFRSGIrR3Vsd1pr?=
 =?utf-8?B?MW1MWDJKV0Z3RFVVUStuM3lQZEVoQnZtTVVZQ0dHUnd0eHpvZzFTMkRLOCtS?=
 =?utf-8?B?bVZUaXZPeVdEV093aGIzeDhWZGVyZGx5T2FwaFZoc0RKOEt5cm9iZThLU3BZ?=
 =?utf-8?B?WWZ1U01pY1dzS2hHZWJub3pNMzUvNXVSWElHa2oveUsyT2QxNXBTMTFDZzhr?=
 =?utf-8?B?Wm5CajU5c0U1NW1mWDVFNmhhNks2bGE2S3hTV25Damw1R2VuN1FOUTlkejFu?=
 =?utf-8?B?WTgvd1ZQbmY5YTZiWko0N0hVQ3hPOG5lTTJjdW1tcmgyMDBCczNmekt6VXlS?=
 =?utf-8?B?amVBRnNLdHlwcE85Z3lVSlpZMmxjb2dVQUtrUkJ3VWxoRE5WcFBzeDhJSThV?=
 =?utf-8?B?a1ZoNUl0YVQrU1V0N1AxVWliNHhXclpSVVpHc3h5Yy9pbEZjK1RmVjRRdkxz?=
 =?utf-8?B?VnkvdVNLMDdkb0VHSEpEcHNrMTdPU0R3M0xISHM3YzBBWkxBQUMvdDFFRXpo?=
 =?utf-8?B?dnpHSFFkeUhiRFhmT29FeGdXOVRXeGZjNDhnYytFQzhxNWpwcnNvSGRIN2hs?=
 =?utf-8?Q?r7yAsATTrAYpMrGO3UDGe9tMp3QSVd4OpZ1ET4aQPRrsY?=
X-MS-Exchange-AntiSpam-MessageData-1: ZXyWnpfLwVDMgw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2267d5-f71b-4329-3ba7-08de6ebda223
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 07:16:30.3279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHIM6lka+/GxUl+vzWo76bppilW4PXHo/rReKPK6x3mtnfmbHzrGA/oXcyVXAjZAXLzcpgrdNyGY+AF8qvSkoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: CCC5B15394C
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 3:28 PM JST, Eliot Courtney wrote:
> Splits large RPCs if necessary and sends the remaining parts using
> continuation records. RPCs that do not need continuation records
> continue to write directly into the command buffer. Ones that do write
> into a staging buffer first, so there is one copy.
>
> Continuation record for receive is not necessary to support at the
> moment because those replies do not need to be read and are currently
> drained by retrying `receive_msg` on ERANGE.

Do they not need to be read at the moment, or is this a permanent thing?
I hope it's the latter. ^_^;

>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs     |  47 ++++++++++++-
>  drivers/gpu/nova-core/gsp/commands.rs | 124 ++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/nova-core/gsp/fw.rs       |   5 ++
>  3 files changed, 173 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 3e9f88eec7cc..c24d813fc587 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -29,6 +29,10 @@
>  use crate::{
>      driver::Bar0,
>      gsp::{
> +        commands::{
> +            ContinuationRecord,
> +            WrappingCommand, //
> +        },
>          fw::{
>              GspMsgElement,
>              MsgFunction,
> @@ -524,7 +528,7 @@ fn command_size<M>(command: &M) -> usize
>          size_of::<M::Command>() + command.variable_payload_len()
>      }
> =20
> -    /// Sends `command` to the GSP.
> +    /// Sends `command` to the GSP, without splitting it.
>      ///
>      /// # Errors
>      ///
> @@ -533,13 +537,13 @@ fn command_size<M>(command: &M) -> usize
>      ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
>      ///
>      /// Error codes returned by the command initializers are propagated =
as-is.
> -    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> =
Result
> +    fn send_single_command<M>(&mut self, bar: &Bar0, command: &M) -> Res=
ult
>      where
>          M: CommandToGsp,
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
>          Error: From<M::InitError>,
>      {
> -        let command_size =3D Self::command_size(&command);
> +        let command_size =3D Self::command_size(command);
>          let dst =3D self.gsp_mem.allocate_command_with_timeout(command_s=
ize)?;
> =20
>          // Extract area for the command itself. The GSP message header a=
nd the command header
> @@ -590,6 +594,43 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0,=
 command: M) -> Result
>          Ok(())
>      }
> =20
> +    fn send_continuation_record(&mut self, bar: &Bar0, cont: &Continuati=
onRecord<'_>) -> Result {
> +        self.send_single_command(bar, cont)
> +    }

This one-liner method out of the blue is a bit surprising, and the first
reflex is to try to inline it. Its reason to exist should be documented
(you mention it in the cover letter, but that's not visible after this
patch gets merged), but I'd lean towards removing it and just qualifying
its unique caller:

    // Turbofish needed because the compiler cannot infer M here.
    self.send_single_command::<ContinuationRecord<'_>>(bar, &continuation)?=
;

Fewer moving parts, and it makes it clear on the caller's side that a
continuation record is just another command, like the truncated one sent
before it.

> +
> +    /// Sends `command` to the GSP.
> +    ///
> +    /// The command may be split into multiple messages if it is large.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
> +    /// - `EIO` if the variable payload requested by the command has not=
 been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
> +    ///
> +    /// Error codes returned by the command initializers are propagated =
as-is.
> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> =
Result
> +    where
> +        M: CommandToGsp,
> +        Error: From<M::InitError>,
> +    {
> +        let msg_max_size =3D MSGQ_MSG_SIZE_MAX - size_of::<GspMsgElement=
>();

This could be a const.

> +        let mut wrapped =3D WrappingCommand::new(command, msg_max_size)?=
;

The `max_size` argument is a bit unfortunate as it is a constant for
non-testing purposes. Is there a way we can make testing work with the
same limit as real-world use? That would also make our testing closer to
reality, on top of making this argument unneeded.

> +
> +        self.send_single_command(bar, &wrapped)?;
> +
> +        while let Some(continuation) =3D wrapped.next_continuation_recor=
d() {
> +            dev_dbg!(
> +                &self.dev,
> +                "GSP RPC: send continuation: size=3D0x{:x}\n",
> +                Self::command_size(&continuation),
> +            );
> +            self.send_continuation_record(bar, &continuation)?;
> +        }

Btw, can we recover if a split message fails between two continuation
records? I suspect the GSP will notice that the next message is not the
expected continuation record and recover from there?

> +
> +        Ok(())
> +    }
> +
>      /// Wait for a message to become available on the message queue.
>      ///
>      /// This works purely at the transport layer and does not interpret =
or validate the message
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index c8430a076269..99603880d56f 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -242,3 +242,127 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &B=
ar0) -> Result<GetGspStaticIn
>          }
>      }
>  }
> +
> +#[derive(Zeroable)]
> +pub(crate) struct Empty {}
> +
> +// SAFETY: `Empty` is a zero-sized type with no bytes, therefore it triv=
ially has no uninitialized
> +// bytes.
> +unsafe impl AsBytes for Empty {}
> +
> +// SAFETY: `Empty` is a zero-sized type with no bytes, therefore it triv=
ially has no uninitialized
> +// bytes.
> +unsafe impl FromBytes for Empty {}

Since commit 209c70953aa (on master, but not drm-rust-next yet) you can
just use `()` as the `Command` type - that will let you remove `Empty`
entirely. You'll then need to invoke `pin_init::init_zeroed()` in
`init`.

> +
> +/// The `ContinuationRecord` command.
> +pub(crate) struct ContinuationRecord<'a> {
> +    data: &'a [u8],
> +}
> +
> +impl<'a> ContinuationRecord<'a> {
> +    /// Creates a new `ContinuationRecord` command with the given data.
> +    pub(crate) fn new(data: &'a [u8]) -> Self {
> +        Self { data }
> +    }
> +}
> +
> +impl<'a> CommandToGsp for ContinuationRecord<'a> {
> +    const FUNCTION: MsgFunction =3D MsgFunction::ContinuationRecord;
> +    type Command =3D Empty;
> +    type InitError =3D Infallible;
> +
> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> +        Empty::init_zeroed()
> +    }
> +
> +    fn variable_payload_len(&self) -> usize {
> +        self.data.len()
> +    }
> +
> +    fn init_variable_payload(
> +        &self,
> +        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
> +    ) -> Result {
> +        dst.write_all(self.data)
> +    }
> +}
> +
> +/// Wrapper that splits a command across continuation records if needed.
> +pub(crate) struct WrappingCommand<C: CommandToGsp> {
> +    inner: C,
> +    offset: usize,
> +    max_size: usize,
> +    staging: KVVec<u8>,

Since it is conditionally-used, `staging` should be an `Option` instead
of assuming an empty state means it is unused. But hold on, I think we
can do without any sort of conditional here.

> +}

This deserves more doccomments, including on its members. But I would
also like to entertain a slightly different design.

In this patch, `WrappingCommand` is always used, including for messages
that don't need to be truncated. While the overhead is arguably
negligible, this makes split messages pass as the norm, while they are a
very rare exception.

Also `WrappingCommand` now becomes both a command and a provider of
other commands, which I find hard to wrap (haha) my head around, and
forces you to pass the command by reference in `send_single_command`
because you need to use it again afterwards. The name is also not very
descriptive (why does it wrap?). How about this instead:

`send_command` is the central path that all commands take, so it is the
right place to check whether we need to use continuation records. If we
don't, then we just send the command as-is, as we do today.

If we need to split, we do it through a private method of `Cmdq` that
consumes the command and returns a tuple `(SplitCommand<M>,
ContinuationRecords)`

`SplitCommand<M>` can be a wrapper around the original command, but that
initializes the truncated part of its variable payload.

`ContinuationRecords` implements `Iterator<Item =3D ContinuationRecord>`.
`ContinuationRecord` works mostly like your current version, except it
owns its data (yes, more allocations, but they're smaller so the
allocator might actually appreciate).

Since `SplitCommand` is only used when there is actually a split needed,
`staging` does not need an empty state anymore, and the code of each
type becomes simpler.

By doing so, you also don't need to pass the command by reference in
`send_single_command` anymore.

> +
> +impl<C: CommandToGsp> WrappingCommand<C>
> +where
> +    Error: From<C::InitError>,

This `where` is unneeded.
