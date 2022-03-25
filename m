Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7E4E6C9D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 03:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9210E751;
	Fri, 25 Mar 2022 02:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B11510E1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 02:46:05 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e612af95e3so69918037b3.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 19:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sa+e67K5U6aqg+ZXOJV0s+k5qDv07/WGCaxyk5GGdW0=;
 b=H7uU0ggz3Jfak98dNlZMB2nHP022esQ7LPWTy3w2Nggja5IGSUodHmIMyKqv1EsFzJ
 NEIDegsnIu1PVM3U0ihJdHPk3jwh/QtOO+e3jXjhracQJb8hq8TH4gZMnVXzFhNNJeS+
 UNpHM5jr+LdJZf6KpNlidFMMkwSOVjXjFO4kIcI8Bq4NSuMQc37GP+IFzRDbMseMAAPc
 /Z8KSzq+/rXUgo6/dzb8M2Dn5b1kQbAuHx9xQdlyGInHxH5nTIsyosD3fUMxocROtXsu
 r+Iz6b5xPt500sKqAS9+196RSaWSJazf8DblV+szDe3uMJruNer2yZTyyReq0yLB8l9X
 mE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sa+e67K5U6aqg+ZXOJV0s+k5qDv07/WGCaxyk5GGdW0=;
 b=z6wjh3dZi9iViZ1mr1WV4nc3nqROsNbKWOo+JMetcmYnpnsYExZRTHM7luGRv6zW8h
 qD+z5536pJIxno4TsnNLPcLmhvxWRMxouwcbMt4c2bJr8gglQX2L2cCtGOy6RKfOW6JG
 dymu8IXLhSJrO0GJs+jqjcTPqTWzHMPoo3g16r4rmD6Y5w1hjxakVhFaOrQyCvTLzgTO
 AaI5aPu9zh4EQ+EPADcULFpIhq2ZXPrbfqnmus1KYLAs/j3fV2IwQ+qDFXeZtbf7pUi/
 bwePxy6p7dkmqFB8NBMQhLoTbCr53IGgPq3R1FufosgsUu+ht5FZXkndWt5BuZT46DPk
 7gTQ==
X-Gm-Message-State: AOAM530MpPWDG/on/HaKTWUCAOy372JPgTuSPfcaJV1p0eX9PyXQjaHk
 XTFIuI0N/FGO4oRkWnBPkIbQe0ri/Fj9tLAVN+MePw==
X-Google-Smtp-Source: ABdhPJyOnmSYjTHki+bor5Xziuk+7EUGrHKfcFVPTRc1Z/G3iiC9xjebk79llCqqVpMLADamB3phudxe1IFAAM5qjr4=
X-Received: by 2002:a81:5a45:0:b0:2e5:ab36:87fc with SMTP id
 o66-20020a815a45000000b002e5ab3687fcmr8439311ywb.321.1648176364376; Thu, 24
 Mar 2022 19:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
In-Reply-To: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 25 Mar 2022 03:45:53 +0100
Message-ID: <CAP+8YyGFP2qqs=qA_6T0tHmCkyVrBHbG_zQa7TegcG8QRaSFOA@mail.gmail.com>
Subject: Re: [PATCH] UPSTREAM: drm/amdgpu: Disable ABM when AC mode
To: Ryan Lin <tsung-hua.lin@amd.com>
Content-Type: multipart/alternative; boundary="000000000000b9e72705db01f61e"
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
Cc: sashal@kernel.org, zhoucm1 <David1.Zhou@amd.com>,
 Drew Davenport <ddavenport@chromium.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, leon.li@amd.com,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, ching-shih.li@amd.corp-partner.google.com,
 Alex Deucher <alexander.deucher@amd.com>, victorchengchi.lu@amd.com, "Koenig,
 Christian" <christian.koenig@amd.com>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000b9e72705db01f61e
Content-Type: text/plain; charset="UTF-8"

Please drop the UPSTREAM prefix. Might be needed in the ChromeOS patch, but
not for upstream.

On Fri, Mar 25, 2022, 2:29 AM Ryan Lin <tsung-hua.lin@amd.com> wrote:

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
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index c560c1ab62ecb..bc8bb9aad2e36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block
> *nb,
>         struct amdgpu_device *adev = container_of(nb, struct
> amdgpu_device, acpi_nb);
>         struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>
> +       if (strcmp(entry->device_class, "battery") == 0) {
> +               adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +       }
> +
>         if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
>                 if (power_supply_is_system_supplied() > 0)
>                         DRM_DEBUG_DRIVER("pm: AC\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
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
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
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
> @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t
> backlight)
>         dmub_abm_enable_fractional_pwm(abm->ctx);
>  }
>
> -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> -{
> -       struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> -       unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> -
> -       /* return backlight in hardware format which is unsigned 17 bits,
> with
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
> -       /* return backlight in hardware format which is unsigned 17 bits,
> with
> -        * 1 bit integer and 16 bit fractional
> -        */
> -       return backlight;
> -}
> -
>  static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>  {
>         union dmub_rb_cmd cmd;
> @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm,
> uint32_t level)
>         int edp_num;
>         uint8_t panel_mask = 0;
>
> +       if (power_supply_is_system_supplied() > 0)
> +               level = 0;
> +
>         get_edp_links(dc->dc, edp_links, &edp_num);
>
>         for (i = 0; i < edp_num; i++) {
> @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm,
> uint32_t level)
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
> +       /* return backlight in hardware format which is unsigned 17 bits,
> with
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
> +       /* return backlight in hardware format which is unsigned 17 bits,
> with
> +        * 1 bit integer and 16 bit fractional
> +        */
> +       return backlight;
> +}
> +
>  static bool dmub_abm_init_config(struct abm *abm,
>         const char *src,
>         unsigned int bytes,
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
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
>

--000000000000b9e72705db01f61e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please drop the UPSTREAM prefix. Might be needed in the C=
hromeOS patch, but not for upstream.</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 25, 2022, 2:29 AM Ryan Lin =
&lt;<a href=3D"mailto:tsung-hua.lin@amd.com">tsung-hua.lin@amd.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Disable ABM feature when the=
 system is running on AC mode to get<br>
the more perfect contrast of the display.<br>
<br>
Signed-off-by: Ryan Lin &lt;<a href=3D"mailto:tsung-hua.lin@amd.com" target=
=3D"_blank" rel=3D"noreferrer">tsung-hua.lin@amd.com</a>&gt;<br>
<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 ++<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=C2=A0 =C2=A0 |=C2=A0 1 +<b=
r>
=C2=A0drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++------=
-<br>
=C2=A0drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
=C2=A04 files changed, 42 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_acpi.c<br>
index c560c1ab62ecb..bc8bb9aad2e36 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c<br>
@@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_device *adev =3D container_of(nb,=
 struct amdgpu_device, acpi_nb);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct acpi_bus_event *entry =3D (struct acpi_b=
us_event *)data;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(entry-&gt;device_class, &quot;batter=
y&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;pm.ac_powe=
r =3D power_supply_is_system_supplied() &gt; 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(entry-&gt;device_class, ACPI_AC_CLAS=
S) =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (power_supply_is=
_system_supplied() &gt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DRM_DEBUG_DRIVER(&quot;pm: AC\n&quot;);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index abfcc1304ba0c..3a0afe7602727 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;gfx.gfx_off_req_count =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;pm.ac_power =3D power_supply_is_system=
_supplied() &gt; 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;pm.old_ac_power =3D true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 atomic_set(&amp;adev-&gt;throttling_logging_ena=
bled, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/dr=
m/amd/display/dc/dce/dmub_abm.c<br>
index 54a1408c8015c..478a734b66926 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c<br>
@@ -23,6 +23,8 @@<br>
=C2=A0 *<br>
=C2=A0 */<br>
<br>
+#include &lt;linux/power_supply.h&gt;<br>
+#include &quot;amdgpu.h&quot;<br>
=C2=A0#include &quot;dmub_abm.h&quot;<br>
=C2=A0#include &quot;dce_abm.h&quot;<br>
=C2=A0#include &quot;dc.h&quot;<br>
@@ -51,6 +53,7 @@<br>
=C2=A0#define DISABLE_ABM_IMMEDIATELY 255<br>
<br>
<br>
+extern uint amdgpu_dm_abm_level;<br>
<br>
=C2=A0static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)<br>
=C2=A0{<br>
@@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t ba=
cklight)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmub_abm_enable_fractional_pwm(abm-&gt;ctx);<br=
>
=C2=A0}<br>
<br>
-static unsigned int dmub_abm_get_current_backlight(struct abm *abm)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dce_abm *dce_abm =3D TO_DMUB_ABM(abm);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int backlight =3D REG_READ(BL1_PWM_CUR=
RENT_ABM_LEVEL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* return backlight in hardware format which is=
 unsigned 17 bits, with<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 bit integer and 16 bit fractional<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return backlight;<br>
-}<br>
-<br>
-static unsigned int dmub_abm_get_target_backlight(struct abm *abm)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dce_abm *dce_abm =3D TO_DMUB_ABM(abm);<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int backlight =3D REG_READ(BL1_PWM_TAR=
GET_ABM_LEVEL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* return backlight in hardware format which is=
 unsigned 17 bits, with<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 bit integer and 16 bit fractional<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return backlight;<br>
-}<br>
-<br>
=C2=A0static bool dmub_abm_set_level(struct abm *abm, uint32_t level)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 union dmub_rb_cmd cmd;<br>
@@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_=
t level)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int edp_num;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t panel_mask =3D 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (power_supply_is_system_supplied() &gt; 0)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level =3D 0;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_edp_links(dc-&gt;dc, edp_links, &amp;edp_nu=
m);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; edp_num; i++) {<br>
@@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32=
_t level)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
=C2=A0}<br>
<br>
+static unsigned int dmub_abm_get_current_backlight(struct abm *abm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dce_abm *dce_abm =3D TO_DMUB_ABM(abm);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int backlight =3D REG_READ(BL1_PWM_CUR=
RENT_ABM_LEVEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dc_context *dc =3D abm-&gt;ctx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_device *adev =3D dc-&gt;driver_co=
ntext;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;pm.ac_power !=3D adev-&gt;pm.old_a=
c_power) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmub_abm_set_level(=
abm, amdgpu_dm_abm_level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;pm.ac_powe=
r =3D power_supply_is_system_supplied() &gt; 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;pm.old_ac_=
power =3D adev-&gt;pm.ac_power;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* return backlight in hardware format which is=
 unsigned 17 bits, with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 bit integer and 16 bit fractional<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return backlight;<br>
+}<br>
+<br>
+static unsigned int dmub_abm_get_target_backlight(struct abm *abm)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dce_abm *dce_abm =3D TO_DMUB_ABM(abm);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int backlight =3D REG_READ(BL1_PWM_TAR=
GET_ABM_LEVEL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* return backlight in hardware format which is=
 unsigned 17 bits, with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 bit integer and 16 bit fractional<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return backlight;<br>
+}<br>
+<br>
=C2=A0static bool dmub_abm_init_config(struct abm *abm,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *src,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int bytes,<br>
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/=
pm/inc/amdgpu_dpm.h<br>
index f6e0e7d8a0077..de459411a0e83 100644<br>
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h<br>
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h<br>
@@ -445,6 +445,7 @@ struct amdgpu_pm {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 smu_prv_buffer_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_bo=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sm=
u_prv_buffer;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ac_power;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool old_ac_power;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* powerplay feature */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t pp_feature;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000b9e72705db01f61e--
