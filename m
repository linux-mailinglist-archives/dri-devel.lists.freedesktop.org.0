Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5940AC4698
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 04:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3852710E112;
	Tue, 27 May 2025 02:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rPcHb6ya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75810E06F;
 Tue, 27 May 2025 02:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huu8JeGlXCAqui8UXl9UXLU5zQGkSmfhuXsqkIvBgbDviN37dyE6WRKvwOu/i/OB+4am7feI5Qx4gsG1AiRa3V9qqL/fdI8zdWsVOrH/yfS5tSRiNQ4JPoR6FFZtevT3sYeYAo0C21sE8Xi62ncu3GOqYzPWKQjDneApusclq+NLbywWwsBfs00Adm1M63pMnYwwR91Z5u+/jaH4w+MKmp3ZXvBkwW2XTZdPpo7nhMQ/RGEQH16Lq/A5q8YMHtwhYBDAj+lGq9B4HbrCjgFNMwvJv4Foc60IVP8sIF+UQTkhYrzNoUvkGpp8J2tTp0ZwG54F0hlDYln2P3WRuCDPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3hrBNnIjYHCu5yFMDVB2fgij9VoKrK22JEb0XSd4S8=;
 b=RAFDOoiSbU+dh+OH6THzyqb+cow6cIgF9TpXlN7czvk5X+Se8+erTCiMRhJwPPJJAyb97KEbm2oFshd9RGkiptrOf7rqLmWjAzOycWsN19soJh3t+PXCPHphlE4ngcB/E5MVecOuPH9J0Xl5mGeX5b1ycjQI4bWEFk5v5F5hmzQaRJ/8gYILnCdeiFuUlQHCfulTW9teUsatS5J9BgFMOc+o7J5D54BxYBi6kHcobdFgsEZ5BNRr/yEYA4LpGVjMXpr8GU4qKANjjPPQ2noKDz+h1CWCaCxEmv8Rf4Av6aIboWO6zCpve6ZfSnwOSohZB187L/UOdloPsKkHxRdjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3hrBNnIjYHCu5yFMDVB2fgij9VoKrK22JEb0XSd4S8=;
 b=rPcHb6yask8KCFnfpy6pFETpRWjnTe0bfXpPIGUtpa6pbsSHYgintbe0J5BS/7xO9BFaf/o6ikr31OaE5oBQMeikjszx8ZaawEm8Q/05ZaLyIa6PCYfgt6XVgmQGYGW6wjGixqT/ZfKEr2j0BbLwhIUfwmSyjncYwETMR4rAuKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:b7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Tue, 27 May 2025 02:50:50 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 02:50:50 +0000
Message-ID: <f4fa1065-ff9e-4721-9f5f-55a87faeb6c2@amd.com>
Date: Mon, 26 May 2025 20:50:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/amd/display: Adjust prefix of dcn31_apg
 construct function name
To: Leonardo Gomes <leonardodasigomes@gmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250521135851.11110-1-leonardodasigomes@gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250521135851.11110-1-leonardodasigomes@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::25) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: fab3c82e-82be-461b-358e-08dd9cc949dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUg5VEt4UGE4b0prZ3IwL3BrbzBQQ3E3YjZETXZ4Q3BObUlldTFxZmlpazlr?=
 =?utf-8?B?ejgyMy92Z3hMWjR0dEo0alRPZUpva2ZEZFA2b2MwZGJyVVZWT3l0M1d3UGJ4?=
 =?utf-8?B?eWxzT0h0TldkbnZtZnlha25wUEFETlc0REV4RFh3Mjg0WWlXdTdueGoxVDFN?=
 =?utf-8?B?WW9rSnBQU3ZJWVpGVEJPREtyWmNCVDRlekFzOXg3SW80RzZocUlCZTJ0YStM?=
 =?utf-8?B?Z09mTjRra3FPTUpQa3YrU3prQzRGVDgySWxRaEttNjdDdWszdjdRUlRORlNJ?=
 =?utf-8?B?OTV5b0ozQTQxZklxUkRzanU3dWRkZUkwUUIrM1pQamhsRUUvM25xYTdXbEp6?=
 =?utf-8?B?SWc2azl4RzBmZmJYSkphcWJnN1k0WEFWSWFTOUIya24wYTdZZ3lEV3RxYXd1?=
 =?utf-8?B?TmxoRVlYdXNCOW93aTM3QUdaZ3g0cXdMRXUxdU5HZXhIbk54UVV0eUl0QkVX?=
 =?utf-8?B?ZGVFb29nSHBENm1zSnBEeVluZUgwT2NMeDVMaDhLTkE2V0YrMHdnSE1Hc0hV?=
 =?utf-8?B?RGJFL0JINk9TRjFHdzFUejcwUnk3QStvRmVNQlJNWTMvWWlXRjFVYnZYQ0w4?=
 =?utf-8?B?a1hML3RwK3JYVUhuQ0hTMVFHbkl2ZnlLZnkwK3g3S0ZQU3pEUWZydnBubFV2?=
 =?utf-8?B?MDB3dDZuWHh5TVpLOEMvdjBWaDF6eEtoRDhrZkNQaHJKZHpLeTdBekxJbWcw?=
 =?utf-8?B?bzJLMDVvajhQVU83YXo0ZXJSeEQ3MThBRXJvdGpQS3plUFh6QXVQTGIvNlky?=
 =?utf-8?B?UitOVW5LNUpDNy9mbmhob05jZEI3bzRhRU43aExHbVlPay85RVBBdzFFNW1Y?=
 =?utf-8?B?ZnpXSXBhY0U0b1JRYkh6d3lMTVVzZFY4ZlFick5Qc1hDa1I5TDcvNVRMcmhW?=
 =?utf-8?B?M0lMUXNERmlpT0doZm9yc0grT3k2Q1c3WlUxLzdyQkpUbkdocUxqQXo1b3Nr?=
 =?utf-8?B?NDNKeG5TSnNOWDhUcVM0eTRvMkVVaXRSMXZ6OTA3MEtMU1Bvd3ltSGtzYWFM?=
 =?utf-8?B?U0xHRERHNE8rMEYrcEZVNnVHUTI4QklwZmE4T0xuUW14UUtzVmMvMDl0SDN5?=
 =?utf-8?B?UUpsV2s1UkZaVU9FaTU2TUxXSU5iRVNIeUxYb0dOVWFMWFB5WXE2eWV3K25P?=
 =?utf-8?B?ZWxJbWJHNXN0Q2dINThCMzFyMXZFOERzbUxkbGVvZUVMRkdCWXVPamZWRVRp?=
 =?utf-8?B?dUw2YkFhaGhZaDhKYXd1cC9NYXc2TTNYbzFBNmNuUFFlTFZkekxQTC9MTk0y?=
 =?utf-8?B?UGlrWVVjTkV1TEloeVZMeXhVVDlQQitxWW5sOCtHTVA4SXpYcXBieTVDMEY5?=
 =?utf-8?B?djkyK0xDV3dST0dBOGFzaGRHQW5GR0NNK3NmNi9paW5YNkpvOUhxWlVxamg5?=
 =?utf-8?B?K0R3bjN5c1oyZmVRcERxV01TUWQ0QXFXeU1veUI2U3RHV3NEUTB1ZzYrUzF4?=
 =?utf-8?B?OVVYa1lFUmxuTy9ueDZLanRidThHV1VQL2duYnowOURjWldvYjVEaVd0T2Rh?=
 =?utf-8?B?UW14cGhmRTUweC9VT0RjUHJTc2plR0paM0F5ZS93cGxaUG5XblVyQTlwYnRa?=
 =?utf-8?B?RXg0VWo3cU45TVBpMHRpWGpDbzY4V2Vyc3had1BrNDVSYXBGa2lYWXRHVjdp?=
 =?utf-8?B?MmxyQU4vR0IxM25KUDg4MGJaL3VBckxqRWVHazh5dHhlYjRRMzBNb1A4Q0Fk?=
 =?utf-8?B?UUYxRUlqMUtuRjJMU3kzdGZ2MldheDl2TXdKaXlLcFZVVVN3bW1vcUNTc1RT?=
 =?utf-8?B?a2hOVFEyMWJSZkpjZHdyYVIxL28zVzVrL2hUeC9KT0x0amVGVWNOazZGeUw1?=
 =?utf-8?B?d2NZM09hRHJxbnQ1VG5IV0gxNldQREprTFp1QVphd2xRaWdrTFpBQ3h4MFhD?=
 =?utf-8?B?cVIzcTBKYm9iT1lZTWZYYTczWCtXazJsS1Fid1lIMmtMZDdodkZXamltbmVu?=
 =?utf-8?Q?6L5KxgsmOGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dESnUxVmp0S2RTclBjRzBZRFBqdFdXVE11Zmt4eWZJREk0dS9xL3I4Ujk3?=
 =?utf-8?B?aGEvN0d6bnA0TitTU2xoMlpDYkpzaml5UjBMWHpOcTJBT2NCem1sekExSC9n?=
 =?utf-8?B?SkRvR3M5S2k1Mnh6K1NPVTgvTStlU1RUNmFPRytCT05UMGNYcFBwUkNWK3pU?=
 =?utf-8?B?TklYdE0xODd5SnN0bGc1RnVldmpsVjB5TG5NZXNqeTVaZWxDTHV0UXljTzlG?=
 =?utf-8?B?OWQyVFpuZ3NjQjFnVUdFMGNNK0U2UU5FYlBYRDZ5c2tibTdHa2svdXVIeTMw?=
 =?utf-8?B?M05GK21JRG13MnFKSFFtR1E2SFNjOEZiTkhOcnB2MGgzUXZTVlQ5ZGR0N1lv?=
 =?utf-8?B?dFlDRGlLWXRWdjQyaHd4YVJ1V0NDdWpoU3BXdWRzRE5zQVBHZnRMaE1aNVh1?=
 =?utf-8?B?RXIzdGg5Z2pIQkFJc0JOaWFVMXRURFRMcFZyWUtvYVk5TTRYb0JqY01pU2Fn?=
 =?utf-8?B?czI4SzZmVW9SdUx5aDJCUjJiYXhacTRvMlV3RlJqMXN3NEdKWHdNaXZwWnUr?=
 =?utf-8?B?Q3F3eHMyVnlvdGpqaHBJOEhaQ1V5YjI2SUlLTTNXaHN1enl0Z3JyTG9XU1Bw?=
 =?utf-8?B?SnNQQzFRUVYvbEpNWkZjL2lnWmxXRWRjSlJ0VFVVaXBZRnBDNG0rbHVTYjRX?=
 =?utf-8?B?OG1KM2lFZGY1Z1RXa29TbjZ1d2x0eWJIVnhKQU9wcE5mRTVkRXFRUkZlWmxn?=
 =?utf-8?B?Rk9LbUZYQlUyaElNWXNSU1ZpWTVlVFl6Yi80cnZNUHpSeDJHa2xQT3RBb3Ay?=
 =?utf-8?B?dU5HNTExV2gxSmNRc01Jc0xtUlV4eFozcHFoVDhVdDRBM0x0UW1BT0ljQXdK?=
 =?utf-8?B?aUtCTStaZUxsUnc1SkhZUkhhRGNuSWFBV1hPMFpuRnFxdDhtcko2T3FrV2VX?=
 =?utf-8?B?akRPVlV6VHAvQ3l0dzVqaGtiQjdtQzN6OFlWVWk3dHRQTUd1RUxYNWNoMmhp?=
 =?utf-8?B?QUFMam9ONU1RSjV6NldsWGJWWkZzSmpjdm5TTDhGQUcvNzZTRDhsMXlPMERQ?=
 =?utf-8?B?eEowbEhVcVZrVG91UWx2VWU2MnNFVm5vN3BJMHFhVUZZcTVCOVVMSXdlUExp?=
 =?utf-8?B?djlSa2M4NWh3UXNKZXgyYXpRdnc3dFJsZkFQNkxpYitTM2ZsaXdQMFQ2RnV4?=
 =?utf-8?B?a3o0UlpmR2hnYUtsRXRVWklUYXJEYjZaZXRNV2wrRXRIb3NzWXM1VHYzRitl?=
 =?utf-8?B?WjRCaCtXRVVBcEg2eTVTVTEvQk9IcnJDMUVraG5vOGhsRUEvbzAwZnIvVXlh?=
 =?utf-8?B?N1MrZjJmbE5oSDJLRysyTXNhU2daa0xqa2RTUjBEM3pVRUZGbHVNSjUvdnNV?=
 =?utf-8?B?U0RTUnNLOHRpdE5Lb3FQVXhIdENlVlFwdnUwemR5V2djL2JMVEZ3dm9KSW5K?=
 =?utf-8?B?UG16SnVFaUpwajVOd1FpUk1Ic0IrdnlFWm1SRHlvSFVIcTBVeWNZTTA2T092?=
 =?utf-8?B?dzMxVmVrVmJyTHN2RzBqTkZaTk5keTV0b3lmWGNobksyQVo1VUlraUNjZW5l?=
 =?utf-8?B?V2lDQkc2bkJoWXBaNmdjUlZHdm5iRFliT1lCeitnYWJSamtwNnhvVVVSc09B?=
 =?utf-8?B?VTdKSnZGQUFhOGpNZzF5alVWUTNuWElrUk1JclhYcWV6UVBMdVBZMlVSVXRy?=
 =?utf-8?B?SkxLK1BtMS9sOVg1UTdlRUs3Y09aWnJXaTNXWUhScGpDK0JzWDVhTHJsSkdM?=
 =?utf-8?B?c1QzTUpBY2ViTm56aS9ONDVzcHRBVXVLVlN2aThLekUwdnBRTDlRdi9OaHE0?=
 =?utf-8?B?RjdPZTVqSHhOdlB5WVNwUEhOK3M4WFArRVhkUG56NnJRNmpuWGJBNzJyYzhy?=
 =?utf-8?B?WFEzM29BOVJ6TEFhT1BtUzB1a28zUjZ1dStJbmI5enJBVjZhMjdiWVlXQ2M5?=
 =?utf-8?B?Z1M2S0xqSnFqR3E4U0FUUE1ONUpiR3Q4SThQVUgwZitrMkpWOC9VaWRTNFkw?=
 =?utf-8?B?WU5FWFpwaEN4aGRva25oOVpYcERjdkw3bjJGMHhUL1JNRTJGTDNFU0hOb0d3?=
 =?utf-8?B?bWsrMUdsWm9uY0dQUE9RcjBlWk0zaUFYeFZhMUF6QlVRY29yNTE4WVZ0cVgx?=
 =?utf-8?B?aXJKV1ZLLy9VamxIVDVxOHZCTXB3ek9uYnErOEdvQXlRRzZWL3RjRkZBVHI3?=
 =?utf-8?Q?A8zGZ4oDM6tMDbPBgw+FhkcEQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab3c82e-82be-461b-358e-08dd9cc949dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 02:50:49.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMbTmXQnhuMWc24qsQ0we2+pDvnKiKWVX/f+o5in7LFylUa5nhJl4tY0MB7lmYeyvLSVqhH2h2CF13WcKiex2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661
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

Hi Leonardo,

Thank you for this patch, but unfortunately some unit test suites depend 
on the names.

On 5/21/25 07:58, Leonardo Gomes wrote:
> From: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> 
> Adjust the dcn31_apg construct function name from
> 'apg31_construct' to 'dcn31_apg_construct'.
> This helps the ftrace to detect the file by the function name.
> 
> Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
> Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
> Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c                | 2 +-
>   drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h                | 2 +-
>   drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c  | 2 +-
>   .../gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c    | 2 +-
>   .../gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c    | 2 +-
>   .../gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c    | 2 +-
>   drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c  | 2 +-
>   .../gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c    | 2 +-
>   drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c  | 2 +-
>   .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c    | 2 +-
>   drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c  | 2 +-
>   .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c    | 2 +-
>   12 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> index 05aac3e444b4..d1ccc9a34b2e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
> @@ -101,7 +101,7 @@ static struct apg_funcs dcn31_apg_funcs = {
>   	.disable_apg			= apg31_disable,
>   };
>   
> -void apg31_construct(struct dcn31_apg *apg31,
> +void dcn31_apg_construct(struct dcn31_apg *apg31,
>   	struct dc_context *ctx,
>   	uint32_t inst,
>   	const struct dcn31_apg_registers *apg_regs,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
> index 1b81f6773c53..54c6b62195c2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.h
> @@ -100,7 +100,7 @@ struct dcn31_apg {
>   	const struct dcn31_apg_mask *apg_mask;
>   };
>   
> -void apg31_construct(struct dcn31_apg *apg3,
> +void dcn31_apg_construct(struct dcn31_apg *apg3,
>   	struct dc_context *ctx,
>   	uint32_t inst,
>   	const struct dcn31_apg_registers *apg_regs,
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> index dddddbfef85f..b3553ae26d7c 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
> @@ -1207,7 +1207,7 @@ static struct apg *dcn31_apg_create(
>   	if (!apg31)
>   		return NULL;
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> index 26becc4cb804..be55a3c36a78 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
> @@ -1263,7 +1263,7 @@ static struct apg *dcn31_apg_create(
>   	if (!apg31)
>   		return NULL;
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> index 6c2bb3f63be1..b9847b4bb0f3 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
> @@ -1205,7 +1205,7 @@ static struct apg *dcn31_apg_create(
>   	if (!apg31)
>   		return NULL;
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> index 568094827212..b6cf2a296ab4 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
> @@ -1200,7 +1200,7 @@ static struct apg *dcn31_apg_create(
>   	if (!apg31)
>   		return NULL;
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> index 2a59cc61ed8c..66fef6f6000e 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> @@ -1187,7 +1187,7 @@ static struct apg *dcn31_apg_create(
>   	apg_regs_init(2),
>   	apg_regs_init(3);
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> index 38d76434683e..9be23da216d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
> @@ -1170,7 +1170,7 @@ static struct apg *dcn321_apg_create(
>   	apg_regs_init(2),
>   	apg_regs_init(3);
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> index ffd2b816cd02..27affafb14f1 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> @@ -1252,7 +1252,7 @@ static struct apg *dcn31_apg_create(
>   	apg_regs_init(2),
>   	apg_regs_init(3);
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> index 98f5bc1b929e..d5341b0d59f3 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> @@ -1232,7 +1232,7 @@ static struct apg *dcn31_apg_create(
>   	apg_regs_init(2),
>   	apg_regs_init(3);
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> index b6468573dc33..6fb2261c554d 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn36/dcn36_resource.c
> @@ -1233,7 +1233,7 @@ static struct apg *dcn31_apg_create(
>   	apg_regs_init(2),
>   	apg_regs_init(3);
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> index 7436dfbdf927..ef4d758bfb5a 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> @@ -1162,7 +1162,7 @@ static struct apg *dcn401_apg_create(
>   	apg_regs_init(2),
>   	apg_regs_init(3);
>   
> -	apg31_construct(apg31, ctx, inst,
> +	dcn31_apg_construct(apg31, ctx, inst,
>   			&apg_regs[inst],
>   			&apg_shift,
>   			&apg_mask);

