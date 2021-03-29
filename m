Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA7034CDF3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 12:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21D0896ED;
	Mon, 29 Mar 2021 10:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2115.outbound.protection.outlook.com [40.107.223.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C707C89C89
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 10:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRnPp7UV6rSQLJb+eE33XyUNwOBkgXgCsPp8ThOvM97t4gUArPJfSCrITJGSfSUERUqK4MUKn/HRJccZncqj5+4cn8OdvddaHyqRV5nMQiuFqW+aSPkFcdQtE/Iw2xHZlJIpNy/T1RsR5YFJOl7HFPRYPkZyU9a9I1mf3kJjXE8OqF6LWbkikXOa9otnvGk25GBwFEpH+r26ezYhf/S2UKyqfUoIB3amglGg5m8fDuqU+9b4FyPmmiAjvTYejBkFuMs9FbBb87t+pJBYtUuakAq49J/Apbro5YXIrQWcHUa+PSAZOpaX0gyUUday4gD9Osn7+Ilrv/TnyC2uPi2BpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6/EGAT76eXnSI+urDQAm7bkIwQpv7g6a0I+2Dy/4gE=;
 b=PB2n9Fv2kHPycdwtkBaVhjx7HEWFbtiQxbSPs27YDAG4xyOCW5DySZKKqa9Hb+uEaxbTUnkuLhs5s7A5Hn+xYbW6RH9AYsVM4S2F3DR0rRw95uJ/+R+40VhvcFgw1ieClJRg3gvrEuw9He7XljzFbk9KmcXxk2TPLzlI223Msc4UpCTjWSMv7VAimF+s0ieMtmMmXNxM5udVTl691vcEbvbazpCC0rLuau2xAUbVmjllsZpYTd9h1uJg1tylmNSfjmcj4qSVgaxUbH8DkQBwkenZ0LiiA4In5HAu7YkMe7wHye5OooO4JkzN9sZkA7TRECLd1fRj/qYHB0dVG9624Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6/EGAT76eXnSI+urDQAm7bkIwQpv7g6a0I+2Dy/4gE=;
 b=is1LhCXdzxVWBJ2kyLYqMYBUpWS1leZjNQ+NcG12OfKZELgA3aeucr5JHl2KATBLpHDaG7wZPBJsofg4X7+01IDSkeZcsvOH6ZhODqlI/e6G+i9aKZyw+kL7k54+o9/4GtUPIWVnoUH2/DB7Mn7miec1ml1zc4UnLx/Kz5wGSHQ=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6979.namprd04.prod.outlook.com (2603:10b6:a03:227::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 10:27:19 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 10:27:18 +0000
Date: Mon, 29 Mar 2021 18:27:10 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 4/5] drm/bridge: anx7625: add HDCP support
Message-ID: <20210329102710.GA1930154@anxtwsw-Precision-3640-Tower>
References: <cover.1616135353.git.xji@analogixsemi.com>
 <189a637c87827f78c433a053e3c2129ebec73188.1616135353.git.xji@analogixsemi.com>
 <CAMavQKLN04F2rzu7J121N4GvQKh7kq9yXGk+fBSUjsC2nbiSiA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAMavQKLN04F2rzu7J121N4GvQKh7kq9yXGk+fBSUjsC2nbiSiA@mail.gmail.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0086.apcprd04.prod.outlook.com (2603:1096:202:15::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 10:27:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5401541c-04eb-41b4-61ea-08d8f29d3a73
X-MS-TrafficTypeDiagnostic: BY5PR04MB6979:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6979287EF71EE1E892CE0D39C77E9@BY5PR04MB6979.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D1f0Wky6lg90KUd1eiYYBD5ziGWkFUm27byimeClpEs6Gs41kOwpmqKmxKD4Vig9CQj6uJQRUHKnHYAbVN0WRc8HevV3y0ZRTxzPcn4Juheztw2fRD1k0bxBvTknUHZomELle37UsCJmshRY5x44QBx8CSkWZD08xhQ0bSpPr5zgK5PXlROPLQWrXYHeWUkBj0q48F+r07BrmUfF6lC49+VJR5FzyhH24TLtQNLAtR0T82/K+AfabDbc9jY4z7WQXxQpvarYufpeQn8cg9nP7oDkvzU355v2rmeATIO4CCsM8rCXyylt3Ngm0fzyfSNwXHC/750WO0Egei6IS4qEr9H079y3Zl5UjIbAzNjqW2GJK6uRI7KTZcjgmh6LtWELPlaAoX7WhCJ3U4ISNjtO8zXVrIh69jA6IPKrUm8nU1Ror0xgjC+1wHN+KxAwyWOrlkMUuSjj84hlSj8aujGlKnApaX+AOSlcta7Nvp/M336Dy4f/in70+T8IQAnRdoNVovde9XgaISL7RJOriILqZ4kzwXZmidn8VfUOo50hVH5mYDBSQoDnk5ceUqNfa3Vg7INKDWWe0VUxAexfZkKs0HNa/HOQl1A4E/D6YT55Oxk48ROQq5usJdWr119qlUkijuDJ8ZAtKJX64t7EBtKU1oU1dEO4isbd5Xp/LvJnUBbJv7galGYwMmt0+cpE7ZX9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(39840400004)(366004)(396003)(478600001)(1076003)(38100700001)(86362001)(54906003)(8676002)(316002)(6666004)(7416002)(16526019)(186003)(55236004)(8936002)(956004)(2906002)(26005)(4326008)(52116002)(5660300002)(66946007)(33716001)(33656002)(9686003)(6916009)(53546011)(66556008)(966005)(83380400001)(6496006)(66476007)(55016002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LfGTLBac+xRU1UcWH6mfpvgHtlWCz357D5UO6z3Sfq0QZPa/93obbdbAQ7DY?=
 =?us-ascii?Q?ErgFM8v7VATAxrLl0haVYS5syr+ustOT/ShHATXMJjvq9dZVVcg6pkySVlhJ?=
 =?us-ascii?Q?6XB3u9dCgkGnq1LeyG+AuWHd9Uk7OwU1AJVuKrSaWR8kF4g5Swuj6Vr03LLu?=
 =?us-ascii?Q?TxAfCqc6qBWXn2eq/WwYWERzsePXR0Hwj4MBDQwRxpKj/sJi1DMwSqEUkOCv?=
 =?us-ascii?Q?f3dskrjSUylXE+zjhcjtc0Lh9MIlCNWQ4rEu7ZRs8b/y1GdTmEqfrbyMKy4d?=
 =?us-ascii?Q?xSB1pWx361jhd/8NTsfJ39zqbpqOyX0by2SbX6RcIH04sob4aP+TDQWrMjKG?=
 =?us-ascii?Q?d2oGh+oOyTW/nNJOMInV8Jk6/3oimFw+1S8Xaaxsd8cAPjFOL1D3Rna3/OuL?=
 =?us-ascii?Q?iYIKNu1fQxOTH2Zgi0schR7s9ecexaJu6U1SxVxfAqLhdjugioWoJ0DUoxa3?=
 =?us-ascii?Q?4A7+OMkHCuU6VDEuSwK0l+2mESgaICW8t8Muy/9R1Cr0W3rUxbMo6/VrVkUn?=
 =?us-ascii?Q?93zXa7lmDS95eqtmqjjp5Fq8+gl837ynFsk2bPtt8DVy5ULWdwPkmxVOzeJD?=
 =?us-ascii?Q?YeiwqGHbvSKapSVxdaiQzEvvuJaAmpS1cc9mVisSIeXwe15nl1CKXErjezcN?=
 =?us-ascii?Q?LwnGwKx7tOfmCNGBGn2g+d8UJqY2MV/B/ANYvpLvy+rqZVntFPa5cDtnlxVw?=
 =?us-ascii?Q?XSSrdGUiE86LkzyrPeihtD0pn3dpphKbUEXm7DmIhCIzcqoa4iaCRVOV8C3f?=
 =?us-ascii?Q?9OCHPfPdHVcH5dKg10dRjZKCfpFdzlEFbwOYljnllokEuUMOsX9LKA2ZLEHR?=
 =?us-ascii?Q?xfV7/+l8WO546Ip+gU3c6ThyS+ddK7GMSx0KhJ/tZF4tH6lZD5ft//65OlY8?=
 =?us-ascii?Q?v8Kjqqn17uwk0ThOT+imdl2S68GlwT0M80eMTlOVWW4IBUz/X1uZBA+gWkqJ?=
 =?us-ascii?Q?PZGYt4QtFJvJZbECFRfobZ5lJo7McQ+P1lj2aaqMuoyu5vyVzNIPffRWhhUj?=
 =?us-ascii?Q?raHDarTLF6+XhPDhUp+AQY8MXwcHVOGB7a3ngFDvvw6ZL0B25ksg4XZBm5eO?=
 =?us-ascii?Q?o2tcDxDIaB8QPEzz67AOQL99wxkwQ8LoBWFYB4pyxRHKPGp9pfP2PNmHLbQI?=
 =?us-ascii?Q?63zc/Hu8bzdh1JelXtEwFZtM6id1xMGCvgsFD+KI4EoOa3c3KlQE0428lWhB?=
 =?us-ascii?Q?89TUOyepDtlVQD649ZcdPT35thKqmj8zeLcXRllkc5safNsaXrOiFZRKIw/5?=
 =?us-ascii?Q?bz1icb2XM/EfwvqtqILrYXCXbcpwyTinlaKzKlYe05SBy0D5YBDIYC9ajxqv?=
 =?us-ascii?Q?fNgnHFDlEWCUCHWKflYnUuF2?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5401541c-04eb-41b4-61ea-08d8f29d3a73
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 10:27:18.1594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e261/Yaun0NpXphk6XPREyeB0/QP6GacsjdHYEi/D2IsrxejQfllDK7/j38qYi50VcDkRJZF0tOWyxEm5uJguA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6979
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Zhen Li <zhenli@analogixsemi.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Foss <robert.foss@linaro.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 02:19:23PM -0400, Sean Paul wrote:
> On Fri, Mar 19, 2021 at 2:35 AM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Add HDCP feature, enable HDCP function through chip internal key
> > and downstream's capability.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 147 ++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  36 ++++++
> >  2 files changed, 183 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 8c514b46d361..b424a570effa 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -633,6 +633,150 @@ static int anx7625_dpi_config(struct anx7625_data *ctx)
> >         return ret;
> >  }
> >
> > +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> > +                                u8 addrh, u8 addrm, u8 addrl,
> > +                                u8 len, u8 *buf)
> > +{
> > +       struct device *dev = &ctx->client->dev;
> > +       int ret;
> > +       u8 cmd;
> > +
> > +       if (len > MAX_DPCD_BUFFER_SIZE) {
> > +               DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> > +               return -E2BIG;
> > +       }
> > +
> > +       cmd = ((len - 1) << 4) | 0x09;
> > +
> > +       /* Set command and length */
> > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                               AP_AUX_COMMAND, cmd);
> > +
> > +       /* Set aux access address */
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                AP_AUX_ADDR_7_0, addrl);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                AP_AUX_ADDR_15_8, addrm);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                AP_AUX_ADDR_19_16, addrh);
> > +
> > +       /* Enable aux access */
> > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +                               AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> > +
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> > +               return -EIO;
> > +       }
> > +
> > +       usleep_range(2000, 2100);
> > +
> > +       ret = wait_aux_op_finish(ctx);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > +                                    AP_AUX_BUFF_START, len, buf);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> > +               return -EIO;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int anx7625_read_flash_status(struct anx7625_data *ctx)
> > +{
> > +       return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, R_RAM_CTRL);
> > +}
> > +
> > +static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
> > +{
> > +       int ret, val;
> > +       struct device *dev = &ctx->client->dev;
> > +       u8 ident[32];
> > +
> > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                               FLASH_ADDR_HIGH, 0x91);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                FLASH_ADDR_LOW, 0xA0);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "IO error : set key flash address.\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                               FLASH_LEN_HIGH, (FLASH_BUF_LEN - 1) >> 8);
> > +       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                                FLASH_LEN_LOW, (FLASH_BUF_LEN - 1) & 0xFF);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "IO error : set key flash len.\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +                               R_FLASH_RW_CTRL, FLASH_READ);
> > +       ret |= readx_poll_timeout(anx7625_read_flash_status,
> > +                                 ctx, val,
> > +                                 ((val & FLASH_DONE) || (val < 0)),
> > +                                 2000,
> > +                                 2000 * 150);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "flash read access fail!\n");
> > +               return -EIO;
> > +       }
> > +
> > +       ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > +                                    FLASH_BUF_BASE_ADDR,
> > +                                    FLASH_BUF_LEN, ident);
> > +       if (ret < 0) {
> > +               DRM_DEV_ERROR(dev, "read flash data fail!\n");
> > +               return -EIO;
> > +       }
> > +
> > +       if (ident[29] == 0xFF && ident[30] == 0xFF && ident[31] == 0xFF)
> > +               return -EINVAL;
> > +
> > +       return 0;
> > +}
> > +
> > +static int anx7625_hdcp_setting(struct anx7625_data *ctx)
> > +{
> > +       u8 bcap;
> > +       int ret;
> > +       struct device *dev = &ctx->client->dev;
> > +
> > +       ret = anx7625_hdcp_key_probe(ctx);
> > +       if (ret) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP by config\n");
> > +               return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +                                        0xee, 0x9f);
> > +       }
> > +
> > +       anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> > +       if (!(bcap & 0x01)) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "bcap(0x%x) not support HDCP 1.4.\n",
> > +                                    bcap);
> > +               return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +                                        0xee, 0x9f);
> > +       }
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> > +
> > +       ret = anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> > +
> > +       /* Try auth flag */
> > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > +       /* Interrupt for DRM */
> > +       ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > +       if (ret < 0)
> > +               DRM_DEV_ERROR(dev, "fail to enable HDCP\n");
> > +
> > +       return ret;
> > +}
> > +
> >  static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >         int ret;
> > @@ -643,6 +787,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >                 return;
> >         }
> >
> > +       /* HDCP config */
> > +       anx7625_hdcp_setting(ctx);
> 
> You should really use the "Content Protection" property to
> enable/disable HDCP instead of force-enabling it at all times.
> 
> Sean
Hi Sean, it's hard to implement "Content Protection" property, we have
implemented HDCP in firmware, it is not compatible with it. We don't
have interface to get Downstream Cert.
Thanks,
Xin
> 
> > +
> >         if (ctx->pdata.is_dpi)
> >                 ret = anx7625_dpi_config(ctx);
> >         else
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index beee95da2155..c6f93e4df0ed 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -154,9 +154,45 @@
> >
> >  #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> >
> > +#define FLASH_SRAM_SEL          0x00
> > +#define SRAM_ADDR_HIGH          0x01
> > +#define SRAM_ADDR_LOW           0x02
> > +#define SRAM_LEN_HIGH           0x03
> > +#define SRAM_LEN_LOW            0x04
> >  #define FLASH_LOAD_STA          0x05
> >  #define FLASH_LOAD_STA_CHK     BIT(7)
> >
> > +#define R_RAM_CTRL              0x05
> > +/* bit positions */
> > +#define FLASH_DONE              BIT(7)
> > +#define BOOT_LOAD_DONE          BIT(6)
> > +#define CRC_OK                  BIT(5)
> > +#define LOAD_DONE               BIT(4)
> > +#define O_RW_DONE               BIT(3)
> > +#define FUSE_BUSY               BIT(2)
> > +#define DECRYPT_EN              BIT(1)
> > +#define LOAD_START              BIT(0)
> > +
> > +#define FLASH_ADDR_HIGH         0x0F
> > +#define FLASH_ADDR_LOW          0x10
> > +#define FLASH_LEN_HIGH          0x31
> > +#define FLASH_LEN_LOW           0x32
> > +
> > +#define R_FLASH_RW_CTRL         0x33
> > +/* bit positions */
> > +#define READ_DELAY_SELECT       BIT(7)
> > +#define GENERAL_INSTRUCTION_EN  BIT(6)
> > +#define FLASH_ERASE_EN          BIT(5)
> > +#define RDID_READ_EN            BIT(4)
> > +#define REMS_READ_EN            BIT(3)
> > +#define WRITE_STATUS_EN         BIT(2)
> > +#define FLASH_READ              BIT(1)
> > +#define FLASH_WRITE             BIT(0)
> > +
> > +#define FLASH_BUF_BASE_ADDR     0x60
> > +#define FLASH_BUF_LEN           0x20
> > +#define FLASH_KEY_OFFSET        0x8000
> > +
> >  #define  XTAL_FRQ_SEL    0x3F
> >  /* bit field positions */
> >  #define  XTAL_FRQ_SEL_POS    5
> > --
> > 2.25.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
