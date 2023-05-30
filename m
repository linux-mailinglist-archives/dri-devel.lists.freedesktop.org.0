Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A971671E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD85C10E3BA;
	Tue, 30 May 2023 15:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D0410E39E;
 Tue, 30 May 2023 15:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5M3OaVO/fws1f2e2I8K3L0bDjQsblUZbYWoFeikriPL2/V11B9IGxkvPWYJQQeFjiaD6QaEthf/Q1tFyA1zmmABuXMtqBasz9RyDJ/E1heLLSVMTs0TPINK/McL16EwbyPHtefv75GZWOYYzRzbqnWX+mGdRMaIXiY4RM+nbG3qXq9SrB+QdUOtE5JhkCn0DSX1Sq2w6kJawl7m56qON4QQAbftqeHeEYLrTitx1vC5Qx5eTc0nXxrNEQsv3tawqyyIh0Vdu7/pUqKVFbY31T1oWHcXcLHjhS2IWhE64Xt2p45fhqo57xS9sB6GE2Qdg+EFpq5Ussceu4fIcI0dUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTmkOQvBGR6nkg4HQbxLwpV8T7+vN6nrDv7aHAy6apg=;
 b=MVwrMMzKhoWs/jE/Cp5PljATXoEM4Mp+0jU28ZI/OhA71RVFSiG3k/qScFMuJR4iXu+8ZXELWzFmGcAoOaMcDO3wIe1gMLPRHamY3ONjxjwy+V5eMBj6yTxzlCRA0X5VlomUgPNTi7w70QXYwLfdvDX0/IVd2gLBKIQ4ZCJmPhmKh7av/YgPHi4v/cYhWkFjBRzYrjT3CqjOEkL26Z6sqSysuEykZjShVWURdIodP/VXSXkbbhNqs81S3n/Xk6UccvB+rzB34P4EPx5NZUNLsmj2D9HEOU5SLZimQD5grjcDiAbo1sUqnW4BP1T3rnrD6pKWM09I0Skkondf9t0sVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTmkOQvBGR6nkg4HQbxLwpV8T7+vN6nrDv7aHAy6apg=;
 b=bhl4Svj6rNIxlUf5mry5aqH5F8w0CZJ/TAYPMEgnlSFcxT6M7eosmkcRVb5R08OtLVjHS/AOUpmdNLWcCOlC0JbhZos2nn83RjFjPSOuNfofc1WlQOjLBwR3fY88j0AElaCsBrsb7OqffY+96KmwkuFd5QgczNU6z1rLzVJ1xUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:34:18 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a65c:3aa0:b759:8527]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a65c:3aa0:b759:8527%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:34:18 +0000
Message-ID: <20f02345-fb0a-8ec0-fc4e-1434b5a9466e@amd.com>
Date: Tue, 30 May 2023 10:34:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/9] Support Wifi RFI interference mitigation feature
To: Felix Fietkau <nbd@nbd.name>, Evan Quan <evan.quan@amd.com>,
 rafael@kernel.org, lenb@kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, kvalo@kernel.org, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Lijo.Lazar@amd.com
References: <20230530024227.2139632-1-evan.quan@amd.com>
 <1502188c-c527-3038-2163-5ca4f51ed735@nbd.name>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <1502188c-c527-3038-2163-5ca4f51ed735@nbd.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:806:28::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: af383cff-fd7d-47d9-53aa-08db612354e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nW7Sq8Tifd6F+Q5pJxQ37xdppZT7ofqtdhs/0pRT1N7JqnNHczMgePhq8W8ZuCWzV+0srJWZhcKz0uyJg7hr5l8mhfJcWcjgL5draXr6RbPfogsCOV/FaVy+nKoY7IkK3tlBIAkBMW8itWwY/twkk6Yh5cB8bxPuxtbwVk+nX/LsS0YGbUthq4J5BNKLwSYpyC6gzVhS0lGclGjm43AaqiTzjQOacdRZilzWju7+3HL5GM8NlHte1V6OW23j3cSglT4u0RrcW1XOCzbGhzRM5bSDQimY3TnNYBEFIXUXgV6CRioYzNqmHq8zhYY4/j6i10Rh/AjGUg2y0DmEkmtjQXjlQY8XSdiHRUR+a77o6NbBmYi0Wdz4BWHNWmOsQ1ID7E2lCt1jPwEid52saiHS6z/LHNbi4xpnsCgcjduFg+hMjRC51C6j/IbWzuYjHD/MvjHPAB5XDqe+pqSvv4Tje1Ke1HEJPqGUsUh/le32qvF0+HAULCtOlchHYO45gIYCG8akTjx7w1wRwuVr8dt9j72d52/ID0MuD7tzNB7RU+5C5rsAQTQR5ADPm2cUbYkWjs+/8KGnqL44vg0tv0nG4WPkjj3pW4PuP0Cepjrx3So/2kTmJNYvyhV04aEROG2FDGYDX5BFharWMgqyieXSf05zEvsaJax4E4Kktn83yWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(478600001)(110136005)(8936002)(8676002)(7416002)(5660300002)(86362001)(36756003)(2906002)(31696002)(921005)(6636002)(4326008)(66476007)(66556008)(66946007)(316002)(38100700002)(41300700001)(2616005)(186003)(6506007)(6512007)(53546011)(26005)(6486002)(6666004)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUxBRWpBdnZuekNiU25yRTQ0WXdPdEVHemk4WSt6a2pGd1NSTW5qZWFCT1ov?=
 =?utf-8?B?NHMzUUlrb3pHaWtwUDdlZ2VKWEF6bGZ2ZVpQQ015SC8zellEcXlhT2wwWitq?=
 =?utf-8?B?bDlDcGlqaG5hNzkyR1d3UjRDdTM4ejRIY2NpTWRuSmJWZlArSTRjcXNINHNR?=
 =?utf-8?B?V0RCVlFJN0ljV0xOUTBoaEppNnZ0OWkzcTk1VTdvYjNlTG9ONVRzbVVaYUJk?=
 =?utf-8?B?a1p1cTBIbW51MkJ5TXJRUWhIcG1GYmc1d081R0hPRm5KaXI1aWtOcU4rNXVr?=
 =?utf-8?B?WW5pTjRqNk5ZbkFwb2srNWZxMFF1U0JVOVFVM0ZUUlBGRHF3UG9FKzVYVWYw?=
 =?utf-8?B?aHNhUmdobERnaGxoc29kNWxQYU5rQ2dpRjNaNlFaNm82MEk0YkRFbWxYS01X?=
 =?utf-8?B?eVgrUk4vUGRLaDJSSmttMUwvYU1yeVc4bFk5MitveEtZdk0vRUp0cHpNOVps?=
 =?utf-8?B?MEVoaGVFODhlemlPeGMxcU9mSlYvbllFUVQwckQ0aFloSGpRejVldmNtcHpm?=
 =?utf-8?B?QzFZTXQ4T0U5OVNyOU55ZkdldXI1U0UrY3B4emRHTU9WSGJManZvc1JNRVpi?=
 =?utf-8?B?QVFNUkx2TDFYaStYVjJCQmVTYTV6TDQrakRMMVZNK2lSN0FhVW5nQm0zVEdu?=
 =?utf-8?B?OWhKT0dTb3EzL21aSGRMS0dYWFNQY3VjT3F2MkxzMlBrampIakI5QUNPL2xZ?=
 =?utf-8?B?V1g0SjVFL05Qem5aTHQrUWNBUko5ZzlrbHNMRXZsblZzamxHNEZ1NFhxSEV3?=
 =?utf-8?B?Q2NNMUJyNU9DekVSTUhIeURadWwvc09QYjNwZXJqcFY5amVFYzBUVDFmdUF2?=
 =?utf-8?B?cXpSMm5sM2hBQ002WnYyUW54ZXFpUVJJSEx1VXozcktTL0tqRHZ6aVVPK1lD?=
 =?utf-8?B?YWdnaUpoZFF4Mml0bGN5TE01QUlSdzBncGdMTHBmMjY3cEZsNUhUeGV2aEFK?=
 =?utf-8?B?WVBQclBhR3AxNGVmM0ZTRHp6MmJCQTQzQ3NmcFRIQ0t5VmVQUDIyWlRZNlZD?=
 =?utf-8?B?QlFvNDR4US9iVnp4Y2FrVFlpOFN0TGpEa3U5ZUpXK0NBYUtJY0dDSHU5UlNY?=
 =?utf-8?B?aUxpeWQ3KzJLaVhsK2xGVGJqVS9pOUZ0TzQ3VjRpTzdJKzFuQjNNdUtXRExS?=
 =?utf-8?B?djlvSUhoTExaMTJDaVpMM3NRWTRtSzM2NHA0WUVZNUtIMGljbXdNNVlnUGNn?=
 =?utf-8?B?QnBoYkJiVlFLYzlFUlI5SzA4UU43cmhFKzViRytYZzd5MkVtVXRwcGxxTmpu?=
 =?utf-8?B?TVQzT0hDQitWaDE5d09MUGZjRnVNWXVYZ044VTY1R2ZLY1dUWE9hcUlWZ2lY?=
 =?utf-8?B?eWVHVUlnZHhLRVlqdTdXK0tHWjRkOHllRUJ4OGVmcytXdzBzWFk1QzZDZFh0?=
 =?utf-8?B?RkpxYjJVUmg3aVVoMXlMNmZTeXNSUUQxWGF2aURHNkt5MUV2NUk4MGJIeEl1?=
 =?utf-8?B?djJuTHBtTmpWWHFMUXBuMFBKdUcyd3RvR0pxSHg3STZvc3NGR0IrbjYyck5v?=
 =?utf-8?B?TzBGdzk5Z2hTTWZXY2pqSTNiV3FlL2w4MldKK2p6Rkg1RTN2Sk1VYkZIajJn?=
 =?utf-8?B?QXUvN2wraytRZ0cwZ1FUeXZ1M3EwdlRDSzlnZ0VraURWRzhSaTdrWEN3bXpN?=
 =?utf-8?B?cVcvMkY5UTRiVnZHaGpvMzRFMkt3VkJ6bzR2OUJ0MjRUOW9MNThvSnFHWDJF?=
 =?utf-8?B?ZGpZdVNHVHJNZmxRY3E2ekFYcWhVS0s0eEFYcVVJa3VlZHg2bWJuZm4yR3p6?=
 =?utf-8?B?ZmxnaDBaME42d3ZYWS9MWFJDalBkRGtkc1MrRXB1V0lKWUhFRnJyeXhwUFJY?=
 =?utf-8?B?SnI4TjdoMzlodmQvWFd4blVhQkRGOHhlLzI1MlRpOVlMMlNIamJBRVhsZEZI?=
 =?utf-8?B?L3NWcU5rMDgvWVlRR2FOVUVIck04d3M3bGtoQ3h2MEkwOUJMdVY3Y0dNcEhM?=
 =?utf-8?B?V01JOUpJYVFMRktDeGEyNWpuWG5QNW1yT05UbnpydndzSllPajAyUHNFaGIz?=
 =?utf-8?B?MVd6bzcvOFgxaWp2K0pucDh6dk4rd1RDazZCNVMwZmFyRUQvakFQOXZYTGtw?=
 =?utf-8?B?MG9YK1dISmZ0eXJIQ1QvQXhsbHNWeHRubExBSldrV1U2WEhjQnc5THJwclYy?=
 =?utf-8?Q?uoOCqFxhx8NlGO59Wf0B+XGAE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af383cff-fd7d-47d9-53aa-08db612354e0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:34:18.1431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlROpklVcbIS1fjk468ZoJGGTAwGvc8VjKG/lHykMtepzJy7HrI6y6Vz0q/ysMXIIXzk0w8VILs1RvmymMyJaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719
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
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/30/2023 1:22 AM, Felix Fietkau wrote:
> On 30.05.23 04:42, Evan Quan wrote:
>> Due to electrical and mechanical constraints in certain platform 
>> designs there may
>> be likely interference of relatively high-powered harmonics of the 
>> (G-)DDR memory
>> clocks with local radio module frequency bands used by Wifi 6/6e/7. 
>> To mitigate
>> possible RFI interference producers can advertise the frequencies in 
>> use and
>> consumers can use this information to avoid using these frequencies for
>> sensitive features.
>>
>> The whole patch set is based on 6.4-rc3. With some brief 
>> introductions as below:
>> Patch1:     Core ACPI interfaces needed to support WBRF feature.
>> Patch2 - 4: Enable WBRF support for some Mediatek and Qualcomm wifi 
>> drivers.
>> Patch5 - 9: Enable WBRF support for AMD graphics driver.
>>
>> Anson Tsao (1):
>>    wifi: ath11k: Add support to the Qualcomm ath11k for ACPI WBRF
>>
>> Evan Quan (6):
>>    wifi: ath12k: Add support to the Qualcomm ath12k for ACPI WBRF
>>    drm/amd/pm: update driver_if and ppsmc headers for coming wbrf 
>> feature
>>    drm/amd/pm: setup the framework to support Wifi RFI mitigation 
>> feature
>>    drm/amd/pm: add flood detection for wbrf events
>>    drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
>>    drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7
>>
>> Mario Limonciello (2):
>>    drivers/acpi: Add support for Wifi band RF mitigations
>>    mt76: Add support to the Mediatek MT7921 for ACPI WBRF
> Wouldn't it make more sense to put this in mac80211 or cfg80211 
> instead of duplicating the logic in different drivers?
>
> - Felix
>
I think it's generally a sensible proposal, but there are a few things 
that need to be agreed upon to find the right places
for everything.

1) The actual notifying, would it make sense to put it directly into 
these functions?

ieee80211_add_chanctx / ieee80211_del_chanctx

2) "Where" should the WBRF support detection need to happen?

wbrf_supported_producer needs to have an argument of the ACPI companion 
for the device.
What level *should* the ACPI device be found?
Should that still be individual drivers calling a mac80211 helper 
function to indicate they're opting in?
Or should there there be some CONFIG_ACPI_WBRF gated helper as part of a 
driver registration?

