Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D0E7A51DC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 20:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A441110E2C5;
	Mon, 18 Sep 2023 18:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5C10E2C6;
 Mon, 18 Sep 2023 18:15:56 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-57acd4917f6so152932eaf.1; 
 Mon, 18 Sep 2023 11:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695060955; x=1695665755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2sB0ye4RHCqzuszVeimvycn2jMqmrDjjI0brH6f2kv0=;
 b=WCnjPiq57ReqKWkuHhAoHjtSHR2ppChhoUk92QoEJYAacEU7pznZ2BY0X80ql+16qO
 cCM9ztge4Lip3gwOYnyeWusRu5mQiwusuTGEScB5G2XC3riHUhnNZ72dZXKPdX0volKQ
 xkfsP7XbKpGrj9HiDieBwYkJzmWZCBATm3MBlx6epGIUfuSXecFG2T1FP3tsG6FryAGZ
 I0mfWZUKADfpbpMQ/PXOWf5msGD2uAEEIQSoBCPfbAzGADmjbtwPc292nkMqbyqmLhXY
 OenVllHm8aZp3cin0tMsKbxrYFhaSYe6Pc1mxYrvJJfaROKsVfdV8Ia1jkTdTU7H387I
 mVLw==
X-Gm-Message-State: AOJu0YzZ/WcGyODa2efhwexvG0BNnGdK1sBPP5BETyxRBkHQuQ4c+zho
 Qf9uIwW7Yzp/T1xrlvV235E40q4/ggZTtDmQ8eM=
X-Google-Smtp-Source: AGHT+IE2xvtT9L6roFQ0xoFBDv1iOEBW440LXMCYCm6N7Y8VdvOxcFsbX8a3SBtxgT1gV+VROuQXy60desLQ1erHDuo=
X-Received: by 2002:a4a:dc93:0:b0:573:4a72:6ec with SMTP id
 g19-20020a4adc93000000b005734a7206ecmr9818188oou.1.1695060955150; Mon, 18 Sep
 2023 11:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230831062031.1014799-1-evan.quan@amd.com>
 <20230831062031.1014799-2-evan.quan@amd.com>
In-Reply-To: <20230831062031.1014799-2-evan.quan@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Sep 2023 20:15:44 +0200
Message-ID: <CAJZ5v0gMwfKyskng7HUf7cNGY0QfwtdRivKpXw7Xnu=GimDFGQ@mail.gmail.com>
Subject: Re: [V11 1/8] ACPI: Add support for AMD ACPI based Wifi band RFI
 mitigation feature
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
Cc: rafael@kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lijo.Lazar@amd.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, edumazet@google.com, mario.limonciello@amd.com,
 alexander.deucher@amd.com, kuba@kernel.org, johannes@sipsolutions.net,
 pabeni@redhat.com, davem@davemloft.net, lenb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 8:21=E2=80=AFAM Evan Quan <evan.quan@amd.com> wrote=
:
>
> Due to electrical and mechanical constraints in certain platform designs
> there may be likely interference of relatively high-powered harmonics of
> the (G-)DDR memory clocks with local radio module frequency bands used
> by Wifi 6/6e/7.
>
> To mitigate this, AMD has introduced a mechanism that devices can use to
> notify active use of particular frequencies so that other devices can mak=
e
> relative internal adjustments as necessary to avoid this resonance.

The changelog is only marginally useful IMV.

It doesn't even mention the role of ACPI in all this, so it is quite
unclear what the patch is all about, why it does what it does and what
is actually done in it.

It is also unclear why this code is put into drivers/acpi/, which
should be explained.

> Signed-off-by: Evan Quan <evan.quan@amd.com>
> --
> v10->v11:
>   - fix typo(Simon)
> ---
>  drivers/acpi/Kconfig          |  17 ++
>  drivers/acpi/Makefile         |   2 +
>  drivers/acpi/amd_wbrf.c       | 414 ++++++++++++++++++++++++++++++++++
>  include/linux/acpi_amd_wbrf.h | 140 ++++++++++++
>  4 files changed, 573 insertions(+)
>  create mode 100644 drivers/acpi/amd_wbrf.c
>  create mode 100644 include/linux/acpi_amd_wbrf.h
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 00dd309b6682..a092ea72d152 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -594,6 +594,23 @@ config ACPI_PRMT
>           substantially increase computational overhead related to the
>           initialization of some server systems.
>
> +config WBRF_AMD_ACPI
> +       bool "ACPI based WBRF mechanism introduced by AMD"
> +       depends on ACPI
> +       default n
> +       help
> +         Wifi band RFI mitigation mechanism allows multiple drivers from
> +         different domains to notify the frequencies in use so that hard=
ware
> +         can be reconfigured to avoid harmonic conflicts.

So drivers can notify the platform firmware IIUC, but that is not
really clear from the above.  I'm not even sure what the phrase
"notify the frequencies in use" is supposed to mean.

> +
> +         AMD has introduced an ACPI based mechanism to support WBRF for =
some
> +         platforms with AMD dGPU and WLAN. This needs support from BIOS =
equipped
> +         with necessary AML implementations and dGPU firmwares.
> +
> +         Before enabling this ACPI based mechanism, it is suggested to c=
onfirm
> +         with the hardware designer/provider first whether your platform
> +         equipped with necessary BIOS and firmwares.

No, this doesn't work.

Say you are a distro and you want to supply all of your users with the
same binary kernel image.  What are you expected to do to address the
above?

> +
>  endif  # ACPI
>
>  config X86_PM_TIMER
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index eaa09bf52f17..a3d2f259d0a5 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -132,3 +132,5 @@ obj-$(CONFIG_ARM64)         +=3D arm64/
>  obj-$(CONFIG_ACPI_VIOT)                +=3D viot.o
>
>  obj-$(CONFIG_RISCV)            +=3D riscv/
> +
> +obj-$(CONFIG_WBRF_AMD_ACPI)    +=3D amd_wbrf.o
> diff --git a/drivers/acpi/amd_wbrf.c b/drivers/acpi/amd_wbrf.c
> new file mode 100644
> index 000000000000..8ee0e2977a30
> --- /dev/null
> +++ b/drivers/acpi/amd_wbrf.c
> @@ -0,0 +1,414 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Wifi Band Exclusion Interface (AMD ACPI Implementation)
> + * Copyright (C) 2023 Advanced Micro Devices
> + *

Please document the code in this file at least basically.

You don't even explain what Wifi Band Exclusion means.

The OS-firmware interface that this code is based on should be
described here or a link to its description should be provided at the
very least.

As it is now, one needs to reverse engineer the patch in order to get
any idea about how this interface is designed.

> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/acpi_amd_wbrf.h>
> +
> +#define ACPI_AMD_WBRF_METHOD   "\\WBRF"
> +
> +/*
> + * Functions bit vector for WBRF method
> + *
> + * Bit 0: Supported for any functions other than function 0.
> + * Bit 1: Function 1 (Add / Remove frequency) is supported.
> + * Bit 2: Function 2 (Get frequency list) is supported.
> + */

Without any additional information, the comment above is meaningless.

> +#define WBRF_ENABLED                           0x0
> +#define WBRF_RECORD                            0x1
> +#define WBRF_RETRIEVE                          0x2
> +
> +/* record actions */
> +#define WBRF_RECORD_ADD                0x0
> +#define WBRF_RECORD_REMOVE     0x1
> +
> +#define WBRF_REVISION          0x1
> +
> +/*
> + * The data structure used for WBRF_RETRIEVE is not naturally aligned.
> + * And unfortunately the design has been settled down.
> + */
> +struct amd_wbrf_ranges_out {
> +       u32                     num_of_ranges;
> +       struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> +} __packed;
> +
> +static const guid_t wifi_acpi_dsm_guid =3D
> +       GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
> +                 0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
> +
> +static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);

I should have to reverse engineer the code in order to find out what
this notifier is for.

> +
> +static int wbrf_dsm(struct acpi_device *adev,
> +                   u8 fn,
> +                   union acpi_object *argv4)
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
> +       case ACPI_TYPE_INTEGER:
> +               rc =3D obj->integer.value ? -EINVAL : 0;

rc =3D obj->integer.value;
if (rc)
        rc =3D -EINVAL;

And why -EINVAL?

> +               break;
> +       default:
> +               rc =3D -EOPNOTSUPP;

Why -EOPNOTSUPP?

> +       }
> +
> +       ACPI_FREE(obj);
> +
> +       return rc;
> +}
> +
> +static int wbrf_record(struct acpi_device *adev, uint8_t action,
> +                      struct wbrf_ranges_in_out *in)
> +{
> +       union acpi_object argv4;
> +       union acpi_object *tmp;
> +       u32 num_of_ranges =3D 0;
> +       u32 num_of_elements;
> +       u32 arg_idx =3D 0;
> +       u32 loop_idx;
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
> +       /*
> +        * The valid entry counter does not match with this told.
> +        * Something must went wrong.
> +        */

It would be better to say that the num_of_ranges value in the in
object supplied by the caller is required to be equal to the number of
entries in the band_list array in there.  And put that comment in
front of the loop above.

> +       if (num_of_ranges !=3D in->num_of_ranges)
> +               return -EINVAL;
> +
> +       /*
> +        * Every input frequency band comes with two end points(start/end=
)
> +        * and each is accounted as an element. Meanwhile the range count
> +        * and action type are accounted as an element each.
> +        * So, the total element count =3D 2 * num_of_ranges + 1 + 1.

This information belongs to the (missing) description of the
OS-firmware interface used by this code.

> +        */
> +       num_of_elements =3D 2 * num_of_ranges + 1 + 1;

Why not 2 * num_of_ranges + 2?

> +
> +       tmp =3D kcalloc(num_of_elements, sizeof(*tmp), GFP_KERNEL);
> +       if (!tmp)
> +               return -ENOMEM;
> +
> +       argv4.package.type =3D ACPI_TYPE_PACKAGE;
> +       argv4.package.count =3D num_of_elements;
> +       argv4.package.elements =3D tmp;
> +
> +       tmp[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +       tmp[arg_idx++].integer.value =3D num_of_ranges;
> +       tmp[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +       tmp[arg_idx++].integer.value =3D action;

Why not use 0 and 1 as indices directly above and start arg_idx below at 2?

And why are 2 indices needed in the loop below?  What would be wrong
with using loop_idx alone and computing arg_idx from it?

> +
> +       for (loop_idx =3D 0; loop_idx < ARRAY_SIZE(in->band_list);
> +            loop_idx++) {
> +               if (!in->band_list[loop_idx].start ||
> +                   !in->band_list[loop_idx].end)
> +                       continue;
> +
> +               tmp[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +               tmp[arg_idx++].integer.value =3D in->band_list[loop_idx].=
start;
> +               tmp[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> +               tmp[arg_idx++].integer.value =3D in->band_list[loop_idx].=
end;
> +       }
> +
> +       ret =3D wbrf_dsm(adev, WBRF_RECORD, &argv4);

So this is the only callers of wbrf_dsm() which is a super-simple
wrapper around acpi_evaluate_dsm().

Could it be folded in here?

> +
> +       kfree(tmp);
> +
> +       return ret;
> +}
> +
> +/**
> + * acpi_amd_wbrf_add_exclusion - broadcast the frequency band the device
> + *                               is using

Would it be possible to fit the above into one line of code?

And what does "exclusion" mean here?

Moreover, is the acpi_ prefix really useful?

> + *
> + * @dev: device pointer

What device does it point to?

> + * @in: input structure containing the frequency band the device is usin=
g
> + *
> + * Broadcast to other consumers the frequency band the device starts
> + * to use. Underneath the surface the information is cached into an
> + * internal buffer first. Then a notification is sent to all those
> + * registered consumers. So then they can retrieve that buffer to
> + * know the latest active frequency bands. The benefit with such design
> + * is for those consumers which have not been registered yet, they can
> + * still have a chance to retrieve such information later.

This is part of the design description missing from the preamble comment.

Besides, what really happens in this function is that it invokes the
firmware-provided _DSM to do something and then it calls the
wbrf_chain_head notifier chain in order to tell the other users of
this interface about that action.

And it isn't really clear what that action is, because of the missing
OS-firmware interface description.

> + */
> +int acpi_amd_wbrf_add_exclusion(struct device *dev,
> +                               struct wbrf_ranges_in_out *in)
> +{
> +       struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +       int ret;
> +
> +       if (!adev)
> +               return -ENODEV;
> +
> +       ret =3D wbrf_record(adev, WBRF_RECORD_ADD, in);
> +       if (ret)
> +               return ret;
> +
> +       blocking_notifier_call_chain(&wbrf_chain_head,
> +                                    WBRF_CHANGED,
> +                                    NULL);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_add_exclusion);
> +
> +/**
> + * acpi_amd_wbrf_remove_exclusion - broadcast the frequency band the dev=
ice
> + *                                  is no longer using
> + *
> + * @dev: device pointer
> + * @in: input structure containing the frequency band which is not used
> + *      by the device any more
> + *
> + * Broadcast to other consumers the frequency band the device stops
> + * to use. The stored information paired with this will be dropped
> + * from the internal buffer. And then a notification is sent to
> + * all registered consumers.
> + */
> +int acpi_amd_wbrf_remove_exclusion(struct device *dev,
> +                                  struct wbrf_ranges_in_out *in)
> +{
> +       struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +       int ret;
> +
> +       if (!adev)
> +               return -ENODEV;
> +
> +       ret =3D wbrf_record(adev, WBRF_RECORD_REMOVE, in);
> +       if (ret)
> +               return ret;
> +
> +       blocking_notifier_call_chain(&wbrf_chain_head,
> +                                    WBRF_CHANGED,
> +                                    NULL);

Can you possibly reduce code duplication between this and the previous
function by combining them into one with an extra "action" argument?

> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_remove_exclusion);
> +
> +static bool acpi_amd_wbrf_supported_system(void)
> +{
> +       acpi_status status;
> +       acpi_handle handle;
> +
> +       status =3D acpi_get_handle(NULL, ACPI_AMD_WBRF_METHOD, &handle);
> +
> +       return ACPI_SUCCESS(status);
> +}
> +
> +/**
> + * acpi_amd_wbrf_supported_producer - determine if the WBRF can be enabl=
ed
> + *                                    for the device as a producer
> + *
> + * @dev: device pointer
> + *
> + * Determine if the platform equipped with necessary implementations to

How does it determine that?

> + * support WBRF for the device as a producer.
> + */
> +bool acpi_amd_wbrf_supported_producer(struct device *dev)
> +{
> +       struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +
> +       if (!acpi_amd_wbrf_supported_system())
> +               return false;
> +
> +       if (!adev)
> +               return false;
> +
> +       return acpi_check_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +                             WBRF_REVISION,
> +                             BIT(WBRF_RECORD));

The WBRF_RECORD _DSM function support is checked here, but what if
WBRF_RETRIEVE is not supported?

> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_producer);
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
> +       params[3].string.pointer =3D NULL;
> +
> +       ret =3D acpi_evaluate_object(handle, "WBRF", &input, &buf);

The WBRF method needs to be described somewhere.

> +       if (ACPI_FAILURE(ret))
> +               return NULL;
> +
> +       return buf.pointer;
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
> +       /*
> +        * Bit vector providing supported functions information.
> +        * Each bit marks support for one specific function of the WBRF m=
ethod.
> +        */
> +       for (i =3D 0; i < obj->buffer.length && i < 8; i++)
> +               mask |=3D (u64)obj->buffer.pointer[i] << i * 8;
> +
> +       ACPI_FREE(obj);
> +
> +       return mask & BIT(WBRF_ENABLED) && (mask & funcs) =3D=3D funcs;
> +}
> +
> +/**
> + * acpi_amd_wbrf_supported_consumer - determine if the WBRF can be enabl=
ed
> + *                                    for the device as a consumer
> + *
> + * @dev: device pointer
> + *
> + * Determine if the platform equipped with necessary implementations to
> + * support WBRF for the device as a consumer.

So when is "success" returned?

> + */
> +bool acpi_amd_wbrf_supported_consumer(struct device *dev)
> +{
> +       struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +
> +       if (!acpi_amd_wbrf_supported_system())
> +               return false;
> +
> +       if (!adev)
> +               return false;
> +
> +       return check_acpi_wbrf(adev->handle,
> +                              WBRF_REVISION,
> +                              BIT(WBRF_RETRIEVE));
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_supported_consumer);
> +
> +/**
> + * acpi_amd_wbrf_retrieve_exclusions - retrieve current active frequency
> + *                                     bands
> + *
> + * @dev: device pointer
> + * @out: output structure containing all the active frequency bands
> + *
> + * Retrieve the current active frequency bands which were broadcasted
> + * by other producers. The consumer who calls this API should take
> + * proper actions if any of the frequency band may cause RFI with its
> + * own frequency band used.
> + */
> +int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
> +                                     struct wbrf_ranges_in_out *out)
> +{
> +       struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +       struct amd_wbrf_ranges_out acpi_out =3D {0};
> +       union acpi_object *obj;
> +       int ret =3D 0;
> +
> +       if (!adev)
> +               return -ENODEV;
> +
> +       obj =3D acpi_evaluate_wbrf(adev->handle,
> +                                WBRF_REVISION,
> +                                WBRF_RETRIEVE);
> +       if (!obj)
> +               return -EINVAL;
> +
> +       /*
> +        * The return buffer is with variable length and the format below=
:
> +        * number_of_entries(1 DWORD):       Number of entries
> +        * start_freq of 1st entry(1 QWORD): Start frequency of the 1st e=
ntry
> +        * end_freq of 1st entry(1 QWORD):   End frequency of the 1st ent=
ry
> +        * ...
> +        * ...
> +        * start_freq of the last entry(1 QWORD)
> +        * end_freq of the last entry(1 QWORD)
> +        *
> +        * Thus the buffer length is determined by the number of entries.
> +        * - For zero entry scenario, the buffer length will be 4 bytes.
> +        * - For one entry scenario, the buffer length will be 20 bytes.

This again is part of the (missing) OS-firmware interface description.

> +        */
> +       if (obj->buffer.length > sizeof(acpi_out) ||
> +           obj->buffer.length < 4) {
> +               dev_err(dev, "Wrong sized WBRT information");
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +       memcpy(&acpi_out, obj->buffer.pointer, obj->buffer.length);
> +
> +       out->num_of_ranges =3D acpi_out.num_of_ranges;
> +       memcpy(out->band_list, acpi_out.band_list, sizeof(acpi_out.band_l=
ist));

I've already asked about this memcpy() which IMO is questionable at least o=
nce.

The requirement that the binary format of data in out->band_list be
the same as the binary format of data in the buffer returned from the
platform firmware is at best artificial IMO.

> +
> +out:
> +       ACPI_FREE(obj);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_retrieve_exclusions);
> +
> +/**
> + * acpi_amd_wbrf_register_notifier - register for notifications of frequ=
ency
> + *                                   band update
> + *
> + * @nb: driver notifier block
> + *
> + * The consumer should register itself via this API. So that it can get
> + * notified timely on the frequency band updates from other producers.
> + */
> +int acpi_amd_wbrf_register_notifier(struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_register(&wbrf_chain_head, nb);
> +}
> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_register_notifier);
> +
> +/**
> + * acpi_amd_wbrf_unregister_notifier - unregister for notifications of
> + *                                     frequency band update
> + *
> + * @nb: driver notifier block
> + *
> + * The consumer should call this API when it is longer interested with
> + * the frequency band updates from other producers. Usually, this should
> + * be performed during driver cleanup.
> + */
> +int acpi_amd_wbrf_unregister_notifier(struct notifier_block *nb)
> +{
> +       return blocking_notifier_chain_unregister(&wbrf_chain_head, nb);
> +}

The notifier change needs to be documented.  So far, it is not clear
who should register to it and why and how they are supposed to respond
to the notifications.

> +EXPORT_SYMBOL_GPL(acpi_amd_wbrf_unregister_notifier);
> diff --git a/include/linux/acpi_amd_wbrf.h b/include/linux/acpi_amd_wbrf.=
h
> new file mode 100644
> index 000000000000..c2363d664641
> --- /dev/null
> +++ b/include/linux/acpi_amd_wbrf.h
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Wifi Band Exclusion Interface (AMD ACPI Implementation)
> + * Copyright (C) 2023 Advanced Micro Devices
> + *
> + * Due to electrical and mechanical constraints in certain platform desi=
gns
> + * there may be likely interference of relatively high-powered harmonics=
 of
> + * the (G-)DDR memory clocks with local radio module frequency bands use=
d
> + * by Wifi 6/6e/7.

And presumably, that interference causes throughput reduction or similar.

> + *
> + * To mitigate this, AMD has introduced an ACPI based mechanism to suppo=
rt
> + * WBRF(Wifi Band RFI mitigation Feature) for platforms with AMD dGPU + =
WLAN.
> + * This needs support from BIOS equipped with necessary AML implementati=
ons
> + * and dGPU firmwares.
> + *
> + * Some general terms:
> + * Producer: such component who can produce high-powered radio frequency

"such" is unnecessary here and below and I would use "that" instead of "who=
".

Maybe "Producer: Component that can generate high-frequency radio signal"?

> + * Consumer: such component who can adjust its in-use frequency in
> + *           response to the radio frequencies of other components to
> + *           mitigate the possible RFI.

"Consumer: Component that can adjust its radio frequency usage to
avoid RFI if notified by other components about their RF usage."

> + *
> + * To make the mechanism function, those producers should notify active =
use
> + * of their particular frequencies so that other consumers can make rela=
tive
> + * internal adjustments as necessary to avoid this resonance.

I would say "destructive interference" or similar.

> + */
> +
> +#ifndef _ACPI_AMD_WBRF_H
> +#define _ACPI_AMD_WBRF_H
> +
> +#include <linux/device.h>
> +#include <linux/notifier.h>
> +
> +/*
> + * A wbrf range is defined as a frequency band with start and end
> + * frequency point specified(in Hz). And a vaild range should have
> + * its start and end frequency point filled with non-zero values.
> + * Meanwhile, the maximum number of wbrf ranges is limited as
> + * `MAX_NUM_OF_WBRF_RANGES`.

I suppose that this means the maximum number of ranges that can be
used simultaneously in one operation or in one go?

> + */
> +#define MAX_NUM_OF_WBRF_RANGES         11
> +
> +struct exclusion_range {
> +       u64             start;
> +       u64             end;
> +};
> +
> +struct wbrf_ranges_in_out {
> +       u64                     num_of_ranges;
> +       struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
> +};
> +
> +/*
> + * The notification types for the consumers are defined as below.
> + * The consumers may need to take different actions in response to
> + * different notifications.

The above doesn't make sense to me.  There is only one value defined
below and the action to be carried out upon it is documented below.

Also this means that "WBRF consumers" are expected to register to the
notifier chain so as to get the notifications telling them to update
the list of the "active frequency bands" (whatever the last phrase
means).

> + * WBRF_CHANGED: there was some frequency band updates. The consumers
> + *               should retrieve the latest active frequency bands.
> + */
> +enum wbrf_notifier_actions {
> +       WBRF_CHANGED,
> +};
> +
> +#if IS_ENABLED(CONFIG_WBRF_AMD_ACPI)
> +/*
> + * The expected flow for the producers:
> + * 1) During probe, call `acpi_amd_wbrf_supported_producer` to check
> + *    if WBRF can be enabled for the device.

The "During probe" part is redundant here and below.  It obviously
should be done prior to using any RF, but not necessarily during probe
AFAICS.

> + * 2) On using some frequency band, call `acpi_amd_wbrf_add_exclusion`
> + *    to get other consumers properly notified.

What does "other" mean here?

Moreover, this isn't just about consumers IIUC, because the platform
firmware is involved too.

> + * 3) Or on stopping using some frequency band, call
> + *    `acpi_amd_wbrf_remove_exclusion` to get other consumers notified.
> + */
> +bool acpi_amd_wbrf_supported_producer(struct device *dev);
> +int acpi_amd_wbrf_remove_exclusion(struct device *dev,
> +                                  struct wbrf_ranges_in_out *in);
> +int acpi_amd_wbrf_add_exclusion(struct device *dev,
> +                               struct wbrf_ranges_in_out *in);
> +
> +/*
> + * The expected flow for the consumers:
> + * 1) During probe, call `acpi_amd_wbrf_supported_consumer` to check if =
WBRF
> + *    can be enabled for the device.
> + * 2) Call `acpi_amd_wbrf_register_notifier` to register for notificatio=
n
> + *    of frequency band change(add or remove) from other producers.

Again, what does "other" mean here?

> + * 3) Call the `acpi_amd_wbrf_retrieve_exclusions` intentionally to retr=
ieve

"intentionally" is redundant.

> + *    current active frequency bands considering some producers may broa=
dcast
> + *    such information before the consumer is up.

"current active frequency bands in case some producers have registered
them already".

> + * 4) On receiving a notification for frequency band change, run
> + *    `acpi_amd_wbrf_retrieve_exclusions` again to retrieve the latest
> + *    active frequency bands.

"the most recent list of active frequency bands".

> + * 5) During driver cleanup, call `acpi_amd_wbrf_unregister_notifier` to
> + *    unregister the notifier.

This completely misses the information regarding what the consumers
are expected to do with the list of "active frequency bands" after
retrieving it.  Presumably, they are expected to adjust their RF usage
accordingly, but what if the rate at which that list changes is too
high for them to react?  Is there any rate limit or similar?

Moreover, does this require any synchronization between different
producers, for example?  Or is the platform firmware interface
expected to synchronize them sufficiently?

I can easily imagine a few race condition scenarios with the current
code in this patch, but I'm not sure if they are really problematic.
In any case, it would be good to document the mutual exclusion
requirements here or the lack thereof if none (which should be
explained).

> + */
> +bool acpi_amd_wbrf_supported_consumer(struct device *dev);
> +int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
> +                                     struct wbrf_ranges_in_out *out);
> +int acpi_amd_wbrf_register_notifier(struct notifier_block *nb);
> +int acpi_amd_wbrf_unregister_notifier(struct notifier_block *nb);
> +#else
> +static inline
> +bool acpi_amd_wbrf_supported_consumer(struct device *dev)
> +{
> +       return false;
> +}
> +static inline
> +int acpi_amd_wbrf_remove_exclusion(struct device *dev,
> +                                  struct wbrf_ranges_in_out *in)
> +{
> +       return -ENODEV;
> +}
> +static inline
> +int acpi_amd_wbrf_add_exclusion(struct device *dev,
> +                               struct wbrf_ranges_in_out *in)
> +{
> +       return -ENODEV;
> +}
> +static inline
> +bool acpi_amd_wbrf_supported_producer(struct device *dev)
> +{
> +       return false;
> +}
> +static inline
> +int acpi_amd_wbrf_retrieve_exclusions(struct device *dev,
> +                                     struct wbrf_ranges_in_out *out)
> +{
> +       return -ENODEV;
> +}
> +static inline
> +int acpi_amd_wbrf_register_notifier(struct notifier_block *nb)
> +{
> +       return -ENODEV;
> +}
> +static inline
> +int acpi_amd_wbrf_unregister_notifier(struct notifier_block *nb)
> +{
> +       return -ENODEV;
> +}
> +#endif
> +
> +#endif /* _ACPI_AMD_WBRF_H */
> --

Overall, I'm not even sure if drivers/acpi/ is the most suitable place
for this code.

The fact that it is using an ACPI-based OS-firmware interface by
itself is not sufficient for that.  x86 platform drivers also use ACPI
in vendor-specific ways and that by itself doesn't mean that they
should be located in drivers/acpi/.
