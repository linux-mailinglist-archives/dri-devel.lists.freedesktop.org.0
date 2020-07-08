Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60489219905
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D136E9BB;
	Thu,  9 Jul 2020 07:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2095.outbound.protection.outlook.com [40.107.236.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBA06E190
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 09:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfaDtY3PefrHLfIHKHLD3NzrDJ2xN7ojXughXqqUzAcf3zbbokO+5KaKdKngXjsPusZI+bhfIn58qi1+prTcr96ckDUoa2XtDvteRNAwXLKfVpT+N4ouH436BgKykiGsUc/c2oiYqfW5AT2rIOUl92NcDy2x46jPPlF6dShn+RJYrxoTsgWGeNMzJ1nsYL2crvNuyrknQJYJOz464RNCxpdzConlaohkwxcTazH/ZBiS6HoTS8tFtm289y4a1/OAMnUowLTTgJ3Tg654YgckjgNsEcRKiq3uH5myfFYp4h2VTZUTtdlUaResXzbAIJyRpm5d9yL+sMCKi1W+wBpcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQOZLqjxSfbqZWNqmN7724Narzb9PECHFpapDriZArQ=;
 b=KZaT5z29A/+IpYtvrVOf96mV0SME3HoEywqTpcQRl5z51H7M3Cvul1heZAgxISDSPaTppJDJPKBEVzqoE9POZMcz9sirk+m0hfypSX2qyENnqDzL38q7sKNVLFsaBgwlFYuf4YSzYGX53hvsL8diswXP5KnDhKuNkGukmtzBUCaNDRG0ubhGVWGCyU1I5sseWvAojCIfyu1vNI12guAuK1r2RtTJdVgdYAqAOnBnpMVm/CdPICeHQgT6F+bOMqV6L86IDrLRGDrsDbwhn585/4aIgQ2IBXfHWX3PcubQ0GSLRJcc5Sob0FuNr5rHC5f3c61ByMvUmMF4Suf2VTs3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQOZLqjxSfbqZWNqmN7724Narzb9PECHFpapDriZArQ=;
 b=pRRJg/QLso13fh/MrydfM7D6NYtPzzV7tkMTTYSo9dfVvblDPfup8smGLmMHwrM45kc10BIqmklRALM+jZVRp72gutAS0cAKYBwgqxlxpqueWP2lCO/ZPjWP23RaOVNIdVY97N/CSOMpvdMu1miVtcqz8dk1XFd2x8k4JByoOnQ=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB6150.namprd04.prod.outlook.com (2603:10b6:a03:e3::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 8 Jul
 2020 09:01:04 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::844e:398b:2165:631b%5]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 09:01:04 +0000
Date: Wed, 8 Jul 2020 17:00:55 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v13 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP
Message-ID: <20200708090055.GA21256@xin-VirtualBox>
References: <cover.1591345160.git.xji@analogixsemi.com>
 <a18316c118c7b8ac201911b0b96d41c84653a00f.1591345160.git.xji@analogixsemi.com>
 <CANMq1KDnoLSUxxYr82o=1eGBR7E3PxoYUr8h1sEVTyqYyHCC-Q@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CANMq1KDnoLSUxxYr82o=1eGBR7E3PxoYUr8h1sEVTyqYyHCC-Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR04CA0050.apcprd04.prod.outlook.com
 (2603:1096:202:14::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR04CA0050.apcprd04.prod.outlook.com (2603:1096:202:14::18) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 09:01:03 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b4f2af2-59cf-4d7a-014a-08d8231d71c7
X-MS-TrafficTypeDiagnostic: BYAPR04MB6150:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB6150A52AE3DFF8CBE7C2954EC7670@BYAPR04MB6150.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGe+cPMhHPGUK9qLwGgH9XH6BVrjIlL+TAQjk232qTRlbvgarpQzHFVuBDGbMd8bz229RmkSIAu7xIjDizIgKP5IxzjULzqCfaiXvneIRHqwOIWiPcec99Ll4QXCWiIlAfB3Hubgvm4Ouul7aSxUFKIG3IebNK+w9zEUCgk1Wf/1Swxl5oroFEDDytXaUrQY1et5hGXGcFblCC1zOvKlqOpu0kvZHK8SEwbonTq4zk7tG8Vul/dVXtFlYNsl9st6WL94ZAVLZrLr9Uz9pIWhoBGswCvChm3nr1gLDYaf9FSkybYBDhZIfXDKFZXQvbxVEkLHXOXlX9cCgl3gFyMPHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(39840400004)(376002)(136003)(346002)(107886003)(478600001)(26005)(54906003)(186003)(16526019)(6496006)(52116002)(8676002)(4326008)(66946007)(66476007)(66556008)(7416002)(83380400001)(9686003)(33656002)(86362001)(33716001)(53546011)(316002)(1076003)(956004)(6916009)(5660300002)(2906002)(55016002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 2kijO3D/ojoPCbtqnEjVgoBnXfciXJsKZS90n1HrWYhLQb8ERkhM3qushxjj9440lyOj7/Ow6XUsnp0vJFR7d8Z8czWXs29kEaZTD7XTTw0lXQlc29qcftCSTRbrPNrJhLt9zd4JxYCX+/jUC017Av5sYCjbhI45uHM4J9iduth8qh57e2IpOAcyT6rlImZWOdOkxo5A0IsVwoD2DujvB2pbKh72jyB3AjMBPJtV6Gu0AChWTTAugOBdftfAd5Uc0hMJ6EOUnJSk5bAg18lOvQWqnL0MpwcXFIuvSZAbxnAfrTGhA3VGn4ZqoSi4SMNFBsN6EN35YDjas54RUIIsW+jMpBMyHSUqYUq99QVznjO7f37V9sjBhugJbUmNL1Ebv+u5TZVyBS7wIzfl6nwKqoPDWTZTCqWkZ0BW6fNvH9ni7ReP5sD6VQOBMWqNu72sI3cT69H3djo7rJhsIdcOqng75sBJshdKqm71VBXZttiZPyUsJjsSkQVEmYRlF4zJ
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4f2af2-59cf-4d7a-014a-08d8231d71c7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 09:01:04.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Am/QYnQSOUVEyos+VV7DPcX4FUv1yLzypaxF8A3fOfWbkeCdOEieBXmstyvbW6HNWZSaeav6gw+ypsk2/TEcRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6150
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
 Pi-Hsun Shih <pihsun@chromium.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 03:01:25PM +0800, Nicolas Boichat wrote:

Hi Nicolas, thanks for the replay.

> On Tue, Jun 9, 2020 at 3:20 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> > for portable device. It converts MIPI DSI/DPI to DisplayPort 1.3 4K.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/Kconfig   |    9 +
> >  drivers/gpu/drm/bridge/analogix/Makefile  |    1 +
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1999 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  397 ++++++
> >  4 files changed, 2406 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
> >  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
> >
> > [snip]
> > +static int anx7625_parse_dt(struct device *dev,
> > +                           struct anx7625_platform_data *pdata)
> > +{
> > +       struct device_node *np = dev->of_node;
> > +       struct device_node *panel_node, *out_ep;
> > +
> > +       pdata->node.mipi_dsi_host_node = of_graph_get_remote_node(np, 0, 0);
> > +       if (!pdata->node.mipi_dsi_host_node) {
> > +               DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > +               return -EPROBE_DEFER;
> 
> This does not look correct. I don't think of_graph_get_remote_node
> will ever return NULL if the device tree is configured properly, and
> it's useless to retry later (EPROBE_DEFER). You should just fail (e.g.
> return EINVAL).
OK
> 
> > +       }
> > +
> > +       of_node_put(pdata->node.mipi_dsi_host_node);
> 
> You are using pdata->node.mipi_dsi_host_node in other places in the
> code, so I don't think it's ok to call of_node_put?
I'll move the related code to here.
> 
> > +       DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > +
> > +       pdata->node.panel_node = of_graph_get_port_by_id(np, 1);
> > +       if (!pdata->node.panel_node) {
> > +               DRM_DEV_ERROR(dev, "fail to get panel node.\n");
> > +               return -EPROBE_DEFER;
> 
> -EINVAL.
OK
> 
> > +       }
> > +
> > +       of_node_put(pdata->node.panel_node);
> > +       out_ep = of_get_child_by_name(pdata->node.panel_node,
> > +                                     "endpoint");
> > +       if (!out_ep) {
> > +               DRM_DEV_DEBUG_DRIVER(dev, "cannot get endpoint.\n");
> 
> DRM_DEV_ERROR seems more appropriate
OK, also I'll remove drm_panel based on Sam comment.
> 
> > +               return -EPROBE_DEFER;
> 
> -EINVAL
OK
> 
> > +       }
> > +
> > +       panel_node = of_graph_get_remote_port_parent(out_ep);
> > +       of_node_put(out_ep);
> > +       pdata->panel = of_drm_find_panel(panel_node);
> > +       DRM_DEV_DEBUG_DRIVER(dev, "get panel node.\n");
> > +
> > +       of_node_put(panel_node);
> > +       if (IS_ERR_OR_NULL(pdata->panel))
> > +               return -EPROBE_DEFER;
> 
> of_drm_find_panel cannot return NULL, so, do this instead:
> 
> if (IS_ERR(pdata->panel))
>    return PTR_ERR(pdata->panel);
> 
> (which actually _may_ return EPROBE_DEFER)
I'll remove drm_panel, use panel_bridge.
> 
> > +
> > +       return 0;
> > +}
> > [snip]
> > +static int anx7625_i2c_probe(struct i2c_client *client,
> > +                            const struct i2c_device_id *id)
> > +{
> > +       struct anx7625_data *platform;
> > +       struct anx7625_platform_data *pdata;
> > +       int ret = 0;
> > +       struct device *dev = &client->dev;
> > +
> > +       if (!i2c_check_functionality(client->adapter,
> > +                                    I2C_FUNC_SMBUS_I2C_BLOCK)) {
> > +               DRM_DEV_ERROR(dev, "anx7625's i2c bus doesn't support\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> > +       if (!platform) {
> > +               DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       pdata = &platform->pdata;
> > +
> > +       ret = anx7625_parse_dt(dev, pdata);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "fail to parse devicetree.\n");
> 
> Please do not print this error (or at least not if err == -EPROBE_DEFER).
OK
> 
> > +               goto free_platform;
> > +       }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
