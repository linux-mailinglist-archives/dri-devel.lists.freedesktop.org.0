Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344287BBC6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 12:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E3110EEFA;
	Thu, 14 Mar 2024 11:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DCB10EEFA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 11:15:08 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso706039276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 04:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710414906; x=1711019706;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AaxQeb/LOGJ+tXY7ROrISTEEvDtokZCLzq0Vp5ELGOY=;
 b=b9UUJXfzaOKCcMw3VyjDuoKFrc79KJB5/l96LABn6bFKIndovEcDem0Ek4qJv+wqlv
 o7ZtVsbv1Pz4/SxpfYNabJp2kTdCuyYPhi9S8N26hItZSdthjvCfSmLlJpXEYJycd8k1
 I2n2FksAfnbvPwqDK5r7UBl7k1kwyU/qdEUIDo4LvdqNdGK8kkGq+qxgp//jzuXHLY1l
 6ZIiTLmuojw8i5BHrVACgMv3A5bXObIzrEnm9EwqoLol52kzkL+7tKF2yg2I73bK7/om
 4OX6q7tu3JJ4qhtnmUkL7E6EIrkZ2VpCWkHx1e3i85RmbrGMnVaU+DvEaOnrhqe14bxF
 5dZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmGE/IpnEywflADVuDjDYzx8GqnMM4cTC8AM1PZa5gMe63fXcaIksUpV7mSGDYvWxnch1AQxchFdXGGRfMBYNCVvsAreSwSmaN5UM7eU1p
X-Gm-Message-State: AOJu0Yy62klMkzIGHTgx7+Reh6GTOe4NNWeI/ioE3os2EB+Yqy1QzKND
 cQzZ90tgpJ/EWHnFjeAzNlNjsuGPYyMNv5VBJuT34SPnL8IcWhbVdvnmEn7kJu4=
X-Google-Smtp-Source: AGHT+IFNvyTEjLIxiM/b8+Fqa8ucc81QNfxg5L0wKGQWQaasD7AS7i75dkRO9/KOOr/tsSi44Ypecg==
X-Received: by 2002:a25:a341:0:b0:dcc:53c6:113a with SMTP id
 d59-20020a25a341000000b00dcc53c6113amr1063607ybi.59.1710414906089; 
 Thu, 14 Mar 2024 04:15:06 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 g8-20020a256b08000000b00dcd25ce965esm208663ybc.41.2024.03.14.04.15.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 04:15:04 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-609f1f97864so9234767b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 04:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGZqnOdvrDIXAj1hPbxK210H0jV1KM+Wjk8WTMP864cRZ+Bi9etApWyZ+7a4bnzRmqpUIKxSatkW+y+FpvchkrU/4/DvCCEmUg0Or23dcz
X-Received: by 2002:a0d:e782:0:b0:609:fdf7:b443 with SMTP id
 q124-20020a0de782000000b00609fdf7b443mr1440372ywe.52.1710414904384; Thu, 14
 Mar 2024 04:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304-brawny-goshawk-of-sorcery-860cef@houat>
 <85b807289ff2400ea5887ced63655862@AcuMS.aculab.com>
 <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
In-Reply-To: <CAMuHMdUuOnXVpocYU02Mx3_KrPow-=+WgLJqy_ku=AN52SvQiA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 12:14:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbmZyiy_Ca8eVQtwAhJ-_JsKEOpjrGehirWziPKbd=7g@mail.gmail.com>
Message-ID: <CAMuHMdXbmZyiy_Ca8eVQtwAhJ-_JsKEOpjrGehirWziPKbd=7g@mail.gmail.com>
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

On Thu, Mar 14, 2024 at 10:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Mar 9, 2024 at 3:34=E2=80=AFPM David Laight <David.Laight@aculab.=
com> wrote:
> > From: Maxime Ripard
> > > Sent: 04 March 2024 11:46
> > >
> > > On Mon, Mar 04, 2024 at 12:11:36PM +0100, Arnd Bergmann wrote:
> > > > On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > > > > The arm defconfig builds failed on today's Linux next tag next-20=
240304.
> > > > >
> > > > > Build log:
> > > > > ---------
> > > > > ERROR: modpost: "__aeabi_uldivmod"
> > > > > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> > > > >
> > > >
> > > > Apparently caused by the 64-bit division in 358e76fd613a
> > > > ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
> > > >
> > > >
> > > > +static enum drm_mode_status
> > > > +sun4i_hdmi_connector_clock_valid(const struct drm_connector *conne=
ctor,
> > > > +                                const struct drm_display_mode *mod=
e,
> > > > +                                unsigned long long clock)
> > > >  {
> > > > -       struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encod=
er);
> > > > -       unsigned long rate =3D mode->clock * 1000;
> > > > -       unsigned long diff =3D rate / 200; /* +-0.5% allowed by HDM=
I spec */
> > > > +       const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hd=
mi(connector);
> > > > +       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HD=
MI spec */
> > > >         long rounded_rate;
> > > >
> > > > This used to be a 32-bit division. If the rate is never more than
> > > > 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> > > > the expensive div_u64().
> > >
> > > I sent a fix for it this morning:
> > > https://lore.kernel.org/r/20240304091225.366325-1-mripard@kernel.org
> > >
> > > The framework will pass an unsigned long long because HDMI character
> > > rates can go up to 5.9GHz.
> >
> > You could do:
> >         /* The max clock is 5.9GHz, split the divide */
> >         u32 diff =3D (u32)(clock / 8) / (200/8);
>
> +1, as the issue is still present in current next, as per the recent
> nagging from the build bots.

Oops, s/next/upstream/.
Well, less 32-bit build testing for the next few days :-(

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
