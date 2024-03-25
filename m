Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCD188A7DA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 16:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3210E4B1;
	Mon, 25 Mar 2024 15:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qcMSEvh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593DD10E4B1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 15:56:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 73145CE1AE1;
 Mon, 25 Mar 2024 15:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA093C433F1;
 Mon, 25 Mar 2024 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711382214;
 bh=ENDQ/e0q9PX0Cu5M/o6hx0CVqmsSUPAKQYjWkmXdgyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qcMSEvh6wLv5drqay/oxDcZ+vzz+1GCw0Q3n4gWaHMwTKnsG0cUZ7/bI90q2vE/av
 p6cyw0zqXIV8fzMYtCHudpFRcopl/3WeDp8449JCw0LyP4DDpUy+/6dKmmzjI5e5jU
 Rdb3Wfo4NUf2VlmA9ciXYrRiHD+XlGaO9gLIpmV1FHo1gjva2Mz9fgF9KlyJZldN2f
 bSeq6FJVHYQKzuzDjpdtwb5qpAz+3zk/FhfnE3aZfGtXEhXA6IhBs0mZeaReyf9tHN
 6Ah7u0ksUVa+bzjSh5W6J3JO+LgU5innpV3/nBvqhIleCJjNxWroSNsMZISKuD8g//
 aFDT4lVjwF9BQ==
Date: Mon, 25 Mar 2024 16:56:49 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Lee Jones <lee@kernel.org>, 
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, 
 linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Gregor Riepl <onitake@gmail.com>
Subject: Re: In kernel virtual HID devices (was Future handling of complex
 RGB devices on Linux v3)
Message-ID: <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
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

On Mar 25 2024, Hans de Goede wrote:
> +Cc: Bentiss, Jiri
> 
> Hi Werner,
> 
> On 3/20/24 12:16 PM, Werner Sembach wrote:
> > Hi Hans and the others,
> > 
> > Am 22.02.24 um 14:14 schrieb Werner Sembach:
> >> Hi,
> >>
> >> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
> >>
> >> To recap the hopefully final UAPI for complex RGB lighting devices:
> >>
> >> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.
> >>
> >> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.
> >>
> >>     - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
> >>
> >>     - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.
> >>
> >> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.
> > So in the OpenRGB issue thread https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices aka HID LampArray was mentioned. I did dismiss it because I thought that is only relevant for firmware, but I now stumbled upon the Virtual HID Framework (VHF) https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/virtual-hid-framework--vhf- and now I wonder if an equivalent exists for Linux? A quick search did not yield any results for me.
> 
> Oh, interesting. I did not know about the HID LampArray API.
> 
> About your question about virtual HID devices, there is uHID,
> but as the name suggests this allows userspace to emulate a HID
> device.
> 
> In your case you want to do the emulation in kernel so that you
> can translate the proprietary WMI calls to something HID LampArray
> compatible.
> 
> I guess you could do this by defining your own HID transport driver,
> like how e.g. the i2c-hid code defines 1 i2c-hid parent + 1 HID
> "client" for each device which talks HID over i2c in the machine.
> 
> Bentiss, Jiri, do you have any input on this. Would something like
> that be acceptable to you (just based on the concept at least) ?

I just read the thread, and I think I now understand a little bit what
this request is :)

IMO working with the HID LampArray is the way forward. So I would
suggest to convert any non-HID RGB "LED display" that we are talking
about as a HID LampArray device through `hid_allocate_device()` in the
kernel. Basically what you are suggesting Hans. It's just that you don't
need a formal transport layer, just a child device that happens to be
HID.

The next question IMO is: do we want the kernel to handle such
machinery? Wouldn't it be simpler to just export the HID device and let
userspace talk to it through hidraw, like what OpenRGB does?

If the kernel already handles the custom protocol into generic HID, the
work for userspace is not too hard because they can deal with a known
protocol and can be cross-platform in their implementation.

I'm mentioning that cross-platform because SDL used to rely on the
input, LEDs, and other Linux peculiarities and eventually fell back on
using hidraw only because it's way more easier that way.

The other advantage of LampArray is that according to Microsoft's
document, new devices are going to support it out of the box, so they'll
be supported out of the box directly.

Most of the time my stance is "do not add new kernel API, you'll regret
it later". So in that case, given that we have a formally approved
standard, I would suggest to use it, and consider it your API.

Side note to self: I really need to resurrect the hidraw revoke series
so we could export those hidraw node to userspace with uaccess through
logind...

Cheers,
Benjamin
