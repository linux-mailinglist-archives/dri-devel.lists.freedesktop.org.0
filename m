Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12841264409
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D2A6E8F4;
	Thu, 10 Sep 2020 10:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F6B6E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNnoY+KBehJIw0BVciC8MFqcvIhnp8HD4w98yjOvSw5qx6/WKSQzvX1MKUICj1kveIvaA3roEUFTCciEvdVJGaC7aHSEe4ajmvec8uVcPgJigM2vj/dzvQpk7fvCENpko6RMzvzEJXRPOPSDN+mZwCOYp2mkraQE1yaJsgO4tbAefsKuF8hBEXyLuXhhOsOzgeThzXofnThhh/+0bpeRs/yuhMi7LnWWJuQzWaBShBKX2IJhA9/xf62LF4dhcsMDImd10H1+dRIiX3aX5JUb2nT9rBEV8OOtPfwoa5pmk29+RT9bIPyYrsOKGLFqXP2uU+jThn+wuZ6BWrifoUZoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulCXFmdY3o1nnGvMQFxtj+uqVeJh5sGS2t3LHrsHxbY=;
 b=XizqmDqZ/246QRdVh7A6ELho3curzxfHshTB1dtYjG4j5+d8LI36v1jLT2D5pbxyFASaX4i4DJVIItb6iiNV67kDxSZzSvsXKjOaRTMj8zDdT+8TEghs18rz2I7VBP3b6ZSVxXVWpv9fz9RsBTh2wFsNdJs0JVmfkAgcQ/NO5d8zsn4j9oO75GBETYOP53IueTQ9YLAii3hUAMMxvC3lFjk2x4RBoQSGs9gHKeRggTo1A5HW2vDDBG6xf2XvnS0bSZdbZDWcYCjadAndCtF+o0QXRXfMuYJFlz7RkUsCb3FsssKFuBnxBz5aqCk306Ibq2n7Ad/VEl9Yn+87iWs+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulCXFmdY3o1nnGvMQFxtj+uqVeJh5sGS2t3LHrsHxbY=;
 b=JNWcWB7RboplJRLUADmNrt8wS7iWizwTKefHtQ5S1wE+q2mUTWU2s+JPQPnA6vv3ekqy1tvOKGEFydKlmxbDQKA1UOCTTFQFXOk9FLBsVSRXlB6ctm59NIXGcSmqpNlngunju6CrrQjQCKXKap/ZebthwbaVLanXwuplwEymzIg=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4096.eurprd04.prod.outlook.com
 (2603:10a6:803:44::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 10:28:21 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 10:28:21 +0000
Date: Thu, 10 Sep 2020 13:28:16 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/imx/dcss: fix compilation issue on 32bit
Message-ID: <20200910102816.rx75lz3iwrkrdyld@fsr-ub1864-141>
References: <20200910095250.7663-1-laurentiu.palcu@oss.nxp.com>
 <CAKMK7uGsJcg81a_cGebBgk3pwxj4VPrFfmV5AF+5fRyK3_Pigw@mail.gmail.com>
 <20200910102128.5agk4vxf2jeonw3q@fsr-ub1864-141>
 <a325e1594dff339ddd6858f0ac93698582a6000a.camel@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <a325e1594dff339ddd6858f0ac93698582a6000a.camel@pengutronix.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::22) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 10:28:20 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd75a3d0-5382-4af5-9507-08d855743d84
X-MS-TrafficTypeDiagnostic: VI1PR04MB4096:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4096CDC4EE4D116310C08AEDBE270@VI1PR04MB4096.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wp/Knj7wDPUONWtNdcIwH+fSirHZ9VY52JeZ8AWxBWVKAJYo9eKeZQc+5+rFswEE4pGwYHGj0vTrERBN5nJRLd2DDCnK3GbGedTEjJ5UeTUFtlYTaGPLZJg7zv2Hj7BWXg6cfzLIQPoqd5oB0NbBDt91037a7svwhaS28HmRFZ31ZEewaqdVmWaiOjri6pQrBkDsCTsYRy7oWgaoH/gUG59i4lE51AH9ijKPmLCCcC94ErZDzv7F2MUfYlJ+3fV0TZN7K2/JQvub74E+NIZaEh2X6lETcvGcIGl5a+xz0ypMW0QJcrhckgKKqL9oZNeEfB3nfYIwGrMIzQWibyd8FSWQunpm7Tx+21n8ngSt/+1Ucrl91fS2uTRW2PggYcz9x0N0q3mq7YSLz9HP/bv3+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(52116002)(55016002)(1076003)(316002)(6496006)(26005)(83380400001)(53546011)(83080400001)(4326008)(7416002)(9686003)(966005)(6666004)(54906003)(66556008)(66946007)(66476007)(5660300002)(8676002)(2906002)(44832011)(86362001)(33716001)(16526019)(478600001)(186003)(956004)(8936002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6NrufEg2SFriH5D0hzaR69dHzpRkWzh+oBySTD1IBeSBXAODr6O6H4p9mpgww/Bl+fgke5KKPKtr0c4eaRPVV6aOeBrj/0j7ELaMZ3mlvjJ6gv8JIkNaQa5pEdauHzoOzWTyJOrxDTwzLFhFfW2A5IdnCNdj4zvSYLenAPURQ0C7CdByWl9U3u7HMqNzvnkYpLSXa2qMNSlzk8TbIgNER/lf0PajML3Y/saapjLLGfLAfx139iH8heTe+IzmeDPBZxQicvG4RJEhhCU8yXEV05+hiq1GhsdyqGnN53KUKe0jXa0lp8IrbbFCT4pci8/Xvi5m/ye4vtcY1JPwFPAKwpGgawm0jwFjZWKumLSy02SbIv2h+eQr+NJiXQI5VEyKdjsxh5H+OlgzOluplpFruY4EWcnYGU7cCMvpQxuqxf1MJIjY8WrOjGUHXu90H2jW4N5rP8VNmUUjB2iuACVNU9D/whKexPXfev0S1Lrhp+4+5/h4miFLTp/7erV/4u6Xl5iiQlhvLhH4nv48RfcUlHVpaGM+YNRaxa6BlKFN/xh+Su0uXar1EKoZ03v8uznzxtu09gVeZWRAppAa+nGNtd2lzExUXaaN579yaNoyW2NMUYq+mpO/SFqZqiSzyp370wXgHoVgI/C8Gs5fy2pW6A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd75a3d0-5382-4af5-9507-08d855743d84
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 10:28:21.1490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ou3nTtUpSBkDfrG5SBNUCzv+NqUOA8lQwG52VGdcm2QQELoK5HTRiNnQv2HOGPbRS3Sce6S2dweH/4q9WjZvTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4096
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

Hi Lucas,

On Thu, Sep 10, 2020 at 12:24:44PM +0200, Lucas Stach wrote:
> On Do, 2020-09-10 at 13:21 +0300, Laurentiu Palcu wrote:
> > On Thu, Sep 10, 2020 at 11:57:10AM +0200, Daniel Vetter wrote:
> > > On Thu, Sep 10, 2020 at 11:53 AM Laurentiu Palcu
> > > <laurentiu.palcu@oss.nxp.com> wrote:
> > > > When compiling for 32bit platforms, the compilation fails with:
> > > > 
> > > > ERROR: modpost: "__aeabi_ldivmod"
> > > > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> > > > ERROR: modpost: "__aeabi_uldivmod"
> > > > [drivers/gpu/drm/imx/dcss/imx-dcss.ko] undefined!
> > > > 
> > > > This patch adds a dependency on ARM64 since no 32bit SoCs have DCSS, so far.
> > > 
> > > Usual way to fix this correctly is using the right division macros,
> > > not limiting the driver to 64bit. But this works for now, would be
> > > good to fix this properly for compile-testing and all that.
> > 
> > I didn't see the point in using the macros since this is running only on
> > 64bit. Though I will probably revisit it and fix it properly in a
> > subsequent patch.
> > 
> > > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > > Reported-by: Daniel Vetter <daniel@ffwll.ch>
> > > 
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > 
> > > Please push to drm-misc-next.
> > 
> > About that, I may need some help pushing it.
> 
> I've already pushed a few minutes ago, so we don't disturb the build
> tests any longer.

Thanks a lot,
laurentiu

> 
> Regards,
> Lucas
> 
> > Apparently, my request for
> > a legacy SSH account for contributing to drm-misc got stalled:
> > 
> > https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/289
> > 
> > Thanks,
> > laurentiu
> > 
> > > -Daniel
> > > 
> > > 
> > > 
> > > ---
> > > >  drivers/gpu/drm/imx/dcss/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> > > > index 69860de8861f..2b17a964ff05 100644
> > > > --- a/drivers/gpu/drm/imx/dcss/Kconfig
> > > > +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> > > > @@ -3,7 +3,7 @@ config DRM_IMX_DCSS
> > > >         select IMX_IRQSTEER
> > > >         select DRM_KMS_CMA_HELPER
> > > >         select VIDEOMODE_HELPERS
> > > > -       depends on DRM && ARCH_MXC
> > > > +       depends on DRM && ARCH_MXC && ARM64
> > > >         help
> > > >           Choose this if you have a NXP i.MX8MQ based system and want to use the
> > > >           Display Controller Subsystem. This option enables DCSS support.
> > > > --
> > > > 2.17.1
> > > > 
> > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
