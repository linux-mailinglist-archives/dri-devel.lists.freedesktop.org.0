Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1F47CF86
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2F710EB7D;
	Wed, 22 Dec 2021 09:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A4710EB38
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 09:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzMPpclO24NQMyQ+IpSoV1swk5+ND8D+o1bR+Y4BEAzGdn3d3Z3NujoBVR+vUH7vYoMCYyzdbfKbqhJNJolBjwxJTXEtm/W55442jUdpzWW8g3vMVfOmbzAjjGWZeQKHlL/EWrN/ruytBivv55WAQUkRGYcDY7Ik/M8jjm57EDn7F1iJiuB3TlJNfXfizynHHMP7zitw+K35wVo11N4y6CIjHlys55oxQaIqFmqBW3x8MIWe0KILkZ4P2ZswQ2gO1vylsRW3tQLbZdma/EdaM6kuQ8G0hiMa7XS2Qz4ELyuxWTw4PlWIamDq/CyqC9mFhPgzdEehTj5k3nJgMl8wrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6/H1GKg53NZy7qRcixvZWSQFRsR3KPuySnYlDm85/Q=;
 b=nCWfaQ6HwmouGQRuzsN5Zz63RQBqW/Jkrne5Dfib5Q+nwsxo3Pa9C4b7yGvFJEQpd6EbxhjDNltkRjVl6ovZwEtP2A/5k1kwShaHshZ5ttt7Y3Au3Hm/Hrl7NLt4srvnCFoMKmevXVAAeNdQ9rW6UoMepPGQ1qBRSBMkQn8TVy3EprPUG3Hqc1URIG9S55/KeXjHv2jW8DCmycK8myoB1Ls/zHkYdTuC74jTVtisOpDKmzTw/S3U87bme1Nfa/Fmm8m5kXtMtIivnSjOjgGJSeonnKgjtm+VGoMfLXE/dAb0Vi425tSy8qv8fAYC5YXaIkCxf/YAlqgxJkM+8NpxYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6/H1GKg53NZy7qRcixvZWSQFRsR3KPuySnYlDm85/Q=;
 b=tNZMDmpKMNX+GL36wH3Kw3DZTcB6K8zmrzucVOmWOjbgg+mpTI2bPEcPJTY1lIDZh3S/Mov3Ch3HxVu6jX4yAN00eFZzJB6p/R4U9qRPdno5FYE8Td3JJBpukFZe96TkQRrdrk/AJvqjILDr5czPS25Zh27qjGXNvE2UNpwfGa+MhQ8Vpx1inYY+T1+h8HkHu5q2zl86Z8aPcLJxm7KM5R1O1g79Z7oKADHPIOE2FPOOQDdq5sUhAIIsCrK2anokFsecuOjiiujJ1QMIdqeufaWaQMcSDEaKF/y1Dxs53sv8VZYYeLUh/D/0gO50r6jWFWWSv/NK6RSByt9duLKzTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5443.namprd12.prod.outlook.com (2603:10b6:303:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Wed, 22 Dec
 2021 09:47:46 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 09:47:46 +0000
Subject: Re: [PATCH v16 08/40] gpu: host1x: Add initial runtime PM and OPP
 support
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20211130232347.950-1-digetx@gmail.com>
 <20211130232347.950-9-digetx@gmail.com>
 <21212ddb-205f-71d6-0199-d75768eaf32c@nvidia.com>
 <41edc53b-5ed1-d524-2546-c3d1ee6cdea4@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6652ac84-36f5-0e43-65fa-04786f384f21@nvidia.com>
Date: Wed, 22 Dec 2021 09:47:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <41edc53b-5ed1-d524-2546-c3d1ee6cdea4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0065.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f6d0281-5ac9-44f4-b857-08d9c5301b7a
X-MS-TrafficTypeDiagnostic: CO6PR12MB5443:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54434E63AFFA38C746AE11B4D97D9@CO6PR12MB5443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jveoNZaxXnq3H9x2n1adaiVOgNwvxG2vJ8NdhoVyVMVJYVLoP4dJRgZeAvTAI/r6950MRTrgAy9Ivl7oOly2dYK3KgxTntJqb8Bxk/JNfRl9iJHRbKS3la17laWBylZz3syD/Y/tr1zu6G25rA1pfgRI6bqTTLW2yJl3xpp3vMFIISZRZDagML2LIcD4zDHPDcrbfsrKAkQPWJ6QniUiT6jPNLgmCp+tS84pXI6gcEo0izukigmli6AnjBtjXLzGBnNULsgDOlR7nR9+QjpqnO5KPw23i2X/hV5ZRAYoE78J/FlTcRcYNV2644o2qxwGpK3EoCCRkNsUb6KpwXfpQoZA72R3lENScgm5s/W/WlypYjkdHzkmYn57VQFX08NkETQ39tA4hsRfZxV6ZcliL110kP6Yr+E01GglYTPdh9wVs6g/zrfU1GDQuGK5sayD8WYXa0SntFWkQHgrX30WkyUcpipJgREtWkj3UNYDNIL9IH3sSdk35WlrZYFNF3nhm7yCYFC51dv5jyXQ8EUHPjN6tC7WnQhRWoqQ/P7mcAcpp9ju9kNtHk8/gIicF5SIoA6OWcWJIQFgcdT9ttnosIvOMQ5XqObEiTC6a7GstKEZqNO2xlA2bS5Qv1s47aYeoLfRKmEpoUeatPsBTYQSSq6rEp1t8WQCcBkUOTjcXsi9ax3X5kGOr8mqnVDUUoHGJyOcNW1MpAB0cLhrnsfpZG6iKq4udbSzSv4jbpsQDnCsTvi1SjjSEGNjxWsKXmlOHp2fC0M7w/1gY5sun0Vpm86BrsiXa+KyeniHmXm4TQv2z3KWlBphKazhKeq6TKld
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(38100700002)(4326008)(66476007)(110136005)(53546011)(66946007)(6512007)(86362001)(8936002)(55236004)(31686004)(921005)(508600001)(66556008)(6506007)(6666004)(2906002)(36756003)(186003)(6486002)(7416002)(83380400001)(8676002)(2616005)(26005)(31696002)(5660300002)(32563001)(45980500001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUZ6WnZPZFFOSlUxc1llaFpuaFU4SSt2K2RVQkRvVjBWS0dhbWFlN2xZVlFp?=
 =?utf-8?B?d3lMTUhFVnRWQUFhbWN1UklrQnMydzhDWHp5blBaQ3NsS0NaWDR4NUtVeVll?=
 =?utf-8?B?b09hcmdYS1MrR3dFaHNqSXhva0JocDhBZy9UcGpTZ1FsYVN4UkROUitWdGRY?=
 =?utf-8?B?eGdYVUtoVytBNk93WkhaSFhNVFhweERYcHYrbTVFKzRTamZ5eHFuZ0ZDdkFp?=
 =?utf-8?B?Sk4vWStFc3BrOExDTTR6Q2t0c0drUFlwWnZ1VmdITGlkcUZhcGY2TncxKzZq?=
 =?utf-8?B?YmlmQ1I5VU9QQmFkUVd1QzFHdEVSVjFsRE00RGNSdjloNWpwakpZRFhvWDE5?=
 =?utf-8?B?ZmFINnhRdFRpa0VJZTNBNUNIWHBtRmYyYzJCcVVxbXBBYUg4dEkwVE5mNzRV?=
 =?utf-8?B?b240QjZSNnJ1ZTBNbG96ZHdjaUlPU2RaMmxESk8rbWZRMUtlMTM2Y0YwbTA5?=
 =?utf-8?B?TVNOekdIcmM3enVnVHZ5RVR6bVo4SlFwZVhJcS9Nbld1bkFySTEwd3Voa1dK?=
 =?utf-8?B?Y2x4Ny9XeU9LQVdBVW9IY2tjSmdUMzN4Q1owTUpobWJ5eWdHaUxaZEduTFFS?=
 =?utf-8?B?aFcwRmRhc3RENytNYjQ0aDVGS3I2TWM2WjY4UmdwQ2xCMXlWdEtPQjZERDJZ?=
 =?utf-8?B?Y0Vlb0x3b20vSjJTVTVlTmx1cUkxNEs4VmlIQWVVdThaQzdzalBaUnNjenR3?=
 =?utf-8?B?cGVpNDZ1cTQzV2kyWDRwUE1zMHQ0Q0hKNmtOUmxEVFpYdysrcmN1cVp4dVh0?=
 =?utf-8?B?OUpBSCtJdVlqTVBVdjNiTmNiQnViMmZ2WUlrSFA0ZVBnWFJIeWVXVk9vRStj?=
 =?utf-8?B?cFZVMU95ZThBWWtmZ0d4Z2p5T3FqU3lxMU9Xc2kyU0JxVFhCUFZoMWRWT25n?=
 =?utf-8?B?aUZSZjZadE4yaGN5Z2VxdDN4eW5ITVp1OEZhckJhMGJPZmJROUpxR05Db2ly?=
 =?utf-8?B?OFViMHdMYnFsYTVoa3BURmN4cko3T2FZM2ZnMi80NjNxL2ZWSGtMalI4R2xa?=
 =?utf-8?B?RUNKdS9ycTZweHR4aHZGaHoxL2krMUlQYkkxY20vNFFhRldiVVpiQnNXRG9n?=
 =?utf-8?B?THNYUTdFaXAzLzlmeXlNTldwRnY5bXJTbnRZeUFQZjI1bEliMjd4V21pdmg1?=
 =?utf-8?B?VjZYYm1vbXVLdlRsQzI4cXdHUFFWMUo4dGVuVTJYc0U1aXdwWWtYRXBjUi8w?=
 =?utf-8?B?eVpidjBIK3B1NDRpMFdQZjdDQlMzMkpyQzFwOE5YUS9nWlVMbDhoYm5jVWFF?=
 =?utf-8?B?Q2NPWVVDMXRNNkVNd2RTc0JsTURqMllPUnhLa0w3QXZ6WGF6Tk4xc0VpN25R?=
 =?utf-8?B?UG1mSEFnWXJRczZkQjhwOU5udnlSaktvSU1pS3VOaGlYd0FXazR0dDRjUzcz?=
 =?utf-8?B?Nk84QzROOXVTVWU5b1hZbVRzemlkOFlmYzFVd25kQko1MGd4eTNKdGE5YkRq?=
 =?utf-8?B?azM2UU5UWVR5dS9ZNmwvQXdKaWFwWVZFUUZJdFFiRG4xRS9wZkpOT2RjMEtt?=
 =?utf-8?B?TWFBYXFBL0hZQU9yTUhONHdKcTZwcVF0ckZnM2cydkoxWFQ3TTllQmFLOUNv?=
 =?utf-8?B?UDBxS3lEeS9ZVFJPbnQ4R1UzQlkvVmRvM2Q5VDducjMza2pkS29BZHFaSitL?=
 =?utf-8?B?UXBwQzg2VzZyRkhOOFpyMHBpYmdWQ1pTdVNORFZWR0w2c3g2RllhWWlBeUdl?=
 =?utf-8?B?UEloaEx4Mzh0TjR3ZGJqOTB4SVdYcjBLMlYxN0lHY2c4L2UrTXpMejJtaFY2?=
 =?utf-8?B?dUdIMXR4WFRUYzNJOGN4dW9KelpvNEF5ZE1TVURkVkt3UmlXWFNLaWczc1FP?=
 =?utf-8?B?YnY5ZFd0Rjg2QXZRTmxTc01JVXBFeXh6T0QxNHJndmRET0tJWDJjKzZSemFY?=
 =?utf-8?B?WVBBOWpzRHYvRVdxYlJxeTBVLzhadEQrd1AvZThRRGV0TUpSQTAzQjZCZFBk?=
 =?utf-8?B?VUdZNkJ3SndnRnp5QVNRT3Z1ZitHdytXc0wvRmNUNUJXbG03bEJkQXB2b1V2?=
 =?utf-8?B?djB4MmtaeFJWOUczV1doMzdGRVZXN3A5TG1QcDJvUUxYUXNDeU9hYXl5SG94?=
 =?utf-8?B?NmVnMnI0MC9LRkh1djhvdFVJR1pwcXZIbDF2L2Q0enpQT3dWVXo5dFNRZ0VI?=
 =?utf-8?B?VkVLWjE5d3pBN3ZGb09MOS9GSzcxSlpnTkpKQmh5cFRsOW4ySFVjNTBXWldO?=
 =?utf-8?Q?CQj+yUjcdbL26oT8KzZXU8s=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6d0281-5ac9-44f4-b857-08d9c5301b7a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 09:47:46.4106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfcngIYu/3z1iepuyxGiewWriAKBLluLYsWRV3rXvKJKr0T2px1OB0YHd9omFomuQWQQ5hskQEwnP0zWi/HULw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5443
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/12/2021 20:58, Dmitry Osipenko wrote:
> Hi,
> 
> Thank you for testing it all.
> 
> 21.12.2021 21:55, Jon Hunter пишет:
>> Hi Dmitry, Thierry,
>>
>> On 30/11/2021 23:23, Dmitry Osipenko wrote:
>>> Add runtime PM and OPP support to the Host1x driver. For the starter we
>>> will keep host1x always-on because dynamic power management require a
>>> major
>>> refactoring of the driver code since lot's of code paths are missing the
>>> RPM handling and we're going to remove some of these paths in the future.
>>
>>
>> Unfortunately, this change is breaking boot on Tegra186. Bisect points
>> to this and reverting on top of -next gets the board booting again.
>> Sadly, there is no panic or error reported, it is just a hard hang. I
>> will not have time to look at this this week and so we may need to
>> revert for the moment.
> 
> Only T186 broken? What about T194?

Yes interestingly only Tegra186 and no other board.

> Which board model fails to boot? Is it running in hypervisor mode?

This is Jetson TX2. No hypervisor.

> Do you use any additional patches?

No just plain -next. The tests run every day on top of tree.

> Could you please test the below diff? I suspect that
> host1x_syncpt_save/restore may be entirely broken for T186 since we
> never used these funcs before.
> 
> --- >8 ---
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index f5b4dcded088..fd5dfb875422 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -580,7 +580,6 @@ static int __maybe_unused
> host1x_runtime_suspend(struct device *dev)
>   	int err;
> 
>   	host1x_intr_stop(host);
> -	host1x_syncpt_save(host);
> 
>   	err = reset_control_bulk_assert(host->nresets, host->resets);
>   	if (err) {
> @@ -596,9 +595,8 @@ static int __maybe_unused
> host1x_runtime_suspend(struct device *dev)
>   	return 0;
> 
>   resume_host1x:
> -	host1x_setup_sid_table(host);
> -	host1x_syncpt_restore(host);
>   	host1x_intr_start(host);
> +	host1x_setup_sid_table(host);
> 
>   	return err;
>   }
> @@ -626,9 +624,8 @@ static int __maybe_unused
> host1x_runtime_resume(struct device *dev)
>   		goto disable_clk;
>   	}
> 
> -	host1x_setup_sid_table(host);
> -	host1x_syncpt_restore(host);
>   	host1x_intr_start(host);
> +	host1x_setup_sid_table(host);


Thanks! Will try this later, once the next bisect is finished :-)

Jon

-- 
nvpublic
