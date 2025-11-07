Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563DC41984
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 21:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9723C10EB7D;
	Fri,  7 Nov 2025 20:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iqaBHRaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011013.outbound.protection.outlook.com
 [40.107.130.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663DC10EB7D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 20:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYQcDqOiIdcC/O9mBPYBOvvq1KwVJ/fFiIRnmWr7QzALGmnGSCmK1FNAKwrLSoju2tWy8xiPXtxcqr1QIQfC2nyZsP1hcdigvDMI8UN69i5ABBzweoV0gSn8ZaZHWztfzLN5k1Wulzcxd+Kj2X0DLdhfO5Y4XbDcVqbbgslA4Hg8ZhxslKyvV+X5ODd8FdH8NtksvMfbUHP/7dnKUfma0eJ0UTZISecZhlTtaK2UgLVsf/+A9Y0B3sOQswubrM21gdN7mN1/X42WQOEWv6qXBOS2he8oTEyutBt8Alb9xjbHbMO6Z9Gsb4w3Y/HxUOATRLjkXeqZzRpn4rtZXYTqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIphM1/EejMhhd0u8jqC4FpcTQk5/A6+RqIFn/jSAYc=;
 b=prGxVWZR+eU+0Mimb9RVBPrIX5Kf2ZjUF5T099lOw/+bZMR5c/cgjexL3LecDTL9886nbzoCELg25aTfRacL1UUI39TqUQb6VowLurtwWAfwudRrR4EGiAN8vkz4138dRTsnMcpOYvgYtqdkV4r7S5axwtw/dQC91+WGUOy+dIN8p6Recjw5VrQZV7Zgtw3a9S4xwBNMT3jPXwGW8llAEYGZJlEiqFkXhnwGAVx3yXMgndSibwmbaY0mu7mITjsjROytK+vyjRJWZIEYK0PR+DVAWtstcXuSFU7GgDBsDL1bIB1Ma7oHiwhyJokZ54TvdPB/pgh4O2n0BKa+Pz9WnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIphM1/EejMhhd0u8jqC4FpcTQk5/A6+RqIFn/jSAYc=;
 b=iqaBHRaZEikkq+9FaRFt9ll/oUEPID6UAAuOOg5wFNXxD+7xIL97yT/l7xTHR2jBGc8MVu41vA3L2u0D4xziBfOS1WwceH8KoqNnkwNG5mDSJUqiCGCmd+NvDleH9nc956H+LCW7YwJTfrMqTNFlAJIOyEL42LmjWFgozVEzRKikIzVo2qOeVHb0WBXFzmzN6yPULBimN/DDNXc5mRVnkOM1TGIOfNuQbBAUgE7VS24bwcpD0+SvyO0CSZtHz8uLqz1MPk0IDKE5GX7yjoIqRAdxmAILfRapapLW1Jao/E2VUO2CNzvpyxk3GtU8VJXy/iaPreTP0vAd5Ncho5vazA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB12021.eurprd04.prod.outlook.com (2603:10a6:150:301::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 20:42:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 20:42:37 +0000
Date: Fri, 7 Nov 2025 15:42:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Thompson <daniel@riscstar.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlighty
Message-ID: <aQ5Zs+3Z6Jq4EQ0C@lizhi-Precision-Tower-5810>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
 <aQ4cyVKzgBUfpsj9@aspen.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ4cyVKzgBUfpsj9@aspen.lan>
X-ClientProxiedBy: PH2PEPF0000384B.namprd17.prod.outlook.com
 (2603:10b6:518:1::68) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB12021:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6d77ce-3f99-498f-05c9-08de1e3e2f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ES/1o22aG2BZDmnI/4fwE5pcwuTO13Q+FSKsw5ynnicT+DHXIBK6U+QGrs8i?=
 =?us-ascii?Q?H+A4otSMsnecMj3KrUfX9TFGwKKFX4dCLCsWpwq9Yqn80G/U/2t9tAffq6XB?=
 =?us-ascii?Q?CZWSWdDzzxTpP9YN7qhhkj1MMPsAfJPlT/SAWuw/xOxjwJLcze5ryicv+w7Z?=
 =?us-ascii?Q?XO6iLu8EE10vSiwD6NHoJoAtHq7e54IFBtSm6uJNiHS3r4SG5gRcOcfoQq7Y?=
 =?us-ascii?Q?KklkMymLwJvUdGdaWXyus28J3Z0ErJ20Sd1E1EJNx4kcwnY+XzZeo+0ObvYq?=
 =?us-ascii?Q?drW25Y0IiGyZGn7GvpWG5S6SmQ5DPyoO6BjkUOI/DxaF78p7sAKlLP9oATvz?=
 =?us-ascii?Q?Z2I+Vnk9H2os5kHkK0fk9Gj6J1p9xhTrxPtA9Pa7oHwp4CtRd7wI4ohSA6rU?=
 =?us-ascii?Q?ZN/OH0e8CABAinI6OJ5a3PVpImQ0VGtyFbaCpdV794jf78rPdReVfHV8IHRw?=
 =?us-ascii?Q?4YkE+KVXE5MUIFXK32uaw3YHFogvV72cXnBsC9O4BEaVza/rBREiGBQDw6Fb?=
 =?us-ascii?Q?VhSpxQbTnOO1CsC0e755wEfoxED4/BkhTHJ6J+4rK2H3uHz1I53cehyFZs4W?=
 =?us-ascii?Q?e+WeYftO5YMJF/uzcPrGkuZrEErwqW49PK2asInb1c4h13gysA9isbrAGhvm?=
 =?us-ascii?Q?iRfz4+KITClxLq6NwHbXiWaAORthL8ob+JBJHEMu0cGfMh3Dz0ckcbBR5EdB?=
 =?us-ascii?Q?Yvb1aOekLsxdFISDK8VC1Qjm55BBTNcbqpAyim29X2PkVk9fkpuHXBBNB8Tr?=
 =?us-ascii?Q?siSHhJmJLrzye9xUFc6yUQQ6o3B+SJmnCFb7AQv/B9r7ONT0rEB3bhXZ6ITf?=
 =?us-ascii?Q?Uo4+kr8EU0YvulR4Oqi7MddylFS+dNHOAUek6x2MFINaB08K1mYHfzo3wvhK?=
 =?us-ascii?Q?QyDT8eipeWfjQALOVFC1dqBndqzngZYpWRsMlExm8ctFR2JtqC09XLyF+OeM?=
 =?us-ascii?Q?nrKpuKhNfUtdmGG9943iLOl0s8jYGwZrHj3N/XQ2tZmgDylazBoUgjz385fQ?=
 =?us-ascii?Q?7L6HINhMDRSb0ycu0zC3RtNFsuc/5wXI2IUp0Ps6NM5XUiW+125Ydmgdd7RR?=
 =?us-ascii?Q?ED7id06cQd0VX53/p7Ge7k1c339AOlsfqjsRBO241/OFW677+Q7cqzXQIn2L?=
 =?us-ascii?Q?S3/A9Knn2tm+fT1mXJ9Xi002LKUHATDKdgFyCtyeeBLjW3PfL5qL83FA1OGn?=
 =?us-ascii?Q?8LK/GxpqqblI54Cs6r7K4J18JzHZ2NM/E2R5/eFW8G82u2wdCnN/eD7bL5+4?=
 =?us-ascii?Q?kZxTYAEbZ4+bcgvL9U4n8pWlXQwwhOxv1//+KDSoOOOsgwovuvCSD41ol0P2?=
 =?us-ascii?Q?HZ27mmlyfP/z3BRHIFoIuCYaZ1y1y6xbnDe3KVlOmTfIodAN32eYbM6YIe1l?=
 =?us-ascii?Q?Y70ndYSFItEPG8vvt3c6ehFicqpuZzcsFdR9vWo5BueftquH+QgN7+Mzt+fp?=
 =?us-ascii?Q?hqWIjBccSJytg1YFpxvUap3Pdp5+7R2lUwIPBOoYpmQS0ioMx9ovipTdYeNB?=
 =?us-ascii?Q?5brYVyFqA9QUJy5yISVjhuCjlyMtEs/sj4CV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HiPeCl7iic0dFYAJTIobX5Os862P/FyFpd2a/DDKdKhndG60VfyHRmNSWqiN?=
 =?us-ascii?Q?yH+7BuAVkkb123UJv/53yZMgnnlljat5Vlwldh+/cUbMVIqBP8333udWdosq?=
 =?us-ascii?Q?bRxXbIhhlIh7VFYFHYEDqQoxwxbvKAr5o3SYke49dH/G0m4Dd1EpkBUDCgwN?=
 =?us-ascii?Q?VTIcVXM68+Mlgwu7mxSh8PLJtJ/gAp+PWHPsgYIHGSVbUMj98rpDcaxrsosI?=
 =?us-ascii?Q?rcipB9SVAgYNDH2zgBFXC4zT9YeMwZFatXtvyIBbj7b+lAyLkIBLxG7wpIcy?=
 =?us-ascii?Q?k/w+H3URrgBRseMgI6FPsgVfVS9VDzmUV62d/9ENxCocOhbxeHuR0LfUk4xP?=
 =?us-ascii?Q?kwLhU2/N9/54W/xCzerBAWkR6n5FDjtFtCXoG9FZ5flLsaxTOr8zNVGUJrGj?=
 =?us-ascii?Q?RC9KZ/ORLpPbJPtCnvElPFScM95EmEwmj6oOYYvPBfVRkcsFwgjzJ5qCp6PP?=
 =?us-ascii?Q?hpsxup4sHGM34gUhFpGSP98SFr7vER733EqlFP6WbEaOSoRnai2AZVMNqIJl?=
 =?us-ascii?Q?kg0K7KfA4AoiUr9Xspf7iF9aLzSO9h+vbrnJxSIzKQ3xk7iV4LulKQSoUURq?=
 =?us-ascii?Q?tiUGDxdaSnKJIMFwYxr6YndKweMcBLKQ582gB7zJxDXVT2wAr9WNWcVkGpft?=
 =?us-ascii?Q?cXBl5StiCACrS5qUmuLexQ2ON+vwdN2FygSqAmjRHE9ajzGmpTZy0SguzMWr?=
 =?us-ascii?Q?77Hb9fqqRK4WrdLapXcGJiYOxX1ZuVh7X+dJTOnIdVZAfxpj6SW+TooMKl/R?=
 =?us-ascii?Q?Q/krianBNTY6BT2mtsR/mhnT5OVjql3aKdZBq+gmJewue9kMmsjW+ExNNnI4?=
 =?us-ascii?Q?wPbEujzzXdeN03kjOgx6HkR2e/BvFNpCtj4M8nVt4EwP3xGzWmPG+YHTX48s?=
 =?us-ascii?Q?Wshm6CG9hmX8MYwO65prZzk9AVQXNo73TzVOOmUX2LwnUlfP/DLfIsC6f+iT?=
 =?us-ascii?Q?giBspcIIEOgr1eIGmQTnGlpol5MKB2WwGGURHSRuXgK2rJS+86k4g24yQju5?=
 =?us-ascii?Q?LhcK/QZzwZ4McIGBWSwzXB28+i9UUF69DI021zDMthU9n3Agph4369Js91QQ?=
 =?us-ascii?Q?S91Mo9+qHImuD/04bQRQFwRuLcQz7ii+faJ2BupKhDBIhcabTxTilK0mC3QU?=
 =?us-ascii?Q?57FYjCyEdD2YvoUx1K1GINlBDmonbVWYY4FvI2klThqtGKZlq4MY7q918yDA?=
 =?us-ascii?Q?jNH86xTgFd96Y69RMtFMkYEGHkdGs+FfanQKPoPSc4Vq4X8Ft8Xgw5jteTQL?=
 =?us-ascii?Q?Cc/CAJU+vDPxotW1FUn8/l0qCjmtAnKZsYYEsmgdJgn1yCfYVZ/RGDWY1l0U?=
 =?us-ascii?Q?APpi/PfUUQflaNXI4w/A0W1YPSW0nWNXjXYYEDCbTZNC/RAkoyCa+CjdwZqF?=
 =?us-ascii?Q?S7FmiUBNQAFWVEQDLoWOCNQweRr2f9BiYpTAa0GwiiZaq/Uv54Yym3JE9hs1?=
 =?us-ascii?Q?XVqGHAWPOSFFElzq5a7w8/sEyYDSsa0nmoi37w1aa/qRG5iedmcXSQhDoM91?=
 =?us-ascii?Q?SqIWjob2Yp6fvKjb4Jk9WsVgF6K+wC7mvNYhG/Qs0JF9ubbskYxYat1ENuVG?=
 =?us-ascii?Q?6HlEbxf/YaET9o0FHwg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6d77ce-3f99-498f-05c9-08de1e3e2f50
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 20:42:36.9219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZLr5ea8BAVOni1jRSXCz1wzGratzeQ9YK3h0VlMMfFlyQ428iWwWdwFjcd/zLZkuJuhnjiN+VLpnLB5prZ3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12021
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

On Fri, Nov 07, 2025 at 04:22:33PM +0000, Daniel Thompson wrote:
> On Fri, Nov 07, 2025 at 10:51:11AM -0500, Frank Li wrote:
> > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > From: Maud Spierings <maudspierings@gocontroll.com>
> > >
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> > >
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> <snip>
>
> > > +static int max25014_probe(struct i2c_client *cl)
> > > +{
> > > +	struct backlight_device *bl;
> > > +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> > > +	struct max25014 *maxim;
> > > +	struct backlight_properties props;
> > > +	int ret;
> > > +	uint32_t initial_brightness = 50;
> >
> > try keep reverise christmas order
>
> I thought reverse christmas tree order only applied to code where the
> maintainers called it out in Development/process (e.g. netdev and tip).

But, but it is small change when you update next version.

Frank
>
>
> Daniel.
