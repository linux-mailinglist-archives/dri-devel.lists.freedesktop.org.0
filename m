Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFACBFDE8D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 20:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AAC10E832;
	Wed, 22 Oct 2025 18:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KRfplHYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF95310E832;
 Wed, 22 Oct 2025 18:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuK9YSxMknj6PdXebdJTMBd12R/2L2JEfh02+RPNk/1iQ3h2DJ5x6hCLl46tcjWa/VXYzhyKU1cFCxrZZCd+tWZ8bG68Zi1gb+GwQ5yje7kT9936V3IvrA9qppwBGkm/UpvCjjqa0bGOPz41GP0ehKJyYC641y4W0tCNaWeV3T9xcnewA379eWpbVqT946kKtKosEpHiVxEZIwMNoQ/U+TQHvu8ZuDmhC83xYYJsh6odyE6r4H4T1NJ7nooiB1k0hKHmJbuSGCfCws3AZJBAetmk/+F93J6NpznCWylydA/xoU2rz9Ti3+ZZ8UicmMGnufvy57H5AKtCNf1LJS3J5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUGNAH7bqA7gdQ23tpCoX8wg8+e7fLA/inx/mKsWuxw=;
 b=nmExbDCOORrCKH50HNjsiQUFYLJF7jwU6lqxj3QW8/KsZ+M/VPMK5gO6xqgIvIt9b7G0kSN5ErbcJLXRl3TaCYmJhwzAnzWqXKBOhbCIdOholGE3vt4jK5I5vsVkf8UC/jXMbAOYpRxaw+7mMYiNtTTrWwvNKhhxf6c8ubi+1ye77YqgMN3wJSpu39s07gIbQFWWZ9XaGCWs0+sBAPTljZmxup/EO9mDqC2ld4sMT558UzEILkByuJHHQY3PK5vKwJGVZ5Mdtudm79ZEA9Zy8LNPZiV26iA66LVZPlwD2WNh9pWy2IR8DOUKWjKrYQ46QP2XM+K2KbLquDo0aMtSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUGNAH7bqA7gdQ23tpCoX8wg8+e7fLA/inx/mKsWuxw=;
 b=KRfplHYt8VRl6v7y/7wvPrw7WM7PUR8h/Jgfq9eBfqrZErUb34yxWkO1f0T0XNJb58RfKBLrOWdjkWYUp8FJsdoVSQyVNy/aytLH2PhGA2X9RRIAZdcddUkl0HempJPmkICbklQarMbp+WEqRkc3Yascp/Hj1oStZUENQYjMKzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 18:43:17 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 18:43:17 +0000
Content-Type: multipart/alternative;
 boundary="------------eeaAXuUtHrMy1t0KfqHOYeKX"
Message-ID: <d366c74e-ac0a-4279-88b6-4601a4efaa84@amd.com>
Date: Thu, 23 Oct 2025 00:13:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Mark drm_test_buddy_fragmentation_performance
 test as slow
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20251021164341.6154-2-krzysztof.niemiec@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20251021164341.6154-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: PN3PEPF0000017F.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::4f) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 8987635e-3490-44f0-8150-08de119add15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REpENmlPTnZBNlF1dWRpYWoyWUQ5bHdoa3BYaXJoVGNBbWF5am1WU1NHZW1V?=
 =?utf-8?B?TkpmdDZZOXJ5c3J5aHRveVI3OXhlQXJkRlVqdHJQakpTeXRTUXBiTGFGbWxm?=
 =?utf-8?B?VWUrQmxES1pBL2R6elJFUmpvMlJUM214WUMyUHlZYWozQURxZkFWZ0poTDIx?=
 =?utf-8?B?TDZJTXlHZGhuOTJYalVOSVFKZGVBV2Uzem1LZDU2NTVlOHhyS0FwaWlrbVVs?=
 =?utf-8?B?dmVnNWEzdmhIOHpnR1p6d2tFTTRFbmtKb2tBWCtSVlhRUDh6bkRDMENmU1R4?=
 =?utf-8?B?OC9ZcFJpVXlWTzFpNU16YmdSMnNGL1FJUEZRcG1jTEVnbHF0Z1ZBVkVHeUR6?=
 =?utf-8?B?eEYxMWdQQTEyZ2pNeWlZZ1F0V3dtem9aNVlxdW9jS01lVUJmMUI3NmplVHlJ?=
 =?utf-8?B?T0ZqNEZQVUp2Q0dRM0lTNkx6RFM5YTNQUVh0N0s3UG1PSFJDWXlLREJaYUxC?=
 =?utf-8?B?NjhxVmxMSWJaYUtHYWQ3dElRNkcxclpsd0l5MU9FeTBkcVV4OTJWZStabngv?=
 =?utf-8?B?NnVmZTRnbk9Wd0g0MmhnUzY2d0o1L3VSNGFMVzl4S2VIVFFOYXovWGkydmZZ?=
 =?utf-8?B?VVNXUEtPUlpXWEJRQ1hxeFVVUjZHZFVUSFJSbHZFeXlJc1p2aVhHOG43cmNL?=
 =?utf-8?B?TTdVcnBMcFBsTGRZckJ5bDBTSzBmSTlmMjF6ZnBXemJtNm9BdnoxQVFFS3Fu?=
 =?utf-8?B?czZ1bmdVTzltY0d1YW5SNmZld25qcEs0TTM0QThUb1hDOTc3cUVRejBxckVr?=
 =?utf-8?B?N2pjNDdWcTEwY2lES1JSSFBtZmNhSXhoMGdzMmRtbzRGSDJSSUF0dW5Od2NK?=
 =?utf-8?B?OWo4bTY1Vzdad1E0V01wcUQzblpuU29zMWxERXM0eHJrclBtc2xOcEJsUllq?=
 =?utf-8?B?NGszQ2pXREt0R2tMV3UzWURSTFJwTnd4cFAvR0NDZHhUN09vOEFwTFRiTEdK?=
 =?utf-8?B?Wkk1Z3BUb3c3TlV3a2Z3SFlEOGlIWWJCMlBmTVp0bGo5OVV2L0ZReTQwNGtK?=
 =?utf-8?B?Y1hLZ1cvRFBHTDRoK3pDclpUdHhDWThPOEpBK1JBbXhRVlA1U1FhdVJtNWJv?=
 =?utf-8?B?MnkwYWxPMjVmbE1sY0wrYm9zRHNjZklyaUlHYkZNc3Y4SW0vUFBCOFFTRDc3?=
 =?utf-8?B?U3ppclYxTG9GamZha1ErNVBmd3hXcFFBQnlaS3IrdTI4N2gyOTBicElIZ0k3?=
 =?utf-8?B?dUtNMGVHZXRPUTMvcHY4Tk1leUZIVXQyK0NGWGtXMlcxdnE5dk9Mdm5vUjh1?=
 =?utf-8?B?ZjN2YUJNay96OUJzMU5PelRrWmZRcVFjcGRnSjFDSlowR0FDNVNjbk9hdENY?=
 =?utf-8?B?WWZ0TUlSekh0NDBYbWRxZXlVVzRNbmJGNEFLdHJJKzNSMDFjWkdhajRJRWNz?=
 =?utf-8?B?VjBmQjJsMm1SbEJPK2JnZTJxSHhETThpZG9zMkN0ZVlqdFRsdFVKcmJZWnpk?=
 =?utf-8?B?L0cyQktRQ05kSmJzaHJYSGQzbU1QQ3JobVNDTUFSSHNZMU83K2dtWitpZFNL?=
 =?utf-8?B?S2p3VHNnR3BZWkZhSXBaekRQWTFwWTNoRURVWUJ4UFNNZ0YwbEtDWC9zYnho?=
 =?utf-8?B?dC9EaE1GWjh4R2t5MkZqb3I5NU8vSTlzN0tKbFJsVjNZaE80TGl0VHRvOWVR?=
 =?utf-8?B?dnNCZHFaU05ZVXRmc3VtelpZU2hsQldMSFFRN0lwRUlTRjF2S2Y0VTRyaGZ2?=
 =?utf-8?B?SHVFdlRKencrUWZNcThNNjVjSGFMQ0grbU4rMVJRVTBnRDgzUUU1dWM1ZTkr?=
 =?utf-8?B?aE1jeW9xSTJzK3FEK3RCNEdqaWpWTjRCbWN2aUlxanNnZ0E3d2srd3VGSWVK?=
 =?utf-8?B?U1Q0YXBiY1hvNVlnSTM0Ti9LY0QzMmZDTGNaK0xSMmdNMXlIeGY4UVFsbmY1?=
 =?utf-8?B?R2pEMmlzMDhqUDgyT3ZKZHJnRFVFa1pVaXA0MTRzTnp5SHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVCMkpQbHZ0UitQdXMrYm1xOU9kT3pDTHlwV0YxeGpmQldsSElLSjVQYXI0?=
 =?utf-8?B?OC9nZ2hjSWRKUGg5M09RdGpDcVF5TTU5QmtHWVdLRDVSZkxFbGVvaG1GSktk?=
 =?utf-8?B?dG91VG5SYXBqblNjVXI5TVNPTEY4dmhHQ2tjUVZ4MFVtclQxbjl4K3MyLzJ4?=
 =?utf-8?B?ajd1eEdiN3JSVlgyOE5nbXZ4K1FzWG00UWZySGsvZGVXei82YXlFVlVJendw?=
 =?utf-8?B?b3FEbTNuandEcVRBS0dEUzJsa0swMHMrd2IrcUk5K3l6akc3U0pwaDYzWUpF?=
 =?utf-8?B?aFgxUFduMXdqWS9kajVEbEJvS2p2STR5bnQyWHcyTDR4aVdsY2dEZzJSK1VX?=
 =?utf-8?B?OEdJeTVYQUdYV29RWms3Zzg5andFbzhMV0FEZEFIdWdzTU9UZ0F2dzN4d01n?=
 =?utf-8?B?RVZRTGt0cXhxUC8xT3p1V29VMTA1RncybXVSeDFjNHZwWjZFQ0xEVmc4KzdR?=
 =?utf-8?B?cEswRFhLR2tHOVdSenY5NktZTUdGQkp6OTBjajZMWkJTYnI0dDVUeEp6Y2VI?=
 =?utf-8?B?cGpsb1c0MmNKYnNNMWRSRVZEd1VGTHJVQWdJb1pLUEVrKzJRdzVkdFIrQVRI?=
 =?utf-8?B?TDBHWU02d3lpWlU0RW1VK1Q4OWlJVS9SWFVtR1ovbEpMMFZDWUdrYUcyZWFy?=
 =?utf-8?B?bGhJcXBiUnBZc05yOFFMNmQ3aVlmR01QV0pyamVNclcyeGpZa2pJa00zdDAz?=
 =?utf-8?B?dmJqd0UyRjV2UVdaR29nenZwbXBXMUU3M2FWb3JkL0U2alhZNlNObllzcFJX?=
 =?utf-8?B?bmVDUStrU1U2ZGhiWE1rVzV1MmZ4WEZHVmR5TnF5TWU2dCtVQmpNR2J3N2l5?=
 =?utf-8?B?bWVxSzNDeGpSUEsrVy9Wd2hKMWNUbnNBdUlmblpiOWYyeEptSnZrbG00R0ZH?=
 =?utf-8?B?UW04N1R1WmJFRXNIaDIvVHRQeGg1MmJUVTQweXhOdlU0RHg1aDNxTFk1cTR5?=
 =?utf-8?B?K3oxaFhuVTNGaE95SzRPMFZ2bXJJV1p4Zm1va0tBRlFKbytFc2RsT2dEU21Z?=
 =?utf-8?B?TkpYUEljTkF1amFoSjZaSlBZRzlHZFRJRk43Z2RmV2ZCbVJWRWtROHVBa0hw?=
 =?utf-8?B?YSt2VWRLVzlkTXFOUlBUMlN4MjlWOWVuY21vczVjdHhtK2ExQlorUnMydmp4?=
 =?utf-8?B?blFhNnhhVjFqeFJGNTN6emhaczVuZHdLUHQvWGlFZ0s3aithekd1M3o5L1NJ?=
 =?utf-8?B?K1VOcW1FSVczaVp5TkJjM0xzWVJsNGhnT3V0R3BmbkhlMEhpV0dLSERKNGxT?=
 =?utf-8?B?RnJsR1RkUzgwUmR4emJrSTdwSWlEMExmdll2Vk5vU0lyc1RWWUtMSXVHb3pH?=
 =?utf-8?B?RmV0Ui9hSjJiQ3Awc1hSZ1Vib2lwWnNCRWR2aUM2dUNjWTFZOENUZ0phQTNn?=
 =?utf-8?B?L1VGQVJjVWhmakx5elVCNFR6U2NSVXN1NGxRSnlWbHdjK0J1LzBPVUJKWnhC?=
 =?utf-8?B?ZHhkUWx4S0FBaUpOU1E1M25KUExWM0NVbXV3NkdxWXRPYkhoNVY1QzJWS0hW?=
 =?utf-8?B?cDVvT3NaSG1TQ0VWVW1OQStDWHV4R3lSSHNLTjA4U0Y0S21QTzI0clRNWUJD?=
 =?utf-8?B?MXBBSG5NL3dsZkErdGpRMFdtaStyMVNXYldsWEx3Q2Nwc25ZZEt0UnFPbDZB?=
 =?utf-8?B?RTRtVGcreDhHb0lrOXgzOUtrNkxRbmU1dHlZRnl5S3N6YWw1TVljYml3L2Iv?=
 =?utf-8?B?c0dxZ2xiQm1XS1NEVDQrMWJzVmV2eFZxRWVtRXNGM3dGZnZxYnBvWWE1U2FV?=
 =?utf-8?B?Yjc1TitBd2xlWWd6OHhqd1pOdjdPNzZWbjEzZldHNGw2THJuRVJVOUVKYTlK?=
 =?utf-8?B?QkhOWmU5S2hvUzdkN2xCMENIN0YxVU03YUlrMEFYSFN5dWx4QmY5TVRmV0ln?=
 =?utf-8?B?MW9lQWt4dXppNis5TXozOHMydkEyQnk3dXVtRHMzbVFqbTJ2Y1pzRklRVU5l?=
 =?utf-8?B?QzBGU2Zsd3ZiOTQxSmZxRlMvTDVpVEtVeFA0eC8zc0drdXhBT3F6NlVwcUVq?=
 =?utf-8?B?NzgvSXpaNkdIOWFzR2prTE1ieXJTcjhPTjZpRFp5V2ZYYk5vN29zV2RDbUxU?=
 =?utf-8?B?VmNEQ0FGc0tObnNVOW05ODAybW5aWCtKSXJRYWw2VHBTellQLzA0NERqNkd2?=
 =?utf-8?Q?UjkFVi6wUiOVnZsakzlNqmWoe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8987635e-3490-44f0-8150-08de119add15
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 18:43:16.9984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxZ01n4zLLJHo/Qfww308L96mJz0C5hlswS22Gmg3gCtfr9N+y44gz5ZY7JxGXD0TLGA1SQztWaZ+Nq5NuEx6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766
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

--------------eeaAXuUtHrMy1t0KfqHOYeKX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>


Thanks,

Arun.

On 10/21/2025 10:13 PM, Krzysztof Niemiec wrote:
> Mark the newly introduced drm_test_buddy_fragmentation_performance test
> as KUNIT_SPEED_SLOW, as it might take more than a second on some
> systems.
>
> Fixes:https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
>
> Signed-off-by: Krzysztof Niemiec<krzysztof.niemiec@intel.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 5f40b5343bd8..672423af7c17 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -876,7 +876,7 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>   	KUNIT_CASE(drm_test_buddy_alloc_clear),
>   	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
> -	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
> +	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
>   	{}
>   };
>   

--------------eeaAXuUtHrMy1t0KfqHOYeKX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Reviewed-by:
      Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Thanks,</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Arun.<br>
    </p>
    <div class="moz-cite-prefix">On 10/21/2025 10:13 PM, Krzysztof
      Niemiec wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251021164341.6154-2-krzysztof.niemiec@intel.com">
      <pre class="moz-quote-pre" wrap="">Mark the newly introduced drm_test_buddy_fragmentation_performance test
as KUNIT_SPEED_SLOW, as it might take more than a second on some
systems.

Fixes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095</a>

Signed-off-by: Krzysztof Niemiec <a class="moz-txt-link-rfc2396E" href="mailto:krzysztof.niemiec@intel.com">&lt;krzysztof.niemiec@intel.com&gt;</a>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 5f40b5343bd8..672423af7c17 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -876,7 +876,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
-	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
+	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
 	{}
 };
 
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------eeaAXuUtHrMy1t0KfqHOYeKX--
