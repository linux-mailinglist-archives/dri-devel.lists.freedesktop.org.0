Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA35BBA1D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 21:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757ED10E10A;
	Sat, 17 Sep 2022 19:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C87110E10A
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 19:22:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id w8so40663295lft.12
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 12:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=4Ovbgm6nZe3/QpGYRlWJovhE/R7kO1q7d0zHL2Mifrc=;
 b=qUYPBRBfPN8ba4coLRPbhK7ncTZyn7P5fR5x/Jw7xmQQplV7fbm9cTUF9rPQUbKRko
 Pu1vZVNel79NuIeyr8DrhH8FAyh9MwRFveYIlMbUe0WWsGv4naKQFlDtKlbUY1ZIaqKI
 I0j4EFJYoxholQe/ayH4v8sRStq9vK2uNwSTjU5XPsTmpsGz6woE7hJoJR4lnIepvySV
 ALOd0cY13Y+4OPZ09NWPTs6sb4F7kFqDePpCTrsrYqpbqo9R3qrN7EBJkCzYS7fdiWMq
 j7MP49emET+1ydNUqD7fKYhJKO6oturtCL+KJrtbsnulwssCJDjFCkklfZeAKmnECTba
 rlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4Ovbgm6nZe3/QpGYRlWJovhE/R7kO1q7d0zHL2Mifrc=;
 b=XHlKodbimzyUBjkqOJt9obEsfq11sO7EMpGEQAne+TD+hcCDY+aNpzjH9O1llD0DWh
 NheiGMM/vHoWURLqwJ/RsVPnGIenbI3jNmuksqbMyqYDLvynipGIqvnA/Gh/dPfYev/m
 dEpx38QDkKirbi89OsD9arLvKGT3bLq5uuRG3iuZDaMCNCJZ9VIMbdpwyuX6k9fF6XbJ
 gQhRtJ9nlyDQB/lRm7cIFkrBfCjKf/fmX9TnSY9bXF38DEFj6itKdDEQ4Ne0p0bK9GS0
 /AXiol3kgHBAJXgmACqziSpLTseYb2GS564bGWaKKOqSeqkCfM+ZYeDG6mXz49HGCEG1
 +AbA==
X-Gm-Message-State: ACrzQf07rOmvzlO2fXkKyEM7mcjpQcPixzwFHOUyDgggrf69P5zrT64+
 QguQb9FQPr6/8dNTVQZWCvcQc5LApNiPQqujn4M=
X-Google-Smtp-Source: AMsMyM5yAf1p4dlhFzQKaQzWuD3rAawk4dyVy0LkQ3j+q4z6N3tGG6YeSA2+S70HwBnq5kMhtGIW0eLELR8KkKRwagU=
X-Received: by 2002:ac2:5191:0:b0:497:ac0c:cf65 with SMTP id
 u17-20020ac25191000000b00497ac0ccf65mr3811944lfi.436.1663442565407; Sat, 17
 Sep 2022 12:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220825191946.1678798-1-maccraft123mc@gmail.com>
 <b245787a-38fa-4202-cc7a-8fe18bc2308d@redhat.com>
In-Reply-To: <b245787a-38fa-4202-cc7a-8fe18bc2308d@redhat.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Sat, 17 Sep 2022 21:22:08 +0200
Message-ID: <CAO_MupKvwvG8Sg98psArQMHoqpBVxmgwpOzMpw340DoeDkPSng@mail.gmail.com>
Subject: Re: drm: panel-orientation-quirks: Add quirk for Aya Neo Air
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

sob., 17 wrz 2022 o 20:00 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(=
a):
>
> Hi,
>
> On 8/25/22 21:19, Maccraft123 wrote:
> > From: Maya Matuszczyk <maccraft123mc@gmail.com>
> >
> > Yet another x86 gaming handheld.
> >
> > This one has many SKUs with quite a few of DMI strings,
> > so let's just use a catchall, just as with Aya Neo Next.
> >
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>
> Thanks, I have pushed this out to drm-misc-next now.
>
> Note for future drm_panel_orientation_quirks.c patches please Cc me,
> I am not subscribed to dri-devel.
Yeah i forgot to Cc you on this patch, and had no idea how to bring it up.
I'll do my best to remember in future.
Thanks for picking this up!

Best Regards,
Maya Matuszczyk

>
> Regards,
>
> Hans
>
>
> > ---
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/g=
pu/drm/drm_panel_orientation_quirks.c
> > index fc1728d46ac2..0b011b615495 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -103,6 +103,12 @@ static const struct drm_dmi_panel_orientation_data=
 lcd800x1280_rightside_up =3D {
> >       .orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> >  };
> >
> > +static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftsi=
de_up =3D {
> > +     .width =3D 1080,
> > +     .height =3D 1920,
> > +     .orientation =3D DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> > +};
> > +
> >  static const struct drm_dmi_panel_orientation_data lcd1200x1920_rights=
ide_up =3D {
> >       .width =3D 1200,
> >       .height =3D 1920,
> > @@ -152,6 +158,12 @@ static const struct dmi_system_id orientation_data=
[] =3D {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
> >               },
> >               .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* AYA NEO AIR */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> > +               DMI_MATCH(DMI_BOARD_NAME, "AIR"),
> > +             },
> > +             .driver_data =3D (void *)&lcd1080x1920_leftside_up,
> >       }, {    /* AYA NEO NEXT */
> >               .matches =3D {
> >                 DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>
