Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C607870008
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F81A10FFEE;
	Mon,  4 Mar 2024 11:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203C110FFEE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:13:05 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6084e809788so41290427b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 03:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709550781; x=1710155581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8dLsJKtv+8j8qXEd3qFacsSzLxPyFjQtVyNStvTTTM=;
 b=e574mZ4xDe00S4uGV8JQvslX3KwAav8lEy9owej6TeOmS1M2YQWwVC/fPUfZPxX6Jz
 jJImMe8GoyKWqErV/SpDVK8eWp4jOqBdajW7B7SFzkRPhj6T8hoXZL5wJPi5vDE8SGBy
 Ku0e0y7LNBI6sdENpulOb6BcUH1nUMA8Oe9JNMCOJt+rNc3fI3UGDvr5ruzAGGn/Rg8O
 ngRI7z1n80Hzgf4/CtkWPYsLJWQhkdszXHOqZmllNbCSeahx1ZImnZ+dwj0wZv79cA0T
 MTAgIh1ua3bZb0i4181rlKI01T3WWzLbhYpKcakGMnAlOu9TfvU05DLOiuPRiD+ORDa9
 chwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO5OT/r+JsYOlTEy1OJTWx5Vj03MWEVO6IWEmX3GIACLqjNDygybSyYmNsLO/gAiskqR1/YVL+ljyC/wvrmcDPeTDU8unL4JP2cRA2aEDR
X-Gm-Message-State: AOJu0Yzv44lGtqKlXgXwEfmzGtqnLbaf3R/Yti8iRHCShUfTg/OMWKMV
 JdKm47g0LtO2+Ncxh5WximeCSQk5pqd77xjDDPd+1rFnyDuhjzlkXKxkYQAW4HI=
X-Google-Smtp-Source: AGHT+IG5DaPmn3BgRvBQ8SVGucBGYKxCvV6IIhjwFbaEoSx2HGEFd/YYycUaWvbb+4DimAdiKMMNBg==
X-Received: by 2002:a25:aaa3:0:b0:dc6:ca3a:31da with SMTP id
 t32-20020a25aaa3000000b00dc6ca3a31damr8745853ybi.16.1709550781055; 
 Mon, 04 Mar 2024 03:13:01 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 q14-20020a25820e000000b00dc6c58ae000sm2096927ybk.16.2024.03.04.03.12.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 03:13:00 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dbed179f0faso3679951276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 03:12:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVh/sg3P66Z1ngC3we0s+HKL+Vve7pIzZ/RaB2b7Qet/BFFyqxjSp5QHxAD6VyXk0xeVnTazPQYrI3wr6CKJspJR83MoxxmcyX9T9rDJSsK
X-Received: by 2002:a25:ab44:0:b0:dcc:55e9:ec34 with SMTP id
 u62-20020a25ab44000000b00dcc55e9ec34mr4965526ybi.30.1709550779663; Mon, 04
 Mar 2024 03:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
 <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
 <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com>
 <20240304-transparent-oriole-of-honeydew-f4174e@houat>
 <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
 <20240304-dangerous-mastiff-of-fury-1fac5c@houat>
In-Reply-To: <20240304-dangerous-mastiff-of-fury-1fac5c@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Mar 2024 12:12:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2HkYjowOZBgSZQ3N01UeUTnyv5kjx-82C9YJ+dsgsxQ@mail.gmail.com>
Message-ID: <CAMuHMdV2HkYjowOZBgSZQ3N01UeUTnyv5kjx-82C9YJ+dsgsxQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck <groeck@google.com>, 
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>, 
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
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

Hi Maxime,

On Mon, Mar 4, 2024 at 11:20=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Mar 04, 2024 at 11:07:22AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Mar 4, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Mon, Mar 04, 2024 at 09:12:38AM +0100, Geert Uytterhoeven wrote:
> > > > On Sun, Mar 3, 2024 at 10:30=E2=80=AFAM Geert Uytterhoeven <geert@l=
inux-m68k.org> wrote:
> > > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.k=
o] undefined!
> > > > make[3]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
> > > > make[2]: *** [Makefile:1871: modpost] Error 2
> > > > make[1]: *** [Makefile:240: __sub-make] Error 2
> > > > make: *** [Makefile:240: __sub-make] Error 2
> > > >
> > > > No warnings found in log.
> > > > -------------------------------------------------------------------=
>8---
> > >
> > > The driver is meant for a controller featured in an SoC with a Cortex=
-A8
> > > ARM CPU and less than a GiB/s memory bandwidth.
> >
> > Good, so the hardware cannot possibly need 64-bit pixel clock values ;-=
)
>
> This is an early patch to convert that function into a framework hook
> implementation. HDMI 2.1 has a max TMDS character rate of slightly less
> than 6GHz, so larger than 2^32 - 1.
>
> So yes, this driver doesn't need to. The framework does however.

That's gonna be interesting, as the Common Clock Framework does not
support 64-bit clock rates on 32-bit platforms yet...

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
