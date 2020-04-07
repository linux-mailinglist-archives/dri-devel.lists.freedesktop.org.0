Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59231A0E3C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 15:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076306E873;
	Tue,  7 Apr 2020 13:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A0D6E873
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 13:18:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 037DIOJn049470;
 Tue, 7 Apr 2020 08:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586265504;
 bh=IqUIxHQvCQB1xZjM77qZ5l7zHWe1GnTQLlokeKqi4tA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hh+Jhi3R+hndMpdAisUgJ6f0ts4AtprQLgb6UgX4d1h6ahWkto0+XoflluW4LFwaT
 y/46RKj8tDcP/9d5NpJpQiF95wuk7M2z/x4DHjESaBF34P2ixHmqHdo0eDyoydD38A
 TqVOKREkeEsifEDHHJb3lktuz2ImfabHheAmHSSw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 037DIOQa106429
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Apr 2020 08:18:24 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Apr
 2020 08:18:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Apr 2020 08:18:23 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 037DIK2F014228;
 Tue, 7 Apr 2020 08:18:21 -0500
Subject: Re: [PATCH v9 0/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
References: <cover.1580129724.git.jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d3931419-aa73-daeb-c8f6-8e29166d586a@ti.com>
Date: Tue, 7 Apr 2020 16:18:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cover.1580129724.git.jsarha@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 peter.ujfalusi@ti.com, laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com,
 sam@ravnborg.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri,

On 27/01/2020 18:00, Jyri Sarha wrote:
> This is intended to be the last patch series. I'll apply these trough
> drm-misc-next tomorrow.

Were these ever merged?

  Tomi

> 
> Changes since v8:
> - "dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding"
>    - Remove ports-node from the dts example in
> - "drm/tidss: New driver for TI Keystone platform Display SubSystem"
>    - Rename dispc_write_irqenable() to dispc_set_irqenable() to avoid
>      conflict exported omapfb function with same name.
>    - Add Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> - "MAINTAINERS: add entry for tidss"
>    - Add Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> Changes since v7:
> - "drm/tidss: New driver for TI Keystone platform Display SubSystem"
>    - Remove idle debug prints from dispc_init()
>    - Add Reviewed-by: Benoit Parrot <bparrot@ti.com>
> - "MAINTAINERS: add entry for tidss"
>    - Add Reviewed-by: Benoit Parrot <bparrot@ti.com>
> 
> Changes since v6:
> - Rebase on top of drm-misc-next-2020-01-10
> - Fix all checkpatch.pl -q --emacs --strict --show-types issues
>    - all issues but these have been fixed:
>      - over 80 char lines in scale coefficients found in tidss_scale_coefs.c
>      - Co-developed-by and Signed-off-by: name/email do not match
>      - added, moved or deleted file(s), does MAINTAINERS need updating
> - Add Acked-by: Sam Ravnborg <sam@ravnborg.org> to "drm/tidss: New driver ..."
> 
> Changes since v5:
> - Add Add Reviewed-by: from Rob Herring <robh@kernel.org> and
>    Benoit Parrot <bparrot@ti.com> to binding patches
> - Color property changes and fixes to the driver implementation patch
>    - Check CTM and gamma support from dispc_features when creating crtc
>    - Implement CTM support for k2g and fix k3 CTM implementation
>    - Remove gamma property persistence and always write color properties
>      in a new modeset
> 
> Changes since v4:
> - itemize named resource property descriptions in dt binding
> - fix wp to wb in the ti,j721e-dss reg property description
> - remove fifo underflow irq handling, it is not an error and
>    it should be used for debug purposes only
> - memory tuning, prefetch plane fifo up to high-threshold value to
>    minimize possibility of underflows.
> 
> Changes since v3:
> - Add descriptions some yaml binding properites
> - Remove redundant minItems directives from yaml bindings
> - Remove ports node from ti,k2g-dss yaml binding
> - no change to MAINTAINERS or to the driver code
> 
> Changes since v2:
> - Add version history to commit messages
> - Fix yaml bindings now that got dt_binding_check dtbs_check working property
> - Move tidss entry in MAINTAINERS after omapdrm and add "T: git
>    git://anongit.freedesktop.org/drm/drm-misc"
> - no change to driver code
> 
> Changes since the first version of the patch series [2]:
> - "drm/tidss: New driver for TI Keystone platform Display SubSystem"
>   - rebased on top of drm-next-2019-11-27
>   - sort all include lines in all files
>   - remove all include <drm/drmP.h>
>   - remove select "select VIDEOMODE_HELPERS"
>   - call dispc_vp_setup() later in tidss_crtc_atomic_flush() (there is no
>     to call it in new modeset case as it is also called in vp_enable())
>   - change probe sequence and drm_device allocation (follow example in drm_drv.c)
>   - use __maybe_unused instead of #ifdef for pm functions
>   - remove "struct drm_fbdev_cma *fbdev;" from driver data
>   - check panel connector type before connecting it
> - No change to binding or MAINTAINERS patches
> 
> There was couple of attempts upstream an earlier version of this
> driver about a year ago [1]. Back then I needed to stop my efforts to
> implement support for next Keystone DSS version, so now the driver
> supports three different Keystone DSS version on three different SoCs.
> 
> I am starting the patch series versioning from the beginning because it
> has been over a year since the previous patch set and the structure of
> the driver has evolved quite a bit. However, all the earlier comments
> should be addressed in this series.
> 
> [1] https://patchwork.freedesktop.org/series/44947/
> [2] https://lists.freedesktop.org/archives/dri-devel/2019-November/246542.html
> 
> Jyri Sarha (5):
>    dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
>    dt-bindings: display: ti,am65x-dss: Add dt-schema yaml binding
>    dt-bindings: display: ti,j721e-dss: Add dt-schema yaml binding
>    drm/tidss: New driver for TI Keystone platform Display SubSystem
>    MAINTAINERS: add entry for tidss
> 
>   .../bindings/display/ti/ti,am65x-dss.yaml     |  152 +
>   .../bindings/display/ti/ti,j721e-dss.yaml     |  208 ++
>   .../bindings/display/ti/ti,k2g-dss.yaml       |  106 +
>   MAINTAINERS                                   |   11 +
>   drivers/gpu/drm/Kconfig                       |    2 +
>   drivers/gpu/drm/Makefile                      |    1 +
>   drivers/gpu/drm/tidss/Kconfig                 |   14 +
>   drivers/gpu/drm/tidss/Makefile                |   12 +
>   drivers/gpu/drm/tidss/tidss_crtc.c            |  377 +++
>   drivers/gpu/drm/tidss/tidss_crtc.h            |   46 +
>   drivers/gpu/drm/tidss/tidss_dispc.c           | 2768 +++++++++++++++++
>   drivers/gpu/drm/tidss/tidss_dispc.h           |  132 +
>   drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  243 ++
>   drivers/gpu/drm/tidss/tidss_drv.c             |  285 ++
>   drivers/gpu/drm/tidss/tidss_drv.h             |   39 +
>   drivers/gpu/drm/tidss/tidss_encoder.c         |   88 +
>   drivers/gpu/drm/tidss/tidss_encoder.h         |   17 +
>   drivers/gpu/drm/tidss/tidss_irq.c             |  146 +
>   drivers/gpu/drm/tidss/tidss_irq.h             |   77 +
>   drivers/gpu/drm/tidss/tidss_kms.c             |  249 ++
>   drivers/gpu/drm/tidss/tidss_kms.h             |   15 +
>   drivers/gpu/drm/tidss/tidss_plane.c           |  217 ++
>   drivers/gpu/drm/tidss/tidss_plane.h           |   25 +
>   drivers/gpu/drm/tidss/tidss_scale_coefs.c     |  202 ++
>   drivers/gpu/drm/tidss/tidss_scale_coefs.h     |   22 +
>   25 files changed, 5454 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
>   create mode 100644 drivers/gpu/drm/tidss/Kconfig
>   create mode 100644 drivers/gpu/drm/tidss/Makefile
>   create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_dispc_regs.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_drv.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_drv.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_irq.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_irq.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_kms.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_kms.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_plane.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_plane.h
>   create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.h
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
