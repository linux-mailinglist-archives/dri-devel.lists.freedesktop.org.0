Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F9637725
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 12:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BDB10E22A;
	Thu, 24 Nov 2022 11:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2097.outbound.protection.outlook.com [40.107.22.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFEB10E6E2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 11:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGArxtKZIzlDKb2tbWkyk5jI39MDzF5D2hTE1nY9iMRS8KkzWOq1OQXlEc2Flz2ksWfDamTjdFjR/kTszsKAA4gPmOJxRSt61XCbhP4HC946C+SHYlfgfbAXod99UzsTqKMj9IqTSl0ActSTJdV5KDJ9MBnMzgLSqVRpS2gMvVndoLi4Zx9CQcH01gTK/YoaxclZzPpjZ0wL10FcqZJzF43ljduX0RuhYsYJxww5suhOQ9BQxef7vhD6f5l7PMJ/a3redgdEP8oJvjiletSY0iOUPje15ziuPwm15YBi4DDlSWiy/hxSoWQsxLnTEPUQA2LXNCGaCfHm/RRGTIMCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3KCeUxHu+9yXiuqYH6U2/Fhmu/Gc233exheznak8po=;
 b=L2AyRCvXRdP35e6MiCbNdhudqR7j7BrAvcGD2i6Kq9+e+yUDcrgW3NoZ0ewtaLuADBcHy8Iz24ufHAlahijhzYPqOb33FCaiJt88DbZCwSe9VsIxe0sw710OcPoOEuYq75NMgyyY5Q6KIuaBB4hZZpgL1pqi31JGxxagj7NsFS95zB+IiO98QK4ALlvzYafVMT3mqIggVzuw9Yda5uFd6WFalOX8DRr813+rq8owpPefelJ9X8AVp0lGshcN/wcZJN71Tv1Ca2o3YEU0TxKXw9RUgzQUfIkw0UmGPfefM9rpnPjqmxcZJXx3YY35ctuSeH7NEDuaTyVuBfM2FjMPkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3KCeUxHu+9yXiuqYH6U2/Fhmu/Gc233exheznak8po=;
 b=XJGKDdxqG1jFuQZpIFFIQC795stwYjN9cfwp2flhO2jMzDxZBsMEGbb2rWo4SJp/SCNUhIS67bW/WCWqSQTe2ONxes7HLsrVd7txlCeDzpp63ObaSCKPHRPwZR2DT1UiGI9kY5OHV7uPuBRQ6BeiJQgXA6tDAcQnfuDGixTeceQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS4PR10MB5394.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 11:07:36 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%4]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 11:07:36 +0000
Message-ID: <7761d66c-a8a7-c11a-9c09-a47f57bd1311@kontron.de>
Date: Thu, 24 Nov 2022 12:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix delay after reset deassert
 to match spec
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Frieder Schrempf <frieder@fris.de>
References: <20221122081219.20143-1-frieder@fris.de>
 <9079928.rMLUfLXkoz@steina-w>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <9079928.rMLUfLXkoz@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0117.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::22) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS4PR10MB5394:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3ca9bc-9b96-4d99-6df6-08dace0c17c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CNMQAk/Rh/YW9SsoW89BoUfBPibd7ENb9MiGrHxK5EhkJAKhz0MA/VpGw4JGfZ/mOTIUgLruB958sIj7x6IOPrRnX/pD4H6jLQHoPibi/KnVbpEHaEhsDCM3cOaWBiliXqecv+PQqzBTAzBX2qtml+y5BseliV/e2IEapgqUpsVJC3mejdvHRuJS4/GGtaKrB/VqeM2nWU+u2j19wh5D7FxhrBoN4m1B41WaHsnckmbJaK4ukIgv0ToCoO4wDml5A9zIsmJtzuAav/FPmo5U28V3fTdsdBFiMd4Xq+9ZCKkWELiHgo1EHIHqpZjEJhVQcJ+bSKOsEp4pavZ1o5n3LQhl5JHyGe9wlSHX7Hs0wZ49fjsX3UKfDDgeDXvm1DLD4RAlCG7Fpn0fZ0sKoNtIbfX5Uz/bTYA4ZhPLv3hQFE46j2bhdnkxgytnKjHZZmyMBl0Zfklhkqe8gW3Oyps6L60R0inyOk1txflC1S3moioez+c1/iGAKkMQWZbOEGf9yHMWXhrS4OhRboVT/FvbpxKiBcxWcirC/qiWXQ6+CdkAXTBVlwT/tYRGOXAwk3g5lESDZdR229bodwYIsVZoerM16/HBhifa+eBdY7jJZFz1H3ZBz1KqVD2h/AS88PkrkJdFMrBANvg/6qUU+YycyledDsnzolfBAU/2QwqLQaJfgILqpFRMLzotEdzv9IykB2pd4+5+x+OUBwuMF9RVRbZMcilf2Sgs7TK2nAXpvDxZMuwQuVSm+6/9VOM8902D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199015)(6486002)(478600001)(38100700002)(31686004)(110136005)(921005)(83380400001)(6512007)(6666004)(2906002)(44832011)(36756003)(6506007)(7416002)(2616005)(31696002)(8936002)(53546011)(54906003)(186003)(316002)(86362001)(5660300002)(66946007)(8676002)(4326008)(41300700001)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlBueWhudUNYa1l0cmtIbkVGcm5VM1grTHdWUWMrM1U3MURML3FhYlkyeXIy?=
 =?utf-8?B?Z1RzeGJNZHpqaUJXdDd2VnUwL0ZCeDU4aHBVMVd1djdkNjB3Tkl4dHg1L081?=
 =?utf-8?B?ZitNWG0zdE1FaDdTUmpPUFFKcE9ZR2ROQlU4aDBGeDY5V2J2SW9sRnRZbGU4?=
 =?utf-8?B?Y2Rna1ZJQ2Q4MXpCZWpNU3ZIZndSTS9NWnhjU1pJTGI2SittVllnTkIyajhz?=
 =?utf-8?B?ZG01YkdIVmowTjBucURzMis2dlhUbGlOUm9MdmZrMmo5ZlM5MEk1YXU0amZB?=
 =?utf-8?B?M3RWNVhQT2tsQTM4dHIrK1Viais1TXVrSis3ZFFaUE0raGV3K2dRSWZXcXVP?=
 =?utf-8?B?K0VFNDErcGJDekFlSnh3Wk9NVXdycmR4MTQzMXdBeVhwZlJyeVNoWmErM2lX?=
 =?utf-8?B?VjhadG9DK0ZpRHAvczljeGFja2hpZVplVlNscTM0Y1FEa2JSNTBUQ05NZHVZ?=
 =?utf-8?B?YmtJeHBIV1BuOUFkeklIdElKQVNabGhYdkc3UStVK0pJVEp3aTlXQUxFOWRk?=
 =?utf-8?B?OU1aVlhycGpoTTlZT2VZb04vQlNsSUwxUTh4eVhzdVdaUEY4VFZZS3BBM0o4?=
 =?utf-8?B?eHozRGsxY01PelRGV1NsbXlUQlRCblNXSDlkZE14YVVKY0JVbWRSZ1R2UCtQ?=
 =?utf-8?B?MzVoQjFpTjJNaWd3R21ISjdLVE9aOE5CdGZ4NnBGalJ1VDQ1MU5BRDJXZDZ5?=
 =?utf-8?B?TXc0TWlleTFrUDNUSU5UZHVoa0FsMGZxd3VTSndCZHBJd0hIaTJtN2FHbVpn?=
 =?utf-8?B?dDJMVEF3RmJNU3VlNXdqSGdsdzRhMDBkdnVlRThPTjhQU091SUZZT3FNeTFV?=
 =?utf-8?B?V00rd01HTFVoc0JXb0VDcUJ3dnBQZ05OL2t5TzF5M2dpbGhLMXlPWnlySFFN?=
 =?utf-8?B?emF6NDI3dy9idjZUU1p6aHd1YjRUaFVzdGh6TTJpWS9DejZ6TDhvbWlvWjJj?=
 =?utf-8?B?Z3Z4N2l4KytaVzZtdXBBNzFxWXF4Mk1WZzFLTDZSVVgybkJwaDNEN3g0R044?=
 =?utf-8?B?M1gra0NydFU4a21IWi93bFZTT3FPWVk4cU14b3llWEpMVnErUEwvRVZRVHl3?=
 =?utf-8?B?aGwxNHh0NHp5MWRWRTE0QThQZkdqazFmU1hnNG9yVU9VLzZJakN4d0x6UTlM?=
 =?utf-8?B?aHVheVpYd0dRL1VrR1NIZWNNYjZIckpiYWxnK0pTYWFVMHlQSzNlREVINUNw?=
 =?utf-8?B?UU5QcElQR1J3Q1d3R2ZBdzF1WDEvS2I2dU9OS3A2TWdrUnVQdDkvSFdGbGtH?=
 =?utf-8?B?YmVka3BCbWdYVGFSS0lsdXVOUHFVdkJTTjJmc3B1S203cXV1TWVqZ1g5OWVO?=
 =?utf-8?B?Q1BDV1NYOHNIbW93U28xVXNhU0Y4UXpQZlF4VEMzT281RTMyODc5TDBQUHVJ?=
 =?utf-8?B?UlFWSldtaXhKbVB6TVR5Qm9LamNyZnZBcXJDcnREanFGUmE1S3BNSjJSNjRZ?=
 =?utf-8?B?aGcxd3ZPQnFSSy9vaEdzZDNKME5uK25nYy9Wc2svUjRiNXUzRloxK3RZb053?=
 =?utf-8?B?VVgyNi9Vd1lVd0VXK1FqUFk0Z2Q5SjFVZ08rSzNXYkp5R3N6TGd0cEMzY29m?=
 =?utf-8?B?U3FYYmtlYWk0ZWd5LzdUR2orenpFa1ZIT1I0b05xRG9BcDhSdDcyWDBmVEVj?=
 =?utf-8?B?YS9Zb0Z1bmRpVk5GYzJ2WmdPaStSbXFDRlhWeDh6Y212TnJ6aU9Mc0kwbzN1?=
 =?utf-8?B?eW82Rmx4aTRKMTJJaWVSUjcrSVFLdWtVa3RRQmFYcDVWWGVrRm51WnZqRUVM?=
 =?utf-8?B?TjREOTlDKytlS1Z5OXpvdWhoaUE4bjNzSUdlVVRCN1RWSDh4M00wMlFsZ1E5?=
 =?utf-8?B?cmdvTDhRZ3ptdjVoWk9iL0hIdTZtd291YjNZMW1BUDVjSjhaRGZDUXllUnhQ?=
 =?utf-8?B?ODhIVG53N1RQNit3aGRuQnBpa1poNU9QZmFSMytBUDZEU0Q1aUtYbjFxbzZj?=
 =?utf-8?B?NGtDdDdtOEQwYzBzQVVPaTJ0MFRTM21DanJic1B2VDFuZDRObmxVZVl0eXhZ?=
 =?utf-8?B?UDVIRG40V3lKTmF0Z202eXFEVFA3MHFQSlVKaHcyMHh5U2NvRVBhSHR4YW1x?=
 =?utf-8?B?NVd5U1RSN0tkb1NweUtIbFhqZlhZT0FvZ3ErbHp0MEVSNys1aEYzQmdaSmJH?=
 =?utf-8?B?VGxuRTBiNzVucnB6aDFFcHFKQVFTMFlsby9XdXcxR1BRS01pVmhadzYyRGhV?=
 =?utf-8?Q?+lnwdj0Ag7RgUrRG1l9hHnLdAgnbGeA6JxVU/Dtd+Vf2?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3ca9bc-9b96-4d99-6df6-08dace0c17c4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 11:07:36.1118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7RgX/UHvTaUWmPx/CiwiCMi00MzrXoqj+n0XzVeJQ38xqVUBHDDjTPmcKs6W64urlryyWPWnSnAaAGT+Fmcrcl9uoaCMW0TvijOXO9f91Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5394
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.11.22 12:00, Alexander Stein wrote:
> Am Dienstag, 22. November 2022, 09:12:18 CET schrieb Frieder Schrempf:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> The datasheet specifies a delay of 10 milliseconds, but the current
>> driver only waits for 1 ms. Fix this to make sure the initialization
>> sequence meets the spec.
>>
>> Fixes: ceb515ba29ba ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
>> SN65DSI84 driver") Signed-off-by: Frieder Schrempf
>> <frieder.schrempf@kontron.de>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c index 7ba9467fff12..047c14ddbbf1
>> 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> @@ -346,7 +346,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge
>> *bridge,
>>
>>  	/* Deassert reset */
>>  	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
>> -	usleep_range(1000, 1100);
>> +	usleep_range(10000, 11000);
>>
>>  	/* Get the LVDS format from the bridge state. */
>>  	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> 
> How about using fsleep?
> 
> Either way:
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks for the review! I didn't know about fsleep. Anyway this would
probably be a separate change as the driver currently uses usleep
everywhere else. But I will keep it in mind for the future.
