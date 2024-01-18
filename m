Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1168310B0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 01:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68B510E008;
	Thu, 18 Jan 2024 00:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D709610E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 00:58:52 +0000 (UTC)
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net
 [88.217.226.44]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B0A532FC0077;
 Thu, 18 Jan 2024 01:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1705539518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51f/k66Vol71lHon++WYqlYJi4X/qpNHu9WjCfatBME=;
 b=AynO/R20e1tlfNRfZi9AWmy1OUwolIcsbrX7XV8HHrb9eKXI5CVd4XHkEgj86wCMqGIYSd
 hLs2nBZ9CQiwjzAgvzrySiifvRNIhJxj9g4+vn8fZpRLp38OOK1zRVPiSybpVKnD/i679K
 O308ON0K/mQ/jJMImC1qo35dDIy4MvU=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <58471134-eddb-4bdf-acaa-499177507e5e@tuxedocomputers.com>
Date: Thu, 18 Jan 2024 01:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Userspace API for per key backlight for non HID (no hidraw)
 keyboards
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 Pavel Machek <pavel@ucw.cz>, Jani Nikula <jani.nikula@linux.intel.com>,
 jikos@kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Christoffer Sandberg <cs@tuxedocomputers.com>
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
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <3040290f-9b26-4fd3-8e64-a03ec59921d6@redhat.com>
 <6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de>
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

Hi Hans and Armin,

Am 17.01.24 um 20:03 schrieb Armin Wolf:
> Am 17.01.24 um 17:50 schrieb Hans de Goede:
>
>> Hi All,
>>
>> On 11/27/23 11:59, Werner Sembach wrote:
>>
>> <snip>
>>
>>> I also stumbled across a new Problem:
>>>
>>> We have an upcoming device that has a per-key keyboard backlight, but does 
>>> the control completely via a wmi/acpi interface. So no usable hidraw here 
>>> for a potential userspace driver implementation ...
>>>
>>> So a quick summary for the ideas floating in this thread so far:
>>>
>>> 1. Expand leds interface allowing arbitrary modes with semi arbitrary 
>>> optional attributes:
>>>
>>>      - Pro:
>>>
>>>          - Still offers all default attributes for use with UPower
>>>
>>>          - Fairly simple to implement from the preexisting codebase
>>>
>>>          - Could be implemented for all (to me) known internal keyboard 
>>> backlights
>>>
>>>      - Con:
>>>
>>>          - Violates the simplicity paradigm of the leds interface (e.g. with 
>>> this one leds entry controls possible multiple leds)
>> So what you are suggesting here is having some way (a-z + other sysfs attr?)
>> to use a single LED class device and then extend that to allow setting all
>> keys ?
>>
>> This does not seem like a good idea to me and this will also cause issues
>> when doing animations in software, since this API will likely be slow.
>>
>> And if the API is not slow, then it will likely involve some sort
>> of binary sysfs file for setting multiple keys rather then 1
>> file per key which would break the normal 1 file per setting sysfs
>> paradigm.
>>
>>> 2. Implement per-key keyboards as auxdisplay
>>>
>>>      - Pro:
>>>
>>>          - Already has a concept for led positions
>> With a "concept" you mean simple x,y positioning or is
>> there something more advanced here that I'm aware of ?
>>
>>>          - Is conceptually closer to "multiple leds forming a singular entity"
>>>
>>>      - Con:
>>>
>>>          - No preexisting UPower support
>>>
>>>          - No concept for special hardware lightning modes
>>>
>>>          - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
>> Hmm, so there is very little documentation on this and what
>> docs there is: Documentation/admin-guide/auxdisplay/cfag12864b.rst
>> as well as the example program how to uses this suggests that
>> this is using the old /dev/fb# interface which we are sorta
>> trying to retire.
>>
>>
>>> 3. Implement in input subsystem
>>>
>>>      - Pro:
>>>
>>>          - Preexisting concept for keys and key purpose
>>>
>>>      - Con:
>>>
>>>          - Not in scope for subsystem
>>>
>>>          - No other preexisting light infrastructure
>> Dmitry actually recently nacked the addition of
>> a LED_MIC_MUTE define to include/uapi/linux/input-event-codes.h
>> which was intended to be able to allow the input LED support
>> with standard HID mic-mute leds (spk-mute is already supported
>> this way).
>>
>> Dmitry was very clear that no new LEDs must be added and
>> that any new LED support should be done through the LED
>> subsytem, so I do not think that something like this
>> is going to fly.
>>
>>
>>> 4. Implement a simple leds driver only supporting a small subset of the 
>>> capabilities and make it disable-able for a userspace driver to take over
>>>
>>>      - Pro:
>>>
>>>          - Most simple to implement basic support
>>>
>>>          - In scope for led subsystem simplicity paradigm
>>>
>>>      - Con:
>>>
>>>          - Not all built in keyboard backlights can be implemented in a 
>>> userspace only driver
>> Right, so this is basically what we have been discussing in the other
>> part of the thread with the:
>>
>> /sys/bus/hid/devices/0003:xxxx:xxxx.xxxx/disable_kbd_backlight_support
>>
>> proposal to unregister the kernel's LED class device and then
>> allow userspace to do whatever it wants through /dev/hidraw
>> without the kernel also trying to access the backlight
>> functionality at the same time.
>>
>> AFAIK there already is a bunch of userspace support for
>> per key addressable kbd RGB backlights using hidraw support,
>> so this way we can use the momentum / code of these existing
>> projects, at least for existing hidraw keyboards and adding
>> support for:
>>
>> /sys/bus/hid/devices/0003:xxxx:xxxx.xxxx/disable_kbd_backlight_support
>>
>> to these existing projects should be simple.
>>
>> Yet this will not work for your mentioned "control completely
>> via a wmi/acpi interface". Still I think we should go the same
>> route for those adding a misc-char device or something like
>> that to allow making WMI calls from userspace (like Windows
>> can do). Maybe with an allow list per GUID to only allow
>> specific calls, so that we can avoid possible dangerous calls.
>>
>> Armin Wolf recently became the WMI bus maintainer.
>>
>> Armin, we are discussing how to deal with (laptop) keyboards
>> which have a separate RGB LED per key and how to control
>> those LEDs.
>>
>> So far per key addressable keyboard backlighting has always
>> been HID based, so any existing support is just userspace
>> based using /dev/hidraw. In my experience the problem with
>> supporting gaming peripherals is that there is interest in it,
>> but not really enough interest to keep a sustained momentum
>> behind projects, especially not when it comes to taking code
>> from a fun weekend hack to upstreaming them into bigger
>> projects like the kernel.
>>
>> So I would like to offer some sort of easy accessible
>> API to userspace for accessing this, basically allowing
>> userspace drivers for the LED part of the keyboard which
>> in some cases will involve making WMI calls from userspace.
>>
>> So, Armin, what do you think about a way of allowing
>> (filtered) WMI calls from userspace through say
>> a misc-char device + ioctls or something like that?
>>
>> Werner atm I personally do think that option 4. from
>> your list is the way to go. Mainly because designing
>> a generic kernel API for all bells and whistles of gaming
>> hw is very tricky and would require a large ongoing
>> effort which I just don't see happening (based on
>> past experience).
>>
>> Regards,
>>
>> Hans
>>
> Hi,
>
> i can understand your concerns, but i strongly advise against a generic WMI 
> userspace API.
> The reasons for this are:
>
> 1. We are still unable to parse (and use) the binary MOF buffers describing 
> the WMI devices,
> so all of that would require the driver parsing a raw byte buffer. In this 
> case a separate
> misc device managed by the driver would basically do the same.
>
> 2. Many WMI implementations are like RWEverything implemented inside the ACPI 
> firmware, so
> most devices will require the driver to do excessive filtering. Many 
> implementations also do
> no proper input validation either so the driver has to know all possible use 
> cases since he
> has to protect the buggy ACPI firmware from userspace attacks.

Or the WMI has a straight forward arbitrary read/write function into EC ram 
(e.g. all Uniwill/TongFang devices).

The filtering would need to be explicit whitelisting of wmi-calls+arguments. 
Don't know if this would reduce complexity for the kernel.

>
> Regarding point number 2, i just had to contact Asus so that they remove a 
> broken WMI interface
> from my motherboard or else a simple application could crash the Windows 
> kernel. This firmware
> is (sadly) being designed as an internal API and thus unstable beyond all 
> imagination.
>
> For HID devices, a userspace driver might be OK since they are somewhat 
> isolated from the remaining
> hardware, but WMI is basically a kernel bypass for ACPI firmware calls, so 
> userspace could easily
> attack the kernel is way.
>
> Personally, i would prefer extending the LED subsystem to support zone-like 
> devices with many LEDs,
> as this would prevent userspace from having to tinker with the hardware behind 
> the kernels back.
> Other highly device-specific features could be implemented with a 
> driver-specific misc device.

Something like my earlier suggestion "[...] adds a new entry zones_count. 
multi_intensity has now colors count * zones_count entries. aka a RGB keyboard 
with 126 leds would take 378 values for multi_intensity [...]"?

Setting all with one file access to multi_intensity could make it somewhat 
performant as Hans already mentioned, but also would violate the one file one 
led paradigm.

Or formulated differently: How should the sysfs folder look:

leds/
     rgb:kbd_backlight_a/
         brightness
         multi_intensity
     rgb:kbd_backlight_b/
         brightness
         multi_intensity
     ...

or

leds/
     rgb:kbd_backlight/
         brightness
         multi_intensity_a
         multi_intensity_b
         ...

or

leds/
     rgb:kbd_backlight/
         brightness
         zones_count
         multi_intensity

Personally I don't really like the idea of having the color set in 
/sys/class/leds/*:rgb:kbd_backlight/multi_intensity and e.g. the breathing mode 
in /sys/class/misc/<some_random_name>/<some_random_attribute>. Or at least there 
should be a hint in /sys/class/leds/*:rgb:kbd_backlight/ for the userspace to 
know where to look for associated additional attributes.

>
> Regarding the speed, it depends on the underlying WMI interface design if 
> smooth animations are
> even possible, since many WMI interfaces are quite slow. Can you share the 
> Binary MOF buffers
> describing the WMI interfaces in question?
Taking a colleague in the loop who currently has the device at hand. 
@Christoffer can you extract it? Is it one wmi call per key or is there a "set 
all" wmi call (because performance)?
>
> Thanks,
> Armin Wolf
>
Kind regards,

Werner

