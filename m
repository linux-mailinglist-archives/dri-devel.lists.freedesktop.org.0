Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FED628130
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81CC10E237;
	Mon, 14 Nov 2022 13:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1494E10E162;
 Mon, 14 Nov 2022 13:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guD2jE6JKT/9ONeNGcqd44i2BKMbGfG20IicIeIhYejX1I54tc2acMXKbzfaowncfJ1zJAnmqrBPnbVpKU+EMhK6fed8o1oVe1cgcLfrkwc1Dad3m7q1ALn2qWZOOWQoJz3RGDNQglSwou1EMVffKzw2EAi4I9cGAVyILwgz3kJp32+C0Eu19CGPIsGjeCXS9SuNqURKkYEpOiJC8paKabz+0EuS1P2QUIX/hWojlvkRcWXQcJJd1kNQtBUsGLu9mjzWhoG+0oXtmGxHqYTe/sn3a+VuTf7bO5fg5RWWTAVYOAwGJcntJ0VFsZikvVGIBxvyDArgYf3AS4PHW/91Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl/hmrHrY7OWeKJwhPcWxl5FD83sb4mpXmudfSWIYNs=;
 b=e+SEVOboTG4ldWYF3qE/8RwybeRJNXj33Kt4PsRwBumHGVD5XtzB3pFXFejzT8ch0QTpAF9PfxLzUTLn+NuDbRebN3XvGb4kFg02v56MrLbEZ4Xge0pu+uWpzhAc6bYulYg4YAVIobYM2hdbFzE4mZyM5YMW8AV1+nNYqajfrrZgXWVi2TWB9sOrOa8nimwrZWDFuw71UxHTKhs6DzTB+eW2x7Da9cEQNNU0QkHe0NfU4cGVcXpuYKqcKDj5dnepCQbXxEnaUAnJ280bmE71ql2n67/ulCDXw/YdWTzyJv/cySCBFfrvVClzlxrZ1DXjX7vcILi3bLjmxCJzGPq9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl/hmrHrY7OWeKJwhPcWxl5FD83sb4mpXmudfSWIYNs=;
 b=otNp0sPyynAinX1VXq5JC/bbJqNWZb9KMyVB/C5gL23SNKVwaRo5M+suPJwGf64TWSOzZ7rvKRB0Bo+CL7Q62ofsRSSP3seCJdDJlwbAc9iIALHb0hKB7aAjhsllcANLdsum8loTEokIND91R2d7biwBa0qK3rtE2mh2D6H+RRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5382.namprd12.prod.outlook.com (2603:10b6:408:103::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 13:22:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 13:22:42 +0000
Message-ID: <c5c4f572-4720-04ff-3c70-30bba9c37202@amd.com>
Date: Mon, 14 Nov 2022 14:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [6.1][regression] after commit
 dd80d9c8eecac8c516da5b240d01a35660ba6cb6 some games (Cyberpunk 2077, Forza
 Horizon 4/5) hang at start
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsOeQ7VYm98jRVaYp6KaNsFVsAnSb33ZT8JvZxcTcEGW0w@mail.gmail.com>
 <a67598e8-c826-2740-03bb-33d37c8c8e4b@amd.com>
 <CABXGCsNvFvJz4=N=JKYSGVcd=dKfQ3Nv_zOssMb0Z6oK79xZ7g@mail.gmail.com>
 <a537212d-4b42-4ba4-7707-1e397234c8b7@amd.com>
 <CABXGCsMCfACsJRDPqZDYQGMpaA_6LKhQ0XqAmDN04GSMeetXnA@mail.gmail.com>
 <ca6c98eb-fdb0-5fee-3925-5b697e3e6b50@gmail.com>
 <CABXGCsPJFvNXfbdR=_sb4gLdd2E30aRN9usSiZc2XYmZNSKBcQ@mail.gmail.com>
 <dc802bd0-ed77-d268-25e2-1cf162202912@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <dc802bd0-ed77-d268-25e2-1cf162202912@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5382:EE_
X-MS-Office365-Filtering-Correlation-Id: f1103997-14f3-46d4-68f0-08dac6434f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tbfo+PNTubB+of01lb61QtMHyU7Bpg9sget+WzXrX+dO0QFjRMURXvs2aSoyqccB1GF/HeVm6pdi19awTsJiBSBF2RENL2a84Z5aEb8uVUG8wi7SBbJtceJyNyYHz7p4iCmkfZ7uCLH5yt5BIUSsFnW7Tyz79qb68aNadPVO4OV92anZBhIB1t8+/tVVpFK6sCnjfGR5NDfXKFrutAErs1Jd+ZLLO/p2JGt5bQK/EdRVdnAymx/hMOro4DrCxY21I+MVBNRCcN0kdnCKa7tACw46IroGQNdoDOgciW5zFvbDiJpAzRnanYzmFF+U6RUEUHnIzPEz3CDc1edvg1UcAhJkwnaQ22MAjCjmSUMPAQFh/CledYKg9rEsvsQzoqCDlOrrhnyxyEJJxeBlhB0W07bQLoh2uUg2CPEIJq5PwjlAIkWmfn81Q/XoEFOHb/EGumQKmTk95Y9bH2bHhiS8Ecc80XJjHqzvrOWDVcR+lLuOYT8lF0fUsPHQGFnnwWcxxF5+5Fm3Xo0EOMQdHN6cZrcSueqnF7bS/7BtCXe9NEEj3FXBZhqqzy0peVkJ1cPy0VywWuyrzExxMCNZ+ikmGhvI6r73c2+nTMTxo+NClAHT4QW6GVed2sl6/Lms8NpGAx0UkSyKVf+0PG5vNvvZq2FUTH7n+DXHECx/paJFghx4R/LsExu906NVnSVUcmpL+qgj3GsKvJd3lvXigmkJFhVjoIsHbNZg8Aj1Q8x42lmjtVvWHztqrxP+R4U4eZopcxXgeC0I3+gogo325ZcthFrpgbnBr+xaPJXWdCnZQpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199015)(31686004)(2906002)(36756003)(2616005)(8936002)(186003)(86362001)(31696002)(316002)(110136005)(83380400001)(66556008)(66946007)(5660300002)(66476007)(41300700001)(8676002)(4326008)(54906003)(53546011)(38100700002)(6486002)(66574015)(478600001)(6666004)(26005)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXl1OEdDVGczOWVjR0M1UEhmSEEySEVnUXQ4Q1k3ODEwNWVzdE9ldi91dmcx?=
 =?utf-8?B?am1SQWtQTStsRXVzL1FSbUUvTSt6Z1JJblZESE1qNDNvNUpwcmExbGFRU0NS?=
 =?utf-8?B?ekFsR1FCc2hsTit1UUtzQ09oUzNHOWRUN1YrcmVpekdmSSt5MU9zS0h1ZCt0?=
 =?utf-8?B?V04vYVZkNlkrL2tNY0lKRjJhL0pKKzI2TzQ0d2JOY2NTZ1lBRmlYeGZZcHR5?=
 =?utf-8?B?eldQMXduVmQ3UndQSmdwTnhsUXo5Y1NWMGtwUEZOOHg2QTJOMmpleEREaTVT?=
 =?utf-8?B?TURxK0ZvTU82aVpKbVZxV09Gb3pwUnNYNHNWcklBWTAwbWtkYVovVnNaZkgv?=
 =?utf-8?B?ZCszd1F1M28zZ3dhNytyS2RZWElLcVh0clJ2ek5qaTVIYVNheTRrQmJxeS9E?=
 =?utf-8?B?Tm9lTzJRWWpld2JmaVA1aGNmcTZrSkxDalhOS3ZCZjRSNFRGV3JJaUVLeEpv?=
 =?utf-8?B?QXU3ZlZpdjRYbWp5V0tGbHYycGRGTVNCSXVjTFUxUlk1ZkhKbTFWU1VvVFR3?=
 =?utf-8?B?YW1zcUErdUllUE9EVmk3TTF0VG44ZnlibnNTYnQxRFdlOGpORjJkejdJNzFP?=
 =?utf-8?B?YUh1NGhQNWx5Z3RQSVJQQ2ZYWEFEbVlmZEdkWDdQMjdKWEJiU3Nrd1FkWUl5?=
 =?utf-8?B?eWdSSnlkZkxUU3FkSC8yMkRBZ0wzcGp6RWFWYXhtR3hRc3lSeWE1NzZpQWdr?=
 =?utf-8?B?UGJJTlJOMkVNV093MkdFQVJtdXJzR1VJd1c2N0I5WFRGdnZPdHV0cDI4YU9n?=
 =?utf-8?B?U0hxMlFNUXNSd0VJdzNJOVJoMEtodWEyanI0UnhYU0hoa2s3MjFwS1RCOVVL?=
 =?utf-8?B?VC8rZ0hUaFlNRDBUbVB3ajNzRlJQalN3ZWhvTThkRUw3WVlpQ1FlREQyOXgv?=
 =?utf-8?B?WEVmM3p2Zm41QTJTRFZLdFdiZllIZGRzbGlUUHRJQTZWYVNBZnp0REhucC9H?=
 =?utf-8?B?RGw4bTJ1bE1US3l1OXF4WmFhMEs0KzE0TjdIdHlqN0NIRVVMby9ZU0ZDL1ZC?=
 =?utf-8?B?TXpZMXJiSldSU0ZJM0ZNUFl0cHJQNk91TzdvdFE4QnpwTUxseXl3enJyVStR?=
 =?utf-8?B?ZUh0K0dHZjIrbE5WMHpWR1FyTU8wTGRVRjd1N0k5Qk1qUWt3cUMvSXk5azJj?=
 =?utf-8?B?WEhRbXZoTkpQK3dXWTlRU1ovaEgwOEJLUTFrRHBsNG03dytmbms1TmZ4YVpY?=
 =?utf-8?B?Y3pIZlh1N0RKUjRLQldOeER2SWF2bW5jdmlOLzdodittVStBTEZJSjZPaDh5?=
 =?utf-8?B?K2JJY3V3ZWJrUE1IQ05RS2gyR0lIeEs5MjVFT0Z6SHJERHh2Q2Q2STR0K2JQ?=
 =?utf-8?B?Z2Q2amlmQWFKWko2bHdEY1F6TE5KWnRRQXFkVFdpVW9DVUxkSUZRR09VQ0lS?=
 =?utf-8?B?dkkvTVlHWW1iOHozRU1hWnNDalYzVHE4Mnp2R1Y0TVhJeDdwKzZZb1hLMDFa?=
 =?utf-8?B?dStldGlQTnRBaFlVcFA5cXh6bGpNR3NlZVhCbDdaa0NtVC80YnV6T1pUUFY1?=
 =?utf-8?B?Z1dTU2JINjNMcytCTm5ZYzZmV0diN1ZYME42ZUM1Uy9Ha1hZNjlyTFFLMkwr?=
 =?utf-8?B?Vk56UHdWRWcvS1BSbXRDUFRyK2wvVG13eE1zcHhkY3NiZTNuelZhOWdIN256?=
 =?utf-8?B?eHViQXhnMCswODltTVp6cGJqMVlOWi9DWDMyTHJCWW9jQThSaXJNSERWR2NJ?=
 =?utf-8?B?c3JpdnZhTGxtRWlMQlM3elNjNkZna092RXZKTDRDQUMxVm14Nm1jSzFhNVNF?=
 =?utf-8?B?RURHb2tvTUVIK3dnMGpTSG8wMXVidzNqUEIvVW1CM3RZNnRLOFBEalk0cjdP?=
 =?utf-8?B?a1VjaE5QWHk5VXpSSkQrZFZ4ZGthSitkMDdPQ0RpeXRIMHljYVRieVRsbGdL?=
 =?utf-8?B?VzFUYitpZUQxa3N4NnBWVFpDVHFYaFlzOGhacmo5Nk9PQkxVZjVrK3Zkc0xz?=
 =?utf-8?B?V3hsSzZKMTBUd0gwZ1VTWVhmcWNYSENRTVAxcnJKUmhrYnU5djQ0aDAwQklV?=
 =?utf-8?B?SGpubm9Nc0x1UHBYcytiaWhveDRzU3A0MjJXdG1MYmpVNDNncmh6VGUwcGZB?=
 =?utf-8?B?Y0JBNFFPdDJURmhqekphblVkMTQ1N2phYTZiYkR3aUJPUDlyOTVQam9GVkJx?=
 =?utf-8?Q?K44dkaQYn7exkP95LTo/KaWHA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1103997-14f3-46d4-68f0-08dac6434f94
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 13:22:42.8456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M82WoVeHZygn83OSYiaFzmaU7MsBhqUfqAm8VLcwKG8+VtNXjDr4Y63v5XDW+AFD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5382
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mikhail,

Am 02.11.22 um 14:43 schrieb Christian König:
> Am 02.11.22 um 14:36 schrieb Mikhail Gavrilov:
>> On Tue, Nov 1, 2022 at 10:52 PM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>> [SNIP]
>> But the most interesting thing is that all previous kernels 6.0, 5.19
>> are affected by the problem. It is not enough to revert the
>> dd80d9c8eecac8c516da5b240d01a35660ba6cb6 commit.
>
> Yeah, that totally confirms what I expected. The context lock just 
> hides the problem because userspace tended to use the same context.
>
> What the application now seems to do is to use multiple contexts for 
> its submission and in this case re-adding the lock doesn't even help.
>
> Thanks for that information, gets me a lot closer to a solution.

I've found and fixed a few problems around the userptr handling which 
might explain what you see here.

A series of four patches starting with "drm/amdgpu: always register an 
MMU notifier for userptr" is under review now.

Going to give that a bit cleanup later today and will CC you when I send 
that out. Would be nice if you could give that some testing.

Thanks,
Christian.

>
> Regards,
> Christian.

