Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8AA3C8160
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 11:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389B96E1D8;
	Wed, 14 Jul 2021 09:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00065.outbound.protection.outlook.com [40.107.0.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053516E1D8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:19:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKxBdUVvRQrgem8ymWoGr3giEkZ8RqfJ7S55jN/gsVfZgIto5vcKAa6rGuBHmNyKhu5VN13kX71eMHZlU1Uyp+rqTrA3eYmatHg2CbODLIyEjEeXZcl02de5AvCLIAwxcKGdOYCXnc/uxSOtcbvhh2sdBVffnRLPHYPT+UVbDI+ztsoNZpF3SXye+EXRvQdtwzlB1m/UxBwww2HP8HvqJMm3s6NzSp8VWw4kS6p8WAplHP+n3jdRfHWzEQENDry4zELUFRbCN5suEggDvBKFqJ0F/HG/2Z7g/HLP+WtPVcNRa0Ae+aX0yA6MuZQz1KP9ChZzJ++R8kLhvwmYlmmRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQsy4ZKJ0Ez5bIpR/+Ah/ZKiUK/KrzAL8RpnJr+GIfg=;
 b=l7s8BINtXQ27hhF4zNFwaB/LcZJ9oDcccT0j945JnTYSjKjuFs6Jkf/x79s8c6EvTuODfGDi3r7xC4bUS5jjpk0uYEI2Tmc/9CK/xugPB4ZLAuTtaniKDOE6rJQxDNksYZ6itlumBkmpsWPrSkAU88OoOifYoP4baPabVjO0H8SH7aiqB0bJ7lVGUT1we9qtJoudarYDfChAidWHhNWZMraI/6sKle18vOQ9rVPVskQKV/6U8N7tDe3coVZTRC3awQyQ9hX/1VlYTRCoCrtKYUXRnf6wVjUtdyuDjxOGzb7/RU8LxfJ4UHz3vl8RcQRYaHl7dThEDZA4npgh8qodkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQsy4ZKJ0Ez5bIpR/+Ah/ZKiUK/KrzAL8RpnJr+GIfg=;
 b=SKCeNWo8FEi8s6A6kyhZ6qVil6CikffYp42pB6gjLUqVsdPBQMUZ8mtKvembhpCe+TxDzV1TAun5t/8e2T2zZIfyXvH+w7A0rXuorClaKaA3NVK45W9Oi8RXzBDUkWS/zu/UVMCBv9evbn0BhgGwziwcWW1UyBMWynsd26B04CM=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none
 header.from=wolfvision.net;
Received: from AM0PR08MB4516.eurprd08.prod.outlook.com (2603:10a6:208:13b::14)
 by AM9PR08MB6803.eurprd08.prod.outlook.com (2603:10a6:20b:301::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 09:19:37 +0000
Received: from AM0PR08MB4516.eurprd08.prod.outlook.com
 ([fe80::490d:17f7:8463:c167]) by AM0PR08MB4516.eurprd08.prod.outlook.com
 ([fe80::490d:17f7:8463:c167%7]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 09:19:37 +0000
Subject: Re: [PATCH v2 1/2] dt-bindings: display: rockchip: Add compatible for
 rk3568 HDMI
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, hjc@rock-chips.com,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 algea.cao@rock-chips.com, andy.yan@rock-chips.com
References: <20210707120323.401785-1-benjamin.gaignard@collabora.com>
 <20210707120323.401785-2-benjamin.gaignard@collabora.com>
 <1bd64284-0a20-12e3-e2e7-19cdfdbf1a25@wolfvision.net>
 <3865833.Ac65pObt5d@diego>
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
Message-ID: <33532a38-52e6-179a-9ed9-76bbb9618168@wolfvision.net>
Date: Wed, 14 Jul 2021 11:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <3865833.Ac65pObt5d@diego>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::15) To AM0PR08MB4516.eurprd08.prod.outlook.com
 (2603:10a6:208:13b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.125] (91.118.163.37) by
 AS8PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 14 Jul 2021 09:19:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c961f310-a969-4dce-b761-08d946a88088
X-MS-TrafficTypeDiagnostic: AM9PR08MB6803:
X-Microsoft-Antispam-PRVS: <AM9PR08MB6803A0EE62EDF6FE30FF62BBF2139@AM9PR08MB6803.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WBxII1fER60rQ28MmPd0Sv9qWEA8VU6IR09oz2/6W+qjBYMmPLZoTK05eg5rAyHdpPlOK2KIcTOvbWE7H3MhejilWeod0N77bKEzdSEVn9V787cIFTJOzfFSs+IYeE6OGryUlmwxcaGnmNCAbZ2upFGB9XttFfAR+YyxqH0Zg9aE4oiYdkbrQcgPjncb4ofTUewGwtnllD4eIsznW1iuMWR1hOgoRljrWOfbVmD3xjRckL0BZ63MsANHMrtAOi18ogKJBvPq1pDvLAgt+d8KUOC02lpBLRmx6vQSR8w9UOaQ7x+WFXzwHUx5nm4jEEAgS45e6SQw4q0mPwActjfvxwtYHkF2vW9I1GwSInuBz2Ysvg6tvmAt5xExDRI8m5t2c67Yu3oAS3BhfUALnToJowq9Vbs83Q+hZ+GJ7Ovz3QG2pbasfzKTDiovlwaVkHQY21wdmjf3DbjG3rjQoyuvGmXBf8L5nbcVPZzCuB3yBi7XURaW3CD8WsN7h//Dx/ePbusbar72SgZ6NBS8h6osG6DPkKiQ+TpJKoJXHPuilL0snfnhS9JBCRUJtfYwpkP99/UMpzJUucK7gslKGWM1AV/xk1H/xL1mGz8HYZDVvTEvtsO4qDNf1gVoK4nnUVyoFvSH0tR4jy8e/KKBnKANa5nYBUkDdz7r9eVkYe7HyDwJs90sjI6ppqndSTTKJHBwm808MoOZhmk5St1uIajbi7iG5kKMj06e2LpkrQh70YnvfEIrrGzDsfZ49bpNOsKBvwzhbs9Ku4VAiNyXOe/ZNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB4516.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39840400004)(376002)(396003)(66946007)(66476007)(66556008)(8676002)(2616005)(7416002)(186003)(83380400001)(8936002)(316002)(53546011)(38350700002)(52116002)(38100700002)(36916002)(66574015)(5660300002)(110136005)(44832011)(2906002)(16576012)(478600001)(36756003)(31686004)(4326008)(6486002)(86362001)(956004)(31696002)(966005)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXEwSW1TNGhUTVFYSklqcTg4bmlPYldkaGpHeUdKbTU0UzM5NEI5aGNoMFla?=
 =?utf-8?B?U2lXRDNCbXUzOXpwNVBBVmhWeTdocHFxaldNNmorKzh2Q2k2T1JVSE5kbGEw?=
 =?utf-8?B?MVIyY2lZZDJGY09kNitieVNSMndnTmtCcTdFT0JqUWs1OXRIazlPdVZxKzE2?=
 =?utf-8?B?azFsSUQ2SWNaK2JNWG1SeTRiQ2E4eUZlZjZjN0RtY0d1OVJoTVdvSGZVQ01H?=
 =?utf-8?B?MVFTY1VwWkZmb2lHSjlzKy9qc2t3K09ITWs3VVp5NURLL05nQjB5TjdJME5N?=
 =?utf-8?B?YmtFOUpqaTdXNzdZejQzU0x3dm43eDFjYXRXMmpBSkNaalBCMUJQamJFZnly?=
 =?utf-8?B?Mmp1eWhPRytQRG9CODV6UGpUTFp0eG83eFBBNU5FQ1JuUGJJaEk3RW9LcVBp?=
 =?utf-8?B?RkRhYmpxd3NUd0xIMEdkSFN6cDY5M3cvbTArSjEzajFuclkxL3oxa3l3dzBB?=
 =?utf-8?B?YzhQQzNjdEdxYUd2ZjFPU0s2VFgxM2hMbWxGbVdxdmVGYnVkVE80ZjRORlFz?=
 =?utf-8?B?SXFiZXhkWWRlMHFLMjR1bUVseDRuNXZobGdoU05GZDZBbEwyRTZXNE9ZNW1s?=
 =?utf-8?B?clplbGdiZVVWeXRIeFMwUnR5cGtBUVhsbzNPbVBSbWVIUHRMaG1xTDNRcGxn?=
 =?utf-8?B?YWRBSGpCTDkxRVIvS3NSNWk5elVhallKTFdrek1pWEs3NklyY0l5dDZpZjNX?=
 =?utf-8?B?QWVQUnYzckFiNHFReDhIYkVVa24zdTRtMENlSlZwNmdsS0NKdE13RG9LdElS?=
 =?utf-8?B?aGgzN2hKQnpKWFdNNmpNdGJHUFlpR04rVndZM0x5ZmJCVGFJajdFK2wvVE10?=
 =?utf-8?B?K2p0aUNrOTZiY0Iyanh0dkV2UE9hbitoTFloWnY5RGZCTnZhLzF5SHZEUi9M?=
 =?utf-8?B?VnlUZXBwdmIxWHFVWUp3RUFjUWFlTS9iUEI1K3BNZ0ZsbC8wOHJkK09sMjQy?=
 =?utf-8?B?YVBXMnNZVjFLbHRteUoyYzUydEZncStKUEluMDcyckV2Wnl6WFBORVdGTHBj?=
 =?utf-8?B?dFVsbVFXOGJnK2g5a0tLYXJobzRkZVJCbytHU1RqOU1BbGlST3F6UHRORDly?=
 =?utf-8?B?WDR2NkJCR0l3OGRTRWVXRFd3cUNLWCtvS0dhR3Q0Vm5wYm9FMFlUeThxa0JF?=
 =?utf-8?B?bjc0dXRqRU51ZXgxRTVicVdoZU85Vlk4WU5zdjdvOFZTMnBqWlI2VjZMdjNL?=
 =?utf-8?B?czdyejZYSVRsSVZBOXV2S2lwTjJFajVTekdtVkxOd3lMNHdpd29VTVc2QUhq?=
 =?utf-8?B?ZVhxMXJubFZERnd6dHJJaUgxK3RjL2VleFR3YlZpajhYU0hmL0hyUGYzNHl1?=
 =?utf-8?B?U0tGUi9oRGxrUHdwcmR6WXVoeGV2MjdqN2xuM0dya3dLUmxuL0pGVEUxbndO?=
 =?utf-8?B?M0FYdHp5aFVpK1UyRWNxR0I5SzJFU0VBZjNQY3pHUXlpRjYwMlI4SjE5d3VY?=
 =?utf-8?B?Z0hCSk9ieUdUR2xnak1rUEdOTlBmK2R4MElxTkxQbXkwOVloeGl5SHhsRURY?=
 =?utf-8?B?eUdZTUVaeUtpbUticjNrRzZGOFlWZEgxSTNQdFIvejhidCthd041aVZ5cEVL?=
 =?utf-8?B?bU8zblRLa2xxZ0ZEYnB5cFRWTWhsdCtaRGVzTmFRTWxnYWpuT003YlVsSjRG?=
 =?utf-8?B?ZHhKWmJRWllXc051dDE2OWtRajZOcjVTYkZHc1o1VG44RFp4RTlCUHBaZlBR?=
 =?utf-8?B?a3lRbjZuQUhGSXJCbTZ1SHBpODIyaG5Ta25Mc1VmT2VMdHQ1OWpFWDlBam5u?=
 =?utf-8?Q?FafsklQSJKoLVGlK5cYKrVxcfkVPP5fpl/324WZ?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c961f310-a969-4dce-b761-08d946a88088
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB4516.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 09:19:37.5588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jf55n0gRjyk0PTCuKIqAPmhdF0aTFfwaINjDoQSCKN+cUw1AsctfOjxCwLVpQ4x+3P/hXjMvxRQsrBq3c1aFWf6/lRBhjYC3DguyRMtBlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6803
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Heiko,

On 7/13/21 10:49 AM, Heiko Stübner wrote:
> Hi Michael,
> 
> Am Dienstag, 13. Juli 2021, 10:44:00 CEST schrieb Michael Riesch:
>> The HDMI TX block in the RK3568 requires two power supplies, which have
>> to be enabled in some cases (at least on the RK3568 EVB1 the voltages
>> VDDA0V9_IMAGE and VCCA1V8_IMAGE are disabled by default). It would be
>> great if this was considered by the driver and the device tree binding.
>> I am not sure, though, whether this is a RK3568 specific or
>> rockchip_dw_hdmi specific thing. Maybe it can even enter the Synopsis DW
>> HDMI driver.
> 
> I do remember that this discussion happened many years back already.
> And yes the supplies are needed for all but back then there was opposition
> as these are supposedly phy-related supplies, not for the dw-hdmi itself.
> [There are variants with an external phy, like on the rk3328]
> 
> See discussion on [0]
> 
> [0] https://dri-devel.freedesktop.narkive.com/pen2zWo1/patch-v3-1-2-drm-bridge-dw-hdmi-support-optional-supply-regulators

Thanks for the pointer. My summary of this discussion would be the
following:

 - There was no consensus on how to handle the issue. The voltages still
have to be enabled from the outside of the driver.
 - Open question: rockchip-specific or general solution? (one may detect
a tendency towards a rockchip-specific solution)
 - Open question: separation of the phy from the dw_hdmi IP core?

First of all, IMHO the driver should enable those voltages, otherwise we
will have the same discussion again in 5-6 years :-)

Then, the rockchip,dw-hdmi binding features a property "phys",
presumably to handle external phys (e.g., for the RK3328). This fact and
the referenced discussion suggest a rockchip-specific solution.

In the Rockchip documentation (at least for RK3328, RK3399 and RK3568),
there are two extra voltages denoted as "HDMI PHY analog power". It
would be tempting to add the internal phy to the device tree and glue it
to the dw-hdmi using the "phys" property. However, as pointed out in the
referenced discussion, the configuration registers of the phy are
somewhat interleaved with the dw-hdmi registers and a clear separation
may be tricky.

As a more pragmatic alternative, we could add optional supplies to the
rockchip,dw-hdmi binding and evaluate the "phys" property. If the latter
is not specified, the internal phy is used and the supplies must be
enabled. Would such an approach be acceptable?

Best regards,
Michael

>> On 7/7/21 2:03 PM, Benjamin Gaignard wrote:
>>> Define a new compatible for rk3568 HDMI.
>>> This version of HDMI hardware block needs two new clocks hclk_vio and hclk
>>> to provide phy reference clocks.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>> version 2:
>>> - Add the clocks needed for the phy.
>>>
>>>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml         | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>>> index 75cd9c686e985..cb8643b3a8b84 100644
>>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>>> @@ -23,6 +23,7 @@ properties:
>>>        - rockchip,rk3288-dw-hdmi
>>>        - rockchip,rk3328-dw-hdmi
>>>        - rockchip,rk3399-dw-hdmi
>>> +      - rockchip,rk3568-dw-hdmi
>>>  
>>>    reg-io-width:
>>>      const: 4
>>> @@ -51,8 +52,11 @@ properties:
>>>            - vpll
>>>        - enum:
>>>            - grf
>>> +          - hclk_vio
>>> +          - vpll
>>> +      - enum:
>>> +          - hclk
>>>            - vpll
>>> -      - const: vpll
>>
>> The description and documentation of the clocks are somewhat misleading
>> IMHO. This is not caused by your patches, of course. But maybe this is a
>> chance to clean them up a bit.
>>
>> It seems that the CEC clock is an optional clock of the dw-hdmi driver.
>> Shouldn't it be documented in the synopsys,dw-hdmi.yaml?
>>
>> Also, it would be nice if the clocks hclk_vio and hclk featured a
>> description in the binding.
>>
>> BTW, I am not too familiar with the syntax here, but shouldn't items in
>> clocks and items in clock-names be aligned (currently, there is a plain
>> list vs. an enum structure)?
>>
>> Best regards,
>> Michael
>>
>>>  
>>>    ddc-i2c-bus:
>>>      $ref: /schemas/types.yaml#/definitions/phandle
>>>
>>
> 
> 
> 
> 
