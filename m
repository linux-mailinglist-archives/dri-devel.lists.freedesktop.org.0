Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A751C73BD9C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFA410E68B;
	Fri, 23 Jun 2023 17:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811D410E68B;
 Fri, 23 Jun 2023 17:16:11 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-97ea801b0d0so18431266b.1; 
 Fri, 23 Jun 2023 10:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687540570; x=1690132570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++I0bwtrHbKq/ScVaI2y/wuFflAnqwfHn5bGDDiyGlI=;
 b=SkiVg6JYTL5MRAJlhu1Nbl6zfuzWg8Z51d49LmffgXoAiW2OSJHz84PYYgPKlnkXOn
 iJ95Bw/S6alALHfdBO9J0ab/QwySTh4yq+8x0p7a/jvFoDWbcSmji3kzOcVynxCENzK8
 kbDwJYw72uMxuD09NtN4NCXm6CQbT3I7NmUIk04R/iEe6XL+BhLmM9PUa77cMNVMyoXA
 k236Xx//QB60U/1TL6j0htuU8KS0RCR/6K1l/6chTZHjo42kc0bXiPOB8GgLWbtpbWUo
 N/eATAy2+2Z8vSPnXc0IKFlOAqckEHNhopzIDCxvUu8Wl0TpMxnjzv6efDPE0V6nWOe6
 6r7w==
X-Gm-Message-State: AC+VfDwAgULgAz7xjwthAXHTzE4kfafeaLGmM1tHDkAKa2YLvBQ8a+bX
 qY7UazEOCZ9jAiE1AxdaLFKA4i1oygx3A6Y8KTA=
X-Google-Smtp-Source: ACHHUZ5US9J/ZgCAFTh5AYOguizpGxZnLeJHo3AK7Wd3X9ovii63C+dm6Qk1WKxgnt2LMEl9QMec3C8Z8RMvEXNgmWA=
X-Received: by 2002:a17:906:73dd:b0:989:1ed3:d00b with SMTP id
 n29-20020a17090673dd00b009891ed3d00bmr9073854ejl.4.1687540569572; Fri, 23 Jun
 2023 10:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <CAJZ5v0iqy0yMJP5H7ub67R8R6i42=TcS_6+VF-+fWrM-9tYFQA@mail.gmail.com>
 <c518da2a-5ba5-af7e-e26d-1973db7b4c9e@amd.com>
 <CAJZ5v0gnTt0pV4nF+jcYCyZuZXDNuRn3mS0bDoAv-ZDpetyxVg@mail.gmail.com>
 <5d6f6a89-1c7f-3763-8616-b80fdc301603@amd.com>
In-Reply-To: <5d6f6a89-1c7f-3763-8616-b80fdc301603@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 Jun 2023 19:15:57 +0200
Message-ID: <CAJZ5v0iwPqD5PhQ8OcXO_xncFwH824h=U7W50pyPMBqtPSpP=g@mail.gmail.com>
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
To: "Limonciello, Mario" <mario.limonciello@amd.com>
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, trix@redhat.com, lijo.lazar@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mdaenzer@redhat.com, amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com,
 arnd@arndb.de, hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>,
 netdev@vger.kernel.org, Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org,
 edumazet@google.com, christian.koenig@amd.com, tzimmermann@suse.de,
 alexander.deucher@amd.com, johannes@sipsolutions.net, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 6:48=E2=80=AFPM Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
>
> On 6/23/2023 11:28 AM, Rafael J. Wysocki wrote:
> > On Fri, Jun 23, 2023 at 5:57=E2=80=AFPM Limonciello, Mario
> > <mario.limonciello@amd.com> wrote:
> >>
> >> On 6/23/2023 9:52 AM, Rafael J. Wysocki wrote:
> >>> On Wed, Jun 21, 2023 at 7:47=E2=80=AFAM Evan Quan <evan.quan@amd.com>=
 wrote:
> >>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>
> >>>> Due to electrical and mechanical constraints in certain platform des=
igns
> >>>> there may be likely interference of relatively high-powered harmonic=
s of
> >>>> the (G-)DDR memory clocks with local radio module frequency bands us=
ed
> >>>> by Wifi 6/6e/7.
> >>>>
> >>>> To mitigate this, AMD has introduced an ACPI based mechanism that
> >>>> devices can use to notify active use of particular frequencies so
> >>>> that devices can make relative internal adjustments as necessary
> >>>> to avoid this resonance.
> >>>>
> >>>> In order for a device to support this, the expected flow for device
> >>>> driver or subsystems:
> >>>>
> >>>> Drivers/subsystems contributing frequencies:
> >>>>
> >>>> 1) During probe, check `wbrf_supported_producer` to see if WBRF supp=
orted
> >>> The prefix should be acpi_wbrf_ or acpi_amd_wbrf_ even, so it is clea=
r
> >>> that this uses ACPI and is AMD-specific.
> >> I guess if we end up with an intermediary library approach
> >> wbrf_supported_producer makes sense and that could call acpi_wbrf_*.
> >>
> >> But with no intermediate library your suggestion makes sense.
> >>
> >> I would prefer not to make it acpi_amd as there is no reason that
> >> this exact same problem couldn't happen on an
> >> Wifi 6e + Intel SOC + AMD dGPU design too and OEMs could use the
> >> same mitigation mechanism as Wifi6e + AMD SOC + AMD dGPU too.
> > The mitigation mechanism might be the same, but the AML interface very
> > well may be different.
>
>
> Right.  I suppose right now we should keep it prefixed as "amd",
> and if it later is promoted as a standard it can be renamed.
>
>
> >
> > My point is that this particular interface is AMD-specific ATM and I'm
> > not aware of any plans to make it "standard" in some way.
>
>
> Yeah; this implementation is currently AMD specific AML, but I
> expect the exact same AML would be delivered to OEMs using the
> dGPUs.
>
>
> >
> > Also if the given interface is specified somewhere, it would be good
> > to have a pointer to that place.
>
>
> It's a code first implementation.  I'm discussing with the
> owners when they will release it.
>
>
> >
> >>> Whether or not there needs to be an intermediate library wrapped
> >>> around this is a different matter.
> > IMO individual drivers should not be expected to use this interface
> > directly, as that would add to boilerplate code and overall bloat.
>
> The thing is the ACPI method is not a platform method.  It's
> a function of the device (_DSM).

_DSM is an interface to the platform like any other AML, so I'm not
really sure what you mean.

> The reason for having acpi_wbrf.c in the first place is to
> avoid the boilerplate of the _DSM implementation across multiple
> drivers.

Absolutely, drivers should not be bothered with having to use _DSM in
any case.  However, they may not even realize that they are running on
a system using ACPI and I'm not sure if they really should care.

> >
> > Also whoever uses it, would first need to check if the device in
> > question has an ACPI companion.
>
>
> Which comes back to Andrew's point.
> Either we:
>
> Have a generic wbrf_ helper that takes struct *device and
> internally checks if there is an ACPI companion and support.
>
> or
>
> Do the check for support in mac80211 + applicable drivers
> and only call the AMD WBRF ACPI method in those drivers in
> those cases.

Either of the above has problems IMO.

The problem with the wbrf_ helper approach is that it adds
(potentially) several pieces of interaction with the platform,
potentially for every driver, in places where drivers don't do such
things as a rule.

The problem with the other approach is that the drivers in question
now need to be aware of ACPI in general and the AMD WBRF interface in
particular and if other similar interfaces are added by other vendors,
they will have to learn about those as well.

I think that we need to start over with a general problem statement
that in some cases the platform needs to be consulted regarding radio
frequencies that drivers would like to use, because it may need to
adjust or simply say which ranges are "noisy" (or even completely
unusable for that matter).  That should allow us to figure out how the
interface should look like from the driver side and it should be
possible to hook up the existing platform interface to that.
