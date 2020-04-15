Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87A1A9A0C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 12:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B696E945;
	Wed, 15 Apr 2020 10:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9C389885
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586945480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4b91avoRTXyA2WlNjsmEm/JXTtNJyMdcXUzTOOAZjyo=;
 b=I3rrQdRe/YjrFG+de1kHqTV7Q3InvuqjgHhFQH7Er2joOqQT1Y0vZ5LcThEDXCDlfXjaZc
 lh67UvMnzqa4cthMbM7TDGQa5yseRH7lCqehiJz7k/FmsocNdb3BBcZ0pt8UegAGLB2n4U
 xh74LjiHvCzBDMYv4bhOO9g63i12MvI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-fkaSC1OyNNuMyHIloKqfxA-1; Wed, 15 Apr 2020 06:11:18 -0400
X-MC-Unique: fkaSC1OyNNuMyHIloKqfxA-1
Received: by mail-wm1-f71.google.com with SMTP id c196so2841065wmd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 03:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4b91avoRTXyA2WlNjsmEm/JXTtNJyMdcXUzTOOAZjyo=;
 b=RVhKKXo4C3hhtRpruAOjyrgXDVVwQ8WYmANs69UVcWQbs7a2fhHl234V0XvKlMhM6L
 tXsvbaMEYGpUS6lwcr6tOSWOOhirynmeAJyldvn981qUUrPWG7llNtzeuOSjpnBWuZNN
 /xzO7/zSsmyylrSAwyuKPhV2ZrsxnSkQ433k90Z+rxkBGJ0fbmyyKGpH/CI886WirJUW
 O9kmZ3kNFLqNWppbzVTHEzxJUPNHHi1j9SpHbhvTVeSlQlX1uiFJGPFldaYb8+4I7TOi
 uUDHex6mlM3iYRThdlAGBhfESMZ66M89q467irKkn6Hy1tUMYKkl+WSW1eOCQu5LjwDU
 fhgw==
X-Gm-Message-State: AGi0PuZMC7QsSPUjBOIFCOhGlYe6iVuzNLl25CxXsfWGcQMPUuZn2wVi
 XiCKWkJ0xrFzgGhHyuVhV2v5bfo8dgny2Gz8yKkrVPPZ6Crx29ex0qNGnOwKU+C4AqCRCV0YkqR
 5Dw9EEY9BDrNr6KHxQpYvJflBYr1T
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr4175241wmg.147.1586945477347; 
 Wed, 15 Apr 2020 03:11:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLrWZjzzT474oA/nImBqgTqHm6+Guqca4AdycBSiOVfdeuKsHdFxnFOFhz2FKEcgVkX9gKVTw==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr4175200wmg.147.1586945476918; 
 Wed, 15 Apr 2020 03:11:16 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id j124sm21997515wmb.25.2020.04.15.03.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 03:11:16 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Daniel Vetter <daniel@ffwll.ch>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
Date: Wed, 15 Apr 2020 12:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/15/20 11:52 AM, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 11:42 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Somewhat long mail, so I've divided it into "chapters", sorry.
>>
>> 1. Back ground info
>> -------------------
>>
>> First some quick background, some recent Lenovo models have
>> a builtin privacy screen which can be turned on/off in software
>> and the kernel recently has gotten support for this:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=110ea1d833ad291272d52e0a40a06157a3d9ba17
>>
>> We have been looking into adding support for this to GNOME,
>> but the userspace API added by the above commit is very
>> Thinkpad specific, and we would rather not rely on an
>> userspace API which is specific to 1 series of laptops.
>>
>> When we started discussing this I had already seen some versions
>> of Rajat's "drm/i915 Support for integrated privacy screen" series:
>>
>> https://patchwork.freedesktop.org/series/74650/
>>
>> Which adds support for integrated privacy screens
>> as a drm-connector property. Anyone who has been involved
>> in the backlight brightness control saga we have with
>> the sysfs backlight class instantly knows/feels that
>> this is the right way to handle this.
>>
>> So now we want to export the Thinkpad lcdshadow
>> attribute as a drm-connector property.
>>
>>
>> 2. Problem + Possible solutions
>> -------------------------------
>>
>> The problem is that the code to get/set the lcdshadow
>> setting and also the code to listen for firmware (hardcoded
>> hotkeys) triggered state changes all lives inside the thinkpad_acpi
>> driver; and to export the lcdshadow setting as a drm property
>> we need to access that code (and it is too big to just copy
>> over).
>>
>> One thing which makes this trickier is that all properties must
>> be attached to the connector before it is registered, we cannot
>> add it at a later time.
>>
>> I see 3 possible solutions here:
>>
>> i. Export some symbols from thinkpad_acpi and directly call these
>> from drm_connector_create_standard_properties and other
>> drm_connector functions if the thinkpad_acpi module is enabled.
>> Note this should be done in the core drm_connector functions since
>> the GPU might be one of i915 / amdgpu / nouveau. I believe that
>> it is clear that this solution is not very elegant.
>>
>> A variant of this would be to have a separate helper module
>> (probaly a few static inlines in a .h) which exports some hooks for
>> i915 / amdgpu / nouveau to call this way we at least keep the
>> ugliness out of the core and keep the module-dep on thinkpad_acpi
>> limited to the i915 / amdgpu / nouveau modules. This might
>> actually not be too bad, except that currently the thinkpad_acpi
>> module refuses to load on non thinkpads...
>>
>>
>> ii. Currently the "privacy-screen" property added by Rajat's
>> patch-set is an enum with 2 possible values:
>> "Enabled"
>> "Disabled"
>>
>> We could add a third value "Not Available", which would be the
>> default and then for internal panels always add the property
>> so that we avoid the problem that detecting if the laptop has
>> an internal privacy screen needs to be done before the connector
>> is registered. Then we can add some hooks which allow an
>> lcdshadow-driver to register itself against a connector later
>> (which is non trivial wrt probe order, but lets ignore that for now).
>>
>>
>> iii. We can add a generic framework to allow drivers outside
>> of the drm-subsys to register something drm_property(ish) specifying
>> a dev_name() and connector-name to which to attach the property
>> when that connector gets created on that device.
>>
>> This requires the driver registering this property to be fully
>> loaded before the connector gets registered.
> 
> iv. What every SoC subsystem does:
> 
> - lcdshadow drivers register drivers
> - drm drivers look them up
> - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
> the entire thing is assembled.
> 
> That's what we're doing already for other standardized components like
> drm_bridge or drm_panel, and I think that's also the right approach
> for backlight and anything else like that. Hand-rolling our own
> EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
> to real pain. Also, with EPROBE_DEFER we have one standard way of
> building a driver from component, which spans subsystems and is also
> the underlying magic that makes stuff like component.c work.

On the SoCs we have devicetree telling us what components there
are, so we can wait for them to show up. The only way to figure out
if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
or duplicating a lot of code from thinkpad_acpi. Edit:
also see below for a possible solution.

> Wrt the actual userspace interface, I think the drm core should handle
> this as much as possible. Same way we let drm core handle a lot of the
> atomic property stuff, to make sure things are standardized.

Agreed.


> So
> 
> - add an lcdshadow pointer to struct drm_connector
> - implement the property glue code in drm core completely, at least
> for the read side
> - for the write side we might want to have some drm wrappers drivers
> can call to at the appropriate times to e.g. restore privacy screen
> settings when the panel gets enabled. In case that's needed.
> 
> Also one thing that the EPROBE_DEFER stuff forces us to handle
> correctly is to track these depencies. That's the other nightmare in
> backlight land, essentially you have no idea of knowing (in userspace)
> whether the backlight driver you want is actually loaded, resulting in
> lots of fun. The kernel is the only thing that can know, and for hw
> that's built-in there's really no excuse to not know. So a model where
> stuff gets assembled after drm_dev_register() is imo just plain buggy.
> 
> This means that the lcdshadow subsystem needs to have some idea of
> whether it needs a driver, so that it can correctly differentiate
> between EPROBE_DEFER and ENOENT error cases. In the latter the driver
> should continue loading ofc.

Right, so how would the lcdshadow subsystem do this? The only way
would be for it to say try and modprobe thinkpad_acpi from its
core init function (if thinkpad_acpi is enabled).  IOW it is the usual
x86 mess.  I guess we could have something like this in a theoretical
to be added lcdshadow subsystem:

/* Add comment explaining why we need this messy stuff here */
const char * const shadow_providers[] = {
#ifdef CONFIG_THINKPAD_ACPI_MODULE
	"thinkpad_acpi",
#endif
#ifdef CONFIG_OTHER_MODULE
	"other",
#endif
	NULL
};

int module_init(void)
{
	/* do actual setup of the ?class? */

	for (i = 0; shadow_providers[i]; i++)
		request_module(shadow_providers[i]);

	return 0;
}

And then simply have the function which gets a lcd_shadow provider
provide -ENOENT if there are none.

One problem here is that this will work for modules since
the drm-core will depend on modules from the lcdshadow-core,
so the lcdshadow-core module will get loaded first and will
then try to load thinkpad_acpi, which will return with -ENODEV
from its module_init on non ThinkPads. We could even put the
request_module loop in some other init_once function so that
things will also work when the lcdshadow-core is builtin.

But how do we ensure that thinkpad_acpi will get to register
its lcdshadow before say i915 gets probed if everything is builtin?

I guess my SOFTDEP solution has the same issue though. Do you
know has this is dealt with for kvmgt ?

Regards,

Hans



>> 3. Picking a solution
>> ---------------------
>>
>> i. is just ugly, full stop, but also very KISS which still makes
>> it somewhat appealing. Also i. does not scale if we get other
>> vendor specific interfaces for interacting with these
>> privacy screens.
>>
>>
>> ii. is ugly from an userspace API pov, if there is no
>> "privacy-screen" then we really should not have the property at
>> all rather then setting it to "Not Available". Still it might be
>> an acceptable compromise I guess
>>
>>
>> iii. is/was the one I liked, until I started looking at the
>> drm_connector code and saw that all properties must be attached
>> before registering the connector, bummer. Then this morning I
>> remembered that the i915 driver has a similar issue with the
>> gvt stuff / the kvmgt module. The kvmgt module must be loaded
>> and fully initialized before the i915 driver loads. This has
>> been solved with module softdeps.
>>
>> I think that we can do the same here having either the
>> i915+nouveau+amdgpu drivers; or the drm-core have a softdep on
>> thinkpad_acpi so that it can register the lcdshadow property
>> with the to-be-written framework for externally managed props
>> before the internal panels drm-connector gets created.
>>
>> This also allows the thinkpad_acpi module_init function to
>> return -ENODEV on non Thinkpad devices, so that it will
>> not take up memory, where as with i. we would always need to
>> have it in memory.
>>
>> I'm currently leaning towards iii. combined with using
>> MODULE_SOFTDEP("pre: thinkpad_acpi") to make sure the thinkpad_acpi
>> driver can do its thing before the internal display connector gets
>> created.
>>
>> Daniel (and others) does this (iii. + softdeps) sound like
>> something which might be acceptable (I know it will also
>> depend on the resulting code implementing this idea) ?
>>
>> Any other ideas / suggestions are appreciated here.
>>
>> Regards,
>>
>> Hans
>>
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
