Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE580642CBD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4F810E066;
	Mon,  5 Dec 2022 16:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2113.outbound.protection.outlook.com [40.107.21.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB14510E066
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqtJDLqBXU9tCOEU7YzAnYE9z9Loo/RwgEDNrh/hY7wpfJCbRo1SWKQP7gdRrXt8ePeGphd3/Wb18R0iYAZbxwjwD+hQN52SXApzKa13fz+0vIxEQb0QFHbk8BBXmx81JLJ78E9zACAZNqE+9iAXkddmFrMDG40NaZmgFSlSyH63x93W/i+MfP4vLqGP2o/dEhDFnbLLjOU4N5nUt/8OCpSg89N9/hfUUSWNvCOyWu3P3Gh1iykE5aXJLbF7Vf295awRS30jqWYy6jxpbnUfty38VJFX8fDXLLLYlblo9ybplLJGNz18MiAOpW/gz18djL/76MNtRqUJcCTV+3t1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTqWpAy1W94lkgNxr7Ovp3JjzBePZtvPvvhrIU3NW1w=;
 b=lSG34ARZ9LNyf8LpIg46MnG29KxcvGe5Enat5LCYrvCNzJdIiv8zw09o4y3iDtUnR2Jq1tHwurI5R95NxSgBjukPxDFDdfdgsNDeAYt7aIk5g4AJhZ9jkaYx6pMlPLZ9qpMojHDwAFU4XsF59gdH9hgRgN2Nm6LSUf6losk1I3Q5SMe7GuGp82inMsZA5c9bhUzVDofhhNJFQVEeSfTcVRzzdpvO3+j89GZMaFK5nExH+i5n3nFORbdBrzWE9ntfAsZ6y4ITC2Ntb/lAN9zNt2q4MfQPWu+oWSXVPoHAvgk1fW7rUdN3nJubgiY4KBWLOIi7tktB16jyZdzYCD3Vxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTqWpAy1W94lkgNxr7Ovp3JjzBePZtvPvvhrIU3NW1w=;
 b=Z/M5Ge3J7EuVFwTCRKEqFWswWbMHdX+5VY9EHNs9/sUCp2VELLM84zGysXMdlfD+vnhFNffaPH4+uYVFheaVAhKJ75hoqZb8RRf2+shb70UxK6LfwuCPQ2nc0xpC2xr3ryv6e9ZIg5MmMLQeWlz+nlEok7p0eCVUEK+OAKrRb4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB8PR10MB3738.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:118::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 16:25:16 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 16:25:16 +0000
Message-ID: <196f60ab-2257-ec1b-f2e8-559bc4d01509@kontron.de>
Date: Mon, 5 Dec 2022 17:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/5] drm/bridge: Introduce pre_enable_prev_first to
 alter bridge init order
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
 <20221202142816.860381-4-dave.stevenson@raspberrypi.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221202142816.860381-4-dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB8PR10MB3738:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e595804-bf88-47f4-b3c8-08dad6dd4afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sumk2qtICXJqtPKREsgpDfLsyNXK0M0euYJaFvIBVKppes/xFqqzEQHULmxz2maVIzexX8LZZg8PjVtxPH9Xn8jO3C7qkZOhA0BDJTr6JhUXLx3KNnUrSW2x4+m39tDP2PRzlAfqFm7BkhrRgN0P0UmRofG/KZDIX2DlAloP4RNK4PZmHxeKutswvqwEoHb6sY3ilcTBrlSKyCP5rZrfOkVb7H3x8PQGTKUsYbTYyJrarDeUHmjaj8scMmNG0RwoA4qJ/w1jJhJxuE5LNOz02CSdVfiWiTgEH91I/m8PPnfZS6rd9z3Zw5/RFAkwfYNzV1BzrRXO8Q6A9o9p/TISlByO+QkQ5sp4GNyNqOjbNRMIyYHctSXFZgfL2+lZ1WaQ4ebE0W59YtCGHj9IMccS1DjDoGD1ZwOkTl/ROv5u/Lt82kFDCPF/MypuTm8YIlPxfJ0Lhwn2OsPp2DmD31oLSQOO4ppApxZpsQ8LCpAEAScc8x/Ooa5c+uxz5PjMQjvy91gWnljFDdqTu8WGRqpdGpkbWALWVy58nBM+BUw2CnFa5rwAcITFq3g9rI/ep0gChXNTK4PNO1KECpeoxFgee9C0xCWECxtRHpnXO2Gle6VRhG1puEE5fwbBCkTBbYEHjD2T8Bnk8Etn+h+15xn4dTBu0j1GjA1e2UAcoo5wweaZqGZR/cYMV6VgSesXwE0AZdOOzq3EH7FcxZm/taD3mW+3DMX2SttOHN/mcr8qqecz/967GcWWcqi/UhWBpPD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199015)(83380400001)(86362001)(31696002)(38100700002)(7416002)(5660300002)(44832011)(41300700001)(8936002)(2906002)(4326008)(8676002)(186003)(53546011)(6506007)(6512007)(6666004)(54906003)(316002)(110136005)(2616005)(66946007)(966005)(66476007)(66556008)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9qYkptZXNZVkpHVnFENm5hMDRFK2owdDZpbEJFd3dKNEtxb2FQWk8veXYy?=
 =?utf-8?B?cHJqQ2U3TEI4Mktaa0ZhRi9RMnYxcEVHYVdTVzl3VVZZWjdIK3hLeHVaSXhh?=
 =?utf-8?B?WnBRTmxXcE1jNitWMUNTQUZTVjdXa09kZVdOUnFuekJCbVVTclBydFF3aVZ4?=
 =?utf-8?B?Nmd5cE5wK1YvUkJYeDBDY0k5MFJZK2diZ21VTjhLK1g5Tmk0eU9qNXltNGlp?=
 =?utf-8?B?ZzBWaXV3SzlIMVROeEZBWmNIMkxwdW1rK0pVUjlOWTR3WmRGOHhTSElFQldz?=
 =?utf-8?B?NXNFRUVCSGpnbzB4ZzdmWGVIZUc2VllFT3U4MEo0NCsyQ3BKUnZQTjNlUnJF?=
 =?utf-8?B?bUZxUGluZ3BMZ29hUXZnb2hWOUJSdDl0V0pwL0x2TFJUbkFXVWZIZitOSXZZ?=
 =?utf-8?B?Y25MUmpsMytxSkxkZ0xRSUNWdy82dGZ1T1Nwa3ZzQm0rTCtHN0lzV3Ezc0Mv?=
 =?utf-8?B?Z2JQejgvaWJHVHg0b0NjNXRBNHlmbGw0M3NEd3d3bDNNUEdFQjBqcVhJYldN?=
 =?utf-8?B?Y2FvOGsxaG9OMG1LTjVrZmNhSEVXTzZTZ2tKK1FQb2FsajNPL2dzZFRJY1cw?=
 =?utf-8?B?d3NRTFFaajRLZmNucTMxeFpEL2Q0YXJxaTVVYkhyQ3BUU3hGMlBCc0dEc3ll?=
 =?utf-8?B?TERCSWdveUFHMWNVN0x0Q2prbWVFOVArQ3AwRURsQytiazhlZE55VWhhZWxq?=
 =?utf-8?B?SGRSZDIxK1VtV1Bnb09zQVJObkc5aXBhMyt0Y2JNaGpweEtEQmRpM1M1cWI0?=
 =?utf-8?B?c1NVQ1A5OHE3bk00aXMyb2RuZnlla2NyMldwdnorMEZGL0VIMlJWRDFWS0F3?=
 =?utf-8?B?SzZOcFBDVEw0RkZ4ZnZnd3V2T0xhMkdwUlRZMUFwVWNaZEFQbUxmTEt5SVRa?=
 =?utf-8?B?M3dGekQ1MWY4OXIya29MZzZ1NS9lanFPN29TNFJMYXV1SWFnN21mcVhGUzZh?=
 =?utf-8?B?cWEvZkpmZWJhbWl5Ri83Z011OTFJNU5UQXVzYjRmT1NHM3hzdzVWbjM3SlYx?=
 =?utf-8?B?c1l6ZmJiZjNpZHV2RHBYK2piWmdIa0VpT1BOZHlmRU94RC9zUlkwRzZpN0NN?=
 =?utf-8?B?TStjUFNVN0tyd1lpR2ZhNk9ZRElHUSsxbmxMRFlWR1lzbCtTVTdkSEp6ZXBw?=
 =?utf-8?B?Q0JMRDUyVFVOaFp1WUJZK0ttcmhpNC9WVWJFaG9vdExrc0NhaUhCUTF2NGQ2?=
 =?utf-8?B?ZlhDY2JTcWNsM09LQmNBdDZyek5jNGFKOVJKQVY2RGxhSjNpelR2dlgwWC9i?=
 =?utf-8?B?SlhabTQ3bUZkVHJxMGpqK1k0ZVFSTC9oR0VvbDMzak5IaWMzZGk3ZXFvV2lJ?=
 =?utf-8?B?R24rSGtYaW9JVmdVMUppNDlVTVEraC96QWhzVktWU3ltVlZYMmpOT2lueHVp?=
 =?utf-8?B?clpCL2ZlU1RLVGZCK1N0WDVQeEp2ZjREeEFKUXBndm9NY2NiY2w5eFVRTFBL?=
 =?utf-8?B?Qk40WG9GTE0rTFZuUERnaTRUMjduKzN0TzQ2Qjh0djllNHhDb3RxN2QzWUdq?=
 =?utf-8?B?eGhYTDE4VGZPRTE1bWUzNS8yM0pkcEpHTHZKNEE0enB4Z3A0TUUvd2lyTU5H?=
 =?utf-8?B?bm1sVkpGYnFIaGpBRmF3Vk1MMHVEbjZ1dE1GYjI1NWNObkh5SjhSRE1wUUN4?=
 =?utf-8?B?anRIUDlwWHpOdGcyTUF0N0t1WS9rYmg0U2NaenpkTUdDWnJrekxkcGlxWXRP?=
 =?utf-8?B?VStlYXRKWmRNUkdZQk5rU0d3bGhaUUZXUys5azJIZTI1eDE2QmJXMEcxUVRO?=
 =?utf-8?B?MHp1SHM1QWJTaHpnNm1SUzBqRnNRZitmK01TRTVQN1FtdCtZdVhnZ1FwOExG?=
 =?utf-8?B?VU40Rlc1Wm1zZWZ0Nm13azZISGVjQUozMzZSWEx6Tmt4WVBtL1BKdllMa2xr?=
 =?utf-8?B?aG9hZVBMVTZiUERtWHpHWjZzaTZ4Ni9mdFRsQjJNcXFka0VUZHpGNFp6ZG94?=
 =?utf-8?B?T1dUVUg0bWRGc3FCalVsc29nKy9KVU9mYmp3dy9lYjNIQngxOEhESUJESGVS?=
 =?utf-8?B?UVlCZXJkdjdXU09XUGhWL2t6bS9YZFJIR1JwdUF6ZzExMjFubjRrY2R6aUw0?=
 =?utf-8?B?YVpwQ09SQU5QQTVmZTFlRDgram16MlNLNmlVQytUQ09FTFJUTEtFWFVrY29w?=
 =?utf-8?B?VjJ5QTZCdXo3aWNVOFRpYzY4Q1pEQmRnNWJhMk5tODVsSG8zTnpkSmdhajlO?=
 =?utf-8?Q?NX6WwqC2VRcMrM8MEEx+/v5/6Oaf75V3H1QdlZSSNHbC?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e595804-bf88-47f4-b3c8-08dad6dd4afd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 16:25:16.1540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrM7bJvmhGsJTQXL7bt5RuZ3NDP8SoXeq3XZ/5xLpFB2nbA3lU2u3kUErYba8Lu7VN0/ndpOFZbZVHOU5DoD3oatSTgTUvVQv8FSJU4ZW4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3738
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 andrzej.hajda@gmail.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On 02.12.22 15:28, Dave Stevenson wrote:
> DSI sink devices typically want the DSI host powered up and configured
> before they are powered up. pre_enable is the place this would normally
> happen, but they are called in reverse order from panel/connector towards
> the encoder, which is the "wrong" order.
> 
> Add a new flag pre_enable_prev_first that any bridge can set
> to swap the order of pre_enable (and post_disable) for that and the
> immediately previous bridge.
> Should the immediately previous bridge also set the
> pre_enable_prev_first flag, the previous bridge to that will be called
> before either of those which requested pre_enable_prev_first.
> 
> eg:
> - Panel
> - Bridge 1
> - Bridge 2 pre_enable_prev_first
> - Bridge 3
> - Bridge 4 pre_enable_prev_first
> - Bridge 5 pre_enable_prev_first
> - Bridge 6
> - Encoder
> Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
> Bridge 2, Bridge 6, Bridge 5, Bridge 4, Encoder.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I tested this patchset together with the pending Samsung DSIM bridge
conversion for i.MX8MM [1] and additional patches to fix the
enable/disable sequence for my setup [2] on a Kontron DL i.MX8MM board
featuring a TI SN65DSI84 and a 7" LVDS panel.

Using this the initialization sequence of the TI SN65DSI84 specified in
the datasheet can be achieved. The correct order was verified by tracing
the function calls and capturing the DSI data signal and the SN65DSI84
enable GPIO (EN) on a scope.

I've also gone through the code of this patch and it all makes sense to
me. There is only one small nitpick (see below).

Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Thanks
Frieder

[1]
https://patchwork.kernel.org/project/dri-devel/cover/20221110183853.3678209-1-jagan@amarulasolutions.com/
[2]
https://git.kontron-electronics.de/sw/misc/linux/-/commits/v6.1-dsim-mx8mm

> ---
>  drivers/gpu/drm/drm_bridge.c | 144 +++++++++++++++++++++++++++++------
>  include/drm/drm_bridge.h     |   8 ++
>  2 files changed, 128 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index bb7fc09267af..41051869d6bf 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -581,6 +581,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
[...]>
> -			bridge->funcs->atomic_post_disable(bridge,
> -							   old_bridge_state);
> -		} else if (bridge->funcs->post_disable) {
> -			bridge->funcs->post_disable(bridge);
> -		}
> +		if (limit)
> +			bridge = limit;

Nit: Maybe add a comment for the code above to explain that this is for
skipping the already post_disabled bridge. Just like for pre_enable below?

>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>  
[...]
