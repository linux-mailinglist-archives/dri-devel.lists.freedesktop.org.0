Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D3F25E759
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 13:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBE86E038;
	Sat,  5 Sep 2020 11:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132EF6E038
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 11:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6D8F6FB03;
 Sat,  5 Sep 2020 13:49:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1Oeo-a0KcPD; Sat,  5 Sep 2020 13:49:49 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 2433B45B81; Sat,  5 Sep 2020 13:49:49 +0200 (CEST)
Date: Sat, 5 Sep 2020 13:49:49 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200905114949.GA111526@bogon.m.sigxcpu.org>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200731085429.GD12560@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731085429.GD12560@bogon.m.sigxcpu.org>
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
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,
On Fri, Jul 31, 2020 at 10:54:29AM +0200, Guido G=FCnther wrote:
> Hi,
> On Fri, Jul 31, 2020 at 11:18:28AM +0300, Laurentiu Palcu wrote:
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
> > MIPI-DSI driver (with a couple of patches on top, to make it work corre=
ctly with DCSS).
> > =

> > Thanks,
> > Laurentiu
> > =

> > Changes in v9:
> >  * Fixed a compilation issue found by Guido in his setup: 'select
> >    VIDEOMODE_HELPERS' was missing from Kconfig;
> >  * Use imx8mq-clock.h in the bindings file so one can understand what
> >    those clock values mean;
> >  * no other changes done. Couldn't address the hang Guido reported as
> >    it's not happening in my setup. However, in my tree, there are some
> >    extra NWL and ADV patches applied on top of upstream ones... Also,
> >    removing them and testing only with upstream, even if there's no
> >    image out, does not produce a hang... :/
> =

> I don't think this should hold up merging.

And i retested your v9 series on next-20200903 on a librem5 devkit and
it works. Looking back I spotted an error in my clock configuration, so

Tested-by: Guido G=FCnther <agx@sigxcpu.org>

Cheers,
 -- Guido

> Cheers,
>  -- Guido
> =

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

> >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 +++
> >  MAINTAINERS                                   |   8 +
> >  drivers/gpu/drm/Makefile                      |   2 +-
> >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> >  drivers/gpu/drm/imx/Makefile                  |   1 +
> >  drivers/gpu/drm/imx/dcss/Kconfig              |   9 +
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
> >  20 files changed, 4112 insertions(+), 1 deletion(-)
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
