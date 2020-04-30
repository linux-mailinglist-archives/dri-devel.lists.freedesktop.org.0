Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E941BF182
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD3B6EB6C;
	Thu, 30 Apr 2020 07:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2118.outbound.protection.outlook.com [40.107.93.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594A56EA9C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 06:30:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZYjOMvpkq9+8B/kxyL/A58MXIUeoMAZu5ltqiUSYZZpRN/gtFlY7VWwLXSc+GjveyNso1JtEQcIw0I2Mk2+qpp7b/4V/qWdnj69yFgfvXfquRT1fVxbdmNhDKr+l1seGCb0nOuh6NbxjBfYcIKqnXg/NBT5p8R/yN4qqqrJF9wLm8RPSISyerbzz6JT3d9+KDczOvkBiZQmhDoVvPoQdZc3FhK0vHza70JpEV7yK0FLdMMuqj78Y26H5aDlT95ghIpv2VVCbVdHlEQ7jxKkFQ0szIma+3S0oqHRibYYKGyB1Jlblw1wCQzkflTfd7zjJ51dJNKr/JjJhtjuP0pCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4CKdKTaHkawzkG8/J6NtHtPBaJqgw3IFr+wP29/e1Y=;
 b=EyBpJNW7RHOhmqm+FTWRF6hEVWiYArntZs54L8+b1vQhWNA1LmZBC2ABUJVFaMiHvFLEgbarteJprmmB+syO7drbDxpsS/HFaBeFuMXmUpdwA0k4eb0k7IWm3GRHdvl6H7sNbUDPUBZvca2RElFagY4/dVsNfcseLfswgfuSHRpSwklyqi5iDkot0MJ4oQ7wzcH1ATqwPToeIc1hCJea5xnQY3NYDWte1aZZ+0FrqnuJxfJCjX+XIoqupzQMjPdmNE80AHTY/R8CM/L5XHE7lPkOr76/7RTBBW2NDGa+VskKfbntQaGUfy3JppjYdQaHGcHw2wLj7+FMNgffUJQVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4CKdKTaHkawzkG8/J6NtHtPBaJqgw3IFr+wP29/e1Y=;
 b=J5h/8HVD7brn6xSCv0jcIBbcspDvAudXdxmtjtkZ0VI1LjxMegPQMkrVD3ZtCfgXJKyK1eOzA0UpTYlkJChgio8RFqmeW1s1Qgb0i6I3s6wlVDMv6L7aLVFgxNwS2j3uFrFEF3OeUKD6g+8/O0btoGEOIS0pdZ0GV/mDlZNFhAY=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB7105.namprd04.prod.outlook.com (2603:10b6:a03:222::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 30 Apr
 2020 06:30:19 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 06:30:19 +0000
Date: Thu, 30 Apr 2020 14:30:12 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@chromium.org>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v8 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200430063012.GE6645@xin-VirtualBox>
References: <cover.1587880280.git.xji@analogixsemi.com>
 <4d14400b6c19f17c28267f6ebdbce9673333c05c.1587880280.git.xji@analogixsemi.com>
 <CANMq1KC2EUPMDqTcaU-HLqfFivR4=7wxrmiSk-VzF0bjjLgNHA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CANMq1KC2EUPMDqTcaU-HLqfFivR4=7wxrmiSk-VzF0bjjLgNHA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 06:30:18 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89705d86-d65a-477f-ea3f-08d7eccff3ff
X-MS-TrafficTypeDiagnostic: BY5PR04MB7105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB7105815EEE1A3F97E76B9746C7AA0@BY5PR04MB7105.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0389EDA07F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(39840400004)(136003)(346002)(376002)(7416002)(5660300002)(4326008)(6666004)(478600001)(107886003)(66946007)(9686003)(66476007)(55016002)(66556008)(6496006)(33656002)(54906003)(8936002)(16526019)(26005)(33716001)(316002)(110136005)(8676002)(1076003)(2906002)(186003)(53546011)(956004)(86362001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5wG7x1kZyH75kfW+qqEpJEWY7Ah00RUkK/10M+y/aHGmWpT8JMjJ313b/NoPXvxpPRj9PKozGW7cOUf90IdR2ehkLZWTiraoffG9vvOLy7+NNXUNDGT51mlFdSxEOLWQOwgSQAZOm7THrOHsGq/v5ljIZSZqLAJiRukheZQm5neArCs8sjup0imnaQ+os8g5GUtzroRYkaPldgbWbvmZNTnOinGFV4fP96+cH0WHu/esqUwEly3BtX+i5Y0sS1ur48ahy96qhYb5kf53MNsLSoFkCKB+s6IOutPDxsC9jFt81AwhcY0dfYMy246fdkP9GTwwWu4HwuQyaqeOfHEBJXV3D7owQNpLO2aq3A3pblsOrfScrVCKaAJ6fmclkkhGD2ODAJx/c7M4EXB55b6QxR85ET05ffig4tY0mTsK4txX7y8nq+DBwUGM3RvGbivN
X-MS-Exchange-AntiSpam-MessageData: A0aeEHp4iejX/sqyIXaf+/xXw7ph4sSp+zGkz2iXJ6Wwh5SRoyq9e25Bg/NutT3ifdwiQOP04hbBET1RcYpo6eNT+4UQ6G96r5OSy0M80n2rgBw13C+yVpEodepTF1YFvrq/9PLAPJcxu8Y6SKesTbV4LqK9HETswOpz/uZQ+vPbsdRpHG9n3VGcQrW8vrgdfiWGlXhaNqvjkVo6FIDDbCELqH/Fa+P6bmLfDj9XUEGDEtl+qOc+9k4GquD/Tiz7egXaGFENDdO79QVPLLkcHq76X/BCJLIb8Rc/owMkCk8t0IOAN6mU9K4vlZLugaDXVniEK4Z4sa/+WjvvQ1pEto3v64ovpoR11GiS7Ga8n0NWTHoCxoJc4jiUUY02gOQMtP74QXBi354Nip9giTHxC9ZjJ/KkAfRt81habE29YMWLZt0T5JbyS8jhbgbVozK8Kyx06szi+tFhxebWDrgAMHsS53KhUEo9DZ0zZNb8oohZHU/sTYGaGLger9Hk05hyHc/ZFUwcvMChWgu0rhk/0Z91Z4RUFFGLs6LkQqE9kEIAs5fxEhc1JEqeA7hC3ftq4hcTG7RDaIVcaaHnPTS+VoPhxEMkncIcQFZMG+BdltzWy2gr3xIrRqkdln7bU/neeAlSUnOwPBSsYqoBwtpFMRoSnGdLBRsu80GE3aEen3wfRzb5xs45QW73d7Or1w8EAZvWxiZp4LP/INYrmsL32it8u00ybLx2/0FMGI/092UL40/1HcrVELP2/LTjRHg3TFF5v3abNNa8mNYYCVEH0wMJX7WEM1GyGu1rYMMeTu4O9tRiu8ymfis9l4D2EaSV
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89705d86-d65a-477f-ea3f-08d7eccff3ff
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 06:30:19.5580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnMEgivEtunC3mB1Hl2p7gOTt8MHoo7lpvnvtWj64W0h23Pv/8C2K1tm4piSzEXFfAKHCA5rSicU6nsudPStVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7105
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 10:10:05AM +0800, Nicolas Boichat wrote:
> On Mon, Apr 27, 2020 at 2:18 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> > for portable device. It converts MIPI DSI/DPI to DisplayPort 1.3 4K.
> >
> > The ANX7625 can support both USB Type-C PD feature and MIPI DSI/DPI
> > to DP feature. This driver only enabled MIPI DSI/DPI to DP feature.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/Makefile           |    2 +-
> >  drivers/gpu/drm/bridge/analogix/Kconfig   |    6 +
> >  drivers/gpu/drm/bridge/analogix/Makefile  |    1 +
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2158 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  410 ++++++
> >  5 files changed, 2576 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
> >
> > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > index 4934fcf..bcd388a 100644
> > --- a/drivers/gpu/drm/bridge/Makefile
> > +++ b/drivers/gpu/drm/bridge/Makefile
> > @@ -12,8 +12,8 @@ obj-$(CONFIG_DRM_SII9234) += sii9234.o
> >  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
> >  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> >  obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
> > -obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix/
> >  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
> >  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
> >  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> > +obj-y += analogix/
> >  obj-y += synopsys/
> > diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> > index e930ff9..b2f127e 100644
> > --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> > +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> > @@ -2,3 +2,9 @@
> >  config DRM_ANALOGIX_DP
> >         tristate
> >         depends on DRM
> > +
> > +config ANALOGIX_ANX7625
> > +       tristate "Analogix MIPI to DP interface support"
> > +       help
> > +               ANX7625 is an ultra-low power 4K mobile HD transmitter designed
> > +               for portable devices. It converts MIPI/DPI to DisplayPort1.3 4K.
> > diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> > index fdbf3fd..8a52867 100644
> > --- a/drivers/gpu/drm/bridge/analogix/Makefile
> > +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_ANALOGIX_ANX7625) += anx7625.o
> >  analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o
> >  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > new file mode 100644
> > index 0000000..fff7a49
> > [snip]
> > +static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > +{
> > +       struct mipi_dsi_host *host;
> > +       struct mipi_dsi_device *dsi;
> > +       struct device_node *mipi_host_node;
> > +       struct device *dev = &ctx->client->dev;
> > +       const struct mipi_dsi_device_info info = {
> > +               .type = "anx7625",
> > +               .channel = 0,
> > +               .node = NULL,
> > +       };
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "attach dsi\n");
> > +
> > +       if (ctx->pdata.dsi_supported)
> > +               mipi_host_node = ctx->pdata.node.mipi_dsi_host_node;
> > +       else
> > +               mipi_host_node = ctx->pdata.node.mipi_dpi_host_node;
> > +
> > +       if (!mipi_host_node) {
> > +               DRM_ERROR("dsi host is not configured.\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       host = of_find_mipi_dsi_host_by_node(mipi_host_node);
> 
> I tried this driver when connected to a dpi interface, and this fails,
> as of_find_mipi_dsi_host_by_node is not able to find the dpi interface
> from the SoC.
> 
> I'm not too familiar with how dpi bridges are supposed to work in the
> kernel, but should we even call "anx7625_attach_dsi" for DPI
> interface?
DPI needs hardware support, and I don't know how to register DPI interface
in the driver too, I'll remove the DPI support in the next serial.
> 
> > +       if (!host) {
> > +               DRM_ERROR("failed to find dsi host.\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       dsi = mipi_dsi_device_register_full(host, &info);
> > +       if (IS_ERR(dsi)) {
> > +               DRM_ERROR("failed to create dsi device.\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       dsi->lanes = 4;
> > +       dsi->format = MIPI_DSI_FMT_RGB888;
> > +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
> > +               MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > +               MIPI_DSI_MODE_EOT_PACKET        |
> > +               MIPI_DSI_MODE_VIDEO_HSE;
> > +
> > +       if (mipi_dsi_attach(dsi) < 0) {
> > +               DRM_ERROR("failed to attach dsi to host.\n");
> > +               mipi_dsi_device_unregister(dsi);
> > +               return -EINVAL;
> > +       }
> > +
> > +       ctx->dsi = dsi;
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "attach dsi succeeded.\n");
> > +
> > +       return 0;
> > +}
> > +
> > [snip]
> > +static int anx7625_bridge_attach(struct drm_bridge *bridge)
> > +{
> > +       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +       int err;
> > +       struct device *dev = &ctx->client->dev;
> > +
> > +       DRM_DEV_DEBUG_DRIVER(dev, "drm attach\n");
> > +       if (!bridge->encoder) {
> > +               DRM_ERROR("Parent encoder object not found");
> > +               return -ENODEV;
> > +       }
> > +
> > +       err = drm_connector_init(bridge->dev, &ctx->connector,
> > +                                &anx7625_connector_funcs,
> > +                                ctx->pdata.internal_panel ?
> > +                                       DRM_MODE_CONNECTOR_eDP :
> > +                                       DRM_MODE_CONNECTOR_DisplayPort);
> > +       if (err) {
> > +               DRM_ERROR("Failed to initialize connector: %d\n", err);
> > +               return err;
> > +       }
> > +
> > +       drm_connector_helper_add(&ctx->connector,
> > +                                &anx7625_connector_helper_funcs);
> > +
> > +       err = drm_connector_register(&ctx->connector);
> > +       if (err) {
> > +               DRM_ERROR("Failed to register connector: %d\n", err);
> > +               return err;
> > +       }
> > +
> > +       ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > +
> > +       err = drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> > +       if (err) {
> > +               DRM_ERROR("Failed to link up connector to encoder: %d\n", err);
> > +               drm_connector_unregister(&ctx->connector);
> > +               return err;
> > +       }
> > +
> > +       err = anx7625_attach_dsi(ctx);
> > +       if (err) {
> > +               DRM_ERROR("Failed to attach to dsi : %d\n", err);
> > +               drm_connector_unregister(&ctx->connector);
> > +               return err;
> > +       }
> > +
> > +       ctx->bridge_attached = 1;
> > +
> > +       return 0;
> > +}
> > +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
