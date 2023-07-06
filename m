Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD374A6D4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 00:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625B910E107;
	Thu,  6 Jul 2023 22:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089F010E107
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 22:22:07 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-c2cf4e61bc6so1442425276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 15:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688682126; x=1691274126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3ZnLWYda5s0Z078Xc8xlFfay4f1nZm55XtpErGsqnI=;
 b=J0xYFGJIHP1aeu1ek9eG6XIflCT3/NG5yzgBPxYBMizXOBO6SzfvC8tP6I15LvmIyd
 0/diWULwbjQ+pfs84WKRci9q6gNUy690OJ5bQxf9A0iUP86G1a2NW6Rsh335QFw4SHrg
 QeEZg3tfQ6RrkGkLW40v5FL8L8RPmgAomh9KQTHghpFGgAi1wSA7vnm65RByZrKHjuyA
 Mu41CqWfjXSP5Z3ymsrnEDQw2bdhsL4P+0d1m2aGKX6s2dl5EgV73G3hSw+1i67ecDDu
 mqEASUR4Sgg+gZMDouNoM1kRp4yLc4SJlTNYZHiQGwzBBWmekZfuUGwqEFnXUwROF7U7
 od0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688682126; x=1691274126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3ZnLWYda5s0Z078Xc8xlFfay4f1nZm55XtpErGsqnI=;
 b=RNejrrhEo5+TukxX5heDO82wkaTwxU2m7YX0igPwL6C92BWfQ0qaRaIoZJzwg5Ixnz
 RephNKJBc89sksHprg3c6ivh800WwTuRanguWutCkDA4B7OUa1iL56Y0IIKaH6F1jKZG
 CA6CzEyNw4F09PeG7NI/bRI6idOG8iBZlUf5spi6Q/5ljsqPgt5go/Zb0SnjBKrxE07+
 r0majAV9isW9wUqB4YzZm7k99G06qxk4kVUIGulXZxkHnwkjotgNgkhYW8tMByf3p0HF
 8meithLxnl/l+1IFoYwxUTZ0ZaKrOFqaOI1YevPdvST0wPITYhnFDV5krJJ70KZ2r58C
 8FDQ==
X-Gm-Message-State: ABy/qLYw2DXJIkFF5Q8CzMoBPx8Fa7/O7EMm5Mn+gM+ey4WXk3LB4MaS
 yaCqiVHx2LiiZnz0IiPIKf8CfJ5pQjD0F/FMSMjSmQ==
X-Google-Smtp-Source: APBJJlHrD0uZZQ/A/cUft82Lh9JCBJX/moY+JJATbzzD92duMgZi6yTWphFsvwNzjoMvOd6ujc0JNbgYNkCWWuDeuO4=
X-Received: by 2002:a25:9cc6:0:b0:bfe:d93a:8f2b with SMTP id
 z6-20020a259cc6000000b00bfed93a8f2bmr4069609ybo.60.1688682126451; Thu, 06 Jul
 2023 15:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-5-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W_Vw=WTuap60PtzU8Jc58T1PsEhJfY96NmFFgmC1DB9w@mail.gmail.com>
 <CACRpkdZkNio99zS+ttEXncOtS1TcYbfunKSKddErRDV1gTY43w@mail.gmail.com>
 <CAD=FV=Xx_Bf=Fr1aCmmcjXAv1CyMYwEFba7C6k_HRE1VPtTtHQ@mail.gmail.com>
 <CACRpkdYif_h38TYDuSjY-0WkWNknFOe8n2Xe7zBydKxySrdZHA@mail.gmail.com>
 <CAD=FV=WNgAr=YaMu9+KSxZSHpG9Z31Pbka1N3E-OYR1-WKHiaQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WNgAr=YaMu9+KSxZSHpG9Z31Pbka1N3E-OYR1-WKHiaQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jul 2023 00:21:55 +0200
Message-ID: <CACRpkdZLgf15Ao6CPym6q2yC17XcA3kjtDCQ3F2-aa-XwZJ=xg@mail.gmail.com>
Subject: Re: [v4 4/4] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI
 panel
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 6, 2023 at 11:58=E2=80=AFPM Doug Anderson <dianders@google.com>=
 wrote:

> > So the Ilitek ILI9882t is an obvious break-out.
>
> I guess. To me it feels like the concept of breaking the driver into
> multiple sub-drivers and the idea of supporting ILI9882t more cleanly
> are orthogonal. You could still do your patch #4 and break out the
> page switching function without breaking up the driver.

Yeah that's true. But with Ilitek in particular we have these nice
precedents:
drivers/gpu/drm/panel/panel-ilitek-ili9322.c
drivers/gpu/drm/panel/panel-ilitek-ili9341.c
drivers/gpu/drm/panel/panel-ilitek-ili9881c.c

So it looks disorganized to me if this one Ilitek panel controller
now goes inside another driver with other completely unrelated
drivers.

> It feels to me fairly likely that many of the panels here are just as
> different from each other as the ILI9882t is from them. I guess it's
> not a dozen, but it feels like using the same "how different are they
> from each other" metric we'd end up with at least 5-6 new drivers. It
> seems clear to me that the panel that Sam first commented on is as
> different from the others in the BOE driver as the ILI9882t is.
> Certainly it has a pretty darn big unique command sequence for init...

It doesn't really matter until we can say certainly what display controller
each of them is. It seems we can't, but for this one we can.

> The problem is that it's hard for me to make a strong argument here
> when there is prior art of panels being supported with blob-sequences.
> In this case, I think you as an upstream developer have more leverage.
> I can help put pressure to make sure that upstream concerns are
> addressed, but I think it's on upstream to put their foot down and say
> that these blob sequences are not OK for new panels. In each case I
> landed a patch with a new blob sequence I tried to give the community
> time to respond and I tried to telegraph what I was going to do to
> make sure nobody was surprised...

I would say it is not fair to block driver coming from hobbyists or minor
vendors just trying to make something work. In general I think a working
something is better than nothing so I wouldn't block anything.

But with big companies who actually talk to Ilitek, Novotek and the other
companies ending with -tek that make these display controllers I would
certainly like to send the message that datasheets and proper
defines would be appreciated, and say it is also for their best, because
I mentioned proper gamma correction is possible if the driver author
just invest time and works with the DRM community and that should
be in their best interest. Feel free to pass this along the supply
chain if you can.

Yours,
Linus Walleij
