Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64945A4A8C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 13:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0855810EEB1;
	Mon, 29 Aug 2022 11:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B610E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661773303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3l2HRNkVfIlxa2ShqNnx3ZVFXVGd+8W6TGzJQVH9z/E=;
 b=DfQoGAJhKh6pjk4V5JSkk4HxbW6AfXsic6VTax7iIK1eHQLNlMo54hDUOmxz3/GfXuiBFp
 kNxn/sTh8RwQQlVMwR/R5PRMwu2m2OT/IoaAJkk8v1X6g8Rlbtx0tfZ9zMo/7QVVnmVtka
 WmqzMB0uHxswYR2TZbTF5s0fPJAQ57A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-LuVlxYQiMD60HzYhLoqEcw-1; Mon, 29 Aug 2022 07:41:42 -0400
X-MC-Unique: LuVlxYQiMD60HzYhLoqEcw-1
Received: by mail-ed1-f71.google.com with SMTP id
 q18-20020a056402519200b0043dd2ff50feso5262178edd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 04:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=3l2HRNkVfIlxa2ShqNnx3ZVFXVGd+8W6TGzJQVH9z/E=;
 b=QUxlisQ+8Rco5rNs7wh+g7gjZ4cJ06Un3gsfo7rTijVR2V8t3mqHyFBU+PJFpH8FGk
 UrzgqPWgsAHjg7joE4hBn9FqCZp8vV9Ts+S0x2d13AwdKTS5uJL0AD4mzzVhZtr2QeFv
 2mbeOFU+QysMfyUZYiwV4duEjPkv00Xv4bBEuqr5ypNd3oVOax2DVG3FsOOJS2QqpIKU
 BD7BXar46WJZmXTzpl5MUaDS2lj/WYNoXbcQEcG7LZU8fo7Dz1goS3BnyhcTTsLZVGhb
 tRl5sltGsAClnEqtoNYNX7igGX8UlcHeKULtyafCxbmLavy3N2JkDl+QaDCQThE6wwqY
 7B6w==
X-Gm-Message-State: ACgBeo2a9kh/3NkwPl2HjEp1u74ZVvPaTeMqMYkypVNrLjUkL9oTdGIf
 wC7thBMNLfjgo0TXMrAWLkUFgQLrA/+DFkzUj+CgrEiSYxY8po/PabwyGSudNvsQlAfrEY0o2TQ
 XA78acvl3mVnpQ8eNjG9GmVlW19z2
X-Received: by 2002:a17:907:75c1:b0:72f:248d:5259 with SMTP id
 jl1-20020a17090775c100b0072f248d5259mr13677753ejc.227.1661773301040; 
 Mon, 29 Aug 2022 04:41:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4EiH7klPrajd4w6phluOAxxP5+QSPfK7S4vRyR/vwmU8/fqFSjch/glWZJuzPXXquQHg2DRA==
X-Received: by 2002:a17:907:75c1:b0:72f:248d:5259 with SMTP id
 jl1-20020a17090775c100b0072f248d5259mr13677719ejc.227.1661773300758; 
 Mon, 29 Aug 2022 04:41:40 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 og4-20020a1709071dc400b0073ddfe1ea69sm4355852ejc.111.2022.08.29.04.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 04:41:40 -0700 (PDT)
Message-ID: <cbbaee7f-8ac3-0a37-9c71-3667e832a6ec@redhat.com>
Date: Mon, 29 Aug 2022 13:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 17/31] ACPI: video: Add Nvidia WMI EC brightness
 control detection (v3)
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
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-18-hdegoede@redhat.com>
 <a4d786a2-f2a2-fec7-df9d-18418c583301@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a4d786a2-f2a2-fec7-df9d-18418c583301@nvidia.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/26/22 00:21, Daniel Dadap wrote:
> On 8/25/22 9:37 AM, Hans de Goede wrote:
>> On some new laptop designs a new Nvidia specific WMI interface is present
>> which gives info about panel brightness control and may allow controlling
>> the brightness through this interface when the embedded controller is used
>> for brightness control.
>>
>> When this WMI interface is present and indicates that the EC is used,
>> then this interface should be used for brightness control.
>>
>> Changes in v2:
>> - Use the new shared nvidia-wmi-ec-backlight.h header for the
>>    WMI firmware API definitions
>> - ACPI_VIDEO can now be enabled on non X86 too,
>>    adjust the Kconfig changes to match this.
>>
>> Changes in v3:
>> - Use WMI_BRIGHTNESS_GUID define
>>
>> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/acpi/Kconfig           |  1 +
>>   drivers/acpi/video_detect.c    | 37 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/gma500/Kconfig |  2 ++
>>   drivers/gpu/drm/i915/Kconfig   |  2 ++
>>   include/acpi/video.h           |  1 +
>>   5 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>> index 7802d8846a8d..44ad4b6bd234 100644
>> --- a/drivers/acpi/Kconfig
>> +++ b/drivers/acpi/Kconfig
>> @@ -212,6 +212,7 @@ config ACPI_VIDEO
>>       tristate "Video"
>>       depends on BACKLIGHT_CLASS_DEVICE
>>       depends on INPUT
>> +    depends on ACPI_WMI || !X86
>>       select THERMAL
>>       help
>>         This driver implements the ACPI Extensions For Display Adapters
>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>> index cc9d0d91e268..4dc7fb865083 100644
>> --- a/drivers/acpi/video_detect.c
>> +++ b/drivers/acpi/video_detect.c
>> @@ -32,6 +32,7 @@
>>   #include <linux/dmi.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>   #include <acpi/video.h>
>> @@ -75,6 +76,36 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
>>       return AE_OK;
>>   }
>>   +/* This depends on ACPI_WMI which is X86 only */
>> +#ifdef CONFIG_X86
> 
> 
> This could probably also provide the { return false; } stub which you have for non-x86 if the kernel is built without nvidia-wmi-ec-backight, e.g.:
> 
> #if defined(CONFIG_X86) && (defined(CONFIG_NVIDIA_WMI_EC_BACKLIGHT) || defined(CONFIG_NVIDIA_WMI_EC_BACKLIGHT_MODULE))
> 
> Although I suppose that would break things if somebody has a kernel that originally had NVIDIA_WMI_EC_BACKLIGHT=n in Kconfig, and then builds the nvidia-wmi-ec-backlight driver out-of-tree later. I don't know whether that's intended to be a supported use case, so I guess it is fine either way.

The video-detect code is about detecting what interface should be used.
So far it does this independently of the driver implementing that interface
actually being enabled or not.

If someone has a system which needs the nvidia-wmi-ec-backlight driver,
but it is disabled then they / their distro should enable that driver,
rather then trying to fallback on e.g. acpi_video.

Taking which drivers are enabled into account would both make
the code more complicated and would also explode the test matrix.

All of this is already somewhat fragile, so lets not make it
extra complicated :)

Regards,

Hans



> 
> 
>> +static bool nvidia_wmi_ec_supported(void)
>> +{
>> +    struct wmi_brightness_args args = {
>> +        .mode = WMI_BRIGHTNESS_MODE_GET,
>> +        .val = 0,
>> +        .ret = 0,
>> +    };
>> +    struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
>> +    acpi_status status;
>> +
>> +    status = wmi_evaluate_method(WMI_BRIGHTNESS_GUID, 0,
>> +                     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
>> +    if (ACPI_FAILURE(status))
>> +        return false;
>> +
>> +    /*
>> +     * If brightness is handled by the EC then nvidia-wmi-ec-backlight
>> +     * should be used, else the GPU driver(s) should be used.
>> +     */
>> +    return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
>> +}
>> +#else
>> +static bool nvidia_wmi_ec_supported(void)
>> +{
>> +    return false;
>> +}
>> +#endif
>> +
>>   /* Force to use vendor driver when the ACPI device is known to be
>>    * buggy */
>>   static int video_detect_force_vendor(const struct dmi_system_id *d)
>> @@ -541,6 +572,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>   static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>   {
>>       static DEFINE_MUTEX(init_mutex);
>> +    static bool nvidia_wmi_ec_present;
>>       static bool native_available;
>>       static bool init_done;
>>       static long video_caps;
>> @@ -553,6 +585,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>           acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
>>                       ACPI_UINT32_MAX, find_video, NULL,
>>                       &video_caps, NULL);
>> +        nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
>>           init_done = true;
>>       }
>>       if (native)
>> @@ -570,6 +603,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>       if (acpi_backlight_dmi != acpi_backlight_undef)
>>           return acpi_backlight_dmi;
>>   +    /* Special cases such as nvidia_wmi_ec and apple gmux. */
>> +    if (nvidia_wmi_ec_present)
>> +        return acpi_backlight_nvidia_wmi_ec;
>> +
>>       /* On systems with ACPI video use either native or ACPI video. */
>>       if (video_caps & ACPI_VIDEO_BACKLIGHT) {
>>           /*
>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
>> index 0cff20265f97..807b989e3c77 100644
>> --- a/drivers/gpu/drm/gma500/Kconfig
>> +++ b/drivers/gpu/drm/gma500/Kconfig
>> @@ -7,6 +7,8 @@ config DRM_GMA500
>>       select ACPI_VIDEO if ACPI
>>       select BACKLIGHT_CLASS_DEVICE if ACPI
>>       select INPUT if ACPI
>> +    select X86_PLATFORM_DEVICES if ACPI
>> +    select ACPI_WMI if ACPI
>>       help
>>         Say yes for an experimental 2D KMS framebuffer driver for the
>>         Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>> index 7ae3b7d67fcf..3efce05d7b57 100644
>> --- a/drivers/gpu/drm/i915/Kconfig
>> +++ b/drivers/gpu/drm/i915/Kconfig
>> @@ -23,6 +23,8 @@ config DRM_I915
>>       # but for select to work, need to select ACPI_VIDEO's dependencies, ick
>>       select BACKLIGHT_CLASS_DEVICE if ACPI
>>       select INPUT if ACPI
>> +    select X86_PLATFORM_DEVICES if ACPI
>> +    select ACPI_WMI if ACPI
>>       select ACPI_VIDEO if ACPI
>>       select ACPI_BUTTON if ACPI
>>       select SYNC_FILE
>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>> index 0625806d3bbd..91578e77ac4e 100644
>> --- a/include/acpi/video.h
>> +++ b/include/acpi/video.h
>> @@ -48,6 +48,7 @@ enum acpi_backlight_type {
>>       acpi_backlight_video,
>>       acpi_backlight_vendor,
>>       acpi_backlight_native,
>> +    acpi_backlight_nvidia_wmi_ec,
>>   };
>>     #if IS_ENABLED(CONFIG_ACPI_VIDEO)
> 

