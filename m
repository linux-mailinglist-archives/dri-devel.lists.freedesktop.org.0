Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3FA7A192
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 13:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E17310E215;
	Thu,  3 Apr 2025 11:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Da4nrVyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F3610E215
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 11:06:46 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-72bceb93f2fso981106a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743678405; x=1744283205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aPvoNYfEmJ870rlgRoTdv3789JXcVjdt9hTeaT3u1s=;
 b=Da4nrVyPb75wrLf68q3hKJDqJBEsz22ifSq06G29SCFFe1vZ9Ra+KLTO0th5l4W0NY
 RjlPFzyFi7nwjqwhmP6BXgyuJYwgV2cwQwNnKCS0BMU4irnuPhcme2pKeYXZONTI3twr
 jioY2es2gXpqeI+DmKkzzicWn06wSWykNwJTTGhtZ1D0mnZ94NTokVLnOn6/cz0L0vnU
 +McISZijKyTGLUFzhDoHPZ0I64YORqJ+6nNQ4DOX0w2K5gldvLiNU07aQjQDc1qWW4kq
 HeVWpGrG2b2ygCaDd95hLzVJ8B7gZkqQgn0PyLnkaFC5lVNWL0IY694radhbYLR76pFU
 K5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743678405; x=1744283205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aPvoNYfEmJ870rlgRoTdv3789JXcVjdt9hTeaT3u1s=;
 b=WbdY1zqYSMSWllq+sU+YIa2u7mDbnKoJc5z4HzxipSplrKLwcikU9j5WWASZ7VVpTQ
 SUXYMIEr26pcesaqTG2J8qZo3K6tY6hAErgnJD3sjteekM7y8h+m9Txmicf50GjNsbOA
 ahSiln8GI5GFMgABrOe9EjWaS8rC/J3T6nSizuAxR5PkChK0m/WMZ+rm5PihB9rHEZAV
 mDQsCF3N918WvykaVWDDKbD6aTJv+eSE6iSIYqsi31Fg8wA0M7lf+Jp0mNtky4prhD8o
 jEWUixDOo2ZmjqpQ4SNoXHXR5xJXvef8GH1RS2Km9Yx1TmfVTPoULxgGnIk/DbszuRQR
 ku0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrXjBa8WhORi7vEUiaByx4EEf6rYusagwMFsAJhkML2v7bP8JEul1Iq9AVoypWgdmE0kaVFSlNq8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBbsqELttca83XvUBStmyiwbe7cIIl7SdxLp+NEFRSyhgmUbjr
 2400Ob6PZfh4TShRd1IdeqUk8o1RlGgrW18Kj7y/hX9WpgVbCPJbXx/6l3QEMDOFXtoL1Q47G0S
 K2+mCveZiD3YH2lHb23j9bIG0LKk=
X-Gm-Gg: ASbGncsn8QzZJtgWwRQUwffWyuJze2iTjhaCk1yZ2l1Sltxw1Sgllz5uFx9wAo9eEsO
 hRk5aJeHiJvCyddpv6m11oaSgKC6cnGbWtzytBqym7pWwECqvROyUkAoi7D9Rhz0WqLuBdBQ6+0
 YI89sKQo96hqmKRMswed7pTgMo
X-Google-Smtp-Source: AGHT+IEdlG+mPz53IWO7/u4nSJbwkwxef0p17mja9tkRjk/acQGnxXBNtSk2LBpS2KqtDjlIvco2FnC0qsWIY7bJwb0=
X-Received: by 2002:a05:6808:384a:b0:3f4:12a:8ca0 with SMTP id
 5614622812f47-4003d4f75e8mr2031675b6e.4.1743678405346; Thu, 03 Apr 2025
 04:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250401161929.283244-1-tzimmermann@suse.de>
 <20250401161929.283244-7-tzimmermann@suse.de>
 <CAMeQTsYcxHyFVn_BHUpxrfMsXZUX07Unm1rBmMYo6i1SMgj3VA@mail.gmail.com>
 <6452ce55-b237-47b1-8893-15eceeeb4371@suse.de>
In-Reply-To: <6452ce55-b237-47b1-8893-15eceeeb4371@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 3 Apr 2025 13:06:33 +0200
X-Gm-Features: ATxdqUFKv5MNGuARGgu2zvN0Kn6yoz4kTEb1fOXXSxWWmGw26cDx7SKvv3PyQXs
Message-ID: <CAMeQTsbz0oRB1i__faA2UPsjqd9LkrKwyeHCVoL6DC=549t7Uw@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/udl: Return error if vendor descriptor is too
 short
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 3, 2025 at 9:28=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 02.04.25 um 15:16 schrieb Patrik Jakobsson:
> > On Tue, Apr 1, 2025 at 6:23=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> There need to be least 5 bytes in the vendor descriptor. Return
> >> an error otherwise. Also change the branching to early-out on
> >> the error. Adjust indention of the rest of the parser function.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>   drivers/gpu/drm/udl/udl_main.c | 72 +++++++++++++++++---------------=
--
> >>   1 file changed, 36 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_=
main.c
> >> index 4291ddb7158c4..58d6065589d3a 100644
> >> --- a/drivers/gpu/drm/udl/udl_main.c
> >> +++ b/drivers/gpu/drm/udl/udl_main.c
> >> @@ -45,43 +45,43 @@ static int udl_parse_vendor_descriptor(struct udl_=
device *udl)
> >>                  goto unrecognized;
> >>          len =3D ret;
> >>
> >> -       if (len > 5) {
> >> -               DRM_INFO("vendor descriptor length: %u data:%11ph\n",
> >> -                        len, desc);
> >> -
> >> -               if ((desc[0] !=3D len) ||    /* descriptor length */
> >> -                   (desc[1] !=3D 0x5f) ||   /* vendor descriptor type=
 */
> >> -                   (desc[2] !=3D 0x01) ||   /* version (2 bytes) */
> >> -                   (desc[3] !=3D 0x00) ||
> >> -                   (desc[4] !=3D len - 2))  /* length after type */
> >> -                       goto unrecognized;
> >> -
> >> -               desc_end =3D desc + len;
> >> -               desc +=3D 5; /* the fixed header we've already parsed =
*/
> >> -
> >> -               while (desc < desc_end) {
> >> -                       u8 length;
> >> -                       u16 key;
> >> -
> >> -                       key =3D le16_to_cpu(*((u16 *) desc));
> >> -                       desc +=3D sizeof(u16);
> >> -                       length =3D *desc;
> >> -                       desc++;
> >> -
> >> -                       switch (key) {
> >> -                       case 0x0200: { /* max_area */
> >> -                               u32 max_area;
> >> -                               max_area =3D le32_to_cpu(*((u32 *)desc=
));
> >> -                               DRM_DEBUG("DL chip limited to %d pixel=
 modes\n",
> >> -                                       max_area);
> >> -                               udl->sku_pixel_limit =3D max_area;
> >> -                               break;
> >> -                       }
> >> -                       default:
> >> -                               break;
> >> -                       }
> >> -                       desc +=3D length;
> >> +       if (len < 5)
> > Hi Thomas,
> >
> > Shouldn't this be if (len <=3D 5)? The old code only parsed if the
> > descriptor returned at least 6 bytes.
>
> Right, I also noticed that. But I though it was a mistake. The header is
> 5 bytes and if there are no key-value pairs it's still a valid
> descriptor AFAICT. Patch 9 of the series sets a default for the pixel
> limit and the adapter would be usable. I rather not change the new
> logic, but add an explanation to the commit description. Ok?

Sounds good. With that and the small fix in patch 9/9 everything else
looks fine.

With the mentioned fixes done:
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> Best regards
> Thomas
>
> >
> > -Patrik
> >
> >> +               goto unrecognized;
> >> +
> >> +       DRM_INFO("vendor descriptor length: %u data:%11ph\n", len, des=
c);
> >> +
> >> +       if ((desc[0] !=3D len) ||    /* descriptor length */
> >> +           (desc[1] !=3D 0x5f) ||   /* vendor descriptor type */
> >> +           (desc[2] !=3D 0x01) ||   /* version (2 bytes) */
> >> +           (desc[3] !=3D 0x00) ||
> >> +           (desc[4] !=3D len - 2))  /* length after type */
> >> +               goto unrecognized;
> >> +
> >> +       desc_end =3D desc + len;
> >> +       desc +=3D 5; /* the fixed header we've already parsed */
> >> +
> >> +       while (desc < desc_end) {
> >> +               u8 length;
> >> +               u16 key;
> >> +
> >> +               key =3D le16_to_cpu(*((u16 *)desc));
> >> +               desc +=3D sizeof(u16);
> >> +               length =3D *desc;
> >> +               desc++;
> >> +
> >> +               switch (key) {
> >> +               case 0x0200: { /* max_area */
> >> +                       u32 max_area =3D le32_to_cpu(*((u32 *)desc));
> >> +
> >> +                       DRM_DEBUG("DL chip limited to %d pixel modes\n=
",
> >> +                                 max_area);
> >> +                       udl->sku_pixel_limit =3D max_area;
> >> +                       break;
> >> +               }
> >> +               default:
> >> +                       break;
> >>                  }
> >> +               desc +=3D length;
> >>          }
> >>
> >>          goto success;
> >> --
> >> 2.49.0
> >>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
