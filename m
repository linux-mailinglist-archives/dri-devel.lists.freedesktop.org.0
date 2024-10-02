Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E498CEC2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2624110E6C4;
	Wed,  2 Oct 2024 08:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YPplkk6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978210E6C4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:31:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45E095C03F8;
 Wed,  2 Oct 2024 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DFEC4CEC5;
 Wed,  2 Oct 2024 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727857868;
 bh=Ahs6Cr4gOcOeWg9nG1zhez1O0eh7GoDSU0boAR/4hiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YPplkk6KMxfKxwzUEf5PhSMWRJ2rVKoaRJ3T3iGKYeOmKx6BDuVD8xr8gJDHfFzpz
 VEc5+2NE4omIpxy8W+6WzGBiBdaSE6/EIO2ZHG88ph4wl/2e+MGUR13nWpwLwVz6iS
 sVy3qd/pusNN1SY8Z6IbOb9BrN6uykfHEzMeO2COx6xIybqDPKv4/4CDTyAVoTVe1k
 nLPuIj0nARTvVA2ZYWOikVdDugs26BnQiKY/xHfMPJezFLiUmFS1qzOOTuVcjBOuzg
 id928e9Hq3bGQo1++tOpa41/epJFr7ae0IxL7/92jK3MF3r33KR2IgkcNOgVvwYu9+
 UOVezeZXq2usQ==
Date: Wed, 2 Oct 2024 10:31:01 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>, 
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
References: <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
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

On Oct 01 2024, Werner Sembach wrote:
> Hi Benjamin,
> 
> Am 01.10.24 um 15:41 schrieb Benjamin Tissoires:
> > On Oct 01 2024, Werner Sembach wrote:
> > > (sorry resend because thunderbird made it a html mail)
> > > 
> > > Hi,
> > > 
> > > Am 30.09.24 um 19:06 schrieb Benjamin Tissoires:
> > > > On Sep 30 2024, Werner Sembach wrote:
> > > > > [...]
> > > > > Thinking about it, maybe it's not to bad that it only changes once udev is
> > > > > ready, like this udev could decide if leds should be used or if it should
> > > > > directly be passed to OpenRGB for example, giving at least some consistency
> > > > > only changing once: i.e. firmware -> OpenRGB setting and not firmware->leds
> > > > > setting->OpenRGB setting.
> > > > That would work if OpenRGB gets to ship the LampArray bpf object (not
> > > > saying that it should). Because if OpenRGB is not installed, you'll get
> > > > a led class device, and if/when OpenRGB is installed, full LampArray
> > > > would be presented.
> > > The idea in my head is still that there is some kind of sysfs switch to
> > > enable/disable leds.
> > FWIW, I'm never a big fan of sysfs. They become UAPI and we are screwed
> > without possibility to change them...
> > 
> > > My idea is then that a udev rule shipped with OpenRGB sets this switch to
> > > disable before loading the BPF driver so leds never get initialized for the
> > > final LampArray device.
> > FWIW, udev-hid-bpf can inject a udev property into a HID-BPF. So
> > basically we can have a udev property set (or not) by openrgb which
> > makes the BPF program decide whether to present the keyboard as
> > LampArray or not.
> > 
> > > > But anyway, BPF allows to dynamically change the behaviour of the
> > > > device, so that's IMO one bonus point of it.
> > > > 
> > > > > > FWIW, the use of BPF only allows you to not corner yourself. If you
> > > > > > failed at your LampArray implementation, you'll have to deal with it
> > > > > > forever-ish. So it's perfectly sensible to use BPF as an intermediate step
> > > > > > where you develop both userspace and kernel space and then convert back
> > > > > > the BPF into a proper HID driver.
> > > > > I don't really see this point: The LampArray API is defined by the HID Usage
> > > > > Table and the report descriptor, so there is not API to mess up and
> > > > > everything else has to be parsed dynamically by userspace anyway, so it can
> > > > > easily be changed and userspace just adopts automatically.
> > > > > 
> > > > > And for this case the proper HID driver is already ready.
> > > > Yeah, except we don't have the fallback LED class. If you are confident
> > > > enough with your implementation, then maybe yes we can include it as a
> > > > driver from day one, but that looks like looking for troubles from my
> > > > point of view.
> > > To be on the safe side that we don't talk about different things: My current
> > > plan is that the leds subsystem builds on top of the LampArray
> > > implementation.
> > I would say that the HID subsystem knows how to translate LampArray into
> > a subset of LEDs. But I think that's what you are saying.
> > 
> > > Like this the leds part has to be only implemented once for all LampArray
> > > devices be it emulated via a driver or native via firmware in the device
> > > itself.
> > yep, that's the plan. However, not sure how to fit LampArray into LED.
> 
> My idea was that all leds just get treated as a singular led only allowing
> to set a singular color and brightness, but I just looked it up again:
> LampArray allows different color and brightness ranges per key, so the
> grouping might not be possible in a sensible way ...

maybe we can use that information to group per "color and brightness"?

> 
> Maybe the leds integration is a bad idea after all and we should just nudge
> the DEs and/or UPower to implement LampArray directly? But that's just
> kicking the complexity down the road, at least as long as there is not
> universal easy to use library (haven't looked into the library build of
> OpenRGB yet).

I think that LED integration is not a bad thing if we can approximate
the keyboard backlight. We might not be able to provide RGB, but at
least some "light up, light down" from the system would certainly make
sense.

FWIW, I know people using libratbag as a CLI to just turn off the LEDs
on their mouse. So we have already users for that exact use case.


[...snipped... (because I don't disagree on the WMI discussion)]

> > > To sum up the architechture (not mutally exclusive technically)
> > > 
> > > /- leds
> > > WMI <- WMI to LampArray Kernel driver <-switch-|
> > >                                                 \- OpenRGB
> > > 
> > > /- leds
> > > WMI <- WMI to Custom HID Kernel driver <- Custom HID to LampArray BPF
> > > driver<-switch-|
> > > \- OpenRGB
> > > 
> > > With the "switch" and "leds" implemented in hid core, automatically
> > > initialized every time a LampArray device pops up (regardless if it is from
> > > native firmware, a bpf driver or a kernel driver)
> > > 
> > > Writing this down I think it was never decided how the switch should look like:
> > > 
> > > It should not be a sysfs attribute of the leds device as the leds device
> > > should disappear when the switch is set away from it, but should it be a
> > > sysfs variable of the hid device? This would mean that hid core needs to add
> > > that switch variable to every hid device having a LampArray section in the
> > > descriptor.
> > Again, not a big fan of the sysfs, because it's UAPI and need root to
> > trigger it (though the udev rule sort this one out).
> > BPF allows already to re-enumerate the device with a different look and
> > feel, so it seems more appropriate to me.
> > 
> > Also, having a sysfs that depends on the report descriptor basically
> > means that we will lose it whenever we re-enumerate it (kind of what the
> > LED problem you mentioned above). So we would need to have a sysfs on
> > *every* HID devices???
> > 
> > Actually, what would work is (ignoring the BPF bikeshedding for Tuxedos
> > HW):
> > - a device presents a report descriptor with LampArray (wherever it
> >    comes from)
> > - hid-led.c takes over it (assuming we extend it for LampArray), and
> >    creates a few LEDs based on the Input usage (one global rgb color for
> >    regular keys, another one for the few other LEDs known to userspace)
> > - when openRGB is present (special udev property), a BPF program is
> >    inserted that only contains a report descriptor fixup that prevent the
> >    use of hid-led.c
> 
> How would that look like? just a custom bit in a "Vendor defined" usage page?

not a vendor (the code will be in the hid selftests once my v3 series is merged[0]):

```
SEC("?struct_ops/hid_rdesc_fixup")
int BPF_PROG(hid_test_driver_probe, struct hid_bpf_ctx *hid_ctx)
{
	hid_ctx->hid->quirks |= HID_QUIRK_IGNORE_SPECIAL_DRIVER;
	return 0;
}

SEC(".struct_ops.link")
struct hid_bpf_ops test_driver_probe = {
	.hid_rdesc_fixup = (void *)hid_test_driver_probe,
};
```

This has basically no overhead, because it's a one time operation, no
change in the event processing.

That code will probably need to be enhanced by comparing a
UDEV_PROP_* static char that udev-hid-bpf fills in when loading the
device.

We can also have a dynamic quirk on the boot cmd line that sets that
quirk, but it just doesn't scale when multiple devices are supported.

> 
> But this is still UAPI just hidden inside a BFP program instead of sysfs.
> But it would avoid the re-enumeration problem.

Yep, completely agree, but that UAPI is not set in stone. It's
controlled by userspace, and if there are no users, we can drop it much
more easily than having a sysfs.

The other advantage of using BPF is you have free re-enumeration of the
device. Because the quirks sysfs API for HID doesn't support it (maybe
we can fix that as well, but I don't see the point given how simple BPF
is).

> 
> > - the device gets re-enumerated, cleaning the in-kernel leds, and only
> >    present the LampArray through hidraw, waiting for OpenRGB to take
> >    over.
> > - at any time we can remove the BPF and restore the LEDs functionality
> >    of hid-led.c
> > 
> > > > > > Being able to develop a kernel driver without having to reboot and
> > > > > > being sure you won't crash your kernel is a game changer ;)
> > > > > > 
> > > > > > Cheers,
> > > > > > Benjamin
> > > Best regards and sorry for the many questions,
> > > 
> > > Werner Sembach
> > > 
> > > PS: on a side node: How does hid core handle HID devices with a broken HID
> > > implementation fixed by bpf, if bpf is loaded after hid-core? Does the hid
> > > device get reinitialized by hid core once the bpf driver got loaded? If yes,
> > > is there a way to avoid side effects by this double initialization or is
> > > there a way to avoid this double initialization, like marking the device id
> > > as broken so that hid core- does not initialize it unless it's fixed by bpf?
> > - broken HID device:
> >    it depends on what you call "broken" HID device. If the report
> >    descriptor is boggus, hid-core will reject the device and will not
> >    present it to user space (by returning -EINVAL).
> >    If the device is sensible in terms of HID protocol, it will present it
> >    to userspace, but the fact that it creates an input node or LED or
> >    whatever just depends on what is inside the report descriptor.
> > 
> > - HID-BPF:
> >    HID-BPF is inserted between the device itself and the rest of the
> >    in-kernel HID stack.
> >    Whenever you load and attach (or detach) a BPF program which has a
> >    report descriptor fixup, HID-core will reconnect the device,
> >    re-enumerate it (calling ->probe()), and will re-present it to
> >    userspace as if it were a new device (you get all uevents).
> > 
> > - double initialization:
> >    nowadays hid-generic doesn't do anything on the device itself except
> >    calling the powerup/powerdown, by calling ->start and ->stop on the
> >    HID transport driver. It's not a problem on 99% of the devices AFAICT.
> >    technically, if the report descriptor is bogus, start/stop won't be
> >    called, but you'll get an error in the dmesg. So if you really want to
> >    rely on that "broken" scenario we can always add a specific quirk in
> >    HID to not spew that error.
> > 
> > Cheers,
> > Benjamin
> > 
> > PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> > all of the requirements here:
> > - need to be dynamic
> > - still unsure of the userspace implementation, meaning that userspace
> >    might do something wrong, which might require kernel changes
> 
> Well the reference implementetion for the arduiono macropad from microsoft
> ignores the intensity (brightness) channel on rgb leds contrary to the HID
> spec, soo yeah you have a point here ...

Heh :)

> 
> > - possibility to extend later the kernel API
> > - lots of fun :)
> 
> You advertise it good ;). More work for me now but maybe less work for me
> later, I will look into it.

Again, I'm pushing this because I see the benefits and because I can
probably reuse the same code on my Corsair and Logitech keyboards. But
also, keep in mind that it's not mandatory because you can actually
attach the BPF code on top of your existing driver to change the way it
behaves. It'll be slightly more complex if you don't let a couple of
vendor passthrough reports that we can use to directly talk to the
device without any tampering, but that's doable. But if you want to keep
the current implementation and have a different layout, this can easily
be done in BPF on top.

Cheers,
Benjamin


[0] https://lore.kernel.org/linux-input/20241001-hid-bpf-hid-generic-v3-0-2ef1019468df@kernel.org/T/#t
