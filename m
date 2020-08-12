Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DD2426DB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 10:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC096E8CC;
	Wed, 12 Aug 2020 08:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24566E8CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id F22C3FB03;
 Wed, 12 Aug 2020 10:39:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTzYe0sNo_dQ; Wed, 12 Aug 2020 10:39:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id BD74045770; Wed, 12 Aug 2020 10:39:37 +0200 (CEST)
Date: Wed, 12 Aug 2020 10:39:37 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Swapnil Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v8 0/3] drm: Add support for Cadence MHDP DPI/DP bridge
 and J721E wrapper.
Message-ID: <20200812083937.GA8816@bogon.m.sigxcpu.org>
References: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596713672-8146-1-git-send-email-sjakhade@cadence.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 tomi.valkeinen@ti.com, jonas@kwiboo.se, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 sandor.yu@nxp.com, jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Thu, Aug 06, 2020 at 01:34:29PM +0200, Swapnil Jakhade wrote:
> This patch series adds new DRM bridge driver for Cadence MHDP DPI/DP
> bridge. The Cadence Display Port IP is also referred as MHDP (Mobile High
> Definition Link, High-Definition Multimedia Interface, Display Port).
> Cadence Display Port complies with VESA DisplayPort (DP) and embedded
> Display Port (eDP) standards.

Is there any relation to the cadence mhdp ip core used inthe imx8mq:

    https://lore.kernel.org/dri-devel/cover.1590982881.git.Sandor.yu@nxp.com/

It looks very similar in several places so should that use the same driver?
Cheers,
 -- Guido

> 
> The MHDP bridge driver currently implements Single Stream Transport (SST)
> mode. It also adds Texas Instruments j721e SoC specific wrapper and adds
> the device tree bindings in YAML format.
> 
> Some of the features that will be added later on include (but are not
> limited to):
> - Power Management (PM) support: We will implement the PM functions in
>   next stage once there will be a stable driver in upstream
> - Audio and MST support
> 
> The patch series has three patches in the below sequence:
> 1. 0001-dt-bindings-drm-bridge-Document-Cadence-MHDP-brid.patch
> Documents the bindings in yaml format.
> 2. 0002-drm-bridge-Add-support-for-Cadence-MHDP-DPI-DP-br.patch
> This patch adds new DRM bridge driver for Cadence MHDP Display Port.
> The patch implements support for single stream transport mode.
> 3. 0003-drm-bridge-cdns-mhdp-Add-j721e-wrapper.patch
> Adds Texas Instruments (TI) j721e wrapper for MHDP. The wrapper configures
> MHDP clocks and muxes as required by SoC.
> 
> This patch series is dependent on PHY patch series [1] to add new PHY APIs
> to get/set PHY attributes which is under review and not merged yet.
> 
> [1] https://lkml.org/lkml/2020/7/17/158
> 
> Version History:
> 
> v8:
> 
> In 1/3
> - Fix error reported by dt_binding_check
> - Fix indent in the example
> - Fix other comments given for v7 patches.
> 
> In 2/3:
> - Implement bridge connector operations .get_edid() and .detect().
> - Make connector creation optional based on DRM_BRIDGE_ATTACH_NO_CONNECTOR
>   flag.
> - Fix other comments given for v7 patches.
> 
> In 3/3
> - Fix comments given for v7 patches.
> 
> v7:
> 
> In 1/3
> - No change
> 
> In 2/3
> - Switch to atomic versions of bridge operations
> - Implement atomic_check() handler to perform all validation checks
> - Add struct cdns_mhdp_bridge_state with subclassed bridge state
> - Use PHY API[1] to get PHY attributes instead of reading from PHY DT node
> - Updated HPD handling and link configuration in IRQ handler
> - Add "link_mutex" protecting the access to all the link parameters
> - Add support to check and print FW version information
> - Add separate function to initialize host parameters to simplify probe
> - Use waitqueue instead of manual loop in cdns_mhdp_remove
> - Add forward declarations and header files in cdns-mhdp-core.h file
> - Use bool instead of single bit values in struct cdns_mhdp_device
> - Fix for other minor comments given for v6 patches
> 
> In 3/3
> - Use of_device_is_compatible() to set compatible string specific values
> - Move mhdp_ti_j721e_ops structure to cdns-mhdp-j721e.c
> - Remove duplicate Copyright message
> - Remove CONFIG_DRM_CDNS_MHDP_J721E check
> - Add Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> v6:
> - Added minor fixes in YAML file.
> - Added Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   to the YAML patch.
> - Removed all the FIXME comments which are invalid in drm driver.
> - Reduced the mailbox timeout from 5s to 2s.
> - Added Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>   to the 003-drm-mhdp-add-j721e-wrapper patch.
> - Added Signed-off all the module authors.
> - Fixed the compiler error Reported-by: kbuild test robot <lkp@intel.com>.
> 
> v5:
> - Added Signed-off-by: Jyri Sarha <jsarha@ti.com> tag to
>   the code patches.
> 
> v4:
> - Added SPDX dual license tag to YAML bindings.
> - Corrected indentation of the child node properties.
> - Removed the maxItems in the conditional statement.
> - Add Reviewed-by: Rob Herring <robh@kernel.org> tag to the
>   Document Cadence MHDP bridge bindings patch.
> - Renamed the DRM driver executable name from mhdp8546 to cdns-mhdp in
>   Makefile.
> - Renamed the DRM driver and header file from cdns-mhdp to cdns-mhdp-core.
> 
> v3:
> - Added if / then clause to validate that the reg length is proper
>   based on the value of the compatible property.
> - Updated phy property description in YAML to a generic one.
> - Renamed num_lanes and max_bit_rate property strings to cdns,num-lanes
>   and cdns,max-bit-rate.
> 
> v2:
> - Use enum in compatible property of YAML file.
> - Add reg-names property to YAML file
> - Add minItems and maxItems to reg property in YAML.
> - Remove cdns_mhdp_link_probe function to remove
>   duplication of reading dpcd capabilities.
> 
> Swapnil Jakhade (2):
>   drm: bridge: Add support for Cadence MHDP DPI/DP bridge
>   drm: bridge: cdns-mhdp: Add j721e wrapper
> 
> Yuti Amonkar (1):
>   dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings
> 
>  .../bindings/display/bridge/cdns,mhdp.yaml    |  139 +
>  drivers/gpu/drm/bridge/Kconfig                |   24 +
>  drivers/gpu/drm/bridge/Makefile               |    4 +
>  drivers/gpu/drm/bridge/cdns-mhdp-core.c       | 2562 +++++++++++++++++
>  drivers/gpu/drm/bridge/cdns-mhdp-core.h       |  397 +++
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.c      |   72 +
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.h      |   19 +
>  7 files changed, 3217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.h
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> 
> -- 
> 2.26.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
