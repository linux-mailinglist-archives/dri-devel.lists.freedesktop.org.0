Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29628B8D8D
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 17:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1578110E717;
	Wed,  1 May 2024 15:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="JvZ/Te27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF67D10E717
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 15:58:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41c1b75ca31so26802415e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1714579087; x=1715183887;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IM1Q38Vixc5rGoB4SXPdlKbe9Yze7I43pEzyGZNiY0c=;
 b=JvZ/Te27sB+ncvd5dcz0+bYtak4fXEg7y2XIt43hMwMVFiKzT32E6tUHWZfwZ8jov1
 0DCOfTlUQpQQJELvPUucwLQ8I1Tg3VPf4vJWRfsUJ5D6H4IUf1lw7XqaQGkqbNf2rB+D
 39WNJzqn8VCVTsFMEzYs8Z4EXAGqkeA9+NlvIPQg294KxuDolQoA7aOEfxf0CNtWFnRN
 b6D4+nZyFk6oWTE/blSHxAe4pyl7IW2zOvAdmnCPeE5NJVHU8AQ2QeqUetuG3RvVLOaB
 OXHn/7TxuxFKhxIZ5L825O7UGUxP75suQgLXyIsZOness3Og9YjcZOn9hfRtV52KN3Iz
 41fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714579087; x=1715183887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IM1Q38Vixc5rGoB4SXPdlKbe9Yze7I43pEzyGZNiY0c=;
 b=AiauwiA2najgWbrNenXUgfyQO1uakvzXEUFIsjmXbK49bqOZScD0JpQlk8DauQ7lHY
 1xFwkFYV8KNz6uhBHWAYuoOqR6CVPl9eeUdSa+KgCNqNTnNrwBbNS30QpahiIEx+fbNZ
 sRkqyP637Q/p9BUQLgpraJoWKP2UZWYbpxdpl65Hw01cxh2jIIQgeTZt7Hx4N8j5mviR
 pqQYIayJQ1XquPPnpGn0ZPddSm7zbB/1PmDQFAxHFOy2HiKNg7FIexXUnfjaG7l6Gie3
 MgkNvbxHA9VBZ+ZKQmNYG1PWLbHlRoEgkHWqXvRyEjk+5iI38RAH72d21k+dQLaGQ5ll
 6qBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFhvnQPQS7pjGCAzKwPMladTvhvmaUcLpG20/UiTcibUNo+pr+OqUR7KjXXZuX96BtnSbEWcwAzlbwyOLBsTRBFjtCgE1AqEZ1z3uwr6Kw
X-Gm-Message-State: AOJu0YyK91UQw1kafm5SOOmk7mSja5sWQvBqOYgG7wGXBdRHF3PvP6Y/
 ADwh179jZDP6eysueRVB4XMXLwGOTHyUOSTQKRU8Jr3SS4CgF/csB3UCRIc/bBo=
X-Google-Smtp-Source: AGHT+IEriy/yldJww68D/EaXvNBSqKxiyuZ/kdKCUsiW8K8RJDY1SusYSvfyjDkgPP8ckBM0NLlkdw==
X-Received: by 2002:a05:600c:1d88:b0:419:e773:9052 with SMTP id
 p8-20020a05600c1d8800b00419e7739052mr2391402wms.14.1714579086858; 
 Wed, 01 May 2024 08:58:06 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 n44-20020a05600c502c00b004146e58cc35sm2626540wmr.46.2024.05.01.08.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 08:58:06 -0700 (PDT)
Message-ID: <54ebd0a0-dc9d-43d7-b530-065832cda160@ursulin.net>
Date: Wed, 1 May 2024 16:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sysfs: Add drm class-wide attribute to get active
 device clients
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240403182951.724488-1-adrian.larumbe@collabora.com>
 <CAF6AEGsWtJs2xcZx59P9_maxn1RqCO6-4GwEp2fL31bZtTyuoA@mail.gmail.com>
 <e6500d5b-0151-4c31-9032-3a23157b3126@ursulin.net>
 <4btlparspmb47v3nq3mip6cjr2adwejepnglvh6q5nlbmdzwvt@74gg6tjpngbv>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <4btlparspmb47v3nq3mip6cjr2adwejepnglvh6q5nlbmdzwvt@74gg6tjpngbv>
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


Hi,

On 24/04/2024 15:48, Adrián Larumbe wrote:
> Hi Tvrtko,
> 
> On 15.04.2024 13:50, Tvrtko Ursulin wrote:
>>
>> On 05/04/2024 18:59, Rob Clark wrote:
>>> On Wed, Apr 3, 2024 at 11:37 AM Adrián Larumbe
>>> <adrian.larumbe@collabora.com> wrote:
>>>>
>>>> Up to this day, all fdinfo-based GPU profilers must traverse the entire
>>>> /proc directory structure to find open DRM clients with fdinfo file
>>>> descriptors. This is inefficient and time-consuming.
>>>>
>>>> This patch adds a new device class attribute that will install a sysfs file
>>>> per DRM device, which can be queried by profilers to get a list of PIDs for
>>>> their open clients. This file isn't human-readable, and it's meant to be
>>>> queried only by GPU profilers like gputop and nvtop.
>>>>
>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>>>> Cc: Christopher Healy <healych@amazon.com>
>>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>>
>>> It does seem like a good idea.. idk if there is some precedent to
>>> prefer binary vs ascii in sysfs, but having a way to avoid walking
>>> _all_ processes is a good idea.
>>
>> I naturally second that it is a needed feature, but I do not think binary
>> format is justified. AFAIR it should be used for things like hw/fw
>> standardised tables or firmware images, not when exporting a simple list of
>> PIDs. It also precludes easy shell/script access and the benefit of avoiding
>> parsing a short list is I suspect completely dwarfed by needing to parse all
>> the related fdinfo etc.
> 
> I'd rather keep it as a binary file for the sake of easily parsing the number
> list on the client side, in gputop or nvtop. For textual access, there's already
> a debugfs file that presents the same information, so I thought it was best not
> to duplicate that functionality and restrict sysfs to serving the very specific
> use case of UM profilers having to access the DRM client list.
> 
> I should mention I did something controversial here, which is a semantically
> binary attribute through the regular attribute interface. I guess if I keep it
> as a binary attribute in the end, I should switch over to the binary attribute
> API.
> 
> Another reason why I implemented it as a binary file is that we can only send
> back at most a whole page. If a PID takes 4 bytes, that's usually 1024 clients
> at most, which is probably enough for any UM profiler, but will decrease even
> more if we turn it into an ASCII readable file.

I'm afraid I still think there is no reason for a binary file, even less 
so artificially limited to 1024 clients. Any consumer will have to parse 
text fdinfo so a binary list of pids is not adding any real cost.

> I did some research into sysfs binary attributes, and while some sources mention that
> it's often used for dumping or loading of driver FW, none of them claim it cannot
> be used for other purposes.
> 
>>>> ---
>>>>    drivers/gpu/drm/drm_internal.h       |  2 +-
>>>>    drivers/gpu/drm/drm_privacy_screen.c |  2 +-
>>>>    drivers/gpu/drm/drm_sysfs.c          | 89 ++++++++++++++++++++++------
>>>>    3 files changed, 74 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>>> index 2215baef9a3e..9a399b03d11c 100644
>>>> --- a/drivers/gpu/drm/drm_internal.h
>>>> +++ b/drivers/gpu/drm/drm_internal.h
>>>> @@ -145,7 +145,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
>>>>    void drm_master_internal_release(struct drm_device *dev);
>>>>
>>>>    /* drm_sysfs.c */
>>>> -extern struct class *drm_class;
>>>> +extern struct class drm_class;
>>>>
>>>>    int drm_sysfs_init(void);
>>>>    void drm_sysfs_destroy(void);
>>>> diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
>>>> index 6cc39e30781f..2fbd24ba5818 100644
>>>> --- a/drivers/gpu/drm/drm_privacy_screen.c
>>>> +++ b/drivers/gpu/drm/drm_privacy_screen.c
>>>> @@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
>>>>           mutex_init(&priv->lock);
>>>>           BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
>>>>
>>>> -       priv->dev.class = drm_class;
>>>> +       priv->dev.class = &drm_class;
>>>>           priv->dev.type = &drm_privacy_screen_type;
>>>>           priv->dev.parent = parent;
>>>>           priv->dev.release = drm_privacy_screen_device_release;
>>>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>>>> index a953f69a34b6..56ca9e22c720 100644
>>>> --- a/drivers/gpu/drm/drm_sysfs.c
>>>> +++ b/drivers/gpu/drm/drm_sysfs.c
>>>> @@ -58,8 +58,6 @@ static struct device_type drm_sysfs_device_connector = {
>>>>           .name = "drm_connector",
>>>>    };
>>>>
>>>> -struct class *drm_class;
>>>> -
>>>>    #ifdef CONFIG_ACPI
>>>>    static bool drm_connector_acpi_bus_match(struct device *dev)
>>>>    {
>>>> @@ -128,6 +126,62 @@ static const struct component_ops typec_connector_ops = {
>>>>
>>>>    static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>>>>
>>>> +static ssize_t clients_show(struct device *cd, struct device_attribute *attr, char *buf)
>>>> +{
>>>> +       struct drm_minor *minor = cd->driver_data;
>>>> +       struct drm_device *ddev = minor->dev;
>>>> +       struct drm_file *priv;
>>>> +       ssize_t offset = 0;
>>>> +       void *pid_buf;
>>>> +
>>>> +       if (minor->type != DRM_MINOR_RENDER)
>>>> +               return 0;
>>
>> Why this?
> 
> I return nothing in case of a non-render node because we don't want display drivers
> to confuse UM GPU profilers.

Feels to arbitrary to me. Let them handle it.

>>>> +
>>>> +       pid_buf = kvmalloc(PAGE_SIZE, GFP_KERNEL);
>>
>> I don't quite get the kvmalloc for just one page (or why even a temporay
>> buffer and not write into buf directly?).
> 
> Should've used kmalloc, you're right. Or else I could just write everything straight into 'buf'.
> 
>>>> +       if (!pid_buf)
>>>> +               return 0;
>>>> +
>>>> +       mutex_lock(&ddev->filelist_mutex);
>>>> +       list_for_each_entry_reverse(priv, &ddev->filelist, lhead) {
>>>> +               struct pid *pid;
>>>> +
>>>> +               if (drm_WARN_ON(ddev, (PAGE_SIZE - offset) < sizeof(pid_t)))
>>>> +                       break;
>>
>> Feels bad.. I would suggest exploring implementing a read callback (instead of
>> show) and handling arbitrary size output.
> 
> I think regular class attributes can only implement show() and set(). For a more complex
> interface, I would have to turn it into an actual binary attribute, and that would be the only
> choice if we want the list of clients to be of arbitrary size.

Yeah, i915 uses that to dump the error capture file which can be huge 
and is text so it is doable.

>>>> +
>>>> +               rcu_read_lock();
>>>> +               pid = rcu_dereference(priv->pid);
>>>> +               (*(pid_t *)(pid_buf + offset)) = pid_vnr(pid);
>>>> +               rcu_read_unlock();
>>>> +
>>>> +               offset += sizeof(pid_t);
>>>> +       }
>>>> +       mutex_unlock(&ddev->filelist_mutex);
>>>> +
>>>> +       if (offset < PAGE_SIZE)
>>>> +               (*(pid_t *)(pid_buf + offset)) = 0;
>>
>> Either NULL terminated or PAGE_SIZE/sizeof(pid) entries and not NULL
>> terminated feels weird. If I got that right.
>>
>> For me everything points towards going for text output.
> 
> Yes, I know it might sound weird, but my reasoning was: either there are PAGE_SIZE/sizeof(pid) entries
> and the file isn't NULL terminated (which should be picked up by clients as being one page worth
> of data, the sysfs attribute maximum transfer unit), or else there aren't enough entries to fill
> a page and after the last one there's a NULL entry.
> 
> 
>>>> +
>>>> +       memcpy(buf, pid_buf, offset);
>>>> +
>>>> +       kvfree(pid_buf);
>>>> +
>>>> +       return offset;
>>>> +
>>>> +}
>>>> +static DEVICE_ATTR_RO(clients);
>>
>> Shouldn't BIN_ATTR_RO be used for binary files in sysfs?
> 
> Like I said above, I sort of faked a binary attribute through the regular sysfs attr API,
> which is most likely a bad idea.
> 
>> Regards,
>>
>> Tvrtko
>>
>> P.S. Or maybe it is time for drmfs? Where each client gets a directory and
>> drivers can populate files. Such as per client logging streams and whatnot.
> 
> Yes, but maybe this is something we can discuss in depth in an RFC at a later time?

Yes of course, it is just a long standing idea for flexible per client 
stuff.

Regards,

Tvrtko

> 
>>>> +
>>>> +static struct attribute *drm_device_attrs[] = {
>>>> +       &dev_attr_clients.attr,
>>>> +       NULL,
>>>> +};
>>>> +ATTRIBUTE_GROUPS(drm_device);
>>>> +
>>>> +struct class drm_class = {
>>>> +       .name           = "drm",
>>>> +       .dev_groups     = drm_device_groups,
>>>> +};
>>>> +
>>>> +static bool drm_class_initialised;
>>>> +
>>>>    /**
>>>>     * drm_sysfs_init - initialize sysfs helpers
>>>>     *
>>>> @@ -142,18 +196,19 @@ int drm_sysfs_init(void)
>>>>    {
>>>>           int err;
>>>>
>>>> -       drm_class = class_create("drm");
>>>> -       if (IS_ERR(drm_class))
>>>> -               return PTR_ERR(drm_class);
>>>> +       err = class_register(&drm_class);
>>>> +       if (err)
>>>> +               return err;
>>>>
>>>> -       err = class_create_file(drm_class, &class_attr_version.attr);
>>>> +       err = class_create_file(&drm_class, &class_attr_version.attr);
>>>>           if (err) {
>>>> -               class_destroy(drm_class);
>>>> -               drm_class = NULL;
>>>> +               class_destroy(&drm_class);
>>>>                   return err;
>>>>           }
>>>>
>>>> -       drm_class->devnode = drm_devnode;
>>>> +       drm_class.devnode = drm_devnode;
>>>> +
>>>> +       drm_class_initialised = true;
>>>>
>>>>           drm_sysfs_acpi_register();
>>>>           return 0;
>>>> @@ -166,12 +221,12 @@ int drm_sysfs_init(void)
>>>>     */
>>>>    void drm_sysfs_destroy(void)
>>>>    {
>>>> -       if (IS_ERR_OR_NULL(drm_class))
>>>> +       if (!drm_class_initialised)
>>>>                   return;
>>>>           drm_sysfs_acpi_unregister();
>>>> -       class_remove_file(drm_class, &class_attr_version.attr);
>>>> -       class_destroy(drm_class);
>>>> -       drm_class = NULL;
>>>> +       class_remove_file(&drm_class, &class_attr_version.attr);
>>>> +       class_destroy(&drm_class);
>>>> +       drm_class_initialised = false;
>>>>    }
>>>>
>>>>    static void drm_sysfs_release(struct device *dev)
>>>> @@ -372,7 +427,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>>>>                   return -ENOMEM;
>>>>
>>>>           device_initialize(kdev);
>>>> -       kdev->class = drm_class;
>>>> +       kdev->class = &drm_class;
>>>>           kdev->type = &drm_sysfs_device_connector;
>>>>           kdev->parent = dev->primary->kdev;
>>>>           kdev->groups = connector_dev_groups;
>>>> @@ -550,7 +605,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>>>>                           minor_str = "card%d";
>>>>
>>>>                   kdev->devt = MKDEV(DRM_MAJOR, minor->index);
>>>> -               kdev->class = drm_class;
>>>> +               kdev->class = &drm_class;
>>>>                   kdev->type = &drm_sysfs_device_minor;
>>>>           }
>>>>
>>>> @@ -579,10 +634,10 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>>>>     */
>>>>    int drm_class_device_register(struct device *dev)
>>>>    {
>>>> -       if (!drm_class || IS_ERR(drm_class))
>>>> +       if (!drm_class_initialised)
>>>>                   return -ENOENT;
>>>>
>>>> -       dev->class = drm_class;
>>>> +       dev->class = &drm_class;
>>>>           return device_register(dev);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_class_device_register);
>>>>
>>>> base-commit: 45c734fdd43db14444025910b4c59dd2b8be714a
>>>> --
>>>> 2.44.0
>>>>
> 
> Adrian Larumbe
