Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CFC4F60C2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C8610E122;
	Wed,  6 Apr 2022 14:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2121.outbound.protection.outlook.com [40.107.21.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DCD10E122
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 14:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr4Gyv1Epad1qKK5GHykMNLRuVGQSSzXwKCPnK3JsNckEypk04mAxtkn5BxbhNGc885XaPQc6ntrQGZ0ddQ8MlVeogLFj3U2kf3qlxz1oO+uITwLckialmE4XNSRarZKDDW2DikGlRIcV5qfNP+lmsDoe/XPg4Az41BU0sPLF//EXTPc+U0sFegmHeApabUlaGiKuYN9RLokR9Ou5IfDr3PFfEQPcf5Rkmu87X77aftf4EAdS2aRW+XGGqolrLYgiexkYii3h5e+oVfpr93ZQkNj0owR4nizHNLDIsXqsJB7tRMDCqCJs7yeZSnQqtpTZVQo9lO0NGht4RxHR7i4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTCV5LDTL6aUSKul8tYcAwgHV3Ol3Vv8N8naiMHJTbQ=;
 b=hwqrIQV/Tatte4qH2qoFXQgI9ptMZSVIggltvwOO/3RE8ysNaQdpqpzvqt/DJdgsbXQErz2up5vp0Hw5XoDf/20rv/L8awqaTaf2151DNJ3K+NK2XbLpCsvViXNX+1Diu/TwEFmYqSNrGEas3ujrQdLRdadj/3dVUh+h/JSoi26rlAT0e8qKrjjh8QBbLKpYi0OUiuBNhYxZ4UiduO7D3jluQP59aaJ3QmqAJIYUxLIZuzYLH5TcGOpf0NLmk8/Cuynp8sz1CUKU3nKDpwoXQrB9SCHaMpBsseNvs5Fi6fyU7dVyWSAv7cwC92mpc3NcFA00BQHOVxqBxs+oB1Va5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTCV5LDTL6aUSKul8tYcAwgHV3Ol3Vv8N8naiMHJTbQ=;
 b=WHpSXMkjnfDSpbNdat0UOslVQWbzUmNuY8dzBpov7FMhDWtkJidvud3p2DzweEcLGjbqWCFSFcakUFnvMAfkj0UpptcDLUdxJeA5gJmlPVqeX8sU3gaUwTExqbiRDP2nbbRV0ogbsYOP8LrKA/KHUnmHBHbWQ3NkPgZwAPWDBCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by DB9PR10MB5763.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2ee::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:11:06 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac3d:2f31:c9d8:75bc]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac3d:2f31:c9d8:75bc%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:11:06 +0000
Message-ID: <e205c5d6-d4c0-b99b-98ab-d0215c91e6c5@kontron.de>
Date: Wed, 6 Apr 2022 16:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
Content-Language: en-US
To: Marek Vasut <marex@denx.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
 <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
 <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
 <CAPY8ntC5RQ4pq=Bf5Z+Vi-NhD6boGnEixjporJSKgR=AaUrEpw@mail.gmail.com>
 <2b6df0ac-d429-7d49-60e8-727f8c135671@denx.de>
 <CAPY8ntDVaAoaCu19=2DxW97STQdaVMv1-DbuPuvQu50N6mY1mg@mail.gmail.com>
 <941582a8-ca70-dd96-3097-570ae731eb73@denx.de>
 <CAPY8ntAYWgqTxZ3gwYt+Eo1_hJyYc1OgLE6cDGMqAb_djPPPuA@mail.gmail.com>
 <b352a7c2-c0d5-7058-d4c9-fcd5b46bd322@denx.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <b352a7c2-c0d5-7058-d4c9-fcd5b46bd322@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0056.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::33) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55bb31f1-7237-44a7-0d6a-08da17d74a77
X-MS-TrafficTypeDiagnostic: DB9PR10MB5763:EE_
X-Microsoft-Antispam-PRVS: <DB9PR10MB5763DB4E48718C84E52AAA78E9E79@DB9PR10MB5763.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +X52qRVCH3dAcThD9eXyqDDMt7VD+TcNXdH8Uep35C4XePS6eniiCk7syCUw+XPoDjWbITIXZlOGJihsEWeXWdozNIJ697gejA8dws4xDma8l5y2qGB/7Q+kRp0FZiOhpRnJmK0xRNtP084l3hipr3uzKwcO0fZjufJMkFv18+WEODMZOSw9cYKEBNkwJ79Ke2lw0/rBR2YL/lPUIB2vJZ5uNatSUfHZOxzjgosqyo3UYadUihg+gToRJKW5UualbLnaWoE4NmikjJPZLMICjBCtm63ZophcPMJDEpbBfpGs+DAE8EkXjjaagM359oGw7vHFvoYiIkK3U/uieMNOZAUZpkFnW4UePf1dO9tZvRBL9Xm2xXtMTuai03Q49rBNZdAbJbDQWvs0VS0TKKlzsj42hrvoH4ZK23MqqRYGk0F0k73gTyetDOibUp6THMnnzhq8EXayUs3aHl3zhYu51GTU5tVFzS8MHIzXdBGhpopLaZ0r6MpzFu3l6J2YW+fHu0PheepxWXSfHC8w7jjluP90wa6MdBn3vhJy6qw8xxuHtPibEK4/CvTy2JAC99IN5XSHGVTLnJrtuvKeG3Dy0wZUOxy1W9yKZTgoAum4AfHeC0+L8p1px15v/NAfsaMc8N7ueWx3Si5JpCgRhKOUwnuY6HHpa/jwkiWpRCZijciCME8JevT3GFtRAazK/S+VoqlCCPXqx8bBLpFjcUj9PeZMFT0x4FiB8gz9uxahx/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(2906002)(86362001)(6512007)(5660300002)(31696002)(38100700002)(83380400001)(8936002)(186003)(8676002)(110136005)(6486002)(26005)(2616005)(316002)(66476007)(54906003)(66556008)(44832011)(36756003)(31686004)(66946007)(508600001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjZZVmh4Y3IzSkVqTUE5UExUVnBpblhiR05pUUxNQS9STzFIWE4yOWxTZ2RE?=
 =?utf-8?B?L3FuZkNEaHlGNU9qamFvK0tVTGs2QVh3TUJoR2NkV0d6bXpkb1p4VTBTNE5x?=
 =?utf-8?B?YWpObUZxbVhhL2FSODY2VGNzZW5LUUIva01LUUh0VTBnbXlzOElST0xYN2h0?=
 =?utf-8?B?UUZtUTN4WnY4Mkd4MTl0ckJOaEhVdTd3Z29wQWdwTm5saGFEeVVBNTNHQ005?=
 =?utf-8?B?S0t4QkpZUUtBNTN5WFpMMkxwVXZHdy9kNVBhQ3UzMmZxbVZhd1NMUWVOL0Mr?=
 =?utf-8?B?bzlZeW1XWE9qb2tteGV2QUViSE1sanJCSVp4UWFyODZKaFFLYldDZkZKVzh0?=
 =?utf-8?B?cDhkeDVZNjBOMjR4Ky8xUmd4Z2p5ZWtrb3djQkdFZE9pN1pkK3k4eG9aSml1?=
 =?utf-8?B?UWZJdzNvNlAxaEVmZFBQQm1BcitUYXRtamhGZEpNNTlhNjNLdFM3NkRTU3BG?=
 =?utf-8?B?NFFZbXR6ZERPNytBcEM5L1M3VTNVc0dHa2tSUHZiU2IydTdWMEp0V1VLbzQ5?=
 =?utf-8?B?OUZXVWp2WFMvS3RuTDFXUGRVUmUzclRTMXcvZHRrelFwTXFscndabzhFNVAx?=
 =?utf-8?B?b0VIdkliYjRhWUN0WEpsOEtMYTcrQk5wNVVhYVJ4YzJob05qK1RFVGlIdm1j?=
 =?utf-8?B?cHA0OFFBUWhpUVVBYU45aGM5SGp1VEJBa21Rb1d0NkNYN3R1b0ZlRkw4eVA0?=
 =?utf-8?B?QVU1WldyQk1IR2NuTGNIQlBxN3VuTXRvTUhXR1RkMU05b0VJMnJxM0RUcEwr?=
 =?utf-8?B?ZzR4cDMxQm1GbFM1cFpLd2o2MysySnpBbkpwWkFUOVRlQTR4UXo0dGdCOVNN?=
 =?utf-8?B?blJLUi9vT1d1Z3ZFN0RFcVVWTFgvZ1FhZnhaUXdENzJrOG5RcHFxNzhJdGsy?=
 =?utf-8?B?WTVVdU9CUXF4S05GWjFuNDFXTytMK0NmWksrWHdJSllQMTNFK2ZLaDR1NC9t?=
 =?utf-8?B?eGVTNTBQd25SS01PVHQ2QUtUbEVoZndRMUVuN2hDSHBHd0JUNThkcUxDK3Z1?=
 =?utf-8?B?cWZubXhGeVNKd1B0NGo5MEFSV2xzR0JkVzdHeW5kRjF5QWpaSDN2VTVlaHlO?=
 =?utf-8?B?RGs3UytCSHZyWk5aSC9Ta0NiMi9YeTVIRWxhVzRobWlCQmtiazRLZkNJa1Zw?=
 =?utf-8?B?akF6dS9hbHlXYUtJenpWdE10VVFLTHFXbVg5WkcrbFd2dU50Q2Q4c0dWMDZa?=
 =?utf-8?B?TTJ4ckorcncwbTdxb28yQkJEc1dFU3RxbjVjUnBVZ1JySWFRWnk2TnZueUJB?=
 =?utf-8?B?RUtVQlNxZWtLWW90Y25iRGY2cUJXNXMvT2EvYzl3L1pYakNrNGhQcEM2bi8v?=
 =?utf-8?B?T2hMR3ZqZDdlNjlNZnlIaUkxOGZtM3ZNdVZEb0IydVdpOHJmbW94Vk15L0Ni?=
 =?utf-8?B?czdDak5KYkxLdExLMlROOXF1bmN4WklrbFpwTFdReEdUcjZKTGpCRzJibVFH?=
 =?utf-8?B?MWhzNUNYbWhvdGc1VkhNOTlLVVVnMTE5YXlISXJ3THBBalVuZjRHZTE1U1pV?=
 =?utf-8?B?cmhzSVdzbXV1V3J4TklLM2pnT1lwM0d5azI3b0x1anN3T0dPR1g1NDlxUFZT?=
 =?utf-8?B?OU9jSDd1bDNYZi9UbThkU3dWc0hXY1NvN216aVZyWFJvWnNLTnhZRmZHSW82?=
 =?utf-8?B?SDdpc2VOY3BSRitZNERTTElXTExhbVVDL3pWRHdjK2k0WW0yV2p6NzZuSURo?=
 =?utf-8?B?QUY4OXpUUGI1Y2JTWUZJTGREWWpXSUlESEhXeTdZL3BPU0p4K1JTM1FPc1RR?=
 =?utf-8?B?b29CR1hRS1ZkcmdLSklla1B5QVR4MktoQ3U1N0ZFTHRLU3hKVFZoaWpYWVNM?=
 =?utf-8?B?dGk4Mi9JblZnbGFUUXRpNG43VGczUmlZTDV4ME1CbDljTU9vSjN0UHorZHJZ?=
 =?utf-8?B?R1dtK1JyT2lZcVhsajlPMjEvZUdCblZla1lId1lzTHFyUGg0Y2NhUWl1dzlY?=
 =?utf-8?B?WC8yZ013aEYweG5TT3FjaFgvQ1g5bERQaHdSUWNJNmZ2UGRBcmlhSUFNNXB5?=
 =?utf-8?B?WXExSllMVVBKc0ZpelFUTWpQOWNGMUpidWhHK1FpQXVRaDgxY2RJdWdQQWlk?=
 =?utf-8?B?T3hLSlpYM0ZzSzh0aTIwVFhzVUpBU094dDZ6MFZDRndzeHh5WWRJTEgxcXhn?=
 =?utf-8?B?dzhkcngwRG5Jckd6bGUxVnBXOVhROFl2em9ZeHU3NGRHNWtlL2lzdzJFWStT?=
 =?utf-8?B?R1d6d0Y1RUtMWVpUQSsxeW9BUnhGQVpISU5jVnV1cmxZbjhlQzFVN2ZSVUtF?=
 =?utf-8?B?YnpNT1llQ3hMWE1zUVRwOUNvYVZ3bUJqQ3NxcnB2VFU2elp0NEZxQzhyUi9v?=
 =?utf-8?B?SVJpSElHSG9GTTRUTTlSWVMwMGhCTlJaRG5TWnBSL3pqS0crbFhkNGZSQTZq?=
 =?utf-8?Q?Gb1B/y4FjIwvB0Bc=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bb31f1-7237-44a7-0d6a-08da17d74a77
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:11:06.3257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o//T2/bASfXe0/lVhIU7AI372cCU0+R/DUpWyETmuKia6JzleM9nbN1+FoVREE6hVALScs+M3o30tjIWuh1AhmVa20mvZYytcf8m4n9hG6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5763
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.22 um 23:36 schrieb Marek Vasut:
> On 4/5/22 17:24, Dave Stevenson wrote:
> 
> Hi,
> 
>>>>>> If we can initialise the DSI host before the bridge for the
>>>>>> pre_enable, then all the configuration moves to the atomic_pre_enable
>>>>>> and there should be no need to have the delay.
>>>>>>
>>>>>> I can't 100% guarantee that, but one of the folks on the Pi forums is
>>>>>> using [1] which does that, and is reporting it working well. (He's
>>>>>> also using the DSI85 to take 2 DSI links and drive 2 LVDS single link
>>>>>> panels)
>>>>>
>>>>> It seems to me that checking whether the bridge got correctly
>>>>> initialized is orthogonal to the aforementioned patchset though ?
>>>>
>>>> It's the delay that is ugly.
>>>
>>> You do need to wait a little after the initialization and before
>>> checking the status, so that delay is not going away no matter how you
>>> frob with the DSI bridge.
>>>
>>>> Put the check in atomic_enable which will be slightly later than
>>>> configuration in pre_enable? Check that sufficient jiffies have passed
>>>> if you needed.
>>>> Or wire up the IRQ line from the SN65DSI83 rather than polling the IRQ
>>>> Status register. Delayed workqueue if the IRQ isn't wired up.
>>>
>>> Are you able to do such deferred non-atomic operations in atomic_enable
>>> callback ?
>>
>> atomic_enable returns void so you can't fail the atomic_enable.
>> All you're doing is reading a register and potentially logging an
>> error - surely that can be done from any context.
>>
>>>> If I read it right your log message is triggered by any bit being set
>>>> in REG_IRQ_STAT. So an inconveniently timed correctable DSI error will
>>>> set bit 4 and log the error even though it's been corrected. Likewise
>>>> bit 7 / CHA_SYNCH_ERR could get triggered by an H or V sync packet
>>>> being received in that 10-12ms window (we're in atomic_enable, so
>>>> video is already running).
>>>
>>> There should be no bits set in the IRQ_STAT register if everything works
>>> as it should.
>>
>> On a perfect link, yes.
> 
> If your hardware is broken, then you really do want to know about it.
> 
>> Looking at the top 4 bits.
>>
>> Bit 4
>> CHA_COR_ECC_ERR
>> When the DSI channel A packet processor detects a correctable ECC
>> error, this bit is set.
>>
>> The error is corrected, so why do we care? The display is still working.
> 
> If you get a lot of those correctable errors, your display might not
> work at all. So we do care.
> 
>> Bit 5
>> CHA_UNC_ECC_ERR
>> When the DSI channel A packet processor detects an uncorrectable ECC
>> error, this bit is set;
>> Bit 6
>> CHA_CRC_ERR
>> When the DSI channel A packet processor detects a data stream CRC error,
>> this bit is set
>>
>> It doesn't say what behaviour the DSI83 will take under these
>> circumstances, but shouldn't be fatal to the display.
> 
> See above, it is an error, hardware is broken, you want to know about
> this and fix the hardware.
> 
>> Bit 7
>> CHA_SYNCH_ERR
>> When the DSI channel A packet processor detects an HS or VS
>> synchronization error, that is, an unexpected sync packet; this bit is
>> set.
>>
>> It's happened, but shouldn't be fatal, so why do we care? The display
>> should pick up correctly at the start of the next frame.
> 
> Or maybe it won't because of noise on the DSI link, fix the hardware.
> 
> Sorry, I am not happy about hiding errors and trying to somehow justify
> they are OK. They are not, the hardware is likely broken and it should
> be fixed, that is the right way to handle these errors.
> 
>> As I've already said, we're in atomic_enable and video is therefore
>> running, this is highly plausibly going to happen. We've delayed for
>> 4-5ms in sn65dsi83_atomic_enable, so we're a third of the way through
>> a frame at 60fps. The chances of seeing a VS or HS packet at an
>> unexpected time is therefore high.
>>
>> Bits 2 & 3 look equally inconsequential.
>>
>> Bit 0 as PLL unlock would cause grief.
>>
>>>> If it's the PLL being unlocked that is the issue then it should only
>>>> be checking bit 0. Or possibly reading the actual PLL lock status from
>>>> REG_RC_LVDS_PLL_PLL_EN_STAT. Although as we've already checked that
>>>> the PLL is locked via REG_RC_LVDS_PLL_PLL_EN_STAT earlier in the
>>>> atomic_enable, I'm now a little confused as to the condition you are
>>>> actually wanting to detect.
>>>
>>> Any outstanding errors which are currently hidden and only show up
>>> sporadically at the worst possible moment.
>>
>> If you were constantly looking at the status then that would be
>> reasonable.
>> To be looking during one specific 10-12ms period of time for some
>> fairly generic status values seems a little redundant, and a waste of
>> time in delaying the atomic_enable.
> 
> Sorry, I disagree. I think 10ms extra time in atomic_enable() is a good
> trade-off for knowing about possible hardware problems sooner rather
> than later.

Isn't the delay at this point even required (regardless of the debugging
information), as the init sequence in the datasheet mentions a 10 ms
delay after issuing a soft reset and before the DSI stream is enabled?
Or is this handled elsewhere?

> 
>> It'll be interesting to see if these events just go away when the
>> initialisation sequence specified in the datasheet is being followed.
>> Let's leave the debate until then, as it's currently fairly arbitrary.
> 
> No, your patch series is orthogonal to this patch.
> 
> 
