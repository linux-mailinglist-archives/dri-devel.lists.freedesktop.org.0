Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C3C2DDFC7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963D889BFD;
	Fri, 18 Dec 2020 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717F36E252
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:53:55 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id pqukkWOvhynrEpqunktAgK; Thu, 17 Dec 2020 11:53:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1608202432; bh=pqOm4Mt+OtXECc6KvRmlRk/K/jqE4ItBI7LIXf66kj8=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=T5Lxpfws1Po/qw43sUq17iXCqo7hDHcvrqRSrXhodEJnU/Vp8w+mCNb7Podev7eK5
 qpOx0GK7YsaenPAH6N8douDLtLfYuDGeWLq70vKpvKGIxRuNAkV6xewSlKzB56fbVj
 Z6hvj/dFZv26C/i4FZ3ftz8Jm43LNqajPL3BfqIfNrR7MR4pE67RLXQpbXmw+HVznR
 oltxiLynqM1rs84nF7rtmyYz2dAzWp5D1lW8sgxleyYBWbVf4OpMx8XOBA6IQGwTIJ
 ti3laM1bF38Lj5wNovuSZLWeQv/KGLyDwegMPoTmv7JIv2J9gE/czfOFzynY6sYapK
 AiMRkqvym9RJA==
Subject: Re: [PATCH 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
To: Maxime Ripard <maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
 <23bdb67a-fb55-42d4-9130-ade1b0396768@xs4all.nl>
 <20201217104946.srurfmuphqzz4c4w@gilmour>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cc3e0adf-ba44-7593-40ec-3d2c1efcba02@xs4all.nl>
Date: Thu, 17 Dec 2020 11:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201217104946.srurfmuphqzz4c4w@gilmour>
Content-Language: en-US
X-CMAE-Envelope: MS4xfIUSp/ZairFgVbf4QlE3fdEYEV4fqOe2zUw/3ZnPt+PbqHMIVjwML22PZ0ehEIxEiDRgCRbI3Z9gyPtotlm4L1ty3yDx8CNhHeyD9tz5xBcogunQEVZ3
 7QUVEXG1gfR60UqS9WtQEGxmI2phsxaXo+RB+/7k+yQLBqMSqKxkXQ+6rEm95z2svyJ0iWVc5tK+iZuR8fi7YJNowGE4qgAFi55M2fTPbBRZ0WOcVxM6WSEh
 ZfvFb9zijNpZ6OBk3kszh8GGnIVFA/L23YCqovIlf7JH1XcFFkKYuzBKOAnRB296vNsSaN7aUqtCEQ9Rxd/h+yeUFrYMrrGPkyBjDbWWmMC4CIQb72Kw0SCU
 6bWg5WLbh5Kg/7ODMxkovOz7R5pKKxgdtJl047mtovQzrvr3vrN4nIsq2j58hNgRkX+vgBVC9mUcCempJgOBx2NJ1IlS1Owt2uqfQzdywIn4fYlzSdR0BV8C
 trHzufCjZJ9O/Jx9pElVWZr5DQ/BzPZvAdccURVuowZYpNvAx9CMqRADo7l2pYnPaqrh1sM3pmNsunEqshyVQVBVw0XWkbDfw8aEGC9cBuLsdDj3kfn16EGs
 T4EyR3NLREx09a+okgCXAhivE9Mov15vJCRx0hgvmDsZK/UNuV+zsHfCXBKRxRH8nAj3nvbJVxSiAr3QfSQ//rOWaxCAJOYEpMIdOLmQLHqKZkm+kduZBU/d
 QcXpDmmCJmlgV8vIl+xFJ+d+Ksz5IHST1OkD6t1LejGvDhtu3ZN8mOcuRR7q4fOtvPhbAKeW5OEDYX6g+5XWL+jyPJ8sgfb6
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/12/2020 11:49, Maxime Ripard wrote:
> Hi Hans,
> 
> On Wed, Dec 16, 2020 at 01:35:43PM +0100, Hans Verkuil wrote:
>> Hi Maxime,
>>
>> On 10/12/2020 14:46, Maxime Ripard wrote:
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
>> This series looks good to me. Before I give my Acked-by for this series, can you
>> confirm that it is possible to transmit the Image View On message on both outputs
>> of the RPi4 when the HPD is low?
>>
>> See section "CEC Without HPD" in https://hverkuil.home.xs4all.nl/cec-status.txt
>> on how to test this with a Pulse-Eight device.
>>
>> This should work.
> 
> This is the output on the RPi4:
> 
> # cec-ctl --playback
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : f.f.f.f
> 	Logical Address Mask       : 0x0000
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Playback
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : Not Allocated
> 	    Primary Device Type    : Playback
> 	    Logical Address Type   : Playback
> 	    All Device Types       : Playback
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> # cec-ctl -t0 --image-view-on
> Driver Info:
> 	Driver Name                : vc4_hdmi
> 	Adapter Name               : vc4
> 	Capabilities               : 0x0000010e
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 	Driver version             : 5.10.0
> 	Available Logical Addresses: 1
> 	Physical Address           : f.f.f.f
> 	Logical Address Mask       : 0x0000
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : Playback
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : Not Allocated
> 	    Primary Device Type    : Playback
> 	    Logical Address Type   : Playback
> 	    All Device Types       : Playback
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> 
> Transmit from Unregistered to TV (15 to 0):
> CEC_MSG_IMAGE_VIEW_ON (0x04)
> 	Sequence: 1 Tx Timestamp: 77.631s
> 
> 
> And this is the output on my desktop with the Pulse-Eight:
> $ sudo cec-ctl -p0.0.0.0 --tv
> Driver Info:
> 	Driver Name                : pulse8-cec
> 	Adapter Name               : serio0
> 	Capabilities               : 0x0000003f
> 		Physical Address
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 		Remote Control Support
> 		Monitor All
> 	Driver version             : 5.9.8
> 	Available Logical Addresses: 1
> 	Connector Info             : None
> 	Physical Address           : 0.0.0.0
> 	Logical Address Mask       : 0x0001
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : 'TV  '
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 0 (TV)
> 	    Primary Device Type    : TV
> 	    Logical Address Type   : TV
> 	    All Device Types       : TV
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> $ sudo cec-ctl -M
> Driver Info:
> 	Driver Name                : pulse8-cec
> 	Adapter Name               : serio0
> 	Capabilities               : 0x0000003f
> 		Physical Address
> 		Logical Addresses
> 		Transmit
> 		Passthrough
> 		Remote Control Support
> 		Monitor All
> 	Driver version             : 5.9.8
> 	Available Logical Addresses: 1
> 	Connector Info             : None
> 	Physical Address           : 0.0.0.0
> 	Logical Address Mask       : 0x0001
> 	CEC Version                : 2.0
> 	Vendor ID                  : 0x000c03 (HDMI)
> 	OSD Name                   : 'TV  '
> 	Logical Addresses          : 1 (Allow RC Passthrough)
> 
> 	  Logical Address          : 0 (TV)
> 	    Primary Device Type    : TV
> 	    Logical Address Type   : TV
> 	    All Device Types       : TV
> 	    RC TV Profile          : None
> 	    Device Features        :
> 		None
> 
> 
> 
> Initial Event: State Change: PA: 0.0.0.0, LA mask: 0x0001, Conn Info: no
> Received from Unregistered to TV (15 to 0): IMAGE_VIEW_ON (0x04)
> 
> So it looks like it's working as expected?

Yes, it looks good. Make sure you test this for both outputs of the RPi4. If it
works for both, then you can add my

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

for this series.

Very nice work, thank you for doing this!

Regards,

	Hans

> 
> Maxime
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
