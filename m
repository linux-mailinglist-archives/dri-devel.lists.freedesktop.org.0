Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1793D73BCC3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037F810E676;
	Fri, 23 Jun 2023 16:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C691A10E676;
 Fri, 23 Jun 2023 16:38:52 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2b5910c231bso2933091fa.0; 
 Fri, 23 Jun 2023 09:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687538331; x=1690130331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mx2hGcoM9nMJ5B1yumLCPQFaFEylVPn0NXtUazu6c7s=;
 b=Sf9q2WftIpzLcICdzQ7HRE7n9g+SIRq5pvnO1C94vzUO21kPKk3b7gcD4a/otJmrVs
 cCbQu8gqY2QbLkG69TMJPSog6IFdst4D4ec5qNJ8gSR3psmmVOudHs079mlbzG9lsPW9
 p1wn3mMXG5i4GfTX0p+g8UC+5PkJ5liIiH7L7WIel4bZxbbzopYUE168hDxRbt8gl0tg
 u9p7muEu/VRcaxkBhLYOk0W7E84h1hB9CDcw/RbRpCuLUG2RFSEuWpaEO9yJtI+vkwAv
 GHE/DQpiYA3biyraprIu/0LIVYrCAV+3FUCL74NUZR0W2k1BLcGi9bih6Q7LBvkaD0F5
 Y5Eg==
X-Gm-Message-State: AC+VfDzoqAxh3Zlktoh3AmGX9CX0V0WbUlMWM91z3NwG5vcZr5QShFys
 dGyzqcczj/z9kVE5kzPu3Ff4IePbLY163d21XrTmy6N4
X-Google-Smtp-Source: ACHHUZ69XDB4QsWg7aegIqf61bPD9nYqJdOwGBQjGBmh6nChdsk7tSQhI88TrGx8aR//M9ebB5ty7XYUZiU8BU/4D1U=
X-Received: by 2002:a2e:b80f:0:b0:2b4:67bd:4367 with SMTP id
 u15-20020a2eb80f000000b002b467bd4367mr9886059ljo.5.1687538330589; Fri, 23 Jun
 2023 09:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
In-Reply-To: <20230621054603.1262299-2-evan.quan@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 Jun 2023 18:38:39 +0200
Message-ID: <CAJZ5v0gDCa0fC5V6NRg2c4MPvS70fYZg9x+K=TiQi033_G9Caw@mail.gmail.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
To: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com, mario.limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, christian.koenig@amd.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 7:47=E2=80=AFAM Evan Quan <evan.quan@amd.com> wrote=
:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
>
> To mitigate this, AMD has introduced an ACPI based mechanism that
> devices can use to notify active use of particular frequencies so
> that devices can make relative internal adjustments as necessary
> to avoid this resonance.
>
> In order for a device to support this, the expected flow for device
> driver or subsystems:
>
> Drivers/subsystems contributing frequencies:
>
> 1) During probe, check `wbrf_supported_producer` to see if WBRF supported
>    for the device.
> 2) If adding frequencies, then call `wbrf_add_exclusion` with the
>    start and end ranges of the frequencies.
> 3) If removing frequencies, then call `wbrf_remove_exclusion` with
>    start and end ranges of the frequencies.
>
> Drivers/subsystems responding to frequencies:
>
> 1) During probe, check `wbrf_supported_consumer` to see if WBRF is suppor=
ted
>    for the device.
> 2) Call the `wbrf_retrieve_exclusions` to retrieve the current
>    exclusions on receiving an ACPI notification for a new frequency
>    change.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> --
> v1->v2:
>   - move those wlan specific implementations to net/mac80211(Mario)
> ---
>  drivers/acpi/Kconfig     |   7 ++
>  drivers/acpi/Makefile    |   2 +
>  drivers/acpi/acpi_wbrf.c | 215 +++++++++++++++++++++++++++++++++++++++
>  include/linux/wbrf.h     |  55 ++++++++++
>  4 files changed, 279 insertions(+)
>  create mode 100644 drivers/acpi/acpi_wbrf.c
>  create mode 100644 include/linux/wbrf.h
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index ccbeab9500ec..0276c1487fa2 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -611,3 +611,10 @@ config X86_PM_TIMER
>
>           You should nearly always say Y here because many modern
>           systems require this timer.
> +
> +config ACPI_WBRF
> +       bool "ACPI Wifi band RF mitigation mechanism"
> +       help
> +         Wifi band RF mitigation mechanism allows multiple drivers from
> +         different domains to notify the frequencies in use so that hard=
ware
> +         can be reconfigured to avoid harmonic conflicts.
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index feb36c0b9446..14863b0c619f 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -131,3 +131,5 @@ obj-y                               +=3D dptf/
>  obj-$(CONFIG_ARM64)            +=3D arm64/
>
>  obj-$(CONFIG_ACPI_VIOT)                +=3D viot.o
> +
> +obj-$(CONFIG_ACPI_WBRF)                +=3D acpi_wbrf.o
> diff --git a/drivers/acpi/acpi_wbrf.c b/drivers/acpi/acpi_wbrf.c
> new file mode 100644
> index 000000000000..8c275998ac29
> --- /dev/null
> +++ b/drivers/acpi/acpi_wbrf.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Wifi Band Exclusion Interface

Where is the AML interface for this defined and how does it work?

> + * Copyright (C) 2023 Advanced Micro Devices
> + *
> + */
> +
> +#include <linux/wbrf.h>
> +
> +/* functions */
> +#define WBRF_RECORD            0x1
> +#define WBRF_RETRIEVE          0x2
> +
> +/* record actions */
> +#define WBRF_RECORD_ADD                0x0
> +#define WBRF_RECORD_REMOVE     0x1
> +
> +#define WBRF_REVISION          0x1
> +
> +static const guid_t wifi_acpi_dsm_guid =3D
> +       GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
> +                 0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
> +
> +static int wbrf_dsm(struct acpi_device *adev, u8 fn,
> +                   union acpi_object *argv4,
> +                   union acpi_object **out)
> +{
> +       union acpi_object *obj;
> +       int rc;
> +
> +       obj =3D acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +                               WBRF_REVISION, fn, argv4);
> +       if (!obj)
> +               return -ENXIO;
> +
> +       switch (obj->type) {
> +       case ACPI_TYPE_BUFFER:
> +               if (!*out) {
> +                       rc =3D -EINVAL;
> +                       break;

I'm not sure why you want to return an error in this case.  Did you
really mean !out?

> +               }
> +               *out =3D obj;
> +               return 0;
> +
> +       case ACPI_TYPE_INTEGER:
> +               rc =3D  obj->integer.value ? -EINVAL : 0;
> +               break;

An empty line here, please, as you added one after the return statement abo=
ve.

> +       default:
> +               rc =3D -EOPNOTSUPP;
> +       }
> +       ACPI_FREE(obj);
> +
> +       return rc;

How does the caller know whether or not they need to free the out
object after calling this function?

> +}
> +
> +static int wbrf_record(struct acpi_device *adev, uint8_t action,
> +                      struct wbrf_ranges_in *in)
> +{
> +       union acpi_object *argv4;
> +       uint32_t num_of_ranges =3D 0;
> +       uint32_t arg_idx =3D 0;
> +       uint32_t loop_idx;
> +       int ret;
> +
> +       if (!in)
> +               return -EINVAL;
> +
> +       for (loop_idx =3D 0; loop_idx < ARRAY_SIZE(in->band_list);
> +            loop_idx++)
> +               if (in->band_list[loop_idx].start &&
> +                   in->band_list[loop_idx].end)
> +                       num_of_ranges++;
> +
> +       argv4 =3D kzalloc(sizeof(*argv4) * (2 * num_of_ranges + 2 + 1), G=
FP_KERNEL);
> +       if (!argv4)
> +               return -ENOMEM;
> +
> +       argv4[arg_idx].package.type =3D ACPI_TYPE_PACKAGE;
> +       argv4[arg_idx].package.count =3D 2 + 2 * num_of_ranges;
> +       argv4[arg_idx++].package.elements =3D &argv4[1];
> +       argv4[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +       argv4[arg_idx++].integer.value =3D num_of_ranges;
> +       argv4[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +       argv4[arg_idx++].integer.value =3D action;
> +
> +       for (loop_idx =3D 0; loop_idx < ARRAY_SIZE(in->band_list);
> +            loop_idx++) {
> +               if (!in->band_list[loop_idx].start ||
> +                   !in->band_list[loop_idx].end)
> +                       continue;
> +
> +               argv4[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +               argv4[arg_idx++].integer.value =3D in->band_list[loop_idx=
].start;
> +               argv4[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +               argv4[arg_idx++].integer.value =3D in->band_list[loop_idx=
].end;
> +       }
> +
> +       ret =3D wbrf_dsm(adev, WBRF_RECORD, argv4, NULL);
> +
> +       kfree(argv4);
> +
> +       return ret;
> +}
> +
> +int wbrf_add_exclusion(struct acpi_device *adev,
> +                      struct wbrf_ranges_in *in)
> +{
> +       return wbrf_record(adev, WBRF_RECORD_ADD, in);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
> +
> +int wbrf_remove_exclusion(struct acpi_device *adev,
> +                         struct wbrf_ranges_in *in)
> +{
> +       return wbrf_record(adev, WBRF_RECORD_REMOVE, in);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
> +
> +bool wbrf_supported_producer(struct acpi_device *adev)
> +{
> +       return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +                             WBRF_REVISION,
> +                             (1ULL << WBRF_RECORD) | (1ULL << WBRF_RETRI=
EVE));

I'm wondering if the BIT() macro would work here (and below).

> +}
> +EXPORT_SYMBOL_GPL(wbrf_supported_producer);
> +
> +static union acpi_object *
> +acpi_evaluate_wbrf(acpi_handle handle, u64 rev, u64 func)
> +{
> +       acpi_status ret;
> +       struct acpi_buffer buf =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +       union acpi_object params[4];
> +       struct acpi_object_list input =3D {
> +               .count =3D 4,
> +               .pointer =3D params,
> +       };
> +
> +       params[0].type =3D ACPI_TYPE_INTEGER;
> +       params[0].integer.value =3D rev;
> +       params[1].type =3D ACPI_TYPE_INTEGER;
> +       params[1].integer.value =3D func;
> +       params[2].type =3D ACPI_TYPE_PACKAGE;
> +       params[2].package.count =3D 0;
> +       params[2].package.elements =3D NULL;
> +       params[3].type =3D ACPI_TYPE_STRING;
> +       params[3].string.length =3D 0;
> +       params[3].string.pointer=3D NULL;
> +
> +       ret =3D acpi_evaluate_object(handle, "WBRF", &input, &buf);
> +       if (ACPI_SUCCESS(ret))
> +               return (union acpi_object *)buf.pointer;
> +
> +       if (ret !=3D AE_NOT_FOUND)
> +               acpi_handle_warn(handle,
> +                                "failed to evaluate WBRF(0x%x)\n", ret);

Why _warn()?

> +
> +       return NULL;
> +}
> +
> +static bool check_acpi_wbrf(acpi_handle handle, u64 rev, u64 funcs)
> +{
> +       int i;
> +       u64 mask =3D 0;
> +       union acpi_object *obj;
> +
> +       if (funcs =3D=3D 0)
> +               return false;
> +
> +       obj =3D acpi_evaluate_wbrf(handle, rev, 0);
> +       if (!obj)
> +               return false;
> +
> +       if (obj->type !=3D ACPI_TYPE_BUFFER)
> +               return false;
> +
> +       for (i =3D 0; i < obj->buffer.length && i < 8; i++)
> +               mask |=3D (((u64)obj->buffer.pointer[i]) << (i * 8));

What is going on here?  Any comment to explain it?

> +       ACPI_FREE(obj);
> +
> +       /*
> +        * Bit 0 indicates whether there's support for any functions othe=
r than
> +        * function 0.
> +        */
> +       if ((mask & 0x1) && (mask & funcs) =3D=3D funcs)
> +               return true;
> +
> +       return false;
> +}
> +
> +bool wbrf_supported_consumer(struct acpi_device *adev)
> +{
> +       return check_acpi_wbrf(adev->handle,
> +                              WBRF_REVISION,
> +                              1ULL << WBRF_RETRIEVE);
> +}
> +EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
> +
> +int wbrf_retrieve_exclusions(struct acpi_device *adev,
> +                            struct wbrf_ranges_out *exclusions_out)
> +{
> +       union acpi_object *obj;
> +
> +       obj =3D acpi_evaluate_wbrf(adev->handle,
> +                                WBRF_REVISION,
> +                                WBRF_RETRIEVE);
> +       if (!obj)
> +               return -EINVAL;
> +
> +       memcpy(exclusions_out, obj->buffer.pointer, obj->buffer.length);

How is it guaranteed that the length of the buffer will not exceed the
size of memory allocated by the caller for the data?

> +
> +       ACPI_FREE(obj);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(wbrf_retrieve_exclusions);
> diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
> new file mode 100644
> index 000000000000..e4c99b69f1d2
> --- /dev/null
> +++ b/include/linux/wbrf.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Wifi Band Exclusion Interface
> + * Copyright (C) 2023 Advanced Micro Devices
> + */
> +
> +#ifndef _LINUX_WBRF_H
> +#define _LINUX_WBRF_H
> +
> +#include <linux/acpi.h>
> +
> +/* Maximum number of wbrf ranges */
> +#define MAX_NUM_OF_WBRF_RANGES         11
> +
> +struct exclusion_range {
> +       /* start and end point of the frequency range in Hz */
> +       uint64_t        start;
> +       uint64_t        end;
> +};
> +
> +struct wbrf_ranges_in {
> +       /* valid entry: `start` and `end` filled with non-zero values */
> +       struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> +};
> +
> +struct wbrf_ranges_out {
> +       uint32_t                num_of_ranges;
> +       struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> +} __attribute__((packed));
> +
> +/**
> + * APIs needed by drivers/subsystems for contributing frequencies:
> + * During probe, check `wbrf_supported_producer` to see if WBRF is suppo=
rted.
> + * If adding frequencies, then call `wbrf_add_exclusion` with the
> + * start and end points specified for the frequency ranges added.
> + * If removing frequencies, then call `wbrf_remove_exclusion` with
> + * start and end points specified for the frequency ranges added.
> + */
> +bool wbrf_supported_producer(struct acpi_device *adev);
> +int wbrf_add_exclusion(struct acpi_device *adev,
> +                      struct wbrf_ranges_in *in);
> +int wbrf_remove_exclusion(struct acpi_device *adev,
> +                         struct wbrf_ranges_in *in);
> +
> +/**
> + * APIs needed by drivers/subsystems responding to frequencies:
> + * During probe, check `wbrf_supported_consumer` to see if WBRF is suppo=
rted.
> + * When receiving an ACPI notification for some frequencies change, run
> + * `wbrf_retrieve_exclusions` to retrieve the latest frequencies ranges.
> + */
> +int wbrf_retrieve_exclusions(struct acpi_device *adev,
> +                            struct wbrf_ranges_out *out);
> +bool wbrf_supported_consumer(struct acpi_device *adev);
> +
> +#endif /* _LINUX_WBRF_H */
> --
> 2.34.1
>
