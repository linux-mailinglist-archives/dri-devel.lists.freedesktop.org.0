Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937AF68A2BC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 20:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F6B10E8B3;
	Fri,  3 Feb 2023 19:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0B310E2AD;
 Fri,  3 Feb 2023 19:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzVpVhm2LzonFF3YWI0Vw+rhRH/Omp7Um5gFOCfUFPUmTIAwkNkwHaqcEcVihj8w90y+gusNW4ez1fgL0S6/RBXTTwvIMn8vCRCPomYA9oyrr1Az2OF1cZQy0cA3/dCWdv1WFmNKB+A/VtyMxIRBDobHLXeB2JDsD22mbd2ubIDTchDTc+DFBmob/Dll+WQ4Mz82BXQFGmtk595tqbsC/TKJydkiEnww8bZevNQdFAhVCR8gskqjClU7GtdOVXUKCUbUHb/1NV2Wy8XNm/av6lc2tfr8PffZf7Jb2nT4HeJfnFS7vxbkwmT0bSMdpFe4+0MbK1RauQLyAobZnOs0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa1t4TpCkBQRvG2EaG6viD24xeqviyXYDwc3fWbCswc=;
 b=OoivBF3TU3YGImV7LqIMuTaXGPNU7fTUVR80lqxB/miW0R7V+0j5EXNEa6vK0H2/GZ7rYDrSW9ADoDg7csS/oM2MMHlPAzp0VmlfWYBjt2FBVg++cxF3oni7nzrA1lXTHGj5x7qCqkOT2lXJVsprc4IT7btDDn918D3N0oeHP/ZxhuXV58fGljUgM6lkJtJOTKFF59kZzbWtIJgmYcYlYRKc/XBtefIFPc9dJbkypCGf3L6izA31N+RQRKPqlfgOluZxVvj7jwmRC+LHLvKfG7oYqJ0eOkhygq7J5F4dsaXXovqoMpfOyyqRcRvCE+fItK/wGefHco15UKPG8FJhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa1t4TpCkBQRvG2EaG6viD24xeqviyXYDwc3fWbCswc=;
 b=neZo89PtRwn2aQE0HH8h0g8zUyC460Uqwf+tf/tW8D3sSo1gmF1s22EvAASVMPBJpZF976uVCVnfAhwh+s4iX329YvlP5vjZFvHBBuKRu1pKUfGlYAI0Yxp8gSRuUJbd8CV2l78P+6ulM+bcEyjieq9JDsvrfZ0EIo9x7VEce58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 DM4PR12MB5214.namprd12.prod.outlook.com (2603:10b6:5:395::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.28; Fri, 3 Feb 2023 19:16:11 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 19:16:11 +0000
Message-ID: <bde8e2fd-d453-545d-859e-d51a44e5f9e7@amd.com>
Date: Fri, 3 Feb 2023 14:16:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com> <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com> <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com> <Y91Y98jyOimabC3O@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y91Y98jyOimabC3O@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::6) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|DM4PR12MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: ce128e1a-49c1-4c68-0850-08db061b1c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPk+HGRCK3xF7Q7ZUMtl3rFdPdYZrOvmUGXRQkdah8BWBS6/M4rutKRUXZv+e71295UAlRwYGsAy/w6CRjkwntpvvWpV8EsHm+JYgLzrmD/LFxXCaGLkFdU+4RYlgv1zQZPdZBGPli9nRfD6vMt1C7UX1TxeEYBeiVwhOgjtx+0J/jPdzVxGYYkg6KaVdXiT7U3KESQQIZQFJym1jyUZ4v+uKTAEvhw45ZT5S5TpJjqfT5ruOOQWoIYu8eFnx6vclRGaa5xxVdvgzmET594dOnjssj1XNHnbvgbZ3a4dq4OUwlBLp4Ry5pPWMbg5hErRqRPdK1oeTMFdTTYjpum0BxX/vJqLIJowOx9fOb/m8so/UWuBtZJOsMuZy0VV8QeiIV/TALop689Pxgq3CBOuNeSlZfVtj58GJS1YJ3BmgMCffZWGj2ucikvEPcVqaOp9WLPJ3Qcao3pEeNuFfueGYrEwt5oi0Icks7rjl6Ii4wAqGAPvS8AsKyXX3BSDR8ko/IMn7eOL4EArNDtahjxMJMFwnKFCcu85DMb4VG/txT+RhE68E3XgY1tY/IkNzJjmJ2gmFDEVW76IGfJfJbvBYYoAie19jRWpJ6jL241aK+8LI6S0hl7IB9g+4vnNzV7tpopyrgYjYC4YsW3ObMQmeYD8CLhp+mrmM7E34L6o6hpsrmoFobQDKHNhDJHiL/02
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199018)(966005)(478600001)(36756003)(2906002)(5660300002)(66946007)(4326008)(6916009)(8676002)(66476007)(41300700001)(38100700002)(54906003)(316002)(6486002)(2616005)(6512007)(26005)(186003)(44832011)(6506007)(53546011)(86362001)(66556008)(6666004)(8936002)(83380400001)(31696002)(31686004)(66899018)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTNWT1hseDhGREZwdEowei9HdmJXYXpjeUtYdDk1aWh2NHkyYUd3U1U2UVB6?=
 =?utf-8?B?VDNkdmtaZDg2ZGhPWVRBaGJBTEw2WjlqSElYN0g4ME1mWlY4eDdNajIyMCtQ?=
 =?utf-8?B?d01UeEZSOTNuZXlVZlhaNmFER0ozajdxcVppeUowWXpQeWk1Vm9STno5N2k2?=
 =?utf-8?B?Wm9hbXB0dEJxVFJWdnp6cXgyc2Y4a0U5andoZkp3UTZjY0Q4KzNUOVh0cTRp?=
 =?utf-8?B?SktBdG9pYzRrRVE3TFVsQ3pSRzRIaGZRRW90Um95eGJIemJnbE5rZldBU1F4?=
 =?utf-8?B?VURTajBsTGlkSTF2SWZTalZqU3MweS9yQWhQcnB5S0FHWVBuZ2xyU3F1dXlU?=
 =?utf-8?B?b3h1VDljUW1nbUp6QUM1OExMZ3FqS00rYW9LUk1ONmZTWU10SWo2cjdVVnBp?=
 =?utf-8?B?akQ4dkZDTGtLWDREbkVIdE8vUUtCTWkzYlV5UENEWURnQWZaemdKTk9FWnZz?=
 =?utf-8?B?eEQrK3ZGakF4U3o1dEV0aG0zV0FIQm8rbklZQmZjWFhnRUdIWW0ycVJsb3Qw?=
 =?utf-8?B?QllLc2QwejFoeXJ2SnpJU0RNNTNYMldVOEpXMnN1eDJlUzd3dmFsYk5Fb1E5?=
 =?utf-8?B?bUNuV3d6alk5T1pRbnB2di9CekJxVWw2QTBPVTNub0szOEJrVnNUcGV3UnU2?=
 =?utf-8?B?Q3UxZ2RWbEpqOC9KN0lhYkVDY2RYNStMSFExc0JzU0trTHhCSFAvbUJJazhm?=
 =?utf-8?B?Nm43U055aDZweHc3YUNhODFaa01iWXEzTWxaVWRvQUFnRGk1WXNhelU0bm9h?=
 =?utf-8?B?OVMxSDBRTWk3YngxQ3hmUW9YQW9uSmJoOTN6U3hXZnI3VjlrTUJLUGZvalhX?=
 =?utf-8?B?V2ZNQXFzUzZhOFRwYjcyNVJIQThLaHJweGxpak9xdU5HbVhUaUdpVGlWMmVu?=
 =?utf-8?B?QXVIWmZWMjhsRTJyM3ZrS204bldDU2JEVDJnYW5SREVxaVlwbk81RFhXbmln?=
 =?utf-8?B?TVRJMit2Z1BRTlFYREVSYkdoajRNQkRpTHFtVEVibUluK2V1ajh1MGVnaEUr?=
 =?utf-8?B?NDY1ZHRFTHc5RFNTd2pUTUM1czhEWUZXTWlnZlU3UTdmUC8zTUd6ajdXQzky?=
 =?utf-8?B?K1pyREx4eFZFQ05jeXFLN2kxK0tvdmQxRDFzQ1lESytBcTJFK2NEdHphdkFD?=
 =?utf-8?B?M2U3WnlJcGxXb2hUWVBoTmpJWE01aCtXUDBQUW9MbzJVQmt3M0tMbVdCalVK?=
 =?utf-8?B?UkxxY3ZXc2tRM1FmR0pMeWlqVE0ySTgwRXYxUlhlbjRLenVjKytMZjE5VFM0?=
 =?utf-8?B?T1ZtWWlJSnFaL0RyTktTT0pJM2xpak85UmJSQXlVdXdBcGFIRTlyMnBrWGlq?=
 =?utf-8?B?SmR1MW4wWjlzMjVweUVNc3hlYWwyK0cvMzNpWFdaYjhnRnJ3anRqSGxaZndP?=
 =?utf-8?B?TlhLeCt0a2xBUm56dUQzTkIzNUJvWlBsMysvR1B4bHZuS2hiQ3VKNHp3bDBu?=
 =?utf-8?B?T1ZLOXZ1TXhuYzVURC9OSkxmQmh0WWVxcDR5Tko5MmoyUTVYS01vSWROOTNU?=
 =?utf-8?B?b3dJbzh1UEpTU1pZRDk5Ulh0Uk53MXRTK25XSWEzamRqTDYyVzdTRElRZzlp?=
 =?utf-8?B?Vzh6TUw5Y2QvNktldGtzK1M1VS8vRXptN0psRGhhQTN4Z0FGZjBMRC9lTWNR?=
 =?utf-8?B?Ym01TGNWRytvbGY0ZGpVeUlobWJjVTJ5R3o5YkoxelZVWTBRQUNWc1NZb1FC?=
 =?utf-8?B?aUhieGJSdmJ5MnVOMEkxV2xCQUhqV1NWWjM2aU8yUTQ3TGNCSWJ3YS85eGRR?=
 =?utf-8?B?Wlk5OTJKeXozcVFDM290T3RpZ2pRVFJLMTV6bkZIWFh1Vml1b1pudk9QVlZG?=
 =?utf-8?B?YUJ3U3BVUU93ZkRSSEJnM2xPenZpRloxaytSWGFrWDEvSVV4bklJMDhlWmI3?=
 =?utf-8?B?VWlFTFAvK3RIUldDTVdVWVlycDFYZWZIUmxKcVBYcXh4MEp2S3hiRk5zb1dD?=
 =?utf-8?B?OGllVWRFS0dXRmtNdkcxZVhWNldxRk1KUmpFaTk1KzlFUWp5VS8zOXF2SDdQ?=
 =?utf-8?B?eVZpSzN4Y3VTeW5HUmhNcnpWNjZUSW52VnkzcnRqUW5uSnpHVlNTa3VlR1ZB?=
 =?utf-8?B?SVA2OVhkcEVWZHpEVitsYjZLR29RVC8wMmZ1eTBPNlNvUEM0Rm1HdVg5YXpX?=
 =?utf-8?Q?ks+4yqYXE9axRbK0OJSleP67m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce128e1a-49c1-4c68-0850-08db061b1c53
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 19:16:11.4019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V16r3oKKqQrj2F2F85adhbmoEbLekB5I8TWh/eunF2ZffTKF/7Pui7xh0lMblNhhtQcLpxNhQzSm/0oz8YWh5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5214
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/23 13:56, Ville Syrjälä wrote:
> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote:
>>
>>
>> On 2/3/23 11:00, Ville Syrjälä wrote:
>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>>>
>>>>
>>>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>>>
>>>>>>
>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>>>
>>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>>> directly feed in correct kind of data).
>>>>>>>
>>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>>
>>>>>>
>>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>>> upstream userspace project that makes use of this property (other than
>>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>>> understand the intent better.
>>>>>
>>>>> The intent was to control the infoframe colorimetry bits,
>>>>> nothing more. No idea what real userspace there was, if any.
>>>>>
>>>>>>
>>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>>> values is the right thing to do.
>>>>>
>>>>> Only userspace knows what kind of data it's stuffing into
>>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>>> generate them.
>>>>>
>>>>
>>>> Yes, but userspace doesn't control or know whether we drive
>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>>> is currently no way for userspace to know that and I don't
>>>> think it makes sense.
>>>
>>> People want that control as well for whatever reason. We've
>>> been asked to allow YCbCr 4:4:4 output many times.
>>>
>>> The automagic 4:2:0 fallback I think is rather fundementally
>>> incompatible with fancy color management. How would we even
>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>>> that stuff is just always BT.709 limited range, no questions
>>> asked.
>>>
>>
>> We use what we're telling the display, i.e., the value in the
>> colorspace property. That way we know whether to use a BT.2020
>> or BT.709 matrix.
> 
> And given how these things have gone in the past I think
> that is likey to bite someone at in the future. Also not
> what this property was meant to do nor does on any other
> driver AFAIK.
> 

It has implementations in other drivers but I have yet to
see anyone using it. Without that it does nothing, unless
there are proprietary userspace pieces that make use of this.

>> I don't see how it's fundamentally incompatible with fancy
>> color management stuff.
>>
>> If we start forbidding drivers from falling back to YCbCr
>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
>> amdgpu and will see bug reports.
> 
> The compositors could deal with that if/when they start doing
> the full color management stuff. The current stuff only really
> works when the kernel is allowed to do whatever it wants.
> 

The compositor could deal with it but this feels like the
compositor taking over things that should really be in the
hands of a display driver.

>>
>>> So I think if userspace wants real color management it's
>>> going to have to set up the whole pipeline. And for that
>>> we need at least one new property to control the RGB->YCbCr
>>> conversion (or to explicitly avoid it).
>>>
>>> And given that the proposed patch just swept all the
>>> non-BT.2020 issues under the rug makes me think no
>>> one has actually come up with any kind of consistent
>>> plan for anything else really.
>>>
>>
>> Does anyone actually use the non-BT.2020 colorspace stuff?
> 
> No idea if anyone is using any of it. It's a bit hard to do
> right now outside the full passthrough case since we have no
> properties to control how the hardware will convert stuff.
> 
> Anyways, sounds like what you're basically proposing is
> getting rid of this property and starting from scratch.
> 

Maybe that's the right approach.

My initial idea was to tag along an existing property but
that turns out to be challenging when that existing property
doesn't even have a userspace implementation. IMO the existing
colorspace property shouldn't be a user-space controllable
property. I'll have to take a closer look at the
hdr_static_metadata to understand whether we might run into
similar issues with it.

The alternative is adding a new property to let userspace pick
the encoding and the min bpc value but that conflicts with the
expectation for a driver to always pick an encoding to satisfy
the bandwidth requirements for the mode on the wire [1].

In this scenario userspace would need to take full ownership of
the wire encoding and live with the consequences. If the bandwidth
is not sufficient a driver would then need to reject the commit
without having a mechanism to tell userspace the reason why.
The driver understands the bandwidth requirements but there is
currently no way for userspace to do so, in particular for
MST/USB-C/USB4/Thunderbold scenarios.

[1] https://lists.freedesktop.org/archives/amd-gfx/2022-December/087423.html

I don't think giving userspace full control of the encoding
buys us anything other than headaches.

Harry
