Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47625506C4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 23:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC5310EC55;
	Sat, 18 Jun 2022 21:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1AC89BFD
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 21:08:50 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id m14so6612203plg.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lkY8a+kCoG+TKxal6s5+GCScafCkuC8UPzYUlLjwDGQ=;
 b=KhUvb42ccc4oQM7B/iJvJNt7Cp4FmjBiWQqfAmWIF+Nvq7bD17qBVuq3kc1sAackKG
 5yFNIeSKL1xtqwJHPrQvOkSv6G+Cz1rnzgHJSj4vexgQZlCwpaevznp8/PnyZgQWYn2x
 Day9qiN1yFnccvV+aWmoYvuSpJvTbo5juI/WY0HAf+Xjot13vT+1//kRFt2O0OqKLE/z
 fzT9ZVX1qho3vYshPEXU2W8lYgFH/+kXXXA3AKJLN7juT/38268sVa0ZvorIrUCE7jW0
 Ha3zjSabcf5yYyqQ/FTyc3+h9JHx8T5bkcRQWF4x8AaPOjkXsfRPhSGKmzWB0v7ZGW0Q
 mIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lkY8a+kCoG+TKxal6s5+GCScafCkuC8UPzYUlLjwDGQ=;
 b=M4WcSn9dakmGSBLKqTAueG7nu2ZW100N36D6ZuozSP/XEQoOu15d3riN/4+P29+A6H
 7Qf7wKHQDTJZaWFUttXDIfsPg9y99DiwlRW8wByQ89PO6S8MZ+trbY+UV3jEpuqDeVgl
 tiEG8BB5mTQOf1qdnDmZGgFxX4RGIJH0gzfHaBLKz3U/QR6psHIJhyQlJMe7tK21YRB/
 Y8HFCR4NM1WwRDaPPZ8aZpKHd6ikSKeW5sqP9SRh4PcCmIqbJta15ZGCKjteTTxIeZcm
 gmGJg3DGT9a5sAJWQ38zsJys9pmopRKosF6eMMPEGG7rLkjaQ7l8Ru4+c5xlqJcNfWDS
 hXgg==
X-Gm-Message-State: AJIora/itHhXf/MioCAuc6mNr4Uct0lpbnktVebQ2gaDPl8RQiGLfc0f
 Rra2WC/6izCJngAiGxqvLbzVEPt0xNJGV1UtIcU=
X-Google-Smtp-Source: AGRyM1uJLtKAK3w/wqF4/tesS0i6vmSkyGJFWB/TwCYfo3Qqq4sDudcddtC7XhEn+zE7fWVqO1QdzyIM7VrE2vp/MFM=
X-Received: by 2002:a17:90a:b797:b0:1ea:c49d:1070 with SMTP id
 m23-20020a17090ab79700b001eac49d1070mr17917871pjr.175.1655586529655; Sat, 18
 Jun 2022 14:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220611103911.9417-1-maccraft123mc@gmail.com>
 <2573aee8-e1cd-cb62-c87f-f841a173220c@redhat.com>
In-Reply-To: <2573aee8-e1cd-cb62-c87f-f841a173220c@redhat.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Sat, 18 Jun 2022 23:08:13 +0200
Message-ID: <CAO_Mup+xuh5EpniYG37qZxk_jJ9VoObWj2Muxd7JB+bC0DYTpg@mail.gmail.com>
Subject: Re: drm: panel-orientation-quirks: Add quirk for Aya Neo Next
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
Cc: airlied@linux.ie, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sob., 18 cze 2022 o 22:57 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(=
a):
>
> Hi Maya,
>
> On 6/11/22 12:39, Maccraft123 wrote:
> > From: Maya Matuszczyk <maccraft123mc@gmail.com>
> >
> > The device is identified by "NEXT" in board name, however there are
> > different versions of it, "Next Advance" and "Next Pro", that have
> > different DMI board names.
> > Due to a production error a batch or two have their board names prefixe=
d
> > by "AYANEO" and that's how we ended up with 6 different entries for
> > what's basically one device with different hardware specifications.
> >
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > ---
> >  .../gpu/drm/drm_panel_orientation_quirks.c    | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/g=
pu/drm/drm_panel_orientation_quirks.c
> > index 4e853acfd1e8..62fc7eb69341 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -152,6 +152,42 @@ static const struct dmi_system_id orientation_data=
[] =3D {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
> >               },
> >               .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* AYA NEO NEXT */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> > +             },
> > +             .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     },
>
> If you change:
>
>                   DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
>
> to:
>
>                   DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
>
> Then the matching code will do a substring search for "NEXT"
> in DMI_BOARD_NAME. IOW it will do a strstr using DMI_BOARD_NAME
> as the haystack and "NEXT" as the needle.
>
> And since all 6 board-names contain "NEXT", this single entry
> will then match all 6 variants.
>
> So please respin this patch using just a single entry with:
>
>                   DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
>
I considered this and decided against it because if "Aya Neo Next 2" was
released it would likely have "NEXT 2" as DMI board name, and if it had
screen rotated differently this patch would rotate it in a wrong way.


> Thanks & Regards,
>
> Hans
>
>
>
>  {      /* AYA NEO NEXT Advance */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> > +             },
> > +             .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* AYA NEO NEXT Pro */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> > +             },
> > +             .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* AYA NEO NEXT (Batch with different board name) */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT"),
> > +             },
> > +             .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* AYA NEO NEXT Advance (Batch with different board name)=
 */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Advance"),
> > +             },
> > +             .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* AYA NEO NEXT Pro (Batch with different board name) */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> > +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Pro"),
> > +             },
> > +             .driver_data =3D (void *)&lcd800x1280_rightside_up,
> >       }, {    /* Chuwi HiBook (CWI514) */
> >               .matches =3D {
> >                       DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
>
