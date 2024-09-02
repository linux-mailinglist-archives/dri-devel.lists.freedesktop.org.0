Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9D96850E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F371710E059;
	Mon,  2 Sep 2024 10:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lVAsXPcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE0B10E059
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:43:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+7CWBYCnMzo1h3cbwQhYqPaTDi/xw2f9oAofF63rqV7Zrw29krT23lCHls4oUmPug+lGFUAtoH0Zr0xdvYdMpbSPNoclaWQCsoenrFD+hPWTnUOHe0OLh9d7TVa5G0Bjluqit33S1sEpIZqwbZRRtI8EkfoAindo/+qrYGsLQ0RsZ2zJRd/6jOKVP7N8SGcDHQ1Tj4GqmHnzBlVf6Nw+4k+YLstesFgYIFUL21RBUxaqrmxTtTmCfJveblmYa1mo7YeW8RbutQMSNJ2ezOJlbwwDnC5HLvSQPQnLfDu58IR62KiorhdNhoM5oHnKg8oPfDcafP/Sb6Edk5XYOoJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL/Qu/93Dv6AH5p6MeWOGlUhZI8Bi4ml3FiD8ldr8vI=;
 b=XXmk8HZOFoLOLHMxUuoa8kT82px5e5uxM1IWPvKJf4Qasq9C90EM+7eKD5Wme1mH3/om94AoYKU1d8hTLWsCfwDOeshdVhCcVOyQdCdvt5UVh7YH3LHYC9BR4qtnRimPLWHFTmn/ZiqSF/vJ3bikaI4jGix1FuLtxuq2N3iwxbzGOw5k9e5ILty6+hEZ8ryNfbOeFa8gmWgPHcSMyr5/i4mhSdFepJ1f1cEYZrHoKp4Dk/8tfUEJUcfl3EorzfPjAJmvoGK9C6mi9p10V1E0zlMfB8gOtfhmLma6wjE1AxT9nU8xK+PMW9LmJRvkjgZ7euQe9USjgX+TWnRkGGDrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL/Qu/93Dv6AH5p6MeWOGlUhZI8Bi4ml3FiD8ldr8vI=;
 b=lVAsXPcUZ0VKHEYrf6/tmJIWihdvVdk7zxtVMErVpCsNjZyBAyZnr5CscCGy31046Fu6zSakc9c9zfiqlgPbZiFKW2RnKXKR2gvEhf4e/mnTdCo9TgPg6GDVpAZWZyvcwtbx47ckfqoKaKLLnlJ4FsmrfDBD6IRqOL8AWKBKoS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 10:43:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:43:51 +0000
Content-Type: multipart/alternative;
 boundary="------------AoKYAyexmKqpDch0BKCcfZl3"
Message-ID: <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
Date: Mon, 2 Sep 2024 12:43:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
To: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: c268cf67-80d4-4d46-db4d-08dccb3c21f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WENPQmlZRzlHald1dzNma1RrNFI5VkxuaDhUZGlkSkhNWkxPU1IwUnQrM0hq?=
 =?utf-8?B?RHIvNHJqdjhPRE1HYlhXUXhDYlhlQnZZUHBkbWNVcTU4T3VRdC9WRDIrOWNw?=
 =?utf-8?B?dE5wV3gwSUgybUdCTVYrblZZSEgrQk5PUHhFZFlHbzdQK1VCS3RhOVdOS2lC?=
 =?utf-8?B?dmVaTEFRWmtQR3pKNUpRazNEN0d6cDNBc2QyS2lXaDZpRjVoM004TGQ1aG94?=
 =?utf-8?B?N3hWUm84aTNSdjZKMWNOTmlvamQvZVR1TTdqY3g4RVlRMTdHd1dqY1BlYUsv?=
 =?utf-8?B?a2VyNitxQmZjQkdDeVNmUmlLaVQ4dm9nZldpbldpOWdYUWVEYnNPL1hqczJm?=
 =?utf-8?B?VEtYT0xJeEpiYng1YUNYUzhPdjRHQWtKWmhCdGYvalVxWml5TWZ2dVY0dnJS?=
 =?utf-8?B?aWlSOFhiaHdrMmdxOFpETktmcHVWWklBbWVSK2tyaHYvbXBqTWZYT0FDbnpZ?=
 =?utf-8?B?d1FSZzFrQWxkbE12NEJrai9UcFI3a1VSNjhpVUEyTDJSa2o2bE9UU3pSeXVw?=
 =?utf-8?B?QnZJbFgzV1BLWW5OS05YbWluelJWcGhEVGpRWDdoVnd2T1Y5dC9NRWQzMXhJ?=
 =?utf-8?B?WkZNeU9uNEFUSUFlNS9iWUkxRkZMRGNlbGJqVllSMzdDT3NHUE1nZEJDQmNz?=
 =?utf-8?B?cjFoODZvc3lqWW5HR3RQOUh6c0JmdGRub202Zll4d3cwYnNxSUNYODlXL1M2?=
 =?utf-8?B?OThRSWtEUzRMOGNGS2tkaGxqU3JoMmt0WjdBZHA5RGtJak9jZzNEOFpYSmo5?=
 =?utf-8?B?a1NNd21Xc01nSFpJaVVlMFU0bGR6OXRXY3c4c1lCK1ZDbFRBd3lxS1RHVE1I?=
 =?utf-8?B?NTNwY0FpRTZ5UGFEOGo5YTltQnVROFRRQ1FyUlo4OExXQktkeTVhOS9Oay92?=
 =?utf-8?B?Njg0UzZSa3JhbE1kZzlRR0RaZ3h0dVp1eDhUSGxMYmhNL3B4WGFxdFRmWHlm?=
 =?utf-8?B?UWpiT0tUK2d5Rm8rSm1JdkVGWC9Ld2VuN1FCM0d1N3BaOUJiblI0bUgxWWRr?=
 =?utf-8?B?cktqeUlDUGF4Y2V6VjNTNUVOeGt6a3JKRmNmN0Nab05WZktJUGxvcDFtdlBE?=
 =?utf-8?B?aTJHZDQ4T3ZvelFleFFVUS93TklZb09NM1ZrV1I3L0E1UUxNN3lVQU1OYkZV?=
 =?utf-8?B?UHhpaVRlNytZYkJPOEs2c1NsMjlQU1BVZ21BWTBQL0RnY2hqNlNkZ2tKa3JX?=
 =?utf-8?B?YnVGcnM1Z3g2Wm94WHA1SjZ6UHN3cDNLOUZFWEQwWWxPaSsvYm1rZTNYam0w?=
 =?utf-8?B?elNVM2xXMjB6aEtBVFdBcFF2OE83L1FkS1hmdjdyaFh3eXFmQ0hHU2VnRjNC?=
 =?utf-8?B?TVF2R2RtcDVQa1Mvbm40UTdRTkxwRWF0SldheFNIYlJkS2swL1hEVXhXeUlM?=
 =?utf-8?B?ZEVHcDg2djREYndRNWlZV3pkL2ZPeDU1REZVRnZTSkxmdW5paThDOStjMG5j?=
 =?utf-8?B?UDV3dW5zTW0zSHh4ZjRkczdzTE1XUi9PdjRicTA4SkJxMWZieTdIVG9rVHU2?=
 =?utf-8?B?Q3Z5aE9TUlVyWUUvY0dRUnBGTnBrc2l5UnhyUzJnZnBIRnlsREdWcEJzbkpr?=
 =?utf-8?B?aG1DZXhwQWQ3alh5ay9tSGlmQnhVUEVPVVRUTGpYZk1VSjR4YkhPS0NsOVly?=
 =?utf-8?B?U01HQk1FRzh2cFBoSXdwTk1DRjJ3a1cyYys1OHNuRzhHM2JYeWFCMTUxamVi?=
 =?utf-8?B?SkNwcFg0aStJTCtHZm9GVFRGVVZjYm9wU21CS05HUUtScHVadFJWdzd4VURM?=
 =?utf-8?B?QmtrdGtHRHAxNUtWdENqZ3V2cGF1dE9SZlBXUndWQ3hvNHBKU3BTLzVMSkZM?=
 =?utf-8?B?ajJSb0Q2QzlBblg4cVROUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkJmWDRlNEFqTUdXODNaTWhReVFudndYRFQ3aVJ0N2pwQ1k1RlpMbFpia3ht?=
 =?utf-8?B?a3R5V1IwaUFCRldqQTh5YUFHcWF4bGtwSjlYV00ya0lncmQ0bEhtYVB0RC93?=
 =?utf-8?B?bFJ6RDh3VlJFdjVjMWNoUnZORnloRW5xU0xSYUVKbVg5ODdJOE9sTy9tcXd1?=
 =?utf-8?B?VkxMTlRJRjhtU0JSVUhrYXUyWEx5bFBISFZBUndpWkNyY3lFdjd1MUJOc292?=
 =?utf-8?B?N3pibWxhVi9pOENZdm9rVGpuMW9qRHl3NkNrU0pxb2FnVFFrMGZ5d2ZqcklJ?=
 =?utf-8?B?bDA2ZDZCQ3hwRUVvQThnRjRwMGt0UTE2NTIxZmorN3p6QllwU3g5MEJBYzVu?=
 =?utf-8?B?QU9wZFF5TDIvcWZscndjZWdwQnV5QzhtK2RQQ0dac1Z5cW9tVGdnVllXSEYr?=
 =?utf-8?B?UlJ1MTVMeWErakFYZDdia3JidXRuYk1hVjRCcHUxZS9Xay9qRXc3OWJwZVox?=
 =?utf-8?B?Um55K2ZSY1VxanAvRU1INGRyT0kybGEwVElkT2FmNi92amt1Z0VHV1F0TWFj?=
 =?utf-8?B?RnU2WFZERi9GMFhPbjNHWkNQclk0dnBiUzFwSmdaNWIzM1d1Ri9uVC9RZGMy?=
 =?utf-8?B?NjYwMlhDYlFrc3JJMkZ3S3NQYlpTSHVIOUFsanY1dk9kTmdJVk9JaU5XZDhy?=
 =?utf-8?B?bjB4akR3QjNVMWNzNUpvdFEzNG1FdVU5K0ZveGZ4aHp2dmI2eHYzeFdudFMx?=
 =?utf-8?B?RHlWVGdsRnJ2WnovYThSNmxwNUIrZE9MNUdUc0pyY1Ixc29jR0ZSMU5mSGtM?=
 =?utf-8?B?V2tQMUx6UFB0NDc4VndWNG0wQlBPQTUvOFRYd0FHY3pVRjhTNkZkMXJ4dEVw?=
 =?utf-8?B?Zi9NNW5kbGR0WU5JUEpwbmJ1c0EyTnRteWhQUjFYWWY2T2U5d0pPSXR3ZG51?=
 =?utf-8?B?eEJycGJRWlpzLytBNWNxeWlLRnZjYkY2V2N0ZmR1aVR3QnFpSDNsK1VvVURo?=
 =?utf-8?B?aW0wVnMrWnUxQllIWHpXWWlUNHJ5OGc3NGdhMjZxbEhCS1pGdlpZeU1qaHJZ?=
 =?utf-8?B?Z2lZcGFKYTZVaS90aUFQYjVQbTRmSU91NVNYWUN6WnFzRWI0VlUvR3JZaWRG?=
 =?utf-8?B?UXRpZExRc1UreXJHUWtCUk40RFk2ampadzJjM29NTWdTZm5PYkh3dUJhWlBL?=
 =?utf-8?B?SXJFeEtVZUF6Unk1YVUxSUZIU3A3UnhsSGFxMTZyZzNPYXlEaHNXd3hycDFN?=
 =?utf-8?B?MGEyclhXRTMxWk5vUzFGTHRCS0tJdkdsaEdPbWZCU0xwdGlZN0R2bU1GMyt0?=
 =?utf-8?B?bjdjYmFDYVNiblZ4RVBjcnVlSVhCY2VwQ1NQS2dCVlpndGNIZ21JRWxPSjRV?=
 =?utf-8?B?NGNmWjFEVUwxTEJIVFpwWnVDdkVhQjNST2tTMXdBc3RUeTVBUEt2T3plRHVX?=
 =?utf-8?B?U0IwazdTd2IwNU9jb2NlQkI3VXVWWHlxMzhwMTV6M2NyUGo4cDVvNUpzOExu?=
 =?utf-8?B?cnNZaFV1azFwdWJSTlZDR29VeVRKek1HNldvbmwvK0ZZeml0VjZuYXgyNGNX?=
 =?utf-8?B?dyt4SFNPT0FRTzgyN2N2VTIzTEhOVy9mTnVTUGEybEsrQytkOHlRYnJyMnVQ?=
 =?utf-8?B?c25CTjJTMFhDakYvR1dFZTh1dENUeUdOczlpZWJMQVYxSEJNK1VSaTFCZGxy?=
 =?utf-8?B?UEtjMENKeUpQRXhNUVRsN05PRVRFcjMzWW53djY1OWJyeFVobkkzL1lFVDE2?=
 =?utf-8?B?UVlraFhyZEljRVpFaThGOCtSM08vNnRIcVcxamFuT0dNd1RUL0NWUVAvWGFw?=
 =?utf-8?B?WnJ4Qk1wb1dDUXgybkg0MGhNZzl6SzVuS2hLL25KZ3RLYVRVUW9kdVdlRzNk?=
 =?utf-8?B?dlpJb0RxdmlleUFjZm9VTGUyckthMmpiTkhNNkpieUcrUTdnKzJhN0wwNWZD?=
 =?utf-8?B?SFRVSzhVdDZVK25HSSsyb3hIbzhMMlNMVVYraC8vYzdMZkF0UEYvclI0OUhW?=
 =?utf-8?B?VkM2aVdlM3hZVFR1MHBJeXZZUGU0VWRKdE1JeE9aZEU2UkpCNXpJY2NtRmF4?=
 =?utf-8?B?Q09sdzFPZktoaXRYbU9wRmxIZlpnUThKNEtsWUNsVDkvZG5rVnpuWFJZczFp?=
 =?utf-8?B?ZHl4NG5kTDhKWE5tcG41Rk1vMmpTNnFhVDRQTWdiWWFINTIrYTZrZ1JtcXA2?=
 =?utf-8?Q?gkWv8LBmB+43sKkGSz1Qs1B2U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c268cf67-80d4-4d46-db4d-08dccb3c21f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 10:43:51.0295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLkmryHehLQHU1tX8Pw4+SralwVQn5S944VWxi5V3pQ386KqC3Sb1TxNq5wEFGoo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348
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

--------------AoKYAyexmKqpDch0BKCcfZl3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.08.24 um 23:43 schrieb Matthew Brost:
> On Fri, Aug 30, 2024 at 10:14:18AM +0200, Christian König wrote:
>> Am 29.08.24 um 19:12 schrieb Boris Brezillon:
>>> dma_fence objects created by an entity might outlive the
>>> drm_gpu_scheduler this entity was bound to if those fences are retained
>>> by other other objects, like a dma_buf resv. This means that
>>> drm_sched_fence::sched might be invalid when the resv is walked, which
>>> in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.
>>>
>>> This probably went unnoticed so far, because the drm_gpu_scheduler had
>>> the lifetime of the drm_device, so, unless you were removing the device,
>>> there were no reasons for the scheduler to be gone before its fences.
>> Nope, that is intentional design. get_timeline_name() is not safe to be
>> called after the fence signaled because that would causes circular
>> dependency problems.
>>
> I'm quite sure happens, ftrace for example can and will call
> get_timeline_name in trace_dma_fence_destroy which is certainly after
> the fence is signaled. There are likely other cases too - this just
> quickly came to mind.

Good point, completely forgotten about ftrace.

>> E.g. when you have hardware fences it can happen that fences reference a
>> driver module (for the function printing the name) and the module in turn
>> keeps fences around.
>>
> I am almost positive without this patch this problematic in Xe or any
> driver in which schedulers are tied to IOCTLs rather than kernel module.
>
> In Xe 'fence->sched' maps to an xe_exec_queue which can be freed once
> the destroy exec queue IOCTL is called and all jobs are free'd (i.e.
> 'fence' signals). The fence could be live on after in dma-resv objects,
> drm syncobjs, etc...
>
> I know this issue has been raised before and basically NACK'd but I have
> a strong opinion this is valid and in fact required.

I've NACK'd automatically signaling pending fences on destruction of the 
scheduler (that reminds me that I wanted to add a warning for that) and 
copying the name into every scheduler fence.

As long as we don't do any of that I'm perfectly fine fixing this issue. 
The approach of creating a reference counted object for the name looks 
rather valid to me.

Especially since we then pretty much get the module references correct 
for free as well.

Christian.

>
> Matt
>
>> So you easily end up with a module you can never unload.
>>
>>
>>> With the introduction of a new model where each entity has its own
>>> drm_gpu_scheduler instance, this situation is likely to happen every time
>>> a GPU context is destroyed and some of its fences remain attached to
>>> dma_buf objects still owned by other drivers/processes.
>>>
>>> In order to make drm_sched_fence_get_timeline_name() safe, we need to
>>> copy the scheduler name into our own refcounted object that's only
>>> destroyed when both the scheduler and all its fences are gone.
>>>
>>> The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
>>> even after it's been released is worrisome though, but I'd rather
>>> discuss that with everyone than come up with a solution that's likely
>>> to end up being rejected.
>>>
>>> Note that the bug was found while repeatedly reading dma_buf's debugfs
>>> file, which, at some point, calls dma_resv_describe() on a resv that
>>> contains signalled fences coming from a destroyed GPU context.
>>> AFAIK, there's nothing invalid there.
>> Yeah but reading debugfs is not guaranteed to crash the kernel.
>>
>> On the other hand the approach with a kref'ed string looks rather sane to
>> me. One comment on this below.
>>
>>> Cc: Luben Tuikov<ltuikov89@gmail.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Cc: "Christian König"<christian.koenig@amd.com>
>>> Cc: Danilo Krummrich<dakr@redhat.com>
>>> Signed-off-by: Boris Brezillon<boris.brezillon@collabora.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_fence.c |  8 +++-
>>>    drivers/gpu/drm/scheduler/sched_main.c  | 18 ++++++++-
>>>    include/drm/gpu_scheduler.h             | 52 +++++++++++++++++++++++++
>>>    3 files changed, 75 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 0f35f009b9d3..efa2a71d98eb 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>>>    static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>    {
>>>    	struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>> -	return (const char *)fence->sched->name;
>>> +	return (const char *)fence->timeline->name;
>>>    }
>>>    static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>>> @@ -112,8 +112,10 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
>>>     */
>>>    void drm_sched_fence_free(struct drm_sched_fence *fence)
>>>    {
>>> +	drm_sched_fence_timeline_put(fence->timeline);
>>> +
>>>    	/* This function should not be called if the fence has been initialized. */
>>> -	if (!WARN_ON_ONCE(fence->sched))
>>> +	if (!WARN_ON_ONCE(fence->timeline))
>>>    		kmem_cache_free(sched_fence_slab, fence);
>>>    }
>>> @@ -224,6 +226,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>    	unsigned seq;
>>>    	fence->sched = entity->rq->sched;
>>> +	fence->timeline = fence->sched->fence_timeline;
>>> +	drm_sched_fence_timeline_get(fence->timeline);
>>>    	seq = atomic_inc_return(&entity->fence_seq);
>>>    	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>    		       &fence->lock, entity->fence_context, seq);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 7e90c9f95611..1e31a9c8ce15 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1288,10 +1288,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    		sched->own_submit_wq = true;
>>>    	}
>>> +	sched->fence_timeline = kzalloc(sizeof(*sched->fence_timeline), GFP_KERNEL);
>>> +	if (!sched->fence_timeline)
>>> +		goto Out_check_own;
>>> +
>>> +	sched->fence_timeline->name = kasprintf(GFP_KERNEL, "%s", sched->name);
>>> +	if (!sched->fence_timeline->name)
>>> +		goto Out_free_fence_timeline;
>>> +
>>> +	kref_init(&sched->fence_timeline->kref);
>>> +
>>>    	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
>>>    					GFP_KERNEL | __GFP_ZERO);
>>>    	if (!sched->sched_rq)
>>> -		goto Out_check_own;
>>> +		goto Out_free_fence_timeline;
>>> +
>>>    	sched->num_rqs = num_rqs;
>>>    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>>    		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>>> @@ -1319,6 +1330,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    	kfree(sched->sched_rq);
>>>    	sched->sched_rq = NULL;
>>> +Out_free_fence_timeline:
>>> +	if (sched->fence_timeline)
>>> +		kfree(sched->fence_timeline->name);
>>> +	kfree(sched->fence_timeline);
>>>    Out_check_own:
>>>    	if (sched->own_submit_wq)
>>>    		destroy_workqueue(sched->submit_wq);
>>> @@ -1367,6 +1382,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    	sched->ready = false;
>>>    	kfree(sched->sched_rq);
>>>    	sched->sched_rq = NULL;
>>> +	drm_sched_fence_timeline_put(sched->fence_timeline);
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_fini);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 5acc64954a88..615ca89f77dc 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -261,6 +261,52 @@ struct drm_sched_rq {
>>>    	struct rb_root_cached		rb_tree_root;
>>>    };
>>> +/**
>>> + * struct drm_sched_fence_timeline - Wrapped around the timeline name
>>> + *
>>> + * This is needed to cope with the fact dma_fence objects created by
>>> + * an entity might outlive the drm_gpu_scheduler this entity was bound
>>> + * to, making drm_sched_fence::sched invalid and leading to a UAF when
>>> + * dma_fence_ops::get_timeline_name() is called.
>>> + */
>>> +struct drm_sched_fence_timeline {
>>> +	/** @kref: Reference count of this timeline object. */
>>> +	struct kref			kref;
>>> +
>>> +	/**
>>> +	 * @name: Name of the timeline.
>>> +	 *
>>> +	 * This is currently a copy of drm_gpu_scheduler::name.
>>> +	 */
>>> +	const char			*name;
>> Make that a char name[] and embed the name into the structure. The macro
>> struct_size() can be used to calculate the size.
>>
>>> +};
>>> +
>>> +static inline void
>>> +drm_sched_fence_timeline_release(struct kref *kref)
>>> +{
>>> +	struct drm_sched_fence_timeline *tl =
>>> +		container_of(kref, struct drm_sched_fence_timeline, kref);
>>> +
>>> +	kfree(tl->name);
>>> +	kfree(tl);
>> This avoids having two allocations for the timeline name.
>>
>> Regards,
>> Christian.
>>
>>> +}
>>> +
>>> +static inline void
>>> +drm_sched_fence_timeline_put(struct drm_sched_fence_timeline *tl)
>>> +{
>>> +	if (tl)
>>> +		kref_put(&tl->kref, drm_sched_fence_timeline_release);
>>> +}
>>> +
>>> +static inline struct drm_sched_fence_timeline *
>>> +drm_sched_fence_timeline_get(struct drm_sched_fence_timeline *tl)
>>> +{
>>> +	if (tl)
>>> +		kref_get(&tl->kref);
>>> +
>>> +	return tl;
>>> +}
>>> +
>>>    /**
>>>     * struct drm_sched_fence - fences corresponding to the scheduling of a job.
>>>     */
>>> @@ -289,6 +335,9 @@ struct drm_sched_fence {
>>>    	 */
>>>    	ktime_t				deadline;
>>> +        /** @timeline: the timeline this fence belongs to. */
>>> +	struct drm_sched_fence_timeline	*timeline;
>>> +
>>>            /**
>>>             * @parent: the fence returned by &drm_sched_backend_ops.run_job
>>>             * when scheduling the job on hardware. We signal the
>>> @@ -488,6 +537,8 @@ struct drm_sched_backend_ops {
>>>     * @credit_count: the current credit count of this scheduler
>>>     * @timeout: the time after which a job is removed from the scheduler.
>>>     * @name: name of the ring for which this scheduler is being used.
>>> + * @fence_timeline: fence timeline that will be passed to fences created by
>>> + *                  and entity that's bound to this scheduler.
>>>     * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
>>>     *           as there's usually one run-queue per priority, but could be less.
>>>     * @sched_rq: An allocated array of run-queues of size @num_rqs;
>>> @@ -521,6 +572,7 @@ struct drm_gpu_scheduler {
>>>    	atomic_t			credit_count;
>>>    	long				timeout;
>>>    	const char			*name;
>>> +	struct drm_sched_fence_timeline	*fence_timeline;
>>>    	u32                             num_rqs;
>>>    	struct drm_sched_rq             **sched_rq;
>>>    	wait_queue_head_t		job_scheduled;

--------------AoKYAyexmKqpDch0BKCcfZl3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 30.08.24 um 23:43 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:ZtI9EMzHZW3DkHw%2F@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Aug 30, 2024 at 10:14:18AM +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 29.08.24 um 19:12 schrieb Boris Brezillon:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">dma_fence objects created by an entity might outlive the
drm_gpu_scheduler this entity was bound to if those fences are retained
by other other objects, like a dma_buf resv. This means that
drm_sched_fence::sched might be invalid when the resv is walked, which
in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.

This probably went unnoticed so far, because the drm_gpu_scheduler had
the lifetime of the drm_device, so, unless you were removing the device,
there were no reasons for the scheduler to be gone before its fences.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Nope, that is intentional design. get_timeline_name() is not safe to be
called after the fence signaled because that would causes circular
dependency problems.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm quite sure happens, ftrace for example can and will call
get_timeline_name in trace_dma_fence_destroy which is certainly after
the fence is signaled. There are likely other cases too - this just
quickly came to mind.</pre>
    </blockquote>
    <br>
    Good point, completely forgotten about ftrace.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZtI9EMzHZW3DkHw%2F@DUT025-TGLU.fm.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">E.g. when you have hardware fences it can happen that fences reference a
driver module (for the function printing the name) and the module in turn
keeps fences around.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I am almost positive without this patch this problematic in Xe or any
driver in which schedulers are tied to IOCTLs rather than kernel module.

In Xe 'fence-&gt;sched' maps to an xe_exec_queue which can be freed once
the destroy exec queue IOCTL is called and all jobs are free'd (i.e.
'fence' signals). The fence could be live on after in dma-resv objects,
drm syncobjs, etc...

I know this issue has been raised before and basically NACK'd but I have
a strong opinion this is valid and in fact required.</pre>
    </blockquote>
    <br>
    I've NACK'd automatically signaling pending fences on destruction of
    the scheduler (that reminds me that I wanted to add a warning for
    that) and copying the name into every scheduler fence.<br>
    <br>
    As long as we don't do any of that I'm perfectly fine fixing this
    issue. The approach of creating a reference counted object for the
    name looks rather valid to me.<br>
    <br>
    Especially since we then pretty much get the module references
    correct for free as well.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZtI9EMzHZW3DkHw%2F@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So you easily end up with a module you can never unload.


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">With the introduction of a new model where each entity has its own
drm_gpu_scheduler instance, this situation is likely to happen every time
a GPU context is destroyed and some of its fences remain attached to
dma_buf objects still owned by other drivers/processes.

In order to make drm_sched_fence_get_timeline_name() safe, we need to
copy the scheduler name into our own refcounted object that's only
destroyed when both the scheduler and all its fences are gone.

The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
even after it's been released is worrisome though, but I'd rather
discuss that with everyone than come up with a solution that's likely
to end up being rejected.

Note that the bug was found while repeatedly reading dma_buf's debugfs
file, which, at some point, calls dma_resv_describe() on a resv that
contains signalled fences coming from a destroyed GPU context.
AFAIK, there's nothing invalid there.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah but reading debugfs is not guaranteed to crash the kernel.

On the other hand the approach with a kref'ed string looks rather sane to
me. One comment on this below.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Cc: Luben Tuikov <a class="moz-txt-link-rfc2396E" href="mailto:ltuikov89@gmail.com">&lt;ltuikov89@gmail.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: &quot;Christian König&quot; <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>
Signed-off-by: Boris Brezillon <a class="moz-txt-link-rfc2396E" href="mailto:boris.brezillon@collabora.com">&lt;boris.brezillon@collabora.com&gt;</a>
---
  drivers/gpu/drm/scheduler/sched_fence.c |  8 +++-
  drivers/gpu/drm/scheduler/sched_main.c  | 18 ++++++++-
  include/drm/gpu_scheduler.h             | 52 +++++++++++++++++++++++++
  3 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..efa2a71d98eb 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
  static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
  {
  	struct drm_sched_fence *fence = to_drm_sched_fence(f);
-	return (const char *)fence-&gt;sched-&gt;name;
+	return (const char *)fence-&gt;timeline-&gt;name;
  }
  static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
@@ -112,8 +112,10 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
   */
  void drm_sched_fence_free(struct drm_sched_fence *fence)
  {
+	drm_sched_fence_timeline_put(fence-&gt;timeline);
+
  	/* This function should not be called if the fence has been initialized. */
-	if (!WARN_ON_ONCE(fence-&gt;sched))
+	if (!WARN_ON_ONCE(fence-&gt;timeline))
  		kmem_cache_free(sched_fence_slab, fence);
  }
@@ -224,6 +226,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
  	unsigned seq;
  	fence-&gt;sched = entity-&gt;rq-&gt;sched;
+	fence-&gt;timeline = fence-&gt;sched-&gt;fence_timeline;
+	drm_sched_fence_timeline_get(fence-&gt;timeline);
  	seq = atomic_inc_return(&amp;entity-&gt;fence_seq);
  	dma_fence_init(&amp;fence-&gt;scheduled, &amp;drm_sched_fence_ops_scheduled,
  		       &amp;fence-&gt;lock, entity-&gt;fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..1e31a9c8ce15 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1288,10 +1288,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
  		sched-&gt;own_submit_wq = true;
  	}
+	sched-&gt;fence_timeline = kzalloc(sizeof(*sched-&gt;fence_timeline), GFP_KERNEL);
+	if (!sched-&gt;fence_timeline)
+		goto Out_check_own;
+
+	sched-&gt;fence_timeline-&gt;name = kasprintf(GFP_KERNEL, &quot;%s&quot;, sched-&gt;name);
+	if (!sched-&gt;fence_timeline-&gt;name)
+		goto Out_free_fence_timeline;
+
+	kref_init(&amp;sched-&gt;fence_timeline-&gt;kref);
+
  	sched-&gt;sched_rq = kmalloc_array(num_rqs, sizeof(*sched-&gt;sched_rq),
  					GFP_KERNEL | __GFP_ZERO);
  	if (!sched-&gt;sched_rq)
-		goto Out_check_own;
+		goto Out_free_fence_timeline;
+
  	sched-&gt;num_rqs = num_rqs;
  	for (i = DRM_SCHED_PRIORITY_KERNEL; i &lt; sched-&gt;num_rqs; i++) {
  		sched-&gt;sched_rq[i] = kzalloc(sizeof(*sched-&gt;sched_rq[i]), GFP_KERNEL);
@@ -1319,6 +1330,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
  	kfree(sched-&gt;sched_rq);
  	sched-&gt;sched_rq = NULL;
+Out_free_fence_timeline:
+	if (sched-&gt;fence_timeline)
+		kfree(sched-&gt;fence_timeline-&gt;name);
+	kfree(sched-&gt;fence_timeline);
  Out_check_own:
  	if (sched-&gt;own_submit_wq)
  		destroy_workqueue(sched-&gt;submit_wq);
@@ -1367,6 +1382,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
  	sched-&gt;ready = false;
  	kfree(sched-&gt;sched_rq);
  	sched-&gt;sched_rq = NULL;
+	drm_sched_fence_timeline_put(sched-&gt;fence_timeline);
  }
  EXPORT_SYMBOL(drm_sched_fini);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..615ca89f77dc 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -261,6 +261,52 @@ struct drm_sched_rq {
  	struct rb_root_cached		rb_tree_root;
  };
+/**
+ * struct drm_sched_fence_timeline - Wrapped around the timeline name
+ *
+ * This is needed to cope with the fact dma_fence objects created by
+ * an entity might outlive the drm_gpu_scheduler this entity was bound
+ * to, making drm_sched_fence::sched invalid and leading to a UAF when
+ * dma_fence_ops::get_timeline_name() is called.
+ */
+struct drm_sched_fence_timeline {
+	/** @kref: Reference count of this timeline object. */
+	struct kref			kref;
+
+	/**
+	 * @name: Name of the timeline.
+	 *
+	 * This is currently a copy of drm_gpu_scheduler::name.
+	 */
+	const char			*name;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Make that a char name[] and embed the name into the structure. The macro
struct_size() can be used to calculate the size.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+};
+
+static inline void
+drm_sched_fence_timeline_release(struct kref *kref)
+{
+	struct drm_sched_fence_timeline *tl =
+		container_of(kref, struct drm_sched_fence_timeline, kref);
+
+	kfree(tl-&gt;name);
+	kfree(tl);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
This avoids having two allocations for the timeline name.

Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+}
+
+static inline void
+drm_sched_fence_timeline_put(struct drm_sched_fence_timeline *tl)
+{
+	if (tl)
+		kref_put(&amp;tl-&gt;kref, drm_sched_fence_timeline_release);
+}
+
+static inline struct drm_sched_fence_timeline *
+drm_sched_fence_timeline_get(struct drm_sched_fence_timeline *tl)
+{
+	if (tl)
+		kref_get(&amp;tl-&gt;kref);
+
+	return tl;
+}
+
  /**
   * struct drm_sched_fence - fences corresponding to the scheduling of a job.
   */
@@ -289,6 +335,9 @@ struct drm_sched_fence {
  	 */
  	ktime_t				deadline;
+        /** @timeline: the timeline this fence belongs to. */
+	struct drm_sched_fence_timeline	*timeline;
+
          /**
           * @parent: the fence returned by &amp;drm_sched_backend_ops.run_job
           * when scheduling the job on hardware. We signal the
@@ -488,6 +537,8 @@ struct drm_sched_backend_ops {
   * @credit_count: the current credit count of this scheduler
   * @timeout: the time after which a job is removed from the scheduler.
   * @name: name of the ring for which this scheduler is being used.
+ * @fence_timeline: fence timeline that will be passed to fences created by
+ *                  and entity that's bound to this scheduler.
   * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
   *           as there's usually one run-queue per priority, but could be less.
   * @sched_rq: An allocated array of run-queues of size @num_rqs;
@@ -521,6 +572,7 @@ struct drm_gpu_scheduler {
  	atomic_t			credit_count;
  	long				timeout;
  	const char			*name;
+	struct drm_sched_fence_timeline	*fence_timeline;
  	u32                             num_rqs;
  	struct drm_sched_rq             **sched_rq;
  	wait_queue_head_t		job_scheduled;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------AoKYAyexmKqpDch0BKCcfZl3--
