Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D40C5323BA
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 09:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFC010E3D2;
	Tue, 24 May 2022 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B838510E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653376220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rm/M+ffTEUa7aIDhK9zXABzAH48Pquc/I+FfLiaEMhA=;
 b=esQp8rO3narkGe3RJVNyYCbbrH64wyiOLxaOL0m20EGkxfQECEiXo123jVZjxYO/1afRIy
 2Pl4lcN4wcJFKOcWSa+aDGE73GnV0iAanoqRA1gTk16m/Iz9bMxqRVNacGpbBgsvlX5wfe
 46DKSoLwvAK862SA2XY4C4wvAR9QU1s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-jU3z96yDPm6HOlTb-UgfLw-1; Tue, 24 May 2022 03:10:17 -0400
X-MC-Unique: jU3z96yDPm6HOlTb-UgfLw-1
Received: by mail-ej1-f70.google.com with SMTP id
 gh15-20020a170906e08f00b006fea2a22319so4811681ejb.20
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 00:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rm/M+ffTEUa7aIDhK9zXABzAH48Pquc/I+FfLiaEMhA=;
 b=PIxgii0cAeKNwT/4vhZ8PieBx4MlmINtX9kf9iO54aU1HViH5RxIj9EWOJ1OxRlwU+
 aoFLJTl99H5ShIh0XABthHOwb0AaQk6Xa7DEpWjFMunLsuF/Ohcy8Od8Bm+KJhpz9wde
 yXpWlrlRklIrNhN5RqogpVp3/iVC786PTIQ2HXOCB0JEt+XR+p7jW0MYNI3mvNXDrHk7
 LyaDmIBxnNGV7r93J9nE8ozye0PoM5sWxvyHQt2v14j7xSTffk7vWS9XfxKvzG8bIJUK
 UsbhIShAxfjfv5LjuBJnWlxtazKg7mzuCE6O0nNyq782t0gO05wlTwUNyDK51JcFr2Fr
 xkPw==
X-Gm-Message-State: AOAM532708vOzHDD0lnu1WdC/AcTBzbD994HrF8NIgDL4gOHt83bRL7i
 R3iEVR8uHuULAJItViJMi/JrY6kUDzZ4O2FQyLeW68ogj22Gd3qbKnoibTGzbQtPT1B/9LjAc0S
 WI55i7QX7ZlBRSrr7sPAwRk56qbZy
X-Received: by 2002:a05:6402:520a:b0:42b:4576:b407 with SMTP id
 s10-20020a056402520a00b0042b4576b407mr14504233edd.198.1653376216458; 
 Tue, 24 May 2022 00:10:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNaNElrshw2hlQQf83n0EU8K78Tld8MyIgAeom/hV40aMeNAFmWh4fLyu/wh8NiS8S0ET4sg==
X-Received: by 2002:a05:6402:520a:b0:42b:4576:b407 with SMTP id
 s10-20020a056402520a00b0042b4576b407mr14504204edd.198.1653376216062; 
 Tue, 24 May 2022 00:10:16 -0700 (PDT)
Received: from [192.168.45.129] ([185.238.219.59])
 by smtp.gmail.com with ESMTPSA id
 md17-20020a170906ae9100b006feaf472637sm4399518ejb.53.2022.05.24.00.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 00:10:15 -0700 (PDT)
Message-ID: <8a1a684c-fb51-20ab-1047-89c0204ff78b@redhat.com>
Date: Tue, 24 May 2022 09:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/14] ACPI: video: Make backlight class device
 registration a separate step
To: Daniel Dadap <ddadap@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-10-hdegoede@redhat.com>
 <80fa1ee5-6204-6178-e7e2-ac98038cd8d8@nvidia.com>
 <c3741f32-87f8-5c7b-b505-4c3213774436@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c3741f32-87f8-5c7b-b505-4c3213774436@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/24/22 01:25, Daniel Dadap wrote:
> On 5/20/22 16:41, Daniel Dadap wrote:
>>
>> On 5/17/22 10:23, Hans de Goede wrote:
>>> On x86/ACPI boards the acpi_video driver will usually initializing before
>>> the kms driver (except i915). This causes /sys/class/backlight/acpi_video0
>>> to show up and then the kms driver registers its own native backlight
>>> device after which the drivers/acpi/video_detect.c code unregisters
>>> the acpi_video0 device (when acpi_video_get_backlight_type()==native).
>>>
>>> This means that userspace briefly sees 2 devices and the disappearing of
>>> acpi_video0 after a brief time confuses the systemd backlight level
>>> save/restore code, see e.g.:
>>> https://bbs.archlinux.org/viewtopic.php?id=269920
>>>
>>> To fix this make backlight class device registration a separate step
>>> done by a new acpi_video_register_backlight() function. The intend is for
>>> this to be called by the drm/kms driver *after* it is done setting up its
>>> own native backlight device. So that acpi_video_get_backlight_type() knows
>>> if a native backlight will be available or not at acpi_video backlight
>>> registration time, avoiding the add + remove dance.
>>
>>
>> If I'm understanding this correctly, it seems we will want to call acpi_video_register_backlight() from the NVIDIA proprietary driver in a fallback path in case the driver's own GPU-controlled backlight handler either should not be used, or fails to register. That sounds reasonable enough, but I'm not sure what should be done about drivers like nvidia-wmi-ec-backlight, which are independent of the GPU hardware, and wouldn't be part of the acpi_video driver, either. There are a number of other similar vendor-y/platform-y type backlight drivers in drivers/video/backlight and drivers/platform/x86 that I think would be in a similar situation.
>>
>> From a quick skim of the ACPI video driver, it seems that perhaps nvidia-wmi-ec-backlight is missing a call to acpi_video_set_dmi_backlight_type(), perhaps with the acpi_backlight_vendor value? But I'm not familiar enough with this code to be sure that nobody will be checking acpi_video_get_backlight_type() before nvidia-wmi-ec-backlight loads. I'll take a closer look to try to convince myself that it makes sense.
>>
>>
>>> Note the new acpi_video_register_backlight() function is also called from
>>> a delayed work to ensure that the acpi_video backlight devices does get
>>> registered if necessary even if there is no drm/kms driver or when it is
>>> disabled.
>>
>>
>> It sounds like maybe everything should be fine as long as nvidia-wmi-ec-backlight (and other vendor-y/platform-y type drivers) gets everything set up before the delayed work which calls acpi_video_register_backlight()? But then is it really necessary to explicitly call acpi_video_register_backlight() from the DRM drivers if it's going to be called later if no GPU driver registered a backlight handler, anyway? Then we'd just need to make sure that the iGPU and dGPU drivers won't attempt to register a backlight handler on systems where a vendor-y/platform-y driver is supposed to handle the backlight instead, which sounds like it has the potential to be quite messy.
>>
> 
> Ah, I see you addressed this concern in your RFC (sorry for missing that, earlier):
> 
>> The above only takes native vs acpi_video backlight issues into
>> account, there are also a couple of other scenarios which may
>> lead to multiple backlight-devices getting registered:
>>
>> 1) Apple laptops using the apple_gmux driver
>> 2) Nvidia laptops using the (new) nvidia-wmi-ec-backlight driver
>> 3) drivers/platform/x86 drivers calling acpi_video_set_dmi_backlight_type()
>>    to override the normal acpi_video_get_backlight_type() heuristics after
>>    the native/acpi_video drivers have already loaded
>>
>> The plan for 1) + 2) is to extend the acpi_backlight_type enum with
>> acpi_backlight_gmux and acpi_backlight_nvidia_wmi_ec values and to add
>> detection of these 2 to acpi_video_get_backlight_type().
> 
> Is there a reason these shouldn't have the same, generic, type, rather than separate, driver-specific ones?

In case it is not clear, this needs to be separate from "vendor" because vendor is
meant for the old (often pre windows XP) vendor specific BIOS interfaces used
by the likes of dell-laptopo, thinkpad_acpi, etc. And acpi_video_get_backlight_type()
returns vendor when it cannot find any other types, iow it is the type of
last resort.

So vendor is the fallback where as nvidia_wmi_ec and apple_gmux both
must take precedence over anything else if detected.

As for why not have a single type for nvidia_wmi_ec and apple_gmux,
these will have 2 separate detection helper functions, so it seems
cleaner to me to use 2 separate types to match this.
Most drivers check for type != my-type, so an extra type does not hurt.

> I don't foresee any situation where a system would need to use these two particular drivers simultaneously.

Agreed.

> Multiple DRM drivers can coexist on the same system, and even though the goal here is to remove the existing "multiple backlight interfaces for the same panel" situation, there shouldn't be any reason why more than one DRM driver couldn't register backlight handlers at the same time, so long as they are driving distinct panels. If we don't need separate backlight types for individual DRM drivers, why should we have them for apple_gmux and nvidia_wmi_ec_backlight?

I don't think we need them, but as said since they use separate detection
methods, it just feels cleaner.

The drivers/acpi/video_detect.c code at the moment has the following detection
methods:

1. Check if any GPU drivers have *told* it that the GPU driver will register
a GPU native backlight device for the panel (either direct PWM driving or
over DP aux, etc.)

2. Check if the ACPI tables have the ACPI video backlight control bits

3. None of the above, assume vendor.

For nvidia-wmi-ec and apple-gmux 2 separate detection helper functions +
steps will get added and as said it just feels cleaner to have 2
separate types to match.

> I still think that relying on the GPU drivers to correctly know whether they should register their backlight handlers when a platform-level device is supposed to register one instead might be easier said than done, especially on systems where the same panel could potentially be driven by more than one GPU (but not at the same time).

ATM the GPU drivers unconditionally register their native
backlight device if they believe (e.g. the video bios tables say so)
they can control the backlight.

And then in the case of e.g. windows XP era laptops, where often
the EC was still used, the GPU drivers atm rely on acpi_video also
registering a backlight device and userspace then preferring that one.

IOW atm the native GPU drivers rely on userspace ignoring their
backlight device if another one is present.

The adding of something like e.g.:

	if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
		NV_INFO(drm, "Skipping nv_backlight registration\n");
		goto fail_alloc;
	}

To the code-paths doing the backlight-device registration, skipping
tthe registration just replaces the "lets hope userspace ignores this
if necessary" with outright skipping the registration of the sysfs
backlight class device in the cases where before we would hope
userspace behaves as expected.

Also note that this just skips the registration of the sysfs class
device, any prep work is still done, so as to not cause any behavior
changes from the pov of which GPU registers get poked.

>> Recall that on at least one system, both amdgpu and the NVIDIA proprietary driver registered a handler even when it shouldn't: https://patchwork.kernel.org/project/platform-driver-x86/patch/20220316203325.2242536-1-ddadap@nvidia.com/ - I didn't have direct access to this system, but the fact that the NVIDIA driver registered a handler was almost certainly a bug in either the driver or the system's firmware (on other systems with the same type of backlight hardware, NVIDIA does not register a handler), and I imagine the same is true of the amdgpu driver. In all likelihood nouveau would have probably tried to register one too; I am not certain whether the person who reported the issue to me had tested with nouveau. I'm not convinced that the GPU drivers can reliably determine whether or not they are supposed to register, but maybe cases where they aren't, such as the system mentioned above, are supposed to be handled in a quirks table somewhere.

Right video_detect.c already has a DMI table for this which
overrides the value returned by acpi_video_get_backlight_type().

Although in this specific case it seems we may want
acpi_video_get_backlight_type() to return native when
called from the amdgpu driver and none when called from
the nvidia/nouveau driver ?   That is not supported atm, but if
necessary it seems reasonable to:

1. Add a "const char *driver_name" to acpi_video_get_backlight_type()
and maybe agree on nouveau and nvidia to pass the same value.

2. Extend the quirk mechanism to allow using the driver_name to
return different results to different drivers.

Regards,

Hans




>>
>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>   drivers/acpi/acpi_video.c | 45 ++++++++++++++++++++++++++++++++++++---
>>>   include/acpi/video.h      |  2 ++
>>>   2 files changed, 44 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
>>> index 95d4868f6a8c..79e75dc86243 100644
>>> --- a/drivers/acpi/acpi_video.c
>>> +++ b/drivers/acpi/acpi_video.c
>>> @@ -31,6 +31,12 @@
>>>   #define ACPI_VIDEO_BUS_NAME        "Video Bus"
>>>   #define ACPI_VIDEO_DEVICE_NAME        "Video Device"
>>>   +/*
>>> + * Display probing is known to take up to 5 seconds, so delay the fallback
>>> + * backlight registration by 5 seconds + 3 seconds for some extra margin.
>>> + */
>>> +#define ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY    (8 * HZ)
>>> +
>>>   #define MAX_NAME_LEN    20
>>>     MODULE_AUTHOR("Bruno Ducrot");
>>> @@ -80,6 +86,9 @@ static LIST_HEAD(video_bus_head);
>>>   static int acpi_video_bus_add(struct acpi_device *device);
>>>   static int acpi_video_bus_remove(struct acpi_device *device);
>>>   static void acpi_video_bus_notify(struct acpi_device *device, u32 event);
>>> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored);
>>> +static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
>>> +                acpi_video_bus_register_backlight_work);
>>>   void acpi_video_detect_exit(void);
>>>     /*
>>> @@ -1862,8 +1871,6 @@ static int acpi_video_bus_register_backlight(struct acpi_video_bus *video)
>>>       if (video->backlight_registered)
>>>           return 0;
>>>   -    acpi_video_run_bcl_for_osi(video);
>>> -
>>>       if (acpi_video_get_backlight_type(false) != acpi_backlight_video)
>>>           return 0;
>>>   @@ -2089,7 +2096,11 @@ static int acpi_video_bus_add(struct acpi_device *device)
>>>       list_add_tail(&video->entry, &video_bus_head);
>>>       mutex_unlock(&video_list_lock);
>>>   -    acpi_video_bus_register_backlight(video);
>>> +    /*
>>> +     * The userspace visible backlight_device gets registered separately
>>> +     * from acpi_video_register_backlight().
>>> +     */
>>> +    acpi_video_run_bcl_for_osi(video);
>>>       acpi_video_bus_add_notify_handler(video);
>>>         return 0;
>>> @@ -2128,6 +2139,11 @@ static int acpi_video_bus_remove(struct acpi_device *device)
>>>       return 0;
>>>   }
>>>   +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored)
>>> +{
>>> +    acpi_video_register_backlight();
>>> +}
>>> +
>>>   static int __init is_i740(struct pci_dev *dev)
>>>   {
>>>       if (dev->device == 0x00D1)
>>> @@ -2238,6 +2254,17 @@ int acpi_video_register(void)
>>>        */
>>>       register_count = 1;
>>>   +    /*
>>> +     * acpi_video_bus_add() skips registering the userspace visible
>>> +     * backlight_device. The intend is for this to be registered by the
>>> +     * drm/kms driver calling acpi_video_register_backlight() *after* it is
>>> +     * done setting up its own native backlight device. The delayed work
>>> +     * ensures that acpi_video_register_backlight() always gets called
>>> +     * eventually, in case there is no drm/kms driver or it is disabled.
>>> +     */
>>> +    schedule_delayed_work(&video_bus_register_backlight_work,
>>> +                  ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY);
>>> +
>>>   leave:
>>>       mutex_unlock(&register_count_mutex);
>>>       return ret;
>>> @@ -2248,6 +2275,7 @@ void acpi_video_unregister(void)
>>>   {
>>>       mutex_lock(&register_count_mutex);
>>>       if (register_count) {
>>> +        cancel_delayed_work_sync(&video_bus_register_backlight_work);
>>>           acpi_bus_unregister_driver(&acpi_video_bus);
>>>           register_count = 0;
>>>       }
>>> @@ -2255,6 +2283,17 @@ void acpi_video_unregister(void)
>>>   }
>>>   EXPORT_SYMBOL(acpi_video_unregister);
>>>   +void acpi_video_register_backlight(void)
>>> +{
>>> +    struct acpi_video_bus *video;
>>> +
>>> +    mutex_lock(&video_list_lock);
>>> +    list_for_each_entry(video, &video_bus_head, entry)
>>> +        acpi_video_bus_register_backlight(video);
>>> +    mutex_unlock(&video_list_lock);
>>> +}
>>> +EXPORT_SYMBOL(acpi_video_register_backlight);
>>> +
>>>   void acpi_video_unregister_backlight(void)
>>>   {
>>>       struct acpi_video_bus *video;
>>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>>> index e31afb93379a..b2f7dc1f354a 100644
>>> --- a/include/acpi/video.h
>>> +++ b/include/acpi/video.h
>>> @@ -53,6 +53,7 @@ enum acpi_backlight_type {
>>>   #if IS_ENABLED(CONFIG_ACPI_VIDEO)
>>>   extern int acpi_video_register(void);
>>>   extern void acpi_video_unregister(void);
>>> +extern void acpi_video_register_backlight(void);
>>>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>>>                      int device_id, void **edid);
>>>   extern enum acpi_backlight_type acpi_video_get_backlight_type(bool native);
>>> @@ -68,6 +69,7 @@ extern int acpi_video_get_levels(struct acpi_device *device,
>>>   #else
>>>   static inline int acpi_video_register(void) { return -ENODEV; }
>>>   static inline void acpi_video_unregister(void) { return; }
>>> +static inline void acpi_video_register_backlight(void) { return; }
>>>   static inline int acpi_video_get_edid(struct acpi_device *device, int type,
>>>                         int device_id, void **edid)
>>>   {

