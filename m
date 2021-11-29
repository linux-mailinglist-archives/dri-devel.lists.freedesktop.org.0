Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831E461AB7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 16:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAA26F571;
	Mon, 29 Nov 2021 15:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381316F571;
 Mon, 29 Nov 2021 15:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgbyTDZGDh24kTRmrqOLdUqjlTPK/ZZEn9pB1KgtrgDUzQgFSVuUztm9J4Rfpt5uDouaDzmVR4ERTMgGPL9yNOpmk+ZvzVKBADc82RaFOKOnLokSWTHTeYpuv8uDWCmZOt3+ie53MXkePDlKRsyvIfKogzK+H1i2sjeIKXWdKkn+0bMtbeFuyrBrrnQY5Ukgt2VuQE7LHD1k6WASIC4WbKfA6Ky/IKcLON0cbFcCTjrBsJQEiE3Nex6nAg8tmQ6LvGxboPpbGc2Ir1LbIWD696UkHQxOPuuECOa4rZm5xG4l/tAVE2ngkXAlgp6QmlEKjSbRA1GPg3A3/BNkPho4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eOfb9XhXnkWMY2z0o6ivKq8/ZV5BYsfKbWJ5tXNWUc=;
 b=KphzdO64GVae6kslOIV6NNdgBChdtA/cpT3PSDkx7NGO8B2bd0UWmlUZMnga+egdCGkLi5f5wuXWcjQqhXtdW0mdnIfzB3iz5OFMOQrFwuMlGsDtaA7eTS4ojBPgY9qOdCG+ucmoOW/VRCxXDFpKtjsoc9hzVTbmLVTMARyK0fGsVolgsZ2bXn2SnSpQPEEAcGRK3eBZi4MJwVN8GstedR51I8T6vtf9ayiQXwstrrr/y2Dcrzv1g8ihDb8gTajPKM81VVr6+6x+eLq2rPZUYkYb0p6dcwvkZm1ULBvhiPb13G/yvyNxMw9ZCw/EBdNF6d11hlQrfabSPBYYgFVWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eOfb9XhXnkWMY2z0o6ivKq8/ZV5BYsfKbWJ5tXNWUc=;
 b=hh8nbjlO3lSpTswA8A3SPD2SELd3zdk3+L0f2vKJ99g09WNmpPbFxZI4/rF4dPIFgtu9XR5vtAaJ0hixTJWjzR56MDLNwlS77ChC2jtOzj2yIJgLLfP+AjpG+4gk4QdHYFburyH9vOzXhxODhSnVdPYgyoAK/wGvCBBpBKctFS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5412.namprd12.prod.outlook.com (2603:10b6:5:35e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Mon, 29 Nov
 2021 15:20:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Mon, 29 Nov 2021
 15:20:26 +0000
Message-ID: <b961943f-3e92-cb93-7b2c-a1ddabb971ed@amd.com>
Date: Mon, 29 Nov 2021 10:20:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [i-g-t 00/14] Add IGT support for plane color management
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211118115002.14003184@eldfell>
 <26abc3eb-c50e-8f89-ccc9-ad96f1177987@amd.com>
 <20211129112033.770d1c2a@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211129112033.770d1c2a@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0203.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0203.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:67::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Mon, 29 Nov 2021 15:20:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a18f9a75-f763-43a4-b026-08d9b34bc4e3
X-MS-TrafficTypeDiagnostic: CO6PR12MB5412:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5412857DEAA47BE5BBE83A318C669@CO6PR12MB5412.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xyiir5eynuaTCR4xxn+KKC85AEjmznVB/UMJCZxHIQzpSqQoc3u6g/FuweOBCRsDkRo6KIIXWYjd1ggyyoCHAG1SctCKfj7b63TzKvai2lzDMNmw3F2Ov9wkmOvsBJbpnwPtVQNxFHCch7hbHVoXKyKE2lS0QCN7mPMu+yGUWeigOK07HQjJp/liZEGXlPZvS2u6iT4kXrxUhGi/ZffbqJsmwRcrdPgWzqPzbQAJojcLlzNS1pTjFV0Y5kSQnU3eNHoodJ5d5kvIhKd9P4HcjGpfaqy9YfPImIBcMzn5T4TC+czOBp51mReXK2gzHdz7awjZ6JhiN30jErn9VUjOs2LEZ2UiPVqh0r5Krxz8Egv5g1IOZLKVmX+TidGhKjOVWzhP80CzfB077psuxeexTJ2GcOzr7SS62gtIlB2hTrQ+NKXFNrdTF4XqWY9E08BKH2SybnDt+r1Lu5GclIukqNCTPvHLxAphRphGIRET0rnv/HG1FPQSGZN3jIITCC6X8iW5F5szcu54vUY/8482Nn9aPzdiSve8V6mBnBh2AyBlgSyAw2JLgbX6uBniZ1jFCHdERvLrtXnjpw6/eU9m0wqeao3tnI3n9pIqp0pYanu39DaJywqJQFGYbiz3j0N2lY51V4Rzk4rizpV3yg0abyEdICcrS437dj4i+r4AksmuZSmtawGR35KBkNd8s0x2jQ5C2JzbV0NdZcc/PZq8QUQgRbeQ+2yVXCjU0HvKP8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(966005)(4326008)(66476007)(6666004)(8676002)(31696002)(54906003)(36756003)(38100700002)(4001150100001)(86362001)(5660300002)(2616005)(956004)(16576012)(66946007)(66556008)(44832011)(6486002)(186003)(83380400001)(26005)(53546011)(508600001)(6916009)(8936002)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpobXdQVlR5d21WUFN2T1ZPbkE5NTBNYkducEJzUktSNk9EclMrZ0xvbk5Z?=
 =?utf-8?B?MW5Ub3J1Z3NIRUxIQVh3TGVsWjUwbkpOU3hEdWdOMnhKWVE4QWp5Zlpid3BN?=
 =?utf-8?B?c0tMZDFhQmRZZURidWM3U05tN0k5aU9kemhLdFVOR0crSGU3b1VKamcybnc3?=
 =?utf-8?B?NURyRjhwRTdLcExId1pBSWdjM25PNmlyL3pzdXVjLzJ4RUpmY0p0eUZERW9l?=
 =?utf-8?B?c00zQUc5YkZEZVdqRXlRSTl0bkZPdFVKTElHOHVyZTFwTzZCeDlQWVlLT1NN?=
 =?utf-8?B?UjBGOW1yMlI4OGR6cDhUMGpsZXdGRTRIZFNYZ0E4dENCSE1PQldoa3htbHpY?=
 =?utf-8?B?U3N3NWtKUi9EYytscldTMi91cG1SUGhPdGZsRGxJcWl4TVRMTjJKbzVsRXFG?=
 =?utf-8?B?Tm52U3JyR3p4N0laZmNlanFQcXVoUSt4VU42NnhkY0taNVR2RWo1aWdYbnNJ?=
 =?utf-8?B?QjFaTUlvbUVSM3IyRHlHQjc4YWRYNVhGbHBtSTVTM0I0dGd5N2RBbklIMDFB?=
 =?utf-8?B?TVVLSXdOTUVTK3ZsSFUzSjJRV0JGYVVtcTFwTzZvbVdOUThYWEFjYlpyNG5l?=
 =?utf-8?B?dWNwVlVCYi8vWlRXSHNDcVpQSFowbnlJcWpkRnpJY2hYYjRZL0xxOW9NTTQw?=
 =?utf-8?B?NEpybEoyOTFqQXoxRi9yV0J2eTNZTVdZZmFCaU1LSURSOWtUSW00VUJraXQ1?=
 =?utf-8?B?UC96dmFiNWo3VEcwQkQ2Q0UvVi8rRHkrc1k1ckRBUXpka0tLYUdzY3V1aHFj?=
 =?utf-8?B?dUFTNlhBMFI5TjcxUm9VL1dDVzBGTCt0SmoxTzBCY0VUMGQxUVdITHJqc3pR?=
 =?utf-8?B?Y0I1TmoxdHRRUHU4SjZBZklubDZnRU5DYjRmOWo1OWtEc2RRUUkyYkJpcmlq?=
 =?utf-8?B?a3pYZ29pa2tzaUxuT2F2a0xENFJGekNCUmtOeTl4OU5MZU9tQ2Uyd0wraVRs?=
 =?utf-8?B?UGY0M2wvQzBiS1hwdTRuK0xmTGFJaFcxR25mTm5nZmJ2bFkrVmdRNEZFeEow?=
 =?utf-8?B?Yi9FRGZtdUFYcWhIMVlJdXBYa0Q5UmV2Rm1qZnV4a1VESGVUZU13QUFNcHRq?=
 =?utf-8?B?ZUdmUlV1OEduVW5PSStNQkVmbEN5L1Q3bXV6enYvaVNnaEt1ckxNdVROMDNR?=
 =?utf-8?B?TUNIUkNYWWlFNDdYZTl3WkZ5VEx0QkYwUHdaRHRuYkdFNytINmhTZFBsbS9S?=
 =?utf-8?B?K1grRmUza0FEWmE2NXcvcWkyYVNQaXJwYmVKMjZ0bitvTkZKYm1CTk1XNk5V?=
 =?utf-8?B?UmtMdVNPUTFESHZUcDJPbE1OZXZuQkJmRXlmWFQ3b0lCYVRSNU50d0luMUR0?=
 =?utf-8?B?RGNsQk82R1hBdHpsVkc0cHQrZDFDVkgwUkdlSnpvWkQzNUxuZ3doT0VkSVFo?=
 =?utf-8?B?aUM5bkk3ODZHWnJ5TVI0cWhESjRVcjVDWndGZ3pNZjFWUnI0Z01LbWoyeStP?=
 =?utf-8?B?UWR5TFprOFBMQlA5MVptSUp0cXhuYzZBVHpWeUdXeU9tSnVyaDJ2NERuMUlR?=
 =?utf-8?B?eFlsOE5zYUZlNVg2NmdSZkdaZk9jTGhsWVJLOHNWSXg4SEJXcEZ2Yk53bnNS?=
 =?utf-8?B?Zlg3WXMrTm1BQ29Ja2ZKMWx5K3Q5bElLKzI3cGhGdE43T2YyZUUyZ0pDL0NT?=
 =?utf-8?B?S3lqckVuRzF1N2MvY0VmdFljSTNuWDQweDI4a0JneGVjcWU2ZU4raDRiM1Ev?=
 =?utf-8?B?d3dpazNONE0rS0JQdE9YOWZ5bFNaZVJja1MvaS9QZFA3eU5TSlIwSFl0Q1R1?=
 =?utf-8?B?bTdrQUpkQWpkNFJaUkJLYVNBTFJ4YW1vblVhYW5uTzBoNVlzNXgwM0o3cHdI?=
 =?utf-8?B?Vy9odDBIZkJJUW9SYi9iY2lUVUlxQ0FuRlBaSWYrNDVna3hsZTdtRkk0SFd6?=
 =?utf-8?B?LytGaWw1dWdLV2lmVExncE9iaHFQdkpwN1F3Rm5RUW9Dd2l3bVlKUzg3N2ow?=
 =?utf-8?B?WWo0QkJ5QzdWQ3RyeWRTMHdLVFM2Y3FsYzVTa1FPVk4zV1pGZVNjcU1OLzl0?=
 =?utf-8?B?VXlZb29pNEh3Nmt1Zk1lUi9IOEVrS2ZoSHY2TmNzMEJiSzhuS05IMytGNXFu?=
 =?utf-8?B?UkE2c3owZVQ2dDJhbFNpeDc2enRJanI4SExJNkp5Q25oYWdxMHVKb1R6SFpR?=
 =?utf-8?B?T0JYSjVQeDlhYWhDN2RmR09hQm9BamxiZ0JaSFN0NmVZcXUzTXpIUEhSMTdW?=
 =?utf-8?Q?Uc1aLnSmYhg2S3kJ3YL6BKk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18f9a75-f763-43a4-b026-08d9b34bc4e3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:20:25.9100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPqiXDC2yXWXumyTvrmGGd4wNIww77BWnFjQ1rdNqiqTs+3x8HUHkqDKejCeR3d6Tcnt9gTeeLr5PrN0dyigsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5412
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
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-29 04:20, Pekka Paalanen wrote:
> On Fri, 26 Nov 2021 11:54:55 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-11-18 04:50, Pekka Paalanen wrote:
>>> On Mon, 15 Nov 2021 15:17:45 +0530
>>> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
>>>   
>>>> From the Plane Color Management feature design, userspace can
>>>> take the smart blending decisions based on hardware supported
>>>> plane color features to obtain an accurate color profile.
>>>>
>>>> These IGT patches extend the existing pipe color management
>>>> tests to the plane level.
>>>>
>>>> Kernel implementation:
>>>> https://patchwork.freedesktop.org/series/90825/  
> 
> ...
> 
>>> I also found some things that looked hardware-specific in this code
>>> that to my understanding is supposed to be generic, and some concerns
>>> about UAPI as well.
>>>   
>>
>> I left some comments on intellisms in these patches.
>>
>> Do you have any specifics about your concerns about UAPI?
> 
> Yeah, the comments I left in the patches:
> 
> patch 3:
> 
>> Having to explicitly special-case index zero feels odd to me. Why does
>> it need explicit special-casing?
>>
>> To me it's a hint that the definitions of .start and .end are somehow
>> inconsistent.
> 
> patch 4 and 8:
> 
>>> +static bool is_hdr_plane(const igt_plane_t *plane)
>>> +{
>>> +	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;  
>>
>> How can this be right for all KMS drivers?
>>
>> What is a HDR plane?
> 
> patch 12:
> 
>>> +struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
>>> +						const gamma_lut_t *gamma,
>>> +						uint32_t color_depth,
>>> +						int off)
>>> +{
>>> +	struct drm_color_lut *lut;
>>> +	int i, lut_size = gamma->size;
>>> +	/* This is the maximum value due to 16 bit precision in hardware. */  
>>
>> In whose hardware?
>>
>> Are igt tests not supposed to be generic for everything that exposes
>> the particular KMS properties?
>>
>> This also hints that the UAPI design is lacking, because userspace
>> needs to know hardware specific things out of thin air. Display servers
>> are not going to have hardware-specific code. They specialise based on
>> the existence of KMS properties instead.
> 
> ...
> 
>>> +void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type)
>>> +{
>>> +	igt_display_t *display = &data->display;
>>> +	gamma_lut_t *gamma_log;
>>> +	drmModePropertyPtr gamma_mode = NULL;
>>> +	segment_data_t *segment_info = NULL;
>>> +	struct drm_color_lut *lut = NULL;
>>> +	int lut_size = 0;
>>> +
>>> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 1);  
>>
>> Is this how we are going to do cross-software DRM-master hand-over or
>> switching compatibility in general?
>>
>> Add a new client cap for every new KMS property, and if the KMS client
>> does not set the property, the kernel will magically reset it to ensure
>> the client's expectations are met? Is that how it works?
>>
>> Or why does this exist?
> 
> ...
> 
>>> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 0);  
>>
>> I've never seen this done before. I did not know client caps could be
>> reset.
> 
> 
> So, patch 12 has the biggest UAPI questions, and patch 3 may need a
> UAPI change as well. The comments in patches 4 and 8 could be addressed
> with just removing that code since the concept of HDR/SDR planes does
> not exist in UAPI. Or, if that concept is needed then it's another UAPI
> problem.
> 

Thanks for reiterating your points. I missed your earlier replies and
found them in my IGT folder just now.

Looks like we're on the same page.

Harry

> 
> Thanks,
> pq
> 

