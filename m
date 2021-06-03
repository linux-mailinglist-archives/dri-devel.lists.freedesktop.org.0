Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C6F39A071
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 13:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1A06EB09;
	Thu,  3 Jun 2021 11:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5E86EB09
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622721574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/FZoX4WIIm6XZW0ArQELD2C1vsdBoERWuy3oEiMfj0=;
 b=Hkh54+7cL4aVEvsXcbUMlOUXoOBYJhyVj7nnjnd1GI9QfZKMmIumMHU8IyFGqeoHmvm6zO
 qP/AL6b3ifcTpY8y5IJPQt4Y0I3ynSFZTmCY9eZiKXvnx8wU1ZD6gZzxD6CoaaaxbGXd1G
 Kkc0MgAiiF9pxjddkPbYjSK//g2Zv4c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-v8vbjgMLPeyO81C8bMfHYQ-1; Thu, 03 Jun 2021 07:59:33 -0400
X-MC-Unique: v8vbjgMLPeyO81C8bMfHYQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hz18-20020a1709072cf2b02903fbaae9f4faso1856102ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 04:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e/FZoX4WIIm6XZW0ArQELD2C1vsdBoERWuy3oEiMfj0=;
 b=OkpeQzin5A2MXZBWEf+6sgEOVHNg3RqF1xwnbd0woFphoi7hdFkrrZHwenWU4HKGR7
 pA3qi0wKTSIxkDC3KD5b8UgcNq5G3AQWZm12hdGV+l6QxiPIGHkAKp087wOdfmQYXeKs
 YPyq53U+z+sLfgACC8Xqk7GmoB6pHmA6W4J6b18eusdbKlW3y2D/+yEY6iK4BNf41kQc
 +aFUVIsZq0YSHumkOa6qT/XNTk199kFlcQG4wItm5ePGCs7TuiEfbP4kEmazoZPwirh/
 wJaCT8+BH/MDKXOpiERcD0FPi8lhM/2NOQMq8wX/5QBclX759+YjWutTGtXVwumd0alK
 zxNA==
X-Gm-Message-State: AOAM531uYz7CIbflBCAgvot3eTVAor7BXMynuohmLoot6ejIsonL0o49
 FehJsyZoN1X3h4eCX/1f6s3KsaqGZAok5DXG5n1+27Q8NrHfMTsWCvu3kFt0s8/N8idZtgt7N13
 azgrHrF2uxcW09b8yZ34aOOp+283U
X-Received: by 2002:a17:906:2b85:: with SMTP id
 m5mr39462385ejg.141.1622721572028; 
 Thu, 03 Jun 2021 04:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLrhoVTSXNrq9oOLzdqRELKVnqXPHLA//ELnJuvPrh+jVnzjKXUa2Z3o+3O301UXhhaYNPDA==
X-Received: by 2002:a17:906:2b85:: with SMTP id
 m5mr39462359ejg.141.1622721571851; 
 Thu, 03 Jun 2021 04:59:31 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id j22sm1484711ejt.11.2021.06.03.04.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 04:59:31 -0700 (PDT)
Subject: Re: [Intel-gfx] [PATCH v2 2/9] drm: Add privacy-screen class (v2)
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
 <20210421204804.589962-3-hdegoede@redhat.com>
 <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fb2209f1-a6d8-4a1e-de58-00ee788aa6c2@redhat.com>
Date: Thu, 3 Jun 2021 13:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Mark Gross <mgross@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sebastien Bacher <seb128@ubuntu.com>, David Airlie <airlied@linux.ie>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mark Pearson <markpearson@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/1/21 5:31 PM, Emil Velikov wrote:
> Hi Hans,
> 
> What happened with this series, did it fall through the cracks?

Sorta, as Marco already mentioned I think people are waiting for the
user-space branches which he has on his personal git repos to be submitted
as offical merge-req-s to GNOME.

> On Wed, 21 Apr 2021 at 21:48, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
> 
>> +#include "drm_internal.h"
> 
> I think we don't need this include, do we?

The drm_privacy_screen device registered by a provider
uses /sys/class/drm as its class, quoting from
drm_privacy_screen.c drm_privacy_screen_register():

        priv->dev.class = drm_class;
        priv->dev.type = &drm_privacy_screen_type;
        priv->dev.parent = parent;
        priv->dev.release = drm_privacy_screen_device_release;
        dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
        priv->ops = ops;

        priv->ops->get_hw_state(priv);

        ret = device_register(&priv->dev);

Notice the "priv->dev.class = drm_class", the drm_class
variable is declared in "drm_internal.h".

Note this was not present in v2. As I mentioned in the commit msg:

Changes in v2:
- Make CONFIG_DRM_PRIVACY_SCREEN a bool which controls if the drm_privacy
  code gets built as part of the main drm module rather then making it
  a tristate which builds its own module.
- Add a #if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) check to
  drm_privacy_screen_consumer.h and define stubs when the check fails.
  Together these 2 changes fix several dependency issues.
- Remove module related code now that this is part of the main drm.ko
- Use drm_class as class for the privacy-screen devices instead of
  adding a separate class for this

This is something which I changed in v2. I changed this since I didn't
really see any good reason for drm_privacy_screen devices having their
own class, rather then just having them sit under /sys/class/drm .

I'm open to changing this if people dislike this choice.



>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_consumer.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto

The "enum drm_privacy_screen_status" used in various places
comes from drm/drm_connector.h (it is the same enum which is
used for the possible values of the drm-connector properties).


>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_driver.h
> 
>> +#include <drm/drm_connector.h>
> 
> Ditto
> 
> I like how you avoided leaking any DRM details within the new code,
> modulo the includes above.

I'm glad you like it. I did indeed try to make the code mostly
independent, but as you can see above there are still some
inter-dependencies.

Because of this, the CONFIG_DRM_PRIVACY_SCREEN option also does
not control building this into a separate module. Like many other
DRM Kconfig options, this controls if the privacy-screen code will
be added to drm.ko or not.

Despite being 99% independent, the 2 are still intertwined at such
a level that this is necessary. Specifically drm_core_init() calls
drm_privacy_screen_lookup_init() to initialize the static lookup
table which is used to see if there is a privacy-screen (and to which
GPU,output combo it should be mapped). So if CONFIG_DRM_PRIVACY_SCREEN
is enabled and drm.ko is builtin then it must be builtin too, at which
point it is easiest to just make it part of drm.ko .

And there also is the later added dep from drm_privacy_screen.c on
the drm_class symbol, which means there are now symbol-deps in both
directions, which makes building the code into drm.ko the only option.

> With above tweaks, the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

As I've tried to explain, the includes are necessary, does your
Reviewed-by still stands when I keep the includes ?

> Theoretically one could also remove the `depends on DRM` from patch
> 8/9 but I'm not sure how much that saves us.

The depends in is necessary since CONFIG_DRM_PRIVACY_SCREEN just controls
if privacy-screen support will be added to drm.ko, if it is enabled we
still need drm.ko ti actually be built for things to work.

> HTH

Yes, actually getting a review of this code helps a lot, thank you.

Regards,

Hans

