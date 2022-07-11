Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E1B570226
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D70A8DDF6;
	Mon, 11 Jul 2022 12:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6678DD55
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:35:02 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id cw12so239839qvb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 05:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5VqL1W9VAVW8xaiCdtpCVVefxdXG1w2RSuVScr0QEks=;
 b=hVxYSubquB75HzZ3N8d9ehl3Le3l9xSyruCw5xoM9aOhbYcqCQ1BGYTjZkeUhVircr
 UZQUpohZWMHQ9bgQiiVnSJau0W1/UC7dpdwWhSua1+l5IMWtliNNPM0+L8dQkbz97WxT
 eE+Z1takUKqLiiVmMfqvXBWVQegCsyrwk5aAAJFvvgYduJdXwcgRBXXwZ7AhGTf84R4r
 JPm89So4QdiUPknwZJgIhntrQN6cJMr8LOSlm6q59K51XT/UmNkLyZysGVhBx0udxrBz
 t1eeeqW2H0mh0TrfOicq35ctAl7U1YaxgyQ2erED6HcZOSIpDMI/dhJFyJK6dSbG7/k1
 MdLw==
X-Gm-Message-State: AJIora9+HB2VSs/Rwe3I2dDzRFNu7mfaouR/VjJ3ZzKZzDQk3wB8ZNo0
 TWTFGnmBg72VlilKa9JReqRUPMvxUvegtg==
X-Google-Smtp-Source: AGRyM1vbhgpa+Mp8O03vDAP5SZwOb7BHiyQduk1BLKASD+0D954K6dACAI60aLavJCt924VACyV7TA==
X-Received: by 2002:ad4:5d6d:0:b0:472:ba6c:130f with SMTP id
 fn13-20020ad45d6d000000b00472ba6c130fmr13204007qvb.127.1657542901109; 
 Mon, 11 Jul 2022 05:35:01 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05620a28d500b006b593c21168sm945678qkp.46.2022.07.11.05.35.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 05:35:01 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-31caffa4a45so47268717b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 05:35:00 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr19315460ywg.383.1657542900636; Mon, 11
 Jul 2022 05:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657302103.git.geert@linux-m68k.org>
 <a89f148bf61bc20a7bb9c0e8ba030b0b770f9fe2.1657302103.git.geert@linux-m68k.org>
 <YswUwWO8GZfBZhsj@intel.com>
In-Reply-To: <YswUwWO8GZfBZhsj@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Jul 2022 14:34:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVar28SbFvoS0oizNySOpwVYi42mchrvBQqtVm7S3SFww@mail.gmail.com>
Message-ID: <CAMuHMdVar28SbFvoS0oizNySOpwVYi42mchrvBQqtVm7S3SFww@mail.gmail.com>
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

On Mon, Jul 11, 2022 at 2:17 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
> On Fri, Jul 08, 2022 at 08:21:43PM +0200, Geert Uytterhoeven wrote:
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Any better suggestion than appending "be"?
> >
> > v2:
> >   - New.

> > --- a/tests/util/format.c
> > +++ b/tests/util/format.c
> > @@ -76,6 +76,9 @@ static const struct util_format_info format_info[] =
=3D {
> >       { DRM_FORMAT_BGRX5551, "BX15", MAKE_RGB_INFO(5, 1, 5, 6, 5, 11, 0=
, 0) },
> >       { DRM_FORMAT_RGB565, "RG16", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0, =
0) },
> >       { DRM_FORMAT_BGR565, "BG16", MAKE_RGB_INFO(5, 0, 6, 5, 5, 11, 0, =
0) },
> > +     /* Big-endian RGB16 */
> > +     { DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, "XR15be", MAKE_RGB=
_INFO(5, 10, 5, 5, 5, 0, 0, 0) },
> > +     { DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, "RG16be", MAKE_RGB_I=
NFO(5, 11, 6, 5, 5, 0, 0, 0) },
>
> How about just stripping the BE bit in util_format_info_find()
> so we don't have to duplicate the entries in the table?

There is no need to support big-endian variants of all formats.
E.g. big-endian [AX]RGB8888 just map to little-endian BGR[AX]8888.

XRGB1555 and RGB565 are probably the only RGB formats we care about.
Or perhaps some of the *30 formats?

> I guess util_format_fourcc() would end up being more a bit
> complicated since you'd have to massage the string.

True.

> But I'm not sure why we even store the fourcc as a string in
> the table anyway. Could just add some kind of string_to_fourcc()
> thingy instead AFAICS.

I guess that can be done.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
