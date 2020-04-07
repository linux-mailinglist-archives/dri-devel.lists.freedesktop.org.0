Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B321A11F5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 18:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA856E8A9;
	Tue,  7 Apr 2020 16:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357016E8A9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 16:44:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 751E080539;
 Tue,  7 Apr 2020 18:44:28 +0200 (CEST)
Date: Tue, 7 Apr 2020 18:44:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v9 0/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200407164426.GB2220@ravnborg.org>
References: <cover.1580129724.git.jsarha@ti.com>
 <d3931419-aa73-daeb-c8f6-8e29166d586a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3931419-aa73-daeb-c8f6-8e29166d586a@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8
 a=7gkXJVJtAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=HFdO39qn0m5q-nzUmwcA:9
 a=CjuIK1q_8ugA:10 a=ariJes8-gCIA:10 a=aeg5Gbbo78KNqacMgKqU:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 sjakhade@cadence.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 Jyri Sarha <jsarha@ti.com>, subhajit_paul@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 04:18:20PM +0300, Tomi Valkeinen wrote:
> Hi Jyri,
> 
> On 27/01/2020 18:00, Jyri Sarha wrote:
> > This is intended to be the last patch series. I'll apply these trough
> > drm-misc-next tomorrow.
> 
> Were these ever merged?

See 32a1795f57eecc3974901760400618571c9d357f
("drm/tidss: New driver for TI Keystone platform Display SubSystem")

	Sam


> 
>  Tomi
> 
> > 
> > Changes since v8:
> > - "dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding"
> >    - Remove ports-node from the dts example in
> > - "drm/tidss: New driver for TI Keystone platform Display SubSystem"
> >    - Rename dispc_write_irqenable() to dispc_set_irqenable() to avoid
> >      conflict exported omapfb function with same name.
> >    - Add Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > - "MAINTAINERS: add entry for tidss"
> >    - Add Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > 
> > Changes since v7:
> > - "drm/tidss: New driver for TI Keystone platform Display SubSystem"
> >    - Remove idle debug prints from dispc_init()
> >    - Add Reviewed-by: Benoit Parrot <bparrot@ti.com>
> > - "MAINTAINERS: add entry for tidss"
> >    - Add Reviewed-by: Benoit Parrot <bparrot@ti.com>
> > 
> > Changes since v6:
> > - Rebase on top of drm-misc-next-2020-01-10
> > - Fix all checkpatch.pl -q --emacs --strict --show-types issues
> >    - all issues but these have been fixed:
> >      - over 80 char lines in scale coefficients found in tidss_scale_coefs.c
> >      - Co-developed-by and Signed-off-by: name/email do not match
> >      - added, moved or deleted file(s), does MAINTAINERS need updating
> > - Add Acked-by: Sam Ravnborg <sam@ravnborg.org> to "drm/tidss: New driver ..."
> > 
> > Changes since v5:
> > - Add Add Reviewed-by: from Rob Herring <robh@kernel.org> and
> >    Benoit Parrot <bparrot@ti.com> to binding patches
> > - Color property changes and fixes to the driver implementation patch
> >    - Check CTM and gamma support from dispc_features when creating crtc
> >    - Implement CTM support for k2g and fix k3 CTM implementation
> >    - Remove gamma property persistence and always write color properties
> >      in a new modeset
> > 
> > Changes since v4:
> > - itemize named resource property descriptions in dt binding
> > - fix wp to wb in the ti,j721e-dss reg property description
> > - remove fifo underflow irq handling, it is not an error and
> >    it should be used for debug purposes only
> > - memory tuning, prefetch plane fifo up to high-threshold value to
> >    minimize possibility of underflows.
> > 
> > Changes since v3:
> > - Add descriptions some yaml binding properites
> > - Remove redundant minItems directives from yaml bindings
> > - Remove ports node from ti,k2g-dss yaml binding
> > - no change to MAINTAINERS or to the driver code
> > 
> > Changes since v2:
> > - Add version history to commit messages
> > - Fix yaml bindings now that got dt_binding_check dtbs_check working property
> > - Move tidss entry in MAINTAINERS after omapdrm and add "T: git
> >    git://anongit.freedesktop.org/drm/drm-misc"
> > - no change to driver code
> > 
> > Changes since the first version of the patch series [2]:
> > - "drm/tidss: New driver for TI Keystone platform Display SubSystem"
> >   - rebased on top of drm-next-2019-11-27
> >   - sort all include lines in all files
> >   - remove all include <drm/drmP.h>
> >   - remove select "select VIDEOMODE_HELPERS"
> >   - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
> >     to call it in new modeset case as it is also called in vp_enable())
> >   - change probe sequence and drm_device allocation (follow example in drm_drv.c)
> >   - use __maybe_unused instead of #ifdef for pm functions
> >   - remove "struct drm_fbdev_cma *fbdev;" from driver data
> >   - check panel connector type before connecting it
> > - No change to binding or MAINTAINERS patches
> > 
> > There was couple of attempts upstream an earlier version of this
> > driver about a year ago [1]. Back then I needed to stop my efforts to
> > implement support for next Keystone DSS version, so now the driver
> > supports three different Keystone DSS version on three different SoCs.
> > 
> > I am starting the patch series versioning from the beginning because it
> > has been over a year since the previous patch set and the structure of
> > the driver has evolved quite a bit. However, all the earlier comments
> > should be addressed in this series.
> > 
> > [1] https://patchwork.freedesktop.org/series/44947/
> > [2] https://lists.freedesktop.org/archives/dri-devel/2019-November/246542.html
> > 
> > Jyri Sarha (5):
> >    dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
> >    dt-bindings: display: ti,am65x-dss: Add dt-schema yaml binding
> >    dt-bindings: display: ti,j721e-dss: Add dt-schema yaml binding
> >    drm/tidss: New driver for TI Keystone platform Display SubSystem
> >    MAINTAINERS: add entry for tidss
> > 
> >   .../bindings/display/ti/ti,am65x-dss.yaml     |  152 +
> >   .../bindings/display/ti/ti,j721e-dss.yaml     |  208 ++
> >   .../bindings/display/ti/ti,k2g-dss.yaml       |  106 +
> >   MAINTAINERS                                   |   11 +
> >   drivers/gpu/drm/Kconfig                       |    2 +
> >   drivers/gpu/drm/Makefile                      |    1 +
> >   drivers/gpu/drm/tidss/Kconfig                 |   14 +
> >   drivers/gpu/drm/tidss/Makefile                |   12 +
> >   drivers/gpu/drm/tidss/tidss_crtc.c            |  377 +++
> >   drivers/gpu/drm/tidss/tidss_crtc.h            |   46 +
> >   drivers/gpu/drm/tidss/tidss_dispc.c           | 2768 +++++++++++++++++
> >   drivers/gpu/drm/tidss/tidss_dispc.h           |  132 +
> >   drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  243 ++
> >   drivers/gpu/drm/tidss/tidss_drv.c             |  285 ++
> >   drivers/gpu/drm/tidss/tidss_drv.h             |   39 +
> >   drivers/gpu/drm/tidss/tidss_encoder.c         |   88 +
> >   drivers/gpu/drm/tidss/tidss_encoder.h         |   17 +
> >   drivers/gpu/drm/tidss/tidss_irq.c             |  146 +
> >   drivers/gpu/drm/tidss/tidss_irq.h             |   77 +
> >   drivers/gpu/drm/tidss/tidss_kms.c             |  249 ++
> >   drivers/gpu/drm/tidss/tidss_kms.h             |   15 +
> >   drivers/gpu/drm/tidss/tidss_plane.c           |  217 ++
> >   drivers/gpu/drm/tidss/tidss_plane.h           |   25 +
> >   drivers/gpu/drm/tidss/tidss_scale_coefs.c     |  202 ++
> >   drivers/gpu/drm/tidss/tidss_scale_coefs.h     |   22 +
> >   25 files changed, 5454 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> >   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> >   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> >   create mode 100644 drivers/gpu/drm/tidss/Kconfig
> >   create mode 100644 drivers/gpu/drm/tidss/Makefile
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_dispc_regs.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_drv.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_drv.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_irq.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_irq.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_kms.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_kms.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_plane.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_plane.h
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.c
> >   create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.h
> > 
> 
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
