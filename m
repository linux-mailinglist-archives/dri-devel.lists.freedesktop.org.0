Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D1825F02
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 10:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A9E10E0D1;
	Sat,  6 Jan 2024 09:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E43310E0D1
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 09:32:53 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-67f9fac086bso3938926d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704533572; x=1705138372;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCzELojOf7XR3y8WSqa5qQlK9psTGRHA9ep7x4N0xvA=;
 b=rrEIs5OOxsZ01/LWQWqihDBG96/schURyfzrD3angT+ftgThh/QYQRi3oSoNx4fRMU
 +43QL15L4mLr9DV5AOc6lw3lsjYdL1LvyQ65nNiBAHRP3BkHl3+vQQXOguznqhz62Thz
 rAWAf2i8INhnQlXmtDR5IZHpDUn/9Jf4gg+U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704533572; x=1705138372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCzELojOf7XR3y8WSqa5qQlK9psTGRHA9ep7x4N0xvA=;
 b=Fu4T0EdNE/Hs55SFzA1GNXjiMFIkT0SzyNA7w0h41oQNlfB8pXzyI6ZhdUJ2rMhUcO
 fLG6HaRYDiIY8ojpdic685BmFBAJetdJSRpmB6sSnYGypazzLBlwMbcT6MkQLWr80uAE
 QRctd0M/NOjMxMdr4J0buGT+xabCKOGsq2PZw+mhZgu4E46WVe/xgbwKnwAGU4G2fbOb
 vAf4vA6QE/jcSo1QIj+TlBY9muB+Pg7v37d69jW4UseAXVkUf+dX9/v+Xd0hPc/LdpND
 xdKa7KV6rPrFEvc6jon9sPnw5DRUNmdXCeF7szes5nhpQIUUd6Jhq9T/6JlyvRzJS83d
 s7pg==
X-Gm-Message-State: AOJu0YywH813S1ted8+dJDj3j9fGGfQdGHbw5O+XPTAMo0mfZLDoKjY/
 cIEq7hPFcZU3YGhWoN3Q7nv4IzeyBd6uJMFeduO43dseO0wItw==
X-Google-Smtp-Source: AGHT+IEoJzcvJ1WWTdTHCoVdZIRG0tYvkyXfIPVgMBjVGvNCJ6h7jGyeGI2WS4TaFsT73zmVMFO0cvtoLaFj4A1ggG8=
X-Received: by 2002:a05:6214:acd:b0:67f:ba18:7d59 with SMTP id
 g13-20020a0562140acd00b0067fba187d59mr1028539qvi.104.1704533572360; Sat, 06
 Jan 2024 01:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
 <20240104084206.721824-8-dario.binacchi@amarulasolutions.com>
 <CACRpkdZ9uYj6geL+_NijdCP3mem-Lr+9RB1Nm4_hL3U480merA@mail.gmail.com>
In-Reply-To: <CACRpkdZ9uYj6geL+_NijdCP3mem-Lr+9RB1Nm4_hL3U480merA@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 6 Jan 2024 10:32:41 +0100
Message-ID: <CABGWkvqaATABS+9_dJ3JVtYDT=a4e4m60epjUxLjv_ZJ7ik3QQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] drm/panel: nt35510: move hardwired parameters to
 configuration
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 5, 2024 at 8:08=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Thu, Jan 4, 2024 at 9:42=E2=80=AFAM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
>
> > This patch, preparatory for future developments, move the hardwired
> > parameters to configuration data to allow the addition of new
> > NT35510-based panels.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> I tested this patch on the NT35510-based Skomer and it makes the
> whole display mirrored around the Y-axis (text from right to left instead
> of the other way around, penguins appear mirrored upper right
> etc).
>
> +       /* Enable TE, EoTP and RGB pixel format */
> +       .dopctr =3D { NT35510_DOPCTR_0_DSITE | NT35510_DOPCTR_0_EOTP |
> +                   NT35510_DOPCTR_0_N565, NT35510_DOPCTR_1_CTB },
> +       .madctl =3D NT35510_ROTATE_180_SETTING,
>
> Changing this to NT35510_ROTATE_0_SETTING makes it work
> fine again.

Sorry for the mistake

Thanks and regards,
Dario Binacchi
>
> With that change:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
