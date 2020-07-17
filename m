Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD822389E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD83B6ED8D;
	Fri, 17 Jul 2020 09:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20046.outbound.protection.outlook.com [40.107.2.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1C06ED8D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3chf8KoYM0IBZ21BnFEtdcRXn5U/PWX1oYnvH401o+NLBJMPqNupvjIN8L/B+kYMfIAzMn2rOdqJCt8g2rfQgycVEt8iG12++ZOqF8vXROtOSXc0rN5ZaHbNU1n7BV5/9UY2uzMjSkKzZTSjqCq3BNsSfL0kW/Hfvd1hh/BfQ65hiEZwaZ6NM9Frvj+RffOGPbe15a/7a29M7IQPHggK3GJbVBXNNELUdvKVw5iC0Rccdcd0f9Cler33GVka4s971G9QTDxrwYuqqFm9R5gUzzS93L7+TM486seEedWudxL/u9CzAbPz1q4yeRR5EgJwncn/pzDGaxuIY9LS62oUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpSEIbvfZshG/Bexc2osP93z/sUZEqj2m9vh1aQnlgU=;
 b=LyLTdBTeB2HjcqWt7Il+1qgPeKlqSfU6bFW6Sy3dM33OseyWTeqG4ZCOa/cxdgadF1MelnCf/Yk1LGLFqKOUkK0pHAru4/61i003O3GYi52ZTU2dHe9gSH1nWgJbS6+m01NlovQZwQYFPddxFYmlC1aDFptmySDha/Q32qJZcfxBn/oUxIIKzBOVHYG4SVQdav3OyWGnmOZov7WOEx+4AE+l/2/rWKao+24T4OwdtNlkpwsnGSj0FWwvhIEEAYHYbqOhYQCJjje743oux96COJv6hBH3GpXnNFAzBp2MtMOEPhF70S9IOsEHuZI+3L4nTrrb2ZAMET9hux/eFT44ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpSEIbvfZshG/Bexc2osP93z/sUZEqj2m9vh1aQnlgU=;
 b=i7Ir75cbio/PrTY9lg26nZEZSLcVnyTjz9Tv5uyXd6ZjEfErGGDxycAlZ4KDJtb5rlUgfcC9L9gy59tZ2ijMjDB8OfXw/D0CbAQRjSdD6ggTROVkRh2LLGnq3RAhZIFTwpTeKKZMgRHjD+17PE7YLANXnIqHh1EAxEUd+O3OGQQ=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0402MB3679.eurprd04.prod.outlook.com
 (2603:10a6:803:1a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Fri, 17 Jul
 2020 09:45:20 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3174.029; Fri, 17 Jul 2020
 09:45:20 +0000
Date: Fri, 17 Jul 2020 12:45:17 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, lukas@mntmn.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/4] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200717094517.layssf75bxe3ijs4@fsr-ub1864-141>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
 <3c03afff3256ec36e12b9d9408830fbb4853f982.camel@pengutronix.de>
 <CAKMK7uGsveS+cwxiTq7BGrB1OcE_ff9bAxgSFDMUSmS7gRLJ7g@mail.gmail.com>
 <febb665904a9c3c680363be8ea83f243ccd09cb7.camel@pengutronix.de>
 <20200717092758.GR3278063@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200717092758.GR3278063@phenom.ffwll.local>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::32) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR07CA0019.eurprd07.prod.outlook.com (2603:10a6:208:ac::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.10 via Frontend Transport; Fri, 17 Jul 2020 09:45:19 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea5d8468-3174-4cb5-9784-08d82a361e7d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3679:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3679958FA678E8C8DB94D7EEBE7C0@VI1PR0402MB3679.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwnFP6D8pvCLwww/MUa6G2QN+jPa4f+WR2eJOy3iWULJNSJGlHgks4JBS14dbWkPZsJfKCAdIdGd4J6Is1gQH/v49XKt+xZg1vsPmfK4U/BgLtaWSxob/4uLZiOZcyeKxLCHAV37vpzHrWy6i5hyza88Er0q2klYTdh4VlAcP27ABx2clCgUPoMBvRlP8F1hG6ckpB+kZPP9MtjkUGnEemOZTI6YlwCM1ahJSGUXZ1cnEN7fR/vN03/llezk74ekWJJDhnJeOxTsD/f0UwAWxf36a+poZ3j5Jh7wonaQMIwZ3SdHocsP6vj508yJfuFqsMwd4eDb5cZ+GoQknGfqetj5XYzogOBizJjiFlLl6dvUmbR5zOXHEPqOWYXSN4JzO0VCmpRGVXw4Zr3BWG6kEXCalkNvuE3L4aNZWmRK4nfnU1gl37OteL8RAFqka/v3C3cSCR3qKdmFT+BHNwf+7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(86362001)(1076003)(956004)(33716001)(83080400001)(5660300002)(6496006)(16526019)(186003)(478600001)(66476007)(8676002)(66946007)(52116002)(316002)(55016002)(26005)(83380400001)(9686003)(66556008)(8936002)(110136005)(966005)(53546011)(44832011)(7416002)(2906002)(32563001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QsikWOpwfC+WhoK0SAzp6LFLkG+7g9cjIV4bIxLkWk1F37n4V3G4iDRfX9R6NWv3h9zm72fQoU0Fk7nwbFohgd9in8VYmK3MRnJBAW+t5vFv/S79T/UJD9165jD6fH4JW0fuHtLZZR+180NL/01c3tDb6MR8VMKAV+8zeG5JqLYs+yksqXf97BpcItV6ehYIEEnMsYvdkanQ1BQlrmvIwxzc8rEHcRUS1LhfkjaYTddDPQQV+2q056JWTsXQ8AD/whxLIUkwtHFn3DCMinaLULVKQf+uj2o/Oc/Iyy6n1ZyiLCWQ2GzXOC/wRXm5rKXPp5/bclyf7ylVKYU0iNrXR1MMFpX2jTzOjPBJX1RdkFBQ9wI2XclOQU/VO5ZUDmI0VF2h4/dBuI9i6XV1lWbR0/ABRi34l7Q5blIf0SYP+2rkM79yKvUZ+Zu8IEFXSttOJnNnvTbCZmUjuYPlQbhZGgGxNmblBhKcGlg6eoBSTDY=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5d8468-3174-4cb5-9784-08d82a361e7d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 09:45:20.4950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vte8d0EROyODDsllEFzmMObZIaUr5RYYGO6OXj4+6+84KLxBqx3RJS85BJFsS/X2FwgMPujwZFYrfCsR3DZ7Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3679
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lukas and Daniel,

On Fri, Jul 17, 2020 at 11:27:58AM +0200, Daniel Vetter wrote:
> On Fri, Jul 17, 2020 at 11:12:39AM +0200, Lucas Stach wrote:
> > Am Freitag, den 17.07.2020, 10:59 +0200 schrieb Daniel Vetter:
> > > On Fri, Jul 17, 2020 at 10:18 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > Hi Laurentiu,
> > > > 
> > > > Am Donnerstag, den 09.07.2020, 19:47 +0300 schrieb Laurentiu Palcu:
> > > > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> > > > > includes only graphics plane support (no video planes), no HDR10 capabilities,
> > > > > no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> > > > > 
> > > > > Support for the rest of the features will be added incrementally, in subsequent
> > > > > patches.
> > > > > 
> > > > > The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> > > > > MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).
> > > > 
> > > > I think the series (minus 3/5 and minor correction to the DT binding)
> > > > is fine to go in now. So just some formal questions: are you going to
> > > > maintain this driver in upstream? If so we should add a MAINTAINERS
> > > > entry to that effect. I can offer to act as a reviewer in this case.

I can maintain the DCSS driver, sure, and the more reviewers the better.
Thanks for helping out with this. Should I send a v6 then with a patch
for MAINTAINERS?

> > > > 
> > > > How do you intend to merge this? IMO pushing this through drm-misc
> > > > seems like the right thing to do. If you agree I can help you get this
> > > > applied. If you are going to maintain the driver on your own, I think
> > > > you should then apply for commit rights to drm-misc.
> > > 
> > > drm/imx isn't listed yet as under the drm-misc umbrella, maybe we
> > > should put the entire collective of imx drivers under drm-misc? Or
> > > maybe it's just an oversight that the git repo isn't specified in the
> > > MAINTAINERS entry. Also maybe we should add the pengutronix kernel
> > > team alias there too?
> > 
> > drm/imx was exclusively the IPUv3 up until now, which is in fact
> > maintained outside of drm-misc in its own git tree. This has worked
> > quite well in the past so even though IPUv3 doesn't see a lot of churn
> > these days the motivation to change anything to this workflow is quite
> > low. And yes, the git tree is missing from the MAINTAINERS entry.
> > 
> > For the DCSS driver, if it's going to be maintained by NXP, I figured
> > it might be easier for Laurentiu to push things into drm-misc than set
> > up a separate public git tree. But IMHO that's fully up to him to
> > decide.
> 
> /me puts on maintainer hat
> 
> Much prefer drm-misc over random people playing maintainer and fumbling
> it. I think the reasonable options are either in the current imx tree, or
> drm-misc. Standalone tree for these small drivers just doesn't make much
> sense.

I don't have anything against either method, though I have to agree I
like things to be simple. Going through drm-misc sounds simple enough to me. :)
However, since there is going to be more activity in the DRM IMX area in
the future, reviving the drm/imx tree, and push all IMX related stuff
through drm/imx, could make sense as well.

Thanks,
Laurentiu

> -Daniel
> 
> > 
> > Regards,
> > Lucas
> > 
> > > -Daniel
> > > 
> > > 
> > > > Regards,
> > > > Lucas
> > > > 
> > > > > Thanks,
> > > > > Laurentiu
> > > > > 
> > > > > Changes in v5:
> > > > >  * Rebased to latest;
> > > > >  * Took out component framework support and made it a separate patch so
> > > > >    that people can still test with HDP driver, which makes use of it.
> > > > >    But the idea is to get rid of it once HDP driver's next versions
> > > > >    will remove component framework as well;
> > > > >  * Slight improvement to modesetting: avoid cutting off the pixel clock
> > > > >    if the new mode and the old one are equal. Also, in this case, is
> > > > >    not necessary to wait for DTG to shut off. This would allow to switch
> > > > >    from 8b RGB to 12b YUV422, for example, with no interruptions (at least
> > > > >    from DCSS point of view);
> > > > >  * Do not fire off CTXLD when going to suspend, unless it still has
> > > > >    entries that need to be committed to DCSS;
> > > > >  * Addressed Rob's comments on bindings;
> > > > > 
> > > > > Changes in v4:
> > > > >  * Addressed Lucas and Philipp's comments:
> > > > >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> > > > >    * Removed usage of devm_ functions since I'm already doing all the
> > > > >      clean-up in the submodules_deinit();
> > > > >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
> > > > >    * Removed en_completion variable from dcss_crtc since this was
> > > > >      introduced mainly to avoid vblank timeout warnings which were fixed
> > > > >      by arming the vblank event in flush() instead of begin();
> > > > >    * Removed clks_on and irq_enabled flags since all the calls to
> > > > >      enabling/disabling clocks and interrupts were balanced;
> > > > >    * Removed the custom atomic_commit callback and used the DRM core
> > > > >      helper and, in the process, got rid of a workqueue that wasn't
> > > > >      necessary anymore;
> > > > >    * Fixed some minor DT binding issues flagged by Philipp;
> > > > >    * Some other minor changes suggested by Lucas;
> > > > >  * Removed YUV formats from the supported formats as these cannot work
> > > > >    without the HDR10 module CSCs and LUTs. Will add them back when I
> > > > >    will add support for video planes;
> > > > > 
> > > > > Changes in v3:
> > > > >  * rebased to latest linux-next and made it compile as drmP.h was
> > > > >    removed;
> > > > >  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
> > > > >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> > > > >  * fixed a a spurious hang reported by Lukas Hartmann and encountered
> > > > >    by me several times;
> > > > >  * mask DPR and DTG interrupts by default, as they may come enabled from
> > > > >    U-boot;
> > > > > 
> > > > > Changes in v2:
> > > > >  * Removed '0x' in node's unit-address both in DT and yaml;
> > > > >  * Made the address region size lowercase, to be consistent;
> > > > >  * Removed some left-over references to P010;
> > > > >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
> > > > >    issues reported by kbuild for other architectures;
> > > > > 
> > > > > Laurentiu Palcu (5):
> > > > >   drm/imx: compile imx directory by default
> > > > >   drm/imx: Add initial support for DCSS on iMX8MQ
> > > > >   drm/imx/dcss: add component framework functionality
> > > > >   dt-bindings: display: imx: add bindings for DCSS
> > > > >   arm64: dts: imx8mq: add DCSS node
> > > > > 
> > > > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  84 ++
> > > > >  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  23 +
> > > > >  drivers/gpu/drm/Makefile                      |   2 +-
> > > > >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> > > > >  drivers/gpu/drm/imx/Makefile                  |   1 +
> > > > >  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
> > > > >  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
> > > > >  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 314 +++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 183 ++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 185 ++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  43 +
> > > > >  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
> > > > >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> > > > >  20 files changed, 4123 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> > > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> > > > > 
> > > > 
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > 
> > > 
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
