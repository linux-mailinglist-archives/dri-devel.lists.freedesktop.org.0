Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CCF57BBE2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785EF113A0A;
	Wed, 20 Jul 2022 16:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C09589B4D;
 Wed, 20 Jul 2022 16:50:34 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y4so24510012edc.4;
 Wed, 20 Jul 2022 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GWwm2vwY0mPc83AQwb60Ft68A5hUQCaRBAq697Ik0tk=;
 b=G8FF83lDzwo2o9hXc6yBF5FjoExYKyA556Pe6419Ga75J1r4C+crFprz4fxer17c+G
 CIWQa8c4CT6apvfpUyZ6Cg5hPA+UB3n1hKx8swYvo1dSLx9T8elfho5sv39QGXjp4nEY
 NbyfXu+j/Vj/cifNgE+GinBnuEOD3aRiwPHFBhoCtPvdVqxiszzuXz3ZccFZJ1Xa4gep
 /P1mhxoT+bw+834tCu9bY1lAV01KnpVlxHBwBghKbZv7zGTdT+KJGmS1wceNOsdn6NuP
 RNfUU6xHe8barzl+/4Iyd85IYr4/K2mpXm1iR5cphB2CxyZ/09JTcFua8LTxGvF8DR+0
 XfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GWwm2vwY0mPc83AQwb60Ft68A5hUQCaRBAq697Ik0tk=;
 b=ZcfJRNqwkKABUEwPlb4MWZ3QGtLglDclzDWmKagg0QArPAe+RildaZF+k083NRIqbt
 12hsANOATTHY3TmQKy8LXgacktn1PiXGSMw7AKZfVH5JO/NzTDtRjULYSW7L4BDQqC/C
 hYmTR+WWcUl/Nog/ceN2q/EI+W2h1k3r5slhgd8joD24vp01r7hsGOLBjHgywVovPI0v
 1kfMzYIYQuEFoYx7C8kjpkzwDmVuTy/GiN+13f96xO5ErNLJn9xCKoHHXUz5AdNTmEVG
 nyjKzhJuqfl5GIHe+HGB/EL31/TOgHk2FjAhpSwkGSNVI3oA1rUFOPlT6bjUYyeIjGMK
 6vtg==
X-Gm-Message-State: AJIora8lt2emi9gIOmoe1E63gl4Mwxq3EVggPx4V4aSFPUKFm7SVlnpu
 bNlTRar+KwDwt7zU16gjTIim+xC2il9pbKaPtlc=
X-Google-Smtp-Source: AGRyM1v1VHeMTHXHTQjAgGPHdg9YyLFCckQivVVr4VVsXYz/2qVZT3OxGu2vW3tT9LaHT/A5LbPQNFGs9LkDPsqh0nE=
X-Received: by 2002:a05:6402:f12:b0:43a:7eac:296e with SMTP id
 i18-20020a0564020f1200b0043a7eac296emr52187605eda.115.1658335832497; Wed, 20
 Jul 2022 09:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-10-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-10-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jul 2022 12:50:20 -0400
Message-ID: <CADnq5_Pp+trT8F1StcMa2Kc9x1QV8=W_s_+JDjLXcqhGderw=Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/29] ACPI: video: Make backlight class device
 registration a separate step
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Len Brown <lenb@kernel.org>, Daniel Dadap <ddadap@nvidia.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 3:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> On x86/ACPI boards the acpi_video driver will usually initializing before

initializing -> initialize

> the kms driver (except i915). This causes /sys/class/backlight/acpi_video0
> to show up and then the kms driver registers its own native backlight
> device after which the drivers/acpi/video_detect.c code unregisters
> the acpi_video0 device (when acpi_video_get_backlight_type()==native).
>
> This means that userspace briefly sees 2 devices and the disappearing of
> acpi_video0 after a brief time confuses the systemd backlight level
> save/restore code, see e.g.:
> https://bbs.archlinux.org/viewtopic.php?id=269920
>
> To fix this make backlight class device registration a separate step
> done by a new acpi_video_register_backlight() function. The intend is for
> this to be called by the drm/kms driver *after* it is done setting up its
> own native backlight device. So that acpi_video_get_backlight_type() knows
> if a native backlight will be available or not at acpi_video backlight
> registration time, avoiding the add + remove dance.
>
> Note the new acpi_video_register_backlight() function is also called from
> a delayed work to ensure that the acpi_video backlight devices does get
> registered if necessary even if there is no drm/kms driver or when it is
> disabled.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/acpi_video.c | 45 ++++++++++++++++++++++++++++++++++++---
>  include/acpi/video.h      |  2 ++
>  2 files changed, 44 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 6944794797a5..c4c3a9e7ce69 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -31,6 +31,12 @@
>  #define ACPI_VIDEO_BUS_NAME            "Video Bus"
>  #define ACPI_VIDEO_DEVICE_NAME         "Video Device"
>
> +/*
> + * Display probing is known to take up to 5 seconds, so delay the fallback
> + * backlight registration by 5 seconds + 3 seconds for some extra margin.
> + */
> +#define ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY    (8 * HZ)
> +
>  #define MAX_NAME_LEN   20
>
>  MODULE_AUTHOR("Bruno Ducrot");
> @@ -81,6 +87,9 @@ static LIST_HEAD(video_bus_head);
>  static int acpi_video_bus_add(struct acpi_device *device);
>  static int acpi_video_bus_remove(struct acpi_device *device);
>  static void acpi_video_bus_notify(struct acpi_device *device, u32 event);
> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored);
> +static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
> +                           acpi_video_bus_register_backlight_work);
>  void acpi_video_detect_exit(void);
>
>  /*
> @@ -1865,8 +1874,6 @@ static int acpi_video_bus_register_backlight(struct acpi_video_bus *video)
>         if (video->backlight_registered)
>                 return 0;
>
> -       acpi_video_run_bcl_for_osi(video);
> -
>         if (acpi_video_get_backlight_type() != acpi_backlight_video)
>                 return 0;
>
> @@ -2092,7 +2099,11 @@ static int acpi_video_bus_add(struct acpi_device *device)
>         list_add_tail(&video->entry, &video_bus_head);
>         mutex_unlock(&video_list_lock);
>
> -       acpi_video_bus_register_backlight(video);
> +       /*
> +        * The userspace visible backlight_device gets registered separately
> +        * from acpi_video_register_backlight().
> +        */
> +       acpi_video_run_bcl_for_osi(video);
>         acpi_video_bus_add_notify_handler(video);
>
>         return 0;
> @@ -2131,6 +2142,11 @@ static int acpi_video_bus_remove(struct acpi_device *device)
>         return 0;
>  }
>
> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored)
> +{
> +       acpi_video_register_backlight();
> +}
> +
>  static int __init is_i740(struct pci_dev *dev)
>  {
>         if (dev->device == 0x00D1)
> @@ -2241,6 +2257,17 @@ int acpi_video_register(void)
>          */
>         register_count = 1;
>
> +       /*
> +        * acpi_video_bus_add() skips registering the userspace visible
> +        * backlight_device. The intend is for this to be registered by the
> +        * drm/kms driver calling acpi_video_register_backlight() *after* it is
> +        * done setting up its own native backlight device. The delayed work
> +        * ensures that acpi_video_register_backlight() always gets called
> +        * eventually, in case there is no drm/kms driver or it is disabled.
> +        */
> +       schedule_delayed_work(&video_bus_register_backlight_work,
> +                             ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY);
> +
>  leave:
>         mutex_unlock(&register_count_mutex);
>         return ret;
> @@ -2251,6 +2278,7 @@ void acpi_video_unregister(void)
>  {
>         mutex_lock(&register_count_mutex);
>         if (register_count) {
> +               cancel_delayed_work_sync(&video_bus_register_backlight_work);
>                 acpi_bus_unregister_driver(&acpi_video_bus);
>                 register_count = 0;
>                 has_backlight = false;
> @@ -2259,6 +2287,17 @@ void acpi_video_unregister(void)
>  }
>  EXPORT_SYMBOL(acpi_video_unregister);
>
> +void acpi_video_register_backlight(void)
> +{
> +       struct acpi_video_bus *video;
> +
> +       mutex_lock(&video_list_lock);
> +       list_for_each_entry(video, &video_bus_head, entry)
> +               acpi_video_bus_register_backlight(video);
> +       mutex_unlock(&video_list_lock);
> +}
> +EXPORT_SYMBOL(acpi_video_register_backlight);
> +
>  void acpi_video_unregister_backlight(void)
>  {
>         struct acpi_video_bus *video;
> diff --git a/include/acpi/video.h b/include/acpi/video.h
> index 4705e339c252..0625806d3bbd 100644
> --- a/include/acpi/video.h
> +++ b/include/acpi/video.h
> @@ -53,6 +53,7 @@ enum acpi_backlight_type {
>  #if IS_ENABLED(CONFIG_ACPI_VIDEO)
>  extern int acpi_video_register(void);
>  extern void acpi_video_unregister(void);
> +extern void acpi_video_register_backlight(void);
>  extern int acpi_video_get_edid(struct acpi_device *device, int type,
>                                int device_id, void **edid);
>  extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
> @@ -69,6 +70,7 @@ extern int acpi_video_get_levels(struct acpi_device *device,
>  #else
>  static inline int acpi_video_register(void) { return -ENODEV; }
>  static inline void acpi_video_unregister(void) { return; }
> +static inline void acpi_video_register_backlight(void) { return; }
>  static inline int acpi_video_get_edid(struct acpi_device *device, int type,
>                                       int device_id, void **edid)
>  {
> --
> 2.36.0
>
