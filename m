Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9FC7E29A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCFF10E380;
	Mon,  6 Nov 2023 16:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB6E10E36C;
 Mon,  6 Nov 2023 16:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYGQO3NLAL6VgUsbI57PSFUsHY26qiHJrkM5F8gl2xlZl1/zrd1fwfeYD+CWKXX9lqm/2oj6MHVnngiAx9KEqZQVatICPO/urJJeUoXyLIvjo4gE1Uo5BoUfiZdxRHSfDhD0FeGEnF07qB9xSGV5zE5Mz59R+f8ML0kCfbNU2KkMjJ8SVfF9RqbcwIVkYGXwL2icOLXx5EyUp2F/FzgTGLO/opbGKaM+7SQCOykRvb+t+GWep5o0TQXpU2yq2BHIcjK4CXl18plR7pjWOqiUQJqfu+EVXeuqxrJ3l71MEq7YSY6m98GADvpHJWGd/n0UC/tObHx1PwBk12+I+noLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xs51k1itqYeXhr8B5wYAuXqWRD65MsaQr2i/0zBun7w=;
 b=JFTaganrN1X6da7iU86lwq1d5AwbNlFoc/94jktJBntwL6dX1pnIcahNtXjF/UnPJKVjVtuvkxM3A/cDle9ow3AxNpVUUkQ2joMuzlxtkydXxCN61eTcgmwJeCGFSasWm0dE2Dql49iPBT8rrkpCE/VhO88n0YfmBSlgUs1yMR2FYrVjKLkGVPLgSCPlr53pOoxYXJIX8PxuBwIRPH79dUt0x9JCMWc12IrUOLjDl9+BzKOGHkJunoIYEE91fzp74FXJMFVtBSXdSS/cguX8QpxGNhlymcBwSKodm/L4VOPUL1/p8pnczQ8bGLg6hRrwUhG/L/nrbUwv8+Bk92MhDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs51k1itqYeXhr8B5wYAuXqWRD65MsaQr2i/0zBun7w=;
 b=IIidf2d+bv/GAVtnE5h/FM7POTkDOKzdSrOHtVpOT5w/kCwR4Y+7ZC9YGTRRDMKgI8BsqvFiFRWWmvGq8GNfryjWI5iz5d2QnVwt5TiXF05xQm5W20FJCIn3VKQAY8xE0rpR1ZCyCTN0qBJZhL3XN5hfj4FVKiunohhDDoVCJc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB5140.namprd12.prod.outlook.com (2603:10b6:610:bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 16:24:56 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 16:24:55 +0000
Message-ID: <62d31e98-39e6-4c57-9495-d2cf169a6ab4@amd.com>
Date: Mon, 6 Nov 2023 11:24:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20230913142902.31a51b46@eldfell>
 <04754060-8f1c-4bf1-91bb-2e0305339b1c@amd.com>
 <20231020131752.488932a0@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231020131752.488932a0@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH0PR12MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d5ff70-13e0-49b3-92e1-08dbdee4e99e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bT2EsRwMiBJMjhA3UYviWc1luy5piKG6TuIbpNw8OP7Tjakj9fg79JV/xd0PaMv40zkJ57vSVEpeOfjQXF3K0ntrxrXkNkaTMwrU7A1WtknJyGnfu/CtVPcf4I2SN8HE1XI9ro2PzavbpdclXGebP9rb4xgxqJFXrXDvn1F+QZa1SrwTg+N2nQiwYDel8efeEIrP8WVkSmF4aBo5O37hTLgzxqQKRvsHmNri1I4z1kmtDu2El1n3ShztBGyPvaL1yZdGhUjVSjKLIBX7jp/2JP/G/jO94JP94csdBGeBQdKQni7bk/DY/F5cGTY+2jS6F993v4dR+S11SEMq3jYwYTB5WJ5/1G9dOi639uqkVN9MuHp9bZ9+MvhUI2B5Rj2tXBIThOfMjOF1KpLzXUnPen6cjUJUHoC0R8ufCtOOemwiJwUimLky7RtWYPpZP8RtAhzEXy7O2Hue41EICsVqWtIzep3xJWye8oVkxi8qgYVH12HXx8DG7WSmEGXrzbFiU1oQeWMvVSEAFHF3GF7O2Q+VO6OleFXWlisrUkMRhPQ4akYhqJynuY+DSGmPny0v/a41JyH9TFAtWP5joHywwYCq/A65Jjrs9TGsc6PtRQx6r1zAXgOX65YbyJqJJcHFa8eYh5kWx5meKMhAEhI18g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(6666004)(6506007)(53546011)(83380400001)(31686004)(6512007)(2616005)(7416002)(41300700001)(4001150100001)(86362001)(2906002)(66556008)(966005)(44832011)(4326008)(36756003)(8676002)(5660300002)(8936002)(31696002)(66476007)(54906003)(6916009)(66946007)(316002)(26005)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjQyT2UvQjBiWEttNVRaYTNqTFVvYUd3Qzc3Zm9DeTN4ZEQrdEt5TElvckdl?=
 =?utf-8?B?VUVudTkrdHlkM0s1bDV0Tkplbnl2aUFrTk40SGtGNG02aXRYYVJaMXhNdUw3?=
 =?utf-8?B?Q3NOL0VKdjNKMEg1ZG81MGFDSFhXbXdZUHhmRk5LQmhLTDhMVnZqVnRRM2V2?=
 =?utf-8?B?WE5zRWVzWnhxbk90SFVoMGd4MG1GczZKaHJLOWRpZ041SnZITUhzdlIyVVRu?=
 =?utf-8?B?Q0V2Ri91UTA0aTFDS05oZG9nUG9jcE54aTNBMCt3bHI3cXR5OHl3K2MzM3Ji?=
 =?utf-8?B?a25iMnlKMjU1eWJTc3FxeFgzL0F1Sk95bUo5YWo2NVVVbjhmaStkZDY3ak9R?=
 =?utf-8?B?NXdjOEpkNW9UNExJSGU5MzFJeGh0Z0dpa0FXZDEwYS9nc0FQdDQ3OGtxOGdx?=
 =?utf-8?B?NXVtSzBRRHF1NEIzMGNJMUlVSjZQdFpnNFo4NjdjR0sydjl2NlpuZkh5OUFM?=
 =?utf-8?B?eXhKcm1oUjFOeFZkR3RUalFNQ2Vmd0xVQ2MyOWFDeC9sZVJqZnNEOSs3MjZu?=
 =?utf-8?B?QUZ1MzdMbjdBaDFQejRQb3I2Ni84a1VQeERycm5JK1FxZE45SU9uQXFtNE4w?=
 =?utf-8?B?alc5NC9QRTF5K1YyUGltT2J0ZFM4WEU2cUlKcFhoUFRYV3VZeU9ORVFDNFll?=
 =?utf-8?B?YVBOYXk0d2tsUWl2NkJKMG05RWtseVVranJqNzJDdHVwT3c2eUtmRTZwNzds?=
 =?utf-8?B?emdLWXkvclVBS3VVVmx0VWlBTWw0SVRpTXdsRVdKUjZDYWU5SWY1UVdtQ0ty?=
 =?utf-8?B?dW9wZlg5KzlranY5Z2l3UXNmVDhvcHJmQTJtbnNWNFNyWEtwanRZUXp4NDlB?=
 =?utf-8?B?SXdDcE5pTFF5dXNtOG5URENKS3hZbllMc0x6T2ErMjZ3dzFUcE1zc0xISS9z?=
 =?utf-8?B?UmVKcU9WbktOQTNDK0hadDdOZXpFTDFvbmVGRUdhMndIczhWSmw4cFhybzhr?=
 =?utf-8?B?bWZWNFBieUxWdGtJNWZ4R1g4NVB1bjY3NHdhUi9DY0dFR1JIYlRKUFp3bEFF?=
 =?utf-8?B?d252cGtkdW5CRk50dWxra1JCcTJ4b0RpK1BQbDQ4ODNGY1ZDeHRvMDludUNH?=
 =?utf-8?B?eFlUTTdFWkM0S0lWLzBXSW1QUml3TnI4Z2RVMXJyVWxkTXJPU015ZC85YnJZ?=
 =?utf-8?B?bTgyZEloMys1cDVCbWJYeWhLQnVrZ0ozV1pLWXlJQVlNR255WDJCYVVKVDJj?=
 =?utf-8?B?enUwS1MyWDNPSXdab3grK2VnYnF5TlJUcVlKRm1uazc5WlFQZEw2UXkxTUxP?=
 =?utf-8?B?WHFHM2lORFMvYXVRQmIwL2xvak9rNFgwdEpNSTl0UFhiZ1N1eWhJenFKQTg2?=
 =?utf-8?B?WXlBT1pkdmRNcmowQ2JsOUhSeHZPbkNDMzNXcXNIOTlEaXg3YXpSSm9uL3lt?=
 =?utf-8?B?NS9jaEdZcGFuSHZETEpaa0I2ZWxvMlBoVHd5dmYwZWdwelJlQTV1eDRMblJo?=
 =?utf-8?B?TTh3Y1VsWVpZVlJlS1pYcXVIeFhhTCtaYjRiaDZFUmJIWit5MEhpS3VKTE91?=
 =?utf-8?B?LzV0VldJb09RYlBzOGJZWHJ2RWZKYVN4NWtxbWdnUWFzemlDUCtPaHg0RWdq?=
 =?utf-8?B?SmJERU5wRE9qTmNLZ25uSHVWcElQNy9zTHZlSVpQM3d1dUkvMzJVVkpIakk3?=
 =?utf-8?B?dnZISnBtR09KTVdCZlZMdGZkTjZlS2FUVGZpcE9ZMmFJZkNEbmE2NFpVV09l?=
 =?utf-8?B?WjZSNWsxSXhyS0NJYmJ4eWZZQXlhTVcxSENSUWJkSFhwVXpmdDRWL3loTklQ?=
 =?utf-8?B?MXpRUmdLTXpvOTIzTjdHc21sbjJFMzZ6azZHY1RwNTh5UGxYZ0YzVStPSmt6?=
 =?utf-8?B?YTBJWlFaT0lKdjArQURHYVgyd0N4S0ZTUm1vTGcyekIrTmNnMjJBRHJndTR3?=
 =?utf-8?B?OEJ3OXY5WXFMaDVxaFJTYlUvWEhrSHcwNW10VkZSa0xuVHd2WVhQT3dqVnVx?=
 =?utf-8?B?MEU1NHd3R3lsSWRJTVdIeUpLak9sbFFHM1l2cHdwZEhpaXdDVVU5Ky9NQUt0?=
 =?utf-8?B?Vi9tUzhJbGpvUi8vZzFZazBRM1RhNTlnRW90K1BISVRPQVJ2SUFFbFJCSlZU?=
 =?utf-8?B?WUtEc1hMUlUvZDJPeVBjSlppdXZaYnpmb2ZGaXBScTNMVytCd0NWdFZIODBB?=
 =?utf-8?Q?0UcxlfAHJlPo4A/GUq62kdFuK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d5ff70-13e0-49b3-92e1-08dbdee4e99e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:24:55.8465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9WBvvJMKkFrgQwpPSasO3ub0csOfTwrmi22fwCgdcNZO2YmPEPjPVrFdEXk/CSyjpXHBqt/EKMS+NAPCAPIyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5140
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
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>, wayland-devel@lists.freedesktop.org,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-20 06:17, Pekka Paalanen wrote:
> On Thu, 19 Oct 2023 10:56:29 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-09-13 07:29, Pekka Paalanen wrote:
>>> On Fri, 8 Sep 2023 11:02:26 -0400
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>   
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> 
> ...
> 
>>>> +COLOR_PIPELINE Plane Property
>>>> +=============================
>>>> +
>>>> +Because we don't have existing KMS color properties in the pre-blending
>>>> +portion of display pipelines (i.e. on drm_planes) we are introducing
>>>> +color pipelines here first. Eventually we'll want to use the same
>>>> +concept for the post-blending portion, i.e. drm_crtcs.  
>>>
>>> This paragraph might fit better in a cover letter.
>>>   
>>>> +
>>>> +Color Pipelines are created by a driver and advertised via a new
>>>> +COLOR_PIPELINE enum property on each plane. Values of the property
>>>> +always include '0', which is the default and means all color processing
>>>> +is disabled. Additional values will be the object IDs of the first
>>>> +drm_colorop in a pipeline. A driver can create and advertise none, one,
>>>> +or more possible color pipelines. A DRM client will select a color
>>>> +pipeline by setting the COLOR PIPELINE to the respective value.
>>>> +
>>>> +In the case where drivers have custom support for pre-blending color
>>>> +processing those drivers shall reject atomic commits that are trying to
>>>> +set both the custom color properties, as well as the COLOR_PIPELINE  
>>>
>>> s/set/use/ because one of them could be carried-over state from
>>> previous commits while not literally set in this one.
>>>   
>>>> +property.
>>>> +
>>>> +An example of a COLOR_PIPELINE property on a plane might look like this::
>>>> +
>>>> +    Plane 10
>>>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>>>> +    ├─ …
>>>> +    └─ "color_pipeline": enum {0, 42, 52} = 0  
>>>
>>> Enum values are string names. I presume the intention here is that the
>>> strings will never need to be parsed, and the uint64_t is always equal
>>> to the string representation, right?
>>>
>>> That needs a statement here. It differs from all previous uses of
>>> enums, and e.g. requires a little bit of new API in libweston's
>>> DRM-backend to handle since it has its own enums referring to the
>>> string names that get mapped to the uint64_t per owning KMS object.
>>>   
>>
>> I'm currently putting the DRM object ID in the "value" and use the
>> "name" as a descriptive name.
> 
> Would that string name be UAPI? I mean, if userspace hardcodes and
> looks for that name, will that keep working? If it's descriptive then I
> would assume not, but for every enum existing so far the string name is
> UAPI.
> 

Yes, it's UAPI, as that's how userspace will set the property. The value
is still important to be able to find out which is the first colorop in
the pipeline.

Harry

>>> struct drm_mode_property_enum {
>>> 	__u64 value;
>>> 	char name[DRM_PROP_NAME_LEN];
>>> };  
>>
>> This works well in IGT and gives us a nice descriptive name for
>> debugging, but I could consider changing this if it'd simplify
>> people's lives.
> 
> It's nice if we can have a description string for each pipeline, but
> according to KMS UAPI conventions so far, userspace would look for the
> string name. I'm worried that could backfire to the kernel.
> 
> Or, maybe we do want to make the string UAPI and accept that some
> userspace might look for it rather than an arrangement of colorops?
> 
> Matching colorop sequences is "hard". A developer looking at pipelines,
> picking one, and hardcoding its name as a preferred choice would be too
> easy. "Works for my cards." IOW, if there is a useful looking string
> name, we can be sure that someone will depend on it.
> 
> 
> Thanks,
> pq
> 
>>>> +References
>>>> +==========
>>>> +
>>>> +1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
>>>> \ No newline at end of file  
>>>   
>>
> 

