Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479B36D376
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648456EAB5;
	Wed, 28 Apr 2021 07:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00092.outbound.protection.outlook.com [40.107.0.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C9A6EAB5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOEZLKcPm3E9t9r+9MzrlRq4YAazBKC0riErnbanXD8anGP0mhD6XbJICf1b65gt7wdDTy/4tx/Vkd1unUSpghAjgkr5TF3aldzfjucshc/u/Bsu36KEVXWw99nRMA6ez9zIGS+AMIrHsFZk3wDh3b2f5q9ZVxha/lsFSf/8ThWVf6Rx8Wu5ppfcO76HioxDI4v87jnOI5NWCaRWN/NSCsIPEpj+CHyDyqz1v2kOp/B20lFX7ahvQTzFHI+kvhX+UZHzt9ws05CPIjm0jkeMW67OvYGII55stMaLzuo7lTN35yqXugy2pHfB3QRhU2njk5QLLFUHb2tsF5fESf+j7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcsLRGUIPIGm7KSFyE7SgFKRKK7A+NTt7yWUOM6CrT4=;
 b=ELcNSU+K0Fs5zrI864PBQNPtj40XfgNPwvliuYB7NTQU6IxKu9wL1pBcLqgxvbJRxOA5lx8kmKgN9QH1V3tSjDQ0GljRZSJW8/fuTIAPDZJlSjZp5hepc/wfHHUBl3BT8NeU87Irp0k5vIuwBDM+9dNzguR3bkrPSsJCUptf+QNH0jEgpwc1Og5Iy2yY74amuT0QYAkictx+AAIO2FKTJZb4vcuzEW6XCu3vIq+SsUsiyI0OsypvgkETAG1gdyOD6/BzGwJOO7/R3hjjC5G4lOVDU6/Pdi6iPRKwx49NVLQYqLY+OLUgY7X1xyqlQGJvsbnJ0BW2FA2shQJ5QaQpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcsLRGUIPIGm7KSFyE7SgFKRKK7A+NTt7yWUOM6CrT4=;
 b=dbZeUjCwbnWYSR1XyyrgIp3SamIgUWmgLf5QIAcq18FEOoQRbwIsSLWNwSfWWbrk9DqZ4gFikIyTZnvVSXKzsQ7BsJHzJyItQnQ+TnccGU376ntQqHSbuxNcxIq3IHf3oHYfN1fTECLt4J5w4MjKGz9/fhNxr6VzThoQVPKb30k=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:da::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 28 Apr
 2021 07:51:37 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 07:51:36 +0000
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210421223122.112736-1-marex@denx.de>
 <20210421223122.112736-2-marex@denx.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <f3b55e0b-20d2-0add-e097-e03a675a1169@kontron.de>
Date: Wed, 28 Apr 2021 09:51:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210421223122.112736-2-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [89.244.188.238]
X-ClientProxiedBy: AM6P193CA0088.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::29) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.244.188.238) by
 AM6P193CA0088.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 07:51:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93e561a4-6912-437b-c222-08d90a1a7304
X-MS-TrafficTypeDiagnostic: AM0PR10MB2354:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2354CFAFE82893796ECBEEFAE9409@AM0PR10MB2354.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Go8eSPEOUgKWUr0MHk1xdookl7rTVJNfmphU8OqJgJphtsu1RbbicOcDbCoMEMZmYLlG7byi9OzcjVBArmCdMadDwBq9z5LEnjdr7hCvMDvlHRvIvvKloBtKfly5vlHixLNuO2/NV0BfCQsBbn7oV8FYrkoEgo6p1rkrN9uiLwoDzxrklryCQAih+9j2FDngFugcv900YKrQyaRR4HA4Nl3YqwcQ4hGPpnOdjT4C6X0+7FI1VHJiiPWIlYCe9/9wv9NljkPzyDP1SAMrDWHwj7juZfE+6/NbNoG/IX7eSauswwHCT2gVYE3LWoIzf3F9WaQzI2IYlQEF+vfpZUeDO6xU0e6P8oNKlAp7J8RipB05fSZbzVkAwHljyNhvdK5iFG564PsrybuT5OYYSZ6POFxw/JG24QMa7fkpIQJlGP326lwGJVCJQOwfE5vBfexLDNQkus/tP7IDJOepMX4aRmkglZFh9ge0WPFFd20niH/hBiqTsK8JgX6cUB0c9nzLhrofCd2S6M4I5jlKqFlqcoz4/t6rx+ATxmmdNKFTrfiiWTIp+4lvdyocLFpIZN/HLKPYKLXCsc3BAtsYHDWqlcrUdgd+c1TQsIPgtO47rSVDZc3MrVtnfZ03JDVy+ZEq8I3Iznx7XDnOtNNPUuN5U62gKq30wa2BaF6xdkIIRG9mNGJp3tFaapm9XH4hFCsX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(54906003)(186003)(8676002)(16526019)(83380400001)(16576012)(38100700002)(2616005)(26005)(956004)(31686004)(44832011)(86362001)(6666004)(31696002)(6486002)(7416002)(478600001)(316002)(66556008)(36756003)(53546011)(66476007)(66946007)(2906002)(4326008)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QlpmOVU1TG90RTE4UXQ3K3dGSHlUOTlMVFVQbmhsc2hsbFZsRzFPcGVHM3hp?=
 =?utf-8?B?RWMzN2p5WlRKaGpsZjN6MTdsdGx5aWpPQWo1blhZRjB3bEV6Mmk0K1ZQQnRO?=
 =?utf-8?B?ZG1SU3E4VHA5R09kMUR0cnFmVDZtbFVBZXY4clZBYlBVMWF4SmtZbUZDOUk5?=
 =?utf-8?B?OTZLOGViWFZrd05hQmNwSm9WamwxMFZ6T1R0SWRhTGJ2UERGbGVtaHBqM2hs?=
 =?utf-8?B?U01BaGdyNEFiTjRqL0NxSnBRTHB3Y0xJN05ZUXhnK0FYTzBtZmgwVGQ4Y2Rm?=
 =?utf-8?B?M0VRekNIcmI3ekFzb2YyMmJxNlNCQm90SlZ3aWc3MXpKYkxwQk9RTjhueHQ3?=
 =?utf-8?B?WXFvQlFGK2tDRUpKclI4bnZHUFczRzI1a1FIczE0RldWUTFxbVA4V0phUHNl?=
 =?utf-8?B?dU1HTVNoczNyNDliWjdDZDdCd01hNEp4TlZxMkc4ZnF1THlwRFR3Q1F3YmtU?=
 =?utf-8?B?aXJuU3ZpMklHejd1TTF2KzlZNVdzUzhsYXpmNU11dS9JaTUwdWtrN0hsd25h?=
 =?utf-8?B?bWVna1ZnMm1aRVhRclV0K1Q5RnBEY0docDJXZWlKTGpab0twTDNVTlEycHg3?=
 =?utf-8?B?aWsyWjVhSlhoNzVoMzdxQVhGZlZkVXIwZ3dJaXpxNHltM21MU293NmJqb0lq?=
 =?utf-8?B?TzhVRlIrSmVVZ0MrOVdoZXFnWk1ZczNQclJZZ2FJam9CTnBPSWNEMVNKa1c3?=
 =?utf-8?B?b2t1RHBQRWo1QXViNUVCenJpNjdoOHo5Z2NlczJ0NExtMGFKVE5sY250RjVC?=
 =?utf-8?B?TU02NGxBMWpPVVRqVm1sY0FzdEtwb2g3WTUraFBZcjdtY1JFaTN5cWNlejFT?=
 =?utf-8?B?bDJod3lFbVN1WGVRbE5XbUFrRW5jTWFETjdNRExUTXlyYWFhT2hOU2tqM3pa?=
 =?utf-8?B?MFAydG01d3NXVTBWL0s4SDFzUEJ5SVV2SkZhS3k2a0xLQndCajY4eDFqK3BS?=
 =?utf-8?B?RE9wM1pqNVVoMFJVTXhKSTJUVUtiTXZVUjFyZUtxV0E5a3JyYUFJRi9EUEYv?=
 =?utf-8?B?ZnJjUkNaWER1ZTFmbDFqbzFYVGFUVjA3WkwvdUpqb0dpQm1GMm02enljOHVK?=
 =?utf-8?B?aWlPSkVXdlo2YmI2VjEvb281OEZTQTdMUTVtbCtQNkdmQzQ5ellyZGdudTlU?=
 =?utf-8?B?UnFHMWNXZGdmL1hVYnBMNVRuS2w5S3lKUDVia2dsc0dJSGJ0QzlvYzJ0aTBi?=
 =?utf-8?B?OStWZmU5NzMydFYrVGE4NjJ0Sllab0NkMHZMcDhNTk41SUlSQzQ4K0JRZlE1?=
 =?utf-8?B?SFhDd1FxVjAxM0hMZk9kTHFvZStCUWtsVVJ3WjlaMG1SM2JyUlN4eFIzcXVx?=
 =?utf-8?B?V0xDL2xQYnBuc1dqbGlidjA1TXdEckYyeWxCbkFiUWRENE5VSUk3SUZRQTVr?=
 =?utf-8?B?ZDZyQlFBdklhOUFyaXNhZTJydXprako5V2FnL1JkaDB3MW5zUXcvZENEcU5Y?=
 =?utf-8?B?K01iUnRmdGN6OUFORnlOZGxMcjkzc3kyUk0zMm9DcHo2aWllL2ViMWphZDZh?=
 =?utf-8?B?YTRTRTRSZHk4VWhHVmQzaCszZDY1VE9ndTR1bHhRR2JUSUVDMWRQWDlEeUpZ?=
 =?utf-8?B?QlBQaHlOQU1zeERWK1BDeGYvT1l0R1lnMjlXSVNnb0ZsQk1QaDZHZzYxRFVt?=
 =?utf-8?B?by9zbnFqNzFOQU9JNDREZUhuMlBSNlpEcjc3aHJIekxFR2pkdlI0M2tlL1Nv?=
 =?utf-8?B?R0owNnpsT01rT2tSK0E2Q2YxU3RtUlVoNE15RnlHS3BRVkx4VFowRVlpL2xp?=
 =?utf-8?Q?Ox4OhCCGUNS0nl+lfUtk2B5DtMvLnO9cOu2s763?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e561a4-6912-437b-c222-08d90a1a7304
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 07:51:36.8312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0R8nuARqTPOUpX5nefCrgsGh51pUeAFFWWIgz/gSBmtCOppdTm/J3aJffxcmiuE6SqxgYke6igwTF/+LjuEBJH1idhbOWIMCMkJj3JehHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2354
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
Cc: ch@denx.de, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.04.21 00:31, Marek Vasut wrote:
> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> but easy to add.
> 
> The driver operates the chip via I2C bus. Currently the LVDS clock are
> always derived from DSI clock lane, which is the usual mode of operation.
> Support for clock from external oscillator is not implemented, but it is
> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> LVDS666 is not supported, but could be added if needed.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org
> Tested-by: Loic Poulain <loic.poulain@linaro.org>
> ---
> V2: - Use dev_err_probe()
>      - Set REG_RC_RESET as volatile
>      - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
>      - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
>      - Add tested DSI84 support in dual-link mode
>      - Correctly set VCOM
>      - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
>        datasheets, with that all the reserved bits make far more sense
>        as the DSI83 and DSI84 seems to be reduced version of DSI85
> ---
>   drivers/gpu/drm/bridge/Kconfig        |  10 +
>   drivers/gpu/drm/bridge/Makefile       |   1 +
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 617 ++++++++++++++++++++++++++
>   3 files changed, 628 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
> 
[...]
> +static int sn65dsi83_probe(struct i2c_client *client,
> +			   const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	enum sn65dsi83_model model;
> +	struct sn65dsi83 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev = dev;
> +
> +	if (dev->of_node)
> +		model = (enum sn65dsi83_model)of_device_get_match_data(dev);
> +	else
> +		model = id->driver_data;
> +
> +	/* Default to dual-link LVDS on all but DSI83. */
> +	if (model != MODEL_SN65DSI83)
> +		ctx->lvds_dual_link = true;

What if I use the DSI84 with a single link LVDS? I can't see any way to 
configure that right now.

> +
> +	ctx->enable_gpio = devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->enable_gpio))
> +		return PTR_ERR(ctx->enable_gpio);
> +
> +	ret = sn65dsi83_parse_dt(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
> +	if (IS_ERR(ctx->regmap))
> +		return PTR_ERR(ctx->regmap);
> +
> +	dev_set_drvdata(dev, ctx);
> +	i2c_set_clientdata(client, ctx);
> +
> +	ctx->bridge.funcs = &sn65dsi83_funcs;
> +	ctx->bridge.of_node = dev->of_node;
> +	drm_bridge_add(&ctx->bridge);
> +
> +	return 0;
> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
