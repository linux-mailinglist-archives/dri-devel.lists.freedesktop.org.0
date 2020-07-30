Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC5232F38
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBEF6E8A2;
	Thu, 30 Jul 2020 09:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01346E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQK052nCyIisKeRElIJZ5vUSZWnhHp83WMk2rVzu6+YHLcIGrw7yzd+eIYrvx2tENCq/YpvBOhG763h05i4v95hTc+Tfn/zM7fI40daEUE60s0BcYW1bwf26YCD4I928MuWFVTLZ7SRDOXkLyKiLQufDTws4B/zpOXd6J+KmFO8o+7HU5p+eBGnlQf855RTSD4Cc/kayPlsL+cIj0dP/MLiIAUQqdktoYFAyXoRYUlG6WZ3VBENuzHlHBGk2oBliGjmxwSU/iFbtXqDvBEE+diguRyKjLJpq/kvPnb2iJM9TAMDJhLBdWfJsTzOEHiIJqGKAitwdOZh7PAzABffmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UIMgDbosqjGXt/0he/yNW17qPGHyP2M4axnF04aNv8=;
 b=OnGLBeMN2yIiJX2W8DDpONQSW9qI4xvgHfM3PBrnucqbrmaCQFOg+pTZVqFtuYCiWU4k6HMb2BR2WZdkOVoJHQpy9cxuDfDlnU5nIZ/0eZw5cOzDFc/oLBVwpTrDopJ9QqcFNRab6AMXQ0kmeemwcV9lWUuIjF0PEQT8m0I0QtomjAN9kf7KyfDEouObFSwlAcgcyaax1hbAl612BH9+H4Xbm8es+qsP+ToVMTc8XdMMCQWAD7TLL2eQaKMuefL6GjfVQivu+2NWWMnwUWVaGpuxNsdMy/d1qLjRuWQOwxA3esLy5vLhbVOLJHxg1FJSwK9uxxCSyGXEWjXBnYxY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UIMgDbosqjGXt/0he/yNW17qPGHyP2M4axnF04aNv8=;
 b=ZJJmSIf6nqp1vH3YUcuQrrC0Q7TqQ28e7o2+j4BAdCMmRQIN10HFbJZ6p8IeDSGjJphirFxDIRoPKfrAXX24qsWvhz0ON8La19tKB1qDESiI4biF/ygLgI7oEdm6Ze/Di3xsTiViuXm22XGCn0tX7UB+YrMMqzewQO38Ehv5yO0=
Authentication-Results: sigxcpu.org; dkim=none (message not signed)
 header.d=none;sigxcpu.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0402MB3614.eurprd04.prod.outlook.com
 (2603:10a6:803:b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 09:10:59 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8%7]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 09:10:59 +0000
Date: Thu, 30 Jul 2020 12:10:55 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v8 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200730091055.czg6yoosundzy7k3@fsr-ub1864-141>
References: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
 <20200729135948.GB266947@bogon.m.sigxcpu.org>
 <20200729141647.mf6xjrd2wmixasse@fsr-ub1864-141>
 <20200729150952.GB375000@bogon.m.sigxcpu.org>
Content-Disposition: inline
In-Reply-To: <20200729150952.GB375000@bogon.m.sigxcpu.org>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM4P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::11) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM4P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 09:10:58 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81de1766-d158-4193-d704-08d83468797e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3614:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB36146774555672FB9045A04EBE710@VI1PR0402MB3614.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DeiolYK0U/fzBymEIgRk3TR843McH4m9zdDiQnwCUBVAQ2gL2koRtXPoPq/MRzu2uyyN796T69VGwZXGePuent4bUPdoqtwE7rfaNJYZV/IwjbSATMypxMM20Sae3PFZTdDIEHy12by4c5duTROTN3bdBgIC6TzqhXa+odbW7i6ZztP92ho7oHqvih15M2aFtYdNQs1M8im1ucqh+drGtEODa9Sx/o/CKfhWTyzihReOyoPo+uyC89FalIlGIJ+A49ev4Qf1HNO1fEZHQxHEhnO5y19iQYw4N/h2CMIDTGS+x5i/5yFAh8ug2nuThhhwXDtzCU0X94GF3mtzLpiakORTNa9SCzZplHTg1wViijH0QG3azjIxZeewBI9Lqwo7UDY1hbSb2mOO1COvIty7WdIleOb794evPmLedkOgSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(8676002)(86362001)(8936002)(316002)(1076003)(4326008)(16526019)(6666004)(54906003)(66574015)(966005)(66946007)(55016002)(2906002)(52116002)(83380400001)(186003)(956004)(9686003)(33716001)(478600001)(66556008)(6496006)(5660300002)(6916009)(30864003)(44832011)(26005)(66476007)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QX2ignDq/RxpE9IO8r0eB+na/r5sZiLrVDk2Nto8w6O22y7qYVDbbFvcib84tjIqBosgFEI45lj9cIdASs1OMbJwn/AHSRoDDGjjRdY1d3qVAruP6GhK0D7Np/z8MssKtHS3qibmg93cdeP4nmlbJh4YuA1yisERmivY8OAn5s3An/EF1BQkpa65H5z69R+zr7F/c4EEkJkxsYwPOeFwiXcHHNsEiyzXZZZfIufrhaYgcNG/AM4NqZKS4WhJGdfL4q458qF9apfCd1XXAiYWUF/R/HnOP3/8/K7Se0R8pQi5tJ4TwaJBHlZo1DyFpSIEKIQETGX8/yRYqgIQmhKILlLu2sh1cAJIXMeNv1MBWHae0i7Ool5eBen+ISfYf24YQRjIVAfAg1DxSEGdzApmlbhE8l14k73Oyn+JZVuYDekVdZXY8jcDnI+UVBHTWCO94OaWhcOEDCI2p+L9ospoDda9aL/4oU5bRa5wBjjU9qA=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81de1766-d158-4193-d704-08d83468797e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 09:10:59.5752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1EbzF7hjbRzFzacwl+FPgAWuI5ZzyaJmyymLwKseaRkw9vluub8kr2al5YY1QKQd62y+5LvIqVKwtOT1Sd/fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3614
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

On Wed, Jul 29, 2020 at 05:09:52PM +0200, Guido G=FCnther wrote:
> Hi,
> On Wed, Jul 29, 2020 at 05:16:47PM +0300, Laurentiu Palcu wrote:
> > Hi Guido,
> > =

> > On Wed, Jul 29, 2020 at 03:59:48PM +0200, Guido G=FCnther wrote:
> > > Hi,
> > > On Fri, Jul 24, 2020 at 12:07:29PM +0300, Laurentiu Palcu wrote:
> > > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > > =

> > > > Hi,
> > > > =

> > > > This patchset adds initial DCSS support for iMX8MQ chip. Initial su=
pport
> > > > includes only graphics plane support (no video planes), no HDR10 ca=
pabilities,
> > > > no graphics decompression (only linear, tiled and super-tiled buffe=
rs allowed).
> > > > =

> > > > Support for the rest of the features will be added incrementally, i=
n subsequent
> > > > patches.
> > > > =

> > > > The patchset was tested with both HDP driver (in the downstream tre=
e) and the upstream
> > > > MIPI-DSI driver (with a couple of patches on top, to make it work
> > > > correctly with DCSS).
> > > =

> > > While i could run earlier versions of this  series with NWL I'm seeing
> > > only a brief image that then turns black (backlight still on) with th=
is current version and
> > > the board hangs soon after.(for reference using mxsfb works nicely wi=
th
> > > the very same DT on next-20200727). If I do a drm.debug=3D0x3f i can =
see
> > > that display output stops around:
> > > =

> > > [   15.394473] imx-dcss 32e00000.display-controller: [drm:drm_update_=
vblank_count] updating vblank count on crtc 0: current=3D22, diff=3D1, hw=
=3D0 hw_last=3D0
> > > [   15.397575] device: 'input1': device_add
> > > [   15.444658] imx-dcss 32e00000.display-controller: [drm:drm_update_=
vblank_count] updating vblank count on crtc 0: current=3D23, diff=3D1, hw=
=3D0 hw_last=3D0
> > > [   15.465946] PM: Adding info for No Bus:input1
> > > [   15.494842] imx-dcss 32e00000.display-controller: [drm:drm_update_=
vblank_count] updating vblank count on crtc 0: current=3D24, diff=3D1, hw=
=3D0 hw_last=3D0
> > > [   15.511694] input: gpio-keys as /devices/platform/gpio-keys/input/=
input1
> > > [   15.545025] imx-dcss 32e00000.display-controller: [drm:drm_update_=
vblank_count] updating vblank count on crtc 0: current=3D25, diff=3D1, hw=
=3D0 hw_last=3D0
> > > [   15.557869] device: 'event1': device_add
> > > [   15.595209] imx-dcss 32e00000.display-controller: [drm:drm_update_=
vblank_count] updating vblank count on crtc 0: current=3D26, diff=3D1, hw=
=3D0 hw_last=3D0
> > > [   15.605363] PM: Adding info for No Bus:event1
> > > [   15.645394] imx-dcss 32e00000.display-controller: [drm:drm_update_=
vblank_count] updating vblank count on crtc 0: current=3D27, diff=3D1, hw=
=3D0 hw_last=3D0
> > > [   19.427039] imx-dcss 32e00000.display-controller: [drm:vblank_disa=
ble_fn] disabling vblank on crtc 0
> > > [   19.436135] device: 'wakeup6': device_add
> > > [   19.448202] imx-dcss 32e00000.display-controller: [drm:drm_update_=
vblank_count] updating vblank count on crtc 0: current=3D28, diff=3D0, hw=
=3D0 hw_last=3D0
> > > =

> > > (and there's no further logging from drm from there on).
> > > =

> > > Would any the above mentioned patches do anything in that area?
> > =

> > The NWL driver is missing at least one fix that is needed for DCSS to
> > work nicely with it. One thing that needs fixed is the polarity. I added
> > a patch for that in our tree... :/
> > =

> > Currently, in NWL upstream, we have
> > =

> > adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> > adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC=
);
> > =

> > However DCSS works with:
> > =

> > adjusted->flags &=3D ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> > adjusted->flags |=3D (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> =

> Thanks! I remember not getting any output at all with DCSS without what
> you suggest above but now i get some output and then a hang so there
> seems to be something else off.

What's the hang about? Any backtrace?

Thanks,
laurentiu

> =

> Cheers,
>  -- Guido
> =

> > =

> > I CCed Robert. He'll work on upstreaming these NWL changes in the follo=
wing
> > period of time.
> > =

> > Thanks,
> > laurentiu
> > =

> > > =

> > > Cheers,
> > >  -- Guido
> > > =

> > > > =

> > > > Thanks,
> > > > Laurentiu
> > > > =

> > > > Changes in v8:
> > > >  * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
> > > >    out. SRC is not used in DCSS driver;
> > > >  * Nothing else changed;
> > > > =

> > > > Changes in v7:
> > > >  * Added a patch to initialize the connector using the drm_bridge_c=
onnector
> > > >    API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
> > > >    Guido's patch [1] applied and one fix for ADV [2]. Also, some ex=
tra
> > > >    patches for ADV and NWL were needed, from our downstream tree, w=
hich
> > > >    will be upstreamed soon by their author;
> > > >  * Rest of the patches are untouched;
> > > > =

> > > > [1] https://lists.freedesktop.org/archives/dri-devel/2020-July/2730=
25.html
> > > > [2] https://lists.freedesktop.org/archives/dri-devel/2020-July/2731=
32.html
> > > > =

> > > > Changes in v6:
> > > >  * Addressed Rob's comment and added "additionalProperties: false" =
at
> > > >    the end of the bindings' properties. However, this change surfac=
ed
> > > >    an issue with the assigned-clock* properties not being documente=
d in
> > > >    the properties section. Added the descriptions and the bindings =
patch
> > > >    will need another review;
> > > >  * Added an entry for DCSS driver in the MAINTAINERS file;
> > > >  * Removed the component framework patch altogether;
> > > > =

> > > > Changes in v5:
> > > >  * Rebased to latest;
> > > >  * Took out component framework support and made it a separate patc=
h so
> > > >    that people can still test with HDP driver, which makes use of i=
t.
> > > >    But the idea is to get rid of it once HDP driver's next versions
> > > >    will remove component framework as well;
> > > >  * Slight improvement to modesetting: avoid cutting off the pixel c=
lock
> > > >    if the new mode and the old one are equal. Also, in this case, is
> > > >    not necessary to wait for DTG to shut off. This would allow to s=
witch
> > > >    from 8b RGB to 12b YUV422, for example, with no interruptions (a=
t least
> > > >    from DCSS point of view);
> > > >  * Do not fire off CTXLD when going to suspend, unless it still has
> > > >    entries that need to be committed to DCSS;
> > > >  * Addressed Rob's comments on bindings;
> > > > =

> > > > Changes in v4:
> > > >  * Addressed Lucas and Philipp's comments:
> > > >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> > > >    * Removed usage of devm_ functions since I'm already doing all t=
he
> > > >      clean-up in the submodules_deinit();
> > > >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flus=
h();
> > > >    * Removed en_completion variable from dcss_crtc since this was
> > > >      introduced mainly to avoid vblank timeout warnings which were =
fixed
> > > >      by arming the vblank event in flush() instead of begin();
> > > >    * Removed clks_on and irq_enabled flags since all the calls to
> > > >      enabling/disabling clocks and interrupts were balanced;
> > > >    * Removed the custom atomic_commit callback and used the DRM core
> > > >      helper and, in the process, got rid of a workqueue that wasn't
> > > >      necessary anymore;
> > > >    * Fixed some minor DT binding issues flagged by Philipp;
> > > >    * Some other minor changes suggested by Lucas;
> > > >  * Removed YUV formats from the supported formats as these cannot w=
ork
> > > >    without the HDR10 module CSCs and LUTs. Will add them back when I
> > > >    will add support for video planes;
> > > > =

> > > > Changes in v3:
> > > >  * rebased to latest linux-next and made it compile as drmP.h was
> > > >    removed;
> > > >  * removed the patch adding the VIDEO2_PLL clock. It's already appl=
ied;
> > > >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> > > >  * fixed a a spurious hang reported by Lukas Hartmann and encounter=
ed
> > > >    by me several times;
> > > >  * mask DPR and DTG interrupts by default, as they may come enabled=
 from
> > > >    U-boot;
> > > > =

> > > > Changes in v2:
> > > >  * Removed '0x' in node's unit-address both in DT and yaml;
> > > >  * Made the address region size lowercase, to be consistent;
> > > >  * Removed some left-over references to P010;
> > > >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also si=
lence compilation
> > > >    issues reported by kbuild for other architectures;
> > > > =

> > > > =

> > > > Laurentiu Palcu (5):
> > > >   drm/imx: compile imx directory by default
> > > >   drm/imx: Add initial support for DCSS on iMX8MQ
> > > >   drm/imx/dcss: use drm_bridge_connector API
> > > >   MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
> > > >   dt-bindings: display: imx: add bindings for DCSS
> > > > =

> > > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 +++
> > > >  MAINTAINERS                                   |   8 +
> > > >  drivers/gpu/drm/Makefile                      |   2 +-
> > > >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> > > >  drivers/gpu/drm/imx/Makefile                  |   1 +
> > > >  drivers/gpu/drm/imx/dcss/Kconfig              |   8 +
> > > >  drivers/gpu/drm/imx/dcss/Makefile             |   6 +
> > > >  drivers/gpu/drm/imx/dcss/dcss-blkctl.c        |  70 ++
> > > >  drivers/gpu/drm/imx/dcss/dcss-crtc.c          | 219 +++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-ctxld.c         | 424 +++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dev.c           | 325 +++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dev.h           | 177 ++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dpr.c           | 562 ++++++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-drv.c           | 138 +++
> > > >  drivers/gpu/drm/imx/dcss/dcss-dtg.c           | 409 +++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-kms.c           | 198 +++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-kms.h           |  44 +
> > > >  drivers/gpu/drm/imx/dcss/dcss-plane.c         | 405 +++++++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++=
++++
> > > >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> > > >  20 files changed, 4107 insertions(+), 1 deletion(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/n=
xp,imx8mq-dcss.yaml
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
> > > >  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> > > > =

> > > > -- =

> > > > 2.23.0
> > > > =

> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
