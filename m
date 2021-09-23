Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866041625E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 17:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EEB6ED85;
	Thu, 23 Sep 2021 15:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BCE6ED15;
 Thu, 23 Sep 2021 15:50:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYJbeW/3/0cU42U8S0RwJZ3OdBNXvAFjxi5LIXij/X/jSoNaHwRlw6AbvsltD17DUw4n4eKrmNnarjrIKqk2l0w8u9Id5MUkrhXBrbXVCDOo8ppzUK7I/r1I1fxkZ923N+59VuTsGLmcyzFRy3cliutACSZRZlwOikA0kpgToSqoWqJWFnaWyPCsVKX7xfS2Wtcqnkf7vrvVkd0VyS9xpK8PLeg5XmS7RZZLqpEQt4Uwo8NSk3FoSrnzK2kzrlpL18mGyzNXXdIQlYJn8NYxLa/xnPV1FXWWheHQ8HdgrTipTSF3JMlgvL4x5TVikKo1Ut0zYUJCtNAFd7WdrKrbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zjgloGJTp8IoX1mtny/JZYy/eMbuy6jAZxMTNH0gkic=;
 b=Uk8sFF7lmXYGTbDtO3UVQAB+mMhtRivHfQYi+r6ZcQf2VY4Qvr5mV9B7Y/AnMN9cSry0wlE14HkvNDwbguNiMLWS9qeEJhGRYktjbb2pfBlyp6P0M5CBypycLSlHSfdw83r8T+0Lep8ZSXmgCBdvroFA5VYgsXCS4fk8AZcfrKcjmI5PLLgdqGllwnSuxYkOB+vGj86R2R00asdkXbAwpRN+jUymQNzcwpCK/u/A8b4YMi9UAKTMyOxAW0nUysru/hRukf/C2VRpx+JXAkJLUxJX2bsHUZ5X2jikeVQcZWHtSO+aEHaBwEhH6fgkzubF5Wq2pT96V9zjjfz6tspW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjgloGJTp8IoX1mtny/JZYy/eMbuy6jAZxMTNH0gkic=;
 b=kdV1tFiA0QJ4lRJdssHc/gGIhberWSN5f/0FcoaJk79QJ548csHOoGNmZjiJqecVcNpGd0Fiz5/TmzUqs1Z9ahS1Zwni6B0YQJYBjZ5it2EnGlcLyqneWi1AJIxn73dqqj6X9nyzFQfojHBb6l/r+8irUEibpoOQgryEn2RX1Kw=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5268.namprd12.prod.outlook.com (2603:10b6:610:d3::23)
 by CH0PR12MB5170.namprd12.prod.outlook.com (2603:10b6:610:b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:50:08 +0000
Received: from CH0PR12MB5268.namprd12.prod.outlook.com
 ([fe80::9011:de18:14b4:2260]) by CH0PR12MB5268.namprd12.prod.outlook.com
 ([fe80::9011:de18:14b4:2260%6]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 15:50:08 +0000
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
To: Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com, Krunoslav.Kovac@amd.com,
 hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
 <a13d64b1-7b24-5fd5-41d3-b55d2bd388e0@amd.com>
 <20210923110130.1928d8bf@eldfell>
 <27a41be5-3563-6334-7bf8-e6d8f334359a@amd.com>
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
Message-ID: <8b49d401-135d-0eb2-992f-821058435876@amd.com>
Date: Thu, 23 Sep 2021 11:50:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <27a41be5-3563-6334-7bf8-e6d8f334359a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA
X-ClientProxiedBy: YT2PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::12) To CH0PR12MB5268.namprd12.prod.outlook.com
 (2603:10b6:610:d3::23)
MIME-Version: 1.0
Received: from [10.0.0.16] (38.64.189.249) by
 YT2PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 15:50:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b03664-559a-4f04-60d3-08d97ea9d1b6
X-MS-TrafficTypeDiagnostic: CH0PR12MB5170:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR12MB5170295089252968AB0872CC81A39@CH0PR12MB5170.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxpZRGrmR0PdLzMg0AsSopBozcWNp+hIUh/NWBJfX8h/yXFi30edV2mxJjDDszn7V0IqXSTGkFUDNHo19b8msYRNAUUXX2UeWz3aJuz1GqxWcQxk9AtGDhVMF3dA4H55habKYIJGdrbD0nvhDnURTh6dDP6UAIlbp2+tTSAnNcWG7WfJO4LkMYA8ah2rqJLVMVChRhZN3utWJ3jI/rhIxxflz9wMeE1SZEEh5MnOMrbOUA7LstUiPDHa2RNDkhCd3BgaDojk5H7y0hAbGDYJBaRmOpywAhCXgrQhh221z/UpXHpdl6pFwBbH36oP4qfKNr6qylnXzQ3bPbwrMTcQuIY9duisEFc5v66eIqv7+SG8psCqBOIab0qVFYF8PSC8ohJVNBaFW8cqNNM605nVY4LC9EPCI8qu1o7I4uKfXauJYrlZ3LELB/DBRGauDbC/SjWswK2xcHISB/khVJtmkm6eF6nhKHFcYboN8FPDSbzSKNY3nyHcmFCugRyceSjKOG097Sio7IXQuIvlal8yLg1pfxaESzxc1cPSeI/uAoXap0cjZSRPq8WczOXjc5+e3JMATAe/OrOJgGJ32oAP95igivrrQAlT/pRH6Iziy4fiBAhzQSrTZhZ/BPqyUke/98awnIoSDiMDmoFEFkuU9jB3smb2SmzNdt62Sqd0DfrTe0BF0ZDCJd4h4qpVmWChqKoNpNa44yUBlkcSbFGReGUIHu6RCXnWLq6knX088Wc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5268.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(110136005)(956004)(316002)(16576012)(44832011)(26005)(2906002)(53546011)(66476007)(508600001)(8676002)(31686004)(83380400001)(8936002)(36756003)(66946007)(6486002)(966005)(4326008)(86362001)(186003)(38100700002)(66556008)(5660300002)(7416002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3B0OGttQUNNeVd6QU9tbXJiL3hWQk1saXU4SHhOY3NudnlYTjNrRVNOMk12?=
 =?utf-8?B?cCtWdmtGaEdYSEttN05ab3czb3pvZDFYUzBPdTBYc252TGx1bjVVWGozOWNN?=
 =?utf-8?B?eCtjTE9lT2VGRlVnSS96ZlYvTFI1UmxRV2kxK0JwSzNFa2FvSWZvbCt3UDdX?=
 =?utf-8?B?U1NXZ0x2QXR6QnArSFF5TWs2WmIxbWZiZUZSQW1VK2krTjYvZ2RPaC9sYWpr?=
 =?utf-8?B?aktJOGlmWXIyQWFBLzR0ZFgvckFUMlNta2NWcG5uUEhuSzJiaG5uRWdxOEdk?=
 =?utf-8?B?Vm1rclcrN0swQUd4bGQ3T1p6LzJJQzRtaGwxT0lWeW02Sjl3S3Z2Q2dmdGhU?=
 =?utf-8?B?WWVSMGk3dG5TNDBtTjd6R29LVll0U0IzTFI5bUM3NU9IcjBIeExsS1ZSSnd1?=
 =?utf-8?B?SFQ3aU9HNVpzUTI3enJhR3dWNnI2b2pBZ1ROYVlOR1BKUVNYTTc0Ky9qSGZR?=
 =?utf-8?B?aTdLTDNrRmVsT2MxSW9lK3R5TjkzYW5BUzJNbXVQOVU0dWxJSXlreThISXBQ?=
 =?utf-8?B?SEFpMVEzNnYwQVhieEM2U3dPQW92VWxuODBaU202b0xiRDB1N2M1NjNzOEd4?=
 =?utf-8?B?czJ3NDcwd2pDWGlTeEowa0pFRUVPQ2JMdkszdS9wdmhZQkhRdi9JU3A1Q1dr?=
 =?utf-8?B?VzI1OEd5dmk4MjZuOFRkVTFJeHRybHR0SWZJbkcyQ2xsdmkraGJ2UXkrTnlH?=
 =?utf-8?B?VFpUT2tCY1pzT2RIVmVncFNMamNPdDIvWUpTb2ptSkFXT1lPWTJxcm5GcU1y?=
 =?utf-8?B?dHBSd0NlK2pKb1A4ejV1cm80WDZnTy9keVF6Tzlyb2pxczJwd2FhKzVqRGcy?=
 =?utf-8?B?S0hPY1NFM0xHc212THNxRXhQRXV5d3dwbENwcDRnQTdVMVpUYmszSGpLL09k?=
 =?utf-8?B?THdvRTVrS1VENWcwaHdweWNFNVlOTTlCQ1lKclg1c002NThCL1hoR0hYS3ZD?=
 =?utf-8?B?V3BHK2QyOG9sZE9EVzM4aU5jUlEyby9hL3gvSGEvVERJNDZJRmU4WTBEM0Qr?=
 =?utf-8?B?M0hURkZpdHQ0NXdWbkZUNlJOdGxJankrbGtlVXJIZlo1RThlK1Q5dFk3WlJK?=
 =?utf-8?B?QmJpaVVzT204aEwzTVdwcUdwTC90UGdEYVVYVnFLYU5yYjF3SnlyVXkvOTh6?=
 =?utf-8?B?cS9GUHVJNGdBU3lUVWpZRitmTVFuTENEL2U1SUMvNHZZblhDQTBqTjJub0FL?=
 =?utf-8?B?dFpDa1ZLdHAxSlRhWnhmMlJQVThGaVlnSGprTjZodFd5Y0ZaQkhHWjd5d1Vt?=
 =?utf-8?B?OFF1NDVubHJhYzg2NWlneE1LcWsrYXUvNkRlbTlMMTFvbTkvOGN6REpwQmI3?=
 =?utf-8?B?RXY3M2dhdTRkcm9sQVpHcnZhQ1hzeVdCbkJOT254ZG5uVzdFRkJTelREZG80?=
 =?utf-8?B?NVFmYW1KdExCWVhNY0dFVzdmdnZBK2tlTlBtclRoRk5JRVkxUnk5eU8zdDVJ?=
 =?utf-8?B?ejMwY2JKTHorc1k1aC9OSkI1alc0S05tZnJySmtTNXdlbFFPN29aeE9KVnY2?=
 =?utf-8?B?dG9vQzFyb0dtVzI4bW1OWWUvTTl5V0pLQy9UY0ZUVlZQMHJ0MzRsTmVEVFZD?=
 =?utf-8?B?ZWlKU1ZtNzY0eGpNU05ON01IY0NtMDU5dDJxU1lHUkcwbjRWdm5qelBseWhV?=
 =?utf-8?B?a2V3Y1ZMMHZOOThRNUc3K2lrZ0tOS2phOWZDQTdzSnZZWndrTDVHTVZWaUpY?=
 =?utf-8?B?ckMrN3NQMWJHOFZucjNNSUZDc3hDZm10Zmw1cEhXVnk4TDErWlBiRzM1TmZY?=
 =?utf-8?Q?wH3WjoOhySbxqTSgvCE+kSeA70f22CmljJ00Fxf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b03664-559a-4f04-60d3-08d97ea9d1b6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5268.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:50:08.5864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eX7mBUmjnp61vDxqfcaxy1U4YRGX335oE2lyfbW8aC/VwwKcBLA3XNXn/QXgIU2gwyjugD11Lnnp96vkzt0VkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5170
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-09-23 9:40 a.m., Harry Wentland wrote:
>
> On 2021-09-23 04:01, Pekka Paalanen wrote:
>> On Wed, 22 Sep 2021 11:06:53 -0400
>> Harry Wentland <harry.wentland@amd.com> wrote:
>>
>>> On 2021-09-20 20:14, Harry Wentland wrote:
>>>> On 2021-09-15 10:01, Pekka Paalanen wrote:> On Fri, 30 Jul 2021 16:41:29 -0400
>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>   
>>> <snip>
>>>
>>>>>> +If a display's maximum HDR white level is correctly reported it is trivial
>>>>>> +to convert between all of the above representations of SDR white level. If
>>>>>> +it is not, defining SDR luminance as a nits value, or a ratio vs a fixed
>>>>>> +nits value is preferred, assuming we are blending in linear space.
>>>>>> +
>>>>>> +It is our experience that many HDR displays do not report maximum white
>>>>>> +level correctly
>>>>> Which value do you refer to as "maximum white", and how did you measure
>>>>> it?
>>>>>   
>>>> Good question. I haven't played with those displays myself but I'll try to
>>>> find out a bit more background behind this statement.
>>>>    
>>>
>>> Some TVs report the EOTF but not the luminance values.
>>> For an example edid-code capture of my eDP HDR panel:
>>>
>>>    HDR Static Metadata Data Block:
>>>      Electro optical transfer functions:
>>>        Traditional gamma - SDR luminance range
>>>        SMPTE ST2084
>>>      Supported static metadata descriptors:
>>>        Static metadata type 1
>>>      Desired content max luminance: 115 (603.666 cd/m^2)
>>>      Desired content max frame-average luminance: 109 (530.095 cd/m^2)
>>>      Desired content min luminance: 7 (0.005 cd/m^2)
>>>
>> I forget where I heard (you, Vitaly, someone?) that integrated panels
>> may not have the magic gamut and tone mapping hardware, which means
>> that software (or display engine) must do the full correct thing.
>>
>> That's another reason to not rely on magic display functionality, which
>> suits my plans perfectly.
>>
> I've mentioned it before but there aren't really a lot of integrated
> HDR panels yet. I think we've only seen one or two without tone-mapping
> ability.
>
> Either way we probably need at least the ability to tone-map the output
> on the transmitter side (SW, GPU, or display HW).

It is really interesting to see the quality of panel TM algorithm by 
specifying different metadata

and validate how severe loss of details which could mean no TM at all or 
1DLUT  is used to soften the

clipping or 3DLUT( which has wider possibilities for TM)

To facilitate this development we may use LCMS proofing capabilities to 
allow simulate the image

view on high end(wide gamut display) how it may looks on low end

(narrow gamut displays or integrated panels)

>>> I suspect on those TVs it looks like this:
>>>
>>>    HDR Static Metadata Data Block:
>>>      Electro optical transfer functions:
>>>        Traditional gamma - SDR luminance range
>>>        SMPTE ST2084
>>>      Supported static metadata descriptors:
>>>        Static metadata type 1
>>>
>>> Windows has some defaults in this case and our Windows driver also has
>>> some defaults.
>> Oh, missing information. Yay.
>>
>>> Using defaults in the 1000-2000 nits range would yield much better
>>> tone-mapping results than assuming the monitor can support a full
>>> 10k nits.
>> Obviously.
>>
>>> As an aside, recently we've come across displays where the max
>>> average luminance is higher than the max peak luminance. This is
>>> not a mistake but due to how the display's dimming zones work.
>> IOW, the actual max peak luminance in absolute units depends on the
>> current image average luminance. Wonderful, but what am I (the content
>> producer, the display server) supposed to do with that information...
>>
>>> Not sure what impact this might have on tone-mapping, other than
>>> to keep in mind that we can assume that max_avg < max_peak.
>> *cannot
>>
> Right
>
>> Seems like it would lead to a very different tone mapping algorithm
>> which needs to compute the image average luminance before it can
>> account for max peak luminance (which I wouldn't know how to infer). So
>> either a two-pass algorithm, or taking the average from the previous
>> frame.
>>
>> I imagine that is going to be fun considering one needs to composite
>> different types of input images together, and the final tone mapping
>> might need to differ for each. Strictly thinking that might lead to an
>> iterative optimisation algorithm which would be quite intractable in
>> practise to complete for a single frame at a time.
>>
> Maybe a good approach for this would be to just consider MaxAvg = MaxPeak
> in this case. At least until one would want to consider dynamic tone-mapping,
> i.e. tone-mapping that is changing frame-by-frame based on content.
> Dynamic tone-mapping might be challenging to do in SW but could be a possibility
> with specialized HW. Though I'm not sure exactly how that HW would look like.
> Maybe something like a histogram engine like Laurent mentions in
> https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html.
>
> Harry
>
>> Thanks,
>> pq
>>
