Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DFB39593C
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1A6E8D5;
	Mon, 31 May 2021 10:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6936E8D5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:51:38 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v3so2779917ljc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 03:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TAhdE8F7zVF+yJ2yGFHeU6d9zER89ZJz06oLtxtSQg8=;
 b=lw8cZu3Vt5Y1F2Dg/da8QgJ3vyREzw7INx4dsA2/uNtirbKX/PIE5mJuSNOf56gczO
 1MQZRZU3nXAY3kT9m86Bnp9QI4ZLK9yaoyzMb+SBkWmP73wV96hMgFRSzY+aEJsT0C4A
 S6Cqg6OdGG6x89R2yRh/HaxzR+Jj+AE5VEMByxJmOj7BvRRFlnhbzUtuDd4HpSZ2zl0E
 A1EOrYEyQCTrCpDr42MZQkNUBPwvreib06Xj9V2XG93vQw+1na9sOf/Bv4yh0Iho9HS8
 7ARynPVOY50+p6DWvZzfWn2tnoSoKbAobgq6W1QUwjYCT47/jXd31EhnpmhrJvg3Tgvi
 V8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TAhdE8F7zVF+yJ2yGFHeU6d9zER89ZJz06oLtxtSQg8=;
 b=AwfuJnQJ4yovQV5J6pozJ1i9I3wzq4Ua6qBW4ZJ/MsDwc5ccdxT15nE6dKWUOmbSuv
 LKjyLJb6ReQM0NHyu5XdLtPNagbgGNBOh5/DCsEyM0FUvCqI9w1V/5CMmYjwVFBDsSge
 9KmpWyhOSSq++jw9mhX19iPSqqr7kd3LrPEepAwF3FMB7T76RYF0zK7VCmlVYxFj9VJc
 +YHnYebmhXdo8sH1aqHaURnkQi5K6M/pjLjJED5O+vIuti2ufVUKHJ/x5q0Q+J/CD9hE
 WqRpZ/Rkv6VWM/HWvVeOy+WbMY0IAtkcwxlL4nd6nBFVue2lak3wEep1T3F5y9QfMxU7
 W/VA==
X-Gm-Message-State: AOAM533W3JdsfNsXNp1xOpXnbZ+cKsl33J8wp3jxW1kzNMTkFIZk+stx
 +7YhQGDWT26m+/jlQ02VJvQgB5Ag42prbBt57bW2bA==
X-Google-Smtp-Source: ABdhPJzSzF6e4SiPe1KPgpbefzxamS7AXWuLgoqaklY7vFZi3dR73oKCo5aNFHbZ0TuHhH5PhuKKGn41uDV9Zz3qTBA=
X-Received: by 2002:a2e:22c3:: with SMTP id
 i186mr16498101lji.273.1622458296930; 
 Mon, 31 May 2021 03:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210405234713.3190693-2-linus.walleij@linaro.org>
 <CAD=FV=VT9R9r0ztMfKr0wH8vrOL0RnKmQuwYp8L2aZX74n8A_A@mail.gmail.com>
In-Reply-To: <CAD=FV=VT9R9r0ztMfKr0wH8vrOL0RnKmQuwYp8L2aZX74n8A_A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 31 May 2021 12:51:25 +0200
Message-ID: <CACRpkdZAxSmAOg5=frWxz6JFsXRtgydbqjgzhfVVs5Lbt=4opA@mail.gmail.com>
Subject: Re: [2/2] drm/panel: lms397kf04: Add driver for LMS397KF04
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

just sent out a v2 of this! Hope you can look at it.

Some comment on comments:

On Thu, Apr 29, 2021 at 10:21 PM Doug Anderson <dianders@chromium.org> wrote:

(...)
> > +#define LMS397_UNKNOWN_F8              0xf8
> > +#define LMS397_UNKNOWN_FC              0xfc
>
> I managed to dig up a copy of the DCS spec. It says that all these
> 0xb0 - 0xfc are specific to each manufacturer, so that makes sense
> that they're all defined in this file instead of somewhere common.
> ...but it also says that, at least the way they're intended to be
> used, these commands are all supposed to be used only in the factory
> and then disabled. I guess maybe the manufacturer of this panel
> ignored that and requires these things to be configured each time the
> panel is powered up?
(...)
> I'll believe you if you tell me that it's correct, but something feels
> odd to me. As I mentioned above, the MIPI DCS specs say that it's
> expected that most of the configuration that you're doing in
> lms397kf04_power_on() would happen at manufacturer time and then be
> "locked" so you don't need to do it again.
>
> I could sorta believe that maybe some panels wouldn't have any
> non-volatile storage and that would explain why you need to program
> this stuff on every enable. ...but now the above comment says that
> it's loading stuff from non-volatile memory.
>
> Are you sure that all of the magic config commands you have in
> lms397kf04_power_on() are actually needed / doing anything? Could they
> be leftover from some example code and they're not actually needed
> anymore?

Yes it is absolutely necessary.

This happens for a bit, see for example
drivers/gpu/drm/panel/panel-novatek-nt35510.c

Why manufacturers (Samsung) do this I do not know for sure.
Could be either:

1. The flash memory is an optional external component so they save
  money on the BOM like this
2. Programming the flash in production takes too much time so they
  save manufacturing cost like this
3. Time-to-market, product was stressed out the door without
  time to set up the proper flashing on the production line
4. The panel actually has some settings from production, but oops
  they are wrong and now they can't be fixed.

Case 4 corresponds to e.g. all ACPI quirks we have because
abstracting things away by giving stuff BIOS is so good in theory
and fails so much in practice because bugs.

> So I've never looked at MIPI stuff at all before. ...but, as far as I
> can tell your panel is implementing MIPI DBI Type C Option 1 (3-line
> SPI). It feels like you should be using the functions for dealing with
> MIPI DBI, like mipi_dbi_spi_init(), mipi_dbi_command(). If I'm reading
> the code correctly, I think that will have the benefit of making your
> panel more flexible in terms of the capabilities of the SPI
> controller. It seems to handle the case when the SPI controller
> doesn't support 9-bits-per-word transfers, for instance.
>
> If you have a good reason for not using the MIPI DBI functions then
> let me know and I'll look over your functions more closely.

MIPI DBI nominally requires an extra (GPIO) line called D/C
(data/command) and this display for sure does not have it.
So it would be "type c1" (no extra GPIO).

I will test and see if I can get DBI working... if I do I will
respin v2 to v3.

Yours,
Linus Walleij
