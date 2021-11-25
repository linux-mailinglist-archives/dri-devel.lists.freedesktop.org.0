Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29D45D5D6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 08:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298556E046;
	Thu, 25 Nov 2021 07:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690486E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 07:58:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id u11so3933914plf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 23:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hmFa3mefTALjMC6F9V0zj4TVnAlnKNwgvaukN6YZ+bY=;
 b=m22sr18r9HOrnp7RVDytEJ3qq6I1x0HmmSTEH2bpf74EWHoLH9T7/bIhNhyiLIO5ny
 XDvxMnfaj7IMarPSHUGFqWuxI+RnQsZJfB3i7egT/SQzJm3FeEXa6cMqnZy6HTEV9gvX
 jWs9INGojwMuDGf4h/ydMzBEbm8vNLGIHFn49Av277p01qDUUrjxkkrsK6JW8ddDKzET
 x4edWodWJ0xpZ3r2xJL5XKrAkIgL7I/zmIpgZ4xnVUzQM3Q7d6BJnqPxjTTRYpGhFxMY
 SuJcbLCZT9dUCjE3Y2qaqb+Wly9VJSDVJzimmBe6eL+HzNcN7oFiehcR0t8X6VY4p8CC
 sJDQ==
X-Gm-Message-State: AOAM532kILvH9ubrjMnCQj4iR+Kw0HDsVdvoLCrDDff+wZf6zxyYWCfx
 /Pbw6uj8rGv+uSR5KtKqk29keIXNdkGlPQ==
X-Google-Smtp-Source: ABdhPJy+Jp5LjUNjEO225cbKyzbkTYx4/BmtxTohXfC7YcxKBg9IECnxwp9gPeyW7jm0IJBnwJcoFg==
X-Received: by 2002:a17:90a:4d0c:: with SMTP id
 c12mr4834113pjg.151.1637827115685; 
 Wed, 24 Nov 2021 23:58:35 -0800 (PST)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com.
 [209.85.215.174])
 by smtp.gmail.com with ESMTPSA id m24sm1538624pgk.39.2021.11.24.23.58.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 23:58:35 -0800 (PST)
Received: by mail-pg1-f174.google.com with SMTP id r5so4500329pgi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 23:58:35 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr7245004vke.33.1637827104304;
 Wed, 24 Nov 2021 23:58:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637691240.git.hns@goldelico.com>
 <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
 <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
 <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
 <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
 <B622D2B5-D631-43F3-9D50-2B41681C78AB@goldelico.com>
In-Reply-To: <B622D2B5-D631-43F3-9D50-2B41681C78AB@goldelico.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Nov 2021 08:58:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5sjVg6BEm3zgvvsJDHJwKP1A8rh-sama8suCG5SYQyA@mail.gmail.com>
Message-ID: <CAMuHMdV5sjVg6BEm3zgvvsJDHJwKP1A8rh-sama8suCG5SYQyA@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, letux-kernel@openphoenux.org,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

On Wed, Nov 24, 2021 at 5:31 PM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
> > Am 24.11.2021 um 17:21 schrieb Geert Uytterhoeven <geert@linux-m68k.org=
>:
> > On Wed, Nov 24, 2021 at 5:19 PM H. Nikolaus Schaller <hns@goldelico.com=
> wrote:
> >>> Am 23.11.2021 um 21:10 schrieb Paul Cercueil <paul@crapouillou.net>:
> >>> Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller <hns@go=
ldelico.com> a =C3=A9crit :
> >>>> +    assigned-clock-rates =3D <48000000>, <0>, <54000000>, <0>, <270=
00000>;
> >>>> };
> >>>> &tcu {
> >>>> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
> >>>>             bias-disable;
> >>>>     };
> >>>> +    pins_hdmi_ddc: hdmi_ddc {
> >>>> +            function =3D "hdmi-ddc";
> >>>> +            groups =3D "hdmi-ddc";
> >>>> +            bias-disable;
> >>>> +    };
> >>>> +
> >>>> +    /* switch to PF25 as gpio driving DDC_SDA low */
> >>>> +    pins_hdmi_ddc_unwedge: hdmi_ddc {
> >>>> +            function =3D "hdmi-ddc";
> >>>> +            groups =3D "hdmi-ddc";
> >>>> +            bias-disable;
> >>>> +    };
> >>>
> >>> Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You =
could just use the former and pass it to both pinctrl-0 and pinctrl-1.
> >>
> >> This was forgotten to remove. We do not make use of the unwedge featur=
e because I could not find out how to use pinctrl to switch this to gpio25 =
and drive it low.
> >
> > Using gpio-hog?
>
> well, AFAIR it activates the gpio permanently and is a propery of the gpi=
o controller and not of pinmux.

Yes, hogs are permanently (ignoring DT overlay tricks).

> The driver assumes it can use pinmux state switching to drive the DDC_SDA=
 line low on demand.

Add an optional wedge-gpios property for switching?

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
