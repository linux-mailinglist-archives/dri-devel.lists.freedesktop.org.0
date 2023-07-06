Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4B74A62D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1C310E4CC;
	Thu,  6 Jul 2023 21:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D4D10E4CC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 21:58:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbb07e7155so42385e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 14:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688680711; x=1691272711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hEParp9WLCAzJ3tEVRlPTLLmfvfF/hCapi/kGt1xYS8=;
 b=xiB/EdWarYX/DABsjTSbkGjKLUXIBA/on3IZ9C5asF3xRQs7MvPzZ8Yhkw7i6jQstE
 Y1NbNXGIdu/ToE2OjUzQPG5X4xID1vpsFXasYJyBzZHpwzwUKfSdrKhpaySPn+1SDuwN
 r+xv0JB8aQTdIjkXPjPlcjdCI/R2dVTzf4SDPIwXsRoaTMlkiAerr48tgWlkfpV/ZZTN
 Moy/gJeQkmODRoVFubt83Nfon1X5+S4K4sxpa/SGdYU1ukjlH0LEF3jIrfoKsTcGTx9+
 FXjjAXBchIiKkAxtguMuKtFHHhNSUQLZNMdC+EuM6gRRlyjBP0pwHNI8vpypyaRpZy7q
 jJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688680711; x=1691272711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hEParp9WLCAzJ3tEVRlPTLLmfvfF/hCapi/kGt1xYS8=;
 b=EG8MfBnXyLCWNtvhLWnocCRD5B318QY2F3ZMf1CZkt+B1Urr5IczcHKPsfsk09i8E5
 4hpYEsbczk06FBnaNhmdQMsnHuWmXR9K+dWJWll9N6tt79Rw2qhBxgV34IIZfWC7gpk+
 M2pxKLx3kVCsgjMGsu7jsksJ7gyJ/JTNkU9qnRhxFLsAHsChzkez2QgC7dRbJjQ65OQn
 WFjazl7ynmVcwbqAI0t9xRmyKTWppcNJQq0x23pFP6VbQsBTwQHVqcQKRDF5hlQH5a4u
 /POiT+yLfQ2JUrZROvPXKt/k8pnM9dVPejHQ3G5Pd/n9OAKVdgU1XOsitPExlzzswWD2
 A4Yw==
X-Gm-Message-State: ABy/qLZMPW4sKg+zq7obnRmmMg6E9EwCwOZudK88OaH26GjS6zgMJGDk
 htVBMbmHyP9DAQw90RobpcJtbjZeZT3UHzS4uji5ug==
X-Google-Smtp-Source: APBJJlEucBcuIwFpFaL47CRMtACqwMy+V+9VA2el4pY1YppjoFasEMeMh2eRbuXA0Dxre1rzbmTDPgUHDjF2z7ZaK9s=
X-Received: by 2002:a05:600c:46cd:b0:3f6:f4b:d4a6 with SMTP id
 q13-20020a05600c46cd00b003f60f4bd4a6mr7987wmo.7.1688680711257; Thu, 06 Jul
 2023 14:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-5-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W_Vw=WTuap60PtzU8Jc58T1PsEhJfY96NmFFgmC1DB9w@mail.gmail.com>
 <CACRpkdZkNio99zS+ttEXncOtS1TcYbfunKSKddErRDV1gTY43w@mail.gmail.com>
 <CAD=FV=Xx_Bf=Fr1aCmmcjXAv1CyMYwEFba7C6k_HRE1VPtTtHQ@mail.gmail.com>
 <CACRpkdYif_h38TYDuSjY-0WkWNknFOe8n2Xe7zBydKxySrdZHA@mail.gmail.com>
In-Reply-To: <CACRpkdYif_h38TYDuSjY-0WkWNknFOe8n2Xe7zBydKxySrdZHA@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 6 Jul 2023 14:58:19 -0700
Message-ID: <CAD=FV=WNgAr=YaMu9+KSxZSHpG9Z31Pbka1N3E-OYR1-WKHiaQ@mail.gmail.com>
Subject: Re: [v4 4/4] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI
 panel
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 6, 2023 at 2:36=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Thu, Jul 6, 2023 at 11:25=E2=80=AFPM Doug Anderson <dianders@google.co=
m> wrote:
>
> > In my mind it's really a tradeoff and I'm happy to go with whatever
> > consensus that others agree with. What I'm never super happy with,
> > though, is changing the bikeshed color too often, so I'd be really
> > curious to hear Sam's thoughts on the issue and whether he'd like to
> > see this driver broken out into a dozen drivers.
>
> This is not question about a dozen drivers, to be clear.
>
> I just want to break out the drivers that have an identifiable
> display controller that differs from the others, especially this one.
>
> The rest of the drivers inside of this boe driver I can't really tell,
> they seem related? We don't know?
>
> So the Ilitek ILI9882t is an obvious break-out.

I guess. To me it feels like the concept of breaking the driver into
multiple sub-drivers and the idea of supporting ILI9882t more cleanly
are orthogonal. You could still do your patch #4 and break out the
page switching function without breaking up the driver.

It feels to me fairly likely that many of the panels here are just as
different from each other as the ILI9882t is from them. I guess it's
not a dozen, but it feels like using the same "how different are they
from each other" metric we'd end up with at least 5-6 new drivers. It
seems clear to me that the panel that Sam first commented on is as
different from the others in the BOE driver as the ILI9882t is.
Certainly it has a pretty darn big unique command sequence for init...


> For the rest, I guess I would be happier if the Chromium people
> could use their leverage with vendors to muscle out the details
> about display controller vendors and provide #defines for all
> magic commands, we all dislike these opaque firmware-looking
> jam tables.

Yeah, I've grumbled about this with each new blob added. For instance:

https://lore.kernel.org/r/CAD=3DFV=3DUo-7rFWGiJG0oJ0ydosA4DxhFqiWGrab1zoZyx=
yPsOBg@mail.gmail.com/

Where I said:

> I'm not really an expert on
> MIPI panels but the convention of a big stream of binary commands
> seems to match what other panels in this driver do, even if their
> table of binary data isn't quite as long as yours (are all of yours
> actually needed?)

The problem is that it's hard for me to make a strong argument here
when there is prior art of panels being supported with blob-sequences.
In this case, I think you as an upstream developer have more leverage.
I can help put pressure to make sure that upstream concerns are
addressed, but I think it's on upstream to put their foot down and say
that these blob sequences are not OK for new panels. In each case I
landed a patch with a new blob sequence I tried to give the community
time to respond and I tried to telegraph what I was going to do to
make sure nobody was surprised...

-Doug
