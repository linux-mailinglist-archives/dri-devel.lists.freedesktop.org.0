Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B762C511BFF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A6B10F61B;
	Wed, 27 Apr 2022 15:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7319D10F61B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAxfUZMdtnVuSN+achHn5OrR546o6NC+CEUg4kACmwT731X/kQuBbW1ttPRxLUF0H/CvJyGEpx4MoEmxXmiCncbZXl2c9hUlI5m2DRGwxqOd2HkY80YcXRoOv1Y/RCOCqTqPSzRpkZMya+XjaVeVBL1JuMPLj/LIV7DI0upO/cgwgVP2/cGOV7C4w7vCiLFsZtRsVGem+QipFCTbUC1qoF1y9KOoBsYo2ww6CUgl9DMFBSI1am0teTQNTGAfoF5jfUlSu3vMoxgQU3egY1F8SblPN6vltoYy/IkKE89Qt/ijb7Q2UO7uKQ/aq/SlvYXdD6+Szi01kWBGMpqGuAiL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2dqHY85Xkwj+/296r8TmqqHgQdExEq+nSnJKxRJBRM=;
 b=Ojpc3KlbHDyDwDJ1QjtQdth04h5oin6kt6Z6Xm+kBjO2shD62uaLiXO1c/HBDJf4uprjXLmyGVroF7V/QgOjhv1tSN63dfMXmIVtzloFEVfA4mZwgLFgiaJRGV7wZe0YXfVpXAgmaP0MSjZm2yC7C3RxaLQEdbFDUoP3NY+Bn2FKeheL4s0dCFZNe8jvGycu0v6d8pmnfH/Ad+JsnQSa4X23Gin1mEgYlDAG0BrbsTEY8ejeS8r9C44xA2UlenltDFSdoULu67W68tCm0tAyjuFU0X925Ny58M0RjP/mTyY2PofhsmK3yFn/+Pjf0SibA5B+LDv92Whsl5jF5Dx0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2dqHY85Xkwj+/296r8TmqqHgQdExEq+nSnJKxRJBRM=;
 b=oAtMBo1YSCg9Z/5d1KSFjjVMpA8A5mUv/vkq5SUOTmlXlEhktszle4CEYWGkHlPs29LfBj61GaTii/m3286PA6bdUNRFIQRaIEyi5gyoLdVBuu7TwXUZJmGCFb4d2amB9dWebUjGof022LV2MUv0WZ+cG5VinNgZBcbph0TjERM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by DM6PR12MB3596.namprd12.prod.outlook.com (2603:10b6:5:3e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 15:41:40 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::9181:b3c9:478c:751c]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::9181:b3c9:478c:751c%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 15:41:39 +0000
Message-ID: <4ceca4d9-c58c-9e33-36a6-dbf0c4bb82a7@amd.com>
Date: Wed, 27 Apr 2022 11:41:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: How should "max bpc" KMS property work?
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <20220427135259.5e615945@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220427135259.5e615945@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::11) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 308d6be0-7cdb-4765-f8a3-08da28646bd0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3596:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB35968EAAFF9E8EBB12C607B78CFA9@DM6PR12MB3596.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5NgIThuOUOJq6OGPSTo8j60TUQ4sYIFeuKalNufVrd7b6AhksxwRa2NQFvViejNq2nSricU7aSg/AqC7TSvuWDXw4J/zpLrIhqrVs9Pi9Xt0tkJvEj0xZXxBmfjO5KhanZ1RWIAp9uGU+gVYgx8SSVUocEyTaKmDej10zVKVexm78vqsPCUu5iSpICtH39q/YyslyuUQXV7c+idFe4hNLc435jVmd2wlIhAY0YdVnh0u/aFuQdDisShUM67mDYZUq4va3zmPvG4XsaFkE09WoPALyQ+zEELKbAO5b4mxWwIzFGKZa2vZwTwjlq3OBuAjAknPhJvr9M9xR6/gaPdNLFEG86HkEzdoHaycUgnSExFQDPXTePqWXtiOC5/8YYOtjucw1a/2puzsRAGtBHdvftlXLkrtITw9VKt+N7GjVwZ9OHnWPOGuGJp5pNE99nLj4OlbuiHyk0nh/qeHYi3A1SVMvv9HxAsSNCoJV946oeJTSbkzh51F+tU3qH2QOKwugBosXgCEc+7HOpASS9TzsbcRBCSVD/vrccJKazvOdOs5qpQ1cio4H24cu6HF8TjA4HVrxIgmt5ltyBL7stzZCrzMOvqq4tFBCj/FJmDQBSDSl4LdUnJnQBNsSU/TxYlO6hHIifwAXAi2MGXq7XuZSEWwNjRtHfVsb6R+W571+4KBvZ2PHN8ls8mMcjcoVn0MK7VTqL3iBHtpx+UrVzbIY/AmlkiSU59lvAiHeEW0WVTVWjJC8a983OCueGLT0zcW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2616005)(66574015)(54906003)(5660300002)(66476007)(66556008)(36756003)(6666004)(6512007)(6506007)(26005)(53546011)(31686004)(83380400001)(44832011)(66946007)(8676002)(8936002)(4326008)(316002)(508600001)(2906002)(110136005)(38100700002)(31696002)(86362001)(966005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dHUzNyMlFqVHdaTFVjSHM3V0lHdDV2VXBDTDF5M2RzdnBBYnB5aS9QMDVI?=
 =?utf-8?B?RGlSSXBxOWwzOTc5T3Z6NmhKQmttYjRTeTMxNWhFV1M0cnEvczVrU0ZOUTJU?=
 =?utf-8?B?TStLTEMyQWhLdkxlSWplalprajBkZTVDZVdQR2ZQVVI5ejM1eHNDRzlBZS9T?=
 =?utf-8?B?WlZYaEMrMTVra0x1YldSZW9RS21tVm5iYVV4eGdkd3kxY01zT1lza3VJZk45?=
 =?utf-8?B?TXA3SWlTRVpKU3B5dlZsSFpacHZnNTVISmxYR1JsOGZGY2JQL0hsRVkrVEh4?=
 =?utf-8?B?RXE2Yjd4NEQ0MjZZamFxZFZJdmQ2Vnk1T0lVcHpsbnVnZFVIWkdscGJ2MnRt?=
 =?utf-8?B?eHVJQy9JdW9LQzFRcjRBbnhZT1RkWjhzRVo4alJoN2NMVWpjNDg0eVU0UnBR?=
 =?utf-8?B?Z0VVVEg2aWFtU2prSEJFT1dxTncwQzd6MmQrV0JQZTJWL3VDT1ZpU3FQbVRW?=
 =?utf-8?B?eTZsV0xDemZTdHBrVExoZ3RBSE9TSGluZ2orOEZkdWlDTWxpQlQwU2pJOE1s?=
 =?utf-8?B?MjdBaDhyMmpWdWhzNlRLM3NRTnJ2eEJPTk8wSERDOGxaa3NhVi80aXJMZmJs?=
 =?utf-8?B?TVNCZjExVzNPQ2dPb2VLYlFia0MzMUxkZkVoWmoyRlIvMWhtbjVRR1pBcEhZ?=
 =?utf-8?B?TXVSakR5dENIVkt0WWhCd2kxQ0JJNE5aWWxJOXhXUDkvVWowTW5HUm1uWG50?=
 =?utf-8?B?NytLWTE3ajVWWDYxdDFFVWg2b0kzWVV6RGwzR3VjTEJlU1VmQmxyckIyOUpn?=
 =?utf-8?B?NTJ6VkROalVtY1NoUlNxeGhzVTEydlBPU2MzaUJDRnFqanBFaytRbGw3Umx2?=
 =?utf-8?B?Y3NuQXl4WFNBZkN0a1g0S2Z1VFg2VkpnK1FIZUs5d1pDSkFzd093OEVWNEdm?=
 =?utf-8?B?SkNpVmVLSU44QWV0V3dIdlNqMjdzeWtITytjSm1tZ1VQUEtlMXQxRmpjUnhB?=
 =?utf-8?B?Rndsai8zeXdyK2tDWTFiZUdCdlpzY3hmZVQyQmQ1QVRFU3d6K3BhTHdxSjh3?=
 =?utf-8?B?RnFDS3hPRjAzdmEvdXdGOUxvVUJQSHoxMUNpVjRCM2tjcmNJckRIbTFaVmlK?=
 =?utf-8?B?cHQ1VnRuZ0ljZ0R3Sk1IZUZodlR3K081c2phMHdFTmVFK2VwZ0YxUGdjVmJy?=
 =?utf-8?B?cW9SdjFhZ0c3NUVxYnVRYi9FRWdjQitoMUlaeSsyYWYzdE40bnBEUVBwNk5n?=
 =?utf-8?B?ZUlIOUh1aTJ0Q1MzTEEzZU9iRWF3THNKUWxPOE5SQlh1d3Q2SENnRHl1TXJF?=
 =?utf-8?B?NjczRVBFSlB3M1BUUWJodzNSVmF5RTdkMS9uWTNiSW9WS0FtK0ZhR0lGSlhy?=
 =?utf-8?B?aUM0Y1cwa0xSWEh6T3RTZTFUZ2docm84MGY3UzlwWWd3VkN3dWZFcUhSQnhm?=
 =?utf-8?B?eTcvQytUWXRvMllUeHhyR2NGSTRyRW1EUk42dWV6d3pXR2s5cXllVlV6ZWEw?=
 =?utf-8?B?VWpjdWU1SklpYXpGT2pha1RycHJmNVZ6MGlYc0IzL2tjT2lqTWwvaGdjaXRR?=
 =?utf-8?B?aWl1WjNJNHpzdWpvMzJoL21PL1J4RmJlN2k1WWgyejRoeUlzWUJrRFFkak5V?=
 =?utf-8?B?c1p2TGxxVjd4Z2N0Z1VldHNkR1ZBQ2VGdkpyam5wanpEZ3pET1hnUm53MWFL?=
 =?utf-8?B?aXZkb01adTY0MWJaNHFZNWhUNE55MjUxYVczY3AxTDM2aVowQUxGcTdGU0RU?=
 =?utf-8?B?SW9PTmRHVVlPdnJRNFZpVFk2eFlZQ3N3RndVM0xKZE5jZlcwTDBzUWNFQUw5?=
 =?utf-8?B?eEFkeWZPMjZvWFgyYXNaR2pCSmJiOFA0a2xGQVdyV0V3MVI5TXN3STdhSm9B?=
 =?utf-8?B?RlM5cUNkWTgvYkUwNnI4YTBZdHNOY2NKNUdnSUs1QTJCcnIyd2MyeEczMENy?=
 =?utf-8?B?dXA0TGFvZzZPUFJRMmhCZTZ5ZDh3dEFlTXdrancwNTNaNThDWjk3MkZ2cTZN?=
 =?utf-8?B?eWUyRFdVaFJJcXhpUUFFTEF5Um5sa0o2eWxnVVNLZ2pwNm9RK1NoWUVCREhB?=
 =?utf-8?B?dllUYUZyZ0p3RnQwTmZTVlZPb0NRelhramZwbWxuNHVoMGN6UlZ0NTNpR2dD?=
 =?utf-8?B?UDN3b2tDM3JzUDI3Wm9VWjJGRjdYRC9XeUpZMm1XNTdyeGNocnlIQjhtdWNh?=
 =?utf-8?B?eXFPQ1NKTHdBd2xqbVpKLzl6cEJPS211NytXT05yOGZiNGxCL0tpQnRENFJU?=
 =?utf-8?B?L1dDNkViV25maC8wSmhqeDRzeTZrVlYzNFRNSTY1MFVSdm1QbHMwMHgydklC?=
 =?utf-8?B?OXBXd2Q2aE5JbVhsTWIxb21idmlZTlY3eDhLL3Y2SkE3VFFGR2Rndmw3dzU3?=
 =?utf-8?B?MFZwdjVTL01acERyMWIwUFl5OVBhSDREdmlBZlFNSVpaWHpka09pZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308d6be0-7cdb-4765-f8a3-08da28646bd0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 15:41:39.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ5kgCWpq2Wa0uvYOkefin882P9oKUdX2EDkKf5rsYbcsm+WIvefCCUR73IiqmWaWvZpg0pNFpvGJryCE0Yu6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3596
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-27 06:52, Pekka Paalanen wrote:
> Hi Ville and Alex,
> 
> thanks for the replies. More below.
> 
> TL;DR:
> 
> My take-away from this is that I should slam 'max bpc' to the max by
> default, and offer a knob for the user in case they want to lower it.
> 
> 
> On Tue, 26 Apr 2022 20:55:14 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
>> On Tue, Apr 26, 2022 at 11:35:02AM +0300, Pekka Paalanen wrote:
>>> Hi all,
>>>
>>> I'm working on setting HDR & WCG video modes in Weston, and I thought
>>> setting "max bpc" KMS property on the connector would be a good idea.
>>> I'm confused about how it works though.
>>>
>>> I did some digging in https://gitlab.freedesktop.org/wayland/weston/-/issues/612
>>>
>>> Summary:
>>>
>>> - Apparently the property was originally added as a manual workaround
>>>   for sink hardware behaving badly with high depth. A simple end user
>>>   setting for "max bpc" would suffice for this use.
>>>
>>> - Drivers will sometimes automatically choose a lower bpc than the "max
>>>   bpc" value, but never bigger.
>>>
>>> - amdgpu seems to (did?) default "max bpc" to 8, meaning that I
>>>   definitely want to raise it.  
>>

I've wanted to remove the 8 bpc limitations for a while now but it
looks like we never did for anything other than eDP.

The original problem we solved was that some monitors default timing
couldn't be driven at a high bpc. Therefore users were faced with black
displays. On some displays you also can't drive high refresh rate modes
with a higher bpc.

>> I've occasionally pondered about doing the same for i915, just to have
>> the safest default possible. But I'd hate to lose the deep color testing
>> coverage knowing very few people would in practice raise the limit.
>> Also the number of systems where deep color doesn't work reliably
>> (or can't be made to work by not using a crap cable) seems to be quite
>> low.
> 
> I think when HDR and WCG get into display servers, setting 'max bpc'
> will become a standard action.
> 
> It's bit moot to e.g. render everything in electrical 10 bit RGB, if
> the link is just going to squash that into electrical 8 bit RGB, right?
> 
> So even 10 bit color would require setting 'max bpc' to at least 10 to
> be able to actually see it, source-side dithering aside.
> 
>>>
>>> If I always slam "max bpc" to the highest supported value for that
>>> property, do I lose more than workarounds for bad sink hardware?  
>>
>> We don't have any workarounds implemented like this in the kernel.
>> Or should not have at least. "max bpc" exists purely for the user
>> to have a say in the matter in addition to whatever the EDID/quirks
>> say. Ie. if the kernel knows for sure that deep color won't work on
>> a particular setup then it should just not allow deep color at all
>> despite what the prop value says.
>>
>> So the only danger is fighting with the user's wishes which I guess
>> you can overcome with some kind of user visible knob.
> 
> Right, good.
> 
> Furthermore, as a KMS client cannot make much assumptions about the KMS
> state it inherits from some other KMS client, it should know and
> program all possible KMS properties according to its own desires
> anyway. That, and the DRM master concept make sure that there cannot be
> any "third party" KMS configuration programs, like V4L2 has.
> 
>>> Do I lose the ability to set video modes that take too much bandwidth
>>> at uncapped driver-selected bpc while capping the bpc lower would allow
>>> me to use those video modes?
>>>
>>> Or, are drivers required to choose a lower-than-usual but highest
>>> usable bpc to make the requested video mode squeeze through the
>>> connector and link?  
>>
>> IMO drivers should implement the "reduce bpc until it fits"
>> fallback. We have that in i915, except for MST where we'd need
>> to potentially involve multiple streams in the fallback. That
>> is something we intend to remedy eventually but it's not an
>> entirely trivial thing to implement so will take some actual
>> work. ATM we just cap MST to <=8bpc to avoid users getting into
>> this situation so often.
> 
> Excellent, but judging from what Alex said, this is also not what
> amdgpu does. We have two drivers doing different things then?
> > So with Weston I probably have to document, that if you can't get the
> video mode you want working, try turning the 'max bpc' knob down and
> try again.
> 
> Or, I could cap 'max bpc' based on my framebuffer depth. If I have an
> electrical 8 bit FB (default in Weston), then there is not much use for
> having 'max bpc' > 8. This ignores the KMS color pipeline a bit. Does
> that make sense?
> 

I think both of those options make sense. I'll need to think about the
automatic fallback if we don't have enough bandwidth for max_bpc.

If a KMS driver falls back automatically we probably want some way
for a (color managed) compositor to know if the output bpc is reduced.

> Does KMS use dithering automatically, btw?
> 

amdgpu's display driver does.

> The only mention of dithering in KMS docs is some nouveau-specific KMS
> properties and another for radeon.
> 
>>>
>>> Do I need to implement a fallback strategy in a display server,
>>> starting from the highest possible "max bpc" value, and if my modeset
>>> is rejected, repeatedly try with lower "max bpc" setting until it works
>>> or I'm out of bpc options?  
>>
>> IMO the bpc part should be handled by the kernel since we already
>> had this behaviour even before the "max bpc" prop was introduced
>> and we didn't add an explicit "use this bpc or fail" prop. But of
>> course you should have some kind of sensible fallback strategy for
>> things that just fail for other reasons.
> 
> Right, but this means that I don't have to add 'max bpc' as yet another
> dimension in the combinatorial explosion of KMS parameters I would need
> to search to find a working setup. That's really good.
> 
> The one thing missing is seeing what format and bpc we actually got on
> the link.
> 
>> The one problem we have in the kernel is that we have no way to
>> ask the user if the display we tried to light up is actually
>> working. So our policy decisions can't really involve user input.
>> Userspace should not generally have that problem.
> 
> Indeed.
> 
> Also like Alex said, the kernel does not know if the user prefers high
> color depth or high refresh rate either. One way to solve that is to
> light up the requested video mode any way the kernel can, and then
> report what the resulting color depth is. Another way is to have
> explicit "use this bpc or fail" KMS property, maybe in the form of 'min
> bpc' as I recall being discussed in the past, and let userspace guess
> what might work. The former is easier to light up, but probing requires
> actually setting the modes. The latter may require a lot of
> trial-and-error from userspace to find anything that works, but it
> takes only time and not blinking - as far as things can be detected
> with TEST_ONLY commits. Then one still has to ask the user if it
> actually worked.
> 

min_bpc sounds like something we might want for HDR use-cases, unless
the compositor has a way to confirm the output box (and format). min_bpc
would allow the KMS driver to pick the lowest required bpc so the
compositor always has a guarantee of quality.

Harry

> 
> Thanks,
> pq
