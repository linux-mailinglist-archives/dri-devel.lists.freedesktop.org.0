Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB6A2770B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 17:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29D610E6B5;
	Tue,  4 Feb 2025 16:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="umBKj+il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0923310E6B5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 16:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRx+mmdkkafbuLxDTvw7xC589ryTc0qiPV14620q5vJrHZ0va3w3kVKxG4+Aus558LMRYxkRi2/qdsO4f4yP1Wuce0ecraDfHi/kVd6ZPePONPiaHcqRHJYXmt9pMEtfAyDKfW+oZHG4KP2UekPtjDJ/HH30AK7sAirls/Qm8kjlZnDKw7WMq/IEQpUdHIFf8NXDjoyR+F35+xbl8oXWkhiWqTHEj7YgSUbUpxQj4PU8dxc+ORpGpUTr7mX9mGlx92zL+OGps4/Iw9u1iVc/F/PXlb3UGlNVWBpYhrBmw4ysZ7MnMyCeNZh4Y0eXkH0mU1gMZSvvRl2HQdV6ieRQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5L4RRByfcqI6wZRwnmeQP7JYNsGdG2r/190Dha2bvg=;
 b=wSs5fwpR4MIb8sGCk81/D6jFsMiKRyr1OI2MdZm4UQWCKJQrTWtPWtREbAfqYYE1dc2IubNDZvuOtRUyThRef4ZGjNM2biWFO6ioOr1WmAZ8SDb5Yur6bsU4m6YujeaeANMPgrjrIcFGShIdLG8hs+Bce6Llk7/HkguTmuUD/gc5xuG7ORW4eXEhcJ3Zp/mGSj8fgF7F3jt6MONZpoQtfqgw5Zf+fex1dqrRBqx8HUUt6wKAoCjxoeqYauwRGWbp1eQcbgZSV+TALZuvkASEEG2PBdFhGwWha5J3/KXfUUR3Z9v4U3PZ51GE4Ly3JOj/b5y5Ize/6xQFzgIGh4A+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5L4RRByfcqI6wZRwnmeQP7JYNsGdG2r/190Dha2bvg=;
 b=umBKj+il5wDJ2QwrH/Q0A8nMUCnUhpC3IleQ0JgmKYfzpbfLCvpxYfObEyVMqiXCzRnovg8DzITpKJCkTzgpQ8EHaGbEuTabZmoSgIW2HLqzKXYxAmG3/qHobFdFvZLpcMC0hudZRyCnkvrGKJbJPUnkuFnYomoNbxIS0zDa9uM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH0PR12MB8578.namprd12.prod.outlook.com (2603:10b6:610:18e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Tue, 4 Feb
 2025 16:21:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 16:21:58 +0000
Message-ID: <d068fca1-2c08-42f0-adbf-cad5ab8d5e82@amd.com>
Date: Tue, 4 Feb 2025 17:21:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] drm/scheduler: Add a simple TDR test
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
 <20250203153007.63400-4-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250203153007.63400-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH0PR12MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd258ed-cbcd-4300-2cac-08dd45380c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUIzYmlmS0ptcXNmY0hUOHF1bUxOd1JtK016MktjL1B4QWc5czFEKzc1aGE2?=
 =?utf-8?B?M0dRbXhKQWVSQjVvV2FOM2N6SjZwbDBab0JGYVBjS2dOVTRQQUZzTmk5OHJu?=
 =?utf-8?B?NUFpdnBid3FWczNYSjQvUGsxRGhSZVQ2S2ZHR29tNThFVHp6L21FN0FJWGNt?=
 =?utf-8?B?NDVpQWZET1h5UzFIcFAyNkRnb3ZuczRjekRxYm0vbHg0Q2pPUExaVXV5d2wx?=
 =?utf-8?B?T04wRXZwREFnUWQzN3M1aGlMbmo3eHc0QUNZakJ0OUl3R1BrMlhKRUd6ajdt?=
 =?utf-8?B?QzBJVXYwZG5tbFRkcGpyWE1xaU5wd2JRb25xQWg1cStudlBUb2VrUmNweU1i?=
 =?utf-8?B?bDhwWGdMN3RTdlRBRytBTGJ2dEl4M3FuNU9kVzBpYXcxeGovMDZTRmNrdnVH?=
 =?utf-8?B?T21NcG56enRNYlY0SUhhM2hFR2RRSytlTG9nZjNQOUtpL25ZUmVaTkVIRVVP?=
 =?utf-8?B?UkpJTldXbEo0TG56UTNnNS9KeTlMY3o5MGZkdGxPTkdJWm5hTGNvQ1hQci83?=
 =?utf-8?B?WUtDSytpdWFSN3JLOWNLNE1JNWFqNHpRam1Ba0grb3NRa091UUZ0ZkVWRzZv?=
 =?utf-8?B?ZFpTazRORUJGVTU2ZWMyUjhPblhaRmJDalNyU2RJanBWWWxLK0dxaGV4M2Rk?=
 =?utf-8?B?WUdENTc2SVlJclc5eklkVlY0bGF3N1J2Vm9kOWhteEZEVnFNQ0dTanUraXJS?=
 =?utf-8?B?RGZ0dmVSRUZVTEoyWk1rblNBTkFmWHVSdm5lS2tPamRUWmd0U1hTZjNpelZK?=
 =?utf-8?B?bFBoRjMyK3c5NDQ1TC81SHIvNkludkNBTmJ6bjQwWlRQZnh2cWZmRUt3SUJ4?=
 =?utf-8?B?WEZhdUpWVjhqNlVZTWQydy9iT1hhNjN1UjRiNVhpR2JYOGwrWkozZ1JNTHph?=
 =?utf-8?B?ZHluTHhqTjBHRnRGc0l3VTAybWZ5R2J2WFM4dWF5eXpkSFd2L0czbHZkTGt2?=
 =?utf-8?B?U3Q5WWcvUkJnNjI0VWhwQzZWajBNTGRSakp5SG44QTJRZXVteDlqYkJDeGlh?=
 =?utf-8?B?RmFndUNVY0owVVAwWjVvcDl0STFYWW05WUtWVEwxaS9YL0xFUTE3YzBSTFJt?=
 =?utf-8?B?bVlOalBCeU5tVlR2L1FKa2ZjY1p6azFYbzVBYUpxeDczd3l2a2tDTGVGMTFK?=
 =?utf-8?B?SGlLY2UrMFhBZy9GaitWSlJicUJNeVlNbDRYeGlzYVAwWFJZQjN5V2pDR0w5?=
 =?utf-8?B?ZkIxWXFCZWQzL29pR2dGVC9NVFJDQXVWWHR2TUk2T002UEozdWx2YlUzVG9G?=
 =?utf-8?B?cWJhTEI4VFJFYTVXRmgxWWtsYTZQSmdJTndCNmZKT3N5VU1lRzBRd1FSbnBS?=
 =?utf-8?B?VVR0Q1BvdHM0TXdVVjVWS2xyYTZTVnlXbXduK05hRmlNY0RTT1RJUlZLamZK?=
 =?utf-8?B?ZE8yc2tLSHdmNWpMZm1IQWxLaENtZ3NDUFRSaS9vSkI5VGhSRjhER1BUaFRJ?=
 =?utf-8?B?YTRucUxObzdwSFBRL1ZTdm9EL0c2amNvak9BbG1ObzNpckNkNjlmZzlBQTA4?=
 =?utf-8?B?c0xJb0tKbkc2YzBqT3g5NXdaWUt5QTY4STg1VVZSeGxMOW1JMTMrSjc5eVFQ?=
 =?utf-8?B?dlUxcXMwSkZza1h1dDVPZStxeUFMcTNqV293ZytZMXZqMWV0cHp3RjJSTzIz?=
 =?utf-8?B?WDJYVDFSTnJ4ay9BOFhKaHR4K21OSzVXWUsrb08rYkFnU09QZTI2cm4rNnEz?=
 =?utf-8?B?cjdpUXdiNnNpVWUxOVFWTFZvdWFIcEFzc1NodWpIZ0xISUxCQ25CTVBQZ0U1?=
 =?utf-8?B?bmtoOTFSUmV3bk8yZmd1Q3dSZVVKVG9oQU84bDkxUFdHcGdaVlNyTFVwdFJn?=
 =?utf-8?B?WWVVWTVpVitvUXBTNzNzV3lnRHpJckpFRzdTbDNTV1VVQ0JDZUxTaW00M1Ro?=
 =?utf-8?Q?Zz2IQBDk3suvg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1VBdUV1b2NBNGRuSkliNlozczQrWTc2K0lERlJwMXhXaGhVRmgwbkRpUTJJ?=
 =?utf-8?B?RlB3VExTc29OYXRiMVp3dlozcWtxVEhWdys2RzZRNXlCaEN2Qml4bjE0bmVz?=
 =?utf-8?B?Q0s5cncxNHJVczNsMDhzaVNxSVJ4NFp5NkpRelhIdkxibTBJYmNTWHBDamhR?=
 =?utf-8?B?T2cwdFU4WmlrUldLNDZHblpXWW5iOTBxeGJpdjcxamY3bklpaVZpMTZieE5i?=
 =?utf-8?B?MmtkNURYWmx5MzB1N1g1NnpsSjMxdWpuRHk2ZnhkU1dQY01mcnJYenErZWp3?=
 =?utf-8?B?cFlRTTZudllBZ21qM2ZjYWF4ZXU5S2l0aitUZCtEUjFPOTE0Zit5MUl5TU9y?=
 =?utf-8?B?VXFYbTN1TEtzdDFVY0xkSkh1eDluYk9SdUJESXhvMTFKTUY1T3BjWC8zelQ0?=
 =?utf-8?B?amNTRDMyaVR5ZVZpekt4YWtZekJ1MG4vNTdJZnIyQmJ3QWhDZUNpNUozcE4w?=
 =?utf-8?B?WGJZL1JLaHByYXdZb0lCRTVZL0ZXWTd1VFdtSW13NXZjNkpTaWtXNklidHMx?=
 =?utf-8?B?bjJBZ21BUWZSd2lhUDZ5RTZZS3B2SFAzcnkwbkZISzZpZ0k3azNBU1hJaVls?=
 =?utf-8?B?RzhmRTJYWGNmN3JtTnQ0TzNEUDRxeGsyK0Irb2RudllCVFFxTHh0NDVEV2VB?=
 =?utf-8?B?aHhSK1NMVktGMFFVYnduRVI0ZEViYlZESjIzS1dHMzEwc3BISlpNOVlFYXo1?=
 =?utf-8?B?b1NncnBJbjE0RDREeUxKa1hGQXcrRGtDcUFXVTE4allNTTlXREJ1NDJkSGdv?=
 =?utf-8?B?eTFuVXBqUkV6K20xRWFaSyt0M2xLSm5uOUZBZ2NXZVFWZWNmQmJMUzF1bjlH?=
 =?utf-8?B?K0RnT3BubnNNVndZRlhnYk0wVXdYQ216QXhrbFppZFZPT213T3FDZmlEUjZQ?=
 =?utf-8?B?TFNzWU5PaER4YU5wMGNvL0grdUNTZERtK2tFTlcyM3BPdU1NRjZjNFc3cVZk?=
 =?utf-8?B?Y3BOK0hkcDJhNktvV0RZcXl3blRoc2hDMUtmdkpzQ3U5ME9SY0dpQVFTK2p3?=
 =?utf-8?B?NWhnUkFEaG1NRHJnR3hGaU9ibHFsNWVoT296YWhSWUhXVFdrc1BJUVAyWXRM?=
 =?utf-8?B?a3o5ajJrLzFQd3htQ2hQZHU2dWZGWEdpWUxhNzJlQzZjSVBIbWo5RjUyajZ5?=
 =?utf-8?B?eGhsWUdWWjNWeTY3KzFzcWJRcDBxN3pNWTRpNWtjMzBKR1ptOGJUNkJ5Zm1r?=
 =?utf-8?B?S3JYNXRuYkxiS3VzTlJFVnBWY0g3REcxY25HR0huWGFueHY2SlZKbXlNZDBr?=
 =?utf-8?B?bUROQjNBRExUQ0NIZFdMZE5kcjhmT0ozSFB2eEc1MlV5UkVFTmRsa3VIeUpD?=
 =?utf-8?B?cERreHFLdGFtVG1lTm5oR3BvWkl3M0wrRnRMdjFhMjdVanAxRU5zQ2dLcXp1?=
 =?utf-8?B?RDMxNTg5SVVBaEFPZ3ZCVjZqMHQ0UU5CWVorOTZCbFpkaVlpQ3FJdTNycVBp?=
 =?utf-8?B?ZmZZb29XTHlqTHNzUk9OV0FnU2FsaVFCK21KREVBMFptNnRQUktkY0xHTU0r?=
 =?utf-8?B?OUZ4cG8wSUtVYUEycEJwb01nNDZLUlNCR1RnK2REdTdPdmg1NW1DWlVKM1cx?=
 =?utf-8?B?QjVmSHNXL1RmMFY5SHVwUUtISjBKWXdRVHcvWHJNY1p2d0g2VndqV3JMT21P?=
 =?utf-8?B?UUhnOVpZM3R1bzNTVksxTEtkTGFSVVJBUy9yQXRvRmc3VHdJVVBGT2ptVWhh?=
 =?utf-8?B?dTFUeE4rWHpEL0RZbnBSeG1rbDVZNFVKcm9IakNYRTRHOFFucFFaNGhqTTEv?=
 =?utf-8?B?TW9obmR1b2NhSHhaRE8rZmpkbDhFa0hJbFV2OWU4KzhReTFWMzRzMkZCQ0NC?=
 =?utf-8?B?SVFKMCs3aFlSTUo2WE1kL3ZHd2RybUtNeGNLOWc1YW1aK05vQis3eHVFMUtZ?=
 =?utf-8?B?a01SZUJUbHZzYy9oOXhGOEJUWmlTVG1PNSs4R2Z0TTRrUEFNOWkvOGIxRWtO?=
 =?utf-8?B?STBPK2xIVzFhdGxrMHlxWTdQOEE1amlqUGtSMzhIQWFGU0NZSEkyMldMMmEw?=
 =?utf-8?B?bXVyWVNGRFZGVGZHSTEzRE9zNVA2SmV5cnU1SDd6VGpkZlhyNU52VW0xbit3?=
 =?utf-8?B?Y1F6UE5JbzBGV3RZbkhOYTdhWnVMOGZqUWNpTDhJN015S0RTYUNrMnFRaTZY?=
 =?utf-8?Q?oMUP+q6/cTLwCsUl5gNaTLSot?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd258ed-cbcd-4300-2cac-08dd45380c04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 16:21:58.0033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrRltGHO2lc1DvpGfuxEH9W0ZOXX/gxz7JdXl+1i360ew4JAROFuWuTdsviLcvSv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8578
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

Am 03.02.25 um 16:30 schrieb Tvrtko Ursulin:
> Add a very simple TDR test which submits a single job and verifies that
> the TDR handling will run if the backend failed to complete the job in
> time.

I think I said it before but I strongly suggest to not use TDR as name 
in the scheduler at all.

What the scheduler provides is a simple timeout while waiting for the HW 
fence to signal.

That is fundamentally different to the TDR functionality Windows provide 
and we already had people confusing this.

Apart from that "yes, please". Those tests are desperately needed.

Regards,
Christian.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
>   .../drm/scheduler/tests/drm_mock_scheduler.c  | 12 +++-
>   .../gpu/drm/scheduler/tests/drm_sched_tests.h |  6 +-
>   .../scheduler/tests/drm_sched_tests_basic.c   | 64 ++++++++++++++++++-
>   3 files changed, 76 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> index f1985900a6ba..79b6193ce920 100644
> --- a/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> @@ -160,7 +160,11 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
>   static enum drm_gpu_sched_stat
>   mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   {
> -	return DRM_GPU_SCHED_STAT_ENODEV;
> +	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
> +
> +	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }
>   
>   static void mock_sched_free_job(struct drm_sched_job *sched_job)
> @@ -174,7 +178,9 @@ static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
>   	.free_job = mock_sched_free_job
>   };
>   
> -struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test)
> +struct drm_mock_scheduler *
> +drm_mock_new_scheduler(struct kunit *test,
> +		       long timeout)
>   {
>   	struct drm_mock_scheduler *sched;
>   	int ret;
> @@ -188,7 +194,7 @@ struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test)
>   			     DRM_SCHED_PRIORITY_COUNT,
>   			     U32_MAX, /* max credits */
>   			     UINT_MAX, /* hang limit */
> -			     MAX_SCHEDULE_TIMEOUT, /* timeout */
> +			     timeout,
>   			     NULL, /* timeout wq */
>   			     NULL, /* score */
>   			     "drm-mock-scheduler",
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
> index 421ee2712985..20695f55e453 100644
> --- a/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
> @@ -35,6 +35,9 @@ struct drm_mock_sched_entity {
>   struct drm_mock_sched_job {
>   	struct drm_sched_job	base;
>   
> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT 0x1
> +	unsigned long		flags;
> +
>   	struct list_head	link;
>   	struct hrtimer		timer;
>   
> @@ -65,7 +68,8 @@ drm_sched_job_to_mock_job(struct drm_sched_job *sched_job)
>   	return container_of(sched_job, struct drm_mock_sched_job, base);
>   };
>   
> -struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test);
> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit *test,
> +						  long timeout);
>   void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched);
>   unsigned int drm_mock_sched_advance(struct drm_mock_scheduler *sched,
>   				    unsigned int num);
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> index 6fd39bea95b1..eb0d54d00f21 100644
> --- a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> @@ -3,7 +3,7 @@
>   
>   static int drm_sched_basic_init(struct kunit *test)
>   {
> -	test->priv = drm_mock_new_scheduler(test);
> +	test->priv = drm_mock_new_scheduler(test, MAX_SCHEDULE_TIMEOUT);
>   
>   	return 0;
>   }
> @@ -15,6 +15,13 @@ static void drm_sched_basic_exit(struct kunit *test)
>   	drm_mock_scheduler_fini(sched);
>   }
>   
> +static int drm_sched_tdr_init(struct kunit *test)
> +{
> +	test->priv = drm_mock_new_scheduler(test, HZ);
> +
> +	return 0;
> +}
> +
>   static void drm_sched_basic_submit(struct kunit *test)
>   {
>   	struct drm_mock_scheduler *sched = test->priv;
> @@ -244,4 +251,57 @@ static struct kunit_suite drm_sched_basic = {
>   	.test_cases = drm_sched_basic_tests,
>   };
>   
> -kunit_test_suite(drm_sched_basic);
> +static void drm_sched_basic_tdr(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched = test->priv;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job *job;
> +	bool done;
> +
> +	/*
> +	 * Submit a single job against a scheduler with the timeout configured
> +	 * and verify that the timeout handling will run if the backend fails
> +	 * to complete it in time.
> +	 */
> +
> +	entity = drm_mock_new_sched_entity(test,
> +					   DRM_SCHED_PRIORITY_NORMAL,
> +					   sched);
> +	job = drm_mock_new_sched_job(test, entity);
> +
> +	drm_mock_sched_job_submit(job);
> +
> +	done = drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
> +	KUNIT_ASSERT_EQ(test, done, false);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			0);
> +
> +	done = drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, false);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			DRM_MOCK_SCHED_JOB_TIMEDOUT);
> +
> +	drm_mock_sched_entity_free(entity);
> +}
> +
> +static struct kunit_case drm_sched_tdr_tests[] = {
> +	KUNIT_CASE(drm_sched_basic_tdr),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_tdr = {
> +	.name = "drm_sched_basic_tdr_tests",
> +	.init = drm_sched_tdr_init,
> +	.exit = drm_sched_basic_exit,
> +	.test_cases = drm_sched_tdr_tests,
> +};
> +
> +kunit_test_suites(&drm_sched_basic,
> +		  &drm_sched_tdr);

