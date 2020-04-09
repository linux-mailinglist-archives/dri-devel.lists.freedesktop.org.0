Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF81A354E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 16:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775476E197;
	Thu,  9 Apr 2020 14:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFEF6E1EE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 14:01:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A450220085;
 Thu,  9 Apr 2020 16:01:31 +0200 (CEST)
Date: Thu, 9 Apr 2020 16:01:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v11 0/2] drm: bridge: Add NWL MIPI DSI host controller
 support
Message-ID: <20200409140130.GA11188@ravnborg.org>
References: <cover.1586427783.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1586427783.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=hD80L64hAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=bsAt4o6wKiNBuRCtWDoA:9
 a=Wa48wQFXcrM_O4rm:21 a=NDxvc7IDKwPJqmQL:21 a=wPNLvfGTeEIA:10
 a=rTCnN_VGR-kA:10 a=XnmhkrOpp1gA:10 a=ADAus2jqH40A:10 a=xeO5FI30bkQA:10
 a=vwhoAI3WNd0A:10 a=OIfed0KlwsEA:10 a=V1ylM5Ky8W4A:10 a=I7S5AE4GHJEA:10
 a=9MgLeVKQu2IA:10 a=Zxz2OGRwlcEA:10 a=v60rsBRmgyoA:10 a=wktuWAoFL4cA:10
 a=ig373oIn6hUA:10 a=Qj1vBhx7iUYA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=ST-jHhOKWsTCqRlWije3:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Robert Chiras <robert.chiras@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido.

On Thu, Apr 09, 2020 at 12:42:00PM +0200, Guido G=FCnther wrote:
> This adds initial support for the NWL MIPI DSI Host controller found on i=
.MX8
> SoCs.
> =

> It adds support for the i.MX8MQ but the same IP core can also be found on=
 e.g.
> i.MX8QXP. I added the necessary hooks to support other imx8 variants but =
since
> I only have imx8mq boards to test I omitted the platform data for other S=
oCs.
> =

> The code is based on NXPs BSP so I added Robert Chiras as Co-authored-by.
> =

> The most notable changes over the BSP driver are
>  - Calculate HS mode timing from phy_configure_opts_mipi_dphy
>  - Perform all clock setup via DT
>  - Merge nwl-imx and nwl drivers
>  - Add B0 silion revision quirk
>  - become a bridge driver to hook into mxsfb / dcss
>    imx-display-subsystem so it makes sense to make it drive a bridge for =
dsi as
>    well).
>  - Use panel_bridge to attach the panel
>  - Use multiplex framework instead of accessing syscon directly
> =

> This has been tested on a Librem 5 devkit using mxsfb with Robert's patch=
es[1]
> and the mainline rocktech-jh057n00900 DSI panel driver on next-20200317 a=
nd on
> the Librem5 with the a Mantix MLAF057WE51-X DSI panel driver (not yet mai=
nline)
> The DCSS (submitted for mainline inclusion now too) can also act as input
> source.

Thanks for your persistence with this driver.
I got ack from Laurent on IRC to apply it (not for the driver as he had
no time to review it).
So applied to drm-misc-next now.

I look forward for the update to support DRM_BRIDGE_ATTACH_NO_CONNECTOR
in this driver and the corresponding display driver.

	Sam
> =

> Changes from v10:
> - Per review comments by Sam Ravnborg
>   https://lore.kernel.org/linux-arm-kernel/20200408175252.GB24828@ravnbor=
g.org/
>   - Drop unused headers
>   - Fix 'check-patch --strict' findings
>   - Print error when DRM_BRIDGE_ATTACH_NO_CONNECTOR is passed
> - Per review comment by Laurent Pinchart
>   https://lore.kernel.org/linux-arm-kernel/20200408173258.GA24828@ravnbor=
g.org/
>   - There's only one endpoint allowed at a time, add a restriction for th=
at.
> - Add Reviewed-by from Fabio Estevam
>   https://lore.kernel.org/linux-arm-kernel/CAOMZO5Dhy7ahcR-S=3DQG=3DpumxX=
a8HnQoWpg0TdFyeu_Levdh9_Q@mail.gmail.com/
>   https://lore.kernel.org/linux-arm-kernel/CAOMZO5Du-ZP7Wxm2eh8WaFoCk_kWo=
mgH57ayJrBB0PzhuAA+mw@mail.gmail.com/
> - Move to next-20200408
> =

> Changes from v9:
> - Per review comments by Sam Ravnborg
>   https://lore.kernel.org/dri-devel/20200318214639.GA971@ravnborg.org/
>   - Drop header-test-y since kernel lost support
>   - Handle drm_bridge_attach's new flags argument
>   - Add Acked-by: to binding patch, thanks!
> - Move to next-20200319
> =

> Changes from v8:
> - Per review comments by Robert Chiras
>   https://lore.kernel.org/dri-devel/1575366594.6423.61.camel@nxp.com/
>   - don't mix DSI host and bridge initialization
>   - only select output source once
>   - defer probe when panel is not ready to fix usage as a module
>   - use correct reset sequence as described by Robert
>     (and provided by NWL)
>   - use mode->clock instead of mode->crtc_clock
> - Add tested by from Martin Kepplinger, thanks!
> - Drop platform specific data (as suggested previously by Laurent Pinchar=
t and
>   Andrzej Hajda) since imx8q* needs another set of abstractions with the =
new
>   reset sequence and that's easier to do when adding imx8q* support rathe=
r then
>   adding wrong abstraction now.
> - Update bindings to use proper clock and irq names to make the example m=
atch
>   reality more closely.
> - Use `fallthrough;` instead of /* Fall through */ in switch statements
> - Move to next-20200226
> =

> Changes from v7:
> - Drop reset quirk. It's not needed with mxsfb and sometimes triggers a s=
hifted display.
> =

> Changes from v6:
> - Per review comments by Andrzej Hajda
>   https://lore.kernel.org/linux-arm-kernel/c86b7ca2-7799-eafd-c380-e4b551=
520837@samsung.com/
>   - Drop spare empty line
>   - handle nwl_dsi_write errors
>   - better handle read errors
>   - unwind in case of error in nwl_dsi_enable
>   - use bridge_to_dsi() instead of accessing driver_private
>   - don't log on -EPROBEDEFER when fething the reset controller
>   - use endpoint number to determine input
> - Spotted by kbuild test robot <lkp@intel.com>
>   https://lore.kernel.org/linux-arm-kernel/201909230644.qfSKbNf9%25lkp@in=
tel.com/
>   Use signed return type for nwl_dsi_get_dpi_pixel_format
> - Drop connector type from drm_panel_bridge_add
> - Don't forget to set an error value on dsi reads
> =

> Changes from v5:
> - Per review comments by Andrzej Hajda
>   https://lists.freedesktop.org/archives/dri-devel/2019-September/235281.=
html
>   - Fix include file ordering
>   - Add a comment to nwl_dsi_platform_data that will allow to add support
>     at least for the i.MX8QM
>   - Merge driver into a single file plus the register defs in a separate =
header
> - Make more functions and structs static
> =

> Changes from v4:
> - Collect Reviewed-by: from Rob Herring, thanks!
>   https://lists.freedesktop.org/archives/dri-devel/2019-September/233979.=
html
> - Spotted by kbuild test robot <lkp@intel.com>
>   https://lists.freedesktop.org/archives/dri-devel/2019-September/233860.=
html
>   https://lists.freedesktop.org/archives/dri-devel/2019-September/233863.=
html
>   - fix format string for size_t
>   - Use DIV64_U64_ROUND_UP to fix build on 32 bit architectures
>     We can't use simple shift sind d and n are similar in size and
>     we need full precision
> - Fix debug cfg_t_post debug print out
> - Avoid PSEC_PER_SEC
> - Move timeout / overflow handling out of nwl_dsi_finish_transmission,
>   it would never end up being reported since the call to the function
>   was guarded by flags.
> - Drop 'support for' from KConfig title to make it match the other
>   drivers in that submenu
> =

> Changes from v3:
> - Per review comments by Robert Chiras
>   https://lists.freedesktop.org/archives/dri-devel/2019-August/232580.html
>   - Add Robert's {Signed-off,Tested}-by:
>   - Respect number of lanes when calculting bandwidth limits
>   - Drop duplicate NWL_DSI_ENABLE_MULT_PKTS setup
> - Per testing by Rober Chiras
>   https://lists.freedesktop.org/archives/dri-devel/2019-August/233688.html
>   - Drop duplicate (and too early) drm_bridge_add() in nwl_dsi_probe() th=
at
>     made mxsfb fail to connect to the bridge since the panel_bridge was n=
ot up
>     yet. drm_bridge_add() happens in nwl_dsi_host_attach() where after the
>     panel_bridge was set up.
> - Per review comments by Rob Herring on bindings
>   https://lists.freedesktop.org/archives/dri-devel/2019-August/233196.html
>   - drop description from power-domains and resets
>   - allow BSD 2 clause license as well
>   - make ports more specific
>   - add #address-cells, #size-cells as required
>   - use additionalProperties
>   - panel is of type object
> =

> Changes from v2:
> - Per review comments by Rob Herring
>   https://lists.freedesktop.org/archives/dri-devel/2019-August/230448.html
>   - bindings:
>     - Simplify by restricting to fsl,imx8mq-nwl-dsi
>     - document reset lines
>     - add port@{0,1}
>     - use a real compatible string for the panel
>     - resets are required
> - Per review comments by Arnd Bergmann
>   https://lists.freedesktop.org/archives/dri-devel/2019-August/230868.html
>   - Don't access iomuxc_gpr regs directly. This allows us to drop the
>     first patch in the series with the iomuxc_gpr field defines.
> - Per review comments by Laurent Pinchart
>   Fix wording in bindings
> - Add mux-controls to bindings
> - Don't print error message on dphy probe deferral
> =

> Changes from v1:
> - Per review comments by Sam Ravnborg
>   https://lists.freedesktop.org/archives/dri-devel/2019-July/228130.html
>   - Change binding docs to YAML
>   - build: Don't always visit imx-nwl/
>   - build: Add header-test-y
>   - Sort headers according to DRM convention
>   - Use drm_display_mode instead of videmode
> - Per review comments by Fabio Estevam
>   https://lists.freedesktop.org/archives/dri-devel/2019-July/228299.html
>   - Don't restrict build to ARCH_MXC
>   - Drop unused includes
>   - Drop unreachable code in imx_nwl_dsi_bridge_mode_fixup()
>   - Drop remaining calls of dev_err() and use DRM_DEV_ERR()
>     consistently.
>   - Use devm_platform_ioremap_resource()
>   - Drop devm_free_irq() in probe() error path
>   - Use single line comments where sufficient
>   - Use <linux/time64.h> instead of defining USEC_PER_SEC
>   - Make input source select imx8 specific
>   - Drop <asm/unaligned.h> inclusion (after removal of get_unaligned_le32)
>   - Drop all EXPORT_SYMBOL_GPL() for functions used in the same module
>     but different source files.
>   - Drop nwl_dsi_enable_{rx,tx}_clock() by invoking clk_prepare_enable()
>     directly
>   - Remove pointless comment
> - Laurent Pinchart
>   https://lists.freedesktop.org/archives/dri-devel/2019-July/228313.html
>   https://lists.freedesktop.org/archives/dri-devel/2019-July/228308.html
>   - Drop (on iMX8MQ) unused csr regmap
>   - Use NWL_MAX_PLATFORM_CLOCKS everywhere
>   - Drop get_unaligned_le32() usage
>   - remove duplicate 'for the' in binding docs
>   - Don't include unused <linux/clk-provider.h>
>   - Don't include unused <linux/component.h>
>   - Drop dpms_mode for tracking state, trust the drm layer on that
>   - Use pm_runtime_put() instead of pm_runtime_put_sync()
>   - Don't overwrite encoder type
>   - Make imx_nwl_platform_data const
>   - Use the reset controller API instead of open coding that platform spe=
cific
>     part
>   - Use <linux/bitfield.h> intead of making up our own defines
>   - name mipi_dsi_transfer less generic: nwl_dsi_transfer
>   - ensure clean in .remove by calling mipi_dsi_host_unregister.
>   - prefix constants by NWL_DSI_
>   - properly format transfer_direction enum
>   - simplify platform clock handling
>   - Don't modify state in mode_fixup() and use mode_set() instead
>   - Drop bridge detach(), already handle by nwl_dsi_host_detach()
>   - Drop USE_*_QUIRK() macros
> - Drop (for now) unused clock defnitions. 'pixel' and 'bypass' clock will=
 be
>   used for i.MX8 SoCs but since they're unused atm drop the definitions -=
 but
>   keep the logic to enable/disable several clocks in place since we know =
we'll
>   need it in the future.
> =

> Changes from v0:
> - Add quirk for IMQ8MQ silicon B0 revision to not mess with the
>   system reset controller on power down since enable() won't work
>   otherwise.
> - Drop devm_free_irq() handled by the device driver core
> - Disable tx esc clock after the phy power down to unbreak
>   disable/enable (unblank/blank)
> - Add ports to dt binding docs
> - Select GENERIC_PHY_MIPI_DPHY instead of GENERIC_PHY for
>   phy_mipi_dphy_get_default_config
> - Select DRM_MIPI_DSI
> - Include drm_print.h to fix build on next-20190408
> - Drop some debugging messages
> - Newline terminate all DRM_ printouts
> - Turn component driver into a drm bridge
> =

> [0]: https://lists.freedesktop.org/archives/dri-devel/2019-May/219484.html
> [1]: https://patchwork.freedesktop.org/series/62822/
> =

> Guido G=FCnther (2):
>   dt-bindings: display/bridge: Add binding for NWL mipi dsi host
>     controller
>   drm/bridge: Add NWL MIPI DSI host controller support
> =

>  .../bindings/display/bridge/nwl-dsi.yaml      |  226 +++
>  drivers/gpu/drm/bridge/Kconfig                |   16 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/nwl-dsi.c              | 1213 +++++++++++++++++
>  drivers/gpu/drm/bridge/nwl-dsi.h              |  144 ++
>  5 files changed, 1600 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nwl-=
dsi.yaml
>  create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.c
>  create mode 100644 drivers/gpu/drm/bridge/nwl-dsi.h
> =

> -- =

> 2.23.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
