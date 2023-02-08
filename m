Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55B68F7CA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB3310E833;
	Wed,  8 Feb 2023 19:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF77E10E833
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:05:10 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id n2so13811598pfo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 11:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cql7MEjTp3NO2/OVM9pJ4Pr7OGop1ku8fCM7b03xw5I=;
 b=n3iCcQK/GbIC8BW2dq0ctRN8T+GPP/rSSecdxzNkxRLWtsYoJn0Z3biu/QMPTyTjoO
 SsDGbBFxQei+tMShxQUK8WrjBwrJetU5XAVYk0rAM+dhbjtMZgo2lpNkparSygsBKJAN
 ovwXgdBVKmfv67YmB6XE9SVDcPXXUBBkw1Q6Ljslp3nVOtdIpC+uG7NIz82N6nrdgCTA
 d2EIErkMrMSd7r7fmtf+nwvZFIuhf4QUMEbvbLOaBuTheUWIywOxYKFBxxoIzsWRTjt/
 MqoMmeDA8GlLrCnzp8zDy/FUA2AXwV3YE8CsugaO+rllFE9HmanXjLZbthtr0n9425lh
 fazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cql7MEjTp3NO2/OVM9pJ4Pr7OGop1ku8fCM7b03xw5I=;
 b=L7U4Ul/iTD6LcczYs8Z6dIJJwGq8qhh6/209dsfXYNipB2QcDz//cUYUkS8E2yLIlo
 uXYzaFkzZi7rJ04N2U2AO1AB6T7//lxKYjSUdY/r8alU9yp5G2zA8eMROwoF/1WS8dPv
 klIhVnwxpAKPQbxk62yj51VVW4uZmDSKrPUymlOIkRgHoMg2xvs1ZMzzJrROl1PaG0Sd
 ySaGckAAo8qQHzc19A5+5luQ4HV4cMPZIuzSL7Qsr63ZDtTOPwbyFmtzqrzzRUXSOOra
 mUx8urR6e61GZ27ex4h+eTMBmkSrqunmDdSgfTdXWm4859xcV/AN26UQP79P9DTvHGSv
 ScZQ==
X-Gm-Message-State: AO0yUKX3l5hND67+EMSMpEWeuUwROqzeUU94n2t+rPXaTuMBIBFoN33S
 saW2h5E48ACxloSM/CsDt1WZ+Mgw6cVy5X4qHQc=
X-Google-Smtp-Source: AK7set/FIiZg6KcIhBA8creffafWrV3Q+tvHd7Z0Jt6HkZFhRvve4YqXcjq7g4n9S3ytigI3ufxN4lQkjkwnNJVVMBM=
X-Received: by 2002:a63:7b1e:0:b0:4fb:37f2:59aa with SMTP id
 w30-20020a637b1e000000b004fb37f259aamr649193pgc.2.1675883109969; Wed, 08 Feb
 2023 11:05:09 -0800 (PST)
MIME-Version: 1.0
References: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
 <CAMxBKG3o_6R7M0gaUHXA5yGgSe6HBWYK25fwF=8mN+JTno9t7Q@mail.gmail.com>
In-Reply-To: <CAMxBKG3o_6R7M0gaUHXA5yGgSe6HBWYK25fwF=8mN+JTno9t7Q@mail.gmail.com>
From: Darrell Kavanagh <darrell.kavanagh@gmail.com>
Date: Wed, 8 Feb 2023 19:04:58 +0000
Message-ID: <CAMxBKG0wDi-XwMZwMHq_DbFXt3pgK-CV-G7iT9BNftiXBoUHzQ@mail.gmail.com>
Subject: Re: drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet
 3 10IGL5
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've resolved this by adding a matching quirk in
drivers/firmware/efi/sysfb_efi.c - see below.

Are you the right people to be notifying about this?

---
diff --git a/kernel/6.2-rc6 original/sysfb_efi.c b/kernel/6.2-rc6
changes/sysfb_efi.c
index 7882d4b..f06fdac 100755
--- a/kernel/6.2-rc6 original/sysfb_efi.c
+++ b/kernel/6.2-rc6 changes/sysfb_efi.c
@@ -264,6 +264,14 @@ static const struct dmi_system_id
efifb_dmi_swap_width_height[] __initconst = {
                                        "Lenovo ideapad D330-10IGM"),
                },
        },
+       {
+               /* Lenovo IdeaPad Duet 3 10IGL5 with 1200x1920
portrait screen */
+               .matches = {
+                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION,
+                                       "IdeaPad Duet 3 10IGL5"),
+               },
+       },
        {},
 };
 ---

Thanks,
Darrell

On Tue, 7 Feb 2023 at 15:51, Darrell Kavanagh
<darrell.kavanagh@gmail.com> wrote:
>
> Further information:
>
> With the above fix, the very early boot console messages are not
> rotated. adding "fbcon=rotate:1" to the kernel command line corrects
> this. But these early boot console messages are still garbled - it
> looks like the display driver in use at the time cannot write to the
> screen fast enough - lines are half-formed before scrolling.
>
> Note that this corrects itself and later boot messages are legible
> before the plymouth splash (if in use). I can't see anything that
> looks like useful information re the fb in journalctl immediately
> preceding the first legible output seen during boot.
>
> I've played around with console, earlycon and fbcon parms to no useful
> effect. Any ideas?
>
> Darrell
>
> On Fri, 3 Feb 2023 at 18:32, Darrell Kavanagh
> <darrell.kavanagh@gmail.com> wrote:
> >
> > Hi,
> >
> > This is another Lenovo with detachable keyboard and 1200x1920 screen
> > mounted sideways.
> >
> > The following has been tested with 6.2.0-rc6.
> >
> > Thanks,
> > Darrell
> >
> > index 3659f04..590bb7b 100644
> > --- a/kernel/drm_panel_orientation
> > _quirks.c
> > +++ b/kernel/linux-6.2-rc6/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -304,6 +304,12 @@ static const struct dmi_system_id orientation_data[] = {
> >                   DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad
> > D330-10IGM"),
> >                 },
> >                 .driver_data = (void *)&lcd1200x1920_rightside_up,
> > +       }, {    /* Lenovo IdeaPad Duet 3 10IGL5 */
> > +               .matches = {
> > +                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
> > +               },
> > +               .driver_data = (void *)&lcd1200x1920_rightside_up,
> >         }, {    /* Lenovo Ideapad D330-10IGL (HD) */
> >                 .matches = {
> >                   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
