Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB604EAEFE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0692210E8FD;
	Tue, 29 Mar 2022 14:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9A10E8FD;
 Tue, 29 Mar 2022 14:04:01 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t21so14231395oie.11;
 Tue, 29 Mar 2022 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26rvEBCNIFiRO8lw0d4ibLwjH7rNC+2FXHQhaFfFi9E=;
 b=ClXdxEY3sYedDz8iLRgAFKARKUjU5okvKpYyQSsMMD5NzCa+TyiWwwmHtDaV41nHtw
 polqdshnlc02Bto5VshYz3O083Qe3KF89GPEwcRSmrHVbAzP4lbI5029v//MLnRoMbc3
 RufyhpHYcgWkp9OhHvBBICGjkylEXgbpjfXuy0I32eILASBlJe+QjntYbIC1qYBkWmTj
 4uRxEbeXUB9UNVzapyDtDfVnvTouMlhB2pkCdT0AeFhkwP68tap0/47jP//V2oOvvDd1
 m0VPLqILesImaHeD502rDWoZXaimIdhtfH3AxVHwVxN6xLAuWZq8SN0dPtcobFQ4ZwJh
 XMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26rvEBCNIFiRO8lw0d4ibLwjH7rNC+2FXHQhaFfFi9E=;
 b=4n2x+xrNeFmkMVjLFc8uShOMxyY5cB9btS8SAXZ1B11QGhDBgqx+w6PFqnlN2knS/C
 TojwX4Ru47/VTJRzm/lt/c46toGjWHKbjbMg1mhRjjkT3lp+hs54Y+puQd7p//dpU9hN
 CySTaZPuF6A3WW64nSbErUPQ9VPJtGINH/ucsrMNMXOAtMp9l5+EYCAb4cGRhn8xVDYm
 K9+7wKyDZexBfldA5vZCHfgMWy5BEU83eIUsVnSPbgMRO/uFCvdj0NH9tZOpgzUC4xLe
 ozgOceOXfWVjpwMVgipGqj7z+mkeV0/RWoOwknSB1qliXgTOTAnILF/n0cq0Fvmq7Jdb
 feow==
X-Gm-Message-State: AOAM531I5yYEcBhOSdNr+hN9m5DpkgBQ786Lc4l8dNHmTIkIx1HNergg
 Om76Au4X0IIOMzLbSds01XdOyrVZ9Ft01Br1MyA=
X-Google-Smtp-Source: ABdhPJwEG8czZRwrZzoQM9EwBge0o+Kn+7s3e3Zig8YFeVV+qnxNWy/SXdPGQPyeOvK2t8Loctb+sokhI4gNCCkQJww=
X-Received: by 2002:aca:d04:0:b0:2ef:8b45:d235 with SMTP id
 4-20020aca0d04000000b002ef8b45d235mr1372144oin.253.1648562640275; Tue, 29 Mar
 2022 07:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
 <20220329085239.157527-1-tsung-hua.lin@amd.com>
In-Reply-To: <20220329085239.157527-1-tsung-hua.lin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Mar 2022 10:03:49 -0400
Message-ID: <CADnq5_OXPXZ4hHv3Jndifd0kQ=kvJnypB3JcW5mNsjzjQ7JPLg@mail.gmail.com>
Subject: Re: drm/amdgpu: Disable ABM when AC mode
To: Ryan Lin <tsung-hua.lin@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Jake Wang <haonan.wang2@amd.com>,
 David Airlie <airlied@linux.ie>, Leon.Li@amd.com,
 Lijo Lazar <lijo.lazar@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wyatt Wood <wyatt.wood@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Leo Li <sunpeng.li@amd.com>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Evan Quan <evan.quan@amd.com>, shaoyunl <shaoyun.liu@amd.com>,
 Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Po-Ting Chen <robin.chen@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 4:56 AM Ryan Lin <tsung-hua.lin@amd.com> wrote:
>
> Disable ABM feature when the system is running on AC mode to get
> the more perfect contrast of the display.
>
> v2: remove "UPSTREAM" from the subject.
>
> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
>  drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
>  4 files changed, 42 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index c560c1ab62ecb..bc8bb9aad2e36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>         struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>         struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>
> +       if (strcmp(entry->device_class, "battery") == 0) {
> +               adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +       }
> +

Is this change necessary?  As I said before, we already update
adev->pm.ac_power a few lines later in amdgpu_pm_acpi_event_handler().
If there is something wrong with that code, please adjust as
necessary.

Alex

>         if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
>                 if (power_supply_is_system_supplied() > 0)
>                         DRM_DEBUG_DRIVER("pm: AC\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index abfcc1304ba0c..3a0afe7602727 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>
>         adev->gfx.gfx_off_req_count = 1;
>         adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +       adev->pm.old_ac_power = true;
>
>         atomic_set(&adev->throttling_logging_enabled, 1);
>         /*
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> index 54a1408c8015c..478a734b66926 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> @@ -23,6 +23,8 @@
>   *
>   */
>
> +#include <linux/power_supply.h>
> +#include "amdgpu.h"
>  #include "dmub_abm.h"
>  #include "dce_abm.h"
>  #include "dc.h"
> @@ -51,6 +53,7 @@
>  #define DISABLE_ABM_IMMEDIATELY 255
>
>
> +extern uint amdgpu_dm_abm_level;
>
>  static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
>  {
> @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
>         dmub_abm_enable_fractional_pwm(abm->ctx);
>  }
>
> -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> -{
> -       struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> -       unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> -
> -       /* return backlight in hardware format which is unsigned 17 bits, with
> -        * 1 bit integer and 16 bit fractional
> -        */
> -       return backlight;
> -}
> -
> -static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
> -{
> -       struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> -       unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> -
> -       /* return backlight in hardware format which is unsigned 17 bits, with
> -        * 1 bit integer and 16 bit fractional
> -        */
> -       return backlight;
> -}
> -
>  static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>  {
>         union dmub_rb_cmd cmd;
> @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>         int edp_num;
>         uint8_t panel_mask = 0;
>
> +       if (power_supply_is_system_supplied() > 0)
> +               level = 0;
> +
>         get_edp_links(dc->dc, edp_links, &edp_num);
>
>         for (i = 0; i < edp_num; i++) {
> @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>         return true;
>  }
>
> +static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> +{
> +       struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> +       unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> +       struct dc_context *dc = abm->ctx;
> +       struct amdgpu_device *adev = dc->driver_context;
> +
> +       if (adev->pm.ac_power != adev->pm.old_ac_power) {
> +               dmub_abm_set_level(abm, amdgpu_dm_abm_level);
> +               adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +               adev->pm.old_ac_power = adev->pm.ac_power;
> +       }
> +
> +       /* return backlight in hardware format which is unsigned 17 bits, with
> +        * 1 bit integer and 16 bit fractional
> +        */
> +       return backlight;
> +}
> +
> +static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
> +{
> +       struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> +       unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> +
> +       /* return backlight in hardware format which is unsigned 17 bits, with
> +        * 1 bit integer and 16 bit fractional
> +        */
> +       return backlight;
> +}
> +
>  static bool dmub_abm_init_config(struct abm *abm,
>         const char *src,
>         unsigned int bytes,
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> index f6e0e7d8a0077..de459411a0e83 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> @@ -445,6 +445,7 @@ struct amdgpu_pm {
>         uint32_t                smu_prv_buffer_size;
>         struct amdgpu_bo        *smu_prv_buffer;
>         bool ac_power;
> +       bool old_ac_power;
>         /* powerplay feature */
>         uint32_t pp_feature;
>
> --
> 2.25.1
>
