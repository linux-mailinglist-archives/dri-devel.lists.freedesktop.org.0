Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B93B9E9B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 11:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E4C89DA6;
	Fri,  2 Jul 2021 09:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F010E89DA6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 09:59:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id r16so12541753ljk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GfahVMKXoqJMDp+7w4BPLKtNl5RQryGkFNwKs1Z5HWM=;
 b=EmDYGidXkLTcJ7Cqem4B02Z+cWa0yDqXhAKta/ZznWAe6uL5EEj7jPoPW8GAgr/gsv
 lqz3NgUkA5NqYbQ+Wmbv7f3DBeP6o2rgqKmwLH55dqpZZWRIQ6TukTMPASJo5v4vkOZ9
 PxpyZDYfztx4MPnzYqLkJafdf/kLoLJ2c0q7eJTKz5LOYQmTieCOvMUENJ+2Bo4taHsr
 VA7cN8kFh5OUv7EV+EHh19F5e7AWyoPrTcIdHS0rE2v/FY8qR/urBVYFTm4zrWaC93n/
 guRiD+OF2n+a5IaOFMWQdi2X6JmYn0uNC1DrL1vEUEa+oaEI8fGNPXqIp+P2OZblF/KV
 AwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GfahVMKXoqJMDp+7w4BPLKtNl5RQryGkFNwKs1Z5HWM=;
 b=KviyF7rlXh/5t4GYS6WmVoHiK/Cx+HoUXwOrvi7OskihEHGDGLcnjHPzwqFqQwwF9M
 +wHbliw8F8bP9iWVKCL3JW3EZl3SScGRa+xGdlZhk/CC+AANg3+PHX0TA25+Bb5C8LS1
 xeEZmgPYy0Y62P526mdOSZxWCoSaakrquqtmSWT0L0TBbMy4clUIR4zULYesgkFkE4a+
 SvYHL8Rm+vE9msx0cpUMYLmuiFwTElUS5+vvAQacl91klit1RqBy9eHbFDMYaLJndXj9
 GlWdikIv697q63IblGiUWkALwMbg63aeakjc15E3fnd+1kx2NgW/DZZrD3a2z7p108xE
 XwCg==
X-Gm-Message-State: AOAM533PpQS5TCVOvWdPBCKxOoOWGk/Afe1AJYS/e59av91xCuxdMIiK
 PLECsI/jA10APx9t/+E5MWn3PtF/hQ4miwZV449CBg==
X-Google-Smtp-Source: ABdhPJzZpTSpaHCT1O4iQ7TFrMx9ACQC6PSFyOm/8vVO1gXeY92ZYGj2GkFTE4pVUu66Y0wJHS0L0O19SDrmhPJAzuk=
X-Received: by 2002:a05:651c:603:: with SMTP id
 k3mr3204030lje.368.1625219944376; 
 Fri, 02 Jul 2021 02:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210701222518.3895552-1-linus.walleij@linaro.org>
 <YN6n5MzuwDNuJyW8@ravnborg.org>
In-Reply-To: <YN6n5MzuwDNuJyW8@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Jul 2021 11:58:52 +0200
Message-ID: <CACRpkdaJ6JPMFYud154gLm6nKjv8SbS4CfhnqcijCJMz0B3smQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dbi: Print errors for mipi_dbi_command()
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 2, 2021 at 7:45 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> > -     ret = mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
> > +     ret = mipi_dbi_command_buf(dbi, MIPI_DCS_SOFT_RESET, NULL, 0);
> >       if (ret) {
> >               DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
> >               if (dbidev->regulator)
>
> I do not see the value in this change??
> There are many other mipi_dbi_command() users and the error return
> continues to be checked?!??!

When we change the mipi_dbi_command() macro to check the error
value we can no longer retrieve the return value from the macro
so we need to use the call the command buf directly so that we
can obtain the return code.

I do not know any other way. Suggestions welcome!

> >  #define mipi_dbi_command(dbi, cmd, seq...) \
> >  ({ \
> >       const u8 d[] = { seq }; \
> > -     mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> > +     int ret; \
> > +     ret = mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> > +     if (ret) \
> > +             pr_err_ratelimited("MIPI DBI: error %d when sending command\n", ret); \
> >  })
>
> Coud this be more informative if the spi device was printed, it is
> available? Maybe in 99% of the cases there is only one user anyway so it
> will not help?

Hm I can get to the SPI device, lemme try this.

Yours,
Linus Walleij
