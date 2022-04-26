Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3325104EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA28610E0AC;
	Tue, 26 Apr 2022 17:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA6510E0AC;
 Tue, 26 Apr 2022 17:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSeb29vMkYBz8CUYN721bu63QZEuLQzu7s5zwcz7H3n79mTixlZb/oLQrfvvp5i+XSG0V7isIs+VH4aAg+ngFDyCS5xggu35a13DEAnEIdhmhl+jZPLRvb3lWNrosFhZFC7ZNkuu0MQ2B8K3shBFSa25qb6g1sjl5LnHBO7WFOxTo/t5/ZLebs42LLb1NH90QLRsZ6nuJX7ZmWlizEGN//dtVQdeAW7dbkAthCMZg4cYojVjhVBpOp2xczxu4qQmIaSMqorDHSmphqayXxJ4G1LeKr2hf6LxpCkfJd2g64E7etORLzqHUHXWXDgyu/e8Azo+VfX7Gc9na7MfXOjhvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j1eYy1F6Q0G6h44mvc2aCyPqgnT5/Aovqkcfp3k8EE=;
 b=RFYg4+qqst/Dgu0RT9Xxh2+KtP7uTiLWmANkMGrt7HdgEi5xPpHVndtoF8Hb7cAKRR8eZYEOd/Yggzhilzr7tIa66sap/hKEv34xW9LdGvz2qnbuk7DgAOURwEjyr2ZnrdBTOf4vjhBT//VuS72ZkdttdmArF3tj7ZVm/HdNUuxzSLV8tosY0AYnCsRwGovE00E2hj9v/QZxT+fIzNwNlRfqQP34tn9D0Od7efwyGju5DaML0EIeLb9ugpYc8vAmRbJGOWkW/kfrwbqQTk08m4r0QonGLriayNI3wbwG33fI3mv6sAvBqCxAc/vkk5NTMkzVyg8sa9Q8rnTMUqCkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6j1eYy1F6Q0G6h44mvc2aCyPqgnT5/Aovqkcfp3k8EE=;
 b=QKtXOT9uBB1TedfDZhz1bGDlZdinYsM361aPr5J1im0Vd/2qayxd/1Gl19gidYDLg4V4nJECPv3KRUJCxxechlm92HRzMeYb09w1+yxaBm92tluEfJzjE4m/vvAMI1De0kFCgdcVha1CqRcnzngZkH7wNSZmhg1HAhIU75yQG3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB2957.namprd12.prod.outlook.com (2603:10b6:208:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 17:08:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 17:08:53 +0000
Message-ID: <215f55f6-97b8-5dd3-a2cc-fe42e19a2769@amd.com>
Date: Tue, 26 Apr 2022 19:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Content-Language: en-US
To: Rob Clark <robdclark@chromium.org>
References: <20220412212558.827289-1-olvaffe@gmail.com>
 <CAPaKu7Tv1Mxt7Ao8kH2-MZDBK7EB0D41COJD8Sjze76t_o-qmw@mail.gmail.com>
 <ffe7dbc1-8a19-1e19-402d-27efc8e55b39@amd.com>
 <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAJs_Fx7OQ2OJo3pQ-ETT1827PtfuFsvn984gg8GeDVrqy0Ucug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0411.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bcbf956-22ea-43f3-5c3f-08da27a770dc
X-MS-TrafficTypeDiagnostic: MN2PR12MB2957:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB295761E3846B25CDD184404083FB9@MN2PR12MB2957.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAz3OBROEobooKaTvbT6vDIb7jbVrTPOGJex2nBUqVJ+KSVgp6N510kTLzd74kp411t2mkUcZSXlUoNyiSFNHjjc7+kz76xRlm7Au90KsXEeMJRo6RfAjNc4GQ+si4AANUDUZtk3Jz8agVak8Qo2gesN0RzhQfHo0vcQ8KS5cTtP/2bYFlHqMpnBqdRj1N8aPJkrDnDM9E4xg2j59On6ktV6SJoh+c4ftNUQ2vFYZno6A3LjM7exuZytXA/XTNoZZ3dFhQPu57pSH0eV6KjlqN7Xak3lUJbxnS3XwgSsRX0618h1LC+d9ZT9pw7KPILGZhUl1n54AHReqv3IF6RhIwLH7GYoPdwbf6tKUhChdB0mxX51c3rBmw1Sh9Yrp9y3Y1DP7SXey+uZjvVs/z/fFXIUV9Y3EBZ26/w8wR6VRjRRerymYTCFyPWVCKvhHzyvaPZMutxydgsp/EKNmkBX5ht4+70E63rZtFVbU30v0ibJBKQmOyVwArW549UA6cUYjDdyzI/lFAfuuT4kKBt5c898+sLqSZD0kGwtJq4cCUHzGnuUbDqd6FPAx1yzmRD2HfGKjSa1PAxFbM4cp9cylKCrQgCa0e/uWY7wCujnM7AZ0zzZ/yoYuI5t7k5ojC9Jzik2ekoHlI5J0ImtWld7RLw4gTYbWKsvAXzvwgWMPc2vR1v2BMTr7IS4SoDn1qiT3PPHjfxcxK5LMEaCLis328KmzoyKIRqrdq2mYUbV3q/VKBh5+DzPEZGXZOJcmKXz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(6486002)(6506007)(186003)(83380400001)(36756003)(31686004)(6916009)(4326008)(66946007)(2906002)(66476007)(54906003)(6666004)(8676002)(66556008)(316002)(38100700002)(6512007)(53546011)(2616005)(31696002)(508600001)(7416002)(5660300002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW1qcERvT1N2TDFGa1I5RHJxWkhieVBEcUpQWWVrZGFzMlhFWjVLYzJNbTcw?=
 =?utf-8?B?VnZDamlFVlh0ZE9wMkg1QU9RZHMrQ0d5Q1dTNGJCY0lLTUdGWVgrZUVMQXdZ?=
 =?utf-8?B?ejQwbUNwNFlzU0E1dzd1ZHUxSXpwUmFqWFhSenJYbHRRMWdUVFJqWmtONFRu?=
 =?utf-8?B?NldKNUhTb1VQMGlKUFZoNEJFVkNPV2ZwSUo4VWMvakFIVVFySG5pQ3JpZVVr?=
 =?utf-8?B?cGdPY0JxSUlxZjc2OXZhQWs0dHlsalZGWkRUL0RsNURjNXhxWEdJcExqZHRY?=
 =?utf-8?B?dm8vVUJCVS9pYVR0YU5Jd2ZuczFiZ0d3UFU2V1JxTjJxb3hhYlNzdmp1cFhD?=
 =?utf-8?B?ZzhNdEdpeVFGNytaZ3EzR1BjV2J0N1BlSG5CaCtiOGp4dXJHTk5TMjBKNkFW?=
 =?utf-8?B?V2tLaWZIa1oxS1V2SlZ1UmJrVk9jZEtxemYyVXFUTmdKUi9iSEtiVU4zYURR?=
 =?utf-8?B?elhMeUx0a2E1YkhZVGtkZ2VSQXRBVFFUM3VOQlR5ZW5PeTh1cXplOERIN3Vl?=
 =?utf-8?B?cmxUeC84WFh2eDVQZ2ZGcTJQMGxTV3hJMFdZbkxhSFkzMkgzOVQzYXFZY3lI?=
 =?utf-8?B?UXJCVFBGSDdQS1V0WXoyTmNGSU5YMWlaL1Z0eGlnNHZHVUxQdi9QTWRiajlY?=
 =?utf-8?B?K3FnK25vWXUrM05ONjdOMjNrSjBzRGxZOThuUzg0UVhsR1Z1Ni9pTWdFL2VK?=
 =?utf-8?B?YzVVMTlDQUJOZUZGU3dPY2xZOGx4bE0xTnBuUEYzeEtJb2M1ekJDOWM1bVpp?=
 =?utf-8?B?MThCUGNJRWV6UnhuMTExaVdZTllqTTRPVStDTVRQZ0Zqb2YyQmlSTDRiQXZu?=
 =?utf-8?B?Z0EzMkpiSVhQQURVQTlMaHR5YkVVbytJbFVnZEJJQkJ5anV6akVQcFhvNmxo?=
 =?utf-8?B?bGVzQWhUaklnOFh4WW5iR3NVb3ZZdFJFM2tUQ1pKRkUvZkR0TGVtYThzYW4x?=
 =?utf-8?B?cHpwaUhHSmJzQ3BQQTVEdUJzcTJMTExETFAweFp6OHFsUThKY281bVU5VTc0?=
 =?utf-8?B?VENleG1YL21teXN4QnZla2hiM1NUOUJra2taZklUOVd5WWx5eVNoQmJCalVl?=
 =?utf-8?B?cC92UC9sdC81UXpLaU93VmFMWTdLbm9wc1BBUFJ3eUFacGlWVFdtdTJXTEdJ?=
 =?utf-8?B?d0FRZERoVzVpT0plSXVTQWd2TUxQT2szV3g2T0Z4ZUk4YURpR2Z4aU52MXp4?=
 =?utf-8?B?Y0FiM2ZCRy9yc0wzSmdRUm9rVHVvQ2RKanBBeUE0V0RGa3BTSDNlaWdGRlkz?=
 =?utf-8?B?TXcxZHJXN2VVVkQwTGJlYlgxSUV4akhXYllSaUZwUFBZeGVzdWFaZ1FsWi8w?=
 =?utf-8?B?TElBTGRvZW5rM1hIVjloeUpBa09UQnRtbDNGSUtPNEFrOEZSb0h4MGFQU1Nu?=
 =?utf-8?B?SVYwTXh0MUtwcUNTMm9PSGRZVm5nMUR5R3lWNHJaQ3JEMEZnd1Fmb1hqYUUy?=
 =?utf-8?B?dzY5Y1lOK2dkQW9wQXh5bzlQZjNDNlN6UlM0L0ZQM1hrNHJtNU81Sk9vbU5Y?=
 =?utf-8?B?d2VFM2lKMEYyWTVqWUllT2xMdzQzcXNFTEdEYWlnRjEyK2tiSmVPK2p6YkxR?=
 =?utf-8?B?a2lnMmFzUVAzRU1HRi8zVkFta3B5eitSQ3RhWENkWUJaR3YyMGR6Y0JveTE0?=
 =?utf-8?B?TXZ0RjFtN3dOQUw5WW42RHc1bnd1YnF6eFdOSTZJVzVvanhlWTY0VzRCdWo0?=
 =?utf-8?B?RW8vcTZiVkdCL2ZIQlJrcGhtenNoWndFQWFPUzZRYXl3djdlelNhMisvdmJC?=
 =?utf-8?B?SHIwc3J0TGsveVFDdjA4djFjTFYyc0d4VUViMXJ5UmV0YllsbnB2ekd2YXAz?=
 =?utf-8?B?OGxOZzN1OEtiREsraUlLRXE4cDYyVlJUcXNNTEs0U2ZkK1E5dkFrQU1mb1FB?=
 =?utf-8?B?RUNjOEZ0WGhESTFvRDg3R1hZak13VnIzVjk2NXIzVStub3NRenpKUlY1TDlh?=
 =?utf-8?B?SGNmQnpNQStCSFVlOFJveTZqODJJV04zRVRMTTllMnFReWhmS1R1ZU1pTnFs?=
 =?utf-8?B?N0dETG42MXVycDVYSG81L1ZBQzBDendmYWk0eEhVZlBtV2lDNHg1cFh1dmls?=
 =?utf-8?B?UklCM3poVnoxSU93SFpmWW9WSVJTQUpoR2tQOTZGMUtKTUdjQkV1RUM3Sk8x?=
 =?utf-8?B?K3ZrWUxRdW8zMVV3YXB2RFdLeUYvekxnSGpja0N1SmJyQkRWbkF4NkdwT09E?=
 =?utf-8?B?MnVYQVYydWh3WlAreDhNa3l0VzRaUlVGZlhmcXFoOG1FSVhXTDZTUFJqSW5J?=
 =?utf-8?B?YWJyWUhOMGtnYlJPSEQvRkNqZEtjQ21hczRwY0lZZlFVT05iQ1o2YVJ3NEhM?=
 =?utf-8?B?aFlMWjk2a3BTQmhoaHhaSVRFa1U5S1VzT1pxUGJKRDJKMFh2ZjRpUnlLL2kz?=
 =?utf-8?Q?Gw6zU4Xl37fkhCTvwoaCSxDWNL8a8ktEW/UuF5xo9tCyd?=
X-MS-Exchange-AntiSpam-MessageData-1: uKE7Izbz37RpcA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcbf956-22ea-43f3-5c3f-08da27a770dc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 17:08:53.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBBcpEuF0l6WIdGn3wZFMxeoz9OEGyEi4K42GyUTp3tHrMIPc6bMd7rVZMz4grzi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2957
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.22 um 19:05 schrieb Rob Clark:
> On Tue, Apr 26, 2022 at 9:42 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 26.04.22 um 18:32 schrieb Chia-I Wu:
>>> On Tue, Apr 12, 2022 at 2:26 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>>>> In practice, trace_dma_fence_init called from dma_fence_init is good
>>>> enough and almost no driver calls trace_dma_fence_emit.  But drm_sched
>>>> and virtio both have cases where trace_dma_fence_init and
>>>> trace_dma_fence_emit can be apart.  It is easier for visualization tools
>>>> to always use the more correct trace_dma_fence_emit when visualizing
>>>> fence timelines.
>>>>
>>>> v2: improve commit message (Dmitry)
>>>>
>>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> This has been reviewed.  Should we land it?
>> No, there are still open discussions about it.
> I think if it is needed for trace visualization, that is justification
> enough for me
>
> I don't really see otherwise how a generic trace visualization tool
> like perfetto would handle the case that some fence timelines have
> separate events but others do not.

Well I just send a patch to completely remove the trace point.

As I said it absolutely doesn't make sense to use this for 
visualization, that's what the trace_dma_fence_init trace point is good for.

The only use case is for debugging the GPU scheduler and we should 
probably introduce a separate GPU scheduler specific trace point for 
this instead if we should ever need it.

Regards,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> (Or, how do I check if it has landed?)

