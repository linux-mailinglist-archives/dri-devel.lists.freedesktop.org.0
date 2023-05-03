Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92B6F539D
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 10:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17F010E1F8;
	Wed,  3 May 2023 08:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2046.outbound.protection.outlook.com [40.107.212.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D0010E1F8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 08:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1Vt/BcRW0U1oRY+2YJj+YE6df/DhFGTcCprFLZ/P9YcsQGC+EXrzpWdx8QsD4aQwZeoLolhqNaONWCx4Wl0HSAW4glYbFsInr1aoXU7JI2QIUXGwv98R+uPssP/3WxuiyjIsOJnr0X8D+rl/IFjBh8GkspzW64Dz3SQBZn5Bu5WwHHkYKOSp6Kvi6wu41VhaJ4CWNHS1momM/cFCngdWdfYY9yHrzp6uXjBN0TRF0MDSo2X4mdV1B09usvXAzDCcyEgd5DwqQTLdY8HEQEUx6jJ6rHZKlouXK0VLqlIN1SsNwJZanaFD0fPuAaQahGsBmXzTOv7m0men0x0c5MNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diYC86Ie1PxXJBCUD2mGT7BD6dC5MKTuhD/t4tfXs2E=;
 b=Ia6JSYd+plRK/dOmyjN66PMTCae1/BGX2NtcvIhd6RNZyrhUSOyUaarGRFfZ1B9GtYX7lrLeBpF+7+x13RgLmP2rZHOFr1uoUiM9R9PUw/JzhBlUw/se0BLDX4JtoPQ6PvigGNgwgzGrbuq7Vib6V9COmL18nPQvWI/GryD0rkNfDtIXId2dvbzDeUgbYxxADXSTuHvqVkwW5M0PvgL0wN0KVv/BFlBznk8T809jw8YZ5EgeoLfVW522cszt0Pix2d2Htto58HNWyjC+7fhd6IRNHqKYvGI+0mepTe/+HtTolRpe9MuKFEzGaobn16TrMvIM+bNukyI7gVI0DGHtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diYC86Ie1PxXJBCUD2mGT7BD6dC5MKTuhD/t4tfXs2E=;
 b=ZbPgxl5CF0qHjj94dLxBKgA9D8vSfOBATGh8eL2JTcOBMrFUGDPgxCAHLwmRYgQ8Rnd3cgII8tLxm0ch/3RuuRooazDX4tD+o/ANiqhem3sglvb/cI3S1OQglDxN5eG1apw3QQVmJoSdUgc1BzuArSZxbAv/FQOrMZCW7E0fO1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 08:47:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 08:47:48 +0000
Message-ID: <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
Date: Wed, 3 May 2023 10:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230503101624.5dbae57c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: d298122a-c712-4a51-bc1f-08db4bb31201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKHSWrgE5gx3lbK3UTUR9IgKkGquzEprVz8A/XwrN2NO25gIqbAD0bEypdxgFJTfFK6H9oh8RUWuGI0XBylnxLKzJv+iZzyT2JK0BxCqVlWRILZAGSi8rnRJXV1t1nijM5r5qCK6jOtot94tNPYMxMgBEot5mQAocwidmRhanR2/Ibb0MW5GjNW56guCCohrsiJN3m+tq0OQbK6YqAPZc8swrhgAuRT7xD6oVSXRW+f3MF0u64YHbl5qDk3mdumJ+Xp4PJq+st0e1ZvZWW8oj8AVMiDU3OWRW91xjvH1Fk08WTvJVHeGYXPMxrqDVj3LD21YjEhmq9A8GIGMBxixYHaStJFzJmd8fNsVceF6ncKtlJDMzH80ky9J0eFr3d8LQ69DNDksLwBLYDcqtN4IKGnzQ+KN9+Hlrpby+Hs+7pcMjHNKPLPR07OzyFu5AsTtDwXVCKjk3/BvfICdOAvoizsg2YYOmbW642GCF8LVqxkudoR0FFJbqTnWq1M6JqK2w7Xq6dR7JeA9qSuVW0dkUqVeWdKXMrcdEu+U0ZiCF9Z1R9Tpz5hZKqqxY9e03PBufR6ZBDjqb89oXmgUS6Jwfzy3wpQH0NctoaIxeCaXolU2VubZpTlGvYDRp2efsn9nHqe27yovCvrUgkgUlf+KcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(31686004)(2906002)(5660300002)(36756003)(8676002)(8936002)(66476007)(41300700001)(66556008)(66946007)(86362001)(31696002)(478600001)(6666004)(316002)(4326008)(6916009)(54906003)(6486002)(38100700002)(186003)(2616005)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmY0c2hRSlJ5ZTJKZHFRTXBRaXZob0IvcjVLUyt6VUZaUGtQczNFK09LeG8y?=
 =?utf-8?B?UUZqbjlseS9wc2NLUFdJNnRYVEN1Nm1sN3NqbWtvVGJHRmFIRk9xdE00eFBC?=
 =?utf-8?B?bTlQSFY0WjdMM3ozRGF3cU43dmVmZEVjOG9peE5QSjhtaUI5dHBuaC9OeE5P?=
 =?utf-8?B?WEJhUEZSV01TemErV1J6RjFaVTU3SGxGajQ1Z0c1VlBuUkQxRlVkL1c1N1I1?=
 =?utf-8?B?c1NRVGhqdkV2MDAxTmVlallyVHNFR2pFMFUvclA0Q1Zsb2tLaDBHUUdSNDZi?=
 =?utf-8?B?cWJ1RTlHWGRSSDR0RXpVbzExZ3BaRWhCNnQyaFZvNmZ0WnRScG8wQVlNSktz?=
 =?utf-8?B?QjJwQmdxc0xRaS9ZQktud25nUytrN3F0elNSVUhtRDRuTzhDV1ByeE9LeHZ5?=
 =?utf-8?B?YUswOXQvYk5uTUZ5NXNaeElTS1gzWTlGNDNwTEVtVVhZOGJRbnRKSllZZHpM?=
 =?utf-8?B?L3NRcm1Iait5eDFFWklmZGlFMFEyZ0dZS3ZibGc2WWhkbUVEMW1BVEwrRUtK?=
 =?utf-8?B?V3V3ZVlSZitaYVE3WTRYVi9tbERPUXdPY2ZnUUFXSFhzcHdRQmhtaEVCRHBX?=
 =?utf-8?B?UlNCNyt3cXlpcWd4dm9kSzIwQTVVaTFtcDc1RW55YktEdHh4TUVOYWRXYUxr?=
 =?utf-8?B?eGNmWHJ2RUpLSjJFYkJhVXhoRkVPTDBkZ1FiSmdtT3JpK3dYRzlnSUdIeUR6?=
 =?utf-8?B?VmgyMnZOckQ1dkxIdUszVkJQYW5TWnlyWDhqcG9US3kvbGEwV1oxVHFudStp?=
 =?utf-8?B?RmVMZURyS1UzRlpqVGYydEtlb3EyZ3FFdjFoa0tURDJtTWVuaktjSEhXdzgy?=
 =?utf-8?B?ekdEYlZ6QVN2SmpxWTZqQUJxK3JHeDRlK25xbjU4bXRRNTN1OFVyS1pVU3E5?=
 =?utf-8?B?cnV3alVuQjBKTVdwOEswTVJOVFJGNU9oZW1na0NUYTV2RTFoUWg0YkRDeEdh?=
 =?utf-8?B?Ykw2eElmWVNIYUlhVTNMQ2xUWDl0SzM0NG00Qi85YnZvYjBEdEJVSTJKblow?=
 =?utf-8?B?dGR4YU1hRXNiTHpxZG9mYy9jV2ZKRTdHbytiTDYycjV4Y2dlM3FlTGdhZU9L?=
 =?utf-8?B?UmFhaUxOejRiN1BDdDVKS0FwRGdtbXo3TlUwOGIyWGhDZGVzVm9teTR2ZHVl?=
 =?utf-8?B?RWxDbmREVnhTR2JOZjQzd1crVldhQW8zTUh4dndORTluSkhjMngyVlpKd2V6?=
 =?utf-8?B?dFRzZi9XY2ZRVnVuMUVmWk1PM2FpWHkvWHNyVnpyRXRaZC9vSjdlMldWYXBR?=
 =?utf-8?B?T2RrelVkdVo2elBjL0NFZ2dFTTNVNDBHL29PU2VVZWladTcwcDBaUFZIemVP?=
 =?utf-8?B?eFJWZytGNWVTVDdtTStxUVhoSHJULytpQ2NYbHhrVlJCUjNJYVJKL1QrZTVL?=
 =?utf-8?B?Um1hQlBOMTFEZGY1UHh4aFFJV1J0QTU4bUhiSitPMUgxZm94QnVqVkVydUY0?=
 =?utf-8?B?STNwWU1YeWFoVXBTVjFuK1R3OGFxUXEvWjJVaWtWSjlkcWtDRjM0WXZPS2dB?=
 =?utf-8?B?eUcybDZWU1FrTGdlVXFyMmR1Z1BWekZ0dytuVkkzcnpZdW5KaGhsLzNrNDRW?=
 =?utf-8?B?KzM0VTJhbFNRSTRGQUxCVWVYcjNaaXZNVTY3MzNXd0FPYmFyTFZqYkxKeVM1?=
 =?utf-8?B?K3RQZ1dMTkF2UFdsWTdGUlpnSE9iRGljcG5XZ1duZkNYd1ZGckp5U3Z4V200?=
 =?utf-8?B?K0lFWDRiVVI1SmtGbUYyUDRCZjdRK3ZRTFM2U05FT2hFYjJnaU9DMHlZRk5m?=
 =?utf-8?B?S3Z5Z2p4Y3F5ZW9EUjdET05JbHhrYzBjTjdFelVQZ3lzTXZ1MG1FWGN0NzE5?=
 =?utf-8?B?SllCbjVsTzY4cUFrNjRzS291eU9mQmcyMGFuUXhmRWd3elZ3Szl3ZVhQaHlq?=
 =?utf-8?B?TEVpbjFMRzF4RGcrWnlZWDRhMGVmNWNweHlUVzNnMDlsUGlXM0ErVnc1Mjlz?=
 =?utf-8?B?UVdsYWd2ZjNnY3JoVnF0bEdCYmkweFprODNucTJUa0R1eDREQWpzQUZxcG80?=
 =?utf-8?B?UFJ0NmtpYUpxV21ubHAxR2tUaXdVOHZOaHBUK1dMbVFSeDl3VTc3LzhPZGtF?=
 =?utf-8?B?UWpzMHlPSlNUaXlrQ2hITDVVOCtaSisvb3E1RnZvQWZtZVI5Z0M4Zkw1eS9p?=
 =?utf-8?B?bnZFRnBacGIxdEJzYWQvS2FIWThEaktRaEI4QytvdkI0dEYxNHFqOTlYOUFG?=
 =?utf-8?Q?5pDOAEwTSnCh3ZnpAgLYmjQuHPvCT1GGZlIY3Mc/06bc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d298122a-c712-4a51-bc1f-08db4bb31201
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 08:47:47.9031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOAdGmStFwhoGYR3L9kZ1kEP9XHYffIRBT91vnVQzZw2ub1T9/wtciFG2Q9KuEU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding Luben as well.

Am 03.05.23 um 10:16 schrieb Boris Brezillon:
> [SNIP]
>> To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().
> After the discussion I had with Matthew yesterday on IRC, I
> realized there was no clear agreement on this. Matthew uses those 3
> helpers in the Xe driver right now, and given he intends to use a
> multi-threaded wq for its 1:1 schedulers run queue, there's no way he
> can get away without calling drm_sched_{start,stop}().
> drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
> wondering if it wouldn't be preferable to add a ::resubmit_job() method
> or extend the ::run_job() one to support the resubmit semantics, which,
> AFAIU, is just about enforcing the job done fence (the one returned by
> ::run_job()) doesn't transition from a signaled to an unsignaled state.
>
> But probably more important than providing a generic helper, we should
> document the resubmit semantics (AKA, what should and/or shouldn't be
> done with pending jobs when a recovery happens). Because forbidding
> people to use a generic helper function doesn't give any guarantee that
> they'll do the right thing when coding their own logic, unless we give
> clues about what's considered right/wrong, and the current state of the
> doc is pretty unclear in this regard.

I should probably talk about the history of the re-submit feature a bit 
more.

Basically AMD came up with re-submission as a cheap way of increasing 
the reliability of GPU resets. Problem is that it turned into an 
absolutely nightmare. We tried for the last 5 years or so to get that 
stable and it's still crashing.

The first and most major problem is that the kernel doesn't even has the 
information if re-submitting jobs is possible or not. For example a job 
which has already been pushed to the hw could have grabbed a binary 
semaphore and re-submitting it will just wait forever for the semaphore 
to be released.

The second problem is that the dma_fence semantics don't allow to ever 
transit the state of a fence from signaled back to unsignaled. This 
means that you can't re-use the hw fence and need to allocate a new one, 
but since memory allocation is forbidden inside a reset handler as well 
(YES we need to better document that part) you actually need to keep a 
bunch of hw fences pre-allocated around to make this work. Amdgpu choose 
to illegally re-use the hw fence instead which only works with quite 
extreme hacks.

The third problem is that the lifetime of the job object was actually 
defined very well before we tried to use re-submission. Basically it's 
just an intermediate state used between the IOCTL and pushing things to 
the hw, introducing this re-submit feature completely messed that up and 
cause quite a number of use after free errors in the past which are 
again only solved by quite some hacks.

What we should do in the GPU scheduler instead is the follow:

1. Don't support re-submission at all!
     Instead we can provide help to drivers to query which fences 
(scheduler or hw) are still not signaled yet.
     This can then be used to re-create hw state if (and only if!) the 
driver knows what it's doing and can actually guarantee that this will work.
     E.g. the case for XE where the kernel driver knows the contexts 
which were not running at the time and can re-create their queues.

2. We can provide both a wq to use for single threaded application as 
well as start/stop semantics.
     It's just that the start/stop semantics should never touch what was 
already submitted, but rather just make sure that we don't get any new 
submissions.

Regards,
Christian.

>
> Regards,
>
> Boris

