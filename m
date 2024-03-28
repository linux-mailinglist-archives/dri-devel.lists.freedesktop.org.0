Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8365C890EB4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 00:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC15E10E0CF;
	Thu, 28 Mar 2024 23:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mFw2fCWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB39910E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 23:52:56 +0000 (UTC)
Received: from [192.168.42.20] (pd9e59192.dip0.t-ipconnect.de
 [217.229.145.146]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9BDED2FC0063;
 Fri, 29 Mar 2024 00:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1711669974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnUkd3zrJtf+UF2vp0gAxRqEg8ifjskDZHUDufmdHgk=;
 b=mFw2fCWeVfehQk4ttWYpWtS4t093YQnGON8cRSJKMYU1SHegar7vmFvRXLEmFNob8uj7AF
 ONgGzJblTtA7Ag/xmexLvGsICjlBLQlOhxXQXVsT+andHusvtswBjlQb/MuK0iaSlI5EEt
 bcvXr3iYB6IfFQecgVr2grpXUJiqDuM=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <1acb2206-ce77-411c-a4ff-7aa94fd56ad8@tuxedocomputers.com>
Date: Fri, 29 Mar 2024 00:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
 <fcf4dd53-f461-4c2e-8fbe-50b50e4e6797@redhat.com>
 <65b24776-ae1a-4290-a1d5-c7637ad0accc@tuxedocomputers.com>
 <vjd5xqgd2gsyz4ubgk6eusuyqdtxpdw6vogc5u537x2a245xcj@m2twppbxea4p>
 <9b5151f9-4d1c-401e-abb5-540097749b76@tuxedocomputers.com>
 <qsfdhmss6tyk6momjh65rwpqdoxhdi3l4takqy6u5c4iactcuf@gecjc364qmsn>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <qsfdhmss6tyk6momjh65rwpqdoxhdi3l4takqy6u5c4iactcuf@gecjc364qmsn>
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

Hi Benjamin,

Am 27.03.24 um 12:03 schrieb Benjamin Tissoires:
> On Mar 26 2024, Werner Sembach wrote:
>> Hi all,
>>
>> Am 26.03.24 um 16:39 schrieb Benjamin Tissoires:
>>> On Mar 26 2024, Werner Sembach wrote:
>>>> Hi all,
>>>>
>>>> Am 25.03.24 um 19:30 schrieb Hans de Goede:
>>>>
>>>> [snip]
>>>>>>> If the kernel already handles the custom protocol into generic HID, the
>>>>>>> work for userspace is not too hard because they can deal with a known
>>>>>>> protocol and can be cross-platform in their implementation.
>>>>>>>
>>>>>>> I'm mentioning that cross-platform because SDL used to rely on the
>>>>>>> input, LEDs, and other Linux peculiarities and eventually fell back on
>>>>>>> using hidraw only because it's way more easier that way.
>>>>>>>
>>>>>>> The other advantage of LampArray is that according to Microsoft's
>>>>>>> document, new devices are going to support it out of the box, so they'll
>>>>>>> be supported out of the box directly.
>>>>>>>
>>>>>>> Most of the time my stance is "do not add new kernel API, you'll regret
>>>>>>> it later". So in that case, given that we have a formally approved
>>>>>>> standard, I would suggest to use it, and consider it your API.
>>>>>> The only new UAPI would be the use_leds_uapi switch to turn on/off the backwards compatibility.
>>> I have my reserves with such a kill switch (see below).
>>>
>>>>> Actually we don't even need that. Typically there is a single HID
>>>>> driver handling both keys and the backlight, so userspace cannot
>>>>> just unbind the HID driver since then the keys stop working.
>>> I don't think Werner meant unbinding the HID driver, just a toggle to
>>> enable/disable the basic HID core processing of LampArray.
>>>
>>>>> But with a virtual LampArray HID device the only functionality
>>>>> for an in kernel HID driver would be to export a basic keyboard
>>>>> backlight control interface for simple non per key backlight control
>>>>> to integrate nicely with e.g. GNOME's backlight control.
>>>> Don't forget that in the future there will be devices that natively support
>>>> LampArray in their firmware, so for them it is the same device.
>>> Yeah, the generic LampArray support will not be able to differentiate
>>> "emulated" devices from native ones.
>>>
>>>> Regards,
>>>>
>>>> Werner
>>>>
>>>>> And then when OpenRGB wants to take over it can just unbind the HID
>>>>> driver from the HID device using existing mechanisms for that.
>>> Again no, it'll be too unpredicted.
>>>
>>>>> Hmm, I wonder if that will not also kill hidraw support though ...
>>>>> I guess getting hidraw support back might require then also manually
>>>>> binding the default HID input driver.  Bentiss any input on this?
>>> To be able to talk over hidraw you need a driver to be bound, yes. But I
>>> had the impression that LampArray would be supported by default in
>>> hid-input.c, thus making this hard to remove. Having a separate driver
>>> will work, but as soon as the LampArray device will also export a
>>> multitouch touchpad, we are screwed and will have to make a choice
>>> between LampArray and touch...
>>>
>>>>> Background info: as discussed earlier in the thread Werner would like
>>>>> to have a basic driver registering a /sys/class/leds/foo::kbd_backlight/
>>>>> device, since those are automatically supported by GNOME (and others)
>>>>> and will give basic kbd backlight brightness control in the desktop
>>>>> environment. This could be a simple HID driver for
>>>>> the hid_allocate_device()-ed virtual HID device, but userspace needs
>>>>> to be able to move that out of the way when it wants to take over
>>>>> full control of the per key lighting.
>>> Do we really need to entirely unregister the led class device? Can't we
>>> snoop on the commands and get some "mean value"?
>>>
>>>>> Regards,
>>>>>
>>>>> Hans
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>> The control flow for the whole system would look something like this:
>>>>>>
>>>>>> - System boots
>>>>>>
>>>>>>        - Kernel driver initializes keyboard (maybe stops rainbowpuke boot effects, sets brightness to a default value, or initializes a solid color)
>>>>>>
>>>>>>        - systemd-backlight restores last keyboard backlight brightness
>>>>>>
>>>>>>        - UPower sees sysfs leds entry and exposes it to DBus for DEs to do keyboard brightness handling
>>>>>>
>>>>>> - If the user wants more control they (auto-)start OpenRGB
>>>>>>
>>>>>>        - OpenRGB disables sysfs leds entry via use_leds_uapi to prevent double control of the same device by UPower
>>>>>>
>>>>>>        - OpenRGB directly interacts with hidraw device via LampArray API to give fine granular control of the backlight
>>>>>>
>>>>>>        - When OpenRGB closes it should reenable the sysfs leds entry
>>> That's where your plan falls short: if OpenRGB crashes, or is killed it
>>> will not reset that bit.
>>>
>>> Next question: is OpenRGB supposed to keep the hidraw node opened all
>>> the time or not?
>> TBH I didn't look at the OpenRGB code yet and LampArray there is currently
>> only planned. I somewhat hope that until the kernel driver is ready someone
>> else already picked up implementing LampArray in OpenRGB.
>>> If it has to keep it open, we should be able to come up with a somewhat
>>> similar hack that we have with hid-steam: when the hidraw node is
>>> opened, we disable the kernel processing of LampArray. When the node is
>>> closed, we re-enable it.
>>>
>>> But that also means we have to distinguish steam/SDL from OpenRGB...
>> My first thought here also: What is if something else is reading hidraw devices?
>>
>> Especially for hidraw devices that are not just LampArray.
>>
>>> I just carefully read the LampArray spec. And it's simpler than what
>>> I expected. But the thing that caught my attention was that it's
>>> mentioned that there is no way for the host to query the current
>>> color/illumination of the LEDs when the mode is set to
>>> AutonomousMode=false. Which means that the kernel should be able to
>>> snoop into any commands sent from OpenRGB to the device, compute a mean
>>> value and update its internal state.
>>>
>>> Basically all we need is the "toggle" to put the led class in read-only
>>> mode while OpenRGB kicks in. Maybe given that we are about to snoop on
>>> the commands sent, we can detect that there is a LampArray command
>>> emitted, attach this information to the struct file * in hidraw, and
>>> then re-enable rw when that user closes the hidraw node.
>> I think a read-only mode is not part of the current led class UAPI. Also I
>> don't want to associate AutonomousMode=true with led class is used.
>> AutonomousMode=true could for example mean that it is controlled via
>> keyboard shortcuts that are directly handled in the keyboard firmware, aka a
>> case where you want neither OpenRGB nor led class make any writes to the
>> keyboard.
>>
>> Or AutonomousMode=true could mean that on a device that implements both a
>> LampArray interface as well as a proprietary legacy interface is currently
>> controlled via the proprietary legacy interface (a lot of which are
>> supported by OpenRGB).
> Then how is the kernel supposed to handle LampArrays?
>
> If you need the kernel to use a ledclass, the kernel will have to set
> the device into AutonomousMode=false. When the kernel is done
> configuring the leds, it can not switch back to AutonomousMode=true or
> its config will likely be dumped by the device.

Yes, the kernel leds class driver will set AutonomousMode=false and keep it that 
way.

The userspace driver/OpenRGB will most likely do the same unless there is a 
proprietary API active in AutonomousMode=true it wants to use.

>
> OpenRGB can open the device, switch it to AutonomousMode=false and we
> can rely on it to do the right things as long as it is alive. But I do
> not see how the kernel could do the same.

AutonomousMode=false ^= LampArray API is used, AutonomousMode=true something 
else (if I read the HID docs correctly).

Both the kernel leds class driver as well as OpenRGB probably will interact with 
these devices via the LampArray API => AutonomousMode=false.

The kernel leds class driver is the fallback as long as userspace don't want to 
control the lighting. Userspace should get priority over kernel space here. So 
only kernel needs to know if userspace is controlling the device, not the other 
way around. So from this perspective checking in kernel if the fd is in use 
could be used, but what about userspace programs that open the hidraw device for 
not controlling the leds?

So imho userspace needs some way to explicitly signal it's intentions, e.g. via 
a sysfs attribute.

Best regards,

Werner

>
> FWIW, I also have a couple of crazy ideas currently boiling in my head
> to "solve" that but I'd rather have a consensus on the high level side
> of things before we go too deep into the technical workaround.
>
> Cheers,
> Benjamin
>
>> Regards,
>>
>> Werner
>>
>>> Cheers,
>>> Benjamin
>>>
>>>>>> - System shutdown
>>>>>>
>>>>>>        - Since OpenRGB reenables the sysfs leds entry, systemd-backlight can correctly store a brightness value for next boot
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Werner
>>>>>>
>>>>>>> Side note to self: I really need to resurrect the hidraw revoke series
>>>>>>> so we could export those hidraw node to userspace with uaccess through
>>>>>>> logind...
>>>>>>>
>>>>>>> Cheers,
>>>>>>> Benjamin
