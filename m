Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE46427F0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 12:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364E089D9A;
	Mon,  5 Dec 2022 11:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2114.outbound.protection.outlook.com [40.107.20.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AEC89D9A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 11:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGOuaQbd7sT/U8iY2srMPlcjzIfQYnt8R2rxPM2U9yR04pUBydipDRhvDXAa2M5Hz0pF7CM5oxHs82fJ8VNOMI+DWfB0eZ12jeuKFncLcDENVmqDNaYCeIGGN7SId8C8tzTOZhMyjbwzZBiupB3BUlcqg3mtmDqlx49wkzHInIAB2qyWTT6bM7e7rXusx2pFwg3Z7nGW96XX7WxrB+Hr8uoEQQZhPXxQ3n7BBcJ9CTXq9x9MupI6zvEwAxrmvYAhggrpqebQYSBW0A6q3GwAYZaNsH7yMT4EdwOTKAqxHPI/ByPQqrCWF9Z1Ti+oP3fZvGyzNQxhkHUVrKVls2ZNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvYoCCZFVRF4rKkWDdgg8XOah+8BOno9TflAvh2LvmA=;
 b=QXvaiE3WcF5m5zObX7ctAqR8aQ8D4UPnDOrc8GMSDcsEjMPzkf2GyQ6P/xUt3B8MJhxRlWcJXGfdjO+/BRfy1gAu53LfF0Fdma4XeWlZ+GtS9S8hX83zqOfhhmJZMfYqDAH7nID9bGqvnvhpn6aJk8mBXipvP+3iea8ibV6khAmlgY+4QQEwHXskcFs2sDAVCfWCFAUhTPomhBx6iCggBnC3Fr74hRlrVgvIUPrgE/RVhBQpklJcE9xwX4YAQfbDcQ95RarFm8p07utDhJjjZAN8MmgxNul/kMFp/Zqn+wea28JTh7wSlFwY2ZFJTXvmdTzX6gPr1SnQlEf+0sBc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvYoCCZFVRF4rKkWDdgg8XOah+8BOno9TflAvh2LvmA=;
 b=gtM8CB8nuWplRyDAXDkSmrmKx05bkuxGMmOWkIjlm/O5EPGvxCeb7XqLmHtgsrxoWms2vCcYjha5sjmB6/GzYNAzO19tz7tY4cKCe7xix34/PdUmLv8g1ArzfG6rcvj+rlCac/kf1Ra8/faqKbGFPq4sGDF6YSSGEze/BIGtmrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GVXPR10MB5984.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:16::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 11:59:37 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 11:59:37 +0000
Message-ID: <8dea3d9c-61b6-c576-ff97-89e4ad55a5d2@kontron.de>
Date: Mon, 5 Dec 2022 12:59:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE
 bits
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Fancy Fang <chen.fang@nxp.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-3-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221110183853.3678209-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::14) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GVXPR10MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d5d5c8-8fb9-4f8d-f5c1-08dad6b82e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lOzHMocSPJvtuiwTHkbpnStynCj8DyBQOuFGCVMRP1S5AmALFVuH2BmIcwjeO6LqIiaNlcdjfllo1GuAMh+OLPjdxtDVeLg4bKHhO0cTlZ5Z1aIyyzqJfR6hP/5Gl81H/V3vy4p2KpVBfB7F0on485L+35A4nJ09x4oXGgGr+GF5VCNW/IUzpE/9pIccrNmzT0y0rO1SHe7wQE9nJ3qJSkf5nmb0QHxEG/9VQk44Uezqt1XB/+C+r3HHBjiF3jJcpR33oG0s3bHs0qykD949Z9DUcg5PSGlEUfBuYhyu++Fdf5T8TMIrawL0vs1bMIA89vlnEHp2AK4mmK7igXX6ADnzsMX5Du4pspAM2LmHbQ786jFcvvQK5V9htkqEMsBX8VWPmM1ksm0DXrlKtQ1hE8Xj78nyxjY4mtoYqSYm/0tB+PzFWiNG/Qx3AuCq0LWVED/BOwDk85JxQcwpQ5Xazc++eg/4S6QPKWNxvt7x2MXAwDsbgCN+R5MafWQhy71GwgCenZ9BlywrsaaZUzr6OCtpEm/QmYWKdgNB/LObCIUukrzIchZpUtDfdfpdc4RgbsFQJkHEh03z7GFc9pNEhDPt/E+ijQL8WO7OtGzrj6lmOpd8xUHWtNfQheMfXsLdnIYT2LKOcL26jr8Xj5uAK0VeGbaUn/z/FWbHbiz9Kp2g0qjCz44IO9ndb6wegs8A/qNxbdzbjupJVlZqfq3O5LFCcGvhiKQdzPEGCWQt+9GzS/OsWTkxliT/GaH6VNxU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(36756003)(186003)(110136005)(316002)(83380400001)(6506007)(53546011)(6512007)(6666004)(6486002)(54906003)(2906002)(31696002)(86362001)(66556008)(66476007)(31686004)(38100700002)(4326008)(8676002)(66946007)(921005)(41300700001)(2616005)(478600001)(5660300002)(8936002)(44832011)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlRucHgxR3BWdm8vZDg1N2hGZGhINkxSanRNUmh0bnVvMG55WkQ4YUNVaGh4?=
 =?utf-8?B?eXNpaS92RzVsMVc3cjhnbVhobG44V1o4MWdlcStCSFhPR2xVMGdwakpYempV?=
 =?utf-8?B?c1I2TmlaeVYxR21NL1U2Z3hZK293M1RCNW84K0x4M0NEc2V2ZjhIcDBCU1BN?=
 =?utf-8?B?Sk9Pa2JUWlhFM0VlS3g2S2c3WHR0aXA3c3NmMEpNa1JZbkx3bmw2YXJlVG8x?=
 =?utf-8?B?ME44S2pQWDBFTFN4a0hnek5ZbDBONEhWZFJucU95WC9aQnd0cHhtTmNlV2Qv?=
 =?utf-8?B?enI4TEY1SldYandxYlY3N3FrYmVSZjdqV21WNTZYL0xNWWkwSFdSMW1YUnNE?=
 =?utf-8?B?MHFYZkw1U1k5U1JmLzFSN3J0YVlsR0RYYnpZazUxT0ZzdG9YVEgxQmV1VTNE?=
 =?utf-8?B?eGx1Y2VnRDBJWHoxZEkrLzdqbHlHMEJJTXZjekMweXpSTG8xam5mSFFkVXZ4?=
 =?utf-8?B?SDhTSGNKVXhSOHplTGM4OHR5NG5pakxRaFJnZWVCelczUzhka2Zvc1ZuKzFM?=
 =?utf-8?B?MkgwVmhidEZMSGxnRDZUMVo0Q1lJNjR1NEFuWE9nUE43bXFtWUovK2pJVEYz?=
 =?utf-8?B?U3lQdlRLQzJOM0thVjdPeENmekU0L0JtM0s4b2JNWXg4eFQ3Q2RjcElFNWlT?=
 =?utf-8?B?MDlkZ0N5U2d3RnMzOFFjb2liSFFjdnMzOURtNEtyN2hwdjFKU00wSW1ySytN?=
 =?utf-8?B?QUV6VCtOSDBnY0hCbC9aN0dxTmxoaVhCRTNGMVpMa05ob2xGWW1BcEVVbUEr?=
 =?utf-8?B?WW8yMlpRekJnUkNBZjV4a2RvRlRrYTR3L1pDcXdZRWpxdVFDTCt1ZkJSSGxL?=
 =?utf-8?B?SmdmSisxV0VkVHVuUkM1MnFGekh1andwNEZtNXpmMGJFUVBsQzYraWFtWXQw?=
 =?utf-8?B?eXRsWjRneU1IMHhTUEY5K0V2T2JZRW53UmpvVUNkNHBTdXBpY09ZNTlCbmVy?=
 =?utf-8?B?bnhpT0UySUszYWZjNFBPWjdNWmQ3aFMxVGdydGtmTWxad3A2Vml4SG9tVjA0?=
 =?utf-8?B?VU1ORlBFN0pIY202bUt0eEkvdVZscWNmTysveUFpM1R1bER1MGM1c3VUdXFv?=
 =?utf-8?B?Y0pMY3BtTjBaODl3cDRqY0FIMEFSQjlvdnlGRUxvdlRLdnNjWWhQcHkvU0hN?=
 =?utf-8?B?d0VCUE5WUlY3TENYNWVDOVBjY2xLQkc3SmY3b2Qwc2hKQ2ZGNlpPRHd5OU56?=
 =?utf-8?B?aDlWN1BMTDdQSTNtZjd3SzVxeHZLT3NXb09sVkZlUFRsanppQ3NtZ3EvZklD?=
 =?utf-8?B?QkZzNHZLdjFXU2RoS2pXOWZ1d0xON3lqNExzbXp0SEVDT0h1RS9Wd3VBVUw2?=
 =?utf-8?B?anpVaTV2Z1U5cHJFTWhYblREeEJLandMM0pDWWVHREhoa0licnJZVGlQYlNG?=
 =?utf-8?B?VE42OTQzM3VmRFJIOTgwMWhlS2lQQlpPNlVTOVZjRENXd0RzU3VnMjU2Vm4z?=
 =?utf-8?B?VEVoa1NINTQ5SWV1MjdBMWtxVDFiS2xtb2N5dlQzNTEwU1BucmdYZXJLS2VN?=
 =?utf-8?B?cEZZMWx5Q2tOcEMxemxvcnRwQ1lMTDFOSFlCLzhEY2hqVkRaVFFxT2FiMWZS?=
 =?utf-8?B?VU96eHZGbHJYQlhLSEJOY1pndWVZSDBHK2pKWkhQRFdQNWZQVFd3bjFTN2dS?=
 =?utf-8?B?NHM2RGpkZHV0cEFTNkVjUmE1NXRhcCs3MC9NckFTWHNNQWN6bzdZMUpVZzhT?=
 =?utf-8?B?ZFdDY0I0UU5DK2Q3V2xxaitidkhjUHdXbXZobHU4YVZZMDhkdzBJTmNDT0hV?=
 =?utf-8?B?WVA4MmluWk0zbG11bUQybGpYNUJ2MTlkd1lVQjl4MmpCSzVWTTNkVjhtVUNU?=
 =?utf-8?B?VWkzdmRxRlZlYituNmZrS2hUUVZzRHhQblVDWno3VHdLcUUrYzRTSTlPUkZO?=
 =?utf-8?B?MWU2d1oxN3NNdVBsY1E3M1ZjV0JVVmRZa05oYVBSTWdxWnY2cGFZVTJTcnNt?=
 =?utf-8?B?dndtK3FFY2l4THREYmxmaU5GaTJ3RVpXTDFCRFR4d2J1cU9VRkJ3ajFLMTA2?=
 =?utf-8?B?bTErOFhFNXAwVmRENlZ5c285MUliekZYeVBJN1ZUVVdXNEJoMWtvdEhwUWo5?=
 =?utf-8?B?L3pGYjBmZHhPbitNa1FJUmZIQklzTDA2YWpXekV4RFRQazRjMVB5c21oRzRC?=
 =?utf-8?B?Q2xDeVhYd3JRMXFPWExaWVRJbHBZWnlacmxDblRublV6U3J3UzFqTzUrODJM?=
 =?utf-8?Q?SWD9AC4lahPbxseyZnYwlw6HPjyWG9Llz8t77mDQj1vs?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d5d5c8-8fb9-4f8d-f5c1-08dad6b82e9b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 11:59:37.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCHDwC8swAZJtKTr40wSv6iARt1ZE6kHGklwDsYKddCqGANW1xaLvOUE00l1cSe0XXSzdQ03GkNwJ9jBYG5bx1Qo2q5c8Xl8TT+7HlMAg/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5984
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.11.22 19:38, Jagan Teki wrote:
> HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
> conversion as 'disable mode bit' due to its bit definition,
> 0 = Enable and 1 = Disable.
> 
> Fix the naming convention of the mode bits.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index b5305b145ddb..fce7f0a7e4ee 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -75,10 +75,10 @@
>  #define DSIM_MAIN_PIX_FORMAT_RGB565	(0x4 << 12)
>  #define DSIM_SUB_VC			(((x) & 0x3) << 16)
>  #define DSIM_MAIN_VC			(((x) & 0x3) << 18)
> -#define DSIM_HSA_MODE			(1 << 20)
> -#define DSIM_HBP_MODE			(1 << 21)
> -#define DSIM_HFP_MODE			(1 << 22)
> -#define DSIM_HSE_MODE			(1 << 23)
> +#define DSIM_HSA_DISABLE		(1 << 20)
> +#define DSIM_HBP_DISABLE		(1 << 21)
> +#define DSIM_HFP_DISABLE		(1 << 22)
> +#define DSIM_HSE_DISABLE		(1 << 23)
>  #define DSIM_AUTO_MODE			(1 << 24)
>  #define DSIM_VIDEO_MODE			(1 << 25)
>  #define DSIM_BURST_MODE			(1 << 26)
> @@ -804,13 +804,13 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
>  			reg |= DSIM_AUTO_MODE;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> -			reg |= DSIM_HSE_MODE;
> +			reg |= DSIM_HSE_DISABLE;

Please add a comment to explain that the DSIM_HSE_DISABLE bit as named
in the datasheet actually has inverted logic (set = HSE enabled).

>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
> -			reg |= DSIM_HFP_MODE;
> +			reg |= DSIM_HFP_DISABLE;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
> -			reg |= DSIM_HBP_MODE;
> +			reg |= DSIM_HBP_DISABLE;
>  		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
> -			reg |= DSIM_HSA_MODE;
> +			reg |= DSIM_HSA_DISABLE;
>  	}
>  
>  	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
