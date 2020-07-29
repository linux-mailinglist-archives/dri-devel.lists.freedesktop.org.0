Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73FE23202D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 16:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996A06E52D;
	Wed, 29 Jul 2020 14:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C0F6E536
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2IldgaxqaU/c8wYzyiQ71I8YqaI9HgZPMWJOOE/tWk9UGsxe97stSdPEUGfnmIGI4IIWnlyn4RMuS2Gghq0GpTqZQC3I29oSK1BmGndrOwlVg56+C/sK3ddPJw8n7210DpVfgzn3pgyMFrnIY7MWavgopW/nVEFpygdrK7iN6pepfnNk2MCL2iPAkx69rKzhjsvkRgLXFRElSih+Z2qfQdz7+R9wmOfnFOT0v65nkeuNG9bCECdeUi4uXXXN8gJlDV4wn2qjoaZv0ZbxuoBgFjhXq24LA88rtxYYZ8TYpMutBfSxV75tZeKwPhYAQlMspL6aI1AfqADvPDVZxoPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTE7i1AKpZhGwvF+1nUCg33oOPKPVZ/n5osNQtEYpsw=;
 b=mkra15juEZGYzEFK0Dr/Vm4OIQucyg1xAoOD9JatkQ+9IqXa3/LEie44j6MfT41Rbc2yVI1fpjdDuX8feiQideO6xVoLUrTyU88+ntxmezZhzt19g7DBKc+r7tRgDNV159jUf5afWohqd0+O5Ta7pG1w9RUwXyTM0vgM5AvLIHiQ/yPpykcLfNR9O5uCaTblwUtSjE7v6J2IR8LZY06LHelLKXI6KwHaWq/VVbei5hk7mTJfGB06QT7aaZDFdYBxHDQqcrcL4fqFDRrqRjDXBp947sZh8SNCv3IqhiiFSAxwNlN6yTZkHN3rXyNDxdo340ZW/8lT4MAuOWFr4pkyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTE7i1AKpZhGwvF+1nUCg33oOPKPVZ/n5osNQtEYpsw=;
 b=VHI0dodzQnLVAx2YEKDfgQJsIo3NJtPdH4ztYa7I3QXneuxEHwP5jc5Il7O89tFDJ5qV7Sza/2aSqzDEDczPivkz3tf6waopTjYOxhyOBFzcGAtDlDl5wdCdQhIJaps6eVD9rXso3vPevdmgKgivhqh/WdNDM3wVDzyTV0gZ0Bg=
Authentication-Results: sigxcpu.org; dkim=none (message not signed)
 header.d=none;sigxcpu.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4478.eurprd04.prod.outlook.com
 (2603:10a6:803:67::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Wed, 29 Jul
 2020 14:16:51 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8%7]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 14:16:51 +0000
Date: Wed, 29 Jul 2020 17:16:47 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v8 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200729141647.mf6xjrd2wmixasse@fsr-ub1864-141>
References: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
 <20200729135948.GB266947@bogon.m.sigxcpu.org>
Content-Disposition: inline
In-Reply-To: <20200729135948.GB266947@bogon.m.sigxcpu.org>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM4PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:205::41)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM4PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:205::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Wed, 29 Jul 2020 14:16:49 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a495f731-2bcd-40e7-2a50-08d833ca0975
X-MS-TrafficTypeDiagnostic: VI1PR04MB4478:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4478D32840C22BB959F5C71ABE700@VI1PR04MB4478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqoPK6TbUfPGx1woIQLk0Ntnoa8Ib8FxH3VWkXpKc25K45AblbvKiFYuxDDtpOIRc6p6a8EOuOCiK6xOJSRrAcCA9+Actb47MnQzBGr/KgOWlf5DnI32y+gyxcQefVxlsx8XWl+97Jnv0LzH3fszDnE0KVP3dYeCheS2oic9yfQ6ysOBOKhe92zQE6q/VT+E918IfDuRRNeDs09Nzd56teFOFbAnOJ80z3pMQ4eX+IHhAaks2De2/eFVAjXopZhjZ62epWe7JGl0LpGFJVwBXqtxe66BsPSb2Hr0vy8VWpTGVpDlKmOamZfKs6Ce4IEvUSqOedyKyN+x3VIvNVKglb4XNpr5eDRp9fXUxAkD7jaZVivJgGLa7BsI+cLvj8JJy3zPEPWs0SrK+aqWzwUNpoHHSDuD6pC/eTZrq1wkb3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(44832011)(86362001)(6916009)(5660300002)(4326008)(956004)(54906003)(83380400001)(186003)(9686003)(26005)(66574015)(66556008)(66476007)(1076003)(16526019)(55016002)(66946007)(316002)(478600001)(8936002)(6496006)(966005)(2906002)(8676002)(52116002)(33716001)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IHLCJp1S5keHVt5vak+UUNjZHZe8C6RLIzEBHci2cBvkuRRRzHNKhPixXHlTe2Mqzde+jSz+EDQGOMQZ0AAMIUMuTm8h02V19XtBdp4yLLTGJpUahcN1PUAHwXdktvAYH3Cj7+yl8rC0Y1iub3rl7XjEQ7DvIL/8h+fmffnvq/86SpXnIGauqqAe56x4FKI7ww2L4dPfO+97oHO/LFBexgIGEbAzplmIKLwfVCnXnzQmReVxFLVUQFjnueqlTzkRauEgTqP73KLvj8MR6T5P8NbXWOPcMouBdkjzJQq8wwMGFprVB7p67N10cfIa0wgi09DLU3wMfrigcQAFKXEbvFkidzE6MTjvhyM++AuQeN0/26VONOtvSxBNRJlHR7qdkFFip469rAlmOqFOeBSE3Ee7G6ftMOfMkQeREbgAph7kX7ddrc0D8XVBl3LRIXqoSkeOS6xiPxac9m9B4F7NOgU4vVF4T2shfppnL/FhYW8=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a495f731-2bcd-40e7-2a50-08d833ca0975
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2020 14:16:50.9718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYc4oymzzeX2CfEDBdua7M0JES8hP+RWlEyhrgQaAHAJJVEDlIvQJVLaB1xNi7aeeob5VbLWsJDwEKKLPBwkFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4478
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
Cc: devicetree@vger.kernel.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido,

On Wed, Jul 29, 2020 at 03:59:48PM +0200, Guido G=FCnther wrote:
> Hi,
> On Fri, Jul 24, 2020 at 12:07:29PM +0300, Laurentiu Palcu wrote:
> > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > =

> > Hi,
> > =

> > This patchset adds initial DCSS support for iMX8MQ chip. Initial support
> > includes only graphics plane support (no video planes), no HDR10 capabi=
lities,
> > no graphics decompression (only linear, tiled and super-tiled buffers a=
llowed).
> > =

> > Support for the rest of the features will be added incrementally, in su=
bsequent
> > patches.
> > =

> > The patchset was tested with both HDP driver (in the downstream tree) a=
nd the upstream
> > MIPI-DSI driver (with a couple of patches on top, to make it work
> > correctly with DCSS).
> =

> While i could run earlier versions of this  series with NWL I'm seeing
> only a brief image that then turns black (backlight still on) with this c=
urrent version and
> the board hangs soon after.(for reference using mxsfb works nicely with
> the very same DT on next-20200727). If I do a drm.debug=3D0x3f i can see
> that display output stops around:
> =

> [   15.394473] imx-dcss 32e00000.display-controller: [drm:drm_update_vbla=
nk_count] updating vblank count on crtc 0: current=3D22, diff=3D1, hw=3D0 h=
w_last=3D0
> [   15.397575] device: 'input1': device_add
> [   15.444658] imx-dcss 32e00000.display-controller: [drm:drm_update_vbla=
nk_count] updating vblank count on crtc 0: current=3D23, diff=3D1, hw=3D0 h=
w_last=3D0
> [   15.465946] PM: Adding info for No Bus:input1
> [   15.494842] imx-dcss 32e00000.display-controller: [drm:drm_update_vbla=
nk_count] updating vblank count on crtc 0: current=3D24, diff=3D1, hw=3D0 h=
w_last=3D0
> [   15.511694] input: gpio-keys as /devices/platform/gpio-keys/input/inpu=
t1
> [   15.545025] imx-dcss 32e00000.display-controller: [drm:drm_update_vbla=
nk_count] updating vblank count on crtc 0: current=3D25, diff=3D1, hw=3D0 h=
w_last=3D0
> [   15.557869] device: 'event1': device_add
> [   15.595209] imx-dcss 32e00000.display-controller: [drm:drm_update_vbla=
nk_count] updating vblank count on crtc 0: current=3D26, diff=3D1, hw=3D0 h=
w_last=3D0
> [   15.605363] PM: Adding info for No Bus:event1
> [   15.645394] imx-dcss 32e00000.display-controller: [drm:drm_update_vbla=
nk_count] updating vblank count on crtc 0: current=3D27, diff=3D1, hw=3D0 h=
w_last=3D0
> [   19.427039] imx-dcss 32e00000.display-controller: [drm:vblank_disable_=
fn] disabling vblank on crtc 0
> [   19.436135] device: 'wakeup6': device_add
> [   19.448202] imx-dcss 32e00000.display-controller: [drm:drm_update_vbla=
nk_count] updating vblank count on crtc 0: current=3D28, diff=3D0, hw=3D0 h=
w_last=3D0
> =

> (and there's no further logging from drm from there on).
> =

> Would any the above mentioned patches do anything in that area?

The NWL driver is missing at least one fix that is needed for DCSS to
work nicely with it. One thing that needs fixed is the polarity. I added
a patch for that in our tree... :/

Currently, in NWL upstream, we have

adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);

However DCSS works with:

adjusted->flags &=3D ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
adjusted->flags |=3D (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);

I CCed Robert. He'll work on upstreaming these NWL changes in the following
period of time.

Thanks,
laurentiu

> =

> Cheers,
>  -- Guido
> =

> > =

> > Thanks,
> > Laurentiu
> > =

> > Changes in v8:
> >  * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
> >    out. SRC is not used in DCSS driver;
> >  * Nothing else changed;
> > =

> > Changes in v7:
> >  * Added a patch to initialize the connector using the drm_bridge_conne=
ctor
> >    API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
> >    Guido's patch [1] applied and one fix for ADV [2]. Also, some extra
> >    patches for ADV and NWL were needed, from our downstream tree, which
> >    will be upstreamed soon by their author;
> >  * Rest of the patches are untouched;
> > =

> > [1] https://lists.freedesktop.org/archives/dri-devel/2020-July/273025.h=
tml
> > [2] https://lists.freedesktop.org/archives/dri-devel/2020-July/273132.h=
tml
> > =

> > Changes in v6:
> >  * Addressed Rob's comment and added "additionalProperties: false" at
> >    the end of the bindings' properties. However, this change surfaced
> >    an issue with the assigned-clock* properties not being documented in
> >    the properties section. Added the descriptions and the bindings patch
> >    will need another review;
> >  * Added an entry for DCSS driver in the MAINTAINERS file;
> >  * Removed the component framework patch altogether;
> > =

> > Changes in v5:
> >  * Rebased to latest;
> >  * Took out component framework support and made it a separate patch so
> >    that people can still test with HDP driver, which makes use of it.
> >    But the idea is to get rid of it once HDP driver's next versions
> >    will remove component framework as well;
> >  * Slight improvement to modesetting: avoid cutting off the pixel clock
> >    if the new mode and the old one are equal. Also, in this case, is
> >    not necessary to wait for DTG to shut off. This would allow to switch
> >    from 8b RGB to 12b YUV422, for example, with no interruptions (at le=
ast
> >    from DCSS point of view);
> >  * Do not fire off CTXLD when going to suspend, unless it still has
> >    entries that need to be committed to DCSS;
> >  * Addressed Rob's comments on bindings;
> > =

> > Changes in v4:
> >  * Addressed Lucas and Philipp's comments:
> >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> >    * Removed usage of devm_ functions since I'm already doing all the
> >      clean-up in the submodules_deinit();
> >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush();
> >    * Removed en_completion variable from dcss_crtc since this was
> >      introduced mainly to avoid vblank timeout warnings which were fixed
> >      by arming the vblank event in flush() instead of begin();
> >    * Removed clks_on and irq_enabled flags since all the calls to
> >      enabling/disabling clocks and interrupts were balanced;
> >    * Removed the custom atomic_commit callback and used the DRM core
> >      helper and, in the process, got rid of a workqueue that wasn't
> >      necessary anymore;
> >    * Fixed some minor DT binding issues flagged by Philipp;
> >    * Some other minor changes suggested by Lucas;
> >  * Removed YUV formats from the supported formats as these cannot work
> >    without the HDR10 module CSCs and LUTs. Will add them back when I
> >    will add support for video planes;
> > =

> > Changes in v3:
> >  * rebased to latest linux-next and made it compile as drmP.h was
> >    removed;
> >  * removed the patch adding the VIDEO2_PLL clock. It's already applied;
> >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> >  * fixed a a spurious hang reported by Lukas Hartmann and encountered
> >    by me several times;
> >  * mask DPR and DTG interrupts by default, as they may come enabled from
> >    U-boot;
> > =

> > Changes in v2:
> >  * Removed '0x' in node's unit-address both in DT and yaml;
> >  * Made the address region size lowercase, to be consistent;
> >  * Removed some left-over references to P010;
> >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also silenc=
e compilation
> >    issues reported by kbuild for other architectures;
> > =

> > =

> > Laurentiu Palcu (5):
> >   drm/imx: compile imx directory by default
> >   drm/imx: Add initial support for DCSS on iMX8MQ
> >   drm/imx/dcss: use drm_bridge_connector API
> >   MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
> >   dt-bindings: display: imx: add bindings for DCSS
> > =

> >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 +++
> >  MAINTAINERS                                   |   8 +
> >  drivers/gpu/drm/Makefile                      |   2 +-
> >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> >  drivers/gpu/drm/imx/Makefile                  |   1 +
> >  drivers/gpu/drm/imx/dcss/Kconfig              |   8 +
> >  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
> >  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
> >  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
> >  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
> >  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 325 +++++++
> >  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
> >  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
> >  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
> >  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
> >  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 198 +++++
> >  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  44 +
> >  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
> >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++++
> >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> >  20 files changed, 4107 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,i=
mx8mq-dcss.yaml
> >  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> >  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> > =

> > -- =

> > 2.23.0
> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
