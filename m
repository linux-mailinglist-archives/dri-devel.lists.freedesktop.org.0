Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2307E2998
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CB910E34E;
	Mon,  6 Nov 2023 16:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A39010E34E;
 Mon,  6 Nov 2023 16:19:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEDdFwEDjkyk9vb5fj4OqmjHgoUKIX/2cSpEhb6+ZKy6pLGAa4+kh7V97Wm8AXyBGOh+r4UY7/GR9q3rCXRk7kZ2fYWcsbln6N57IebQzAjtAhKauMnhLrLwdKBjuCTjbPxQ14xOqjTFL+JL+AWAagTgPI9FohVrzcfELIg89wqCAysgiaV2tYZoRhoEz9fqolvLBrQngEvG0DJ+S/mrh9xQ9WF9rQykIYwBgbrZwEpBDJc3l9IGsJql65+OLqj4RXajo3tyNl8OXZ6+i2CDqI+ubVsnrOKES1Jp79H+Qzi3KEuAX4/ZJv8UNTk4wVAbIXAAgV6kGcIK3jU6dM3cPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VyXFqTC9d87MjZZd4cybhA4SyO7ZFbxSdCneDBjggg=;
 b=GBPZfCGSg/0Ivfs5sdL845vJqSl1MW6i5LNmqd14Z+f80IaClLUlp2lo0pbQE7PVe8Re868+Y6ch9l5jxIgTwMHCcLVmI8vWtHYETaXPI+AvFmMiiGq9wvCGUZgYj5jSbMnlAZ1wgoIg2JiffwdIcZF5J2AYQmZV8EEzzEdBG4nF64BiuIQHlJLUCDaeQLJ8Tpwhv0R3duxRWL5YGHjBoeebhoiPPi/D6U2r2YSgTFC+DrKLgHp2qp3hPTP5bM0dxumBslPcc6HbnUomS8256erLRtyxbhYLCBu3FrRpd/Db+VGx5IMNASBTB4Cg+aPnsHmLL+YfHOPbEx7bo8aTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VyXFqTC9d87MjZZd4cybhA4SyO7ZFbxSdCneDBjggg=;
 b=L7yXskbiKRlSzcMuhw9DjnGfZkaf6g1a8J51Zp6KGy5VxS528quAhvOb2D+Xu9PHXwOObhhDbD9HqHgL03dtCciiP871L898xHV11c86/eKc/eKnB2itZ71GJ7qixrCREiI2r7maTOeImc/FWmO7tp9qvjJFQfhkhkzrApU5PgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB8356.namprd12.prod.outlook.com (2603:10b6:610:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 16:19:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 16:19:33 +0000
Message-ID: <bc7aa628-4d9b-4141-a001-535e67d173dd@amd.com>
Date: Mon, 6 Nov 2023 11:19:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
 <20230908150235.75918-2-harry.wentland@amd.com>
 <20231010161322.topz6zfealkxtwjj@mail.igalia.com>
 <c80abc42-3197-4476-b33d-88c795b2e55c@amd.com>
 <20231020133658.4cff9f42@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231020133658.4cff9f42@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB8356:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f5c67e-12a6-436a-b631-08dbdee4293b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9/oY8odu5NDYXuXo3Wx/4pVT/SHxj1JpI1DZyLiwG9U51befNkT5YpRk1imjsLv5gDVhVmRBwi81HFn07MWuxo9mSavv7SsVf4ibfvD5ayOVFyx9n8giqUITb50gqYIAOqQyMrYQ0Yew7DqTHCuc/9UjxZzP5avnDztWSYdf/Dw2SEzdhLnPBZmhf6k+TSPiG7XPHqLwK4p08Z3tIE7qs+IrlDn9mAlENiPoXS65nGlANmJh08cY1h5nyB5yuTzAdp9IBQP3RKnHI/Co6LkkVZWGM/WwEB3zxiSv0FC9+XbxbV3Pww/Z7q/PMPGiqVp5y/ZS1X+KWf3o/MnKm/l7ZZb9EyWo4TpWPDu+WhiYqxUt7jDdwOti1YOH38oRhhdYL7XbveyPOP509v5XirBMIY4LzdkUZpOlr65rkq6QcR8LgicZ2OVviclyczFYcLIw4pT/IIR2xKXMf2k2sN+vuupn47v94CGmPtILLr+q+grMpsDBAByCVuySNdvBAJe91m1E16VkjN7Drqy/FhRB0zRn8bhZzPZ46ygNGSx6XhBBH/Wf7jivMRcipN+M99dKAykNjHc7N+7Wnl0q5jioN4olQRwcdE1F5C+khkPnB7P7h794JLXciaQc3/pgRRC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(83380400001)(53546011)(6512007)(66946007)(2616005)(26005)(478600001)(6506007)(8936002)(8676002)(4326008)(6486002)(966005)(66556008)(54906003)(66476007)(316002)(6916009)(44832011)(6666004)(5660300002)(7416002)(41300700001)(4001150100001)(38100700002)(66899024)(31696002)(86362001)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3VlOXJpRzloMFhvWlJqSk05cndnUlV5T1hMdEd5ci9vMmdMSTFDOXhUeXNh?=
 =?utf-8?B?LzFXRjR6WVJUcDN6b3J0ZUNUSDRCU2hTelBCbElLdUU3MG5nY3FFcEdnK1JI?=
 =?utf-8?B?NVRtZDFuVGNQeEMwOVowVG9zTDArZWxWUjlPRTltS3ZwNVN2ZUJlOFYzY0ln?=
 =?utf-8?B?WUM2Z0U5bmhNY0pOY2hCQWhKVm1WMkFGejcvMGVzdjZ4eDNXMTR5NnRrTVp3?=
 =?utf-8?B?QUdxME5BeWFYMFFTTGFEVFF4MWhYY2pDMEhpaWFhNm1PVWF2V0tnQVlPUnBt?=
 =?utf-8?B?anZYK1MyV2VqbCtjUE1qeEc1NlBRamJTdTl6US96SlQ0citZOW9VUDRJakIz?=
 =?utf-8?B?blBsN1hweWowQkFhemtHUWdiUXQwVGJFMFk5aWFkSmRtV2xJSmxwMThhellH?=
 =?utf-8?B?dVBYOXNDT003TDhnQzRVL2g5ZDBTaWVuTGNibUNrdHp0TjhWLzBtTHZSa29S?=
 =?utf-8?B?UW92MkpyRElnMDBRNzF2OUQ3VXJIRlZHaE95dy8wcnRuSFZvMGFLazVXU1Zv?=
 =?utf-8?B?eHdVUVFGWDZQTGFpU1NmMlkxYnVHU29hbmNuTlhiK2x5QjFZclVKK0xDczFY?=
 =?utf-8?B?STVEeUVoWElaak9RZ1N3NDQ2dE5QVFp5Q1poVlp5eVR1enNrVW1JVWR5ODg2?=
 =?utf-8?B?U2pLeEZWOEdvVFBLeUtqY0xmS0lHMnJjeEh2MGVoT1BSMC9CQWxXam1Pbmdx?=
 =?utf-8?B?SzdzcW0yQWc1SWYzTitEaEpnV09iamZ5WmhOQmJtSklDS1dwTTM4VWZHY0Fj?=
 =?utf-8?B?cFc5MWRCV0owbXdpKzNkd0lNK3l0MVd6bGQzbFNIdk9KVzJ4VHpvRU5yb2Ny?=
 =?utf-8?B?c2VSUU5jSTZrZ1pDVTVSdDlJRno2blQzd1BqNnBGNjN6VjZiNlJ1dEIwZ2xa?=
 =?utf-8?B?b3VFaHduVDExVUs5OEViNXJwTnRWY3JOeEJFeTl1Wk5Zend2ZnFZcjhLa2JK?=
 =?utf-8?B?a0xCNHZWNG9KYk8yNnJ4Snd4VWdiQU9PdEp4S2Flc2N2QmMyUk9YVU50U2Q0?=
 =?utf-8?B?aDRSc1ZKZVZ1NDdValJLQ0JzMkEzaXV5ekpvK2o1QVBsMy9aYnFtL0dzc2hN?=
 =?utf-8?B?WTBKdTNteFVsUHFDeTRiVGRMTkZJbnkzUFIzaVNHTDVCS2NmNmM5RUxmdTZZ?=
 =?utf-8?B?Wlp5b1J2YjhiNWE5aGE0bTBpVUw3dmdSeEp4Z3BPTkl0RFhEcCtTNkFaVG1p?=
 =?utf-8?B?Y05TSThMVkN3NG1FY0VmanFpckc0cWJIYVZrZC80RlMvRG9veTNaYjlnRC9w?=
 =?utf-8?B?UHN4Z0YyWDZXejRzTEthZmVmY2VEaGRRaHRBeTJVczg5UHBNRXpwc1p1a0h3?=
 =?utf-8?B?QzNKNHQ0OW1JU3YwTGtReHpMcGdOTnd0ejUvbmZJcmVFRVBwbHdLTDVvc0lM?=
 =?utf-8?B?RGVuTFZJVkFZeGNTUnJmeGpKTDM1Y0FTWmJIWDZrYjVVYXM1NTN0ZEhYVkdz?=
 =?utf-8?B?ZzhqQ0ZTWS92akVMSWRPdjM3ZU5jdEp0SXZtMExCRjllcStUcU5XL3M4aE04?=
 =?utf-8?B?Q2FqbkNPSDdGWmI2UitBcUlEN0FpZTNvWGpCVEQ3cTVGSnFkTnNEREVuM2t0?=
 =?utf-8?B?L1NycktrcUVHVWJXTTBJaU5lK2NEZWltZlA5akFGU0ZSbUp1WTZJR1psc3RP?=
 =?utf-8?B?ZDhxS1ZYTE5QS2c5UHBWTS95L1dKS25aRU9BR1hQVnVYT0NSd1lPaTJyempr?=
 =?utf-8?B?aGlkeWpnMDZIQ0RZRXBEUDFFN1RtY21hSzAzTGdkU0xid3d6dEJickY2VmJG?=
 =?utf-8?B?aWR4VHNCQkE1T2xKcmgxVy9MdjJJRHgvWDI1Ulgxc2Zxa3E4MDNKUndBZVpY?=
 =?utf-8?B?ZVd1WUFBL1JmaGt0YmpDN21hQUJEV01oL0ZYeDVlQWhGYjUrR09BQ0RaUTdD?=
 =?utf-8?B?MW94MFhMaFUwZmIwTmpOczVPOEhZVnpuWG9NODZIWk1wUExkMXFOYlVvbnRT?=
 =?utf-8?B?YXBVelN0SDdoR3NlZzR2UmovV1pKQVl1azFNVmhyWUcwdElJSUErckNIeWpH?=
 =?utf-8?B?bkh2ZmJTQ1dUdVE4VDdxQkdZMjlmZzNwN0NDV1ovdUI0RThaZVZPRmtGbmht?=
 =?utf-8?B?YjBjaHhIaWpmMUVMQURnSDRSaHB1cWhWalU4czNPTzgrSVUzaXBNQUs2RTE1?=
 =?utf-8?Q?mjSA4qjQGc3E0gL/7eEPhwsBx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f5c67e-12a6-436a-b631-08dbdee4293b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:19:33.0953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krZGmjCFG+zVr3JuGghQQpIgovqBVIlOZi1CRfegD/QdW821AHv5/34iveuBtN4SfKM/+fFf5ENOESyRTPRQIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8356
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
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-20 06:36, Pekka Paalanen wrote:
> On Thu, 19 Oct 2023 10:56:40 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-10-10 12:13, Melissa Wen wrote:
>>> O 09/08, Harry Wentland wrote:  
>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> 
> ...
> 
>>> Also, with this new plane API in place, I understand that we will
>>> already need think on how to deal with the mixing between old drm color
>>> properties (color encoding and color range) and these new way of setting
>>> plane color properties. IIUC, Pekka asked a related question about it
>>> when talking about CRTC automatic RGB->YUV (?) 
>>>   
>>
>> We'll still need to confirm whether we'll want to deprecate these
>> existing properties. If we do that we'd want a client prop. Things
>> should still work without deprecating them, if drivers just pick up
>> after the initial encoding and range CSC.
>>
>> But realistically it might be better to deprecate them and turn them
>> into explicit colorops.
> 
> The existing properties would need to be explicitly reflected in the
> new pipelines anyway, otherwise there would always be doubt at which
> point of a pipeline the old properties apply, and they might even
> need to change positions between pipelines.
> 
> I think it is simply easier to just hide all old color related
> properties when userspace sets the client-cap to enable pipelines. The
> problem is to make sure to hide all old properties on all drivers that
> support the client-cap.
> 
> As a pipeline must be complete (describe everything that happens to
> pixel values), it's going to be a flag day per driver.
> 
> Btw. the plane FB YUV->RGB conversion needs a colorop in every pipeline
> as well. Maybe it's purely informative and non-configurable, keyed by
> FB pixel format, but still.
> 
> We also need a colorop to represent sample filtering, e.g. bilinear,
> like I think Sebastian may have mentioned in the past. Everything
> before the sample filter happens "per tap" as Joshua Ashton put it, and
> everything after it happens on the sample that was computed as a
> weighted average of the filter tap inputs (texels).
> 
> There could be colorops other than sample filtering that operate on
> more than one sample at a time, like blur or sharpness. There could
> even be colorops that change the image size like adding padding that
> the following colorop hardware requires, and then yet another colorop
> that clips that padding away. For an example, see
> https://lists.freedesktop.org/archives/dri-devel/2023-October/427015.html
> 
> If that padding and its color can affect the pipeline results of the
> pixels near the padding (e.g. some convolution is applied with them,
> which may be the reason why padding is necessary to begin with), then
> it would be best to model it.
> 

I hear you but I'm also somewhat shying away from defining this at this point.
There are already too many things that need to happen and I will focus on the
actual color blocks (LUTs, matrices) first. We'll always be able to add a new
(read-only) colorop type to define scaling and tap behavior at any point and
a client is free to ignore a color pipeline if it doesn't find any tap/scale
info in it.

Harry

> 
> Thanks,
> pq

