Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D203649ABB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 10:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A57D89B46;
	Mon, 12 Dec 2022 09:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2097.outbound.protection.outlook.com [40.107.20.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9487E89B46
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 09:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckLpBevNkVWtIyXaRNVC2Z4kKNtzWpbnOltyksm8ai+A2MwW1kXTpqD4CsIiJczcyiBoWbUTVcTJxuMdWy9zqgmSfJ+oXG1sHpl1e4lDG/G3wyzRpHpiXLkgy6TOvRWv4pa34I8WSYWqG8hq5mZu3iXub/TSmHUqF2leIQZ5aOaLjT8yh9DkiFoKRmiGhNYhSumt3aNQhGXLQDuErw1VPcLxHUfbMrsSZ1q0IgWT70FG/4XBj3mTTBuo1wxkP9dil46IDUhsp7Y8B9N7QhLt+fpJ9SHfMbZLjjMG/KXL+Ue4syuev8PDF4Y6V8+L15qUg1N1nBz6gZ4RjA4Au69yyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbkmC9wabB5Zbzrj/1nClL1jCSKLj2N+4TBUDn1hDkE=;
 b=lrvIbxvVSy9I0CXwK20RE177JVlRVJAnTqdknVmeYQY+d0pnWlOQQk9GCGsHo62SckdvBM8QRdgneDA1UgteYYNYuTkGyfTE7eR71RSFPeDtGp6EElWvA2YufZBHztRUSPNPzscM5wsu2jsxIIytyHxoIysllQR28+6VQ37hJug8cdpjIJFLF/qSe5c0UswyRtyGS0hBYLrQqMC9D4bIPuwnPb9915h8wvx92NT0GgrUsuxV0gKIdMyXBLup6/pKsJtepjAv9jYFW/xforPtMtQIgqIIe2ZbLwgDFDYR5PyWhu7Bz7JBTpt6t1zRhH0dzauwCCldkz5IC1sPHVpevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbkmC9wabB5Zbzrj/1nClL1jCSKLj2N+4TBUDn1hDkE=;
 b=FBV69ITvLhk/TlyspJrD4e9m5B/4Mk27P4+kuTrJyMgujvdujjdbm+mtxBj7jcb5w4RdET9x5bn2oCpBCpkbPk/yub7XeOn7KGHECnUg36pgcNHyOFjURnHrAMVbNgMQjgySQvB0oiYps5Isxc9KLTNxqVTWFt3ALM086+gfoDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB6033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 09:09:47 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 09:09:47 +0000
Message-ID: <9f8b1c17-0bc5-ae99-b7b1-cb2f52f9310d@kontron.de>
Date: Mon, 12 Dec 2022 10:09:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add enable
 delay property
Content-Language: en-US
To: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
 <45157029.fMDQidcC6G@steina-w> <6da2330d-516e-7dc4-a000-1e68c7f7887e@denx.de>
 <2735716.BEx9A2HvPv@steina-w> <c6f2cc52-41c6-028f-4d3f-e8a4d5d73dcd@denx.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <c6f2cc52-41c6-028f-4d3f-e8a4d5d73dcd@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd70093-d213-4785-bc8d-08dadc209dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CxFoBkqe3rbt0JPZxhT4MmtOmqeS0QFkMzL/ZuZgGXk2Touef19vFh+RgowiqyPQrp1HR3feTqS0YqDRAxXWRgtIb+fv+E6Fh3GIcNOrngfgkC/7BDnTGWWj4KCRQmyLBHhpLksAR8U/X8EoUfptt6SnLwhEnA1yeCzXnQYSGwP/aLew+7/F2TQaWH1hxknoD1INCyd8eNa/tONs+pqSegNKdBJGpMFdfIxvbZ0GJuYudJd5xf3uYMLKk6mhmkJ/MYf918KM/2dzgWrYKlggH0+HhpPJ69q+8EvWRXm+ByuUkiu294Z/MBv3TU8wBcvxRdyydWMgyPYy5PegebJeXY/Gy63kyBTik6zWcyy79uVq8H86At1ktNNKj37mlI0+/dv+W5KBqybvZQkCcrMCkMHzS8BqVSOAvTsaMnHEDjJUCiiBBAaPowc1pdra5Er1R/yXdDIZRtCO59CMmocBN5TAg7Ykp23+gzbZ/ierx5GMsIB6/l4omBZ6oJ+cHWSvkaZ3TTSu3ZcREPRQUbBTSTT16nBdvzBUzWzaGJ0Q9zg1iUUlV8TH6LC3fMOhjCCgY2DmUikoaE3lKkvjnAagO++KXrZhp2AbNA+8aZGD/xaYUoxoUMuH44gDN/7UyjlgW0dre+JYWQx1B8sJgB2Ic+deJinvvLgFDJ9+J+U/SdZLI81a5yYOR6BYGsTNVHXvUyhDaYpPT/2cVOmCqezphnzqpaYdNrwU3X+ov6tiKQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(31686004)(36756003)(86362001)(31696002)(6486002)(478600001)(110136005)(316002)(38100700002)(54906003)(186003)(6512007)(6506007)(53546011)(2616005)(66476007)(41300700001)(66946007)(66556008)(44832011)(7416002)(2906002)(5660300002)(8936002)(83380400001)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHZyVW51OHpTQzBpYkhCTUttUmR5RDBldzBzd3RiM2hVSjE0SXlwejRSUUh3?=
 =?utf-8?B?UlJQQ1crK3loRHNsbVVtczZQWVd2SjllTnBzTE12ZnVSUk5LK0ZzQlpOWkho?=
 =?utf-8?B?M2ZTSzUwTUZCRURsV3FvZWZ1bVFmK1pjejhDdDVJdHFsTmUwOGl3dUI0dGVh?=
 =?utf-8?B?NEMyK2x5aTZTZG9MY2doMDR3VTlkTlF6L1pYV3VtOVpQMXNwbmtCcUg3NDgy?=
 =?utf-8?B?NXFxN2tmdkxsS3ViNURPdTlYN2xxeTdFUWUwb09PNnNmbTF0TkROYzdoM0hH?=
 =?utf-8?B?RUovVy8yRy9OWDVxYko4cWRxUHQ4a0dHZkl5RkRiY1U4Ukx2VDdFZWpySlVU?=
 =?utf-8?B?VkRaSXpOV3JJb2kxZG9qbllQUHc2b2NuS3FLVWNWSEhnZGp1WGtFOEM0MWJq?=
 =?utf-8?B?ZU5XZFhVL0NQeGY3U1NOc3lneGhBamg4dVRKWXZXTmxVRVJrcXFLSFUveVU0?=
 =?utf-8?B?K1pIZU81RVRYaC8wV095V1FsRGZ4NFNBeFRDVXBMRDlhK0ZnZDZvVGcwUjZG?=
 =?utf-8?B?OE93eGxNK2JIcWthUXduQThsMVNpVEowdmwyVDVBZkt5Vm9iYnE5NWl3MlNj?=
 =?utf-8?B?V0V5U0lPSmVldzhObGRacFlEZmkvQzZiOTVNWkF5MDFXYkwrSHE1cVhwbFVo?=
 =?utf-8?B?eVhLTm4rMGFIQVdiNWdLUUNZZFZweW52dUlkUXVUaEJraE9HZ2tJRmJKeFl0?=
 =?utf-8?B?VEEyN3Y2eFNvWUprcjRoeWVONGdZWFlvZ2VEN3hNRU1ZSkQ1V0IxZHQxalhF?=
 =?utf-8?B?TWZ2VWtzM1RMM1FOK3FIUWwydHd0QlVkcVVYWVNMZ2FpQUpNcDRoNmZCNmRn?=
 =?utf-8?B?WkIzQXc3aW9nOHpCVWZ0d0Q4TDhOUk4ra1ZrbndQY0pVcGdVN1RBdjRHUVZI?=
 =?utf-8?B?Mzc2ZG80bjBxbVRMSmNVdnpUME5BcjdrSHM1L3JZZ2lZc2hrTnQ4T2FXUWsr?=
 =?utf-8?B?cUpXM3FIa3BwV2ErZ01GVE1lN2hKQS8vYkVjVkN6a3NsUHlTdkJOcEJ3akxL?=
 =?utf-8?B?SlFNc05zR0lRdUZFeXFxMEdabE9DTWhWVm1SaGZ6dWZXeE11ZUFZQmhiUG5G?=
 =?utf-8?B?dkozUkpxazVheDdUaWg0aVpYd2RnOTFCOGZvRlNIbFk3Q2FjWUxLQ1E5Q0NC?=
 =?utf-8?B?QkUxSnhHVUNUQVYwOEhiVzBGQWk1Zm9mdWl0Sit6WGJJKzJKRXc5ZEVZaTVQ?=
 =?utf-8?B?QXMyUWJ1WGVWbUsvYmdPemxrYzJIdGkzYzVBUDN0SU5kSVpuVHFoZjlJc0c2?=
 =?utf-8?B?YWxiQmx5RXpBc1Bva3MxaUwycTViL0FiN0taNXVaYUFhOVNaQXlDSTBjQUFR?=
 =?utf-8?B?UzNJbW5qZHFTelFGUlM2c1EydFQ2Y0ZLWStTbC8vZGQrOFhJdEQxa3dsRTh4?=
 =?utf-8?B?WFh1SjZ6U2xNZWxmbVptd0FtcGtPb1lMSDUzbVV6MUZ0eVR0bXlKOS9wVk8z?=
 =?utf-8?B?VkpVVjJnUlNkeVo1ajArdmh1Y240QXdub1lKZFVTY3Z1bW5FMlp6NDc1K0ZE?=
 =?utf-8?B?S3h3V0xtWnJ5KzhSUmdJTEVTVk96ZmVPM3FxTW95bGlqYmttOVdUWmIxYzV3?=
 =?utf-8?B?aStrK3YxNEhNOGJDeFNxRDUxWkxucDh5VXJaK0ZrZkhkSWlZVWxTbGV5SU1u?=
 =?utf-8?B?SU4xU01EdHliQ0UzTkplSFFVbGtndGhVYU81aGJvY2gvVHNISVF6NDRXemVF?=
 =?utf-8?B?RWpTYlp0UkxDc3BtTThZQ0pMM3ozcWhIWUtSOEwvTkFlRitGNWgwR2RveGdW?=
 =?utf-8?B?RVRDZWdTWjNYWVRhQjJCQTZ0REl2Ly92c05tM0NNMzhqM0owZHZER29PTWlT?=
 =?utf-8?B?b2t5RkxUVjI1dGNFQkpwdTdSbWJNWjkzTk1NbW41czdYS0c4MDhnV21hcFFZ?=
 =?utf-8?B?Z20vdlk4VU0xVHFGQmlmMEl5bkFLeU1QMVprRGIwL1hzUkdPaE9qOE8yN1dz?=
 =?utf-8?B?K2kwbHk2Rkt1aEhvL1Uwc3hDaEc3Qkx2dnVEV0JXdThjZDJlSHFpYUNTSWt2?=
 =?utf-8?B?UWV1SWwzZEFxNU8rMXF0S2NVbE5PdVByaHZuZm0wS3dKeEg0QWxheFhYd1Uw?=
 =?utf-8?B?NkdyTFU0Y3JINUxEQ0NDS1VDRkZ5aXJSTUs2VkJZcnpMSnNCK2JVTmJZVlQ4?=
 =?utf-8?B?bE5oRlJtOVg3WUVuMm90YXZZMmZIdmx6U0xxZEtlYkIyakhPZWpuMzg4cjN0?=
 =?utf-8?Q?b+6EhERsPAI+eGD/9orjW8b0QORmEwb9UronMYYERC0J?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd70093-d213-4785-bc8d-08dadc209dfe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 09:09:47.5377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21riAxZkRA2e0dzpmTHRJ7Gon6/UmeuVnFiuJXQqq43x89v25jx0bcfgiSPUcdfZYMrAD57QGIqG1PN1YPmOKre+BzeyHsrEHOTOPGjVv58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6033
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.12.22 15:49, Marek Vasut wrote:
> On 12/9/22 14:38, Alexander Stein wrote:
>> Am Freitag, 9. Dezember 2022, 13:43:02 CET schrieb Marek Vasut:
>>> On 12/9/22 13:21, Alexander Stein wrote:
>>>> Hi Marek,
>>>>
>>>> Am Freitag, 9. Dezember 2022, 13:02:10 CET schrieb Marek Vasut:
>>>>> On 12/9/22 10:36, Alexander Stein wrote:
>>>>>> Hello Krzysztof,
>>>>>
>>>>> Hi,
>>>>>
>>>>>> Am Freitag, 9. Dezember 2022, 10:07:45 CET schrieb Krzysztof
>>>>>> Kozlowski:
>>>>>>> On 09/12/2022 09:54, Alexander Stein wrote:
>>>>>>>> Hello Krzysztof,
>>>>>>>>
>>>>>>>> thanks for the fast feedback.
>>>>>>>>
>>>>>>>> Am Freitag, 9. Dezember 2022, 09:39:49 CET schrieb Krzysztof
>> Kozlowski:
>>>>>>>>> On 09/12/2022 09:33, Alexander Stein wrote:
>>>>>>>>>> It takes some time until the enable GPIO has settled when turning
>>>>>>>>>> on.
>>>>>>>>>> This delay is platform specific and may be caused by e.g. voltage
>>>>>>>>>> shifts, capacitors etc.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>>>>>> ---
>>>>>>>>>>
>>>>>>>>>>    
>>>>>>>>>> .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4
>>>>>>>>>>     ++++
>>>>>>>>>>     1 file changed, 4 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git
>>>>>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>> index 48a97bb3e2e0d..3f50d497cf8ac 100644
>>>>>>>>>> ---
>>>>>>>>>> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>> +++
>>>>>>>>>> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>>>>>>>>>>
>>>>>>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>>>>>>         maxItems: 1
>>>>>>>>>>         description: GPIO specifier for bridge_en pin (active
>>>>>>>>>> high).
>>>>>>>>>>
>>>>>>>>>> +  ti,enable-delay-us:
>>>>>>>>>> +    default: 10000
>>>>>>>>>> +    description: Enable time delay for enable-gpios
>>>>>>>>>
>>>>>>>>> Aren't you now mixing two separate delays? One for entire block
>>>>>>>>> on (I
>>>>>>>>> would assume mostly fixed delay) and one depending on regulators
>>>>>>>>> (regulator-ramp-delay, regulator-enable-ramp-delay). Maybe you
>>>>>>>>> miss
>>>>>>>>> the
>>>>>>>>> second delays in your power supply? If so, the first one might be
>>>>>>>>> fixed
>>>>>>>>> and hard-coded in the driver?
>>>>>>>>
>>>>>>>> Apparently there are two different delays: reset time (t_reset) of
>>>>>>>> 10ms
>>>>>>>> as
>>>>>>>> specified by datasheet. This is already ensured by a following
>>>>>>>> delay
>>>>>>>> after
>>>>>>>> requesting enable_gpio as low and switching the GPIO to low in
>>>>>>>> disable
>>>>>>>> path.
>>>>>>>>
>>>>>>>> When enabling this GPIO it takes some time until it is valid on the
>>>>>>>> chip,
>>>>>>>> this is what this series is about. It's highly platform specific.
>>>>>>>>
>>>>>>>> Unfortunately this is completely unrelated to the vcc-supply
>>>>>>>> regulator.
>>>>>>>> This one has to be enabled before the enable GPIO can be
>>>>>>>> enabled. So
>>>>>>>> there is no regulator-ramp-delay.
>>>>>>>
>>>>>>> Your driver does one after another - regulator followed
>>>>>>> immediately by
>>>>>>> gpio - so this as well can be a delay from regulator (maybe not ramp
>>>>>>> but
>>>>>>> enable delay).
>>>>>
>>>>> The chip has two separate input pins:
>>>>>
>>>>> VCC -- power supply that's regulator
>>>>> EN -- reset line, that's GPIO
>>>>>
>>>>> Alexander is talking about EN line here.
>>>>>
>>>>>> But this will introduce a section which must not be interrupted or
>>>>>> delayed.
>>>>>> This is impossible as the enable gpio is attached to an i2c
>>>>>> expander in
>>>>>> my
>>>>>> case.
>>>>>>
>>>>>> Given the following time chart:
>>>>>>     vcc                  set             EN
>>>>>>
>>>>>> enable               GPIO             PAD
>>>>>>
>>>>>>      |                    |<-- t_raise -->|
>>>>>>      |
>>>>>>      | <-- t_vcc_gpio --> |               |
>>>>>>      | <--        t_enable_delay      --> |
>>>>>>
>>>>>> t_raise is the time from changing the GPIO output at the expander
>>>>>> until
>>>>>> voltage on the EN (input) pad from the bridge has reached high
>>>>>> voltage
>>>>>> level. This is an electrical characteristic I can not change and
>>>>>> have to
>>>>>> take into account.
>>>>>> t_vcc_gpio is the time from enabling supply voltage to enabling the
>>>>>> bridge
>>>>>> (removing from reset). Minimum t_vcc_gpio is something which can be
>>>>>> addressed by the regulator and is no problem so far. But there is no
>>>>>> upper bound to it.
>>>>>
>>>>> What exactly is your EN signal rise time (should be ns or so)? Can you
>>>>> look at that with a scope , maybe even with relation to the VCC
>>>>> regulator
>>>>> ?
>>>>
>>>> I checked EN rise time using a scope, it's ~110ms. I not an expert in
>>>> hardware but on the mainboard there is some capacitor attached to this
>>>> line, which increased the time, independent from the internal pull-up.
>>>
>>> This does seem like a hardware bug right there, can you double-check
>>> this with the hardware engineer ?
>>
>> Yep, checked with hardware engineer. An 470nF is attached, together
>> with an
>> open drain output and only the internal pull-up. So yes ~113ms rising
>> time
>> until 0.7 x VCC.
> 
> I don't suppose you can have that capacitor reduced or better yet, some
> external pull up added, can you ?

Actually our HW engineers have implemented a similar RC circuit to
provide a hardware delay for the EN signal. I think this is due to a
design note in the datasheet (see chapter 7.4.1) and therefore it's
probably widely spread.
