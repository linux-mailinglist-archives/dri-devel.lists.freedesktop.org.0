Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567C555235
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0210EF78;
	Wed, 22 Jun 2022 17:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8302810EF78;
 Wed, 22 Jun 2022 17:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXpTpPbAqEIM6jKR/qn84jBS6Gf1d0RXcrO/eF5Es0ybPvkLo1h+h5pSkdX52ACiHyEUniaUR/C1jQi8o+dVROhsiJAOe5jl61pAIwkCtpdZj2HTwtidsAoDTFarLzjq1cZTr9rWqUQ8ZBeLAo8lpAjDDvyIUHC3ot4SMsrA7AHpdSj/xOb9/mEboWKt1O/fWP/rXYK18XOCQc4bKW9VnvDw6GUdeMmzzUXqZuO1BTb4Yxt5Mbc1JR7n0kgC7KeU4y/4l47xy3JW8pgus/igK+2EE90rnp6aTozpLpsmyq7IJfHaHGU0I4yVv4+L8W17z6D+MuOlJcG1xnFKYd4ZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dza1KCAELTH2bLYdViCviShaOXVSjJn86bfjZ8ToQGo=;
 b=JmTRbZWCCTMuntPTgJ3RurJvKvbT/pi/rArbEfpRck/nR4afunKvvsM5ZpaqqbA/UNmM4QoJQsBr2utIoSNeFS70+5TLZsFkCrViApCKXGBV4/P3h6szJuYiR2qXCCjkH94qC1NWGiUGzKCxcuhgmgjs/RoCLCEAuiqJduEofKRcjt9orjKlzErMuoEjBTOaT9mF0ol9qZMVIwCwhJrMimcdi7QtVnmXlA+nuwvS031LYoix9qcYYp7NFnWN1FA+yKw3qui3Qsm4kh00xvTTkT8jTO9XtbpFd7J+xMNaBBgWGRmaoO12nO89S1j/c0q1xOP0dOkQDRsjeJSdykeg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dza1KCAELTH2bLYdViCviShaOXVSjJn86bfjZ8ToQGo=;
 b=opE3LiuKqnXlOa0mpvFYnXXtjzaBBgOGCfI9/nRhDCsRUNfTDnAxLLJtO/Je89s34xN1SIeGzyF+DkIGJezsSh6we7ICJmvpv+uVegZo/xr/jBulutv+pHZDwCkq15532hyaNN4mge9aoVER2Z1CFATpp/THSDT3x7vEPJPvroA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR1201MB0185.namprd12.prod.outlook.com (2603:10b6:4:55::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 17:19:20 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 17:19:20 +0000
Message-ID: <76e95c1d-83a0-2cd4-518b-7b769e963d13@amd.com>
Date: Wed, 22 Jun 2022 13:19:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] drm/amdgpu: Follow up change to previous drm
 scheduler change.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-6-andrey.grodzovsky@amd.com>
 <87fa2e6e-b519-11ef-65f4-7ab5ca091973@gmail.com>
 <2f22b90f-74ca-f70d-68ed-4dbf49360e2b@amd.com>
 <b011246b-fe55-0385-a64b-585c0baa2863@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <b011246b-fe55-0385-a64b-585c0baa2863@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::7) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 392d1b3d-ab4c-4ffe-e4ed-08da547357c0
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0185:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB01857044013447D65292C96BEAB29@DM5PR1201MB0185.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBG0E8jSB4M8meh+9puftuz2f2cFJvgUXXAqyhd9kcKKE+6meOCE3+lJgmFJjYgZQKXHtgbz2DwUXd7LLlLIqdA3Vx5IwuKNliPv1IkdEf8NBwtuOHKZvJVOI5+0JvrgeI2x22MrvdQi6mCbFO15KDCBU+lFP4E6y6eMM4UscnWFHrmTKczXiP6TiE24nL9M9xNvYcxbS6FEyNYic80frjcefg3n5G6+HmuwidHmo0lp0F45BQyOtWlFE8iKqH+dJ28elJxlivkxOyXTuff6jvT/TLyahbWPMKutGVAZQ90a6nG7khx8a4/537AOC+suKNMyDOmiCLYbYEgGdkGVtLnDKcJA4wb6wl2dmYaOj78RDhQpyOMdIeyG36+dIX5fmM2KejAMPkrb6esoNekbIpW8/4hJY+9Y1ULM1IcXqYSjNGG0qzx1B28rQ+QPaEQ+7BQWzVv1PyQ5OWo4tmiNWQ+8dO2B+QSuT/pURIMr6vMD627wDRp8DVzZSqARvWHCRLac7LYW5aKkoKrIAWQzqvQZCDOQF7T5c9/MFkDVg3UpA40+PNsBx2NIIAHhshtwuv+QHbuyVDfNWC46JLo/UDpcAl+EOAei2DtN8x2kDgq11uhEn+ia29s3R4dz1N7Nyr9pY6xBoOnzjZAKpo0KsyMn6nxlV46QgD1O29VaLOictEJq6y4leroC8PD0gMcDOYxDjBBGvsbVi/xWDoFKtIuw3Wdl8ytEN8GmpZKKYRKOpuDsOi1q5Z+IbZMdvwZntXY7PD0XFBf0PrhM3hR6ADgfGRz/uFUgeOW46Hdafsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(31696002)(38100700002)(5660300002)(36756003)(2906002)(86362001)(44832011)(478600001)(6486002)(316002)(8936002)(66556008)(66476007)(53546011)(6666004)(8676002)(66574015)(4326008)(110136005)(6506007)(83380400001)(2616005)(186003)(31686004)(6512007)(66946007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtudGxvSkNkdHZPR0pVZXBTWnIvWHgxRTNZdnpSYk9yc3FkVUZMOFd2WmpK?=
 =?utf-8?B?V2FWZGR0UkU2b0VtU2xkTVZCSGNSZHdTcUx2d1hTZFAvRHRQN1BmczFUQ2ph?=
 =?utf-8?B?Y3NXM1ZURG8xV1VsQTVmeTlCTlZVWjhpMEUyLzhLUGtQZ3VrcG82dms4cGo2?=
 =?utf-8?B?Q1A2eG4wVndWUkNoZXJoeGc3UTI1bUd6eGxnVmxhNStPNVM4VGlKSUhlZnpY?=
 =?utf-8?B?VUdqeElPaWcyM0RLRDlHQ2NHRXlJYzFrbFIxRHg3VmM4ckZFbWc4Mm5lVThy?=
 =?utf-8?B?YzFYN1FsY2hQbEdRMzdJVnJGQWpGekZSYmtBS0huN2I0MDBEYWNBNm1iOUV3?=
 =?utf-8?B?cW5DZjdWdnRlRDYxS3ZkUDdlUjBiaXc3dVVEVmd5Y0dWakMwSlg5YTRQaVU0?=
 =?utf-8?B?Vy9sQW4xbVJuMVo1dzJ5VmdCemtiV0tlNThzaXZOU2ZxQ0dmWkZRR1I0QnF2?=
 =?utf-8?B?cTBqeE80eTg4T295ZHhud284NnBDNklrR0IvRmFWZWsydFJHcGxaZitCMWVa?=
 =?utf-8?B?SXFkS2dXZlBZb1FBMHZ0YzhnUURRVXdYU2VCT0FWeHFCWjJ4Y3RCSHBUSDdH?=
 =?utf-8?B?NHFjZWdhRUZsbXZaYnp3YjJSeHMxOGtERTFpaUhuTTlhSGdjbVhEeloyWndT?=
 =?utf-8?B?VDBUWWlwT1NNQXVIai9vblZxVHpvQUJIR3JCbVkzY0luMkpIVCt6V0VSQ3J3?=
 =?utf-8?B?TWxOTHdNOHJpWjJBK2pldTRjY3dBeVVMVldqT0o1VHNYVFFGSTVrcUtOTGhh?=
 =?utf-8?B?WGFJSjNXS3RnY1lYaUxnc0FBVythakt4dit2NzVrd3owZ3Qwb1FsQ00xUi93?=
 =?utf-8?B?YTBTV2hlVG4wRkpoWnF5c0pHdWUyWG5DTDByVWxMMzYrTEtlT04wVncyMys5?=
 =?utf-8?B?Z0FGTjRKUjZFZ1ZYaFBNSUdJVlU2WkZrQWIxUi9remZHVmxicEFIcUtIbGhP?=
 =?utf-8?B?WU9Tem1xRmhSOXZvK04yQ2txTUZMTUZ2ZGVOODZvZ291bituUWNDMVFmVE5S?=
 =?utf-8?B?OTJ6UHVTVGdBUEpGTTlReGxoaDRqSzhjVUlFNldEYlAyalhpWDdrRzRzSkxa?=
 =?utf-8?B?bWtHengzc3NONU9WTUhZNFJPczZ4V25xQ3NnSzJ2dFprMDhnemFsK1hBSFps?=
 =?utf-8?B?blpLbXk1WEJ2bEVDNVBXSWdZSjJSc2NDTUVaRWF5K3FmNUxOSzBCS3RvOXpo?=
 =?utf-8?B?U2RhU1o1L1h5cUczRW9VaEw0SU0xN3ZXMVdUNUYyVnlvNFFvSWVQR29hZ2xO?=
 =?utf-8?B?a0JqVG8xYkQrd0NVbWo2QjAxTmpsc0JiUmJuTUFlME9kbnk1d3ZiQWhtYjFP?=
 =?utf-8?B?cDFMY2JVUjd3OWRwRzRJanVnd0dRVVBtWjA0c2gxNDFhU0RBL2tYeEwzeEdW?=
 =?utf-8?B?RHdWTGJmNTRVMzRSU0QyZXFoSVlrSndBZzJWQjZ2M2d4UWIweHBPNnAzb0lS?=
 =?utf-8?B?Z2xkWUhSY2lRMFdidHBUVUFXeDAzM3YrY1RvbHJCR2h4TThIUE1zWDR6UEpX?=
 =?utf-8?B?d3ZZOFErL092bkRSYVVnQm43SkdLNFVoQ0FEVmxvYW9lS1E2ZkUzZDRmUWZS?=
 =?utf-8?B?blFwaVVBMDRnRTd2ZWViY1VUYmtyb0tRZjFid29XdDlTeG9FaTA0bEZjNXB6?=
 =?utf-8?B?SnVic01TcE5MbnVla3BXVE41NFZyWFI5N25PMHgyRDlTMlVpL3c2YVZrNmFY?=
 =?utf-8?B?ckhmbmFlWjhYY1BBMnp3UVg3UzJIRldaREUzVFpkN2VKVW9LZlJ0SXIvS2pR?=
 =?utf-8?B?OElvTTRpVDVEM0dvZXlxYzRheWpIa2hMVGNkbjBqWlJqN3kyWHVVd1UxL0Y0?=
 =?utf-8?B?Q1h3aFJmK0VZYUxvRHlaR2F3dFpjNEJsR2h4ZCtsVXYxczUvZStiNHZLMXZt?=
 =?utf-8?B?bEhDUitGejJFRVVVNmF1Qk1xcUp4V3VjaiszSDdoanV3L2VqWHBtelZXYmhr?=
 =?utf-8?B?WWpvbjU2Q0JXV21RcGM4SHdRbnVIUGg1VWdOOGM1S0dYWVdQOS9KTHBnTDlm?=
 =?utf-8?B?OWN4T0ZzTytpY1JnWEdOalNuNHpBUW1EcjFtMVZWNmlsanpleVBEZ0J4Mm5O?=
 =?utf-8?B?ZjZDT2ZBOTdjcmV6OW84QkNwM3NKb2hOWW1HU2g4ZG5QUGZSVTY4ejRCd3JL?=
 =?utf-8?B?d01ZNFpTd2hlaEsrMGZZajFsYlArV0RGL0sxRE5JNlRxTWZzcVpEd2Vmd0hH?=
 =?utf-8?B?WHN0TXQ4VnpWTXVDbCtTTE9laW5pek5BQk93M2hRRTJGZk5ENTUzVjlDQ3RN?=
 =?utf-8?B?anRtTHRxWVpaQi8waW5nN3dPeFovQW9PUG5WUFhraTdjWDFUblpSK0NKVSsy?=
 =?utf-8?B?YWtibWd5aE5WSmtDMFRNcDRtZEVreW9ReHhaUVhWc0NCTmdud2FZb1pFYVhx?=
 =?utf-8?Q?zJrT+la0qfCLDuQJ8Ju8224dZyN4CO3W6JjQrXGY5zvN/?=
X-MS-Exchange-AntiSpam-MessageData-1: iIi4TEAgoAmeAQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392d1b3d-ab4c-4ffe-e4ed-08da547357c0
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 17:19:19.8140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXmJ5pym2pAxDM/zp52WmM+qneeXR6b0etDcl/k/Qa0i+/e81VLTx9HmERzInKnIzuc7QjvZLbdJGZ4F3hP4Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0185
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
Cc: jingwen.chen2@amd.com, monk.liu@amd.com, yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-06-22 03:17, Christian König wrote:
> Am 21.06.22 um 22:00 schrieb Andrey Grodzovsky:
>>
>> On 2022-06-21 03:28, Christian König wrote:
>>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>>> Align refcount behaviour for amdgpu_job embedded HW fence with
>>>> classic pointer style HW fences by increasing refcount each
>>>> time emit is called so amdgpu code doesn't need to make workarounds
>>>> using amdgpu_job.job_run_counter to keep the HW fence refcount 
>>>> balanced.
>>>
>>> Could we now also remove job_run_counter?
>>>
>>> Christian.
>>
>>
>> I am afraid not, job counter is needed since at all times the 
>> refcount on the
>> embedded fence cannot drop to zero because this will free the job 
>> itself before
>> the end of it's life cycle. We have to be able to differentiate in 
>> amdgpu_fence_emit
>> between first ever call where we init the embedded fence's refcount 
>> from scratch using kref_init
>> to repeating calls when refcount already > 0 and we just fake 
>> increase the refcount to align
>> behavior with pointer style fences in other drivers.
>
> Well what we should probably rather do is move the init out of emit 
> instead.
>
> The only down side I can see is that the sequence number isn't know on 
> initial init and so needs to be zero or something like that.
>
> Regards,
> Christian.


Not sure how this help, the problem is not there but in amdgpu_job_run, 
for embedded fence and resubmit job in pending list amdgpu_job_run
will be called twice or even 3 times with recheck guilty job sequence. I 
am supposed to do dma_fence_init to embeded HW fence only on first call 
while on second and
third only update sequence_num and increase refcount. How can i 
differentiate between first and non first calls without job_run_counter ?

Andrey


>
>>
>> I guess we could assume that embedded fence is all zeroes before 
>> first dma_fence_init  if assuming the job itself
>> was allocated using kzalloc and so u can look at dma_fence_ops == 
>> NULL or maybe seqno == 0
>> as a hint if that the fist call or not but it's a risky assumption in 
>> my opinion.
>>
>> Andrey
>>
>>
>>>
>>>>
>>>> Also since in the previous patch we resumed setting s_fence->parent 
>>>> to NULL
>>>> in drm_sched_stop switch to directly checking if job->hw_fence is
>>>> signaled to short circuit reset if already signed.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 
>>>> ++++++++++++++++------
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
>>>>   4 files changed, 25 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>> index 513c57f839d8..447bd92c4856 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>> @@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct 
>>>> amdgpu_device *adev,
>>>>           goto err_ib_sched;
>>>>       }
>>>>   +    /* Drop the initial kref_init count (see drm_sched_main as 
>>>> example) */
>>>> +    dma_fence_put(f);
>>>>       ret = dma_fence_wait(f, false);
>>>>     err_ib_sched:
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index c99541685804..f9718119834f 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -5009,16 +5009,28 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>>             /* clear job's guilty and depend the folowing step to 
>>>> decide the real one */
>>>>           drm_sched_reset_karma(s_job);
>>>> -        /* for the real bad job, it will be resubmitted twice, 
>>>> adding a dma_fence_get
>>>> -         * to make sure fence is balanced */
>>>> -        dma_fence_get(s_job->s_fence->parent);
>>>>           drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>>>>   +        if (!s_job->s_fence->parent) {
>>>> +            DRM_WARN("Failed to get a HW fence for job!");
>>>> +            continue;
>>>> +        }
>>>> +
>>>>           ret = dma_fence_wait_timeout(s_job->s_fence->parent, 
>>>> false, ring->sched.timeout);
>>>>           if (ret == 0) { /* timeout */
>>>>               DRM_ERROR("Found the real bad job! ring:%s, 
>>>> job_id:%llx\n",
>>>>                           ring->sched.name, s_job->id);
>>>>   +
>>>> +            /* Clear this failed job from fence array */
>>>> +            amdgpu_fence_driver_clear_job_fences(ring);
>>>> +
>>>> +            /* Since the job won't signal and we go for
>>>> +             * another resubmit drop this parent pointer
>>>> +             */
>>>> +            dma_fence_put(s_job->s_fence->parent);
>>>> +            s_job->s_fence->parent = NULL;
>>>> +
>>>>               /* set guilty */
>>>>               drm_sched_increase_karma(s_job);
>>>>   retry:
>>>> @@ -5047,7 +5059,6 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>>             /* got the hw fence, signal finished fence */
>>>>           atomic_dec(ring->sched.score);
>>>> -        dma_fence_put(s_job->s_fence->parent);
>>>> dma_fence_get(&s_job->s_fence->finished);
>>>> dma_fence_signal(&s_job->s_fence->finished);
>>>> dma_fence_put(&s_job->s_fence->finished);
>>>> @@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct 
>>>> amdgpu_device *adev,
>>>>        *
>>>>        * job->base holds a reference to parent fence
>>>>        */
>>>> -    if (job && job->base.s_fence->parent &&
>>>> - dma_fence_is_signaled(job->base.s_fence->parent)) {
>>>> +    if (job && (job->hw_fence.ops != NULL) &&
>>>> +        dma_fence_is_signaled(&job->hw_fence)) {
>>>>           job_signaled = true;
>>>>           dev_info(adev->dev, "Guilty job already signaled, 
>>>> skipping HW reset");
>>>>           goto skip_hw_reset;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index d6d54ba4c185..9bd4e18212fc 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring 
>>>> *ring, struct dma_fence **f, struct amd
>>>>       if (job && job->job_run_counter) {
>>>>           /* reinit seq for resubmitted jobs */
>>>>           fence->seqno = seq;
>>>> +        /* TO be inline with external fence creation and other 
>>>> drivers */
>>>> +        dma_fence_get(fence);
>>>>       } else {
>>>> -        if (job)
>>>> +        if (job) {
>>>>               dma_fence_init(fence, &amdgpu_job_fence_ops,
>>>>                          &ring->fence_drv.lock,
>>>>                          adev->fence_context + ring->idx, seq);
>>>> +            /* Against remove in amdgpu_job_{free, free_cb} */
>>>> +            dma_fence_get(fence);
>>>> +        }
>>>>           else
>>>>               dma_fence_init(fence, &amdgpu_fence_ops,
>>>>                          &ring->fence_drv.lock,
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> index 58568fdde2d0..638e1d600258 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> @@ -267,10 +267,6 @@ static struct dma_fence *amdgpu_job_run(struct 
>>>> drm_sched_job *sched_job)
>>>>               DRM_ERROR("Error scheduling IBs (%d)\n", r);
>>>>       }
>>>>   -    if (!job->job_run_counter)
>>>> -        dma_fence_get(fence);
>>>> -    else if (finished->error < 0)
>>>> -        dma_fence_put(&job->hw_fence);
>>>>       job->job_run_counter++;
>>>>       amdgpu_job_free_resources(job);
>>>
>
