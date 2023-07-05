Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509367488E0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 18:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFF910E3B4;
	Wed,  5 Jul 2023 16:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA69A10E3AE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:28 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-579ed2829a8so46110517b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 09:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688573307; x=1691165307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yJYK2iI+eLxmCSR709DVgC/X1RZ3vo7GZP/QFTYyM5A=;
 b=GBUKtHv8BtVCO2oBIbzUGaeO2hDu51Q8jrbGym3CsWHkbKWRwdjOhosS/1h+YX0gpu
 UmKsZukxjqe00I4RE2fCtVpTPva7XkTUEvxxXvmWQj42UyDYo+o90c46EFXrHbl0Zz+P
 gcoJKwQKsy1LknCrW643CbBlR0bisFcdJaQJizdoLUiuVeKS5wNYtY8ORY5PUozxVJII
 L3tUKaHQZHdkgYUYRP1HUmxjlIGAdGBIoWQbTtTakog5C0V7uS99Jr2qj7q2bLElTYRY
 t4Gik/0kH9gHea+VZBV2NCjHUZ3lm5LRzzs224cEMayw58QgmvyiRL3ZYShq/YVqPMkk
 p1BQ==
X-Gm-Message-State: ABy/qLZagZtZAhkVBC9GL/LuTm+zEO5QTpP8k2Jvh6XSXoxGAp/qfZ9t
 6umpyKeT1TjucC/8qdXZHvtn5OantiJzxA==
X-Google-Smtp-Source: APBJJlH5IOD9B9nOv0plhd7LizZxycHo1ABaPdIrkDbTN295if0Z84BvhDGanLvsc3XyQLaTQcSs4A==
X-Received: by 2002:a81:a14c:0:b0:575:4b1c:e5f1 with SMTP id
 y73-20020a81a14c000000b005754b1ce5f1mr17575290ywg.39.1688573307107; 
 Wed, 05 Jul 2023 09:08:27 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 t11-20020a81460b000000b005616d72f435sm6286415ywa.116.2023.07.05.09.08.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 09:08:26 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5701810884aso76361217b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 09:08:26 -0700 (PDT)
X-Received: by 2002:a5b:a42:0:b0:c23:8479:6ae0 with SMTP id
 z2-20020a5b0a42000000b00c2384796ae0mr14566684ybq.37.1688573306385; Wed, 05
 Jul 2023 09:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657302103.git.geert@linux-m68k.org>
 <a89f148bf61bc20a7bb9c0e8ba030b0b770f9fe2.1657302103.git.geert@linux-m68k.org>
 <YswUwWO8GZfBZhsj@intel.com>
 <CAMuHMdVar28SbFvoS0oizNySOpwVYi42mchrvBQqtVm7S3SFww@mail.gmail.com>
In-Reply-To: <CAMuHMdVar28SbFvoS0oizNySOpwVYi42mchrvBQqtVm7S3SFww@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jul 2023 18:08:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiz8HKe7J8ZH_f=2bFL=gcUPppHungFoyP7QcKbVJ1wQ@mail.gmail.com>
Message-ID: <CAMuHMdXiz8HKe7J8ZH_f=2bFL=gcUPppHungFoyP7QcKbVJ1wQ@mail.gmail.com>
Subject: Re: [PATCH libdrm v2 04/10] util: Add missing big-endian RGB16 frame
 buffer formats
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On Mon, Jul 11, 2022 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Mon, Jul 11, 2022 at 2:17 PM Ville Syrj=C3=A4l=C3=A4
> <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Jul 08, 2022 at 08:21:43PM +0200, Geert Uytterhoeven wrote:
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > Any better suggestion than appending "be"?
> > >
> > > v2:
> > >   - New.
>
> > > --- a/tests/util/format.c
> > > +++ b/tests/util/format.c
> > > @@ -76,6 +76,9 @@ static const struct util_format_info format_info[] =
=3D {
> > >       { DRM_FORMAT_BGRX5551, "BX15", MAKE_RGB_INFO(5, 1, 5, 6, 5, 11,=
 0, 0) },
> > >       { DRM_FORMAT_RGB565, "RG16", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0=
, 0) },
> > >       { DRM_FORMAT_BGR565, "BG16", MAKE_RGB_INFO(5, 0, 6, 5, 5, 11, 0=
, 0) },
> > > +     /* Big-endian RGB16 */
> > > +     { DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, "XR15be", MAKE_R=
GB_INFO(5, 10, 5, 5, 5, 0, 0, 0) },
> > > +     { DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, "RG16be", MAKE_RGB=
_INFO(5, 11, 6, 5, 5, 0, 0, 0) },
> >
> > But I'm not sure why we even store the fourcc as a string in
> > the table anyway. Could just add some kind of string_to_fourcc()
> > thingy instead AFAICS.
>
> I guess that can be done.

Nowadays we have drmGetFormatName(), which returns an allocated string
with the name for a format code.

Using that helper in string_to_fourcc() would mean looping over the
table, and for each entry, calling drmGetFormatName(), comparing the
name, and freeing the name again.
Would that be acceptable?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
