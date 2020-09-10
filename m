Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F017F2643C8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD0E6E8F2;
	Thu, 10 Sep 2020 10:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEE46E8F2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxY+/AhqgNvvk4wgIJW18yfMJR1GNO5B5FmayRjW1WEBpKw1n7qwEw5m5u4PFqczFVz5K7Cg0oTm7hRSnZEkAqgj3xbYpZnNQocyTYi0F9uECCoKpi2NIVJmbmYTJ0NqUbpgRbCWwQAwzFHmxqlaiAjgoBu9BukCmLI0Kn7WhphVB1tGdKqukviLkJn0nrklQCBBDFWhaezO9OALRkY17HcHLm0TJVT4nZrAsojo9oGM9LA+0Ep8dgqTaRJb1CENJyqwYhwaNTGdo4x7WEwBizQj8njC7b039RK3xpwSZwfioI6QkM7CNO9v6Utclp7hwiVWqx9ewb+ffUAjPAp5fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/bgZNIfzM8XidVQcHdYIlaIF1j85ESv8HN8yVdGBqE=;
 b=oWCMr2F5OIwxAy/FCDu4e+mm5A4URO4uaeM98/U4tkClclF+mE3s+8MmbXUF5klhUmLb8g+JvRu5hS79ZABhFelMsPAgrfyJtUf7F/zeP+d7sKmmDE/lCfYboLs7r7lXBX2MdCi1KW/AaNUbjWCTubbJs5NLzA+e2ITEiaApbxrd6OY0vXDG4TNP8PfY8VrJH++vvsw6NYi9ZMIjTIYv8jL4jrLlpxj7bbZ0DbmkkPofEuUDhfbNhllCCdhtR687DddyXW4nm8YTF5bwQd3NshIe8DcqIFtqqAjCgMSgHd5F6R60GQPoNNp2RniOjaGwEInqya4EKh9NXirxx24zwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/bgZNIfzM8XidVQcHdYIlaIF1j85ESv8HN8yVdGBqE=;
 b=YekgucFwGRAyqMtJHAzeyaSWSt6PtjQBhGmcvLpKiPl+Dw8KocV/COReyIbm1KgLzmNVY+7J2+susRuLb9AzjS/LYs7hZryBggQp71IhVCZ6b1DFAOIteYEcZU6prQmuoHOSY2PsPD+v66ALsocb/V2eG1r9LJSUQgbqdnyiD6c=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0401MB2638.eurprd04.prod.outlook.com
 (2603:10a6:800:56::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 10:21:32 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 10:21:32 +0000
Date: Thu, 10 Sep 2020 13:21:28 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/imx/dcss: fix compilation issue on 32bit
Message-ID: <20200910102128.5agk4vxf2jeonw3q@fsr-ub1864-141>
References: <20200910095250.7663-1-laurentiu.palcu@oss.nxp.com>
 <CAKMK7uGsJcg81a_cGebBgk3pwxj4VPrFfmV5AF+5fRyK3_Pigw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGsJcg81a_cGebBgk3pwxj4VPrFfmV5AF+5fRyK3_Pigw@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR02CA0088.eurprd02.prod.outlook.com
 (2603:10a6:208:154::29) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR02CA0088.eurprd02.prod.outlook.com (2603:10a6:208:154::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 10:21:31 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4dd0c990-e6e6-4c6f-91d9-08d8557349fa
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2638:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB26389591980F084AFDECEED3BE270@VI1PR0401MB2638.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4B81SCkh1DVW3i2BRcYRCc3erNDp49p5QRXjWF3ie7v7iGcUwE0JSwJc2PonPDf6UZ4A0nvAEukhkciDrsIkGR5QA9mA+PcpFMcZCHZzUmT01FPHqk7wIn+AzP3jt7nmswHC0xUch2nf4LWEe0XW9l1Gp2v73dTS4c5AHOGQw5qw41JkQwQJZDfcjMmaiMeeVFBqnIq/GQg5LrRWoYWC41lNG/MvPBLWcPSBVbi/LMiEtYsR7XxgVsBQQTHx3Pl0kSmt0m4PhIvwYp/L6y7dtiLiM15dnkfrXxbYnvTct/Q+5Ybc6iqhbDsOc5CS5TpP6VB4RK4SOsD0l8sunvIRHBhZgtBFaxGaMzH1D0G5M5+vx/Ab+o3gi/I2gWwmha3juev98zCc32dUTvFJo7fD6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(44832011)(53546011)(83380400001)(54906003)(83080400001)(2906002)(956004)(26005)(6666004)(8676002)(1076003)(86362001)(5660300002)(9686003)(6916009)(66476007)(6496006)(66946007)(52116002)(966005)(8936002)(478600001)(16526019)(316002)(4326008)(7416002)(66556008)(186003)(33716001)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +747ObDmVWqVi02sMZlIwwGU54RjGj1szCazEvwXo2Whz5PhOTZVQs7XFc5eIhxIDqbv/Vk9ajrrFZg3Cz5JUfDsCTcppLv6mdE3N8yUbXS+ejj3KnvMMcfsC7RTZybsFObIirSpARqzED7/IP8Gf2c9YZPJg51TnS/THH/pz4yJPjYo9I9XFpjWJj5KL74gNErdW/8Hp+AbAEddTNB3MaakRE69zN6ZVJ7UGPUD2KUJMaaOckis1sUk5mYdXzBvLdQM1IZk3Pvr/oPrFDLgdFc3sO0+qc20rmJK8n3gCxFxCEvzRGrHpWB3VBu+O1hfLDoRGl7/TJFiBKlkdHnLuyKcqS/t8OaYkFr5DKaZao2ukHORAQ64r25pEWQxk3lQQmXibqK6yFZmvn45sXWCMGakB/P0/muPnSr0fDcXPsar0gXC7eyedg4/iy7G6LkOY1HWRTGCnl3PxzBHOQ2pEI/x9RtvY5gU9BcEGX/2hIVzP8DIUfwcc4miDhldEJxV+084+T4mA0W0huTesSDjPqqlG4+FyxwaB468RCYX2mQ0p5ziOyoy8FBYEZzmogs+KyENWJWVEbw32uC4d2YU6W9ipmTqfD6ebYAAMV99uXVGkDTng9uZGQwta924kz9lDCO7YBegTWlPEBasOkga+A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd0c990-e6e6-4c6f-91d9-08d8557349fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 10:21:32.7271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMhq3uFOE456+42IwxOCZsm52911s5J5UBv2O8gMbUgW0UVfL87EPl6GwPWJ4yppJ/h5RzAg7YVIpU3E6OAGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2638
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 11:57:10AM +0200, Daniel Vetter wrote:
> On Thu, Sep 10, 2020 at 11:53 AM Laurentiu Palcu
> <laurentiu.palcu@oss.nxp.com> wrote:
> >
> > When compiling for 32bit platforms, the compilation fails with:
> >
> > ERROR: modpost: "__aeabi_ldivmod"
> > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> > ERROR: modpost: "__aeabi_uldivmod"
> > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> >
> > This patch adds a dependency on ARM64 since no 32bit SoCs have DCSS, so far.
> 
> Usual way to fix this correctly is using the right division macros,
> not limiting the driver to 64bit. But this works for now, would be
> good to fix this properly for compile-testing and all that.

I didn't see the point in using the macros since this is running only on
64bit. Though I will probably revisit it and fix it properly in a
subsequent patch.

> 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Reported-by: Daniel Vetter <daniel@ffwll.ch>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Please push to drm-misc-next.

About that, I may need some help pushing it. Apparently, my request for
a legacy SSH account for contributing to drm-misc got stalled:

https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/289

Thanks,
laurentiu

> -Daniel
> 
> 
> 
> ---
> >  drivers/gpu/drm/imx/dcss/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> > index 69860de8861f..2b17a964ff05 100644
> > --- a/drivers/gpu/drm/imx/dcss/Kconfig
> > +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> > @@ -3,7 +3,7 @@ config DRM_IMX_DCSS
> >         select IMX_IRQSTEER
> >         select DRM_KMS_CMA_HELPER
> >         select VIDEOMODE_HELPERS
> > -       depends on DRM && ARCH_MXC
> > +       depends on DRM && ARCH_MXC && ARM64
> >         help
> >           Choose this if you have a NXP i.MX8MQ based system and want to use the
> >           Display Controller Subsystem. This option enables DCSS support.
> > --
> > 2.17.1
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
