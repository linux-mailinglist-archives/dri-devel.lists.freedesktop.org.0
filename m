Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F82F462A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753536E107;
	Wed, 13 Jan 2021 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2104.outbound.protection.outlook.com [40.107.100.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233B36E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLtY/7WlNiRUia1p/nYPkD/CPLwBGFNJAEXMgHGstDWtAQucodBtu5kdxxpObYmELD8iUp9RMhk38Jlh/VHuL1QN/RdG5yzbjVDH5uRa+BIVEt+/8tcTcW6BmCxpK0NbF6EhXabfCmBsW7fLAm4yXzaDed59vuoCmxCPua41ryKVtRWT8fOOu0D/FQamE+Nd+X4KfJz+MIpCDJ6OfiegB6ZMhvxyjEhWHHK3Lz6zsin6qmwFWcmtAVuiIprtoGUd6V95/yPAO7ml9I55bcp5FX93dy82IHEM3aXGDJoqUnliZ5cIvQm5EC4//qwC+QXMvI05XVWunVN67XL3c+xx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kuhkbd0aCaNLRzq7RsWI3CBaLvcyN2qyvIlOj4N/gEA=;
 b=H2LafTrIKcNk0Eu8I3SD6ep+QVveQijZo3AibTvm9Qr+4lYZVePAKbCQJzsjs5zEfjhCihEymjlau8FDcaWor8ur7zhNvC/6DK4OT1Vw/JEezVlKlQDuflJsTeg3PBZsaavYUEddteD34Zo+T3/xhQ7wwSu55aabk2fwCYGneT4drOEaCqDLLoUye18C/zNW2+iXBNCgEvN8Sgu8sDCIwTOhcv9lZqOtshlJlHtm+ouYt9r39f7wdPtpafDQ8K/jk8d0Vm0OaSNcQAJEpWU6vPy8dukNtrrlziIHGIZb2XpaqL5xZJ4luBTh9I7VU+LNQiNR8Jgq3XeUkEzrYRkdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kuhkbd0aCaNLRzq7RsWI3CBaLvcyN2qyvIlOj4N/gEA=;
 b=NeSREUfozm/sSvhgE2t6+gAEU4Z/PZ0gzwJ8svyYO7lUr48ZVKxZ5/svf4I0DcTTisXbIq3Mz4daE6Edf2gym1d6s4hLnL+6pxPnQ3Nq8e21oROizPhUaa5Oxy9YofOSiBH3yhQlwllRiTbNzruY/njXFYPjLeLQgtTToMwLeYY=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4648.namprd04.prod.outlook.com (2603:10b6:a03:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 08:20:33 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::b59c:9ae:6e98:5e1e]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::b59c:9ae:6e98:5e1e%8]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 08:20:32 +0000
Date: Tue, 12 Jan 2021 16:20:24 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v1 2/2] drm/bridge: anx7625: add MIPI DPI input feature
 support
Message-ID: <20210112082024.GA5827@pc-user>
References: <cover.1608883950.git.xji@analogixsemi.com>
 <ec0282f620ac472886d3e349bb6a09394b747edb.1608883950.git.xji@analogixsemi.com>
 <20210104145039.GT2809@kadam>
Content-Disposition: inline
In-Reply-To: <20210104145039.GT2809@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0216.apcprd02.prod.outlook.com
 (2603:1096:201:20::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (61.148.116.10) by
 HK2PR02CA0216.apcprd02.prod.outlook.com (2603:1096:201:20::28) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 08:20:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f34f2588-78fc-4906-1370-08d8b6d2ee34
X-MS-TrafficTypeDiagnostic: BYAPR04MB4648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB464855FF266623D32FF4DCEBC7AA0@BYAPR04MB4648.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zFJnNly+qIu0UDyYubl/qzKNuabaenYvWxJ80Y8KzaKMyUXVcxzurOFaO9scOsYsv/wnRTLd0TaeikAYyMTwu5lnhHnD0+EHDnTeVgxtmMhRXvy08DlVNWCrEtXhF+kXY5rhHkesSw1cwFZFdLfzZuB88Ai7gZ/HOXT57bnSr/2MhAGQtopqT92EjUPSYY1HalIJY2t8Oky7nGP2C6UOi2+0QoiAH9zv61/J7vQWUPJ8u8ZYYs8qo1Bl7JO8gXlCYAridevVT/PWkGRP0vShYnCiYEqA7p8i0yJEpfEYJeNkoEVcDnths+vraptYiOYjyPZoqPOwm+HJ33LnyHFi/RjQHeR8rFguo0JIa3W7a3NQUDoddu0Faf8IOPVB1sPVUvnRypuJ4G/1zHj5CE1J5mZ5RhT2KgTBYMVrXwXRty05CtgNyWdOACynpvhDUrlc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(346002)(396003)(366004)(376002)(66556008)(66476007)(8676002)(33716001)(1076003)(5660300002)(33656002)(2906002)(316002)(30864003)(956004)(186003)(8936002)(16526019)(6916009)(4326008)(83380400001)(52116002)(26005)(54906003)(55016002)(7416002)(6666004)(86362001)(9686003)(478600001)(6496006)(66946007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UyCkxKRCxOd7s7Wn4801igfNmhnA7R2H7yIB+4q/BBVT3sOFYiMM2ZoatXhT?=
 =?us-ascii?Q?+srqfXzEY0eoAulGtKSORIsXjQm0iDg3vqWECPImOMCvg2+32jAF+jVjKJOO?=
 =?us-ascii?Q?en92OZ9EgjjMMIJ4DgH7hFMzkOmL5GBhrYw25R+2/KgKKwlAU+MwF8YeOCeP?=
 =?us-ascii?Q?ycgWu3aaxwN99YZNO+RV7/0jquj/LcujGL7C7oU2sTz/8c7hSM96MujPnOUq?=
 =?us-ascii?Q?A0h9zZPGROt/VtGurP7fsAtu0bydX+5Hz67FcaapnemSDUR6qNk72FHsA3Em?=
 =?us-ascii?Q?8r4qgdQkwcvqG2C6aTjeuZzyCzQxPQk6/bZPWhq46OnpflIDgwhXlgkFipES?=
 =?us-ascii?Q?yeDOFJvfCrlGfyTLexDc30gH/h9ZQM2WNNqI9i7d+m7scKkol1HFPk3PLJdi?=
 =?us-ascii?Q?pfgLatCA+1P3UlRoacsmm6hgAcfsflL13rXejPbrtkuW00VIWE79flnzkotI?=
 =?us-ascii?Q?7JiiaCwXtOvecLGHID3U883Kx/IoQQJHjVMfF6CqklsxwseFeJNhbB/O/u3g?=
 =?us-ascii?Q?TW8AlIb5mw1FtUL8K/kcz2wAnj/nKRXh78jN56DFCohpBqfm2DkEBzIqUuJn?=
 =?us-ascii?Q?6LSe4305WRmXdDNT1E5JQrvGocaR2YV4n9O/9/lYXos79YOsx2uF4by0VzZp?=
 =?us-ascii?Q?CQUCz8cLVVyQpolX6GuhixZEzobKSaoWjtPa9RpwPzNmIrPhUunN1Xit9zrZ?=
 =?us-ascii?Q?gRthLgMAMQBvVMJixP5/vuXQmcdw0Sgc3e5l2Ypj3Hvsa2hK532BZSm3QJmf?=
 =?us-ascii?Q?jq4stPhgiPOB24nIjEewvISb9BWOdZwo0Ca/9AqvdP1W/63GqpqFZPkcuUKG?=
 =?us-ascii?Q?+WXSjpJdIOUcJ3OAIbWa4gw+d64eenSTWNC7f9dP6S3azs1CXLA4qNBTPSdA?=
 =?us-ascii?Q?kq3niFesUPvuQj8mm7Mti/OFGoDYog9h3AMOLts+SIkd1vC9Gz2DvatzjRS5?=
 =?us-ascii?Q?15Ai7sf8tHUe5HCBfpF5IsTL4HmvdXHrxZfq1ExecwLS9/dj8ZhhYBu/HYKI?=
 =?us-ascii?Q?pZI8?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 08:20:32.7388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-Network-Message-Id: f34f2588-78fc-4906-1370-08d8b6d2ee34
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjtK2GHe6h6ev4Wc9Yk9Luml7L7BT9IvtBPyQ6dAqePVQksG8ytgwVtF/UBlsRxIHOwO1Nyk0DTuCSv3UoUeOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4648
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan Carpenter, thanks for your comments, I'll fix it in the next serial.
Thanks,
Xin

On Mon, Jan 04, 2021 at 05:50:39PM +0300, Dan Carpenter wrote:
> On Fri, Dec 25, 2020 at 07:02:15PM +0800, Xin Ji wrote:
> > +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> > +				 u8 addrh, u8 addrm, u8 addrl,
> > +				 u8 len, u8 *buf)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +	u8 cmd;
> > +
> > +	if (len > MAX_DPCD_BUFFER_SIZE) {
> > +		DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> > +		return -E2BIG;
> 
> s/E2BIG/EINVAL/.  -E2BIG means something else.
OK
> 
> > +	}
> > +
> > +	cmd = ((len - 1) << 4) | 0x09;
> > +
> > +	/* Set command and length */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_COMMAND, cmd);
> > +
> > +	/* Set aux access address */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_ADDR_7_0, addrl);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_ADDR_15_8, addrm);
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_ADDR_19_16, addrh);
> > +
> > +	/* Enable aux access */
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> > +
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> > +		return -EIO;
> > +	}
> > +
> > +	usleep_range(2000, 2100);
> > +
> > +	ret = wait_aux_op_finish(ctx);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > +				     AP_AUX_BUFF_START, len, buf);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> > +		return -EIO;
> >  	}
> >  
> > -	return val;
> > +	return 0;
> >  }
> >  
> >  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> > @@ -595,6 +663,101 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
> >  	return ret;
> >  }
> >  
> > +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	u16 freq = ctx->dt.pixelclock.min / 1000;
> > +	int ret;
> > +
> > +	/* configure pixel clock */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				PIXEL_CLOCK_L, freq & 0xFF);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 PIXEL_CLOCK_H, (freq >> 8));
> > +
> > +	/* set DPI mode */
> > +	/* set to DPI PLL module sel */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_DIGITAL_PLL_9, 0x20);
> > +	/* power down MIPI */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_LANE_CTRL_10, 0x08);
> > +	/* enable DPI mode */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_DIGITAL_PLL_18, 0x1C);
> > +	/* set first edge */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +				 VIDEO_CONTROL_0, 0x06);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_dpi_config(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> > +
> > +	/* DSC disable */
> > +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				R_DSC_CTRL_0, ~DSC_EN);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = anx7625_config_bit_matrix(ctx);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = anx7625_api_dpi_config(ctx);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> > +		return ret;
> > +	}
> > +
> > +	/* set MIPI RX EN */
> > +	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +			       AP_AV_STATUS, AP_MIPI_RX_EN);
> > +	/* clear mute flag */
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_hdcp_setting(struct anx7625_data *ctx)
> > +{
> > +	u8 bcap;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	if (!(ctx->hdcp_support && ctx->hdcp_en)) {
> 
> Push the ! in and remove the parentheses.
> 
> 	if (!ctx->hdcp_support || !ctx->hdcp_en) {
OK
> 
> 
> > +		DRM_DEV_DEBUG_DRIVER(dev, "hdcp_support(%d), hdcp_en(%d)\n",
> > +				     ctx->hdcp_support, ctx->hdcp_en);
> > +		DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP by config\n");
> > +		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +					 0xee, 0x9f);
> > +	}
> > +
> > +	anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> > +	if (!(bcap & 0x01)) {
> > +		DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> > +		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +					 0xee, 0x9f);
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> > +
> > +	return anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> > +}
> > +
> >  static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >  	int ret;
> > @@ -605,9 +768,15 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >  		return;
> >  	}
> >  
> > +	/* HDCP config */
> > +	anx7625_hdcp_setting(ctx);
> > +
> >  	anx7625_config_audio_input(ctx);
> >  
> > -	ret = anx7625_dsi_config(ctx);
> > +	if (ctx->pdata.is_dpi)
> > +		ret = anx7625_dpi_config(ctx);
> > +	else
> > +		ret = anx7625_dsi_config(ctx);
> >  
> >  	if (ret < 0)
> >  		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > @@ -688,8 +857,53 @@ static int sp_tx_get_edid_block(struct anx7625_data *ctx)
> >  	return c;
> >  }
> >  
> > -static int edid_read(struct anx7625_data *ctx,
> > -		     u8 offset, u8 *pblock_buf)
> > +static int check_hdcp_support(struct anx7625_data *ctx)
> > +{
> > +	int ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* Select HDCP1.4 Key load */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_SRAM_SEL, 0x12);
> > +	/* Select flash addr low byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_ADDR_LOW, 0x91);
> > +	/* Select flash addr high byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_ADDR_HIGH, 0xa0);
> > +	/* Select sram length high byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_LEN_HIGH, 0x00);
> > +	/* Select sram length low byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_LEN_LOW, 0x27);
> > +	/* Select flash length high byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LEN_HIGH, 0x02);
> > +	/* Select flash length low byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LEN_LOW, 0x70);
> > +	/* Select sram addr high byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_ADDR_HIGH, 0x00);
> > +	/* Select sram addr low byte */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_ADDR_LOW, 0x00);
> > +	/* Enable load with decrypt_en */
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LOAD_STA, 0x03);
> > +
> > +	usleep_range(10000, 11000);
> > +
> > +	/* Check load status */
> > +	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, FLASH_LOAD_STA);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : access flash load.\n");
> > +		return ret;
> > +	}
> > +
> > +	if ((ret & 0xF2) != 0xF2) {
> > +		ctx->hdcp_support = 0;
> > +		DRM_DEV_DEBUG_DRIVER(dev, "not support HDCP\n");
> > +	} else {
> > +		ctx->hdcp_support = 1;
> > +		DRM_DEV_DEBUG_DRIVER(dev, "support HDCP\n");
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int edid_read(struct anx7625_data *ctx, u8 offset, u8 *pblock_buf)
> >  {
> >  	int ret, cnt;
> >  	struct device *dev = &ctx->client->dev;
> > @@ -718,6 +932,15 @@ static int edid_read(struct anx7625_data *ctx,
> >  	return 0;
> >  }
> >  
> > +void hdcp_enable(struct anx7625_data *ctx, int en)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "en(%d)\n", en);
> > +
> > +	ctx->hdcp_en = !!en;
> > +}
> > +
> >  static int segments_edid_read(struct anx7625_data *ctx,
> >  			      u8 segment, u8 *buf, u8 offset)
> >  {
> > @@ -992,8 +1215,10 @@ static void anx7625_chip_control(struct anx7625_data *ctx, int state)
> >  
> >  	if (state) {
> >  		atomic_inc(&ctx->power_status);
> > -		if (atomic_read(&ctx->power_status) == 1)
> > +		if (atomic_read(&ctx->power_status) == 1) {
> >  			anx7625_power_on_init(ctx);
> > +			check_hdcp_support(ctx);
> > +		}
> >  	} else {
> >  		if (atomic_read(&ctx->power_status)) {
> >  			atomic_dec(&ctx->power_status);
> > @@ -1051,6 +1276,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >  		return;
> >  	}
> >  
> > +	ctx->hpd_status = 1;
> >  	ctx->hpd_high_cnt++;
> >  
> >  	/* Not support HDCP */
> > @@ -1060,8 +1286,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> >  	/* Interrupt for DRM */
> >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
> >  		return;
> > +	}
> >  
> >  	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
> >  	if (ret < 0)
> > @@ -1080,6 +1308,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
> >  	int ret, val;
> >  	struct device *dev = &ctx->client->dev;
> >  
> > +	/* Interrupt mode, no need poll HPD status, just return */
> > +	if (ctx->pdata.intp_irq)
> > +		return;
> > +
> >  	if (atomic_read(&ctx->power_status) != 1) {
> >  		DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
> >  		return;
> > @@ -1130,6 +1362,22 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
> >  	ctx->slimport_edid_p.edid_block_num = -1;
> >  }
> >  
> > +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int i;
> > +
> > +	if (!ctx->pdata.reg_table_size)
> > +		return;
> 
> No need for this check.  Just remove it and the for loop becomes a no-op.
> 
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "adjust DP tx swing\n");
> 
> Delete this debug statement and use ftrace for this information.
OK
> 
> > +
> > +	for (i = 0; i < ctx->pdata.reg_table_size; i++)
> > +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > +				  ctx->pdata.art[i].offset & 0xFF,
> > +				  ctx->pdata.art[i].data & 0xFF);
> > +}
> > +
> >  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> >  {
> >  	struct device *dev = &ctx->client->dev;
> > @@ -1145,9 +1393,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> >  	} else {
> >  		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
> >  		anx7625_start_dp_work(ctx);
> > +		anx7625_dp_adjust_swing(ctx);
> >  	}
> > -
> > -	ctx->hpd_status = 1;
> >  }
> >  
> >  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> > @@ -1224,12 +1471,63 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > +static int anx7625_get_u32_value(struct device_node *np,
> > +				 const char *name,
> > +				 int start_pos,
> > +				 int *reg_data)
> > +{
> > +	int i, ret;
> > +
> > +	/* each slot has 2 cells */
> > +	for (i = 0; i < 2; i++) {
> > +		ret = of_property_read_u32_index(np, name,
> > +						 start_pos + i,
> > +						 &reg_data[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int anx7625_parse_dt(struct device *dev,
> >  			    struct anx7625_platform_data *pdata)
> >  {
> >  	struct device_node *np = dev->of_node;
> >  	struct drm_panel *panel;
> > -	int ret;
> > +	int ret, i;
> > +	int reg_data[2];
> > +	int total_size, num_regs, start_pos;
> > +
> > +	if (of_get_property(dev->of_node, "anx,swing-setting", &total_size)) {
> > +		/* each slot has 2 cells */
> > +		num_regs = total_size / (sizeof(u32) * 2);
> > +		if (num_regs > MAX_REG_SIZE)
> > +			num_regs = MAX_REG_SIZE;
> > +
> > +		pdata->reg_table_size = num_regs;
> > +
> > +		for (i = 0; i < num_regs; i++) {
> > +			start_pos = i * 2;
> > +			ret = anx7625_get_u32_value(np, "anx,swing-setting",
> > +						    start_pos, reg_data);
> > +			if (ret) {
> > +				DRM_DEV_ERROR(dev, "get swing-setting at %d\n",
> > +					      start_pos);
> > +				return -ENODEV;
> 
> return ret;?
OK
> 
> regards,
> dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
