Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAFA5284C8
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 14:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084C710F9B1;
	Mon, 16 May 2022 12:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2014.outbound.protection.outlook.com [40.92.42.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7817610F9B1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 12:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpvUdK5t7jV0TAjNjV0ajcz78lVM4cSZOPmXJWAqXECe31keC5x8vlxXxH/GFLDKvSgroEjwCU6k4PNttcWW8yjZkGlOZuMPbGgM/L2H39Y3fv7bwV+cEB5CJH2UCWPcCxdF1jm218ODZXfyaf5P0+CMNq0cGrXG2ALPcEl18/AMb5H1AG37CoAevx6hLQIvRxCJEBDJ3QueMYHWo/uBdN2kQcjvQQ5r/2AgkLt6kY8V19IFkT8EJPN+9zj5igIpMDO6t0+NEC4PuzJ2AwAOIBuUWuIIT7X7D/XHVh9veZHa7TQFegmGbRc9Dnwnw77znYwfW1y+oGvmkYTqQxMzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwDy906R8zFoWuOG3vh+sGkKJlZnX4rJHAAS+PoV7c4=;
 b=YMjdmycHJjx6JmnW3U09oM7rhS4xKIlNg5IsQcqmUv8Ugy7MR44XIjntftqWERZVeqF4EJfq65DgXTAfu7R1kGvpPp9ofnMh6Xx54HTsnzN2kgt99jHtusxeO/1kpVFxv2Io0VN2hfcg8dptOferg0JVKhnp29mLkBlqca/dSfE2cxZ02hdzaI2SelBRpdN8wIxePTXRITOSa7jURjU8q51jypPFp70HYcyng/Yu796KwS3CCpKQp01Kjd8vIzZuoyNk3uyo8Yj8O8EgIPJXkHyEwKYbB5TkPO/kHsYyQ3SYdtt8m/PvSS2Stl8exTvi3ekSwkMrNNsRW7SeCaatfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by PH7PR02MB9052.namprd02.prod.outlook.com (2603:10b6:510:1f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 12:56:51 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%8]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 12:56:51 +0000
Message-ID: <BY5PR02MB7009831D8BC4DB2B34739CB6D9CF9@BY5PR02MB7009.namprd02.prod.outlook.com>
Date: Mon, 16 May 2022 18:26:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] drm/panel: introduce ebbg,ft8719 panel
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <cover.1651835715.git.jo@jsfamily.in>
 <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CACRpkdYhkP9RYj98Lu=zkt+6aefx172R=8JtvOFpvh2uJ4byKA@mail.gmail.com>
From: Joel Selvaraj <jo@jsfamily.in>
In-Reply-To: <CACRpkdYhkP9RYj98Lu=zkt+6aefx172R=8JtvOFpvh2uJ4byKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [n0i7MlgpymcXPupIYSrhvR27AjFasYamlhtX6qAZWi8XJ16Ga33WNNPGOF6yY5m/]
X-ClientProxiedBy: PN3PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::13) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <9cbbca03-dfeb-d456-651e-67394c2762e8@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f5e4ad5-5b6a-4023-e7b0-08da373b8b61
X-MS-TrafficTypeDiagnostic: PH7PR02MB9052:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSprm4vWHu9udrfCx+e8EI+ZrMSKCLuab2aYtCXfTqTgfOYLAsgOedC7MqVjOabikcVWvOtg8gZxwjdIXLu2hNGcCZCHWsHqJ1Zpiksi6vP7B60NVq1AXw8D3przitELxejPbokJxiiMGZQDQFxE80jRfgyaKRXyW4cQbxmeJayFfOi4FyeNJHTpo96WWMHI2TLwqsSW+dHCy2M/9pEOfcWRiMK0lVyyE9AxZSFQNxolC1r9A0gqY2NNqNjGGlNCYwGvARS5zSjRDm92U9a5vY5uHg6g0n90OSJMfMFuuLOxhiUWHANUyK8tuFS1leayCgSTt3VvfiBldlKgbYFeaMwEXNqGj9sPZgGJHRMvu08TY4xOQs+6T+UN5AtnhlXBqRETbFjKj7Vj5lmSoE1omisKG4lgCRS2X0XtHAJ7xGPk5N7mxDj4jRbh8kYAc+l4Mhk+3rffEPeYmzE9TxmfuQ53UI1qw/7t/+SSQ7zBctYHLYhTGObTcJqbkC4oens1ZthKKceb2d8mEHXYm/3vBtPpzUq/+l1bWQg8A4RBB3RqEDZ5OBgXjxHoOaoHE6jCkiH0eHdGavf3iplrlAseI2qpZXzImuM6Cul0gDm9dheO/K6BneLirAJjlsYZKQnb
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlUyVUp4NFlPQlZULzUxaytlcDhCMG1mUmc0NkVxR1laUmRrS3Rsb0ZlaUJR?=
 =?utf-8?B?RFpXMUFRQ2dWQXh6bUJ3bmpzdkh4T3VIajU1RmJweHJBYXhDakMwWGJKN0Vz?=
 =?utf-8?B?ZVBYODNzQ3JWRmFEbE1lMTdLQW11VXhyK1UrTkx6SXlQcTRWazhpTmE2YjZE?=
 =?utf-8?B?UDZud1dIelFxblJaQmc3aHZ2bEhCczMxWnJCUTdid3dhbzA5S1NhS2ZNeFJm?=
 =?utf-8?B?WXdFN05HbCtkeW9tYk1malVOcUNxOXExSEVlc2krb3hYcXFoNFpOYWpia3FP?=
 =?utf-8?B?OWpzbEhieVFueVhTVGpnZEJqN2VSN2JsSmdQZVd0ek0wak54c0ZSWHZCM2FZ?=
 =?utf-8?B?YkpvTWpPWUdKakVFUklJcDZSNjVhWk81UEhoYk13UjY2cTgyWXVLeVBKM0hi?=
 =?utf-8?B?WlNMZnZGdEUzbzQzQVlZK3VHbVNWK0VEbmtnNTJqNmNxdWx3S3BEblRCbEQy?=
 =?utf-8?B?dk9Na3llSGVoY3cvSjNWY3RBemp1amJpK3FrUFZiQTJUL0ZHOWwzVTVtUy9r?=
 =?utf-8?B?MVU5OStMT1JWeGNWM2VSb2lMcjBEVTBlNmRwRmNaZW5rV0wxc01EbjMyVVNt?=
 =?utf-8?B?bXpFTXQwc0NEZ2dFelJlcEFZQjZjNmFpTUdoY0RmdTNuQVB1WHNJVWV1UnZI?=
 =?utf-8?B?clBvUFQ1NTc2RGZ3WjBGNmZOc0JjZ0tmdmsxZ2FQQzNianowOVRNeWU4Zjl0?=
 =?utf-8?B?dkFxcUpQMkRnN05UdXZwYmtBZnhSUFF2WlV4NWM5ZE1kUzZKNWI5MUF0dFlo?=
 =?utf-8?B?RGZ4dDFvN3ZHV0VmeVRGdmpNV2k4dnhuSENnVGxoZUwyOUNlZ09IY3dOdjRp?=
 =?utf-8?B?ZmxUdVJ6ZWUxMmE4T1hSLy9iNlcxcXY2bFdNSjlKTDJMR3FCU2FtSFVpcVpR?=
 =?utf-8?B?WG1GVnJONzEvQnhUcWJxL3hIb2FSQk10L0h1a3huRjJxcTZtY2tiRSsxejEx?=
 =?utf-8?B?Y2wwODRMT2UzOTV0bjlkK25tQm5FVFhJYy9XYkZKalY4NVA0VURJVWd6VHRW?=
 =?utf-8?B?RXdzNVNMK1g4ZXFUMXh4Ui82ZnEvby9icmxnVDhsSENWMnhNZjduSzAvQXFZ?=
 =?utf-8?B?Mml3UzdhNzRFb2hIMXd0YVJOZ3dEa3V3ZysvZTY1T3ZYVjkrR0NtcmJyc1pq?=
 =?utf-8?B?eVB5dW1oSlNSQWkxM3pHUmJtWWxVRWR3WURmMXNCQitkNTJwQUMvTmhvNmQy?=
 =?utf-8?B?Wm9jTGdmbUZDSlZJVDRjaG1VczZqd0VVb20wZThNbnBBR0hZcm45d251OGw2?=
 =?utf-8?B?NURmdUlxdC94a3JTQmplanNSMmxaRDdSbmkvenJ1S0Z2VlB0T1d3N1VWb0k5?=
 =?utf-8?B?Vno4T1hqOXFoYndUaVhZTVFGanZhaUFtNFJUQS8rai9EQ0F1Mmt3Y0VqOXhC?=
 =?utf-8?B?RE8wQU44bE4rZW8xNy8rcW5Bb1hPeUw1ZEMra2RvK1I0NXJDQk5mNVd2TE5U?=
 =?utf-8?B?Y3JvNU4weUhvcFdrRGcvL0pCd1pia3ExQllSWGh4NUdncHNHRzVNYTIxM0Zl?=
 =?utf-8?B?TktYNjV1MTFSSzFEdGpLY3U4UytpbzhHVzV3dDJDRlZ3R2pLamprWGI2VXo1?=
 =?utf-8?B?ZktJNzczNlBIMXFUeFZ2YzgvbVlUdU9xZDJxRVNXZW9aL2pKZzJLemZySWRY?=
 =?utf-8?B?anNsdE1QT3dmcWFUazgyc3BqdHFwNll4OEpPdWxuMG1UMGJMak5lb2dwTXFF?=
 =?utf-8?B?TXdNK2NHemlJdG8wVDF0aU9MM0UvYzVVWTk1STVBMXBCTGZGOWwzQmNmQTNy?=
 =?utf-8?B?dVNKRnRvQ1pMb0ZoSGxFMzg5MUkzZVRGSnJYVTJNRjJUMEhpT3U1MGVLbVhr?=
 =?utf-8?B?ZnRrQmhleVhDK1IwaWpmMnZaaTE4R3AxRzFGbnRPK010anZWYmI0ZVk1YWhI?=
 =?utf-8?B?M0xuRUpJRU5oY2orVTBySWZieDhjT1hOalhVb1FSeUwxY3hHWWVpb1BOelZW?=
 =?utf-8?B?Y3ZhNDZueDY1d2RiWlkrZGVxM281ZnhsVVVYVEFkSVM4Y2lhakdEZ09kQ0hm?=
 =?utf-8?B?eXY3alY1UGVBPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5e4ad5-5b6a-4023-e7b0-08da373b8b61
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 12:56:51.3018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9052
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
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleksij Rempel <linux@rempel-privat.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, phone-devel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus Walleij,

On 13/05/22 03:21, Linus Walleij wrote:
> On Fri, May 6, 2022 at 2:18 PM Joel Selvaraj <jo@jsfamily.in> wrote:
>> +#define dsi_dcs_write_seq(dsi, seq...) do {                            \
>> +               static const u8 d[] = { seq };                          \
>> +               int ret;                                                \
>> +               ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)); \
>> +               if (ret < 0)                                            \
>> +                       return ret;                                     \
>> +       } while (0)
> 
> First I don't see what the do {} while (0) buys you, just use
> a basic block {}.

The do {} while (0) in macro ensures there is a semicolon when it's 
used. With normal blocking, it would have issues with if conditions?
I read about them here: https://stackoverflow.com/a/2381339

> Second look at mipi_dbi_command() in include/drm/drm_mipi_dbi.h
> this is very similar.

Does the ({..}) style blocking used in mipi_dbi_command help workaround 
the semicolon issue I mentioned above?

> So this utility macro should be in a generic file such as
> include/drm/drm_mipi_dsi.h. (Can be added in a separate
> patch.)

I agree. Could be done in another patch.

> Third I think you need only one macro (see below).
> 
>> +static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
>> +{
>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>> +       struct device *dev = &dsi->dev;
>> +       int ret;
>> +
>> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>> +
>> +       dsi_dcs_write_seq(dsi, 0x00, 0x00);
>> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19, 0x01);
> 
> It's dubious that you always have dsi_dcs_write_seq()
> followed by dsi_generic_write_seq().
> 
> That means mipi_dsi_generic_write() followed by
> mipi_dsi_dcs_write_buffer(). But if you look at these
> commands in drivers/gpu/drm/drm_mipi_dsi.c
> you see that they do the same thing!

They almost do the same thing except for the msg.type values? Mostly the 
msg.type value is used to just check whether it's a long or short write 
in the msm dsi_host code. However, in mipi_dsi_create_packet function, 
the msg->type value is used to calculate packet->header[0] as follows:

packet->header[0] = ((msg->channel & 0x3) << 6) | (msg->type & 0x3f);

Wouldn't the difference between the mipi_dsi_dcs_write_buffer's and 
mipi_dsi_generic_write's msg.type values cause issue here?

I tried using mipi_dsi_dcs_write_buffer for all commands and the panel 
worked fine, but I am not sure if it's correct to do so?

> Lots of magic numbers. You don't have a datasheet do you?
> So you could #define some of the magic?

Unfortunately, I don't have a datasheet and the power on sequence is 
taken from downstream android dts. It works pretty well though. So I 
don't think I can #define any of these magic.

 > Doesn't it work to combine them into one call for each
 > pair?
 >> +       dsi_dcs_write_seq(dsi, 0x00, 0x80);
 >> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19);

By using a macro? We can... but I am not sure what (0x00, 0x80), (0x00, 
0xa0),etc type of commands signify without the datasheet, so I am not 
sure what to name them in the macro and make any sensible meaning out of it.

> 
>> +       if (ctx->prepared)
>> +               return 0;
> (...)
>> +       ctx->prepared = true;
>> +       return 0;
> (...)
>> +       if (!ctx->prepared)
>> +               return 0;
> (...)
>> +       ctx->prepared = false;
>> +       return 0;
> 
> Drop this state variable it is a reimplementation of something
> that the core will track for you.

ok. Will drop them in the next version.

> The rest looks nice!

Thanks for your review!

> Yours,
> Linus Walleij

Best Regards,
Joel Selvaraj

