Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745B36E150
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28106E0DA;
	Wed, 28 Apr 2021 21:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7534F6EC5C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619647064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcNRGfKq+Fp/bSii4FdmrVznfLn2Epwo2TJlsZcxTEk=;
 b=WqBkc85GrfMJdqnJziyutFDG1FS3iwbkQ+nBYDw0Gi9e4ZqDNgEdNYLqb9iyAcTLqT5Reg
 zKcSI8Gpnr55xlWHSRFRMLsxegXYEzkOwiwV4PRvCp8cvM4OD80bFqtPY10+/KWT+VwpHb
 Z5s7UAQvYhUOOWdJDmOG4l5y658wnlc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-uwh9iN4iMfCbjUN1xKVzNw-1; Wed, 28 Apr 2021 17:57:40 -0400
X-MC-Unique: uwh9iN4iMfCbjUN1xKVzNw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h13-20020a05640250cdb02903790a9c55acso27599732edb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PcNRGfKq+Fp/bSii4FdmrVznfLn2Epwo2TJlsZcxTEk=;
 b=fzNtJ01VXCIdAG3qJ2zu8GaNvGdL9a6XqGSmGXwvh8ct4DhSwx+/HZ8A8SHwVtLd6u
 nehGQ8QWivnt4Jcv/3o3MDGRSD3x5qN+1JQ6lOlyxjXnQ8oS5OkGDEkLLEzQb0i8eEBQ
 5cbMs9NQAS6w15GJECDZeq7JgfD34PYnmkBHJ0TnW0oxsHOnCIhmWbGsIxEOZNH8ysg2
 NRNQpjDb8KCDO5HvEHKfS+TvQ30V+GLrT1YJII1icrjz6L/D4gFTSAwMTC8/I2GlXWPc
 cfijiheTDjeG0ajjnbJg7LpJA4Xgg6ZM1UD+Uevq/tMnNBMo2kR2dCT3fisbD/avImog
 KaGA==
X-Gm-Message-State: AOAM531lK0aegt++PnemEqOTNgidpRIdJuu8yVmhPlG6KtaNga1gIm+/
 XyKz3qS3PE/GfMKp/UdXSXnGZ9+bdkiUge2eb0zJXlHXn3yGowGNEPeO1Isp1ncJV0u9EYymv/w
 Zhj5WPC6NJN7MbgECmV6hlY6IzuT7
X-Received: by 2002:a17:906:858:: with SMTP id
 f24mr24786315ejd.347.1619647059450; 
 Wed, 28 Apr 2021 14:57:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBzmKGVeKYZXxAE1Z2T5grGU6G8KanK3krK5U625IYhTpXdUp6CVhhZxRndNJbLKTcxcgQdg==
X-Received: by 2002:a17:906:858:: with SMTP id
 f24mr24786299ejd.347.1619647059283; 
 Wed, 28 Apr 2021 14:57:39 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r17sm819538edt.70.2021.04.28.14.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 14:57:38 -0700 (PDT)
Subject: Re: [PATCH 0/9] drm + usb-type-c: Add support for out-of-band hotplug
 notification
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <81d7d021-d8b7-74ec-784b-40b50bba3f21@redhat.com>
Date: Wed, 28 Apr 2021 23:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/28/21 11:52 PM, Hans de Goede wrote:
> Hi All,
> 
> Here is a new attempt to make DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> For anyone interested here are the old (2019!) patches for this:
> 
> https://patchwork.freedesktop.org/patch/288491/
> https://patchwork.freedesktop.org/patch/288493/
> https://patchwork.freedesktop.org/patch/288495/
> 
> Last time I posted this the biggest change requested was for more info to
> be included in the event send to the DRM-subsystem, specifically sending
> the following info was requested:
> 
> 1. Which DP connector on the GPU the event is for
> 2. How many lanes are available
> 3. Connector orientation
> 
> This series is basically an entirely new approach, which no longer
> uses the notifier framework at all. Instead the Type-C code looksup
> a connector based on a fwnode (this was suggested by Heikki Krogerus)
> and then calls a new oob_hotplug_event drm_connector_func directly
> on the connector, passing the requested info as argument.

p.s.

Info such as the orientation and the number of dp-lanes is now passed
to the drm_connector_oob_hotplug_event() function as requested in the
review of the old code, but nothing is done with it for now.
Using this info falls well outside of my knowledge of the i915 driver
so this is left to a follow-up patch (I will be available to test
patches for this).

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
