Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B575BEF1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 08:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883B910E61E;
	Fri, 21 Jul 2023 06:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7797510E61E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 06:33:36 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-991ef0b464cso580957666b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 23:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689921215; x=1690526015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnoccgm9pbFbfKUa9nHPfrhyKpJevZV6lRDZU+5R3HY=;
 b=lff+WY/rFM79DiX68p0sDAXj+pfWUi86h0J8FhNtLOqTuVYK4386kw1jWOHJxhPE1R
 SIe5+u3TWL7OlQRjR5PRK/CieuHVltbVamSV7z7kaexGnAYwy+0sp+MUtYfiKrTVze+J
 TMPlDVVlRNU6WA3LEIhsldmVb7xy3J3eezzWe9R4MtcHd8TajMhBTQT22TFFRkQfP6Zh
 nY+TUv3fKJwglNZkTIlf+Nvrder7u9HOEbrkfGDewYQRsQp36KdVojRsb+NpR0zvXNty
 +Kmu4lZObKQTE7cNVAPVFOjNjukIsu5umvADczDVnC6unINqxKyyhYdS8kw5OT8TxWe/
 xP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689921215; x=1690526015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnoccgm9pbFbfKUa9nHPfrhyKpJevZV6lRDZU+5R3HY=;
 b=Ofgvcx4W+PEraVzRB1m+nHwLXoYPRB5JKyVn4V09cbW89zXLbCg4iVxjrLof6g1PD+
 urQ8x/cZiUnYQ4k8r/111GfDXxvLNzZdNIl+KsrOWbPnw2x6Lhg0EeV8WjgKWkq/i65x
 iMbAkz2OZA21+yi55Fdvz3z0aRGlQvgc7zt27GSxpSmdz/oNHm0nhZaOx9LLEco/T4uF
 QQbz09YYmSeCcqvEjn4DGvDeq6jDSa/rEjZDUrjKFoyxedMheMgRNac5nKgcng0sKSWy
 iT7RNTT02iu1mkgGR0wkgthZ0BPXwwscWtkatEiLIfQf/nKQ0bxz6bbMcSBwzZKf/dwq
 lcRw==
X-Gm-Message-State: ABy/qLalTdF8NJ/Om+hORfx+LqMu/I8bkelFjX2lgMsdl4k5V4mShuEX
 DY5mw5QYkbWm4tSq1tXhiJ4P4ZnjCP8Kx+J6QPw=
X-Google-Smtp-Source: APBJJlEtO4UicrSfPlGEItokOw0Rqd9qo0Xz3sQB7r3a2uNCVNw6hO5cWfLViqwkI1hefdfKpgawHCVRuNQc60GaJTw=
X-Received: by 2002:a17:907:7e92:b0:98e:4f1:f987 with SMTP id
 qb18-20020a1709077e9200b0098e04f1f987mr8028770ejc.3.1689921214685; Thu, 20
 Jul 2023 23:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230720061105.154821-1-victor.liu@nxp.com>
 <20230720112742.GA2525277@aspen.lan>
 <AM7PR04MB7046CF1E1561A37C7A5AC89B983FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7046CF1E1561A37C7A5AC89B983FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Jul 2023 09:32:58 +0300
Message-ID: <CAHp75Vf6FTgHyimX+B80tZEwJRg7ut1=DS=Dbdy+Aa+xVwh5YQ@mail.gmail.com>
Subject: Re: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
To: Ying Liu <victor.liu@nxp.com>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 8:17=E2=80=AFAM Ying Liu <victor.liu@nxp.com> wrote=
:
> On Thursday, July 20, 2023 7:28 PM Daniel Thompson <daniel.thompson@linar=
o.org> wrote:
> > On Thu, Jul 20, 2023 at 06:06:27AM +0000, Ying Liu wrote:
> > > Bootloader may leave gpio direction as input and gpio value as logica=
l low.
> > > It hints that initial backlight power state should be
> > FB_BLANK_POWERDOWN
> > > since the gpio value is literally logical low.
> >
> > To be honest this probably "hints" that the bootloader simply didn't
> > consider the backlight at all :-) . I'd rather the patch description
> > focus on what circumstances lead to the current code making a bad
> > decision. More like:
> >
> >   If the GPIO pin is in the input state but the backlight is currently
> >   off due to default pull downs then ...
>
> How about this patch description?
>
> ---------------------------------8<--------------------------------------=
-----
> Without this patch, if gpio pin is in input state but backlight is curren=
tly

s/Without this patch, if/If/

> off due to default pull downs, then initial power state is set to
> FB_BLANK_UNBLANK in DT boot mode with phandle link and the backlight is
> effectively turned on in gpio_backlight_probe(), which is undesirable
> according to patch description of commit ec665b756e6f ("backlight:
> gpio-backlight: Correct initial power state handling").
>
> Quote:
> ---
> If in DT boot we have phandle link then leave the GPIO in a state which t=
he
> bootloader left it and let the user of the backlight to configure it furt=
her.
> ---
>
> So, let's drop output gpio direction check and only check gpio value to s=
et
> the initial power state.
> ---------------------------------8<--------------------------------------=
-----

--=20
With Best Regards,
Andy Shevchenko
