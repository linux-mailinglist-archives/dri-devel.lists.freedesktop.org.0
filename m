Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A734E73F2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 14:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A93710E91D;
	Fri, 25 Mar 2022 13:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAFC10E90D;
 Fri, 25 Mar 2022 13:07:09 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-dacc470e03so8054433fac.5; 
 Fri, 25 Mar 2022 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+UppTrxLQdaijQbmLi2ygRNUTwZayeuPKsfWsxc+Zo=;
 b=Mr3uMt15CEDF8Ba+6ECcUfzdpV5TOWE1Ts2aqBpikq7hdwnh2BhSkVNiY23MigyCo1
 5/0a00IeRbTP8IQd+UUBezGhidat0d2Q4XYVkN8AAv33xgeuAfUg9n1oA7xGp6R97U3+
 zbP7SRZnJPvIMAJ4+ZquoxHnZUTTk7qKxT+CsiVdM6zJRQZV8UW8naewzz38OZQPwjyL
 MWmBS63NuPUhU3p3Odf2FDnlOH7KIcDwDKaY4QNqNBiR9iqnlPVXpt1PjDY9wA6d8WzH
 fRTVhUWrbP+YT1D23WkVN0i6YMYvrCXsYTidkzrRXTYa9DPQYb+rCWLX6z2uz3j67LSm
 SQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+UppTrxLQdaijQbmLi2ygRNUTwZayeuPKsfWsxc+Zo=;
 b=e+UKXzzuHLKA7/VYpnhcbLNbu24yn/zbbULDvgR7DmSVhwdQntEI6AtNxPbwsdBtDl
 jbfijgutRO/QbAAopsCFVwBsAdFlKck7EQ76nvZhHIpDCjmGNRd8yFWAndsgpURFzeg7
 eu/qthoYtiaqIKZW9S3uNhbma7fkxWs9fBO9ozVs3uDa/8to30QRR54EMkAS3Q+3BBei
 i7iMsA3ooxxgqtLwqC3Epcz2nJFv1Ur16LBXK8drS3iw5lsN4RUBkbLHQ+rQvDCgXisD
 ijZLuFiTTppiLOXQ0KrPip80AINPqfH9xo+Ls1wRoYpIAWrbEGoZX8sNQ52fFQrw9WI0
 /BVA==
X-Gm-Message-State: AOAM533ojE0Ufrq+Upxly7cloM45aghjh8rfFtALagkcAAIsVIQQMk3m
 5Cwl4MkVXK1lCTVjeMp3lilaWwjqKK+hTbBI4rL8y4Yt3pE=
X-Google-Smtp-Source: ABdhPJw2AO30JktpNowqISKLeErnm4X9BTwHN3YLfZlOFIVRTOk+leM/wRQcMWKtG1atVvaDsQmfkduj2H6qOl5JGso=
X-Received: by 2002:a05:6870:630c:b0:da:b3f:324d with SMTP id
 s12-20020a056870630c00b000da0b3f324dmr4883902oao.253.1648213628946; Fri, 25
 Mar 2022 06:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
In-Reply-To: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Mar 2022 09:06:57 -0400
Message-ID: <CADnq5_MGrkDxGBfpg9XfJ-e=fSr9dx22VJTKz6BLQemTq7Ck8Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
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
Cc: Sasha Levin <sashal@kernel.org>, Chunming Zhou <David1.Zhou@amd.com>,
 ddavenport@chromium.org, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 leon.li@amd.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, ching-shih.li@amd.corp-partner.google.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Victor Lu <victorchengchi.lu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 2:27 AM Ryan Lin <tsung-hua.lin@amd.com> wrote:
>
> Disable ABM feature when the system is running on AC mode to get
> the more perfect contrast of the display.
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

We already set adev->pm.ac_power in amdgpu_pm_acpi_event_handler()
which gets called a few lines below.

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
