Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED160B973
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 22:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EEB10E7AB;
	Mon, 24 Oct 2022 20:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2013.outbound.protection.outlook.com [40.92.23.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE19F10E7AB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 20:12:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrZ9dgCX12mXB4FW2Vi+2t5Zhd/0eHnX8f2bXtZxNZ4jOxv/dPsIlV8fPBUzh61kpHa0bzAnzhKxpaOqD1CqJPKmJA8GqkHUuZ3Y11w0j9kOJU0uZWMcxgi1Bvrl30qokg5y0/Fb86neWdZJgEtfqAZLT5lZAdLuVOIIHHOey1aV3dH6JLhun9lBSJp2ODFyEVbviyBcYQXxlg/nID2t5F0cTQeWAqdBniyiKmUdObHlj8hgJ+Ps9vJIhsOREJyVVqqGWZDCkgvHYNBOEQkF2UG8sh9sku1t9qJ5Y8UWMxXgxYnkdE8M+I6Diyp+4b02g3Xw5oyJuuZ/bl614COfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/Q/u2ueRbuVJUiZW8WRz0eiK+HtuZtjXSuZP1v4agw=;
 b=gmrsmMeVSLfBfysf/JoqIVquauxg9yh9W9uxkGjBesNHJa7Jp1crStaZlevr7KVWCr1Zc+LNXGCVmILS5zbwv1dv1QIwZGWLV5xtjR+hoAx7zHJicPy2KFPRfKzFPv75CSJGnHKrkCyRy2J0D12Kn9F52X6ocE5U3S16VziaEQR9hifEUc3bK2taNiZuAnu38YR3fd2QGjpZxdVuWwKIMhn3rGG7TrLsfg0U+BUuZiVHlv9HgRWGfcNTWqSlanZ7LuMjO9j+UqmJHc38f+5dRl0Uhgf9iov3fpPk06lFR9zgzTHJfYT2FO8qYT+2pxXx6Z6NYjD02Efa7srFdX/1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/Q/u2ueRbuVJUiZW8WRz0eiK+HtuZtjXSuZP1v4agw=;
 b=mOshCZsxRUEI5DkeCv1Yx9eevrpmPbBs1eXU8wuKbV3lz+5UvLrkD5rYqYGlscQnTX4b+qka7FGikEAvWgW9wSyQu4Mf9rMjTPlnGr4j4OeVmTIxkVBb/AMLOx1dLKVzY0vNWrElbu2KolWvn3b8UFUMWyGlCDRd83Gd9hY1YvJZAXXo8AuFRGB8SfOHeio1ABPxwKKBdSJdnUlqHXpR46/su9Uxm65k4x7Ri4mSosjSp5MmNS7pZ54MIPQkQH1zY1POAY7z8zarCsKfvRq7shn37lTRMcDM2JXLLnYX+MKDlTwtatFs5E0EYWgV7OVT/yKpLZSAuLCOvlYbWDGTQQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM5PR06MB2699.namprd06.prod.outlook.com (2603:10b6:3:44::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 20:12:28 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d%5]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 20:12:27 +0000
Date: Mon, 24 Oct 2022 15:12:25 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH] drm/rockchip: dsi: Fix VOP selection on SoCs that
 support it
Message-ID: <SN6PR06MB5342581892D71CD7A936BB00A52E9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20221023160747.607943-1-megi@xff.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221023160747.607943-1-megi@xff.cz>
X-TMN: [hoMVg3LTj9KM8y+KpSY4tL7713mDs68W]
X-ClientProxiedBy: SN7PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:806:127::23) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20221024201225.GA19964@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|DM5PR06MB2699:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5bae5b-ee1c-4195-b63e-08dab5fc124f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Spj9zHghGqIavsauI5tSn2nmCEtSXCpPdjwyLnVZBc4SHx8NqV4seYJUs0t7UycXKd2iS3PQ6IFEzNPF6Iq0B4wW6keq+zo01NZNNEyePIydbU2w64rBtXTbRfPEcW+ueATHGZqr1lcbwMS4Jo/48njH4DUds62XF4BtAyruwBsanMFO+sXIyeM2GTT3B18Xn2nfM/CPlxyZK7rkG6RwukL0fjS+7EKYSdRdGjgPBzY9mYOIn6tTfFX23THeENeC/rRvgiCnWHLSSAIteXSHbwv/U0dyMwyL7J64sISVvQ5Z2uhYjpUeGm3kJzUOmZWgoa7c/5fpgMKovba0DGKvmOYxN8ZyAIIK0vWoDgg+QUkOSi8ZLbqI8Om1UJDLcdl/EdRDfF9Yp2Z84/HLOsM6Yu0KTJ9uIoNyytMUUjmrrCT7mZOxLEX9TxFwC1YnmoEfL3g8YNZA8mQ+emMbbeZL+hFkVFpbsdy9DCJpJn6m+XI3LWnX7NQkKZsLbtAMbFXBefapQQuEsMrVbzejo2d6BHnuFkdD5Of30GEvBfycnz/63/jsmB57UPH/I5xgAY9kkajDKVnjJSX/jmHq00/lVjDAtz/hCFVb0yEQr39QJAfu32dmCLvJ7l+9qzLXP7H7LNc/pvk3e0vIR7dzSgApup869QIznuapoQxx9s47X97swayk9DRvwuYJZn6ZK5N1
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jldflMDCUfs7HbdAnUHrY5bHrKteFeK3hIHFNodBo93CICFwZUBYVdps2D1o?=
 =?us-ascii?Q?EAkkw8wINqXbtmzJ3OAt33D69YFLfua5jrDn98rV+1r0kf/LuPlJMg0Rd3vW?=
 =?us-ascii?Q?oCRikR9lcd+m1OZ1S6fKDoCqOIve05dJ7180zRLfaxh9DUbcP1ut5+FDQ/VO?=
 =?us-ascii?Q?j+Upc9wzZoc55ybrZ8z7Tddd5H6pB58pIAe51LzK7X2WjT/hzjv6yMMQC3sD?=
 =?us-ascii?Q?4TIpNkz4OW+Fzporx0w03GhhiJgnaMM8+8km1oNXuoWMezSI24AII/aLIh4H?=
 =?us-ascii?Q?1VspiKSyOQ2wUdTV3jheyJCQwAXUQYPUJj49p2qXoLQYa51E5PcbcvtyvWMe?=
 =?us-ascii?Q?+Ll3uToxrPLo5qvAwEDiU0RqrHtcDZlE89SIKhejYsPMstrvNcI4CICYu3CO?=
 =?us-ascii?Q?73AFD3SZbmH3Ejgz8E9XEn7N7WAFVvv/Ip7dhsp5JHahojU5ZN9B0GiGGHX8?=
 =?us-ascii?Q?UvHcUjrYt7fy06tHqXnzXdHxHmeIpKEFsuo9RR/CAoBjqVzJ5nEEdRVq4nPJ?=
 =?us-ascii?Q?bVjwQoTbkUm8RtmBZ28+rRCl39+f6F6EZZUdWjBotHKSQorRgiW8ciKMxmmI?=
 =?us-ascii?Q?tANNQ4yYxeq9IsnaitCylITGVbieRGyA29SoC0mYNMq0nqp3mPXmPj7C2Sen?=
 =?us-ascii?Q?PT7EEGegpGqrpmFON6TbMJRQhxYFkgi22bdjQx5Va9EfgyMiT2oMCdGyrdzs?=
 =?us-ascii?Q?h1cwIrpIRPBHflOZFpcJyVrsVY7zKRpnbkVrtlg7/qWIlqw5X0lQGr7lV7Vc?=
 =?us-ascii?Q?oeSihuJjIuiiMibC1u/rWg9QqeETFsAgTiLmuVlywxn0FtnpKpVNxvuqAQ/v?=
 =?us-ascii?Q?WpYfpJh8P3DWP7JbXmeKWk1ns7NoXJHftKm9o5qCmjLJPRCACP0KL5W1D8M5?=
 =?us-ascii?Q?6+SAcOe5PRf4foVbR8qTGsHPVIUEjb8Sh+JFnCoLYavvfLQbfqNd+O7L4k7d?=
 =?us-ascii?Q?ZOSRU+C9hjnNym3D13q2PF+2ukVUxfgKTHcA2VRszdGM1h0idc/JhgCaHoOj?=
 =?us-ascii?Q?mzRQ5K5wU24Ozkf+b+SNnEfqXfVp9JgDzv4gS72G5NCJdLbewwRHJVvH7yeZ?=
 =?us-ascii?Q?Xz54nIo/rZlijWy1TmqIcrvOxuGAFDI6lnkyRFoCkQDoBibYQFjI5GHWoPOM?=
 =?us-ascii?Q?UUMROhlS4ibXzci05uqFLKvUQ6Or3lAzlaLX3UnOvrPoDje0S7n1PazAMJ7L?=
 =?us-ascii?Q?kIaM4mI3a0WS+8ZqQiF/kBIPjGK6Gb7wW7M/UcZS7+hz1ipd2OtkhUNSrIdv?=
 =?us-ascii?Q?yXWlgaN0+tlLjRkF2YYNWsCtPFjABKZUNJUkf+JXsA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5bae5b-ee1c-4195-b63e-08dab5fc124f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 20:12:27.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR06MB2699
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 23, 2022 at 06:07:47PM +0200, Ondrej Jirman wrote:
> lcdsel_grf_reg is defined as u32, so "< 0" comaprison is always false,
> which breaks VOP selection on eg. RK3399. Compare against 0.
> 

Sorry about that. I can confirm this works for me on the rk3566 (specifically
the Anbernic RG503).

Tested-by: Chris Morgan <macromorgan@hotmail.com>

> Fixes: f3aaa6125b6f ("drm/rockchip: dsi: add rk3568 support")
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 7d50a4f463d9..2982a4e9a6ed 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -760,7 +760,7 @@ static void dw_mipi_dsi_rockchip_config(struct dw_mipi_dsi_rockchip *dsi)
>  static void dw_mipi_dsi_rockchip_set_lcdsel(struct dw_mipi_dsi_rockchip *dsi,
>  					    int mux)
>  {
> -	if (dsi->cdata->lcdsel_grf_reg < 0)
> +	if (dsi->cdata->lcdsel_grf_reg)
>  		regmap_write(dsi->grf_regmap, dsi->cdata->lcdsel_grf_reg,
>  			mux ? dsi->cdata->lcdsel_lit : dsi->cdata->lcdsel_big);
>  }
> @@ -1643,7 +1643,6 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
>  static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
>  	{
>  		.reg = 0xfe060000,
> -		.lcdsel_grf_reg = -1,
>  		.lanecfg1_grf_reg = RK3568_GRF_VO_CON2,
>  		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI0_SKEWCALHS |
>  					  RK3568_DSI0_FORCETXSTOPMODE |
> @@ -1653,7 +1652,6 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
>  	},
>  	{
>  		.reg = 0xfe070000,
> -		.lcdsel_grf_reg = -1,
>  		.lanecfg1_grf_reg = RK3568_GRF_VO_CON3,
>  		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI1_SKEWCALHS |
>  					  RK3568_DSI1_FORCETXSTOPMODE |
> -- 
> 2.38.1
> 
