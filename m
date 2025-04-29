Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41AAA038E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDFE10E2D9;
	Tue, 29 Apr 2025 06:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3B10E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:40:11 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-523f721bc63so6859721e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745908804; x=1746513604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2pTZwWCx4AwPAg2sEXFNw62Tg9w8hwaYI+/a6YbFJHs=;
 b=EQ27ROT5K2NLIBwSSL/GaI+ktQLygk1B1eee7/iKxMbAIgaX+L5D1qk86UcMC4gyU7
 Czgv3sodSj9zdh0e8sdddho09cSwRece5953qnyhzkufof7rqPmGzlSm8JTYQFY18Bbx
 duihlgv0c1yPZD6HjvN4cqmvUJSUGGtFdum5DTPiEJFlWqDSOezrlMLy22RUZxHXGsRL
 oL8WMkXrMFgKIb9xBfHUTZaET8iVd6x8pa7tmoqQsION8bq7zgT0B49JF5hSHH8AZ7eH
 NUewkTpnXooEf1+eDiLNafLJNvaJlQH4rc3HHzmA/FwCzeoQqrhJGrwcIRFor8+3W4Ky
 rzjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvVROkPKfjsPZdxaoSU13jLozBrQ9vMp5k+Ddh4itjwhHfOpmA+NExzK63btMp8S4I48i93AfoPtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFZ4jzHX5c/YVOzNIztfVPJQqYmM7B/WyBaqr+iKXTefJo6fXe
 cg8m8ec9UTGjxufbyuSHU15iKr7nZgPbWgEFwKbErXPciEQbmYPwe58wFhZU
X-Gm-Gg: ASbGncsElyH5UT3K3Fo7JzfQ2U1nZitlx1ZFHtFiVvTcEfXIbjiijbbT7Rg1s45FtTf
 GQdBNGVMWB3FHvUTvohJfSwjCRNIj8QjhrE/uBxnJ//Acv0l8KPTs8ynC5ueUn34RS1Y4XyFqPe
 YKyhZyXyZ1T1tFNgQtzLN4FCTwQeHG6xMUw794vTEGghsSNg7dtZjJJYg6Pr7OZ32dXU8OWl/E8
 oijsDZPKDex2FbWDyoSexjySS2IUsfZr8LNyZEJrxP4zKTUeVPvnu71qFuy8eJBPrwZQrBYF6eQ
 SduLNmWzGEVEbeaFbkyNr8h3g80QiA5PIvRqTP7Tt+pLTyiCFBiadM70douIq7fsjI0T02mB+b1
 g+L8=
X-Google-Smtp-Source: AGHT+IEv4lkoWmezv9+0pNukHn4vu1ZQIwcobg717qwtszQ8fMxbQpcgyIKt3N0rjBMHzs2umRajFw==
X-Received: by 2002:a05:6122:2011:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-52abf4c14b7mr1337593e0c.0.1745908803880; 
 Mon, 28 Apr 2025 23:40:03 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52a993a5449sm1216235e0c.35.2025.04.28.23.40.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 23:40:03 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-86d587dbc15so6031858241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXKY6QE4sylIBAA4NIHrJK+bDnAkK7LVci/BmVRtxbWgrmeDP9Ew4ps6FTdTSny2bolIRC9Ty/T9so=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3751:b0:4bd:379c:4037 with SMTP id
 ada2fe7eead31-4da96bd8c66mr1250087137.9.1745908802569; Mon, 28 Apr 2025
 23:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
 <aBBukAqH3SKV9_Gl@gmail.com>
In-Reply-To: <aBBukAqH3SKV9_Gl@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Apr 2025 08:39:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
X-Gm-Features: ATxdqUF3MaMpFsIQbQe-FvL_1o_alODB-fPu_OUxCIJH3RlIBpudhPHHypgD7Vk
Message-ID: <CAMuHMdWWzE-ADAfXiNxbDOSur5n5zF1NkcB7Pab0_pq2-Q85=A@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmrmann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>
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

Hi Marcus,

On Tue, 29 Apr 2025 at 08:15, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
> On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:
>
> [...]
>
> > > +                       /*
> > > +                        * As the display supports grayscale, all pixels must be written as two bits
> > > +                        * even if the format is monochrome.
> > > +                        *
> > > +                        * The bit values maps to the following grayscale:
> > > +                        * 0 0 = White
> > > +                        * 0 1 = Light gray
> > > +                        * 1 0 = Dark gray
> > > +                        * 1 1 = Black
> >
> > That is not R2, but D2?
> > include/uapi/drm/drm_fourcc.h:
> >
> >     /* 2 bpp Red (direct relationship between channel value and brightness) */
> >     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
> > /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
> >
> >     /* 2 bpp Darkness (inverse relationship between channel value and
> > brightness) */
> >     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
> > /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
> >
> > So the driver actually supports D1 and D2, and XRGB8888 should be
> > inverted while converting to monochrome (and grayscale, which is not
> > yet implemented).
>
> The display supports "reverse" grayscale, so the mapping becomes
> 1 1 = White
> 1 0 = Light gray
> 0 1 = Dark gray
> 0 0 = Black
> instead.
>
> So I will probably add support for D1 and D2 formats and invert the
> pixels for the R1, R2 and XRGB8888 formats.
>
> Could that work or are there any side effects that I should be aware of?

That should work fine.
Note that you do not have to support R1 and R2, as they are non-native.
AFAIK XRGB8888 is the only format all drivers must support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
