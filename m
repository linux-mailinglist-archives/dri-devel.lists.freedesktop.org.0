Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B051839C931
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 16:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D060B6E49D;
	Sat,  5 Jun 2021 14:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7466E49D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 14:45:16 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id q7so13502083iob.4
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jun 2021 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zg4tYXBzFYTBPFnbctrrXgasqQu5Pw6BoMCMzX+63xw=;
 b=YDdB/B93y8jqL8m3kNXOFQoQMw6GRgw3LCqXlsgsHY0cudicrKsqX5VHP5Zdtkofap
 aqSHeutWXVtW78zmVAl2VllGmq9l9Y3cpDxkp0EGZPnBRHyKl4Y0vPlMowfED4djV8dt
 hyOBWryx0gwNZR22nO2mF5oz3xr8ZP/s6RaYZNHKIDeNN3NAYMnGiXerPWZCsaOTwe9n
 ol1u6Cnnhc2pAkRyeiWbz5lISIH54hgPnfaas/HHTwJQjYm7A6GaYChIZhwHQZZ9exTu
 QEklAqdeAKMbcOwjb+4ozYJq/s6CrIMyKQo1h3myslH0+OFP38mf44iqafMoh8eZntNJ
 FE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zg4tYXBzFYTBPFnbctrrXgasqQu5Pw6BoMCMzX+63xw=;
 b=kne37p8m5eOcemgSnz8lQLMqSKBrSywXzZsptLrZx28O63+i8EuAlS7puZx6mO4WIz
 Az/9UuvWnk/2MJbZUwhbbgVIxa4CBV+rax2lmWeNsYbD34uU16UGsAHUZahCpt86usW1
 /RZWVSeSxd2DnxM+5sviSxAD0i1Sp6ED0Purqj9v+rJoWuwEibcxz0IhQuZdOfi0WO3O
 ttqDUVrm13dEWJRHi8z0WBdLM2kFlAFsV9zUwS0GKjRtOX0m7f+6syfRBRQkZqC7ilw2
 Os7vPmSwbSKwHhcmASnSB06/cKJr+xci9Jbl5lNQaycf8o6nKGxz+jOXUhSFSMA9PvHB
 vzXg==
X-Gm-Message-State: AOAM530i2/Fj+9CPREJD9vpZ2fnlFNUgCknJta/z3GvEfy40MaC0Dp/N
 Eq964VBk1LtOOD7xDbBQHVW5nTCX2qsCYDXqHnI=
X-Google-Smtp-Source: ABdhPJxiHjc2m9ixm1mjO3AqnnoHf+aSsnodDIwDUP3L8cPMM987HK6yUJHr1WsyWFd0VIHtNJlVFZi124gSBdHdoMU=
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr8124782iof.125.1622904315421; 
 Sat, 05 Jun 2021 07:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210531102838.2423918-1-linus.walleij@linaro.org>
 <CAD=FV=XHzqi67_bf0EUCF=cgzGt-uX=+-ehkOfjm32Wg8YBt5Q@mail.gmail.com>
 <CACRpkdYvdPBWm8zc5EB9iEXoCXFv=0VwPXvLTxNXAoV3RbsYZw@mail.gmail.com>
In-Reply-To: <CACRpkdYvdPBWm8zc5EB9iEXoCXFv=0VwPXvLTxNXAoV3RbsYZw@mail.gmail.com>
From: Dillon Hua <dillonhua@gmail.com>
Date: Sat, 5 Jun 2021 22:45:04 +0800
Message-ID: <CAPTRvH=V5S0qPABA+eF2YFrwg3-c8A=VK+MPW6_CEgQoWmxX0g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: db7430: Add driver for Samsung DB7430
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus

Linus Walleij <linus.walleij@linaro.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=885=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=887:19=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Tue, Jun 1, 2021 at 11:31 PM Doug Anderson <dianders@chromium.org> wro=
te:
>
> > Still hoping that this can work atop DBI so we can avoid the raw SPI
> > writes. You said you're trying for it for v3 so I'm looking forward to
> > checking it out there.
>
> Struggling with this. The DBI bus is only used by tiny DRM
> for the panel drivers that are jitted with that display controller
> ATM. No normal panel driver is using it.

Quite similar to my ili9341 driver submission last year [1].
I guess, if it just simply combines tinyDRM and dpi driver
into one source code like what i was doing. it's might not
easy to get accepted from maintainers.

Anyway, there was a discussion on support dbi & dsi by one
driver [2], hope it'll give some help for you on this work.

[1] https://lore.kernel.org/lkml/1590378348-8115-7-git-send-email-dillon.mi=
nfei@gmail.com/
[2] https://lists.freedesktop.org/archives/dri-devel/2020-May/267031.html

Best Regards.
Dillon

>
> > panel-simple also sets the bpc in the "display_info". Do you need to?
> >
> > I didn't see a reply, so I'm still curious about the answer.
>
> I think it depends on whether the display controller/bridge actually
> make use of this or not. It is implied from the MEDIA_BUS_FMT*
> in practice and this controller (MCDE) only had settings for
> BPP, no fine grained bits to fiddle for BPC.
>
> But I added it for completeness, why not! Who knows who else
> will come along. I think I should patch a few other drivers with
> this as well.
>
> Yours,
> Linus Walleij
