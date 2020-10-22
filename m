Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C3295B9E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3C6E046;
	Thu, 22 Oct 2020 09:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636546E046
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603358442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3jOFm9ce5hvw8xSLzH7tyekR19F8FNfDB8a9ocIepg=;
 b=DbecBdCpltE1zlvAieNDi/zJapfbDiZO4fyQAAlV6R1QnFN3y1CStQ2IurgXFUA+4/PLEe
 OHAqasBOIqMkJH68JxUrEBThaAJSQU2JcLDGbzeCly0lfzZtKa3AqLiWJqIzsCADSgia+H
 syI2pR59pStbnZqRKmGPTuYtIfjDnzc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-6jHkr6BoO_mM36c42cT62w-1; Thu, 22 Oct 2020 05:20:40 -0400
X-MC-Unique: 6jHkr6BoO_mM36c42cT62w-1
Received: by mail-ej1-f71.google.com with SMTP id k23so432506ejx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 02:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e3jOFm9ce5hvw8xSLzH7tyekR19F8FNfDB8a9ocIepg=;
 b=s7gXpqY6NZr/9lkWy4z3lh+5N4Dz+/JKrACp0l/opQ85iFX19p1lzB5t5tnq8NyluO
 eaeV5TCcbneQtbsKkyB4ITxL+9Ce7SOCobmbagLxWSePDNN/GefKE+4aBzyqEt9uf8ls
 sR/jl7iD78kPpxbUNPqd+PU01RXhpM1DK6uGyPp4qLj7ZCMUi6mkZRcWwDWvrKFQKrA2
 QTwFEghiE6lcWYpiz2/vYd7VJeg01YoGkqAQJOnZV49Nhg3GyFWf2PBQtTCMhRFYEE0f
 fh/vxvfkRzBR73wqLBk0MwRvFgJ8XJTdG9/wqBIbW7nlLyuwbo482vP0sF4KYmgBdnwI
 tYCw==
X-Gm-Message-State: AOAM533BefnIC9FUTklCwgRwNSiT+YWelX8+FDg3u105AFuH0iEsJ1G2
 KdCJ23NO8R03MkaHPa+xXWigSBA0SPHn1YHmuXm0wIuOsP0onFXXCGWJmJ2vdmmKJnsBP7Oxf6i
 KsLJnsxQyyycu9VSu1ptqzNm41zRy
X-Received: by 2002:a05:6402:b8f:: with SMTP id
 cf15mr1342872edb.369.1603358439165; 
 Thu, 22 Oct 2020 02:20:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHyaq9pMCEBMDvpI3ftwUCjdgIu+dlejcx9ImqKgunXgPZixX9Yjar7jmPd9v6K302tg0U9Q==
X-Received: by 2002:a05:6402:b8f:: with SMTP id
 cf15mr1342855edb.369.1603358438935; 
 Thu, 22 Oct 2020 02:20:38 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id qw1sm501091ejb.44.2020.10.22.02.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 02:20:38 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: Store USB device in struct drm_device
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201021130732.4048-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d5cc8a94-e908-84a1-09b2-fef7a2e78d91@redhat.com>
Date: Thu, 22 Oct 2020 11:20:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021130732.4048-1-tzimmermann@suse.de>
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

On 10/21/20 3:07 PM, Thomas Zimmermann wrote:
> The drivers gm12u320 and udl operate on USB devices. They leave the
> PCI device in struct drm_device empty and store the USB device in their
> own driver structure.
> 
> Fix this special case and save a few bytes by putting the USB device
> into an anonymous union with the PCI data. It's expected that DRM
> core and helpers only touch the PCI-device field for actual PCI devices.
> 
> Thomas Zimmermann (3):
>   drm: Add reference to USB device to struct drm_device
>   drm/tiny/gm12u320: Store USB device in struct drm_device.udev
>   drm/udl: Store USB device in struct drm_device.udev

This series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
>  drivers/gpu/drm/tiny/gm12u320.c     | 52 +++++++++++++----------------
>  drivers/gpu/drm/udl/udl_connector.c |  8 ++---
>  drivers/gpu/drm/udl/udl_drv.c       |  2 +-
>  drivers/gpu/drm/udl/udl_drv.h       |  1 -
>  drivers/gpu/drm/udl/udl_main.c      | 15 +++++----
>  include/drm/drm_device.h            | 21 ++++++++----
>  6 files changed, 52 insertions(+), 47 deletions(-)
> 
> --
> 2.28.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
