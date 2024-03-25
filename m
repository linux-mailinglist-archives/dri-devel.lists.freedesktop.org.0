Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368388AA83
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D9010E9D8;
	Mon, 25 Mar 2024 17:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="A0GEY1B9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CDE10E9D8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:01:04 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e6.dip0.t-ipconnect.de [93.228.83.230])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AD8392FC005D;
 Mon, 25 Mar 2024 18:01:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1711386062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATs5/OdHRjCY1h26TAv0lmEMtG2XpuU45F9t/lj+nys=;
 b=A0GEY1B9FnamydoebSttg0wlw+tkjTkGAiYySc6x/bPZJsR+vPSWJgPzqJhKk5Y18dsAd5
 c3UQOE9aW2cGrY8llgV1BKDXZMtWtL+lmRcfJEmjHQL+yXBA98ptQObBA6jUbDYpAQvsyF
 ak1yM1tNx5Sa8TJrBEn5+6sjPYP93mA=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <4df21921-a32c-41ad-b366-e75a5d4de5de@tuxedocomputers.com>
Date: Mon, 25 Mar 2024 18:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v3
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <281f9b71-a565-4ff3-8343-ca36d604584d@redhat.com>
 <93d70ac3-bb18-4732-abb4-134750a5b50c@tuxedocomputers.com>
 <8264bce7-eda0-4e1c-8c72-a6a78ee3a7bd@redhat.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <8264bce7-eda0-4e1c-8c72-a6a78ee3a7bd@redhat.com>
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

Hi Hans,

Am 25.03.24 um 15:18 schrieb Hans de Goede:
> Hi Werner,
>
> On 3/19/24 4:18 PM, Werner Sembach wrote:
>> Hi Hans,
>>
>> Am 18.03.24 um 12:11 schrieb Hans de Goede:
>>> Hi Werner,
>>>
>>> Sorry for the late reply.
>> np
>>> On 2/22/24 2:14 PM, Werner Sembach wrote:
>>>> Hi,
>>>>
>>>> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
>>>>
>>>> To recap the hopefully final UAPI for complex RGB lighting devices:
>>>>
>>>> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.
>>> Ack this sounds good.
>>>
>>>> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.
>>> You don't need a char misc device here, you can just make this sysfs attributes on the LED class device's parent device by using device_driver.dev_groups. Please don't use a char misc device just to attach sysfs attributes to it.
>>>
>>> Also I'm a bit unsure about most of these attributes, "use_leds_uapi" was discussed before
>>> and makes sense. But at least for HID devices the rest of this info is already available
>>> in sysfs attributes on the HID devices (things like vendor and product id) and since the
>>> userspace code needs per device code to drive the kbd anyways it can also have device
>>> specific code to retrieve all this info, so the other sysfs attributes just feel like
>>> duplicating information. Also there already are a ton of existing hidraw userspace rgbkbd
>>> drivers which already get this info from other places.
>> The parent device can be a hid device, a wmi device, a platform device etc. so I thought it would be nice to have some unified way for identification.
> I think that some shared ioctl for identifying devices which need a misc-device
> makes sense. But for existing hidraw supported keyboards there already is existing
> userspace support, which already retreives this in a hidraw specific manner.
>
> And I doubt that the existing userspace projects will add support for a new method
> which is only available on new kernels, while they will also need to keep the old
> method around to keep things working with older kernels.
>
> So at least for the hidraw case I see little value in exporting the same info
> in another way.

Ack on the no new device, but since we are adding use_leds_uapi to the parent 
device anyway, having the identification on non-HID devices wie sysfs entries 
would help even more in not creating a new device just to handle an ioctl.

Just to note here. When we go the LampArray route, everything is a HID device 
anyway.

>
>
>>>>       - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
>>>>
>>>>       - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.
>>> Ack, if this finds it way into some documentation (which it should) please make it
>>> clear that this is about the "use_leds_uapi" sysfs attribute.
>> Ack
>>>> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.
>>> IMHO this is the only case where actually using a misc device makes sense, so that
>>> you have a chardev to do the ioctls on. misc-device-s should really only be used
>>> when you need a chardev under /dev . Since you don't need the chardev for the e.g.
>>> hidraw case you should not use a miscdev there IMHO.
>> My train of thought was that it would be nice to have the use_leds_uapi at a somewhat unified location in sysfs. The parent device can be of any kind, like I mentioned above, and while for deactivating it can easily be found via /sys/class/leds/*/device/. For reactivating, the leds entry doesn't exist.
> That is an interesting point. But I would expect any process/daemon which wants to
> reactivate the in kernel LED class support to be the same process as which
> deactivated it. So that daemon can simply canonicalize the /sys/class/leds/*/device
> symlink or canonicalize the entire /sys/class/leds/*/device/use_leds_uapi path
> and store the canonicalized version for when the daemon wants to reactivate things.

Ack

Regards,

Werner

>
> So I still think that having the miscdevice just for enumeration and
> use_leds_uapi purposes is overkill.
>
> Regards,
>
> Hans
>
>
