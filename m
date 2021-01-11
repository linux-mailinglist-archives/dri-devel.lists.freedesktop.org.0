Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B72F2972
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B8F89FF9;
	Tue, 12 Jan 2021 07:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC06E0E4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9189158066D;
 Mon, 11 Jan 2021 09:23:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jan 2021 09:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=w0p+J4wUp/L3mhX+eC46Wy14gL
 fsx4bYdK/HsC65MaM=; b=oRd1zuznYqoiB01rlD9rjpKlOHzqZa8JTbdsLtYPd0
 jrm10ElIH2GenxFNT1+IdhtbtxuqrGvUsZj4TfesGzkb723VbJKMPNcg9APPX4w+
 kPqJXG6tiXdQt9Kl0koEd7yc7cLhzLHitsmNkNlGCNxmWcblDunWOKkXTIY9cMON
 fICrmkvt8DaTtAeB6o1aF0TiTITRoq3+0h3MgWKNlO4RT+UnSj1zyUA/7oMIJb+i
 GXmg188F8XMMxoYyVfB1KIqGRohmxH8koZQCCz4oXKB+PN/6+W+BWM9KfpD3JGOz
 FeWuyfgUmX35utc8aQKbX3M+LAhv1LPye0k5fsGHJMng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=w0p+J4
 wUp/L3mhX+eC46Wy14gLfsx4bYdK/HsC65MaM=; b=cSeBN1R7M0L2J1ooCzycdv
 /yShSSyY1K+x9nY1N0QJk2ZpMSzgDDRPM43w4vQ9WG03Z0E+BSfq7r+iFNJBzX7S
 Ky1XHPmXN93BNdSzRO0BksL69y2vmAvsyNPKHAYYUfefoIYTkneVcPGG4k7urHBc
 TGr6/Q10v2EyXfZkOjg5sjON9YoP/uINVL1jplYDoWBAsJwRJ+lIK+1NjP5/4D52
 R68a1Wum9D8+Yh7x8nnyOaDLXCw/jeoPkjqMt7k7qN+jf2Og7xhPgbi2GXzG1L29
 DFDqwt1fEHY1M2R6q41mDXGqiT514akjKLGKz+hVWFHQ9ekBt3J5SK9cdSIuEg7Q
 ==
X-ME-Sender: <xms:T1_8X6N-iHouEjLJ4WjKDDwzLjwiLXbFcd1tpk4yKdkZf0_vR2xZrw>
 <xme:T1_8X-LrZg6_tIQD0pSActXKvMzolQjFU_5Sf3rZItkRMMhuyxE6roJidBYVSwvNc
 htdjAelIR6n-NLnf6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T1_8XyJ5z-pG6Z-frhZXpPNT6Wdteexc8mNr9bEFkkuF2CdR4Yqn9w>
 <xmx:T1_8Xw5wRgu4rX0-lLaSwNv7vI1OjBTrXbRd5PifBweHN9t-dNjBgQ>
 <xmx:T1_8X0cqRrnEfSu8mDpaAX9aZfouwouo7WMrDR2q6sATPY6e-2gkDg>
 <xmx:UF_8X_HT94mcpfDvTlKJGogUV632sRe-R7FAmcobfMWyxUZ8ULznRA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 042281080063;
 Mon, 11 Jan 2021 09:23:10 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
Date: Mon, 11 Jan 2021 15:22:54 +0100
Message-Id: <20210111142309.193441-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a series introducing the CEC support for the BCM2711 found on the
RaspberryPi4.

The BCM2711 HDMI controller uses a similar layout for the CEC registers, the
main difference being that the interrupt handling part is now shared between
both HDMI controllers.

This series is mainly about fixing a couple of bugs, reworking the driver to
support having two different interrupts, one for each direction, provided by an
external irqchip, and enables the irqchip driver for the controller we have.

This has been tested on an RPi3 and RPi4, but requires the latest firmware.
It's is based on the 10 and 12 bpc series.

Here is the cec-compliance output:

pi@raspberrypi:~$ cec-ctl --tuner -p 1.0.0.0
The CEC adapter doesn't allow setting the physical address manually, ignore this option.

Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : 1.0.0.0
	Logical Address Mask       : 0x0008
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Tuner
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 3 (Tuner 1)
	    Primary Device Type    : Tuner
	    Logical Address Type   : Tuner
	    All Device Types       : Tuner
	    RC TV Profile          : None
	    Device Features        :
		None

pi@raspberrypi:~$ cec-compliance
cec-compliance SHA                 : not available
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : 1.0.0.0
	Logical Address Mask       : 0x0008
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Tuner
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 3 (Tuner 1)
	    Primary Device Type    : Tuner
	    Logical Address Type   : Tuner
	    All Device Types       : Tuner
	    RC TV Profile          : None
	    Device Features        :
		None

Compliance test for device /dev/cec0:

    The test results mean the following:
        OK                  Supported correctly by the device.
        OK (Not Supported)  Not supported and not mandatory for the device.
        OK (Presumed)       Presumably supported.  Manually check to confirm.
        OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
        OK (Refused)        Supported by the device, but was refused.
        FAIL                Failed and was expected to be supported by this device.

Find remote devices:
	Polling: OK

Network topology:
	System Information for device 0 (TV) from device 3 (Tuner 1):
		CEC Version                : 2.0
		Physical Address           : 0.0.0.0
		Primary Device Type        : TV
		Vendor ID                  : 0x000c03
		OSD Name                   : 'TV  '
		Power Status               : Tx, OK, Rx, OK, Feature Abort

Total: 1, Succeeded: 1, Failed: 0, Warnings: 0

pi@raspberrypi:~$ cec-ctl -d1 --tuner -p 1.0.0.0
The CEC adapter doesn't allow setting the physical address manually, ignore this option.

Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : 1.0.0.0
	Logical Address Mask       : 0x0008
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Tuner
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 3 (Tuner 1)
	    Primary Device Type    : Tuner
	    Logical Address Type   : Tuner
	    All Device Types       : Tuner
	    RC TV Profile          : None
	    Device Features        :
		None

pi@raspberrypi:~$ cec-compliance -d1
cec-compliance SHA                 : not available
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : 1.0.0.0
	Logical Address Mask       : 0x0008
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Tuner
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 3 (Tuner 1)
	    Primary Device Type    : Tuner
	    Logical Address Type   : Tuner
	    All Device Types       : Tuner
	    RC TV Profile          : None
	    Device Features        :
		None

Compliance test for device /dev/cec1:

    The test results mean the following:
        OK                  Supported correctly by the device.
        OK (Not Supported)  Not supported and not mandatory for the device.
        OK (Presumed)       Presumably supported.  Manually check to confirm.
        OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
        OK (Refused)        Supported by the device, but was refused.
        FAIL                Failed and was expected to be supported by this device.

Find remote devices:
	Polling: OK

Network topology:
	System Information for device 0 (TV) from device 3 (Tuner 1):
		CEC Version                : 2.0
		Physical Address           : 0.0.0.0
		Primary Device Type        : TV
		Vendor ID                  : 0x000c03
		OSD Name                   : 'TV  '
		Power Status               : Tx, OK, Rx, OK, Feature Abort

Total: 1, Succeeded: 1, Failed: 0, Warnings: 0

And for the hotplug detect test:

pi@raspberrypi:~$ cec-ctl --playback
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : f.f.f.f
	Logical Address Mask       : 0x0000
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Playback
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : Not Allocated
	    Primary Device Type    : Playback
	    Logical Address Type   : Playback
	    All Device Types       : Playback
	    RC TV Profile          : None
	    Device Features        :
		None

pi@raspberrypi:~$ cec-ctl -t0 --image-view-on
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : f.f.f.f
	Logical Address Mask       : 0x0000
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Playback
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : Not Allocated
	    Primary Device Type    : Playback
	    Logical Address Type   : Playback
	    All Device Types       : Playback
	    RC TV Profile          : None
	    Device Features        :
		None

Transmit from Unregistered to TV (15 to 0):
CEC_MSG_IMAGE_VIEW_ON (0x04)
	Sequence: 1 Tx Timestamp: 9182.611s
pi@raspberrypi:~$ cec-ctl -d1 --playback
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : f.f.f.f
	Logical Address Mask       : 0x0000
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Playback
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : Not Allocated
	    Primary Device Type    : Playback
	    Logical Address Type   : Playback
	    All Device Types       : Playback
	    RC TV Profile          : None
	    Device Features        :
		None

pi@raspberrypi:~$ cec-ctl -d1 -t0 --image-view-on
Driver Info:
	Driver Name                : vc4_hdmi
	Adapter Name               : vc4
	Capabilities               : 0x0000010e
		Logical Addresses
		Transmit
		Passthrough
	Driver version             : 5.10.0
	Available Logical Addresses: 1
	Physical Address           : f.f.f.f
	Logical Address Mask       : 0x0000
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : Playback
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : Not Allocated
	    Primary Device Type    : Playback
	    Logical Address Type   : Playback
	    All Device Types       : Playback
	    RC TV Profile          : None
	    Device Features        :
		None

Transmit from Unregistered to TV (15 to 0):
CEC_MSG_IMAGE_VIEW_ON (0x04)
	Sequence: 1 Tx Timestamp: 9207.191s

With the pulse-eight side reporting:

$ sudo cec-ctl -M
Driver Info:
	Driver Name                : pulse8-cec
	Adapter Name               : serio0
	Capabilities               : 0x0000003f
		Physical Address
		Logical Addresses
		Transmit
		Passthrough
		Remote Control Support
		Monitor All
	Driver version             : 5.9.16
	Available Logical Addresses: 1
	Connector Info             : None
	Physical Address           : 0.0.0.0
	Logical Address Mask       : 0x0001
	CEC Version                : 2.0
	Vendor ID                  : 0x000c03 (HDMI)
	OSD Name                   : 'TV  '
	Logical Addresses          : 1 (Allow RC Passthrough)

	  Logical Address          : 0 (TV)
	    Primary Device Type    : TV
	    Logical Address Type   : TV
	    All Device Types       : TV
	    RC TV Profile          : None
	    Device Features        :
		None

Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no

Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)

Let me know what you think,
Maxime

Changes from v1:
  - Removed the irqchip patch in favor of a select in mach-bcm
  - Fixed HDMI1 interrupt numbers
  - Removed redundant call to drm_connector_update_edid_property
  - Fixed the condition in vc4_hdmi_connector_detect
  - Added the tags
  - Rebased on top of drm-misc-next-2021-01-06

Dom Cobley (5):
  drm/vc4: hdmi: Move hdmi reset to bind
  drm/vc4: hdmi: Fix register offset with longer CEC messages
  drm/vc4: hdmi: Fix up CEC registers
  drm/vc4: hdmi: Restore cec physical address on reconnect
  drm/vc4: hdmi: Remove cec_available flag

Maxime Ripard (10):
  ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
  drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
  drm/vc4: hdmi: Update the CEC clock divider on HSM rate change
  drm/vc4: hdmi: Introduce a CEC clock
  drm/vc4: hdmi: Split the interrupt handlers
  drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
  drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts
  dt-binding: display: bcm2711-hdmi: Add CEC and hotplug interrupts
  ARM: dts: bcm2711: Add the BSC interrupt controller
  ARM: dts: bcm2711: Add the CEC interrupt controller

 .../bindings/display/brcm,bcm2711-hdmi.yaml   |  20 +-
 arch/arm/boot/dts/bcm2711.dtsi                |  30 +++
 arch/arm/mach-bcm/Kconfig                     |   1 +
 arch/arm64/Kconfig.platforms                  |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 223 ++++++++++++++----
 drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-
 7 files changed, 234 insertions(+), 56 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
