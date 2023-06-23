Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8246D73BC8C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38C010E672;
	Fri, 23 Jun 2023 16:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F07F10E672;
 Fri, 23 Jun 2023 16:28:15 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2b57b4e95a8so2832641fa.1; 
 Fri, 23 Jun 2023 09:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687537693; x=1690129693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvgeaWwow5dQzFM6Uw8ojK5T7WjFQWYGvDt1Izr/8jk=;
 b=gqQ5p355zp2q1u3wlrs/v1mnKsKLrJ3WQoblNZH0o3FVYoZTmNSiJCqE0swlDOem4h
 3myzogySVKqLk1/T2v2n/dkP/5axHN/zpuaT1NzCOZot3TiNDnc4X9YyqyACnHeICWc5
 uJff761/SzQOmfZjOnPvf6iemQNYTTZsWaf9dEO2kBNZQPVWohZJnTgtmjEAd78C6QKC
 x/Zgc5MCi7AsExuohZPVib1KZJJmtbCd9H2wMccIQMPzr7lIsbDoNtFiVJNR0QkX+ira
 YzMvATfR/ixK93Iow6bIp/cwLqLaYkHsdjP8/DeTsNEk+88oSbfLhmZJn9/KVc7gYcpg
 xdkg==
X-Gm-Message-State: AC+VfDyj8GIyoAtzcHXcKddyZFBoujIbzjPitnCW74gnlOq+gz+ioWWa
 qAJJ9L/CsVy/QmlyXqvzswtXpYIe0UiQgOpd6uI=
X-Google-Smtp-Source: ACHHUZ7MZE3zsM6gspBvAbI6j3yhuhxSNyO7LoHURailwc+M8lU+tu/GWJJ/M+xF6Lk75Dt+elliEUR2HeQhtX0eK54=
X-Received: by 2002:a2e:a492:0:b0:2b4:6d9a:2222 with SMTP id
 h18-20020a2ea492000000b002b46d9a2222mr9575407lji.0.1687537692753; Fri, 23 Jun
 2023 09:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <CAJZ5v0iqy0yMJP5H7ub67R8R6i42=TcS_6+VF-+fWrM-9tYFQA@mail.gmail.com>
 <c518da2a-5ba5-af7e-e26d-1973db7b4c9e@amd.com>
In-Reply-To: <c518da2a-5ba5-af7e-e26d-1973db7b4c9e@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 Jun 2023 18:28:01 +0200
Message-ID: <CAJZ5v0gnTt0pV4nF+jcYCyZuZXDNuRn3mS0bDoAv-ZDpetyxVg@mail.gmail.com>
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

On Fri, Jun 23, 2023 at 5:57=E2=80=AFPM Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
>
> On 6/23/2023 9:52 AM, Rafael J. Wysocki wrote:
> > On Wed, Jun 21, 2023 at 7:47=E2=80=AFAM Evan Quan <evan.quan@amd.com> w=
rote:
> >> From: Mario Limonciello <mario.limonciello@amd.com>
> >>
> >> Due to electrical and mechanical constraints in certain platform desig=
ns
> >> there may be likely interference of relatively high-powered harmonics =
of
> >> the (G-)DDR memory clocks with local radio module frequency bands used
> >> by Wifi 6/6e/7.
> >>
> >> To mitigate this, AMD has introduced an ACPI based mechanism that
> >> devices can use to notify active use of particular frequencies so
> >> that devices can make relative internal adjustments as necessary
> >> to avoid this resonance.
> >>
> >> In order for a device to support this, the expected flow for device
> >> driver or subsystems:
> >>
> >> Drivers/subsystems contributing frequencies:
> >>
> >> 1) During probe, check `wbrf_supported_producer` to see if WBRF suppor=
ted
> > The prefix should be acpi_wbrf_ or acpi_amd_wbrf_ even, so it is clear
> > that this uses ACPI and is AMD-specific.
>
> I guess if we end up with an intermediary library approach
> wbrf_supported_producer makes sense and that could call acpi_wbrf_*.
>
> But with no intermediate library your suggestion makes sense.
>
> I would prefer not to make it acpi_amd as there is no reason that
> this exact same problem couldn't happen on an
> Wifi 6e + Intel SOC + AMD dGPU design too and OEMs could use the
> same mitigation mechanism as Wifi6e + AMD SOC + AMD dGPU too.

The mitigation mechanism might be the same, but the AML interface very
well may be different.

My point is that this particular interface is AMD-specific ATM and I'm
not aware of any plans to make it "standard" in some way.

Also if the given interface is specified somewhere, it would be good
to have a pointer to that place.

> >
> > Whether or not there needs to be an intermediate library wrapped
> > around this is a different matter.

IMO individual drivers should not be expected to use this interface
directly, as that would add to boilerplate code and overall bloat.

Also whoever uses it, would first need to check if the device in
question has an ACPI companion.
