Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520666F845A
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 15:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F337810E600;
	Fri,  5 May 2023 13:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D2310E600
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 13:48:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiHosVcVXL+eY/yS4hPJz9trrvDRLdXvEChbY+kZZfUM98qkP5RWHWze5VgOobF3zL9tVnZOFTkFcoLWBMG3MlCoNUvO5K49Kpn92vJx7xLxZ4ZzxRFOQXi9XYSGFP6IBP2l2Q6LjrPfvQ5fOkfHrOYCiU37NPcuxl5jibiuLe8zMZl+h6dFtsQmm9FWiFuez4wHOY13kX3SbWXLd4dOmjoYIc++guDuxFjeJh+YV5jyOgndftLWGB2D+xkRAF/PFuCCJFg8gbkV8HqhBB2VzDBLzkvxeGYS9vw8o6DMt5tHd0B9dDffn2MIvXVDTgQ5wnrJyw35SvrOjIoTKymfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tP7MP5vXnSG5Md53xNT3QdPLOsRBVa5+w5La1j9G3A=;
 b=KabEjfLny6epyddmtGw1eu2v9kN4L49OpsI44Rs8TOr0JD+nKT8hwNrFHpNx3ZlxjBxpjDwVaXrqRNxHz1UwCgbkWjxcNqCThRtCwlgBAP2vE09X6++MQ3vRDBX+d66P4aO/GD5JjMkrYiKRwpL10f3Ra4KVOjJ8Ur1Y2dn8WdszyeNG8Gd5mYBYzYUJK7zmAO61a5p/qelbBUAzUNNkB9TsFbMKmUL/apZNEDVRm7UlTVsCnNODY2QzZqqPGFob0c0VfTvzL5EPfRTsL321vsE5tS0Bn2I6TJX1AJNPu82+pwacnIjlMeMGN1oECRZUy7lqmm+a9yPk4WtFD4dbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tP7MP5vXnSG5Md53xNT3QdPLOsRBVa5+w5La1j9G3A=;
 b=LJp/8/G3WRt46m37b/49JrD/j0kX6SVyk2Lvbu88Qkk7dmSH8O8SHDb6ggsm58hxHj+9x2TX6/Ozzv5QCQ9mlNomAGOtrXaYviOk8KLYOAngjL3Szn7W+hcdZD0zTgdv3sb+ZYOoSoJsR2VxEMgLHS6xK0STkIEq9QZWIhcq8fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB7286.namprd12.prod.outlook.com (2603:10b6:303:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 13:48:20 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 13:48:20 +0000
Message-ID: <b8758feb-76e7-e875-0328-d35249fcb467@amd.com>
Date: Fri, 5 May 2023 09:48:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] Documentation/gpu: Requirements for driver-specific KMS
 uAPIs
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230504212557.61049-1-harry.wentland@amd.com>
 <20230505114320.1eb77237.pekka.paalanen@collabora.com>
 <ZFTXl3qPn7E0pQWO@phenom.ffwll.local>
 <da677863-3039-86e5-0ccc-10d1085fa962@amd.com>
 <ZFUGLT0fnFT6ffhA@phenom.ffwll.local>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <ZFUGLT0fnFT6ffhA@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: f63aeed9-b0d5-4e5f-40fe-08db4d6f6345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAI80fVmnnJozys9hJF5eBGe/ZLp/8bF/elapRks80caAKUBt7fbsLDIOG199PTdwKMpxNHkCwYBrHeDP5Zeg3VUTBEwefT00Th9uoBu/KWFZZnYu29Uf/MKiY5MTDpC3Vo8fYnWzv86QDM+kNxvLl/TU5VKC+St84cA43nsYEKgCd1Ayf16iZz7G5k5uNX0eKqEqxnnPX18Ji05XBqvWdeaQr5wIwkOg58adJi5u3ygtv+Yxnn9ZvPwZ9AfkUFkORjNwd/5NiR+gW2K97oPMBWo2KnE+zi8AWJqsfEIKvOFHHlueoO1CA2rtweOI4+J4DAQiNsUKkUzqZk00iAeJ12vMPb7UFk2GvDXClvI0+Xd6OOIFbb0SAQXdH19pIeTPzTXLueexadDp4FyoN4zB1J3uQ6eXlKLZObpZuNve/HRKi8o7jyvy04Qx1PADBTRNVFwobJQAWyKoHIHKeNY/VxAr0mPRa3R6wEDDBzgDiRz6DfM15rgNk5N3v7NETELrSaog0JhvnEWsJ9ag2lhSpHVun3lb/c359aNmhUYG5m6xo60jO+li16u+eR2pftSc0Ud84Jw/7uMVsTas7iGOJ6jeDZJ8Y9/RSUTcqiE/Fo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(83380400001)(66574015)(966005)(6512007)(186003)(478600001)(6486002)(6666004)(2616005)(54906003)(6506007)(26005)(53546011)(44832011)(30864003)(7416002)(2906002)(36756003)(5660300002)(38100700002)(66556008)(4326008)(41300700001)(8936002)(66946007)(6916009)(66476007)(8676002)(31696002)(316002)(86362001)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdXSWxaZnBIdStGNXFJRlJWSXR3RklBNVJGRFlkU3lHKy96ekpWbUVRRFln?=
 =?utf-8?B?Nk90NlJ6R2wxckJhS3AyVXBGUjRGRldzbkk5ZWhTOVpiU21uSDh0UHA2ZU5Z?=
 =?utf-8?B?ZE9ZemNyTEplc3NiYXp1TFJRY2pBRy9PSWRUZkVQVnR0VytvSXpQUkVHZnVR?=
 =?utf-8?B?YVFxdmF2TzJUYTRxWFRLbnBzeGI2QXdiSnVUVmpYeUdhK1BwQkdDQmVXaE5z?=
 =?utf-8?B?QnVSTUU1L09ZVytibFBPdUM4MkpXTzFaQ3ZRQ0JJbkFrNWZLK05oLy83K05U?=
 =?utf-8?B?YzkwMEZyTGptd01nTnk2ekszSzVvNU9Uc2FWTmlHNXB5cU5pZmlEcXFUbjMx?=
 =?utf-8?B?MGNIeWM1dThXbVUzK1RrTWt2V05yM0I4Q1BHY3FuZE9UVDhQS09aN2dNbHlQ?=
 =?utf-8?B?aWNtcUQxTHFicDhodldZQjFjSlUrVS9qNVVyQURXa1RySGR6eWJaMmNia3hx?=
 =?utf-8?B?d3lVUzJWNkFPTklpVDJ0TTAxTDFVMWJtOEVWSjREai9mYThHYURrazQ5Tk91?=
 =?utf-8?B?dldodlYxbkdoUTF4TEkxTjdDTVdpNFNwakxSWEtnZEhpaE8wM0g4U05kRm5V?=
 =?utf-8?B?ZGw4cnRjT2ZHa2RYeEQwMUNRT2MyVlYyM1Z5WkJWcWNHcDRzUE9GOHNJV3kw?=
 =?utf-8?B?L1JIWGdVbUxBNGpRSUtWUmJ0eUpqdW9ZWEdEQ0JTUlAyYW0vMHdLRDR2QkIr?=
 =?utf-8?B?WW80VjhqcWVNbGdFdXdOS3lncnZUVTNKYVdxTVh4cDFLeGVFLzhodE8zNWl5?=
 =?utf-8?B?N3AyZXZrS2VOTWkwbVVoRENzRkNQWGxJK0tpZVBDQ29IUFA3WkgrQzFqaCt5?=
 =?utf-8?B?dkVFVjVJMjBzWXB2QWMwSGgwUGNTWC9kZkZUMkpodm1qSFlCNG1vQ21JczJt?=
 =?utf-8?B?UmQya2FaL3Y0STJ6bjZSQzk3YjcvVTROUVVyOGc4ZGZ2YkgwNVEyd1grZFBt?=
 =?utf-8?B?UXErbFh0SVl5S2RKRElLTGMrQUNTYkx1SkdGT0VHRHIvc3pHd1BWU0czbzIr?=
 =?utf-8?B?eTZraVozSWYvMThWVFZRTk5rTFlyaGxUZS9Pa3JhUDhNakJhcDlZR1dVUU1W?=
 =?utf-8?B?Uko2SFlCS3ZScTV6L0NPb0JMYXloMGdlYThTUEFWWVZ0STNWcDZRaElmL3BZ?=
 =?utf-8?B?TmFaZEQwUlM3VDFIS3dEOG52aThhczZsNG5TU3M0VVpRUjE2N0JQZ2FmU3hG?=
 =?utf-8?B?VXR5SUN6Wm9JYWE5NWpOVGJ2YnN0eGhzbHh0ZnlpVzFUVTdIZFFVL1hjcU91?=
 =?utf-8?B?aHdhSDhLK2JYUVdYbkNtbkdJYW4vNGZ4RTFTQXNsVDNvVDdPMHlvZnlIMWNi?=
 =?utf-8?B?dDJrUUM5d0NaK2g5ZWtFWnhZSTlpcFRrcitGQUp4TmhySXVoK0pwTFU0K2NU?=
 =?utf-8?B?SzNIWGFKSUk3TldSZkZYSEdqMm5seStYRjBKWTZXemRhNHRUSDhsMmZxYW5p?=
 =?utf-8?B?K2ZkV0pTWk1qZ3ZGN3pabGNSLzFKSWg5NXNkWTVMMmV2UXlJOXI2MEtmWlRz?=
 =?utf-8?B?b0Z2V3VBV1NQN3F1N0pXK1NlUVMxNGl3Q3B3aVhTR1NSQ3VaSDhIUW5QeW9s?=
 =?utf-8?B?Zk5jUFM1SFpDL0JBNE1KS2U4ZnN2QXMyM1RockFaVjlFc2dwNXZkZ1RPYUlD?=
 =?utf-8?B?aG9PeS9zVVI4MHpEc2ovRWoyM1JtK0FlekszRzlsbjRKOWo3SjNwT1VXMll5?=
 =?utf-8?B?TEN4dmVCUUs4YVc4b2RiY0NCRUhRVVQxZ1BJYUpQUWZQQTZTR1RteThwMU1R?=
 =?utf-8?B?NFBBTnlwRzMrVUpReXAvTnNrTGZMQjB3TmxnWjJNNkYxd2xJcXBYcE16TldF?=
 =?utf-8?B?cDVSa0xEWU1KeXgyV2c0WE8rR2RFNGxCVWRHVm02NFRNeDZnZFpKelJCV1M5?=
 =?utf-8?B?NDZ4OVd4L0FGci9YODFsTzIyNU9EL1Y1T1ZCU1V1eG5ycy94RWg5SDBTV2hz?=
 =?utf-8?B?b3IxNml0dEV4dkdCR2xOaDFNOXB1LzdGZmhOMmh4MDJ6WFAycDFEWUhiRjFs?=
 =?utf-8?B?QThNTE9FTmcwdWxkR05LdnRxc3RwUy92NnI2a0dlK0NrOG1hcHlhellkSWF2?=
 =?utf-8?B?c0tPbHFrNTlzUXBvd3pEVytlL3pYV1dSSzBQbFFYRGFSUktlOWZ3eDFnUE13?=
 =?utf-8?Q?ZFUULKRuY9oNue1p1PmOPUkFD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63aeed9-b0d5-4e5f-40fe-08db4d6f6345
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:48:20.6696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iP/fZzZ5YxLzWpy7RwtYZIXjIAaRXfh2xde5O0wyYauLOVlIKmq8f51spHXAlG7zsb64uiE9f0HLmumrjlonmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7286
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 dri-devel@lists.freedesktop.org, Xaver Hugl <xaver.hugl@gmail.com>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/5/23 09:35, Daniel Vetter wrote:
> On Fri, May 05, 2023 at 09:20:26AM -0400, Harry Wentland wrote:
>>
>>
>> On 5/5/23 06:16, Daniel Vetter wrote:
>>> On Fri, May 05, 2023 at 11:43:20AM +0300, Pekka Paalanen wrote:
>>>> On Thu, 4 May 2023 17:25:57 -0400
>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>
>>>>> We have steered away for a long time now from driver-specific KMS APIs
>>>>> for good reasons but never codified our stance. With the proposal of
>>>>> new, driver-specific color management uAPIs [1] it is important to
>>>>> outline the requirements for the rare times when driver-specific KMS
>>>>> uAPIs are desired in order to move complex topics along.
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/series/116862/
>>>>>
>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>>> Cc: Simon Ser <contact@emersion.fr>
>>>>> Cc: Joshua Ashton <joshua@froggi.es>
>>>>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>>>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>>>> Cc: Jonas Ådahl <jadahl@redhat.com>
>>>>> Cc: Alex Goins <agoins@nvidia.com>
>>>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>>> Cc: Melissa Wen <mwen@igalia.com>
>>>>> Cc: Aleix Pol <aleixpol@kde.org>
>>>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>>>>> Cc: Victoria Brekenfeld <victoria@system76.com>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: Dave Airlie <airlied@gmail.com>
>>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>>>> To: dri-devel@lists.freedesktop.org
>>>>> ---
>>>>>  Documentation/gpu/drm-uapi.rst | 32 ++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 32 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>>>> index ce47b4292481..eaefc3ed980c 100644
>>>>> --- a/Documentation/gpu/drm-uapi.rst
>>>>> +++ b/Documentation/gpu/drm-uapi.rst
>>>>> @@ -118,6 +118,38 @@ is already rather painful for the DRM subsystem, with multiple different uAPIs
>>>>>  for the same thing co-existing. If we add a few more complete mistakes into the
>>>>>  mix every year it would be entirely unmanageable.
>>>>>  
>>>>> +.. _driver_specific:
>>>>> +
>>>>> +Driver-Specific DRM/KMS uAPI
>>>>> +============================
>>>>> +
>>>>> +Driver-specific interfaces are strongly discouraged for DRM/KMS interfaces.
>>>>> +Kernel-modesetting (KMS) functionality does in principle apply to all drivers.
>>>>> +Driver-specific uAPIs tends to lead to unique implementations in userspace and
>>>>> +are often hard to maintain, especially when different drivers implement similar
>>>>> +but subtly different uAPIs.
>>>>> +
>>>>> +At times arriving at a consensus uAPI can be a difficult and lengthy process and
>>>>> +might benefit from experimentation. This experimentation might warrant
>>>>> +introducing driver specific APIs in order to move the eosystem forward. If a
>>>>> +driver decides to go down this path we ask for the following:
>>>
>>> I don't like this for two fairly fundamental reasons, neither of which are
>>> that sometimes merging stuff that's not great is the right thing to do to
>>> move the community and ecosystem forward.
>>>
>>>> Hi,
>>>>
>>>> should it be "require" instead of "ask"?
>>>>
>>>>> +
>>>>> +- An agreement within the community that introducing driver-specific uAPIs is
>>>>> +  warranted in this case;
>>>>> +
>>>>> +- The new uAPI is behind a CONFIG option that is clearly marked EXPERIMENTAL and
>>>>> +  is disabled by default;
>>>>> +
>>>>> +- The new uAPI is enabled when a module parameter for the driver is set, and
>>>>> +  defaults to 'off' otherwise;
>>>>> +
>>>>> +- The new uAPI follows all open-source userspace requirements outlined above;
>>>>> +
>>>>> +- The focus is maintained on development of a vendor-neutral uAPI and progress
>>>>> +  toward such an uAPI needs to be apparent on public forums. If no such progress
>>>>> +  is visible within a reasonable timeframe (1-2 years) anybody is within their
>>>>> +  right to send, review, and merge patches that remove the driver-specific uAPI.
>>>>> +
>>>>>  .. _drm_render_node:
>>>>>  
>>>>>  Render nodes
>>>>
>>>> Seems fine to me. I have another addition to suggest:
>>>>
>>>> When such UAPI is introduced, require that it comes with an expiration
>>>> date. This date should be unmissable, not just documented. The kernel
>>>> module parameter name to enable the UAPI could contain the expiry date,
>>>> for example.
>>>>
>>>> After all, the most important thing to get through to users is that
>>>> this *will* go away and not just theoretically.
>>>
>>> There's no taking-backsies with uapi. If there is a regression report,
>>> we'll have to keep it around, for the usual approximation of "forever"
>>>
>>> And this is the first reason I don't like this, from other write-ups and
>>> talking with people it seems like there's the assumption that if we just
>>> hide this behind enough knobs, we can remove the uapi again.
>>>
>>> We can't.
>>>
>>
>> Yeah, that last bullet was least sure about. FWIW, I'm prepared to maintain
>> AMD driver-specific properties for this "forever."
> 
> I guess a middle ground would be to up-front limit this to one generation
> only.
> 
> And then accept reality that the generic solution takes a bit longer and
> end up supporting this on two.
> 
> The other approach would be to make sure you can remap the amd properties
> onto the generic pipeline, and essentially use that to proof the generic
> approach. This would exactly match how all the legacy kms ioctl remapping
> to atomic helped proof the atomic infrastructure and driver
> implementations.
> 

It sounds like we're thinking the same.

>>> The times we've hidden uapi behind knobs was _not_ for uapi we
>>> fundamentally didn't want, at least for the long term. But for the cases
>>> where the overall scope was simply too big, and we needed some time
>>> in-tree to shake out all the bugs (across both kernel and userspace), and
>>> fill out any of the details. Some examples:
>>>
>>> - intel hiding new hw enabling behind the alpha support is not about
>>>   hiding that uapi so we can change it. It's about the fact that not yet
>>>   all enabling has landed in upstream, and not yet all full stack
>>>   validation on production silicon has completed. It's about not shipping
>>>   buggy code to users that we can't support.
>>>
>>> - atomic kms was simply too big, there was a lot of work in compositors
>>>   needed, testing corner cases, and details like adding the blob support
>>>   for the display mode so that modesets would work too with atomic. We
>>>   never landed a preliminary uabi version of atomic (there were plenty
>>>   floating around) that wasn't deemed ready as the long term solution, we
>>>   were simply not sure we got it right until all the pieces where in
>>>   place.
>>>
>>>   And viz Xorg-modesetting, in at least one case we still got it wrong and
>>>   had to disable atomic for that userspace.
>>>
>>> - nouveau pony years back tried this entire "oh the uapi is just
>>>   experimental" thing, and it resulted in the by far worst flameware
>>>   between Dave and Linus on dri-devel
>>>
>>> So _if_ we do this we need to be clear that uapi is forever, and not have
>>> docs that suggest otherwise.
>>>
>>>> If that date needs to be moved forward, it should be possible to do so
>>>> with a simple patch gathering enough acks. The main thing is to set the
>>>> date from the start, so there can be no confusion about when its going
>>>> to the chopping block.
>>>>
>>>> I do not suggest that the kernel would automatically runtime disable
>>>> the UAPI after that date.
>>>>
>>>> Does any of the big idea fly with upper maintainers and Linus?
>>>
>>> The other reason, and maybe even more fundamental one, is that I think the
>>> uncertainty of not documenting how pragmatic we are is beneficial.
>>>
>>> We should definitely document the gold standard aspirations, to make sure
>>> everyone knows where to aim for. And I'm definitely all for pragmatic
>>
>> So if I read you correctly you'd prefer just a short paragraph along the
>> lines of: avoid driver-specific uAPIs and instead define vendor neutral
>> uAPIs in core DRM?
> 
> Yeah, but I also thought we've had this as at least the aspirational goal
> already? After the free-for-all driver-specific kms property mess at
> least:
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#requirements
> 
> So we have all this already I think. Might just need to link it more so
> it's not lost :-)
> 

Ah, yes that'll do. Might just need a reference from the Userland page so
people like me don't miss it.

>>> merging where it makes sense, we've had tons of that, and happily carry
>>> the costs to this day for some of them:
>>>
>>> - a lot of the early soc drivers are kinda meh, and will stay that way
>>>   forever since they're not maintained anymore
>>>
>>> - we've had very much free-for-all vendor kms properties, and I expect the
>>>   hall of shame witht he big table of vendor props with barely any docs
>>>   will never go away
>>>
>>> - we're taking all the compute runtimes despite that mesa on the 3d/gl/vk
>>>   side shows how much better collaboration would be (and I think soon will
>>>   show the same for media) because having a compute ecosystem that's
>>>   substantially weaker than the sum of all its parts is still better than
>>>   nothing. And the situation is still that collaboration even with a
>>>   company is often impossible, aiming for better is not very realistic :-/
>>>
>>> But the goal is still to have solid code, cross-vendor infrastructure and
>>> collaboration and all that stuff, because that's why upstream is strong.
>>> And the uncertainty is helping us for a lot of reasons:
>>>
>>> - it makes vendors vary of going with vendor solutions. Minimally they ask
>>>   in private, which gives Dave, me and all the others doing vendor
>>>   outreach or working as some ambassador rule at a vendor an opportunity
>>>   to steer things in a better direction. And often do the steering
>>>   _before_ code gets written.
>>>
>>> - it allows Dave&me to more freely decide when to be pragmatic, without
>>>   being bound by rules. The point of pragmatic merging is to bend the
>>>   short term principles for a better long term outcome, splattering that
>>>   entire space full with rules makes rule-bending a lot harder when
>>>   needed.
>>>
>>> - most of all I really don't want to be in a discussion with vendors where
>>>   they try to laywer-argue that we must merge their patches because they
>>>   strictly followed the wording of some pragmatic merge rules while
>>>   entirely tossing the spirit of what we aim for. I already have more than
>>>   enough of that, this will result in more.
>>>
>>> In all the past examples of pragmatic merging we never documented the
>>> pragmatic approach, but instead if we documented something, we wrote down
>>> the ideal standards to aim for. That makes it easier for everyone to do
>>> the right thing, and harder (and more expensive due to the inherit
>>> uncertainty) to try to bend them towards the least amount of collaboration
>>> a vendor can get away with.
>>>
>>
>> That makes a lot of sense.
>>
>>> That's why I really want to keep the undocumented and hence uncertain
>>> rules in this space.
>>>
>>> For the actual case at hand of plane color handling, I think the pragmatic
>>> aproach is roughly:
>>>
>>> 1. land the amdgpu code, but without uapi
>>>
>>
>> Would it be acceptable to guard uAPI bits behind #ifdef AMD_PLANE_COLOR
>> so anyone who wants it needs to do -DAMD_PLANE_COLOR or should we leave
>> those bits out completely so someone who wants a kernel with them needs
>> to apply a patch to add them?
> 
> Yeah I guess #ifdef is fine. But if you merge it all including structures
> then really the only code left out is the one that registers the
> properties against the planes (since the idea is to keep everything else,
> especially all the state structure scaffolding), and that shouldn't be
> much of a patch really.
> 

Ack.

>>> 2. use that (and any other driver code that's been floating around in this
>>> space) to build up the kernel-internal infrastructure - the proposed graph
>>> of color transformation blocks will need quite a few things
>>>
>>> 3. land the uapi on top in it's hopeful final form, maybe hidden if it's
>>> not yet complete or ready for prime time as we sometimes do with bigger
>>> projects
>>>
>>
>> This would be the vendor neutral uAPI, so something like the RFC Simon
>> sent out, right?
> 
> Yeah.
> 
> And see my comments about about the vendor uapi, depending upon how this
> all pans out you might consider the option of doing the amdgpu props on
> top of the new graph node color pipeline proposal, to proof that out. Like
> we've done with atomic.
> 

Interfacing with the vendor neutral uapi is my preference but I think
it'll take us a while to get it merged, because it affects everyone and needs
really good review from lots of people (Arm SoC folks), IGT tests, etc.

My plan is to
1. Merge the AMD-specific stuff (with ifdef of patch for uapi)
2. Enable it with gamescope (and possibly other interested compositors)
3. Hook AMD color stuff into new vendor neutral uapi
4. Modify gamescope to call into vendor neutral uapi
5. Confirm that this work equally well with AMD-specific uapi and vendor
   neutral uapi (IGT tests, visually, etc.)

Harry

> Cheers, Daniel
> 
>>
>> Harry
>>
>>> Obviously compositor work, igts, docs and all that too, and most of all
>>> this can happen in parallel too once we have a rough consensus on where to
>>> aim for.
>>>
>>> Cheers, Daniel
>>
> 

