Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3475BB9C4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 19:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C610E188;
	Sat, 17 Sep 2022 17:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0829D10E188
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 17:51:18 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c7so17993991ljm.12
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 10:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=QLB73e/AoLaAaQXTsmvr/2mevo0TuA6Fykh7CCtGThc=;
 b=eKEtUDOeK4mx3mJec93tUvCamLNs3TwxuhdN7DbP9+dgtJ8D53Tir/4xQYrdtxIFzm
 igUm9o1p1yLkW1LugoGfFSeKIwWH1CgeQ7+EZU7cCRK3N/0mgiAvccfMyuMyu9FLDSsh
 uwIhgiIt6W5tQAu17NoLbHkk5LI7d8bSRicY4ME4CK60Enl3cQtxXwXYWSqXfdjB8PiL
 wtpGkif048BsKJfq7V83M7jat0d09yTxMhNjQsdY2LZujp7TVIVMJWShaXmXLPIK5lXF
 /5g1CqE+aDyHBCNPecTrEBHsOPTFjeMCmThqAih9Brook+XyWNlkqIBkPiP90Bvdxegp
 TqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QLB73e/AoLaAaQXTsmvr/2mevo0TuA6Fykh7CCtGThc=;
 b=ACkq4MeZrpjBDv+LRcqtB0/K09bQGxM2hZp6CGP+iR5BbN9UhZhsL+P06H8sYGNula
 L4ghQeCsClZ8zIUdrxvHiOJ68wbaWM7gM0n435dwY9yBoMKU++dFyLLY7TnMbFQlmitQ
 Lr7qUquwDz1bxhGlq+OsfMZD/A4QaMtTKmoi2+vXj3WOaRj0xT8QoplBeqQNibZ1EoiE
 QRayrmT5yu6sSj4vrfQaatpeGUXMDw/3ExUGNWz/R90TacXHnnq7aV7p6MACKg0on+tV
 CxZyjjZ1pyRi9KV/ok20NhOBr4Evr61aCVRivmh3/9xBGKwH7/1aV9gztL6/BJyGv/av
 9pSg==
X-Gm-Message-State: ACrzQf16zDBdQGgxnY6T7jJZQITOeiWSc26zQ6e83TlXKPYIkYGdE0R3
 EZ1+sv4QlMn7ZNJ0LGpJWB83K6qGxdHk1KFXtOM=
X-Google-Smtp-Source: AMsMyM4CaDwbvsWZheNnie6dHTP6HCVagwrEHEZ5r/uxrchts8wh1RceesPb3AFxqyMYMCHkiDUD0SqnKIUNTkUzYXA=
X-Received: by 2002:a2e:a41b:0:b0:26c:3714:1d99 with SMTP id
 p27-20020a2ea41b000000b0026c37141d99mr2788606ljn.144.1663437077112; Sat, 17
 Sep 2022 10:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220803182402.1217293-1-maccraft123mc@gmail.com>
 <4e145e1d-db9a-0edb-cdd4-1da3e02131fd@redhat.com>
In-Reply-To: <4e145e1d-db9a-0edb-cdd4-1da3e02131fd@redhat.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Sat, 17 Sep 2022 19:50:40 +0200
Message-ID: <CAO_MupL6pHFS8=jGjUy6mBgkdL4bNbJp8R1MaBBNOzOP20eurQ@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Anbernic
 Win600
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

Hello,

sob., 17 wrz 2022 o 15:04 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(=
a):
>
> Hi,
>
> On 8/3/22 20:24, Maccraft123 wrote:
> > From: Maya Matuszczyk <maccraft123mc@gmail.com>
> >
> > This device is another x86 gaming handheld, and as (hopefully) there is
> > only one set of DMI IDs it's using DMI_EXACT_MATCH
> >
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>
> Thanks I have added this patch to my local drm-misc-next branch.
>
> I will push this out to the official drm-misc-next branch after
> running some local tests.

Can you also take a look at this patch too?
https://patchwork.freedesktop.org/patch/499589/

Best Regards,
Maya Matuszczyk

>
> (unfortunately it is too late now to push this to drm-misc-fixes
> for this cycle, sorry).
>
> Regards,
>
> Hans
>
>
>
> > ---
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/g=
pu/drm/drm_panel_orientation_quirks.c
> > index d4e0f2e85548..a8681610ede7 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -128,6 +128,12 @@ static const struct dmi_system_id orientation_data=
[] =3D {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
> >               },
> >               .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* Anbernic Win600 */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Anbernic"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Win600"),
> > +             },
> > +             .driver_data =3D (void *)&lcd720x1280_rightside_up,
> >       }, {    /* Asus T100HA */
> >               .matches =3D {
> >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
>
