Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59754F80D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 15:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1329C11ADB2;
	Fri, 17 Jun 2022 13:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400E511AD59;
 Fri, 17 Jun 2022 13:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7ajT80iVmNzUNa8ItRk6xhUcTrij1QwvxKdq9wdIOFsL6Z/+wi2ik6HX3SNrtS+rq6MQeuZVCOLB4C93CAP8nEhkA68z9IACLnLtT50N+IcPaq/y2Ng9QdcYQeIe75eBmYmYoY3v1zGwqv6hZsRlpI3bo/Lcx0UhTMu8XJ3QkInRXf8zF0sdD20LYdsegt17eDp/1ZILmR5RA/wYrlETCZ3zBS7j/kcJ1zd9xZMmUVROqXlRo64Vn6bZEb0nDplpRgQpt7u41z2a3R4i07u3zc0HHZn6TeVwtCpzbzuVvR5YtS9JcfQZK5L8bWcDDYaJUc3Ky//UICK+P/GQIW+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwQFZmSqGh96riDSnxPPeUMKElXZA7u0qOFd06x5ulU=;
 b=i19F5QKYxbzV7i+lEx5hhOnuuAY9GKk6kFPVP0zFb2zCk4OIR9j60wilpiKdE0L2NasY+Z1kyKjwu7aEHrYe24B/KPPlIhLK7aM/0hfK4HH4M2tGcYwJ8WgayjbjwPMkBqua0mEkWr1lOWCpeWWU13MEcz58lQFwZ517Na28vYsLJlO93nTGvB6cuogPHvxLmuiYmHqK5BwzV5puEjJMarwgFyPp7gnXwrbaiYPIDOG0qlsNKxNfNYLlElwK6+lgQ64xJkMnJCsbrndudhUZaspwUKkKucFELUjR1i2I6+ES5MNhjWoUlI+KVywgm8Bn/bwB3DS5dXAXrkeK/XGeQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwQFZmSqGh96riDSnxPPeUMKElXZA7u0qOFd06x5ulU=;
 b=uLRmuN895+lvGHIaurhbWKk4wE2B947Abrn7kIkLdlyuVrP762UnDhHHIVdJcQe+y5d/pAoAertARZuwgI7qEEZO2sbmeKzwfI2gE15+xmIvAzt7TCBs6bpAsMOYxxepWkGBBYKg2tj6t4AOBEuHU6z217vn5pqGKpVzjw2ckUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3158.namprd12.prod.outlook.com (2603:10b6:a03:13a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Fri, 17 Jun
 2022 13:01:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 13:01:25 +0000
Message-ID: <7986913b-66a7-85b6-c563-392049e057fd@amd.com>
Date: Fri, 17 Jun 2022 15:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: radeon driver warning
Content-Language: en-US
To: John Garry <john.garry@huawei.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
 <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
 <60a97869-fe1d-08cb-3241-91377d62b739@huawei.com>
 <7adf78ae-8f2d-e6bf-2054-fe61dfd4b21e@amd.com>
 <b481ffa8-451d-0a9c-e708-44047e0a8bc9@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b481ffa8-451d-0a9c-e708-44047e0a8bc9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0160.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7295d4c6-688b-466e-5d5f-08da50617c72
X-MS-TrafficTypeDiagnostic: BYAPR12MB3158:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3158EB63EDE39EBDD405712F83AF9@BYAPR12MB3158.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZehyzQjfIGeEOeWXUF5m+ouQpBo1XTphmeodpsOUq4b/r074VHqaq6eoJ8+HHORKtaFeANEkcOpjm2vTIs9mF8wQ7xKFRbOug/KIaUgTaKFtK7+UUXepQkIoJc50OzEe0gPMMOIKztMy+VZIt1ZpD1/z8qqRltAwDRP5NEB13cpRBI7dSNpqCTwWE2kAejBS3pY1I42wbOAIOCH/LLhu+pQfEk2EecNoUtmDujR320sHo5F6ByZ+Bx50gXIrr3fW3I5BHIR/xBH/DdhcHbxbvJiEeeoID1c1nIhu+Y7MJhOByLy3XaRp2qV/mPJXdQJQ0dME4GThE1MfXigvcJFhjzcbmjMmJ9gnuAfy+S0YeYQTKVQXIgFBamyu1geuJlj7PKDPbSZF+PTTGOst+VzFUbWxsbSpFPh1GewqUpsOjVswz66Kpk+tZQpH9PAZnxUqF2DmbFZhrp7RytXQN0KlxK0mDYMSmQTZw33LnWrrl1qKTvhKJQXiX83pCqC0zUkTo1ivyPfBhLMUpBsfeBmAnL6IgjZJRMt0rKUJJErVA2/PpS096RQRDPHqxAvt6uYdzY/MFXuejvE6uwFfkF9+An9nAxHhVEoncV7RYnFdj2nhm++C+k1q6JXEjfIWzeaqNQIC297DNJvAERbdDQ1SenYMRYPf5TTRZHo3gIGRaDUhepDqcF+r6imuwIgRqrvpxIGV/wdEaGulK0t6710tKNrOlIGgYxTIZ5yfIV/qQoJt6UDEXrbVi8+Nm6sVgCz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66946007)(86362001)(8676002)(31686004)(5660300002)(7116003)(3480700007)(498600001)(6486002)(36756003)(2616005)(66556008)(4744005)(2906002)(66476007)(316002)(6512007)(53546011)(38100700002)(66574015)(8936002)(83380400001)(6666004)(6506007)(31696002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhyRFc2anNhSW1pMFFOTTQvVldIdmk5dWg0QWY5U2xscE9OeXVqVVZ6WHRL?=
 =?utf-8?B?U3hZQzI0VFNPY3cvbUJvVHJDTHFOeVVJMXJCMzQyVlFXcWhSS3UwQXpaL2dy?=
 =?utf-8?B?WnFyRXRQOE9Bd29iVWVWbUdoTk45T2NHdW1vRnhRRWxMU3RhdWpTTkVXejFH?=
 =?utf-8?B?ZHM5Z0w1ZXRUSG13L0ZyNVpybTV1aTdtZFV0Z0UyVllKQmMreHI4SE9sSzJT?=
 =?utf-8?B?WmdhT0xpUHMwbmR6Q2trbitsYWhOT2crVnBmb2JQcmNGbU0xVHJ1MjZEQnZB?=
 =?utf-8?B?OUVBTkpwc1c4ck0vald0TUVidjRBTFN4Q1l4MUZCd0R6ZXlXSjFWTER0S2sy?=
 =?utf-8?B?T0FHZHBvYzZscWVEUW1EbnhYc3VsNnBvUU9XTFJYY0t2YXR5VmJNM21Ic1hq?=
 =?utf-8?B?WC8zTWszeUNJTS9BbFI1dVJKYmEyK2Q2U0h0QW1qNnJndVFhQ0FhR3Q2REFu?=
 =?utf-8?B?eVllUldIdTFVZ1F0Si9scTVBTmtzK3U1UlR2alVJTXlxU1FpME4xNUV1MUZI?=
 =?utf-8?B?WDRRK1lTNEd2RFBEbUhEUExmS0lZMUhFek5ZRHIwdDRJRFVrTGxSb1VvUmpK?=
 =?utf-8?B?U1RwTjBTQ1BzYVpsYkoyL2NXUk01OG80VUY1L01HS1ZkNnZDL2FVZWNzblF5?=
 =?utf-8?B?c1NValJYVTFzYUNwa2xxNEhGdUFUNGo3TVUwdmI5dXU0K1dEU1o5dkdHTHpy?=
 =?utf-8?B?aFY2eXBxMzdOeVZmc3RPMXRmZGxaMzRPVW80OHNiL3VJY2JjZVArNGpXdDJ3?=
 =?utf-8?B?dGdOcTdDUjRuZzZhOUorbHZxK0RoeXA3Y1E3UGh6aUNvcHZ5dWRXaFlscWVu?=
 =?utf-8?B?bUExRUdjWS9FRXhqT1J4ZXJPOWltQVVqSGs3a3luVjVaeXZobmxFbzQzUVdw?=
 =?utf-8?B?K2Vqa1JJbFJJVTdCcmRoSlZRQ3ZuZGpuaXNkWld3OFJxU2NRdVcyWkE4Vklm?=
 =?utf-8?B?QndqVFJydUVYRlJPTnJxV1pkcW1PWDA5anF0WnkyT2I0WnZoS0J1RUh2d2Yv?=
 =?utf-8?B?S0VCM3ZEZUV4akZCK2JVcWhMU3IyUzIrZm5tZEtNekxZZjJ6Nk81RWhoWVFX?=
 =?utf-8?B?NVVmenJocHZoaUxtRlRXekhlcVNMaG8wSmN3dFZzeUFsSkI5eE42S1B2Ukk3?=
 =?utf-8?B?MS9KVmF5bjZMdWk5c3RyekhyWjloSzJsSExabEp2YUFkRll6YS9nOXY0SWhx?=
 =?utf-8?B?YUNoaTJzdDZBRFNhc3lXY0N2ekI0aW93aUdLTDlLdmR2TFRmUUNoaHJRM2gz?=
 =?utf-8?B?QjdIdG0rZUlEdXJrVFphQVNmZldtNEp5UjF5dFcxRUlRVGV1ZDRscm4xZXhO?=
 =?utf-8?B?bnlWR1lkU2dNbjREUEVjaEhiMFIxS3VaNUJ1T2RtNWVpN3A3RTBKSUJMTjc2?=
 =?utf-8?B?aU1VL2xkRUlYbXUyMUJqVWNITndCS3JjalJBeEJGbWJhSlB4Z2hYZEJJMHZj?=
 =?utf-8?B?LzdGMTM0Vng3d05IZk5jNUFZYy9raDJPRFFaeWdXb2V5NDQxVHdiVVpWR2pX?=
 =?utf-8?B?Mkt5OTM5ZFZjWGs2ZGh6U3dscklPUThmbk1JVGlVQWtFOERITXJ1SElHeGlG?=
 =?utf-8?B?ZHR1MmpLOU53bkhFcktOUVp3dVp1VlF3ZS9mZ3hZOEI5a05EWm1yTHlCWjQr?=
 =?utf-8?B?YU11ZU9nZTZueTd2NDRnSmEydXZyU0dWVThnN2owNDRUajVxZHlCUHBZYmlj?=
 =?utf-8?B?eGcwanhSZy8ySW5zaUgxSFBzck1rMTFHRks1a0VmTGZxS0d1QzE0UHlpNEhP?=
 =?utf-8?B?eFNyMlpic1c4QUdiRjJXbG01alFoRERnWFNpQmFnOE5aUDNnYk5UR1djL2h6?=
 =?utf-8?B?OENGV2Y0K0k4eVlEUUVvM1VlWmVBRjNmTlBlb1QvOXNHOXpzRkJwR2l3YWFY?=
 =?utf-8?B?V0U2ZEZKQkFGWkxQdlBVYkZwYWEyUk5hemlqYmRqeWZMYnRYeVRCSy8vNVIw?=
 =?utf-8?B?NldreEpvaWwvZmE2L1lCM3lIRmlPUER0eFZzTlFDaHBuVkJ6ZktQREhxMzIr?=
 =?utf-8?B?Z0ZaV3VLV0xkdERycWhJMmVXWC9OdmR2WlI2UmJHSUlDaDdzSFNXWERuR2Rx?=
 =?utf-8?B?QUdpRlM3YmdKV3Q4aTNaT2p6dzVkQ3h1SzI4NWhtampQb3k4OExzZWhNNDgz?=
 =?utf-8?B?ZElwRWVpQmNuNm8yOE90U0tiblNZRksyOWc1RmdNYzR4UXRTaGVWRWFVNGZY?=
 =?utf-8?B?UnM3MVJBRW5GMHhuV2swYUc5SllWZlp4aHZXa2Z6VDQ1YmdsN2EzSkZtaTBw?=
 =?utf-8?B?T2VmUCtiVmNEWkE5WXF1MlJsMzNoZXg4dmo3TlkrS29MdmRoVjNqYWVMVHV0?=
 =?utf-8?B?QndaWkZHTHVGMWlYMjdNaEpVMGVubmtDRW04cUZ1eWhoblZ3a3ZOVjF1WnE1?=
 =?utf-8?Q?GirLyDSnj0CqAHNoI5YCFBGlq7e4yGWhjaIZt93W/nZc4?=
X-MS-Exchange-AntiSpam-MessageData-1: 6+XAeMbdj5EHxg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7295d4c6-688b-466e-5d5f-08da50617c72
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 13:01:25.8140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMvFznDxDBWYemU550LmVUVt6cUaeNeWqG1jJm/Omlhv52BodJMADK6o1xg9AWYx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3158
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

Hi John,

Am 17.06.22 um 14:01 schrieb John Garry:
> On 17/06/2022 12:57, Christian König wrote:
>>>
>>> And/Or compile out the warning when "warnings = errors"?
>>
>> That should be doable I think.
>
> ok, if something can be done then I would appreciate it. I do much 
> randconfig builds as part of my upstream process and anything breaking 
> is a bit of a pain.

I've just double checked the code and we have already wrapped the 
warning into "#ifndef CONFIG_COMPILE_TEST".

So the question is why does your random config not set CONFIG_COMPILE_TEST?

Regards,
Christian.

>
> Thanks!

