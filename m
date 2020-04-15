Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21111AB078
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 20:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A816E105;
	Wed, 15 Apr 2020 18:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3726E105
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 18:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586974759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBX5zwY+J/EKXGAGN+5Np9ZXlGpGNbFy2MGDlDZjZN8=;
 b=UdTwpfH91D7OkaU7H8XXzS2HRa31rjP13obrhtA/+5TU7RJHX+Q6QJ6DWz+5piKU8eDobJ
 E6Hv+BYuNA7akwhrnSk2MI+rWg4xKoWc2vWEMbiSP14lKuHWKca/wYlMn0Kl0AtxBOIxZA
 2gBufK94TPcIzV9p3JWLDp5ReYM9h2Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-dcTU_sL5PQWdn5XzqFlf6w-1; Wed, 15 Apr 2020 14:19:14 -0400
X-MC-Unique: dcTU_sL5PQWdn5XzqFlf6w-1
Received: by mail-wm1-f71.google.com with SMTP id n127so209339wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IBX5zwY+J/EKXGAGN+5Np9ZXlGpGNbFy2MGDlDZjZN8=;
 b=H+4CJg+tjWmb6bG2ezVe9T6C7rSJHXejiDOg+5mk8cpBphFSPekfbcBNR77FaQOBhE
 DjRY8A2DstWACJSrEje0bqX4uuW3lvo2UbCW766cPbeGKMu2wGIQwSOWCsCnMuRfGunO
 g+0PPHOOlB3BgRjZp1gE7V0828yedS8oW8YUmRL42ruPkYpYLP2QwNW+YKG6SZudQbjG
 s4CdF3iScTlF94lzu/Kzlh42zTkMhuloOKb0RN9VPpc52HXFhBH8kvMrOghSzDIxoZBo
 1RPW+hdShv3QuK4GAgwndunkPuvrH3vaGxLB9RzG2ij7CHPIpJJz9uXEIwp72AqdN8tS
 jEJQ==
X-Gm-Message-State: AGi0PubrUfOIE/syx7a410gSmdE6E0HrQeukfLpHXQNdkZtuLmYwU1Es
 hxuOl6kwyHNTnyydUa0ZPtvVZH85HuDMg+I+MbE+jLRMzbelccIHoR9X76U+bbjCw2AOmPslMp0
 0+IUHFXLbqiBHe/R80Y3BI7lBCyzo
X-Received: by 2002:adf:fa04:: with SMTP id m4mr29946704wrr.30.1586974753482; 
 Wed, 15 Apr 2020 11:19:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypJj3QTwhcNeJfTNKToEEc12Dhv7ubsNgrFGFgNCZhxmNAnVzAZq/6BlNqIUWV0lpAfqCJfNnA==
X-Received: by 2002:adf:fa04:: with SMTP id m4mr29946677wrr.30.1586974753180; 
 Wed, 15 Apr 2020 11:19:13 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id c20sm416421wmd.36.2020.04.15.11.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 11:19:12 -0700 (PDT)
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
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <58012f16-1fce-122b-3818-b18d421ed87e@redhat.com>
Date: Wed, 15 Apr 2020 20:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415175423.GJ3456981@phenom.ffwll.local>
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

On 4/15/20 7:54 PM, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 03:02:53PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/15/20 2:01 PM, Daniel Vetter wrote:
>>> On Wed, Apr 15, 2020 at 01:39:23PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 4/15/20 12:22 PM, Daniel Vetter wrote:
>>>>> On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 4/15/20 11:52 AM, Daniel Vetter wrote:
>>>>
>>>> <snip>
>>>>
>>>>>>> iv. What every SoC subsystem does:
>>>>>>>
>>>>>>> - lcdshadow drivers register drivers
>>>>>>> - drm drivers look them up
>>>>>>> - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
>>>>>>> the entire thing is assembled.
>>>>>>>
>>>>>>> That's what we're doing already for other standardized components like
>>>>>>> drm_bridge or drm_panel, and I think that's also the right approach
>>>>>>> for backlight and anything else like that. Hand-rolling our own
>>>>>>> EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
>>>>>>> to real pain. Also, with EPROBE_DEFER we have one standard way of
>>>>>>> building a driver from component, which spans subsystems and is also
>>>>>>> the underlying magic that makes stuff like component.c work.
>>>>>>
>>>>>> On the SoCs we have devicetree telling us what components there
>>>>>> are, so we can wait for them to show up. The only way to figure out
>>>>>> if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
>>>>>> or duplicating a lot of code from thinkpad_acpi. Edit:
>>>>>> also see below for a possible solution.
>>>>>
>>>>> Yup it sucks. I think all we can do is have a small acpi match
>>>>> function (which yes will duplicate some of the thinkpad_acpi driver
>>>>> logic) to re-create that information and give us a "should we have a
>>>>> lcdshadow driver for this $pci_device" answer.
>>>>
>>>> Ok, so questions about this solution:
>>>>
>>>> 1. Where should that match-function live ?
>>>>
>>>> 2. An acpi_thinkpad derived match-function will only be able to
>>>>      answer if there is an lcdshadow device/driver for the internal
>>>>      panel. It will not be able to tie this info to a certain PCI
>>>>      device. My plan is to pass NULL as dev_name when registering
>>>>      the lcdshadow-device and have lcdshadow_get(dev, <connector-name>)
>>>>      skip device-name matching (consider everything a match) for
>>>>      lcdshadow-devices registered with NULL as dev_name.
>>>>
>>>>      So I guess in this case the mini match function should just
>>>>      ignore the passed in device?
>>>
>>> Yeah I think we can't really avoid that. I also expect that we'll need
>>> ACPI and dt versions of this, and driver needs to know which one to call.
>>> Since at least in a dt world the driver knows exactly for which dt node it
>>> needs a lcdshadow driver for (with the phandle stuff), so we can be a lot
>>> more strict.
>>>
>>> For the acpi version I'm not even sure we can do more than provide the
>>> struct device * pointer of the gpu. I think if we ever get more than 1
>>> lcdshadow driver on acpi systems we can add more stuff later on, for now
>>> I'd just leave that out.
>>>
>>> So maybe
>>>
>>> acpi_lcdshadow_get(struct device *dev);
>>>
>>> of_lcdshadow_get(struct device_node *np);
>>>
>>> And with maybe a future plan to add some kind of enum or whatever to
>>> acpi_lcdshadow_get(). Both would return either the lcdshadow pointer, or
>>> an PTR_ERR() so that we could encode EPROBE_DEFER vs ENOENT.
>>
>> Ok, note I plan to only implement the acpi version for now, I do
>> expect some non ACPI/x86 devices to show up with his feature
>> eventually but I believe it is best to implement this once
>> those actually show up. Esp. since this will also involve adding
>> some devicetree bindings for this.
> 
> ofc, just wanted to lay out the entire thing. The DT version needs some
> good bikeshed on the dt schema first anyway (so that the helper can decode
> that directly).
> 
>>> We might also want a low-level lcdshadow_get() which only returns ENOENT
>>> when the driver isn't there, and which leaves "do we really need one?" to
>>> higher levels to answer.
>>
>> Right, so my latest idea on that is indeed a high-level lcdshadow_get()
>> which takes a struct device * and a connector-name and which never
>> returns EPROBE_DEFER.
>>
>> As for leaving things to the higher levels to answer, as explained
>> in my other follow-up email I think that we should probably add a
>> lcdshadow_probe_defer() helper for this and call that early on
>> in the PCI-driver probe functions for the 3 major x86 GPU drivers.
>> Does that sound ok to you?
> 
> Uh ... not pretty. There's still a lifetime problem that strictly speaking
> there's nothing stopping the other driver from getting unloaded between
> your _probe_defer and the subsequent _get. I think fixing this properly
> (and screaming a bit at the error code, oh well) is better.

I would really like to separate the discussion and the work
on getting the 3 major x86 GPU drivers ready to deal with EPROBE_DEFER
from the lcdshadow discussion and work.  I expect getting these
3 drivers ready for EPROBE_DEFER is going to be a major undertaking
and I would like avoid introducing this significant scope creep
to the lcdshadow discussion, because it simply is a too big undertaking
to undertake without us getting a significant amount of manpower
specifically for this from somewhere.

Note I do agree with you that getting these 3 drivers ready
for EPROBE_DEFER handling is a worthwhile undertaking, but
it simply will take too much extra time and as such IMHO it
really is out of scope for the lcdshadow stuff.
I expect the amount of work (esp. also dealing with testing
and regressions) for the EPROBE_DEFER project by itself
to be a lot *more* work then the actual lcdshadow project.

So going with the assumption/decision that adding proper
EPROBE_DEFER handling to these 3 drivers is out of scope,
I believe that adding a lcdshadow_probe_defer() helper is
an ok solution/workaround for now.

As for your case of the other driver getting unloaded in between
the check and use of it, that can only happen by explicit user
action and in that case the worst thing what will happen
is the "privacy-screen" property missing from the connector,
which in that case is more or less exactly what the user
asked for.

>>> I'd also lean towards putting lcdshadow headers/interfaces into
>>> drivers/gpu,
>>
>> Ack, I think we should even make this drm specific and prefix it with
>> drm_ so that we get drm_lcdshadow_foo as functions, just to make
>> clear that this is maintained together with the other drm bits.
> 
> I want to avoid the impression that I'm on an evil plan to take over the
> entire world, but personally very happy with a drm_ prefix for this.

Hehe, ok.

>> But my question about "where should this live" was mainly about
>> the light weight match helpers you suggested to use to figure out
>> if the device supports lcdshadow at all (and we thus should wait
>> for a driver) or not. E.g. I can see us adding a:
>>
>> drivers/gpu/drm/drm_lcdshadow.c
>>
>> file for the core bits and then maybe a:
>>
>> drivers/gpu/drm/drm_lcdshadow_detect.c
>>
>> file with the light weight match helpers, with each helper
>> wrapped in #if IS_ENABLED(CONFIG_THINKPAD_ACPI), etc. ?
> 
> I'd expect it's all going to be so tiny that separate file wont make much
> sense. Thus far we're simply adding the 1-2 of_ helpers to the
> corresponding file, with an #ifdef CONFIG_OF around them. It's ok enough.

Ok, lets start with one file for now, we can always split it later.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
