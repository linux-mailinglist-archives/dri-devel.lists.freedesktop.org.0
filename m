Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2CA3B8663
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CEB6E111;
	Wed, 30 Jun 2021 15:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0B36E111
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 15:41:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id w19so5922305lfk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcV9E45NKZ7hefc23azn5TjlOzKOt4blMnnIG7hMOYM=;
 b=WofXnVuKi1awkT5IU8azRO9FORp2TaEsALsyUD/7deHNdYkzYwvx0xwEmgZZ3fsVTh
 s90qRevq7hppcPMtU2SmpJwY1VRh6MFRN0jdY3rH4bUYSBaN3TtfdHBYJxOL6hOs4cnn
 wEL/jvincPT8FjquX+gjih9trq7DYKFEqBFyIkdEbkB6I21b33r5q5ppy4iMOmrGLZXY
 b8lKhl60f3UWc9SHHQdDOZIxpMAfNV/u1irHo0aGtNtEANT14+KEhtMC8USrH9IFEoKz
 Fgg4VcGnBAYvWK3h7L9UFEJMfBQOsr/lZNHSc9u0k4W4rdcfgd6wV5buq8CWECJt6Irz
 OpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcV9E45NKZ7hefc23azn5TjlOzKOt4blMnnIG7hMOYM=;
 b=TE7hy7MqSCYGtBFpmgccTMQu6vY32jJmxbFPs0RY2mIDwzjf6RZHvOOFdISa3Qg3SX
 e+PgHaLTtbCIuMxlI+wjmdOgrXz8nYlWAuZnOMLqmd9I22vq64w6D30KNzMHNOBhVTCH
 y0j2Ity5YWyRe0TmcRH+PH/1K4gyewLHbEfeCsLS5h6Y0TMxWJll7ZmlCpBr69jmLP3l
 WhiKEwkiOsOeQN08aHSsdNIKQe+hZLMFtwncbOAp5Tt6VqkZyhkaUY79ommlXhqfDmMy
 R3jNi9GYRjW+Cofqs4QzixMP4SHa1k6tMEaiNPBqwcmjFP+Ub9CNcpuTsvuxrQUKFe+B
 yO/w==
X-Gm-Message-State: AOAM532PAUU3Z2LD3jFLc14Prb69+v7GUeJ2FSE4oRHZ5a+PNMGxGObr
 CHaEL0wmFw0pjBALyWuE8q0HW1zrbj/mjIKzjrtzmQ==
X-Google-Smtp-Source: ABdhPJzl6dq3J7qwb9y320AWZIMj7FHdoSUgKWNSG+CpcV4qA+zbvtRDrXffwl1urZpHJ2sjIoDTFXssQ3NBLPnqupc=
X-Received: by 2002:a19:c141:: with SMTP id r62mr2125685lff.157.1625067659809; 
 Wed, 30 Jun 2021 08:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224458.2486701-1-linus.walleij@linaro.org>
 <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
In-Reply-To: <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Jun 2021 17:40:48 +0200
Message-ID: <CACRpkdamGu73CMm9N-mNKZ33B76eO32RT9Gw3hUk+p76WyN32g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
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
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

thanks for your review! I fixed most things except this:

On Fri, Jun 25, 2021 at 6:42 PM Doug Anderson <dianders@chromium.org> wrote:

> > +static int ws2401_disable(struct drm_panel *panel)
> > +{
> > +       struct ws2401 *ws = to_ws2401(panel);
> > +
> > +       ws2401_command(ws, MIPI_DCS_SET_DISPLAY_OFF);
> > +       msleep(25);
>
> It feels weird / arbitrary the split between "disable" and "unprepare"
> on this panel driver compared to the "db7430.c" one. In the other
> driver you put the sleep mode here and in this driver you put the
> sleep mode un "unpreapre". Is that for a reason, or just arbitrary?
> Can it be consistent between the two drivers?
>
> I guess maybe this is because in "db7430" the power up order was
> slightly different?

This arbitrary sequence ordering is part of why we can't just have
one display driver to rule them all... sadly they also make semantic
sense.

The vendor driver needs the display to come out of sleep right
after the power-on to send the init sequence. The vendor driver
does exactly this.

The placement of these sleep mode in prepare/unprepare calls
is because of this.

Yours,
Linus Walleij
