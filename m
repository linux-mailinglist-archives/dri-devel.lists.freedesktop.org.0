Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3A259DB2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 19:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAAE6E8B9;
	Tue,  1 Sep 2020 17:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467006E8B8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 17:55:23 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b12so158995lfp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpCxI6GYcNIiqmjQ7hXxtMp6pAbD0ztpg7wc0lZGGUQ=;
 b=Zj8Wm1/Q/DjIi87D+ASPbHCEihP/cpwmqWxk7XzaVAH07gP9LtmjHGBeKhOi4WMToD
 SvTZ+E9Xlw5/f5arfhdVe3Hj79EMKjDN+5p7SxqMUw+zIp84n8GjmYN35Eb8YV3aSYVh
 /SQZlDA0sU50qWB2VL9gelpnzTEVJwlVtLYNjJgXx54zAhRjpgN+/iwRnnU9ANDON4LT
 DCj1QMgLzq0/k3gm13ezIbcJdX8ueh70qOYxcQO3U8O4DFezLLLgg6HrV1d/c/R0mcGt
 kcqP5nIpSc/hJ7sufQcoFFjEH03AFhqIoviU8bODEO3yBjOKndep9wMgQv2v+Es1MO+k
 775w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpCxI6GYcNIiqmjQ7hXxtMp6pAbD0ztpg7wc0lZGGUQ=;
 b=Q5rOU5T2BPJL60A1lHb851/TnWyAAqL9DBOd2d+HO9OfPvVlvk4VeNOYciQNz9JbAh
 vdYFSWVAq1dLo/Hh5mSFb5Dn8mwMK8i3o2BAhQDXRaWIdqeil78xNnGEpl3Tzs6SDhEM
 bXq7W5qzf4Vqn+0ndVjHPzwK3eKrfU96BpX3/QPov5DXKm/fjmYaUfoHKUMwXASKs8Y+
 uaAnzXuUTMIsrCCqbcgnIAseCLzX8P1w7fkVV9gm4noN5rdpLINIihCsYQHEXe+yC+PX
 JJbl4/woBr4f1BRJO2DrDRoSDi4ImT9uxoKNfgod8JENDCrHqjpCPlAYmRaAU/IlI/VF
 oA1g==
X-Gm-Message-State: AOAM530bm7V+zICi14+GIRy+j5OTrOzoCt9F65yoPErAW5u45TgOZPUb
 IWWdvpl02/GmquEyX0U28UxY6GItUdUiyQGPSsKZ1jtIdKc=
X-Google-Smtp-Source: ABdhPJz7ZgZ8/FojiJ7tnC4p40kUVMlIUPbkXtJg6DVEmtbZFIYs/u2BbdhjNo4QV/yHNbla7jkq3DmuyAn507fSqEg=
X-Received: by 2002:a19:d95:: with SMTP id 143mr1154590lfn.4.1598982921426;
 Tue, 01 Sep 2020 10:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200809215104.1830206-1-linus.walleij@linaro.org>
 <20200818171020.GA2290142@ravnborg.org>
 <CACRpkdaRVpGC536iSZ9ZYcOMukd9VyAkcTwmuahQJEA3tNwuqA@mail.gmail.com>
In-Reply-To: <CACRpkdaRVpGC536iSZ9ZYcOMukd9VyAkcTwmuahQJEA3tNwuqA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Sep 2020 19:55:10 +0200
Message-ID: <CACRpkdaOOk_btvgk=8sJSDMUwyDDB=4pYNQG1iTHztnMUQXw7A@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panel: s6e63m0: Add DSI transport
To: Sam Ravnborg <sam@ravnborg.org>, Paul Cercueil <paul@crapouillou.net>
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 11:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Aug 18, 2020 at 7:10 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > How does this patchset relate to the patchset posted by Paul?
> > https://lore.kernel.org/dri-devel/20200727164613.19744-1-paul@crapouillou.net/
>
> Not much. S6E63M0 uses "spi" as it is right now and is not using
> the existing DBI code.
>
> So it would require it to start using the DBI core to begin with.
> If it can. Which is kind of an orthogonal task.
>
> What would be the defining character for it to
> be "DBI"? I do see that the driver sends MIPI standard commands
> over SPI. I suspect this is another standard without public specs...
>
> > Seems that two different approcahes are used for the same type of
> > problem.
>
> This approach is based on the approach from IIO, se e.g.:
> drivers/iio/accel/bmc150-accel-core.c
> drivers/iio/accel/bmc150-accel.h
> drivers/iio/accel/bmc150-accel-i2c.c
> drivers/iio/accel/bmc150-accel-spi.c
>
> > Is it possible to find a common solution?
>
> I'm happy to rework it any direction. If the other patch set is going to
> take time to finalize (as in: will not merge it the coming week, need to
> hack and stuff) then I'd prefer to apply this so I know my display works
> in v5.10. I can certainly rework it into Paul's framework when that
> arrives.

Is it OK to merge this as-is? I'm fishing for an ACK here...

I will certainly adapt to the DBI framework when/if it arrives,
and I think my track record makes that claim believeable.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
