Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D4C6EF5F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6F810E610;
	Wed, 19 Nov 2025 13:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R7Jj+i78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013053.outbound.protection.outlook.com
 [40.93.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0153010E60E;
 Wed, 19 Nov 2025 13:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbH0X/Ml1RYfRzO/K9q1ZaLPfwY7Yi29a5NYvGOOABmP6VwRnwfF6hNUl76UsC1HZiZOwgoi5ZgFwjOSB1o4ZLcyVWiS4EilOYopB+8czllNSf1MpFJvwoIu5e0PTS0QiLWUoS5fI/Lld4I1D8DtpK3btJtSrLH6Il7g7C+J7mHcP4SADBMjQRNlbI7lPENC4ZQXc39UZtRtdDhLPQFwFEnweVSlWvYHv8MZsVrusCiIp7jgvqj8knz4GEdQ0N0qkr2lBqmVWX8ytNhNOcnggMLHXEdU7VzClIkp3S3GTYiJIKIHHweGfAG5SDVg9+jxWoSQ03A3xocfVknmvVCj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c33vEsfGMjRi9Fi9XLZoKOURdfkVik54JMid6nRN1io=;
 b=B1jjcmKQEFd1PmUWcHDStSdz8vTK6XctaUMEyEtYVxUzNaylVFLEJML8Mo0b605P9lJrDu+NKx+9RFoJZXusGO5nAND0pyLFwm4ZjOIme8g1eHhRW2ShW89NjIXCcj0L1lVXV4YHK9OWViOGkhaIbw3u2LG/tIrLi+6umcY1jGk0F0y9XiMniBpsX/VmcKO+3qZm9weWb9ZolOkT5Q5MAWTmzYGRc/bQCjgYp+flE1mSTViXcYSOhsERy204WYaMMkZFOqbaLQMKNOf5hsihgVqwbkjcGYqxLk09qoCdr5GD8TXXlVrT6p9IZ7mDMpExjc4hzu1ZCZKJrPSE7+WCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c33vEsfGMjRi9Fi9XLZoKOURdfkVik54JMid6nRN1io=;
 b=R7Jj+i78MMn+l3SflThBnZBvuDoOOXPLJ6DOlRpIMFDYe11y0LFl18vYs1WcWkqrsEkb5Uglywtl9kzS12vwNmkhhnFPAJuFSOLeK711XlrDOSAVBKKTvOp5tTL9kd/YPFOHDxzoWAQetZJC7uUk5EmynfyXDLLw1N4rK1lxEKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 13:42:02 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 13:42:02 +0000
Message-ID: <75354de6-a567-471d-ad6c-b0196833eb8a@amd.com>
Date: Wed, 19 Nov 2025 19:11:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/buddy: Mark
 drm_test_buddy_fragmentation_performance test as slow
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20251029143313.42630-2-krzysztof.niemiec@intel.com>
 <aR2PBpZMzlaTXIJz@ashyti-mobl2.lan>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <aR2PBpZMzlaTXIJz@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 69beb636-6bb2-429d-879d-08de27716b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnhCNHU3V3dmK3RaUW5UTkNIOHdWN0xSTmxWcXpnR25Bb2IwRmo0dXFmcXJX?=
 =?utf-8?B?eU0wQkU4TEhCMldLWE5tcFVpSWxTTzVtNUJMK015Y1B1eUFXMGdDczhmQXpj?=
 =?utf-8?B?UHl5NXg2K1dsQ24zOTR6NXNPSjJSZ1ZqbnIySDI4NGs4blk1SWVOaE5JaEpi?=
 =?utf-8?B?UFNpRjhpTENJeE90ZkxicVNDL0p4SkxEMjk0Tkh6cHRUamRYUnU5RnUzUWdP?=
 =?utf-8?B?UjRjVm56SDRjNnpQcElSUndyWk15a1FXM3g5ZnJWM0hUWldNeHhJcWszVjNZ?=
 =?utf-8?B?ZW5NbkpuZXdwSHJaYzNCOGF3WG5YYUxaei9DSzRjaEVMR2lkbEhpR3hwa2Uw?=
 =?utf-8?B?dTZ1b2Q5dWZZYzZKQjJMSDkzakowVXB1aHNYaXhKY3VwZ3RXVTFLNnA1aUp1?=
 =?utf-8?B?YkpiK0JzcnplUFFMbVpxcU5ocmcyc0pnS0xOaWk0UnE3OXNvYUZjcnJqUVFw?=
 =?utf-8?B?Y2s1OU41clNrYzBmNlFtcUx2M05Jd1d2YmZmeW5udUVjbUNzajNDOVg2eTNn?=
 =?utf-8?B?QlFqNkVQR0FLRmsyOVFIWFNjeUpTYXZJN3RzbXl0OUUwYWREQ3VHRW9WVFlz?=
 =?utf-8?B?MU5YNldXZ2RtQlUyc0Ryd2x3UGYyY21adlVHRGlyc1pqeFVlTGdLNnZQbGJG?=
 =?utf-8?B?bUVEVTlKQ05xblc0WEo0SjZHbEdWR1FtbjNpZVFxSkhkNGJMTENyL2plaDhy?=
 =?utf-8?B?VUhWQUFPV0V0TnE0QjlCdEhXNCs4V3J3NkxQcDVUKzdGNUJMcW9yM2xRQ3hy?=
 =?utf-8?B?OWc4dlVPZXBaV3dKa3hQOWl3M0ZNYkFsYTEybHhTenNQSGRybnRBMVcrMEJ2?=
 =?utf-8?B?Y3BnVEdIV0VVaERlbWhuRkVUWDJ3SmhaWGRlZlZHWHRGalZ2VXNRWE1DQkZ2?=
 =?utf-8?B?TjNzUGRuNmJTRUJJMmxDUzAyL2xqdDBXam5PejBnYW5lZXN1dGNUVUphcU54?=
 =?utf-8?B?SFBXZElMR01JajMwcTFvU2hWa085R04xSFo2N29ZYnNzbEpYakVPM2JyUUta?=
 =?utf-8?B?NzFxbTg2M3BlR3VlMUgvOWY5YkllVVY5TE9kbXREeWlwZythaFBnSWIzdEIz?=
 =?utf-8?B?R0lhOVZjWTBHRGxWQ1ROYkVUV2Rhdy9nL1ZQMFRqOWtPcVVFcW1LMjlCVjB2?=
 =?utf-8?B?ZXQ3MjRoYyt6UklqZlIybDdFZXN1SWhDZyt2SzlycUtmdWtiTWZOK0I1czhi?=
 =?utf-8?B?c3RUS0RpaEtYdnRFUk0wb0FWZWJBN1h2UkpuQkZvY2ZadlZ4TXZQLzhxYmtE?=
 =?utf-8?B?UTBEM2ZWUXJuUEgyZFF2djBRR1RVQkhPb1lKYzRXNC8xR1hBbC9hOEE2cmNB?=
 =?utf-8?B?YU1TMTBqdy94QThaUzlRRThJWm42MlVjRDRzS3JMVmxkMlBpa0JPSXU3YWQ1?=
 =?utf-8?B?TDU4aVZmVzZvK1RYZ0ZENHhKWWQwQzV0QXF0SFY0S2cvbGhqSG0rRzZtdnFl?=
 =?utf-8?B?d3ZHM21nRWxEZFN2Zk43NTZuQ1NxUVZjeEwzMTVWbjY5WVR4bkpCVmtMUFZR?=
 =?utf-8?B?T1ZSRnFpa0JDaENsU2ljYzR5UUJhOFpUTGlCQUxlVEN1ZEhUT2R3NnR2em1h?=
 =?utf-8?B?RTBlMGJrVFNiNjNSSjY5R1FwckpkL2VBR2cwby9NMmFTazcxVGxkd0cwSnVz?=
 =?utf-8?B?cGVaSWRiR0t0OE9EdWd3TTRDOU4vS0N3U0Nvd0tXcmc1WUtPSit3Y2laWGZ5?=
 =?utf-8?B?Ly92c3VYdjV5ZllaL3BkVjl5cFQrQUR2WitKT3JqdExKZ0hTQmtyNEJmeDVP?=
 =?utf-8?B?UEFtVWxieGQzWHQ1d1NRZFNlS2h4ZktaM1FhbkVMSzlMR2NLMEY0L0lBSlh1?=
 =?utf-8?B?Rmhob3c5b0ZyQlk4WVVPOUc0c0dTT0hhOHJ6ZnFZcDl2ZXovcGlzWTY5VUMy?=
 =?utf-8?B?anZ4TlRmaDBLZnI3ZDA5c0kvQldtL0ptSzMyeGVVNUhRS2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDZLdG5CSWk0SFAzYzk0OXQ1MGZnRm9tb0pUQ0hjaGxSYVljQm04QU55d0Ri?=
 =?utf-8?B?bDlTNHJ4YmJ6M3FlWm9INjZXdDcraUNwYm1XQWhkZG5ZRHYvOGZkUG01cVEv?=
 =?utf-8?B?MjNmcHRBYnlDd2hDUHBTNER4SlpWS3hKSm5oandkOHl1UjJveElKdDNiM2lT?=
 =?utf-8?B?WlptL3pmRU94dTlKNlBqRk4xSE9HRk8wdFVDWmFoeHFOK3IxcUUrU0FpU1BI?=
 =?utf-8?B?b0R0cnh0SGllS3pSaFYzNzlVM1VZUW0wTSt0N296Wi9weFJFY3dqR3RWb2sw?=
 =?utf-8?B?aFJVb3k0VGRqSk5kcnowdC9NOExzTVdJdU0xRnlrR1hrakl6RUZjOEs0MlM2?=
 =?utf-8?B?TWdiNFY3dnFjZXVhOUhWMkNMaWNxTExvUFB6cFhVaERYc1NkaUE1MWMvL2Rs?=
 =?utf-8?B?RkkzeDdkWnBiNEppTkgxbi92Y1RtQmY1UlpxRW9SNnJoSnFlOGdIUVFlRS9m?=
 =?utf-8?B?ZUx1T1VCUkFYV2dobzJNNXR1eC9xbHhGcFpQY1hEK0orK29HM0xmem9rcDcz?=
 =?utf-8?B?dW9QdWljaUdNT1Z1eWpJNThHc2tCR3hzQ2c4S3NaZDhmbEdZYnd1YkJobHhq?=
 =?utf-8?B?OEtKdE9sZitJdDRKdSs0UFA2dkJ5L2hZNkVGcVJSNWcyaVFYS1hwV2k2UHgx?=
 =?utf-8?B?QlFReXRVUGZFL3p5VXRYSUwyeVpqaWlnSFNXc3dLdHdOMm1PcCtEbUxmUk0r?=
 =?utf-8?B?dnN0bktqSldlcjd6SllJMnZ5TjhTQzRZTUxwang2R0U4NXQwb2VPM2xOdjdr?=
 =?utf-8?B?cDFzajljZ3VkTFJjaEsrQzBHMXFkR25zdDcyV05WZFY1TmM3VHE1a1VRM0pB?=
 =?utf-8?B?OXZHdlgrdXlZNGpYVUNjS3VDdzdxYmY3WFBQM0dMNUxWOVYxL1NoM2tEU1p6?=
 =?utf-8?B?cnZNVWFLVVk3U2o4M0ZqejhBdWV5UUFra0VxOFJubFlSQWRzWmlTa1VaKzc3?=
 =?utf-8?B?N2ZIaUVpaklNV08wVWVJNlBrYngxenlPWTc2NkxIdkREQnNXRjRjeTd3T2VD?=
 =?utf-8?B?UGVWNXBaVzk2bzIyYkdMY3ZUS2tRQjVoVkFoM2tNa0ZmSG1jZjRPQWN3WUd4?=
 =?utf-8?B?bGNMRlp6QUIyVUgrblByZVlkTTNnWkNHTkVTZDJMelNkdDlSWVBLUGVSU2ZW?=
 =?utf-8?B?VGFkbzgya0dPNys4OGNBQ3d4QXJVNGZOdWFyandyb3czZWVSTVZuejJIZklB?=
 =?utf-8?B?SnhvcVBkWCtMR3BTL2VLWHNjNlZKYWxzMG9kZEtBblRSNGI4dWdNU2NRd0VM?=
 =?utf-8?B?N01hSVpuOXFHRStsdktTbjA3K2k1a1g0NC9yN3hha3k5bWNJWWFjOXJiMlRq?=
 =?utf-8?B?eHk1NnhQczdSV2VlSHp2eDJVdEhibWNuaFE2Q05SeGxxR0Mxc0RybmZJem03?=
 =?utf-8?B?V3hyZGx6TFJDUnpOKytsM2FDaFVYT29qOTF2bTFWUlBUamprU0NsUE94bXN3?=
 =?utf-8?B?QW04dUE1MTJ1ZjkxWDdSR01EVzFEWER4aVM0UHg5eW1kNkdTN2pCcUxVdVRI?=
 =?utf-8?B?czV6R3g5SHl6dFQ5dFlTQnA4YWtiWVp1eGpxTks2NitIZVNmVkZEaGJOcmZU?=
 =?utf-8?B?SWNZaFdWRXNjdUI3T2RaM1ZUMVd2MFU0UFlPd0pLVWdlaWlOYmJOMlNaS0JY?=
 =?utf-8?B?a0JFY002SzJpNGxFdHRaeFEvbEt3Q1k5LzNwQUF5SFBmbnBoTTBrb24vU1BR?=
 =?utf-8?B?djNLS0dWY2FrV0JLWVVybTcyYk55ampWeDFlRjc5ZUhSNDdmdW00bnczRSt1?=
 =?utf-8?B?VkNOdkdwd0EwVEE0ZEVuVDhFcjdpRTZXMXJWalVoYWlFWW9ia3AxTzRoNkZx?=
 =?utf-8?B?MVQ0dm1jcFdJdFpYWFdtVDNUUkhsazhrTUZMTDVIT3p2b3hMR0hTdWxUUXZs?=
 =?utf-8?B?ald5YXFvV2JuWERpcCttcHUvNWp3bzJYQ21WOHFBWjlBMnVjcHY2U2dNamVZ?=
 =?utf-8?B?bENsUVFObis3dWVFdGp3RkZseXJqUnJoYTVValBUYWc4YnNCUm8zMkdqVGxu?=
 =?utf-8?B?UEMrK0d5NHJNZG1rNStxVGFJNi8wZlNvRXpyWHNYNXZ2eEFpQldWV3N1Mk9E?=
 =?utf-8?B?a0VDL3VzT2RkMW1aRlRtSDdyYXZVNHZ0TThxdmhNRGY4bndjdzhpT1NrR3I2?=
 =?utf-8?Q?4nxriHb8M86vjFj5poIO5IS2Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69beb636-6bb2-429d-879d-08de27716b65
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 13:42:02.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U44DtwSKzxMa7q0yf8gahaIBZUhCjte+5cNzIL6asXiHnvtHXFkMci0kHTYp7v/1gLXfaa5ICyAlJYB9kyuNMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
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

Hi Andi,

On 11/19/2025 3:03 PM, Andi Shyti wrote:
> Hi Arunpravin,
>
> On Wed, Oct 29, 2025 at 03:33:14PM +0100, Krzysztof Niemiec wrote:
>> Mark the newly introduced drm_test_buddy_fragmentation_performance test
>> as KUNIT_SPEED_SLOW, as it might take more than a second on some
>> systems.
>>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
>> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
>> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Arunpravin, Maarten, any comment here?
I have already reviewed this patch.

Regards,
Arun.
>
> Thanks,
> Andi

