Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B79B44F3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7066110E5E0;
	Tue, 29 Oct 2024 08:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="p71lbg8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 507 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2024 08:08:57 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B658A10E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:08:57 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 8E273240028
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1730188828; bh=vJzCAvK3M1+hlJ4gIxzpgr/HkjubV4j2rsSZF2eWxqo=;
 h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
 Content-Transfer-Encoding:MIME-Version:From;
 b=p71lbg8S5del9NTis6FfIXYzRYQl3pmxEQ0a9gAGDviIipPL5CG2eybaeFL5TbJgz
 smn8Z2hVprDBWWGYj/yrO2x6DJ0HnbaCUJPxq9XeGc2q2jrTwpIZB57FVniGjnzjOO
 5uwxRj6xPjeT6D6sP1tBXVq+g9zmWAmP6EWkZd4I7FvkCOWXD+Fu22RTPd2V9OB9et
 kPbBK2fXS2hfjbYIx4SL1WPruZUNPyN2AZrIMXa2VjYRyBNE4SD1MvbVwPC2nCZVgA
 FMeqfJTdOmXBUzIx0CCphRPxXYHyLLg1AwH6IYmqUlA+pCDKOThPPR9PwUB/fipx2m
 nHZ0lZ8gyIU7Q==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Xd2jz4Flqz9rxD;
 Tue, 29 Oct 2024 09:00:23 +0100 (CET)
Message-ID: <3b247041c89791c80a69b16f3f3b80c3b8bbeefd.camel@posteo.de>
Subject: Re: [PATCH v16 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
From: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Sandor Yu <Sandor.yu@nxp.com>, dmitry.baryshkov@linaro.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com,  airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org,  krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de,  festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Date: Tue, 29 Oct 2024 08:00:22 +0000
In-Reply-To: <cover.1719903904.git.Sandor.yu@nxp.com>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Oct 2024 08:54:51 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 02.07.2024 um 20:22 +0800 schrieb Sandor Yu:
> This patchset sits on top
> Dmitry's 'make use of the HDMI connector infrastructure' patchset
> ([2]).
>=20
> The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
>=20
> The patch set compose of DRM bridge drivers and PHY driver.
>=20
> Both of them need by patch #1 and #2 to pass build.
>=20
> DRM bridges driver patches:
> =C2=A0 #1: drm: bridge: Cadence: Creat mhdp helper driver
> =C2=A0 #2: phy: Add HDMI configuration options
> =C2=A0 #3: dt-bindings: display: bridge: Add Cadence MHDP8501
> =C2=A0 #4: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
>=20
> PHY driver patches:
> =C2=A0 #1: drm: bridge: Cadence: Creat mhdp helper driver
> =C2=A0 #2: phy: Add HDMI configuration options
> =C2=A0 #5: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> =C2=A0 #6: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for
> i.MX8MQ
>=20
> i.MX8M/TQMa8Mx DT patches:
> =C2=A0 #7: Add DT nodes for DCSS/HDMI pipeline
> =C2=A0 #8: Enable HDMI for TQMa8Mx/MBa8Mx
>=20
> [2] https://patchwork.freedesktop.org/series/130888/
>=20
> v15->v16:
> Patch #2:
> - Remove pixel_clk_rate, bpc and color_space fields from struct
> =C2=A0 phy_configure_opts_hdmi, they were replaced by
> =C2=A0 unsigned long long tmds_char_rate.
> - Remove r-b and a-c tags because this patch have important change.
> Patch #4:
> - Add DRM_BRIDGE_OP_HDMI flags for HDMI driver,
> - Introduce the hdmi info frame helper functions,
> =C2=A0 added hdmi_clear_infoframe(), hdmi_write_infoframe() and
> =C2=A0 hdmi_tmds_char_rate_valid() according Dmitry's patch
> =C2=A0 'make use of the HDMI connector infrastructure' patchset ([2]).
> - mode_fixup() is replaced by atomic_check().
> - Fix video mode 4Kp30 did not work on some displays that support
> =C2=A0 LTE_340Mcsc_scramble.
> - updated for tmds_char_rate added in patch #2.=20
> Patch #6:
> - updated for tmds_char_rate added in patch #2.=20
>=20
> v14->v15:
> Patch #6 + #7:
> -=C2=A0 Merged PHY driver into a single combo PHY driver
> Patch #7 + #8:
> - Add DT patches for a running HDMI setup
>=20
> v13->v14:
> Patch #4:
> - Rebase to next-20240219, replace get_edid function by edid_read
> =C2=A0 function as commits d807ad80d811b ("drm/bridge: add ->edid_read
> =C2=A0 hook and drm_bridge_edid_read()") and 27b8f91c08d99 ("drm/bridge:
> =C2=A0 remove ->get_edid callback") had change the API.
>=20
> v12->v13:
> Patch #4:
> - Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
> - Fix build warning
> - Order bit bpc and color_space in descending shit.=20
> Patch #7:
> - Fix build warning
>=20
> v11->v12:
> Patch #1:=20
> - Move status initialize out of mbox_mutex.
> - Reorder API functions in alphabetical.
> - Add notes for malibox access functions.
> - Add year 2024 to copyright.
> Patch #4:
> - Replace DRM_INFO with dev_info or dev_warn.
> - Replace DRM_ERROR with dev_err.
> - Return ret when cdns_mhdp_dpcd_read failed in function
> cdns_dp_aux_transferi().
> - Remove unused parmeter in function cdns_dp_get_msa_misc
> =C2=A0 and use two separate variables for color space and bpc.
> - Add year 2024 to copyright.
> Patch #6:
> - Return error code to replace -1 for function wait_for_ack().
> - Set cdns_phy->power_up =3D false in phy_power_down function.
> - Remove "RATE_8_1 =3D 810000", it is not used in driver.
> - Add year 2024 to copyright.
> Patch #7:
> - Adjust clk disable order.
> - Return error code to replace -1 for function wait_for_ack().
> - Use bool for variable pclk_in.
> - Add year 2024 to copyright.
>=20
> v10->v11:
> - rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
> use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
> same as the other mailbox access functions.
> - use static for cdns_mhdp_mailbox_write() and
> cdns_mhdp_mailbox_read()
> and remove them from EXPORT_SYMBOL_GPL().
> - remove MODULE_ALIAS() from mhdp8501 driver.
>=20
> v9->v10:
> - Create mhdp helper driver to replace macro functions,
> move all mhdp mailbox access functions and common functions
> into the helper driver.
> Patch #1:drm: bridge: Cadence: Creat mhdp helper driver
> it is totaly different with v9.
>=20
> v8->v9:
> - Remove compatible string "cdns,mhdp8501" that had removed
> =C2=A0 from dt-bindings file in v8.
> - Add Dmitry's R-b tag to patch #2
> - Add Krzysztof's R-b tag to patch #3
>=20
> v7->v8:
> MHDP8501 HDMI/DP:
> - Correct DT node name to "display-bridge".
> - Remove "cdns,mhdp8501" from mhdp8501 dt-binding doc.
>=20
> HDMI/DP PHY:
> - Introduced functions `wait_for_ack` and `wait_for_ack_clear` to
> handle
> =C2=A0 waiting with acknowledgment bits set and cleared respectively.
> - Use FIELD_PRE() to set bitfields for both HDMI and DP PHY.
>=20
> v6->v7:
> MHDP8501 HDMI/DP:
> - Combine HDMI and DP driver into one mhdp8501 driver.
> =C2=A0 Use the connector type to load the corresponding functions.
> - Remove connector init functions.
> - Add <linux/hdmi.h> in phy_hdmi.h to reuse 'enum hdmi_colorspace'.
>=20
> HDMI/DP PHY:
> - Lowercase hex values
> - Fix parameters indent issue on some functions
> - Replace 'udelay' with 'usleep_range'
>=20
> v5->v6:
> HDMI/DP bridge driver
> - 8501 is the part number of Cadence MHDP on i.MX8MQ.
> =C2=A0 Use MHDP8501 to name hdmi/dp drivers and files.=20
> - Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
> - Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
> - Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
> - Fix HDMI scrambling is not enable issue when driver working in
> 4Kp60
> =C2=A0 mode.
> - Add HDMI/DP PHY API mailbox protect.
>=20
> HDMI/DP PHY driver:
> - Rename DP and HDMI PHY files and move to folder phy/freescale/
> - Remove properties num_lanes and link_rate from DP PHY driver.
> - Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-
> phy.yaml
> - Update compatible string to "fsl,imx8mq-dp-phy".
> - Update compatible string to "fsl,imx8mq-hdmi-phy".
>=20
> v4->v5:
> - Drop "clk" suffix in clock name.
> - Add output port property in the example of hdmi/dp.
>=20
> v3->v4:
> dt-bindings:
> - Correct dt-bindings coding style and address review comments.
> - Add apb_clk description.
> - Add output port for HDMI/DP connector
> PHY:
> - Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
> - Remove unused registers define from HDMI and DP PHY drivers.
> - More description in phy_hdmi.h.
> - Add apb_clk to HDMI and DP phy driver.
> HDMI/DP:
> - Use get_unaligned_le32() to replace hardcode type conversion
> =C2=A0 in HDMI AVI infoframe data fill function.
> - Add mailbox mutex lock in HDMI/DP driver for phy functions
> =C2=A0 to reslove race conditions between HDMI/DP and PHY drivers.
> - Add apb_clk to both HDMI and DP driver.
> - Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
> - Remove bpc 12 and 16 optional that not supported.
>=20
> v2->v3:
> Address comments for dt-bindings files.
> - Correct dts-bindings file names=20
> =C2=A0 Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
> =C2=A0 Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
> - Drop redundant words and descriptions.
> - Correct hdmi/dp node name.
>=20
> v2 is a completely different version compared to v1.
> Previous v1 can be available here [1].
>=20
> v1->v2:
> - Reuse Cadence mailbox access functions from mhdp8546 instead of
> =C2=A0 rockchip DP.
> - Mailbox access functions be convert to marco functions
> =C2=A0 that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
> - Plain bridge instead of component driver.
> - Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
> - Audio driver are removed from the patch set, it will be add in
> another
> =C2=A0 patch set later.
>=20
> [1]
> https://patchwork.kernel.org/project/linux-rockchip/cover/cover.159098288=
1.git.Sandor.yu@nxp.com/
>=20
> Alexander Stein (2):
> =C2=A0 arm64: dts: imx8mq: Add DCSS + HDMI/DP display pipeline
> =C2=A0 arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI support
>=20
> Sandor Yu (6):
> =C2=A0 drm: bridge: Cadence: Create mhdp helper driver
> =C2=A0 phy: Add HDMI configuration options
> =C2=A0 dt-bindings: display: bridge: Add Cadence MHDP8501
> =C2=A0 drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> =C2=A0 dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> =C2=A0 phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
>=20
> =C2=A0.../display/bridge/cdns,mhdp8501.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 104 ++
> =C2=A0.../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml=C2=A0 |=C2=A0=C2=A0 51=
 +
> =C2=A0.../dts/freescale/imx8mq-tqma8mq-mba8mx.dts=C2=A0=C2=A0 |=C2=A0=C2=
=A0 20 +
> =C2=A0arch/arm64/boot/dts/freescale/imx8mq.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 68 +
> =C2=A0arch/arm64/boot/dts/freescale/mba8mx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 11 +
> =C2=A0drivers/gpu/drm/bridge/cadence/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 20 +
> =C2=A0drivers/gpu/drm/bridge/cadence/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +
> =C2=A0.../gpu/drm/bridge/cadence/cdns-mhdp-helper.c |=C2=A0 304 ++++
> =C2=A0.../drm/bridge/cadence/cdns-mhdp8501-core.c=C2=A0=C2=A0 |=C2=A0 330=
 ++++
> =C2=A0.../drm/bridge/cadence/cdns-mhdp8501-core.h=C2=A0=C2=A0 |=C2=A0 367=
 +++++
> =C2=A0.../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c |=C2=A0 700 +++++++++
> =C2=A0.../drm/bridge/cadence/cdns-mhdp8501-hdmi.c=C2=A0=C2=A0 |=C2=A0 595=
 ++++++++
> =C2=A0.../drm/bridge/cadence/cdns-mhdp8546-core.c=C2=A0=C2=A0 |=C2=A0 403=
 +----
> =C2=A0.../drm/bridge/cadence/cdns-mhdp8546-core.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 44 +-
> =C2=A0drivers/phy/freescale/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
10 +
> =C2=A0drivers/phy/freescale/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 =
1 +
> =C2=A0drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c=C2=A0 | 1340
> +++++++++++++++++
> =C2=A0include/drm/bridge/cdns-mhdp-helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 97 ++
> =C2=A0include/linux/phy/phy-hdmi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 20 +
> =C2=A0include/linux/phy/phy.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 7 +-
> =C2=A020 files changed, 4120 insertions(+), 375 deletions(-)
> =C2=A0create mode 100644
> Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> =C2=A0create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq=
-
> dp-hdmi-phy.yaml
> =C2=A0create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.=
c
> =C2=A0create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-
> core.c
> =C2=A0create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-
> core.h
> =C2=A0create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.=
c
> =C2=A0create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-
> hdmi.c
> =C2=A0create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> =C2=A0create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
> =C2=A0create mode 100644 include/linux/phy/phy-hdmi.h
>=20

I ran this on top of a v6.11 kernel on imx8mq (type-c dp) and got -22
at the link-training command.

I'll try to test v18 later and can post my tree, but wanted to drop
this here in case any bell rings already and so that you are aware that
I want to test this.

thanks for keeping so patient with this,

                              martin

