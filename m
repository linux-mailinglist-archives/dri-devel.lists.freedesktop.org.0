Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8BEA5BA12
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 08:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75410E518;
	Tue, 11 Mar 2025 07:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="q8lshqv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05olkn2064.outbound.protection.outlook.com [40.92.91.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5664610E518
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 07:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEa9Dteh148lIolgqhJj7nv9E6kJ7BssFkXXJ9fAywpSPeNOe6ZbuFsjJuM24IPEwabp3cl999MZp2Et30x3EkmL+lbOnFC9VO/PsxSDbiieurHvQvGmt2UlOnmLA4nKFLeykrQ1s3rV6jIL7qQ0eEH6QqCIZaFtCSBPCv3jF6jB0nsoOsvAUTt4ZCHjIPlfxUXybIidhm3gr++F2EJ+bp5mVpLeb8S8n95GGG4G0oySrJaq4yuK0bIbh+mWPBmFFs6xF0VLiqyUevkALCUJIfXfHxXOaByE9uBeah34VypZpUzOFvAhNj3Q5/Zptn2XyTjSJ+94Jl2iyoWTuEcymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/VTuLG5501xlGlfhgtQO71+duhp2qMNAuKMog7UaOY=;
 b=X+/7WvKwAI0DqgjzAmvEBQOJUwYOkcnOBrnV3GJ7O9g3POqJqzxMLc2A7jab5UocmweoNyAVacxbr1ZuArOsWO6x2CkSy3NiF/7nEwS6n+vvuBP/F9Zko/AVgowV35pZYBGoyiIrRNlT2AKhCY2mggEGaSWaxk25zaLpuESkT9Sc/TaW08lb6T/5dnKNuyG7B8YREZfLMICK9TkT8cqEFZjS5waCv8r/V5pez/JVvTuQZFdfyffTvfh57OfFiM+mwbgAuZZT5D0uVp28ur2HttO2idja7yscbLA7h/CMwoOgffDPQooKpjUbekOeOI2rY2ZYi0MN9VY+7I+yHs2TWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/VTuLG5501xlGlfhgtQO71+duhp2qMNAuKMog7UaOY=;
 b=q8lshqv1SrvcQlk6Rr3qk2zzfJ42BJoaK6zNeSoDplbyqwGJ5UGWb6Ka4qsuRxKzoUSjYAAkwKKgubx6tJTUmvKubVxnKlGPGi+Q2BHkCMwgM32XT9YbxPhKp6nGTL12owt8+1K6N4i5qJZGiL3i20tL++3bkXBvxyTAvmJwVz96fBKXptetfGJWQdxa+l3D1pxvn+hbNA0zWC8ZjDgK7lupQ1xKe/Pwi0WDWh5JIKZKpkBqbTxSgrxYlsTM9gLS0t7jbiJIjQvQ6rWziiiORPWCZi86tEWUy9qmXu0mDMYgbGx8jrpuvLdQQ9VO7U5hjliNome5iQ0PsO+ViDHAAg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by GV2P189MB2455.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 07:42:28 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%2]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 07:42:28 +0000
Message-ID: <AM7P189MB10092D0348FC9E0A70C911E2E3D12@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Tue, 11 Mar 2025 08:42:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] drm/verisilicon : support DC8200 and inno hdmi
To: keith zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20241120061848.196754-1-keith.zhao@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0283.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::14) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <7201ddb7-3e75-4ffd-bf98-cba9cd8eaca5@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|GV2P189MB2455:EE_
X-MS-Office365-Filtering-Correlation-Id: 5769d042-d075-47ec-0ee1-08dd6070459b
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|5072599009|6090799003|8060799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUNrT1J6MGVVYzRDeWZvOFc0MnF2QzMvS0ZCNGJZZlN4MUFQOUJFVkpXMUpy?=
 =?utf-8?B?RzRSTzlib05iaWxIQm1VQVhsRXVxKy9pRzh4QWl2S0s0N1NaQm1zTk8yMnMr?=
 =?utf-8?B?T0hxYldHK2lpS1phN05CRGlWaGgzWG43YmQ5SUJxeEQwZkxUd2VsQng4WUF0?=
 =?utf-8?B?ckhmSWl2akdtTUhKVkljeXQzak82TFNSZSt0eGZBSFhHTm5lbkhteGxxaXR6?=
 =?utf-8?B?MEV3M3IxajAvNTBDajB0VEwvMEtsK041TUozNkVuOE1YbldqbE9BZ0hGVjVh?=
 =?utf-8?B?MnVTUk9FbjlyWHhBRG5yTDhFYUNnRk5UZit0T09pWUk2VjV2VU9iejFKMjFx?=
 =?utf-8?B?d1FPelNDKzRlTTNTd3RFVk43V3N5N0Rza1ZEMUVseG5RajZpV2tpVWhUR3BU?=
 =?utf-8?B?VUZ0WExOWVNRZ1FDOTA3RldxQkVwQ1VDeUJGdGN0ZnZOc3JuMWxZbnBPRzVs?=
 =?utf-8?B?Q1NGdXBIZlkzd3lnZEk3ZTlXa1I2RndBdHdSaytKNDdBWExhdkluT3FpMC9t?=
 =?utf-8?B?aFZUMTBPRGNXaG5mMG9HWGpESS8rTTA0NWVEOHpOVU5DeGdpSEMydEJidDFm?=
 =?utf-8?B?bXFuUjlncE8zVFB1YVlFb3FvS2tBY0VIeVk3OXBXVnp5czNjd1NQdVA4azVu?=
 =?utf-8?B?YmRGMXVzMVBNQXBWckFYbEdBbUp0TlBQQ2YxSVRmTUpsMGZxY3RiaXV5dFR0?=
 =?utf-8?B?ZHVYcXRJS3JyV1BTRzJ1d0NMc09MV0phanphN3ZTc0RBZFNnWVZEMEk2RHkr?=
 =?utf-8?B?SlB6czJ0ellHeTJ5UXZ0UGMrcnI0TG9iaUh5SndoV3RYSmZMeW5sRDA4UWhv?=
 =?utf-8?B?UGxGRGlSTE5jVDNTc3RxT1Z5V2tFcXBuTUxXUEtPOERuejdXSWhyK2wzVW5s?=
 =?utf-8?B?OHdaK0RRQWxWd1pNU0pPQi8zeWxMUHl5V3JRZ21TaW44ODExWFUycVF6ZDRF?=
 =?utf-8?B?ZUs4WnE5MjVsc093cjRvY2YrMVZKRWVxRmpVZ2RsUTBiSWxCQVRHYXByV1Fu?=
 =?utf-8?B?QWNOZEVKbENCNHJpUU5taG9xc3N0M0ZQL2RxY09rWnRuOUU4ZDlTcGhYU2pa?=
 =?utf-8?B?d1k3bGY1V2lWTTdNdVR1Um8rdDJqMWh4R2twanVUbVFRYW1YQ3ZaOHY3VTZY?=
 =?utf-8?B?S1R1RXowcjBkcVpxMzF2M3U1TlVQYVYxTjl3QldWYWs5S2RCZVlmVldiTjlU?=
 =?utf-8?B?cXFhVERzL0xBOEhjY2d2RTAza0FNaDlUWHoybEhWSzdaVW1UNVptMFVXYkJ5?=
 =?utf-8?B?dEdEbTVWMkJ1RDNnS0FEZG9uVG0wK2lsWkJqRGVnbXdDZ25rRTQ3cEErdXY2?=
 =?utf-8?B?a1hHajEzbUhaVU1XQmIyc3ZjeVRTb3V5WnpXbnJ5RCtYYjlneWs2aWU4ZDlF?=
 =?utf-8?B?M1RPY2RWWE5YZ3JVL3MraGRveXVSY2E2YVNqZ1RseTFjNU9aN1l1S2RLWjB0?=
 =?utf-8?B?UG1SOGVjZHoyUG1wYWtxZ3RHMGZkL3VrSUlWKzhnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpSRkRwNFI2dWorTkJGWUdaWkVYNkNmd0xUaFd1YTUza05OVjhaVVFseVd2?=
 =?utf-8?B?V1FuNXJ2cjhwRlJzZmY1b3RzcVlSN2RHemZlNU1jUzQ5MUsvWUlRTUswN1U2?=
 =?utf-8?B?eWFEbVpBYllWWHQwaVhPSmNoYXF4MTdPRXczbEVaTTdrRTJFUGp4cHQwSXVr?=
 =?utf-8?B?T204c0tTdnhreVZYWFhnQzFhU3E4cjJURUxJZ2dUcW5CbXZNTy9TK2lycmZp?=
 =?utf-8?B?OFljckNseEgxZXBJQjRpUFlzSVBrZGMrKzRKWUdYdkUvV2VGczJMV0Rvb01R?=
 =?utf-8?B?dXloQzIyTzduOVZqZmNEdnB4VHlRTFZSMm9zTk5FOHJBSjU4V3FSQ0NHdUhw?=
 =?utf-8?B?NVkrWUczWTMvSVhjZjlpWDNSUFdQZmdERUNWdTROR1BvRUh6RmF6SjlLNW9w?=
 =?utf-8?B?cS9IaHc2cTk4VUFOQUM0b25OTjdyWDUweXFHSk9vSjUyTjdSUHpYOVNnaXRv?=
 =?utf-8?B?QkllamNlYUFOcFBLWDJmTDJOKzFJUFZaaDE4Y0REdGZiK3NhK0g5UWU4Vmg1?=
 =?utf-8?B?WUtNbytXUjMrMHozZVVwTnNvWHJEeHRBdTlkQThueHdDdXhiOHYzWW4xd3Nt?=
 =?utf-8?B?Nkd3dWpYcEVTZ2UyUkRrVXBJOWp6ZHkwMXd4ZVRlQVNuQjVzYkpZRmp5Vith?=
 =?utf-8?B?SGxOUlNEdFR4a2FXMC9mb0tJdmVQOVpJRmVVYnJHYVZ3R3p1QVdQbE9GeitD?=
 =?utf-8?B?czFlUFJSYWI4OHZiYmc3Z3Q5RUNzNmlMOEUyZjN6MHlWYUl6NEloVnZuMTNs?=
 =?utf-8?B?ajZUTFdlOVdmR05KWXhsMjUvbUZQVFRjV003ZjlSLzYrelR3TG1ocHJiLzRi?=
 =?utf-8?B?dnpnQVR5anduYzd2TXMyc2lRR0JtMlpvNDhIRzMxYTY1azZYRmZjV3YvdlFo?=
 =?utf-8?B?QUdsczc4Tm0vUWk3Tzk2SXMxdTNJMWJpb3Njb0lGVU5wamhOblRBdU41YytH?=
 =?utf-8?B?UDZkQlBmV1FObldycXVLT3AyUkw1a0xQeUF5VEVjMjhwcDVIYXZBNCsxODVN?=
 =?utf-8?B?ZjdEc0k0QnBWY0FpNGtBa2plZzluZ1FubDBySERHSTBleGlkazdTK2ZBRVlJ?=
 =?utf-8?B?VEJzQmkwcm1BRXltUnBPRmpVTEE1N0s2am1zdXk0VlNXaEh2OHhiVXV5OTVr?=
 =?utf-8?B?akgwdk80YytPLzR0Rmo4a1FGM01nSE1CWi92QSs5NGh6MEl5b1dIM20rZkNQ?=
 =?utf-8?B?OTA2OUZ4V1lOS2JsSkNNazlGUThxZjhRZktTL0l5OUZSS3pEUzZESlprZjBr?=
 =?utf-8?B?c1FXTkJpNVdpdmRyamsrVjBzNU90dW5jMjM1YytkYjB0Q0htQTNhbStNcVlW?=
 =?utf-8?B?R0dJUWd6MXhZLzN3ZGYvRU9PdzdKNVpZT0VLVFdTbHNXSFZuNDliSEwyMTlJ?=
 =?utf-8?B?SjRFTHFZMmxSZG5yZUlaOUE0Sis0bWNsMk02Ykx1VkZROE0xNFhyVFpmZSsv?=
 =?utf-8?B?UmRxUkpxbEJxc3pCZFpwMGJFZ2xJWStmQ3dNOENUNDF5bUNDQXB2dy83ZDNJ?=
 =?utf-8?B?ZFJLRnRleTZqVXpEUi9jRFdtM080OTREQnprYzI2cEJZVTVEZTdTSFBZOFU5?=
 =?utf-8?B?TDZCM2JTcElKNFUwTHZybE1EUCtWcEVIMlF2ZmsxTWhEWGxCTEMvWXRrUnIy?=
 =?utf-8?B?Y293UVVnYmRBZUJlSHNVdmRUNi8xT3NnYUNOZ3h0UHhubXU0RHdvMjVPRUh2?=
 =?utf-8?B?SUExdVl1cDBmWTJPUU10SFlhRm1DeG4yUzBoc2dOZWd3SjdoRnVHOFdVT085?=
 =?utf-8?Q?QguLQpntKhU1zyikO2Yq1DeooY8DpXpUbO7GKKx?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5769d042-d075-47ec-0ee1-08dd6070459b
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 07:42:28.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2455
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

On 11/20/24 07:18, keith zhao wrote:
> Verisilicon/DC8200 display controller IP has 2 display pipes and each
> pipe support a primary plane and a cursor plane .
> In addition, there are 4 overlay planes as 2 display pipes common resources.
> 
> The first display pipe is bound to the inno HDMI encoder.
> The second display pipe is bound to Internal custom encoder,
> which is used to find dsi bridge by dts node.
> 
> This patchset should be applied on next branch.
> 
> V1:
> Changes since v1:
> - Further standardize the yaml file.
> - Dts naming convention improved.
> - Fix the problem of compiling and loading ko files.
> - Use drm new api to automatically manage resources.
> - Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
> - Reduce the modifiers unused.
> - Optimize the hdmi driver code
> 
> V2:
> Changes since v2:
> - fix the error about checking the yaml file.
> - match drm driver GEM DMA API.
> - Delete the custom crtc property .
> - hdmi use drmm_ new api to automatically manage resources.
> - update the modifiers comments.
> - enabling KASAN, fix the error during removing module
> 
> V3:
> Changes since v3:
> - Delete the custom plane property.
> - Delete the custom fourcc modifiers.
> - Adjust the calculation mode of hdmi pixclock.
> - Add match data for dc8200 driver.
> - Adjust some magic values.
> - Add a simple encoder for dsi output.
> 
> V4:
> Changes since v4:
> - Delete the display subsystem module as all crtcs and planes are a driver.
> - Delete the custom struct, directly use the drm struct data.
> - Tidy up the inno hdmi public interface.
> - Add a simple encoder for dsi output.
> 
> V5:
> Changes since v5:
> - Refine the Innosilicon HDMI by quoting bridge abstracting.
> - Delete the encoder driver, which is created directly by internal functions.
> - Adapt to the changes in kernel upgrade APIs, such as drm_client_setup.
> 
> keith zhao (9):
>    dt-bindings: display: bindings for starfive,JH7110 display pipeline
>    riscv: dts: Add display property
>    drm: bridge: inno-hdmi: add inno bridge driver.
>    drm/vs: Add Hardware Functions for VS DC8200
>    drm/vs: Add Base API for VS Mode Configuration
>    drm/vs: Add CRTC Functions
>    drm/vs: Add VS Plane API
>    drm/vs: Add Innosilicon HDMI Support
>    drm/vs: Add VS DRM Master Driver for JH7110 SoC
> 
>   .../display/bridge/innosilicon,inno-hdmi.yaml |   45 +
>   .../display/rockchip/rockchip,inno-hdmi.yaml  |   27 +-
>   .../starfive/starfive,jh7110-dc8200.yaml      |  176 +++
>   .../starfive/starfive,jh7110-inno-hdmi.yaml   |   91 ++
>   .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
>   MAINTAINERS                                   |   11 +
>   .../boot/dts/starfive/jh7110-common.dtsi      |  125 ++
>   arch/riscv/boot/dts/starfive/jh7110.dtsi      |   41 +
>   drivers/gpu/drm/Kconfig                       |    2 +
>   drivers/gpu/drm/Makefile                      |    1 +
>   drivers/gpu/drm/bridge/Kconfig                |    2 +
>   drivers/gpu/drm/bridge/Makefile               |    1 +
>   drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
>   drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
>   .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  376 ++++++
>   .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   34 +
>   drivers/gpu/drm/rockchip/Kconfig              |    1 +
>   drivers/gpu/drm/rockchip/Makefile             |    2 +-
>   drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  690 +++++++++++
>   .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |    0
>   drivers/gpu/drm/rockchip/inno_hdmi.c          | 1025 ---------------
>   drivers/gpu/drm/verisilicon/Kconfig           |   32 +
>   drivers/gpu/drm/verisilicon/Makefile          |   10 +
>   .../gpu/drm/verisilicon/inno_hdmi-starfive.c  |  553 +++++++++
>   .../gpu/drm/verisilicon/inno_hdmi-starfive.h  |  194 +++
>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  241 ++++
>   drivers/gpu/drm/verisilicon/vs_crtc.h         |   42 +
>   drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1104 +++++++++++++++++
>   drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  492 ++++++++
>   drivers/gpu/drm/verisilicon/vs_drv.c          |  777 ++++++++++++
>   drivers/gpu/drm/verisilicon/vs_drv.h          |   41 +
>   drivers/gpu/drm/verisilicon/vs_modeset.c      |   31 +
>   drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
>   drivers/gpu/drm/verisilicon/vs_plane.c        |  358 ++++++
>   drivers/gpu/drm/verisilicon/vs_plane.h        |   27 +
>   drivers/gpu/drm/verisilicon/vs_type.h         |   54 +
>   include/drm/bridge/inno_hdmi.h                |   56 +
>   37 files changed, 5630 insertions(+), 1051 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>   rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (100%)
>   delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
>   create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>   create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>   create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
>   create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>   create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
>   create mode 100644 include/drm/bridge/inno_hdmi.h
> 

Is this patch series still being worked on? If not I would like to give 
it a try to fix it up and get it merged.

Would like to get it working on my deepcomputing fml13v01 board, there 
is also a gpu driver for the thead th1520 being worked on by Michal 
Wilczynski that depends on this. Would be nice if that could get merged 
when it is ready.

Kind regards,
Maud

