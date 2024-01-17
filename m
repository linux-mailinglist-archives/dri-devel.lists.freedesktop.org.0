Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47764830510
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 13:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565FA10E692;
	Wed, 17 Jan 2024 12:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A236410E6D0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksAmiV0FZ5rT6LosUzlwLlzdcqcBEZevfm2RXFD0Gl3QWYwtEKJZM86h4b/wcZwyzVkS0nJh5oQMtL3v2ExyszCS9wl29KkiE6o+x6bMgYW+3QZApeuveCLvIFk5WlpaIORCyxH5oqkRD/fSd5a0duVw9+Io0f1JXP60wySU7nSJX//c2wXaGEPG9KDuq8Mxcg99L/c6OTgJTnY1PgptBsWlW3mIf00s2pkhVwGnqKIo1JBysmSwCkxWcVftD+2X+5wph6rB3V7ywi3f+ssil4gXarHO2swdhicTaSZWVdt9+4mk05xMazfYtmk9C8NFK6HlcXkJ4waM/yJXdHQzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et/MOVY2ukvhUg8UVg7ouX4HHaPHj05vBJqgu6kIb6s=;
 b=bkFWTYnT2it4fIG5RUm/+kwgwqh+sqvjfE3U+HmTnavQYmyCebOBksvk/8JtokI2c/qagPg1yZTRGomLK1e+XxOuCBgegcI0mLYm5sN5FL4g7jJOGEm/8vQJaRHcXC2cOGZvUozHWC6fJjygGMRxo8OaB4Wsw4SZ4dzrTNFOVTSecrgf9KaYNceWOWWjl8l5/oXsJv6eGE1ANdoGDAiUsdHUNTBg3Vk1kW9zz7G2DV0Xa+YosjBNGtxV2J53F+QpKh4nYwfkQ/Wsp5fCd5wToM9j7IKVmifwi5BadytzGomLEQP3y9xM6DfK7Lp/TsbfKeh21d2u6SlUdOLBUPxm1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et/MOVY2ukvhUg8UVg7ouX4HHaPHj05vBJqgu6kIb6s=;
 b=SH6Nqn/xYamJiHhab0ErhPcjp/CKh/keLC6RaoiAPKX1OUFHAmcEx4IuO/6LMGF2IEPI/bDC2jVDmXcMRiVh3KosnHh2lXZn3jIKyt6aJmPR6Dwox++dYSpdcN06DLYq4u6Ly604NVZxiGZiSv/Evyw+Akwe3OPDHkTRAjRBaTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com (2603:10a6:209:4a::22)
 by AM9PR04MB7699.eurprd04.prod.outlook.com (2603:10a6:20b:284::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Wed, 17 Jan
 2024 12:18:35 +0000
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::4758:835a:b14a:ce80]) by AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::4758:835a:b14a:ce80%5]) with mapi id 15.20.7181.022; Wed, 17 Jan 2024
 12:18:35 +0000
Date: Wed, 17 Jan 2024 14:18:31 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v3 1/2] drm/imx/dcss: request memory region
Message-ID: <20240117121831.4dvwmirt4yy4h75x@fsr-ub1664-121.ea.freescale.net>
References: <20240111101346.15193-2-pstanner@redhat.com>
 <20240111101346.15193-3-pstanner@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111101346.15193-3-pstanner@redhat.com>
X-ClientProxiedBy: AM0PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:208:55::27) To AM6PR04MB5333.eurprd04.prod.outlook.com
 (2603:10a6:209:4a::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5333:EE_|AM9PR04MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d1743a-688d-4719-58a3-08dc17566d06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7h7+h1JONiNkrfK9FfcvXglxNhlMI7tVviGfSvlQ8t+ItXaobBQGdDlC34yKuEmqTSLVXo0X4sTaEjvA3uum95+0W+yigLEZVEIZuYj8NX09R59QjsNLNpWItACgLfWJM5X0ylfe/pES3sBAfM5jDbIabhnMEU0tX5lYPVEkSxxPS+UtIvt2I7GsPlSPGpXVAm11adt7qhuYyf8JWG0DR4FDtgOL88qViT4I/XvdDU/qEG3vWqq1fdolMLT32GPbsAyDLsokYGXavAHJ8Y/6fC6gogTblXfNjEA+0nG6Dk1DbmBxxbBi4DhK9Qva/GNMYH3H6LuPFCRrRhzkjnJxkf2/AStdtUOlsnRQmiyU8VQqnfJp7eyYGw5n6qvPcc+v7EiFTlnPcYUD87jZrTuqk308U5RByMYozN67qEX1cdW22f7fZXI3RgvCNnjmdU1Xzqx/8h+ASx4SO8RJxchFymuE5y6sKEDTmD+NBUwBX5szHxrVfD7ybhaqUtn9OFVTYB64LkQHuiAkx1bEoENhWOqhLjvG948QDk9TzFGSGxMCrK78aLYf3Z0wGWbVADMI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5333.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6666004)(2906002)(41300700001)(86362001)(38100700002)(6506007)(6916009)(54906003)(9686003)(66946007)(316002)(6512007)(6486002)(26005)(66476007)(83380400001)(478600001)(7416002)(8676002)(5660300002)(4326008)(44832011)(1076003)(8936002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E8pUvjL45MMwzj0e9sx/MK1I/J2aXmJK9UrsKMYLbJx0BU1HuzveidGn6G0Z?=
 =?us-ascii?Q?cNtzsYAzxQQHGAP770ygJMu/95WlVKO9fQZU8mmje7GCoezs1ZtwnPyC6cNC?=
 =?us-ascii?Q?GQ/PooVKL51Wh6P4I9WfU/qvW12BvHtET9DBRKvnsYQnT+g0mgYssY1af4gm?=
 =?us-ascii?Q?TwOb5YtcYcokIchTA1Yej4WWq7Q+kjENa/RGupV2XUGunZg4kc+laWL8piYz?=
 =?us-ascii?Q?dgoPDszf63zyJWY5/VGh+Enn0VCU+7Rbg7WtAifSvfxndRapVsZPCHLEKDxN?=
 =?us-ascii?Q?7MiecK3duvT2ZN2NmcwV1s89nTXKC6xLbaaifGHqA+EMb0DRjyU7H3KFQn0V?=
 =?us-ascii?Q?bwSaczuXbP8OeZ4WEfMu7LlqufaP0tcJv5XpUDp5XiCq/zhOhza3fzlKcXOe?=
 =?us-ascii?Q?iVoPPM7qjsEdvt896K1+2/OQp6ak26Z/MQPcqVkNiLtPwyvDJWGE9YaDP1Bp?=
 =?us-ascii?Q?2BDyo+bnLG1BHLubJH7HLLgBS3yQDrjSp3mohVyR3mqAn16Su6D6HctVKiyg?=
 =?us-ascii?Q?fK30IEdKAt1DG0Dc4Up5wAsoIEkR7wS/q0Ddcrkza5obARvhxM8PpQ4/w7wk?=
 =?us-ascii?Q?ChS2qzQM/pu5rYrOGTktCDsXgG1XQpHNp3cNKWCzRGnke6iZ5488TFlPS2Az?=
 =?us-ascii?Q?SLJDjTmMOCMXcQww59OmTwe6o26k45XrhZg7Z/b+wca4Ofk8JVBjiwie5ULZ?=
 =?us-ascii?Q?DmHvcLpiPVuYU+6hzykvyQ4+Y2cHO5oUAH+MMhjh80XtLKXRhcSn2P0CgvbF?=
 =?us-ascii?Q?5y/NaFl1LLoqIi/piopNwyd2T5nfpHW/m63zFIEtPFATJaj/2HWvvyrPEcKw?=
 =?us-ascii?Q?QSgtgqJ0nTz6od1CUjBLrU3BzvGFN/DhZWkTy55yaKBc531Y6qFbksP5FH06?=
 =?us-ascii?Q?ygX+dkXKEP22pD2DGlAoxyCjofoLw+CY/3FbV+pAXiEa4gL+ccNFOkFVjAdz?=
 =?us-ascii?Q?f5pilrNeYi6vFkcKU/Sn9+9jiSckqOQG1fT3GCDzO4iwrv5cqE9may/Ks0er?=
 =?us-ascii?Q?jXr8USYchknD3qVBMTC5DOvDzqpYhVxmYVFBo719q3oy2M/KphVxBbUQBPel?=
 =?us-ascii?Q?30NiQIvkX8A2/lMmFjcnPliZFbJcKOOZ3UIZ9r0eWgMH8MsWUzWfAQqx7WR6?=
 =?us-ascii?Q?DE7YKYxUeWfN9kd4mfjReuAb7prnKOc+IxjuZChhnQZCWBhLqtCyJS2sx04/?=
 =?us-ascii?Q?SBVOPwcCQJsMRkJ5VCxaryPS89VIsrV0kuVLF5NPp/bWnVKo5/cY6lLuM6Xl?=
 =?us-ascii?Q?NLPkI2rGgrBr/wC9EG6eCyBDzXYvGJTjJqoI5fNDzjbNEsmhKkM/cp92ihrN?=
 =?us-ascii?Q?Ly2XSz+sL+EFTvbcewiV9YG5S9LvYZWjtrHZJIsdZqdcO38gjsPmfU8ePFGL?=
 =?us-ascii?Q?X2KvzqWo82YAz4ReYV9KvM2df/VThYdWEXsd5BAkIJyx2ZI5yK/bkZDugvwx?=
 =?us-ascii?Q?06a3d1VVTZpcrVJUmoKzpt2tbJzORs2yCsDz8t6qsd/Yhr3EZK8Qc9wm19f7?=
 =?us-ascii?Q?IVe7+TPzEWh9wVfLLNfts5cN2HKLywY7H+Sb11ZGdfPXjBDUCle/AQjNSlsp?=
 =?us-ascii?Q?hsHUWFB2U2spsedvURsToWfZa+uZ+xKffhuqYPsbvZwDzdkJ0JlCJ4+IKnDr?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d1743a-688d-4719-58a3-08dc17566d06
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 12:18:35.3814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/85p+QhM6kbR5pu6tQHAYUSjlFGTiSYnFcqbkseB+Zv+eIeIuNUI4RO1EQ2WCDgT5fU8WAtvCUk0IF4KoHgYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7699
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
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

On Thu, Jan 11, 2024 at 11:13:46AM +0100, Philipp Stanner wrote:
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
> 
> Implement the region-request through the corresponding managed
> devres-function.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
>  drivers/gpu/drm/imx/dcss/dcss-dev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index 4f3af0dfb344..d448bf1c205e 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -170,6 +170,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  	struct resource *res;
>  	struct dcss_dev *dcss;
>  	const struct dcss_type_data *devtype;
> +	resource_size_t res_len;
>  
>  	devtype = of_device_get_match_data(dev);
>  	if (!devtype) {
> @@ -183,6 +184,12 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	res_len = res->end - res->start;
> +	if (!devm_request_mem_region(dev, res->start, res_len, "dcss")) {
> +		dev_err(dev, "cannot request memory region\n");
> +		return ERR_PTR(-EBUSY);
> +	}
> +
>  	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
>  	if (!dcss)
>  		return ERR_PTR(-ENOMEM);
> -- 
> 2.43.0
> 
