Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F91225E0A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 14:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A228689BAF;
	Mon, 20 Jul 2020 12:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99B189349
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 12:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwVv/GOZr7psTD3fXLm6xiCAR4Jhugx1hXUrTNCIBKsuLEYEZ9CAMSACqlcB4xiFaKTzORfL2zzmpIODqvFLmWfeLPJWb6xD70yb2DJ84mERpffAQ8YZJN8Q6mJnXpW3scuZ7bTQXShdcVj4KEA5JiqQLpNDEfiWMwYtl4vfCeme02CvLKe3hlygNcP78J5pcRZl8cKW/IA9HDAcLC7wIOUIiS63WRcFrzZt06v/bvGtIFdOWf33536HjayXFs+X7XDSqNWPMqs/c583R1y/d5f1x/04ym5oBiZHF6K29eDz4NGsPnimXv5nREse3Ri0XDgBEmCo8CrjfwFZnkV3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jatKx+aVppenEKrRbG4dTAkRSrBsJ/geLqF4CW1E98=;
 b=gDFdL97Qe5yoK0eX0fZZ3rrN6khxLl3FOtr4TaErCGzOrii16gxjA4c0NGhPrywQs+Uo9P1Nlq4K9/HDT0qQefYnvYj4wr9NzO4YiltZFz6na4/7GqIu31bU6iqf0yaHvyP+8r1ef6Jaw8WAgyukw6KHg6LSRi2U7tsKXs+zxhqs7fjU4rBOrZhp5wcnKPOfKAsh9WXLUfqk7A9WLlM8wcvb+a0anerDOTrzulPcURLdZcCKCuJkD/To43hi4hIV21p/l6Qafw3X8x04CE8o6siY5opHdcnX42C4ItorMv55/W0OYXOck/fFMmYH0vrmGQAfv4Xa3exYdlapz9RviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jatKx+aVppenEKrRbG4dTAkRSrBsJ/geLqF4CW1E98=;
 b=FyGtK7pjqc/XedXA6D19f+yuaDy3ia7dy9MGi7MGdqEX+jtTT9FU/9i10iYVY0prMCsNyUEX576HV+mEeDLXCT+khnDK2Ysm2u6ICoj2v7x2SLxjhdwWwoFpJIcUaFBaG9ojZ1eFB+avlq46sbbzxn/llPW7DzXYZJ8RHm1CdOk=
Authentication-Results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB3997.eurprd04.prod.outlook.com
 (2603:10a6:803:4a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 12:00:43 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.024; Mon, 20 Jul 2020
 12:00:43 +0000
Date: Mon, 20 Jul 2020 15:00:39 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 2/4] drm/imx: Add initial support for DCSS on iMX8MQ
Message-ID: <20200720120039.7jnh2vysebjh7oxh@fsr-ub1864-141>
References: <20200717144132.2206-1-laurentiu.palcu@oss.nxp.com>
 <20200717144132.2206-3-laurentiu.palcu@oss.nxp.com>
 <20200717194849.GA2369507@ravnborg.org>
Content-Disposition: inline
In-Reply-To: <20200717194849.GA2369507@ravnborg.org>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM4PR0701CA0013.eurprd07.prod.outlook.com
 (2603:10a6:200:42::23) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM4PR0701CA0013.eurprd07.prod.outlook.com (2603:10a6:200:42::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.17 via Frontend
 Transport; Mon, 20 Jul 2020 12:00:41 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69841666-1097-429c-e5db-08d82ca48706
X-MS-TrafficTypeDiagnostic: VI1PR04MB3997:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB39978CD37019054D5FDE5F00BE7B0@VI1PR04MB3997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ophhV9zPJ0h4F4PiiJikZZo/ZRfREurbJYtcVXI/Pkzeg+A9mNVwVkx1kJ1R3esC3xzgXfWMX/r4AgF29jT2dVXwMWpUMvQ5WFLPDcogXgyqjKJcMkdTQfJZu1d8P3DBjKhlPVTX1YcZMLus5TYmXDbED7lbpQ7BOIjYiFcSsmhQbSRsoSLp4uS60mUTtdDjj8yDx4JBS+VWsDj9wWXrAfJqcMfL8TWIQk5jZbq8tStpd0Ngy5UIyEuvHIkZHuGjH4Jv25P+XFHBbhh6lPM0MekOix9ibqIxlki/X+VCgaaLRxVIRHrZdxGdNyry8nCPpd8ruybkDz3oi4dawml0ZV2dd/Q58FkgFVsaVmZvp+ATHaJfl9TUDrwQQ7gOv2vbKpM3FleZFxQ23CbT1CkJ3bPHvopC9M3u2FV6waC2W/Br0oISDLmuBgLInueWipcPYHuy5LFAgE5vwJ4oCVN8Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(8676002)(66946007)(66476007)(66556008)(2906002)(316002)(8936002)(33716001)(55016002)(6916009)(9686003)(1076003)(7416002)(86362001)(83380400001)(5660300002)(52116002)(26005)(186003)(16526019)(6496006)(956004)(4326008)(966005)(478600001)(44832011)(54906003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: HTwJLr7crK2XVsG2xl6gwC/IWHkHVJgvBlQAqOmAUgQtCqTLGd94tNXEUseJK8aJZU5fNSqDM2ac+E3pvuCTEYoF3ac40Esx/Y2Y7oobmgJtmczZmTFLKRCh5DRInmTOfs6hMZhjx+KgF70n/r06lSQYjl3hie3geGY1nPdJ83yNtAAT3Xj3WhXFOKv0BS4jXra0kyOw3DgtaZaywWVSyt4Se5zuHUhzOwOGRpLxAyNxCjCvnRkug0ceVlhBXJlzfICFTCZDorQkONEfDeqTYOo3c607CwgpicohdA5Mzm9yup6RvwZQL7glWrRcDh9vShKHdIBoPYqiVZKZ5Pc4DRiwCL29VxAXh2XXbdCKPRxTcT0u74/csynAjFgbN8R907BPNJa5RzQ1tNet947StvIlFpBEipTLqrWuSUCCXgsxfsvx56J4Mi5xDm5ZnQDNYomBRhBYaPqktuSU/eIc0fXlWVPArfpcEM0jzge4GVI=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69841666-1097-429c-e5db-08d82ca48706
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 12:00:42.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrWmHyFPckKA5TI7rDRh/gbAmFrNjIDOTXcXeqBayt4RFi+Emjb2hgGouz/PRShbd1r42CvuSXi9A+WFFkCsFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3997
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
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 lukas@mntmn.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, agx@sigxcpu.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Fri, Jul 17, 2020 at 09:48:49PM +0200, Sam Ravnborg wrote:
> Hi Laurentiu.
> 
> On Fri, Jul 17, 2020 at 05:41:27PM +0300, Laurentiu Palcu wrote:
> > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > 
> > This adds initial support for iMX8MQ's Display Controller Subsystem (DCSS).
> > Some of its capabilities include:
> >  * 4K@60fps;
> >  * HDR10;
> >  * one graphics and 2 video pipelines;
> >  * on-the-fly decompression of compressed video and graphics;
> > 
> > The reference manual can be found here:
> > https://www.nxp.com/webapp/Download?colCode=IMX8MDQLQRM
> > 
> > The current patch adds only basic functionality: one primary plane for
> > graphics, linear, tiled and super-tiled buffers support (no graphics
> > decompression yet), no HDR10 and no video planes.
> > 
> > Video planes support and HDR10 will be added in subsequent patches once
> > per-plane de-gamma/CSC/gamma support is in.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> 
> ....
>         return drm_bridge_attach(encoder, bridge, NULL, 0);
> ....
> 
> The above code-snippet tells that the display-driver rely on the bridge
> to create the connector.
> Could this by any chance be updated to the new way where the display
> driver creates the connector - and thus passing DRM_BRIDGE_ATTACH_NO_CONNECTOR
> as the flags argument?

OK, I can give this a shot and the changes will be part of a separate patch
within this patchset, if that's ok with you. No need to go through
and review the entire driver again for this...

Thanks,
laurentiu

> 
> What bridges would be relevant?
> To check that the reelvant bridges are already ported.
> 
> 	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
