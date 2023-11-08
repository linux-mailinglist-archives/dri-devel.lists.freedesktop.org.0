Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522C7E5904
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA86F10E784;
	Wed,  8 Nov 2023 14:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5E010E789;
 Wed,  8 Nov 2023 14:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVut2Kpwnh4pqYQ5ilOMu5XF4ji2WP0oNpqLJoMgmBsVbVjnDx6u6N38FHrHCwKChikDveEouZxTRAjtRTQo6xzuZezZpj6lBnzrzVOx3nxManv8bG/yW1hJpiO8Kple5TcQeof/rx/orWt9njgc0l5mHGaTEAhsz5JsCA1Bt8b8vPpr+57Rm5cTRVniqzbMAASMLZSnjM3zG0zE8SGmTeqAyILi7LAYFyK6xog2V9OteWWDtJwmf6y/qTFP1+NSUL11RyOPUogFO4UJhj3qS6A3YmT9BJBWorp9jOFPC5Qdk28ybvIiRi6lNN6E8BpaimQVcAUSM2XgLo0IKJhWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZQX0A93wO3Y4fm757Lq3qZqPhzSB+ynInNLzmkx5/0=;
 b=N2ixmeaTF4NWl9fnTQMiqHUyUBNngNCu7zIwL7CDECAhP0L7/bA5zZnb+Mb1IU3OHXSfPeJ5hGTdymzBuK48BZndqRbltjo5IPfbC4w6B2pMu/Uvdlbdtpg2uhqkA+fXvH2s9b13fNTe8copzc5hn6wziAMpmRU/wN2Bu6VWtNnNEI5s3goOjDeb+8k3MTwfCWsd/rgPgqCVS8g/Iz+aVcweRqTgp5fOc+3I3JtCftP8BmKJxWiUbCRc0onGHokzMZDhewOfe6djJhHpp20hGuQQQp4ER1a3werMOrKPMhkznEPxK0B4tUwisqG+QZRB8eyfigtAYuPbNbR/hqgepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZQX0A93wO3Y4fm757Lq3qZqPhzSB+ynInNLzmkx5/0=;
 b=kvBtBbRLXS+B27rNJCq+2bx9vq9mXvJG6bciCDYlULb+a5AmeG6p4zzIbF7W/1hxRGjbrFGf1cHK5dnOkzmG8ySTqepZ7pVUXOLFb27elqzKAEvT+qGTntQymlAU0Z7F1LePZgordJ8wR8AHCU+vugMQebnVZa5qAsXFrAG9O2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 14:31:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 14:31:22 +0000
Message-ID: <6c574ff5-8890-4acd-a873-7cb2fb48ce7f@amd.com>
Date: Wed, 8 Nov 2023 09:31:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
 <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
 <20231107115543.7fa6e5f2@eldfell>
 <f013a0b7-eed9-4b2b-a6d0-4678c46bef84@amd.com>
 <20231108121601.163e58db@eldfell>
 <CA+hFU4zFz1NyDRzgaeaWVEw9GU-Lm9D=oDsOABnOpMsNHQfdzQ@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CA+hFU4zFz1NyDRzgaeaWVEw9GU-Lm9D=oDsOABnOpMsNHQfdzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0199.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 915f03e0-e781-4ebe-b6ae-08dbe0676153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCQlrFmmBNtey5E6XmhepdjyWmOmEcMiv53VW/RgsfA+SecalrwQUN4QAKJV4VQz8Q5BqxQlthTnxFAWfsfBw1LUk5188ShjWkXeqDxxYoA91DY/p70EWuvK0sT92UfiZxYjbbb6Yj7ixw/5NTJh0PkqYOPrxf8WOM3USjfEeTH9zVt/sxKFXuwhvcZN1mDRmOoShg7jPe5/sJGkxiuc/SSnJcd/cyIFL/5PgRkq+YS1FX/UWjlOrEhC6c7zMjU3ED94oIHRX/Ug5hGT+QQw1Q0CNlNNloScevIkFLDvtk31GusS1VayEy24RY+H15z2N7sQQI3kU9DfHli6Dk+WfmiLVkoeCi0EJkB4kKaD3yK7UDS582kLCL45MnBa4SXAMbV72jIdJNIl5PJjRJ7Iq4jA8OciSvMrN1t9U3SxzHU5dqoVey84kaOBvjyLj5cSBTpfIiqedKtZ73vw6W+mJvCsGEgdSKywNn57G/ZKuE/s7PB/lUqrGC8cacORP37EKyRYrza+BTBTw8mq/FRxQYfXQPggOn5pYXJzCdoRbUoHLDbb7pAAdSfI7wUZHm6AG8fW4998UZVX5dZQbFr74HHPF5A+mmeeuo1Busm0jzcCoCNtrvv0IWCPO4MhD71H8S7hfAd4mzZ5k/5cY1t7xuv9DEmoRxB32OsXUMy4SikuxHjbyyWlJI6VY/014UFp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(5660300002)(8936002)(66899024)(2616005)(44832011)(6512007)(31696002)(966005)(6486002)(478600001)(36756003)(26005)(66556008)(6506007)(66476007)(110136005)(66946007)(6666004)(54906003)(53546011)(316002)(8676002)(4326008)(2906002)(38100700002)(31686004)(83380400001)(4001150100001)(7416002)(41300700001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU02OVkvMjdYOWN6d0V5Mk50bEN4QUxRdXNlWkEwWHdkMnRBVUpzWHh3Vm8x?=
 =?utf-8?B?czdQRldaZFJDNVR6N2htYkRvVnNZQm1GdVUydVBiUWpIVksrUlNqOVFvT1ll?=
 =?utf-8?B?WXlXRW5Fd2dvRmJxYjdwSER6ejFpZS9hTUFOWUZIM1NZTTg5QWFOcnFSMjBl?=
 =?utf-8?B?T3FhdHY1eEpyUUJmdlBZV1V4VGkzUDdhUm9IRUw5TGhXQjlEclhtZUJTTWpQ?=
 =?utf-8?B?eFc1UDJ6ZWxBK0s5SzloN2dLbkZEOXRjYUJkRUZKTE9aaDJZOHlibkN5NzNj?=
 =?utf-8?B?SkJvb2pHMEdueFYxSU15aHZNMjN6WmZwYkR1bFBaMnJtV3NrQjA5RjRyKytw?=
 =?utf-8?B?eEFYSXlnRzkyNXF1WGZXaXBZT29MRWxSQ0JTZGtRanV2OWJja05jT0RBaXN6?=
 =?utf-8?B?VU8vSlFBSlFQT0NMZExMVlRpL0wwZEhlTnRRWElDZ0g0UzdBR2ZBUWFRV2t3?=
 =?utf-8?B?L2FORDFOK2V1enhKeWhVTDBROVR5aHVTanJmNlFMRXV0aEtiWWRyU0JxN3Ez?=
 =?utf-8?B?OEpqTEpkdkMrTkVUWWlVaTdicXVhck1rZWhXZ0JTSFR4cDBrNytUMTVneWhZ?=
 =?utf-8?B?d2QzOWFyZ2xsbGNFbEpNUE1NYmlkeWRFM0N4RVhGZmR6TWlWRkpkZjdoWERM?=
 =?utf-8?B?ajY4TnhuaU9ScHFIa0ZGaDhtanhDV0JNcTZVQTZmeDMwTW1WMjFpc0lsRFEy?=
 =?utf-8?B?S0NJNUpURjdib3NiQWJnWVhqajRMZXArZCtIZTY3T2RqOTVpT3JHNVByYWNh?=
 =?utf-8?B?bTlmem5lVXovYnlCaXZ2TUdyenJBMUdUa2lRRkYyakJUTmtoT1VQcWM0VkJv?=
 =?utf-8?B?UjVWWFF4SDFqRG5ZWW1KK0psNWl5Tnk4Y25aZXZucEJyUmpLS1Z5NkhVMWZL?=
 =?utf-8?B?VEFwdnMxNGFxamFOSS9rQ1h6Mk1RSWVwZWNrK2t4QkZ3VlZXSDJGTW9IYU50?=
 =?utf-8?B?cEJTRWhvVlBoakJEZDFwZklKVzd1UmdTYWtPc3lyZHZpSWJOWDh0Ynd6VkIx?=
 =?utf-8?B?ckM4VS9DVHIybFhhRnpaUTVIRllWMnZZWkltOEhUbTFPYXhJVXBRdlVGd1hL?=
 =?utf-8?B?ZjZLa2l0U3dyNkRpMHNhc3hCb1ZlalJVVnhkUEM4dGRhTmYyY2dQR0NyOG5J?=
 =?utf-8?B?dWp2NmtrNldrMlFaNWVjUzlhSE1qbFk2ZndjN29peUZkL0dQRFJxZ2Ewamwy?=
 =?utf-8?B?TlZvdVBkRFdra01ualVxUmpveVB4WUFTMXM0RzBtWXJkUFNselRHYk5zdjN4?=
 =?utf-8?B?VWFWMFRVWSsrRzc1dlo0ZjErNTJER0RKYTRZTTFodHpXcGdsVldOQzRuU29w?=
 =?utf-8?B?WWtrS1psWmE1RFM1VWlpTTZqeVluZGIvWEFQK1g0c0FtcExnTW0xSUhPYlAw?=
 =?utf-8?B?QmRmMHZSREFjUE9ObW04b3hsanh5QjMrYmtTblJ2R2NCNGUwTHRyUnpGSmFm?=
 =?utf-8?B?Yjd4aHVmeHRXbitHRnJHeXAyL1BwMWorQjlwSHFyUGRtYWNuUit6K2ZxNkZJ?=
 =?utf-8?B?UlZIQ2k2bW5pb0pWVlQwSDQ4b0RHV0JzRDJya0g3Q1NFUEdyMjdmVFhOU0tv?=
 =?utf-8?B?blN0UlNpOWg2ZzRaeVI5TGRFOGU4ZVEzTDYyRGQzZzlSOTc5TEtpNDlDMHZ1?=
 =?utf-8?B?bFFCek5xMWIvelRNT3UxY0lKMVoyMmpmZ1NPMCtJUkRvRTlaUHJ6STJrTTBO?=
 =?utf-8?B?Qm5adUZJMWJPdWw2eUJlazJSRnZFUWVzREppUlhQRldBUWF4VkdYRE4yQmZv?=
 =?utf-8?B?NThicmR0SWlYUTBuSGh4RXY5Tk5VSzZVR3lzejNJSkFKUHorRVJvQ0N3RG1o?=
 =?utf-8?B?YWpKUERNcE04NEkvZE9Lc3o2cnZ6cVRhTHI5bWNXRDZqaThWQjQ5RlgvcnNJ?=
 =?utf-8?B?SXVaRnBDbXg1Q1lBUWF1M1hEV0NRdGlxNFJFUDBqcjVmb1daclNueno3alRF?=
 =?utf-8?B?aTJQNG9WckF5MG1LWjNDRTREdStkSWFOU2Rqak1xcU1IREN3Y0poVUtXU09w?=
 =?utf-8?B?eE1Jd21YQTBuRGRzaTRZOG5CKy9SamZqL0pGYUhFOS96U0k5MUQwSnY1Z243?=
 =?utf-8?B?TWlqUlczR0xZbUVpZXVyYjFwWW13emRGaDdOZXBrSE5xUjdpc0VJeXRFN1Nt?=
 =?utf-8?Q?mKnI6zSQ9CQs0Jt1ckrQrQE1n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915f03e0-e781-4ebe-b6ae-08dbe0676153
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 14:31:22.5931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upBxN79YnldmKRnUGH1X/Lao0j0OHvFlw/zmP7IEEIsKmaMor1ib03qG30CHNygPFFLKISSodoiIOnXMy5qKiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-08 06:40, Sebastian Wick wrote:
> On Wed, Nov 8, 2023 at 11:16 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>> On Tue, 7 Nov 2023 11:58:26 -0500
>> Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>> On 2023-11-07 04:55, Pekka Paalanen wrote:
>>>> On Mon, 6 Nov 2023 11:19:27 -0500
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>
>>>>> On 2023-10-20 06:36, Pekka Paalanen wrote:
>>>>>> On Thu, 19 Oct 2023 10:56:40 -0400
>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>>
>>>>>>> On 2023-10-10 12:13, Melissa Wen wrote:
>>>>>>>> O 09/08, Harry Wentland wrote:
>>>>>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>>> Also, with this new plane API in place, I understand that we will
>>>>>>>> already need think on how to deal with the mixing between old drm color
>>>>>>>> properties (color encoding and color range) and these new way of setting
>>>>>>>> plane color properties. IIUC, Pekka asked a related question about it
>>>>>>>> when talking about CRTC automatic RGB->YUV (?)
>>>>>>>>
>>>>>>>
>>>>>>> We'll still need to confirm whether we'll want to deprecate these
>>>>>>> existing properties. If we do that we'd want a client prop. Things
>>>>>>> should still work without deprecating them, if drivers just pick up
>>>>>>> after the initial encoding and range CSC.
>>>>>>>
>>>>>>> But realistically it might be better to deprecate them and turn them
>>>>>>> into explicit colorops.
>>>>>>
>>>>>> The existing properties would need to be explicitly reflected in the
>>>>>> new pipelines anyway, otherwise there would always be doubt at which
>>>>>> point of a pipeline the old properties apply, and they might even
>>>>>> need to change positions between pipelines.
>>>>>>
>>>>>> I think it is simply easier to just hide all old color related
>>>>>> properties when userspace sets the client-cap to enable pipelines. The
>>>>>> problem is to make sure to hide all old properties on all drivers that
>>>>>> support the client-cap.
>>>>>>
>>>>>> As a pipeline must be complete (describe everything that happens to
>>>>>> pixel values), it's going to be a flag day per driver.
>>>>>>
>>>>>> Btw. the plane FB YUV->RGB conversion needs a colorop in every pipeline
>>>>>> as well. Maybe it's purely informative and non-configurable, keyed by
>>>>>> FB pixel format, but still.
>>>>>>
>>>>>> We also need a colorop to represent sample filtering, e.g. bilinear,
>>>>>> like I think Sebastian may have mentioned in the past. Everything
>>>>>> before the sample filter happens "per tap" as Joshua Ashton put it, and
>>>>>> everything after it happens on the sample that was computed as a
>>>>>> weighted average of the filter tap inputs (texels).
>>>>>>
>>>>>> There could be colorops other than sample filtering that operate on
>>>>>> more than one sample at a time, like blur or sharpness. There could
>>>>>> even be colorops that change the image size like adding padding that
>>>>>> the following colorop hardware requires, and then yet another colorop
>>>>>> that clips that padding away. For an example, see
>>>>>> https://lists.freedesktop.org/archives/dri-devel/2023-October/427015.html
>>>>>>
>>>>>> If that padding and its color can affect the pipeline results of the
>>>>>> pixels near the padding (e.g. some convolution is applied with them,
>>>>>> which may be the reason why padding is necessary to begin with), then
>>>>>> it would be best to model it.
>>>>>>
>>>>>
>>>>> I hear you but I'm also somewhat shying away from defining this at this point.
>>>>
>>>> Would you define them before the new UAPI is released though?
>>>>
>>>> I agree there is no need to have them in this patch series, but I think
>>>> we'd hit the below problems if the UAPI is released without them.
>>>>
>>>>> There are already too many things that need to happen and I will focus on the
>>>>> actual color blocks (LUTs, matrices) first. We'll always be able to add a new
>>>>> (read-only) colorop type to define scaling and tap behavior at any point and
>>>>> a client is free to ignore a color pipeline if it doesn't find any tap/scale
>>>>> info in it.
>>>>
>>>> How would userspace know to look for tap/scale info, if there is no
>>>> upstream definition even on paper?
>>>>
>>>
>>> So far OSes did not care about this. Whether that's good or bad is
>>> something everyone can answer for themselves.
>>>
>>> If you write a compositor and really need this you can just ignore
>>> color pipelines that don't have this, i.e., you'll probably want
>>> to wait with implementing color pipeline support until you have what
>>> you need from DRM/KMS.
>>>
>>> This is not to say I don't want to have support for Weston. But I'm
>>> wondering if we place too much importance on getting every little
>>> thing figured out whereas we could be making forward progress and
>>> address more aspects of a color pipeline in the future. There is a
>>> reason gamescope has made a huge difference in driving the color
>>> management work forward.
>>>
>>>> And the opposite case, if someone writes userspace without tap/scale
>>>> colorops, and then drivers add those, and there is no pipeline without
>>>> them, because they always exist. Would that userspace disregard all
>>>> those pipelines because it does not understand tap/scale colorops,
>>>> leaving no usable pipelines? Would that not be kernel regressing
>>>> userspace?
>>>>
>>>
>>> The simple solution is to leave previously advertised pipelines
>>> untouched and add a new version that does include scaling information.
>>>
>>>> If the kernel keeps on exposing pipelines without the colorops, it
>>>> fails the basic promise of the whole design: that all pixel value
>>>> affecting operations are at least listed if not controllable.
>>>>
>>>> How will we avoid painting ourselves in a corner?
>>>>
>>>> Maybe we need a colorop for "here be dragons" documented as having
>>>> unknown and unreliable effects, until driver authors are sure that
>>>> everything has been modelled in the pipeline and there are no unknowns?
>>>> Or a flag on the pipelines, if we can have that. Then we can at least
>>>> tell when the pipeline does not fulfil the basic promise.
>>>>
>>>
>>> The will always be dragons at some level.
>>
>> Do I understand right that the goal of fully understood color pipelines
>> is a lost cause?
>>
>> That every pipeline might always have something unknown and there is no
>> way for userspace to know if it does? Maybe because driver developers
>> don't know either?
>>
>> By something unknown I refer to anything outside of basic precision
>> issues. Doing interpolation or mixing of inputs on the wrong side of a
>> known non-linear colorop, for example.
> 
> I don't think that's the case. Hardware vendors should understand the
> hardware and exposing everything that affects the values is the goal
> here. There will be a transitional period where the pipelines might
> not expose every detail yet but that's fine. It's better than what we
> have now and should become even better with time. It would maybe be
> helpful in the future to have a cap, or property, or whatever, to
> indicate that the pipelines are "complete" descriptions of what
> happens to the values but we can discuss it when it becomes relevant.
> 

I agree, for the most part. But how do you then define "complete" if
you exclude precision issues?

>> An incremental UAPI development approach is fine by me, meaning that
>> pipelines might not be complete at first, but I believe that requires
>> telling userspace whether the driver developers consider the pipeline
>> complete (no undescribed operations that would significantly change
>> results from the expected results given the UAPI exposed pipeline).
>>
>> The prime example of what I would like to know is that if a FB
>> contains PQ-encoded image and I use a color pipeline to scale that
>> image up, will the interpolation happen before or after the non-linear
>> colorop that decodes PQ. That is a significant difference as pointed
>> out by Joshua.
>>

That's fair and I want to give that to you. My concern stems from
the sentiment that I hear that any pipeline that doesn't explicitly
advertise this is useless. I don't agree there. Let's not let perfect
be the enemy of good.

Harry

>>
>> Thanks,
>> pq
> 

