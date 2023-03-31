Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5186D1FA5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 14:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C5410F21A;
	Fri, 31 Mar 2023 12:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E751089BE8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 12:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdkv2KlymcrVeFsRsQzCfhxo8jIgZzH6AKPJGVIL2627DU3mG/HMVQWwVKoBUKvyNkP2/KMD/o2LVJR/4RO+T1TCc8rnWQYlQLpMlzSXhFtABZrGoyu8Pyfajbigevgvkpa9VzUIYtBFEJectREgpJoKq9M/5nmoMrpYkbbY2YzAhjSx/GloBr2TJnunVlNeKEkJLXrzilnRmDgEHWl3nVv1hyng2rvE0eam5B3hwdDvr8Gk+C/kD6N6WZ4oqCOtPP17H3nzkJKlwMYoV2AG8+vj4kxQssnjXss73AvysBafh5jqmDOk7g0GBL+igwzXsQ4iZTiMFDqyJ1IB8I7GGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXwFKwvQiZWliMwsPFpebMPGK3PnDkp+NK0aisiyC4s=;
 b=H0BzthWWtdlgFGj1T1JHcPDxm1ty9H5cicE4hZ9dQ+mepd6silA2+wGjsGT+Mz+AI9WNb6jU/vWfQzAehjVbHt4JddfJqH9ncnx0X71bhMPDIH/ND5pdNX47FcmLlbRNje1nVRdP5IEY+HSkf9CB+b6vIRQ/Q6tXgu0OR5QxLxGGue+BlxqNrBrr1OrPqqnHLgedW7hB9ZC6xXglHSzvU89B3SzLJqTOVXVK9g+S6HWUpVAuJa0fTuxm9KmrZzGuzIPGe7ZtGtMBqUIHWONrC+uK0zJ9q5XqAh809exgG8A1yiClfsBejmx3C+epTMW2rQLMyNZU3vKXWheqagmWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXwFKwvQiZWliMwsPFpebMPGK3PnDkp+NK0aisiyC4s=;
 b=qAI/OwEiPwIe5symxiFeA8qP97FACJjLBzX8joNTgG4axgo0zeIse1Q+KdsSntL3pUNewsJgqy9dAB9HmanLAreiU4adcKmyAP3updkorlYD1a3gmdiGlFvTRh2Es5A8pi0xZkLkJyuIGL2DWPNbY9IlOxy0KYm8d5SeUODfNX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DBAPR08MB5669.eurprd08.prod.outlook.com (2603:10a6:10:1ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 12:05:55 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 12:05:54 +0000
Message-ID: <fd448514-737a-63fe-76be-4bf1798d8bb6@wolfvision.net>
Date: Fri, 31 Mar 2023 14:05:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCHv1 7/7] drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89
 support
Content-Language: en-US
To: Sebastian Reichel <sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
 <20230317232355.1554980-8-sre@kernel.org>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230317232355.1554980-8-sre@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0152.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::10) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DBAPR08MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c7597ff-2c80-4b99-ac17-08db31e04783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t08JU0HpYFUSfwqX1E3S9XmGztbhvIxGhJz/BdjkMUXt4rLC18GJoQrjFRiG+XsC9TKgc0NpCq4t1rqYSPljeB9IEG+DdBLC61bRGjLEJSCope0a4ki5edCHzBGaRce3EMoZnzrKG+6az+zd3mz01RmzErTcbqpV7erKVSDEoY3RUlX9o1Kcun5jF3lCrH/LBGSGUmmICK4f0J9+palY8LrXQIAyulyunboQJo7KkRE4VSVy8t+v7A5UETKrAwvnQGEki2rKRXgV45H/CcrhLKir0d9HvD94jd3ZtHJo64QgG4Lj4dQk+LY33ZtWf1jYx8JJ08wrpZx8R00viRqN6H2hObpbjVCyJ3PrJMN1DeDZWCVUxWLxyiS/x427bjbyUlNZdz8i1k3fG4dNdzI5orziZ7dkkzWSh1aseTe12H2ilffeRmxGmgQ0uV8RWzC5F7wuO9beaEMuvnjol68Ch0Qj8FiGK1oNDYWFiUVj1+XP22kNzb10zIN0584yxYJg3SSXflvpJo8rDq+qqnwSfiXC9OzTxPjIApvQ7k54XxfG57nZE/uO1kkYPN1o4e/lakhcmSMkLr1zm7uYatjQlLIIxbrW6Td+z/Mth7eZmqjOEEYQB52l6naZOjEv5XRxQ9PIPRNUJS9U4VtrqTOkOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39830400003)(376002)(136003)(366004)(346002)(396003)(451199021)(83380400001)(2616005)(6486002)(54906003)(53546011)(478600001)(316002)(186003)(2906002)(6666004)(6512007)(6506007)(5660300002)(8936002)(7416002)(6916009)(38100700002)(44832011)(36756003)(66476007)(66556008)(8676002)(31696002)(4326008)(86362001)(66946007)(41300700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEJWdVJOWVdROUE0eFdaNVFpUDRXT3N5QkVtSlRZcnZGb0hEeURWeHNiRjJk?=
 =?utf-8?B?TEZXcnJoMW9pWlJDNXJHTHZyN2RsTkd3S2hZbnZnOEl2V0VqeVhlRlJmM2Nu?=
 =?utf-8?B?QTgvZ1lFMEs3M2RHTk1JUmhBRklCL2RzYytyVkg2NHlIeGpGNjFEc3NKOFdC?=
 =?utf-8?B?NFgxTWw5ZW5pdExnazBOUW0vdi9UYjBJeU42RkRZR29RUHVDbUUxOElMcHhU?=
 =?utf-8?B?dTRlYytYamZ0TUNxVHJUWit4TnlNTy9OS1QvWUlYNGxYVUtocThMY3VSTEJT?=
 =?utf-8?B?d2NNdGM2T1IrYXo3eHdtc2UwMXJHYWxZV3pIK3U5NVNkRkhvcWcxTU01aHYy?=
 =?utf-8?B?ZjRTMnNRUHNuRlNxL0thQTJLNnp6VTFXazVCRURjRnBBd1RrR0YyVUVyVmdO?=
 =?utf-8?B?ckhIbkw2K3VFeEhmaFpwbjYrb2MxeEpjWG1XMG53clhrQ01Dd00rVHNPVmRF?=
 =?utf-8?B?cmdsWnlIWTAzUitxUHM2cnNNNHpWcElRNWFTOUVHUDBVZUxSUU1ka0xKTHpw?=
 =?utf-8?B?Y2NJcHQwdXlhdjIzZ2MzWVE2WVMrSnBQdE5QMld0azA5STRkcmJWU045UHR6?=
 =?utf-8?B?Qk1oWHh4SkY0ejBnaHREcnpnOTRuOVc4SnJoSk9Ca0w0SDVMQWMzaTRhc1BL?=
 =?utf-8?B?VGxWVFB3cjNKQndKOVBTSFh3WStUem9mdTdNT0VDQllKUFRGWUpodFVmOW1q?=
 =?utf-8?B?L3dPUmdKTVZpSGI3bCthemY3eHNJRitEOWtkTXpsNTdLckk2Y2p4b2JoSzZP?=
 =?utf-8?B?ZTdDci9iWjZVUmJxMzVoZzlhSXcxVkRXRytPNkJIbVYzSkVmVGVodDZYTHE5?=
 =?utf-8?B?QktMbVJrYlBrZDQ1eTBkRFppYWtJaU9XVEQvaWpqRnJBcnlQMU9iY2pmdnZW?=
 =?utf-8?B?TlJjSWFqOGowNG4reFJTWVNtY1VQRDgvRm1iYmlMeHpVbktYQzhVUEw3MHp4?=
 =?utf-8?B?N1RNU3QzeVFQZ2NGYzZZTnI4cW94WXJlT0hGS1Bubzhpb2pXVVRIVDFCQ3l6?=
 =?utf-8?B?eGNPM3h4RmdhbU5Iam1qSW9rNDRaT3NvUUNTeE8wQTNYSFVHK2ZiVXBsNTg2?=
 =?utf-8?B?ZUk0NVZVaDF0NVNTSWM0WncxMlMwWVdGTVpwaEV3Qks2TEFrRytqa05yc2pK?=
 =?utf-8?B?clZvVTRXN3d3OUlwKy9nKzRTZFZmM1d3eTMvRlBOSDZuN1JhVTJIR2JDc0Rh?=
 =?utf-8?B?c3JKeWwxTXFxdWRlSHRjbHVkamx0WjNvNEw3VnM0c1JaNWJkWXJpVTBYVVlw?=
 =?utf-8?B?RzhzL3hZVlJ2SWFNZkxMM1JRVHVPMTR5LzZMT0FGMGVHOHc1NmxmTjZWRGFX?=
 =?utf-8?B?K1B2UEovcThrbG84MU0zdlhCK0FseEhFelRtV0ZyNEVxd0NnZU1ZVzFxK2xK?=
 =?utf-8?B?Q2FTR2QxUDJMSDdnWVlFa1lIK2cyTkVjN3h4ZHR2TDRPL2dFcnhaVGZCYmFU?=
 =?utf-8?B?OXhpc1NQWVF0QzM2ZnpuV0lxR0wxK2Nsd2FUdnJNNG5BRDUydEZNakhYQmpO?=
 =?utf-8?B?TFdZc09McTBuNTVNa2pKVlVXVG9YV21kUGpxRGowcTFrbVFUaHJESGo0eWNk?=
 =?utf-8?B?WFE5SEdXMnBvWjlOQjIxYm5NaWVDZ3BhVnVRQzhmcUZoRjFmblFwT3ZiTHo0?=
 =?utf-8?B?T2NQdjJwdEpCd1JyWERuc1pMZTNCZEFGME5Tbkp6Nit3akpFY1hQd1pjQTc0?=
 =?utf-8?B?eDQ5Z1R0KzlwUVVQSU9vc0ZNR3VCUStrY1JyU0ZnVmgxdS82d25BQ3dvQ3I5?=
 =?utf-8?B?YlQwam1qT0x5NVB3QzVadnN1K1hOTk52bXJ2UWJMMWIzM3lQNHZoamZkdGgv?=
 =?utf-8?B?UXF5NTJYK1dqQ1VXbFNjUXR1TjRKMzJvLy9JYVpYK0NxT3IzTzVFQXFDWEFF?=
 =?utf-8?B?alFUTnZLVkVKazVPcnpEWVRkcmd4MDdCemJPeU5GNmtKN2JldHJDYlU3WEJM?=
 =?utf-8?B?K2YrRnFkRTJmNSs0NmZuajlLdE1OSDFzK2JkRFpCZ2ovTWVLKzU3anZlTlZC?=
 =?utf-8?B?OGxGbWFObWxUV0VnWERENjVGM24wNG9uc2dyNVRwQVBFZjJQRTZRZkMrYlNU?=
 =?utf-8?B?NlIwelJmaU1DZ0tDYXhoZXN2T3lHbmRVclorMEc5YWh6UzQ3UWpCaU05a1Zr?=
 =?utf-8?B?NmpsSnlrMjg1R3luaEtuaXJQbGxwYXRNYUtjdkxsaTg5R3Y5cjVkY1hpdlRD?=
 =?utf-8?B?cDZHdHEwWmo5anFmZGRCa2xxSlNteElsUnJGNWI1SW9aNGp5QXdhNGh4SFU0?=
 =?utf-8?B?K3BSOHh2bHlBQmk2amZXMC83NWxnPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7597ff-2c80-4b99-ac17-08db31e04783
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 12:05:54.6311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1RPhPz6wm1HyV5ZVmJrr9B3K31w5nFXk4SGtP9bUwkb0I+fY5ogpnQdxperfMj4stjWyC0FCZ6tR/YrA0y05MpwiwFlciC5xsVzADyke9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5669
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

Thanks for your work and for the beautiful timing :-)

On 3/18/23 00:23, Sebastian Reichel wrote:
> UNI-T UTi260b has a Inanbo T28CP45TN89 v17 panel. I could not find
> proper documentation for the panel apart from a technical drawing, but
> according to the vendor U-Boot it is based on a Sitronix st7789v chip.
> I generated the init sequence by modifying the default one until proper
> graphics output has been seen on the device.

I can spot only a few differences:

 - bits per pixel: 18 (RGB666) vs. 16 (RGB565)
 - invert mode
 - sync/clk signal polarity

The init sequences are largely the same, which leads to vast code
duplication. Instead, the st7789v_prepare could be adjusted to consider
the st7789v_panel_info and apply the required settings accordingly.

For example, the polarities could be embedded into the drm_display_mode
structure...

> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index a62a2f5737e4..90f70eb84f11 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -10,6 +10,7 @@
>  #include <linux/spi/spi.h>
>  
>  #include <video/mipi_display.h>
> +#include <linux/media-bus-format.h>
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_modes.h>
> @@ -113,6 +114,8 @@ struct st7789v;
>  struct st7789_panel_info {
>  	const struct drm_display_mode *mode;
>  	int (*init_sequence)(struct st7789v *ctx);
> +	unsigned int bpc;
> +	u32 bus_format;

... and here you introduce fields for the bits per pixel. Just a field
for the invert mode is missing.

BTW, I would introduce these fields in the previous patch. This patch
should be only about filling out the already existing fields for the new
panel.

>  };
>  
>  struct st7789v {
> @@ -174,6 +177,20 @@ static const struct drm_display_mode default_mode = {
>  	.height_mm = 103,
>  };
>  
> +static const struct drm_display_mode t28cp45tn89_mode = {
> +	.clock = 6008,
> +	.hdisplay = 240,
> +	.hsync_start = 240 + 38,
> +	.hsync_end = 240 + 38 + 10,
> +	.htotal = 240 + 38 + 10 + 10,
> +	.vdisplay = 320,
> +	.vsync_start = 320 + 8,
> +	.vsync_end = 320 + 8 + 4,
> +	.vtotal = 320 + 8 + 4 + 4,
> +	.width_mm = 43,
> +	.height_mm = 57,
> +};
> +
>  static int init_sequence_default(struct st7789v *ctx) {
>  	int ret;
>  
> @@ -283,11 +300,125 @@ static int init_sequence_default(struct st7789v *ctx) {
>  	return 0;
>  }
>  
> +static int init_sequence_t28cp45tn89(struct st7789v *ctx) {
> +	int ret;
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx,
> +						MIPI_DCS_SET_ADDRESS_MODE));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx,
> +						MIPI_DCS_SET_PIXEL_FORMAT));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx,
> +					     (MIPI_DCS_PIXEL_FMT_16BIT << 4) |
> +					     (MIPI_DCS_PIXEL_FMT_16BIT)));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PORCTRL_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xc));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xc));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PORCTRL_IDLE_BP(3) |
> +					     ST7789V_PORCTRL_IDLE_FP(3)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx,
> +					     ST7789V_PORCTRL_PARTIAL_BP(3) |
> +					     ST7789V_PORCTRL_PARTIAL_FP(3)));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_GCTRL_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_GCTRL_VGLS(5) |
> +					     ST7789V_GCTRL_VGHS(3)));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VCOMS_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0x2b));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_LCMCTRL_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_LCMCTRL_XMH |
> +					     ST7789V_LCMCTRL_XMX |
> +					     ST7789V_LCMCTRL_XBGR));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VDVVRHEN_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_VDVVRHEN_CMDEN));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VRHS_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xf));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_VDVS_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0x20));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_FRCTRL2_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, 0xf));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PWCTRL1_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PWCTRL1_MAGIC));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PWCTRL1_AVDD(2) |
> +					     ST7789V_PWCTRL1_AVCL(2) |
> +					     ST7789V_PWCTRL1_VDS(1)));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_PVGAMCTRL_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP63(0xd)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP1(0xca)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP2(0xe)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP4(8)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP6(9)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP13(7)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP20(0x2d)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP27(0xb) |
> +					     ST7789V_PVGAMCTRL_VP36(3)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP43(0x3d)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_JP1(3) |
> +					     ST7789V_PVGAMCTRL_VP50(4)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP57(0xa)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP59(0xa)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP61(0x1b)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_PVGAMCTRL_VP62(0x28)));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_NVGAMCTRL_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN63(0xd)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN1(0xca)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN2(0xf)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN4(8)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN6(8)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN13(7)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN20(0x2e)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN27(0xc) |
> +					     ST7789V_NVGAMCTRL_VN36(5)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN43(0x40)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_JN1(3) |
> +					     ST7789V_NVGAMCTRL_VN50(4)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN57(9)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN59(0xb)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN61(0x1b)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN62(0x28)));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_INVERT_MODE));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RAMCTRL_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_DM_RGB |
> +					     ST7789V_RAMCTRL_RM_RGB));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_EPF(3) |
> +					     ST7789V_RAMCTRL_MAGIC));
> +
> +	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RGBCTRL_CMD));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_WO |
> +					     ST7789V_RGBCTRL_RCM(2) |
> +					     ST7789V_RGBCTRL_VSYNC_HIGH));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
> +	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(20)));
> +
> +	return 0;
> +}
> +
>  struct st7789_panel_info default_panel = {
>  	.mode = &default_mode,
>  	.init_sequence = init_sequence_default,
>  };
>  
> +struct st7789_panel_info t28cp45tn89_panel = {
> +	.mode = &t28cp45tn89_mode,
> +	.init_sequence = init_sequence_t28cp45tn89,
> +	.bpc = 6,
> +	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
> +};
> +
>  static int st7789v_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> @@ -307,8 +438,12 @@ static int st7789v_get_modes(struct drm_panel *panel,
>  	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>  	drm_mode_probed_add(connector, mode);
>  
> +	connector->display_info.bpc = ctx->info->bpc;
>  	connector->display_info.width_mm = ctx->info->mode->width_mm;
>  	connector->display_info.height_mm = ctx->info->mode->height_mm;
> +	if (ctx->info->bus_format)
> +		drm_display_info_set_bus_formats(&connector->display_info,
> +						 &ctx->info->bus_format, 1);

This should also be in a previous patch.

Best regards,
Michael

>  
>  	return 1;
>  }
> @@ -417,12 +552,14 @@ static void st7789v_remove(struct spi_device *spi)
>  
>  static const struct spi_device_id st7789v_spi_id[] = {
>  	{ "st7789v", (unsigned long) &default_panel },
> +	{ "t28cp45tn89-v17", (unsigned long) &t28cp45tn89_panel },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
>  
>  static const struct of_device_id st7789v_of_match[] = {
>  	{ .compatible = "sitronix,st7789v", .data = &default_panel },
> +	{ .compatible = "inanbo,t28cp45tn89-v17", .data = &t28cp45tn89_panel },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, st7789v_of_match);
