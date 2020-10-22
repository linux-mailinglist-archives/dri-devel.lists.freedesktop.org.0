Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74E295C90
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 12:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9206F5BA;
	Thu, 22 Oct 2020 10:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485F06F5BA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603361859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yATTwmcDbVALtZgCHCWEYdtftttyHBS7mBxN7foWQBA=;
 b=UUPvS4euGyEKwgWbGXYralLJpQ/TS0LWUWYPLDMXzr3sKHsHbKPTldIPv6fiX34MBb0uzs
 jGHd0E/inlJEU7I7bq8qVSlH3r6seeDKbHluhHotlPc09ddu1iIgzkGxtVH/MsUSVyfMni
 Jq76IlNWsBLGt/vvbhCGcgI0WdBvKlM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-MMgBpOaRP2yCSrguVIV8PA-1; Thu, 22 Oct 2020 06:17:36 -0400
X-MC-Unique: MMgBpOaRP2yCSrguVIV8PA-1
Received: by mail-ej1-f71.google.com with SMTP id k23so487351ejx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 03:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yATTwmcDbVALtZgCHCWEYdtftttyHBS7mBxN7foWQBA=;
 b=cZ3+3eQsE1lMbijQf6FqiTtKsI/6tBWSl0BrWlHDpueSvJwVMYl1fpiJngWIOgjsQk
 0pGqpVqhteyPvESiqlLsTl/Xo2dU2dobV7tN6aCIZQlg4MwMd72stRHt1IVBBNn/nQoK
 VX1oZ+kjPAP4OVBm8abdNOP8TF7hkE4Vnsttu4vB/HpfGGC790pkoXWrZOxJVIgMAvob
 m0UvDFQnVFUgoy9UruF2ecT2hFy2K98OBtU8PrB1wjcgB5yOeqguPbbkpYpMxBiWC8pS
 r8KZEWIwBS8Ig4b8YteW/de3hv/fOToojaHjw2bhjbZkC61Uf1ENMW1ReOst9vfkIzxj
 0tGg==
X-Gm-Message-State: AOAM530WDS1Zh5+3O/tMxzxtP08JmfaAY7tnzQ0q6AJcE5rVS0OlMJV8
 L6k5uVwig4BGJ2Cobulwpxp1uwhu05E/ivwk42awZkvE6pCphuP/4N69nofLoqm3j3ySQexE80r
 4tQ8VWDe9QLRot6aliaYebroB7igk
X-Received: by 2002:a05:6402:36d:: with SMTP id
 s13mr1522289edw.203.1603361855256; 
 Thu, 22 Oct 2020 03:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDxnzAz251NGj4jdvqdeAuRiNtNiQOun8yyyF0MykASicnqNF2hkQYjsa9Pty/28LryZG6sQ==
X-Received: by 2002:a05:6402:36d:: with SMTP id
 s13mr1522271edw.203.1603361855051; 
 Thu, 22 Oct 2020 03:17:35 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id k21sm504105edv.31.2020.10.22.03.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 03:17:34 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: Store USB device in struct drm_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201021130732.4048-1-tzimmermann@suse.de>
 <d5cc8a94-e908-84a1-09b2-fef7a2e78d91@redhat.com>
 <42768db1-37a6-ee8d-aa82-d14fc8806a4b@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ff855bd4-8b74-15f4-c81e-05ad39ac5885@redhat.com>
Date: Thu, 22 Oct 2020 12:17:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <42768db1-37a6-ee8d-aa82-d14fc8806a4b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/22/20 11:30 AM, Thomas Zimmermann wrote:
> Hi
> 
> On 22.10.20 11:20, Hans de Goede wrote:
>> Hi,
>>
>> On 10/21/20 3:07 PM, Thomas Zimmermann wrote:
>>> The drivers gm12u320 and udl operate on USB devices. They leave the
>>> PCI device in struct drm_device empty and store the USB device in their
>>> own driver structure.
>>>
>>> Fix this special case and save a few bytes by putting the USB device
>>> into an anonymous union with the PCI data. It's expected that DRM
>>> core and helpers only touch the PCI-device field for actual PCI devices.
>>>
>>> Thomas Zimmermann (3):
>>>   drm: Add reference to USB device to struct drm_device
>>>   drm/tiny/gm12u320: Store USB device in struct drm_device.udev
>>>   drm/udl: Store USB device in struct drm_device.udev
>>
>> This series looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks a lot. Following Daniel's request, I'll drop patch 1 and instead
> do an upcast from drm_device.dev to the USB device structure. The driver
> patches 2 and 3 will be slightly different. Unless you object, I''ll
> take the r-b into the new patches.

I somehow missed Daniel's reply about this.

With that said, hmm that is going to be an interesting up-cast, at least
for the gm12u320, that is going to look something like this:

	struct usb_device *udev = interface_to_usbdev(to_usb_interface(drm_dev->dev));

(I wrote drm_dev instead of dev to make it more clear what is going on)

For the DRM_DEV_ERROR() macro you can just use gm12u320->dev.dev ,
that will make the errors be printed with the in usb-interface device-name
as prefix instead of the usb-device device-name, but that is fine.

I wonder of this is all worth it then though, just to save those few bytes ?

The first version made some sense since it made how drm devices with
usb resp. pci parents are handled consistent. Now it seems to make the code
somewhat harder to understand just to save the storage for a single pointer...

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
