Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A752FB436
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EBA6E840;
	Tue, 19 Jan 2021 08:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C9189993
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 13:55:53 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 1V0SlJ1KtyutM1V0VlYzJl; Mon, 18 Jan 2021 14:55:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1610978151; bh=26ubSFGuz8Eb6TdErDaKmiTgA3uHsfX0sVVErjZBy1A=;
 h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=A8jkAEI1oSoZ7jE/HhdtwZbSSyxmgYn/0ROibOSOW/ttEzjV0rkZcsXSzhkrhaZMA
 vXrH68AsrDZBWTFdYgFZdLJIFcGi9T0JmoHrwDrx0gpEMuwDcntmeun/znWjZ1oW6F
 GNY5S9OBlk5aFJyIckLFjKJeXY8yf5b6m+LIYjyaaob/KwtuPMN0+kTYYe5K3icYL9
 BS6DQ65c3kLWhXi1tsoRwl0RcKqSa14kvx7/ILBMtE2v7K1EzQP7KtRh8adEECwUw9
 uh467pfD7anmjoAGjE0COB8VbuYK9NGEKRcWtDtZOhifJYI2zpdf98VmelBesKh6hr
 JvJY77ijxAdgA==
Subject: Re: [PATCH v2 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <5dda3c71-5faf-683b-c25a-37aa1849fb62@xs4all.nl>
Message-ID: <c3cf85b8-7645-73ff-322a-dd95a1f02030@xs4all.nl>
Date: Mon, 18 Jan 2021 14:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5dda3c71-5faf-683b-c25a-37aa1849fb62@xs4all.nl>
Content-Language: en-US
X-CMAE-Envelope: MS4xfNLJm4vGH3BZcGCmdZ50BQ1wDuWJdgEZIlBgnfwTHC6RS+Jhb2fZiTBB2R713UiGw95T/yPnedxBnpiz+i7CnWKDT59kFniUaT64KVPMuWI7JZ8p2etT
 jVGybg9PX0uqLxgPD4vHhpp1AS1Xp1VJuaFcOXLn1/zPFwvHkmsvYJBHrZZogBzDFTaDXtOvNFWtRGs2EDd0XeYB/vzmgq7y2BvpeEV0TgyV0zFksD2JjeSH
 YDPHxlOw3jz+m1YY4BcLI8WNOOMF6jTZDQbyxIKJ0k8+yveQhKWtUgANZcMbOX257NjfVlkKIi8nZLaI2K16aOeToH8hkyzjBCYBs6OQYWWX6FaAlkGokLoa
 E9KN3sLFTqqPSM9/fHIfhn5s+H6pOiZ/QWzGcKBcrG3p0s/lCIP0mKh+Dzjse43WzEcEE9NKyzpPUz2rU4RE7xTic7bYRotNsjjggFfxG9NU+3sw6mSLZ+96
 WwcPTtnunicYgMqDw49ZKAFUGe8LGQFkvhAYRbYEJDCcgsqNRvvEbW6b4MxU6VClOT79TFtPLnKO1aPgGG61tE5YkXsDYS/o4quXD07PtfnX4TZAcXvNMWIl
 qJKVlrwDT1nUWhXAwAxxMamOv+m+LLW0cinC1HylBE42S4zsFz58xEE9Ef+V8ecvroUsj/FJh7BORcCnye9iMgrXCclqyhjauXqsRIPTSfLYS/9qiSIE63/T
 ItZI1DHfS7k=
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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

On 12/01/2021 16:24, Hans Verkuil wrote:
> Hi Maxime,
> 
> On 11/01/2021 15:22, Maxime Ripard wrote:
>> Hi,
>>
>> Here's a series introducing the CEC support for the BCM2711 found on the
>> RaspberryPi4.
>>
>> The BCM2711 HDMI controller uses a similar layout for the CEC registers, the
>> main difference being that the interrupt handling part is now shared between
>> both HDMI controllers.
>>
>> This series is mainly about fixing a couple of bugs, reworking the driver to
>> support having two different interrupts, one for each direction, provided by an
>> external irqchip, and enables the irqchip driver for the controller we have.
>>
>> This has been tested on an RPi3 and RPi4, but requires the latest firmware.
>> It's is based on the 10 and 12 bpc series.
> 
> Thank you for this series, I plan to test this later this week.

Testing is delayed: my microHDMI to HDMI adapter has problems with the CEC pin
(possibly not connected at all). I've ordered adapter cables (hopefully of better
quality), but those haven't arrived yet. I expect them later this week.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Here is the cec-compliance output:
>>
>> pi@raspberrypi:~$ cec-ctl --tuner -p 1.0.0.0
>> The CEC adapter doesn't allow setting the physical address manually, ignore this option.
>>
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : 1.0.0.0
>> 	Logical Address Mask       : 0x0008
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Tuner
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : 3 (Tuner 1)
>> 	    Primary Device Type    : Tuner
>> 	    Logical Address Type   : Tuner
>> 	    All Device Types       : Tuner
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> pi@raspberrypi:~$ cec-compliance
>> cec-compliance SHA                 : not available
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : 1.0.0.0
>> 	Logical Address Mask       : 0x0008
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Tuner
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : 3 (Tuner 1)
>> 	    Primary Device Type    : Tuner
>> 	    Logical Address Type   : Tuner
>> 	    All Device Types       : Tuner
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> Compliance test for device /dev/cec0:
>>
>>     The test results mean the following:
>>         OK                  Supported correctly by the device.
>>         OK (Not Supported)  Not supported and not mandatory for the device.
>>         OK (Presumed)       Presumably supported.  Manually check to confirm.
>>         OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
>>         OK (Refused)        Supported by the device, but was refused.
>>         FAIL                Failed and was expected to be supported by this device.
>>
>> Find remote devices:
>> 	Polling: OK
>>
>> Network topology:
>> 	System Information for device 0 (TV) from device 3 (Tuner 1):
>> 		CEC Version                : 2.0
>> 		Physical Address           : 0.0.0.0
>> 		Primary Device Type        : TV
>> 		Vendor ID                  : 0x000c03
>> 		OSD Name                   : 'TV  '
>> 		Power Status               : Tx, OK, Rx, OK, Feature Abort
>>
>> Total: 1, Succeeded: 1, Failed: 0, Warnings: 0
>>
>> pi@raspberrypi:~$ cec-ctl -d1 --tuner -p 1.0.0.0
>> The CEC adapter doesn't allow setting the physical address manually, ignore this option.
>>
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : 1.0.0.0
>> 	Logical Address Mask       : 0x0008
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Tuner
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : 3 (Tuner 1)
>> 	    Primary Device Type    : Tuner
>> 	    Logical Address Type   : Tuner
>> 	    All Device Types       : Tuner
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> pi@raspberrypi:~$ cec-compliance -d1
>> cec-compliance SHA                 : not available
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : 1.0.0.0
>> 	Logical Address Mask       : 0x0008
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Tuner
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : 3 (Tuner 1)
>> 	    Primary Device Type    : Tuner
>> 	    Logical Address Type   : Tuner
>> 	    All Device Types       : Tuner
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> Compliance test for device /dev/cec1:
>>
>>     The test results mean the following:
>>         OK                  Supported correctly by the device.
>>         OK (Not Supported)  Not supported and not mandatory for the device.
>>         OK (Presumed)       Presumably supported.  Manually check to confirm.
>>         OK (Unexpected)     Supported correctly but is not expected to be supported for this device.
>>         OK (Refused)        Supported by the device, but was refused.
>>         FAIL                Failed and was expected to be supported by this device.
>>
>> Find remote devices:
>> 	Polling: OK
>>
>> Network topology:
>> 	System Information for device 0 (TV) from device 3 (Tuner 1):
>> 		CEC Version                : 2.0
>> 		Physical Address           : 0.0.0.0
>> 		Primary Device Type        : TV
>> 		Vendor ID                  : 0x000c03
>> 		OSD Name                   : 'TV  '
>> 		Power Status               : Tx, OK, Rx, OK, Feature Abort
>>
>> Total: 1, Succeeded: 1, Failed: 0, Warnings: 0
>>
>> And for the hotplug detect test:
>>
>> pi@raspberrypi:~$ cec-ctl --playback
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : f.f.f.f
>> 	Logical Address Mask       : 0x0000
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Playback
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : Not Allocated
>> 	    Primary Device Type    : Playback
>> 	    Logical Address Type   : Playback
>> 	    All Device Types       : Playback
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> pi@raspberrypi:~$ cec-ctl -t0 --image-view-on
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : f.f.f.f
>> 	Logical Address Mask       : 0x0000
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Playback
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : Not Allocated
>> 	    Primary Device Type    : Playback
>> 	    Logical Address Type   : Playback
>> 	    All Device Types       : Playback
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> Transmit from Unregistered to TV (15 to 0):
>> CEC_MSG_IMAGE_VIEW_ON (0x04)
>> 	Sequence: 1 Tx Timestamp: 9182.611s
>> pi@raspberrypi:~$ cec-ctl -d1 --playback
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : f.f.f.f
>> 	Logical Address Mask       : 0x0000
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Playback
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : Not Allocated
>> 	    Primary Device Type    : Playback
>> 	    Logical Address Type   : Playback
>> 	    All Device Types       : Playback
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> pi@raspberrypi:~$ cec-ctl -d1 -t0 --image-view-on
>> Driver Info:
>> 	Driver Name                : vc4_hdmi
>> 	Adapter Name               : vc4
>> 	Capabilities               : 0x0000010e
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 	Driver version             : 5.10.0
>> 	Available Logical Addresses: 1
>> 	Physical Address           : f.f.f.f
>> 	Logical Address Mask       : 0x0000
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : Playback
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : Not Allocated
>> 	    Primary Device Type    : Playback
>> 	    Logical Address Type   : Playback
>> 	    All Device Types       : Playback
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> Transmit from Unregistered to TV (15 to 0):
>> CEC_MSG_IMAGE_VIEW_ON (0x04)
>> 	Sequence: 1 Tx Timestamp: 9207.191s
>>
>> With the pulse-eight side reporting:
>>
>> $ sudo cec-ctl -M
>> Driver Info:
>> 	Driver Name                : pulse8-cec
>> 	Adapter Name               : serio0
>> 	Capabilities               : 0x0000003f
>> 		Physical Address
>> 		Logical Addresses
>> 		Transmit
>> 		Passthrough
>> 		Remote Control Support
>> 		Monitor All
>> 	Driver version             : 5.9.16
>> 	Available Logical Addresses: 1
>> 	Connector Info             : None
>> 	Physical Address           : 0.0.0.0
>> 	Logical Address Mask       : 0x0001
>> 	CEC Version                : 2.0
>> 	Vendor ID                  : 0x000c03 (HDMI)
>> 	OSD Name                   : 'TV  '
>> 	Logical Addresses          : 1 (Allow RC Passthrough)
>>
>> 	  Logical Address          : 0 (TV)
>> 	    Primary Device Type    : TV
>> 	    Logical Address Type   : TV
>> 	    All Device Types       : TV
>> 	    RC TV Profile          : None
>> 	    Device Features        :
>> 		None
>>
>> Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no
>>
>> Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
>> Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
>>
>> Let me know what you think,
>> Maxime
>>
>> Changes from v1:
>>   - Removed the irqchip patch in favor of a select in mach-bcm
>>   - Fixed HDMI1 interrupt numbers
>>   - Removed redundant call to drm_connector_update_edid_property
>>   - Fixed the condition in vc4_hdmi_connector_detect
>>   - Added the tags
>>   - Rebased on top of drm-misc-next-2021-01-06
>>
>> Dom Cobley (5):
>>   drm/vc4: hdmi: Move hdmi reset to bind
>>   drm/vc4: hdmi: Fix register offset with longer CEC messages
>>   drm/vc4: hdmi: Fix up CEC registers
>>   drm/vc4: hdmi: Restore cec physical address on reconnect
>>   drm/vc4: hdmi: Remove cec_available flag
>>
>> Maxime Ripard (10):
>>   ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
>>   drm/vc4: hdmi: Compute the CEC clock divider from the clock rate
>>   drm/vc4: hdmi: Update the CEC clock divider on HSM rate change
>>   drm/vc4: hdmi: Introduce a CEC clock
>>   drm/vc4: hdmi: Split the interrupt handlers
>>   drm/vc4: hdmi: Support BCM2711 CEC interrupt setup
>>   drm/vc4: hdmi: Don't register the CEC adapter if there's no interrupts
>>   dt-binding: display: bcm2711-hdmi: Add CEC and hotplug interrupts
>>   ARM: dts: bcm2711: Add the BSC interrupt controller
>>   ARM: dts: bcm2711: Add the CEC interrupt controller
>>
>>  .../bindings/display/brcm,bcm2711-hdmi.yaml   |  20 +-
>>  arch/arm/boot/dts/bcm2711.dtsi                |  30 +++
>>  arch/arm/mach-bcm/Kconfig                     |   1 +
>>  arch/arm64/Kconfig.platforms                  |   1 +
>>  drivers/gpu/drm/vc4/vc4_hdmi.c                | 223 ++++++++++++++----
>>  drivers/gpu/drm/vc4/vc4_hdmi.h                |  11 +-
>>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   4 +-
>>  7 files changed, 234 insertions(+), 56 deletions(-)
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
