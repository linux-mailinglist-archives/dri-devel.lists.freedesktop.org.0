Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8DE4D9C62
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2979210E46D;
	Tue, 15 Mar 2022 13:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F8310E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 13:37:26 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id n11so10153286qtk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 06:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DeUBfYy1MF3rdgCkqnY1ulVb8mmjHkjr8oT5jWm5FTE=;
 b=aaVtbrDEEOyjSW+41aMcdE/F/Tt9+iDBpTo0mmCk2FGzIvutDXhP1S5dZHq8Gy2m5k
 Sfi06s1wdJEVN5+7sdF9GZrdEiYoBcbzSEwIrOB/nMWO45cXhdYJShe7YcQ1PWrqYLwY
 Hrt/jKYtMmI5zSxTwWRfvCIZor17KHIu8NbJsVZrH9XlHeQzTH2uT/6bz2qvuvQNk8jI
 5QX0KcjfCO2gS/SRSZtjfuKZo+qVKYUJU2IzwwVUGnveHOmgmfhDhfl9YOBIoZamrn4b
 /WVsvlI23hMotn3Ewpky37DxoDGkOL1S4n951DznsNHYN4bQlYr1gk9JEeMC5+g51wnx
 B/pw==
X-Gm-Message-State: AOAM530uCDd05nwRm4bXTXrLQjcc9dTaPmeBkpZwpslOEzqzdJlnJjp+
 sjSGtMGh2PpzKVk0BnIFYHIsoKK7PBLDZg==
X-Google-Smtp-Source: ABdhPJzY8ZkTHq2tvAXRnsH/eCH0GtKO6hKzgpk33KUjJVwUQef2P8tzDTC9X6LhJnP95G5Di9a96A==
X-Received: by 2002:ac8:5910:0:b0:2e1:a132:e11b with SMTP id
 16-20020ac85910000000b002e1a132e11bmr21945431qty.27.1647351445008; 
 Tue, 15 Mar 2022 06:37:25 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05622a174800b002e1e3f7d4easm875976qtk.86.2022.03.15.06.37.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 06:37:24 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2e5827a76f4so30427787b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 06:37:24 -0700 (PDT)
X-Received: by 2002:a81:5247:0:b0:2dc:2171:d42 with SMTP id
 g68-20020a815247000000b002dc21710d42mr24161091ywb.438.1647351444178; Tue, 15
 Mar 2022 06:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-2-geert@linux-m68k.org>
 <YjCVesysvfpKNilD@smile.fi.intel.com>
In-Reply-To: <YjCVesysvfpKNilD@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Mar 2022 14:37:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUXT4u_ewtHP4oCk6uOvu3a0M_mZAq+jf3MC97sOp5VEQ@mail.gmail.com>
Message-ID: <CAMuHMdUXT4u_ewtHP4oCk6uOvu3a0M_mZAq+jf3MC97sOp5VEQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/format-helper: Rename
 drm_fb_xrgb8888_to_mono_reversed()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Tue, Mar 15, 2022 at 2:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Mar 15, 2022 at 12:07:03PM +0100, Geert Uytterhoeven wrote:
> > There is no "reversed" handling in drm_fb_xrgb8888_to_mono_reversed():
> > the function just converts from color to grayscale, and reduces the
> > number of grayscale levels from 256 to 2 (i.e. brightness 0-127 is
> > mapped to 0, 128-255 to 1).  All "reversed" handling is done in the
> > repaper driver, where this function originated.
> >
> > Hence make this clear by renaming drm_fb_xrgb8888_to_mono_reversed() to
> > drm_fb_xrgb8888_to_mono(), and documenting the black/white pixel
> > mapping.
>
> W/ or w/o the below remark being addressed
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

> > --- a/drivers/gpu/drm/drm_format_helper.c
> > +++ b/drivers/gpu/drm/drm_format_helper.c
> > @@ -692,12 +692,12 @@ void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const v
> >       for (y = 0; y < lines; y++) {
> >               src32 = memcpy(src32, vaddr, len_src32);
> >               drm_fb_xrgb8888_to_gray8_line(gray8, src32, linepixels);
> > -             drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch,
> > -                                                start_offset, end_len);
>
> > +             drm_fb_gray8_to_mono_line(mono, gray8, dst_pitch, start_offset,
> > +                                       end_len);
>
> Can be one line now (definition is already quite behind 80 limit).

Yeah, but the code isn't.
Nevertheless, this will be shortened in a later patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
