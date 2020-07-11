Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660921E8E2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35926E8FA;
	Tue, 14 Jul 2020 07:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879846ED80
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 01:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCkKVjiNBuLTgmSHh/jAkKnZVAaXHk2SYdEuBemOHCEGVq4TnBTEYU+F8jz1x7XbOb8OoWAi1MVjSpvrk+kJW58MEHtISyyez8qjeCR3QwuWOKNyCmoqTW8B7RtgfNWydXzqx2h0zV4mQ79EBWD+mImgOPFNZ/Y5yuu9WLgfempfP86lhiQfNt45siMUIiSU8chESkceqEu+cPtExJTX9up4pAXtEEwK/bFbF1EHodeFS9Dnq4Z56GT2bDfxh05pfpN5EaWOY7xc3rlXfrwoatdYrJdfxGu8V6jOY/nLpb3bn+w9Wq4rubGHrafKSboZDMsuuS3Ktykj7MUafU1pNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaezhLMj4py93tWDbKqkPpV84Pjyk9MLXFamApu6RlQ=;
 b=ZThId4awGZn4EIv0Tsa+b53qjIivJ6pFUgsAVQ8SzQE0O/dKAd67BzkPGM0RB1HWBapcBzreuwqWyCM+XDA/4n9kU2hufh7N7roekM+zW3N2knpEDeEdxqJfjRGcbQ9tDC4rf5GbikaHSXuwngEoxRaOgehnzE73CTs6bhHw7O3fJlezhbLy+c1RNz7xL22VbDxJ3ymPbuLbTiQUlRSXLkPvOq2WcWF3VtmkZagZyBrd9FdtvyRLQ3u3DvOSzh3pmVO9CvtYujNhp3t7jrA3YbyQOyOgf/gcUBkIyvLfsH0dVvTDJ6yrDQBBF3GogHnw94yBB7M8+ZkX+YpZT9+ykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaezhLMj4py93tWDbKqkPpV84Pjyk9MLXFamApu6RlQ=;
 b=FrKOyrMAJMn46dL+R6jI02971kO/EFGCqkNEb5YirSEy/P+cRhBbljFV/H2WYDby5y8rGKbG+5uy2eey3JIAifR9splPS5TGU7nZouPoZvfLiCpdOCow9R/6X/aiO02uyYjkZoti2S56Bi/Aayh9xGsxcMs0vJ0+WTRTMFFVo/8=
Authentication-Results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5584.eurprd04.prod.outlook.com (2603:10a6:803:d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Sat, 11 Jul
 2020 01:00:05 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3174.024; Sat, 11 Jul 2020
 01:00:05 +0000
Message-ID: <1b5b0422f65cce52f74d20c44954c4737ef03d32.camel@nxp.com>
Subject: Re: [PATCH RESEND v2 2/2] drm/bridge: dw-hdmi: Always add the
 bridge in the global bridge list
From: Liu Ying <victor.liu@nxp.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 11 Jul 2020 08:59:53 +0800
In-Reply-To: <20200710173206.GC17565@ravnborg.org>
References: <1594260156-8316-1-git-send-email-victor.liu@nxp.com>
 <1594260156-8316-2-git-send-email-victor.liu@nxp.com>
 <20200710173206.GC17565@ravnborg.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vbox (183.232.44.32) by
 HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.5 via Frontend Transport; Sat, 11 Jul 2020 01:00:00 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-Originating-IP: [183.232.44.32]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76141c14-a567-4dc4-625c-08d82535bf65
X-MS-TrafficTypeDiagnostic: VI1PR04MB5584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5584C8C81FA8C7AEBDCD021098620@VI1PR04MB5584.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucw61FoIbNmtfB16nW+ovPBcXPBPU/l7mxY6faiT3ZnXVJebiVX9Hkoec2lTJnNOrLk7M39i6ahTL3PNoqWHkUKWkvkHCgPZ8z3ZjpO9+PDgV4k8qG8uWitzq4yb4VZWqoBRWnzZIMiC8pp56ijfbw38chEotwXlvBf8ytZXIpt8DfnMmnIvlKCLyNlUsLpx210FwIhk8hbzsKUXv1PVwcpKinXFPElhvI29CgCq3XYHIl+INalac+Aa3YOG5opclsO57F33nXkxySpZZoCkQ2b+wxgjEArTm2cZj7TY9cX/+e8/9FSA7dTLzBzZ+Q6g4y6vY9eZCWikfKQ43dvmOpcpM6k4V7hsaICc1lspTAe6WOMF8EIhXmYPPC+l44SPLCAfKmY+ep0HCjMUZpL4CLeupjbHP06od0Epbx701vU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(966005)(36756003)(66556008)(6496006)(2906002)(5660300002)(52116002)(66476007)(54906003)(7416002)(316002)(6916009)(478600001)(45080400002)(26005)(4326008)(83380400001)(186003)(66946007)(16526019)(6486002)(6666004)(86362001)(8936002)(2616005)(956004)(8676002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: s9Sx+8ZEtuBLtKIE2Pp0zH9EEJ63ne/bcI5OUBYpW1jvhis9jOgsPq+XqG7ubmJMDGf58hv+7TzXOAgXDkDAtc+RPnX4RskcwX7zO+p/BB9TX5KfUA6T+yeAyRn6EkRSIK5rA/zu8NcoB3TGig+0nS+yZJm/hb8OByFEsvVaTxF6lHxoWV0tQ+Vdulz+3oF30NiSVZAjRAYtsMadLnyFku+/X7Y8Ebz6Mhmmh0+zmZ+M6VyCVq6RN36eli8tqMOlpJDmRou+mpdHLtKI8e4H13TcFtlXH/l3Ta6qOIMqC6TCOyOz0WNv7G8ZZ+lTKv6WqlPK6pu0uJ5acivrWRhCbV48kHk09Jln5P3dh36RS4H8udb9Trf360o7iCuAsjB6B9IbWrrst6MSKzh7O+ZOc47bk9kKu0+hEFA9MVCvkmVK3MH+xn6qXA36dBNM1nm1QRSCUb7s4wicPtELCi7x9Jm6tmtTNUUIPWsBXioUx6k=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76141c14-a567-4dc4-625c-08d82535bf65
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 01:00:04.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r86CKEUqbTSYoGI0ctWe6vVdjq45XB1SyDSfq+227FvZmCVffGq17ejghADkeihMgKaUKwgyMrPJha7qFLNpnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5584
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Archit Taneja <architt@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Jose Abreu <joabreu@synopsys.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Dariusz Marcinkiewicz <darekm@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-07-10 at 19:32 +0200, Sam Ravnborg wrote:
> On Thu, Jul 09, 2020 at 10:02:36AM +0800, Liu Ying wrote:
> > It doesn't hurt to add the bridge in the global bridge list also
> > for
> > platform specific dw-hdmi drivers which are based on the component
> > framework.  This can be achieved by moving the drm_bridge_add()
> > function
> > call from dw_hdmi_probe() to __dw_hdmi_probe().  A counterpart
> > movement
> > for drm_bridge_remove() is also needed then.  Moreover, since
> > drm_bridge_add()
> > initializes &bridge->hpd_mutex, this may help those platform
> > specific
> > dw-hdmi drivers(based on the component framework) avoid accessing
> > the
> > uninitialized mutex in drm_bridge_hpd_notify() which is called in
> > dw_hdmi_irq().  Putting drm_bridge_add() in __dw_hdmi_probe() just
> > before
> > it returns successfully should bring no logic change for platforms
> > based
> > on the DRM bridge API, which is a good choice from safety point of
> > view.
> > Also, __dw_hdmi_probe() is renamed to dw_hdmi_probe() since
> > dw_hdmi_probe()
> > does nothing else but calling __dw_hdmi_probe().  Similar renaming
> > applies
> > to the __dw_hdmi_remove()/dw_hdmi_remove() pair.
> 
> Hmm, it took me some attempts to read this.
> Anyway, applied as-is to drm-misc-next.

Thank you, Sam.

Liu Ying

> 
> 	Sam
> 
> > 
> > Fixes: ec971aaa6775 ("drm: bridge: dw-hdmi: Make connector creation
> > optional")
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
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v1->v2:
> > * Put drm_bridge_add() in __dw_hdmi_probe() just before it returns
> >   successfully so that the bridge shows up in the global bridge
> > list
> >   late enough to avoid potential race condition with other display
> >   drivers. (Laurent)
> > * Rename __dw_hdmi_probe/remove() to dw_hdmi_probe/remove()
> >   respectively. (Laurent)
> > * Cc'ed Sam.
> > 
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 44 +++++++++--------
> > --------------
> >  1 file changed, 13 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 137b6eb..748df1c 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -3179,9 +3179,11 @@ static void dw_hdmi_init_hw(struct dw_hdmi
> > *hdmi)
> >  		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
> >  }
> >  
> > -static struct dw_hdmi *
> > -__dw_hdmi_probe(struct platform_device *pdev,
> > -		const struct dw_hdmi_plat_data *plat_data)
> > +/* -------------------------------------------------------------
> > ----------------
> > + * Probe/remove API, used from platforms based on the DRM bridge
> > API.
> > + */
> > +struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> > +			      const struct dw_hdmi_plat_data
> > *plat_data)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *np = dev->of_node;
> > @@ -3438,6 +3440,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >  		hdmi->cec = platform_device_register_full(&pdevinfo);
> >  	}
> >  
> > +	drm_bridge_add(&hdmi->bridge);
> > +
> >  	return hdmi;
> >  
> >  err_iahb:
> > @@ -3451,9 +3455,12 @@ __dw_hdmi_probe(struct platform_device
> > *pdev,
> >  
> >  	return ERR_PTR(ret);
> >  }
> > +EXPORT_SYMBOL_GPL(dw_hdmi_probe);
> >  
> > -static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
> > +void dw_hdmi_remove(struct dw_hdmi *hdmi)
> >  {
> > +	drm_bridge_remove(&hdmi->bridge);
> > +
> >  	if (hdmi->audio && !IS_ERR(hdmi->audio))
> >  		platform_device_unregister(hdmi->audio);
> >  	if (!IS_ERR(hdmi->cec))
> > @@ -3472,31 +3479,6 @@ static void __dw_hdmi_remove(struct dw_hdmi
> > *hdmi)
> >  	else
> >  		i2c_put_adapter(hdmi->ddc);
> >  }
> > -
> > -/* -------------------------------------------------------------
> > ----------------
> > - * Probe/remove API, used from platforms based on the DRM bridge
> > API.
> > - */
> > -struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
> > -			      const struct dw_hdmi_plat_data
> > *plat_data)
> > -{
> > -	struct dw_hdmi *hdmi;
> > -
> > -	hdmi = __dw_hdmi_probe(pdev, plat_data);
> > -	if (IS_ERR(hdmi))
> > -		return hdmi;
> > -
> > -	drm_bridge_add(&hdmi->bridge);
> > -
> > -	return hdmi;
> > -}
> > -EXPORT_SYMBOL_GPL(dw_hdmi_probe);
> > -
> > -void dw_hdmi_remove(struct dw_hdmi *hdmi)
> > -{
> > -	drm_bridge_remove(&hdmi->bridge);
> > -
> > -	__dw_hdmi_remove(hdmi);
> > -}
> >  EXPORT_SYMBOL_GPL(dw_hdmi_remove);
> >  
> >  /* -------------------------------------------------------------
> > ----------------
> > @@ -3509,7 +3491,7 @@ struct dw_hdmi *dw_hdmi_bind(struct
> > platform_device *pdev,
> >  	struct dw_hdmi *hdmi;
> >  	int ret;
> >  
> > -	hdmi = __dw_hdmi_probe(pdev, plat_data);
> > +	hdmi = dw_hdmi_probe(pdev, plat_data);
> >  	if (IS_ERR(hdmi))
> >  		return hdmi;
> >  
> > @@ -3526,7 +3508,7 @@ EXPORT_SYMBOL_GPL(dw_hdmi_bind);
> >  
> >  void dw_hdmi_unbind(struct dw_hdmi *hdmi)
> >  {
> > -	__dw_hdmi_remove(hdmi);
> > +	dw_hdmi_remove(hdmi);
> >  }
> >  EXPORT_SYMBOL_GPL(dw_hdmi_unbind);
> >  
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > 
https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cvictor.liu%40nxp.com%7C0f923c54af014f54175608d824f72c5d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637299991302447959&amp;sdata=kgoboL8o%2Ft0qvvlQw4nyrHlcusib5Ynuc%2BY%2Fn70fu14%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
