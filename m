Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB82DCDD7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 09:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4536E243;
	Thu, 17 Dec 2020 08:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B2B6E094
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 12:35:50 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id pW1vkIY5QQwDIpW1yk8NkX; Wed, 16 Dec 2020 13:35:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1608122148; bh=4DpqKcOBl0qJNIm6neO+j5QyXFEgSMfAEIaDXahboUI=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=ELIvft3UTSvGsu6w+3+0B+wQ3bYUS4PqDUyaynXtFXNAXVuF/W7u8qI16S9n6QcsH
 mROgQTm+aEy4lkqenHhEAMzlcG3arWW7q4hh1coHXau1kxasMHSt9te7lKL81KQocH
 SPI6ShBeaPaoJuF+3YucIr5wHEw01h5vGZ0a4QPNCzy1Mn7Y7DZKBUYXobxlHgBBtN
 cp3BruEG83DQzyInYGPS5+aVHKuzFO/IjelgTx7f+ajjtrygjnBGEsz5s076LLXYVV
 4UBzTgTaYK0Mw3KDeL46DhKTyv9Orm+E/k4ZVMYsNWG/NBYmk4XnTmTd9X6Tlhy0hR
 jqpHIgiY7oinA==
Subject: Re: [PATCH 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20201210134648.272857-1-maxime@cerno.tech>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <23bdb67a-fb55-42d4-9130-ade1b0396768@xs4all.nl>
Date: Wed, 16 Dec 2020 13:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
Content-Language: en-US
X-CMAE-Envelope: MS4xfJgyj86ZrRhnHrdWpMYkRtKSgHuIG9ZJQL9FPiU59bZ8dfjDh2lvm4QvL2sxZx87QuMZ/bOcZKpEbSv0yvxuzPqglWEQTKAE9ep4ej9q0qcOcnuzX6lD
 lE3AQDxyXfxUJYALqXUKLx3h41oLKhfpvB6o1tx40lqPjVW9ggab/3XKhYOiLVilVevprSzRJLoqdngVfPiaExHcvJoH96eekblwRnx/lRnQwCmsNv2z48FV
 VIzkSyoE6kv2v4PRE1TfUoTp3LV3eLENVaNGGiW6uOmjr1WjyzPq/73AdMhfs6RD9rlCsgQ2FLLj/Ho6MLoiO89XNEXuXaVGL6Vr00ywlz7NzioR8OgfTv2H
 UBjTA+dgNVr2C/RgD7+Dso8OoMpSbjp9BbSEgmlAtITh7EbjdxdOXslJY9ehJSsBNuCh2SOc+jGG3HNJ8Cv2kcgWyH4q6EUY9o0S2JiT4aVDpRkV5ApKI/OX
 yLlQMKHI8XQdDfc59ZjhEhmg7VH91X4uBT+7tfMrKkEXj1A7Y5q999ae/Mu540vpN7QHeOb6PdiGwrqzjal5bTAZubTWPGDExaMLyk+8yMZxNwhNKot2/K81
 wpson4/OUKpeY9FShtvSTCcLv7levMRLe0sLF0RjUFQ21nY0rbmqDYBONKaP7RRz3PMtSDDFeDOg+nwGDIXj/3bi+nyC+zJdWW5yCIsMzu3g6yYzpzEp4WlH
 Zm1FBZjzUV35BSceFEGrsjmmlKjMPaVBcazOSN6gy4b7hyST1Ma7tsGX4I6BPPfst8kuK4S7ZuiBz6DSC54N8uTnGUxZ8u6b
X-Mailman-Approved-At: Thu, 17 Dec 2020 08:43:32 +0000
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
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 10/12/2020 14:46, Maxime Ripard wrote:
> Hi,
> 
> Here's a series introducing the CEC support for the BCM2711 found on the
> RaspberryPi4.
> 
> The BCM2711 HDMI controller uses a similar layout for the CEC registers, the
> main difference being that the interrupt handling part is now shared between
> both HDMI controllers.
> 
> This series is mainly about fixing a couple of bugs, reworking the driver to
> support having two different interrupts, one for each direction, provided by an
> external irqchip, and enables the irqchip driver for the controller we have.
> 
> This has been tested on an RPi3 and RPi4, but requires the latest firmware.
> It's is based on the 10 and 12 bpc series.

This series looks good to me. Before I give my Acked-by for this series, can you
confirm that it is possible to transmit the Image View On message on both outputs
of the RPi4 when the HPD is low?

See section "CEC Without HPD" in https://hverkuil.home.xs4all.nl/cec-status.txt
on how to test this with a Pulse-Eight device.

This should work.

Regards,

	Hans

> 
> Here is the cec-compliance output:
> 
> $ cec-ctl --tuner -p 1.0.0.0
> The CEC adapter doesn't allow setting the physical address manually, ignore this option.
> 
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : 1.0.0.0
> 	Logical Address Mask       : 0x0008
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Tuner
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 3 (Tuner 1)
> 	    Primary Device Type    : Tuner
> 	    Logical Address Type   : Tuner
> 	    All Device Types       : Tuner
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> $ cec-compliance
> cec-compliance SHA                 : not available
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : 1.0.0.0
> 	Logical Address Mask       : 0x0008
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Tuner
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 3 (Tuner 1)
> 	    Primary Device Type    : Tuner
> 	    Logical Address Type   : Tuner
> 	    All Device Types       : Tuner
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> Compliance test for vc4_hdmi device /dev/cec0:
> 
>     The test results mean the following:
>         OK                  Supported correctly by the device.
>         OK (Not Supported)  Not supported and not mandatory for the device.
>         OK (Presumed)       Presumably supported.  Manually check to confirm.
>         OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
>         OK (Refused)        Supported by the device, but was refused.
>         FAIL                Failed and was expected to be supported by this device.
> 
> Find remote devices:
> 	Polling: OK
> 
> Network topology:
> 	System Information for device 0 (TV) from device 3 (Tuner 1):
> 		CEC Version                : 2.0
> 		Physical Address           : 0.0.0.0
> 		Primary Device Type        : TV
> 		Vendor ID                  : 0x000c03 (HDMI)
> 		OSD Name                   : 'test-124'
> 		Power Status               : Tx, OK, Rx, OK, Feature Abort
> 
> Total for vc4_hdmi device /dev/cec0: 1, Succeeded: 1, Failed: 0, Warnings: 0
> 
> Let me know what you think,
> Maxime
> 
> Dom Cobley (5):
>   drm/vc4: hdmi: Move hdmi reset to bind
>   drm/vc4: hdmi: Fix register offset with longer CEC messages
>   drm/vc4: hdmi: Fix up CEC registers
>   drm/vc4: hdmi: Restore cec physical address on reconnect
>   drm/vc4: hdmi: Remove cec_available flag
> 
> Maxime Ripard (10):
>   irqchip: Allow to compile bcmstb on other platforms
>   drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
>   drm/vc4: hdmi: Update the CEC clock divider on HSM rate change
>   drm/vc4: hdmi: Introduce a CEC clock
>   drm/vc4: hdmi: Split the interrupt handlers
>   drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
>   drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts
>   dt-binding: display: bcm2711-hdmi: Add CEC and hotplug interrupts
>   ARM: dts: bcm2711: Add the BSC interrupt controller
>   ARM: dts: bcm2711: Add the CEC interrupt controller
> 
>  .../bindings/display/brcm,bcm2711-hdmi.yaml   |  20 +-
>  arch/arm/boot/dts/bcm2711.dtsi                |  30 +++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                | 224 +++++++++++++-----
>  drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-
>  drivers/irqchip/Kconfig                       |   2 +-
>  6 files changed, 232 insertions(+), 59 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
