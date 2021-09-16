Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824F40D4FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245306EB0F;
	Thu, 16 Sep 2021 08:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75CA6EB0F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631782164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk+pxAug/D4PD6XSrOOk26bOAHf8m7uQP2fQrMNsLUM=;
 b=FMHcVkAuxStsLsmbcQL+oVXU+YLy36ps386ztCkefxwiWroM1SDB/POYtGNrCbl9OjLSFg
 9i+9t4kAVIu+tQ9DXOFjHrrJSSwFIx1F3R340r0ut2OzhYEG055eYWR1DxAlAj//wsX/eY
 iXEtN/x+E10HyemE78UdL2qEkCI/9TQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-zwuGFzmiM4GyM8fjtQzR3g-1; Thu, 16 Sep 2021 04:49:23 -0400
X-MC-Unique: zwuGFzmiM4GyM8fjtQzR3g-1
Received: by mail-ed1-f69.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so4624074ede.16
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 01:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uk+pxAug/D4PD6XSrOOk26bOAHf8m7uQP2fQrMNsLUM=;
 b=1d6J9AcVNbvZyH+IWZViZIii0hj3pjYYR8fhIV9Hgyhs1blHGQpDBEERCm49AcG54o
 /l+0ayb6661fFv37c5xAzYhLWd9CJwi0jY9lAvID8o0EzOG/4qDPdM/GC0pDJrNBrrZO
 MQMfuAtGYjJXQpVDbQsDUYV07JxA2es0Qx4J/L0EXqpVxanoVIYK5fUXmNtERXcws1F+
 NRwwVfXORcyaFx/WLduZ/rvhco2psXFfW0upLf3BgiQUMMSDi+a7IqruhCm0kYXCFn5O
 OSxiWhdxaHsrqzCduVMcMoJlRw379bFg8/tXWhp8iqyT1WMIuuhGq0ykJD9ft7o0zRxv
 M17Q==
X-Gm-Message-State: AOAM533+DP/EsMjqSKvRTl7WwieJvOADxFwK2AXkO/ieeVnUndq16D32
 WxWXOk/fjYFXzXk2pse2GOs77Y8Lb+pCxSFi5jPOGedvNHk3TIH16JXmvb9s0fpx1lJApI4o5hN
 2r+rPnDrJL+6SBkw4RJQHtfxzQvAo
X-Received: by 2002:a05:6402:847:: with SMTP id
 b7mr5335390edz.242.1631782161847; 
 Thu, 16 Sep 2021 01:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyKWUwavQsAehIyh8fu3wDF6xV1qy82c4b2zjgzcvXwJdTfgrm/So7rxeboWEsF+QAD7xjAw==
X-Received: by 2002:a05:6402:847:: with SMTP id
 b7mr5335354edz.242.1631782161373; 
 Thu, 16 Sep 2021 01:49:21 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id p23sm1137221edw.94.2021.09.16.01.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 01:49:20 -0700 (PDT)
Subject: Re: [PATCH 2/9] drm: Add privacy-screen class (v3)
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-3-hdegoede@redhat.com>
 <d86ca7609de1b7aacb8e80923019dfa5cfb8c7df.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9f847ccf-2ead-3de5-1aed-8ba58327a0a4@redhat.com>
Date: Thu, 16 Sep 2021 10:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d86ca7609de1b7aacb8e80923019dfa5cfb8c7df.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

Thank you very much for the review of this series.

On 9/15/21 10:01 PM, Lyude Paul wrote:
> On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
>> On some new laptops the LCD panel has a builtin electronic privacy-screen.
>> We want to export this functionality as a property on the drm connector
>> object. But often this functionality is not exposed on the GPU but on some
>> other (ACPI) device.
>>
>> This commit adds a privacy-screen class allowing the driver for these
>> other devices to register themselves as a privacy-screen provider; and
>> allowing the drm/kms code to get a privacy-screen provider associated
>> with a specific GPU/connector combo.
>>
>> Changes in v2:
>> - Make CONFIG_DRM_PRIVACY_SCREEN a bool which controls if the drm_privacy
>>   code gets built as part of the main drm module rather then making it
>>   a tristate which builds its own module.
>> - Add a #if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) check to
>>   drm_privacy_screen_consumer.h and define stubs when the check fails.
>>   Together these 2 changes fix several dependency issues.
>> - Remove module related code now that this is part of the main drm.ko
>> - Use drm_class as class for the privacy-screen devices instead of
>>   adding a separate class for this
>>
>> Changes in v3:
>> - Make the static inline drm_privacy_screen_get_state() stub set sw_state
>>   and hw_state to PRIVACY_SCREEN_DISABLED to squelch an uninitialized
>>   variable warning when CONFIG_DRM_PRIVICAY_SCREEN is not set
>>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  Documentation/gpu/drm-kms-helpers.rst     |  15 +
>>  MAINTAINERS                               |   8 +
>>  drivers/gpu/drm/Kconfig                   |   4 +
>>  drivers/gpu/drm/Makefile                  |   1 +
>>  drivers/gpu/drm/drm_drv.c                 |   4 +
>>  drivers/gpu/drm/drm_privacy_screen.c      | 401 ++++++++++++++++++++++
>>  include/drm/drm_privacy_screen_consumer.h |  50 +++
>>  include/drm/drm_privacy_screen_driver.h   |  80 +++++
>>  include/drm/drm_privacy_screen_machine.h  |  41 +++
>>  9 files changed, 604 insertions(+)
>>  create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
>>  create mode 100644 include/drm/drm_privacy_screen_consumer.h
>>  create mode 100644 include/drm/drm_privacy_screen_driver.h
>>  create mode 100644 include/drm/drm_privacy_screen_machine.h
>>
>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-
>> kms-helpers.rst
>> index 389892f36185..5d8715d2f998 100644
>> --- a/Documentation/gpu/drm-kms-helpers.rst
>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>> @@ -423,3 +423,18 @@ Legacy CRTC/Modeset Helper Functions Reference
>>  
>>  .. kernel-doc:: drivers/gpu/drm/drm_crtc_helper.c
>>     :export:
>> +
>> +Privacy-screen class
>> +====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_privacy_screen.c
>> +   :doc: overview
>> +
>> +.. kernel-doc:: include/drm/drm_privacy_screen_driver.h
>> +   :internal:
>> +
>> +.. kernel-doc:: include/drm/drm_privacy_screen_machine.h
>> +   :internal:
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_privacy_screen.c
>> +   :export:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ede4a37a53b3..a272ca600f98 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -6376,6 +6376,14 @@ F:       drivers/gpu/drm/drm_panel.c
>>  F:     drivers/gpu/drm/panel/
>>  F:     include/drm/drm_panel.h
>>  
>> +DRM PRIVACY-SCREEN CLASS
>> +M:     Hans de Goede <hdegoede@redhat.com>
>> +L:     dri-devel@lists.freedesktop.org
>> +S:     Maintained
>> +T:     git git://anongit.freedesktop.org/drm/drm-misc
>> +F:     drivers/gpu/drm/drm_privacy_screen*
>> +F:     include/drm/drm_privacy_screen*
>> +
>>  DRM TTM SUBSYSTEM
>>  M:     Christian Koenig <christian.koenig@amd.com>
>>  M:     Huang Rui <ray.huang@amd.com>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index b17e231ca6f7..7249b010ab90 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -481,3 +481,7 @@ config DRM_PANEL_ORIENTATION_QUIRKS
>>  config DRM_LIB_RANDOM
>>         bool
>>         default n
>> +
>> +config DRM_PRIVACY_SCREEN
>> +       bool
>> +       default n
> 
> This is probably worth documenting for folks configuring their kernels to
> explain what this actually does (something simple like "Controls programmable
> privacy screens found on some devices, if unsure select Y" would probably be
> fine)

Like the "config DRM_LIB_RANDOM" above it, this is not user selectable,
(notice there is no text after the "bool"), this is selected by drivers
which implement drm-privacy-screen control, such as the thinkpad_acpi
driver.

If no such drivers is selected and thus CONFIG_DRM_PRIVACY_SCREEN is
not enabled then include/drm/drm_privacy_screen_consumer.h
and drm_privacy_screen_machine.h provide no-op stubs so that the
integration with the drm-core still builds without needing #ifdef-s
in the drm-core.


> 
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 0dff40bb863c..788fc37096f6 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -32,6 +32,7 @@ drm-$(CONFIG_OF) += drm_of.o
>>  drm-$(CONFIG_PCI) += drm_pci.o
>>  drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
>> +drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
>>  
>>  obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>>  
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 7a5097467ba5..dc293b771c3f 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -43,6 +43,7 @@
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_mode_object.h>
>>  #include <drm/drm_print.h>
>> +#include <drm/drm_privacy_screen_machine.h>
>>  
>>  #include "drm_crtc_internal.h"
>>  #include "drm_internal.h"
>> @@ -1029,6 +1030,7 @@ static const struct file_operations drm_stub_fops = {
>>  
>>  static void drm_core_exit(void)
>>  {
>> +       drm_privacy_screen_lookup_exit();
>>         unregister_chrdev(DRM_MAJOR, "drm");
>>         debugfs_remove(drm_debugfs_root);
>>         drm_sysfs_destroy();
>> @@ -1056,6 +1058,8 @@ static int __init drm_core_init(void)
>>         if (ret < 0)
>>                 goto error;
>>  
>> +       drm_privacy_screen_lookup_init();
>> +
>>         drm_core_init_complete = true;
>>  
>>         DRM_DEBUG("Initialized\n");
>> diff --git a/drivers/gpu/drm/drm_privacy_screen.c
>> b/drivers/gpu/drm/drm_privacy_screen.c
>> new file mode 100644
>> index 000000000000..294a09194bfb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
>> @@ -0,0 +1,401 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (C) 2020 - 2021 Red Hat, Inc.
>> + *
>> + * Authors:
>> + * Hans de Goede <hdegoede@redhat.com>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/slab.h>
>> +#include <drm/drm_privacy_screen_machine.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>> +#include <drm/drm_privacy_screen_driver.h>
>> +#include "drm_internal.h"
>> +
>> +/**
>> + * DOC: overview
>> + *
>> + * This class allows non KMS drivers, from e.g. drivers/platform/x86 to
>> + * register a privacy-screen device, which the KMS drivers can then use
>> + * to implement the standard privacy-screen properties, see
>> + * :ref:`Standard Connector Properties<standard_connector_properties>`.
>> + *
>> + * KMS drivers using a privacy-screen class device are advised to use the
>> + * drm_connector_attach_privacy_screen_provider() and
>> + * drm_connector_update_privacy_screen() helpers for dealing with this.
>> + */
>> +
>> +#define to_drm_privacy_screen(dev) \
>> +       container_of(dev, struct drm_privacy_screen, dev)
>> +
>> +static DEFINE_MUTEX(drm_privacy_screen_lookup_lock);
>> +static LIST_HEAD(drm_privacy_screen_lookup_list);
>> +
>> +static DEFINE_MUTEX(drm_privacy_screen_devs_lock);
>> +static LIST_HEAD(drm_privacy_screen_devs);
>> +
>> +/*** drm_privacy_screen_machine.h functions ***/
>> +
>> +/**
>> + * drm_privacy_screen_lookup_add - add an entry to the static privacy-
>> screen
>> + *    lookup list
>> + * @lookup: lookup list entry to add
>> + *
>> + * Add an entry to the static privacy-screen lookup list. Note the
>> + * &struct list_head which is part of the &struct drm_privacy_screen_lookup
>> + * gets added to a list owned by the privacy-screen core. So the passed in
>> + * &struct drm_privacy_screen_lookup must not be free-ed until it is
>> removed
>> + * from the lookup list by calling drm_privacy_screen_lookup_remove().
>> + */
>> +void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup
>> *lookup)
>> +{
>> +       mutex_lock(&drm_privacy_screen_lookup_lock);
>> +       list_add(&lookup->list, &drm_privacy_screen_lookup_list);
>> +       mutex_unlock(&drm_privacy_screen_lookup_lock);
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_lookup_add);
>> +
>> +/**
>> + * drm_privacy_screen_lookup_remove - remove an entry to the static
>> + *    privacy-screen lookup list
>> + * @lookup: lookup list entry to remove
>> + *
>> + * Remove an entry previously added with drm_privacy_screen_lookup_add()
>> + * from the static privacy-screen lookup list.
>> + */
>> +void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup
>> *lookup)
>> +{
>> +       mutex_lock(&drm_privacy_screen_lookup_lock);
>> +       list_del(&lookup->list);
>> +       mutex_unlock(&drm_privacy_screen_lookup_lock);
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_lookup_remove);
>> +
>> +/*** drm_privacy_screen_consumer.h functions ***/
>> +
>> +static struct drm_privacy_screen *drm_privacy_screen_get_by_name(
>> +       const char *name)
>> +{
>> +       struct drm_privacy_screen *priv;
>> +       struct device *dev = NULL;
>> +
>> +       mutex_lock(&drm_privacy_screen_devs_lock);
>> +
>> +       list_for_each_entry(priv, &drm_privacy_screen_devs, list) {
>> +               if (strcmp(dev_name(&priv->dev), name) == 0) {
>> +                       dev = get_device(&priv->dev);
>> +                       break;
>> +               }
>> +       }
>> +
>> +       mutex_unlock(&drm_privacy_screen_devs_lock);
>> +
>> +       return dev ? to_drm_privacy_screen(dev) : NULL;
>> +}
>> +
>> +/**
>> + * drm_privacy_screen_get - get a privacy-screen provider
>> + * @dev: consumer-device for which to get a privacy-screen provider
>> + * @con_id: (video)connector name for which to get a privacy-screen
>> provider
>> + *
>> + * Get a privacy-screen provider for a privacy-screen attached to the
>> + * display described by the @dev and @con_id parameters.
>> + *
>> + * Return:
>> + * * A pointer to a &struct drm_privacy_screen on success.
>> + * * ERR_PTR(-ENODEV) if no matching privacy-screen is found
>> + * * ERR_PTR(-EPROBE_DEFER) if there is a matching privacy-screen,
>> + *                          but it has not been registered yet.
>> + */
>> +struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
>> +                                                 const char *con_id)
>> +{
>> +       const char *dev_id = dev ? dev_name(dev) : NULL;
>> +       struct drm_privacy_screen_lookup *l;
>> +       struct drm_privacy_screen *priv;
>> +       const char *provider = NULL;
>> +       int match, best = -1;
>> +
>> +       /*
>> +        * For now we only support using a static lookup table, which is
>> +        * populated by the drm_privacy_screen_arch_init() call. This should
>> +        * be extended with device-tree / fw_node lookup when support is
>> added
>> +        * for device-tree using hardware with a privacy-screen.
>> +        *
>> +        * The lookup algorithm was shamelessly taken from the clock
>> +        * framework:
>> +        *
>> +        * We do slightly fuzzy matching here:
>> +        *  An entry with a NULL ID is assumed to be a wildcard.
>> +        *  If an entry has a device ID, it must match
>> +        *  If an entry has a connection ID, it must match
>> +        * Then we take the most specific entry - with the following order
>> +        * of precedence: dev+con > dev only > con only.
>> +        */
>> +       mutex_lock(&drm_privacy_screen_lookup_lock);
>> +
>> +       list_for_each_entry(l, &drm_privacy_screen_lookup_list, list) {
>> +               match = 0;
>> +
>> +               if (l->dev_id) {
>> +                       if (!dev_id || strcmp(l->dev_id, dev_id))
>> +                               continue;
>> +
>> +                       match += 2;
>> +               }
>> +
>> +               if (l->con_id) {
>> +                       if (!con_id || strcmp(l->con_id, con_id))
>> +                               continue;
>> +
>> +                       match += 1;
>> +               }
>> +
>> +               if (match > best) {
>> +                       provider = l->provider;
>> +                       best = match;
>> +               }
>> +       }
>> +
>> +       mutex_unlock(&drm_privacy_screen_lookup_lock);
>> +
>> +       if (!provider)
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       priv = drm_privacy_screen_get_by_name(provider);
>> +       if (!priv)
>> +               return ERR_PTR(-EPROBE_DEFER);
>> +
>> +       return priv;
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_get);
>> +
>> +/**
>> + * drm_privacy_screen_put - release a privacy-screen reference
>> + * @priv: privacy screen reference to release
>> + *
>> + * Release a privacy-screen provider reference gotten through
>> + * drm_privacy_screen_get(). May be called with a NULL or ERR_PTR,
>> + * in which case it is a no-op.
>> + */
>> +void drm_privacy_screen_put(struct drm_privacy_screen *priv)
>> +{
>> +       if (IS_ERR_OR_NULL(priv))
>> +               return;
>> +
>> +       put_device(&priv->dev);
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_put);
>> +
>> +/**
>> + * drm_privacy_screen_set_sw_state - set a privacy-screen's sw-state
>> + * @priv: privacy screen to set the sw-state for
>> + * @sw_state: new sw-state value to set
>> + *
>> + * Set the sw-state of a privacy screen. If the privacy-screen is not
>> + * in a locked hw-state, then the actual and hw-state of the privacy-screen
>> + * will be immediately updated to the new value. If the privacy-screen is
>> + * in a locked hw-state, then the new sw-state will be remembered as the
>> + * requested state to put the privacy-screen in when it becomes unlocked.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
>> +                                   enum drm_privacy_screen_status sw_state)
>> +{
>> +       int ret = 0;
>> +
>> +       mutex_lock(&priv->lock);
>> +
>> +       if (!priv->ops) {
>> +               ret = -ENODEV;
>> +               goto out;
>> +       }
>> +
>> +       /*
>> +        * As per the DRM connector properties documentation, setting the
>> +        * sw_state while the hw_state is locked is allowed. In this case
>> +        * it is a no-op other then storing the new sw_state so that it
>> +        * can be honored when the state gets unlocked.
>> +        */
>> +       if (priv->hw_state >= PRIVACY_SCREEN_DISABLED_LOCKED) {
>> +               priv->sw_state = sw_state;
>> +               goto out;
>> +       }
>> +
>> +       ret = priv->ops->set_sw_state(priv, sw_state);
>> +out:
>> +       mutex_unlock(&priv->lock);
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_set_sw_state);
>> +
>> +/**
>> + * drm_privacy_screen_get_state - get privacy-screen's current state
>> + * @priv: privacy screen to get the state for
>> + * @sw_state_ret: address where to store the privacy-screens current sw-
>> state
>> + * @hw_state_ret: address where to store the privacy-screens current hw-
>> state
>> + *
>> + * Get the current state of a privacy-screen, both the sw-state and the
>> + * hw-state.
>> + */
>> +void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
>> +                                 enum drm_privacy_screen_status
>> *sw_state_ret,
>> +                                 enum drm_privacy_screen_status
>> *hw_state_ret)
>> +{
>> +       mutex_lock(&priv->lock);
>> +       *sw_state_ret = priv->sw_state;
>> +       *hw_state_ret = priv->hw_state;
>> +       mutex_unlock(&priv->lock);
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_get_state);
>> +
>> +/*** drm_privacy_screen_driver.h functions ***/
>> +
>> +static ssize_t sw_state_show(struct device *dev,
>> +                            struct device_attribute *attr, char *buf)
>> +{
>> +       struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
>> +       const char * const sw_state_names[] = {
>> +               "Disabled",
>> +               "Enabled",
>> +       };
>> +       ssize_t ret;
>> +
>> +       mutex_lock(&priv->lock);
>> +
>> +       if (!priv->ops)
>> +               ret = -ENODEV;
>> +       else if (WARN_ON(priv->sw_state >= ARRAY_SIZE(sw_state_names)))
>> +               ret = -ENXIO;
>> +       else
>> +               ret = sprintf(buf, "%s\n", sw_state_names[priv->sw_state]);
>> +
>> +       mutex_unlock(&priv->lock);
>> +       return ret;
>> +}
>> +/*
>> + * RO: Do not allow setting the sw_state through sysfs, this MUST be done
>> + * through the drm_properties on the drm_connector.
>> + */
>> +static DEVICE_ATTR_RO(sw_state);
>> +
>> +static ssize_t hw_state_show(struct device *dev,
>> +                            struct device_attribute *attr, char *buf)
>> +{
>> +       struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
>> +       const char * const hw_state_names[] = {
>> +               "Disabled",
>> +               "Enabled",
>> +               "Disabled, locked",
>> +               "Enabled, locked",
>> +       };
>> +       ssize_t ret;
>> +
>> +       mutex_lock(&priv->lock);
>> +
>> +       if (!priv->ops)
>> +               ret = -ENODEV;
>> +       else if (WARN_ON(priv->hw_state >= ARRAY_SIZE(hw_state_names)))
>> +               ret = -ENXIO;
>> +       else
>> +               ret = sprintf(buf, "%s\n", hw_state_names[priv->hw_state]);
>> +
>> +       mutex_unlock(&priv->lock);
>> +       return ret;
>> +}
>> +static DEVICE_ATTR_RO(hw_state);
>> +
>> +static struct attribute *drm_privacy_screen_attrs[] = {
>> +       &dev_attr_sw_state.attr,
>> +       &dev_attr_hw_state.attr,
>> +       NULL
>> +};
>> +ATTRIBUTE_GROUPS(drm_privacy_screen);
>> +
>> +static struct device_type drm_privacy_screen_type = {
>> +       .name = "privacy_screen",
>> +       .groups = drm_privacy_screen_groups,
>> +};
>> +
>> +static void drm_privacy_screen_device_release(struct device *dev)
>> +{
>> +       struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
>> +
>> +       kfree(priv);
>> +}
>> +
>> +/**
>> + * drm_privacy_screen_register - register a privacy-screen
>> + * @parent: parent-device for the privacy-screen
>> + * @ops: &struct drm_privacy_screen_ops pointer with ops for the privacy-
>> screen
>> + *
>> + * Create and register a privacy-screen.
>> + *
>> + * Return:
>> + * * A pointer to the created privacy-screen on success.
>> + * * An ERR_PTR(errno) on failure.
>> + */
>> +struct drm_privacy_screen *drm_privacy_screen_register(
>> +       struct device *parent, const struct drm_privacy_screen_ops *ops)
>> +{
>> +       struct drm_privacy_screen *priv;
>> +       int ret;
>> +
>> +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       mutex_init(&priv->lock);
>> +
>> +       priv->dev.class = drm_class;
>> +       priv->dev.type = &drm_privacy_screen_type;
>> +       priv->dev.parent = parent;
>> +       priv->dev.release = drm_privacy_screen_device_release;
>> +       dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
>> +       priv->ops = ops;
>> +
>> +       priv->ops->get_hw_state(priv);
>> +
>> +       ret = device_register(&priv->dev);
>> +       if (ret) {
>> +               put_device(&priv->dev);
>> +               return ERR_PTR(ret);
>> +       }
>> +
>> +       mutex_lock(&drm_privacy_screen_devs_lock);
>> +       list_add(&priv->list, &drm_privacy_screen_devs);
>> +       mutex_unlock(&drm_privacy_screen_devs_lock);
>> +
>> +       return priv;
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_register);
>> +
>> +/**
>> + * drm_privacy_screen_unregister - unregister privacy-screen
>> + * @priv: privacy-screen to unregister
>> + *
>> + * Unregister a privacy-screen registered with
>> drm_privacy_screen_register().
>> + * May be called with a NULL or ERR_PTR, in which case it is a no-op.
>> + */
>> +void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
>> +{
>> +       if (IS_ERR_OR_NULL(priv))
>> +               return;
>> +
>> +       mutex_lock(&drm_privacy_screen_devs_lock);
>> +       list_del(&priv->list);
>> +       mutex_unlock(&drm_privacy_screen_devs_lock);
>> +
>> +       mutex_lock(&priv->lock);
>> +       priv->ops = NULL;
>> +       mutex_unlock(&priv->lock);
>> +
>> +       device_unregister(&priv->dev);
>> +}
>> +EXPORT_SYMBOL(drm_privacy_screen_unregister);
>> diff --git a/include/drm/drm_privacy_screen_consumer.h
>> b/include/drm/drm_privacy_screen_consumer.h
>> new file mode 100644
>> index 000000000000..0cbd23b0453d
>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_consumer.h
>> @@ -0,0 +1,50 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (C) 2020 Red Hat, Inc.
>> + *
>> + * Authors:
>> + * Hans de Goede <hdegoede@redhat.com>
>> + */
>> +
>> +#ifndef __DRM_PRIVACY_SCREEN_CONSUMER_H__
>> +#define __DRM_PRIVACY_SCREEN_CONSUMER_H__
>> +
>> +#include <linux/device.h>
>> +#include <drm/drm_connector.h>
>> +
>> +struct drm_privacy_screen;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN)
>> +struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
>> +                                                 const char *con_id);
>> +void drm_privacy_screen_put(struct drm_privacy_screen *priv);
>> +
>> +int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
>> +                                   enum drm_privacy_screen_status
>> sw_state);
>> +void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
>> +                                 enum drm_privacy_screen_status
>> *sw_state_ret,
>> +                                 enum drm_privacy_screen_status
>> *hw_state_ret);
>> +#else
>> +static inline struct drm_privacy_screen *drm_privacy_screen_get(struct
>> device *dev,
>> +                                                               const char
>> *con_id)
>> +{
>> +       return ERR_PTR(-ENODEV);
>> +}
>> +static inline void drm_privacy_screen_put(struct drm_privacy_screen *priv)
>> +{
>> +}
>> +static inline int drm_privacy_screen_set_sw_state(struct drm_privacy_screen
>> *priv,
>> +                                                 enum
>> drm_privacy_screen_status sw_state)
>> +{
>> +       return -ENODEV;
>> +}
>> +static inline void drm_privacy_screen_get_state(struct drm_privacy_screen
>> *priv,
>> +                                               enum
>> drm_privacy_screen_status *sw_state_ret,
>> +                                               enum
>> drm_privacy_screen_status *hw_state_ret)
>> +{
>> +       *sw_state_ret = PRIVACY_SCREEN_DISABLED;
>> +       *hw_state_ret = PRIVACY_SCREEN_DISABLED;
>> +}
>> +#endif
>> +
>> +#endif
>> diff --git a/include/drm/drm_privacy_screen_driver.h
>> b/include/drm/drm_privacy_screen_driver.h
>> new file mode 100644
>> index 000000000000..5187ae52eb03
>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_driver.h
>> @@ -0,0 +1,80 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (C) 2020 Red Hat, Inc.
>> + *
>> + * Authors:
>> + * Hans de Goede <hdegoede@redhat.com>
>> + */
>> +
>> +#ifndef __DRM_PRIVACY_SCREEN_DRIVER_H__
>> +#define __DRM_PRIVACY_SCREEN_DRIVER_H__
>> +
>> +#include <linux/device.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <drm/drm_connector.h>
>> +
>> +struct drm_privacy_screen;
>> +
>> +/**
>> + * struct drm_privacy_screen_ops - drm_privacy_screen operations
>> + *
>> + * Defines the operations which the privacy-screen class code may call.
>> + * These functions should be implemented by the privacy-screen driver.
>> + */
>> +struct drm_privacy_screen_ops {
>> +       /**
>> +        * @set_sw_state: Called to request a change of the privacy-screen
>> +        * state. The privacy-screen class code contains a check to avoid
>> this
>> +        * getting called when the hw_state reports the state is locked.
>> +        * It is the driver's responsibility to update sw_state and
>> hw_state.
>> +        * This is always called with the drm_privacy_screen's lock held.
>> +        */
>> +       int (*set_sw_state)(struct drm_privacy_screen *priv,
>> +                           enum drm_privacy_screen_status sw_state);
>> +       /**
>> +        * @get_hw_state: Called to request that the driver gets the current
>> +        * privacy-screen state from the hardware and then updates sw_state
>> and
>> +        * hw_state accordingly. This will be called by the core just before
>> +        * the privacy-screen is registered in sysfs.
>> +        */
>> +       void (*get_hw_state)(struct drm_privacy_screen *priv);
>> +};
>> +
>> +/**
>> + * struct drm_privacy_screen - central privacy-screen structure
>> + *
>> + * Central privacy-screen structure, this contains the struct device used
>> + * to register the screen in sysfs, the screen's state, ops, etc.
>> + */
>> +struct drm_privacy_screen {
>> +       /** @dev: device used to register the privacy-screen in sysfs. */
>> +       struct device dev;
>> +       /** @lock: mutex protection all fields in this struct. */
>> +       struct mutex lock;
>> +       /** @list: privacy-screen devices list list-entry. */
>> +       struct list_head list;
>> +       /**
>> +        * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
>> +        * This is NULL if the driver has unregistered the privacy-screen.
>> +        */
>> +       const struct drm_privacy_screen_ops *ops;
>> +       /**
>> +        * @sw_state: The privacy-screen's software state, see
>> +        * :ref:`Standard Connector
>> Properties<standard_connector_properties>`
>> +        * for more info.
>> +        */
>> +       enum drm_privacy_screen_status sw_state;
>> +       /**
>> +        * @hw_state: The privacy-screen's hardware state, see
>> +        * :ref:`Standard Connector
>> Properties<standard_connector_properties>`
>> +        * for more info.
>> +        */
>> +       enum drm_privacy_screen_status hw_state;
>> +};
>> +
>> +struct drm_privacy_screen *drm_privacy_screen_register(
>> +       struct device *parent, const struct drm_privacy_screen_ops *ops);
>> +void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
>> +
>> +#endif
>> diff --git a/include/drm/drm_privacy_screen_machine.h
>> b/include/drm/drm_privacy_screen_machine.h
>> new file mode 100644
>> index 000000000000..aaa0d38cce92
>> --- /dev/null
>> +++ b/include/drm/drm_privacy_screen_machine.h
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright (C) 2020 Red Hat, Inc.
>> + *
>> + * Authors:
>> + * Hans de Goede <hdegoede@redhat.com>
>> + */
>> +
>> +#ifndef __DRM_PRIVACY_SCREEN_MACHINE_H__
>> +#define __DRM_PRIVACY_SCREEN_MACHINE_H__
>> +
>> +#include <linux/list.h>
>> +
>> +/**
>> + * struct drm_privacy_screen_lookup -  static privacy-screen lookup list
>> entry
>> + *
>> + * Used for the static lookup-list for mapping privacy-screen consumer
>> + * dev-connector pairs to a privacy-screen provider.
>> + */
>> +struct drm_privacy_screen_lookup {
>> +       /** @list: Lookup list list-entry. */
>> +       struct list_head list;
>> +       /** @dev_id: Consumer device name or NULL to match all devices. */
>> +       const char *dev_id;
>> +       /** @con_id: Consumer connector name or NULL to match all
>> connectors. */
> 
> I think this patch mostly looks good, the one part that I'm a little confused
> on here is the con_id. Perhaps I missed this when looking over this patch, but
> what "connector name" are we referring to here - the DRM connector name (e.g.
> eDP-1), or something else?

Yes con_id refers to the DRM connector name. 

> The reason I ask is because I wonder if connector
> names are really the way that we want to be looking DRM connectors up, since I
> believe it's possible for two different GPUs to have DRM connectors with the
> same name.

Right this is why the lookup matches on both the GPU's (consumer's (1))
dev_name and the con_id, the combination of these should always by
unique.

I hope this helps explain how this is intended to work
(and works on the ThinkPad T14 gen 1 which I have tested this on).

Regards,

Hans



1) The consumer is the GPU device/driver which wants to tie a
drm-privacy-screen control provider to a LCD-panel output.



> 
>> +       const char *con_id;
>> +       /** @provider: dev_name() of the privacy_screen provider. */
>> +       const char *provider;
>> +};
>> +
>> +void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup
>> *lookup);
>> +void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup
>> *lookup);
>> +
>> +static inline void drm_privacy_screen_lookup_init(void)
>> +{
>> +}
>> +static inline void drm_privacy_screen_lookup_exit(void)
>> +{
>> +}
>> +
>> +#endif
> 

