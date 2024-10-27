Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA59B20CF
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 22:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A5710E03C;
	Sun, 27 Oct 2024 21:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hCpffMJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECB610E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 21:17:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8C555C5849;
 Sun, 27 Oct 2024 21:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59915C4CEE4;
 Sun, 27 Oct 2024 21:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730063827;
 bh=8BxbqsTR+nwXPOEVNWoXKCAhMQb8yohDYa2UCOM1Qls=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hCpffMJXPBcfUUZ0udfUTLotwnU7Z2vHpYusSHQ/Z5KOvtA1mc/fhKWi8Xl7CD+Le
 jg0Wg87iQUb4nEm3fm1Gmb5wMNq2dJXHQG6NadLOjdngppie8HjKzmaxKLqc6zUrx9
 zg9MV1nbbvyO7fKilUFBY6o09XJOGXSqiLcd6DhjS0HBIUSeeAJWBnDaworcxvGezl
 O936Ynf0don4FAxSewNxIps3BCFdkQeDd5elZ7Fs37b6xHpsP+8kGEg+SbhaVsXKWW
 Ohw/gyIIQcegltpZedhM0Rrcj8u+37jQa4BDuZb2mCe8kg3cMfsU4r1LPyPeS8L92t
 8ngVdrD7Ma0Qw==
Date: Sun, 27 Oct 2024 16:17:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 linux-rpi-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
Message-Id: <173006367767.91262.6590539622480558932.robh@kernel.org>
Subject: Re: [PATCH v2 00/36] drm/vc4: Add support for BCM2712 / Pi5
 display hardware
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


On Fri, 25 Oct 2024 18:15:31 +0100, Dave Stevenson wrote:
> This series adds the required DRM, clock, and DT changes
> required to support the display hardware on Pi5.
> There are a couple of minor fixes first before the main patches.
> 
> Many of the patches were authored by Maxime whilst working
> for us, however there have been a number of fixes squashed
> into his original patches as issues have been found. I also
> reworked the way UBM allocations are done to avoid double
> buffering of the handles as they are quite a limited resource.
> 
> There are 2 variants of the IP. Most Pi5's released to date
> have used the C1 step of the SoC, whilst the 2GB Pi5 released
> in August is using the D0 step, as will other boards in future.
> 
> Due to various reasons the register map got reworked between
> the steps, so there is extra code to handle the differences.
> Which step is in use is read out of the hardware, so they
> share a compatible string.
> 
> Thanks!
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Changes in v2:
> - Collected Acks and R-b tags
> - Dropped patch 1 "drm/vc4: Limit max_bpc to 8 on Pi0-3". Already fixed as
>   noted by Maxime.
> - Fix unintialised var "mux" in vc6_hvs_pv_muxing_commit.
> - Fixed uninitialised var "reg" in vc4_hvs_cob_init.
> - Make bcm2712_mop_data and bcm2712_moplet_data static.
> - Removed the "disable_turbo" line from the struct in
>   raspberrypi_clock_property
> - I'm confused by the CI error "performing pointer arithmetic on a null
>   pointer has undefined behavior" for PCI_IOBASE as I'm not using it.
> - Link to v1: https://lore.kernel.org/r/20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com
> 
> ---
> Dave Stevenson (11):
>       drm/vc4: Use of_device_get_match_data to set generation
>       drm/vc4: Fix reading of frame count on GEN5 / Pi4
>       drm/vc4: drv: Add support for 2712 D-step
>       drm/vc4: hvs: Add in support for 2712 D-step.
>       drm/vc4: plane: Add support for 2712 D-step.
>       drm/vc4: hdmi: Support 2712 D-step register map
>       drm/vc4: Enable bg_fill if there are no planes enabled
>       drm/vc4: Drop planes that are completely off-screen or 0 crtc size
>       arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT
>       arm64: dts: broadcom: Add display pipeline support to BCM2712
>       arm64: dts: broadcom: Add DT for D-step version of BCM2712
> 
> Dom Cobley (3):
>       clk: bcm: rpi: Add ISP to exported clocks
>       clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
>       clk: bcm: rpi: Enable minimize for all firmware clocks
> 
> Maxime Ripard (22):
>       dt-bindings: display: Add BCM2712 HDMI bindings
>       dt-bindings: display: Add BCM2712 HVS bindings
>       dt-bindings: display: Add BCM2712 PixelValve bindings
>       dt-bindings: display: Add BCM2712 MOP bindings
>       dt-bindings: display: Add BCM2712 MOPLET bindings
>       dt-bindings: display: Add BCM2712 KMS driver bindings
>       drm/vc4: drv: Support BCM2712
>       drm/vc4: hvs: Add support for BCM2712 HVS
>       drm/vc4: crtc: Add support for BCM2712 PixelValves
>       drm/vc4: hdmi: Add support for BCM2712 HDMI controllers
>       drm/vc4: txp: Introduce structure to deal with revision differences
>       drm/vc4: txp: Rename TXP data structure
>       drm/vc4: txp: Add byte enable toggle bit
>       drm/vc4: txp: Add horizontal and vertical size offset toggle bit
>       drm/vc4: txp: Handle 40-bits DMA Addresses
>       drm/vc4: txp: Move the encoder type in the variant structure
>       drm/vc4: txp: Add a new TXP encoder type
>       drm/vc4: txp: Add support for BCM2712 MOP
>       drm/vc4: txp: Add BCM2712 MOPLET support
>       drm/vc4: Add additional warn_on for incorrect revisions
>       clk: bcm: rpi: Create helper to retrieve private data
>       clk: bcm: rpi: Add disp clock
> 
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        |   2 +
>  .../bindings/display/brcm,bcm2835-hvs.yaml         |   5 +-
>  .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |   3 +
>  .../bindings/display/brcm,bcm2835-txp.yaml         |   5 +-
>  .../bindings/display/brcm,bcm2835-vc4.yaml         |   1 +
>  arch/arm64/boot/dts/broadcom/Makefile              |   1 +
>  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts |  37 +
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  42 +
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 188 +++++
>  drivers/clk/bcm/clk-raspberrypi.c                  |  33 +-
>  drivers/gpu/drm/vc4/tests/vc4_mock.c               |   8 +-
>  drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 106 +--
>  drivers/gpu/drm/vc4/vc4_crtc.c                     |  96 ++-
>  drivers/gpu/drm/vc4/vc4_drv.c                      |  19 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                      |  54 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 107 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   4 +
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 | 640 +++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                | 217 ++++++
>  drivers/gpu/drm/vc4/vc4_hvs.c                      | 737 ++++++++++++++++--
>  drivers/gpu/drm/vc4/vc4_kms.c                      | 105 ++-
>  drivers/gpu/drm/vc4/vc4_plane.c                    | 866 ++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_regs.h                     | 297 +++++++
>  drivers/gpu/drm/vc4/vc4_txp.c                      |  91 ++-
>  include/soc/bcm2835/raspberrypi-firmware.h         |   1 +
>  25 files changed, 3461 insertions(+), 204 deletions(-)
> ---
> base-commit: 3ae80b375739495e36fc6143ff27716fe390a13e
> change-id: 20241002-drm-vc4-2712-support-9ad3236e3caf
> 
> Best regards,
> --
> Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y broadcom/bcm2712-d-rpi-5-b.dtb broadcom/bcm2712-rpi-5-b.dtb' for 20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com:

arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: interrupt-controller@7cd00000: 'interrupt-controller' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: interrupt-controller@7cd00000: '#interrupt-cells' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: gpio@7d517c00: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef00700: interrupts: [[1], [2], [3], [7], [8]] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef00700: interrupt-names:3: 'wakeup' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef00700: interrupt-names:4: 'hpd-connected' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef00700: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef00700: interrupts: [[1], [2], [3], [7], [8]] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef00700: interrupt-names:3: 'wakeup' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef00700: interrupt-names:4: 'hpd-connected' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef00700: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef05700: interrupts: [[11], [12], [13], [14], [15]] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef05700: interrupt-names:3: 'wakeup' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef05700: interrupt-names:4: 'hpd-connected' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7ef05700: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef05700: interrupts: [[11], [12], [13], [14], [15]] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef05700: interrupt-names:3: 'wakeup' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef05700: interrupt-names:4: 'hpd-connected' was expected
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7ef05700: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000: interrupts: [[2], [9], [16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000: clocks: [[18, 4], [18, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000: 'clock-names', 'interrupt-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000: interrupts: [[2], [9], [16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000: clocks: [[18, 4], [18, 16]] is too long
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000: 'clock-names', 'interrupt-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#





