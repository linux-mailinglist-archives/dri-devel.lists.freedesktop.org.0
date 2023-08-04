Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC276FF76
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3FD10E072;
	Fri,  4 Aug 2023 11:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2088.outbound.protection.outlook.com [40.107.241.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF14510E6DE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxbZJbcLQ9PjdTbzan9MUwcvVjq5vFVG44BzmxYfJATF4WkBeAmK9vJnIKTiG8Sz7T58VxuKTH6Z/SzlZV5uqdCStd84Htgxo+Yfp3XsIdCfWCfJjWCsDdDQLBv4KF5irNrln41VihtMyzL/K+gmxgDRaMfMRocntxJxjNeGlVrPIKym/iqfSY9gSktrciduRYUcQSIctXejWIJBXBMnw+TEBWTifPjvEj3BtJB2uqG5RdasXRhx4PzgHpd11BANZsKP1q9lZ7JG0NmMIZ6R0y2TXhu1Hz3uGkjqKdn3JQmhSv3cDL7NonjMAddVTa/v4pJgKu6vkoV7ciu9FtLwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtsTVL3ZwL5d3E70TDusVMzVmB+3lU5y6/H1Pwz98UA=;
 b=SBK307d6vgnLTG11pvf1SswcPT4fInJcrmGxJzYgdEkwkJ/290goDBvG5bs/gvGKsju53dfAyRJGpyTjeu4AKwShhUlYJ+M9EN+4UAHEmE6b6Zp66d9nHbG51uhGt3lu0+z7rsLtYO18zwk8bEFSVWJ6FgKqkGb6YhdM1ZMCK0HlWhhBeOsrZV3ew+xzHkPVvdPfesmtp+jPZ09jpF7Zd5+Ae+d6VWNWxf8BjnDLoF0x6N4HGnWHPb7IElKNcZFB082/TdKE2jaQ1wOnnzCXA/mkoCpSblUZV4nIsZLnVGPabwZgfV4Wdww2PRqgiwGBNFtsdpyzC+PoN3JJcksW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtsTVL3ZwL5d3E70TDusVMzVmB+3lU5y6/H1Pwz98UA=;
 b=wznBTfVCXKQyhbmLKgso1IoRoTXoE5c4t8W5AWvyeJUyDAj9TCrzcSepBYVkbbQ/LNpAPHv7qHO4IBw0Lzka7v7X4iSm9rdG8scDlbWhWFKnuk0+t/zWNPGK9FPi3l7a8dt41fCY26lrL4Zg0WbkwBOYZ6aHEsrz2pA8eQKbt3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB5PR08MB10214.eurprd08.prod.outlook.com (2603:10a6:10:4a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 11:25:06 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:25:06 +0000
Message-ID: <f71a8729-57a8-f45f-7db2-41ab543405de@wolfvision.net>
Date: Fri, 4 Aug 2023 13:24:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] drm/panel: sitronix-st7789v: add panel orientation
 support
Content-Language: en-US
To: neil.armstrong@linaro.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Reichel
 <sre@kernel.org>, Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
 <20230718-feature-st7789v-v2-2-207cb1baea0f@wolfvision.net>
 <b2407b1d-23fb-3284-c4bb-b3a952d361dd@linaro.org>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <b2407b1d-23fb-3284-c4bb-b3a952d361dd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0271.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::38) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB5PR08MB10214:EE_
X-MS-Office365-Filtering-Correlation-Id: 1748d296-a217-4039-af4b-08db94dd748e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N0Gu7zaRZstlxo2r2VEsZgtyjPJ1N1787Q03KGUmXwTuhVcIKHXCnZinCv4XyTx2SbErK1oOYahj/lX9W9+shrFXw3KnXL8P1zRHt9uLrL0O0foMwzwClOhEjXPDMi9iYGvv3Av36yahjWV3ytwE59LxiApmZkxekC/zHhl2/EPmF8WQ8fiu7W6/MIH3KZUYAPVdlg8+wfHpRGqBmDD1kZKEvAmcXBQulw4gbOmmIp9a2b/Y+ECX6R2ZdJqbCAwEpL3SZB/sLA5aIxki797N8O31HrloYlll5vD+jcpHGhh7LVVfbb04ttDSjTR4fPuYETUWcYmQABq3BxDXC6k+pDnvx7/cIZ8v082CNSIx0vcsyvMuFf+M6F/jZs1RdBPLSHEexHJPNJNqvnSbtlxuLfw/2ABlZZbV49HmJHZ4biMP6MLAKSGduHK4RSzZ/gLg/zXPxcb80ey28DZLRZ6XN/Zf6X9cnZtfkIZj60lLa0n8yhS6/0ilxGt01szJx4LjXJrfXoUGISbXaTA+6B+OJUsAGPL0aFo0Jr76xvC2z+2s90BpuxyPRVn8bV6gNbNzxJDB3oSStpBD/OEcyM/mfLIDnN+2AEy97XW9ewSQZgoLWdttfRZgZLG97JG64WhGDgXZCY9c9YtNA39FGnT3r98nAKbosu/y9u7HiONVtG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39840400004)(366004)(346002)(396003)(451199021)(186006)(1800799003)(6666004)(6486002)(6512007)(86362001)(31696002)(6506007)(36756003)(2616005)(53546011)(38100700002)(921005)(5660300002)(41300700001)(8936002)(8676002)(31686004)(6636002)(4326008)(2906002)(66556008)(66476007)(66946007)(316002)(7416002)(478600001)(44832011)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVlSMDlNem9CazRnZWppUkVSY1lLeFUrTXZ4U1RBNGYxOWdDaEZpRHlKTXhF?=
 =?utf-8?B?bmdYWGpJR1hPY2FnSWluNnJjSTRGYmdNRks2bGR5TUwxSlpWUnN3YjNVTS9Y?=
 =?utf-8?B?QXhEYkVBMSt1UWRzS1JWYWxRVlZteXlQWlBzb3NVakZmK29Hd1c1T2p6NTRv?=
 =?utf-8?B?bjBGSGNZTGZFS2VWS1hYbVFVUU9JcXZDeU0zNklEcVB0b0ZQOGFOc1pOUktK?=
 =?utf-8?B?MUYvMTJGa25YTkxQVHRVbjlHOU1qNDJDYXhJaTdvbEhmSFZHaG0wcENOMStr?=
 =?utf-8?B?a1VMOUtjQU4rTHdFWG1vQWZVRVZjenZ3N2pWQWJPQWg3M2hiei9CRmFvTGpj?=
 =?utf-8?B?N0VhemxZU2NQeE9vcnZoekhWV0xvNS9wM3BSTjRTK1lxOVU4bnNMUXBTSUdS?=
 =?utf-8?B?K0hFTHQwUmU0UHA1VEF2Yk5FTXVtTFBDSGdCZXM5SnBLQlk0V2x6dlM3OVpl?=
 =?utf-8?B?RGFDNXllQklOdnlQaU5GRmd1N2FvcVFaTEJRa2Y0RCsvajFGd3ZMOFVtU1R0?=
 =?utf-8?B?L1lnSFFaeHNjU2hkQktsMDY0K2hGZmJ4Q2dWaXNLZjhYS05MQWtIcE5wcU01?=
 =?utf-8?B?clZpcHVkQ2VkbjdtSXVTNy83SkU0OThnR0V5K0YveHFWdWFsWHl6MFI3SkFu?=
 =?utf-8?B?K3VxWjdTYXp3UmZoVmNaYWkwQ24xOTVWMkRCOTRjbVR5TWhCL2dpUEEzdFdr?=
 =?utf-8?B?SWIvMEYzSFFQbEtZN01Xc1U1RU5mZW9mM3ZmMmpCcnRyUkxPN1ZRWnV6OVM2?=
 =?utf-8?B?RDFRczh5VWl0TVAzZ1pmdURKd3NaS08xMXhjUmxlUURTbVBNK2owTnRXQmhj?=
 =?utf-8?B?QytjYXhvNURrM3JtdFJ6dFlOSStEdUEybTFSdXNNenlDcC9qTjJXbUdIaGds?=
 =?utf-8?B?WG9VZFhLcHpybE5CY2dCYWk4Z0F6UDJuelkwaHRTczZkWWt2SHFDU28wQWgr?=
 =?utf-8?B?Vk9rNHIxQWZrNHlvbHNNNG5idnM0T3Q0U0RIUFpRTVVQblFSQXNGK25qeVJt?=
 =?utf-8?B?ZzBQbmMzd1A1Q0ZTdkJGcktZZDJmVzlCaU4zakxsY25HWm1kbzUrR3VKT041?=
 =?utf-8?B?emZCVTFmbUxlOWNsVnZQYzNvRjVMMUpVeHI5KzVBQWZZVjRBc1JsRlNXNlJL?=
 =?utf-8?B?OXZYeVBMYitTYkxoU3pKSGRLQkFUNURzZC91bHZMZ3ZES2V4cGRZVWVON1Nr?=
 =?utf-8?B?Z1oxcVh3Z1ViNlRhenFVeUFvemFJcldtZEROTVIvRGRORXhlYkhCOGE0S0xz?=
 =?utf-8?B?Q2NKYmdkYzZqSVgzSEdMZkdOZlJ0Z3ZHS0RjMk8rM080UGZDem9YcDNnRVhr?=
 =?utf-8?B?dnlHczdkZHpEblloK0NiL2tvUEM4aU1nWTRYVzFiaEhTNERONlY0VWwydzUw?=
 =?utf-8?B?ZFp2YlVZWmIrY3lyZUliTXZCeW95TWU4bldhdDVpclpYRnJ6S09Hdkpva2h4?=
 =?utf-8?B?MVZOT0VVOCtPbkpDK2lrbWJza1VCQkhyYWJ6TWV4MGtJanEvQ1ZwYWFqMzhy?=
 =?utf-8?B?eGlqZ055WDNHMVo2eENyTEJXUkdXZ1NMWmlsTWVhMWI0QklIY0h4TXpjVVJF?=
 =?utf-8?B?NW5WL2NHNnJLOTN3K0RJN0prTFQwTVdxU1o2YXNiVE9oZ2NzNUZ4Nk5PT1hq?=
 =?utf-8?B?bkE0RVdXSVNQNC9PamJmUU1vNUgxa1hwa0tTRXBiZFQ0ZXZmR0tkREppa2k0?=
 =?utf-8?B?YkFmeUQxdy9BbXQ5cW53U0x6US9CVVBndWtLNjFiVHlhaVpsZHE0OTVMV3ZW?=
 =?utf-8?B?MCtTMUhQMG1HSXBQSCtYQytCRXdDS3pQZFNKK3pQc3RlUXNxcmpuem9mRG9P?=
 =?utf-8?B?a3pnRDdXM0YveTdsMWRPNllOWld6Y3ppeVhLSGFwd0pOemN6OHpYOGVZTWIx?=
 =?utf-8?B?S0hpWW1oL3p5TWdJWEZ2THhsTmhnTHZIZzNLN1Nsc29mRGVTNWNJbHpURkxP?=
 =?utf-8?B?bUh3Mkh0Q2pBU0xzY2JXb0I2Slk5dU5ER2RCbTBRZFM2OFFnVlJpRjhDc0t6?=
 =?utf-8?B?K25tMEdleFlSNktOMEUrOUE5ekFDbG1TSE04TkQzWEhoYlN5TUZ6NnV0MDBn?=
 =?utf-8?B?V3JwdEp3NEhaWGU2V3VxYmdGRllwQlR3VmpUNEpmT0hieUxPVHJXRE9EUU9D?=
 =?utf-8?B?a2x4enNBNzZXYzE2cUdUbHcwakhzZmMzaVkva2crNW52VjNiWjdGMFBPSVg1?=
 =?utf-8?B?UTlyMG82WUVCY2JjNTBQdmxobWVBdm11REgyUk1LdXRkdkNpWkR4dDdEMnpJ?=
 =?utf-8?B?ODY5YVFhUEE2YXZkTTVQOGYxMVVBPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1748d296-a217-4039-af4b-08db94dd748e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:25:06.8829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9srQwKQVGkopVEaRSu1duR7GJWicnCvhM4nG71tpxzbZSs6X52JTwXbVLIZ0DL1U1LVMzEfDSW9NC7hKoq71mFISwri4sxuzHz+L2KyjcbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10214
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

On 8/4/23 10:40, Neil Armstrong wrote:
> Hi,
> 
> On 03/08/2023 22:13, Michael Riesch wrote:
>> Determine the orientation of the display based on the device tree and
>> propagate it.
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>> index c7cbfe6ca82c..6575f07d49e3 100644
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
>> @@ -349,6 +364,7 @@ static const struct drm_panel_funcs
>> st7789v_drm_funcs = {
>>       .disable = st7789v_disable,
>>       .enable    = st7789v_enable,
>>       .get_modes = st7789v_get_modes,
>> +    .get_orientation = st7789v_get_orientation,
>>       .prepare = st7789v_prepare,
>>       .unprepare = st7789v_unprepare,
>>   };
>> @@ -382,6 +398,8 @@ static int st7789v_probe(struct spi_device *spi)
>>       if (ret)
>>           return ret;
>>   +    of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
>> +
>>       drm_panel_add(&ctx->panel);
>>         return 0;
>>
> 
> This patch doesn't apply clean on drm-misc-next, could you rebase and
> resend ?

Sure! v3 is out.

Best regards,
Michael

> 
> Thanks,
> Neil
