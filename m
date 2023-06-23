Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3B73BE8A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 20:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AF010E075;
	Fri, 23 Jun 2023 18:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC3B10E075
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 18:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmKXF+418IkQhXx4hpdC9gV9YLVjexEgvTxgX9e+nGSQWKtVAthQiCoyGxU1gEkIpXbYdmb7Q1D8Sa5/8MWAMv1pGhyX4D0oNBerKx0QRSFTrZSzXiESLbBcRqU1rwRxmnySn3VeYdJL36FJkQ9pmuORGfKcZ4qQrz4j5KTesVXYqxIoNpsh+6OHBmEvzxNgXUmGLferDVMb6q/Q2kyEB0LXDQFK7RLKNN3zcnUDAw3fBPV7hO/8ghUktapX0n6S/19II++JhaorZAwqd5hiwIbLhLa5S//qUVreMcpJUFwwvcFm+BbDiCzb/ioW1TjTw1sze7X1RdOQ0BV3bKKpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gb0AEe+yGrbA+I5m+DAK2E5VqK6/++poyrMLaNz+jOY=;
 b=GBUFqJ2FZqIr7jXAmmqgS25zOSD+K6Zd+c41DIgyzWOg4JWeIopsP4LhC7OP1HxTwhF2jSq6d8kHBVzufmLh6b1/tkOqapOlxFlrna/FEaAoRnD5atPTNuYioGyaCpovFC4IO9WuALLJAQR3zYk1OxX+GBhvlv3qVQIXPvv082bZU5Os7X6cMVORsS8JVubWK2A5cKSMyawGDHfzLkNhc7zYjG2700z8Dy94ZZ0VfhASycr/LkxFOmmnHVD5q1Ib1j8DM/Envp4RAPO+TYIzSEqIdcRx94jbBFBW3i9zktG5RR9JRRgpNNHEFgCx1bbZ2YMTWE6pyoD79ujIhbFkjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gb0AEe+yGrbA+I5m+DAK2E5VqK6/++poyrMLaNz+jOY=;
 b=1EVxg5oedl4rB+NfvL0upxDtWvcUAkTM3WB/SSMadiW2Ko64LcwiIyQziQ3ii96xx97bUOKFIJx7u2BDXMBJsakBji671m4JPBGTeoMDeRnrP/y9qGHGN3KE9oKiz5kW01UON5qVuSo6X5LrWIPwa+khQJ8YD5sAn2Z/2jEtp0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 23 Jun
 2023 18:37:59 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 18:37:59 +0000
Message-ID: <50612c38-6a53-c1ae-5c0f-9f3f74833db8@amd.com>
Date: Fri, 23 Jun 2023 14:37:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-CA, en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230623075204.382350-1-boris.brezillon@collabora.com>
 <20230623100317.0f3fb434@collabora.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v3] drm/sched: Call drm_sched_fence_set_parent() from
 drm_sched_fence_scheduled()
In-Reply-To: <20230623100317.0f3fb434@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0263.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::15) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a4b53c-bb21-43d1-e11a-08db7418f7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UCY+oq+xTRD9D5bhZO2xfGsaYdnxypeoB68xAur4LaYJ/xv4Sl09jcGIMiuFN61MP4PH3aJHmuSZOMzkinV4/NJCUo+iylIwqjyx4NJRyRKO2f2yjR4EBEGPLRWtDBQzqKJWxO8TlSVL2dnpLlm5RQbHG3hgvZOSuFYCCjE2dtNSXr9q5Ef23LL0GspmZY5rQDv7Wx1xe3BnuoWwCE3s3xRw7EMYvFtA2nOuKT/3dBhA5c9QoqXhQwvT4Xu61Fiv1QmC52s8KiOEAd1y2i5mnp75J7VN55DCNL3XPglgcBzTdLD7L/iIKFO4CQWHKp8DFlYf12WykjgwnsgO6DGn89Ed8cPk4aK9GT4ZKoqGFQQLvGJmaEhtYqxela3fnlb2iD2sG23Y4v/asbS6zCq/Zw3wfuAnR0CelggPTlycgxNfSKAWsEkoL9CdYx1M3+sHgkmB3nakYTEqDH5NXOCVeBtoc0Y8yn5bGmqGX8Ea+Ui1szWuoyuLAwlbxBh7xqHb3ukAasi8sSfJ3Y47ODbdv+GLzxsTIwZydq+O+gdJqWakYZQRI4T4j/Cju1Lh5PcnLJeG39XIRhtzq8m/413z8bcoDaP4nbcu7zUNdUpAgVx069kvaSWnHld13kCpaZla3xhx+UP0fSosrXN2KaZXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(26005)(36756003)(66946007)(4326008)(316002)(8676002)(66556008)(8936002)(66476007)(478600001)(5660300002)(31686004)(44832011)(2906002)(86362001)(31696002)(54906003)(41300700001)(38100700002)(6486002)(186003)(6512007)(53546011)(6506007)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXVSbStNR0tEb3ZKOTQ3V1VRV0UzMHQzZHhZSE9hbHlFMEdOTEE3YWtleTRQ?=
 =?utf-8?B?bTQxRVBWOXliajc0UnZaVmhmVGpJbWZnR1Y5T1R2UG5DaVpQM2Q2ZU9qQWk5?=
 =?utf-8?B?Z3dLOHBwalFYSVovZ3kwaGZVMXVjR0FmUE9MRmhIb0ZYUmEybjZNMlF0THV0?=
 =?utf-8?B?VWNOWFFLVU1UdHFDVlBwaVRzc3VSYURaS29FeXlybmhmZWxpT1lVbS90bE5v?=
 =?utf-8?B?cEsxaUY3NVNyQ1M4RFprcXg0S083dDl3OGJNUDFRT1JYbmJFU0NjL3lTZDg2?=
 =?utf-8?B?VXIzazROSEIxbFJCRys5aVQzUjNYdk9CTTlZY2dBdUdVbktZRnN0VS9IcmJD?=
 =?utf-8?B?Uk9YRTUrUDh5eW03bXZIbDFRTTN2SVc0K3lSVzBXdURsRUZYMnNvYjJTTHM3?=
 =?utf-8?B?Q3lYazBmOUR1clNIYVY2WmZudUJlM2ZHOUZLL2VrbnpKcmgzOEtvNUYwbStj?=
 =?utf-8?B?NzkydGJIV0N0MjZQZ0VFeTVqR2JxcUo4Mnc1c25nTlU2Qm4zcFNVbUI5RjRP?=
 =?utf-8?B?bWFsVEl0c05LY0VlT3RTcUJnTG5wNTZWdWV4SGtMQVhzb2FiemNuRHJSblFm?=
 =?utf-8?B?RDZKTHNxMG0wQVE2d0hpT21sNWhsMmZjS0tsU3ZyQ2Rsb0NSUEExRGtKZE1m?=
 =?utf-8?B?YUJUM3Zqc0lJa1Bzb2pHcmZkY3VqUVVCZUliSlk3ZW5pNmZvNVlCR09nTmVq?=
 =?utf-8?B?T2VFdWdJZ1MvYkpUbHJzb1RqR2hlSSs5OXJGamQwZDAxWUs1N09hRlRTRTgx?=
 =?utf-8?B?ZDJqUFRqNk5uZGg1Skg4c1ltdlBSYXVYV3RWdVZnZ3ZHcUlKSEQvMENNdUZx?=
 =?utf-8?B?bERDVmtYbHQ5MkhwTlZNWUJueVJaaUpwcGtzL1c5ZGhuRXM0aHFWZ3QxOUtR?=
 =?utf-8?B?RkJiSjl0THJzQ0hjOFhkcGVTbG52NVdUSzFBMWhDNDNvS1AxMmlhQUp3VFBk?=
 =?utf-8?B?SDZhdlcvRWNaUmw1NEZaSlRTWHBHOE1vM3hzUENQVGdsYmFsaWJLSkQxdzhx?=
 =?utf-8?B?REp4bEpQQzFRWUJURklRME9xR2ZPR3d5clhNZGs4dyt0L2k1ZERwbkFja3hD?=
 =?utf-8?B?bFNXdm1BbUx1VGdpK0ZrcytnTWhCN0JjcmQ0dW5VQysrL0tRSWhEOHhpSDhE?=
 =?utf-8?B?Q2VidnZCQk44TzFVRUpXejFOSkpZbEsrLzhrQm1IbUlqZ3V2UGQ1amxQYlhM?=
 =?utf-8?B?Q0pzQ0xmSzRvalAzUThocGQ5TTR5OUdLRHNZZjM2M0dZdklWREhTc2QyYkJ6?=
 =?utf-8?B?QUs0ZGRjNjZHNnpmdHVuUW50ZHkzQ0h6VUIwS0lud1ROUUVFbUhWVjFTZnE4?=
 =?utf-8?B?ZG5JUllsYlA5NGpPdlZDeTJoNFUrbW9EQTM5bkRBVHdybCtObW9FcnR5RE5x?=
 =?utf-8?B?UUlveWRaaVduNG1JaHFheXhSUmpGa3B5RUpOdnBTZjgxTnhxWEEwbnVHbGUr?=
 =?utf-8?B?QjNNU3QrUnhCaW1UaUp5THAzWEsxZVkwdDNyN083VE5kUzhrUHVSRmVjQXk1?=
 =?utf-8?B?Ni9YMzROK21HdDVqUy9rM3MybG9Rbm9mTjZFb0F1ZzNkeVEwbWdCL3B6WCtI?=
 =?utf-8?B?dkJDc0dic0k2Vkdlc3piRSt4SnFiUjlxakgxMjA2YWF1Ui90Z1dTOTVldnVH?=
 =?utf-8?B?Y1M5c0RFejVEODdlOGJ6Y1lhUlRHY0xpbHpPNW9RU3RmMDlXL2ZWb2IzUUw1?=
 =?utf-8?B?VFVpZjlFQldSQTdJQkdabFU3SDFUZ2pLN2lFbXFML1c1Z202dmFyQ2dWOUla?=
 =?utf-8?B?bFF5NmszZ3dtTjB4THVuOTV4aFVHS1RKbEV4L3Q4SUR3T1NZVE5jbFg5bDN6?=
 =?utf-8?B?RGJQd0tOeUxGd09SNThjNnY2bE94MDQxamY4cXZGMDc4RkVmeDhPRVYycjNJ?=
 =?utf-8?B?bU9SUEtRR3RSVi9TbUhOUmI4MGw5ZDV4MVgrRDVvbUcyZE5SL241R1MrdWVi?=
 =?utf-8?B?bWRsTHlpQWF6c0NVQWdyZWVmNWd3ZTNScEQxZXJTYVRWWCtiZkxwaXJnRE44?=
 =?utf-8?B?ejExeC9nRVpSQmlzcWU1Rk9FVlpXd2pENEFpL0JDd0YvQ2V5Y0Y4ZG8wampB?=
 =?utf-8?B?UmdDaVNheExTQm9VNHBNenVoUlFpSnZkS01kbXM1SllvTnJTeFVFYmRkcUF1?=
 =?utf-8?Q?A2SymDK91DZoPIALxenxyaoSn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a4b53c-bb21-43d1-e11a-08db7418f7d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 18:37:59.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51K+XeMRvwU7mgewkIli7ITibj+u63weF2h4UEou+eYck7Sdubx9isAY8ewiyHno
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-23 04:03, Boris Brezillon wrote:
> On Fri, 23 Jun 2023 09:52:04 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> Drivers that can delegate waits to the firmware/GPU pass the scheduled
>> fence to drm_sched_job_add_dependency(), and issue wait commands to
>> the firmware/GPU at job submission time. For this to be possible, they
>> need all their 'native' dependencies to have a valid parent since this
>> is where the actual HW fence information are encoded.
>>
>> In drm_sched_main(), we currently call drm_sched_fence_set_parent()
>> after drm_sched_fence_scheduled(), leaving a short period of time
>> during which the job depending on this fence can be submitted.
>>
>> Since setting parent and signaling the fence are two things that are
>> kinda related (you can't have a parent if the job hasn't been scheduled),
>> it probably makes sense to pass the parent fence to
>> drm_sched_fence_scheduled() and let it call drm_sched_fence_set_parent()
>> before it signals the scheduled fence.
>>
>> Here is a detailed description of the race we are fixing here:
>>
>> Thread A				Thread B
>>
>> - calls drm_sched_fence_scheduled()
>> - signals s_fence->scheduled which
>>   wakes up thread B
>>
>> 					- entity dep signaled, checking
>> 					  the next dep
>> 					- no more deps waiting
>> 					- entity is picked for job
>> 					  submission by drm_gpu_scheduler
>> 					- run_job() is called
>> 					- run_job() tries to
>> 					  collect native fence info from
>> 					  s_fence->parent, but it's
>> 					  NULL =>
>> 					  BOOM, we can't do our native
>> 					  wait
>>
>> - calls drm_sched_fence_set_parent()
>>
>> v2:
>> * Fix commit message
>>
>> v3:
>> * Add a detailed description of the race to the commit message
>> * Add Luben's R-b
>>
> 
> FYI, I didn't put a Fixes tag because the various moves/modifications
> that happened on this file will make it hard to backport anyway, and no
> one complained about it so far. But if we want to have one, it would
> probably be:
> 
> Fixes: 754ce0fa55c4 ("drm/amd: add parent for sched fence")
> 

I agree with your assessment--the race fix doesn't seem to be pointing to
or introduced by one particular change. Plus that fixes change is from 2016...
So, we're good to go as is.
-- 
Regards,
Luben

