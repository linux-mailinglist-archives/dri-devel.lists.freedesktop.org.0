Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3115FFB28
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 18:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A934C10E25C;
	Sat, 15 Oct 2022 16:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941410E25C
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 16:01:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 171B5480;
 Sat, 15 Oct 2022 18:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1665849717;
 bh=+SQTYUAyk9uznffcAHmtqIq29QbdUWcHPxXRBgIMwxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMVNtmflsLOmtZK0GraOVX46/6yu29qiW3GIF5lAjPVT3UugBpQHjzqSj6IJBKr63
 ZvJZNuy7d5YY1v/NyqS0MSEXjlyncGOMBu37sPg4SfvslhbqCSXTmma5Nq97xTtHiL
 o82mOevbfT39zFUBXm9882hfHf2d7CHYtW8gVHp0=
Date: Sat, 15 Oct 2022 19:01:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v8 0/3] Add RZ/G2L DSI driver
Message-ID: <Y0rZXpcW2U747bg5@pendragon.ideasonboard.com>
References: <20220920105501.396999-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592238A6FBE0BA8368EEE57C86279@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB592238A6FBE0BA8368EEE57C86279@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Sat, Oct 15, 2022 at 01:11:20PM +0000, Biju Das wrote:
> Gentle ping.

I've reviewed v8, everything looks fine. I've applied the patches to my
tree ([1]) for v6.2.

[1] git://linuxtv.org/pinchartl/media.git drm/du/next

> > Subject: [PATCH v8 0/3] Add RZ/G2L DSI driver
> > 
> > This patch series aims to support the MIPI DSI encoder found in the
> > RZ/G2L SoC. It currently supports DSI video mode only.
> > 
> > This unit supports MIPI Alliance Specification for Display Serial
> > Interface (DSI) Specification. This unit provides a solution for
> > transmitting MIPI DSI compliant digital video and packets. Normative
> > References are below.
> > * MIPI Alliance Specification for Display Serial Interface Version
> > 1.3.1
> > * MIPI Alliance Specification for D-PHY Version 2.1
> > 
> > The following are key features of this unit.
> > 
> > * 1 channel
> > * The number of Lane: 4-lane
> > * Support up to Full HD (1920 × 1080), 60 fps (RGB888)
> > * Maximum Bandwidth: 1.5 Gbps per lane
> > * Support Output Data Format: RGB666 / RGB888
> > 
> > This patch series is based on drm_misc and patches from drm/du/next
> > [1]
> > 
> > 
> > v7->v8:
> >  * Added Rb tag from Laurent.
> >  * Added hsfreq_max to struct rzg2l_mipi_dsi_timings.
> >  * Removed enums rzg2l_mipi_dsi_dphy_timings.
> >  * Replaced if else with for loop for finding dphy_timings
> >    based on hsfreq.
> >  * Removed checking "number of lanes capability" from rzg2l_mipi_dsi_
> >    startup() and added patch#3 for handling it in probe() and enforcing
> >    it in rzg2l_mipi_dsi_host_attach().
> >  * Added Labels with an "err_" prefix.
> > 	out_pm_put->err_pm_put
> > 	out_assert_rst_and_stop_clocks->err_stop
> > 	out_stop_hs_clock->err_stop_clock
> > 	out_pm_disable->err_pm_disable
> >  * Added error message for lane check in rzg2l_mipi_dsi_host_attach()
> >  * Replaced dev_warn->dev_err for the format error in rzg2l_mipi_dsi_host
> >    _attach(). Added missing "\n" and print the format for debugging.
> > v6->v7:
> >  * Added rzg2l_mipi_dsi_stop() counterpart of rzg2l_mipi_dsi_startup().
> >  * Error labels are named according to the cleanup operation they perform.
> >  * Restored Max lane capability read after dphy timing initialization
> >    as per the guide lines from SoC design team.
> >  * Added recommended lut values for the Global Operation Timing
> >    parameters for MIPI DPHY.
> > v5->v6:
> >  * Updated commit description
> >  * Moved handling of arst and prst from rzg2l_mipi_dsi_startup->runtime
> >    PM suspend/resume handlers.
> >  * Max lane capability read at probe(), and enforced in
> >    rzg2l_mipi_dsi_host_attach()
> >  * Simplified vich1ppsetr setting.
> >  * Renamed hsclk_running_mode,hsclk_mode->is_clk_cont.
> >  * Fixed typo in probe error message(arst->rst).
> >  * Reordered DRM bridge initaization in probe()
> >  * Updated typo in e-mail address.
> > v4->v5:
> >  * Added Ack from Sam.
> >  * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
> >    with drm_of_get_data_lanes_count_ep() in probe.
> > v3->v4:
> >  * Updated error handling in rzg2l_mipi_dsi_startup() and rzg2l_mipi_dsi_atomic_enable().
> > v2->v3:
> >  * Added Rb tag from Geert and Laurent
> >  * Fixed the typo "Receive" -> "transmit"
> >  * Added accepible values for data-lanes
> >  * Sorted Header file in the example
> >  * Added SoC specific compaible along with generic one.
> >  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function instead
> >    of the memory pointer
> >  * Fixed the comment in rzg2l_mipi_dsi_startup()
> >  * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
> >  * DRM bridge parameter initialization moved to probe
> >  * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
> >  * Inserted the missing blank lane after return in probe()
> >  * Added missing MODULE_DEVICE_TABLE
> >  * Added include linux/bits.h in header file
> >  * Fixed various macros in header file.
> >  * Reorder the make file for DSI, so that it is no more dependent
> >    on RZ/G2L DU patch series.
> > v1->v2:
> >  * Added full path for dsi-controller.yaml
> >  * Modeled DSI + D-PHY as single block and updated reg property
> >  * Fixed typo D_PHY->D-PHY
> >  * Updated description
> >  * Added interrupts and interrupt-names and updated the example
> >  * Driver rework based on dt-binding changes (DSI + D-PHY) as single block
> >  * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
> >  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
> >    and rzg2l_mipi_dsi_link_write
> >  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> > RFC->v1:
> >  * Added a ref to dsi-controller.yaml.
> >  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
> >    and dropped DRM as it is implied by DRM_BRIDGE
> >  * Used devm_reset_control_get_exclusive() for reset handle
> >  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
> >  * Added error check for pm, using pm_runtime_resume_and_get() instead of
> >    pm_runtime_get_sync()
> >  * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
> >  * Avoided read-modify-write stopping hsclock
> >  * Used devm_platform_ioremap_resource for resource allocation
> >  * Removed unnecessary assert call from probe and remove.
> >  * wrap the line after the PTR_ERR() in probe()
> >  * Updated reset failure messages in probe
> >  * Fixed the typo arstc->prstc
> >  * Made hex constants to lower case.
> > RFC:
> >  *
> > 
> > 
> > Biju Das (3):
> >   dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
> >   drm: rcar-du: Add RZ/G2L DSI driver
> >   drm: rcar-du: rzg2l_mipi_dsi: Enhance device lanes check
> > 
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 182 ++++
> >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> >  drivers/gpu/drm/rcar-du/Makefile              |   2 +
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 816 ++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
> >  5 files changed, 1159 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart
