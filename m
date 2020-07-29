Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD2723213D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 17:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F816E12E;
	Wed, 29 Jul 2020 15:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D586E12E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 15:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 05E51FB04;
 Wed, 29 Jul 2020 17:09:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuXYOASCNKsm; Wed, 29 Jul 2020 17:09:53 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5042D45341; Wed, 29 Jul 2020 17:09:52 +0200 (CEST)
Date: Wed, 29 Jul 2020 17:09:52 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v8 0/5] Add support for iMX8MQ Display Controller Subsystem
Message-ID: <20200729150952.GB375000@bogon.m.sigxcpu.org>
References: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
 <20200729135948.GB266947@bogon.m.sigxcpu.org>
 <20200729141647.mf6xjrd2wmixasse@fsr-ub1864-141>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200729141647.mf6xjrd2wmixasse@fsr-ub1864-141>
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

Hi,
On Wed, Jul 29, 2020 at 05:16:47PM +0300, Laurentiu Palcu wrote:
> Hi Guido,
> =

> On Wed, Jul 29, 2020 at 03:59:48PM +0200, Guido G=FCnther wrote:
> > Hi,
> > On Fri, Jul 24, 2020 at 12:07:29PM +0300, Laurentiu Palcu wrote:
> > > From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> > > =

> > > Hi,
> > > =

> > > This patchset adds initial DCSS support for iMX8MQ chip. Initial supp=
ort
> > > includes only graphics plane support (no video planes), no HDR10 capa=
bilities,
> > > no graphics decompression (only linear, tiled and super-tiled buffers=
 allowed).
> > > =

> > > Support for the rest of the features will be added incrementally, in =
subsequent
> > > patches.
> > > =

> > > The patchset was tested with both HDP driver (in the downstream tree)=
 and the upstream
> > > MIPI-DSI driver (with a couple of patches on top, to make it work
> > > correctly with DCSS).
> > =

> > While i could run earlier versions of this  series with NWL I'm seeing
> > only a brief image that then turns black (backlight still on) with this=
 current version and
> > the board hangs soon after.(for reference using mxsfb works nicely with
> > the very same DT on next-20200727). If I do a drm.debug=3D0x3f i can see
> > that display output stops around:
> > =

> > [   15.394473] imx-dcss 32e00000.display-controller: [drm:drm_update_vb=
lank_count] updating vblank count on crtc 0: current=3D22, diff=3D1, hw=3D0=
 hw_last=3D0
> > [   15.397575] device: 'input1': device_add
> > [   15.444658] imx-dcss 32e00000.display-controller: [drm:drm_update_vb=
lank_count] updating vblank count on crtc 0: current=3D23, diff=3D1, hw=3D0=
 hw_last=3D0
> > [   15.465946] PM: Adding info for No Bus:input1
> > [   15.494842] imx-dcss 32e00000.display-controller: [drm:drm_update_vb=
lank_count] updating vblank count on crtc 0: current=3D24, diff=3D1, hw=3D0=
 hw_last=3D0
> > [   15.511694] input: gpio-keys as /devices/platform/gpio-keys/input/in=
put1
> > [   15.545025] imx-dcss 32e00000.display-controller: [drm:drm_update_vb=
lank_count] updating vblank count on crtc 0: current=3D25, diff=3D1, hw=3D0=
 hw_last=3D0
> > [   15.557869] device: 'event1': device_add
> > [   15.595209] imx-dcss 32e00000.display-controller: [drm:drm_update_vb=
lank_count] updating vblank count on crtc 0: current=3D26, diff=3D1, hw=3D0=
 hw_last=3D0
> > [   15.605363] PM: Adding info for No Bus:event1
> > [   15.645394] imx-dcss 32e00000.display-controller: [drm:drm_update_vb=
lank_count] updating vblank count on crtc 0: current=3D27, diff=3D1, hw=3D0=
 hw_last=3D0
> > [   19.427039] imx-dcss 32e00000.display-controller: [drm:vblank_disabl=
e_fn] disabling vblank on crtc 0
> > [   19.436135] device: 'wakeup6': device_add
> > [   19.448202] imx-dcss 32e00000.display-controller: [drm:drm_update_vb=
lank_count] updating vblank count on crtc 0: current=3D28, diff=3D0, hw=3D0=
 hw_last=3D0
> > =

> > (and there's no further logging from drm from there on).
> > =

> > Would any the above mentioned patches do anything in that area?
> =

> The NWL driver is missing at least one fix that is needed for DCSS to
> work nicely with it. One thing that needs fixed is the polarity. I added
> a patch for that in our tree... :/
> =

> Currently, in NWL upstream, we have
> =

> adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> adjusted_mode->flags &=3D ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> =

> However DCSS works with:
> =

> adjusted->flags &=3D ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> adjusted->flags |=3D (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);

Thanks! I remember not getting any output at all with DCSS without what
you suggest above but now i get some output and then a hang so there
seems to be something else off.

Cheers,
 -- Guido

> =

> I CCed Robert. He'll work on upstreaming these NWL changes in the followi=
ng
> period of time.
> =

> Thanks,
> laurentiu
> =

> > =

> > Cheers,
> >  -- Guido
> > =

> > > =

> > > Thanks,
> > > Laurentiu
> > > =

> > > Changes in v8:
> > >  * Removed 'select RESET_CONTROLLER" from Kconfig as Philipp pointed
> > >    out. SRC is not used in DCSS driver;
> > >  * Nothing else changed;
> > > =

> > > Changes in v7:
> > >  * Added a patch to initialize the connector using the drm_bridge_con=
nector
> > >    API as Sam suggested. Tested it using NWL_DSI and ADV7535 with
> > >    Guido's patch [1] applied and one fix for ADV [2]. Also, some extra
> > >    patches for ADV and NWL were needed, from our downstream tree, whi=
ch
> > >    will be upstreamed soon by their author;
> > >  * Rest of the patches are untouched;
> > > =

> > > [1] https://lists.freedesktop.org/archives/dri-devel/2020-July/273025=
.html
> > > [2] https://lists.freedesktop.org/archives/dri-devel/2020-July/273132=
.html
> > > =

> > > Changes in v6:
> > >  * Addressed Rob's comment and added "additionalProperties: false" at
> > >    the end of the bindings' properties. However, this change surfaced
> > >    an issue with the assigned-clock* properties not being documented =
in
> > >    the properties section. Added the descriptions and the bindings pa=
tch
> > >    will need another review;
> > >  * Added an entry for DCSS driver in the MAINTAINERS file;
> > >  * Removed the component framework patch altogether;
> > > =

> > > Changes in v5:
> > >  * Rebased to latest;
> > >  * Took out component framework support and made it a separate patch =
so
> > >    that people can still test with HDP driver, which makes use of it.
> > >    But the idea is to get rid of it once HDP driver's next versions
> > >    will remove component framework as well;
> > >  * Slight improvement to modesetting: avoid cutting off the pixel clo=
ck
> > >    if the new mode and the old one are equal. Also, in this case, is
> > >    not necessary to wait for DTG to shut off. This would allow to swi=
tch
> > >    from 8b RGB to 12b YUV422, for example, with no interruptions (at =
least
> > >    from DCSS point of view);
> > >  * Do not fire off CTXLD when going to suspend, unless it still has
> > >    entries that need to be committed to DCSS;
> > >  * Addressed Rob's comments on bindings;
> > > =

> > > Changes in v4:
> > >  * Addressed Lucas and Philipp's comments:
> > >    * Added DRM_KMS_CMA_HELPER dependency in Kconfig;
> > >    * Removed usage of devm_ functions since I'm already doing all the
> > >      clean-up in the submodules_deinit();
> > >    * Moved the drm_crtc_arm_vblank_event() in dcss_crtc_atomic_flush(=
);
> > >    * Removed en_completion variable from dcss_crtc since this was
> > >      introduced mainly to avoid vblank timeout warnings which were fi=
xed
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
> > > =

> > > Changes in v3:
> > >  * rebased to latest linux-next and made it compile as drmP.h was
> > >    removed;
> > >  * removed the patch adding the VIDEO2_PLL clock. It's already applie=
d;
> > >  * removed an unnecessary 50ms sleep in the dcss_dtg_sync_set();
> > >  * fixed a a spurious hang reported by Lukas Hartmann and encountered
> > >    by me several times;
> > >  * mask DPR and DTG interrupts by default, as they may come enabled f=
rom
> > >    U-boot;
> > > =

> > > Changes in v2:
> > >  * Removed '0x' in node's unit-address both in DT and yaml;
> > >  * Made the address region size lowercase, to be consistent;
> > >  * Removed some left-over references to P010;
> > >  * Added a Kconfig dependency of DRM && ARCH_MXC. This will also sile=
nce compilation
> > >    issues reported by kbuild for other architectures;
> > > =

> > > =

> > > Laurentiu Palcu (5):
> > >   drm/imx: compile imx directory by default
> > >   drm/imx: Add initial support for DCSS on iMX8MQ
> > >   drm/imx/dcss: use drm_bridge_connector API
> > >   MAINTAINERS: Add entry for i.MX 8MQ DCSS driver
> > >   dt-bindings: display: imx: add bindings for DCSS
> > > =

> > >  .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 +++
> > >  MAINTAINERS                                   |   8 +
> > >  drivers/gpu/drm/Makefile                      |   2 +-
> > >  drivers/gpu/drm/imx/Kconfig                   |   2 +
> > >  drivers/gpu/drm/imx/Makefile                  |   1 +
> > >  drivers/gpu/drm/imx/dcss/Kconfig              |   8 +
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
> > >  drivers/gpu/drm/imx/dcss/dcss-scaler.c        | 826 ++++++++++++++++=
++
> > >  drivers/gpu/drm/imx/dcss/dcss-ss.c            | 180 ++++
> > >  20 files changed, 4107 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp=
,imx8mq-dcss.yaml
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
> > > =

> > > -- =

> > > 2.23.0
> > > =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
