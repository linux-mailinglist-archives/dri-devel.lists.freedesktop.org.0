Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFBB2A43BE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CC06E8C2;
	Tue,  3 Nov 2020 11:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CF16E8C2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604401760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7syIlfjqS9VeQqY6A8EUbFPVxeHgJTVBfVyCcYrOJos=;
 b=gdqO+TLW36Sb63MGskufCgQYvOY25qpGykjJ2kMKn5IkwbgrMRTZibANIZM9lnitT76B1H
 MJZAnDRL+vq9oEICf31x4Kr4EkXBb+j9k2ThwdY2a+KCEhtUK5vywxo/bVeKfjlnvt7KPZ
 BCTsSjRZvyJf39nfjDKRj7t32ntWKY8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-5okHltyKO22I8wdp2k2Wag-1; Tue, 03 Nov 2020 06:09:19 -0500
X-MC-Unique: 5okHltyKO22I8wdp2k2Wag-1
Received: by mail-ed1-f71.google.com with SMTP id k2so4062138edv.15
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 03:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7syIlfjqS9VeQqY6A8EUbFPVxeHgJTVBfVyCcYrOJos=;
 b=DhfVaFYjf/FzSLfN3AdiE2ujKc1XvnBLeLvjrjOEddyGREv1lHLzrD3eFVsjhvekTF
 OXTUr/OXH45NSJw7h8j7JTx/yiw8wM+JP7Riidy2LBD+GJVqWze4swVSUbaCGVNXKULR
 zV0wpGlJBTSo2n5DJUYalIFSxDZtdphJK0Nwi02OhcpNQn/sHkDfCQWZHILwthas2oLa
 8WznUaq36m85JGdqYfOiq7T2/6S3IlkMMdesTEWmqJfmBWkLUu3WE4nOiNdrJhFMWwAZ
 faF//dhO6mtQQs2lev2K6Sq0ns0RSfSlQv6SphDI4OIBdZZwVr5tty3fWqsnauhKm2hQ
 eYmA==
X-Gm-Message-State: AOAM531tNF6HsPO8thGfy1CXaH4xy4SZECQH5ieZJwaIgceKIbaqGC1T
 c+4jBB6a+RriDNX97pfNPbKBuhXqpBr+AoHeLxPywZS5TVUVVADhuAdZsQ1nhuSJOIAtkYhyo+Y
 tVXAdXZH6ZKjx2HqJmD4cVyZLCHWw
X-Received: by 2002:a05:6402:2d7:: with SMTP id
 b23mr20343233edx.196.1604401757355; 
 Tue, 03 Nov 2020 03:09:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxADHhC3xGIhF5Bi5BJh5UmG8tVovnwyvYawNbiYdOJwfEbe5JxKQFZYqVkhWAGiPh/sVuXvw==
X-Received: by 2002:a05:6402:2d7:: with SMTP id
 b23mr20343226edx.196.1604401757199; 
 Tue, 03 Nov 2020 03:09:17 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
 by smtp.gmail.com with ESMTPSA id h24sm7679226ejg.15.2020.11.03.03.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 03:09:16 -0800 (PST)
Subject: Re: [PATCH v2 0/3] drm: Store USB device in struct drm_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201103103656.17768-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <635668cb-089b-9d56-7866-d28de61bce32@redhat.com>
Date: Tue, 3 Nov 2020 12:09:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103103656.17768-1-tzimmermann@suse.de>
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

On 11/3/20 11:36 AM, Thomas Zimmermann wrote:
> The drivers gm12u320 and udl operate on USB devices. They leave the PCI
> device in struct drm_device empty and store the USB device in their own
> driver structure. It's expected that DRM core and helpers only touch the
> PCI-device field for actual PCI devices.
> 
> Fix this special case by upcasting struct drm_device.dev to the USB
> device. The drivers' udev variables are being removed.
> 
> v2:
> 	* upcast USB device from struct drm_device.dev (Daniel)
> 
> Thomas Zimmermann (3):
>   drm: Add USB helpers
>   drm/tiny/gm12u320: Retrieve USB device from struct drm_device.dev
>   drm/udl: Retrieve USB device from struct drm_device.dev

Thanks.

The entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note you may want to wait with pushing this to drm-misc until the
first patch gets at least one other review.

Or at least give others some time to possibly react :)

Regards,

Hans




> 
>  Documentation/gpu/drm-internals.rst |  5 +++
>  drivers/gpu/drm/tiny/gm12u320.c     | 52 +++++++++++++----------------
>  drivers/gpu/drm/udl/udl_connector.c |  9 ++---
>  drivers/gpu/drm/udl/udl_drv.c       |  3 --
>  drivers/gpu/drm/udl/udl_drv.h       |  1 -
>  drivers/gpu/drm/udl/udl_main.c      | 25 ++++++++------
>  include/drm/drm_usb_helper.h        | 25 ++++++++++++++
>  7 files changed, 73 insertions(+), 47 deletions(-)
>  create mode 100644 include/drm/drm_usb_helper.h
> 
> --
> 2.29.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
