Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBA188BBC9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 08:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9672410EDAB;
	Tue, 26 Mar 2024 07:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZZxU4hOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9264F10EDAA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 07:57:13 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e6.dip0.t-ipconnect.de [93.228.83.230])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8DA012FC005D;
 Tue, 26 Mar 2024 08:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1711439831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07xpBINcmpFjLp2DaMcbvfvjJdTbGEJQdX9Jp0QEuaI=;
 b=ZZxU4hOuwCtvDabH2XBAqsqirw65P6JRc6X/96CK7py49gMn5gLb9G3eYbkX77mqZnFAh0
 qRSm6e7r5BXokKL/nl/xFX8hJAyeOO8ThhV9pekNzG3tGkiUr5jCVI7IegOY4WV5mmNWOS
 hp9tgJGlUHZ2TwI/GFe9rQ938u3I5TI=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <65b24776-ae1a-4290-a1d5-c7637ad0accc@tuxedocomputers.com>
Date: Tue, 26 Mar 2024 08:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
 <fcf4dd53-f461-4c2e-8fbe-50b50e4e6797@redhat.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <fcf4dd53-f461-4c2e-8fbe-50b50e4e6797@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Am 25.03.24 um 19:30 schrieb Hans de Goede:

[snip]
>>> If the kernel already handles the custom protocol into generic HID, the
>>> work for userspace is not too hard because they can deal with a known
>>> protocol and can be cross-platform in their implementation.
>>>
>>> I'm mentioning that cross-platform because SDL used to rely on the
>>> input, LEDs, and other Linux peculiarities and eventually fell back on
>>> using hidraw only because it's way more easier that way.
>>>
>>> The other advantage of LampArray is that according to Microsoft's
>>> document, new devices are going to support it out of the box, so they'll
>>> be supported out of the box directly.
>>>
>>> Most of the time my stance is "do not add new kernel API, you'll regret
>>> it later". So in that case, given that we have a formally approved
>>> standard, I would suggest to use it, and consider it your API.
>> The only new UAPI would be the use_leds_uapi switch to turn on/off the backwards compatibility.
> Actually we don't even need that. Typically there is a single HID
> driver handling both keys and the backlight, so userspace cannot
> just unbind the HID driver since then the keys stop working.
>
> But with a virtual LampArray HID device the only functionality
> for an in kernel HID driver would be to export a basic keyboard
> backlight control interface for simple non per key backlight control
> to integrate nicely with e.g. GNOME's backlight control.

Don't forget that in the future there will be devices that natively support 
LampArray in their firmware, so for them it is the same device.

Regards,

Werner

> And then when OpenRGB wants to take over it can just unbind the HID
> driver from the HID device using existing mechanisms for that.
>
> Hmm, I wonder if that will not also kill hidraw support though ...
> I guess getting hidraw support back might require then also manually
> binding the default HID input driver.  Bentiss any input on this?
>
> Background info: as discussed earlier in the thread Werner would like
> to have a basic driver registering a /sys/class/leds/foo::kbd_backlight/
> device, since those are automatically supported by GNOME (and others)
> and will give basic kbd backlight brightness control in the desktop
> environment. This could be a simple HID driver for
> the hid_allocate_device()-ed virtual HID device, but userspace needs
> to be able to move that out of the way when it wants to take over
> full control of the per key lighting.
>
> Regards,
>
> Hans
>
>
>
>
>
>
>
>> The control flow for the whole system would look something like this:
>>
>> - System boots
>>
>>      - Kernel driver initializes keyboard (maybe stops rainbowpuke boot effects, sets brightness to a default value, or initializes a solid color)
>>
>>      - systemd-backlight restores last keyboard backlight brightness
>>
>>      - UPower sees sysfs leds entry and exposes it to DBus for DEs to do keyboard brightness handling
>>
>> - If the user wants more control they (auto-)start OpenRGB
>>
>>      - OpenRGB disables sysfs leds entry via use_leds_uapi to prevent double control of the same device by UPower
>>
>>      - OpenRGB directly interacts with hidraw device via LampArray API to give fine granular control of the backlight
>>
>>      - When OpenRGB closes it should reenable the sysfs leds entry
>>
>> - System shutdown
>>
>>      - Since OpenRGB reenables the sysfs leds entry, systemd-backlight can correctly store a brightness value for next boot
>>
>> Regards,
>>
>> Werner
>>
>>> Side note to self: I really need to resurrect the hidraw revoke series
>>> so we could export those hidraw node to userspace with uaccess through
>>> logind...
>>>
>>> Cheers,
>>> Benjamin
