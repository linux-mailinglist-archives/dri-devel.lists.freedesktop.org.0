Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D598BBFE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 14:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445DE10E216;
	Tue,  1 Oct 2024 12:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="rxsQ/F9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADC510E216
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 12:21:28 +0000 (UTC)
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de
 [217.229.157.161]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 096042FC0050;
 Tue,  1 Oct 2024 14:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1727785286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AbG84A5EMvLn9Auuag1AZjOQAJNiNrBNBh5UdE2lQpc=;
 b=rxsQ/F9nD1M5QXhssUgDk13znS5GjPIZOjWPyA8TpV6W0rROE6w7qF1rF6cinjcJRoLl93
 h2Q8D+n0ysfeOrFbBb62IrsSq5LAlIqfHljWQDizVGruaw4hZ2OdRJSZyna4PSBF2P3NBf
 goasHAxEkxXjlr3AFrDMx8+vL/iJGJk=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Content-Type: multipart/alternative;
 boundary="------------wt7iuG0qGsNY4mdWufVlYl0x"
Message-ID: <48961e58-a75f-48eb-8967-04a653258b0f@tuxedocomputers.com>
Date: Tue, 1 Oct 2024 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ZvcdNXQJmc8cjifw@amd.ucw.cz> <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
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

This is a multi-part message in MIME format.
--------------wt7iuG0qGsNY4mdWufVlYl0x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 30.09.24 um 19:06 schrieb Benjamin Tissoires:
> On Sep 30 2024, Werner Sembach wrote:
>> [...]
>> Thinking about it, maybe it's not to bad that it only changes once udev is
>> ready, like this udev could decide if leds should be used or if it should
>> directly be passed to OpenRGB for example, giving at least some consistency
>> only changing once: i.e. firmware -> OpenRGB setting and not firmware->leds
>> setting->OpenRGB setting.
> That would work if OpenRGB gets to ship the LampArray bpf object (not
> saying that it should). Because if OpenRGB is not installed, you'll get
> a led class device, and if/when OpenRGB is installed, full LampArray
> would be presented.

The idea in my head is still that there is some kind of sysfs switch to 
enable/disable leds.

My idea is then that a udev rule shipped with OpenRGB sets this switch to 
disable before loading the BPF driver so leds never get initialized for the 
final LampArray device.

>
> But anyway, BPF allows to dynamically change the behaviour of the
> device, so that's IMO one bonus point of it.
>
>>> FWIW, the use of BPF only allows you to not corner yourself. If you
>>> failed at your LampArray implementation, you'll have to deal with it
>>> forever-ish. So it's perfectly sensible to use BPF as an intermediate step
>>> where you develop both userspace and kernel space and then convert back
>>> the BPF into a proper HID driver.
>> I don't really see this point: The LampArray API is defined by the HID Usage
>> Table and the report descriptor, so there is not API to mess up and
>> everything else has to be parsed dynamically by userspace anyway, so it can
>> easily be changed and userspace just adopts automatically.
>>
>> And for this case the proper HID driver is already ready.
> Yeah, except we don't have the fallback LED class. If you are confident
> enough with your implementation, then maybe yes we can include it as a
> driver from day one, but that looks like looking for troubles from my
> point of view.

To be on the safe side that we don't talk about different things: My current 
plan is that the leds subsystem builds on top of the LampArray implementation.

Like this the leds part has to be only implemented once for all LampArray 
devices be it emulated via a driver or native via firmware in the device itself.

And I feel confident that the UAPI should be that the userspace gets a hidraw 
device with a LampArray HID descriptor, and every thing else is, by the HID 
spec, dynamic anyway so I can still change my mind in implementation specifics 
there, can't I?

>
> After a second look at the LampArray code here... Aren't you forgetting
> the to/from CPU conversions in case you are on a little endian system?
Since this driver is for built in keyboards of x86 notebooks it isn't required 
or is it?
>
>> So the only point for me currently is: Is it ok to have key position/usage
>> description tables in the kernel driver or not?
> good question :)
>
> I would say, probably not in the WMI driver itself. I would rather have
> a hid-tuxedo.c HID driver that does that. But even there, we already had
> Linus complaining once regarding the report descriptors we sometimes
> insert in drivers, which are looking like opaque blobs. So it might not be
> the best either.
Isn't tuxedo_nb04_wmi_ab_virtual_lamp_array.c not something like hid-tuxedo.c? 
or should it be a separate file with just the arrays?
>
> Sorry I don't have a clear yes/no answer.

Hm... Well if it's no problem I would keep the current implementation with minor 
adjustments because, like i described above, I don't see a benefit now that this 
already works to rewrite it in BPF again.

If it is a problem then i don't see another way then to rewrite it in BPF.

Note: For future devices there might be more keyboard layouts added, basically 
every time the chassis form factor changes.

>
> Cheers,
> Benjamin
To sum up the architechture (not mutally exclusive technically)

/- leds
WMI <- WMI to LampArray Kernel driver <-switch-|
                                                \- OpenRGB

/- leds
WMI <- WMI to Custom HID Kernel driver <- Custom HID to LampArray BPF 
driver<-switch-|
\- OpenRGB

With the "switch" and "leds" implemented in hid core, automatically initialized 
every time a LampArray device pops up (regardless if it is from native firmware, 
a bpf driver or a kernel driver)

Writing this down I think it was never decided how the switch should look like:

It should not be a sysfs attribute of the leds device as the leds device should 
disappear when the switch is set away from it, but should it be a sysfs variable 
of the hid device? This would mean that hid core needs to add that switch 
variable to every hid device having a LampArray section in the descriptor.

>
>>> Being able to develop a kernel driver without having to reboot and
>>> being sure you won't crash your kernel is a game changer ;)
>>>
>>> Cheers,
>>> Benjamin

Best regards and sorry for the many questions,

Werner Sembach

PS: on a side node: How does hid core handle HID devices with a broken HID 
implementation fixed by bpf, if bpf is loaded after hid-core? Does the hid 
device get reinitialized by hid core once the bpf driver got loaded? If yes, is 
there a way to avoid side effects by this double initialization or is there a 
way to avoid this double initialization, like marking the device id as broken so 
that hid core- does not initialize it unless it's fixed by bpf?

--------------wt7iuG0qGsNY4mdWufVlYl0x
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">Am 30.09.24 um 19:06 schrieb Benjamin
      Tissoires:<br>
    </div>
    <blockquote type="cite"
cite="mid:cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl">
      <pre class="moz-quote-pre" wrap="">On Sep 30 2024, Werner Sembach wrote:
</pre>
      <blockquote type="cite">[...]<span style="white-space: pre-wrap">
</span>
        <pre class="moz-quote-pre" wrap="">Thinking about it, maybe it's not to bad that it only changes once udev is
ready, like this udev could decide if leds should be used or if it should
directly be passed to OpenRGB for example, giving at least some consistency
only changing once: i.e. firmware -&gt; OpenRGB setting and not firmware-&gt;leds
setting-&gt;OpenRGB setting.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That would work if OpenRGB gets to ship the LampArray bpf object (not
saying that it should). Because if OpenRGB is not installed, you'll get
a led class device, and if/when OpenRGB is installed, full LampArray
would be presented.</pre>
    </blockquote>
    <p>The idea in my head is still that there is some kind of sysfs
      switch to enable/disable leds.</p>
    <p>My idea is then that a udev rule shipped with OpenRGB sets this
      switch to disable before loading the BPF driver so leds never get
      initialized for the final LampArray device.<br>
    </p>
    <blockquote type="cite"
cite="mid:cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl">
      <pre class="moz-quote-pre" wrap="">

But anyway, BPF allows to dynamically change the behaviour of the
device, so that's IMO one bonus point of it.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
FWIW, the use of BPF only allows you to not corner yourself. If you
failed at your LampArray implementation, you'll have to deal with it
forever-ish. So it's perfectly sensible to use BPF as an intermediate step
where you develop both userspace and kernel space and then convert back
the BPF into a proper HID driver.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I don't really see this point: The LampArray API is defined by the HID Usage
Table and the report descriptor, so there is not API to mess up and
everything else has to be parsed dynamically by userspace anyway, so it can
easily be changed and userspace just adopts automatically.

And for this case the proper HID driver is already ready.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah, except we don't have the fallback LED class. If you are confident
enough with your implementation, then maybe yes we can include it as a
driver from day one, but that looks like looking for troubles from my
point of view.</pre>
    </blockquote>
    <p>To be on the safe side that we don't talk about different things:
      My current plan is that the leds subsystem builds on top of the
      LampArray implementation.</p>
    <p>Like this the leds part has to be only implemented once for all
      LampArray devices be it emulated via a driver or native via
      firmware in the device itself.</p>
    <p>And I feel confident that the UAPI should be that the userspace
      gets a hidraw device with a LampArray HID descriptor, and every
      thing else is, by the HID spec, dynamic anyway so I can still
      change my mind in implementation specifics there, can't I?<br>
    </p>
    <blockquote type="cite"
cite="mid:cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl">
      <pre class="moz-quote-pre" wrap="">

After a second look at the LampArray code here... Aren't you forgetting
the to/from CPU conversions in case you are on a little endian system?</pre>
    </blockquote>
    Since this driver is for built in keyboards of x86 notebooks it
    isn't required or is it?<br>
    <blockquote type="cite"
cite="mid:cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
So the only point for me currently is: Is it ok to have key position/usage
description tables in the kernel driver or not?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
good question :)

I would say, probably not in the WMI driver itself. I would rather have
a hid-tuxedo.c HID driver that does that. But even there, we already had
Linus complaining once regarding the report descriptors we sometimes
insert in drivers, which are looking like opaque blobs. So it might not be
the best either.</pre>
    </blockquote>
    Isn't tuxedo_nb04_wmi_ab_virtual_lamp_array.c not something like
    hid-tuxedo.c? or should it be a separate file with just the arrays?<br>
    <blockquote type="cite"
cite="mid:cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl">
      <pre class="moz-quote-pre" wrap="">

Sorry I don't have a clear yes/no answer.</pre>
    </blockquote>
    <p>Hm... Well if it's no problem I would keep the current
      implementation with minor adjustments because, like i described
      above, I don't see a benefit now that this already works to
      rewrite it in BPF again.</p>
    <p>If it is a problem then i don't see another way then to rewrite
      it in BPF.</p>
    <p>Note: For future devices there might be more keyboard layouts
      added, basically every time the chassis form factor changes.<br>
    </p>
    <blockquote type="cite"
cite="mid:cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl">
      <pre class="moz-quote-pre" wrap="">

Cheers,
Benjamin</pre>
    </blockquote>
    To sum up the architechture (not mutally exclusive technically)<br>
    <p><font face="monospace">                                              
        /- leds<br>
        WMI &lt;- WMI to LampArray Kernel driver &lt;-switch-|<br>
                                                       \- OpenRGB</font></p>
    <p><font face="monospace">                                                                                     
        /- leds<br>
        WMI &lt;- WMI to Custom HID Kernel driver &lt;- </font><font
        face="monospace">Custom HID to LampArray BPF driver</font><font
        face="monospace"> &lt;-switch-|<br>
                                                                                     
        \- OpenRGB</font></p>
    <p>With the "switch" and "leds" implemented in hid core,
      automatically initialized every time a LampArray device pops up
      (regardless if it is from native firmware, a bpf driver or a
      kernel driver)<br>
    </p>
    <p>Writing this down I think it was never decided how the switch
      should look like:</p>
    <p>It should not be a sysfs attribute of the leds device as the leds
      device should disappear when the switch is set away from it, but
      should it be a sysfs variable of the hid device? This would mean
      that hid core needs to add that switch variable to every hid
      device having a LampArray section in the descriptor.<br>
    </p>
    <blockquote type="cite"
cite="mid:cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Being able to develop a kernel driver without having to reboot and
being sure you won't crash your kernel is a game changer ;)

Cheers,
Benjamin
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>Best regards and sorry for the many questions,</p>
    <p>Werner Sembach<br>
    </p>
    <p>PS: on a side node: How does hid core handle HID devices with a
      broken HID implementation fixed by bpf, if bpf is loaded after
      hid-core? Does the hid device get reinitialized by hid core once
      the bpf driver got loaded? If yes, is there a way to avoid side
      effects by this double initialization or is there a way to avoid
      this double initialization, like marking the device id as broken
      so that hid core- does not initialize it unless it's fixed by bpf?</p>
  </body>
</html>

--------------wt7iuG0qGsNY4mdWufVlYl0x--
