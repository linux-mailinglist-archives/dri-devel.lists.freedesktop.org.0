Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0279D225C81
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 12:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFD06E311;
	Mon, 20 Jul 2020 10:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF06E311
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595240240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y99N3HO5g+WhE1TjJOE+/XsdF+y0jzvQOLZP2UKx7lM=;
 b=fW0oIqqNIkNyEiHVEBD1HiAH8m8bPE7N07QyBI1f/NlqeELKazs0LBJ/r69BGb5+PQod2l
 qMZM6+ak5OdhR/SfPbGxB8V20d+kzR1ArD+MxhUgqDcqN5c7YHU2bjogMnnJCuAb7qRTN6
 TuA86GHi+/Npft/hq+QMNDeQ/LTqD1M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-PAu-gH5COhCay30hIaNmPg-1; Mon, 20 Jul 2020 06:17:16 -0400
X-MC-Unique: PAu-gH5COhCay30hIaNmPg-1
Received: by mail-qv1-f70.google.com with SMTP id dl10so822392qvb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 03:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y99N3HO5g+WhE1TjJOE+/XsdF+y0jzvQOLZP2UKx7lM=;
 b=ZNJxCjv45lDTf/VoBRcpN8sBTZAvi4DIvkFUikVGeJHfdHkXoPj1SmKQk/SQZCiLsE
 2wBPT9gUGM1oWAlrTbWzBkUmBJMVR+8LgYyqjaKKS8SFgvsvtDw4+e0fprkadMaigPGW
 jkWR+5OR0FcaLbfWAIylE/tUWV1cKlmb6kOByhjH4NWqHmgcf3Chf0Ja/CZshE0wJiJT
 RvdKVxeKBMQE5VrE8r1TfYlYp0ci239VjmpGSzDhLhA+aPK9m5fjVxhi5UwAZSTUrZXX
 cLFaSZhfYobZuSaSUsCmgX+/t1CU4ZZWfwfRKdJfyrX2koVk/Ft5YJazSLGif6Qt3moz
 650g==
X-Gm-Message-State: AOAM5326lSYCFUzAkJ36ALn/eT8m9Enw0AeVmxN9F60GbqFV9oVyWgCw
 Cge3i0CHU/WLm7A4m1T+sS9MvI5wtWFlJwP9JFTKAsKQXk0jQLoXDxqmJT4KOBqbn50H5XrMPQu
 kdfPZmmPBsBSpRVDdkZPpPEsIABYmW9TiAn37NSsuC0YZ
X-Received: by 2002:ac8:4250:: with SMTP id r16mr23291262qtm.378.1595240235936; 
 Mon, 20 Jul 2020 03:17:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6eRppsUdj+OcqUxbAewN8h1jl91t7/Dlnn5nvDs66q2TQMR7droK4ih5j7ccrpQu6tl74/h+hoe4dHN1Cets=
X-Received: by 2002:ac8:4250:: with SMTP id r16mr23291239qtm.378.1595240235652; 
 Mon, 20 Jul 2020 03:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200717190547.648604-1-kherbst@redhat.com>
 <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10@canonical.com>
 <CACO55tvLCrqeV8MsVDbTaWP2EPAeZtfU08Kb2fVGCD6X+g3-rg@mail.gmail.com>
 <8ad1866d-eb61-a30c-5875-5ffbfd2e17e1@canonical.com>
In-Reply-To: <8ad1866d-eb61-a30c-5875-5ffbfd2e17e1@canonical.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 20 Jul 2020 12:17:04 +0200
Message-ID: <CACO55ttJRpjZVSATSYo8bL_BStGACMO76kO8pZ5W+2vp6Ni6xA@mail.gmail.com>
Subject: Re: [PATCH] RFC: ACPI / OSI: remove workarounds for hybrid graphics
 laptops
To: Alex Hung <alex.hung@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 3:19 AM Alex Hung <alex.hung@canonical.com> wrote:
>
> On 2020-07-19 1:50 p.m., Karol Herbst wrote:
> > On Fri, Jul 17, 2020 at 9:52 PM Alex Hung <alex.hung@canonical.com> wrote:
> >>
> >> On 2020-07-17 1:05 p.m., Karol Herbst wrote:
> >>> It's hard to figure out what systems are actually affected and right now I
> >>> don't see a good way of removing those...
> >>>
> >>> But I'd like to see thos getting removed and drivers fixed instead (which
> >>> happened at least for nouveau).
> >>>
> >>> And as mentioned before, I prefer people working on fixing issues instead
> >>> of spending time to add firmware level workarounds which are hard to know
> >>> to which systems they apply to, hard to remove and basically a big huge
> >>> pain to work with.> In the end I have no idea how to even figure out what systems are affected
> >>> and which not by this, so I have no idea how to even verify we can safely
> >>> remove this (which just means those are impossible to remove unless we risk
> >>> breaking systems, which again makes those supper annoying to deal with).
> >>>
> >>> Also from the comments it's hard to get what those bits really do. Are they
> >>> just preventing runtime pm or do the devices are powered down when booting?
> >>> I am sure it's the former, still...
> >>>
> >>> Please, don't do this again.
> >>>
> >>> For now, those workaround prevent power savings on systems those workaround
> >>> applies to, which might be any so those should get removed asap and if
> >>> new issues arrise removing those please do a proper bug report and we can
> >>> look into it and come up with a proper fix (and keep this patch out until
> >>> we resolve all of those).
> >>>
> >>> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> >>> CC: Alex Hung <alex.hung@canonical.com>
> >>> CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> >>> CC: Len Brown <lenb@kernel.org>
> >>> CC: Lyude Paul <lyude@redhat.com>
> >>> CC: linux-kernel@vger.kernel.org
> >>> CC: dri-devel@lists.freedesktop.org
> >>> CC: nouveau@lists.freedesktop.org
> >>> ---
> >>>  drivers/acpi/osi.c | 24 ------------------------
> >>>  1 file changed, 24 deletions(-)
> >>>
> >>> diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> >>> index 9f68538091384..d4405e1ca9b97 100644
> >>> --- a/drivers/acpi/osi.c
> >>> +++ b/drivers/acpi/osi.c
> >>> @@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
> >>>       {"Processor Device", true},
> >>>       {"3.0 _SCP Extensions", true},
> >>>       {"Processor Aggregator Device", true},
> >>> -     /*
> >>> -      * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> >>> -      * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> >>> -      * cards will hang without RTD3 disabled.
> >>> -      *
> >>> -      * Once NVidia drivers officially support RTD3, this _OSI strings can
> >>> -      * be removed if both new and old graphics cards are supported.
> >>> -      */
> >>> -     {"Linux-Dell-Video", true},
> >>> -     /*
> >>> -      * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
> >>> -      * audio device which is turned off for power-saving in Windows OS.
> >>> -      * This power management feature observed on some Lenovo Thinkpad
> >>> -      * systems which will not be able to output audio via HDMI without
> >>> -      * a BIOS workaround.
> >>> -      */
> >>> -     {"Linux-Lenovo-NV-HDMI-Audio", true},
> >>> -     /*
> >>> -      * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
> >>> -      * output video directly to external monitors on HP Inc. mobile
> >>> -      * workstations as Nvidia and AMD VGA drivers provide limited
> >>> -      * hybrid graphics supports.
> >>> -      */
> >>> -     {"Linux-HPI-Hybrid-Graphics", true},
> >>>  };
> >>>
> >>>  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
> >>>
> >>
> >> The changes were discussed and tested a while ago, and no crashes were
> >> observed. Thanks for solving PM issues in nouveau.
> >>
> >> Acked-by: Alex Hung <alex.hung@canonical.com>
> >>
> >
> > By any chance, do you have a list of systems implementing those workarounds?
> >
>
> I don't keep a list but the workaround, in theory, should only apply to
> the systems with the specific nvidia hardware.
>
> I reminded OEMs and ODMs that these _OSI strings were temporary
> solutions, and highlighted we were going to remove them after our
> discussion last year. If they were paying attentions recent systems
> shouldn't have these _OSI strings.
>

Right.. but I am actually wondering because I never saw those strings
in the wild or not on the Dell and Lenovo systems I was testing on. So
I think we might want to ask the vendors themselves and verify on
those systems.

> --
> Cheers,
> Alex Hung
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
