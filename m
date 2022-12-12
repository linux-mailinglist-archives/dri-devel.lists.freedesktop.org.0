Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3B649E27
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 12:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AEA10E03A;
	Mon, 12 Dec 2022 11:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2094.outbound.protection.outlook.com [40.107.103.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A109310E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 11:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2IM0XjXvZA5VOudHPOUYwbmJrbalUNglKOqoqqw89+6N8ORS9EV7N3Vs3dYOJsxTwWmsTRd/3XjUV1b536gTS87XZFJxBqSFqot8fCWFAcp2p+dIFaqQFy+WNQmrOughvB6pNOgFoZtxu5Mb/kqPqxTs4nKrVnOdoWjV9nSmgEODU+6KyFycQ4vRXuln3MhzrOqwB1DYgc10v3Wi2s6R5eUn4h9rfXjhnS9J8xrLQi7nGY0R8r6hivIsOYpi0TwbKF9VUXCNLBAZR3Y5ouH9w1ceNr9i9T4IryqccKp7WNdVsw/PbFZlQERQLwHHm8K5EQrRedbhJWgauYAybDLzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpbQF5UxGS8cKkhkLZQim6OQDZ/g7pHzA4FbwNOLBmU=;
 b=WmE1wSH581njSpkECHuMev+WTya6v/F3JigbmswWhqGP9pQy9ZFxA4bq6MkTuHwUlqNPR2PmlZOiZFd0v9GJjm4a2BIzC/a6YEMhbD4cx3u5nS6u/BhE1neZlGuEkr4RDMbI1dBWoqbriGdmENFuyGIUyKaJqGeEvUL+Xj6BEBszBEal8fXRxPUCaOQP4WUOaMMn82rm+JQG9S9LmpORSeIYXnFVIYpE2c5/M10S88D+Fvrdsr5DDe64GjQzKFv6sVmMBHEulN/qf8N3JR+nZbfLShzk4DtzjCbLCTa0IhOYwE1B2nevEIB3QVZz+qWbQEZMF1wO38NXHRc8ouOHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpbQF5UxGS8cKkhkLZQim6OQDZ/g7pHzA4FbwNOLBmU=;
 b=T08k52mAge+alLIMjvQsbaqBK8k8Mk4YtmyVD2VYAeFiIqvb6nI6b6cWkqIVUB2fA6bleGBNjs+K5MiJ0oXbSdG2aeNWMjS6hQLdpTGKrma9VFvaBzutoAshdGd9YykAF8+50t3Tk8Yd3Ht/HrqTHYNefoMJ8Rufg1lWDocp55k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM0PR10MB3156.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 11:49:28 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 11:49:28 +0000
Message-ID: <604d3d94-1aa2-d4bf-e934-9844e25f60a4@kontron.de>
Date: Mon, 12 Dec 2022 12:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <45157029.fMDQidcC6G@steina-w> <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
 <2735716.BEx9A2HvPv@steina-w> <c6f2cc52-41c6-028f-4d3f-e8a4d5d73dcd@denx.de>
 <9f8b1c17-0bc5-ae99-b7b1-cb2f52f9310d@kontron.de>
 <Y5b1PRRFeSm2P/LB@pendragon.ideasonboard.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <Y5b1PRRFeSm2P/LB@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM0PR10MB3156:EE_
X-MS-Office365-Filtering-Correlation-Id: 211fa5b8-7316-42d6-28d8-08dadc36ecce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwZSMZWc5a5qM/RHCWweNQErToPQlRQ8ZSCVczY5VJXQ/q9kubc8i5GA/O+YaKOHYrScG92RaDS1O7QpnbXFdGXaUC2vCM+EpHWA7zze46zF6FS0cJPXM6KiHTkI5Srp2SkvfjeH4zTHFTrisjrnVTOsGQ0XWHp0DJIqg8o9ly9xA1ipnffHPzoh7X+9SWvI8cnypbunbGiHGEBK7SlirlXoy7vTtjOkq5dywehASDrpeAUKiAnOruR+dadmDLWzHJp5HsrZd5XqVV+oozunUYVEhIfKJZVLWlSikmf+G3o+3f0ix4J2LSUOrqcFtsgETraBkcOlIXqMzYDfIPQK4MptqqMswCfsdZMKJRaDFPjOKD9VvEQKkKJM8wmATzwX+3MqsmFeoTqkP84DxlbeJWjwPqcgzDHOn/STo0aa+QxoBOjtYPdJQ7ClGW8Wwqj2HMoFjXpCCvQjqM0MhHkwi++ZUF97czYjyX63NXz8cGxwtX1ebVYEDjKiA5Ir3mXLduKuZXGOqW7/DpYvnsyDwEmaPR8CDSXTzBOshrrWYMnpZx6GStvUWP0pSCDNCVZ2aoXNKHhrk6CqZAi67ZLGfMlzA+bakuUIo7Pm2TtsBcB9ImxDeJ3HOuIndNiphXK9ynUCZ8LOIuzNnVIgM92ydsrIA2tIJkAm41FG2xSDNZpJcnARYhGqF7zxS2nCfkF0P+fDnNyInDwkaV9vGKD7jFodk6GH3KhvO2pOrPMTLLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199015)(31686004)(6486002)(478600001)(53546011)(2906002)(6506007)(31696002)(86362001)(36756003)(44832011)(8936002)(186003)(2616005)(38100700002)(6512007)(7416002)(4326008)(83380400001)(41300700001)(5660300002)(54906003)(66946007)(66476007)(8676002)(66556008)(6916009)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFU2aDhpamNwbjF1enZONUR1ckZDdll1NUZjMHVlaTB5WVNzK3BMa2ZMK2Rm?=
 =?utf-8?B?NW1LSnBQdnpRUFNYaDcvdmF4Y0dWUDZLaDRNbG1WcW1jOGN6TEtoWm5ucldM?=
 =?utf-8?B?Q2wyWVAraXovYUFRdE1vbG9YRG9IRThEV3JNUThFRGVOYW9mQWZFdVYvUTJ2?=
 =?utf-8?B?ZlRXYnNEZlNoRm1Gd1oxRkJ2NW9wS1dJMnBvdy9XR3RWc05xVnFlS3VkQko3?=
 =?utf-8?B?TDVzN1Z5NmpydldNa2lBY2E5dnkxZ3U4eHNENi9SZ3ZheCtNR3Z1WFJWd0VD?=
 =?utf-8?B?THJFMG9neGFBQnZmWDhqbTFhMzlSZnZqRzBUVHpGa3duZm5qZHZlRzNiTGps?=
 =?utf-8?B?R21XUUZURCtkQ1o4TnZQQVVnOURmdjRCQ0l4OGpJVE1KV2M4RXdzTGtmb2sr?=
 =?utf-8?B?V0VWWEhoUzU4dGdSTDZRWWdjZlJKY0NaODB5dnNkL1FqeWc1UjJOK01hS1dz?=
 =?utf-8?B?bmNOOTJuOEluR3lRRUxKV0d1MVdWUERwMG10UE41MXJGNmpCa0QxYTlxSnFG?=
 =?utf-8?B?WFl1Z1lxeE5EbWtIMUNCTGxqdld1TTJNMDZub3FMcHo3aEUwc2psYnhMTzUv?=
 =?utf-8?B?UHVQUmxPbW50YUNXVVlHblhEVEh2cnFhWmREL1Y5NFdPTXQxbE1SbzVjdXNI?=
 =?utf-8?B?TCtpblZuaU1YK091MUp5b2VuQXpYRzJPbjV0ZkR2bWplcUhpL0sreVErM280?=
 =?utf-8?B?Q0Mxa2IrMDZQQVduUzA5VGJJWWY2aDBjOGk3TDZNRVBGUTR3c0g4Yzd1RU1n?=
 =?utf-8?B?Q0xOM1hmUEVzRVY1Mi9XS09RaDJwb0I5UVQ4bjhmRVRlWHk1SndLcTV0NnVY?=
 =?utf-8?B?ekpuUGhsMHZFSmhyKzRhaU4wQmg2UlJsRlIyQXpxcGJGZEtBMUZlamJaQWhp?=
 =?utf-8?B?MHJiOEk0VFdyRVozWWJCaXFTbGxVUXpCNGFuY0s1YnVZQkpwOE91ZXZyOUZH?=
 =?utf-8?B?eWlLYWFBVW0yNzE4ZjNGSjFiTDJWVkVmcmFhODZ1TVJVU2tDK1RyZ0UvaDdh?=
 =?utf-8?B?QjVYTkh5cVpDVkh5ZW92VTJzMmZlUzg3QmVGdXZKZkFQTnE4TXphRlRkcitR?=
 =?utf-8?B?LzRaNCt6NXdnRkNwWTBLdGhBVXB4eFUrYkd2QTBGOEJxaktGWDBSaTFta2U5?=
 =?utf-8?B?UHNuak50SFNXTjA0UGdtamFVOFVHVU04aUwxeXlRRWhlTWU3TVBrTTArYW1v?=
 =?utf-8?B?L21XTW5qaWczNldqNHUwUG1aZk13Z0tCRlV3amw1MGNBWmpJMGFpeTEvU3px?=
 =?utf-8?B?dXJhUUx2VzlUSUxncnoyQXlITGswYk8vbWVpSFNwZ3RaOVZmdStOdmpUd3VZ?=
 =?utf-8?B?TGhwdzRFR3dLbWZsSjRwdmk3RUl5ZTI0eEdibTBSMFNvMnQ4VGQyUVJaM0VB?=
 =?utf-8?B?L1JLcjdNZFR2a2RicXg0SVY0TGRPODNCeHp2VlFjS3ZNZXYwaWZ4QXdNa2d3?=
 =?utf-8?B?RkYyWERvZHRhRkNFUkZSVWd3andGamlMOWN6bTBnaWFvK2wzQXk3cU5vdmh1?=
 =?utf-8?B?WDhTTkFIVTN1UW5JTTZQSVNkSXdmWDF5ZHFDK2dHWE1BUm5tdjJyTHBwM3BX?=
 =?utf-8?B?UExrRmo4cUZGVXZtVE52R09TVFp2QlBnZHFHcHFMeGIwUFRlNTI2RkoySmN1?=
 =?utf-8?B?MnJrcDI0a3JpWG4xRlpFNjNzVDFjVEdEeWxlc3hGdExNSTZnOCt3Kzd3cHNq?=
 =?utf-8?B?V2lGd243bTh5UStZU3J3dS9uSzVyZnJ1T0ZBNDJIckNtOWRwMFJDc3NmWUE0?=
 =?utf-8?B?UksxSkFSOWdzQ0Roc1poWlY1TUVlOVNzRVhWQThoemRtZ1Nqc1FQeTFxYktH?=
 =?utf-8?B?NFJNQjFPRW0rVjY4S0h1c002b1F3Wld0czBNeGpZZTR0c3RxQkp2TFI3U0Jk?=
 =?utf-8?B?ZndlUmpvbm8xdmRkd2orOWROeTVYbW9MYzFIZFlGbkZyQnZuNWNhSWFvQjRC?=
 =?utf-8?B?S0ZWdlZWUFkrckdhZUJIN1U4MXZpRWxOdW5FT3JHTklrSHQwOHBIeE40dUdV?=
 =?utf-8?B?bGN3WlpxSkp0bmtCRW1GMjY3UkxTVDZSSVVjWFJCeVpOZXFrOWo4Tmwva0s2?=
 =?utf-8?B?Y1ExRXlGUk85WElyMmRsa2IwenlrWEN1bTBXN3czQjUzRm5qeTIwdHFpS0ZE?=
 =?utf-8?B?QnAvV1FGYkJYSVN0OEdnUkU3QlFaZDNwOWxZNFdyQkdLaEZObzIrQTJUMzZ3?=
 =?utf-8?Q?/fHR29gWYtc/Hj1/k+J6XeHfbCZFcn0oSmb2TAXmr9p7?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 211fa5b8-7316-42d6-28d8-08dadc36ecce
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 11:49:28.6887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5ZHm7snKpoeEP7UHuVkHemWCCLKKSjNDLcdnGZkWIEYvKBB42XQyak07ZgCEcCAsgdmf8romK8bbEY8tmhej4Y1vz9TUD8hh9aBiG8euNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3156
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.22 10:32, Laurent Pinchart wrote:
> On Mon, Dec 12, 2022 at 10:09:45AM +0100, Frieder Schrempf wrote:
>> On 09.12.22 15:49, Marek Vasut wrote:
>>> On 12/9/22 14:38, Alexander Stein wrote:
>>>> Am Freitag, 9. Dezember 2022, 13:43:02 CET schrieb Marek Vasut:
>>>>> On 12/9/22 13:21, Alexander Stein wrote:
>>>>>> Am Freitag, 9. Dezember 2022, 13:02:10 CET schrieb Marek Vasut:
>>>>>>> On 12/9/22 10:36, Alexander Stein wrote:
>>>>>>>> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof Kozlowski:
>>>>>>>>> On 09/12/2022 09:54, Alexander Stein wrote:
>>>>>>>>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof Kozlowski:
>>>>>>>>>>> On 09/12/2022 09:33, Alexander Stein wrote:
>>>>>>>>>>>> It takes some time until the enable GPIO has settled when turning on.
>>>>>>>>>>>> This delay is platform specific and may be caused by e.g. voltage
>>>>>>>>>>>> shifts, capacitors etc.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>
>>>>>>>>>>>>    
>>>>>>>>>>>> .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4
>>>>>>>>>>>>     ++++
>>>>>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git
>>>>>>>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
>>>>>>>>>>>> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>>>>
>>>>>>>>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>>>>>>>>         maxItems: 1
>>>>>>>>>>>>         description: GPIO specifier for bridge_en pin (active high).
>>>>>>>>>>>>
>>>>>>>>>>>> +  ti,enable-delay-us:
>>>>>>>>>>>> +    default: 10000
>>>>>>>>>>>> +    description: Enable time delay for enable-gpios
>>>>>>>>>>>
>>>>>>>>>>> Aren't you now mixing two separate delays? One for entire block (I
>>>>>>>>>>> would assume mostly fixed delay) and one depending on regulators
>>>>>>>>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you miss the
>>>>>>>>>>> second delays in your power supply? If so, the first one might be fixed
>>>>>>>>>>> and hard-coded in the driver?
>>>>>>>>>>
>>>>>>>>>> Apparently there are two different delays: reset time (t_reset) of 10ms as
>>>>>>>>>> specified by datasheet. This is already ensured by a following delay after
>>>>>>>>>> requesting enable_gpio as low and switching the GPIO to low in disable
>>>>>>>>>> path.
>>>>>>>>>>
>>>>>>>>>> When enabling this GPIO it takes some time until it is valid on the chip,
>>>>>>>>>> this is what this series is about. It's highly platform specific.
>>>>>>>>>>
>>>>>>>>>> Unfortunately this is completely unrelated to the vcc-supply regulator.
>>>>>>>>>> This one has to be enabled before the enable GPIO can be enabled. So
>>>>>>>>>> there is no regulator-ramp-delay.
>>>>>>>>>
>>>>>>>>> Your driver does one after another - regulator followed immediately by
>>>>>>>>> gpio - so this as well can be a delay from regulator (maybe not ramp but
>>>>>>>>> enable delay).
>>>>>>>
>>>>>>> The chip has two separate input pins:
>>>>>>>
>>>>>>> VCC -- power supply that's regulator
>>>>>>> EN -- reset line, that's GPIO
>>>>>>>
>>>>>>> Alexander is talking about EN line here.
>>>>>>>
>>>>>>>> But this will introduce a section which must not be interrupted or delayed.
>>>>>>>> This is impossible as the enable gpio is attached to an i2c expander in my
>>>>>>>> case.
>>>>>>>>
>>>>>>>> Given the following time chart:
>>>>>>>>     vcc                  set             EN
>>>>>>>>
>>>>>>>> enable               GPIO             PAD
>>>>>>>>
>>>>>>>>      |                    |<-- t_raise -->|
>>>>>>>>      |
>>>>>>>>      | <-- t_vcc_gpio --> |               |
>>>>>>>>      | <--        t_enable_delay      --> |
>>>>>>>>
>>>>>>>> t_raise is the time from changing the GPIO output at the expander until
>>>>>>>> voltage on the EN (input) pad from the bridge has reached high voltage
>>>>>>>> level. This is an electrical characteristic I can not change and have to
>>>>>>>> take into account.
>>>>>>>> t_vcc_gpio is the time from enabling supply voltage to enabling the bridge
>>>>>>>> (removing from reset). Minimum t_vcc_gpio is something which can be
>>>>>>>> addressed by the regulator and is no problem so far. But there is no
>>>>>>>> upper bound to it.
>>>>>>>
>>>>>>> What exactly is your EN signal rise time (should be ns or so)? Can you
>>>>>>> look at that with a scope , maybe even with relation to the VCC
>>>>>>> regulator
>>>>>>> ?
>>>>>>
>>>>>> I checked EN rise time using a scope, it's ~110ms. I not an expert in
>>>>>> hardware but on the mainboard there is some capacitor attached to this
>>>>>> line, which increased the time, independent from the internal pull-up.
>>>>>
>>>>> This does seem like a hardware bug right there, can you double-check
>>>>> this with the hardware engineer ?
>>>>
>>>> Yep, checked with hardware engineer. An 470nF is attached, together with an
>>>> open drain output and only the internal pull-up. So yes ~113ms rising time
>>>> until 0.7 x VCC.
>>>
>>> I don't suppose you can have that capacitor reduced or better yet, some
>>> external pull up added, can you ?
>>
>> Actually our HW engineers have implemented a similar RC circuit to
>> provide a hardware delay for the EN signal. I think this is due to a
>> design note in the datasheet (see chapter 7.4.1) and therefore it's
>> probably widely spread.
> 
> RC delay circuits are very common when tying a control signal to a power
> rail. I'm surprise to see it recommended (with such a large time
> constant) when the EN signal is actively controlled. It makes sense if
> the SN65DSI83 supply comes up before the GPIO can be actively driven low
> (for instance if the supply isn't manually controllable but tied to an
> always-on power rail), in other cases it's quite counter-productive (I
> really hope the EN input has a Schmitt trigger).

On our hardware there's also a pulldown resistor parallel to the
capacitor which makes sure EN is low from the beginning even if the GPIO
is not driven yet.

I don't really understand what the capacitor should be good for, or why
TI recommends it. It looks counter-productive to me, too.
