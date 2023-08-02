Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5B76CE50
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 15:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045E110E171;
	Wed,  2 Aug 2023 13:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2076.outbound.protection.outlook.com [40.107.6.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1F410E171
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 13:19:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoBn1kO200SsXoAZ84HnIJWbvBeAuB3tmbzd3FSGS3i9PAxC8swA3ZXsEDSdwMStfwMOtYwMUhQcFtxCbNeoXAvBXp4VQLBqT/CiCiIm0FmgVfRbjoDrfkW4iuoo1nb02ApQKpsJWk3qHbStAqHN174IM/jDUgfTN6xH6pPIGx9RJH9AaBtcrhcgOlKUSVz51Z4hu9mHXsDkaXKtnwIFCsxjTxlEIbm0ufhHGv9lKdquNyGJ1gnAFN8do4lMPUYrkqfhs/8GebpW1CKVs+yr8a+t51xYFG33WFFlyPiVw+MAyoN2acdfmHNnZRnVBR6VYBhBotFPaw36Qs+SlR3zBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYhMkvTpf4i7gFVinhKItAhZbHK/rmX9BNFrcYK6QdU=;
 b=MGxbRnJAhfpgb6e5PxuIVMw0/g/Yed4HrHsNaYrlbQ1yC2poZrcvrMKF3IiDhqevm5BymkwE70SpM/Bk50H4j0Kj93ISrTW/4o3ekhFLG4+oLEyMN3d7YPKlyPFIPCjRQwVaUr+Kozpr5RoWo8K8APv9Oxcu98pwNazomNzBWhTm1oZbeB5j0xHDZrq/93iWCjfO+DM1yImyf+X9LUC1j6h/dzTN9R6s9El2YF4bA7wzYVU0+8HF3Z/FNMyuEbCrvE7MSphMyl/K2+3wd3nj7M7p1kW1EWn4DF9JZrEQ5MQJAAvVHAM7ZDBOd7DhwiyiX5teKdopFhTg8lq5zO0X4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYhMkvTpf4i7gFVinhKItAhZbHK/rmX9BNFrcYK6QdU=;
 b=af0MT6Wc44dRMqAupeAbom1WW5Hl2Yy3Ud9ndjMKz9NBPWXF6SWR+bjZDKr8agL9RxvYWOBgFd8vtuei4JXXOcM/wi29lO1ndZWr/H9Ncf+XmRrE5K0rxOSCncTfI/KLVzRQZzMJWMNjvIuJjZf13Mhv77dofgdg7s2/opDyuLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com (2603:10a6:150:d2::10)
 by AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 13:19:23 +0000
Received: from GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66]) by GV2PR08MB9158.eurprd08.prod.outlook.com
 ([fe80::f9cc:2e21:d017:7f66%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 13:19:22 +0000
Message-ID: <f7cb2a51-fce1-659d-9c29-3b21b5ba85b9@wolfvision.net>
Date: Wed, 2 Aug 2023 15:19:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] drm/panel: sitronix-st7789v: add panel orientation
 support
Content-Language: en-US
To: neil.armstrong@linaro.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Reichel
 <sre@kernel.org>, Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
 <20230718-feature-st7789v-v1-1-76d6ca9b31d8@wolfvision.net>
 <1e538813-69d4-b3bc-47f9-1ea69d65ef00@linaro.org>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <1e538813-69d4-b3bc-47f9-1ea69d65ef00@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0101.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::16) To GV2PR08MB9158.eurprd08.prod.outlook.com
 (2603:10a6:150:d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB9158:EE_|AM0PR08MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec95a9e-e7da-4e5c-0ad1-08db935b1634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N8x8acoaT4ylUAAUwWDKSR9UN55yhMghKKkCJat6vcUzQMg5URaGmn6pkeGy2A77ufx9ZYc8dFHIOF0bJ9zvWpji8x8Ii9IpaH7HPf72kD/HDzZcwNv01TltPvW7SpP5lsMdBTcKLFz8+XbcAGq5vwog1GY/+zXRg0K1XI/rFEHfYDLLmxZYocDcQAiRDtnl1b5ulMUsCTVrOkfptKrj2GrgbAAudRU+QVPNEJ1iWoYOqCXhotEAjsIxB4B1Y8zQZTVA0dUexxhk9pQGhL+ououXmdeCWDlwuDZ0EAKvxEl+vByzKpwelVt48pOHuYlJNq20iv4ip1phnkmd/uWVl7IsWaNl4eOkdtQ6m5FYI1lzy1b56IBK2vxWxa8YEv8tT6B2fPEYC+fNR0KrgiMiu+kAiSmkX/8OX9H9pt2EtRCzLYgp1QZHPjgj8F2aHIyVwwsBVZGRB/Q7NryLBHsr91Cqns+Q/rz91ldHVzJmRpD9NtDx6d0g3mpcD26C07S9W4XzXfvdHfQHrB6c+emUMMHLNIDo0i6rzQM//qlvYp5+yTpJX7MrzA42Dz7NAyWU6ag5+h8qPoDfz0YyHBLq8XaOu+JVVOmvfkaxA4Q9u1lBlbf1CPqvjP63WMg8kw2V4CLHSqSqIUiZX1XH6uOGn0XdWUbMqYHTKmpisDr1TQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR08MB9158.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39840400004)(376002)(366004)(136003)(396003)(451199021)(36756003)(86362001)(31696002)(478600001)(6512007)(6486002)(8676002)(8936002)(41300700001)(316002)(5660300002)(31686004)(6636002)(44832011)(66556008)(4326008)(66476007)(83380400001)(7416002)(110136005)(2906002)(38100700002)(66946007)(921005)(2616005)(186003)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHIwd1V6TG1adkpVd0FZbDlnK3lYSkdiRFRpdVJDcnJOZnV3alpCZkUwQ25R?=
 =?utf-8?B?bVo4TVZkVWlEVXFiM3pVU0FSaVpyMHljbmNQZEMzSDY1ejZuTFcwWDhRd2ZQ?=
 =?utf-8?B?SEs3WGRYendVWC81dTQ5cU5mQnhYTGtORWxOSDRtdDV0bzlKcHBuVWRLcUND?=
 =?utf-8?B?SkJnb1hzR0tIUTlGcDQ2SGd2dng2Z2ZMVFk3ekxBcDRQZFgvckpIcjdPMHhB?=
 =?utf-8?B?TlUveG1oM1hxY0l6TFFEbDkwTVVOdm82QjQ3ZnVqTGlwQUgwUVNZbk5FZWZz?=
 =?utf-8?B?c3JaWU1FU2czR3ZLVmVtTkJjNm92VGd2a2pwYUowZTNGQnRHQ1dpeHhlMXc5?=
 =?utf-8?B?aEZtNjVrc3VmY2x4bVJ3Z0U2N016OHpVUnFOMzUwcWtkRXYxdG42aml2V2tG?=
 =?utf-8?B?SWNaVWtXQTh4WGNXVDNMYjJrT1M5TzlLMkxtT0R0dTU5RTNDNDJZZGczTkNy?=
 =?utf-8?B?dEpYb3dVUkFURHFjUFVSdndrb1FSMEdEdlJPV0Y5aG04enE3eExQb2w3SkIy?=
 =?utf-8?B?S2M4aHpWazdzYXJDVERjdDljeUZzdXA3eVZtOUg1Y0ZZOWNqQlFKU1BrSmk0?=
 =?utf-8?B?R29SR2hNbmtMRVZYREpkNklzM2ZpN2tDL3dIRjRKTE9Zbzl2U1pzbEJkcEF0?=
 =?utf-8?B?RHlJc0dvSXJwYm9ydStkYnlJZjNzZHd0UGZuSU5PS0xZK3BSR1loTG1OZnhY?=
 =?utf-8?B?a1dUa2xlcXYxbDNhYzRBaXNHTHRMTk05SU5OemlHRnpWeGVQbDVmMWxmOEpK?=
 =?utf-8?B?VDA4SnU2cFI1MDIrUmFQajdtV2ZOWGU4ZDZpOGZaQVVaTFg2cGFjWUxlbzRL?=
 =?utf-8?B?WVRiZ2tsNC93RE9aNUlReCsxYTRUcGNYVDllbVYzUUpCQTh5Mjhoak5RMHZ1?=
 =?utf-8?B?QnhwQzRnMWlqY3BpYjgzcjEyV3J5dTNEdXF0MllFN285YmJac3lnZTdRc2Yw?=
 =?utf-8?B?cG15YkFzZW5zTHY0a2pHRThNVUJ5R1l1ODZuV1dJYTdMOGxLbnVHWHF2V2tH?=
 =?utf-8?B?M3NjMzFyN0gyMlUrYzRjZU1vclhvSkQ3RWxQUk54SXpjVEpoS1JtanBtRzZ5?=
 =?utf-8?B?YWNxWlN1dU1WSTRtL2tDaG9MRWNYOUtEQkkra2RTVHBOaE5VSFFQVXg1Umo2?=
 =?utf-8?B?cHJYTEZ2TTZBaDhFaWJJbWVGWTZVdVd6RjJqRW9mRjd5V0xaWUJWNEJEaVpK?=
 =?utf-8?B?SkZ2Y25zZ0VKU085cmNwMSs1K29JY0NvVGV3V1d1MUF4ZXRkN1UzaUJuQU4x?=
 =?utf-8?B?YXBYeHFxYzFhdXROeGpPWDAvaE95bkNqaVdQVGJoM2psc010UTUrTDFuYVpq?=
 =?utf-8?B?Z0x4R1JIazBudjNTSjFJQm9EVGQzM3RSMHFzVjZFb0EwYlVHRGw3bGFLa3lZ?=
 =?utf-8?B?eVFVVzhBVVlNSEQxdlE0Qyt0amdWTC80ZVpyNlNzSDF3OGdHeHFtSEcvNHA2?=
 =?utf-8?B?N0ltNEFua0Jtb2lmUDFOY1U3cE1YMmUwSnQ0Rjl5SW1Mc09WbVpta2ZDcVFn?=
 =?utf-8?B?ZGJ6eXhqVVNhamw1My9SRDc5dE5aMS92RTRsUk5aUFJaUEhGaklXZnUvMW9E?=
 =?utf-8?B?Mmd6ZmQ2RVo3OElTa1hpanVLekxVYnpJRFdHOE95M0RNR2lVZTcxV1BRYU5R?=
 =?utf-8?B?ellRdGhvWE94T0dCaEd3YThmVFpKdCt5OFdvZ291eEppQ2tSb2dRZGcxVElp?=
 =?utf-8?B?M1ZEbUpxdFdYeU5VOUhUUHpkcU81RDNxVEE4elYya29QWDZaN1FwVW91R3Iw?=
 =?utf-8?B?bkdwYXpnM0VtSnBrTTNJdzhaV2dVME1acEJNYVBVMm9MYnhuZlIxS3c4TEVL?=
 =?utf-8?B?Z2V5ZWlwYURaOUtrRHViU3g1SWpRY0hhTFZyRUw0UDlSVyswdFRnL1NydktD?=
 =?utf-8?B?RXBDOHhLYmkzOHdWdHBYdjV1NWNSa2R3aW9OeVhjTFRYbGN3dnN3NTJmOVVC?=
 =?utf-8?B?clFCK3dqd2c4MWJkbkhhZE92UGFCcUhRUmkvZ09DdEZEY04yWjlhYmJhblpI?=
 =?utf-8?B?UVg0TXZNTXo4cUJiUlN0UE5OblJIWkF3NDFSL2RjWndJUG9pdzcxVkpvL1FY?=
 =?utf-8?B?U3ZNc1ZVbkc1Y2dJU0svSFhKZXZaekRyczd1MnN0U0FCYzFtL0REeVFDakZw?=
 =?utf-8?B?SjRzQnZOaytSbC9ZMEJlTE9UYjJaajcxSnd6blhvQVVIbHlMalI5RGJlT3VB?=
 =?utf-8?B?NjN6ZXRaSFhUZWlydmI1Ky9KUUU5WXRGV0o0U2szSTlkUVE0bUhNRE9ReGN3?=
 =?utf-8?B?ZllpQUVFaUV4Qm5yMVFJUVY2U3RnPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec95a9e-e7da-4e5c-0ad1-08db935b1634
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB9158.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 13:19:22.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2vSgD5fm+aJ+VjHsUWnOzPxZD2VOL00QDz1nQPPRUEY/I3Dsz/zAjfexIFn3Hp2XLmm+0I1JemMaRVIWG4dBAblpaJTiy88LSBGdfvOD2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On 8/2/23 14:39, Neil Armstrong wrote:
> On 18/07/2023 17:12, Michael Riesch wrote:
>> Determine the orientation of the display based on the device tree and
>> propagate it.
>>
>> While at it, fix the indentation in the struct drm_panel_funcs.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 28
>> +++++++++++++++++++++-----
>>   1 file changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> index bbc4569cbcdc..6575f07d49e3 100644
>> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> @@ -116,6 +116,7 @@ struct st7789v {
>>       struct spi_device *spi;
>>       struct gpio_desc *reset;
>>       struct regulator *power;
>> +    enum drm_panel_orientation orientation;
>>   };
>>     enum st7789v_prefix {
>> @@ -170,6 +171,7 @@ static const struct drm_display_mode default_mode = {
>>   static int st7789v_get_modes(struct drm_panel *panel,
>>                    struct drm_connector *connector)
>>   {
>> +    struct st7789v *ctx = panel_to_st7789v(panel);
>>       struct drm_display_mode *mode;
>>         mode = drm_mode_duplicate(connector->dev, &default_mode);
>> @@ -188,9 +190,22 @@ static int st7789v_get_modes(struct drm_panel
>> *panel,
>>       connector->display_info.width_mm = 61;
>>       connector->display_info.height_mm = 103;
>>   +    /*
>> +     * TODO: Remove once all drm drivers call
>> +     * drm_connector_set_orientation_from_panel()
>> +     */
>> +    drm_connector_set_panel_orientation(connector, ctx->orientation);
>> +
>>       return 1;
>>   }
>>   +static enum drm_panel_orientation st7789v_get_orientation(struct
>> drm_panel *p)
>> +{
>> +    struct st7789v *ctx = panel_to_st7789v(p);
>> +
>> +    return ctx->orientation;
>> +}
>> +
>>   static int st7789v_prepare(struct drm_panel *panel)
>>   {
>>       struct st7789v *ctx = panel_to_st7789v(panel);
>> @@ -346,11 +361,12 @@ static int st7789v_unprepare(struct drm_panel
>> *panel)
>>   }
>>     static const struct drm_panel_funcs st7789v_drm_funcs = {
>> -    .disable    = st7789v_disable,
>> -    .enable        = st7789v_enable,
>> -    .get_modes    = st7789v_get_modes,
>> -    .prepare    = st7789v_prepare,
>> -    .unprepare    = st7789v_unprepare,
>> +    .disable = st7789v_disable,
>> +    .enable    = st7789v_enable,
>> +    .get_modes = st7789v_get_modes,
>> +    .get_orientation = st7789v_get_orientation,
>> +    .prepare = st7789v_prepare,
>> +    .unprepare = st7789v_unprepare,
> 
> Changing the indentation of the whole block is a spurious change,
> either change it in a separate patch or use the current indentation
> style...

OK, if we agree that the indentation should be changed I'll be happy to
move the change to an extra patch.

>>   };
>>     static int st7789v_probe(struct spi_device *spi)
>> @@ -382,6 +398,8 @@ static int st7789v_probe(struct spi_device *spi)
>>       if (ret)
>>           return ret;
>>   +    of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
>> +
>>       drm_panel_add(&ctx->panel);
>>         return 0;
>>
> 
> With this changed:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks!

Best regards,
Michael

> 
> Thanks,
> Neil
> 
