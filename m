Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7CA45C9D9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70E26E9A8;
	Wed, 24 Nov 2021 16:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB146E980
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:22:07 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id 193so3386522qkh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lQ05ml1LhHBnkHYimEBs2VQYL5tQ4v6fk2Yd4f3PjAE=;
 b=3t6YXt7cUZ6omiD0P3AQK48BFNJapBrjluv3b5w8YXCKQp79hsEcfZ2PbviutMkAsq
 ONipIRz7OXPAzCdxtvVUtliXZFWXRoldqRNYZoQ4Lnq/xmpWooiLzwgHpFnrgB1TWZgZ
 3x9BFxVukwRu+pTxBN8+XMbhp445s/glt5XIbxek91YXeHnwAMmCufpEuFaYZpTzG/zV
 c9rNjE6WRQBpQwo74ABzY+PxvkJLBantf0sDs9QKPrQ40Tl2CKgfAx4ptcusk6FcG49W
 B7jd3RhWGIf8YZ8Z5bIGXVkdU5gaYr6s1AVx4gPNjo+0E0PF7iixrNvN+2iGUV9U+GBq
 G/kw==
X-Gm-Message-State: AOAM531sf7yWAKt1Q13XiBAp4ZJWum/MXPdg6USe9G8a+UuX1k9yXxwY
 Z94LTvI0zyfXHbBl5/aUyVHm1HZWVA/V3yYv
X-Google-Smtp-Source: ABdhPJwxeLv5Rsoy+m5wedEu5O8IqWsxHiEESk9MWcBrBiMgEPfyDs+SNLNwejWvTSrn6hD5Nyyo7A==
X-Received: by 2002:a37:cd1:: with SMTP id 200mr7733224qkm.106.1637770926109; 
 Wed, 24 Nov 2021 08:22:06 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46])
 by smtp.gmail.com with ESMTPSA id g5sm94404qko.12.2021.11.24.08.22.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:22:05 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id s9so2118714qvk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:22:05 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr24702645vsl.35.1637770914816; 
 Wed, 24 Nov 2021 08:21:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637691240.git.hns@goldelico.com>
 <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
 <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
 <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
In-Reply-To: <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Nov 2021 17:21:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
Message-ID: <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
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

On Wed, Nov 24, 2021 at 5:19 PM H. Nikolaus Schaller <hns@goldelico.com> wr=
ote:
> > Am 23.11.2021 um 21:10 schrieb Paul Cercueil <paul@crapouillou.net>:
> > Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller <hns@gold=
elico.com> a =C3=A9crit :
> >> +    assigned-clock-rates =3D <48000000>, <0>, <54000000>, <0>, <27000=
000>;
> >> };
> >> &tcu {
> >> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
> >>              bias-disable;
> >>      };
> >> +    pins_hdmi_ddc: hdmi_ddc {
> >> +            function =3D "hdmi-ddc";
> >> +            groups =3D "hdmi-ddc";
> >> +            bias-disable;
> >> +    };
> >> +
> >> +    /* switch to PF25 as gpio driving DDC_SDA low */
> >> +    pins_hdmi_ddc_unwedge: hdmi_ddc {
> >> +            function =3D "hdmi-ddc";
> >> +            groups =3D "hdmi-ddc";
> >> +            bias-disable;
> >> +    };
> >
> > Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You co=
uld just use the former and pass it to both pinctrl-0 and pinctrl-1.
>
> This was forgotten to remove. We do not make use of the unwedge feature b=
ecause I could not find out how to use pinctrl to switch this to gpio25 and=
 drive it low.

Using gpio-hog?

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
