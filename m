Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE7D87BA63
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 10:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E556310E111;
	Thu, 14 Mar 2024 09:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C160F10E111
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 09:27:40 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-609f359b7b1so9369827b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 02:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710408459; x=1711013259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaLpKVgtNxjkHzGcUUabbJb9+dMavCQgVpAQ745YG6s=;
 b=boOxINVQ9ETPV9VLlnzAdG3es2gNgUc2jer1Qu6lwrV07fkCF7ZmSzBa4CiV8Rb6T6
 eWVT31Qs8a5iCmJSUDY5IHdlvWgPEcI7fHt8RXi7vicYiewkG4WKew6TAQemjMNl/f8p
 ATehEMx0LyWUgB9NFvWC8gE0R2LRgZsByQYBn4s4gLY1+G92ARtVAFn/zAGwDT1mSShN
 v4a+c1zndrQS+dRrlvARdeAWcOMEOCu6/NwZbxiRrONDmmkUG2iYviQykulZuBg1Ml0G
 jNtlRvIyKPqS1/D75aGZUhAkQta5YnsG8tud0vOgDVFWl9I2vSuS24JHo5VhOMhnnddV
 pd4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmGdO8CpFAUSL/RHbCy3+cIgCYV2c5Gvi/apbdFEBulxW0KC9IwTS1OaJjmx8YEur2kTKdH6vVvHs88QRkdbZr7E9dUgENQKUv1vXivqTL
X-Gm-Message-State: AOJu0YyPgaokR6udsRBDwL0+2yRuKPwPGc9dItz8fplZOe4B722SLgOB
 PIx3CF988O8gAylPMtfpyGG5AcbePClAeO7YgBscBn/+qnrLQnrHlCCC9ezmpT8=
X-Google-Smtp-Source: AGHT+IEApLlsXvoHSAn08YTnR/IZVbnlWfE+QARnnpxBohtftVlymSEaVt/P6hkk3zjuCQSmv1KX+g==
X-Received: by 2002:a0d:e891:0:b0:60c:a16b:6797 with SMTP id
 r139-20020a0de891000000b0060ca16b6797mr928406ywe.21.1710408457895; 
 Thu, 14 Mar 2024 02:27:37 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 m32-20020a81ae20000000b006094ac70480sm203340ywh.51.2024.03.14.02.27.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 02:27:36 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso447605276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 02:27:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWvwYg5APYzIkfg7Dsx16RXTlsHZAGOmNH+kV/2rRs4j5WcP5b1jd8CIA5t+BokFr0IMsLV4dnPq1Ij/Q8Fqz+l9OiwIF0Y/Ftc7+0D9hay
X-Received: by 2002:a25:a264:0:b0:dcd:38f9:f78 with SMTP id
 b91-20020a25a264000000b00dcd38f90f78mr1053493ybi.29.1710408456666; Thu, 14
 Mar 2024 02:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304-brawny-goshawk-of-sorcery-860cef@houat>
 <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com>
In-Reply-To: <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 10:27:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
Message-ID: <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
Subject: Re: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
To: David Laight <David.Laight@aculab.com>
Cc: Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
 Dave Airlie <airlied@redhat.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Ard Biesheuvel <ardb@kernel.org>
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

On Sat, Mar 9, 2024 at 3:34=E2=80=AFPM David Laight <David.Laight@aculab.co=
m> wrote:
> From: Maxime Ripard
> > Sent: 04 March 2024 11:46
> >
> > On Mon, Mar 04, 2024 at 12:11:36PM +0100, Arnd Bergmann wrote:
> > > On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > > > The arm defconfig builds failed on today's Linux next tag next-2024=
0304.
> > > >
> > > > Build log:
> > > > ---------
> > > > ERROR: modpost: "__aeabi_uldivmod"
> > > > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> > > >
> > >
> > > Apparently caused by the 64-bit division in 358e76fd613a
> > > ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
> > >
> > >
> > > +static enum drm_mode_status
> > > +sun4i_hdmi_connector_clock_valid(const struct drm_connector *connect=
or,
> > > +                                const struct drm_display_mode *mode,
> > > +                                unsigned long long clock)
> > >  {
> > > -       struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder=
);
> > > -       unsigned long rate =3D mode->clock * 1000;
> > > -       unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDMI =
spec */
> > > +       const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi=
(connector);
> > > +       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI=
 spec */
> > >         long rounded_rate;
> > >
> > > This used to be a 32-bit division. If the rate is never more than
> > > 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> > > the expensive div_u64().
> >
> > I sent a fix for it this morning:
> > https://lore.kernel.org/r/20240304091225.366325-1-mripard@kernel.org
> >
> > The framework will pass an unsigned long long because HDMI character
> > rates can go up to 5.9GHz.
>
> You could do:
>         /* The max clock is 5.9GHz, split the divide */
>         u32 diff =3D (u32)(clock / 8) / (200/8);

+1, as the issue is still present in current next, as per the recent
nagging from the build bots.

> The code should really use u32 and u64.
> Otherwise the sizes are different on 32bit.

The code is already using a variety of types (long, unsigned long long,
unsigned long) :-(

       max_t(unsigned long, rounded_rate, clock) -
       min_t(unsigned long, rounded_rate, clock) < diff)

At least u64 should make it very clear clock does not fit in 32-bit.

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
