Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D302204BA2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28386E967;
	Tue, 23 Jun 2020 07:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2136.outbound.protection.outlook.com [40.107.92.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCC76E277
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 10:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9b6JsGPXGLMA8EeJxIxtG7VRFtS67yPd/rKPaGhMaPoFdEF8cflHd74ZHXHTIMz67Fy8HuXbC74l/5LEFW8aHl2zHbTM+0wj0SgxUlIXNgJyJ/UsffOo93jq+xngQZqtkqCyYkQaGbWYw9Tf2bAEWA1e5vDC+wY0O0OeWDpOjmSgFthb4qy7lR9VG90IDvZSD26Eyce2SxARHxD/RHckf9635KxxICcmgH+S3K4uLQBhgYXmGIU7iIrhWie8XGgV6iCmhQkY7qg85b2MGpP+RbOjNqLA51I5ljfKMPEgx+pj/cruKNHNp36u8yuA6UR2kJq0yY8PQ0i4N8/XQOfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGiOjgdCtkURKw8Ml3FEzCSyvSIfzYnbxtLVR71Et38=;
 b=NKfhDri8H8iJNEiSKLc86U1IDo8IprHuENQ+VLs+DR1P6XuQIk+yyBtUx2K6VIn/+reabyhSeDPYWZZNlBgcVWx24bKkmBWO1M3LDK6F1u5CP3NEbF+0rCG+CCCayaw435SWC+lg3fdzD1qpBY/UKoyyZwj0vqtCx9C9Aav56XnjXLhr6co1H2plbn57hvgW9XhMK7LpFjiUV5B00JG6Cj5Zx9pyQy23ktDgS5jNREJizCzdR2ldvhoOhT/06u07rPSLqLP/ytx1iY/ejAoEZ1nKsw4TKQQiAV4CD+AxJrPqBhlN5vbu/tCQfEk1f9h9NazoNZELXT20I5TzB/5P2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGiOjgdCtkURKw8Ml3FEzCSyvSIfzYnbxtLVR71Et38=;
 b=dzXY/1rrjJWjFfjdhKFcznUNkGhIqz72WpoMnTcaFcUJm0e+uNw39TRuxSDlfKJhRRp/4YQKkmJud6vyyiR8N9n8QfrmsRUSukT0GDvzkA2qvzBVw91/4hrOEEbAaiJwr8umJo6G87bFn+VgSSdwfthIVPlI4fwL7B7mO9c2wkI=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6980.namprd04.prod.outlook.com (2603:10b6:a03:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 10:32:31 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 10:32:31 +0000
Date: Mon, 22 Jun 2020 18:32:23 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v13 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP
Message-ID: <20200622103223.GA3734@xin-VirtualBox>
References: <cover.1591345160.git.xji@analogixsemi.com>
 <a18316c118c7b8ac201911b0b96d41c84653a00f.1591345160.git.xji@analogixsemi.com>
 <20200621080925.GH74146@ravnborg.org>
Content-Disposition: inline
In-Reply-To: <20200621080925.GH74146@ravnborg.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR02CA0199.apcprd02.prod.outlook.com
 (2603:1096:201:20::11) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR02CA0199.apcprd02.prod.outlook.com (2603:1096:201:20::11) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 10:32:29 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe0697e3-aa6e-4136-409a-08d816979118
X-MS-TrafficTypeDiagnostic: BY5PR04MB6980:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB69800254CC278EA3E54C0525C7970@BY5PR04MB6980.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrsp/3AG2z1a26dVWTj/jUxcrSLO7iOUAOzihplSP+j5SK5nkpr5/xQvD56A5FYt9QCyfvdocZ7TC2vI+Vw5pHFTCMeptya81gSCD83o8pdk+zXVlbEcN9rEc+LdIK2kD5Cxj25UahrzgE52q1pI2Wj7yVpDoE/YczRAdklYHwNCCZkTHiCef6t5cHOs9A29fbhaIhh9iZPDT6xSsn6pNIcop6zot6ZyUMcplnwN9+rD/lru6W1GIoDCmFa2x3cmmTGf7oAibXrzahLRw8QM8nxNOx3SICbIxNWaU0G4wPhIO1+u3sxu9AwKnp+gw+M0nFlhQwWvT0rJvFQ+Jqck4n0ZhRcaRJ+T/f5aRJci1Jo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(346002)(366004)(54906003)(83380400001)(33716001)(5660300002)(1076003)(6666004)(30864003)(956004)(86362001)(2906002)(26005)(4326008)(6496006)(107886003)(66946007)(9686003)(66476007)(66556008)(186003)(16526019)(33656002)(8676002)(52116002)(7416002)(508600001)(55016002)(8936002)(966005)(6916009)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: +uG1mrxVM+8/hdAwSj7SJqe1vi0/h0aBcGxEdaUXDDy4dayalL8NPi6Z0wQoDr7iSvNpKByMAwq1foI9M5OFQyS3I+g8Fd4Xu3rS9QmHKuSuhFFI9JSnoPhHyWMmfQkou/k3vEHz8j7gmRLyjxKGCcrRhMLCk49u16+63qpGBPfeiEpR5p6Zi9gv7P9p6lo4UwZdknOZJVcy4CRe3/VimwmHhcJyVchnUFHslAnE3QLRE4MyDs5r7QasmApDwrMRNRcr/cDJzy+GvdjsWcnablnL2AGeEjMoeBWSq4zkdU13P3wADkl9p1765ZnbxS35/4f+Kbf0pBOEZ3pJlEwqBTzN66mi0iHHw4VDOhqezTSq9/E79KG1Ghy3k0nu+4fWRTh+rgYpTLMt4TzJpZe7yy6TPFjaen7EWDqf0XjipaaL0kcnHBzlVGdrpkroE0rmzDcFDnuCLwnbg0kJaslccroqBrPMEdQF56rB3GsRtZuUU7udPItLUygeUNFpe37p
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0697e3-aa6e-4136-409a-08d816979118
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 10:32:30.9047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5opbeZ5uWXxGdGCwODLK16+hbfUzD39iJyy/xsqPHyvPKiRoiYVUlu6hp53BcA6XvjJRrJ2zN3OCBrz34LNMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6980
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Pi-Hsun Shih <pihsun@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 10:09:25AM +0200, Sam Ravnborg wrote:
> Hi Xin.
> 
> 
> On Tue, Jun 09, 2020 at 03:19:50PM +0800, Xin Ji wrote:
> > The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> > for portable device. It converts MIPI DSI/DPI to DisplayPort 1.3 4K.
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> The bridge driver now implements the bridge functions for get_edid +
> detect which is good.
> But the bridge driver also needs to check the flags argument
> of anx7625_bridge_attach() so the connector creation is optional.
> This is required to prepare the bridge driver to fully support a
> chain of bridges and is mandatory for new bridge drivers.
> 
> Futhermore the bridge driver needs to be converted to use the bridge
> panel. See what other bridge drivers do.
> In short - the drm_panel shall be replaced by a bridge in your
> platform data structure.
> Usual this end up in less code after the conversion.
> 
> 	Sam
> 
Hi Sam, thanks for your comments.
1. I'll add flags argument check in anx7625_bridge_attach().
2. Do you mean panel bridge, related interface is
"devm_drm_panel_bridge_add(...)"? If it is, do I still need call
drm_panel_prepare()/drm_panel_unprepare() to enable/disable panel power?

Thanks,
Xin

> > ---
> >  drivers/gpu/drm/bridge/analogix/Kconfig   |    9 +
> >  drivers/gpu/drm/bridge/analogix/Makefile  |    1 +
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1999 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  397 ++++++
> >  4 files changed, 2406 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> > index e1fa7d8..024ea2a 100644
> > --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> > +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> > @@ -25,3 +25,12 @@ config DRM_ANALOGIX_ANX78XX
> >  config DRM_ANALOGIX_DP
> >  	tristate
> >  	depends on DRM
> > +
> > +config DRM_ANALOGIX_ANX7625
> > +	tristate "Analogix Anx7625 MIPI to DP interface support"
> > +	depends on DRM
> > +	depends on OF
> > +	help
> > +	  ANX7625 is an ultra-low power 4K mobile HD transmitter
> > +	  designed for portable devices. It converts MIPI/DPI to
> > +	  DisplayPort1.3 4K.
> > diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> > index 97669b3..44da392 100644
> > --- a/drivers/gpu/drm/bridge/analogix/Makefile
> > +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o analogix-i2c-dptx.o
> >  obj-$(CONFIG_DRM_ANALOGIX_ANX6345) += analogix-anx6345.o
> > +obj-$(CONFIG_DRM_ANALOGIX_ANX7625) += anx7625.o
> >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> >  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > new file mode 100644
> > index 0000000..db37f68
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -0,0 +1,1999 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright(c) 2020, Analogix Semiconductor. All rights reserved.
> > + *
> > + */
> > +#include <linux/gcd.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_dp_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_mipi_dsi.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include <video/display_timing.h>
> > +
> > +#include "anx7625.h"
> > +
> > +/*
> > + * There is a sync issue while access I2C register between AP(CPU) and
> > + * internal firmware(OCM), to avoid the race condition, AP should access
> > + * the reserved slave address before slave address occurs changes.
> > + */
> > +static int i2c_access_workaround(struct anx7625_data *ctx,
> > +				 struct i2c_client *client)
> > +{
> > +	u8 offset;
> > +	struct device *dev = &client->dev;
> > +	int ret;
> > +
> > +	if (client == ctx->last_client)
> > +		return 0;
> > +
> > +	ctx->last_client = client;
> > +
> > +	if (client == ctx->i2c.tcpc_client)
> > +		offset = RSVD_00_ADDR;
> > +	else if (client == ctx->i2c.tx_p0_client)
> > +		offset = RSVD_D1_ADDR;
> > +	else if (client == ctx->i2c.tx_p1_client)
> > +		offset = RSVD_60_ADDR;
> > +	else if (client == ctx->i2c.rx_p0_client)
> > +		offset = RSVD_39_ADDR;
> > +	else if (client == ctx->i2c.rx_p1_client)
> > +		offset = RSVD_7F_ADDR;
> > +	else
> > +		offset = RSVD_00_ADDR;
> > +
> > +	ret = i2c_smbus_write_byte_data(client, offset, 0x00);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev,
> > +			      "fail to access i2c id=%x\n:%x",
> > +			      client->addr, offset);
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_reg_read(struct anx7625_data *ctx,
> > +			    struct i2c_client *client, u8 reg_addr)
> > +{
> > +	int ret;
> > +	struct device *dev = &client->dev;
> > +
> > +	i2c_access_workaround(ctx, client);
> > +
> > +	ret = i2c_smbus_read_byte_data(client, reg_addr);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "read i2c fail id=%x:%x\n",
> > +			      client->addr, reg_addr);
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_reg_block_read(struct anx7625_data *ctx,
> > +				  struct i2c_client *client,
> > +				  u8 reg_addr, u8 len, u8 *buf)
> > +{
> > +	int ret;
> > +	struct device *dev = &client->dev;
> > +
> > +	i2c_access_workaround(ctx, client);
> > +
> > +	ret = i2c_smbus_read_i2c_block_data(client, reg_addr, len, buf);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "read i2c block fail id=%x:%x\n",
> > +			      client->addr, reg_addr);
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_reg_write(struct anx7625_data *ctx,
> > +			     struct i2c_client *client,
> > +			     u8 reg_addr, u8 reg_val)
> > +{
> > +	int ret;
> > +	struct device *dev = &client->dev;
> > +
> > +	i2c_access_workaround(ctx, client);
> > +
> > +	ret = i2c_smbus_write_byte_data(client, reg_addr, reg_val);
> > +
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "fail to write i2c id=%x\n:%x",
> > +			      client->addr, reg_addr);
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_write_or(struct anx7625_data *ctx,
> > +			    struct i2c_client *client,
> > +			    u8 offset, u8 mask)
> > +{
> > +	int val;
> > +
> > +	val = anx7625_reg_read(ctx, client, offset);
> > +	if (val < 0)
> > +		return val;
> > +
> > +	return anx7625_reg_write(ctx, client, offset, (val | (mask)));
> > +}
> > +
> > +static int anx7625_write_and(struct anx7625_data *ctx,
> > +			     struct i2c_client *client,
> > +			     u8 offset, u8 mask)
> > +{
> > +	int val;
> > +
> > +	val = anx7625_reg_read(ctx, client, offset);
> > +	if (val < 0)
> > +		return val;
> > +
> > +	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
> > +}
> > +
> > +static int anx7625_write_and_or(struct anx7625_data *ctx,
> > +				struct i2c_client *client,
> > +				u8 offset, u8 and_mask, u8 or_mask)
> > +{
> > +	int val;
> > +
> > +	val = anx7625_reg_read(ctx, client, offset);
> > +	if (val < 0)
> > +		return val;
> > +
> > +	return anx7625_reg_write(ctx, client,
> > +				 offset, (val & and_mask) | (or_mask));
> > +}
> > +
> > +static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
> > +{
> > +	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, AP_AUX_CTRL_STATUS);
> > +}
> > +
> > +static int wait_aux_op_finish(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int val;
> > +	int ret;
> > +
> > +	ret = readx_poll_timeout(anx7625_read_ctrl_status_p0,
> > +				 ctx, val,
> > +				 (!(val & AP_AUX_CTRL_OP_EN) || (val < 0)),
> > +				 2000,
> > +				 2000 * 150);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "aux operation fail!\n");
> > +		return -EIO;
> > +	}
> > +
> > +	val = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
> > +			       AP_AUX_CTRL_STATUS);
> > +	if (val < 0 || (val & 0x0F)) {
> > +		DRM_DEV_ERROR(dev, "aux status %02x\n", val);
> > +		val = -EIO;
> > +	}
> > +
> > +	return val;
> > +}
> > +
> > +static int anx7625_video_mute_control(struct anx7625_data *ctx,
> > +				      u8 status)
> > +{
> > +	int ret;
> > +
> > +	if (status) {
> > +		/* Set mute on flag */
> > +		ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +				       AP_AV_STATUS, AP_MIPI_MUTE);
> > +		/* Clear mipi RX en */
> > +		ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +					 AP_AV_STATUS, (u8)~AP_MIPI_RX_EN);
> > +	} else {
> > +		/* Mute off flag */
> > +		ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +					AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> > +		/* Set MIPI RX EN */
> > +		ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +					AP_AV_STATUS, AP_MIPI_RX_EN);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_config_audio_input(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	/* Channel num */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> > +				AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
> > +
> > +	/* FS */
> > +	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > +				    AUDIO_CHANNEL_STATUS_4,
> > +				    0xf0, AUDIO_FS_48K);
> > +	/* Word length */
> > +	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > +				    AUDIO_CHANNEL_STATUS_5,
> > +				    0xf0, AUDIO_W_LEN_24_24MAX);
> > +	/* I2S */
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
> > +				AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
> > +				 AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
> > +	/* Audio change flag */
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AV_STATUS, AP_AUDIO_CHG);
> > +
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "fail to config audio.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +/* Reduction of fraction a/b */
> > +static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
> > +{
> > +	unsigned long gcd_num;
> > +	unsigned long tmp_a, tmp_b;
> > +	u32 i = 1;
> > +
> > +	gcd_num = gcd(*a, *b);
> > +	*a /= gcd_num;
> > +	*b /= gcd_num;
> > +
> > +	tmp_a = *a;
> > +	tmp_b = *b;
> > +
> > +	while ((*a > MAX_UNSIGNED_24BIT) || (*b > MAX_UNSIGNED_24BIT)) {
> > +		i++;
> > +		*a = tmp_a / i;
> > +		*b = tmp_b / i;
> > +	}
> > +
> > +	/*
> > +	 * In the end, make a, b larger to have higher ODFC PLL
> > +	 * output frequency accuracy
> > +	 */
> > +	while ((*a < MAX_UNSIGNED_24BIT) && (*b < MAX_UNSIGNED_24BIT)) {
> > +		*a <<= 1;
> > +		*b <<= 1;
> > +	}
> > +
> > +	*a >>= 1;
> > +	*b >>= 1;
> > +}
> > +
> > +static int anx7625_calculate_m_n(u32 pixelclock,
> > +				 unsigned long *m,
> > +				 unsigned long *n,
> > +				 u8 *post_divider)
> > +{
> > +	if (pixelclock > PLL_OUT_FREQ_ABS_MAX / POST_DIVIDER_MIN) {
> > +		/* Pixel clock frequency is too high */
> > +		DRM_ERROR("pixelclock too high, act(%d), maximum(%lu)\n",
> > +			  pixelclock,
> > +			  PLL_OUT_FREQ_ABS_MAX / POST_DIVIDER_MIN);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (pixelclock < PLL_OUT_FREQ_ABS_MIN / POST_DIVIDER_MAX) {
> > +		/* Pixel clock frequency is too low */
> > +		DRM_ERROR("pixelclock too low, act(%d), maximum(%lu)\n",
> > +			  pixelclock,
> > +			  PLL_OUT_FREQ_ABS_MIN / POST_DIVIDER_MAX);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (*post_divider = 1;
> > +		pixelclock < (PLL_OUT_FREQ_MIN / (*post_divider));)
> > +		*post_divider += 1;
> > +
> > +	if (*post_divider > POST_DIVIDER_MAX) {
> > +		for (*post_divider = 1;
> > +			(pixelclock <
> > +			 (PLL_OUT_FREQ_ABS_MIN / (*post_divider)));)
> > +			*post_divider += 1;
> > +
> > +		if (*post_divider > POST_DIVIDER_MAX) {
> > +			DRM_ERROR("cannot find property post_divider(%d)\n",
> > +				  *post_divider);
> > +			return -EDOM;
> > +		}
> > +	}
> > +
> > +	/* Patch to improve the accuracy */
> > +	if (*post_divider == 7) {
> > +		/* 27,000,000 is not divisible by 7 */
> > +		*post_divider = 8;
> > +	} else if (*post_divider == 11) {
> > +		/* 27,000,000 is not divisible by 11 */
> > +		*post_divider = 12;
> > +	} else if ((*post_divider == 13) || (*post_divider == 14)) {
> > +		/* 27,000,000 is not divisible by 13 or 14 */
> > +		*post_divider = 15;
> > +	}
> > +
> > +	if (pixelclock * (*post_divider) > PLL_OUT_FREQ_ABS_MAX) {
> > +		DRM_ERROR("act clock(%u) large than maximum(%lu)\n",
> > +			  pixelclock * (*post_divider),
> > +			  PLL_OUT_FREQ_ABS_MAX);
> > +		return -EDOM;
> > +	}
> > +
> > +	*m = pixelclock;
> > +	*n = XTAL_FRQ / (*post_divider);
> > +
> > +	anx7625_reduction_of_a_fraction(m, n);
> > +
> > +	return 0;
> > +}
> > +
> > +static int anx7625_odfc_config(struct anx7625_data *ctx,
> > +			       u8 post_divider)
> > +{
> > +	int ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* Config input reference clock frequency 27MHz/19.2MHz */
> > +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_16,
> > +				~(REF_CLK_27000KHZ << MIPI_FREF_D_IND));
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_16,
> > +				(REF_CLK_27000KHZ << MIPI_FREF_D_IND));
> > +	/* Post divider */
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_DIGITAL_PLL_8, 0x0f);
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_8,
> > +				post_divider << 4);
> > +
> > +	/* Add patch for MIS2-125 (5pcs ANX7625 fail ATE MBIST test) */
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_7,
> > +				 ~MIPI_PLL_VCO_TUNE_REG_VAL);
> > +
> > +	/* Reset ODFC PLL */
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_7,
> > +				 ~MIPI_PLL_RESET_N);
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_7,
> > +				MIPI_PLL_RESET_N);
> > +
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	unsigned long m, n;
> > +	u16 htotal;
> > +	int ret;
> > +	u8 post_divider = 0;
> > +
> > +	ret = anx7625_calculate_m_n(ctx->dt.pixelclock.min * 1000,
> > +				    &m, &n, &post_divider);
> > +
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "cannot get property m n value.\n");
> > +		return ret;
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "compute M(%lu), N(%lu), divider(%d).\n",
> > +			     m, n, post_divider);
> > +
> > +	/* Configure pixel clock */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, PIXEL_CLOCK_L,
> > +				(ctx->dt.pixelclock.min / 1000) & 0xFF);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, PIXEL_CLOCK_H,
> > +				 (ctx->dt.pixelclock.min / 1000) >> 8);
> > +	/* Lane count */
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> > +			MIPI_LANE_CTRL_0, 0xfc);
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > +				MIPI_LANE_CTRL_0, 3);
> > +
> > +	/* Htotal */
> > +	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > +		ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > +	/* Hactive */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive.min & 0xFF);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive.min >> 8);
> > +	/* HFP */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_porch.min);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_FRONT_PORCH_H,
> > +			ctx->dt.hfront_porch.min >> 8);
> > +	/* HWS */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.min);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.min >> 8);
> > +	/* HBP */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porch.min);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porch.min >> 8);
> > +	/* Vactive */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_L,
> > +			ctx->dt.vactive.min);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTIVE_LINES_H,
> > +			ctx->dt.vactive.min >> 8);
> > +	/* VFP */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.min);
> > +	/* VWS */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min);
> > +	/* VBP */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > +			VERTICAL_BACK_PORCH, ctx->dt.vback_porch.min);
> > +	/* M value */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +			MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +			MIPI_PLL_M_NUM_15_8, (m >> 8) & 0xff);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +			MIPI_PLL_M_NUM_7_0, (m & 0xff));
> > +	/* N value */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +			MIPI_PLL_N_NUM_23_16, (n >> 16) & 0xff);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +			MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
> > +			(n & 0xff));
> > +	/* Diff */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +			MIPI_DIGITAL_ADJ_1, 0x3D);
> > +
> > +	ret |= anx7625_odfc_config(ctx, post_divider - 1);
> > +
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "mipi dsi setup IO error.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_swap_dsi_lane3(struct anx7625_data *ctx)
> > +{
> > +	int val;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* Swap MIPI-DSI data lane 3 P and N */
> > +	val = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, MIPI_SWAP);
> > +	if (val < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : access MIPI_SWAP.\n");
> > +		return -EIO;
> > +	}
> > +
> > +	val |= (1 << MIPI_SWAP_CH3);
> > +	return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_SWAP, val);
> > +}
> > +
> > +static int anx7625_api_dsi_config(struct anx7625_data *ctx)
> > +
> > +{
> > +	int val, ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* Swap MIPI-DSI data lane 3 P and N */
> > +	ret = anx7625_swap_dsi_lane3(ctx);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : swap dsi lane 3 fail.\n");
> > +		return ret;
> > +	}
> > +
> > +	/* DSI clock settings */
> > +	val = (0 << MIPI_HS_PWD_CLK)		|
> > +		(0 << MIPI_HS_RT_CLK)		|
> > +		(0 << MIPI_PD_CLK)		|
> > +		(1 << MIPI_CLK_RT_MANUAL_PD_EN)	|
> > +		(1 << MIPI_CLK_HS_MANUAL_PD_EN)	|
> > +		(0 << MIPI_CLK_DET_DET_BYPASS)	|
> > +		(0 << MIPI_CLK_MISS_CTRL)	|
> > +		(0 << MIPI_PD_LPTX_CH_MANUAL_PD_EN);
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				MIPI_PHY_CONTROL_3, val);
> > +
> > +	/*
> > +	 * Decreased HS prepare timing delay from 160ns to 80ns work with
> > +	 *     a) Dragon board 810 series (Qualcomm AP)
> > +	 *     b) Moving Pixel DSI source (PG3A pattern generator +
> > +	 *	P332 D-PHY Probe) default D-PHY timing
> > +	 *	5ns/step
> > +	 */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_TIME_HS_PRPR, 0x10);
> > +
> > +	/* Enable DSI mode*/
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_18,
> > +				SELECT_DSI << MIPI_DPI_SELECT);
> > +
> > +	ret |= anx7625_dsi_video_timing_config(ctx);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "dsi video timing config fail\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Toggle m, n ready */
> > +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_6,
> > +				~(MIPI_M_NUM_READY | MIPI_N_NUM_READY));
> > +	usleep_range(1000, 1100);
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_6,
> > +				MIPI_M_NUM_READY | MIPI_N_NUM_READY);
> > +
> > +	/* Configure integer stable register */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_VIDEO_STABLE_CNT, 0x02);
> > +	/* Power on MIPI RX */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_LANE_CTRL_10, 0x00);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > +				 MIPI_LANE_CTRL_10, 0x80);
> > +
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error : mipi dsi enable init fail.\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_dsi_config(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> > +
> > +	/* DSC disable */
> > +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				R_DSC_CTRL_0, ~DSC_EN);
> > +
> > +	ret |= anx7625_api_dsi_config(ctx);
> > +
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : api dsi config error.\n");
> > +		return ret;
> > +	}
> > +
> > +	/* Set MIPI RX EN */
> > +	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +			       AP_AV_STATUS, AP_MIPI_RX_EN);
> > +	/* Clear mute flag */
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error : enable mipi rx fail.\n");
> > +	else
> > +		DRM_DEV_DEBUG_DRIVER(dev, "success to config DSI\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static void anx7625_dp_start(struct anx7625_data *ctx)
> > +{
> > +	int ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	if (!ctx->display_timing_valid) {
> > +		DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
> > +		return;
> > +	}
> > +
> > +	anx7625_config_audio_input(ctx);
> > +
> > +	ret = anx7625_dsi_config(ctx);
> > +
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> > +}
> > +
> > +static void anx7625_dp_stop(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "stop dp output\n");
> > +
> > +	/*
> > +	 * Video disable: 0x72:08 bit 7 = 0;
> > +	 * Audio disable: 0x70:87 bit 0 = 0;
> > +	 */
> > +	ret = anx7625_write_and(ctx, ctx->i2c.tx_p0_client, 0x87, 0xfe);
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, 0x08, 0x7f);
> > +
> > +	ret |= anx7625_video_mute_control(ctx, 1);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
> > +}
> > +
> > +static int sp_tx_rst_aux(struct anx7625_data *ctx)
> > +{
> > +	int ret;
> > +
> > +	ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client, RST_CTRL2,
> > +			       AUX_RST);
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, RST_CTRL2,
> > +				 ~AUX_RST);
> > +	return ret;
> > +}
> > +
> > +static int sp_tx_aux_wr(struct anx7625_data *ctx, u8 offset)
> > +{
> > +	int ret;
> > +
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_BUFF_START, offset);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_COMMAND, 0x04);
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> > +	return (ret | wait_aux_op_finish(ctx));
> > +}
> > +
> > +static int sp_tx_aux_rd(struct anx7625_data *ctx, u8 len_cmd)
> > +{
> > +	int ret;
> > +
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_COMMAND, len_cmd);
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> > +	return (ret | wait_aux_op_finish(ctx));
> > +}
> > +
> > +static int sp_tx_get_edid_block(struct anx7625_data *ctx)
> > +{
> > +	int c = 0;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	sp_tx_aux_wr(ctx, 0x7e);
> > +	sp_tx_aux_rd(ctx, 0x01);
> > +	c = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, AP_AUX_BUFF_START);
> > +	if (c < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : access AUX BUFF.\n");
> > +		return -EIO;
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, " EDID Block = %d\n", c + 1);
> > +
> > +	if (c > MAX_EDID_BLOCK)
> > +		c = 1;
> > +
> > +	return c;
> > +}
> > +
> > +static int edid_read(struct anx7625_data *ctx,
> > +		     u8 offset, u8 *pblock_buf)
> > +{
> > +	int ret, cnt;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	for (cnt = 0; cnt <= EDID_TRY_CNT; cnt++) {
> > +		sp_tx_aux_wr(ctx, offset);
> > +		/* Set I2C read com 0x01 mot = 0 and read 16 bytes */
> > +		ret = sp_tx_aux_rd(ctx, 0xf1);
> > +
> > +		if (ret) {
> > +			sp_tx_rst_aux(ctx);
> > +			DRM_DEV_DEBUG_DRIVER(dev, "edid read fail, reset!\n");
> > +		} else {
> > +			ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > +						     AP_AUX_BUFF_START,
> > +						     MAX_DPCD_BUFFER_SIZE,
> > +						     pblock_buf);
> > +			if (ret > 0)
> > +				break;
> > +		}
> > +	}
> > +
> > +	if (cnt > EDID_TRY_CNT)
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +static int segments_edid_read(struct anx7625_data *ctx,
> > +			      u8 segment, u8 *buf, u8 offset)
> > +{
> > +	u8 cnt;
> > +	int ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* Write address only */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_ADDR_7_0, 0x30);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_COMMAND, 0x04);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_CTRL_STATUS,
> > +				 AP_AUX_CTRL_ADDRONLY | AP_AUX_CTRL_OP_EN);
> > +
> > +	ret |= wait_aux_op_finish(ctx);
> > +	/* Write segment address */
> > +	ret |= sp_tx_aux_wr(ctx, segment);
> > +	/* Data read */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_ADDR_7_0, 0x50);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "IO error : aux initial fail.\n");
> > +		return ret;
> > +	}
> > +
> > +	for (cnt = 0; cnt <= EDID_TRY_CNT; cnt++) {
> > +		sp_tx_aux_wr(ctx, offset);
> > +		/* Set I2C read com 0x01 mot = 0 and read 16 bytes */
> > +		ret = sp_tx_aux_rd(ctx, 0xf1);
> > +
> > +		if (ret) {
> > +			ret = sp_tx_rst_aux(ctx);
> > +			DRM_DEV_ERROR(dev, "segment read fail, reset!\n");
> > +		} else {
> > +			ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> > +						     AP_AUX_BUFF_START,
> > +						     MAX_DPCD_BUFFER_SIZE, buf);
> > +			if (ret > 0)
> > +				break;
> > +		}
> > +	}
> > +
> > +	if (cnt > EDID_TRY_CNT)
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +static int sp_tx_edid_read(struct anx7625_data *ctx,
> > +			   u8 *pedid_blocks_buf)
> > +{
> > +	u8 offset, edid_pos;
> > +	int count, blocks_num;
> > +	u8 pblock_buf[MAX_DPCD_BUFFER_SIZE];
> > +	u8 i, j;
> > +	u8 g_edid_break = 0;
> > +	int ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* Address initial */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				AP_AUX_ADDR_7_0, 0x50);
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_ADDR_15_8, 0);
> > +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AUX_ADDR_19_16, 0xf0);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "access aux channel IO error.\n");
> > +		return -EIO;
> > +	}
> > +
> > +	blocks_num = sp_tx_get_edid_block(ctx);
> > +	if (blocks_num < 0)
> > +		return blocks_num;
> > +
> > +	count = 0;
> > +
> > +	do {
> > +		switch (count) {
> > +		case 0:
> > +		case 1:
> > +			for (i = 0; i < 8; i++) {
> > +				offset = (i + count * 8) * MAX_DPCD_BUFFER_SIZE;
> > +				g_edid_break = edid_read(ctx, offset,
> > +							 pblock_buf);
> > +
> > +				if (g_edid_break)
> > +					break;
> > +
> > +				memcpy(&pedid_blocks_buf[offset],
> > +				       pblock_buf,
> > +				       MAX_DPCD_BUFFER_SIZE);
> > +			}
> > +
> > +			break;
> > +		case 2:
> > +			offset = 0x00;
> > +
> > +			for (j = 0; j < 8; j++) {
> > +				edid_pos = (j + count * 8) *
> > +					MAX_DPCD_BUFFER_SIZE;
> > +
> > +				if (g_edid_break == 1)
> > +					break;
> > +
> > +				segments_edid_read(ctx, count / 2,
> > +						   pblock_buf, offset);
> > +				memcpy(&pedid_blocks_buf[edid_pos],
> > +				       pblock_buf,
> > +				       MAX_DPCD_BUFFER_SIZE);
> > +				offset = offset + 0x10;
> > +			}
> > +
> > +			break;
> > +		case 3:
> > +			offset = 0x80;
> > +
> > +			for (j = 0; j < 8; j++) {
> > +				edid_pos = (j + count * 8) *
> > +					MAX_DPCD_BUFFER_SIZE;
> > +				if (g_edid_break == 1)
> > +					break;
> > +
> > +				segments_edid_read(ctx, count / 2,
> > +						   pblock_buf, offset);
> > +				memcpy(&pedid_blocks_buf[edid_pos],
> > +				       pblock_buf,
> > +				       MAX_DPCD_BUFFER_SIZE);
> > +				offset = offset + 0x10;
> > +			}
> > +
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +
> > +		count++;
> > +
> > +	} while (blocks_num >= count);
> > +
> > +	/* Check edid data */
> > +	if (!drm_edid_is_valid((struct edid *)pedid_blocks_buf)) {
> > +		DRM_DEV_ERROR(dev, "WARNING! edid check fail!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Reset aux channel */
> > +	sp_tx_rst_aux(ctx);
> > +
> > +	return (blocks_num + 1);
> > +}
> > +
> > +static void anx7625_power_on(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	if (!ctx->pdata.low_power_mode) {
> > +		DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> > +		return;
> > +	}
> > +
> > +	/* Power on pin enable */
> > +	gpiod_set_value(ctx->pdata.gpio_p_on, 1);
> > +	usleep_range(10000, 11000);
> > +	/* Power reset pin enable */
> > +	gpiod_set_value(ctx->pdata.gpio_reset, 1);
> > +	usleep_range(10000, 11000);
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "power on !\n");
> > +}
> > +
> > +static void anx7625_power_standby(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	if (!ctx->pdata.low_power_mode) {
> > +		DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> > +		return;
> > +	}
> > +
> > +	gpiod_set_value(ctx->pdata.gpio_reset, 0);
> > +	usleep_range(1000, 1100);
> > +	gpiod_set_value(ctx->pdata.gpio_p_on, 0);
> > +	usleep_range(1000, 1100);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "power down\n");
> > +}
> > +
> > +/* Basic configurations of ANX7625 */
> > +static void anx7625_config(struct anx7625_data *ctx)
> > +{
> > +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +			  XTAL_FRQ_SEL, XTAL_FRQ_27M);
> > +}
> > +
> > +static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	/* Reset main ocm */
> > +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x40);
> > +	/* Disable PD */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				 AP_AV_STATUS, AP_DISABLE_PD);
> > +	/* Release main ocm */
> > +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x00);
> > +
> > +	if (ret < 0)
> > +		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature fail.\n");
> > +	else
> > +		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature succeeded.\n");
> > +}
> > +
> > +static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
> > +{
> > +	int ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* Check interface workable */
> > +	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
> > +			       FLASH_LOAD_STA);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "IO error : access flash load.\n");
> > +		return ret;
> > +	}
> > +	if ((ret & FLASH_LOAD_STA_CHK) != FLASH_LOAD_STA_CHK)
> > +		return -ENODEV;
> > +
> > +	anx7625_disable_pd_protocol(ctx);
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "Firmware ver %02x%02x,",
> > +			     anx7625_reg_read(ctx,
> > +					      ctx->i2c.rx_p0_client,
> > +					      OCM_FW_VERSION),
> > +			     anx7625_reg_read(ctx,
> > +					      ctx->i2c.rx_p0_client,
> > +					      OCM_FW_REVERSION));
> > +	DRM_DEV_DEBUG_DRIVER(dev, "Driver version %s\n",
> > +			     ANX7625_DRV_VERSION);
> > +
> > +	return 0;
> > +}
> > +
> > +static void anx7625_power_on_init(struct anx7625_data *ctx)
> > +{
> > +	int retry_count, i;
> > +
> > +	for (retry_count = 0; retry_count < 3; retry_count++) {
> > +		anx7625_power_on(ctx);
> > +		anx7625_config(ctx);
> > +
> > +		for (i = 0; i < OCM_LOADING_TIME; i++) {
> > +			if (!anx7625_ocm_loading_check(ctx))
> > +				return;
> > +			usleep_range(1000, 1100);
> > +		}
> > +		anx7625_power_standby(ctx);
> > +	}
> > +}
> > +
> > +static void anx7625_chip_control(struct anx7625_data *ctx, int state)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "before set, power_state(%d).\n",
> > +			     atomic_read(&ctx->power_status));
> > +
> > +	if (!ctx->pdata.low_power_mode)
> > +		return;
> > +
> > +	if (state) {
> > +		atomic_inc(&ctx->power_status);
> > +		if (atomic_read(&ctx->power_status) == 1)
> > +			anx7625_power_on_init(ctx);
> > +	} else {
> > +		if (atomic_read(&ctx->power_status)) {
> > +			atomic_dec(&ctx->power_status);
> > +
> > +			if (atomic_read(&ctx->power_status) == 0)
> > +				anx7625_power_standby(ctx);
> > +		}
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "after set, power_state(%d).\n",
> > +			     atomic_read(&ctx->power_status));
> > +}
> > +
> > +static void anx7625_init_gpio(struct anx7625_data *platform)
> > +{
> > +	struct device *dev = &platform->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "init gpio\n");
> > +
> > +	/* Gpio for chip power enable */
> > +	platform->pdata.gpio_p_on =
> > +		devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> > +	/* Gpio for chip reset */
> > +	platform->pdata.gpio_reset =
> > +		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > +
> > +	if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
> > +		platform->pdata.low_power_mode = 1;
> > +		DRM_DEV_DEBUG_DRIVER(dev, "low power mode, pon %d, reset %d.\n",
> > +				     desc_to_gpio(platform->pdata.gpio_p_on),
> > +				     desc_to_gpio(platform->pdata.gpio_reset));
> > +	} else {
> > +		platform->pdata.low_power_mode = 0;
> > +		DRM_DEV_DEBUG_DRIVER(dev, "not low power mode.\n");
> > +	}
> > +}
> > +
> > +static void anx7625_stop_dp_work(struct anx7625_data *ctx)
> > +{
> > +	ctx->hpd_status = 0;
> > +	ctx->hpd_high_cnt = 0;
> > +	ctx->display_timing_valid = 0;
> > +
> > +	ctx->slimport_edid_p.edid_block_num = -1;
> > +
> > +	if (ctx->pdata.low_power_mode == 0)
> > +		anx7625_disable_pd_protocol(ctx);
> > +}
> > +
> > +static void anx7625_start_dp_work(struct anx7625_data *ctx)
> > +{
> > +	int ret;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	if (ctx->hpd_high_cnt >= 2) {
> > +		DRM_DEV_DEBUG_DRIVER(dev, "filter useless HPD\n");
> > +		return;
> > +	}
> > +
> > +	ctx->hpd_high_cnt++;
> > +
> > +	/* Not support HDCP */
> > +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > +
> > +	/* Try auth flag */
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
> > +	/* Interrupt for DRM */
> > +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
> > +	if (ret < 0)
> > +		return;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "Secure OCM version=%02x\n", ret);
> > +}
> > +
> > +static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
> > +{
> > +	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
> > +}
> > +
> > +static void anx7625_hpd_polling(struct anx7625_data *ctx)
> > +{
> > +	int ret, val;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	if (atomic_read(&ctx->power_status) != 1) {
> > +		DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
> > +		return;
> > +	}
> > +
> > +	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
> > +				 ctx, val,
> > +				 ((val & HPD_STATUS) || (val < 0)),
> > +				 5000,
> > +				 5000 * 100);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "HPD polling timeout!\n");
> > +	} else {
> > +		DRM_DEV_DEBUG_DRIVER(dev, "HPD raise up.\n");
> > +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
> > +				  INTR_ALERT_1, 0xFF);
> > +		anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				  INTERFACE_CHANGE_INT, 0);
> > +	}
> > +
> > +	anx7625_start_dp_work(ctx);
> > +}
> > +
> > +static void anx7625_disconnect_check(struct anx7625_data *ctx)
> > +{
> > +	if (atomic_read(&ctx->power_status) == 0)
> > +		anx7625_stop_dp_work(ctx);
> > +}
> > +
> > +static void anx7625_low_power_mode_check(struct anx7625_data *ctx,
> > +					 int state)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "low power mode check, state(%d).\n", state);
> > +
> > +	if (ctx->pdata.low_power_mode) {
> > +		anx7625_chip_control(ctx, state);
> > +		if (state)
> > +			anx7625_hpd_polling(ctx);
> > +		else
> > +			anx7625_disconnect_check(ctx);
> > +	}
> > +}
> > +
> > +static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	/* HPD changed */
> > +	DRM_DEV_DEBUG_DRIVER(dev, "dp_hpd_change_default_func: %d\n",
> > +			     (u32)on);
> > +
> > +	if (on == 0) {
> > +		DRM_DEV_DEBUG_DRIVER(dev, " HPD low\n");
> > +		anx7625_stop_dp_work(ctx);
> > +	} else {
> > +		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
> > +		anx7625_start_dp_work(ctx);
> > +	}
> > +
> > +	ctx->hpd_status = 1;
> > +}
> > +
> > +static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> > +{
> > +	int intr_vector, status;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "power_status=%d\n",
> > +			     (u32)atomic_read(&ctx->power_status));
> > +
> > +	status = anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
> > +				   INTR_ALERT_1, 0xFF);
> > +	if (status < 0) {
> > +		DRM_DEV_ERROR(dev, "cannot clear alert reg.\n");
> > +		return status;
> > +	}
> > +
> > +	intr_vector = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
> > +				       INTERFACE_CHANGE_INT);
> > +	if (intr_vector < 0) {
> > +		DRM_DEV_ERROR(dev, "cannot access interrupt change reg.\n");
> > +		return intr_vector;
> > +	}
> > +	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x44=%x\n", intr_vector);
> > +	status = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > +				   INTERFACE_CHANGE_INT,
> > +				   intr_vector & (~intr_vector));
> > +	if (status < 0) {
> > +		DRM_DEV_ERROR(dev, "cannot clear interrupt change reg.\n");
> > +		return status;
> > +	}
> > +
> > +	if (!(intr_vector & HPD_STATUS_CHANGE))
> > +		return -ENOENT;
> > +
> > +	status = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
> > +				  SYSTEM_STSTUS);
> > +	if (status < 0) {
> > +		DRM_DEV_ERROR(dev, "cannot clear interrupt status.\n");
> > +		return status;
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x45=%x\n", status);
> > +	dp_hpd_change_handler(ctx, status & HPD_STATUS);
> > +
> > +	return 0;
> > +}
> > +
> > +static void anx7625_work_func(struct work_struct *work)
> > +{
> > +	int event;
> > +	struct anx7625_data *ctx = container_of(work,
> > +						struct anx7625_data, work);
> > +
> > +	mutex_lock(&ctx->lock);
> > +	event = anx7625_hpd_change_detect(ctx);
> > +	mutex_unlock(&ctx->lock);
> > +	if (event < 0)
> > +		return;
> > +
> > +	if (ctx->bridge_attached)
> > +		drm_helper_hpd_irq_event(ctx->connector.dev);
> > +}
> > +
> > +static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> > +{
> > +	struct anx7625_data *ctx = (struct anx7625_data *)data;
> > +
> > +	if (atomic_read(&ctx->power_status) != 1)
> > +		return IRQ_NONE;
> > +
> > +	queue_work(ctx->workqueue, &ctx->work);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int anx7625_parse_dt(struct device *dev,
> > +			    struct anx7625_platform_data *pdata)
> > +{
> > +	struct device_node *np = dev->of_node;
> > +	struct device_node *panel_node, *out_ep;
> > +
> > +	pdata->node.mipi_dsi_host_node = of_graph_get_remote_node(np, 0, 0);
> > +	if (!pdata->node.mipi_dsi_host_node) {
> > +		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > +		return -EPROBE_DEFER;
> > +	}
> > +
> > +	of_node_put(pdata->node.mipi_dsi_host_node);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > +
> > +	pdata->node.panel_node = of_graph_get_port_by_id(np, 1);
> > +	if (!pdata->node.panel_node) {
> > +		DRM_DEV_ERROR(dev, "fail to get panel node.\n");
> > +		return -EPROBE_DEFER;
> > +	}
> > +
> > +	of_node_put(pdata->node.panel_node);
> > +	out_ep = of_get_child_by_name(pdata->node.panel_node,
> > +				      "endpoint");
> > +	if (!out_ep) {
> > +		DRM_DEV_DEBUG_DRIVER(dev, "cannot get endpoint.\n");
> > +		return -EPROBE_DEFER;
> > +	}
> > +
> > +	panel_node = of_graph_get_remote_port_parent(out_ep);
> > +	of_node_put(out_ep);
> > +	pdata->panel = of_drm_find_panel(panel_node);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "get panel node.\n");
> > +
> > +	of_node_put(panel_node);
> > +	if (IS_ERR_OR_NULL(pdata->panel))
> > +		return -EPROBE_DEFER;
> > +
> > +	return 0;
> > +}
> > +
> > +static inline struct anx7625_data *connector_to_anx7625(struct drm_connector *c)
> > +{
> > +	return container_of(c, struct anx7625_data, connector);
> > +}
> > +
> > +static inline struct anx7625_data *bridge_to_anx7625(struct drm_bridge *bridge)
> > +{
> > +	return container_of(bridge, struct anx7625_data, bridge);
> > +}
> > +
> > +static void anx7625_post_disable(struct drm_bridge *bridge)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "post disable\n");
> > +
> > +	if (!ctx->pdata.panel)
> > +		return;
> > +
> > +	ret = drm_panel_unprepare(ctx->pdata.panel);
> > +	if (ret)
> > +		DRM_DEV_ERROR(dev, "fail to unprepare panel: %d\n", ret);
> > +	else
> > +		DRM_DEV_DEBUG_DRIVER(dev, "backlight unprepared.\n");
> > +
> > +	atomic_set(&ctx->panel_power, 0);
> > +}
> > +
> > +static void anx7625_pre_enable(struct drm_bridge *bridge)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "pre enable\n");
> > +
> > +	if (!ctx->pdata.panel)
> > +		return;
> > +
> > +	ret = drm_panel_prepare(ctx->pdata.panel);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(dev, "fail to prepare panel: %d\n", ret);
> > +	else
> > +		DRM_DEV_DEBUG_DRIVER(dev, "backlight prepared.\n");
> > +	atomic_set(&ctx->panel_power, 1);
> > +}
> > +
> > +static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
> > +{
> > +	int turn_off_flag = 0;
> > +	struct device *dev = &ctx->client->dev;
> > +	struct s_edid_data *p_edid = &ctx->slimport_edid_p;
> > +
> > +	if (ctx->slimport_edid_p.edid_block_num > 0)
> > +		return (struct edid *)&ctx->slimport_edid_p.edid_raw_data;
> > +
> > +	if (ctx->pdata.panel && atomic_read(&ctx->panel_power) == 0) {
> > +		turn_off_flag = 1;
> > +		anx7625_pre_enable(&ctx->bridge);
> > +	}
> > +
> > +	anx7625_low_power_mode_check(ctx, 1);
> > +	p_edid->edid_block_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
> > +	anx7625_low_power_mode_check(ctx, 0);
> > +
> > +	if (ctx->pdata.panel && turn_off_flag == 1)
> > +		anx7625_post_disable(&ctx->bridge);
> > +
> > +	if (p_edid->edid_block_num < 1) {
> > +		DRM_DEV_ERROR(dev, "Fail to read EDID.\n");
> > +		return NULL;
> > +	}
> > +
> > +	return (struct edid *)&ctx->slimport_edid_p.edid_raw_data;
> > +}
> > +
> > +static int anx7625_get_modes(struct drm_connector *connector)
> > +{
> > +	struct anx7625_data *ctx = connector_to_anx7625(connector);
> > +	int err, num_modes;
> > +	struct edid *p_edid;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm get modes\n");
> > +
> > +	p_edid = anx7625_get_edid(ctx);
> > +	if (!p_edid) {
> > +		DRM_DEV_ERROR(dev, "Fail to get EDID\n");
> > +		return -EIO;
> > +	}
> > +
> > +	err = drm_connector_update_edid_property(connector, p_edid);
> > +	if (err) {
> > +		DRM_DEV_ERROR(dev, "Fail to update EDID property: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	num_modes = drm_add_edid_modes(connector, p_edid);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "num_modes(%d)\n", num_modes);
> > +
> > +	return num_modes;
> > +}
> > +
> > +static enum drm_mode_status
> > +anx7625_connector_mode_valid(struct drm_connector *connector,
> > +			     struct drm_display_mode *mode)
> > +{
> > +	struct anx7625_data *ctx = connector_to_anx7625(connector);
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm modes valid verify\n");
> > +
> > +	if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static struct drm_connector_helper_funcs anx7625_connector_helper_funcs = {
> > +	.get_modes = anx7625_get_modes,
> > +	.mode_valid = anx7625_connector_mode_valid,
> > +};
> > +
> > +static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> > +{
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
> > +
> > +	return connector_status_connected;
> > +}
> > +
> > +static enum drm_connector_status anx7625_detect(struct drm_connector *connector,
> > +						bool force)
> > +{
> > +	struct anx7625_data *ctx = connector_to_anx7625(connector);
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm connector detect\n");
> > +
> > +	return anx7625_sink_detect(ctx);
> > +}
> > +
> > +static const struct drm_connector_funcs anx7625_connector_funcs = {
> > +	.fill_modes = drm_helper_probe_single_connector_modes,
> > +	.detect = anx7625_detect,
> > +	.destroy = drm_connector_cleanup,
> > +	.reset = drm_atomic_helper_connector_reset,
> > +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int anx7625_attach_dsi(struct anx7625_data *ctx)
> > +{
> > +	struct mipi_dsi_host *host;
> > +	struct mipi_dsi_device *dsi;
> > +	struct device_node *mipi_host_node;
> > +	struct device *dev = &ctx->client->dev;
> > +	const struct mipi_dsi_device_info info = {
> > +		.type = "anx7625",
> > +		.channel = 0,
> > +		.node = NULL,
> > +	};
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "attach dsi\n");
> > +
> > +	mipi_host_node = ctx->pdata.node.mipi_dsi_host_node;
> > +
> > +	if (!mipi_host_node) {
> > +		DRM_DEV_ERROR(dev, "dsi host is not configured.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	host = of_find_mipi_dsi_host_by_node(mipi_host_node);
> > +	if (!host) {
> > +		DRM_DEV_ERROR(dev, "fail to find dsi host.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dsi = mipi_dsi_device_register_full(host, &info);
> > +	if (IS_ERR(dsi)) {
> > +		DRM_DEV_ERROR(dev, "fail to create dsi device.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dsi->lanes = 4;
> > +	dsi->format = MIPI_DSI_FMT_RGB888;
> > +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
> > +		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> > +		MIPI_DSI_MODE_EOT_PACKET	|
> > +		MIPI_DSI_MODE_VIDEO_HSE;
> > +
> > +	if (mipi_dsi_attach(dsi) < 0) {
> > +		DRM_DEV_ERROR(dev, "fail to attach dsi to host.\n");
> > +		mipi_dsi_device_unregister(dsi);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ctx->dsi = dsi;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "attach dsi succeeded.\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static void anx7625_bridge_detach(struct drm_bridge *bridge)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +
> > +	if (ctx->dsi) {
> > +		mipi_dsi_detach(ctx->dsi);
> > +		mipi_dsi_device_unregister(ctx->dsi);
> > +	}
> > +
> > +	if (ctx->bridge_attached)
> > +		drm_connector_unregister(&ctx->connector);
> > +}
> > +
> > +static int anx7625_bridge_attach(struct drm_bridge *bridge,
> > +				 enum drm_bridge_attach_flags flags)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	int err;
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm attach\n");
> > +	if (!bridge->encoder) {
> > +		DRM_DEV_ERROR(dev, "Parent encoder object not found");
> > +		return -ENODEV;
> > +	}
> > +
> > +	err = drm_connector_init(bridge->dev, &ctx->connector,
> > +				 &anx7625_connector_funcs,
> > +				 DRM_MODE_CONNECTOR_eDP);
> > +	if (err) {
> > +		DRM_DEV_ERROR(dev, "Fail to initialize connector: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	drm_connector_helper_add(&ctx->connector,
> > +				 &anx7625_connector_helper_funcs);
> > +
> > +	err = drm_connector_register(&ctx->connector);
> > +	if (err) {
> > +		DRM_DEV_ERROR(dev, "Fail to register connector: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > +
> > +	err = drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
> > +	if (err) {
> > +		DRM_DEV_ERROR(dev, "Fail to attach encoder: %d\n", err);
> > +		drm_connector_unregister(&ctx->connector);
> > +		return err;
> > +	}
> > +
> > +	err = anx7625_attach_dsi(ctx);
> > +	if (err) {
> > +		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
> > +		drm_connector_unregister(&ctx->connector);
> > +		return err;
> > +	}
> > +
> > +	ctx->bridge_attached = 1;
> > +
> > +	return 0;
> > +}
> > +
> > +static enum drm_mode_status
> > +anx7625_bridge_mode_valid(struct drm_bridge *bridge,
> > +			  const struct drm_display_mode *mode)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> > +
> > +	/* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> > +	if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > +		DRM_DEV_DEBUG_DRIVER(dev,
> > +				     "drm mode invalid, pixelclock too high.\n");
> > +		return MODE_CLOCK_HIGH;
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm mode valid.\n");
> > +
> > +	return MODE_OK;
> > +}
> > +
> > +static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
> > +				    const struct drm_display_mode *old_mode,
> > +				    const struct drm_display_mode *mode)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm mode set\n");
> > +
> > +	ctx->dt.pixelclock.min = mode->clock;
> > +	ctx->dt.hactive.min = mode->hdisplay;
> > +	ctx->dt.hsync_len.min = mode->hsync_end - mode->hsync_start;
> > +	ctx->dt.hfront_porch.min = mode->hsync_start - mode->hdisplay;
> > +	ctx->dt.hback_porch.min = mode->htotal - mode->hsync_end;
> > +	ctx->dt.vactive.min = mode->vdisplay;
> > +	ctx->dt.vsync_len.min = mode->vsync_end - mode->vsync_start;
> > +	ctx->dt.vfront_porch.min = mode->vsync_start - mode->vdisplay;
> > +	ctx->dt.vback_porch.min = mode->vtotal - mode->vsync_end;
> > +
> > +	ctx->display_timing_valid = 1;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "pixelclock(%d).\n", ctx->dt.pixelclock.min);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "hactive(%d), hsync(%d), hfp(%d), hbp(%d)\n",
> > +			     ctx->dt.hactive.min,
> > +			     ctx->dt.hsync_len.min,
> > +			     ctx->dt.hfront_porch.min,
> > +			     ctx->dt.hback_porch.min);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "vactive(%d), vsync(%d), vfp(%d), vbp(%d)\n",
> > +			     ctx->dt.vactive.min,
> > +			     ctx->dt.vsync_len.min,
> > +			     ctx->dt.vfront_porch.min,
> > +			     ctx->dt.vback_porch.min);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "hdisplay(%d),hsync_start(%d).\n",
> > +			     mode->hdisplay,
> > +			     mode->hsync_start);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "hsync_end(%d),htotal(%d).\n",
> > +			     mode->hsync_end,
> > +			     mode->htotal);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "vdisplay(%d),vsync_start(%d).\n",
> > +			     mode->vdisplay,
> > +			     mode->vsync_start);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "vsync_end(%d),vtotal(%d).\n",
> > +			     mode->vsync_end,
> > +			     mode->vtotal);
> > +}
> > +
> > +static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> > +				      const struct drm_display_mode *mode,
> > +				      struct drm_display_mode *adj)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +	u32 hsync, hfp, hbp, hblanking;
> > +	u32 adj_hsync, adj_hfp, adj_hbp, adj_hblanking, delta_adj;
> > +	u32 vref, adj_clock;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> > +
> > +	hsync = mode->hsync_end - mode->hsync_start;
> > +	hfp = mode->hsync_start - mode->hdisplay;
> > +	hbp = mode->htotal - mode->hsync_end;
> > +	hblanking = mode->htotal - mode->hdisplay;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "before mode fixup\n");
> > +	DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
> > +			     hsync, hfp, hbp, adj->clock);
> > +	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
> > +			     adj->hsync_start, adj->hsync_end, adj->htotal);
> > +
> > +	adj_hfp = hfp;
> > +	adj_hsync = hsync;
> > +	adj_hbp = hbp;
> > +	adj_hblanking = hblanking;
> > +
> > +	/* HFP needs to be even */
> > +	if (hfp & 0x1) {
> > +		adj_hfp += 1;
> > +		adj_hblanking += 1;
> > +	}
> > +
> > +	/* HBP needs to be even */
> > +	if (hbp & 0x1) {
> > +		adj_hbp -= 1;
> > +		adj_hblanking -= 1;
> > +	}
> > +
> > +	/* HSYNC needs to be even */
> > +	if (hsync & 0x1) {
> > +		if (adj_hblanking < hblanking)
> > +			adj_hsync += 1;
> > +		else
> > +			adj_hsync -= 1;
> > +	}
> > +
> > +	/*
> > +	 * Once illegal timing detected, use default HFP, HSYNC, HBP
> > +	 * This adjusting made for built-in eDP panel, for the externel
> > +	 * DP monitor, may need return false.
> > +	 */
> > +	if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
> > +		adj_hsync = SYNC_LEN_DEF;
> > +		adj_hfp = HFP_HBP_DEF;
> > +		adj_hbp = HFP_HBP_DEF;
> > +		vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> > +		if (hblanking < HBLANKING_MIN) {
> > +			delta_adj = HBLANKING_MIN - hblanking;
> > +			adj_clock = vref * delta_adj * adj->vtotal;
> > +			adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> > +		} else {
> > +			delta_adj = hblanking - HBLANKING_MIN;
> > +			adj_clock = vref * delta_adj * adj->vtotal;
> > +			adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> > +		}
> > +
> > +		DRM_WARN("illegal hblanking timing, use default.\n");
> > +		DRM_WARN("hfp(%d), hbp(%d), hsync(%d).\n", hfp, hbp, hsync);
> > +	} else if (adj_hfp < HP_MIN) {
> > +		/* Adjust hfp if hfp less than HP_MIN */
> > +		delta_adj = HP_MIN - adj_hfp;
> > +		adj_hfp = HP_MIN;
> > +
> > +		/*
> > +		 * Balance total HBlanking pixel, if HBP does not have enough
> > +		 * space, adjust HSYNC length, otherwise adjust HBP
> > +		 */
> > +		if ((adj_hbp - delta_adj) < HP_MIN)
> > +			/* HBP not enough space */
> > +			adj_hsync -= delta_adj;
> > +		else
> > +			adj_hbp -= delta_adj;
> > +	} else if (adj_hbp < HP_MIN) {
> > +		delta_adj = HP_MIN - adj_hbp;
> > +		adj_hbp = HP_MIN;
> > +
> > +		/*
> > +		 * Balance total HBlanking pixel, if HBP hasn't enough space,
> > +		 * adjust HSYNC length, otherwize adjust HBP
> > +		 */
> > +		if ((adj_hfp - delta_adj) < HP_MIN)
> > +			/* HFP not enough space */
> > +			adj_hsync -= delta_adj;
> > +		else
> > +			adj_hfp -= delta_adj;
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
> > +	DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
> > +			     adj_hsync, adj_hfp, adj_hbp, adj->clock);
> > +
> > +	/* Reconstruct timing */
> > +	adj->hsync_start = adj->hdisplay + adj_hfp;
> > +	adj->hsync_end = adj->hsync_start + adj_hsync;
> > +	adj->htotal = adj->hsync_end + adj_hbp;
> > +	DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
> > +			     adj->hsync_start, adj->hsync_end, adj->htotal);
> > +
> > +	return true;
> > +}
> > +
> > +static void anx7625_bridge_enable(struct drm_bridge *bridge)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
> > +
> > +	anx7625_low_power_mode_check(ctx, 1);
> > +
> > +	if (WARN_ON(!atomic_read(&ctx->power_status)))
> > +		return;
> > +
> > +	if (ctx->pdata.panel) {
> > +		ret = drm_panel_enable(ctx->pdata.panel);
> > +		if (ret < 0) {
> > +			DRM_DEV_ERROR(dev, "fail to enable panel: %d.\n", ret);
> > +			return;
> > +		}
> > +	}
> > +
> > +	anx7625_dp_start(ctx);
> > +}
> > +
> > +static void anx7625_bridge_disable(struct drm_bridge *bridge)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +	int ret;
> > +
> > +	if (WARN_ON(!atomic_read(&ctx->power_status)))
> > +		return;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
> > +
> > +	if (ctx->pdata.panel) {
> > +		ret = drm_panel_disable(ctx->pdata.panel);
> > +		if (ret < 0)
> > +			DRM_DEV_ERROR(dev, "fail to disable panel: %d.\n", ret);
> > +	}
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
> > +
> > +	anx7625_dp_stop(ctx);
> > +
> > +	anx7625_low_power_mode_check(ctx, 0);
> > +}
> > +
> > +static enum drm_connector_status
> > +anx7625_bridge_detect(struct drm_bridge *bridge)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
> > +
> > +	return anx7625_sink_detect(ctx);
> > +}
> > +
> > +static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
> > +					    struct drm_connector *connector)
> > +{
> > +	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > +	struct device *dev = &ctx->client->dev;
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge get edid\n");
> > +
> > +	return anx7625_get_edid(ctx);
> > +}
> > +
> > +static const struct drm_bridge_funcs anx7625_bridge_funcs = {
> > +	.attach = anx7625_bridge_attach,
> > +	.detach = anx7625_bridge_detach,
> > +	.disable = anx7625_bridge_disable,
> > +	.post_disable = anx7625_post_disable,
> > +	.pre_enable = anx7625_pre_enable,
> > +	.mode_valid = anx7625_bridge_mode_valid,
> > +	.mode_set = anx7625_bridge_mode_set,
> > +	.mode_fixup = anx7625_bridge_mode_fixup,
> > +	.enable = anx7625_bridge_enable,
> > +	.detect = anx7625_bridge_detect,
> > +	.get_edid = anx7625_bridge_get_edid,
> > +};
> > +
> > +static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
> > +					      struct i2c_client *client)
> > +{
> > +	ctx->i2c.tx_p0_client = i2c_new_dummy_device(client->adapter,
> > +						     TX_P0_ADDR >> 1);
> > +	if (!ctx->i2c.tx_p0_client)
> > +		return -ENOMEM;
> > +
> > +	ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
> > +						     TX_P1_ADDR >> 1);
> > +	if (!ctx->i2c.tx_p1_client)
> > +		goto free_tx_p0;
> > +
> > +	ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
> > +						     TX_P2_ADDR >> 1);
> > +	if (!ctx->i2c.tx_p2_client)
> > +		goto free_tx_p1;
> > +
> > +	ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
> > +						     RX_P0_ADDR >> 1);
> > +	if (!ctx->i2c.rx_p0_client)
> > +		goto free_tx_p2;
> > +
> > +	ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
> > +						     RX_P1_ADDR >> 1);
> > +	if (!ctx->i2c.rx_p1_client)
> > +		goto free_rx_p0;
> > +
> > +	ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
> > +						     RX_P2_ADDR >> 1);
> > +	if (!ctx->i2c.rx_p2_client)
> > +		goto free_rx_p1;
> > +
> > +	ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
> > +						    TCPC_INTERFACE_ADDR >> 1);
> > +	if (!ctx->i2c.tcpc_client)
> > +		goto free_rx_p2;
> > +
> > +	return 0;
> > +
> > +free_rx_p2:
> > +	i2c_unregister_device(ctx->i2c.rx_p2_client);
> > +free_rx_p1:
> > +	i2c_unregister_device(ctx->i2c.rx_p1_client);
> > +free_rx_p0:
> > +	i2c_unregister_device(ctx->i2c.rx_p0_client);
> > +free_tx_p2:
> > +	i2c_unregister_device(ctx->i2c.tx_p2_client);
> > +free_tx_p1:
> > +	i2c_unregister_device(ctx->i2c.tx_p1_client);
> > +free_tx_p0:
> > +	i2c_unregister_device(ctx->i2c.tx_p0_client);
> > +
> > +	return -ENOMEM;
> > +}
> > +
> > +static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
> > +{
> > +	i2c_unregister_device(ctx->i2c.tx_p0_client);
> > +	i2c_unregister_device(ctx->i2c.tx_p1_client);
> > +	i2c_unregister_device(ctx->i2c.tx_p2_client);
> > +	i2c_unregister_device(ctx->i2c.rx_p0_client);
> > +	i2c_unregister_device(ctx->i2c.rx_p1_client);
> > +	i2c_unregister_device(ctx->i2c.rx_p2_client);
> > +	i2c_unregister_device(ctx->i2c.tcpc_client);
> > +}
> > +
> > +static int anx7625_i2c_probe(struct i2c_client *client,
> > +			     const struct i2c_device_id *id)
> > +{
> > +	struct anx7625_data *platform;
> > +	struct anx7625_platform_data *pdata;
> > +	int ret = 0;
> > +	struct device *dev = &client->dev;
> > +
> > +	if (!i2c_check_functionality(client->adapter,
> > +				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
> > +		DRM_DEV_ERROR(dev, "anx7625's i2c bus doesn't support\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> > +	if (!platform) {
> > +		DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	pdata = &platform->pdata;
> > +
> > +	ret = anx7625_parse_dt(dev, pdata);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev, "fail to parse devicetree.\n");
> > +		goto free_platform;
> > +	}
> > +
> > +	platform->client = client;
> > +	i2c_set_clientdata(client, platform);
> > +
> > +	anx7625_init_gpio(platform);
> > +
> > +	atomic_set(&platform->power_status, 0);
> > +
> > +	mutex_init(&platform->lock);
> > +
> > +	platform->pdata.intp_irq = client->irq;
> > +	if (platform->pdata.intp_irq) {
> > +		INIT_WORK(&platform->work, anx7625_work_func);
> > +		platform->workqueue = create_workqueue("anx7625_work");
> > +		if (!platform->workqueue) {
> > +			DRM_DEV_ERROR(dev, "fail to create work queue\n");
> > +			ret = -ENOMEM;
> > +			goto free_platform;
> > +		}
> > +
> > +		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
> > +						NULL, anx7625_intr_hpd_isr,
> > +						IRQF_TRIGGER_FALLING |
> > +						IRQF_ONESHOT,
> > +						"anx7625-intp", platform);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev, "fail to request irq\n");
> > +			goto free_wq;
> > +		}
> > +	}
> > +
> > +	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
> > +		ret = -ENOMEM;
> > +		DRM_DEV_ERROR(dev, "fail to reserve I2C bus.\n");
> > +		goto free_wq;
> > +	}
> > +
> > +	if (platform->pdata.low_power_mode == 0) {
> > +		anx7625_disable_pd_protocol(platform);
> > +		atomic_set(&platform->power_status, 1);
> > +	}
> > +
> > +	/* Add work function */
> > +	if (platform->pdata.intp_irq)
> > +		queue_work(platform->workqueue, &platform->work);
> > +
> > +	platform->bridge.funcs = &anx7625_bridge_funcs;
> > +	platform->bridge.of_node = client->dev.of_node;
> > +	drm_bridge_add(&platform->bridge);
> > +
> > +	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
> > +
> > +	return 0;
> > +
> > +free_wq:
> > +	if (platform->workqueue)
> > +		destroy_workqueue(platform->workqueue);
> > +
> > +free_platform:
> > +	kfree(platform);
> > +
> > +	return ret;
> > +}
> > +
> > +static int anx7625_i2c_remove(struct i2c_client *client)
> > +{
> > +	struct anx7625_data *platform = i2c_get_clientdata(client);
> > +
> > +	drm_bridge_remove(&platform->bridge);
> > +
> > +	if (platform->pdata.intp_irq)
> > +		destroy_workqueue(platform->workqueue);
> > +
> > +	anx7625_unregister_i2c_dummy_clients(platform);
> > +
> > +	kfree(platform);
> > +	return 0;
> > +}
> > +
> > +static const struct i2c_device_id anx7625_id[] = {
> > +	{"anx7625", 0},
> > +	{}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, anx7625_id);
> > +
> > +static const struct of_device_id anx_match_table[] = {
> > +	{.compatible = "analogix,anx7625",},
> > +	{},
> > +};
> > +
> > +static struct i2c_driver anx7625_driver = {
> > +	.driver = {
> > +		.name = "anx7625",
> > +		.of_match_table = anx_match_table,
> > +	},
> > +	.probe = anx7625_i2c_probe,
> > +	.remove = anx7625_i2c_remove,
> > +
> > +	.id_table = anx7625_id,
> > +};
> > +
> > +module_i2c_driver(anx7625_driver);
> > +
> > +MODULE_DESCRIPTION("MIPI2DP anx7625 driver");
> > +MODULE_AUTHOR("Xin Ji <xji@analogixsemi.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_VERSION(ANX7625_DRV_VERSION);
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > new file mode 100644
> > index 0000000..79e6534
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -0,0 +1,397 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright(c) 2020, Analogix Semiconductor. All rights reserved.
> > + *
> > + */
> > +
> > +#ifndef __ANX7625_H__
> > +#define __ANX7625_H__
> > +
> > +#define ANX7625_DRV_VERSION "0.1.04"
> > +
> > +/* Loading OCM re-trying times */
> > +#define OCM_LOADING_TIME 10
> > +
> > +/*********  ANX7625 Register  **********/
> > +#define TX_P0_ADDR				0x70
> > +#define TX_P1_ADDR				0x7A
> > +#define TX_P2_ADDR				0x72
> > +
> > +#define RX_P0_ADDR				0x7e
> > +#define RX_P1_ADDR				0x84
> > +#define RX_P2_ADDR				0x54
> > +
> > +#define RSVD_00_ADDR				0x00
> > +#define RSVD_D1_ADDR				0xD1
> > +#define RSVD_60_ADDR				0x60
> > +#define RSVD_39_ADDR				0x39
> > +#define RSVD_7F_ADDR				0x7F
> > +
> > +#define TCPC_INTERFACE_ADDR			0x58
> > +
> > +/* Clock frequency in Hz */
> > +#define XTAL_FRQ        (27 * 1000000)
> > +
> > +#define  POST_DIVIDER_MIN	1
> > +#define  POST_DIVIDER_MAX	16
> > +#define  PLL_OUT_FREQ_MIN	520000000UL
> > +#define  PLL_OUT_FREQ_MAX	730000000UL
> > +#define  PLL_OUT_FREQ_ABS_MIN	300000000UL
> > +#define  PLL_OUT_FREQ_ABS_MAX	800000000UL
> > +#define  MAX_UNSIGNED_24BIT	16777215UL
> > +
> > +/***************************************************************/
> > +/* Register definition of device address 0x58 */
> > +
> > +#define PRODUCT_ID_L 0x02
> > +#define PRODUCT_ID_H 0x03
> > +
> > +#define INTR_ALERT_1  0xCC
> > +#define INTR_SOFTWARE_INT BIT(3)
> > +#define INTR_RECEIVED_MSG BIT(5)
> > +
> > +#define SYSTEM_STSTUS 0x45
> > +#define INTERFACE_CHANGE_INT 0x44
> > +#define HPD_STATUS_CHANGE 0x80
> > +#define HPD_STATUS 0x80
> > +
> > +/******** END of I2C Address 0x58 ********/
> > +
> > +/***************************************************************/
> > +/* Register definition of device address 0x70 */
> > +#define  I2C_ADDR_70_DPTX              0x70
> > +
> > +#define SP_TX_LINK_BW_SET_REG 0xA0
> > +#define SP_TX_LANE_COUNT_SET_REG 0xA1
> > +
> > +#define M_VID_0 0xC0
> > +#define M_VID_1 0xC1
> > +#define M_VID_2 0xC2
> > +#define N_VID_0 0xC3
> > +#define N_VID_1 0xC4
> > +#define N_VID_2 0xC5
> > +
> > +/***************************************************************/
> > +/* Register definition of device address 0x72 */
> > +#define AUX_RST	0x04
> > +#define RST_CTRL2 0x07
> > +
> > +#define SP_TX_TOTAL_LINE_STA_L 0x24
> > +#define SP_TX_TOTAL_LINE_STA_H 0x25
> > +#define SP_TX_ACT_LINE_STA_L 0x26
> > +#define SP_TX_ACT_LINE_STA_H 0x27
> > +#define SP_TX_V_F_PORCH_STA 0x28
> > +#define SP_TX_V_SYNC_STA 0x29
> > +#define SP_TX_V_B_PORCH_STA 0x2A
> > +#define SP_TX_TOTAL_PIXEL_STA_L 0x2B
> > +#define SP_TX_TOTAL_PIXEL_STA_H 0x2C
> > +#define SP_TX_ACT_PIXEL_STA_L 0x2D
> > +#define SP_TX_ACT_PIXEL_STA_H 0x2E
> > +#define SP_TX_H_F_PORCH_STA_L 0x2F
> > +#define SP_TX_H_F_PORCH_STA_H 0x30
> > +#define SP_TX_H_SYNC_STA_L 0x31
> > +#define SP_TX_H_SYNC_STA_H 0x32
> > +#define SP_TX_H_B_PORCH_STA_L 0x33
> > +#define SP_TX_H_B_PORCH_STA_H 0x34
> > +
> > +#define SP_TX_VID_CTRL 0x84
> > +#define SP_TX_BPC_MASK 0xE0
> > +#define SP_TX_BPC_6    0x00
> > +#define SP_TX_BPC_8    0x20
> > +#define SP_TX_BPC_10   0x40
> > +#define SP_TX_BPC_12   0x60
> > +
> > +#define VIDEO_BIT_MATRIX_12 0x4c
> > +
> > +#define AUDIO_CHANNEL_STATUS_1 0xd0
> > +#define AUDIO_CHANNEL_STATUS_2 0xd1
> > +#define AUDIO_CHANNEL_STATUS_3 0xd2
> > +#define AUDIO_CHANNEL_STATUS_4 0xd3
> > +#define AUDIO_CHANNEL_STATUS_5 0xd4
> > +#define AUDIO_CHANNEL_STATUS_6 0xd5
> > +#define TDM_SLAVE_MODE 0x10
> > +#define I2S_SLAVE_MODE 0x08
> > +
> > +#define AUDIO_CONTROL_REGISTER 0xe6
> > +#define TDM_TIMING_MODE 0x08
> > +
> > +#define I2C_ADDR_72_DPTX              0x72
> > +
> > +#define HP_MIN			8
> > +#define HBLANKING_MIN		80
> > +#define SYNC_LEN_DEF		32
> > +#define HFP_HBP_DEF		((HBLANKING_MIN - SYNC_LEN_DEF) / 2)
> > +#define VIDEO_CONTROL_0	0x08
> > +
> > +#define  ACTIVE_LINES_L         0x14
> > +#define  ACTIVE_LINES_H         0x15  /* Bit[7:6] are reserved */
> > +#define  VERTICAL_FRONT_PORCH   0x16
> > +#define  VERTICAL_SYNC_WIDTH    0x17
> > +#define  VERTICAL_BACK_PORCH    0x18
> > +
> > +#define  HORIZONTAL_TOTAL_PIXELS_L    0x19
> > +#define  HORIZONTAL_TOTAL_PIXELS_H    0x1A  /* Bit[7:6] are reserved */
> > +#define  HORIZONTAL_ACTIVE_PIXELS_L   0x1B
> > +#define  HORIZONTAL_ACTIVE_PIXELS_H   0x1C  /* Bit[7:6] are reserved */
> > +#define  HORIZONTAL_FRONT_PORCH_L     0x1D
> > +#define  HORIZONTAL_FRONT_PORCH_H     0x1E  /* Bit[7:4] are reserved */
> > +#define  HORIZONTAL_SYNC_WIDTH_L      0x1F
> > +#define  HORIZONTAL_SYNC_WIDTH_H      0x20  /* Bit[7:4] are reserved */
> > +#define  HORIZONTAL_BACK_PORCH_L      0x21
> > +#define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
> > +
> > +/******** END of I2C Address 0x72 *********/
> > +/***************************************************************/
> > +/* Register definition of device address 0x7e */
> > +
> > +#define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
> > +
> > +#define FLASH_LOAD_STA 0x05
> > +#define FLASH_LOAD_STA_CHK	BIT(7)
> > +
> > +#define  XTAL_FRQ_SEL    0x3F
> > +/* bit field positions */
> > +#define  XTAL_FRQ_SEL_POS    5
> > +/* bit field values */
> > +#define  XTAL_FRQ_19M2   (0 << XTAL_FRQ_SEL_POS)
> > +#define  XTAL_FRQ_27M    (4 << XTAL_FRQ_SEL_POS)
> > +
> > +#define  R_DSC_CTRL_0    0x40
> > +#define  READ_STATUS_EN  7
> > +#define  CLK_1MEG_RB     6  /* 1MHz clock reset; 0=reset, 0=reset release */
> > +#define  DSC_BIST_DONE   1  /* Bit[5:1]: 1=DSC MBIST pass */
> > +#define  DSC_EN          0x01  /* 1=DSC enabled, 0=DSC disabled */
> > +
> > +#define OCM_FW_VERSION   0x31
> > +#define OCM_FW_REVERSION 0x32
> > +
> > +#define AP_AUX_ADDR_7_0   0x11
> > +#define AP_AUX_ADDR_15_8  0x12
> > +#define AP_AUX_ADDR_19_16 0x13
> > +
> > +/* Bit[0:3] AUX status, bit 4 op_en, bit 5 address only */
> > +#define AP_AUX_CTRL_STATUS 0x14
> > +#define AP_AUX_CTRL_OP_EN 0x10
> > +#define AP_AUX_CTRL_ADDRONLY 0x20
> > +
> > +#define AP_AUX_BUFF_START 0x15
> > +#define PIXEL_CLOCK_L 0x25
> > +#define PIXEL_CLOCK_H 0x26
> > +
> > +#define AP_AUX_COMMAND 0x27  /* com+len */
> > +/* Bit 0&1: 3D video structure */
> > +/* 0x01: frame packing,  0x02:Line alternative, 0x03:Side-by-side(full) */
> > +#define AP_AV_STATUS 0x28
> > +#define AP_VIDEO_CHG  BIT(2)
> > +#define AP_AUDIO_CHG  BIT(3)
> > +#define AP_MIPI_MUTE  BIT(4) /* 1:MIPI input mute, 0: ummute */
> > +#define AP_MIPI_RX_EN BIT(5) /* 1: MIPI RX input in  0: no RX in */
> > +#define AP_DISABLE_PD BIT(6)
> > +#define AP_DISABLE_DISPLAY BIT(7)
> > +/***************************************************************/
> > +/* Register definition of device address 0x84 */
> > +#define  MIPI_PHY_CONTROL_3            0x03
> > +#define  MIPI_HS_PWD_CLK               7
> > +#define  MIPI_HS_RT_CLK                6
> > +#define  MIPI_PD_CLK                   5
> > +#define  MIPI_CLK_RT_MANUAL_PD_EN      4
> > +#define  MIPI_CLK_HS_MANUAL_PD_EN      3
> > +#define  MIPI_CLK_DET_DET_BYPASS       2
> > +#define  MIPI_CLK_MISS_CTRL            1
> > +#define  MIPI_PD_LPTX_CH_MANUAL_PD_EN  0
> > +
> > +#define  MIPI_LANE_CTRL_0		0x05
> > +#define  MIPI_TIME_HS_PRPR		0x08
> > +
> > +/*
> > + * After MIPI RX protocol layer received video frames,
> > + * Protocol layer starts to reconstruct video stream from PHY
> > + */
> > +#define  MIPI_VIDEO_STABLE_CNT           0x0A
> > +
> > +#define  MIPI_LANE_CTRL_10               0x0F
> > +#define  MIPI_DIGITAL_ADJ_1   0x1B
> > +
> > +#define  MIPI_PLL_M_NUM_23_16   0x1E
> > +#define  MIPI_PLL_M_NUM_15_8    0x1F
> > +#define  MIPI_PLL_M_NUM_7_0     0x20
> > +#define  MIPI_PLL_N_NUM_23_16   0x21
> > +#define  MIPI_PLL_N_NUM_15_8    0x22
> > +#define  MIPI_PLL_N_NUM_7_0     0x23
> > +
> > +#define  MIPI_DIGITAL_PLL_6     0x2A
> > +/* Bit[7:6]: VCO band control, only effective */
> > +#define  MIPI_M_NUM_READY        0x10
> > +#define  MIPI_N_NUM_READY        0x08
> > +#define  STABLE_INTEGER_CNT_EN   0x04
> > +#define  MIPI_PLL_TEST_BIT       0
> > +/* Bit[1:0]: test point output select - */
> > +/* 00: VCO power, 01: dvdd_pdt, 10: dvdd, 11: vcox */
> > +
> > +#define  MIPI_DIGITAL_PLL_7      0x2B
> > +#define  MIPI_PLL_FORCE_N_EN     7
> > +#define  MIPI_PLL_FORCE_BAND_EN  6
> > +
> > +#define  MIPI_PLL_VCO_TUNE_REG   4
> > +/* Bit[5:4]: VCO metal capacitance - */
> > +/* 00: +20% fast, 01: +10% fast (default), 10: typical, 11: -10% slow */
> > +#define  MIPI_PLL_VCO_TUNE_REG_VAL   0x30
> > +
> > +#define  MIPI_PLL_PLL_LDO_BIT    2
> > +/* Bit[3:2]: vco_v2i power - */
> > +/* 00: 1.40V, 01: 1.45V (default), 10: 1.50V, 11: 1.55V */
> > +#define  MIPI_PLL_RESET_N        0x02
> > +#define  MIPI_FRQ_FORCE_NDET     0
> > +
> > +#define  MIPI_ALERT_CLR_0        0x2D
> > +#define  HS_link_error_clear     7
> > +/* This bit itself is S/C, and it clears 0x84:0x31[7] */
> > +
> > +#define  MIPI_ALERT_OUT_0        0x31
> > +#define  check_sum_err_hs_sync   7
> > +/* This bit is cleared by 0x84:0x2D[7] */
> > +
> > +#define  MIPI_DIGITAL_PLL_8    0x33
> > +#define  MIPI_POST_DIV_VAL     4
> > +/* N means divided by (n+1), n = 0~15 */
> > +#define  MIPI_EN_LOCK_FRZ      3
> > +#define  MIPI_FRQ_COUNTER_RST  2
> > +#define  MIPI_FRQ_SET_REG_8    1
> > +/* Bit 0 is reserved */
> > +
> > +#define  MIPI_DIGITAL_PLL_9    0x34
> > +
> > +#define  MIPI_DIGITAL_PLL_16   0x3B
> > +#define  MIPI_FRQ_FREEZE_NDET          7
> > +#define  MIPI_FRQ_REG_SET_ENABLE       6
> > +#define  MIPI_REG_FORCE_SEL_EN         5
> > +#define  MIPI_REG_SEL_DIV_REG          4
> > +#define  MIPI_REG_FORCE_PRE_DIV_EN     3
> > +/* Bit 2 is reserved */
> > +#define  MIPI_FREF_D_IND               1
> > +#define  REF_CLK_27000KHZ    1
> > +#define  REF_CLK_19200KHZ    0
> > +#define  MIPI_REG_PLL_PLL_TEST_ENABLE  0
> > +
> > +#define  MIPI_DIGITAL_PLL_18  0x3D
> > +#define  FRQ_COUNT_RB_SEL       7
> > +#define  REG_FORCE_POST_DIV_EN  6
> > +#define  MIPI_DPI_SELECT        5
> > +#define  SELECT_DSI  1
> > +#define  SELECT_DPI  0
> > +#define  REG_BAUD_DIV_RATIO     0
> > +
> > +#define  H_BLANK_L            0x3E
> > +/* For DSC only */
> > +#define  H_BLANK_H            0x3F
> > +/* For DSC only; note: bit[7:6] are reserved */
> > +#define  MIPI_SWAP  0x4A
> > +#define  MIPI_SWAP_CH0    7
> > +#define  MIPI_SWAP_CH1    6
> > +#define  MIPI_SWAP_CH2    5
> > +#define  MIPI_SWAP_CH3    4
> > +#define  MIPI_SWAP_CLK    3
> > +/* Bit[2:0] are reserved */
> > +
> > +/******** END of I2C Address 0x84 *********/
> > +
> > +/* DPCD regs */
> > +#define DPCD_DPCD_REV                  0x00
> > +#define DPCD_MAX_LINK_RATE             0x01
> > +#define DPCD_MAX_LANE_COUNT            0x02
> > +
> > +/*********  ANX7625 Register End  **********/
> > +
> > +/***************** Display *****************/
> > +enum audio_fs {
> > +	AUDIO_FS_441K  = 0x00,
> > +	AUDIO_FS_48K   = 0x02,
> > +	AUDIO_FS_32K   = 0x03,
> > +	AUDIO_FS_882K  = 0x08,
> > +	AUDIO_FS_96K   = 0x0a,
> > +	AUDIO_FS_1764K = 0x0c,
> > +	AUDIO_FS_192K  = 0x0e
> > +};
> > +
> > +enum audio_wd_len {
> > +	AUDIO_W_LEN_16_20MAX = 0x02,
> > +	AUDIO_W_LEN_18_20MAX = 0x04,
> > +	AUDIO_W_LEN_17_20MAX = 0x0c,
> > +	AUDIO_W_LEN_19_20MAX = 0x08,
> > +	AUDIO_W_LEN_20_20MAX = 0x0a,
> > +	AUDIO_W_LEN_20_24MAX = 0x03,
> > +	AUDIO_W_LEN_22_24MAX = 0x05,
> > +	AUDIO_W_LEN_21_24MAX = 0x0d,
> > +	AUDIO_W_LEN_23_24MAX = 0x09,
> > +	AUDIO_W_LEN_24_24MAX = 0x0b
> > +};
> > +
> > +#define I2S_CH_2	0x01
> > +#define TDM_CH_4	0x03
> > +#define TDM_CH_6	0x05
> > +#define TDM_CH_8	0x07
> > +
> > +#define MAX_DPCD_BUFFER_SIZE	16
> > +
> > +#define ONE_BLOCK_SIZE      128
> > +#define FOUR_BLOCK_SIZE     (128 * 4)
> > +
> > +#define MAX_EDID_BLOCK	3
> > +#define EDID_TRY_CNT	3
> > +#define SUPPORT_PIXEL_CLOCK	300000
> > +
> > +struct s_edid_data {
> > +	int edid_block_num;
> > +	u8 edid_raw_data[FOUR_BLOCK_SIZE];
> > +};
> > +
> > +/***************** Display End *****************/
> > +
> > +struct anx7625_device_node {
> > +	struct device_node *mipi_dsi_host_node;
> > +	struct device_node *panel_node;
> > +};
> > +
> > +struct anx7625_platform_data {
> > +	struct gpio_desc *gpio_p_on;
> > +	struct gpio_desc *gpio_reset;
> > +	struct drm_panel *panel;
> > +	int intp_irq;
> > +	u32 low_power_mode;
> > +	struct anx7625_device_node node;
> > +};
> > +
> > +struct anx7625_i2c_client {
> > +	struct i2c_client *tx_p0_client;
> > +	struct i2c_client *tx_p1_client;
> > +	struct i2c_client *tx_p2_client;
> > +	struct i2c_client *rx_p0_client;
> > +	struct i2c_client *rx_p1_client;
> > +	struct i2c_client *rx_p2_client;
> > +	struct i2c_client *tcpc_client;
> > +};
> > +
> > +struct anx7625_data {
> > +	struct anx7625_platform_data pdata;
> > +	atomic_t power_status;
> > +	atomic_t panel_power;
> > +	int hpd_status;
> > +	int hpd_high_cnt;
> > +	/* Lock for work queue */
> > +	struct mutex lock;
> > +	struct i2c_client *client;
> > +	struct anx7625_i2c_client i2c;
> > +	struct i2c_client *last_client;
> > +	struct s_edid_data slimport_edid_p;
> > +	struct work_struct work;
> > +	struct workqueue_struct *workqueue;
> > +	char edid_block;
> > +	struct display_timing dt;
> > +	u8 display_timing_valid;
> > +	struct drm_bridge bridge;
> > +	u8 bridge_attached;
> > +	struct drm_connector connector;
> > +	struct mipi_dsi_device *dsi;
> > +};
> > +
> > +#endif  /* __ANX7625_H__ */
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
