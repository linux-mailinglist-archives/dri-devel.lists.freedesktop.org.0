Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6645A25568E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 10:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0296E181;
	Fri, 28 Aug 2020 08:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359346E181
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gm2G/PtSO6lNZVegthIc6q2DvoXxqngn/A8i78CWtfL5LyNV7NXT94O1MxGCsG0oV1srY8MoocYLVPZ386fTsPUHJ531m6LHX9ntnvk1DZBmLlJ2xQZKnsW2SQWPNDhW6W4nffPMiNWe6le420pGiEcCd9PBL3Z2GzLip6k8KzHZ3URDxDl/extTuS1MzyIvLuj/gEBd7vLwp36IBK/VBPBhH0d1ppHY93xQxES2hdQTPnhi1hKTfkOKMzTGfhCikmMxmYB8XXq1SG3DcX/FlW4U8UWDA4tvYSgN70rDaiPFmGibXHNfSMDeHOre2Iwg9E3k1Disg0EqhKkOtgdnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUgU3KOb5RqyuDtxFJMEA6HPMfbj53wK4TOhrGd2hoI=;
 b=goloCVYxFfnzFhGteTALgoxYxCDlNJ6casacpYloMovEGJ8JHVIzt3X7tHhn6GOhgKLk4aWkVg+3A6xwBdz/j8a5o1EafNAbvLNP2Q1IuEIlDzEj0s5TgcJDfY4o+Zsmsm19uVx5gmxOTFrB6u1EN1BRDQAz/OGBHMfEst1TtMaIqMUH+xwDchwtqys6xvjEvkF8syCTxltSUukKBYkHUSC/Ulc5XYVRg/4a9vqlqtR3tI9mR/qXAAOQk0c0tbfkXapqD6JhxYCTzKbk5mbLBMJnDQy7IJyTSsQeNp1jcBd03Hif7YJMtXwayk5xsJMmhwOvNcQ6P3dyw1uIRXx+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUgU3KOb5RqyuDtxFJMEA6HPMfbj53wK4TOhrGd2hoI=;
 b=eYrIZ9ShnPimZy7GqcY7QLx0FQNA8cutxmfd6+SvhfaNHiFJQsFAVNiCw6joQoKi4nIv5o3fc122np+CkMg4Fm29ogsphHloYvVeLGGAawwsGXuChNsFZ0+ko9ZCyezSaCyOKwAzwIqsxUjbPexXJAiL65kFqIDfjl7lcSQvbbs=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0402MB3437.eurprd04.prod.outlook.com
 (2603:10a6:803:7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 28 Aug
 2020 08:36:25 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 08:36:25 +0000
Date: Fri, 28 Aug 2020 11:36:20 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200828083620.6m5yhcv7rg5tckzh@fsr-ub1864-141>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
Content-Disposition: inline
In-Reply-To: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM3PR07CA0127.eurprd07.prod.outlook.com
 (2603:10a6:207:8::13) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM3PR07CA0127.eurprd07.prod.outlook.com (2603:10a6:207:8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.5 via Frontend Transport; Fri, 28 Aug 2020 08:36:24 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e876374b-dae8-4271-736d-08d84b2d7323
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3437:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3437B74B646617BC34659CD5BE520@VI1PR0402MB3437.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euL2OIigqQfEswdtHaj7C++3r2yshX1Odaz9n2TgFvumlbCSyjT5Y2N/j2CwHgTmjVE8FiZmCI6NJpigdbnJqcPMvo5lPXnZ3IlJCaiiMvqDGRVKlZ/xbPy2t5DmOVINqM7X6UJmCd3UZSEY9aMEAsAGnYrkiRy7TSAAbF40fyE6xes+db2YOyPGY22k/WboqVMYldIzFfZfOrPB2xlKuKZpnsSp/Wcn3celKCuwOp/pg4SHmg7jSQa+A/xdAFr1JaTlFZUZi8TzVzybChm28BLfKMUWULeBbg6A52zoBKKFZT9QKMpkBRshFu5bmVf8cv2PPpNiMxaxFnoan02XLh9DTleBAcMa4q5asQ68e5mRjvm3SMNMAWJ9gyqK/VaZfh8AiP9q6JrtX+9SMsg0OTI8EZmOJI3PGP1+oGCDNMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(186003)(478600001)(16526019)(6666004)(2906002)(55016002)(52116002)(8936002)(26005)(966005)(6496006)(83380400001)(8676002)(5660300002)(9686003)(86362001)(316002)(956004)(110136005)(44832011)(66476007)(4326008)(1076003)(66556008)(66946007)(33716001)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: a51DPbWaVjIq7xnbyrhVnLC1hEFlc8ePaXzeAT1I8JrtmugCEEttFEjGFp/nT4excJnxH1z2WyDFe4ik9QqsM6tRq18LhWYMdJJN+IRH8tfSJ8CWIXuVvDK/pv79ft+4zlVxxYB5p+cNOKK9bCScx1Fjb34l0bWGo49AhxrejIe2sjl1I10tkEJDlhYz5JB0+nSmQVQLKYPqUup/5v21flHBzkIa23f+pAdj7t6uiqgO5QutzVJIe1ZCHMILFpmZo/HuL8Db5IOVwUq0S7DSc4WHb+PIEVgsEg1GdBHEyOO801NvwA9Kx+3zxCqQ77pOBkAaxApU3NQ1tEN2pdvqOIfrSfpyF4regJJfjdX2BeVIpmxBiiM8uC2+ksyzQy3+S59+kf6oqBafWtM8J0v1LeQba5Bo2z4AessIVkR4N97iGGnfr8BtJAEqO1IKocD4tsoT3h2fTAMxOXcLtAxK6SWLQEHDVRTQkqxk/QU9bU/z8ytqYfak62kSbjukkqWXgZCixSyqAJ/P1d3ccnakyu2YLjNax9cXAUaUffSxBAnwG7Xlndk8mOYSXfKRNENQdQd6HdkMlVS75ZkqAi48EABPGaNH54Vcfe9Usu6gL/D/cZ2VR2yx9/miMLQh7rQhgZ64g3RAHoD82AuF4VHT6Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e876374b-dae8-4271-736d-08d84b2d7323
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 08:36:25.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ohj9U6djXf8kjabpy20swlpjhCaVNM+mgMMg0Im/xDNsfDOVU4ulSiIddHhADnhRB/QVvi5ZhleEIkFTWl78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3437
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
Cc: agx@sigxcpu.org, lukas@mntmn.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

I was wondering about the plans to merge this series. Since not many
people can test it properly due to lack of DCSS support in the upstream
NWL driver (which I heard it's coming soon) and a completely nonexistent
HDP driver, are we going to take a leap of faith and merge it as is? Or
should we wait?

As to who is going to do the actual merge, I know we had a brief
discussion about it some time ago and I was supposed to apply for
drm-misc rights, however it feels a little awkward to merge my own
code... :) Though, I might not even qualify for drm-misc rights anyway,
considering I haven't been very active in this area... :/

On that note, I will probably need help with the merging, provided it's
still happenning. Will you be able to help me out with this?

Thanks,
laurentiu

On Fri, Jul 31, 2020 at 11:18:28AM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> Hi,
> 
> This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> includes only graphics plane support (no video planes), no HDR10 capabilities,
> no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> 
> Support for the rest of the features will be added incrementally, in subsequent
> patches.
> 
> The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).
> 
> Thanks,
> Laurentiu
> 
> Changes in v9:
>  * Fixed a compilation issue found by Guido in his setup: 'select
>    VIDEOMODE_HELPERS' was missing from Kconfig;
>  * Use imx8mq-clock.h in the bindings file so one can understand what
>    those clock values mean;
>  * no other changes done. Couldn't address the hang Guido reported as
>    it's not happening in my setup. However, in my tree, there are some
>    extra NWL and ADV patches applied on top of upstream ones... Also,
>    removing them and testing only with upstream, even if there's no
>    image out, does not produce a hang... :/
> 
> Changes in v8:
>  * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
>    out. SRC is not used in DCSS driver;
>  * Nothing else changed;
> 
> Changes in v7:
>  * Added a patch to initialize the connector using the drm_bridge_connector
>    API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
>    Guido's patch [1] applied and one fix for ADV [2]. Also, some extra
>    patches for ADV and NWL were needed, from our downstream tree, which
>    will be upstreamed soon by their author;
>  * Rest of the patches are untouched;
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2020-July/273025.html
> [2] https://lists.freedesktop.org/archives/dri-devel/2020-July/273132.html
> 
> Changes in v6:
>  * Addressed Rob's comment and added "additionalProperties: false" at
>    the end of the bindings' properties. However, this change surfaced
>    an issue with the assigned-clock* properties not being documented in
>    the properties section. Added the descriptions and the bindings patch
>    will need another review;
>  * Added an entry for DCSS driver in the MAINTAINERS file;
>  * Removed the component framework patch altogether;
> 
> Changes in v5:
>  * Rebased to latest;
>  * Took out component framework support and made it a separate patch so
>    that people can still test with HDP driver, which makes use of it.
>    But the idea is to get rid of it once HDP driver's next versions
>    will remove component framework as well;
>  * Slight improvement to modesetting: avoid cutting off the pixel clock
>    if the new mode and the old one are equal. Also, in this case, is
>    not necessary to wait for DTG to shut off. This would allow to switch
>    from 8b RGB to 12b YUV422, for example, with no interruptions (at least
>    from DCSS point of view);
>  * Do not fire off CTXLD when going to suspend, unless it still has
>    entries that need to be committed to DCSS;
>  * Addressed Rob's comments on bindings;
> 
> Changes in v4:
>  * Addressed Lucas and Philipp's comments:
>    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
>    * Removed usage of devm_ functions since I'm already doing all the
>      clean-up in the submodules_deinit();
>    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
>    * Removed en_completion variable from dcss_crtc since this was
>      introduced mainly to avoid vblank timeout warnings which were fixed
>      by arming the vblank event in flush() instead of begin();
>    * Removed clks_on and irq_enabled flags since all the calls to
>      enabling/disabling clocks and interrupts were balanced;
>    * Removed the custom atomic_commit callback and used the DRM core
>      helper and, in the process, got rid of a workqueue that wasn't
>      necessary anymore;
>    * Fixed some minor DT binding issues flagged by Philipp;
>    * Some other minor changes suggested by Lucas;
>  * Removed YUV formats from the supported formats as these cannot work
>    without the HDR10 module CSCs and LUTs. Will add them back when I
>    will add support for video planes;
> 
> Changes in v3:
>  * rebased to latest linux-next and made it compile as drmP.h was
>    removed;
>  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
>  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
>  * fixed a a spurious hang reported by Lukas Hartmann and encountered
>    by me several times;
>  * mask DPR and DTG interrupts by default, as they may come enabled from
>    U-boot;
> 
> Changes in v2:
>  * Removed '0x' in node's unit-address both in DT and yaml;
>  * Made the address region size lowercase, to be consistent;
>  * Removed some left-over references to P010;
>  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
>    issues reported by kbuild for other architectures;
> 
> 
> Laurentiu Palcu (5):
>   drm/imx: compile imx directory by default
>   drm/imx: Add initial support for DCSS on iMX8MQ
>   drm/imx/dcss: use drm_bridge_connector API
>   MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
>   dt-bindings: display: imx: add bindings for DCSS
> 
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 +++
>  MAINTAINERS                                   |   8 +
>  drivers/gpu/drm/Makefile                      |   2 +-
>  drivers/gpu/drm/imx/Kconfig                   |   2 +
>  drivers/gpu/drm/imx/Makefile                  |   1 +
>  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
>  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 325 +++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 198 +++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  44 +
>  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
>  20 files changed, 4112 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
>  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> 
> -- 
> 2.23.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
