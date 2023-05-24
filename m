Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0145670FEC0
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A86110E605;
	Wed, 24 May 2023 19:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424EB10E605;
 Wed, 24 May 2023 19:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkMLXh4lyhevFjp5IqEZmbZ2pnuWfKUr0p49B+YVTtADK7bQkEcoHcK8HxmB2UCj/jN7fIu7eKdpiHTzA8Ym8Ti79w36wi8pOP49UkYWMEMbr1IO86hQF+1p/RpPQ06D0Vf196HZ+kXhMiHaRFUXkt1HazFnpiDxM3heDFbXOYvmJ4zXtK7WRv88wIjR4caVYYObtnRewQ8Zz2TkPUTrsY4VHsehPPxhf1HxonBLWD7B8J9ZfAbmEyBwy9ZIJsXzLtnzzvsH0eXbBi2oDEdEIgg2v/jOzvQ9pVeFijR4bnfaH9kNuBtrRtQf5TYsPsHuQXJjInZnA+7177RuwILtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSvMBBOe1KHIFEtidChFdCX0fCGge+H/p1sHCqnDNQ8=;
 b=jaLmlYFdJahepNoJSOMnZ6gy7HkHgr6zMLO6DR4vvWMlLs785LFaeA9aH4/jPpIPHH/Xcgth+wKAmJul0ETEFiYDgIUraj3SfGkT5W7/SpR+wnLsoSb7s9kZUpK/f9KQv7dI/aXP/OvsxLnX/6bj2ZYH1qBZ8ufw4KZffdgW2v1UFeVY0OoVQdCs0AOzJaan/WHICuhataWkq6Z1uFy/9lUftnTwabAQlFci28bwv/tXr5vRcpzWlgATFipoEEnXZ6TWB0b3ekhHtK1nlR9bCE/UM89v6TqJCOTtWpXydGL5jz24V4Cw7Mq51IMMpYsvlxj9s/2ciTGbxUUHK0NTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSvMBBOe1KHIFEtidChFdCX0fCGge+H/p1sHCqnDNQ8=;
 b=JQt95TqpHwjeOa1E5rh8nhln+BCMwaUDHESPaoFd5juWsBsAJAQas2oBlH5V+URNopfBbf3yk1PtH06kuvGUp+78hCYzOwZ8pT5mWme/VqoSjy5IM6QAXzFgvj3/UFJl39Du4xFMXY2v6RAwySdM63HkSBQGEdnyVvgVcoadc+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 19:51:47 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 19:51:47 +0000
Message-ID: <32c98a85-7ddb-d2ff-0322-c26c4ea36461@amd.com>
Date: Wed, 24 May 2023 15:51:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
 <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com> <20230317105335.45d6a629@eldfell>
 <ZBRiIG+TEft19Kum@intel.com> <20230317153553.5b8eb460@eldfell>
 <5381034e-c621-628e-d1e8-ace7ed410166@froggi.es>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <5381034e-c621-628e-d1e8-ace7ed410166@froggi.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH2PR12MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b9c8d3-4898-482a-c6c0-08db5c904ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hqq0eLP6tQLIbSoHBtJigNestgAMV/b2afJcO3yXSAMIrWCV/ctcICo7N/3DPiA6l0FbSJP3dGVq8hZA9B7T1pvJEkCDLfdewgUY1AnGl/cmvxTGhaPziZ1Fw6gonye+PjLMMDpskExb3arCtFU6Mwl0TN1gh1Poeve22bIe2RZHSB7cmt3eInW3GSC+FeDabNwTI5/w3+J9sKxNuHalcRcihtNBk2Mutu8KEvSuoovGubOFFxeFIODSfKJPzdYZ+d4Pk9wyzLTA3qCEGmAoaeFLAE9befS8kSbo5V7tyynCi6MXBCdK8+aSQFi8vfP/+6+3Y7pwOLPjDqswbrlwhYsBoHsEBYsv2IKfJVLUGAi5hsYu2ULO71/2wyHD6mbTXa+5lTWq8Tg2GHi9W8U9zoCbLHSpEJtHUelKkw8gMPd77At13Fio+5NUdqtS5HA1LRtnrmLyyFF6hEB1B+T3unrWM/ZmEpXMUQZo1sXmugFxKm/BK8tVA55G5UZxD0RV881SG5DJoTVpHovu64eTxA0AVHZUlzzImH2aQTTa7m1NpjsxzP9TeIVQY7j8RC2uct8mmFKfiWEmCzd125/fvDgeMOOg6OkgTO4StkVOhPYGVeIuTOM3DsS07wn0LPiCxoOobEFLWwi8YULQlvkJCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199021)(66946007)(316002)(66556008)(86362001)(66476007)(4326008)(478600001)(31686004)(31696002)(110136005)(8676002)(8936002)(6486002)(41300700001)(6666004)(5660300002)(38100700002)(44832011)(36756003)(6506007)(6512007)(26005)(83380400001)(53546011)(66574015)(186003)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTlnTlZLSGZ4bk8xRFpiTGg2amQyYlNrbjBKb2VlSFlyVHFtWFd2U1UrM0JS?=
 =?utf-8?B?R203VUpXTXZHbkhwdDAvU0h5OWdXTGdRUjdsa3ByTk1idFdGczdyMVRGRTM5?=
 =?utf-8?B?ZUdOUWZPL2h1dG1JZW96Q3R6anBkNHdhdkFBV3l0RFZQMEpJTHdsR3ZOczUw?=
 =?utf-8?B?dC9LSkp0eTR5R3J0cC9DdDJkbkprWVdMemNwcUFMaFYrTytyMENiV1B6bnFo?=
 =?utf-8?B?RUYvWCthOGE2WFBhNzRBN21BKzZNTDZKRFFvL0MyZThuVFJuZ0xlTGRzY0lx?=
 =?utf-8?B?NkJaK0VocHQwNTl4Y0d6ZDZqK0FleHFlaitsdXoyK0N0VHpUY1cvKzQ0bkNQ?=
 =?utf-8?B?ZlR5VkVNVkUrUUJHSjJsY004T1RXamd0WVZBdlUvVlBZOEF3T2MwSGZtSUI3?=
 =?utf-8?B?YzdnSjc5ek9XUVBzRFJNeEVTQTJtTjdyODFCaVhWVnBOcjVvUVFaanhucmx0?=
 =?utf-8?B?WEFSdUpiQ3ZSbjhSRVNGWk5JQ05mbjhVbnJJV2RVVUYwV3lwbUxMWXBMMmc3?=
 =?utf-8?B?OG5vWmRyUjlSQURuSmtTcVRpOW5VUzlXNElSa3lISlNld09BSEJxMXcyK2lO?=
 =?utf-8?B?cmFmTEhlMlJ3SlZDZXl4UE9YRjI0VFRreFRzZnNkYkwzUEdsbldrMUY5TlFT?=
 =?utf-8?B?YWlDTVZFaXZtekExanRldmYwck9majU3cWRVOUl4R3F3K245bjZkaDFxcDIz?=
 =?utf-8?B?VFJBNEpBZDhrN2VhOEFRaElLM1VPemZXeVZJQW1NcFhJbjVjYlZJYm1TTUVH?=
 =?utf-8?B?UDdzY3NXa3lZTHJiOEVtYXpUdWxUbmtkNHUyZEZCVGlCOElSTld0R3EwSE9V?=
 =?utf-8?B?citRMU92dUhud05xckh2RXljcm5TRWRaS0w4TTlsbWQvaDYzOGE4dTVlV0Yr?=
 =?utf-8?B?NGhrTms3TDdoa2x5Vkc1SXE5b25iWEtMOXpqMkRUa1d1VHFUUEJ4WEJlQnBN?=
 =?utf-8?B?N0lNUTlSUHhrNVJKM2t4SlVJaStmYlg1aUxXaGhMdmFJR1NSSmpzQklDQXli?=
 =?utf-8?B?d0ErSkFyYnQvYngxdVR3MGhrVnZtS01DMXBKMWlETVhzR1NxdmdrVkV6ZUxl?=
 =?utf-8?B?M09YWDhseTdmeklMQnU4WU5MaE5JeThyZStSZ0lYdVFBdE56ZThDK3VlQ0x2?=
 =?utf-8?B?Y0drbnFZVWdYZm16WjJrSlUxNmRnTTNFdFE3WDQxNEFrc0NnSitZdGxDSjNW?=
 =?utf-8?B?b1dBQXVGODNDSkJtOTZndHNTRHdvbWFHZEg1WXRtemRJTzFZWEx3TVpRL3JG?=
 =?utf-8?B?b1JNOGJoeS9CVk1JZXRscCtMZ1JxTkM3dlhqNzBwNTRQNFFKSFI5RzZ5dHZm?=
 =?utf-8?B?RU1UUzJSeU5WeFVjOXpsNCtYbXh6Zm41UmdyVDNIMXBXNXZqcGRFNmI2eVpx?=
 =?utf-8?B?cnNBQ2RRN2NXbzFjT3pKUXpFeHpuWEJrRjMwUm9XbnZ0QSt1S0xNNmo5anFn?=
 =?utf-8?B?RCtRcFJmb0ViQXlXTjQ1cnB6NWlvR3g3TVlpc0lOb1BqRUVWazQzWnIrdnlS?=
 =?utf-8?B?alpkYlc3dEJ4SWVMaFVTU0dMR1UveDVZeDAxZmNmd0VDQnZYcW5na0lQM0tH?=
 =?utf-8?B?WFpjRVdGUmkxbGNLWHVtRDk3ODFxbkZBNHZvR2RVR1lnZG5iMEkwMmJWeGY1?=
 =?utf-8?B?QjR4MTNqTDQ0aTJtbDBidUdwdVpkamFCRTN2T3lkdlc5TTN5eUJ0ZHE1TFli?=
 =?utf-8?B?cmtLSFgxcU5jQWJnNEhycFlsREtiNEtVNDU5UnJnYVlBcU9wV05GMm5xRDJu?=
 =?utf-8?B?YmlteDhKT3QzNFZXNnN3TS9YaU1KeWxwTDc2RmI3NjJRRzIrdUo0VDlWT0JP?=
 =?utf-8?B?SEh1ZDlJRC8weXBIaUI0RDBCckgzbFd2b3E0eDJSZFI2Vm4wZzNiN2FRWitj?=
 =?utf-8?B?Y3E5UWpTeGFEcHY1WE50SWgxWWMvaGFIZWY1dDMwM0lIUHRPYzFvRE5DcHZN?=
 =?utf-8?B?MDBNSFlRUklUVzRYenFxamNWZHQ3RFI4VzM5OUZzMEZVdmY4eDBoZnE1QlJa?=
 =?utf-8?B?UmhXUjV6RU1JVTlqbndJdUZBOVFGdGE2ZG9MT1dUME1TTE1yWGdPa3lqVXRz?=
 =?utf-8?B?cmUzK0NSVXJ5TGczM0JqOXBtejVmK3kwWGlBRlZ0V1VYNHp4OVdJbi9JY3Zj?=
 =?utf-8?Q?9Cz1UZ7JlUh9Ov59xddfoyRnv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b9c8d3-4898-482a-c6c0-08db5c904ea5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:51:46.9142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMrGyk2NmcKdtAd0A47Mh7Cccf9wZ5mQPVaJmLo2Xpf5XVN/1CaDERFtk4qCmJQhF5Trs0nOcqI4uL/NwWRmjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/17/23 09:53, Joshua Ashton wrote:
> 
> 
> On 3/17/23 13:35, Pekka Paalanen wrote:
>> On Fri, 17 Mar 2023 14:50:40 +0200
>> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>
>>> On Fri, Mar 17, 2023 at 10:53:35AM +0200, Pekka Paalanen wrote:
>>>> On Fri, 17 Mar 2023 01:01:38 +0200
>>>> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>>>   
>>>>> On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrote:
>>>>>> On Thu, Mar 16, 2023 at 1:35 PM Ville Syrjälä
>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>
>>>>>>> On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrote:
>>>>>>>> On Thu, 16 Mar 2023 12:47:51 +0200
>>>>>>>> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>    
>>>>>>>>> On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote:
>>>>>>>>>> On Thu, 16 Mar 2023 11:50:27 +0200
>>>>>>>>>> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>>>    
>>>>>>>>>>> On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote:
>>>>>>>>>>>> On Tue, Mar 7, 2023 at 4:12 PM Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> We want compositors to be able to set the output
>>>>>>>>>>>>> colorspace on DP and HDMI outputs, based on the
>>>>>>>>>>>>> caps reported from the receiver via EDID.
>>>>>>>>>>>>
>>>>>>>>>>>> About that... The documentation says that user space has to check the
>>>>>>>>>>>> EDID for what the sink actually supports. So whatever is in
>>>>>>>>>>>> supported_colorspaces is just what the driver/hardware is able to set
>>>>>>>>>>>> but doesn't actually indicate that the sink supports it.
>>>>>>>>>>>>
>>>>>>>>>>>> So the only way to enable bt2020 is by checking if the sink supports
>>>>>>>>>>>> both RGB and YUV variants because both could be used by the driver.
>>>>>>>>>>>> Not great at all. Something to remember for the new property.
>>>>>>>>>>>
>>>>>>>>>>> Hmm. I wonder if that's even legal... Looks like maybe it
>>>>>>>>>>> is since I can't immediately spot anything in CTA-861 to
>>>>>>>>>>> forbid it :/
>>>>>>>>>>
>>>>>>>>>> Wouldn't the driver do the same EDID check before choosing whether it
>>>>>>>>>> uses RGB or YCbCr signalling?
>>>>>>>>>
>>>>>>>>> I suppose it could. The modeset would then fail, which is perhaps
>>>>>>>>
>>>>>>>> Could? What are they missing?
>>>>>>>
>>>>>>> The fact that the new property that also affects the rgb->ycbcr matrix
>>>>>>> doesn't even exist?
>>>>>>
>>>>>> I think the question was about the current Colorspace property.
>>>>
>>>> Yes.
>>>>
>>>> We need to be able to set ColourPrimaries infoframe field for the sink.
>>>> Only userspace knows what ColourPrimaries it uses, and the driver has
>>>> no need to care at all, other than tell the sink what we have.
>>>>
>>>> When a driver chooses to use YCbCr, it needs to use the
>>>> MatrixCoefficients the sink expects.
>>>>
>>>> If we send the infoframe to the sink telling the signal uses BT.2020
>>>> ColourPrimaries, does that same bit pattern also tell the sink we are
>>>> using the BT.2020 NCL MatrixCoefficients if the driver chooses YCbCr?
>>>>
>>>> Do drivers actually use BT.2020 NCL MatrixCoefficients in that case?
>>>
>>> No. I think I've repeated this same line a thousand times already:
>>> The current colorspace property *only* affects the infoframe/msa/sdp,
>>> nothing else.
> 
> No, sorry, this is completely nonsensical.
> 
> Even with the current Colorspace property that we want to deprecate, drivers doing an implicit conversion from RGB -> to YCC should respect the colorspace property to pick the right matrix coefficients here.
> 
> Doing so simply introduces a useless mismatch that is unavoidable from userspace and makes absolutely no sense.
> 
> Arguing about this is kind of completely useless anyway... as we are deprecating this property... Let's pleeeease let it die.
> 
> I am not sure why these patches were re-submitted with my RB again after we had the discussion previously about making a new one that's actually going to get tested and have userspace consumers.
> 

Apologies for that. I must've mis-read thins. Dropping them from the
next version of this set.

Based on the hackfest discussions I'll iterate on this with the hopes
to unblock the Colorspace property on AMD HW. A more thorough API will
require more work and rushing it would be unwise. In the meantime we
do really need something on AMD HW.

Harry

> (FTR, I guess Gamescope *is* a userspace consumer for this broken property right now, but I am completely happy for AMDGPU upstream to never support this and to just move onto the new property and leave this one behind).
> 
>>
>> That's the problem. I don't know what that means.
>>
>> Does it mean that the sink expects BT.2020 NCL MatrixCoefficients to
>> have been used?
> 
> Yes.
> 
>>
>> And the driver will never use BT.2020 NCL MatrixCoefficients in any
>> circumstances?
> 
> That is what Ville is describing and what I disagree with, yes.
> 
> But whether or not Ville or I agree on that is kind of irrelevant as we are going to deprecate the property... right... right?
> 
>>
>> See the conflict? The sink will be decoding the signal incorrectly,
>> because we are encoding it with the wrong MatrixCoefficients if the
>> driver happens to silently choose YCbCr and userspace wants to send
>> BT2020 ColourPrimaries indicated in the infoframe.
> 
> Yeah.
> 
> - Joshie 🐸✨
> 
>>
>>>
>>>>
>>>> If they don't, then YCbCr BT.2020 has never worked, which is another
>>>> nail in the coffin for "Colorspace" property.
>>>
>>> That is the same nail we've been talking about all along I thought.
>>>
>>>> But it still means that
>>>> RGB BT.2020 may have worked correctly, and then drivers would regress
>>>> if they started picking YCbCr for any reason where they previously used
>>>> RGB.
>>>
>>> The policy has been to use RGB if at all possible. Only falling back
>>> to YCbCr 4:2:0 if absolutely necessary (eg. EDID says 4:2:0 must
>>> be used, or there's not enough bandwidth for 4:4:4, etc.). If the
>>> behaviour suddenly changes then it probably means the driver was
>>> doing something illegal before by using RGB 4:4:4.
>>
>> Ok.
>>
>>>>>>>>
>>>>>>>> I mean, drivers are already automatically choosing between RGB and YCbCr
>>>>>>>> signalling based on e.g. available bandwidth. Surely they already will
>>>>>>>> not attempt to send a signal format to a monitor that does not say it
>>>>>>>> supports that?
>>>>>>
>>>>>> That's exactly what they do. The drivers don't check the EDID for the
>>>>>> colorimetry the sink supports and the responsibility is punted off to
>>>>>> user space.
>>>>
>>>> I suspect there are two different things:
>>>>
>>>> - which of RGB, YCbCr 4:4:4, YCbCr 4:2:0 can the sink take
>>>> - the supported MatrixCoefficients for each of the YCbCr
>>>>
>>>> Surely drivers are already checking the former point?
>>>
>>> Yes.
>>>
>>>>
>>>> I'm not surprised if they are not checking the latter point, but they
>>>> do need to, because it is the driver making the choice between RGB and
>>>> some YCbCr.
>>>
>>> This point has been irrelevant since we always select BT.709
>>> and there is no optional feature bit in EDID to check for that.
>>> Presumaly it is mandatory for sinks to support both BT.601 and
>>> BT.709 whenever they support YCbCr in general.
>>
>> Ok, so BT.601 and BT.709 MatrixCoefficients are cool. How do you tell
>> the sink which one you used, btw?
>>
>> What about BT.2020 MatrixCoefficients?
>>
>>
>> Thanks,
>> pq

