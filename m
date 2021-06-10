Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A863A3789
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D596EE0B;
	Thu, 10 Jun 2021 23:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554E86EE0B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 23:00:59 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id r5so5716099lfr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avbPEqXIY2sNVjl5X7sBVvA3GrXjDeMoVxyqEkFmSEU=;
 b=r2P9kw3MVyLuGU1b4OzqmdI+rT5Oy0s1Eb70dLTcJdyPTq9hj73OovKd6elCTdNNpP
 J00lJMB8A6P6G5o0DB17XpPz+onQC8dV8vHgSVDBins/pDoVCKEwH8YzkYwVEaxwXBUk
 bSKmHUQLsVps1VR2Esmx+JokInNNhhvfSZ5GX9X8E7uTt3e/3rnsYkl0gDV+oQnOyo5y
 bW/sNS8Eap/KVooPs8VpnJQb+QAHXhAuaQWwARyi2yFmGKgloE0LepaPUi3y027XDc30
 ELzc+6WVHQ/zcqe7NMYnPJgJktsrTUlPwpNaIsNItk6FgltKG+r6PVZkPiKp3XGucNT0
 ubpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avbPEqXIY2sNVjl5X7sBVvA3GrXjDeMoVxyqEkFmSEU=;
 b=e6r7Ns0hdg0CdwGsfi72LT4ZI9yGkDmN5/ADx4SvkfDPJrTfUoKh+70YtXwRAo6YWW
 GXyvJABxPo1YHhWgLW+9Sdjd1iCwSzgq9OPhx/ptBZh2coMgR0SHZgQpZzphp8JvXh2z
 Lmq0ZKRVy5zEB40sZCYCay1oqcNqe24t9S0/o81nMlyN4MXwi+DS2YiDjeL98zxXh24R
 IE63UwBG8oJW3eGj39aWRb6hW5uVcF3Jd1LNBnZ0nZFhnilk/+L1ymUf3BChwM6qZ6uj
 FL7WvMWsuku7ZpJ/hdUt/b89Xi2BlaCVfX0pkqovajU3edwebtpnzgd2qIMO/8L+ZRGw
 S2tw==
X-Gm-Message-State: AOAM5300lR9DQ+b1iwPVfcNplh2iN36Stno5c6e19Rhu9TppJ73kfQqk
 S77yWZmrYBXWPpn2ZqZIgm7PjgkYY4nDxiaa6GXLvhElacw=
X-Google-Smtp-Source: ABdhPJwFTNpOCdk3cz45tByAH8DvkgJ8/oSZr/JZIKZY9uizCZsZ+4+A1V9CHeQgqn3W+93AZY7PoMWnHRpCRx/HcQ0=
X-Received: by 2002:a19:8157:: with SMTP id c84mr679719lfd.529.1623366057737; 
 Thu, 10 Jun 2021 16:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210610220527.366432-1-linus.walleij@linaro.org>
 <CAD=FV=XVCNZTPmvLPx7uvU8r8uuHai2Mxpxt0-Jv-ryD=grAMw@mail.gmail.com>
 <CACRpkdZ3=sjxi4VUi35Fa51amoxroOf1GLQP8A2kfZxVgsHwkQ@mail.gmail.com>
 <CAD=FV=U9emGtV5Wj0jyAkHjLFrdnHOUhqqynFg-fvSVz2kibNQ@mail.gmail.com>
In-Reply-To: <CAD=FV=U9emGtV5Wj0jyAkHjLFrdnHOUhqqynFg-fvSVz2kibNQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jun 2021 01:00:46 +0200
Message-ID: <CACRpkdbNVB+k80a-iG53mhZ+DmZ2FokFiTG48QgGG-r89LmEyA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/panel: db7430: Add driver for Samsung DB7430
To: Doug Anderson <dianders@chromium.org>
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

On Fri, Jun 11, 2021 at 12:42 AM Doug Anderson <dianders@chromium.org> wrote:
> On Thu, Jun 10, 2021 at 3:39 PM Linus Walleij <linus.walleij@linaro.org> wrote:


> > #define mipi_dbi_command(dbi, cmd, seq...) \
> > ({ \
> >         const u8 d[] = { seq }; \
> >         mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> > })
> >
> > I'll fix up the include and apply then we can think about
> > what to do with mipi_dbi_command().
>
> Are you sure that doesn't work? Isn't the return value of a macro the
> last expression? In this case the return value of
> mipi_dbi_command_stackbuf() should just flow through.

w00t I didn't know that.

And I like to think of the macro processor as essentially just
inserting the content of the macro at the cursor.

But arguably it *should* rather be fixed in this macro though?
It is used in the same way in all other drivers as well.

Yours,
Linus Walleij
