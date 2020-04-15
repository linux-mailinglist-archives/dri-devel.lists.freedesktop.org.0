Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BB1AB01B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232B96EA4F;
	Wed, 15 Apr 2020 17:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02256EA4F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:54:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o81so595197wmo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8bkn92kPQHiLkAthtGEIINildisZhreozUyE/wq5zn4=;
 b=TYyGIO2ukOm9oeJERHKtrerITn1Jz4oGm/vN3C8FKMb0+aGkW1WTD6xtCrBjG1b+CC
 0eal1BwMOK1zqGjR+76/fapoehNTDST+819CaxAYtoSOw8S6FDNqwBvP6JS6nvnz4NLb
 R9yjRXMbnVJ1r4Sg2RxM2fwLM6FYFB8KYPDZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8bkn92kPQHiLkAthtGEIINildisZhreozUyE/wq5zn4=;
 b=SWsmTUzEMEipAlIO0n0FAX7XZ+xe2k5lH+jCBA9g1YF0blo7tmJJ68+QC457qIGwpZ
 2mrr0X+c5Hw0rqqz6Y/1yKciJu4LnLKJl6AAUPW3UjUo2mFyYMRrJQH0j8b+RoY7zlbT
 F1/ZugitfDR9Wvh/dpE6bX60qkDsoW2TR+s5/t8lkz70N/wg7NUKBIVuFxeMswttJke6
 dKCjsylAG2SQmeFH9nGDTcoQk84MwS7q+w+AutS/5jeBwajc3Ly2WobykgylRfR2DgYw
 R3pDE4bpXbJ6kWU4CM88F/fKKploBdiAIfzgcZ8byUo68yyvVm3LItPITKJ34/HZkHj6
 7Q4A==
X-Gm-Message-State: AGi0PuY64z1haui4syWq3fNavKwNA40XCJn6ppYChIugmJvWztEypD2z
 6gpn1gOgZ3/p44aDLNAZSHaL7A==
X-Google-Smtp-Source: APiQypL44mQDZGdfnRpnSV7lvAOqXLdHSWl36n2Yxjlxz+1HxS5EBbbpe5Rq7dGFRqeMWPjQr5T1qQ==
X-Received: by 2002:a1c:1dc3:: with SMTP id d186mr393544wmd.90.1586973266409; 
 Wed, 15 Apr 2020 10:54:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b191sm332485wmd.39.2020.04.15.10.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 10:54:25 -0700 (PDT)
Date: Wed, 15 Apr 2020 19:54:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
Message-ID: <20200415175423.GJ3456981@phenom.ffwll.local>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
 <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
 <CAKMK7uESUVHLwMDujCDvapOBZ+Lnp1k-5juxQxcsNj+1QuN0Ww@mail.gmail.com>
 <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
 <20200415120135.GB3456981@phenom.ffwll.local>
 <794191aa-e92d-d44c-f4ff-72fd6c9bf0e7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <794191aa-e92d-d44c-f4ff-72fd6c9bf0e7@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 03:02:53PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/15/20 2:01 PM, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 01:39:23PM +0200, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 4/15/20 12:22 PM, Daniel Vetter wrote:
> > > > On Wed, Apr 15, 2020 at 12:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > On 4/15/20 11:52 AM, Daniel Vetter wrote:
> > > 
> > > <snip>
> > > 
> > > > > > iv. What every SoC subsystem does:
> > > > > > 
> > > > > > - lcdshadow drivers register drivers
> > > > > > - drm drivers look them up
> > > > > > - if stuff isn't there yet, we delay loading with EPROBE_DEFER until
> > > > > > the entire thing is assembled.
> > > > > > 
> > > > > > That's what we're doing already for other standardized components like
> > > > > > drm_bridge or drm_panel, and I think that's also the right approach
> > > > > > for backlight and anything else like that. Hand-rolling our own
> > > > > > EPROBE_DEFER handling, or some other duct-tape monsters imo just leads
> > > > > > to real pain. Also, with EPROBE_DEFER we have one standard way of
> > > > > > building a driver from component, which spans subsystems and is also
> > > > > > the underlying magic that makes stuff like component.c work.
> > > > > 
> > > > > On the SoCs we have devicetree telling us what components there
> > > > > are, so we can wait for them to show up. The only way to figure out
> > > > > if the lcdshadow thing is there on a ThinkPad is asking thinkpad_acpi,
> > > > > or duplicating a lot of code from thinkpad_acpi. Edit:
> > > > > also see below for a possible solution.
> > > > 
> > > > Yup it sucks. I think all we can do is have a small acpi match
> > > > function (which yes will duplicate some of the thinkpad_acpi driver
> > > > logic) to re-create that information and give us a "should we have a
> > > > lcdshadow driver for this $pci_device" answer.
> > > 
> > > Ok, so questions about this solution:
> > > 
> > > 1. Where should that match-function live ?
> > > 
> > > 2. An acpi_thinkpad derived match-function will only be able to
> > >     answer if there is an lcdshadow device/driver for the internal
> > >     panel. It will not be able to tie this info to a certain PCI
> > >     device. My plan is to pass NULL as dev_name when registering
> > >     the lcdshadow-device and have lcdshadow_get(dev, <connector-name>)
> > >     skip device-name matching (consider everything a match) for
> > >     lcdshadow-devices registered with NULL as dev_name.
> > > 
> > >     So I guess in this case the mini match function should just
> > >     ignore the passed in device?
> > 
> > Yeah I think we can't really avoid that. I also expect that we'll need
> > ACPI and dt versions of this, and driver needs to know which one to call.
> > Since at least in a dt world the driver knows exactly for which dt node it
> > needs a lcdshadow driver for (with the phandle stuff), so we can be a lot
> > more strict.
> > 
> > For the acpi version I'm not even sure we can do more than provide the
> > struct device * pointer of the gpu. I think if we ever get more than 1
> > lcdshadow driver on acpi systems we can add more stuff later on, for now
> > I'd just leave that out.
> > 
> > So maybe
> > 
> > acpi_lcdshadow_get(struct device *dev);
> > 
> > of_lcdshadow_get(struct device_node *np);
> > 
> > And with maybe a future plan to add some kind of enum or whatever to
> > acpi_lcdshadow_get(). Both would return either the lcdshadow pointer, or
> > an PTR_ERR() so that we could encode EPROBE_DEFER vs ENOENT.
> 
> Ok, note I plan to only implement the acpi version for now, I do
> expect some non ACPI/x86 devices to show up with his feature
> eventually but I believe it is best to implement this once
> those actually show up. Esp. since this will also involve adding
> some devicetree bindings for this.

ofc, just wanted to lay out the entire thing. The DT version needs some
good bikeshed on the dt schema first anyway (so that the helper can decode
that directly).

> > We might also want a low-level lcdshadow_get() which only returns ENOENT
> > when the driver isn't there, and which leaves "do we really need one?" to
> > higher levels to answer.
> 
> Right, so my latest idea on that is indeed a high-level lcdshadow_get()
> which takes a struct device * and a connector-name and which never
> returns EPROBE_DEFER.
> 
> As for leaving things to the higher levels to answer, as explained
> in my other follow-up email I think that we should probably add a
> lcdshadow_probe_defer() helper for this and call that early on
> in the PCI-driver probe functions for the 3 major x86 GPU drivers.
> Does that sound ok to you?

Uh ... not pretty. There's still a lifetime problem that strictly speaking
there's nothing stopping the other driver from getting unloaded between
your _probe_defer and the subsequent _get. I think fixing this properly
(and screaming a bit at the error code, oh well) is better.

> > I'd also lean towards putting lcdshadow headers/interfaces into
> > drivers/gpu,
> 
> Ack, I think we should even make this drm specific and prefix it with
> drm_ so that we get drm_lcdshadow_foo as functions, just to make
> clear that this is maintained together with the other drm bits.

I want to avoid the impression that I'm on an evil plan to take over the
entire world, but personally very happy with a drm_ prefix for this.

> But my question about "where should this live" was mainly about
> the light weight match helpers you suggested to use to figure out
> if the device supports lcdshadow at all (and we thus should wait
> for a driver) or not. E.g. I can see us adding a:
> 
> drivers/gpu/drm/drm_lcdshadow.c
> 
> file for the core bits and then maybe a:
> 
> drivers/gpu/drm/drm_lcdshadow_detect.c
> 
> file with the light weight match helpers, with each helper
> wrapped in #if IS_ENABLED(CONFIG_THINKPAD_ACPI), etc. ?

I'd expect it's all going to be so tiny that separate file wont make much
sense. Thus far we're simply adding the 1-2 of_ helpers to the
corresponding file, with an #ifdef CONFIG_OF around them. It's ok enough.

> > with driver implementations all over.
> 
> Ack.
> 
> Regards,
> 
> Hans
> 

Cheers, Daniel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
