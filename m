Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083513A3746
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7266E1F5;
	Thu, 10 Jun 2021 22:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D776E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 22:42:17 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id p21so1186266qtw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iRdCN0HvQQkpTRB1ULXrpWgJqNvce/0syzezUoUQYxo=;
 b=imVXan9YFPj+QkUqZxu8L/w6QL80dGilxvrhsJ/4DIAH3dy5sWO+NhCCeYqyf0B87J
 jB7n+daUkXHyxNAAQ+NcdyFuTGE1A3B/+oOUxzMEgaHIi4oM0+Dj0EdMDXqkZNwo07v3
 9nt7anP0WCUOVq0d9IGlh82YKrbmI4QJJ6ifs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRdCN0HvQQkpTRB1ULXrpWgJqNvce/0syzezUoUQYxo=;
 b=VTZqzfWeTo4h13/i+NoP9UNlpLYJxFE4yuQkNL+nHKSAJZZDfUT6voEp1RLhNY2zGP
 ZOz+1VqR4awbGwN/NfAvrb1OkozOAPxOWlf78QVkTvyHj1YIZxe0AdH4pwKZvltaaG/r
 s4lZdwCfhfNgdYtBqpvMTyNYwWrmiuuS5xlqkLIPRNdNlX9nbWcr7dW4IpS01a3//5ZP
 peLQE2dLPou2Xwsy1aD3HN91TJ0yw2/q83LC5gnIZtO8bMhy77gIPNsXjl2nPQDaEp8Y
 gJxirfEFi3OBMp4gZYM2A/CI0cC7Pob7uu1K73W/Bpa00nw6HtWA3bn4AF2NPwiQFa1S
 tzpw==
X-Gm-Message-State: AOAM532EQl8/zH9tTraSHBWp5S6SFOVfx6wz3o9IC19EnK+3GiMfB4mA
 8NyExL+e/gehQ+xOh2yXrAQ8FhiZUaBQ0w==
X-Google-Smtp-Source: ABdhPJyL3RfryCCPuPl3YSL4a3s+dJ9n+FPwWOgR68jfNSOVmEykoNhH8K6eWswXFpM3larVt5eyHg==
X-Received: by 2002:a05:622a:2c9:: with SMTP id
 a9mr1217788qtx.38.1623364936552; 
 Thu, 10 Jun 2021 15:42:16 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id d10sm3110949qtd.82.2021.06.10.15.42.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 15:42:15 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id g38so1539889ybi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:42:14 -0700 (PDT)
X-Received: by 2002:a25:ab4b:: with SMTP id u69mr1559472ybi.276.1623364934456; 
 Thu, 10 Jun 2021 15:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210610220527.366432-1-linus.walleij@linaro.org>
 <CAD=FV=XVCNZTPmvLPx7uvU8r8uuHai2Mxpxt0-Jv-ryD=grAMw@mail.gmail.com>
 <CACRpkdZ3=sjxi4VUi35Fa51amoxroOf1GLQP8A2kfZxVgsHwkQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ3=sjxi4VUi35Fa51amoxroOf1GLQP8A2kfZxVgsHwkQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Jun 2021 15:42:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9emGtV5Wj0jyAkHjLFrdnHOUhqqynFg-fvSVz2kibNQ@mail.gmail.com>
Message-ID: <CAD=FV=U9emGtV5Wj0jyAkHjLFrdnHOUhqqynFg-fvSVz2kibNQ@mail.gmail.com>
Subject: Re: [PATCH v5] drm/panel: db7430: Add driver for Samsung DB7430
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 10, 2021 at 3:39 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jun 11, 2021 at 12:30 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > > +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
> >
> > I would still prefer it if there was some type of error checking since
> > SPI commands can fail and could potentially fail silently. What about
> > at least this (untested):
> >
> > #define db7430_dbi_cmd(_db, _cmd, _seq...) \
> >   do {
> >     int _ret = mipi_dbi_command(_db->dbi, _cmd, _seq);
> >     if (_ret)
> >       dev_warn(_db->dev, "DBI cmd %d failed (%d)\n", _cmd, _ret);
> >   } while (0)
> >
> > Then at least you know _something_ will show up in the logs if there's
> > a transfer failure instead of silence?
> >
> > If you truly don't want the error checking then I guess I won't
> > insist, but it feels like the kind of thing that will bite someone
> > eventually... In any case, I'm happy to add this now (especially since
> > the DBI stuff is Acked now).
>
> This looks more like something that should be done in
> mipi_dbi_command() in include/drm/drm_mipi_dbi.h
> which claims:
>
>  * Returns:
>  * Zero on success, negative error code on failure.
>  */
>
> But no it does not return anything:
>
> #define mipi_dbi_command(dbi, cmd, seq...) \
> ({ \
>         const u8 d[] = { seq }; \
>         mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> })
>
> I'll fix up the include and apply then we can think about
> what to do with mipi_dbi_command().

Are you sure that doesn't work? Isn't the return value of a macro the
last expression? In this case the return value of
mipi_dbi_command_stackbuf() should just flow through.

-Doug
