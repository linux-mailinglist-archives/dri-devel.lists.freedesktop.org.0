Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8BA5A3088
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 22:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8710E355;
	Fri, 26 Aug 2022 20:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD47E10E330;
 Fri, 26 Aug 2022 20:37:21 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id u14so3374132oie.2;
 Fri, 26 Aug 2022 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=u92nc+ilzmDmZ8KhgDmgn0xXKF9o01Oqnx4iuFaYN8c=;
 b=cKJIdZEfyQWsXVZ3GjN13n5C1BB7pQuL9RV5kZCYHWKP48enpjshNdQW23PxzIzIcL
 slXOSsPpIH5IEiuC5spoSh9Rn4Mcr7eh8c7U5hZMhS0t4Y6lDScTJqVqGrUfXBbumqEy
 +es7X2sP56w1Wc6pQ8rRh/pNcGqGuxySH0YWTMuZPAsJs1YzMpZvQQm9ijtqZe5veOGy
 7Fh1qzGygsue0/TrH4XKBs3QW5H/YOBBe/SqHrc9s4A6vBJF8yaFNN35SJEVmhaYqg9G
 AnoocxHvnlBbh6k0nVSy5k694F4ITMm0UbLEKvAhx04JruUXmPsNgpWotFOQis8puogk
 GQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=u92nc+ilzmDmZ8KhgDmgn0xXKF9o01Oqnx4iuFaYN8c=;
 b=R1wZy35F+2YVVYiCPYkelFTqFR4NiaoxIpmidnRS8pGqGFqhV6rjE7BHYbkrbrBonz
 eVAaoWLS+SMMX0BrxtyUj7fa6J4NXvfWcRbyCKUYkqKv9TCOtEfNPbmwcwegaomr2ybe
 W5MflFAk4iSdtgZw00AySJrO+UB9TQIiuC7J450wdOgQoN4Cc7skcKNiynkgERVxeLSl
 hy1xz/rBcNbwGLxd5LiWIw6rOzC9px3lzQy6Wp+NHaP3IBbKi9gVhK/S8J97+rXUITzu
 3LBrix4q74VW/biyA10QpWAb3H4sKcuvNmoami37PI6A/X6qF86d2uGjTRogC/8J/L1O
 3brw==
X-Gm-Message-State: ACgBeo12ybdskNh8kEkibA1IpIekpE5nPf3EXmO7EYh9R3/AjHH5rom7
 woh9/2nImjWr/ziCcIvI/kzBGXvGzF1hl9BhbaQ=
X-Google-Smtp-Source: AA6agR7ML20OfIMq+WgdppsSjJ35BwJNnV8hzve1HccmNoAAik00V72mVU4PZG3qOJgb6N3OGz/6mK/JeDoDUcwmdp4=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr2539548oib.46.1661546241204; Fri, 26
 Aug 2022 13:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220826100052.22945-16-jmaselbas@kalray.eu>
In-Reply-To: <20220826100052.22945-16-jmaselbas@kalray.eu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Aug 2022 16:37:09 -0400
Message-ID: <CADnq5_Pp+0-PNgXvmdiYJjCF=NQAvzz1=ydJO+Deg4Pp8jA2Ng@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix repeated word in comments
To: Jules Maselbas <jmaselbas@kalray.eu>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 10:03 AM Jules Maselbas <jmaselbas@kalray.eu> wrote:
>
> Remove redundant words `the` and `this`.
>
> CC: David Airlie <airlied@linux.ie>
> CC: Maxime Ripard <mripard@kernel.org>
> CC: Thomas Zimmermann <tzimmermann@suse.de>
> CC: amd-gfx@lists.freedesktop.org
> CC: dri-devel@lists.freedesktop.org
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>

Please split this up per driver.

Thanks!

Alex

> ---
>  .../gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h | 2 +-
>  .../gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h   | 2 +-
>  drivers/gpu/drm/display/drm_dp_helper.c                         | 2 +-
>  drivers/gpu/drm/drm_panel_orientation_quirks.c                  | 2 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c                            | 2 +-
>  drivers/gpu/drm/i915/i915_irq.c                                 | 2 +-
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c                   | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
> index 43d43d6addc0..4164da83380f 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
> @@ -486,7 +486,7 @@ typedef struct {
>    uint16_t Tvr_socLimit;            // Celcius
>    uint32_t FitLimit;                // Failures in time (failures per million parts over the defined lifetime)
>
> -  uint16_t PpmPowerLimit;           // Switch this this power limit when temperature is above PpmTempThreshold
> +  uint16_t PpmPowerLimit;           // Switch this power limit when temperature is above PpmTempThreshold
>    uint16_t PpmTemperatureThreshold;
>
>    // SECTION: Throttler settings
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
> index 04752ade1016..ba7c68a20425 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
> @@ -544,7 +544,7 @@ typedef struct {
>    uint16_t TplxLimit;               // Celcius
>    uint32_t FitLimit;                // Failures in time (failures per million parts over the defined lifetime)
>
> -  uint16_t PpmPowerLimit;           // Switch this this power limit when temperature is above PpmTempThreshold
> +  uint16_t PpmPowerLimit;           // Switch this power limit when temperature is above PpmTempThreshold
>    uint16_t PpmTemperatureThreshold;
>
>    // SECTION: Throttler settings
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e5bab236b3ae..32b295003f49 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct drm_dp_aux_msg *msg)
>
>  /*
>   * Calculate the length of the i2c transfer in usec, assuming
> - * the i2c bus speed is as specified. Gives the the "worst"
> + * the i2c bus speed is as specified. Gives the "worst"
>   * case estimate, ie. successful while as long as possible.
>   * Doesn't account the "MOT" bit, and instead assumes each
>   * message includes a START, ADDRESS and STOP. Neither does it
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index fc1728d46ac2..dde2f4c4c6cb 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -349,7 +349,7 @@ static const struct dmi_system_id orientation_data[] = {
>   * resolution expected by the quirk-table entry.
>   *
>   * Note this function is also used outside of the drm-subsys, by for example
> - * the efifb code. Because of this this function gets compiled into its own
> + * the efifb code. Because of this function gets compiled into its own
>   * kernel-module when built as a module.
>   *
>   * Returns:
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
> index d6fe94cd0fdb..7670ae4dd8fa 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -193,7 +193,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
>                         workload->ring_context_gpa);
>
>         /* only need to ensure this context is not pinned/unpinned during the
> -        * period from last submission to this this submission.
> +        * period from last submission to this submission.
>          * Upon reaching this function, the currently submitted context is not
>          * supposed to get unpinned. If a misbehaving guest driver ever does
>          * this, it would corrupt itself.
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 73cebc6aa650..783a6ca41a61 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -65,7 +65,7 @@
>
>  /*
>   * Interrupt statistic for PMU. Increments the counter only if the
> - * interrupt originated from the the GPU so interrupts from a device which
> + * interrupt originated from the GPU so interrupts from a device which
>   * shares the interrupt line are not accounted.
>   */
>  static inline void pmu_irq_stats(struct drm_i915_private *i915,
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index 40ea41b0a5dd..4085822f619a 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -231,7 +231,7 @@ struct nt35510_config {
>          * bits 0..2 in the lower nibble controls HCK, the booster clock
>          * frequency, the values are the same as for PCK in @bt1ctr.
>          * bits 4..5 in the upper nibble controls BTH, the boosting
> -        * amplification for the the step-up circuit.
> +        * amplification for the step-up circuit.
>          * 0 = AVDD + VDDB
>          * 1 = AVDD - AVEE
>          * 2 = AVDD - AVEE + VDDB
> --
> 2.17.1
>
