Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD0257840
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB906E0D2;
	Mon, 31 Aug 2020 11:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30078.outbound.protection.outlook.com [40.107.3.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79336E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfog0AdE8UUZr7GXucJwhLtvgbbveuSK5QQ2wUOqwhHkOnlgTXe7KG+3EWP0NhC32HZn7fPJZgSH/ypq7aqvJJGJdUmU9qPs1gvK24MOYK68m0aEFnzh6btrIcYSn845pzNOjqQwAY0jbHzEXPZzbRJP+jlaAxYivwWnLPKAD8yqIaMAo6M7wqvMblB6S6DXqXffWU/64O0TrXiGek4BKU5fh13nH8W+f7rykVst6zkjkUxwXoeik9M/jxHS93wZIdefz1V4/MBxN0ycL2orMWVHsOryUfyTbBz1Vw6B7MFgP7yOMezEOnO3cWAcW0Gr2U7jMHCBgy6+5OC2wrSwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hamm6KS6NJGLFJvKrxsg21nrCHfdKKBaU17T70QtK70=;
 b=SQOV4PpC6facYhsyvToHOuFwm/DWOpICs1gy+v0TWxz3Ir1DrPtAELfp4hUMFpkaBJQPG9Lz/qPclnYB5i8r65zPYQzZpJ8t8mJb1c5RtfE9DtAgHdDLcVevPHJqnLfsG0iUUymuuRucDMwDppbSlB+Ym2H4fFeUCAJPsQeZCYIPKwuRZrCMSuiaD4obLkjV1nuZ7qZI73cHNR7tLlpWsCmqrwbRMWzdnFaloyGFC3Vr/pZPt7fatgeaIsff/gnPCvxVCbO1RzQKZFfUWpgJ3INIowGtv7V2YQOZv+6raav8UtX3yg/WA+4GJ/EamZgsemdayJLqoBa5vq5qfFaHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hamm6KS6NJGLFJvKrxsg21nrCHfdKKBaU17T70QtK70=;
 b=HPWjm4/GElsO+xs8AarpH+D9GaZVIlP8Qnudn8GofJGRjpj3SZIn4xECSZt4BpMQKyqG9VRSRQYEBi+sF0HMaZCUT59pSt7cGj/qEg9GuNzzhvO79+Bl/R7gxcGNBlBsjP4byiM4gKCi5MwiHGBON0zt9IEX5NCAECr4qSFuvzg=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB5933.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 11:24:49 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 11:24:49 +0000
Date: Mon, 31 Aug 2020 14:24:45 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200831112445.t4xfz33avdyx5w6p@fsr-ub1864-141>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200828083620.6m5yhcv7rg5tckzh@fsr-ub1864-141>
 <e882838158cb9e81440c8cdeb25d80bf3310e8a8.camel@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <e882838158cb9e81440c8cdeb25d80bf3310e8a8.camel@pengutronix.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 11:24:47 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fae6cbb7-f554-4f31-4aa2-08d84da078d3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB593308E9C1DE0026CA1F25FFBE510@VI1PR04MB5933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8B0HjicfuFoJDGUqwtwDD0lW08TP5HIwcHTy3gNN807wBE2H9v+QP1kPZOExwOQ+rL9dIGdyvrRE09FsZfLFR5Q6KkJQKbrbcD/NyTDCezrkqWFTcEjPS9aBz5e6WS1A5r0YL/ZoWCp107eRfHUuROU0tqkRfFcDVpAmyEYKDsrffP0yqM2zKwMIFsUhTDLhfYAQEfdjJz5Upyss/IP/D/OnyFHYXp3jafReZfZvtSUguAQEBDbeJ2OrKpCp7tRRjEFA0c8GPR8mnPBbCpnsfOZ3k9lFR53yzija0Rx2a4qGCIXQnUl7hBVrPfRTiNnALHZcKEJth/jAULyyjefZ+zWcoy6R1zuH+e8vu4LOfVKtGfLWXV0vFlQpo5JNDyq6LZCLxPUN4NgWTThprcWj4pHSxBcVQCrVABxjtiK4HE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(44832011)(7416002)(8936002)(956004)(110136005)(4326008)(66946007)(316002)(2906002)(86362001)(54906003)(55016002)(66476007)(66556008)(5660300002)(26005)(83380400001)(186003)(8676002)(52116002)(9686003)(16526019)(6496006)(1076003)(33716001)(966005)(478600001)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: vMVvIorO3F4oo8tL1wwBZ5Qz/EOXe1g3uiMZWgpF8VhQQnDvzPEqN1IPpqJYYH0i6X+uUKUPZgnEogDAP++Hdz1xupbVl7WcM83nyiDvQEwtsqV7UA8DrjULnIHCtL2poXq6Vqz39yXkzi3gNZBbHIhTnfxWqgfzMSSOV4fDe2VLB2XV5z3nAQH0c+E01T8m4NRlK+RgeJzynhhRQOSYRgyUV8In53gu9HV4EQoggMP5qMVvJT+LeQH9dNvOLCajWBmW92W84WdIbJNudptCdQ0jg15GK1/hum43crT2OzWBfwlwRlK2+YSudL/HPFf4R3pYZYe3xZ4O4runzt+4qpViC4Ocd55ZgNStrk5EI1snJM2h+I7c37SXfLaj9/hW1XUdK/dPdRADMdcuD61k5oOHyBsyuzID18y93Bk4u3WiT9+qSrUfQ2rk1roQ6admbMDXYlpsOuWv/jO5A9bDBXB13q5wTIQekDFjtZs1V86jECmQDvwxdfZloB76wQeildriNaXivtku9hH6McP6sbxh36Hi97AtqLYdL355cC4iT0/xx9BlbJTW75bS9KtdrfwyCH5pZCZIhabOkJbjiUDFJmCchXJBvC23Ks5QEdi7DIxws0bNioE9tx3jPUTTSt5hgN/v+m6szeCKF+frkg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae6cbb7-f554-4f31-4aa2-08d84da078d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 11:24:49.2513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5oQUCIGl9CptX+VcqNDpxbcSWt0IVzL8JgUNKlR/bWkUeYqVTJspPqoC3odyDj6cql7vvWoQx0vn5i9sHpUow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5933
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas, Sam,

On Mon, Aug 31, 2020 at 12:37:23PM +0200, Lucas Stach wrote:
> Hi Laurentiu,
> 
> On Fr, 2020-08-28 at 11:36 +0300, Laurentiu Palcu wrote:
> > Hi Lucas,
> > 
> > I was wondering about the plans to merge this series. Since not many
> > people can test it properly due to lack of DCSS support in the upstream
> > NWL driver (which I heard it's coming soon) and a completely nonexistent
> > HDP driver, are we going to take a leap of faith and merge it as is? Or
> > should we wait?
> 
> I think even if the bridges aren't ready yet, the driver is in a good
> enough shape to merge it. There's no point in letting it accumulate
> bitrot while waiting for the bridges to land. Also I guess it will make
> bridge driver development a lot easier when the DCSS driver is in-tree.

OK, fair enough.

> 
> > As to who is going to do the actual merge, I know we had a brief
> > discussion about it some time ago and I was supposed to apply for
> > drm-misc rights, however it feels a little awkward to merge my own
> > code... :) Though, I might not even qualify for drm-misc rights anyway,
> > considering I haven't been very active in this area... :/
> 
> Please consider applying for drm-misc merge rights. Even if you don't
> do the initial merge I think it will come in handy in the long run.

OK, I'll apply for drm-misc rights. Sam also encouraged me to do this in
a previous email. Since this series will be followed by a bunch of other
patches, enabling support for video planes, among other things, I guess
I'll need the rights anyway.

> 
> > On that note, I will probably need help with the merging, provided it's
> > still happenning. Will you be able to help me out with this?
> 
> Sure, I'm having some time available this week. I'll give this v9
> another spin on my boards and will do the merge after that.

Thanks Lucas. As a matter of fact, after Sam's email, I was preparing a
v10 after rebasing to latest drm-next. However, no conflicts were encountered
and the v9 series applied cleanly. Let me know if you encounter any
issues and I can resend it.

Thanks,
Laurentiu

> 
> Regards,
> Lucas
> 
> > Thanks,
> > laurentiu
> > 
> > On Fri, Jul 31, 2020 at 11:18:28AM +0300, Laurentiu Palcu wrote:
> > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > 
> > > Hi,
> > > 
> > > This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> > > includes only graphics plane support (no video planes), no HDR10 capabilities,
> > > no graphics decompression (only linear, tiled and super-tiled buffers allowed).
> > > 
> > > Support for the rest of the features will be added incrementally, in subsequent
> > > patches.
> > > 
> > > The patchset was tested with both HDP driver (in the downstream tree) and the upstream
> > > MIPI-DSI driver (with a couple of patches on top, to make it work correctly with DCSS).
> > > 
> > > Thanks,
> > > Laurentiu
> > > 
> > > Changes in v9:
> > >  * Fixed a compilation issue found by Guido in his setup: 'select
> > >    VIDEOMODE_HELPERS' was missing from Kconfig;
> > >  * Use imx8mq-clock.h in the bindings file so one can understand what
> > >    those clock values mean;
> > >  * no other changes done. Couldn't address the hang Guido reported as
> > >    it's not happening in my setup. However, in my tree, there are some
> > >    extra NWL and ADV patches applied on top of upstream ones... Also,
> > >    removing them and testing only with upstream, even if there's no
> > >    image out, does not produce a hang... :/
> > > 
> > > Changes in v8:
> > >  * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
> > >    out. SRC is not used in DCSS driver;
> > >  * Nothing else changed;
> > > 
> > > Changes in v7:
> > >  * Added a patch to initialize the connector using the drm_bridge_connector
> > >    API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
> > >    Guido's patch [1] applied and one fix for ADV [2]. Also, some extra
> > >    patches for ADV and NWL were needed, from our downstream tree, which
> > >    will be upstreamed soon by their author;
> > >  * Rest of the patches are untouched;
> > > 
> > > [1] https://lists.freedesktop.org/archives/dri-devel/2020-July/273025.html
> > > [2] https://lists.freedesktop.org/archives/dri-devel/2020-July/273132.html
> > > 
> > > Changes in v6:
> > >  * Addressed Rob's comment and added "additionalProperties: false" at
> > >    the end of the bindings' properties. However, this change surfaced
> > >    an issue with the assigned-clock* properties not being documented in
> > >    the properties section. Added the descriptions and the bindings patch
> > >    will need another review;
> > >  * Added an entry for DCSS driver in the MAINTAINERS file;
> > >  * Removed the component framework patch altogether;
> > > 
> > > Changes in v5:
> > >  * Rebased to latest;
> > >  * Took out component framework support and made it a separate patch so
> > >    that people can still test with HDP driver, which makes use of it.
> > >    But the idea is to get rid of it once HDP driver's next versions
> > >    will remove component framework as well;
> > >  * Slight improvement to modesetting: avoid cutting off the pixel clock
> > >    if the new mode and the old one are equal. Also, in this case, is
> > >    not necessary to wait for DTG to shut off. This would allow to switch
> > >    from 8b RGB to 12b YUV422, for example, with no interruptions (at least
> > >    from DCSS point of view);
> > >  * Do not fire off CTXLD when going to suspend, unless it still has
> > >    entries that need to be committed to DCSS;
> > >  * Addressed Rob's comments on bindings;
> > > 
> > > Changes in v4:
> > >  * Addressed Lucas and Philipp's comments:
> > >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> > >    * Removed usage of devm_ functions since I'm already doing all the
> > >      clean-up in the submodules_deinit();
> > >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
> > >    * Removed en_completion variable from dcss_crtc since this was
> > >      introduced mainly to avoid vblank timeout warnings which were fixed
> > >      by arming the vblank event in flush() instead of begin();
> > >    * Removed clks_on and irq_enabled flags since all the calls to
> > >      enabling/disabling clocks and interrupts were balanced;
> > >    * Removed the custom atomic_commit callback and used the DRM core
> > >      helper and, in the process, got rid of a workqueue that wasn't
> > >      necessary anymore;
> > >    * Fixed some minor DT binding issues flagged by Philipp;
> > >    * Some other minor changes suggested by Lucas;
> > >  * Removed YUV formats from the supported formats as these cannot work
> > >    without the HDR10 module CSCs and LUTs. Will add them back when I
> > >    will add support for video planes;
> > > 
> > > Changes in v3:
> > >  * rebased to latest linux-next and made it compile as drmP.h was
> > >    removed;
> > >  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
> > >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> > >  * fixed a a spurious hang reported by Lukas Hartmann and encountered
> > >    by me several times;
> > >  * mask DPR and DTG interrupts by default, as they may come enabled from
> > >    U-boot;
> > > 
> > > Changes in v2:
> > >  * Removed '0x' in node's unit-address both in DT and yaml;
> > >  * Made the address region size lowercase, to be consistent;
> > >  * Removed some left-over references to P010;
> > >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silence compilation
> > >    issues reported by kbuild for other architectures;
> > > 
> > > 
> > > Laurentiu Palcu (5):
> > >   drm/imx: compile imx directory by default
> > >   drm/imx: Add initial support for DCSS on iMX8MQ
> > >   drm/imx/dcss: use drm_bridge_connector API
> > >   MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
> > >   dt-bindings: display: imx: add bindings for DCSS
> > > 
> > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 +++
> > >  MAINTAINERS                                   |   8 +
> > >  drivers/gpu/drm/Makefile                      |   2 +-
> > >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> > >  drivers/gpu/drm/imx/Makefile                  |   1 +
> > >  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
> > >  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
> > >  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
> > >  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
> > >  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
> > >  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 325 +++++++
> > >  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
> > >  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
> > >  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
> > >  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
> > >  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 198 +++++
> > >  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  44 +
> > >  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
> > >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
> > >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> > >  20 files changed, 4112 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> > > 
> > > -- 
> > > 2.23.0
> > > 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
