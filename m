Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4D2D5E5E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9086E8B3;
	Thu, 10 Dec 2020 14:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795C26E52C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:46:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E6032EC5;
 Thu, 10 Dec 2020 08:46:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 08:46:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=2mM5F5w/Ms2f3FSkqgC6qFfGU2
 pI+9dyJwvXJa0dfw4=; b=oT3FsbRn/eSIi6+XjN4UOcKIUtXQ27V/bIJ88VFOhe
 o/l+NmXvIFKUPGKr6kasRabnz+khP/DhNi3tfZ5LZifZs7+Hb4QYxDNehYmVRaOo
 /CilS3jbLfvcY2/MOqiahNvGe3QAkDM1Xg53iPeOzAA0Ctnb/ser7v63o6FTffr4
 upDsVdMUKde9f/zEED2IOve30b5AjZNbRybHJ848HQRjBjj6RkfuvrB4oyiUdQWI
 xVdonOm9KMHCGOGawKXk9k1I+bb+5aWC4wtCM8wcaN0F3t4MfVIgAvTTSDgpDkIU
 rKsNViHGBo6ucP1h0uBkxmUVmw9p9S6eniqjTEe5Ew/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2mM5F5
 w/Ms2f3FSkqgC6qFfGU2pI+9dyJwvXJa0dfw4=; b=NZFpj4GjOVx1ot5iFlReP2
 EJQ4fYtaDe+yKTyQYxC7zEIBg8F5oF5tDgDUL3rE4+4FalyFYGHzuQ5mRY+9lb3p
 EWNKhxCch4UiKc0Fv5nbrEFTC7BMQbm63lBYbzSXeZCu+AjM9c3A3MusUTnlqGn4
 dATKqqaX0Ie7WHqcXeDh/+pCuyrGFA62c2n2jJr0XI4fQNcRKGFNEVKL9kpj3TPo
 uZ7O5MwVecgkLq31Q6yVypTP4ZbvvXC4FvDpgCMgmvtgvrRqiNvOsSipml9k4pzb
 d/dQYtwT35j8Omfh5TtRBgHNKbQuQMChOelpnmqyFcr8OAyxRL4cqBykAVaGcgWA
 ==
X-ME-Sender: <xms:ySbSXxXb3A0YNpRtNGCizods-XSYjdgdO0aY9pYxgDOBJuGU3eyZDg>
 <xme:ySbSXxlCMMlT3_maeubL39gXgMZuZtrk8shpue-BPSCG2b1Tisgrg6O0wXIDv7vG7
 m1xszTUM-q81XFqI00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ySbSX9byWpkZzSqnVffJufTazefJB6MaTcZqVV4cOuX30Qz5A4PfxA>
 <xmx:ySbSX0UVEbjLAJD7SjPCt3kCgpIl5GhDjtBEkLJP81pV0f-L7v0VWw>
 <xmx:ySbSX7nQQWb6pVFEv5UUGfN65_7c9EMbuOaNUsokBSYXkmMsvslHcw>
 <xmx:zSbSXzmukvgaILRgABTSaws0XcYXHh9cqlFyolM3zWB4KJdJy-Fof7F1SEs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8723240062;
 Thu, 10 Dec 2020 08:46:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
Date: Thu, 10 Dec 2020 14:46:33 +0100
Message-Id: <20201210134648.272857-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Gleixner <tglx@linutronix.de>,
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

$ cec-ctl --tuner -p 1.0.0.0
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

$ cec-compliance
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

Compliance test for vc4_hdmi device /dev/cec0:

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
		Vendor ID                  : 0x000c03 (HDMI)
		OSD Name                   : 'test-124'
		Power Status               : Tx, OK, Rx, OK, Feature Abort

Total for vc4_hdmi device /dev/cec0: 1, Succeeded: 1, Failed: 0, Warnings: 0

Let me know what you think,
Maxime

Dom Cobley (5):
  drm/vc4: hdmi: Move hdmi reset to bind
  drm/vc4: hdmi: Fix register offset with longer CEC messages
  drm/vc4: hdmi: Fix up CEC registers
  drm/vc4: hdmi: Restore cec physical address on reconnect
  drm/vc4: hdmi: Remove cec_available flag

Maxime Ripard (10):
  irqchip: Allow to compile bcmstb on other platforms
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
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 224 +++++++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-
 drivers/irqchip/Kconfig                       |   2 +-
 6 files changed, 232 insertions(+), 59 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
