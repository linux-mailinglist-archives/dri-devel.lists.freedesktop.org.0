Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D73C2690
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 17:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B20C6EA3B;
	Fri,  9 Jul 2021 15:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD486EA3B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 15:03:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p16so23911077lfc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=liyDc8KPNREPxYu6ZBK2AjGzDPc3y18sesydg06M0to=;
 b=nIyG6XZKLZAvgW4L3u6Dh+N8oCKr7rX1MIemUVoAtUVYiFoEi7Z+obVxpNc2Ag3vq4
 BYSDgX4ly6JBEmBJafm/0vRqAT360NHU1GXiY4Upx0vzn3Ajcz2rEivyu1LsGunuGJsv
 Ou1BUN8E1ujekGe6IiflnBHC8O7Jaajx8Hv2+mBzwU85FWVLppGX4A8OPvteOtRfPUYM
 xlQJ9IZTvmjhqu01mrfXzI6D3HjG6l21MSA970G9O2NvwSQC0ujhYB9YFKSZtxLJp8TR
 mxn9ugv/A+2hJQ2FEgCi21c2GOhR7+deK3JgnVr5ginzj8/5Y48v/K3Ip1e67McUPk0t
 1lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=liyDc8KPNREPxYu6ZBK2AjGzDPc3y18sesydg06M0to=;
 b=c2KWiJ8H7pXMyg8VVdbQ/Nu9SEvFlBDbMU0s5+jCdUhvsz8b599BbnjFI9H3djkJVV
 81s5ud0Jm/u1TtAJI+3JjWJjUSVgOKBRQDw1xvIrKluXODoI4hhbJQeo36rF6G+3kWFs
 CEDd+YqW8tRMv6Nf0n6iMC5xbhgoxNRCgpXy0Lq9SJiUfVsUz/gSD3M+5rWcWI8pWW4m
 BDBoLq6AhAVWIUQgSGxXqhnLrHoaPHSurTrXcNjoMXMrKe4ecO0aw4EEw/Py/qyePn47
 0BA2jPVSPldXIaqOMiLys4bqwfGAazwAsE84jjPeOvFB0gcDXDE2NuQUVpiBE/P8P0Ha
 8l2Q==
X-Gm-Message-State: AOAM532O3eoS+NcezLrGtEc23tGqGiuYlZfv38+BZ24MuGOcG9A0WVzU
 bgeF+cD6MedIPPQdIDHH0Yn9I2acfOqMkJ2ai25z8g==
X-Google-Smtp-Source: ABdhPJx5zmrwgeteYY4t5Mjz5wr4c5JFUa6wYmjNzObu7aUcyu0bUVeWtS0dczld8lWvqKs703psndDvTMhAFGeOe70=
X-Received: by 2002:ac2:4d42:: with SMTP id 2mr7524852lfp.465.1625843005537;
 Fri, 09 Jul 2021 08:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210707234315.242663-1-linus.walleij@linaro.org>
 <20210707234315.242663-2-linus.walleij@linaro.org>
 <CAMty3ZCjciURnUJnTOPDQOSaiDVRneJoe=w9U==73Jt=Wd895w@mail.gmail.com>
In-Reply-To: <CAMty3ZCjciURnUJnTOPDQOSaiDVRneJoe=w9U==73Jt=Wd895w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Jul 2021 17:03:12 +0200
Message-ID: <CACRpkdaSo_+z3tJzR8A5B9HhDVUHeutW9AHash9YgVo9SC+ARA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 11:25 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> > +       /* Assert reset >=1 ms */
> > +       gpiod_set_value_cansleep(ws->reset, 1);
> > +       usleep_range(1000, 5000);
> > +       /* De-assert reset */
> > +       gpiod_set_value_cansleep(ws->reset, 0);
> > +       /* Wait >= 10 ms */
> > +       msleep(10);
> > +       dev_dbg(ws->dev, "de-asserted RESET\n");
>
> Just a small comment, are these delays are as per init sequence
> mentioned in datasheet?

As so often with Samsung mobile displays there is no datasheet.

These delays are in the product source code tree for the
GT-I8160 (Codina) mobile phone, actually in the glue integration
code. WideChips were acquired by some other firm and do not
exist anymore so I can't ask them, and asking Samsung for anything
else than source code doesn't work either. (I have tried.)

Yours,
Linus Walleij
