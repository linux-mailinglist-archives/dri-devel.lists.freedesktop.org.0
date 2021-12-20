Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C61047B45D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 21:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2343210FD02;
	Mon, 20 Dec 2021 20:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C25C10FD02
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 20:29:55 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id z6so9719561pfe.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 12:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNspGc3Te6LnfTNYFrCZ2flcwpPDYLrwU6uIeemKSSc=;
 b=pzYtGUmtq1JxqBQ5NTQVWAPH8z2T3dWbhSK5gPoxrSb29QN1fO7ChPFRXmXdh4Eph6
 6VXU2IGW2+dB0QBoSUhHENMZH7iZ91EAtMUpE3okeSwQpFZ+6DI6eh9R25/C1rLGG6aT
 1eNYTfXwwovCrZZMBXn4L0XsJ31a+XUJI+3LXbAa5GldBUhM56yds/bFKG61IguHzzam
 vNjpWLMOB+rC+0V1PyHlZdcS/ymGINGuKL7nslC2oUSPuBES3mhUhoCRvq529X9aGXoe
 mG8jrntSM4hMWkmAgLfLfjYKSrlbm4kHvUp22M1AHSaxl71zAC9IyrRJGb/2B3E4tMwr
 pwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNspGc3Te6LnfTNYFrCZ2flcwpPDYLrwU6uIeemKSSc=;
 b=Q356HmHJkRgvHJ5F5Z3Sq25RkMMlzJTUccJ67S3LVLGHDgnXcZ1lcX61SkGMoj7Zl4
 Y4USM4AdjbcTmJYi4UZ8/fUZJLRug49TL1uVqinS+cCf/nV+zRhunbHoMbLSpzwXsdw0
 M/F4DvM7kNBUvQaSEUF211UwVBefej7OfbWB+HcbNVyqxAMQQVfSgs8nSDU0I1lJM1CV
 lX61M3WpM+iWx3GPkAUbEMbaBGI8Z9tYics3IkBn09zLaRoUpY8lHxcGC7NMp7gteGqk
 Tm/ET98AmvrYvgphxUIjK1CMypz1WQgP5WVuqkpqsbRq4T8XxHuM7ZVH9hvL+rdD63QU
 WTZg==
X-Gm-Message-State: AOAM533j/ePRnLXlaHZssYqC9/JnRfFuwfJP40pCc8Lnz0FCcHWTc+x5
 K3TKT4XaTryNZTZpfQS8F9apayI/TAncQ8X0D9/VZQ==
X-Google-Smtp-Source: ABdhPJxyfauyO61GnUyRQIN3CwY6EYbeDVV2eZNvvE/+KNtRptm/KQwKCWz4c7RzCH4+ZwPxwVLrL3Kk6fZRC5Ur264=
X-Received: by 2002:a63:9:: with SMTP id 9mr16127264pga.136.1640032194595;
 Mon, 20 Dec 2021 12:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20211217202850.1967594-1-rajatja@google.com>
 <20211217202850.1967594-2-rajatja@google.com>
 <YcDegV8wqljpU3J0@google.com>
In-Reply-To: <YcDegV8wqljpU3J0@google.com>
From: Rajat Jain <rajatja@google.com>
Date: Mon, 20 Dec 2021 12:29:18 -0800
Message-ID: <CACK8Z6FyvpjhHqh3PRfRFYAhVaxgkxBT_1SnYH0PkvNv5qwOvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: gwendal@google.com, Thomas Zimmermann <tzimmermann@suse.de>,
 seanpaul@google.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 rajatxjain@gmail.com, dri-devel@lists.freedesktop.org, marcheau@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Dec 20, 2021 at 11:50 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Dec 17, 2021 at 12:28:50PM -0800, Rajat Jain wrote:
> > Add a static entry in the x86 table, to detect and wait for
> > privacy-screen on some ChromeOS platforms.
> >
> > Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
> > enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
> > shall return EPROBE_DEFER until a platform driver actually registers the
> > privacy-screen: https://hansdegoede.livejournal.com/25948.html
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v2: * Use #if instead of #elif
> >     * Reorder the patches in the series.
> >     * Rebased on drm-tip
> >
> >  drivers/gpu/drm/drm_privacy_screen_x86.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> > index a2cafb294ca6..0c5699ad70a3 100644
> > --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> > +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> > @@ -47,6 +47,18 @@ static bool __init detect_thinkpad_privacy_screen(void)
> >  }
> >  #endif
> >
> > +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> > +static bool __init detect_chromeos_privacy_screen(void)
>
> Does marking this __init work in case there is a deferral?

Yes, I have verified that for Chromeos case, it is a deferral.

> Can it happen
> that privacy screen is a module and so will get loaded only after we
> discarded __init sections.

Perhaps. But I do not think that  is a problem. All the functions and
data in this file are in __init sections, and this entry is here to
ensure that the drm probe will wait for the privacy screen driver
(whenever it is loaded). That is the reason, ideally we  would want to
somehow restrict the privacy screen to be built into the kernel so as
to minimize the delay if any.


>
> > +{
> > +     if (!acpi_dev_present("GOOG0010", NULL, -1))
> > +             return false;
> > +
> > +     pr_info("%s: Need to wait for ChromeOS privacy-screen drvr", __func__);
>
> I still do not see how this message is helpful. If it is really desired,
> I'd put something into the code that calls into lookups.
>

Ack. This message highlights that the kernel indeed found privacy
screen device in the ACPI and the drm probe will need to wait for it.
I think I agree that this message is not needed here, I think I'll
tweak the existing message in drm_privacy_screen_lookup_init().

> > +     return true;
> > +
> > +}
> > +#endif
> > +
> >  static const struct arch_init_data arch_init_data[] __initconst = {
> >  #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> >       {
> > @@ -58,6 +70,16 @@ static const struct arch_init_data arch_init_data[] __initconst = {
> >               .detect = detect_thinkpad_privacy_screen,
> >       },
> >  #endif
> > +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> > +     {
> > +             .lookup = {
> > +                     .dev_id = NULL,
> > +                     .con_id = NULL,
> > +                     .provider = "privacy_screen-GOOG0010:00",
> > +             },
> > +             .detect = detect_chromeos_privacy_screen,
> > +     },
> > +#endif
> >  };
> >
> >  void __init drm_privacy_screen_lookup_init(void)
> > --
> > 2.34.1.307.g9b7440fafd-goog
> >
>
> Thanks.

Thanks & Best Regards,

Rajat

>
> --
> Dmitry
