Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8E68A209
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0548C10E025;
	Fri,  3 Feb 2023 18:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6B210E025;
 Fri,  3 Feb 2023 18:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2rNx8a7bNpyYsX9jM7gYIM5vyc4ISuvCBPSDPQzdxPGvzAvUQ4Drkhm3KaapO2dKXHRlFhXQvjgPVRqq05OA0A1RkV2GkDEoLt40FDa4dSCWySpwmU1Wt4uxDOhT4QpKMdp/FIyACU0PD1913of7j4JLsylybTVE5u32KSHFdNG2FKkSWsdFFygZnAaYNvVJS+r6q/SzTmwPvjp5jezP4B/hTeFGTEi4W6PlQLL4WsPROzwFcl0nVuhDzDHx9VG/+hzCVsvb7kz/dw75M+PSX4WU0dGKV5grzenkmdxV7t2QGSbcabAAPwy/lGK51ZJWfE/joSk7Nf33+lacp0RPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0zXJP62l71w7TMYRjJ3IMuGAGrgTRu+ZgeUISnw9SU=;
 b=RogUGMR06jn8iTInxPjzoN/5o0aoXhF1Z8HCxbEz8cs658qYdFBVVuZ8OyXX1MO6elUI6gGv/7HQybqXcSOvenp+ik3pRnh/RGeVK/PeBJIPQi8KclKxzRzuu6sf1zh4ZA2LANY8ZFVZOCQwoPr6eA+lxGUQ2j5Qt4eTdxWhMLWahUFacziKI6uSda27Oiqke0F3m5V5cZRuaGMb/G95alogeoly4V37uiuedw+eLlKe8vyP1n+Af0orZe1fgFBW7F8RRhgiV4x6SNRdlkYlN04x4eJAns/OTT5FKZgq+8UfNpFwiLlIXUEkgqv3N4AHKyxjunyoWw7VzFo/9ZFX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0zXJP62l71w7TMYRjJ3IMuGAGrgTRu+ZgeUISnw9SU=;
 b=seiJJetr/XAKAyPJ/4q2vus4GalL6fNOGJ+4hZxumjeqBVBCKb5BYY4TDThZ2BNxMZfNv/dSnGChoI548nEVwzxX/CBeSoOIBUlX9+dmUOe+NucpeVAthD2KVeEeu5qnXBVhbvZZGrUzmDllkglNcbzxvM9nvAD/zA8Hf/mby/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 DM8PR12MB5415.namprd12.prod.outlook.com (2603:10b6:8:25::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.27; Fri, 3 Feb 2023 18:28:23 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 18:28:23 +0000
Message-ID: <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com>
Date: Fri, 3 Feb 2023 13:28:20 -0500
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
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y90vrEa3/1RbaGOV@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::26) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|DM8PR12MB5415:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b0c2c8-550d-4b96-b5f8-08db06146f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJqOxNQpfd1A8vZd58uZarXRgZO6S33Hrj+TUxjzI+orfuGmt/qmXwQKTLUX84WxtCnhsDdxdZRBZrw8iUfjHLpq1ehrGaVW5QLg9Yn1DkFWmfbk25AjiipqwJnnEz1A5NXMEGbiJX4lMYESmoD9q2BnFOKzVogWfthsJHLU+oqfG1ihsHBcivG53Vf3a/pu2iU6mXa1csbPkHNRmLTz2wHOTePZcxhkVfFQaQm+HcAueLCZqt18HDiEoOmRpwsXGSZjmU/mOT1d968ZZXpRgK2v95gJ5KHCyMgP5tXhptSkE/ZjRfMAHPHHCLu9LgcDAk/H3R7SyGv0gYfdPgZv1OMOiCpQhWVPd25psr8mDYoVtdaIN+ms/p2BF/8R/qg5Z/3DCwGMAgfczrUpT2ZpMVPL5zfRNyGCkPPTTWp7MGNggFih8Zewns/+DcC91p0S6Wz+xvHxMhqto4uikUYjoa0Mh+b4p7n5pVxTgW44Ps59YKCVF4eF36aJqVUe1+HY6EgDjbu0uPucQvSu2vdv9KvptjyfftdvMnz4RlWsTnKm+f+ToPKfxAU7qjoDu6buypWyhTNYcBfgwodLIZ0cW9cE58lnQNp6sMvkBxFo+esROr1xMY77xltQ5CCdbuKsTR6XZxFaVO5aDq9ra6CdOUvFCz3nYyCfeu8uQHzcyWHxRmaUuAx6S5kWFRF6Iaplvn4jHEw+FSJ5nHBhihUGqHkNQKYNHeQDrfsADMC7U80=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199018)(31696002)(38100700002)(86362001)(36756003)(8676002)(66946007)(66476007)(66556008)(6916009)(6486002)(44832011)(54906003)(316002)(8936002)(4326008)(5660300002)(478600001)(41300700001)(2906002)(6506007)(26005)(6512007)(53546011)(83380400001)(2616005)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDBQeVZYNTg3TGhJZnI3WUorMWNMQWtCQXFMdmhmQkxNd052NGpqMkdKVHpQ?=
 =?utf-8?B?cWkzV1dsRlNTZ0MxZkVhWFFZY2JGUTYwTTZvNHAvNldjem9NOEhZMU9UU2Zz?=
 =?utf-8?B?RzZ6ckRXUm5QYWhLUjhaQmh0VzlaUEg1VXc0WXIwd29FeDNudVhsYmJGdlkz?=
 =?utf-8?B?VCt2RXlMZGxwWHNCaUhOdWRWam85Uy9seG0zTGVPL094SmtxdWNOSWdxSENN?=
 =?utf-8?B?dGgxemhnOG1zT3cyajZ5aEY5aElkYXF2ZERLck1td2E0RnVWTU4zR2RRUXY1?=
 =?utf-8?B?eldYdzhCKzJ4RHg0aWVBWWlpd3hiRk1kanFCWWdDZEJPU2NmSmNNWExoek41?=
 =?utf-8?B?c0R2Umh3OERvNy9rYkt5KzNmRGpRRHpwMThiSEdNc0NHU0hGTEEwcVA5S09U?=
 =?utf-8?B?d29IOHlOdW10SGpMNnN0ZW1LRnYxS2NlYlplZ3JqN1MvU25wZGowVVFHYW9N?=
 =?utf-8?B?L2lDbGVYdmpzTDlrNFN4SXFTZGF6Y3YrcFZYUm5GbGxCZWc3YnV3QzlQVjhh?=
 =?utf-8?B?WDRzRkhQVTlqK3RhOFNRVm9wSGkybEd3SEtVOXVPNE84OHBnc2VvbGd4SEhD?=
 =?utf-8?B?c2hHeW9nZENkRUlNc3lNeUdCTDVieStkbkE4U2lCaU5mWkg2NEVzNlhseWVr?=
 =?utf-8?B?MWZNamVNN1ZZbFdQMkNqazFYL055b2JXc1h0RkVTbE82SkJVUnNsODM5S0tZ?=
 =?utf-8?B?a1dmY0dUYVdUWnV0NitpZnREeUhjM2dXeVFZM05MbDFKTmQ2UGpEUGtVayts?=
 =?utf-8?B?V25Ha1A0K3dUS1kvVXZVM0J4RlkzZzRhN212Z2lPUFJ1NUJjcEhKVGxTQ0k4?=
 =?utf-8?B?SmdXbFo1ZGx2aHVUVDZ2a0F1T21kdEpNWTRCN2ZxSkUyTkdVcXdjV0FyVm90?=
 =?utf-8?B?TVpUSDh3ZlJ3MEp1MGQ0dWxZWm9kOWQwazBSTytGRXJaUEE2YWxENFlDSWJB?=
 =?utf-8?B?dENEQ0FVRXFTVWU1bmszNjZndHZ2S1dWME5QSnBMWlFyWXI1cysvWlNKKzlY?=
 =?utf-8?B?STZ1TU5ERTJxRVZUNjFESjNUSXJHNDB0MTFjRURhZEE2dmpTVzhtN2phNWtt?=
 =?utf-8?B?Sk1QYjdJM2ZrVVJ5NndYQlVody9wQ081SHhYTTVVSHhEa0JGU1IvNythWnpN?=
 =?utf-8?B?eTJxcDdBM24wbW9CajdocW5KVUZ0MjlIcjNmbzNoUVVXejNSVEVxdUVxTk1Z?=
 =?utf-8?B?dU9zVEhIaXo4SDRYYWRDQ3ZvVURaUWFhSyt4RkY2YkUwM25GTXI1bndURjgv?=
 =?utf-8?B?MGFIaE5ZR0VHb1NRL2ZCVkt4ZHUxQWJCMkpSMDNRRFF4Wm0ybEtXcmc4RkdU?=
 =?utf-8?B?RktSNFVCUURZY09DUy8rTVliTER0VVlTeFVrWUdrOEI3UVBuRHZXampRR3Zx?=
 =?utf-8?B?VzA3ODF0QlJQa2FxUDl4QzRYUkp5T2ZBejkyQ3l6UFNyaGpFb2F5M0lBUDho?=
 =?utf-8?B?ZHBmdUk0RHJ2emg5R1hoTWVUSFVwMklGTXBOMkI1RHlpSmIrOVpoaElTVEln?=
 =?utf-8?B?VTZuckd0aGpxbXNscDdGVFpiSm5sZ1Vhanhpb1ZRLzZSbGpoNmVIV0tYWUZ0?=
 =?utf-8?B?blorWVFRZzY4OUVYR05pbkZiTFZseXNnczVpbHNVQ0p3UGRxSjJHSCtJSU9j?=
 =?utf-8?B?WklJM3h2S1crcXBYT2dXaHZhVGlLN2YveDZmdlBEMVpZQkw1ZHFhZngrSGwr?=
 =?utf-8?B?QjZWYUd1elg1YWF0M0Z5V29BdWVScVl6NXZUbTZsT29wWG5Fb2x1ZEoyNUc2?=
 =?utf-8?B?Q0hhSzZ3ZXpER1NUNDg1WTJQZDlYUGh6T3paUEFzb3Nxa1Y4UUh6bDR6eG1j?=
 =?utf-8?B?VTkzakR2SkVQVnB3aDhLRTUyb3FSeHhRdWdyYzFOVlR0TGNsZ1RUMko2elRq?=
 =?utf-8?B?RHVvbkh1NkZ1YmVSeE1kUnBPcStROW9JSXpxQldTL2NIbGgvVytndlI3ZGQz?=
 =?utf-8?B?bTV1NlFMcjhlcjcrSWFDRWIwN2lCMDBNcE5qUS96RHBVVVlRZ0NSUHdHa1dw?=
 =?utf-8?B?R1ZMZUxMOFI3dzhKa2Q5WDlVODFCd1VrL1hxdnQrWkkzemcyeTErSnhIcEJD?=
 =?utf-8?B?UW5Cb2lrZVVaMmNvRVFvUUNoNDJwSVRidHdlcXRvQkVwei9IZEFKS2V0a0lM?=
 =?utf-8?Q?94rrDAhm5cH61+O2tA4bY0VLJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b0c2c8-550d-4b96-b5f8-08db06146f0b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 18:28:23.6770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21rwEw1eFsGRYGPPy2HXFBNG1P9n30k0aMPo/9yQVgg7lMsdAzAOWDtbkJbaqCdZDHYah6GW7YR4FXsrtEC1Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5415
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



On 2/3/23 11:00, Ville Syrjälä wrote:
> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>
>>
>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>
>>>>
>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>
>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>
>>>>>> That applies to a lot of the other values as well (they are
>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>> directly feed in correct kind of data).
>>>>>
>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>> then the kernel always knows which pixel encoding is selected and
>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>> want to control the variant explicitly to the wrong value?
>>>>>
>>>>
>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>> upstream userspace project that makes use of this property (other than
>>>> what Joshua is working on in gamescope right now)? That would help us
>>>> understand the intent better.
>>>
>>> The intent was to control the infoframe colorimetry bits,
>>> nothing more. No idea what real userspace there was, if any.
>>>
>>>>
>>>> I don't think giving userspace explicit control over the exact infoframe
>>>> values is the right thing to do.
>>>
>>> Only userspace knows what kind of data it's stuffing into
>>> the pixels (and/or how it configures the csc units/etc.) to
>>> generate them.
>>>
>>
>> Yes, but userspace doesn't control or know whether we drive
>> RGB or YCbCr on the wire. In fact, in some cases our driver
>> needs to fallback to YCbCr420 for bandwidth reasons. There
>> is currently no way for userspace to know that and I don't
>> think it makes sense.
> 
> People want that control as well for whatever reason. We've
> been asked to allow YCbCr 4:4:4 output many times.
> 
> The automagic 4:2:0 fallback I think is rather fundementally
> incompatible with fancy color management. How would we even
> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
> that stuff is just always BT.709 limited range, no questions
> asked.
> 

We use what we're telling the display, i.e., the value in the
colorspace property. That way we know whether to use a BT.2020
or BT.709 matrix.

I don't see how it's fundamentally incompatible with fancy
color management stuff.

If we start forbidding drivers from falling back to YCbCr
(whether 4:4:4 or 4:2:0) we will break existing behavior on
amdgpu and will see bug reports.

> So I think if userspace wants real color management it's
> going to have to set up the whole pipeline. And for that
> we need at least one new property to control the RGB->YCbCr
> conversion (or to explicitly avoid it).
> 
> And given that the proposed patch just swept all the
> non-BT.2020 issues under the rug makes me think no
> one has actually come up with any kind of consistent
> plan for anything else really.
> 

Does anyone actually use the non-BT.2020 colorspace stuff?

Harry

>>
>> Userspace needs full control of framebuffer pixel formats,
>> as well as control over DEGAMMA, GAMMA, CTM color operations.
>> It also needs to be able to select whether to drive the panel
>> as sRGB or BT.2020/PQ but it doesn't make sense for it to
>> control the pixel encoding on the wire (RGB vs YCbCr).
>>
>>> I really don't want a repeat of the disaster of the
>>> 'Broadcast RGB' which has coupled together the infoframe 
>>> and automagic conversion stuff. And I think this one would
>>> be about 100x worse given this property has something
>>> to do with actual colorspaces as well.
>>>  
>>
>> I'm unaware of this disaster. Could you elaborate?
> 
> The property now controls both the infoframe stuff (and
> whatever super vague stuff DP has for it in MSA) and 
> full->limited range compression in the display pipeline. 
> And as a result  there is no way to eg. allow already 
> limited range input, which is what some people wanted.
> 
> And naturally it's all made a lot more terrible by all
> the displays that fail to implement the spec correctly,
> but that's another topic.
> 

