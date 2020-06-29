Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AE20CCD2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDEA6E405;
	Mon, 29 Jun 2020 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130042.outbound.protection.outlook.com [40.107.13.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6BF6E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 02:45:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgakU0OHzLLD1SoSbkS4gcTuzBVy2zBA8EIfgZtW26PTZ6KZdPPz44wud8B+sYWT/l41cmGuxlIcQP7LeL1U7x40JfU5qL8Up24ikggb94rIZn5chFGZk8eMuq6qdylcoPdgXSs1YKJHbBQ5klLIZnSmLO6Uq1bh71ZK5f8CKgWLg/FWLvZAicY4g9wAmkgN4Pd9hLLIb6HceZthm7Im6ljVNCsY7i+fDeTAQbHIVhmD2vq5RQwpmQhyGE8wfYT96Uv9MPkx9kPYQcsbFC3zHiPoGHpCYIOIQDvPLjhYSc6g5zUJpP++jKvdxVEZNFy8hkp7v4V/46Gb3pH7sN1yBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqyifVFj8mT1kb4vQAlDyxj3omhSyt0i5VzKIWiOrbc=;
 b=fe1/HNRBr3V5ER25wH3v7BpLOvEJs+RkCep7r48FfejtgJvHUyjUfIPittIahHMcOJ9U2DgkYW12RjiHAI55Cz3mKiF6CriRCdR5jRRcPU9tnLsCaaxBB9EdpddIF23wvDzGmz/RFHrV5nD9YoMMViCnGiE4TXehJk1DFlkL7Swu6+kcsbcCN5CB99x197kQbmB5Ud62lFWBfn7WVDo4ER8E8AbsZZ6aioh22Eq+DIvGMK9cZ0e7tdTlbBqeMVlHzzaJ357HU+o/jAKiJtYm02SPrtxIlq+B72nQZNA09FH9DfPDlwIEFqL+Oa+O3KWGFobJIc3XOFfY+JCdOMWNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqyifVFj8mT1kb4vQAlDyxj3omhSyt0i5VzKIWiOrbc=;
 b=WkIiCMiyNuVFg7DeWmx0qX/IUCzuKAhmt4HUwTB1rNq7H9AagGAvAMchzvtxBRJ5MaImSyQzdJACwUjY39oF0O+n9loq725mXt9th6yPrxoW9rIpk2seanMs10v+Jko2g8s13GcddlegJFJpyjXYYuUOw49/DY3PB3iL67w1y1g=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6112.eurprd04.prod.outlook.com (2603:10a6:803:fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Mon, 29 Jun
 2020 02:45:24 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 02:45:24 +0000
Message-ID: <527d3be2a8fde03920c6b4dfba25920e9a4be6ca.camel@nxp.com>
Subject: Re: [PATCH 2/2] drm/bridge: dw-hdmi: Always add the bridge in the
 global bridge list
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 29 Jun 2020 10:44:25 +0800
In-Reply-To: <20200628082210.GF6954@pendragon.ideasonboard.com>
References: <1592298292-17634-1-git-send-email-victor.liu@nxp.com>
 <1592298292-17634-2-git-send-email-victor.liu@nxp.com>
 <20200628082210.GF6954@pendragon.ideasonboard.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-ClientProxiedBy: HK2PR03CA0053.apcprd03.prod.outlook.com
 (2603:1096:202:17::23) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vbox (223.112.202.196) by
 HK2PR03CA0053.apcprd03.prod.outlook.com (2603:1096:202:17::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.10 via Frontend Transport; Mon, 29 Jun 2020 02:45:19 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-Originating-IP: [223.112.202.196]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 964a7f7b-b3de-456d-056e-08d81bd678d0
X-MS-TrafficTypeDiagnostic: VI1PR04MB6112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB61121C588243304B8B246B33986E0@VI1PR04MB6112.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UyLplCpALFta0vGWD4BJT7+3Fw0u6M2Xv0P9A/1SCmLYqk5AlZOFkgxHB93BXl0PE3Z9EvHTJpSmBDF+s0y+1yDW1/EAL/wNRgSZABwIEQv+GZGmccAYTxjLXqijfGLkERTz527xX90+snqE2X6I+abhKKWYJ5VVG4g6ZIbqLh5CCko4CFsMxUfwN1j6yaiYntrcTcg6hFvEHtMSzzcyQZUoc67BV1l6Z7eE2A193Wvc39rUw6CSJjaU0POwBBePcTJN7PN/9nRK/6qJ1r2R5T7/8AVESI9dYiI9r7rBV75zRFcXHE50mnaiNXDjWkJBp+xFokKTeGS2BQJ/X0bOB0TKMkrLNJXxFDvp77waXEkJ81VGbCCifAIk0Nhm4LsWEnA9wdvOg8a0r0JeQP1nKr3Mcnggb8pbShxAeXj2Bz5EwSsUd3VS8eQpZMAJRLKja9puWGEgr3YKx66j2msu/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(316002)(83380400001)(6666004)(66476007)(36756003)(66556008)(52116002)(66946007)(6916009)(2906002)(8676002)(2616005)(6486002)(956004)(7416002)(86362001)(16526019)(186003)(4326008)(8936002)(26005)(6496006)(966005)(5660300002)(45080400002)(478600001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: eWY6semZSPscgkeO5IIk6ykW3d0ugGlmBLAmqeXddHy+RCKKfzvDT6+NpGFufMOmV+ymFCvpOT55wEjpRQbJMXV2yU5ScYNQItpuRNb0UecHRUXMEg9BVchIqdDkKoE3TIsE6aBFckyM0g3xjPCDnlX+9bXLguqMlNbnowTXTYK4SINXigjIo8pWdTPIWL9DGddHYy4YGOsl4u7wdNVGrlTZSlPiqlBkmOIYFsQnvnbF23P6rvmwzncZBml1rXWEsOg5T2FJSkmCGiNUKg7fKzNcCW6efMp1L4zyzMVAK+JUVhjl+qKuRUWQvhryBw6UwGKKlO7abXF/qBSYn4jNzXr09U39N0xtblrjXbeO46Rcv7IcLl1b5ILps8KBon3LS8kY3WA4l8o6rKHEtDMxDuVfzw9240yjH7D8zsoyLliwtwAXJtf0cyfUa/RIQJt791myS9QuWLg6yrITYgbw+Kydt2zRcKXHh2AjENAwqUhVUg77zup/N9OINcuxv5Gj
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964a7f7b-b3de-456d-056e-08d81bd678d0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 02:45:24.0882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XO+DXmCJKM0u2UgwEDA2TQ4clRP0DvcmCIeBMPlIywSOHn36UsEPxEnAVfQKsaDX5bkCPt3X7B7bNSr2aBG3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6112
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
Cc: joabreu@synopsys.com, jernej.skrabec@siol.net, darekm@google.com,
 jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-imx@nxp.com, cychiang@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sun, 2020-06-28 at 11:22 +0300, Laurent Pinchart wrote:
> Hi Liu,
> 
> (CC'ing Sam)
> 
> Thank you for the patch.

Thanks for your review.

> 
> On Tue, Jun 16, 2020 at 05:04:52PM +0800, Liu Ying wrote:
> > It doesn't hurt to add the bridge in the global bridge list also
> > for
> > platform specific dw-hdmi drivers which are based on the component
> > framework.  This can be achieved by moving the drm_bridge_add()
> > function
> > call from dw_hdmi_probe() to __dw_hdmi_probe().  Moreover, putting
> > the
> > drm_bridge_add() function call prior to the interrupt registration
> > and
> > enablement ensures that the mutex hpd_mutex embedded in the
> > structure
> > drm_bridge can be initialized in drm_bridge_add() beforehand, which
> > avoids accessing the uninitialized mutex in case people want to
> > call
> > function drm_bridge_hpd_notify() with the mutex locked internally
> > to
> > handle hot plug detection event in the interrupt handler
> > dw_hdmi_irq().
> > 
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> > Cc: Dariusz Marcinkiewicz <darekm@google.com>
> > Cc: Archit Taneja <architt@codeaurora.org>
> > Cc: Jose Abreu <joabreu@synopsys.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > Laurent,
> > 
> > I may see the uninitialized mutex accessing issue with
> > i.MX dw-hdmi after applying your below patch set[1].
> > I think patch '[22/27] drm: bridge: dw-hdmi: Make connector
> > creation optional'
> > triggers the issue.
> > 
> > [1] 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fcover%2F11569709%2F&amp;data=02%7C01%7Cvictor.liu%40nxp.com%7Cca86b38a5fbc49a44b1c08d81b3c5cde%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637289293354715359&amp;sdata=C7kz8HONVSNMYkQGb4h9uVcdZHqJVSmtwgnN4J2cKws%3D&amp;reserved=0
> > 
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++++++++-----
> > ------------
> >  1 file changed, 15 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index da84a91..4711700 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -3247,17 +3247,25 @@ __dw_hdmi_probe(struct platform_device
> > *pdev,
> >  
> >  	dw_hdmi_init_hw(hdmi);
> >  
> > +	hdmi->bridge.driver_private = hdmi;
> > +	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> > +#ifdef CONFIG_OF
> > +	hdmi->bridge.of_node = pdev->dev.of_node;
> > +#endif
> > +
> > +	drm_bridge_add(&hdmi->bridge);
> 
> This would introduce a race condition where a display driver could
> get
> hold of the bridge before it is fully initialized.

Yes, it seems it's a bit too early to add the bridge in the global
bridge list.

> 
> I fear the right fix for this may be to add a drm_bridge_init()
> function
> to move mutex initialization away from drm_bridge_add(). That's a
> rather
> intrusive change I'm afraid :-(

Looking into the issue more closely, it may be solved by moving
drm_bridge_add() from dw_hdmi_probe() to __dw_hdmi_probe() just before
__dw_hdmi_probe() returns successfully and a counterpart movement for
drm_bridge_remove(). The key is that hdmi->bridge.dev must be !NULL
when drm_bridge_hpd_notify() is called in dw_hdmi_irq() and
hdmi->bridge.dev is set in drm_bridge_attach() after drm_bridge_add()
is called.

This looks more safe because there is no logic change as
dw_hdmi_probe()/dw_hdmi_remove() see and just an additional
drm_bridge_add()/drm_bridge_remove() call as
dw_hdmi_bind()/dw_hdmi_unbind() see.

I plan to test this with i.MX dw-hdmi tomorrow.

> 
> > +
> >  	irq = platform_get_irq(pdev, 0);
> >  	if (irq < 0) {
> >  		ret = irq;
> > -		goto err_iahb;
> > +		goto err_irq;
> >  	}
> >  
> >  	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
> >  					dw_hdmi_irq, IRQF_SHARED,
> >  					dev_name(dev), hdmi);
> >  	if (ret)
> > -		goto err_iahb;
> > +		goto err_irq;
> >  
> >  	/*
> >  	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk
> > regenerator
> > @@ -3290,12 +3298,6 @@ __dw_hdmi_probe(struct platform_device
> > *pdev,
> >  			hdmi->ddc = NULL;
> >  	}
> >  
> > -	hdmi->bridge.driver_private = hdmi;
> > -	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> > -#ifdef CONFIG_OF
> > -	hdmi->bridge.of_node = pdev->dev.of_node;
> > -#endif
> > -
> >  	if (hdmi->version >= 0x200a)
> >  		hdmi->connector.ycbcr_420_allowed =
> >  			hdmi->plat_data->ycbcr_420_allowed;
> > @@ -3357,6 +3359,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >  
> >  	return hdmi;
> >  
> > +err_irq:
> > +	drm_bridge_remove(&hdmi->bridge);
> >  err_iahb:
> >  	clk_disable_unprepare(hdmi->iahb_clk);
> >  	if (hdmi->cec_clk)
> > @@ -3371,6 +3375,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >  
> >  static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
> >  {
> > +	drm_bridge_remove(&hdmi->bridge);
> > +
> >  	if (hdmi->audio && !IS_ERR(hdmi->audio))
> >  		platform_device_unregister(hdmi->audio);
> >  	if (!IS_ERR(hdmi->cec))
> > @@ -3396,22 +3402,12 @@ static void __dw_hdmi_remove(struct dw_hdmi
> > *hdmi)
> >  struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> >  			      const struct dw_hdmi_plat_data
> > *plat_data)
> >  {
> > -	struct dw_hdmi *hdmi;
> > -
> > -	hdmi = __dw_hdmi_probe(pdev, plat_data);
> > -	if (IS_ERR(hdmi))
> > -		return hdmi;
> > -
> > -	drm_bridge_add(&hdmi->bridge);
> > -
> > -	return hdmi;
> > +	return __dw_hdmi_probe(pdev, plat_data);
> >  }
> >  EXPORT_SYMBOL_GPL(dw_hdmi_probe);
> 
> Do we need to keep __dw_hdmi_probe() and dw_hdmi_probe(), can't we
> rename __dw_hdmi_probe() to dw_hdmi_probe() ? Same for the remove
> functions.

Yes, the renaming makes sense. Will do that in V2 if the above new
solution stands.

Regards,
Liu Ying

> 
> >  
> >  void dw_hdmi_remove(struct dw_hdmi *hdmi)
> >  {
> > -	drm_bridge_remove(&hdmi->bridge);
> > -
> >  	__dw_hdmi_remove(hdmi);
> >  }
> >  EXPORT_SYMBOL_GPL(dw_hdmi_remove);
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
