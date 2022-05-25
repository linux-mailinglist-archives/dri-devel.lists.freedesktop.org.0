Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658F533D29
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 15:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6BA10F2A6;
	Wed, 25 May 2022 13:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2075.outbound.protection.outlook.com [40.92.23.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3726F10F2A6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJmpA0zXd0dr2yzhoZ5x210LPQXJnwzOsiFxPqU8nxFWNCvyjJvacb8HcM+5wCjEre90hcx/l1t2sPR1wNhzZBAQU7rZYJVcvmAqjl0CP7ahigYjRYOxEBVcbY2BGDS3oULr3MY1k26l52ybzme3Wyu8Bk3B//nGquhPs6iefohnmS/7jZFHuWjgbN8erLgvHVMcG2j2ayWU2gKuXUxMKHAzH1sG8BblyO9+ZNcot1QZCrNsVV4sjNdlpXLd5QtRK6IUV2KDe6OTQTLjjkqtTzzDeszm+erOsGr8dIiuZEpL+0hZH5MD+wIpunKCkvlZBXk8ZGepU6eV5Q57RUyuwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8wr6wl/CCBGhOuJDN2GHKtgz9DrY8qxIHlWYDCAPjc=;
 b=KcaQS+Lr93RxMx94/ymnBCpKFT+jaq1luaP5HfEx4xyeo6H2tuR5GllDbTzWbUibkWTkzCSwPSAzVXgdWJZeGBlhwsj8BM8NGoL570ZreoyY+9wCwxYzO5WjSELPrHch4J5tVh2SOIHTKRSoNS0uCD2h5xej5lIXJaTHCZ31jlh1gljjmZZA+m2B54+GDjDrRqefICrp9TFoxz6wmNORndmXW0eTenkqKQIL8dPkr4fQBTtkc083S7lXFXpexy2cHO0w3ofnI3vBRdEcCtWbpgqsVFt5U5zLXTnGlrP7hYLVPAtb8roowSV3NJqbUUKbl5OU7XlDpaUrmeMAyd7JRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BYAPR02MB4743.namprd02.prod.outlook.com (2603:10b6:a03:43::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Wed, 25 May
 2022 13:04:06 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%9]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 13:04:06 +0000
Message-ID: <BY5PR02MB70094BBCBE78A146A8C4CA0AD9D69@BY5PR02MB7009.namprd02.prod.outlook.com>
Date: Wed, 25 May 2022 18:33:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Joel Selvaraj <jo@jsfamily.in>
Subject: Re: [PATCH 3/3] drm/panel: introduce ebbg,ft8719 panel
To: Linus Walleij <linus.walleij@linaro.org>
References: <cover.1651835715.git.jo@jsfamily.in>
 <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CACRpkdYhkP9RYj98Lu=zkt+6aefx172R=8JtvOFpvh2uJ4byKA@mail.gmail.com>
 <BY5PR02MB7009831D8BC4DB2B34739CB6D9CF9@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CACRpkdZw+MwU42s8BWHkN2T3A-a-TGML8jJ0kQteMOE06m0UXg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACRpkdZw+MwU42s8BWHkN2T3A-a-TGML8jJ0kQteMOE06m0UXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [MH0SfL2yaLWPYC8YG5PuYySeDO4bUJ2z4f+gTErKT6p763BPRR4OamapwxW16J09]
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <b9faa80c-6e9e-e857-a57d-f84b648529f7@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef49c964-2ea9-462d-482c-08da3e4f0ba1
X-MS-TrafficTypeDiagnostic: BYAPR02MB4743:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UAERbL+/T4rBvrW3n9EIw1g7p7MdMVUdyb1jMjqlU3CL+DnSLxd/qWycYbzVPe0Sa/kuav73jJ7VfpRAuSZ11XFhriGE5i4ClDtwUwxO0hrwbRna/P7liJ25xllCL0Mdodh+r1PnampRIrHIOzlZ/ClP6y7D5EKIbuyRwk5v0g5gbeguHUx1C06zCJcCTB7dG9yP7RVC/g09HRgTSpDr+UB0fJ9PWKdu7cX6pcoy/Pr2l4zto3EQ1oRjx7ugA4VXQ+W7PMX6Q7T3Psz+epWCejJproWi39xlgvgFiUS4F+QccSmloi+2lu59gqGPIeNpf5Rcuz+GDtXuWAukFjABsU5lbI8eEoJQjon000h6Ot4Zzl8WFkZXzBmbasvKA4LUwaUvmfdXC/Y3JNkxTHNqAlyzKMONIVR3suqPPN1XSNuUDI0H7ALUxQAOLX/3N/HoWKUO/t99cJvPddRoVMIak9QTN0wD3JPdJaNrLVillj3ySyo48oaGXiSAOjHFbRl4ZklFg5fcvdwVyvzEi6xrNP4xfMzhNAtexUDzFltt6ClS7nhXRbVAPDmBIbusmYpwktVUuhYWc6Axrywa6zCk9g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05SUjdYcFJMQURta2RqK0Zqb3lVcS9kUDQvaDFiR0JUZEg3UDMxQ1ZuV0JU?=
 =?utf-8?B?YW9WU1IrUXRzYWJhaStSc2dkQzd2WDJTbldxY3dubEF2RGpiSG1VVUk0YmlS?=
 =?utf-8?B?WjkxNmU2eEp5N0VqeWlFMjUrSWExd25NVElsb1g2cFVjZG4vbktkbWlqcHZ4?=
 =?utf-8?B?enV1OElDdm5RdjBvYnkrblFaWEZ2Rjh6R0RxZlVZZVpOaTZoblpnYk5LNE01?=
 =?utf-8?B?eEVxd3JvRkVWR05SUlZUZCsyZWJkREFsWWFBVUJEMnVTL0U0ZnhQU2pVc011?=
 =?utf-8?B?ajBMMktoclViYmo5WlNRMFc4TFJtOXl6YXJHQUE3KzdUbE1wVjNQcGlhUjJZ?=
 =?utf-8?B?bGs5U0FQWllZc090VjdYMy9GaFg1WnFXb0M0NE9EWUVUMlpqYmNUL2ZQeEZ6?=
 =?utf-8?B?WGhsL0l3YS84d0ZLWGl5dGloWWhmWi9RUHFVSTdwRHlGS0gzTmdLWTVNVlZr?=
 =?utf-8?B?ekFZUFFnbGRRQWVLSktoZkRLNkxBOUFUYWdCZDNmTk0rQnpLMm1BQnc0anhU?=
 =?utf-8?B?TUhRNjlSbUlRVFM4cXVKUmRBYzNYZ0JvNFZEdHQrSWVJeWpHcGF0Z1V6NTRH?=
 =?utf-8?B?bDM2WG1JOEt3c0VtTERBZEs3eUlTVWt6b1JDRW9yalFJeUJMUjBIRTRiaUxq?=
 =?utf-8?B?TE94RUFlWXpmNDIwdFB4ajdBSDFwN25qdHZKb050dDV3NzZLekVlK0M4UEJx?=
 =?utf-8?B?TGxQWCttYnhhaGlSYzRtcDVpazJncmwxK2UxRWdaNE1OcTFTRXVtOFV6ckts?=
 =?utf-8?B?cGIrOUFEK3FCNThkREo5ZjBJenU4U0ZLZS9HRnNTRWt6SFd6NVFJVUFHRVBs?=
 =?utf-8?B?VkdDRnV6L1lESXB6Zm5XS0dtdko3Q3RLZVJKaFh0RnZaMUk0MnZyak1CWTVM?=
 =?utf-8?B?dTZ5L2FyQVJkSHpBWEQ4Q29JZE9aL0gzdFkxRU5kMEMwNVdUaVAxc1ZoYVBJ?=
 =?utf-8?B?Y1dwQXlaZ0dnVkdvd1QzMzQyRlMxQXUwUy9kMWdnbGI2VGswd1htaWxqdFRj?=
 =?utf-8?B?V2ZTaDdyUWVEcjQ5TktZN3l5TExWclo1dms3aG1Rc01oWFVYUzlHOWc3TUNl?=
 =?utf-8?B?aUEzVHozRVlNanJGQ2JrZmRWNm01L09VNWJmdTFCVXE3R1BuR09zanNvRGEy?=
 =?utf-8?B?MnBSSnZQeHZyenNSbXhkSElhclFtSUNGUUttS0lXWW93bk43SGRMYkNLOGJ0?=
 =?utf-8?B?bWpSZVQxKzZHSk0xU2hTN1hvQnFUUVp5ak41TC8xZW8yZzNEVldsUU5ycGpO?=
 =?utf-8?B?Q0FBTlljSnZOTmZNZTlCeU9zbVc3ZmJVTzdIbVJKK0dhR0ZrbHdUZ0h0U2py?=
 =?utf-8?B?c1pnOUlGWllTUGFXTUt3V3B6eGNHKzdXNVp3aFJzWXBnVUZhcmxFSmgvTWto?=
 =?utf-8?B?L3FoT0FnQ1FudmxMMFEvMXNBaDZkSHZIcTN4ZFF1dEpOOUFoczgySUtFbjRX?=
 =?utf-8?B?QnJQcWNSblZqcVpOb3VlTEx2OWFjRHZxWmlEOTFiYjhBM1R3WEV4eStKaVVa?=
 =?utf-8?B?MldURTlHVnJFeUo4VDZMNHNZMm9oa3E0MWdCckwyVDdyUmg1NVBEdVFJWTJ2?=
 =?utf-8?B?dzlWQnBzKzg1T2FzdmYzRWptWnk0a0pCcjFxa2NkNkd4WU1ZOFl2NXFaOTZ0?=
 =?utf-8?B?aGdvTzNoem1EK3ZGQ1NJcTFNVm05UUpoQWlaWWhxVzNHeW5zdXY5bVVoVncv?=
 =?utf-8?B?WnQxTUtXRUtRcUdDVnpFczhDWnAxZzNyTER3MEVUbTV5WUZ1ckJRVTFkZXda?=
 =?utf-8?B?aHdMZkkybmJJZ2hlZ3NSeHhnOER1S2pmT2E0WXdBUW85QWR3MmlJVzJlbnhZ?=
 =?utf-8?B?Q2d0eHNlVTZPemliWWh6QzRjNDZZL2VWZlpaMjdDRVVRUWRWZWdQWC83aWN2?=
 =?utf-8?B?S0s2VTBoS2xLSDRmVXJ1dTQyeEtVbWN5Wk1jNElJY0EyYzJ2VTVZTVU1RHND?=
 =?utf-8?B?Qm1Nbi9sdmwra0tMSDNRVnZyL0M3eXhvSzI0ZFYvcXNCRHF4aDVMbDFKN3F6?=
 =?utf-8?B?dkEwMWo3c253PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ef49c964-2ea9-462d-482c-08da3e4f0ba1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 13:04:06.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4743
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
Cc: devicetree@vger.kernel.org, Hao Fang <fanghao11@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleksij Rempel <linux@rempel-privat.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus Walleij

On 19/05/22 14:39, Linus Walleij wrote:
> Nope. But add the rate limited error print please!

Will do.

>>> Lots of magic numbers. You don't have a datasheet do you?
>>> So you could #define some of the magic?
>>
>> Unfortunately, I don't have a datasheet and the power on sequence is
>> taken from downstream android dts. It works pretty well though. So I
>> don't think I can #define any of these magic.
> 
> If you know which display controller the display is using (usually
> Novatek nnnnn, Ilitek nnnn etc someting like that) there is often
> a datasheet for the display controller available but the display per
> se often obscures the display controller.

Well, I recently figured that the panel works perfectly without all the 
magic commands. So, no need for #defines of those magics/documentation 
for now.

>>   > Doesn't it work to combine them into one call for each
>>   > pair?
>>   >> +       dsi_dcs_write_seq(dsi, );
>>   >> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19);
>>
>> By using a macro? We can... but I am not sure what (0x00, 0x80), (0x00,
>> 0xa0),etc type of commands signify without the datasheet, so I am not
>> sure what to name them in the macro and make any sensible meaning out of it.
> 
> I meant just sending dsi_generic_write_seq() with everything in
> it:
> 
> dsi_generic_write_seq(dsi, 0x00, 0x80, 0xff, 0x87, 0x19);
> 
> Instead of two writes. Doesn't this work?

I am not sure about whether it will work. Can multiple DCS commands can 
be combined into single write? Don't know much about this.

Anyways since the panel works without all these magic commands, these 
will be removed in the next version.

> Yours,
> Linus Walleij

Thanks and Regards
Joel Selvaraj
