Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B7E75159F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 02:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C76910E601;
	Thu, 13 Jul 2023 00:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9514410E601;
 Thu, 13 Jul 2023 00:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqtETna/+IFIrIUgwdldC88DZEwgAWeW9MPz6uTzhRiae1dDBN4h8CGXEwPKg+kXLfK+UJJR3oy33phji9dHi1mwDefUec/i+7Vro3/HlM2JCYG4axVA+fVFeLiV6k/A59F7DDMT13JZ4UrAib1/u1rZJaSqsTGKGuAzaEpdo80C4iqQOZUYJxR2zxO2eh2NuFEdFtRGBdF03/TUyo0gVMeoF43qIfowPtMqlKiQBs4NHT/31SwA9utbVOrnZRc7euzqvHul/a5BX3n2SOWcn08+mPMApY+VS0M2mYVyyz68hs6Q1QwwgnEeB9Ox/P+vOTe9Aj9mAmE/q33rnTnpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8bd29uVKTwN/u8FfrrcOuqBy1Tz41MOtuQigoUDRsE=;
 b=iaYulx+SLdfmNxVkrzNS1QJY08ilgkBp6kvNwmuMcKJUK6sXjIMbMn+XW99A/00OIxKf8tCof3c6d+3Wladg+tZ4ap6ZFTAewQt940KFDw9Nw3Mg4c+lEsqgd9ZWDVn5io+pxamvVmrqGNKgCmpGXRvwrMdSp6SgpU9ckOcbkE45IgU2qvBvk/IYso5vrgJqmujco1d5pHzOsO4kY3VTdzfpybiiW06Ffeyat4e92+j7E5LpHp4jaL99KYhj9MjUELskQCxzRS/BH6Ag4EBBW+1j5hTT3jy0/D7jxfev3DIs0T6VoBl+zS+WoOOQq9Ji0kBADekR53j5XyW020nFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8bd29uVKTwN/u8FfrrcOuqBy1Tz41MOtuQigoUDRsE=;
 b=RmxcZeA5O34z24NxqqYj+I6MhiQT1z2sSMT3v1RvHpyvBDEU4CxsCo+l+zMuyYjHsg1W67TyUx4kGTgpdLX4pEy3U1G/LceKAyqEdJ5drtLuczLW1rxoAr5llX8MaAUAn+ll+GJN+ZqwkjknOuyorUqHSHYMtwKGXQzYoUeQn6E=
Received: from DM6PR12MB3531.namprd12.prod.outlook.com (2603:10b6:5:18b::10)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 00:56:25 +0000
Received: from DM6PR12MB3531.namprd12.prod.outlook.com
 ([fe80::97ab:19a0:d944:1f69]) by DM6PR12MB3531.namprd12.prod.outlook.com
 ([fe80::97ab:19a0:d944:1f69%4]) with mapi id 15.20.6588.017; Thu, 13 Jul 2023
 00:56:25 +0000
From: "Yang, WenYou" <WenYou.Yang@amd.com>
To: "Yang, WenYou" <WenYou.Yang@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Subject: RE: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
 acquire gpu_metrics
Thread-Topic: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
 acquire gpu_metrics
Thread-Index: AQHZpAoXpJ2Vax57H0G6BAbnDbibca+3AUHg
Date: Thu, 13 Jul 2023 00:56:24 +0000
Message-ID: <DM6PR12MB35319E01AE25E8388F3CFBFEFD37A@DM6PR12MB3531.namprd12.prod.outlook.com>
References: <20230621063139.583787-1-WenYou.Yang@amd.com>
In-Reply-To: <20230621063139.583787-1-WenYou.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=1f0e7ae4-e076-4b64-85da-ad97d543303e;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-13T00:55:07Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB3531:EE_|MN2PR12MB4439:EE_
x-ms-office365-filtering-correlation-id: 2b07b23d-90ec-4a9a-ff42-08db833bfb80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SX7mtaRv2LU6LY+KF8tB4SbadpV/1YkLGxfZau3arCYgnBJimNgn+IflBU/sGiktEG7MOvnaI5IeaOeJrcAyz2d9V3InP9jwwoz61OlfJiFiD77dh2MsIUZEdyPnr9RGgKCLWkw67mqQK9q0+Sg7NKy1mWapvDj9a9dXgxMHrBallEbjxTCeS9iyn/MLgZwZ/jf8z4AtmxnJq9myfBdo9D2PSqobSstEmrNgKyHBwaZcE6h0acwbdAk9UW5gOYKjoTyyAyQe6DlXsVWs0tBA4WCtf4v3emk2rM03OM51euC3i9v8E32u3EwEv55LqoPQPBcdqwRt/jbHIMMOCOU4AMwZNKtkSb6C1apzIQ+tu6t2FpTTwZLC46q3TEVmDDP+rVt4MR9bk9L/OgopQCrq1C0jRkYAqThpbIUTxFnfUC3haZ4t0c+1wschC/Wc4t1rvAEJs1Ly7udO3lTd7/RRMtXOEkSb4NJx6RJFdum3swYEQNvqryo9kmDC5crvtJrsQgHWegTF0Rwq1dwO98HvfpwVJtX+hWlv6+dHqhq1wVGbJ3VsMRNZhfoXrkWW0I7a/jAExZc/GUZx5LWN+KCeZWyYYCTceKB7UFqcnE3R6HHdGyRw1SoE2zMbWfx70X9Qso8GUIOJjKiMVphDfI20BQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3531.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(110136005)(316002)(71200400001)(66446008)(64756008)(66946007)(66556008)(76116006)(66476007)(186003)(41300700001)(54906003)(478600001)(6636002)(4326008)(7696005)(8936002)(8676002)(53546011)(55016003)(86362001)(9686003)(5660300002)(52536014)(6506007)(26005)(83380400001)(33656002)(122000001)(38070700005)(921005)(2906002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W6wBokjLQiYOODm2d0fj44Pbj83VRG9IzH/LmxKM0TA1CvooY3yvsL9057dJ?=
 =?us-ascii?Q?JXQW07RGNzuyrNDmB9DLzN6chqjudwhEXm6mdauOY6ny3vM6MPAgZj2E7tRQ?=
 =?us-ascii?Q?29qxwqIiZhWCfQuHYNHwI8Sq5DgkB6QePHC6CS7f3onIqIip/XrI81RQTz0O?=
 =?us-ascii?Q?V/onQF7qmnhMIf6oByRCGSkuw+5MdchV8F4qtKnMnzDHN5IDIUVhr4b8Euwy?=
 =?us-ascii?Q?5nP5nU2mfF/rdoQUbZ9czZYprS3sssWl5y7Wq5u6GF29GMOwUHNotk8eCtCQ?=
 =?us-ascii?Q?oDymoYp8Z5FfrgPqZlk0LYxJhIiv5XinQotTzrFu2QjEu7LC7xYp1iYXs+BE?=
 =?us-ascii?Q?NBUzUBvmg21jvEvCdLzxF2H29U0vQeTj1w84Tu5eyLlpMzQQ5ccro7DOQNEr?=
 =?us-ascii?Q?rvBFcDL9piqLmbFsg0Gb5Nd2arYOkUDVXuqHN+QS7GjKGzYVyCTl9J7eUVZI?=
 =?us-ascii?Q?1dA4VcFDMa9SAcLlIEY3os3x7DhdN3nXAMnFM/X2G8pZvGKiFkDq1sSQ4y2m?=
 =?us-ascii?Q?Opt4YxNNDv7pk/vKDOhVaCjYXXlGH+Ez4s1v8ZeXjB2QMiIsq3kWQRYIiMJc?=
 =?us-ascii?Q?C+SiFLz0niY7FttVWvdqz/SzB0Ap74wfqcqCsNAq2nWJl3eb4Cgz/BG9ctpN?=
 =?us-ascii?Q?eYWDumZSRu8VNOp5jvxoB3TBAfyMY+/0dlOSKuSi5RdMcxPFy8d55BUGlV1x?=
 =?us-ascii?Q?gDWYKjff7+elg2edXmnzaFVceOtjF696/mZPQs7uoD1+WtxVTKVsIq9eNXAH?=
 =?us-ascii?Q?HzLaU3izLcInZD5z/xY90bR0TT+Nz9YOBU1t5M/9CjPDIqSrIIL3c/i5gu8F?=
 =?us-ascii?Q?uhq9zKFA93oS8dmrBhuuAp2E40pCWa3g/1Sz+lHxlhgKwlJit3v1J4Z0eZOQ?=
 =?us-ascii?Q?uduPctK7rhzh3i1REVXg69E6e09cMj3+5V8qG0hZShv8l5ipwUF0DnzZf4jb?=
 =?us-ascii?Q?eEIayGtszGn6Y0K4aSMeJh/zmATjzsRk/LNpnyIMorNoZrdVRz8AFGSSYwRS?=
 =?us-ascii?Q?vu63qMjzuaZ/EKnJLVceYFCOPIRY45JEPpe4y8fDQo7hlUPTjL24qhbG8J6G?=
 =?us-ascii?Q?uur+2/z+DaQ708DkKCbt+pC7tvBHNfPwxXdruk/RtIQe1chBDNZ+ufYsm3cG?=
 =?us-ascii?Q?W4RD9PGygx+5cMM2wQABQe2I0Z4GJTxqmUpt/xk+cMfhk/Vtt1njtxRyoArG?=
 =?us-ascii?Q?XpvGSL/qJ7rma0mZLWmmP+gYI/SI0VjQBhHnJFxccimxuFiII1IQPOkGnOel?=
 =?us-ascii?Q?loNCysCr6tvGGOwbzJuXQG64o+Z7PAzp80la9C/CfxEu1WP5IB/+VmKk8B4A?=
 =?us-ascii?Q?mMrz3Ea9QHaZA7DFVyqDlWkNGlTTxczTQpGSZp8V9Fe5kJ5mFhswkF0WANHX?=
 =?us-ascii?Q?rUW6yPZ5FVS2w+al4pov9woCcNenfwcbhYb4c+woZOOsEPiUt2toIXY4r7Ct?=
 =?us-ascii?Q?wMZc0luUOEt+/1O2EtfoGUiZ1BnCc7izR2nOFZLFw7H6zJWc9P+2e+BPY5MT?=
 =?us-ascii?Q?4AcxtocAGCESGtw0Du7RKyrwRPkfYRlGx2QVZzf8HDWdYGI2K2Vw172MSyOZ?=
 =?us-ascii?Q?yHyE+wz5ZRAR391wY4o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3531.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b07b23d-90ec-4a9a-ff42-08db833bfb80
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 00:56:24.8643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8HpDBDg4crJqczTjHzR7c9vPdn6ufNjMZRNN1t2hYGboiK+ViHnry0hRZJgiwbwgmduxgUWpB2BGMR1L9LPKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Yuan,
 Perry" <Perry.Yuan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liang,
 Richard qi" <Richardqi.Liang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Any comments? Any advice?

Best Regards,
Wenyou

> -----Original Message-----
> From: Wenyou Yang <WenYou.Yang@amd.com>
> Sent: Wednesday, June 21, 2023 2:32 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>=
;
> Pan, Xinhui <Xinhui.Pan@amd.com>; Quan, Evan <Evan.Quan@amd.com>
> Cc: Yuan, Perry <Perry.Yuan@amd.com>; Liang, Richard qi
> <Richardqi.Liang@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Yang, WenYou
> <WenYou.Yang@amd.com>
> Subject: [PATCH v2] drm/amd/pm: Vangogh: Add new gpu_metrics_v2_4 to
> acquire gpu_metrics
>
> To acquire the voltage and current info from gpu_metrics interface, but
> gpu_metrics_v2_3 doesn't contain them, and to be backward compatible, add
> new gpu_metrics_v2_4 structure.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Wenyou Yang <WenYou.Yang@amd.com>
> ---
>  .../gpu/drm/amd/include/kgd_pp_interface.h    |  69 +++++++++++
>  .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  | 109 ++++++++++++++++-
> -
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   3 +
>  3 files changed, 172 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> index 9f542f6e19ed..90989405eddc 100644
> --- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> +++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> @@ -892,4 +892,73 @@ struct gpu_metrics_v2_3 {
>       uint16_t                        average_temperature_core[8]; //
> average CPU core temperature on APUs
>       uint16_t                        average_temperature_l3[2];
>  };
> +
> +struct gpu_metrics_v2_4 {
> +     struct metrics_table_header     common_header;
> +
> +     /* Temperature (unit: centi-Celsius) */
> +     uint16_t                        temperature_gfx;
> +     uint16_t                        temperature_soc;
> +     uint16_t                        temperature_core[8];
> +     uint16_t                        temperature_l3[2];
> +
> +     /* Utilization (unit: centi) */
> +     uint16_t                        average_gfx_activity;
> +     uint16_t                        average_mm_activity;
> +
> +     /* Driver attached timestamp (in ns) */
> +     uint64_t                        system_clock_counter;
> +
> +     /* Power/Energy (unit: mW) */
> +     uint16_t                        average_socket_power;
> +     uint16_t                        average_cpu_power;
> +     uint16_t                        average_soc_power;
> +     uint16_t                        average_gfx_power;
> +     uint16_t                        average_core_power[8];
> +
> +     /* Average clocks (unit: MHz) */
> +     uint16_t                        average_gfxclk_frequency;
> +     uint16_t                        average_socclk_frequency;
> +     uint16_t                        average_uclk_frequency;
> +     uint16_t                        average_fclk_frequency;
> +     uint16_t                        average_vclk_frequency;
> +     uint16_t                        average_dclk_frequency;
> +
> +     /* Current clocks (unit: MHz) */
> +     uint16_t                        current_gfxclk;
> +     uint16_t                        current_socclk;
> +     uint16_t                        current_uclk;
> +     uint16_t                        current_fclk;
> +     uint16_t                        current_vclk;
> +     uint16_t                        current_dclk;
> +     uint16_t                        current_coreclk[8];
> +     uint16_t                        current_l3clk[2];
> +
> +     /* Throttle status (ASIC dependent) */
> +     uint32_t                        throttle_status;
> +
> +     /* Fans */
> +     uint16_t                        fan_pwm;
> +
> +     uint16_t                        padding[3];
> +
> +     /* Throttle status (ASIC independent) */
> +     uint64_t                        indep_throttle_status;
> +
> +     /* Average Temperature (unit: centi-Celsius) */
> +     uint16_t                        average_temperature_gfx;
> +     uint16_t                        average_temperature_soc;
> +     uint16_t                        average_temperature_core[8];
> +     uint16_t                        average_temperature_l3[2];
> +
> +     /* Power/Voltage (unit: mV) */
> +     uint16_t                        average_cpu_voltage;
> +     uint16_t                        average_soc_voltage;
> +     uint16_t                        average_gfx_voltage;
> +
> +     /* Power/Current (unit: mA) */
> +     uint16_t                        average_cpu_current;
> +     uint16_t                        average_soc_current;
> +     uint16_t                        average_gfx_current;
> +};
>  #endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index 067b4e0b026c..185d0b50ee8e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -1854,6 +1854,86 @@ static ssize_t vangogh_get_gpu_metrics_v2_3(struct
> smu_context *smu,
>       return sizeof(struct gpu_metrics_v2_3);  }
>
> +static ssize_t vangogh_get_gpu_metrics_v2_4(struct smu_context *smu,
> +                                         void **table)
> +{
> +     SmuMetrics_t metrics;
> +     struct smu_table_context *smu_table =3D &smu->smu_table;
> +     struct gpu_metrics_v2_4 *gpu_metrics =3D
> +                             (struct gpu_metrics_v2_4 *)smu_table-
> >gpu_metrics_table;
> +     int ret =3D 0;
> +
> +     ret =3D smu_cmn_get_metrics_table(smu, &metrics, true);
> +     if (ret)
> +             return ret;
> +
> +     smu_cmn_init_soft_gpu_metrics(gpu_metrics, 2, 4);
> +
> +     gpu_metrics->temperature_gfx =3D metrics.Current.GfxTemperature;
> +     gpu_metrics->temperature_soc =3D metrics.Current.SocTemperature;
> +     memcpy(&gpu_metrics->temperature_core[0],
> +            &metrics.Current.CoreTemperature[0],
> +            sizeof(uint16_t) * 4);
> +     gpu_metrics->temperature_l3[0] =3D metrics.Current.L3Temperature[0]=
;
> +
> +     gpu_metrics->average_temperature_gfx =3D
> metrics.Average.GfxTemperature;
> +     gpu_metrics->average_temperature_soc =3D
> metrics.Average.SocTemperature;
> +     memcpy(&gpu_metrics->average_temperature_core[0],
> +            &metrics.Average.CoreTemperature[0],
> +            sizeof(uint16_t) * 4);
> +     gpu_metrics->average_temperature_l3[0] =3D
> +metrics.Average.L3Temperature[0];
> +
> +     gpu_metrics->average_gfx_activity =3D metrics.Current.GfxActivity;
> +     gpu_metrics->average_mm_activity =3D metrics.Current.UvdActivity;
> +
> +     gpu_metrics->average_socket_power =3D
> metrics.Current.CurrentSocketPower;
> +     gpu_metrics->average_cpu_power =3D metrics.Current.Power[0];
> +     gpu_metrics->average_soc_power =3D metrics.Current.Power[1];
> +     gpu_metrics->average_gfx_power =3D metrics.Current.Power[2];
> +
> +     gpu_metrics->average_cpu_voltage =3D metrics.Current.Voltage[0];
> +     gpu_metrics->average_soc_voltage =3D metrics.Current.Voltage[1];
> +     gpu_metrics->average_gfx_voltage =3D metrics.Current.Voltage[2];
> +
> +     gpu_metrics->average_cpu_current =3D metrics.Current.Current[0];
> +     gpu_metrics->average_soc_current =3D metrics.Current.Current[1];
> +     gpu_metrics->average_gfx_current =3D metrics.Current.Current[2];
> +
> +     memcpy(&gpu_metrics->average_core_power[0],
> +            &metrics.Average.CorePower[0],
> +            sizeof(uint16_t) * 4);
> +
> +     gpu_metrics->average_gfxclk_frequency =3D
> metrics.Average.GfxclkFrequency;
> +     gpu_metrics->average_socclk_frequency =3D
> metrics.Average.SocclkFrequency;
> +     gpu_metrics->average_uclk_frequency =3D
> metrics.Average.MemclkFrequency;
> +     gpu_metrics->average_fclk_frequency =3D
> metrics.Average.MemclkFrequency;
> +     gpu_metrics->average_vclk_frequency =3D metrics.Average.VclkFrequen=
cy;
> +     gpu_metrics->average_dclk_frequency =3D
> metrics.Average.DclkFrequency;
> +
> +     gpu_metrics->current_gfxclk =3D metrics.Current.GfxclkFrequency;
> +     gpu_metrics->current_socclk =3D metrics.Current.SocclkFrequency;
> +     gpu_metrics->current_uclk =3D metrics.Current.MemclkFrequency;
> +     gpu_metrics->current_fclk =3D metrics.Current.MemclkFrequency;
> +     gpu_metrics->current_vclk =3D metrics.Current.VclkFrequency;
> +     gpu_metrics->current_dclk =3D metrics.Current.DclkFrequency;
> +
> +     memcpy(&gpu_metrics->current_coreclk[0],
> +            &metrics.Current.CoreFrequency[0],
> +            sizeof(uint16_t) * 4);
> +     gpu_metrics->current_l3clk[0] =3D metrics.Current.L3Frequency[0];
> +
> +     gpu_metrics->throttle_status =3D metrics.Current.ThrottlerStatus;
> +     gpu_metrics->indep_throttle_status =3D
> +
>       smu_cmn_get_indep_throttler_status(metrics.Current.ThrottlerStatus,
> +
> vangogh_throttler_map);
> +
> +     gpu_metrics->system_clock_counter =3D ktime_get_boottime_ns();
> +
> +     *table =3D (void *)gpu_metrics;
> +
> +     return sizeof(struct gpu_metrics_v2_4); }
> +
>  static ssize_t vangogh_get_gpu_metrics(struct smu_context *smu,
>                                     void **table)
>  {
> @@ -1923,23 +2003,34 @@ static ssize_t
> vangogh_common_get_gpu_metrics(struct smu_context *smu,  {
>       uint32_t if_version;
>       uint32_t smu_version;
> +     uint32_t smu_program;
> +     uint32_t fw_version;
>       int ret =3D 0;
>
>       ret =3D smu_cmn_get_smc_version(smu, &if_version, &smu_version);
> -     if (ret) {
> +     if (ret)
>               return ret;
> -     }
>
> -     if (smu_version >=3D 0x043F3E00) {
> -             if (if_version < 0x3)
> -                     ret =3D vangogh_get_legacy_gpu_metrics_v2_3(smu,
> table);
> +     smu_program =3D (smu_version >> 24) & 0xff;
> +     fw_version =3D smu_version & 0xffffff;
> +     if (smu_program =3D=3D 6) {
> +             if (fw_version >=3D 0x3F0800)
> +                     ret =3D vangogh_get_gpu_metrics_v2_4(smu, table);
>               else
>                       ret =3D vangogh_get_gpu_metrics_v2_3(smu, table);
> +
>       } else {
> -             if (if_version < 0x3)
> -                     ret =3D vangogh_get_legacy_gpu_metrics(smu, table);
> -             else
> -                     ret =3D vangogh_get_gpu_metrics(smu, table);
> +             if (smu_version >=3D 0x043F3E00) {
> +                     if (if_version < 0x3)
> +                             ret =3D
> vangogh_get_legacy_gpu_metrics_v2_3(smu, table);
> +                     else
> +                             ret =3D vangogh_get_gpu_metrics_v2_3(smu,
> table);
> +             } else {
> +                     if (if_version < 0x3)
> +                             ret =3D vangogh_get_legacy_gpu_metrics(smu,
> table);
> +                     else
> +                             ret =3D vangogh_get_gpu_metrics(smu, table)=
;
> +             }
>       }
>
>       return ret;
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> index 3ecb900e6ecd..cee5e32b4ff9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -996,6 +996,9 @@ void smu_cmn_init_soft_gpu_metrics(void *table,
> uint8_t frev, uint8_t crev)
>       case METRICS_VERSION(2, 3):
>               structure_size =3D sizeof(struct gpu_metrics_v2_3);
>               break;
> +     case METRICS_VERSION(2, 4):
> +             structure_size =3D sizeof(struct gpu_metrics_v2_4);
> +             break;
>       default:
>               return;
>       }
> --
> 2.39.2

