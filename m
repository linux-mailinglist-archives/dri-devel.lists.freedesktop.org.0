Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0F30711C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96D6E932;
	Thu, 28 Jan 2021 08:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net
 [194.109.24.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0CA6E843
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 15:28:56 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id 4mkMlGHncvfIs4mkPlw20B; Wed, 27 Jan 2021 16:28:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1611761334; bh=ZAtN72BZA7Pf8Etxi3h2l4UcGQo1GFp5caZTulKRKI8=;
 h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=weef3i1tNasQLhGQshp8TLBDiyEsiAUIzgkSlFYVMM35Amv+0HXTHXaGpGjGD/LDA
 zfUlCoWRxyoWMSKh5vppd+OWY9PlZfD+rI4TIkSqsQBbHwREl+KXl5uri4V6Fc/KAG
 fxp2WdjDl3Ixr0w3JQcxs0ThaO2735wKBoVO46DpOROwWTWIacq2rKj15gQ1NaqaUk
 FuJlUV/UrlOiqAU882wNdeBiIxnyyBFVGAnnX5752CMA80grwFOE7Vl2Kph2M/Agfy
 mutFWxXeBxo/HqhLzU7UEcrlnyr8Sf0asj3kU4moA4ve0sB+pEJGNhYFiLpjOQuYqF
 YM44S2NA5HXWQ==
Subject: Re: [PATCH v2 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <5dda3c71-5faf-683b-c25a-37aa1849fb62@xs4all.nl>
 <c3cf85b8-7645-73ff-322a-dd95a1f02030@xs4all.nl>
Message-ID: <e5af848c-6fb8-0423-5499-a8d33329209f@xs4all.nl>
Date: Wed, 27 Jan 2021 16:28:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c3cf85b8-7645-73ff-322a-dd95a1f02030@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4xfP/LrTvKWGX4dKlbU6z4crOyfPuIrbGEym3+jTFh8XfQPH1rC4WiMaaOII3HkWxfaTq4w3bVefbXRY0iK1wSWLfUsRAic/r7zpw4vaiU1cL2dfpI2HEF
 33+QD1YJYhgWxkQ6V6/r5f0ktkhr48NhBp0kZ0K0pA337yc0ty3fGWqQX3CeJrVkXlsH2FKPjIcHsspRFJMkXGRle2Ov/4kl0WcPyvGHCVQ4aocekGnuVYsE
 kaKDfmD3PpYkPde2NCIRB7N1Ung4OKRNnzs2McvFhIliXBYJfTMGgiGCSFOXWRUPEjvSE1M+OZQTN9wrGZuqqexPVuOJo7qUJo50gku5R3nLux8V0OgOPjSX
 aH7LVFycSkYKzXANZ2KD0d3cdyjY+8DrEIpabV8PeP8yA96a2j4VlniMKpgSZrDXEHfgw0Sx7FyFQ74ZDKLmAfflCCimkwpgUeTyB2zoCVcQUgNEnO2mvZoA
 jG0Eb3Gt7rRagZOh3pFhvz7KXus/GtRPoSHWRKCT4cKvSX6XKudnr4m5WfaA8wVqqNHApAqsusWP9R6wcaaclztql139UQUFJO7UmKLL9sFoqiO7pK+oMCZl
 74rHHc/SYgmik3pku51HxMLWxp90jDbo5dBzg+uLYpcGUBIBPyGDWOs650NoL7/G9u8C79g9q0H+/FpTfqDO/OqmVV9fYQa/I+f7H/I3EV5mXIlUX0g2Mfc0
 twJDrRCOqyI=
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2021 14:55, Hans Verkuil wrote:
> On 12/01/2021 16:24, Hans Verkuil wrote:
>> Hi Maxime,
>>
>> On 11/01/2021 15:22, Maxime Ripard wrote:
>>> Hi,
>>>
>>> Here's a series introducing the CEC support for the BCM2711 found on the
>>> RaspberryPi4.
>>>
>>> The BCM2711 HDMI controller uses a similar layout for the CEC registers, the
>>> main difference being that the interrupt handling part is now shared between
>>> both HDMI controllers.
>>>
>>> This series is mainly about fixing a couple of bugs, reworking the driver to
>>> support having two different interrupts, one for each direction, provided by an
>>> external irqchip, and enables the irqchip driver for the controller we have.
>>>
>>> This has been tested on an RPi3 and RPi4, but requires the latest firmware.
>>> It's is based on the 10 and 12 bpc series.
>>
>> Thank you for this series, I plan to test this later this week.
> 
> Testing is delayed: my microHDMI to HDMI adapter has problems with the CEC pin
> (possibly not connected at all). I've ordered adapter cables (hopefully of better
> quality), but those haven't arrived yet. I expect them later this week.

After testing this you can add my:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

for the patches in this series.

Thank you for working on this!

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Here is the cec-compliance output:
>>>
>>> pi@raspberrypi:~$ cec-ctl --tuner -p 1.0.0.0
>>> The CEC adapter doesn't allow setting the physical address manually, ignore this option.
>>>
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : 1.0.0.0
>>> 	Logical Address Mask       : 0x0008
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Tuner
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : 3 (Tuner 1)
>>> 	    Primary Device Type    : Tuner
>>> 	    Logical Address Type   : Tuner
>>> 	    All Device Types       : Tuner
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> pi@raspberrypi:~$ cec-compliance
>>> cec-compliance SHA                 : not available
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : 1.0.0.0
>>> 	Logical Address Mask       : 0x0008
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Tuner
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : 3 (Tuner 1)
>>> 	    Primary Device Type    : Tuner
>>> 	    Logical Address Type   : Tuner
>>> 	    All Device Types       : Tuner
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> Compliance test for device /dev/cec0:
>>>
>>>     The test results mean the following:
>>>         OK                  Supported correctly by the device.
>>>         OK (Not Supported)  Not supported and not mandatory for the device.
>>>         OK (Presumed)       Presumably supported.  Manually check to confirm.
>>>         OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
>>>         OK (Refused)        Supported by the device, but was refused.
>>>         FAIL                Failed and was expected to be supported by this device.
>>>
>>> Find remote devices:
>>> 	Polling: OK
>>>
>>> Network topology:
>>> 	System Information for device 0 (TV) from device 3 (Tuner 1):
>>> 		CEC Version                : 2.0
>>> 		Physical Address           : 0.0.0.0
>>> 		Primary Device Type        : TV
>>> 		Vendor ID                  : 0x000c03
>>> 		OSD Name                   : 'TV  '
>>> 		Power Status               : Tx, OK, Rx, OK, Feature Abort
>>>
>>> Total: 1, Succeeded: 1, Failed: 0, Warnings: 0
>>>
>>> pi@raspberrypi:~$ cec-ctl -d1 --tuner -p 1.0.0.0
>>> The CEC adapter doesn't allow setting the physical address manually, ignore this option.
>>>
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : 1.0.0.0
>>> 	Logical Address Mask       : 0x0008
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Tuner
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : 3 (Tuner 1)
>>> 	    Primary Device Type    : Tuner
>>> 	    Logical Address Type   : Tuner
>>> 	    All Device Types       : Tuner
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> pi@raspberrypi:~$ cec-compliance -d1
>>> cec-compliance SHA                 : not available
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : 1.0.0.0
>>> 	Logical Address Mask       : 0x0008
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Tuner
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : 3 (Tuner 1)
>>> 	    Primary Device Type    : Tuner
>>> 	    Logical Address Type   : Tuner
>>> 	    All Device Types       : Tuner
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> Compliance test for device /dev/cec1:
>>>
>>>     The test results mean the following:
>>>         OK                  Supported correctly by the device.
>>>         OK (Not Supported)  Not supported and not mandatory for the device.
>>>         OK (Presumed)       Presumably supported.  Manually check to confirm.
>>>         OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
>>>         OK (Refused)        Supported by the device, but was refused.
>>>         FAIL                Failed and was expected to be supported by this device.
>>>
>>> Find remote devices:
>>> 	Polling: OK
>>>
>>> Network topology:
>>> 	System Information for device 0 (TV) from device 3 (Tuner 1):
>>> 		CEC Version                : 2.0
>>> 		Physical Address           : 0.0.0.0
>>> 		Primary Device Type        : TV
>>> 		Vendor ID                  : 0x000c03
>>> 		OSD Name                   : 'TV  '
>>> 		Power Status               : Tx, OK, Rx, OK, Feature Abort
>>>
>>> Total: 1, Succeeded: 1, Failed: 0, Warnings: 0
>>>
>>> And for the hotplug detect test:
>>>
>>> pi@raspberrypi:~$ cec-ctl --playback
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : f.f.f.f
>>> 	Logical Address Mask       : 0x0000
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Playback
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : Not Allocated
>>> 	    Primary Device Type    : Playback
>>> 	    Logical Address Type   : Playback
>>> 	    All Device Types       : Playback
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> pi@raspberrypi:~$ cec-ctl -t0 --image-view-on
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : f.f.f.f
>>> 	Logical Address Mask       : 0x0000
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Playback
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : Not Allocated
>>> 	    Primary Device Type    : Playback
>>> 	    Logical Address Type   : Playback
>>> 	    All Device Types       : Playback
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> Transmit from Unregistered to TV (15 to 0):
>>> CEC_MSG_IMAGE_VIEW_ON (0x04)
>>> 	Sequence: 1 Tx Timestamp: 9182.611s
>>> pi@raspberrypi:~$ cec-ctl -d1 --playback
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : f.f.f.f
>>> 	Logical Address Mask       : 0x0000
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Playback
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : Not Allocated
>>> 	    Primary Device Type    : Playback
>>> 	    Logical Address Type   : Playback
>>> 	    All Device Types       : Playback
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> pi@raspberrypi:~$ cec-ctl -d1 -t0 --image-view-on
>>> Driver Info:
>>> 	Driver Name                : vc4_hdmi
>>> 	Adapter Name               : vc4
>>> 	Capabilities               : 0x0000010e
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 	Driver version             : 5.10.0
>>> 	Available Logical Addresses: 1
>>> 	Physical Address           : f.f.f.f
>>> 	Logical Address Mask       : 0x0000
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : Playback
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : Not Allocated
>>> 	    Primary Device Type    : Playback
>>> 	    Logical Address Type   : Playback
>>> 	    All Device Types       : Playback
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> Transmit from Unregistered to TV (15 to 0):
>>> CEC_MSG_IMAGE_VIEW_ON (0x04)
>>> 	Sequence: 1 Tx Timestamp: 9207.191s
>>>
>>> With the pulse-eight side reporting:
>>>
>>> $ sudo cec-ctl -M
>>> Driver Info:
>>> 	Driver Name                : pulse8-cec
>>> 	Adapter Name               : serio0
>>> 	Capabilities               : 0x0000003f
>>> 		Physical Address
>>> 		Logical Addresses
>>> 		Transmit
>>> 		Passthrough
>>> 		Remote Control Support
>>> 		Monitor All
>>> 	Driver version             : 5.9.16
>>> 	Available Logical Addresses: 1
>>> 	Connector Info             : None
>>> 	Physical Address           : 0.0.0.0
>>> 	Logical Address Mask       : 0x0001
>>> 	CEC Version                : 2.0
>>> 	Vendor ID                  : 0x000c03 (HDMI)
>>> 	OSD Name                   : 'TV  '
>>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>>
>>> 	  Logical Address          : 0 (TV)
>>> 	    Primary Device Type    : TV
>>> 	    Logical Address Type   : TV
>>> 	    All Device Types       : TV
>>> 	    RC TV Profile          : None
>>> 	    Device Features        :
>>> 		None
>>>
>>> Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no
>>>
>>> Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
>>> Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
>>>
>>> Let me know what you think,
>>> Maxime
>>>
>>> Changes from v1:
>>>   - Removed the irqchip patch in favor of a select in mach-bcm
>>>   - Fixed HDMI1 interrupt numbers
>>>   - Removed redundant call to drm_connector_update_edid_property
>>>   - Fixed the condition in vc4_hdmi_connector_detect
>>>   - Added the tags
>>>   - Rebased on top of drm-misc-next-2021-01-06
>>>
>>> Dom Cobley (5):
>>>   drm/vc4: hdmi: Move hdmi reset to bind
>>>   drm/vc4: hdmi: Fix register offset with longer CEC messages
>>>   drm/vc4: hdmi: Fix up CEC registers
>>>   drm/vc4: hdmi: Restore cec physical address on reconnect
>>>   drm/vc4: hdmi: Remove cec_available flag
>>>
>>> Maxime Ripard (10):
>>>   ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
>>>   drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
>>>   drm/vc4: hdmi: Update the CEC clock divider on HSM rate change
>>>   drm/vc4: hdmi: Introduce a CEC clock
>>>   drm/vc4: hdmi: Split the interrupt handlers
>>>   drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
>>>   drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts
>>>   dt-binding: display: bcm2711-hdmi: Add CEC and hotplug interrupts
>>>   ARM: dts: bcm2711: Add the BSC interrupt controller
>>>   ARM: dts: bcm2711: Add the CEC interrupt controller
>>>
>>>  .../bindings/display/brcm,bcm2711-hdmi.yaml   |  20 +-
>>>  arch/arm/boot/dts/bcm2711.dtsi                |  30 +++
>>>  arch/arm/mach-bcm/Kconfig                     |   1 +
>>>  arch/arm64/Kconfig.platforms                  |   1 +
>>>  drivers/gpu/drm/vc4/vc4_hdmi.c                | 223 ++++++++++++++----
>>>  drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-
>>>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-
>>>  7 files changed, 234 insertions(+), 56 deletions(-)
>>>
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
