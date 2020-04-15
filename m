Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E17C1AA2B3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAE06E9DB;
	Wed, 15 Apr 2020 13:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D046E9DB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586955781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPRnCQyTy0lozHXpxaHNgT4K4emDups1HsgpbCCiNIM=;
 b=ABAuXmg55L5o2FKTUHiL9WKU9UWRucUeB283gBzpZ0RHtfF1MrTX3t6iksiKQxd45dNqfK
 j4Vcf+G3Iw9h+uKAxpbdpthsM1dJkg9S9XDpsET/VOb/uFIfjH5Rwebl9ePAixDW+D8DjJ
 +SyFShl5WNykzHnscEIT3I2FIwOXUBA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-F8PaAM33PuCgViREiW0r4A-1; Wed, 15 Apr 2020 09:02:59 -0400
X-MC-Unique: F8PaAM33PuCgViREiW0r4A-1
Received: by mail-wr1-f70.google.com with SMTP id j16so9847174wrw.20
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qPRnCQyTy0lozHXpxaHNgT4K4emDups1HsgpbCCiNIM=;
 b=V0iQqi5AYVGhV1uEtCoHExWASkzmGvpwHgrXxqvkquYF22xGUPuKv/+Dtu3IAxnDYF
 yieRLBd0Emmv6RGJSk35JNTOBsBK4lrDoc1SV6dJzV4UKu0Xq+iANAJOLeeqG4cbgLwL
 o7HAJZPzJO127zQ6QM9+iHLCIeMMlviCmqAFVurQVADgasGdMN0sx1Z08ZFKDgUIWnD2
 l65Y/vc4TsF1iCJIwirg1C2Mc5LJJUTpdWCsDjvVPFeCpt3UXb/dTFia8uoA9TWewzL4
 MX/sLk26//139XIa2O1il1ZmqKjfdw9sm6XL0n3VuC6vtGe8oqaA+H2zCPN9vIaH2H4i
 3lzw==
X-Gm-Message-State: AGi0PuYV2l/BZBd607uEYaR6X5TZondrx7ez4E5NFErHP22wWAUp4MHb
 f0NZ/ORlPGshiG4FH4/HnyDrrqhMyYJSW87Ins+YfTLc7AJBUxcd5n5gKUMzNMzVqNK4jAuURj0
 n6VYDBiHB/PQR2v69F2iM0uBy7Ncq
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr5507545wmi.155.1586955778663; 
 Wed, 15 Apr 2020 06:02:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNH12nbw3KgGEDNh8UX4CL4lp2KILn9SiA4zWsCw6oBZCrlFlqgV4cgMCGePEP4y2+WbupjA==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr5507512wmi.155.1586955778380; 
 Wed, 15 Apr 2020 06:02:58 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id b66sm23416430wmh.12.2020.04.15.06.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 06:02:57 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
To: Daniel Vetter <daniel@ffwll.ch>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
 <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
 <CAKMK7uESUVHLwMDujCDvapOBZ+Lnp1k-5juxQxcsNj+1QuN0Ww@mail.gmail.com>
 <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
 <20200415120135.GB3456981@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <794191aa-e92d-d44c-f4ff-72fd6c9bf0e7@redhat.com>
Date: Wed, 15 Apr 2020 15:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415120135.GB3456981@phenom.ffwll.local>
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

On 4/15/20 2:01 PM, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 01:39:23PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/15/20 12:22 PM, Daniel Vetter wrote:
>>> On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 4/15/20 11:52 AM, Daniel Vetter wrote:
>>
>> <snip>
>>
>>>>> iv. What every SoC subsystem does:
>>>>>
>>>>> - lcdshadow drivers register drivers
>>>>> - drm drivers look them up
>>>>> - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
>>>>> the entire thing is assembled.
>>>>>
>>>>> That's what we're doing already for other standardized components like
>>>>> drm_bridge or drm_panel, and I think that's also the right approach
>>>>> for backlight and anything else like that. Hand-rolling our own
>>>>> EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
>>>>> to real pain. Also, with EPROBE_DEFER we have one standard way of
>>>>> building a driver from component, which spans subsystems and is also
>>>>> the underlying magic that makes stuff like component.c work.
>>>>
>>>> On the SoCs we have devicetree telling us what components there
>>>> are, so we can wait for them to show up. The only way to figure out
>>>> if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
>>>> or duplicating a lot of code from thinkpad_acpi. Edit:
>>>> also see below for a possible solution.
>>>
>>> Yup it sucks. I think all we can do is have a small acpi match
>>> function (which yes will duplicate some of the thinkpad_acpi driver
>>> logic) to re-create that information and give us a "should we have a
>>> lcdshadow driver for this $pci_device" answer.
>>
>> Ok, so questions about this solution:
>>
>> 1. Where should that match-function live ?
>>
>> 2. An acpi_thinkpad derived match-function will only be able to
>>     answer if there is an lcdshadow device/driver for the internal
>>     panel. It will not be able to tie this info to a certain PCI
>>     device. My plan is to pass NULL as dev_name when registering
>>     the lcdshadow-device and have lcdshadow_get(dev, <connector-name>)
>>     skip device-name matching (consider everything a match) for
>>     lcdshadow-devices registered with NULL as dev_name.
>>
>>     So I guess in this case the mini match function should just
>>     ignore the passed in device?
> 
> Yeah I think we can't really avoid that. I also expect that we'll need
> ACPI and dt versions of this, and driver needs to know which one to call.
> Since at least in a dt world the driver knows exactly for which dt node it
> needs a lcdshadow driver for (with the phandle stuff), so we can be a lot
> more strict.
> 
> For the acpi version I'm not even sure we can do more than provide the
> struct device * pointer of the gpu. I think if we ever get more than 1
> lcdshadow driver on acpi systems we can add more stuff later on, for now
> I'd just leave that out.
> 
> So maybe
> 
> acpi_lcdshadow_get(struct device *dev);
> 
> of_lcdshadow_get(struct device_node *np);
> 
> And with maybe a future plan to add some kind of enum or whatever to
> acpi_lcdshadow_get(). Both would return either the lcdshadow pointer, or
> an PTR_ERR() so that we could encode EPROBE_DEFER vs ENOENT.

Ok, note I plan to only implement the acpi version for now, I do
expect some non ACPI/x86 devices to show up with his feature
eventually but I believe it is best to implement this once
those actually show up. Esp. since this will also involve adding
some devicetree bindings for this.

> We might also want a low-level lcdshadow_get() which only returns ENOENT
> when the driver isn't there, and which leaves "do we really need one?" to
> higher levels to answer.

Right, so my latest idea on that is indeed a high-level lcdshadow_get()
which takes a struct device * and a connector-name and which never
returns EPROBE_DEFER.

As for leaving things to the higher levels to answer, as explained
in my other follow-up email I think that we should probably add a
lcdshadow_probe_defer() helper for this and call that early on
in the PCI-driver probe functions for the 3 major x86 GPU drivers.
Does that sound ok to you?

> I'd also lean towards putting lcdshadow headers/interfaces into
> drivers/gpu,

Ack, I think we should even make this drm specific and prefix it with
drm_ so that we get drm_lcdshadow_foo as functions, just to make
clear that this is maintained together with the other drm bits.

But my question about "where should this live" was mainly about
the light weight match helpers you suggested to use to figure out
if the device supports lcdshadow at all (and we thus should wait
for a driver) or not. E.g. I can see us adding a:

drivers/gpu/drm/drm_lcdshadow.c

file for the core bits and then maybe a:

drivers/gpu/drm/drm_lcdshadow_detect.c

file with the light weight match helpers, with each helper
wrapped in #if IS_ENABLED(CONFIG_THINKPAD_ACPI), etc. ?

> with driver implementations all over.

Ack.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
