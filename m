Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11086C73E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD4010E154;
	Thu, 29 Feb 2024 10:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="OLgXzcmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2117.outbound.protection.outlook.com [40.107.8.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F5E10E458
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBXxIEvgWbWkpYMTM5nUdGSx3XiTUWa8AVWt26aDFNDgh9Wyx+p0fNrhWy9i2GZWVlm6gPheqZvByYTQK4YyrRh38aNF2gn8mJxtlitiJuj/BooLy6xJPdcdt895qjlALo6fsQlSyyI7ZJXT39ieGK3pCLHlV6Dcr1tqxfA8jtcznoHTudIQqBNBRMoxF2Pj52huMmSXtuy/KzL5m4z2ImzJXHa1TBDpMR+8IPQxEBJj40gC1jjQOmG4D021sTowO2B45zGAmTh7siJmE0fdAt5/6ZlXThMvl8A26OpGLDIPILIaHurevt4ULOmpkjHV9bko+Llelh3cSPBUw3c5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO4JEyQCkOhlXU6R5z1A0xSihOIvudDdP8nVNCT19TY=;
 b=asY+YS70Pk24TUodXr8+ksiIPDP++eSzhPoZGOvAem9TulBS1d4sGv1NN0Na8bGMkUl6dOQT6DRmoRKxBmc0W78VbPvq9Rm7D2632RfUSYef9y07KTndm4aEp9VhirKvpevA5LnfRMMHIhWN6DFmJLrhILy4A74zikIrcA4ukC+1+EcE0FEmYrZDIcXjGKXGJxN/jQ3OFdI67sJVzRmB/frKH99zb3i79EkyciK4zc4gjRaQ8agWYCX3IqRglUujQD+fiYTAKQFLjejJj+qVskCYk8D8NR2U15iiFSrLMCBJ5xgxgEFlwDt4bLsbvoV0wwP7SmZ34nbhOUrI5ETlng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO4JEyQCkOhlXU6R5z1A0xSihOIvudDdP8nVNCT19TY=;
 b=OLgXzcmZPSQE1TNLgCr2sHEqM54MX4AYmMkdDm/ljzTOlbOt5s8lqm70B09kJdUQ6dCvxDg4o6ZfImRO3uSDvPXZg6xLu7yMe+MjV2CYwNjM7a3aDZ4n0oprXKfy1IO4zl+LHkBFlsWaxl4qZnHTZQe0KF/jnpw5UlsbwMBXxXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GV1PR10MB6730.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Thu, 29 Feb
 2024 10:48:29 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d045:edb:e12b:93ec]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d045:edb:e12b:93ec%6]) with mapi id 15.20.7316.037; Thu, 29 Feb 2024
 10:48:29 +0000
Message-ID: <9480d2fa-136b-47bf-ad76-c8d6d7c9c070@kontron.de>
Date: Thu, 29 Feb 2024 11:48:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
Content-Language: en-US, de-DE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
 <1885005.tdWV9SEqCh@steina-w> <20240227184144.19729521@booty>
 <3798602.kQq0lBPeGt@steina-w> <20240229104723.7aa71075@booty>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20240229104723.7aa71075@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GV1PR10MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 27eead90-6ef3-44f0-12f3-08dc3913f707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tda8LpW6bD7P8/+KiM6KfJwpUywZrFm6RQLzWUpQJCSu3zRPxp/7DZU32djiprMILAxhE0jT7Rsafzw6ZS3ITg+LlkrG/AoeI6EywCPiU1CIUVs8J2tWU8GcP6/GWrdBOUFt9WhJUeWJUHTDdw2Q75hO4O2EKuOw97tEFiGHI6v016+gUPNknEDQZpTslZXf0lUWqGztZfYeuHSAwRy7ueNsq9AkXGRO8kQ29w8tbIG9oQGxkLI7eqg4Ww3m7cigNCo2h5dJzJXU7piePcYXJc3miCDXCasOvykMToE8c+UFPyT2UhWP9CAy4TwGs9z/QV0f7CLvD+96tWPOJ7tXEffcLy3PqwPrzmulRUksP+Kkt8FtWaOmUT9uCEL1nAxjeJhcSyCc/TTAzEgGszNCPF2IaKeRsma9dj5vRiH1nw/WVWHxOuK9yIqE6RLPwTVEE3toa45KZEwRAJhEYeUQpC0EyNCLhltJgqu2HbluprGly3xpNIfNw8IgFU+AfwAMJU22W5of04bVH6dm1UCYhT0GTUq8lWq1SXFRBvvHN/TrqhXbFnFqXHU6aA3IJkY7sDw8DCZnua04X3Fo5BSzzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVRzVnRRRVI5MG9LWnRzZXRFYURPYWNSdDZZcEhsdmN4eW5ySlpna0x3bS9Z?=
 =?utf-8?B?UXB4NGs5U1A2VkV1c0xtV1dobmRydERpaDRYQ2krMlJWM3F3QzZkZU11ZDVE?=
 =?utf-8?B?Sm4yOUJzUVk5RWMxQTZabjZWQzlwVmFXZXVJNmt2bU5STHNOSjZuSk1LWkdn?=
 =?utf-8?B?WDF5ckRONnBjNVVwVCt3S1ByeXpoV3hVOGRvSWJlRlRGaTgycDB1a2ExMkpp?=
 =?utf-8?B?amw3WHdIRTNjL0RKWUl0UkFuOGk5MlJSRUVMaU1vMWJkRmxQekFQdjRJandQ?=
 =?utf-8?B?U003T2JKd21vSGZ1RmhGQStPM2p2bGlDSjBZWkxjazBpQVNEU0JnT0RuMVpM?=
 =?utf-8?B?SGhkM3lSdjY5SzdhdFFGQ0QyTUlJM2d3VzNsd0hsTGVyVmdpQlkvckFiMWdL?=
 =?utf-8?B?TFhqUUZFQUYzNWc1Y1g2TE1oTFRjb1MzZzJpdmJQNGNPMlpUZXd3ODJuWGdU?=
 =?utf-8?B?Slh1Z0JqMWxNWXFLZERpZkRZMFBjUmpBMEJ1SHAzWlU3bnQxckZsSDF6ZGZH?=
 =?utf-8?B?R0o3RlhpOHY2S0FUU0JCS082VitLR1dwZmlBY3hZSHdIUnplaGxvNURRbFhw?=
 =?utf-8?B?Sjl4RE51MEdBcXRMRXZVQU9kbGlSb2EyQXJZT01NaDZxZ0VjVldkQW1FaCt6?=
 =?utf-8?B?Y3lFNm1JNFlVTDNHbW84TjVIeDBoVlMwZWlWdE9lOGlNeTY4emk0T1pmOW83?=
 =?utf-8?B?QzdaUUJCK3A2R1NWUkJEVmdMSXB5SUVxVDBtM01UcW9jS1oxeDlGS1NVbk1a?=
 =?utf-8?B?Mlg2TlhsWmpQRG1iQWUrL3oxL2VadzB3MW9NSmZPeFJkTDhqMFIzMWJaRE9B?=
 =?utf-8?B?QkZON2g2Tnh2S0NrMzNHb3dlZytvQmVkaWoveU96cFUvWm5MWU13czhWMXZv?=
 =?utf-8?B?VURvTGNCdmlLTGFra1ZZczNFRHJoSFNXTFhwRW9Zd2VmZmlaR3AxdEwvZGZG?=
 =?utf-8?B?a2g0ZjMzWmx1L3lyNWNvVkFzeThhRWIvUjVJVUFOVVpGTmFaenI4djV6SUgv?=
 =?utf-8?B?N3VSRyswcU9CUFBmODRvWTlsRHVRQUQxMHo3di9lWk1vR0dIL0g1WTlzRk95?=
 =?utf-8?B?WWhyYXJlNlRLR3pmM1hEUkJSTmo4Yk9RSFpuMnExc2ZlekVxRllWb1dpSXBj?=
 =?utf-8?B?ckNIYytLVnJ4NFNSRXROM09ZTk03QlgwVnE4ampZL0lva0c1UFF3STQ1TXY3?=
 =?utf-8?B?ek9YM2FkaFFNc1paR25jbmpQcmxBQ1RxZTdJWmc2TUdpOHFMV0ErWHFLcEVH?=
 =?utf-8?B?d2tSMk5Ob0tHdm9OMWk2aU9Rd0E2UE9nbkVWMHRoaUlEVTRJY2lYbkFUbUFY?=
 =?utf-8?B?R0JNeEcrbWF2OEJMekVDUlBNSVhqMDMrM1Z1Y1lEcE95a2pSeENSM3MzbWhw?=
 =?utf-8?B?R0ppNitSK2FmOEJYSHB5VlplQ3AwdzQ1aGcvRjd5b1JBVmlaVU5PN1pseFVz?=
 =?utf-8?B?V1NONXhiZU5SU0U2OExEVDdINzJ2K1ptQnVEcHRITmlzUlFoQlhnRDBWc0gx?=
 =?utf-8?B?REZEQW9xNFIrdXM2cjZEVGJzc2sreC92MkdndXNNRFNieU10MjVFWTdEY1d3?=
 =?utf-8?B?T2RhSG9HWk1jVm40TzJ4eURWWXorUVNwTFdGOEhOZ3RaUnV4TVlnaVlPZkE4?=
 =?utf-8?B?SlFHYnhETjVKZG5DZWV2amNIOVpsbEMrek1VZW42dGNCL0Fud0ZpR3l0RHNz?=
 =?utf-8?B?ZTFtQVZkalArUVZJM3QzWUxwcnlNQVVzSkNRMCsxNUZkeWJWcU04UzQxTm41?=
 =?utf-8?B?NnAyenBZMGNCZ2tGa3dKN1o5RlozbjBHVm5KNmN6Z05tUnEwZ2xlSnRIWUJq?=
 =?utf-8?B?Q3l4NlJoQTFTelFlbHNwQjRIWSsxa1ZnMTBoaXVwTHVGSUwvUjZxcWtaMmV5?=
 =?utf-8?B?QWt4NHZvd013S2VFODU5Z05UekNWKzR2YTBIdzl0am9DK1U3eVpDRlBzWi9V?=
 =?utf-8?B?SzUvckNGZWNBM1MwRElsbW1GOUk5YVF4Mm5rNk5uOU5KVGswdE5nS3E5ZE1S?=
 =?utf-8?B?bU5jZTFNY25CRithbVZlbDduU2Z5NlRCZXNDZkZqeTNvZU9meFlxZ3VGaHl0?=
 =?utf-8?B?R3dJRzdhcW04Ymg3YmVxYlEvcEw1Vi9PQnpBOXRXNXF3RzVlQXZtSHZLYWtT?=
 =?utf-8?B?bEtEeXlaRTVWcWU0VDM4bFFucENrTTEzMkhBSFltV3J1WklIRE8rV1BLMmdy?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 27eead90-6ef3-44f0-12f3-08dc3913f707
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:48:29.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhhI3lrrTEDkpRbD2+kRltHBtfUkgJJhCiaO+Dq6p9+vo4ga1E/aAUoYb4xD6zV1J6g9sCdy9kZDhIpugzJOERDiWQzQKCs1JzmZ6cM+aIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6730
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.02.24 10:47, Luca Ceresoli wrote:
> Hello Alexander,
> 
> On Wed, 28 Feb 2024 09:15:46 +0100
> Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> 
> 
> [...]
> 
>> Oh I mistook this DSI-LVDS bridge with the DSI-DP bridge on a different
>> board, my bad. I hope I can provide some insights. My platform is
>> imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb.
>> I can easily cause a PLL lock failure by reducing the delay for the
>> enable-gpios 'gpio_delays'. This will result in a PLL lock faiure.
>> On my platform the vcc-supply counters do look sane:
>>> /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
>>> /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:0  
> 
> Interesting. Thanks for taking time to report your initial issue!
> 
>> Once I remove the ti_sn65dsi83 module, the open_count decrements to 0 as
>> well. Looks sane to me.
>>
>> If I revert commit c81cd8f7c774 ("Revert "drm/bridge: ti-sn65dsi83:
>> Fix enable error path""), vcc-supply counters are:
>>> /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
>>> /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:1  
>>
>> So in my case the use_count does not decrease! If I remove the module
>> ti_sn65dsi83, I get the WARN_ON (enable_count is still non-zero):
>>> WARNING: CPU: 2 PID: 402 at drivers/regulator/core.c:2398 _regulator_put+0x15c/0x164  
>>
>> This is on 6.8.0-rc6-next-20240228 with the following diff applied:
>> --->8---  
>> diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
>> index 427467df42bf..8461e1fd396f 100644
>> --- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
>> @@ -285,7 +285,7 @@ &i2c3 {
>>         dsi_lvds_bridge: bridge@2d {
>>                 compatible = "ti,sn65dsi84";
>>                 reg = <0x2d>;
>> -               enable-gpios = <&gpio_delays 0 130000 0>;
>> +               enable-gpios = <&gpio_delays 0 0 0>;
>>                 vcc-supply = <&reg_sn65dsi83_1v8>;
>>                 status = "disabled";
>>  
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> index 4814b7b6d1fd..57a7ed13f996 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> @@ -478,7 +478,6 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
>>                 dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
>>                 /* On failure, disable PLL again and exit. */
>>                 regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>> -               regulator_disable(ctx->vcc);
>>                 return;
>>         }
>> --->8---  
>>
>> So my patch indeed did fix an actual problem. On the other hand it seems
>> sn65dsi83_atomic_disable is not called in my case for some reason.
> 
> So you remove the module and atomic_disable is not called, after
> having called atomic_pre_enable?
> 
> I'm very possibly missing something, but this looks like a bug in the
> DRM bridge code at first sight.

I'm just guessing, but could it be that this patch [1] would fix it?

It looks like nobody cared to pick this up, although there are several
reports for defects caused by [2] and this patch is supposed to fix them.

[1] https://patchwork.freedesktop.org/patch/529288/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=4fb912e5e19075874379cfcf074d90bd51ebf8ea
