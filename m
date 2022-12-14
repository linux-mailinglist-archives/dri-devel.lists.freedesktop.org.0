Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0C64C497
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B7710E395;
	Wed, 14 Dec 2022 08:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0228310E226
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4EiGf89HOyW17MM1cQ3/yGUViwQo8APTZEdqbjSDdihkuTZKPgrTvpZc/wtMbvNG2fJRX/ouPYl3SRH9agUZfYeJnBaNxyOaN5eNQ+8PR9SZEOjsKqpvV8S6mQHGGpm6FPwoXV8LboODpaCy+WD5SP8cENOEvsStf6h1R92S0T60LA0acI/C5GORr3KLOUOgxM1+OLUbr0mqd27iwd/Tt8wWBMOx6uriHmQ7r2LDAwGZW6AJ12XRyA9wnm8+CxmJ9HCVw0fRhyJjzp/0HLykFidLM+8DKtam4eISIo8Dqil5sYViSdlEY2TZ3YWprMf125W2cufzP3yCehPNR1NuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCEgxWQ3pat7h84+z6Dt19MdxvwduH5ayBOqE+99IG8=;
 b=VIJ7pIRi+W2TKpVulJs9lZtVf9Bn2c+oehXjTCD3Td25BkhZar+9I5ezpXns1SkUhphdkSyI0C01TXX23IyoxWTgmz5tVWabppckNRCvkUcyf4vDTqAr7emcjdNK2Pb5clZBbXAXWswm9NFrKbY6JIhuGnnWVBzD5Sb7iN0+L8GK6ncsKQbQP6R0nxxq8fjjfz8D8WrCeyRB4tD/kRlkerq74oZIGTlIxnNV7qGrRNyf4srsPrYNg5Y22WMofDmXyD9QPOdhWeB68Z/2ptynzswSm/3NMy5whmBRJc5H21ZXQer9S0N4ZRHkUmkC31hnWlOH/2cWdy4NBN6TVeSHnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCEgxWQ3pat7h84+z6Dt19MdxvwduH5ayBOqE+99IG8=;
 b=i4jUeUxXsqfnb2ldHnDY+bkpLpTd4hM7ZoaA7/l2UZ71MEAlt5SrnRW0+Jt6nweWvbrdkE3co3pWL7GLn6NunC3vaG2GLAW3TXloyTWaxyt0rcHCUqllQnAbLcOUG6F/shcnfvXwfoR7y8rz3AmVyFnxpXac3TFNpIAdBl5Vw2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7911.namprd12.prod.outlook.com (2603:10b6:806:32a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 08:05:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 08:05:11 +0000
Message-ID: <4b1f104f-3b2a-532d-3354-11c68c5b9aa6@amd.com>
Date: Wed, 14 Dec 2022 09:05:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [git pull] drm for 6.2-rc1
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>
References: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
 <CAHk-=whVsxgtwvnK2=WRvs_i+miknfB2R7dQ4U8oooBFJZYH6w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHk-=whVsxgtwvnK2=WRvs_i+miknfB2R7dQ4U8oooBFJZYH6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 500c3e7a-8b8f-47ec-1c60-08dadda9ec88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xI9MMiJdsX5a4FY01F5BAWB+CmNz7wOwoaB0Jj7dgp0hy+UvE9oOFdIkVUCNcnKVcpqjWYQxjTJiEa/qYAI0B7fQGlSkyTUnKcFvAQVwdbuLGu+b59kWCMB5ugGvja/dXsiG1uAleqf5m1zzkNtlWNVC1JAwLtJO4vwtZREHMT/qgI3JaLj2pQa11PNDH6xJVUhxFpWcfeZnJ7WgFMLeuXav18wLv65MRxmEeRjuBEyiTNHXgI5dwywce4y1yDmS0chjxMK4LUFJTYTsspznnnlx4N5DXCe1Rf5B7gaFTvqUL4/PrZSHA3pz0uX3wfNugwOXCkTlOXoZiUfCv9y3c8DQD+9TmvGcWJLMW+H52ZaFTQk5vBLH1YUigLu3lyJnDLEmg5SYXsRYmF2mLhx1gE+he0dSiwm6d2P1oxKBY5/y5zSq5ApZeSNlgT7QgLD29iRfm9ad920I4/v5Ce6duJhH7J0bOQGVHSw7Wn9QmwrHLKm4lReLklCVGVIgOydEQ/OnFe0/lfudwWghSqGu4oFkNXbEXtl5+1qdiqqvij+7xD95yGo9rTFu4co91/Ci3PWlv8Kv3jL6ws21txu4sXcjLcffE/joW1d8n6MSExgYxa16DA21fOwbMKi414CCc/WcHEy8WybTugHu7j0MijMzJzIEeMxcn3UBWw3BKut6kT9uQvRmjX7waj7JujdlOSlvY9ZkAHgz3DTcHnc1Gpv4jvJwaVuVxw7rHrxdMa8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(83380400001)(8936002)(5660300002)(2906002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(53546011)(316002)(6486002)(6512007)(54906003)(110136005)(478600001)(6636002)(66946007)(8676002)(66556008)(66476007)(4326008)(186003)(6666004)(31686004)(6506007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RllwanFpMkpaMFl2eDk4T3Z1M3VIYVZyNWhlOEZrRVhQbHpINXU5N3FMT2E1?=
 =?utf-8?B?NlJZMTRYT3MyQkIwMllseWVST05yL3NBZzlyZC9Lb1E2a1JUMW5IUTg1V25z?=
 =?utf-8?B?N1orblliSyt1OFNpcUcydVB1VXdJREdNdG42bzQ4eFVNTFE3a2E0UFhPRngw?=
 =?utf-8?B?UXBZWlB5VktkSlprV2U1dDFxSzkwTEVYZjZTZEEyTWRZampQU3FHMEF1SVNZ?=
 =?utf-8?B?Yi8xSXR0U2dTcjhlVml3M3ZXdndMdzUveFFWNm9xeWoxNzU3YzJ1d1RlVWNC?=
 =?utf-8?B?NS8rT1ZSRzZYM2JCdXdwemVBT3RMYmpLbFNMY1ZvRWFpYzdGQWh6ci9XeE96?=
 =?utf-8?B?dEp2bEFRV090SXkzTlc2L25rakNzWHpESFFpMTQ0Mlh0MXorTU4zWkpnNUVV?=
 =?utf-8?B?eXgrOTVmTU44dGhwNkYrM3Yya0JWUnBlVEE3bTBUTGRhWFNaMTRaNTZPeDFL?=
 =?utf-8?B?blNrQUlyQ3MyRndkWEhIYUZ5bEpSZ295eVJUdFJZZi92K2NCekdqcHVaTHJH?=
 =?utf-8?B?bzdIa3pjMDdISGZ1b3dKZzZvRTZxK3VwYWd2eHViYitHOFo2OVp2d1ZjWHZK?=
 =?utf-8?B?VzBNQWk5RTRvWTlGU1N2aU9uVWNsWmQ3b3hpTkRaOXg2RS96UWJpZmdFYXR5?=
 =?utf-8?B?TlFLUTJuSDJLRC9tQkFzaXN1NkpYQ01OMU5GcitQa0tsNEdWOEFtaWpJN1pa?=
 =?utf-8?B?OTN5SVhKY2pBaHN2RGV6L293eTBJNlN0ci9xQUNXWTlzN2lqQndFS2dxYUgr?=
 =?utf-8?B?ZE9Yam1uTEQ3MGhvdjZsQVArb21NWGVMZXZVZG9aNmlHeUZLNTFiLzNDdk5U?=
 =?utf-8?B?NW02cTU2M0pIN1N4TFhqM0E0OVU1aFNDZURJTERBVElEK2ZjVE5FT0w1aWMz?=
 =?utf-8?B?LzFrb2ZjUUhqVnFCZW9DeUJRZklzdFI5STNhNWNWbGduNnZhUUJ4ejJ1SWcw?=
 =?utf-8?B?U3AwWDMycndKVWY0QzY5THI3bmV3Ylh1bWtYNzFwUzhEQ3ZOR2tEM1UzZlY5?=
 =?utf-8?B?N050K3ZqcTJTa3luK2NaZEFzSXE3UzlucG1XOGNlOGtEcEordWVVSXJYcVNY?=
 =?utf-8?B?SUJrTC9IRkFrUjAxM01vRU1kNzBOSWN3a25qQkVjWHZISGNkcEJOU2JLSkox?=
 =?utf-8?B?dzBicHk0djk2V2ZtRHF5R1hHWW9KSEh3UnRVL2JhKzh5MTA0YktMMXU2aHlL?=
 =?utf-8?B?NzBYc0ZWWGpGMUFYeUhqMjJJS0s4dGtXVFlrQWoxVHNLdmJVZVNkY1FMYnB5?=
 =?utf-8?B?T3VOWGNJMWlqNkdBTzhvandOK0JNT1NWVFNzRmJBTEt1V0ZUWlZZRjBkdXJ2?=
 =?utf-8?B?S2RoeTVYaCtjckQ5azB2QXdsYzBrdzdiZUZBS3pqVzhzWlZxSXNzL3BUbE91?=
 =?utf-8?B?MUVVMk53Y0hTZnZjdjRHQVpIQ1M0SytuQVhtdjI1M0dkWElGdytwcHFKQ2Zi?=
 =?utf-8?B?SW5YNU5RQVpiUnZqVjFhNEhuWTZUT2JnNU5tbkxNYnMxU3dkdFRWazJaUXJs?=
 =?utf-8?B?WTQxR3dXOGs0dWdaZFFZbWg3aElhUXlUWXJGOXgwTDBuZ2tNNzlaQVdvZ0FR?=
 =?utf-8?B?VmlsNTl6T2NhVDJOdGxORWh5MkRzL0tXZnZyWUMyRHZaU2tRejhQM1NqTEQr?=
 =?utf-8?B?bTZINTdMRm1RSGo3ZnR1M1hiSyt2cmcrU0xLNGpkMGlUUVZQSUJFT205NE4r?=
 =?utf-8?B?TS9QWTNYRVBzK2NndnV4bkRTREdidndvUkR5NjZIUjlMVnFwWVkvTTFSR1Rm?=
 =?utf-8?B?dUFPbVo4SlVYUE9BbGVaRVkxaENLVndwWDFLMWNCUURtbVJNRDllUGlBUllO?=
 =?utf-8?B?TFpNSWw3dTdHb0RMRGQxYjlkdjRLN3VQNmNZNTBEb3dFVDFHTTZqbFRFRUcr?=
 =?utf-8?B?YTQ0T1ByRUZyRjg1NDhwSTh1Z0dYd1BiVC9DYTJqN0x0U3l6azlNMmZyaWlu?=
 =?utf-8?B?eUVOM3UzVDMzRE1NQmIyemt2V3MvQ1VVOGNHcjJ6amhBY09TMU9McEszSDZ3?=
 =?utf-8?B?WW14MXppUEczNlN1Q1ZVWGt5M29RdWRHdFRTdVZhcjlLTWZ5QXdmeit5QkdL?=
 =?utf-8?B?TTFpTGxXTldOZXFOR083a0g2THBJanZvcUROM21uSTZMNmxjcmlUWDgyRUhD?=
 =?utf-8?B?UU01UHNOS2lMOFJpUzRLeEJlWlNldkN3MnIzY0JhUDB3WUJ4bjVpNEhVMnpn?=
 =?utf-8?Q?V8hfVlG7P5HGnqPfDKOr8A2mOfzDB2DbFRm6Vn7q8Rxl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500c3e7a-8b8f-47ec-1c60-08dadda9ec88
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 08:05:11.5932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NZbGfAmTtfPxvdWCwB+isGqNbosTfw25Po6DYz6TxOMqJuv5vwIZTiTYLNQQ5S8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7911
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.22 um 21:14 schrieb Linus Torvalds:
> On Mon, Dec 12, 2022 at 6:56 PM Dave Airlie <airlied@gmail.com> wrote:
>> There are a bunch of conflicts, one in amdgpu is a bit nasty, I've
>> cc'ed Christian/Alex to make sure they know to check whatever
>> resolution you find. The one I have is what we have in drm-tip tree.
> Hmm. My merge resolution is slightly different from yours.
>
> You seem to have basically dropped commit b09d6acba1d9 ("drm/amdgpu:
> handle gang submit before VMID").
>
> Now, there are other fence changes in the drm tree that may mean that
> that commit *should* be dropped, so it's entirely possible that my
> resolution which kept that ordering change might be wrong and your
> resolution that just took the drm tip code is the right one.
>
> Christian? Alex? Can you please double-check what I just pushed out?

Yeah, that's certainly not correct. The ordering problem b09d6acba1d9 
fixed is back there again.

I'm like 99% sure that I did the right thing and my local drm-tip 
certainly at some point had the right conflict resolution because I've 
used that for testing the change.

The last 1% is that it's possible that I only fixed this on the build 
server and never pushed into the upstream repository.

Anyway we need to re-apply b09d6acba1d9 which should be trivial.

Thanks,
Christian.

>
>              Linus

