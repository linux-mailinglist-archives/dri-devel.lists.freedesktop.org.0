Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE7288C757
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0010E359;
	Tue, 26 Mar 2024 15:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GfAxhXAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD4310E359
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:39:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B1B08CE1B86;
 Tue, 26 Mar 2024 15:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AED0C433C7;
 Tue, 26 Mar 2024 15:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711467573;
 bh=QM9scf4YeVv1B0PTlmFeoNK0slLx4CfaV119dLz2wHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfAxhXAbMUApmOiyq/UeGdj5vIevwyYpM/P5riJ7xF9GqYMKDdTHF5HNk1PTVDYPh
 ipROtl+1fPO9mzkESKCLZSnMvOQb3AjoOcCyHuj8OuAYsySUCQDT/8ebUPoS0x2ck4
 M7JsfLn7qVEGtoeUGHlmjfEHgrCy7Rdw/ISV303xM/ENMn59QEXz93TNwavRcqzCCS
 V7zzJ4XcGu0f8Y8m7DchGQbdgPSecDrjiboVb3IzquSYm0u3b7mWRsOn5y4F5+4IR/
 GHbBTgs58b5qm8LteE4mXTM/2AOfS0Xqek5GEvpQu2ig8gL2VtcbIl9axckvN+9Fel
 a7f3IgvyvXhHA==
Date: Tue, 26 Mar 2024 16:39:27 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, 
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, 
 linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Gregor Riepl <onitake@gmail.com>
Subject: Re: In kernel virtual HID devices (was Future handling of complex
 RGB devices on Linux v3)
Message-ID: <vjd5xqgd2gsyz4ubgk6eusuyqdtxpdw6vogc5u537x2a245xcj@m2twppbxea4p>
References: <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
 <fcf4dd53-f461-4c2e-8fbe-50b50e4e6797@redhat.com>
 <65b24776-ae1a-4290-a1d5-c7637ad0accc@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65b24776-ae1a-4290-a1d5-c7637ad0accc@tuxedocomputers.com>
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

On Mar 26 2024, Werner Sembach wrote:
> Hi all,
> 
> Am 25.03.24 um 19:30 schrieb Hans de Goede:
> 
> [snip]
> > > > If the kernel already handles the custom protocol into generic HID, the
> > > > work for userspace is not too hard because they can deal with a known
> > > > protocol and can be cross-platform in their implementation.
> > > > 
> > > > I'm mentioning that cross-platform because SDL used to rely on the
> > > > input, LEDs, and other Linux peculiarities and eventually fell back on
> > > > using hidraw only because it's way more easier that way.
> > > > 
> > > > The other advantage of LampArray is that according to Microsoft's
> > > > document, new devices are going to support it out of the box, so they'll
> > > > be supported out of the box directly.
> > > > 
> > > > Most of the time my stance is "do not add new kernel API, you'll regret
> > > > it later". So in that case, given that we have a formally approved
> > > > standard, I would suggest to use it, and consider it your API.
> > > The only new UAPI would be the use_leds_uapi switch to turn on/off the backwards compatibility.

I have my reserves with such a kill switch (see below).

> > Actually we don't even need that. Typically there is a single HID
> > driver handling both keys and the backlight, so userspace cannot
> > just unbind the HID driver since then the keys stop working.

I don't think Werner meant unbinding the HID driver, just a toggle to
enable/disable the basic HID core processing of LampArray.

> > 
> > But with a virtual LampArray HID device the only functionality
> > for an in kernel HID driver would be to export a basic keyboard
> > backlight control interface for simple non per key backlight control
> > to integrate nicely with e.g. GNOME's backlight control.
> 
> Don't forget that in the future there will be devices that natively support
> LampArray in their firmware, so for them it is the same device.

Yeah, the generic LampArray support will not be able to differentiate
"emulated" devices from native ones.

> 
> Regards,
> 
> Werner
> 
> > And then when OpenRGB wants to take over it can just unbind the HID
> > driver from the HID device using existing mechanisms for that.

Again no, it'll be too unpredicted.

> > 
> > Hmm, I wonder if that will not also kill hidraw support though ...
> > I guess getting hidraw support back might require then also manually
> > binding the default HID input driver.  Bentiss any input on this?

To be able to talk over hidraw you need a driver to be bound, yes. But I
had the impression that LampArray would be supported by default in
hid-input.c, thus making this hard to remove. Having a separate driver
will work, but as soon as the LampArray device will also export a
multitouch touchpad, we are screwed and will have to make a choice
between LampArray and touch...

> > 
> > Background info: as discussed earlier in the thread Werner would like
> > to have a basic driver registering a /sys/class/leds/foo::kbd_backlight/
> > device, since those are automatically supported by GNOME (and others)
> > and will give basic kbd backlight brightness control in the desktop
> > environment. This could be a simple HID driver for
> > the hid_allocate_device()-ed virtual HID device, but userspace needs
> > to be able to move that out of the way when it wants to take over
> > full control of the per key lighting.

Do we really need to entirely unregister the led class device? Can't we
snoop on the commands and get some "mean value"?

> > 
> > Regards,
> > 
> > Hans
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > > The control flow for the whole system would look something like this:
> > > 
> > > - System boots
> > > 
> > >      - Kernel driver initializes keyboard (maybe stops rainbowpuke boot effects, sets brightness to a default value, or initializes a solid color)
> > > 
> > >      - systemd-backlight restores last keyboard backlight brightness
> > > 
> > >      - UPower sees sysfs leds entry and exposes it to DBus for DEs to do keyboard brightness handling
> > > 
> > > - If the user wants more control they (auto-)start OpenRGB
> > > 
> > >      - OpenRGB disables sysfs leds entry via use_leds_uapi to prevent double control of the same device by UPower
> > > 
> > >      - OpenRGB directly interacts with hidraw device via LampArray API to give fine granular control of the backlight
> > > 
> > >      - When OpenRGB closes it should reenable the sysfs leds entry

That's where your plan falls short: if OpenRGB crashes, or is killed it
will not reset that bit.

Next question: is OpenRGB supposed to keep the hidraw node opened all
the time or not?

If it has to keep it open, we should be able to come up with a somewhat
similar hack that we have with hid-steam: when the hidraw node is
opened, we disable the kernel processing of LampArray. When the node is
closed, we re-enable it.

But that also means we have to distinguish steam/SDL from OpenRGB...

I just carefully read the LampArray spec. And it's simpler than what
I expected. But the thing that caught my attention was that it's
mentioned that there is no way for the host to query the current
color/illumination of the LEDs when the mode is set to
AutonomousMode=false. Which means that the kernel should be able to
snoop into any commands sent from OpenRGB to the device, compute a mean
value and update its internal state.

Basically all we need is the "toggle" to put the led class in read-only
mode while OpenRGB kicks in. Maybe given that we are about to snoop on
the commands sent, we can detect that there is a LampArray command
emitted, attach this information to the struct file * in hidraw, and
then re-enable rw when that user closes the hidraw node.

Cheers,
Benjamin

> > > 
> > > - System shutdown
> > > 
> > >      - Since OpenRGB reenables the sysfs leds entry, systemd-backlight can correctly store a brightness value for next boot
> > > 
> > > Regards,
> > > 
> > > Werner
> > > 
> > > > Side note to self: I really need to resurrect the hidraw revoke series
> > > > so we could export those hidraw node to userspace with uaccess through
> > > > logind...
> > > > 
> > > > Cheers,
> > > > Benjamin
