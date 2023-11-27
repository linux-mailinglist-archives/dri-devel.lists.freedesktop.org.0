Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D89067F9E08
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B1010E19A;
	Mon, 27 Nov 2023 10:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCBA10E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 10:59:53 +0000 (UTC)
Received: from [192.168.42.20] (p5b164862.dip0.t-ipconnect.de [91.22.72.98])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 87C812FC0048;
 Mon, 27 Nov 2023 11:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1701082792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbU2k/kMmm5ocGXjEMeXuk5Iu3qkqA+oEUDAkRMSimM=;
 b=OAUKknIa2UDNliD87gXDT6W74PHafjt8zUK/lu6NMT30uriZOF8aVJAWTLI3lyQgt+ec9e
 rTkrJoVuy0dKiLck4tJAe8COvY9PcSh1pDBI8KPZnuRKrmnmrtsNRbCQiNY8gDqKaqeYbL
 y0b+TPtX0SDSMpmj7mGgZkE3RuaTunY=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
Date: Mon, 27 Nov 2023 11:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

Am 22.11.23 um 19:34 schrieb Hans de Goede:
> Hi Werner,
[snip]
>>>> Another idea I want to throw in the mix:
>>>>
>>>> Maybe the kernel is not the right place to implement this at all. RGB stuff is not at all standardized and every vendor is doing completely different interfaces, which does not fit the kernel userpsace apis desire to be uniformal and fixed. e.g. Auxdisplay might fit static setting of RGB values, but it does not fit the snake-effect mode, or the raindrops mode, or the 4-different-colors-in-the-edges-breathing-and-color-cycling mode.
>>>>
>>>> So my current idea: Implement these keyboards as a single zone RGB kbd_backlight in the leds interface to have something functional out of the box, but make it runtime disable-able if something like https://gitlab.com/CalcProgrammer1/OpenRGB wants to take over more fine granular control from userspace via hidraw.
>>> That sounds like a good approach to me. We are seeing the same with game controllers where steam and wine/proton also sometimes use hidraw mode to get access to all the crazy^W interesting features.
>>>
>>> That would mean that all we need to standardize and the kernel <-> userspace API level is adding a standard way to disable the single zone RGB kbd_backlight support in the kernel.
>> I would suggest a simple "enable" entry. Default is 1. When set to 0 the kernel driver no longer does anything.
> I'm not in favor of using "enable" as sysfs attribute for this,
> I would like to see a more descriptive name, how about:
>
> "disable_kernel_kbd_backlight_support"
>
> And then maybe also have the driver actually unregister
> the LED class device ?
>
> Or just make the support inactive when writing 1 to
> this and allow re-enabling it by writing 0?

Unregistering would mean that it can't be reenabled without module reload/reboot?

I would prefer that the userspace driver could easily give back control to the 
leds interface.

>
>> Questions:
>>
>> - Should the driver try to reset the settings to boot default? Or just leave the device in the current state? With the former I could see issues that they keyboard is flashing when changing from kernelspace control to userspace control. With the later the burden on bringing the device to a know state lies with the userspace driver.
> My vote would go to leave the state as is. Even if the hw
> does not support state readback, then the userspace code
> can readback the state before writing 1 to
> "disable_kernel_kbd_backlight_support"
ack
>
>> - Should this be a optional entry that only shows up on drivers supporting it, or could this implemented in a generic way affecting all current led entries?
> IMHO this should be optional. If we go with the variant
> where writing 1 to "disable_kernel_kbd_backlight_support"
> just disables support and 0 re-enables it then I guess
> we could have support for this in the LED-core, enabled
> by a flag set by the driver.
>
> If we go with unregistering the led class device,
> then this needs to be mostly handled in the driver.
>
> Either way the kernel driver should know about this even
> if it is mostly handled in the LED core so that e.g.
> it does not try to restore settings on resume from suspend.

So a generic implementation would still require all current led drivers to be 
touched?

For the sake of simplicity I would then prefer the optional variant.

>
>> - I guess UPower integration for the userspace driver could be archived with https://www.kernel.org/doc/html/latest/leds/uleds.html however this limited to brightness atm, so when accent colors actually come to UPower this would also need some expansion to be able to pass a preferred color to the userspace driver (regardless of what that driver is then doing with that information).
> Using uleds is an interesting suggestion, but upower atm
> does not support LED class kbd_backlight devices getting
> hot-plugged. It only scans for them once at boot.
>
> Jelle van der Waa (a colleague of mine, added to the Cc)
> has indicated he is interested in maybe working on fixing
> this upower short-coming as a side project, once his
> current side-projects are finished.
Nice to hear.
>
>> On a different note: This approach does currently not cover the older EC controlled 3 zone keyboards from clevo. Here only the kernel has access access to the device so the kernel driver has to expose all functionality somehow. Should this be done by an arbitrarily designed platform device?
> Interesting question, this reminds there was a discussion
> about how to handle zoned keyboards using plain LED class
> APIs here:
>
> https://lore.kernel.org/linux-leds/544484b9-c0ac-2fd0-1f41-8fa94cb94d4b@redhat.com/
>
> Basically the idea discussed there is to create
> separate multi-color LED sysfs devices for each zone,
> using :rgb:kbd_zoned_backlight-xxx as postfix, e.g. :
>
>   :rgb:kbd_zoned_backlight-left
>   :rgb:kbd_zoned_backlight-middle
>   :rgb:kbd_zoned_backlight-right
>   :rgb:kbd_zoned_backlight-wasd
>
> As postfixes for the 4 per zone LED class devices
> and then teach upower to just treat this as
> a single kbd-backlight for the existing upower
> DBUS API and maybe later extend the DBUS API.
>
> Would something like this work for the Clevo
> case you are describing?

Not entirely as some concept for the special modes would still be required.

Also it would be nice to be able to set the whole keyboard with a singular file 
access so that the keyboard changes at once and not zone by zone.

>
> Unfortunately this was never implemented but
> I think that for simple zoned backlighting
> this still makes sense. Where as for per key
> controllable backlighting as mention in
> $subject I do believe that just using hidraw
> access directly from userspace is best.
>
> Regards,
>
> Hans
I also stumbled across a new Problem:

We have an upcoming device that has a per-key keyboard backlight, but does the 
control completely via a wmi/acpi interface. So no usable hidraw here for a 
potential userspace driver implementation ...

So a quick summary for the ideas floating in this thread so far:

1. Expand leds interface allowing arbitrary modes with semi arbitrary optional 
attributes:

     - Pro:

         - Still offers all default attributes for use with UPower

         - Fairly simple to implement from the preexisting codebase

         - Could be implemented for all (to me) known internal keyboard backlights

     - Con:

         - Violates the simplicity paradigm of the leds interface (e.g. with 
this one leds entry controls possible multiple leds)

2. Implement per-key keyboards as auxdisplay

     - Pro:

         - Already has a concept for led positions

         - Is conceptually closer to "multiple leds forming a singular entity"

     - Con:

         - No preexisting UPower support

         - No concept for special hardware lightning modes

         - No support for arbitrary led outlines yet (e.g. ISO style enter-key)

3. Implement in input subsystem

     - Pro:

         - Preexisting concept for keys and key purpose

     - Con:

         - Not in scope for subsystem

         - No other preexisting light infrastructure

4. Implement a simple leds driver only supporting a small subset of the 
capabilities and make it disable-able for a userspace driver to take over

     - Pro:

         - Most simple to implement basic support

         - In scope for led subsystem simplicity paradigm

     - Con:

         - Not all built in keyboard backlights can be implemented in a 
userspace only driver

Kind Regards,

Werner

