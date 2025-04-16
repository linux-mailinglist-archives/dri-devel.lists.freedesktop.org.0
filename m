Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F26A8B412
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB6510E88F;
	Wed, 16 Apr 2025 08:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yzT+BlZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF3F10E3A6;
 Wed, 16 Apr 2025 08:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Varg9Ix60WvI2G/ht/bgHf8xmx7EVYZYeb/L1WZslDw7gnplGjduWXu3CoVPLAtQsCkkgfAd7rKytArm3qxmsTWu0uDrKac9CKG0fm+GewTG9YZv+kikvMnUDGcUWowTXkX5IZiIaZe6Nu+8F8x/mi+Mi6sy0asjUwT8HUMwufLf48AgiJ+zcxAm6+x7x0t8Rg8AkJMQHGjAQbwW7SJTXetBIlAEsiMnJw8Mb587MXYbRSc+Wh1914RCev8dtjiLGyp9ZxczYJdKeRkvSOtKnl/OPvbEcjvYdJGDSlXIxYMZWeH3K+JU9a6AtXfcHbsEFLKqFCtJHRvQEh/IU/Kqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI2VJJ0W0oj8eUXdkyA7zn8gieozlYBkQxl1CAtRbfQ=;
 b=KhnjjQkOGqyYARqG2g3X3ZnEizHD85xJV0gEiKdmq/KCwcDy5lIzgigSikx45XTOqOyt87Woso725ePDtM26krDGntDF0rLQkCf6dlm55LKFw/G2Rmjl30eQHw0Xpm7vDlxDfdzy8iej7tTFNB+mRJ/rd2vN/poYCp02FnYSGMHsbeKIblJSWVCGVB5gpivqS3so6q3qtwdB7oZtxv3FAf/I5huHPzOgjUIhTn1Kxs4VESmfcCZTC+BqOsW8k7a378WBJHFQRsDQcI6zBcSY0/2l0/671KH8JdmYJleeu/w/UG8/C8ENik1DLY1WCetxYXCQkxaiECpW31Ks8ADezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fI2VJJ0W0oj8eUXdkyA7zn8gieozlYBkQxl1CAtRbfQ=;
 b=yzT+BlZlRDBPhJlncGa1f0XsWSJFCE62lIVnMoOqhpHev9mMehwMgrwAdJBd8HQhCExbnq64nIg/4UyF7xDUVoFRRJsGJbrJjc5xSKsPcfkc+Jvf6vxcJ/LMM/aSwDNvQILA8+066l4khMf93z1YNB3BIgLnIvFdkot6M1bR1lQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 08:39:32 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 08:39:32 +0000
Message-ID: <2047d128-5c3a-4f9f-a55d-3188fe7ea3c3@amd.com>
Date: Wed, 16 Apr 2025 14:09:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: add function drm_file_err to print proc
 information too
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <830a2b61-8965-4193-98de-d462a641737f@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <830a2b61-8965-4193-98de-d462a641737f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0094.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::9) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: bd00b8a1-f71b-4b8b-b948-08dd7cc23556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTF4ZTkzZStDNGNHYkMzOE1COUJlNzVUbjE0WkYrdXgxbUhyUFVDNlBSNUxt?=
 =?utf-8?B?bXVOUUl3VWJkYXNaRXEwSXhkRFNyM1JOQktkT0FvQ3Rob2QxS0pZcEVpdjkw?=
 =?utf-8?B?WWJrMEgyNFArK1lHZ0J2NlV1bkY5ajJ3dmJkY1JKYVVxMGcrcVpzeU9hclBo?=
 =?utf-8?B?c1JsL2ViSzFXeFhoeDJmQnZoNlQxNGlmSFlBNDhxL1BjOXdJRUoxUGRqSExi?=
 =?utf-8?B?eG1naFpsWnUyTVdEU1pVdmVTd3pCSC9RN0xURjhIeldwMlJ1UTBXdlBWUm9s?=
 =?utf-8?B?YUx4Q3hZVTVsV0lnQzFWWnNPeGlyeGU5czJVZGJvR09pVmIyR3pNYlJEUTc4?=
 =?utf-8?B?ekw0UldnQitSMHd2ZDVOZGV6c2hsem1PVmJkZHRCWXdydWNiQnpxSnlkRk9J?=
 =?utf-8?B?MHp0R296OFRZWk9rMTdvSzRvR3hrQlhxTGZ1ZEhNL3pVMkE4a00vOHYvOGNa?=
 =?utf-8?B?WXRqRldjaTR5ZG1WdEpPTUFwVVE5UTVNRmk2SzhQNGNkY2lZaEpLYWo2NjJB?=
 =?utf-8?B?UEg0cGFMc08wWU1mUDlxVXZLSGZQNkEzSTBHN1V6Q1pZWUsyb2g2dk1nZE1S?=
 =?utf-8?B?aW8ySUZtOFhjVmltOHZzQ3hCeUl6UnMwU0JacnpOeUM4TzN0ajE4RmgvV21E?=
 =?utf-8?B?WlI5S3Q1MHFOeGdCMUpOanl2SzFqeDJhQ0c3NG9xbHIreG5OTVh0YnZWTWt2?=
 =?utf-8?B?MjA4aWhZWmFUMVNKTkVGTGFFcnkyWmMzeDY4QXQyanVYYXRoTDdzbEQ0Y2ll?=
 =?utf-8?B?Unh3WWlIUUZPWXdJK3plR0prN0tUU2xvT0pHR0FnTGJlbmdUUWxIQktWb1FO?=
 =?utf-8?B?dm5EV1dZTjBCYXFjYzBnalNiYUpMNko4WGJrQUtVWU9DR2ZXTWRrbnhCK2FD?=
 =?utf-8?B?ME5wMms5ZWkxenlmSm5lYTdkQ25TQ3FPUmErUmVkbkxMbGdCZUhEL2lrN0d1?=
 =?utf-8?B?WUZtYzV6OVp1MUNYM3RYdG1GY05NK2g5ZWZwVXAycHozbDZ2SWs0QnFpU0xD?=
 =?utf-8?B?U0FYa3doREFmbTBOVXoyR1J1WHI2VW9ZdjVCUXh6aWdhOVA2RUlOR1RZZ3F3?=
 =?utf-8?B?ckZTYk9vWEFaQXlpai91S2hsNUp3L1NhQ0c5NDlhcEMyeDNQM0FKQjNsdHJK?=
 =?utf-8?B?MkZ4SElNK0F1YlhvVDZpc2doSms1c3VqcHgzb0FwWXkwU3U0M1ovTVdqWU9C?=
 =?utf-8?B?NkZDNE5qZ0NnV3EweUF1MGFsY0Jha3ZwNmY5MFE1QXBuSEJhZ1hlWGQvamFi?=
 =?utf-8?B?R1dLM1R4a2NWRFhrdEVDMHNQUWhoSnlhaHJyK2c0QVpEZHZlZ2RIQmFmQUZz?=
 =?utf-8?B?YjBYaVNyYzFEWUFySUM1LzNrSnJjYWhRaXZjcnFsNmQ3ZTlJa1MzVmN6aGdI?=
 =?utf-8?B?TVNXa0xTb0N5eTA4WGY5U3NvM0tyejBaeXE1bnBsaG9xVHVKb1lCNXhXM001?=
 =?utf-8?B?N1k5SnRvTFhsOWtaZnE2WEN1cUp1eVFseUpCdzNLY1Z3dldqVGdpSWVIV1Fz?=
 =?utf-8?B?MDJqNEd1S0ZtUjhpSnVUTk5Cei9BblB1RG1CNE5HMmNTZzhDYUhDcDVPeklm?=
 =?utf-8?B?bFRLVmFScVp5NUhMTmMwM1JCZTQ1WkVlY3lXL3F4ZSs4YTdZaWUvNVRiSll5?=
 =?utf-8?B?aXdlbFhZUWxLaXNwRCs3SjFjRzF5UEhlYjRzWVA0akdXZUdsK1o4UUg0RkZt?=
 =?utf-8?B?dE12NmNWRzZuNjlqSGFNS1dmT3dSMjgzUFVPZ2c1cjZDZ05SRlhQL1BjQU0v?=
 =?utf-8?B?Y0c2MFY4Zi9qN01INkgweDdHQW92Uy81TWFLUytCZld5bUZqdkdNZmQzTWlP?=
 =?utf-8?B?K0J4bHZ3N3RYSmlEdG5SOExWbjJJOVlobmdSS2JEQkdqYmt1REVObU04TzFN?=
 =?utf-8?B?S1hwdzl6NzJ4YWlET0t6czZrU0VpcGtIbEExMlBWWFA1YVArUHBKVzI1N2xi?=
 =?utf-8?Q?B39Oehytzx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25BbDJMV29zdjM3NFd6d2dmY1JyQnduVjJua3lZV3JTOGpDTjJtakNTSTVt?=
 =?utf-8?B?NG9yYXNQRUZkUnlSVHJ0eWEyVWNGODRRbVowbHptbzV5MEpJZVpaQWxlQ21M?=
 =?utf-8?B?c2hqNEtPR2xLV29vRGw5eEY4NDByS0V0RWhuM3Flc0twYTZodWF0aWNiM010?=
 =?utf-8?B?cVduRzF0K2g4S0FHQmJibnhqTEZFVVk2VWNTZXpaWDZyN2JwYUhKS2gwK2Ns?=
 =?utf-8?B?OGluMmZIbTdVTzFTSjMyN3FRYnQ4ZS8wU2s4TnNOazdGaVB1cG5qRCtKRTVS?=
 =?utf-8?B?ZHYrZFpTakZHNW81TGlKNWo3YktiUTY1bWQwTWxlWnkvSm11UUVBcGxXOSs0?=
 =?utf-8?B?UjRpWVZabWxqT1M3Q3NaczJmMGwvQlJzSTFxbFIvZzdldUxLZG1ndllKMXpU?=
 =?utf-8?B?RDBZTUNoSHNVWk1pcVF5OHF4K0N0OEtmZWxCVVlnclhjMlhwcjRtL1BRTHNI?=
 =?utf-8?B?YVVJbWt0dk1adCtVTUU1cC9QTjZIMm14blFPMGtBVTRCVGU5MmFKeUF3RGo4?=
 =?utf-8?B?TGpUR0NMY2VUYVBreFF6UFZhRXlTZ1dsR21ibTViNHR6cll5cHhnT1B0blo0?=
 =?utf-8?B?YnRjaFM2djhpczBtZ0dNd0grVUV4amdpVWhLRkNYWWxIZ2Q3L3VyeklNU0lu?=
 =?utf-8?B?OFRMaFhsUG5pL1FBMUlnTUNFL3NBVWppL09iSlU5d01POUp1T1BqQ1hNVjlI?=
 =?utf-8?B?N1lvWDFHWWxyNUpnREw3SU82ak1RSXdyUTYxK04xeFVrUFFZRlhIc1NjaytF?=
 =?utf-8?B?WTZRcFpCeHVvMEhIRHFDV2NvSEd1dlNyZVlLcmxPQWNJWk5hUGdIQ3F5enp1?=
 =?utf-8?B?akhlWWFuR1VFbG9QdnEvaDU0N0lWZlhsQW5WYStSRlBHUThsbXQ1WHhlRWcr?=
 =?utf-8?B?c1ByZ2hmMkE0dHdFTEw5Sm1LQlVkTzV6bzI0NDZzSytyS1FWU1o4amdiMjFR?=
 =?utf-8?B?SXhCOUJvTGxtRzNWTG5TVG1xUEU1cDFVeDdlUjZPS2YwZjZKeUdVaWxrT0lK?=
 =?utf-8?B?UEFuR2toQ0dvN3IzY1F1em03ZFRzdnlaV05xM0FKQURwMkhpSGtYTW1HL2Jy?=
 =?utf-8?B?NmUrd25FK2tmK0IzU01nRmNSUGNTczNjaGxvTjYrR0tWQW81RWZzREVTcVZZ?=
 =?utf-8?B?MmdZVndrbXBhV2hjUkEzUXZsa1dTYUdaRmVFYXZVbUJEK253TmNrcU9wZGhi?=
 =?utf-8?B?K1N2VXdLQUppTjVkV2tDeFNMRGIzOTNmNUdRNThmVU12NEFnVlMvWWRUTDBt?=
 =?utf-8?B?eU02MjNOMjd1Nm1JTDFZOTJBNHNUZStQRXpCclRWN29xaHp5MlRSZjN6V2dz?=
 =?utf-8?B?TVBUN1I1T2liRkhsUStkNTFNWHlCeUJhMk9PQTdGelp2UDRlajFtWlpiR1BU?=
 =?utf-8?B?WFViRW96S280N2pRUjdOQ0RUcHpnSDlCV1ZteDB4SDNhc1Rub3NMRTNLSVVP?=
 =?utf-8?B?WStmbTBwVlI0WkhnbVpGNHF6OGFieHQvbEpNY042NUxBRnNIU3k4T2QrRVJH?=
 =?utf-8?B?NXN6SG1uRy9mbnlmTm1nSG9BNVNEVmMzSnIwRkpMN3Q1L2tJZlpZemhpRE01?=
 =?utf-8?B?YnIrcmlzTHdUcEF2K0hIL2I4bFFxVEdjaWt6S3N4QmZKUmQ4bjhVaVlOYjBP?=
 =?utf-8?B?a0FFZldWU1dqczNtWDE1czdDd2VBNGxnbDZuREZBOTBML1ZaQTZ0Qjh5b2xF?=
 =?utf-8?B?UG1NZnZoM3k3OWM3TkRmUDJNQ2pSdFNBZU9Oc01sTlZ5d3ZkS1U0WmtrUzRG?=
 =?utf-8?B?K3g5N3d2YVNpeDhTZElFaXZFck1IcWtBS0RZSG1ndjJqRzZ0aHpDbUxVQ3NV?=
 =?utf-8?B?QkFrQS8rbS9vT3JQNUNzSm9lUk1uOHkyOUkwS0drMEZvQlFIQXhJL0ZUcGF1?=
 =?utf-8?B?TWZ1ZWJiMlQ2amlhTDdDczUxZ3ROTkZYZ3RNRkZFUnpieFQ0RUxSM3duK1Qw?=
 =?utf-8?B?a1M4Sk1LM3BJK2gyeFg2cWNpb3l2ZWQ4RVFaUlNHMkUyamN2MjJ1ek1MbU1q?=
 =?utf-8?B?UVBqZHZhYytZQVRsakN1NDJSKzVKajhWM1ErcW5KNUxvLzA5SjM5Zmgybmk5?=
 =?utf-8?B?djVFTGdwWHpRaDF2TEp0OGQ3VkFsbWw2QXBNQjRETExBaVNrakh3cUswaWZz?=
 =?utf-8?Q?ip+HExredcROjJYQkXbK6V0Fi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd00b8a1-f71b-4b8b-b948-08dd7cc23556
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:39:32.0271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twwPTrD6/qUdPjiHFzkNw7iSX+OIUOI1/wLBsoRl9Wwkw8KMO6iYOfWQ/ljgNrzxj3q2hfwzFEBDTZ9hZvTP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627
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


On 4/16/2025 12:37 PM, Tvrtko Ursulin wrote:
>
> On 15/04/2025 19:43, Sunil Khatri wrote:
>> Add a drm helper function which get the process information for
>> the drm_file and append the process information using the existing
>> drm_err.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   include/drm/drm_file.h | 40 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..e329299a2b2c 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -37,6 +37,7 @@
>>   #include <uapi/drm/drm.h>
>>     #include <drm/drm_prime.h>
>> +#include <drm/drm_print.h>
>>     struct dma_fence;
>>   struct drm_file;
>> @@ -446,6 +447,45 @@ static inline bool drm_is_accel_client(const 
>> struct drm_file *file_priv)
>>       return file_priv->minor->type == DRM_MINOR_ACCEL;
>>   }
>>   +/**
>> + * drm_file_err - Fill info string with process name and pid
>> + * @file_priv: context of interest for process name and pid
>> + * @fmt: prinf() like format string
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>> + */
>> +__printf(2, 3)
>> +static inline void drm_file_err(struct drm_file *file_priv, const 
>> char *fmt, ...)
>> +{
>> +    struct task_struct *task;
>> +    struct pid *pid;
>> +    struct drm_device *dev = file_priv->minor->dev;
>> +    char new_fmt[256];
>> +    char final_fmt[512];
>> +    va_list args;
>> +
>> +    mutex_lock(&file_priv->client_name_lock);
>> +    rcu_read_lock();
>> +    pid = rcu_dereference(file_priv->pid);
>> +    task = pid_task(pid, PIDTYPE_TGID);
>> +
>> +    if (drm_WARN_ON_ONCE(dev, !task))
>> +        return;
>> +
>> +    snprintf(new_fmt, sizeof(new_fmt), "proc:%s pid:%d 
>> client_name:%s %s",
>> +        task->comm, task->pid, file_priv->client_name ?: "Unset", fmt);
>> +
>> +    va_start(args, fmt);
>> +    vsnprintf(final_fmt, sizeof(final_fmt), new_fmt, args);
>> +
>> +    drm_err(dev, "%s", final_fmt);
>> +    va_end(args);
>> +
>> +    rcu_read_unlock();
>> +    mutex_unlock(&file_priv->client_name_lock);
>> +}
>> +
>
> I was hoping something primitive could be enough. With no temporary 
> stack space required. Primitive on the level of (but simplified for 
> illustration purpose):
>
> #define some_err(_file, _fmt, ...) \
>     drm_err(dev, "client-%s: " _fmt, (_this)->client_name, ##__VA_ARGS__)
I also thought of doing it similarly but that dint work. There was lot 
of code to get the process name and pid along with client_name too. So 
##__VA_ARGS__ dont work as soon as its a function and not macro.
Also drm_err gave me errors and this is the way i find it not 
complaining. new_fmt is a string directly anymore and hence need to %s 
to pass but then the drm_err complain too many args for args to pass. So 
i have to combine new_fmt and args in one to get final_fmt and atleast 
functionally it worked.

Yesterday even i though that i would be as simple as adding a macro.
>
> Am I missing something or that would work?
>
> Regards,
>
> Tvrtko
>
>>   void drm_file_update_pid(struct drm_file *);
>>     struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, 
>> unsigned int minor_id);
>
