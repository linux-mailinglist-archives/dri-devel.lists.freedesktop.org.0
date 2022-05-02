Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6ED517356
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 17:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A43310EFF2;
	Mon,  2 May 2022 15:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEB810EFE1;
 Mon,  2 May 2022 15:54:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfbAIs0wDzwwgI060G2HiK5sCtpYKRtf+1Pt19NKvGBFko2juF2VTVJGCt5sAAEnYDg0mgRgMJ0fNauRaU+Hw7moSbmlIY3Wppv8Rvbhmuf+MCVCVvpteEjHdV5GCjKqwNIW0Ni/bPK0UjNUmCUxWs1dMumIGPUjPpzUGBPNv+vcNuK6zEL0zPwYlJWd+3w9BBzxoD0hKRqMBC/K6q3w1RpvVL7V1nZgoC/a3xn2aE6x4dhyUAzacyI4fcixeGVhzJXKzv/KtCUd3qf4F/WcYJp0XhW2BgvOC/bTZjlbGnt9s964aWvqBDV/9CSnlcBigMNfOkoSCbqESl2fHiZ2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqTN/ZvP+gvGpzDimRC7BpIh+6oW/E70BOKdzZIlwgE=;
 b=CN3m1HU+z30H8IKT1D6r/grc/Lij4ocUduzHXmBDm9iQ68zsMeXdbvg8RdapLaC8pgfs3NYLBNGshfI2+twjONq0fmEfdafBgvtR7vITAjH+XPHDVThzV44OGy5iroZZHro/IrWwyE4/aeOERwYf/cgWlOpAFAbWc9nRg8ASlJVKPclK2mLL86UqrhuvIkyj8VOPmj+iW0KlZyN1txiWg7rjUxiyMquV/B+MbQKTJvlijQJnbbA5zDQ+NTU4/MRoSMFtZep83ZxXTt2dFwdDDVMcZvGKIbs6F/AaEj7S9hY7dEsH9YhkNWTijNKLZuoI5K9JzSbht5UqJr8TWo2zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqTN/ZvP+gvGpzDimRC7BpIh+6oW/E70BOKdzZIlwgE=;
 b=vTzQxYbEqFk99XBm1kHTLe65oJCAreeXdg2CeYyT7/GvorYzfk6wwJbdKvmRnPWAGRggZlV2yf6vHoAGZv+eKh7KCyVlIQjwKxeynB4+L3KLneRf+1dfAKku5uAShGyIv+00prQYA+Y5pvWMu2uBkReeAyQpJdJfbPcN/DXMogQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by CH0PR12MB5155.namprd12.prod.outlook.com (2603:10b6:610:ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 2 May
 2022 15:54:52 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::812:88d6:77ae:1d87]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::812:88d6:77ae:1d87%8]) with mapi id 15.20.5186.028; Mon, 2 May 2022
 15:54:52 +0000
Message-ID: <8b99ca20-f711-ec32-0cd2-16fc52846ce0@amd.com>
Date: Mon, 2 May 2022 21:24:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
 <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
 <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::23) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 607f2b2b-0068-4b5d-5344-08da2c541837
X-MS-TrafficTypeDiagnostic: CH0PR12MB5155:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5155E752EFDD83641BA60675E4C19@CH0PR12MB5155.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RwEgh4oBNv2wOAxGpRzxBD0AC2QX0h6yTfcPPQVKauMwhWDQqYmck1/ymeDCIpuDbjBN638j7xP4kBwuBzDWnEEtyBEh06NS0mJf07pSlBtEnQEMtAv3bEA+p9AMXcAyw0F0ICuqhJo63sWBdI31fyW4IY2aD0ECM+aLorE8wqBMOOGPUOzUnLdNE7eggrMGLpnjobDKv/0bj6w1jkSWnUMO06oiKd+6Tuo9t/7rCNVdx8FnhaHopzwODbvti8V9ZAwQ6BO5ZzmLIo0PThqBIGUzkK43CvOzebFrsYLRPuXs+7/hfPGtmXXDikgprVWPcWU/ORE0EHnXm5JYfOj0EiH730IzeFjbLt9QTyDifCG+Sji9PJRaGYB5ngEINhqYE/idkXavwmSG5uJSwOUbfp/p2OdtXs44ldXGa2swNYrgh7O4iFkxv+XdzIwz1TZ2BhBTojISTk7446vF7bQaAklH/q0sJBfJW5fvUKjWi6vkYgVOuKUWJ88lnlPFWwkbArKYMo8GdlrVBHK6C5e6gXveQmsgQhROGRuboYr+8jmUOlbITy5PbprVhcYZ8P/k/+HkS7JXBIrTWZ69Rk2aJ9djSAVUJhSJDJhjjG6sxC+8xxQkNnAoSGJS8MZE3d8g85OVjjXPqeZE311oa+EwzCpyBE6IaRsPKxmaCcCLyCMi08PjkPrR2g+1IeSAQLoP297pguFNDny4cnkoQnpU3NQ5JOVvSUAlP+4tkpMaulE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(6486002)(36756003)(508600001)(83380400001)(66476007)(66556008)(8676002)(66946007)(110136005)(6666004)(4326008)(8936002)(4744005)(5660300002)(6636002)(316002)(53546011)(66574015)(2616005)(186003)(2906002)(6512007)(6506007)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpDc1BXMkJzZFVxOXhDZW11THNKdythSEdFOG5VY0pvajh0MFhNcC9pMElj?=
 =?utf-8?B?Y0lIN0kvQlgyRkNCVEsvYk5MTmhEYnpvNjA5SGpnTUN0VUJTN2Y1NXI0Si9v?=
 =?utf-8?B?c2JrdFU3WFBTdG9WbWdDcWRweG4wMVRRWDMxWnZGUE5XN2RiOWxuM1A2YXBn?=
 =?utf-8?B?bWtIQ1hQWWlWWEYzOWtWNDhlNE9SZTM4REFobnVUMG95QXRBV3ZoREV2THZB?=
 =?utf-8?B?Y0E0UFlXaFRNRnhCVDBZQTQrK1JJV3VYZ0MrRXJsWFFPYnROUUF1Ukg3WjJk?=
 =?utf-8?B?b0hKMFMrVVVhczNmUFRySEdNVy9wR25nMmpRWmMzU3BkWUp4d2ExNGo1ZThw?=
 =?utf-8?B?Q2I3V2p0dkw1OU5VQkdnbVVBMjZta08wU3NCaGdOemd1T2xWYjZZbWRBVk91?=
 =?utf-8?B?QlBKWFFrYnhTanAxYmwvZUg1SjVETWcxQkhIQlgrM3BiNVo5b0s3cTZVMHlJ?=
 =?utf-8?B?cnRSRldMSGtjOWlPK0hmNCt5QnNNZ0ZlNks3Wm8rL2tQNTBjQ3NVaTBrWmRa?=
 =?utf-8?B?V1NZWFVOT0NMbzhqWGZvV3ZyMW90L1Y2NzBuQlFTNW1IY0djWS80QzBjQUNY?=
 =?utf-8?B?UTVCSURZampTRGJIRWFCK0JSUmtYaW04eEVpR0tHaXBlMm9VeHI1ZGRWckFQ?=
 =?utf-8?B?b2svREF5MEJaTGZpYWZFS2FNMWE2Yk1YOURTTlBDa2xiU3l0U1pxT2NOV0s1?=
 =?utf-8?B?Y2xWUkFxbHo1RWpsWGZCd3ZBMzc1RlhUWGJkRE9xUnFEWUpaYUMveG9uQWJp?=
 =?utf-8?B?dStaVzJ2d3pRVE4ydDBmRzM2QlZTY0Z4czZqTWZ6VTdTV2ljNVUzZlQ5NUtQ?=
 =?utf-8?B?NzdyN3lteVV5b29sR1F6RzlIS0EwUWxxNXF1UTRhSzM5aGNNeXFXejYvcHEr?=
 =?utf-8?B?RFBFcmU3OFhXZDMzRFFzSDg3U1AzRjltSlZQT1ZlN3ZNT29IMnRnWUhFQ1Fp?=
 =?utf-8?B?S3BGNnFKWGNONnhhZXlRZU4zaHViNDJXUmpYdjhYQklTazd5RHFhSTR2VFVY?=
 =?utf-8?B?RVVFT05sVDBucDg0bjdsMzdzN3J0elN1MlgrOWJrR3k2Rm4yUGk2bG5BZlly?=
 =?utf-8?B?a0FPaVlWQ0hXNC95alh3aytEbEI5YndQZXA0R0x0TWRhK24xWHBuV1B5WjBT?=
 =?utf-8?B?QkJobUhVSUR6S3BkWGVJbE95TEhjenB6S2grMHVZMkVhdzROb2JQWGtxQU5n?=
 =?utf-8?B?eVBKSU5QSlV3ckxVRitjaVlCaytxMjdRRS90dmVRYXMwWHZETlVUWUppSXNR?=
 =?utf-8?B?U09JZW9lbWM5T2dJdDU0SHBIbCt4ODY2Y1NGT1FuMExLZ3cxMUZUQkxaWW9N?=
 =?utf-8?B?MXBlU2lYMVBWK1g2V1FzK2IyNEdYWWFoNkFSSTAySmx5UHA5UG8rbDcwN09Q?=
 =?utf-8?B?N3JTaVdaWjloa1JXRXIvNk9BbzRjUEJ0anBoMFpiajFqWXZTUU9wWm5LZzRt?=
 =?utf-8?B?MmpTOHV5U1lIVGh2YXNSRU1QSklBN2RpY1E5ZE9YdTlxZFV1Z1BKSmlaNk9l?=
 =?utf-8?B?cENCK1h6bDluYXk0ZVJrTVdYdE9BQWJjVVdsUTBkUXNONTRZNU5kaGhaQ2Rn?=
 =?utf-8?B?c2ttdXJNM2pPeWlaU2hYTTc2Y2VPTkRySzM2N21ENmU1QjNvaXE4VXBtM0Z3?=
 =?utf-8?B?SEl6WFZ1WTMxK1NKN3RXNlVtanNMOURZUm55V1VuNFpVRk45dWVJRUxVNVZh?=
 =?utf-8?B?RjlVSnFwMXNoTjhWanBMc0VXUGpjZENEcDRvYVU1bmNqTXYzUk5MbTNCc2lL?=
 =?utf-8?B?WUtBRkpzY083ZE5JZXVPNDBhd25yZXI2OGMyZWdEZExPaUNNcjg2T0FjNmhG?=
 =?utf-8?B?c01KYWxGb0lXWTlCbjk1QmpuT3QzdWNpMFROaGVac0d4TktmeTlpVFBibnQ1?=
 =?utf-8?B?MzJiOW9COWgyaitWVXRERy92UlY3QVpYSlg2aDhMRGxXK1FMQWwwWTF6cTRD?=
 =?utf-8?B?UzBSK3lpYVY5cTQ4d3d4a2lrRElGalJMNytJMU9HcGZ5V05iRVVXQy9PVU9X?=
 =?utf-8?B?MDliVmhkb1hXUFFMZzEzNzVtMi95VTBYUmsrakVQSU56dnBYTGZhL21PcjZa?=
 =?utf-8?B?VWczeFhhWCs5KysySUxxbTNDMEhPQWU5NktIeXpLOVdjTnRMQU92V0Q0dlY1?=
 =?utf-8?B?eDFQWTBndXRLL2IraThuaHIrTUMrYnRHa3g1UXYvTmNzajBlRzBPN3EzVlB4?=
 =?utf-8?B?SFFyZHUrd084SHZITTNNRGFHK0RUNG9nRzZEcG1ualh4amo3YVBPT0R4cTBQ?=
 =?utf-8?B?ckZCNXljdjRPbXFIS1ByMldub0pRdEN4TW16bHJUN2hMZzR0a1VEVUhvZ05X?=
 =?utf-8?B?QWpMTXVrOW42R296UHdseUQvaEU2TS9tS0cyOWZIM3hGemNnWEhjbTNGVjIx?=
 =?utf-8?Q?A/zklXqRf/uXT/sgaDES8k/GZRfLV2z2nbNxRgP+EhxVe?=
X-MS-Exchange-AntiSpam-MessageData-1: yqmUqDNfhCDR2A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607f2b2b-0068-4b5d-5344-08da2c541837
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 15:54:52.5249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FTgSzgmoYZGUL3Ve8DdHxLqznAxb+YChqnWR6tvQfLF1qbQ8pJWK7/RzKZ/w8RICSnE/klJ+jx2hWQmfKObgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5155
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
Cc: alexander.deucher@amd.com, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/2/2022 8:41 PM, Mike Lothian wrote:
> On Wed, 27 Apr 2022 at 12:55, Mike Lothian <mike@fireburn.co.uk> wrote:
>> On Tue, 26 Apr 2022 at 17:36, Christian König <christian.koenig@amd.com> wrote:
>>> Hi Mike,
>>>
>>> sounds like somehow stitching together the SG table for PRIME doesn't
>>> work any more with this patch.
>>>
>>> Can you try with P2P DMA disabled?
>> -CONFIG_PCI_P2PDMA=y
>> +# CONFIG_PCI_P2PDMA is not set
>>
>> If that's what you're meaning, then there's no difference, I'll upload
>> my dmesg to the gitlab issue
>>
>>> Apart from that can you take a look Arun?
>>>
>>> Thanks,
>>> Christian.
> Hi
>
> Have you had any success in replicating this?
Hi Mike,
I couldn't replicate on my Raven APU machine. I see you have 2 cards 
initialized, one is Renoir
and the other is Navy Flounder. Could you give some more details, are 
you running Gravity Mark
on Renoir and what is your system RAM configuration?
>
> Cheers
>
> Mike

