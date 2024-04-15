Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186DA8A4F93
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BD2112539;
	Mon, 15 Apr 2024 12:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="TSkdZsu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF86112537
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:50:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so2671079f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713185420; x=1713790220;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vtkFtEeI8u9n0wGYtFb1Gs5PYCsfANTu3fNjyimbUfo=;
 b=TSkdZsu+igK8PgJCjlP0lEOHjOjSXRDovt+O4L/kx0mAGt61qBVd7MNzYa3vrlBPoD
 rxWRFXl5b92Pd6H+C2+ixzW/SiSs3D8Olu8WdksJkc5J3y6zhSS9XsTJ9UfJf3x87qIL
 AJBapIlPhZ9Jbvb4Vcsy+YFMLLoXY5ajrdzt7U+I3WJGqK5GgJMNmwsCtejwDl4EvXpX
 2fp8IVP5LuSGmjnDuI9DdetrOAs1k51URClnSKF64HgbeHTHCJHr6nDq/MtzNtbN6NpY
 LaNFBwUr2U0oqbm8yYHOky0Gh4t8UBtAGgF+BVV7QHi6ne/Wc8k/Q/j/yMwzaZlO75Uh
 M06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185420; x=1713790220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vtkFtEeI8u9n0wGYtFb1Gs5PYCsfANTu3fNjyimbUfo=;
 b=j2ORhj/ypOjKcZRx6ZG0enVCy7EK1uqPvLwzcKFvzS/BBwsC3DKB7gXynVv+aYpma2
 mBBwg1xbp7BWdDh9C4szsjVvWI69eLDIyWyyDY6qoGvP3n21H0K04A0wBPVd7XcJj6n7
 VRr0sBp3r3z9miNatCggq20277gcYRcboRuOHlyHVmPbkFDTlKwlYlQei3oJeLYr9UJ9
 gnfnHnAYGdAF4GFATRIiJKUO1Qb5KujJEE3Y4V66zi/kpi9ORio/H881h1r2Xdm9Y3I9
 jAneHY67NCrJZVQSX+lqkcaCgrdwEX+0R8Qt+Xy30yydXPZpu44mI6yVb/TyM8DasUjy
 wjtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Hv469ILz4UjTwIG7mfJBTd0knwJc4+lpDzldhYyeb28F0JjI/hD1Tct+raiPF69xPdUALu5Syp2pwDjmxrMPSEZ9t21a7anXdFIaipZA
X-Gm-Message-State: AOJu0YwQq1R3heSgNR3dhuE/sqmxFK2SS1nXKsZp3WpwIGzs2Bgj1bYO
 PYPC96+PGVpQPl+ceB6nva/BGg88scO9iM9QvZ8b5TsXTwUbsy11vXTpjuUClKk=
X-Google-Smtp-Source: AGHT+IGZl+ILMkIODDgIrM//G0ZKVMCt78xec3x9yWjOU+g4XwOCKrIzqWful5fTFk12zh8yATnoCQ==
X-Received: by 2002:a5d:6daa:0:b0:343:b5dd:f6a6 with SMTP id
 u10-20020a5d6daa000000b00343b5ddf6a6mr7347592wrs.4.1713185420244; 
 Mon, 15 Apr 2024 05:50:20 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 b11-20020adfe30b000000b0034625392416sm12040391wrj.104.2024.04.15.05.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 05:50:19 -0700 (PDT)
Message-ID: <e6500d5b-0151-4c31-9032-3a23157b3126@ursulin.net>
Date: Mon, 15 Apr 2024 13:50:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sysfs: Add drm class-wide attribute to get active
 device clients
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240403182951.724488-1-adrian.larumbe@collabora.com>
 <CAF6AEGsWtJs2xcZx59P9_maxn1RqCO6-4GwEp2fL31bZtTyuoA@mail.gmail.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAF6AEGsWtJs2xcZx59P9_maxn1RqCO6-4GwEp2fL31bZtTyuoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 05/04/2024 18:59, Rob Clark wrote:
> On Wed, Apr 3, 2024 at 11:37 AM Adrián Larumbe
> <adrian.larumbe@collabora.com> wrote:
>>
>> Up to this day, all fdinfo-based GPU profilers must traverse the entire
>> /proc directory structure to find open DRM clients with fdinfo file
>> descriptors. This is inefficient and time-consuming.
>>
>> This patch adds a new device class attribute that will install a sysfs file
>> per DRM device, which can be queried by profilers to get a list of PIDs for
>> their open clients. This file isn't human-readable, and it's meant to be
>> queried only by GPU profilers like gputop and nvtop.
>>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>> Cc: Christopher Healy <healych@amazon.com>
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> It does seem like a good idea.. idk if there is some precedent to
> prefer binary vs ascii in sysfs, but having a way to avoid walking
> _all_ processes is a good idea.

I naturally second that it is a needed feature, but I do not think 
binary format is justified. AFAIR it should be used for things like 
hw/fw standardised tables or firmware images, not when exporting a 
simple list of PIDs. It also precludes easy shell/script access and the 
benefit of avoiding parsing a short list is I suspect completely dwarfed 
by needing to parse all the related fdinfo etc.

>> ---
>>   drivers/gpu/drm/drm_internal.h       |  2 +-
>>   drivers/gpu/drm/drm_privacy_screen.c |  2 +-
>>   drivers/gpu/drm/drm_sysfs.c          | 89 ++++++++++++++++++++++------
>>   3 files changed, 74 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index 2215baef9a3e..9a399b03d11c 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -145,7 +145,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
>>   void drm_master_internal_release(struct drm_device *dev);
>>
>>   /* drm_sysfs.c */
>> -extern struct class *drm_class;
>> +extern struct class drm_class;
>>
>>   int drm_sysfs_init(void);
>>   void drm_sysfs_destroy(void);
>> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
>> index 6cc39e30781f..2fbd24ba5818 100644
>> --- a/drivers/gpu/drm/drm_privacy_screen.c
>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
>> @@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>>          mutex_init(&priv->lock);
>>          BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>>
>> -       priv->dev.class = drm_class;
>> +       priv->dev.class = &drm_class;
>>          priv->dev.type = &drm_privacy_screen_type;
>>          priv->dev.parent = parent;
>>          priv->dev.release = drm_privacy_screen_device_release;
>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>> index a953f69a34b6..56ca9e22c720 100644
>> --- a/drivers/gpu/drm/drm_sysfs.c
>> +++ b/drivers/gpu/drm/drm_sysfs.c
>> @@ -58,8 +58,6 @@ static struct device_type drm_sysfs_device_connector = {
>>          .name = "drm_connector",
>>   };
>>
>> -struct class *drm_class;
>> -
>>   #ifdef CONFIG_ACPI
>>   static bool drm_connector_acpi_bus_match(struct device *dev)
>>   {
>> @@ -128,6 +126,62 @@ static const struct component_ops typec_connector_ops = {
>>
>>   static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>>
>> +static ssize_t clients_show(struct device *cd, struct device_attribute *attr, char *buf)
>> +{
>> +       struct drm_minor *minor = cd->driver_data;
>> +       struct drm_device *ddev = minor->dev;
>> +       struct drm_file *priv;
>> +       ssize_t offset = 0;
>> +       void *pid_buf;
>> +
>> +       if (minor->type != DRM_MINOR_RENDER)
>> +               return 0;

Why this?

>> +
>> +       pid_buf = kvmalloc(PAGE_SIZE, GFP_KERNEL);

I don't quite get the kvmalloc for just one page (or why even a temporay 
buffer and not write into buf directly?).

>> +       if (!pid_buf)
>> +               return 0;
>> +
>> +       mutex_lock(&ddev->filelist_mutex);
>> +       list_for_each_entry_reverse(priv, &ddev->filelist, lhead) {
>> +               struct pid *pid;
>> +
>> +               if (drm_WARN_ON(ddev, (PAGE_SIZE - offset) < sizeof(pid_t)))
>> +                       break;

Feels bad.. I would suggest exploring implementing a read callback 
(instead of show) and handling arbitrary size output.

>> +
>> +               rcu_read_lock();
>> +               pid = rcu_dereference(priv->pid);
>> +               (*(pid_t *)(pid_buf + offset)) = pid_vnr(pid);
>> +               rcu_read_unlock();
>> +
>> +               offset += sizeof(pid_t);
>> +       }
>> +       mutex_unlock(&ddev->filelist_mutex);
>> +
>> +       if (offset < PAGE_SIZE)
>> +               (*(pid_t *)(pid_buf + offset)) = 0;

Either NULL terminated or PAGE_SIZE/sizeof(pid) entries and not NULL 
terminated feels weird. If I got that right.

For me everything points towards going for text output.

>> +
>> +       memcpy(buf, pid_buf, offset);
>> +
>> +       kvfree(pid_buf);
>> +
>> +       return offset;
>> +
>> +}
>> +static DEVICE_ATTR_RO(clients);

Shouldn't BIN_ATTR_RO be used for binary files in sysfs?

Regards,

Tvrtko

P.S. Or maybe it is time for drmfs? Where each client gets a directory 
and drivers can populate files. Such as per client logging streams and 
whatnot.

>> +
>> +static struct attribute *drm_device_attrs[] = {
>> +       &dev_attr_clients.attr,
>> +       NULL,
>> +};
>> +ATTRIBUTE_GROUPS(drm_device);
>> +
>> +struct class drm_class = {
>> +       .name           = "drm",
>> +       .dev_groups     = drm_device_groups,
>> +};
>> +
>> +static bool drm_class_initialised;
>> +
>>   /**
>>    * drm_sysfs_init - initialize sysfs helpers
>>    *
>> @@ -142,18 +196,19 @@ int drm_sysfs_init(void)
>>   {
>>          int err;
>>
>> -       drm_class = class_create("drm");
>> -       if (IS_ERR(drm_class))
>> -               return PTR_ERR(drm_class);
>> +       err = class_register(&drm_class);
>> +       if (err)
>> +               return err;
>>
>> -       err = class_create_file(drm_class, &class_attr_version.attr);
>> +       err = class_create_file(&drm_class, &class_attr_version.attr);
>>          if (err) {
>> -               class_destroy(drm_class);
>> -               drm_class = NULL;
>> +               class_destroy(&drm_class);
>>                  return err;
>>          }
>>
>> -       drm_class->devnode = drm_devnode;
>> +       drm_class.devnode = drm_devnode;
>> +
>> +       drm_class_initialised = true;
>>
>>          drm_sysfs_acpi_register();
>>          return 0;
>> @@ -166,12 +221,12 @@ int drm_sysfs_init(void)
>>    */
>>   void drm_sysfs_destroy(void)
>>   {
>> -       if (IS_ERR_OR_NULL(drm_class))
>> +       if (!drm_class_initialised)
>>                  return;
>>          drm_sysfs_acpi_unregister();
>> -       class_remove_file(drm_class, &class_attr_version.attr);
>> -       class_destroy(drm_class);
>> -       drm_class = NULL;
>> +       class_remove_file(&drm_class, &class_attr_version.attr);
>> +       class_destroy(&drm_class);
>> +       drm_class_initialised = false;
>>   }
>>
>>   static void drm_sysfs_release(struct device *dev)
>> @@ -372,7 +427,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>>                  return -ENOMEM;
>>
>>          device_initialize(kdev);
>> -       kdev->class = drm_class;
>> +       kdev->class = &drm_class;
>>          kdev->type = &drm_sysfs_device_connector;
>>          kdev->parent = dev->primary->kdev;
>>          kdev->groups = connector_dev_groups;
>> @@ -550,7 +605,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>>                          minor_str = "card%d";
>>
>>                  kdev->devt = MKDEV(DRM_MAJOR, minor->index);
>> -               kdev->class = drm_class;
>> +               kdev->class = &drm_class;
>>                  kdev->type = &drm_sysfs_device_minor;
>>          }
>>
>> @@ -579,10 +634,10 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>>    */
>>   int drm_class_device_register(struct device *dev)
>>   {
>> -       if (!drm_class || IS_ERR(drm_class))
>> +       if (!drm_class_initialised)
>>                  return -ENOENT;
>>
>> -       dev->class = drm_class;
>> +       dev->class = &drm_class;
>>          return device_register(dev);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_class_device_register);
>>
>> base-commit: 45c734fdd43db14444025910b4c59dd2b8be714a
>> --
>> 2.44.0
>>
