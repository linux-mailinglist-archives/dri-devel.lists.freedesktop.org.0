Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8336EA8A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DA16EE8D;
	Thu, 29 Apr 2021 12:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CF26EE8D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619699602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrKq3UC4OJTuxJrBqTBTU6T4d2IlYMcI0WkWfsWdexI=;
 b=BY3NK6K/lBjsl+5wAtZE5UH0yVWILhLEY8T2wWmRz7tI0j7z7iCdmU03ZJVdtK8vBFKmBJ
 jxzgoC+9AF7gDePK0z2VfxxUtWAD0wvpDThZphwwaAeYOFhalu4YfD19r9d5k2Eq6yrB40
 xDQkUgZyG0kYSFnykS4L8/7Skb5IWuI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-a3Rpx9Z6OQaSEFLityI7Wg-1; Thu, 29 Apr 2021 08:33:20 -0400
X-MC-Unique: a3Rpx9Z6OQaSEFLityI7Wg-1
Received: by mail-ej1-f69.google.com with SMTP id
 h9-20020a1709063c09b0290393e97fec0fso1673031ejg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 05:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GrKq3UC4OJTuxJrBqTBTU6T4d2IlYMcI0WkWfsWdexI=;
 b=Wx+yDTttuhFghb21piz3iBsKTHInxMZacelmFJ6ywZUzWG7MtjDfMMngxxheHf15YI
 COrBhsJzn0m92f6tBFYNqWbGQ+F+ozUjhslKg5Xrvvcj7LQeM6Ne7WLM58D11pyRt+rE
 lOUUEiI5NmOL41ORPPDI+HtY+UMjAq5NVnJsZcPZVZBaB5otNmVz9zcJTGYOJNyPfWdZ
 DkRyffCSAReeX00bY69Amd08CXZPYVV0Sd2ZYfiCA1SoGq6BV5Op9jBBYqRt7f4vA6+B
 q/crB2ASq4PTwBJ7c4uYJGTa3Ej1C4iEcKQvwThOPYMnlXzrCyLQnLSTWqqUoLg+7i0z
 e0+Q==
X-Gm-Message-State: AOAM531vI9uM8pqz606VVP3CmSlsqcZWcNrH1cgsOd9J8hT6WwgPALdx
 wYv5MAAh/Ciw0oqCIblTchStyIgM3VXrCdqRGqoNJGu72nEcXXdJWYRW6lAPCDL1iEvsHbzVWoD
 hLjZ1oTGf56xRrvlRW1UI0w3cr1Dn
X-Received: by 2002:a17:907:75f6:: with SMTP id
 jz22mr24635653ejc.504.1619699599321; 
 Thu, 29 Apr 2021 05:33:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6XSSTtlaPBL2Al2wSDZ5kLm8eA5zhcM5X1CoKpafjS9IMvkP05RefygrrVGfqccP4YWJw7A==
X-Received: by 2002:a17:907:75f6:: with SMTP id
 jz22mr24635628ejc.504.1619699599119; 
 Thu, 29 Apr 2021 05:33:19 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id t15sm2296998edr.55.2021.04.29.05.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 05:33:18 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To: Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
Date: Thu, 29 Apr 2021 14:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIqg59yageIUwiwy@phenom.ffwll.local>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/29/21 2:04 PM, Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>>>> Userspace could hold open a reference to the connector->kdev device,
>>>> through e.g. holding a sysfs-atrtribute open after
>>>> drm_sysfs_connector_remove() has been called. In this case the connector
>>>> could be free-ed while the connector->kdev device's drvdata is still
>>>> pointing to it.
>>>>
>>>> Give drm_connector devices there own device type, which allows
>>>> us to specify our own release function and make drm_sysfs_connector_add()
>>>> take a reference on the connector object, and have the new release
>>>> function put the reference when the device is released.
>>>>
>>>> Giving drm_connector devices there own device type, will also allow
>>>> checking if a device is a drm_connector device with a
>>>> "if (device->type == &drm_sysfs_device_connector)" check.
>>>>
>>>> Note that the setting of the name member of the device_type struct will
>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>>>> as extra info. So this extends the uevent part of the userspace API.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Are you sure? I thought sysfs is supposed to flush out any pending
>>> operations (they complete fast) and handle open fd internally?
>>
>> Yes, it "should" :)
> 
> Thanks for confirming my vague memories :-)
> 
> Hans, pls drop this one.

Please see my earlier reply to your review of this patch, it is
still needed but for a different reason:

"""
We still need this change though to make sure that the 
"drm/connector: Add drm_connector_find_by_fwnode() function"
does not end up following a dangling drvdat pointer from one
if the drm_connector kdev-s.

The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
a reference on all devices and between getting that reference
and it calling drm_connector_get() - drm_connector_unregister()
may run and drop the possibly last reference to the
drm_connector object, freeing it and leaving the kdev's
drvdata as a dangling pointer.
"""

This is actually why I added it initially, and while adding it
I came up with this wrong theory of why it was necessary independently
of the drm_connector_find_by_fwnode() addition, sorry about that.

Regards,

Hans


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
