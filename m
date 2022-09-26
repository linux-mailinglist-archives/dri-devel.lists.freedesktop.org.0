Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BF5EA6AF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 14:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BC910E69F;
	Mon, 26 Sep 2022 12:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2029.outbound.protection.outlook.com [40.92.22.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A5210E6AB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsXUiX8LymUc5fQn5toeDIG+rARHXr2DMtbDfti8HrD+NwY2asYbj5zM9YOdi8bdcgK2iiOwhjOYYwmaCnSRhAB1KIKmdu9buwBt64VW/bbZ6Bb3NSRMm5j6dOSAjU9YBUGpQrxqO0sqTCeLiw976ytmGeiOlig/sxltzwbaotjV9Oic0Jx3vT4EaO9NA48PEzVTF2MR+hiL51poQu2ieoOMvHmS0Nny2G8gOJ9oIEkvm8QQoCfI64tVA3XyHn0kWBgLgSCccMISeehh8sshdg2Zk9GRGSrWi0CpQU2nR9wmm87lPR8AbTxQmNP2hTbDB6SA3fQpTcftGZlhKYLMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXk7d7XzGxByzggUDXJa+WykKiqWva2vXEoZ6Ryta6I=;
 b=Tjb3upFfMr3hE9ZkvbEJC+YBLlrIakA6SjVRSuvR4kNK1QuuTxABg5gdfzhb0NKMe/ZvXXtxyfdPiOtps/tRjpsSc3Qj1kOWboU5jTuRjhyf2XY34VDRjwfQU9WCxMsoZKBOXn0r2U+k+N5MGzrg8xFPTMUL0+MHhxieCv2TfvwbsgUIAvTvqQqygxmk0Rb7DY++n1NMv7Zw+K8gDwgihbI/Yvmz0pRVGGOuIptMcnSXS2nXMJfcBXw+NJj3NHx9259WJnodBZfGxX8n+dN3PLKkcjfAZRVAfZBhKwyU92mzo69rXH+q6nZfPx4y14ebWntqZ0a0bDwq2evJ3mRrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXk7d7XzGxByzggUDXJa+WykKiqWva2vXEoZ6Ryta6I=;
 b=hmc3QBDPDXx2ho6e/SOwaYBgEV1uVB4Jflm/5QiQwguGyYqNMm3tvcTAYcE/xzDDn3cDsuTz1+wTiRVg2PiHAnDkIydAkr8irgJWKOfjO7wjtmoWNrffKcXDDhcJA9bxg/uUCcVgs5n4AOeAmEGWQ6IkkmdVJGd+lGIE/8l5RAFrqqAjcTr+hi9CtIJOEPdKg973wopuD7C0FUEyWt/tnRm3YTc96ouJm7I546SE5qEeYOOmeWaegvaf/PrKxXr7cCn4yyFAPTy0vfHztmQQ+1/SE0exk2XVl2ipG8pFHrgsKEOEMlMKtKNCkHcSFx76jnHjybUX4IznBdesThviyg==
Received: from DM6PR06MB5337.namprd06.prod.outlook.com (2603:10b6:5:102::19)
 by SN6PR06MB4384.namprd06.prod.outlook.com (2603:10b6:805:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:58:28 +0000
Received: from DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::34f3:b22d:b19e:17c3]) by DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::34f3:b22d:b19e:17c3%4]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:58:27 +0000
Date: Mon, 26 Sep 2022 07:58:22 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: Register Esmart0-win0 as primary plane
Message-ID: <DM6PR06MB53374DB0DD35094BD46858BAA5529@DM6PR06MB5337.namprd06.prod.outlook.com>
References: <20220926081643.304759-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926081643.304759-1-s.hauer@pengutronix.de>
X-TMN: [lcbL7M9XDvqU2h/yohNMh6UrHYHMsfhl]
X-ClientProxiedBy: DM6PR14CA0053.namprd14.prod.outlook.com
 (2603:10b6:5:18f::30) To DM6PR06MB5337.namprd06.prod.outlook.com
 (2603:10b6:5:102::19)
X-Microsoft-Original-Message-ID: <20220926125822.GA17697@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR06MB5337:EE_|SN6PR06MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f7b7c9-2ee4-4d2d-b007-08da9fbecc2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s7yJERJUhRbeNJOXZEY4d5dIHI/TbEIjf4MaIiUfD2pNrfGLOWYuWoypwtPwMC1ZatFs1ZFmmjxItk4aha8t/MuKp8u8UJ6lMnvQm0EL6/tB7IiEu9XC/tFqWCRF3034QC/EWNobpLYB/W9ytt8wroTaaDt2+RXOweGwHxn1xyuOxUfx49MPy/DfOXP4sMUh0wLxCI0HuytpyVj9gmeNviOoyQVA48Y/Sf9YCtcKObHcjuRp7BdsZ0yT26kJAqAcOmCo5wGbnE5H9VWZZxLmP8BedF12euAxBw+WHv4lenLco81UxXWQ0PVD5JBJeDDC7g+5qJLVQEi34FI6+XkA42TISZtS02gw0JhiG0J011NIchF0yIZ7OS/t7U+wWkz68U8x8Cpm4+o8ave0huG+IxAZGXtJ7miRTq9jFQ8vRWDnPAtQSl3yY+8tV8DxMYGHKPn4sXRj5G7c02not027ZyeOR99oZfE9kNgoA1URIMVqGCiMLBxK0nXy7ds4Qo0gNy24Dea80OifHeYpAb4WQN2LATlUtAHk+fJdKEYM+IOgMm9edkpYxxdiyAsjbYttYOkl1PE3zYaRE5YFQPCLpmvokz6e+SeqWsThtWdF2+XTxlj7c8W7Ojr7geL3R5i9GljZD/X0Qiy8yKiEDfC6PkzuKAIWz3lnnUiluUuYWh1A+u7qExxF0EhSIsjG4ap6
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ie2QHSSObWXHGQWoYn0f/GP4SDz1vKQRt99aP7HhjRbq3+y5rzxitnodA5M3?=
 =?us-ascii?Q?zCWD6QLhGx16uuACKKBfb6jr6UBz4ROSbQTGnPMZDCTLMlbIagvsbhs8iILn?=
 =?us-ascii?Q?mdtzZS+d4HNxU9hpE32X8ZhcZoHpDbj1t2hUR31QBS1WxAsI5ErpB5yKx94x?=
 =?us-ascii?Q?f8UIUXDxBGr5Bi2nSd0xF5pI/U99rVjXtb+yS+mGYY7U06rhCoukOZj1psIr?=
 =?us-ascii?Q?l0yVrQB2I0LvguWBj6bltAhQsCpMLmWl1eXs05jU4mG7ktyPW2Kq22PJ+Abj?=
 =?us-ascii?Q?yJ2VqP+fPUF7PMiOR6xFTUN/pIi3UUBSpfVDhvZF3azZlTinliaDiMqM+/zu?=
 =?us-ascii?Q?hUZ5ri7Ay6UDGPkjqtNq0HL8Ob9ZLhpHU+yU4IXtJmFN1ZcdOO5SunvUP0o5?=
 =?us-ascii?Q?E/7VEGc1Cv5ubulP4PgbAXV2BAwDUAWe+ErDJxXmPujZZbj7tf2t5r9eszKg?=
 =?us-ascii?Q?Ea2K7wFkY5oSM8jP/Y0mJaOGUIvG5+6NTN2gjRA7q7urcgPqZYfpKlDFkTbY?=
 =?us-ascii?Q?8oQvESsF1LI6xRM830ZCPjbBBpQ367fCq8/fFCq2lgG6eO9x/TPtgJ3xU+gO?=
 =?us-ascii?Q?hm+tIPwqu20uasX2BXsNkLlru8xbM+CshIGoXRIZvshv4Cbzuj4rbUi7Qv2i?=
 =?us-ascii?Q?LGNELW6uzV5dtWD+bPbleTQ6q3kYrOTdtRMUC+g57dNgVx2LBQYEuVHw740d?=
 =?us-ascii?Q?m18AD4MqpUuGLLOnnL1y/L0F+jigy4CWowfRjTMdCPYZPa6QKjd+9zrdIqti?=
 =?us-ascii?Q?n/VUpGdPyaP8oYTeuIWE5dFZvBfVo3sERL+O8QnC0jYvZO8JxN51TM9O7LlF?=
 =?us-ascii?Q?n8r1zScY5BJaDS1GTu6ZbytDTi01hR39v/7/EqH1UWz6UVi3hVrqQhp2cbwR?=
 =?us-ascii?Q?rJbPO3vlkeJGfK7w4SJ4bCL+ha5OOUNo99s/yjSkCFeOLhhzUK0fUHtmJrVw?=
 =?us-ascii?Q?vYUCP5bqMv9YqF+RDMPjDssQ9DdXNFdp5sB+JhBftaM+y071pjpiyxb3ZQ2M?=
 =?us-ascii?Q?aBRxYXf6UxMPNL6ZRUDnPKxcqHsAnTsHp1SN/u4s2r90xzwMpGUricl63+8X?=
 =?us-ascii?Q?HmRLZJv67DZPs17VONdb4mLJhizYs6AON5ghhCgScIiqST/W+z/wyqazqdAr?=
 =?us-ascii?Q?FDqM9MPaWAk75cdv5HYZv9omuBwVxmOBzfLnzjE4d8/QciW30fqjjsVEEOaR?=
 =?us-ascii?Q?TX7LSZjzTK5zqRPShLFR19/nOrTwsOB2G63eAaKZM+Uqq451iFX0fVIKyum4?=
 =?us-ascii?Q?xD7EpdoeuRa+ittGJ7k3dzwDFO1/D3Tpdfj/AyEjYA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f7b7c9-2ee4-4d2d-b007-08da9fbecc2e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5337.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:58:27.8308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR06MB4384
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 10:16:43AM +0200, Sascha Hauer wrote:
> Esmart0-win0 could serve as primary plane, so mark it as such. On
> RK3568 this window will never be used as primary plane, because the
> three windows at the beginning of the rk3568_vop_win_data[] array
> will be used. On RK3566 however, two of the windows at the beginning
> of the rk3568_vop_win_data[] array cannot not be used due to hardware
> limitations, so without this patch we end up with CRTCs without primary
> planes when multiple VPs are active.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

I have been testing this for a few days and it works well for me on 2
distinct rk3566 based devices (Anbernic RG353P and Anbernic RG503).

Tested-by: Chris Morgan <macromorgan@hotmail.com>

> ---
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 9bf0637bf8e26..9d30aa73b5422 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -188,7 +188,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
>  		.base = 0x1800,
>  		.layer_sel_id = 2,
>  		.supported_rotations = DRM_MODE_REFLECT_Y,
> -		.type = DRM_PLANE_TYPE_OVERLAY,
> +		.type = DRM_PLANE_TYPE_PRIMARY,
>  		.max_upscale_factor = 8,
>  		.max_downscale_factor = 8,
>  		.dly = { 20, 47, 41 },
> -- 
> 2.30.2
> 
