Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2005571B15
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 15:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B473611BC23;
	Tue, 12 Jul 2022 13:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD39113DEB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 13:23:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=En8Y2NEfrYd7K9lolfe/o+wejE1UdqmnRsofiW4Ux3QfRfguKMgNGiv0hTWPUbIImUotIlqOJmCKO8eqe1YQEk7FTQVpDR5hQQv7nQPlidw3FMUig53bZVrb20Y0OZXzn0JLHMiRchymKO3lo/lGimNwOo4VY3lu67y0VdDc5jF/PSzsZWe0vLUZ3T3/eyHXsJJPsmplJrQy5MczOyr/pf1Tjq2zU63YcmkEArV2t68Evq9Lpjt2hsN8jJDCK53gMSK5tiy414GQ07puAUbsBlokhc20w4pcK+xqAza4CNA8AqceA5O7aZfGJ6yvp1EDA/DUqaATK++TSRshEIvBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlOo49upum9PVzCKj+wdGX6OUcbUCyH2WFN3XSLn+88=;
 b=GApyPRMh3JqQz+aFle/UiLPQmBJ8gPjOOMn8E0fucLrntCNn80mZeUs+2bnLrh9iB2Del0bQ+0IshCyeB/wMC3fEVKQNzRkfVda1t/w4mH3d2e3VoQJZmpkxXH64e/koBiDWIpavSS1r8uCfQDrrYrmk6zt8EBDCTKOAvRKYuL1yKYAY6TKIeSlf9XGhAcTSHgjWk2ffUea5IDl44jvkO5riGiwrAX5n94HxEM44wWkk6KqurbN6TEdSmAeHOJzF1u2sI38H/c9R+L3hzokjy/8tlug096Nww/jhdb4l7tLu2lJEQmpngnt8vXTfLn7ZHCXkv5/7UJzPraNpcIYDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlOo49upum9PVzCKj+wdGX6OUcbUCyH2WFN3XSLn+88=;
 b=Uqjre4GcrhB8zctgC1T557H1213ut8HEJyoAh4YnsMuEyJ7wruDBfnyy9hoi9qcBUEt152N33tgeERNyUtQt9nizi5CpWLC6RtlwLvpmGCMiyjDZORl8wqjwmBUZaCw79Z4cGI/FS5UIuxMn5YEfJvL90rep/OksBeaC5BZ7qkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3374.namprd12.prod.outlook.com (2603:10b6:208:c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 13:23:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 13:23:43 +0000
Message-ID: <a3dfc73f-5867-d442-b74d-a890a42753bd@amd.com>
Date: Tue, 12 Jul 2022 15:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma_resv_usage: update explicit
 sync documentation
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220712131201.131475-1-christian.koenig@amd.com>
 <CADnq5_PSECF0b_ynF=UhXu3Os0hYZcvcQtk1pD+T3q+Z1g-Hgg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_PSECF0b_ynF=UhXu3Os0hYZcvcQtk1pD+T3q+Z1g-Hgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0055.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa661a41-8e5d-4638-a3eb-08da6409bdbb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3374:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KuZDSGNqUTvXRMzxbmO4dVv+71SmXYmpgstA8qXmgSNxT0vyaXHf+Gcr+Um2chQ0BkMTyijUzypM/ZmnX90ygkrpsdx/4fnCKIBukXG6cMId0fCEvEP5iSd8JRJwKytRghnEx8Q+T5QP42fd2R5uXtZWZWca967u6binRgbOJ+gvmvwg715zsWdUpAHRZgygHeWg9APV1IFpMkINEioJR735WLGyM1731oun4PSrHuq+mp5mUM2EqDhOPtgi91noUH0eLYxB4bqMo3bQxMQq6wzbt+ZwhUOkenLDf4XwuIsak9DHZffKd2CaohsD+Wh87xGQK4ji5DBj6DwyR0AwpUh7FUi5AdmX/S2yWDePe6h8etaBxUtoeGeIjPzw48/rpWg/UwVehbqScjpLDdqBzfI1kjaiVFF4zNqqMrIJyfQox3clhGXrFVPSK5nzVnM3AvxsevMKuSfT5AwiTqUqQxan8PK1yXXOTPLo2tMceQEGZFWChiMucV/lo7YzWljr3r2Bt4Gfu/ToGCxtD7ardqurD77dR6YM6TIAlJOHe3OTx4nJuUHiUwvE6ITjbPkPi/BVi5A1mfJQvGhCNfmiWKoHZdZ7fa4oAU0dcHkuOXnzdv00XPJrQmhu/8Huk1cCwar+ZrT9QOQHqSzy6jLp2Zs52ibwqnSaR30oTgicSadzNmbcclj7q2aiJkiNj1h71Lkiu1Q/GSrPHHxaJxf3eDSECkb542+m16mYMK93y2TqaZT1pmxbqCLUWQ03njuSPWWhAXeyjPIF9jhIWYK2Z5jS5m50smC1K5FYmwo+hGurQXkz3EW6JGYSa0zDg57CsVaSUZjN3rMp2pi65ReTPz7fw9Hg/5Sfd7YN5NdlsjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(6666004)(2616005)(41300700001)(26005)(6506007)(53546011)(186003)(38100700002)(8676002)(6512007)(31696002)(478600001)(5660300002)(15650500001)(66946007)(31686004)(2906002)(83380400001)(36756003)(86362001)(54906003)(66476007)(4326008)(316002)(66556008)(6486002)(110136005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWxVTFFyTVNKcWZjU0hIWU52TmJ0dXdudGVrUmVpcWlLY1czSEprbzM0dGRS?=
 =?utf-8?B?V1dkK1BrNGJYc0VvRUJqamR4bnkyWUlQdTZxZXFTNDJSNTJpcjFvK1hZMVVP?=
 =?utf-8?B?YnpsQ29USk5MSFAyTUlUU1pCSnM3Zm9wS2hQZ1FvdkNpNHZYTzFWT0J2TVJE?=
 =?utf-8?B?Ujh3S3d2bFZOMHdHWlFKZmN3a21sUkN1Vzlucy95bEFqbnRZU25jZXMvTU5L?=
 =?utf-8?B?RlpJa3pWRkp3MVdKanFWcERLb0t3M0tMeGYxc2hHeE5RbHJGd3ZxOGI3YU9q?=
 =?utf-8?B?R1NTbk02WmZ0bUcwWDdTYWs3ZXNXVUk0MDVlWmJ4cGEyOWZ2QzRnRUp6Slpi?=
 =?utf-8?B?SXoxTnZkMmJISWpvRUJOSDgrZnIrUzFVV2ltS0lva1hFSGlkdW55WTBIa3FT?=
 =?utf-8?B?MzdCZEQ1YTZnYXJUZURwYVNtZTRReHg4cU03QkI5Q2c3M3ZWZzFqdlQ5UFBE?=
 =?utf-8?B?U2hYNHJaSVhhQmlGNkpUa0tBbUEvK0NwUVIxL1BpMTFOODBBejJuWTZmZTlM?=
 =?utf-8?B?N0VpKzZHQVdwRVlRUUZkK0h6SkdERWpYVFhyNWpYK1hJQ1FyQkR4QUhEemYv?=
 =?utf-8?B?cGVxWDlXTzhod1VtR2Ewc1VSQTFVU0tzbDFEWG1VdGZPQi9OcEJSUkRZdXRV?=
 =?utf-8?B?eGlILzFnRXNEMG1YeTBFU1FBdTFmVGgrRUVvVTRxWTJwcGZ4SlJtZ2h3ZE4r?=
 =?utf-8?B?bE9zMTZZZFU1bGNyTjZMV0M5RG9oOCtBUWIyTlljeDRwYlhpbEpjSE5KS2dm?=
 =?utf-8?B?VG5iVEdOMTZWVFgwaEs2WVNGVHhWbVM2RVVrYWEzR05YUlhickprd2xObVEv?=
 =?utf-8?B?dGlGbTJzTU5Kc05TQWhnZ1dLN0xWV3lOd1Rack5MWVZSRXQwN2NWYWt6SGlE?=
 =?utf-8?B?UVdHbUtRdE56a0ZtSzgva2tIdjJEWFhiUU9GNC94d0RWMnhjN3NpZ2haK3M3?=
 =?utf-8?B?ZXVMNUlRK1FaUHRVS1ZOa3U5ZlphY25tNThlbU9SckVBRCtoR1lmRVNxbzJG?=
 =?utf-8?B?T3RXVkNzc3MzL1BNTFhBYmVFeVU2Q2ZIaE5maGZmVTRqRlNrbVQ5S3BlcmZp?=
 =?utf-8?B?ci9pUzl0a25EdlJlTFVCMkova3BvZmdUUXdCQnNvUFRta3RXWDk1cE9lNnhx?=
 =?utf-8?B?OUU3cGZKMWJQODFab29rS1BUQ2l5VXZBanFUSndsVUVkNk4zMitYRVI0dlhw?=
 =?utf-8?B?dCswNDcrOUtxL0t2TDZBaGcybjVKc0hrZFFNY2piZC9Zb0E2V0V1ZXp6dmJ1?=
 =?utf-8?B?WmZpVFArMHNSN1VWTFV0L2Mwa2ZiY2o5SG9mL2pOd0Y1bE5FcHFlOE05OENC?=
 =?utf-8?B?QmMxVTdTSE5ZanRWZFF5bnNBQ0hoZkV4OXFmcHV0dHo4STFKb0hWY01oTEtK?=
 =?utf-8?B?ZkZZcC9xbVRYTktQaHNwL3pzU1p0UktyTHV5djhXaVdtcXhDQTNmejBYaElF?=
 =?utf-8?B?R0ZjWDdLMm83VFJGUkErZ2I3ZHUvVjhlaERnU0JpMnhCME4yTXBQMWhUMjRx?=
 =?utf-8?B?VHdaSjkxeWVwVGRUdVc3OFpRa205TW01Wlo4NWtBZDFIc0xURUQ2YUxwZUxq?=
 =?utf-8?B?ZndUZHRuaEtCTEJBMWU0L0tiMC9BcmNCNW5sZkI5R01DUWJKZERFdkhFck5M?=
 =?utf-8?B?TEgvUWhibDFZZWZwRXEvRXFhUjlieTJMdkRXcXErWUljNFpjVE0rY2FZQzRu?=
 =?utf-8?B?ZXlHTTV2dDZnT1ZwZTltQUZnU2JEM0ViNTV3dk9HVVJKM2dzSkI5czlYY2ZI?=
 =?utf-8?B?emxyZ1Rkak5kRkpDa0piZHpPTllzY0dTbFJSdnp2MDVZajZhTVNubXREb05a?=
 =?utf-8?B?b2lFOFhja3ZvUzZYbWJzbDdwWlJqSUpSVXc1aXIyMStDWVo0anpmd0x0STBU?=
 =?utf-8?B?Y3FlaUoyb21lbGtmM2k1V1MxcjNZRFlqamlXV2d1SzNzWGt6cEROdjJKcTha?=
 =?utf-8?B?dWdXdTdIQlJFazZlam5raXM0WHRwMmRqZ2NUaDdTVkppRFhxc0t6NTVxN1FS?=
 =?utf-8?B?Q2JtVmwwYzUxdUxJTFp0bkU3ZTU3UFlkVXc3OXJQS3dlQVM0bDFSbkttZDd4?=
 =?utf-8?B?b0ZTMk9pS2R5NG5veDVpY2VEWjM2STFpSzd2OFVKeEZUdzYyMWFpY1FsU3pI?=
 =?utf-8?Q?7r2VfMQ+O8nLu2NA7wRonWASh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa661a41-8e5d-4638-a3eb-08da6409bdbb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 13:23:42.9676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7J9ly4Iad6hN7wvLl4byivjdqZaOHB8YdB8m1nIwhWvcnMPAc29CcjFTol0M7Mm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3374
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.07.22 um 15:20 schrieb Alex Deucher:
> On Tue, Jul 12, 2022 at 9:12 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Make it clear that DMA_RESV_USAGE_BOOKMARK can be used for explicit synced
> DMA_RESV_USAGE_BOOKKEEP?

Crappy autocorrect and copy&paste. Thanks for pointing that out.

Christian.

>
>> user space submissions as well and document the rules around adding the
>> same fence with different usages.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   include/linux/dma-resv.h | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index c8ccbc94d5d2..264e27e56dff 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -62,6 +62,11 @@ struct dma_resv_list;
>>    * For example when asking for WRITE fences then the KERNEL fences are returned
>>    * as well. Similar when asked for READ fences then both WRITE and KERNEL
>>    * fences are returned as well.
>> + *
>> + * Already used fences can be promoted in the sense that a fence with
>> + * DMA_RESV_USAGE_BOOKMARK could become DMA_RESV_USAGE_READ by adding it again
> Same here.
>
> With that fixed,
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Alex
>
>> + * with this usage. But fences can never be degraded in the sense that a fence
>> + * with DMA_RESV_USAGE_WRITE could become DMA_RESV_USAGE_READ.
>>    */
>>   enum dma_resv_usage {
>>          /**
>> @@ -98,10 +103,15 @@ enum dma_resv_usage {
>>           * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
>>           *
>>           * This should be used by submissions which don't want to participate in
>> -        * implicit synchronization.
>> +        * any implicit synchronization.
>> +        *
>> +        * The most common case are preemption fences, page table updates, TLB
>> +        * flushes as well as explicit synced user submissions.
>>           *
>> -        * The most common case are preemption fences as well as page table
>> -        * updates and their TLB flushes.
>> +        * Explicit synced user user submissions can be promoted to
>> +        * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
>> +        * dma_buf_import_sync_file() when implicit synchronization should
>> +        * become necessary after initial adding of the fence.
>>           */
>>          DMA_RESV_USAGE_BOOKKEEP
>>   };
>> --
>> 2.25.1
>>
>> _______________________________________________
>> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

