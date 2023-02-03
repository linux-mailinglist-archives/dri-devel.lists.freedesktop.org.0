Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01A68A313
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 20:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B7810E8B8;
	Fri,  3 Feb 2023 19:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547310E8B8;
 Fri,  3 Feb 2023 19:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFTi7PWEtHmrEM5Fh/lyGo6uwFR5mxf3dNNptOBmKDGvVN3zL4MN7FPjYvTzB/fbkjtse81ambAQNQatI1ZhyMMS9ZE7HQyrCTlFJgeaBuWAVjsYywm1tbJAfAJ2J4GdrXHXwH64GzDAqumfPXXwQoMN64cMWZZqdA3W3z0dBpc/ghefvuiAKGIcjycUfynB3kxZtC7QAUZsQh1nnJWXvxbGeArV4ZruDMNPXVdYWqjxkKYHCS3n2eFXUDhPSnxp28xO8c/gOn3rP9wncHygSOJNpNyWfRjvETPO/K493eTcpi8CcDUEYbdTk+3mmifBRwJBd+XXzFqhmlPnTAq+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4GHb4USLwxTPSB/7O9Jxo9MTNq7Ubg4KP+6/3uojzg=;
 b=oSKhC8/FEBWBbDDGfc6KlWyQUJAUCGOxjqVmonNljMvGQUNZQZVCZkZT8qANrJQ8fZ09BtOizhNmRZ+ae4l5EzHi68nAlrifGzI/FLydWp8Hox/I6r4+GYg9qqE7mnHWMIArvdx1Wz77GVCFwOTgwCPAZbIu90bvKd05tpAL5IebVwRb2tzdKXfppLauIvvssxQlOIn5x72HUKZx850Q5/TJXbltIcktnoqoLuJQxwQduyS5QlJUF1polzYbqaHg2Vw2a3opBawv6DPH4fw4JNmeHEse8KIzH6BCUavGWDk7CDyWUG2Yfi+NZL5tDrJeWXpbdbMjFb8vUgmZ+gB01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4GHb4USLwxTPSB/7O9Jxo9MTNq7Ubg4KP+6/3uojzg=;
 b=ztUt9mf7UIjBR9K4DU0T36dsE+CysK+AbJTb4pZK2oVwGYv5isgbRqDS5dvG1/f0GiPAbX53ftEnfYhwAdh4XjHHMZfyfl43IQ6MUVKtnAHoZyzIuL0EDPbCX6Nv07qytBCu0XouB+VpgXa8M8rXLCgQ21Arl5ezFanhDdhghx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 19:33:49 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::b63d:60d7:923a:4ee9%5]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 19:33:49 +0000
Message-ID: <8420f701-45e7-6a05-56da-9616e2800293@amd.com>
Date: Fri, 3 Feb 2023 14:33:46 -0500
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
 <Y91fsmgAx65koWI5@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y91fsmgAx65koWI5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::28) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd65999-3c30-475f-8a75-08db061d92ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6r97To/0XhlxquSJdMETv/CDkYDnpvgtdvy48sw2Z2p7yksC18iwpaBQRCUtQqeNdaCY7dGvYb97e5+n+td9LKFerSNP4uaUf1TvW2pv8HwO9QNo5juC220qAjOQNzrdJnPW7SIR9ZPInH5oXQFtfhIigOQKQGJghV29wo+F2RO8BI5LCVALQinrnO1JOePJ+hdBYrSXpSmin9EoKgHRRCsBbtsCqDG+KHZnAx+bxQP9XqyQmwdHtlFy4Tp9NHViwk2cTSKmwMbUH4sImYTt5gcS0vw9gO0kdJFiYpnAx63Zm+mlVhCefeq6wqSVh4gotNZM7C9sv43VpghHXG7Ds5TQ/HmqRHNs8/ctKRUyXZ2MXC8YPuN+A3wxvNF+opmJj6kCmM+B7jRxEoejF52JM1xxuIY26KRqndVnJK48A5utsu+4+6rfy+AkXPjlDvWAeSCqNjaHa1mUlgBFA9xbsoyp/ht252Ckxx3CWjOjIEoF2FgxFuuVBX9Xnq9DtTHr5JMk/ImzPnrSWHH9rqSWJFVk7ly8HMq4uUH+CufwGY7YVCARMCzlf19tjfiNwTvANOz7sRIRZibG6fzoYnEzA71a9hqRJXYQ381azKNoZQD3tEp0JXo+7Y6VSdfdUjI6ktfPUPwiO2/R8eUx04dfR3Ybm8CABkkBd56+X4VW+SP1YjJ0zirWKF2yYizz682UAPuiDCxH6N2yF94YgctEHMDlA6ipkrqYwPPucc1z7Rc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5431.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199018)(31686004)(2906002)(86362001)(66899018)(41300700001)(478600001)(36756003)(6512007)(6506007)(53546011)(186003)(6666004)(26005)(31696002)(2616005)(6486002)(8936002)(5660300002)(38100700002)(44832011)(8676002)(66946007)(66556008)(66476007)(4326008)(6916009)(83380400001)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekF6MnVZOWd4SC9ZYWl3NTB1RnA1d09NUk5Ia1d3QWVDMFE3R2Zra0RBR25R?=
 =?utf-8?B?bE1BbFpBYzJHSUg1KzNoaW9WYi9GY3Jta3UvM2xldFBGTkRtaWt2TVRxZGc1?=
 =?utf-8?B?eGJQdGdVdnJ0ZmpaR1I0WWFRb0RraStQYlYrOFFTRTZ0czFPWFlnQ2tZZWl1?=
 =?utf-8?B?L1FScFNuTEQxUWh2cDlDN2lHWDM1M0trSkhYcXJkUkFmUldtY1k1NkIzbUQx?=
 =?utf-8?B?SDZ3WUxHdi9VU3RGbklXajNOaE5sTVJtMUdaYjYxY0RiSFp0Mmg1ZnBUdWRV?=
 =?utf-8?B?aURZbjlwajhHM2kvazVMakN4bmZ2RTZTVHZSRTZuaFVIWlgwZUtRaHR3Ylc3?=
 =?utf-8?B?c282K28yNktHYlA4NEo1N1VvbGFod2xpVXVjYkdadmpuT3hrR3RDTm5xZkpk?=
 =?utf-8?B?QVpMcEtXUGF1cVp6c2ZQa2x3ZklBWGU3aFZjbEk0V1RIQUtPVVVDdlcxN3Zp?=
 =?utf-8?B?YnVCY0trZ3I4TUtpMXVRRExGcEFXNHNnUTUyK3dObG5kS042T3R5NERRZW0r?=
 =?utf-8?B?Q29GQ2pWNEMyMVJiZzBvNEdaUWFDdEZCaERsSWJaSHdqYXIwVThTSEczU3BB?=
 =?utf-8?B?WGRpUllwZU5BaUt5d3pqMVRrTDhqdFlSYU03bUZxUHIyenJNSW43bWk2bFAw?=
 =?utf-8?B?aHY1VWNvUCtJamdxMXZQeFRLdlhrRTZDcXp1YzhyaGtiUHJNQXdja2ZYeWpK?=
 =?utf-8?B?M1dpVmhncmY3NnIwWDdUckRuOEZ6SktrWG9RdFRPOXJRb0NoYlJHN1pheFMx?=
 =?utf-8?B?SWF1UTFFc1FXWXNNTTc5bjB2dnFmc0xXbWtvQ24wT0FTQkpJQXJXT0NhcFBI?=
 =?utf-8?B?UFBFVW9wK1liejJmazg5WjYzc08zSHI0NG5RZ3BleGlWNmhLUExYRi8xM1NH?=
 =?utf-8?B?MjdCbGhpdzJFOGNBcjBzYitSc0dZU2V0c28rNTFmSDFkclN5UWhVVmtDQnRK?=
 =?utf-8?B?MytoYTBjTjMzTmx3SFF3QnZ6VkpFMm9tWkdIbWxvWkVMR0xGcFVYT2ZaR0Jy?=
 =?utf-8?B?R3FxUTZCUWdmUUFtWTE1ZWowS2pOOUo5RlB5M3lLbnA3dHR0QWpBN0R2bGFp?=
 =?utf-8?B?RVFXczFSLy9JcU9nckNwL2ZGUFZxUWYwa01kcmM3SEVqT2FmSnZmbVFNcmZs?=
 =?utf-8?B?WkYzb1d5Tjg3c1J1a2VrLzBORFo3My81Sm1SMDNSODFibVpxNUpTK0NRdGVK?=
 =?utf-8?B?dXRmZzdTb3BvY1FKc2ljMGVNU1JnaGJkTnE1eG5zTmNkSWJlbW1ROUl5TVZz?=
 =?utf-8?B?aW1qZWRLT05pYmRST1VTbXc2REQ2aThDSGJUa2I2T1IyeW9ISXYwVDhHUzNY?=
 =?utf-8?B?bldzUGhxbzF0M1Vjc3ZCdW1DSUxXemxmUkFJcElYTFNNcDFXaGhoWUlFbzJh?=
 =?utf-8?B?TzUrZHBYbFJjbFlxWHN5VVJwMm51MlA0TWN5czhOamdmZktkaUhpRThrK05x?=
 =?utf-8?B?Tnp5M3prS2JpeUFGYys4QXcvMmo2ckMwQkVvbE9iSit4c1ZlT3NlbCtyRVFq?=
 =?utf-8?B?akx4cjRlcEhGWElQdlpZbkNjYTlla3lIM1IyQWZxNE1nemxGSXQ3cDArNEVu?=
 =?utf-8?B?eU5pSUd0SE1iUldaTkd3MzRMb1lkeFZtUndTU0tqOGFXQnZjazliVmY0ejMr?=
 =?utf-8?B?WFZjRUxqempSaGtQTjlkNTB6d0lBMGgyYWtINXlPZ051SDkzb3pFd0dpOHFk?=
 =?utf-8?B?T1hVWVhaQXdzUEp0dDdwamlkcStmMENaME82dmdtdmZRQm9BV0lja24zWGkx?=
 =?utf-8?B?M3RPdW5wQnlxRjZmaGNObXBZblFYazhFSDZvWlRnV2gvZmFlSG1jRmNZRSts?=
 =?utf-8?B?ZGx4YVRlZTBQM3l3Wk93ZlB3Rm9JMjlXeGVWSmJPQ3ZYVXlBdkp2S1JHdDVG?=
 =?utf-8?B?R0tFdW5ZNUNXblZibTUrNE9OWWZYQU1PWURaNEFia2RjM2tzQ1I4cDJVNE9H?=
 =?utf-8?B?ODluRUcvOWl0NkRjTk1RSUV1Mkl1YnNuTmZVUmtXSkdueVB0ZVVHUWkzSzA2?=
 =?utf-8?B?Qk0zMFZ4RFRkMUR4Q3NSRWlyMHBUdVVSTGNwSHZZQzlLNXRYSzc5REhBSGxS?=
 =?utf-8?B?cnA3c0lRUEtRQ2tlY29VUWlpT2pXOG9FMkZ1YUszb2htdGEzbVQ2RklWelBr?=
 =?utf-8?Q?5J9FDjBHw6Ma9gVwl+H++ajAK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd65999-3c30-475f-8a75-08db061d92ef
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 19:33:49.3609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P15sc1VkqgLpwWl4gfRUa0EFxaUBYrwccQA0D+GPzq3rup+VuHPmwjvF1ywKRLiPXPqY+SCCCghTXpTtMHbU7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719
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



On 2/3/23 14:25, Ville Syrjälä wrote:
> On Fri, Feb 03, 2023 at 08:56:55PM +0200, Ville Syrjälä wrote:
>> On Fri, Feb 03, 2023 at 01:28:20PM -0500, Harry Wentland wrote:
>>>
>>>
>>> On 2/3/23 11:00, Ville Syrjälä wrote:
>>>> On Fri, Feb 03, 2023 at 10:24:52AM -0500, Harry Wentland wrote:
>>>>>
>>>>>
>>>>> On 2/3/23 10:19, Ville Syrjälä wrote:
>>>>>> On Fri, Feb 03, 2023 at 09:39:42AM -0500, Harry Wentland wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/3/23 07:59, Sebastian Wick wrote:
>>>>>>>> On Fri, Feb 3, 2023 at 11:40 AM Ville Syrjälä
>>>>>>>> <ville.syrjala@linux.intel.com> wrote:
>>>>>>>>>
>>>>>>>>> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
>>>>>>>>>> Userspace has no way of controlling or knowing the pixel encoding
>>>>>>>>>> currently, so there is no way for it to ever get the right values here.
>>>>>>>>>
>>>>>>>>> That applies to a lot of the other values as well (they are
>>>>>>>>> explicitly RGB or YCC). The idea was that this property sets the
>>>>>>>>> infoframe/MSA/SDP value exactly, and other properties should be
>>>>>>>>> added to for use userspace to control the pixel encoding/colorspace
>>>>>>>>> conversion(if desired, or userspace just makes sure to
>>>>>>>>> directly feed in correct kind of data).
>>>>>>>>
>>>>>>>> I'm all for getting userspace control over pixel encoding but even
>>>>>>>> then the kernel always knows which pixel encoding is selected and
>>>>>>>> which InfoFrame has to be sent. Is there a reason why userspace would
>>>>>>>> want to control the variant explicitly to the wrong value?
>>>>>>>>
>>>>>>>
>>>>>>> I've asked this before but haven't seen an answer: Is there an existing
>>>>>>> upstream userspace project that makes use of this property (other than
>>>>>>> what Joshua is working on in gamescope right now)? That would help us
>>>>>>> understand the intent better.
>>>>>>
>>>>>> The intent was to control the infoframe colorimetry bits,
>>>>>> nothing more. No idea what real userspace there was, if any.
>>>>>>
>>>>>>>
>>>>>>> I don't think giving userspace explicit control over the exact infoframe
>>>>>>> values is the right thing to do.
>>>>>>
>>>>>> Only userspace knows what kind of data it's stuffing into
>>>>>> the pixels (and/or how it configures the csc units/etc.) to
>>>>>> generate them.
>>>>>>
>>>>>
>>>>> Yes, but userspace doesn't control or know whether we drive
>>>>> RGB or YCbCr on the wire. In fact, in some cases our driver
>>>>> needs to fallback to YCbCr420 for bandwidth reasons. There
>>>>> is currently no way for userspace to know that and I don't
>>>>> think it makes sense.
>>>>
>>>> People want that control as well for whatever reason. We've
>>>> been asked to allow YCbCr 4:4:4 output many times.
>>>>
>>>> The automagic 4:2:0 fallback I think is rather fundementally
>>>> incompatible with fancy color management. How would we even
>>>> know whether to use eg. BT.2020 vs. BT.709 matrix? In i915
>>>> that stuff is just always BT.709 limited range, no questions
>>>> asked.
>>>>
>>>
>>> We use what we're telling the display, i.e., the value in the
>>> colorspace property. That way we know whether to use a BT.2020
>>> or BT.709 matrix.
>>
>> And given how these things have gone in the past I think
>> that is likey to bite someone at in the future. Also not
>> what this property was meant to do nor does on any other
>> driver AFAIK.
>>
>>> I don't see how it's fundamentally incompatible with fancy
>>> color management stuff.
>>>
>>> If we start forbidding drivers from falling back to YCbCr
>>> (whether 4:4:4 or 4:2:0) we will break existing behavior on
>>> amdgpu and will see bug reports.
>>
>> The compositors could deal with that if/when they start doing
>> the full color management stuff. The current stuff only really
>> works when the kernel is allowed to do whatever it wants.
>>
>>>
>>>> So I think if userspace wants real color management it's
>>>> going to have to set up the whole pipeline. And for that
>>>> we need at least one new property to control the RGB->YCbCr
>>>> conversion (or to explicitly avoid it).
>>>>
>>>> And given that the proposed patch just swept all the
>>>> non-BT.2020 issues under the rug makes me think no
>>>> one has actually come up with any kind of consistent
>>>> plan for anything else really.
>>>>
>>>
>>> Does anyone actually use the non-BT.2020 colorspace stuff?
>>
>> No idea if anyone is using any of it. It's a bit hard to do
>> right now outside the full passthrough case since we have no
>> properties to control how the hardware will convert stuff.
>>
>> Anyways, sounds like what you're basically proposing is
>> getting rid of this property and starting from scratch.
> 
> Hmm. I guess one option would be to add that property to
> control the output encoding, but include a few extra
> "automagic" values to it which would retain the kernel's
> freedom to select whether to do the RGB->YCbCr conversion
> or not.
> 
> enum output_encoding {
> 	auto rgb=default/nodata,ycbcr=bt601
> 	auto rgb=default/nodata,ycbcr=bt709
> 	auto rgb=bt2020,ycbcr=bt2020
> 	passthrough
> 	rgb->ycbcr bt601,
> 	rgb->ycbcr bt709,
> 	rgb->ycbcr bt2020,
> }
> 

Is there a good reason to decouple the YCbCr encoding format
from the colorspace?



> and then if you leave the colorspae property to "default"
> the kernel will pick the "right" value based on the
> output_encoding prop.
> 

How would you fill in the AVI infoframe? Userspace would still
need to set that to BT.2020 if the pixels are in BT.2020.

Harry

> That would leave all the weird stuff in the colorspace
> property alone and thus would still allow someone to
> do more than just the basic stuff explicitly.
> 

