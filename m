Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E921AB201
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 21:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F9A6E28E;
	Wed, 15 Apr 2020 19:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485696E28E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 19:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586980242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXUXNnfsKhMFRRX2Sgubszu/SjdxpttJB4bik9hgEl8=;
 b=fk+5TaBSYb2yz4T6Lx6al1ojjLx+jj1oAcbtbxAF8V8qeYnp3AzcgxmV6ndkKprRkSZRIq
 qXPP1DRYcJLQ1RhOBiF/mIidZBl0/6WRiDCiNbGqo9XJK4f+Dr0S+Yi9akGBhvQRgDFzmA
 R8XTB+c++Cj1zs/Qu/MfkoCyusfSo4c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-boiY2bKbMoe-LJdsDKbUpg-1; Wed, 15 Apr 2020 15:50:38 -0400
X-MC-Unique: boiY2bKbMoe-LJdsDKbUpg-1
Received: by mail-wr1-f70.google.com with SMTP id j12so474759wrr.18
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eXUXNnfsKhMFRRX2Sgubszu/SjdxpttJB4bik9hgEl8=;
 b=YS/WX7rrGoZnsNb2UhDUeWFsuELKvYQVaTF6KQemP/v0/otrtjiGNzpQBra7hhSak2
 XI+fYbrUX10TUYiW3Etm+DPS+our6ssZK6wtgjbXH7DKh89IWxD8/ejR5k1LnUUQDRfd
 FTevKlKLuvSwhTKAOzTjjmW9sUT1W28UctcuSYgLlVHxgV/rZYf/S4sIwUA9tnyRmdKq
 bl+vxgHF7VPI6t4V3GIprmwBn+LAYZW7buoOkC4sC26fgn5uT/kpME5RW6E38mnEDuyX
 rpUShjHRPaziqTPdFhIzVcoaBzEvbrKAxiOTkJ1Njsx9glyRouvnBIv9MmI8u2uB0Dt6
 t1xw==
X-Gm-Message-State: AGi0PuaNRgkWi3VSd/hBniHMU2k06K3Mk/Fvkt1aRZymb32wGdKmSWfg
 wRcaj+EHxt0CfiYpy1J8P+BxFPMQiYYOjG7MTJ6gmXPJGNRIW/N+H1UUPp/LGArJN2pQWm31Cx1
 VdIW4cYYWtYhSdr8swROKqABceNRL
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr813986wmh.157.1586980236953; 
 Wed, 15 Apr 2020 12:50:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypLhCoJBZIxv0k9tJiSUNcyq9sStAbQXnr3ZpKvqQDxJzvTsSAXnorEOh/AgAV+cJpDBYdrzwg==
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr813951wmh.157.1586980236527; 
 Wed, 15 Apr 2020 12:50:36 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id z10sm22490732wrg.69.2020.04.15.12.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 12:50:35 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Daniel Vetter <daniel@ffwll.ch>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
 <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
 <CAKMK7uESUVHLwMDujCDvapOBZ+Lnp1k-5juxQxcsNj+1QuN0Ww@mail.gmail.com>
 <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
 <20200415120135.GB3456981@phenom.ffwll.local>
 <794191aa-e92d-d44c-f4ff-72fd6c9bf0e7@redhat.com>
 <20200415175423.GJ3456981@phenom.ffwll.local>
 <58012f16-1fce-122b-3818-b18d421ed87e@redhat.com>
 <CAKMK7uFcvcMopZPyj2P5RDr+TgVC5LCwdccM6+XAPenP55QKUQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <61bb8500-64c5-9381-fdd9-8dba4d4e290c@redhat.com>
Date: Wed, 15 Apr 2020 21:50:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFcvcMopZPyj2P5RDr+TgVC5LCwdccM6+XAPenP55QKUQ@mail.gmail.com>
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

On 4/15/20 8:29 PM, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 8:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 4/15/20 7:54 PM, Daniel Vetter wrote:
>>> On Wed, Apr 15, 2020 at 03:02:53PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 4/15/20 2:01 PM, Daniel Vetter wrote:
>>>>> On Wed, Apr 15, 2020 at 01:39:23PM +0200, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 4/15/20 12:22 PM, Daniel Vetter wrote:
>>>>>>> On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 4/15/20 11:52 AM, Daniel Vetter wrote:
>>>>>>
>>>>>> <snip>
>>>>>>
>>>>>>>>> iv. What every SoC subsystem does:
>>>>>>>>>
>>>>>>>>> - lcdshadow drivers register drivers
>>>>>>>>> - drm drivers look them up
>>>>>>>>> - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
>>>>>>>>> the entire thing is assembled.
>>>>>>>>>
>>>>>>>>> That's what we're doing already for other standardized components like
>>>>>>>>> drm_bridge or drm_panel, and I think that's also the right approach
>>>>>>>>> for backlight and anything else like that. Hand-rolling our own
>>>>>>>>> EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
>>>>>>>>> to real pain. Also, with EPROBE_DEFER we have one standard way of
>>>>>>>>> building a driver from component, which spans subsystems and is also
>>>>>>>>> the underlying magic that makes stuff like component.c work.
>>>>>>>>
>>>>>>>> On the SoCs we have devicetree telling us what components there
>>>>>>>> are, so we can wait for them to show up. The only way to figure out
>>>>>>>> if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
>>>>>>>> or duplicating a lot of code from thinkpad_acpi. Edit:
>>>>>>>> also see below for a possible solution.
>>>>>>>
>>>>>>> Yup it sucks. I think all we can do is have a small acpi match
>>>>>>> function (which yes will duplicate some of the thinkpad_acpi driver
>>>>>>> logic) to re-create that information and give us a "should we have a
>>>>>>> lcdshadow driver for this $pci_device" answer.
>>>>>>
>>>>>> Ok, so questions about this solution:
>>>>>>
>>>>>> 1. Where should that match-function live ?
>>>>>>
>>>>>> 2. An acpi_thinkpad derived match-function will only be able to
>>>>>>       answer if there is an lcdshadow device/driver for the internal
>>>>>>       panel. It will not be able to tie this info to a certain PCI
>>>>>>       device. My plan is to pass NULL as dev_name when registering
>>>>>>       the lcdshadow-device and have lcdshadow_get(dev, <connector-name>)
>>>>>>       skip device-name matching (consider everything a match) for
>>>>>>       lcdshadow-devices registered with NULL as dev_name.
>>>>>>
>>>>>>       So I guess in this case the mini match function should just
>>>>>>       ignore the passed in device?
>>>>>
>>>>> Yeah I think we can't really avoid that. I also expect that we'll need
>>>>> ACPI and dt versions of this, and driver needs to know which one to call.
>>>>> Since at least in a dt world the driver knows exactly for which dt node it
>>>>> needs a lcdshadow driver for (with the phandle stuff), so we can be a lot
>>>>> more strict.
>>>>>
>>>>> For the acpi version I'm not even sure we can do more than provide the
>>>>> struct device * pointer of the gpu. I think if we ever get more than 1
>>>>> lcdshadow driver on acpi systems we can add more stuff later on, for now
>>>>> I'd just leave that out.
>>>>>
>>>>> So maybe
>>>>>
>>>>> acpi_lcdshadow_get(struct device *dev);
>>>>>
>>>>> of_lcdshadow_get(struct device_node *np);
>>>>>
>>>>> And with maybe a future plan to add some kind of enum or whatever to
>>>>> acpi_lcdshadow_get(). Both would return either the lcdshadow pointer, or
>>>>> an PTR_ERR() so that we could encode EPROBE_DEFER vs ENOENT.
>>>>
>>>> Ok, note I plan to only implement the acpi version for now, I do
>>>> expect some non ACPI/x86 devices to show up with his feature
>>>> eventually but I believe it is best to implement this once
>>>> those actually show up. Esp. since this will also involve adding
>>>> some devicetree bindings for this.
>>>
>>> ofc, just wanted to lay out the entire thing. The DT version needs some
>>> good bikeshed on the dt schema first anyway (so that the helper can decode
>>> that directly).
>>>
>>>>> We might also want a low-level lcdshadow_get() which only returns ENOENT
>>>>> when the driver isn't there, and which leaves "do we really need one?" to
>>>>> higher levels to answer.
>>>>
>>>> Right, so my latest idea on that is indeed a high-level lcdshadow_get()
>>>> which takes a struct device * and a connector-name and which never
>>>> returns EPROBE_DEFER.
>>>>
>>>> As for leaving things to the higher levels to answer, as explained
>>>> in my other follow-up email I think that we should probably add a
>>>> lcdshadow_probe_defer() helper for this and call that early on
>>>> in the PCI-driver probe functions for the 3 major x86 GPU drivers.
>>>> Does that sound ok to you?
>>>
>>> Uh ... not pretty. There's still a lifetime problem that strictly speaking
>>> there's nothing stopping the other driver from getting unloaded between
>>> your _probe_defer and the subsequent _get. I think fixing this properly
>>> (and screaming a bit at the error code, oh well) is better.
>>
>> I would really like to separate the discussion and the work
>> on getting the 3 major x86 GPU drivers ready to deal with EPROBE_DEFER
>> from the lcdshadow discussion and work.  I expect getting these
>> 3 drivers ready for EPROBE_DEFER is going to be a major undertaking
>> and I would like avoid introducing this significant scope creep
>> to the lcdshadow discussion, because it simply is a too big undertaking
>> to undertake without us getting a significant amount of manpower
>> specifically for this from somewhere.
>>
>> Note I do agree with you that getting these 3 drivers ready
>> for EPROBE_DEFER handling is a worthwhile undertaking, but
>> it simply will take too much extra time and as such IMHO it
>> really is out of scope for the lcdshadow stuff.
>> I expect the amount of work (esp. also dealing with testing
>> and regressions) for the EPROBE_DEFER project by itself
>> to be a lot *more* work then the actual lcdshadow project.
>>
>> So going with the assumption/decision that adding proper
>> EPROBE_DEFER handling to these 3 drivers is out of scope,
>> I believe that adding a lcdshadow_probe_defer() helper is
>> an ok solution/workaround for now.
>>
>> As for your case of the other driver getting unloaded in between
>> the check and use of it, that can only happen by explicit user
>> action and in that case the worst thing what will happen
>> is the "privacy-screen" property missing from the connector,
>> which in that case is more or less exactly what the user
>> asked for.
> 
> For i915 we've had patches, for mei-hdcp integration. Until it became
> clear that the mei subsystem is bonkers, and handles suspend/resume by
> unloading! drivers.
> 
> Which forced i915 to unload and broke the world :-/
> 
> So at least for i915 the work should be done already, and just amount
> to updating the patches Ram already had. No ideas about the other 2.

Ok.

> What I don't really want is an interface with races. So if fixing the
> other drivers is too much work, what we could do is roughly:
> 
> - in the top-level probe function to an acpi_lcdshadow_get. This might
> fail with EPROBE_DEFER.
> - this gives us a dangling reference, but we can drop that one when we
> exit the top-level probe function (both on success and on error cases)
> - the 2nd acpi_lcdshadow_get call deep down should always succeed at
> that point (since the top level holds a reference), so you could wrap
> that in a WARNING(IS_ERR_PTR()). Ok that's a lie, if we concurrently
> unload then the 2nd call still fails (the reference can never prevent
> a hotunbind in the linux kernel device model), so this is exactly as
> buggy as your version, so still needs a comment about that.
> 
> Adding a acpi_lcdshadow_probe_defer() function otoh just gives people
> the impression that that's actually a correct way of doing this.
> 
> Then it's up to the driver maintainers whether they're ok with the
> above hack of a fake reference, or not. As I said, I think for i915 it
> should be fairly ok to just roll it out, but maybe the patches don't
> apply at all anymore.

Ok trying to taking a ref early on and handling EPROBE_DEFER
at that first attempt to take a ref works for me. So lets go with
that. I will try to whip up a v1 patch-set for this, ETA aprox.
1-2 weeks I guess.

> btw to make everything work you also need to set up a device_link
> between the lcdshadow device (and it's driver, that's the more
> important thing) and the gpu device. That device link will make sure
> that
> - suspend/resume is done in the right order
> - driver load/unload is done in the right order, i.e. unloading of the
> lcdshadow driver will automatically force an unbind of the gpu driver
> first.

That is an interesting idea, but that does assume that their
is an actual struct device which the code handling the lcdshadow
binds to, which in case of thinkpad_acpi is not really the case.

Anyways passing in a parent device when registering a lcdshadow_dev
seems like a good idea and we can do the device_link thing if the parent
is non NULL.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
