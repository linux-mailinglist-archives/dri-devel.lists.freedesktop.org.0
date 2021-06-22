Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF043AFF0A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 10:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320C389F03;
	Tue, 22 Jun 2021 08:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2125.outbound.protection.outlook.com [40.107.96.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C3D89A76
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PydBCgHv3bfHmX3ficyBeCIKgL8QIpgS4uMVlCOZi490W+ZT3Wxko0t+/PLtaXuqqzH3XZCMwPCWiLM0UqWB48DCb2yaBpwYibQFCp8L4hFZhbezD3tBi7ndkv6jmZ612/Fm9RIgb56pbGo8CwX5NtLUkgjLQ7MAnW7davU1ZEV3aIXbQlNKFJ8VHJxWeIVj2uwTQymMT1AACTXOznqdlA5AiKoS6VWE/U1kV5hLuLJTsoMYYHzHx/cvSg9wcYYKi29TMwQL1FB3qdp2rnCLxcWyctR++etgD4wzbIzy7P044PyM/dHMHtk0+O1ZYaY4SjR005oMRbeTtBnSn+OfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGFUeCmtfhq7Q9dxuppAEJ0TGr+VNTO/nYAv7cW8S9w=;
 b=OuddQ+Up1VuMaLM4AD9+nWrr/Yht1hPplBcAkwh19PUNzTutBpvd4FY7RYOt6hPUUS4kut0OMcIRq5952cifdhB7md/gxVT20jj0YOySWy7wd6wVUnwdyqlzkcA9N/EBvPdor+senRPF0tL/tRJ0Cbv2MzC6vP/LNRJabXsxzg6Bf+Vs6FC62x/Jf4A0e98SwZk4iL9e53t7kg71wW0UPB6Z/dBqUwPhvlYtcIce7Cqi+Ws6ZonR6L+wwN4w6XckdAbvW58PaUSISeqiyLXZCOO/OcifyZ0LbOR3KGDRHrkrp1SJnNQYyUeneu4n04zQvnxFszBXaJ8v0lwFWqViUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGFUeCmtfhq7Q9dxuppAEJ0TGr+VNTO/nYAv7cW8S9w=;
 b=OB1jDe7zfG9kdCBljZ9+A6hMOpIaJex9K+ruy1zehYBKmpHx0u+xJ8C1ngC5a2M4zazMLe8gy76nZItYFl392cKITWpN2GGAjs9vLcuekp8cuns592eu3wUBsE4cpUXtbj0Zcsv+asQa5cF5cXB8IcTDdlMiWhWFS2bI18sOfQw=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4838.namprd04.prod.outlook.com (2603:10b6:a03:12::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 08:20:39 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 08:20:39 +0000
Date: Tue, 22 Jun 2021 16:20:31 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v8 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <20210622082031.GA590368@anxtwsw-Precision-3640-Tower>
References: <cover.1623725300.git.xji@analogixsemi.com>
 <d23737053c54d4c6f9a05da12e807264298a3063.1623725300.git.xji@analogixsemi.com>
 <622199f2-0faf-1c92-d718-b983a9e77c4c@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <622199f2-0faf-1c92-d718-b983a9e77c4c@baylibre.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 TYWPR01CA0033.jpnprd01.prod.outlook.com (2603:1096:400:aa::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Tue, 22 Jun 2021 08:20:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54caa093-8a72-4fc6-cdd9-08d935569e42
X-MS-TrafficTypeDiagnostic: BYAPR04MB4838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB48385E029A51F60ACB54F681C7099@BYAPR04MB4838.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGX8uzx2n/WNSUVwL/mlmyh/L7ZpDAtIzzG7tD/pc/3o4mVMQTJ3ckr1+0GROc+BvtN/QaOL2uFI52Sy38W7e+juT3sAk9EiRRaK1hAPJGw1z5dk5dPrSOKlFLPsD0F6A5OTAOxLbaCawaK9/M56dNuIj+09nbALRV4nt7nsTNoRUC3IyrEW1KmbTjTFimJIIcckbcl6kzS0ZlWFX09EaK9IKHxaBXlt+NcaQEzboU3jv5ZUGPl9zIxPDnYkKtJ2TOXJDITHAhhSilTn89hHBwpxK7ihx9qb7D4WUSlEpfeOeVcIDGPqCchDZkYk8PRjg2wxOsKYD5Wk4VKMRswUGn+f66ZC6oYuqv+hk58cF8eEw4B2WWjs8pVBCZaDmdFlWJ8yB4Ps6iIwbAXEble7v7VCwAE6R+mOV24XiK1qbFZZAGK1A8+OC+3qUxYmx60Wzy2XsJA2nxdp/a+UzCs0GtWY1XLqM6tb5KWwoD2Q29SdBPCMqNPR6sC674htKjOtUkp2Phy25YpZzh0DtPtdb+bRKjUhEsoRRpgal1GsqWSehF728+SFsec4DBiDGaF6XsE8uMF/mI826VLEaI4jmnm4qb61PuctFug27JxxTbKy3RL7ltRII+bK55god2vihPUUxfucCIzsRBeEk1tmzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(396003)(366004)(376002)(346002)(33716001)(66476007)(6496006)(30864003)(86362001)(6916009)(1076003)(66946007)(5660300002)(956004)(66556008)(7416002)(9686003)(54906003)(55016002)(6666004)(478600001)(52116002)(2906002)(26005)(38100700002)(8676002)(8936002)(33656002)(38350700002)(53546011)(83380400001)(55236004)(4326008)(186003)(16526019)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DYfxMWEEDQfhafMwovZk99p6oYHlgKyvztD1clkj3S2LpcdxMBANsZtuMUXR?=
 =?us-ascii?Q?L4Jdr6cs3Ob+Zia2e9mi7S44lL7CTXeEqtNFortkabPp8vQz7zMQkd6pIb7C?=
 =?us-ascii?Q?WF1GvXmviseORMOCw9RdlhcGXEQLudfE/idUKxJGksbDFCvi7BcSiCv3YcOu?=
 =?us-ascii?Q?UeYtmLwJEKgO9HeZkTKRVxFEpIo07cxGAhhiNaSQnFv0OXP7SWKKUSBFANrJ?=
 =?us-ascii?Q?QprmpvB/sMq4QB2/jlstZnY4wfvm7x6SlgvT17ozQCfrU8LZbmujrfI43nkF?=
 =?us-ascii?Q?AvBpT+9pX88VQ8D2QmRCHDE3kMQIjhaK6KZkD/PsPnQoij2W7JMv4mD66KlI?=
 =?us-ascii?Q?5Ua3LA/LjblUQ7UZdw0qPSCgCsqPoTJHJxbCVRNJ6zlgsAyxG9M7f8xL0ago?=
 =?us-ascii?Q?v0H1/D8iRY+5ueJyX39obA2fl+mSoV0zE0Xg7XHSn8c1foX/M+hbwp8hPmhb?=
 =?us-ascii?Q?88FEFYoMfT0gZup6hnSMhAc6YMRTjAP9qt79Rkc9ldINSMl/yuTjE3xO2ROU?=
 =?us-ascii?Q?6DgkDsJS7aHg4CXpusqeTINP2vjaE0fGepaoCnKjlWkak1Y/XnHKN7mzuCTw?=
 =?us-ascii?Q?4LJdJ34QO+YEQPMm4qW87hiXY0P9Vp7IAVMOPhFPtpkQ6MeM1YIdR9e8n48x?=
 =?us-ascii?Q?DkP06jCWLzkqlRCZYsUBC0TrcdTVjb8SEM4HXW77NMFpS3vealpzyVvb5TUz?=
 =?us-ascii?Q?7fCEtg/E847IfAmZ1NsyCaiLycl6lLILDuSzu/vJTSrr0dVXsSt/AokngSJa?=
 =?us-ascii?Q?wPw2aZ3jDNfc0joqjwcKj20ydiBr7sMT69KPUDR9929qdRFTL6QSeM3hb61D?=
 =?us-ascii?Q?hNEcu2hk6y0ImdFzU7hN6G3vp3Up5Oo7nnQvRROiytSEs0kcxPTrXXWK/DBi?=
 =?us-ascii?Q?6YK0huCxYNysFFA6ohYXYnswnyCjbfUuBMshUB+MoUeiOH1NJZ63rYbGpJ7I?=
 =?us-ascii?Q?0YSTkiBrRPEW58+0kzZKcHXfOIrfrBJGZlouWtKCZt/yn5T01X6YeI9lHyyv?=
 =?us-ascii?Q?KTPx5ExqHsI48x1QlakabcIcwxXMzueVnim1hiuJgsAG9xS3nZpFTDf3cRVC?=
 =?us-ascii?Q?xX2P3XXXw32oFcPuT9o3UgMPMpWubf2Z9M6uQs087DyaVlTOzgex29dBh2KQ?=
 =?us-ascii?Q?YAGoNqOwfC7kP/Qv1U4PVOPLj1f6RzyQOGffEtOJG5aTESusSHOB/wWC/9Ga?=
 =?us-ascii?Q?aM78SGBxZeApsVT5g7UfQqtfOV71L+L8Ff5S1v6x6vLVwuQzRh5YNySvWg+S?=
 =?us-ascii?Q?bZ5HLHnYSeCszWylPK3pcm1qs+b4Edo4cwiCTPjufDgRxon1ckWjblvHWE1w?=
 =?us-ascii?Q?+cjtOkAbQEp9ImgdrjskN47V?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54caa093-8a72-4fc6-cdd9-08d935569e42
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 08:20:39.1350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1kyMQ61FzB8xUA1LRHGMYoBgKgzmC3rN+CiXOXahDmS89CZZ3xGllYyw3/lBjZJZkEtajimaxOqSm66jJT4Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4838
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
 Sheng Pan <span@analogixsemi.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 11:16:14AM +0200, Neil Armstrong wrote:
> On 16/06/2021 09:50, Xin Ji wrote:
> > The basic anx7625 driver only support MIPI DSI rx signal input.
> > This patch add MIPI DPI rx input configuration support, after apply
> > this patch, the driver can support DSI rx or DPI rx by adding
> > 'bus-type' in DT.
> > 
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 245 ++++++++++++++++------
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> >  2 files changed, 203 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 048080e75016..fb2301a92704 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -152,18 +152,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
> >  	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
> >  }
> >  
> > -static int anx7625_write_and_or(struct anx7625_data *ctx,
> > -				struct i2c_client *client,
> > -				u8 offset, u8 and_mask, u8 or_mask)
> > +static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
> >  {
> > -	int val;
> > +	int i, ret;
> >  
> > -	val = anx7625_reg_read(ctx, client, offset);
> > -	if (val < 0)
> > -		return val;
> > +	ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > +			       AUDIO_CONTROL_REGISTER, 0x80);
> > +	for (i = 0; i < 13; i++)
> > +		ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +					 VIDEO_BIT_MATRIX_12 + i,
> > +					 0x18 + i);
> >  
> > -	return anx7625_reg_write(ctx, client,
> > -				 offset, (val & and_mask) | (or_mask));
> > +	return ret;
> >  }
> >  
> >  static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> > @@ -221,38 +221,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
> >  	return ret;
> >  }
> >  
> > -static int anx7625_config_audio_input(struct anx7625_data *ctx)
> > -{
> > -	struct device *dev = &ctx->client->dev;
> > -	int ret;
> > -
> > -	/* Channel num */
> > -	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > -				AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> > -
> > -	/* FS */
> > -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > -				    AUDIO_CHANNEL_STATUS_4,
> > -				    0xf0, AUDIO_FS_48K);
> > -	/* Word length */
> > -	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > -				    AUDIO_CHANNEL_STATUS_5,
> > -				    0xf0, AUDIO_W_LEN_24_24MAX);
> > -	/* I2S */
> > -	ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > -				AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> > -	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> > -				 AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> > -	/* Audio change flag */
> > -	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > -				AP_AV_STATUS, AP_AUDIO_CHG);
> > -
> > -	if (ret < 0)
> > -		DRM_DEV_ERROR(dev, "fail to config audio.\n");
> > -
> > -	return ret;
> > -}
> > -
> >  /* Reduction of fraction a/b */
> >  static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
> >  {
> > @@ -412,7 +380,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> >  	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> >  			MIPI_LANE_CTRL_0, 0xfc);
> >  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > -				MIPI_LANE_CTRL_0, 3);
> > +				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
> >  
> >  	/* Htotal */
> >  	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > @@ -597,6 +565,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
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
> >  static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >  	int ret;
> > @@ -607,9 +645,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >  		return;
> >  	}
> >  
> > -	anx7625_config_audio_input(ctx);
> > -
> > -	ret = anx7625_dsi_config(ctx);
> > +	if (ctx->pdata.is_dpi)
> > +		ret = anx7625_dpi_config(ctx);
> > +	else
> > +		ret = anx7625_dsi_config(ctx);
> >  
> >  	if (ret < 0)
> >  		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > @@ -1047,6 +1086,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
> >  		return;
> >  	}
> >  
> > +	ctx->hpd_status = 1;
> >  	ctx->hpd_high_cnt++;
> >  
> >  	/* Not support HDCP */
> > @@ -1056,8 +1096,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
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
> > @@ -1076,6 +1118,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
> >  	int ret, val;
> >  	struct device *dev = &ctx->client->dev;
> >  
> > +	/* Interrupt mode, no need poll HPD status, just return */
> > +	if (ctx->pdata.intp_irq)
> > +		return;
> > +
> >  	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
> >  				 ctx, val,
> >  				 ((val & HPD_STATUS) || (val < 0)),
> > @@ -1103,6 +1149,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
> >  	ctx->slimport_edid_p.edid_block_num = -1;
> >  }
> >  
> > +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
> > +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > +				  DP_TX_LANE0_SWING_REG0 + i,
> > +				  ctx->pdata.lane0_reg_data[i] & 0xFF);
> > +
> > +	for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
> > +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> > +				  DP_TX_LANE1_SWING_REG0 + i,
> > +				  ctx->pdata.lane1_reg_data[i] & 0xFF);
> > +}
> > +
> >  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> >  {
> >  	struct device *dev = &ctx->client->dev;
> > @@ -1118,9 +1179,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
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
> > @@ -1197,20 +1257,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > +static int anx7625_get_swing_setting(struct device *dev,
> > +				     struct anx7625_platform_data *pdata)
> > +{
> > +	int num_regs;
> > +
> > +	if (of_get_property(dev->of_node,
> > +			    "analogix,lane0-swing", &num_regs)) {
> > +		if (num_regs > DP_TX_SWING_REG_CNT)
> > +			num_regs = DP_TX_SWING_REG_CNT;
> > +
> > +		pdata->dp_lane0_swing_reg_cnt = num_regs;
> > +		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
> > +					   pdata->lane0_reg_data, num_regs);
> > +	}
> > +
> > +	if (of_get_property(dev->of_node,
> > +			    "analogix,lane1-swing", &num_regs)) {
> > +		if (num_regs > DP_TX_SWING_REG_CNT)
> > +			num_regs = DP_TX_SWING_REG_CNT;
> > +
> > +		pdata->dp_lane1_swing_reg_cnt = num_regs;
> > +		of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
> > +					   pdata->lane1_reg_data, num_regs);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int anx7625_parse_dt(struct device *dev,
> >  			    struct anx7625_platform_data *pdata)
> >  {
> > -	struct device_node *np = dev->of_node;
> > +	struct device_node *np = dev->of_node, *ep0;
> >  	struct drm_panel *panel;
> >  	int ret;
> > +	int bus_type, mipi_lanes;
> >  
> > +	anx7625_get_swing_setting(dev, pdata);
> > +
> > +	pdata->is_dpi = 1; /* default dpi mode */
> >  	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >  	if (!pdata->mipi_host_node) {
> >  		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> >  		return -ENODEV;
> >  	}
> >  
> > -	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > +	bus_type = 5;
> > +	mipi_lanes = MAX_LANES_SUPPORT;
> > +	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > +	if (ep0) {
> > +		if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > +			bus_type = 0;
> > +
> > +		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > +	}
> > +
> > +	if (bus_type == 5) /* bus type is Parallel(DSI) */
> > +		pdata->is_dpi = 0;
> 
> Maybe you can use the include/media/v4l2-fwnode.h V4L2_FWNODE_BUS_TYPE_ defines here instead.
> 
> Neil
Hi Neil, OK, I'll use the properly macro instead of fixing value.
Thanks,
Xin
> 
> > +
> > +	pdata->mipi_lanes = mipi_lanes;
> > +	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > +		pdata->mipi_lanes = MAX_LANES_SUPPORT;
> > +
> > +	if (pdata->is_dpi)
> > +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
> > +	else
> > +		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
> >  
> >  	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> >  	if (ret < 0) {
> > @@ -1273,9 +1385,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >  {
> >  	struct device *dev = &ctx->client->dev;
> >  
> > -	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> > +	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> > +
> > +	if (ctx->pdata.panel_bridge)
> > +		return connector_status_connected;
> >  
> > -	return connector_status_connected;
> > +	return ctx->hpd_status ? connector_status_connected :
> > +				     connector_status_disconnected;
> >  }
> >  
> >  static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > @@ -1303,7 +1419,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> >  		return -EINVAL;
> >  	}
> >  
> > -	dsi->lanes = 4;
> > +	dsi->lanes = ctx->pdata.mipi_lanes;
> >  	dsi->format = MIPI_DSI_FMT_RGB888;
> >  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
> >  		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> > @@ -1349,10 +1465,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
> >  		return -ENODEV;
> >  	}
> >  
> > -	err = anx7625_attach_dsi(ctx);
> > -	if (err) {
> > -		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> > -		return err;
> > +	if (!ctx->pdata.is_dpi) {
> > +		err = anx7625_attach_dsi(ctx);
> > +		if (err) {
> > +			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> > +			return err;
> > +		}
> >  	}
> >  
> >  	if (ctx->pdata.panel_bridge) {
> > @@ -1451,6 +1569,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> >  
> >  	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> >  
> > +	/* No need fixup for external monitor */
> > +	if (!ctx->pdata.panel_bridge)
> > +		return true;
> > +
> >  	hsync = mode->hsync_end - mode->hsync_start;
> >  	hfp = mode->hsync_start - mode->hdisplay;
> >  	hbp = mode->htotal - mode->hsync_end;
> > @@ -1827,8 +1949,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >  
> >  	platform->bridge.funcs = &anx7625_bridge_funcs;
> >  	platform->bridge.of_node = client->dev.of_node;
> > -	platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> > -	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
> > +	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
> > +	if (!platform->pdata.panel_bridge)
> > +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> > +					DRM_BRIDGE_OP_DETECT;
> > +	platform->bridge.type = platform->pdata.panel_bridge ?
> > +				    DRM_MODE_CONNECTOR_eDP :
> > +				    DRM_MODE_CONNECTOR_DisplayPort;
> >  	drm_bridge_add(&platform->bridge);
> >  
> >  	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index 034c3840028f..65db38e5da9a 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -141,12 +141,20 @@
> >  #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
> >  
> >  /******** END of I2C Address 0x72 *********/
> > +
> > +/***************************************************************/
> > +/* Register definition of device address 0x7a */
> > +#define DP_TX_SWING_REG_CNT		0x14
> > +#define DP_TX_LANE0_SWING_REG0		0x00
> > +#define DP_TX_LANE1_SWING_REG0		0x14
> > +/******** END of I2C Address 0x7a *********/
> > +
> >  /***************************************************************/
> >  /* Register definition of device address 0x7e */
> >  
> >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> >  
> > -#define FLASH_LOAD_STA 0x05
> > +#define FLASH_LOAD_STA          0x05
> >  #define FLASH_LOAD_STA_CHK	BIT(7)
> >  
> >  #define  XTAL_FRQ_SEL    0x3F
> > @@ -347,12 +355,20 @@ struct s_edid_data {
> >  
> >  /***************** Display End *****************/
> >  
> > +#define MAX_LANES_SUPPORT	4
> > +
> >  struct anx7625_platform_data {
> >  	struct gpio_desc *gpio_p_on;
> >  	struct gpio_desc *gpio_reset;
> >  	struct regulator_bulk_data supplies[3];
> >  	struct drm_bridge *panel_bridge;
> >  	int intp_irq;
> > +	int is_dpi;
> > +	int mipi_lanes;
> > +	int dp_lane0_swing_reg_cnt;
> > +	int lane0_reg_data[DP_TX_SWING_REG_CNT];
> > +	int dp_lane1_swing_reg_cnt;
> > +	int lane1_reg_data[DP_TX_SWING_REG_CNT];
> >  	u32 low_power_mode;
> >  	struct device_node *mipi_host_node;
> >  };
> > 
