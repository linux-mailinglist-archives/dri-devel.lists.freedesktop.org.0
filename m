Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC5341333
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027306E95A;
	Fri, 19 Mar 2021 02:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2100.outbound.protection.outlook.com [40.107.237.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CC56E95A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2THvaGUquc/fXHwiFq1+0kK49rIqMszP0jLgVPqkYAY3QS6h8aH69ZKMrd028gGUlybZK2qDgAel+wXcn2vYRvQE5xV87KV514KyMv//p/FxL+0dBcK03Rk8Ks3EYRn71FBaSWInf3W8uU4u0tQBhDxbUr3wn9KdxQal2QtjXbDRrG1kSV8YidoHWtrMp0qL4ufJMhICj/yvpyGuwKBd0dxZJkDmEH0lJS34FXemqbNk9GXRAjomcYkPRgrZT2Fwlj+fzni8sIB9WVZBBpTcuxGNkYnkBWPhKCjFKbZCNfrmCHBhOj8NysIgBDsyTSe4HCf+PpRlwTqQCcvIGcaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLkYTYEC6LFNKd74J8jt+qSlkT1Xk3lN5jmdM25lk6U=;
 b=aeiF2MySJxKPjmca59vK7USQLqJLMGv37mU7XXO39RZ7DFYQPB2M2YWHp9WQGtn/Sjcl/eXV0NVzVYSpDNGf4NNtR3grxVJ3WSXgyX2MNkpdi2VQBxKAo1excmSiGAa6Mf/P2v0LK+G7bvrcaXma+/6QGGAPJfXt0XVvFo39+Lt8s13akDE36jcw7/t6kTWjMnuJ6tym7YU+SbI9IyOdDVVRFdeRQGtMtwnHMizKRp7RswpE+3t4N6nrpbHwX52xdwt3wBKwob3dHL4+e9XGpdxE3x82eLsknXRF7olcZkDAAZyiU0t8U9B4V/+gBDq8zQgExD5xV6TTPXd/ve7eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLkYTYEC6LFNKd74J8jt+qSlkT1Xk3lN5jmdM25lk6U=;
 b=JvZwVLAbCw50uMhCeXInvWKmIdrE7BRMVdNcdKocids4E9PfYRi1AwnLOV6KagFu735dxW2kJvDfokhUxCNX7pTwhiPj5BRV2Hbz3Y+lfCaBwbLb5YqocOrM3lNc6044kX4E0FvBBidOjLcLzt4TZTETebzvG2uGOXAUyJi2HMo=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6962.namprd04.prod.outlook.com (2603:10b6:a03:221::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 02:49:15 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:49:15 +0000
Date: Fri, 19 Mar 2021 10:49:09 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v4 2/2] drm/bridge: anx7625: disable regulators when
 power off
Message-ID: <20210319024909.GA1063740@anxtwsw-Precision-3640-Tower>
References: <20210224061409.3996755-1-hsinyi@chromium.org>
 <20210224061409.3996755-2-hsinyi@chromium.org>
 <CAJMQK-ho9Ncqd=muCv-aMsHSRhgKtC3H6asxR=+3CODpeiWQWQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAJMQK-ho9Ncqd=muCv-aMsHSRhgKtC3H6asxR=+3CODpeiWQWQ@mail.gmail.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR03CA0062.apcprd03.prod.outlook.com (2603:1096:202:17::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.14 via Frontend Transport; Fri, 19 Mar 2021 02:49:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edb24b98-f027-4f3b-f060-08d8ea81954b
X-MS-TrafficTypeDiagnostic: BY5PR04MB6962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB696265D1CACAD4775050D8BCC7689@BY5PR04MB6962.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1jS3YDmwFB1E+KH2SOmOk/5cnWDc5cUPKDGk0JVLeJPP8ChKLt35gZxTAx7HgkIfiGQNQ+9G6EodbBFvdqcsgvyNzx5xnaij1Cl84u1ZgixBbbyhJsJiZrj7yENMDedER1NTTrreE0DyaDN9xzUPB4bQPYtS0MuEoM+ls7n3f8zren8KF2ElEYrjcWUNCEY2bQq1O6zCcBKc0nF8Agc/qdsS++PlVxoJAncZPabl0MSuD3+sUvCSdlCOHke7iZvjxzX+NLDTjshyMi5FRMAcUKmaB0DaHlgyfV3CxFKW4ZZEwp13cn/TMuRpVGxfO0yP2YpJDlktvjDp7VKV0R8i3EIo1AX8q7M2E+QzWXJMjax+OJ2nA28RXhNIFi59E7/lafK8WKK/kWjVo/OwwKD+QFDQkK21KQzaMSfRvfVzVvYPld8hJxkpAM5/GNT4Zy/j3awQFFJTya5z+X9QNEvs63qe+rRWvMXMT8z+ikQ0l5jTzRCYQRxWD1sgzzk8in671PK9M8I5tRrlzIqJHN0/LGZ87kHVMiYbSnEb6DzMn3VpavoBqtZ+hnAkM/zjbE2esT4Rr5KC1s7UZT4iHrPltXM58MS6HwUPDQu3qQWOWukn6HkcBDaZxpTVpAjPHb2K0Ad65ETNnFS4c1aWR2jqnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(396003)(376002)(366004)(39840400004)(5660300002)(316002)(55016002)(52116002)(6496006)(83380400001)(33716001)(7416002)(1076003)(38100700001)(66556008)(956004)(4326008)(6666004)(2906002)(33656002)(26005)(8936002)(186003)(16526019)(54906003)(66946007)(53546011)(107886003)(8676002)(66476007)(9686003)(6916009)(478600001)(86362001)(55236004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2g4A2QhjxWR0kh48Im2MEQz4iuQlyek/uYyPSBVPhGg5mhFkeLAweaYHJDHc?=
 =?us-ascii?Q?UiQ7dsRo9L6ZETfv+nHiqO+o1ZhHF7Fd59hWwReTYc/wdfYyNhCEdVI6sQFj?=
 =?us-ascii?Q?yuGkSmJRiSTPEIhNtp27wOuCcXSGdmFEm73Nez5WfPf39pRhn0d7pp3X5Kg+?=
 =?us-ascii?Q?qrlTzXbWEJKsoiLSKDB92I//0d7Q/KOJZUCnbYv4K1HZHp0mDI44q4R+Yy4A?=
 =?us-ascii?Q?vnljUyz7qcUGPgAgdR1ICriYJdrtCiPhNO8jwIQOYMp2JTj+2iLaA47N3Rkr?=
 =?us-ascii?Q?RoSoTvOqxdAKguVDd7DCXMD53KfGkwxkQnGa7uAKeNesq1Ajsm9BfdZu/pht?=
 =?us-ascii?Q?nfb9/Xka5K2MJs5NVruORIpS3LtQHKhnEeijClquFIwAYEZFE7RuQcWqBRGl?=
 =?us-ascii?Q?2sZboKondSj7qHBkGt96WHt8LP8vZGF04gATdYAGcrun6d56qiSLtDc3YrKT?=
 =?us-ascii?Q?84DSkjj/ymZg5m1/UsX1qbQzfpRgwODN7ROhhXyaIr7L4FxUdD3jjhljzQym?=
 =?us-ascii?Q?KKcaRE+AMBc1Hx2xTa7t8hRZa1rxaXPMmvsOdOolwELuC97w1d3OVnkCIlHT?=
 =?us-ascii?Q?GWRLPbM7oh7P7SStblpkx2nlQRYW58DaAyDY4UXGwSSS3sOst1UwH6bRYG7T?=
 =?us-ascii?Q?lKNXlRqpJORZdYbi/M7iVtFSUIQ1oA+K2O80JuOeVYx+ryqzN+16Gszmesgi?=
 =?us-ascii?Q?2sFA1vSKHKsU3x4cBkmJTM9cPxmQriHn6TzW7g0z5ymhRc4fpJY/uw102P30?=
 =?us-ascii?Q?FHeaAYoARq1T7iu/TxSzPyhMcEqX6t9OU6vm6k+wv0lMzFp6cpsAiaMyh7Wy?=
 =?us-ascii?Q?/kfdz3uk/N7+m3a1dqbTBAtELJXyDsgTfESCMskYwDECBY/rFacU71NAYnJh?=
 =?us-ascii?Q?UHsoJuQLQyxBx5tpq/OD8N/a8GmlAhSMMj/DJiJHepV6rmKXz8vFcnb4fV9k?=
 =?us-ascii?Q?iDTAK8JGk75S2V02BLY1BGZOwqyyl4DASyKeiarf+KLHB2CWMm+0lfu9lugo?=
 =?us-ascii?Q?kXyy/4BkSicI7S7gZ9dXMpPjVcXk4G6969etYrjvii3V6D9OLfyXaOMEseLQ?=
 =?us-ascii?Q?swVuRB/sm3yWU/0g2ph4DwCmrj+Iom2rcwwJsGyEdhrdoz3J11podLJa5bTh?=
 =?us-ascii?Q?s/PAf4Nc6szH4Nm2+0VuTLkLtoJK1gaKDpYhv33EjB+0aE7ttRaETFNTbAz2?=
 =?us-ascii?Q?h+7bpba6LYYYtpmlfvro5I8vC/vjwPrZz/HJd3LhJUhzItOoje7nJJoO4FJh?=
 =?us-ascii?Q?nX5bzIUd0HHyRz236RgZdgK/SyChiFUjfgbBLYoqiBjLcBe04+roY12nmeKy?=
 =?us-ascii?Q?Hb9H/QMlwVp8yHuYJVzX8OeI?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb24b98-f027-4f3b-f060-08d8ea81954b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:49:15.1020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8VyQ0OcZj1ptRYTcEfZSApPoHhTi6ovulZdxOWlK7+7YYzc5QvOXolFzLz8PY7TdS9kXkCyluZCMm4H2+MfOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6962
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 12:26:25PM +0800, Hsin-Yi Wang wrote:
> On Wed, Feb 24, 2021 at 2:14 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > When suspending the driver, anx7625_power_standby() will be called to
> > turn off reset-gpios and enable-gpios. However, power supplies are not
> > disabled. To save power, the driver can get the power supply regulators
> > and turn off them in anx7625_power_standby().
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > ---
Hi Hsin-Yi, it's OK for me, please add my r-b.
Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin
> 
> Ping on the thread, thanks.
> 
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 34 +++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 65cc05982f826..23283ba0c4f93 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >  #include <linux/workqueue.h>
> > @@ -875,12 +876,25 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> >  static void anx7625_power_on(struct anx7625_data *ctx)
> >  {
> >         struct device *dev = &ctx->client->dev;
> > +       int ret, i;
> >
> >         if (!ctx->pdata.low_power_mode) {
> >                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> >                 return;
> >         }
> >
> > +       for (i = 0; i < ARRAY_SIZE(ctx->pdata.supplies); i++) {
> > +               ret = regulator_enable(ctx->pdata.supplies[i].consumer);
> > +               if (ret < 0) {
> > +                       DRM_DEV_DEBUG_DRIVER(dev, "cannot enable supply %d: %d\n",
> > +                                            i, ret);
> > +                       goto reg_err;
> > +               }
> > +               usleep_range(2000, 2100);
> > +       }
> > +
> > +       usleep_range(4000, 4100);
> > +
> >         /* Power on pin enable */
> >         gpiod_set_value(ctx->pdata.gpio_p_on, 1);
> >         usleep_range(10000, 11000);
> > @@ -889,11 +903,16 @@ static void anx7625_power_on(struct anx7625_data *ctx)
> >         usleep_range(10000, 11000);
> >
> >         DRM_DEV_DEBUG_DRIVER(dev, "power on !\n");
> > +       return;
> > +reg_err:
> > +       for (--i; i >= 0; i--)
> > +               regulator_disable(ctx->pdata.supplies[i].consumer);
> >  }
> >
> >  static void anx7625_power_standby(struct anx7625_data *ctx)
> >  {
> >         struct device *dev = &ctx->client->dev;
> > +       int ret;
> >
> >         if (!ctx->pdata.low_power_mode) {
> >                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> > @@ -904,6 +923,12 @@ static void anx7625_power_standby(struct anx7625_data *ctx)
> >         usleep_range(1000, 1100);
> >         gpiod_set_value(ctx->pdata.gpio_p_on, 0);
> >         usleep_range(1000, 1100);
> > +
> > +       ret = regulator_bulk_disable(ARRAY_SIZE(ctx->pdata.supplies),
> > +                                    ctx->pdata.supplies);
> > +       if (ret < 0)
> > +               DRM_DEV_DEBUG_DRIVER(dev, "cannot disable supplies %d\n", ret);
> > +
> >         DRM_DEV_DEBUG_DRIVER(dev, "power down\n");
> >  }
> >
> > @@ -1742,6 +1767,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >         platform->client = client;
> >         i2c_set_clientdata(client, platform);
> >
> > +       pdata->supplies[0].supply = "vdd10";
> > +       pdata->supplies[1].supply = "vdd18";
> > +       pdata->supplies[2].supply = "vdd33";
> > +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pdata->supplies),
> > +                                     pdata->supplies);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "fail to get power supplies: %d\n", ret);
> > +               return ret;
> > +       }
> >         anx7625_init_gpio(platform);
> >
> >         atomic_set(&platform->power_status, 0);
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index 193ad86c54503..e4a086b3a3d7b 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -350,6 +350,7 @@ struct s_edid_data {
> >  struct anx7625_platform_data {
> >         struct gpio_desc *gpio_p_on;
> >         struct gpio_desc *gpio_reset;
> > +       struct regulator_bulk_data supplies[3];
> >         struct drm_bridge *panel_bridge;
> >         int intp_irq;
> >         u32 low_power_mode;
> > --
> > 2.30.1.766.gb4fecdf3b7-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
