Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E8500B07
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 12:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2F210FCF6;
	Thu, 14 Apr 2022 10:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DE410FCCA;
 Thu, 14 Apr 2022 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649931885; x=1681467885;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4DjFAaATTq19NyQf91mApsE7LnCNGm2y4vS+hVATFUE=;
 b=gffjWbTMwagkwKuZqfOMH/ODpESuUqO8LydZdBabuhpuBLDJhWrbqchf
 xNb/bsCJ0maUeKqqOs5OdKVNYBWBllErBUpW9DeLdUs/oG1ZL72MluA2e
 hOb51Yh5NocIGj3d0LzHGep3qIwhnGtoK0ArP/8xPoTyh5jiM9GiXncif
 LTx6pMAnkLQFHr+qKA/5AIiWRg+jQEsomTOEa5BYivhCjOw28t3IS5Pda
 ZEE4mUBZ6Lii6amZUFIRTtaiOO/teYW4zDL3eAFCiR3zvIFAHMufY4Kmu
 +/GY0yFDxiDtITYSBmIXJ3w3oz5RgHqi8b8S1gbaSw4HQk74yYO23Syeq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="349334770"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="349334770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:24:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="527344830"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:24:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
In-Reply-To: <CADnq5_MAx47Ju7_cOt-8rn3V0zRyH5MZNG_4GY+nUiVw6-+h-A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
 <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
 <CADnq5_MAx47Ju7_cOt-8rn3V0zRyH5MZNG_4GY+nUiVw6-+h-A@mail.gmail.com>
Date: Thu, 14 Apr 2022 13:24:30 +0300
Message-ID: <875yncezdt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Mon, Apr 11, 2022 at 6:18 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 4/8/22 17:11, Alex Deucher wrote:
>> > On Fri, Apr 8, 2022 at 10:56 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> >>
>> >> Hi,
>> >>
>> >> On 4/8/22 16:08, Alex Deucher wrote:
>> >>> On Fri, Apr 8, 2022 at 4:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> >>>>
>> >>>> On Thu, Apr 07, 2022 at 05:05:52PM -0400, Alex Deucher wrote:
>> >>>>> On Thu, Apr 7, 2022 at 1:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> >>>>>>
>> >>>>>> Hi Simon,
>> >>>>>>
>> >>>>>> On 4/7/22 18:51, Simon Ser wrote:
>> >>>>>>> Very nice plan! Big +1 for the overall approach.
>> >>>>>>
>> >>>>>> Thanks.
>> >>>>>>
>> >>>>>>> On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
>> >>>>>>>
>> >>>>>>>> The drm_connector brightness properties
>> >>>>>>>> =======================================
>> >>>>>>>>
>> >>>>>>>> bl_brightness: rw 0-int32_max property controlling the brightness setting
>> >>>>>>>> of the connected display. The actual maximum of this will be less then
>> >>>>>>>> int32_max and is given in bl_brightness_max.
>> >>>>>>>
>> >>>>>>> Do we need to split this up into two props for sw/hw state? The privacy screen
>> >>>>>>> stuff needed this, but you're pretty familiar with that. :)
>> >>>>>>
>> >>>>>> Luckily that won't be necessary, since the privacy-screen is a security
>> >>>>>> feature the firmware/embedded-controller may refuse our requests
>> >>>>>> (may temporarily lock-out changes) and/or may make changes without
>> >>>>>> us requesting them itself. Neither is really the case with the
>> >>>>>> brightness setting of displays.
>> >>>>>>
>> >>>>>>>> bl_brightness_max: ro 0-int32_max property giving the actual maximum
>> >>>>>>>> of the display's brightness setting. This will report 0 when brightness
>> >>>>>>>> control is not available (yet).
>> >>>>>>>
>> >>>>>>> I don't think we actually need that one. Integer KMS props all have a
>> >>>>>>> range which can be fetched via drmModeGetProperty. The max can be
>> >>>>>>> exposed via this range. Example with the existing alpha prop:
>> >>>>>>>
>> >>>>>>>     "alpha": range [0, UINT16_MAX] = 65535
>> >>>>>>
>> >>>>>> Right, I already knew that, which is why I explicitly added a range
>> >>>>>> to the props already. The problem is that the range must be set
>> >>>>>> before registering the connector and when the backlight driver
>> >>>>>> only shows up (much) later during boot then we don't know the
>> >>>>>> range when registering the connector. I guess we could "patch-up"
>> >>>>>> the range later. But AFAIK that would be a bit of abuse of the
>> >>>>>> property API as the range is intended to never change, not
>> >>>>>> even after hotplug uevents. At least atm there is no infra
>> >>>>>> in the kernel to change the range later.
>> >>>>>>
>> >>>>>> Which is why I added an explicit bl_brightness_max property
>> >>>>>> of which the value gives the actual effective maximum of the
>> >>>>>> brightness.
>> >>>>
>> >>>> Uh ... I'm not a huge fan tbh. The thing is, if we allow hotplugging
>> >>>> brightness control later on then we just perpetuate the nonsense we have
>> >>>> right now, forever.
>> >>>>
>> >>>> Imo we should support two kinds of drivers:
>> >>>>
>> >>>> - drivers which are non-crap, and make sure their backlight driver is
>> >>>>   loaded before they register the drm_device (or at least the
>> >>>>   drm_connector). For those we want the drm_connector->backlight pointer
>> >>>>   to bit static over the lifetime of the connector, and then we can also
>> >>>>   set up the brightness range correctly.
>> >>>>
>> >>>> - funny drivers which implement the glorious fallback dance which
>> >>>>   libbacklight implements currently in userspace. Imo for these drivers we
>> >>>>   should have a libbacklight_heuristics_backlight, which normalizes or
>> >>>>   whatever, and is also ways there. And then internally handles the
>> >>>>   fallback mess to the "right" backlight driver.
>> >>>>
>> >>>> We might have some gaps on acpi systems to make sure the drm driver can
>> >>>> wait for the backlight driver to show up, but that's about it.
>> >>>>
>> >>>> Hotplugging random pieces later on is really not how drivers work nowadays
>> >>>> with deferred probe and component framework and all that.
>> >>>>
>> >>>>>> I did consider using the range for this and updating it
>> >>>>>> on the fly I think nothing is really preventing us from
>> >>>>>> doing so, but it very much feels like abusing the generic
>> >>>>>> properties API.
>> >>>>>>
>> >>>>>>>> bl_brightness_0_is_min_brightness: ro, boolean
>> >>>>>>>> When this is set to true then it is safe to set brightness to 0
>> >>>>>>>> without worrying that this completely turns the backlight off causing
>> >>>>>>>> the screen to become unreadable. When this is false setting brightness
>> >>>>>>>> to 0 may turn the backlight off, but this is not guaranteed.
>> >>>>>>>> This will e.g. be true when directly driving a PWM and the video-BIOS
>> >>>>>>>> has provided a minimum (non 0) duty-cycle below which the driver will
>> >>>>>>>> never go.
>> >>>>>>>
>> >>>>>>> Hm. It's quite unfortunate that it's impossible to have strong guarantees
>> >>>>>>> here.
>> >>>>>>>
>> >>>>>>> Is there any way we can avoid this prop?
>> >>>>>>
>> >>>>>> Not really, the problem is that we really don't know if 0 is off
>> >>>>>> or min-brightness. In the given example where we actually never go
>> >>>>>> down to a duty-cycle of 0% because the video BIOS tables tell us
>> >>>>>> not to, we can be certain that setting the brightness prop to 0
>> >>>>>> will not turn of the backlight, since we then set the duty-cycle
>> >>>>>> to the VBT provided minimum. Note the intend here is to only set
>> >>>>>> the boolean to true if the VBT provided minimum is _not_ 0, 0
>> >>>>>> just means the vendor did not bother to provide a minimum.
>> >>>>>>
>> >>>>>> Currently e.g. GNOME never goes lower then something like 5%
>> >>>>>> of brightness_max to avoid accidentally turning the screen off.
>> >>>>>>
>> >>>>>> Turning the screen off is quite bad to do on e.g. tablets where
>> >>>>>> the GUI is the only way to undo the brightness change and now
>> >>>>>> the user can no longer see the GUI.
>> >>>>>>
>> >>>>>> The idea behind this boolean is to give e.g. GNOME a way to
>> >>>>>> know that it is safe to go down to 0% and for it to use
>> >>>>>> the entire range.
>> >>>>>
>> >>>>> Why not just make it policy that 0 is defined as minimum brightness,
>> >>>>> not off, and have all drivers conform to that?
>> >>>>
>> >>>> Because the backlight subsystem isn't as consistent on this, and it's been
>> >>>> an epic source of confusion since forever.
>> >>>>
>> >>>> What's worse, there's both userspace out there which assumes brightness =
>> >>>> 0 is a really fast dpms off _and_ userspace that assumes that brightness =
>> >>>> 0 is the lowest setting. Of course on different sets of machines.
>> >>>>
>> >>>> So yeah we're screwed. I have no idea how to get out of this.
>> >>>
>> >>> Yes, but this is a new API.  So can't we do better?  Sure the old
>> >>> backlight interface is broken, but why carry around clunky workarounds
>> >>> for new interfaces?
>> >>
>> >> Right we certainly need to define the behavior of the new API
>> >> clearly, so that userspace does not misuse / misinterpret it.
>> >>
>> >> The intend is for brightness=0 to mean minimum brightness
>> >> to still be able to see what is on the screen. But the problem
>> >> is that in many cases the GPU driver directly controls a PWM
>> >> output, no minimum PWM value is given in the video BIOS tables
>> >> and actually setting the PWM to 0% dutycycle turns off the
>> >> screen.
>> >
>> > Sure.  So have the GPU driver map 0 to some valid minimum if that is
>> > the case or might be the case.  If bugs come up, we can add quirks in
>> > the GPU drivers.
>>
>> The problem is that when 0% duty-cycle is not off, but minimum
>> brightness because there is some smart backlight-controller involved
>> downstream of the pwm, then of we limit it to say min 5% then we
>> have just limited the range of the brightness. GNOME already does
>> this in userspace now and it is already receiving bug-reports
>> from users that GNOME does not allow the brightness to go as low
>> as they like to have it in a dark(ish) room.
>>
>> And in some cases 5% is likely not enough for the backlight to
>> actually turn on. So it will be wrong in one direction on some
>> devices and wrong in the other direction in other devices.
>>
>> Which means that to satisfy everyone here we will need a ton
>> of quirks, much too many to maintain in the kernel IMHO.
>>
>>
>> >> So we can only promise a best-effort to make brightness=0
>> >> mean minimum brightness, combined with documenting that it
>> >> may turn off the backlight and that userspace _must_ never
>> >> depend on it turning off the backlight.
>> >>
>> >> Also note that setting a direct PWM output to duty-cycle 0%
>> >> does not guarantee that the backlight goes off, this may be
>> >> an input for a special backlight LED driver IC like the
>> >> TI LP855x series which can have an internal lookup
>> >> table causing it to actually output a minimum brightness
>> >> when its PWM input is at 0% dutycycle.  So this is a case
>> >> where we just don't get enough info from the fw/hw to be able
>> >> to offer the guarantees which we would like to guarantee.
>> >
>> > So set it to a level we can guarantee can call it 0.  If we have the
>> > flag we are just punting on the problem in my opinion.
>>
>> Right this an impossible problem to solve so the intent is indeed
>> to punt this to userspace, which IMHO is the best thing we can do
>> here.  The idea behind the "bl_brightness_0_is_min_brightness:
>> ro, boolean" property is to provide a hint to userspace to help
>> userspace deal with this (and if userspace ends up using e.g.
>> systemd's hwdb for this to avoid unnecessary entries in hwdb).
>>
>> >  The kernel
>> > driver would seem to have a better idea what is a valid minimum than
>> > some arbitrary userspace application.
>>
>> If the kernel driver knows the valid minimum then it can make 0
>> actually be that valid minimum as you suggest and it can set the
>> hint flag to let userspace know this. OTOH there are many cases
>> where the kernel's guess is just as bad as userspace's guess and
>> there are too many laptops where this is the case to quirk
>> ourselves out of this situation.
>>
>> > Plus then if we need a
>> > workaround for what is the minimum valid brightness, we can fix it one
>> > place rather than letting every application try and fix it.
>>
>> I wish we could solve this in the kernel, but at least on
>> laptops with Intel integrated gfx many vendors don't bother
>> to put a non 0 value in the minimum duty-cycle field of the
>> VBT, so there really is no good way to solve this.
>
> We have similar issues with AMD platforms.  Some platforms don't
> populate the min value tables, but in the driver we set the minimum
> safe value as the default min value when that happens.  It may not
> always go as low as the platform may be capable of, but at least we
> have consistent behavior and it's all controlled in one place.
>
>>
>> If the userspace folks ever want to do a database for this,
>> I would expect them to do something with hwdb + udev which
>> can then be shared between the different desktop-environments.
>
> So why not do it in the kernel?  At least that way everyone will get
> it the fixes as they happen.  A big user database may or may not
> happen and behavior will be inconsistent across desktop environments
> until that does.  I don't really see any value in having the flag.
> There will be cases where the flag is wrong and will require kernel
> fixes anyway (e.g., OEM switches panel due to supply chain issues and
> forgets to update the vbios, etc.), so why not just define 0 as
> minimum safe backlight value?  If it's too low and flickers or turns
> the backlight off, we quirk it.  If a particular platform can go
> lower, we can quirk it.  If we add the flag then we need to not only
> add quirks for the minimum value, but we also have to deal with quirks
> for when the flag is set wrong.  So now we are maintaining two quirks
> instead of one.

Just chiming in, there are certainly plenty of panels and designs where
0 PWM duty cycle is physically not possible, and thus 0 brightness
simply can't universally mean off.

Daniel referred to a case where 0 brightness was used as fast mini dpms
off, and I think it's fundamentally a broken use case. We can't
guarantee to be able to support that. I think the appeal was partly in
being able to do it without access to kms api, quick and dirty via
sysfs.

Please let's just make 0 the minimum but not off. If you want off, you
do modeset, and the driver can follow panel timings etc.

I think that's also something the kernel can actually guarantee, while
we can't guarantee 0 is off.


BR,
Jani.




-- 
Jani Nikula, Intel Open Source Graphics Center
