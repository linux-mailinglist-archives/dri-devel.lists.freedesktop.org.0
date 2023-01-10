Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69F663F8A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 12:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F2310E00E;
	Tue, 10 Jan 2023 11:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FB310E00E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 11:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcwTMlA3J7qkE5g3EnhQ/50r35gtUTTMZnTyUyTikL3ksiblhH2/LV62TxyOItWlAaP59jsWAwqyvkOuDqbI+pA3e+fIMWXBp+mU78lNRyv+Uvgc7/814fnvGfmQrq1YTxAlo6A8C4tOSUsufZvv4bVmRpppRU1/lv6UaO8sgQZsQyLqelmfvUf7yl1VFm8Ma9YhCWZ228As+lyYhDNPGjVKzALhXcFw527cTlwKpVCOdchHyp5YyFfN+Zbz/fHvlqGDYa5OMORvBS0Ef16vxQMaqVw3RtMZnqfrXa75kqYZAZqRcMtfx6VidLnT1TolAzzSxxMQ8UDJbfQxHZfcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hcc/NDHTJXXp7FcZQruui7QvKNy6XXRQwW4NfuXpyok=;
 b=m/GQGyyyQrIqS0EsiX07TpJJzPmRi2V0SQCL/+fPR2MNALm445HbXhbXuXlb3LgRvqCHxDQkVzbjGKUTZVxezfThjtzDNi27n3Vi0v3O30RFZl4evcH35vYe2G6c1QU1xIXcs6b5eyHVb7tQow9esaMZEToAuJDUqyjgxaQFoE5HjZX2KjZmVRiEeH4ShwqoYAF6w+m0boIVrydxpGM4Ks8l+cqYIa3bDmub2u0/57cavM17cdHTk5vXXIQSTTobvZUWFbLaCc9uh3fumonLmdUwK+IrlIpH+O4jV78us8GG0mOOJ6jkXNQvkzZ1mkLG8mSyQ/xi1CBst8U98xMxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hcc/NDHTJXXp7FcZQruui7QvKNy6XXRQwW4NfuXpyok=;
 b=gVDHlTlM1gEnXl/zppNEToCaOjPcmrzDOt4oKX6nbYy81l2p7aXh55uzp595kftytQ6f4pZPrnK84H1qku8I5w/D44iYo6kLQ1UFqFMtcu0rPrXNgV8YlqbtUeUvbqf87z+tV7nwLNya/AjuiIJkJGPhdEBptbF220ndejprJis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6453.namprd12.prod.outlook.com (2603:10b6:930:37::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 11:53:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 11:53:42 +0000
Message-ID: <9b8d670e-afc8-1238-5a7d-5bbf9fc2e7d7@amd.com>
Date: Tue, 10 Jan 2023 12:53:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] doc: add dma-buf IOCTL code to table
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221128133853.355645-1-contact@emersion.fr>
 <dea4806e-f96a-262a-e0d5-ae60c199458c@amd.com>
 <CBxfX5V758BMJrTNNtWSrSxTq0Ep48B4PbOS-ryM5B-WDgErHc5zeJBDYNE9UwFVXDMSwd7Bj-Zu6PZZ2jnzGwcL1tHWYySujL9CgTTedoE=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CBxfX5V758BMJrTNNtWSrSxTq0Ep48B4PbOS-ryM5B-WDgErHc5zeJBDYNE9UwFVXDMSwd7Bj-Zu6PZZ2jnzGwcL1tHWYySujL9CgTTedoE=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: 14928b36-ed6a-4283-5609-08daf30151e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWZpD1JXoheWJgNLRIjX/1UtwOgVPUqL/3xyg6HAbrU29PieSVSWdGVRUOdofJ8+YZTcFWlVqN2JD4jRKwL7IVs1sRVVNptAuMMGtaGHP1SkQawY+Do5gX7dOhg1HzmfMpqOsrySEeIQyzVc83bl7QN76mNoIvwlzx8v6JqPvBKFVr4JkzFG01WcwdZO5zEjDRyHnEMOiVF5A0Ec6IVDUSxPRyj2e0mdxbP8tY6dIO/WfvMvZ/Rj8EYfcKeXa9COtiXIU2tWLArWRY072GUQHkjlWoupI5lxXhF13vGyjbX4yyStqDau2GQm5y9cqE9YTrc61rc9qbNAotj6O6l7x4LjxkzqF6RN4xKvVlG7Rc/heI1YiJW8u6zztneagdpE2WuHDv4Q0vJ4mx/X9j7Q2VcQ1oeTPdEXwAJUn2tsLTw6a4NyauI3lkqV90QpwdZZ1KDcHP0PJOehKP8VTz6jKagDEjHFRoiAqplQSdNNfWLQKjmUDSxgF3kW5PQzKcNk/z3UUDerc5vWMEbfbhzcR1X5U/SJg1WRCWHEk/IRizpjE2Cue95G0pXp1IJMk2a9B5H3wWsrjykiNNak9pbjwRhrO6SVUz1TdjnCkcloMcMFdsTviDwfYOO3YzMEo8v8sqexrFuJfus7lQnIxHdy4vJGURhpI9sxizHh7D5H4Qxm1FklGB/23Nti8F/Zx+vp0k2W74qn3dkOGlw1IjFJ9uVV+3oDGWm7ZUvZmPvOWLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199015)(4744005)(316002)(5660300002)(26005)(186003)(6512007)(478600001)(6486002)(2616005)(31696002)(66574015)(41300700001)(66946007)(6916009)(54906003)(4326008)(66556008)(66476007)(8676002)(8936002)(86362001)(36756003)(6666004)(31686004)(6506007)(38100700002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUIyZVR6RlN5R1hrZ21xeWhsQUVSRjMvODlQWjROMDVaMndkRlFzK3FXZnJs?=
 =?utf-8?B?TUluRFlHaXNqMjNtNE5nSFNDT2FVQ1BqMHhOSm5qMlJiWDdEQmtLaTVvZ2hC?=
 =?utf-8?B?TVREdzZGUmwyRjZxbDBqZUxSVlBpQVcxYXgxaWsvQllnMXVoVUlZVTBMb3BF?=
 =?utf-8?B?b0VTSThMRDlpak13WWRMeE1BRXhLNnFYS0FOZExtSm1rdFBmakhvZ2MyVWJJ?=
 =?utf-8?B?Zk9WRnpzMkpZdlFzK2JMYkhVd01XcURpOS9qNWplT2RqUmVISGtvRkE3WTJX?=
 =?utf-8?B?blVBdzdUOGdCRnhsNFpZTVpHaFRTL3VrWHV3eGpJSjJrZ09jdlZaT3dubWVt?=
 =?utf-8?B?SzZ0L0Q2S2pOV2lZZjhudUVFVkx4bFpDbmNnZit0cXdBNDIyTnBzY0RTOFJj?=
 =?utf-8?B?S01IdE9ZRGtRdGcwMC9tSUR0MjN6YlhFN2VTQVpHWWNtQVJJN0d3cTc3akxR?=
 =?utf-8?B?QmhYOUVIL01VWGEwNTZBQ3VVWXBJYVdrNytYSkRMS3dLa2UyK3dERjlaQW9G?=
 =?utf-8?B?YkdCNzNXbW51UUwxYkZOUmlIcjBPNFg1Y25acDJEWEVvd0NOdkVubzdWd2JQ?=
 =?utf-8?B?M3V0Q09DalNtcGsrUzU3Q2tOUy9TRUQ1dEJQSHpScnJ2SzA0MXRLWUY0ZEh2?=
 =?utf-8?B?ek40OThlVlRNdjVJMDAzYjM2MWxNWEFQemNpN3VaN3AzQWlocENQQ1pQbTBS?=
 =?utf-8?B?MnZjSzJXVlJqU0J1TDRJK1pzR2RveVZNMnh4WDFyUUd6b2I2bEUrbjlPRUI3?=
 =?utf-8?B?dER1dW5xYi9NTmhLSlgrTWNBaEV3cVhHazFhSjQrNmk2ZE43bXUzZStmZ2Ji?=
 =?utf-8?B?bmF6T3pmemdlaGlVcjY4OHdUeW05WGxnZXVLWlBUYStUNXNzcHJBTHQ1bU1s?=
 =?utf-8?B?Y1hzdnMzOGdDREU4MnFLRmJFY255ZGh4UnNIeHZXcnNEN3piQUlOazVOaGNX?=
 =?utf-8?B?L0ZTSmZJZ2d5Tk45ank4UEQ4WWFNSlFUclVjVDZOczFNMlU0OW05K0hNbi9k?=
 =?utf-8?B?ZmpMMjVhRVJnNEdkd2xaNys2Z3d4aitUZEJlaktSb0VvVC9XcGNuY1RxaEp6?=
 =?utf-8?B?YlFtb3BoRm9NTitzQWc5R3RwRWZoa040NVVIVzlrdXBWZkZ1cmhvR2lzUEht?=
 =?utf-8?B?K3N3dHBYNitCZmdhdHlIamEreFFidDhyQlNzaGlHV2FpdW1McWx2MVA1aDF4?=
 =?utf-8?B?c0lLSUVrVWx1OVdQdG04aitVQldRTS91eDRBdWJlTWU5Yk9LRzU4QlNoN1Jn?=
 =?utf-8?B?eFhOTVBiSXA0M09EUWQxVk80RS9kUG83cFJFekJvQk42OFBnOU9Bbjg3V3ZN?=
 =?utf-8?B?aHBLWUJ1aWR5TGEyY285U1BRaEZLWm1EZi8xUmRTbnJod3ZnWDBsQ29BTUw0?=
 =?utf-8?B?TnRBaHRIZTNLdFEwaHVJeEZ6U0x0czBCdnBZdTZvT043ODE5eStURFpJVlBF?=
 =?utf-8?B?REZMeGwxQlRhTkgyRFhLUGVJaU85YzhYWE9RWEgzUHA1S1VGVnRUK2VUMFRD?=
 =?utf-8?B?V3ZXOXVxeFhXUXI0QTRmZjd1UkZ3VW9DRFZETGYrWkluWnpvb1M5QmtwbC9j?=
 =?utf-8?B?Z2Z6TkdBZk1PNXZVU29BQndudzNXWUdUSzlRTEF1ZkdTWmpwVTVteFJEQ1VY?=
 =?utf-8?B?NXh0L3JtWGhIRVA3YytnZXUveTl2R29Xb2NDeDROZlBaZmZ0TkZ2ekE0RHJw?=
 =?utf-8?B?Vy90cnhWQXBvQkFnUWNPN2FGYldsYjJzcDg1ZGhnclRZeFQ3YmxaSWIzZGwr?=
 =?utf-8?B?NTJrcTVnUGdVQ0dvWnI3Nk43ZGxWd2dxczNrR0tTTDNwQWhyUXplTUMyb3BD?=
 =?utf-8?B?RFVyZEtsWDdWc2JiSHZtL3hHd3QyRUhGQ1B5UTcvSXYweXk3RWNwbVhLTWFO?=
 =?utf-8?B?UUJzVEkrMjlnMDBDSTREeUR5dHNmUStMMHUvbjFDdHNnNXpMdUhUdStORzF6?=
 =?utf-8?B?dEx1dUZNK2h6MkVOZmNGMGowb2gzVGtXTnFzdFVwLy9jVXBvTjFXTTNaclRW?=
 =?utf-8?B?NFQyeXFXamV5QWZwYndnS3A5L3lXaW5VNnB4ZW1kdUYxQm5vazBIaXEzajFz?=
 =?utf-8?B?WWFJbG81dkhrdENXVzZCaTRhZHFkOUdnQnNzQ0VkT0hxdEZhV1V5MmVLNWFB?=
 =?utf-8?Q?eLjVCMyGV9ke3irXUegThJSDC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14928b36-ed6a-4283-5609-08daf30151e0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 11:53:42.3019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXkGm8IEiSj278trDPBEOoCllhtvJZ0EBRf1yXISfgLrCAROVwzVYBv3J4qWd6is
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6453
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
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.01.23 um 12:49 schrieb Simon Ser:
> On Tuesday, November 29th, 2022 at 10:56, Christian König <christian.koenig@amd.com> wrote:
>
>> Should I also push this?
> I can push to drm-misc-next, but is that the suitable repo?

I think so, unless you think that this is a necessary bug fix which 
should be backported.

Christian.
