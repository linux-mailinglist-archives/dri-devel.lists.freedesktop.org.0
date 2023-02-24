Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717966A1E83
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 16:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D768210EC5B;
	Fri, 24 Feb 2023 15:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1D810EC59;
 Fri, 24 Feb 2023 15:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5A2QaH8MfGKuLniApuxIi/nm0wfJU0ArP8T7UcUFjukwK5IgHdJ7goTYXvJtG7tXNc5HwKNKcVarIpoc1tdDtAZ5OogGdGErZilzT6zqvOYRSfgc5WoxIWNH2AtK6E4Tsu5ANQcFIud53pZbr/qzr6RAnk5MfKRx27QbtpGc76+i678Vi+VQa5csUfvVe4jWJnIw2tvce8mFmjwSo7pwvqN1LWs8Tf0IbGpRHi6fhYOTg0tcU85TI6WalXIO32wj0Ne+OHdngD2gZgk9GEyKlfTClfgT82tDoTYITOIhaMhG2N2RXB0JCQxtcA7QIXbfF+wVZHJ6IXa5zVr3xnAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtMrzFSv4TSxFdiHTBiz41BYecQhL7PVRiS5AGt+uho=;
 b=MKRSJBBK7b7jP8MFBdDay+BpkCFOi7e5f4w5j+Koq03Y+UkZ3aXatrY/vGthAKevN5D5ie7VTNTzipFZrOQeacEV5nIfJlvI4YhLpEU6ucs/4i3gk5J1Y69BpQrFjTnRvKHq1OkwwV4elGwYLqPNC4YKwyLm7hYhAAWfuPmLswXqHeCcy3W49SqEmU/sXUj2oln4Myl1D2Mt8N6OZu8nAt1iKPys8HjN/FvwLsLpvOc8N9msQYllTsG68j3V1C6j+FLqvcBvp+hrPr09VVPsKV6eulWt1pdeHoovtylyFfr1JQFwnySzlzQjrV5dSKf89aRA3vCWozRLvgOzVJzsTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtMrzFSv4TSxFdiHTBiz41BYecQhL7PVRiS5AGt+uho=;
 b=4dFuoOhbRpDr1ISHMl0tDXAA2taEpMmwf26m8cOBDj0QZXkMYDIF0tc5QrpkttzsVqQMwLS0OLVpgVlLXgSmsKt7wlU5nLeF634dQZ/PFWw/WZTefBK0fRRQjULgup9yTbRboaNmunhIBqCSpInTQ+W1F3TRqJJj84h/UBuLcMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA0PR12MB7001.namprd12.prod.outlook.com (2603:10b6:806:2c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 24 Feb
 2023 15:27:01 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 15:27:00 +0000
Message-ID: <74e409dc-b642-779e-a755-b793c378e43a@amd.com>
Date: Fri, 24 Feb 2023 10:26:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-CA
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
 <CAF6AEGs1_75gg+LCBj6=PH8Jn60PXiE+Kx_2636nP-+pajN8Hg@mail.gmail.com>
 <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
 <20230224130053.3f8939e2@eldfell>
 <c5d046d6-ab8e-2bc7-5110-dba78b91348b@linux.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
In-Reply-To: <c5d046d6-ab8e-2bc7-5110-dba78b91348b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA0PR12MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cff8928-2e0c-4c75-309d-08db167b92f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C8JoZ888Oxgh6Aez15P2/dcQAR2dEBJCdYPx5/IPgQWgBhqpnotZgFZaoBJqUrphgE2o1VATaPPQpxAK66RFGk2S+a2A5xHOnuh74bqmkHEAmdCJQoIdENWm058YKjtXeEJleRuc8/u5kkEw1ao9kcb0upTyp1tFHa0whPJzYA8D8yAhdZkHT0kAbkTrby3+JrZ6jLhLLzuTsx1FFNVnszSMB1gNtSE17+EgPxZBlTvtcPzwPaQYe7WtinOdklWZc8+M+M23TS5Ovd1rUKXME9A8zb8KGXzC4KizdFN/8I3MLYVB1H5irZsHrjmM2Qxvzx1iJJdxEm4tj9sBPvZ2F0QNrmz514mS/rsgiwu/mPstLkoP8M7R+9WThhiNJybaglGFZfB9T35XJplXJ2XEBWTl1qTfBBbCHlKk1A3QKJ0oat3QeDhhi4ylfscWBC8kePQ4KqKwkpJ/dX2v19U3av1kg+JwOlvTYxnHc8TVC82geM98f9YIQtXDPLg7vVfyrQlqeforf+yxXKnd0KtqkfAToc9KfQYQb+jyIh82QCdrSntNKDUykngvUmOAaBreWrROcSUx7gBB9TDzlBZr/2YNbgNI+KY5bjZuIrpzYQSz9aNsCRfEaLU65GNCIWmXumdaowsmNEDmbR1X01LKVpZATMKD4m/VUc47lOTjBypCg3nGRmNXXceNp4L3fnnPELOPPO7oNJnkrQMeMo3RGYCGScqfJ4Mi59dfiGdzfoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(83380400001)(55236004)(5660300002)(7416002)(41300700001)(36756003)(478600001)(31696002)(4326008)(6512007)(316002)(66556008)(54906003)(38100700002)(86362001)(8676002)(8936002)(6506007)(6486002)(186003)(53546011)(2616005)(66476007)(26005)(6666004)(110136005)(66946007)(31686004)(2906002)(44832011)(66899018)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzQ4bjd6T1VBQjB5eFdSVVFmMmI5NmE5aWlhYTJKV2lVZS91ZWwxZzlxRXE2?=
 =?utf-8?B?dUVnakMvN3pLYkRsYytCcHRDd2ZocmtwOWdQdUpMRzZ4V0hoc1RrOWlaUzFF?=
 =?utf-8?B?K0YrNCtiQXJPcG1qM2w3cU1ZRGl3bkZOMFh3OUh6cGRZOUlLdzhXeUNmdDBn?=
 =?utf-8?B?SlJ0MnRCNHd3b1U3b0Vjclp1WmNUMW1iWTd3M28zdlhTcTB0c3Z6Q203cHo1?=
 =?utf-8?B?bFZEaHh6SlNkRHhXUFBoWXdSNTlKbGNrMHlvS2hGb1NZUGI3OEptUnZ0RUFv?=
 =?utf-8?B?M1JYQnMyWTBoOW9aakkxc3JBVVQ0UzBKU2pHbDBRdlkrMU9NZW5mZFdNbGdV?=
 =?utf-8?B?WEdQMDFGZ0lKOWs0a0ZSWjE0RUJjaWtNWitHSG5PUGVaQkd5NmgrMnY3RWQ4?=
 =?utf-8?B?ZlVpT1E5bFlSNWNNUGt4aGhqM1UwTWlNelpnQzZZOGszeVlCWHZEK25RODV3?=
 =?utf-8?B?Zi90SFpISUp3NlFucmZLQmk1YkRucDFWSlFrYlFYaW9lWE14Z3dxZzFPNWJV?=
 =?utf-8?B?bUFab0hoS0w0TnpuMmZBTUNwdHdzWk9mYzRNY1k5YVU4TTBkQm9ic2xRaWZ5?=
 =?utf-8?B?UEZDZllWR3V1SERZU0dqNlpxZEkrUGdKUlo4SVA2NldEaVNiM1RWaHM1ZGYx?=
 =?utf-8?B?NVd4aDBxd0pmWHJjL1E2b0ltUWQwMDFWb3Q4T21KZ1RhMFpza2srZnZuRmZj?=
 =?utf-8?B?QXoxWUdpaWVIRGVvMWs0eHJDOHkwZXRDUStHVXozYlI3NkZNc1c3cFA3VzZ3?=
 =?utf-8?B?SWVZRi94bkxqcTVRRU5XQ2pZY2I3M1lCN2NqTlN0Vi82S1FGaEFvK0tMQUxX?=
 =?utf-8?B?OWhsbHlOMkRrQlE1bFMwSzRHUnNOd2I5YUp2L0xEcnU0T3E2b2E2ZHpIeWd6?=
 =?utf-8?B?YjhEdHJ3YlBPZFFJQ1UwejNEUjFydWpyYWZ1azBSNG1FejlaSjltcXBkTGhl?=
 =?utf-8?B?cE5VOFU0am0ra1R0a1ZwRWF5dlZnd2RGQm9tajQ4R2JRT3BMeHdiaUlyTkpF?=
 =?utf-8?B?cVlITmg3Zk9TWmxCOEdCdWx6N0Vhazl4S3dib3kzd29ITnRISnZsOVBJUUVl?=
 =?utf-8?B?SXpUUFpZQ3BlNWsyNlg2VXdkKzhlS3pMS3IzajByRUF3c2ZEYzU1ekVTc2FZ?=
 =?utf-8?B?Qy9tcm1wb01uQnBrdVhuN3pyaEl1S3N2aW1Nc1F6VWF5aUIzL1phazcxNnE2?=
 =?utf-8?B?c0dObFBIeEdOS1dFYkFrNWJxUVdCdzljSnliK1VlL3ZSYkVSV3NSTnJxSFV3?=
 =?utf-8?B?eVVGQXU5SWphVTkyQTdsVGxoWWovUW9ubTNoV2poeDZpcTBjb2ZJYUQ0NmRs?=
 =?utf-8?B?VCszdkVicnpTR3h2dlRrRmF5SzlCRTY1T1YvZER3MTR5MnJEcGZYUVk0dnUx?=
 =?utf-8?B?WXdqcXdDc0V2WFlVN3RkaXd2ZFdaQ1RLVEtnWml5QTRLWmszZ25MaUlOd0FB?=
 =?utf-8?B?S2UxTmQ0RWFyTUhLZVFXUDJMOW5UYk84RThOTm9lNEx1RmlobXMzeE1GMkNj?=
 =?utf-8?B?NEoyT2tkcEcyRjZadUNsd25Ha3g3dUxneEYvL2g0K2puU0xPNzFqNm9TS1h4?=
 =?utf-8?B?WGVBa2dUTnVnWlk1TFk2V2FpQmt0bVFMajFENkdLdE1lR2NZMy92MnkzUk1j?=
 =?utf-8?B?cFBCT3UyZ3F0MWU1a3JwMXJIMit6dDgzaGJCM3JIMW56Yldlam1vRFcxcWcv?=
 =?utf-8?B?R3RLbFJxTkdOVDJyNTNMQVkyemR5QnBtc3V5TlVjK2xSQmV6L2Q3UTNzRVBQ?=
 =?utf-8?B?TC96NkxjNHBwMHg4WHFGOFNJOHJxQ0F0Syt3YWI1T0JmSXJTSmtUaEpsaU1D?=
 =?utf-8?B?R1BOZzV5ZzlyOE1KMTNYWk8vUVZwVWZRUWE3TXE3Y1lIbmtiRG1DY3IxQ3RO?=
 =?utf-8?B?d2JGTEdrSyt4a1VLWGlFWnd2SVZtTVhuTG0vSTdiOHVqODcwT3pWRmliZnlW?=
 =?utf-8?B?dmpjVFFhbWZiN1VwTjh6eXJhaE53M3dyRlF6aEt2ZG1EQ09EQ0FXL1c4NVVQ?=
 =?utf-8?B?QnhYb2l2UEhDZS9BUTF1NU9ZZU5uKzVXYU5nOEViRTJzaCtkVDVuak5JYUw2?=
 =?utf-8?B?b0F6MHVmUjhhY0FjRk5yd1VYUE54aGk1Zmg0dTJQcS9reVU5alZNZVBtVTNL?=
 =?utf-8?Q?b/nCpw50nmAH8qAu+uY9OkiFv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cff8928-2e0c-4c75-309d-08db167b92f5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:27:00.7575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/gn2P8lgkVW/lQBW9WX/IpdFDzc9+ewXxEM2PlwGWl8a/yI2xJkfwuMN/vtukQc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7001
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-24 06:37, Tvrtko Ursulin wrote:
> 
> On 24/02/2023 11:00, Pekka Paalanen wrote:
>> On Fri, 24 Feb 2023 10:50:51 +0000
>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>> On 24/02/2023 10:24, Pekka Paalanen wrote:
>>>> On Fri, 24 Feb 2023 09:41:46 +0000
>>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>>    
>>>>> On 24/02/2023 09:26, Pekka Paalanen wrote:
>>>>>> On Thu, 23 Feb 2023 10:51:48 -0800
>>>>>> Rob Clark <robdclark@gmail.com> wrote:
>>>>>>       
>>>>>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Wed, 22 Feb 2023 07:37:26 -0800
>>>>>>>> Rob Clark <robdclark@gmail.com> wrote:
>>>>>>>>         
>>>>>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>>>
>>>>>> ...
>>>>>>       
>>>>>>>>>> On another matter, if the application uses SET_DEADLINE with one
>>>>>>>>>> timestamp, and the compositor uses SET_DEADLINE on the same thing with
>>>>>>>>>> another timestamp, what should happen?
>>>>>>>>>
>>>>>>>>> The expectation is that many deadline hints can be set on a fence.
>>>>>>>>> The fence signaller should track the soonest deadline.
>>>>>>>>
>>>>>>>> You need to document that as UAPI, since it is observable to userspace.
>>>>>>>> It would be bad if drivers or subsystems would differ in behaviour.
>>>>>>>>         
>>>>>>>
>>>>>>> It is in the end a hint.  It is about giving the driver more
>>>>>>> information so that it can make better choices.  But the driver is
>>>>>>> even free to ignore it.  So maybe "expectation" is too strong of a
>>>>>>> word.  Rather, any other behavior doesn't really make sense.  But it
>>>>>>> could end up being dictated by how the hw and/or fw works.
>>>>>>
>>>>>> It will stop being a hint once it has been implemented and used in the
>>>>>> wild long enough. The kernel userspace regression rules make sure of
>>>>>> that.
>>>>>
>>>>> Yeah, tricky and maybe a gray area in this case. I think we eluded
>>>>> elsewhere in the thread that renaming the thing might be an option.
>>>>>
>>>>> So maybe instead of deadline, which is a very strong word, use something
>>>>> along the lines of "present time hint", or "signalled time hint"? Maybe
>>>>> reads clumsy. Just throwing some ideas for a start.
>>>>
>>>> You can try, but I fear that if it ever changes behaviour and
>>>> someone notices that, it's labelled as a kernel regression. I don't
>>>> think documentation has ever been the authoritative definition of UABI
>>>> in Linux, it just guides drivers and userspace towards a common
>>>> understanding and common usage patterns.
>>>>
>>>> So even if the UABI contract is not documented (ugh), you need to be
>>>> prepared to set the UABI contract through kernel implementation.
>>>
>>> To be the devil's advocate it probably wouldn't be an ABI regression but
>>> just an regression. Same way as what nice(2) priorities mean hasn't
>>> always been the same over the years, I don't think there is a strict
>>> contract.
>>>
>>> Having said that, it may be different with latency sensitive stuff such
>>> as UIs though since it is very observable and can be very painful to users.
>>>
>>>> If you do not document the UABI contract, then different drivers are
>>>> likely to implement it differently, leading to differing behaviour.
>>>> Also userspace will invent wild ways to abuse the UABI if there is no
>>>> documentation guiding it on proper use. If userspace or end users
>>>> observe different behaviour, that's bad even if it's not a regression.
>>>>
>>>> I don't like the situation either, but it is what it is. UABI stability
>>>> trumps everything regardless of whether it was documented or not.
>>>>
>>>> I bet userspace is going to use this as a "make it faster, make it
>>>> hotter" button. I would not be surprised if someone wrote a LD_PRELOAD
>>>> library that stamps any and all fences with an expired deadline to
>>>> just squeeze out a little more through some weird side-effect.
>>>>
>>>> Well, that's hopefully overboard in scaring, but in the end, I would
>>>> like to see UABI documented so I can have a feeling of what it is for
>>>> and how it was intended to be used. That's all.
>>>
>>> We share the same concern. If you read elsewhere in these threads you
>>> will notice I have been calling this an "arms race". If the ability to
>>> make yourself go faster does not required additional privilege I also
>>> worry everyone will do it at which point it becomes pointless. So yes, I
>>> do share this concern about exposing any of this as an unprivileged uapi.
>>>
>>> Is it possible to limit access to only compositors in some sane way?
>>> Sounds tricky when dma-fence should be disconnected from DRM..
>>
>> Maybe it's not that bad in this particular case, because we are talking
>> only about boosting GPU clocks which benefits everyone (except
>> battery life) and it does not penalize other programs like e.g.
>> job priorities do.
> 
> Apart from efficiency that you mentioned, which does not always favor 
> higher clocks, sometimes thermal budget is also shared between CPU and 
> GPU. So more GPU clocks can mean fewer CPU clocks. It's really hard to 
> make optimal choices without the full coordination between both schedulers.
> 
> But that is even not the main point, which is that if everyone sets the 
> immediate deadline then having the deadline API is a bit pointless. For 
> instance there is a reason negative nice needs CAP_SYS_ADMIN.
> 
> However Rob has also pointed out the existence of uclamp.min via 
> sched_setattr which is unprivileged and can influence frequency 
> selection in the CPU world, so I conceded on that point. If CPU world 
> has accepted it so can we I guess.
> 
> So IMO we are back to whether we can agree defining it is a hint is good 
> enough, be in via the name of the ioctl/flag itself or via documentation.
> 
>> Drivers are not going to use the deadline for scheduling priorities,
>> right? I don't recall seeing any mention of that.
>>
>> ...right?
> 
> I wouldn't have thought it would be beneficial to preclude that, or 
> assume what drivers would do with the info to begin with.
> 
> For instance in i915 we almost had a deadline based scheduler which was 
> much fairer than the current priority sorted fifo and in an ideal world 
> we would either revive or re-implement that idea. In which case 
> considering the fence deadline would naturally slot in and give true 
> integration with compositor deadlines (not just boost clocks and pray it 
> helps).
How is user-space to decide whether to use ioctl(SET_DEADLINE) or
poll(POLLPRI)?
-- 
Regards,
Luben

