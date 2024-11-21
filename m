Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827AA9D55B9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 23:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5DB10EA77;
	Thu, 21 Nov 2024 22:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="vAoYf/JC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7798110EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:19:52 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id B55272E0966C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 20:19:47 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1732213190;
 bh=kgapm9UvbYhO/7utYTVA71DT7mij77e9qrq+zVfKIgU=;
 h=Received:From:Subject:To;
 b=vAoYf/JCqlaKZLHwvxDAJ+jkprgdGD+WoFTvIdO5LVOhcezPuSXKw54dYE5pZJWhH
 0WsgxLZIszH0onHagXHKKInDPQPIjaoCSG4PKxwVyck7LQUHLx6/Are1A0W4lmKTKI
 6ylpVGfXHy9Wo94Di2xyVIaQ8e7OoWrvy3ahkvFk=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ff3232ee75so14445421fa.0
 for <dri-devel@lists.freedesktop.org>;
 Thu, 21 Nov 2024 10:19:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxbXkFVQlUKW/fincJwqhI8+KkLB3BooxwCtsupVKat4yeS6k9o7L5R5kzM2MJk3gfAUvDfzv2kl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTujb9IQWPdJ7x3qG7BvBKf6T19KfsNII4XTkV8cdbmX02WEKS
 +EYWF5iNTut62Or9YHzBcnTupL4hVEnlKdAx1s30uuR6G1XsMwpvJvS49n5Vz8GiVg4p1EbjFTI
 gK84H9O17oDNxquIdjGWmkrWlEMg=
X-Google-Smtp-Source: AGHT+IEPho+YePwb4HWU2zayh150smL0SIDx4uReldyq8da13kf+ertUFqo3f7RGLbrqFGFvyXne6bSCRB8YwIIpPA4=
X-Received: by 2002:a2e:be24:0:b0:2fb:2b5d:215d with SMTP id
 38308e7fff4ca-2ff8db65e02mr44656231fa.7.1732213186045; Thu, 21 Nov 2024
 10:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20241121172239.119590-1-lkml@antheas.dev>
 <20241121172239.119590-12-lkml@antheas.dev>
 <bdad36d9-aa0f-49dc-9780-ab72c7879a0f@amd.com>
In-Reply-To: <bdad36d9-aa0f-49dc-9780-ab72c7879a0f@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 21 Nov 2024 19:19:34 +0100
X-Gmail-Original-Message-ID: <CAGwozwFN9d857Yf+A98otizs6cyWTEiCfoKRaw8eGDsBXt9YBQ@mail.gmail.com>
Message-ID: <CAGwozwFN9d857Yf+A98otizs6cyWTEiCfoKRaw8eGDsBXt9YBQ@mail.gmail.com>
Subject: Re: [RFC 11/13] acpi/x86: s2idle: add quirk table for modern standby
 delays
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <173221318815.12360.7853209642641999223@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 21 Nov 2024 22:47:36 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Nov 2024 at 19:04, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 11/21/2024 11:22, Antheas Kapenekakis wrote:
> > Unfortunately, some modern standby systems, including the ROG Ally, rely
> > on a delay between modern standby transitions. Add a quirk table for
> > introducing delays between modern standby transitions, and quirk the
> > ROG Ally on "Display Off", which needs a bit of time to turn off its
> > controllers prior to suspending.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/acpi/x86/s2idle.c | 56 +++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 56 insertions(+)
> >
> > diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
> > index d389c57d2963..504e6575d7ad 100644
> > --- a/drivers/acpi/x86/s2idle.c
> > +++ b/drivers/acpi/x86/s2idle.c
> > @@ -18,6 +18,7 @@
> >   #include <linux/acpi.h>
> >   #include <linux/device.h>
> >   #include <linux/dmi.h>
> > +#include <linux/delay.h>
> >   #include <linux/suspend.h>
> >
> >   #include "../sleep.h"
> > @@ -91,11 +92,50 @@ struct lpi_device_constraint_amd {
> >       int min_dstate;
> >   };
> >
> > +struct s2idle_delay_quirks {
> > +     int delay_display_off;
> > +     int delay_sleep_entry;
> > +     int delay_sleep_exit;
> > +     int delay_display_on;
> > +};
>
> Historically these "kinds" of quirks are kept in drivers/acpi/x86/utils.c.
>
> Could it be moved there?  Or perhaps stored in the ASUS drivers and
> callbacks?

Yes, it could definitely be moved there.

> This feels cleaner if you used "struct acpi_s2idle_dev_ops" and
> callbacks.  More below.

I can convert the quirk into 4 callbacks and put it there if it is
better. But note that the exit delays are added before the firmware
call and the entry delays are added after. I guess this makes sense as
a callback form as well.

> > +
> > +/*
> > + * The ROG Ally series disconnects its controllers on Display Off and performs
> > + * a fancy shutdown sequence, which requires around half a second to complete.
> > + * If the power is cut earlier by entering it into D3, the original Ally unit
> > + * might not disconnect its XInput MCU, causing excess battery drain, and the
> > + * Ally X will make the controller restart post-suspend. In addition, the EC
> > + * of the device rarely (1/20 attempts) may get stuck asserting PROCHOT after
> > + * suspend (for various reasons), so split the delay between Display Off and
> > + * Sleep Entry.
> > + */
> > +static const struct s2idle_delay_quirks rog_ally_quirks = {
> > +     .delay_display_off = 350,
> > +     .delay_sleep_entry = 150,
> > +};
>
> Is this delay still needed with Ally MCU 319 that has the fixes from ASUS?
>
> I'm suspecting not, which means this quirk should be made more narrow IMO.

Yes, it is definitely needed. I have had at least two users break the
new firmware when removing the whole quirk. The controller shuts down
uncleanly and performs a restart/can break its RGB after suspend. The
new firmware was mostly tested with the old quirk in place.

I have not tried removing the quirk myself on the new firmware.
Perhaps I should.

> In the various ASUS drivers you can lookup the MCU firmware version.
> Those drivers can do acpi_register_lps0_dev() when the older firmware is
> present and use the callbacks.  If the newer firmware is there less code
> to worry about.
>
> This also would mean less static quirk tables in the kernel tree.

I would prefer to avoid bringing in other drivers in this or depending
on their functionality, as in this case it is also not needed. I guess
as a callback form this can be somewhat flexible.

> > +
> > +static const struct dmi_system_id s2idle_delay_quirks[] = {
> > +     {
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> > +             },
> > +             .driver_data = (void *)&rog_ally_quirks
> > +     },
> > +     {
> > +             .matches = {
> > +                     DMI_MATCH(DMI_BOARD_NAME, "RC72L"),
> > +             },
> > +             .driver_data = (void *)&rog_ally_quirks
> > +     },
> > +     {}
> > +};
> > +
> >   static LIST_HEAD(lps0_s2idle_devops_head);
> >
> >   static struct lpi_constraints *lpi_constraints_table;
> >   static int lpi_constraints_table_size;
> >   static int rev_id;
> > +struct s2idle_delay_quirks *delay_quirks;
> >
> >   #define for_each_lpi_constraint(entry)                                              \
> >       for (int i = 0;                                                         \
> > @@ -566,6 +606,9 @@ static int acpi_s2idle_display_off(void)
> >               acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_OFF,
> >                               lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
> >
> > +     if (delay_quirks && delay_quirks->delay_display_off)
> > +             msleep(delay_quirks->delay_display_off);
> > +
> >       acpi_scan_lock_release();
> >
> >       return 0;
> > @@ -587,6 +630,9 @@ static int acpi_s2idle_sleep_entry(void)
> >               acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_ENTRY,
> >                               lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
> >
> > +     if (delay_quirks && delay_quirks->delay_sleep_entry)
> > +             msleep(delay_quirks->delay_sleep_entry);
> > +
> >       acpi_scan_lock_release();
> >
> >       return 0;
> > @@ -627,6 +673,9 @@ static int acpi_s2idle_sleep_exit(void)
> >       acpi_scan_lock_acquire();
> >
> >       /* Modern Standby Sleep Exit */
> > +     if (delay_quirks && delay_quirks->delay_sleep_exit)
> > +             msleep(delay_quirks->delay_sleep_exit);
> > +
> >       if (lps0_dsm_func_mask_microsoft > 0)
> >               acpi_sleep_run_lps0_dsm(ACPI_LPS0_SLEEP_EXIT,
> >                               lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
> > @@ -648,6 +697,9 @@ static int acpi_s2idle_display_on(void)
> >       acpi_scan_lock_acquire();
> >
> >       /* Display on */
> > +     if (delay_quirks && delay_quirks->delay_display_on)
> > +             msleep(delay_quirks->delay_display_on);
> > +
> >       if (lps0_dsm_func_mask_microsoft > 0)
> >               acpi_sleep_run_lps0_dsm(ACPI_LPS0_DISPLAY_ON,
> >                               lps0_dsm_func_mask_microsoft, lps0_dsm_guid_microsoft);
> > @@ -760,6 +812,10 @@ int acpi_register_lps0_dev(struct acpi_s2idle_dev_ops *arg)
> >
> >       sleep_flags = lock_system_sleep();
> >       list_add(&arg->list_node, &lps0_s2idle_devops_head);
> > +     const struct dmi_system_id *s2idle_sysid = dmi_first_match(
> > +             s2idle_delay_quirks
> > +     );
> > +     delay_quirks = s2idle_sysid ? s2idle_sysid->driver_data : NULL;
> >       unlock_system_sleep(sleep_flags);
> >
> >       return 0;
>
