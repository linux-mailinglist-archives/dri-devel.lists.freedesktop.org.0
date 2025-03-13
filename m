Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF1A5F0F8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4DC10E82B;
	Thu, 13 Mar 2025 10:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FXp9o9U9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E400810E82B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w16xyu/3gr/tTy89iE3MQq6+CZFOWy7Uv3ipFuXnKlZiKvQnddxraqFYyNQs+Jeo2JofCmSs/nvfTutqEx+mwgjFzHw/awRb5x/VoI/WvJMopBLCh766YzUWA1dKUce+1yBHpw5liCUhI+FguAm/1DPbgN9RQPYBP5XK1ZJcuAnnb2OrmUKShpj9QXZwGWRRuJeu3mTRD+Uv8J/6ehkwlVfMDLIf5opHVaL3j9r0Jc1IEmxN9R3Tb+9vd+WWfPStbNEXXAgzDwlT4KFQ72T4ONwb0QOwF2lpgdn0aJIjKVshj5xW2vPTL/tkzjjwYRCvtbwwKY8JmvSbVvQd7dmdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97tbYcxkiFbR5LhZu8CoKhIIo3JSzr78rWcKEhfwt0c=;
 b=ddQSo4Gq0JicuQFU636dEDHIiwGahC9VNQcp4NN0bFBfbDxhXj8nUuA9qZHIox+xmc6qReSDWAljVogtI1L6FYAWIPj708yYwp/b5fqJ+JEyipCEEpBwKiyqJt4k8BERIHsqYUtjjnZRrR2SCyvDCdr36HTxAg3GWo/Vwx3g8bQoSLjZyu10NWvYjAYXThI6KoHY74az+7qIKF50DafJSs7Zm+bpPasQABCSdqDvEwubJy1PAhECNiNHLz+oJf4WkCtAM9TBbAAaF2iTM2A/MqW8Xq/AFAAXak/TYEPEE7zJOqo7yRRFYTfMDtaqxPJSbFE9Rh1RubQvOV9IeEmVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97tbYcxkiFbR5LhZu8CoKhIIo3JSzr78rWcKEhfwt0c=;
 b=FXp9o9U9acTaqi1lChwA4rlmaNEAFRKKbL/5KjhCJBkBh8KHI9+ib9dg7KPXjGo9whXqYQXv9DL1mnz6xW33/mF72WHR0g2hvbE7iIFJVnaErwsD63QskZn6yFhQJqCsPUltg2rICOC3v6wToIgJkTK9mNVFFtgt+QOKtDuP1xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 10:32:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 10:32:38 +0000
Message-ID: <77c5e613-97c3-41e7-ac27-386e8db7a38c@amd.com>
Date: Thu, 13 Mar 2025 11:32:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Clarify docu concerning drm_sched_job_arm()
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250313093053.65001-2-phasta@kernel.org>
 <d02a205a-c7e7-45a5-bcba-b5a5a6bebf4e@amd.com>
 <db82a8a37e548f7c893c999bb476551c6793b411.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <db82a8a37e548f7c893c999bb476551c6793b411.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a1d920-9695-4f5c-311b-08dd621a6087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzJ5czcydDM5OTRNMTA4NGZaYjdaaHRBN2ZBN3UxYk9PN0djcStSVm5BRzFo?=
 =?utf-8?B?ZllzelFjTEw3TXgwcDU2TmxJcUFDZzFmVFhNRG1yTFdZWlpsSmlzRmpWRFV3?=
 =?utf-8?B?K0svRzZuNm55NGNMN3lQd2ltMlhvYzFDcUJPR3Z0L3lXUFBrcDZBbW42UEVI?=
 =?utf-8?B?Z1BnTlNaVVBRUjBtRm9mTFJCdk9YQmdZS1lVZnVZaXA4dmRuRHdVS2E0ZVdM?=
 =?utf-8?B?MmxjSXZtcnllUy9zVmZWUXpNL0plOU1SbHRjeGVnb3pFaDg3Mk5CSGF5WGFp?=
 =?utf-8?B?K1hCV1NQOG9ad3lZcFRubTdHSithYmRTVkRTbEhuK2hpUnVJbm50TllwVjFp?=
 =?utf-8?B?WUVYQVYrQURHaWZhRktBNTQyUkd5R0JwVkhIOXZQMmk5WFNQby92OGk5MEhv?=
 =?utf-8?B?N2I4MWc1ZTBURFZIYkRyT28zQ1JSYkVMZ1NSNTdlRE5YdDUzNmdWTm9oakJn?=
 =?utf-8?B?dXhncllOeHVubVE2aVArR085MzY5TkxiUTFuUHNXM0F3dVNDZFo5NjNZYitv?=
 =?utf-8?B?UlpCazM3SU56NVlGejNjakF5aEF6UjBCR1NPODhRbFpTclVTQVR3MXcyNlNs?=
 =?utf-8?B?ZVN2S2hTUkZYbjA5UzEzdDBqbGsyQ0oyRE5PVXNaaTZ2OWdpUERaZ3NKMWFY?=
 =?utf-8?B?Tkc5eFlVbXFRSzB3MmZzNVZOeDBoL0xSS3pOR2RhbDhjcXRvVThNOHB3NERW?=
 =?utf-8?B?YlBNdktlUUsxenUxMi8wMGxOa2pqVmQ2d3p1cEVyeDltMW5wTlRYSllBZjho?=
 =?utf-8?B?QlY3SEpyT0hxY0M0RHZiZndVanBxU3cyMnBFWHZOT0hTYjlLaVJjcm81cDNJ?=
 =?utf-8?B?bnNMUFAvcW5jZXJOdVRSL2xpeE9mcEl4V0tzSDhxWjlNOXNzbGxReDhwaTdw?=
 =?utf-8?B?aU8vb0l4UlgxOS9tNXRQb1Rhb2lwaHFJUE51UUVjSE1KUkhkem5vQlBwS3Bh?=
 =?utf-8?B?K3VFVm5zSG5xYVcvQ1h1TDBlRnpteUFTSVZxQ0pJTXFwajR3WGFXT2Fybnp3?=
 =?utf-8?B?SGJMWC9QTVdVcWxtelNJZWJEdUh2aERHcUZWbVI1VDdYb2YvbTZkbTdEbm9s?=
 =?utf-8?B?YTIxVmhBZ25lYjFFNDNhOW5Yd0tmOEM1NStqVStrWmFzbWZib2k2Y21XTXN0?=
 =?utf-8?B?OE5xajYxL2RMVGhrTlE4VVUzNFQySFk2a0ZCTjV2a1JodEFRSmdJcGRGRDlP?=
 =?utf-8?B?emI4SEFoZU8yd0E1dUNMNUMwN0wwVUNSV1Z1YWEyamFKWUdoQTQ2OUdyMFJo?=
 =?utf-8?B?d0NtSEVEc3ZhYUZqRGVBVnJyVVVLNjdmY3ZSMXhVMWF6VkM4eGZpVzZRS0hR?=
 =?utf-8?B?cDdKeVR2WVJIVEhmWEV5bXFBTjJOOFRVcjZ5NHk4c0dOaGVSaXUwakEyOUkz?=
 =?utf-8?B?U2ZTM09WYUg2Z04wVVBNd1ppcG85MkJ6RjdCcVZrM2dFVjA1UHVIUHNEVUVq?=
 =?utf-8?B?OUJVN2RqSXp0dzc5WlNsdUs2NWJIYlNKc3YyaHlXdXVTQ3NYSFFqWTN3dnlC?=
 =?utf-8?B?TzFodGRCbjZWaGZRU2FUWVJvaXFYZDg1VHllQWc0ZEs3TmZKdFFFbU1nQXNw?=
 =?utf-8?B?VGRvQ3RmTnZJZG1NV0xGaWhFeUJOSjExUnJnRytoMUJQU0RQbDMwUVhsblRS?=
 =?utf-8?B?TDd1TTlvcit5YUt6eEtGQk1wbklMSTNoNjFNaForVGNFdVhnTlBSTGM0TVhr?=
 =?utf-8?B?cUtPM0hFUWgyMlBCczJvYkZrZktwRDRDWnJOUU5vNVc1bWtDNHVqUmxwbGNQ?=
 =?utf-8?B?WE9Oc29La2hsOXFIRno5OXRNb0pNNFowWTFHVUZXTWxtVi80MzF1QlRscEh6?=
 =?utf-8?B?Qk8zUWJyV2kvdEpMbVJUOFJrMC9Sa0NJK0t2UDFrVmtOb1BVcTRvbG5sYjlJ?=
 =?utf-8?Q?jjscudcCbiBHD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBtVmVtSnF0clNqTndrb2luR2JRZVFEVlNmSWNhKzVsL3VkOUNGbUF0K0ZT?=
 =?utf-8?B?RXdBVXdtWGlNRzRDUUVQdTk4bVVoMUNVN0ZybURkOUxINUsyS1UxMGxwUFVt?=
 =?utf-8?B?SXNQOWNCS3Evekk0UUQ5Y1hsWDV0OTY5UXdjYzk4QzV2QjNlcjc3bEM0ZDJ1?=
 =?utf-8?B?bUJaNGpwU3hiNlBLY1ZVbmNwMXVNTWRSUmdMOUZUaC9DMWhvNzdMaXVYcTYx?=
 =?utf-8?B?OEgvc05Zbk93MVRIcDhTcHBhZFoyaTVHaGsySWYrY1puVnpFRnI3WlEwUVd5?=
 =?utf-8?B?d2hJbkxrY1NUSk5kN3UvU2ZHNXFhVTcycENsZHhNb2IwVHljMnByUGpxeFhx?=
 =?utf-8?B?c2J6SWxFMnRERURydm5Hcm91MGJWK2JrSjJwbWFlVS9EOWVELzNUeUJzN2xt?=
 =?utf-8?B?V29ZSW5ZNi9CN00vQ2ZwcEhaNWxqNmVmZlFqQXpXZFpZMEl1RlN2c0xrbFZU?=
 =?utf-8?B?STR4UnB4cWRNTk5Vdm5HQ1A3MFpLUXRxUlgySmw1WHpuSG9NMjY2c2xkcWxL?=
 =?utf-8?B?TVBtRGFtczFrNjdyQytjVE8xK3hQaEZlczArN2tMTlFmR3pySEk4R2pINnVN?=
 =?utf-8?B?dzJPSzNOKy9HdHF2OW1sMUt4THVsaUEyNEo4Njdya01iOHAwcCtVQ2lLMVBp?=
 =?utf-8?B?WGdMNk1LeDl2U0Rkb0FKSnFocklTa0xpb1ZzWHFWUnNIM3RvNTc3WmR0SDNR?=
 =?utf-8?B?MEZwZlVUZEFLaHpSWnBwdmNUek5TTEJIbzEzN1lBQlM5bFZad0RDNEE5c2Nu?=
 =?utf-8?B?WkpKRDFybU1sV3c2R21PSzBWUUVoVmg0MkNDQUM4MWYySUt5Q09zRFM2OGhj?=
 =?utf-8?B?Y1pyNlRGcW5WQUVlVlhEemdMSERKSEJpbGRWbXhRQ3NhcDVHcHprMjlIZUlx?=
 =?utf-8?B?azA3Y2xDNG5naXh0aFJNcnN1RWRzRmJTK3VTM3ZReG8xa2VnUVBFWHpHMTlv?=
 =?utf-8?B?YXY2SWdFSG1HbDlJN3VTOENpSWhNa01CMXRTTWhRUUF2VnBQa2E0TEVTSEZ3?=
 =?utf-8?B?MkFiQWIvdGNwUU9aTXhuWWpKVWlpZXRVWGJlek15VUZBZU84L0pEVjdudUxV?=
 =?utf-8?B?aWs2UVFNY0dla2RYMWl3YmVRbGQ4VTdkYjlqUjZtbUlyMjRiWHg4emErY0JT?=
 =?utf-8?B?OTFoSVIrc1NDN2ZtL2lsNHJjeGZhZlV0TGxOdWtYYnZkZ3Z0RG5OL0ZadEE5?=
 =?utf-8?B?dDJyTTMvU01VNHFYMVozc1ZOcE43WjdYWFBiYVlrZXNUVnVMcmZjUmZCeitj?=
 =?utf-8?B?SUpjWEFaMld4WVo1WkdSTE5IaXFzRmN0Qzgyc1dtQmFhQSsyU2kvTVViQ2wv?=
 =?utf-8?B?OVpHWlFxMWprd3FsTFBVVUQyNUwrTzI1TVZHYjRMUGRaM3hGSCtFcFV0VWVU?=
 =?utf-8?B?V3pjVU5XRlZycDVGU1RIVU9tTFUzM3Y4YllNVWdxTHBySUZUMHg5Z3ZoNG5n?=
 =?utf-8?B?dUJ6eXVmMkdPL1Z4Nk9VcGJNOE9sb3B6SjJENS9Mb0lLVkhYUDl0YjI1TWV1?=
 =?utf-8?B?aFUzV1pYS3A2MjRueThkbm9qclpnZlpyMENZdkJzNW5tWG85cmEvWVo3NkdV?=
 =?utf-8?B?NHJNendJY1RkYkZqOXl0WUhOZ096SE53RG1JN3FLcXc1VFdRT0owRW4wTjc5?=
 =?utf-8?B?M1J1dnAyZDhDUGgzellEdzdCQ0N6K2N5NVhUMmFCNXdUVnFmMVFnYW1kdmJQ?=
 =?utf-8?B?ZVdmN0ZDVUJneXBaaUpGYUp3M3Y5dTdFQjVBV1FjNWxiVXJBY2tlYksrSWtv?=
 =?utf-8?B?bXg1YkxyS20wUEduZS9IOEkvUS9PbXhRUDMzaFZvZUR3dFFmdS9xTkFlZ0dH?=
 =?utf-8?B?U3hKb1c0WFJVOU53bHVVcDZGdUt0MVN1dFdadnZFNmQ4dkNieHpXU3NoSWZr?=
 =?utf-8?B?VkZPbTRydDBjWjVLT0FHclh2VTZuU3oyUUFuVDYwWTE5MDcybGhZQm1RR1RS?=
 =?utf-8?B?Y3Ftc2l4UEEyb2pYbUhxcFAvUUVOUGtIalloWDJ6amlzdFRFT2NNUDdOUUZW?=
 =?utf-8?B?QXJGNTFNWTM5MFZRNEI0d1BJSmlFTFVwLzBmUHdQNWREcnNqc2Y3WjIwNnZ1?=
 =?utf-8?B?Nm9Lb3JIZGVNSFNWRjVjSi9aL3ZIMGZrdjRuQis3QkJhSFpORTVGZ1pHUitm?=
 =?utf-8?Q?dgKmHK13D3N9EfTUZaqfHnr+I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a1d920-9695-4f5c-311b-08dd621a6087
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:32:38.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPr8QrrTQ4xtvPlwhvR8/aovdVZvaeT3pUlWT8+tfk9mIJsAFyWBhHOTTLaKfVL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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

Am 13.03.25 um 11:26 schrieb Philipp Stanner:
> On Thu, 2025-03-13 at 11:07 +0100, Christian König wrote:
>> Am 13.03.25 um 10:30 schrieb Philipp Stanner:
>>> The documentation for drm_sched_job_arm() and especially
>>> drm_sched_job_cleanup() does not make it very clear why
>>> drm_sched_job_arm() is a point of no return, which it indeed is.
>>>
>>> Make the nature of drm_sched_job_arm() in the docu as clear as
>>> possible.
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Thx
>
>> I'm currently looking into how to fix the amdgpu CS path for gang
>> submission regarding this.
>>
>> Any objections that I add a preload function to allocate the memory
>> for the XA outside of the critical section?
> I can't fully follow, you mean when creating the dependencies xarray?
>
> I think in a perfect world we wouldn't have any more functions that
> only have 1 user to work around driver-internal problems. That said, I
> realize that the world isn't perfect. Would still be cool if every
> function we add would be useful to >1 driver.
>
> I think it's probably best if you just propose sth in form of a patch
> and we discuss it there

Ok I will give that a try.

It's tricky at best and I'm just now throwing away the second try to solve it.

Let's see if approach number three works.

Thanks,
Christian.

>
> Grüße
> P.
>
>
>> Regards,
>> Christian.
>>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 24 ++++++++++++++++++----
>>> --
>>>  1 file changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 4d4219fbe49d..829579c41c6b 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -828,11 +828,15 @@ EXPORT_SYMBOL(drm_sched_job_init);
>>>   *
>>>   * This arms a scheduler job for execution. Specifically it
>>> initializes the
>>>   * &drm_sched_job.s_fence of @job, so that it can be attached to
>>> struct dma_resv
>>> - * or other places that need to track the completion of this job.
>>> + * or other places that need to track the completion of this job.
>>> It also
>>> + * initializes sequence numbers, which are fundamental for fence
>>> ordering.
>>>   *
>>>   * Refer to drm_sched_entity_push_job() documentation for locking
>>>   * considerations.
>>>   *
>>> + * Once this function was called, you *must* submit @job with
>>> + * drm_sched_entity_push_job().
>>> + *
>>>   * This can only be called if drm_sched_job_init() succeeded.
>>>   */
>>>  void drm_sched_job_arm(struct drm_sched_job *job)
>>> @@ -1017,9 +1021,12 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>>>   * Drivers should call this from their error unwind code if @job
>>> is aborted
>>>   * before drm_sched_job_arm() is called.
>>>   *
>>> - * After that point of no return @job is committed to be executed
>>> by the
>>> - * scheduler, and this function should be called from the
>>> - * &drm_sched_backend_ops.free_job callback.
>>> + * drm_sched_job_arm() is a point of no return since it
>>> initializes the fences
>>> + * and their sequence number etc. Once that function has been
>>> called, you *must*
>>> + * submit it with drm_sched_entity_push_job() and cannot simply
>>> abort it by
>>> + * calling drm_sched_job_cleanup().
>>> + *
>>> + * This function should be called in the
>>> &drm_sched_backend_ops.free_job callback.
>>>   */
>>>  void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>  {
>>> @@ -1027,10 +1034,15 @@ void drm_sched_job_cleanup(struct
>>> drm_sched_job *job)
>>>  	unsigned long index;
>>>  
>>>  	if (kref_read(&job->s_fence->finished.refcount)) {
>>> -		/* drm_sched_job_arm() has been called */
>>> +		/* The job has been processed by the scheduler,
>>> i.e.,
>>> +		 * drm_sched_job_arm() and
>>> drm_sched_entity_push_job() have
>>> +		 * been called.
>>> +		 */
>>>  		dma_fence_put(&job->s_fence->finished);
>>>  	} else {
>>> -		/* aborted job before committing to run it */
>>> +		/* The job was aborted before it has been
>>> committed to be run;
>>> +		 * notably, drm_sched_job_arm() has not been
>>> called.
>>> +		 */
>>>  		drm_sched_fence_free(job->s_fence);
>>>  	}
>>>  

