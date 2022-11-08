Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92721621768
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 15:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D97010E468;
	Tue,  8 Nov 2022 14:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1B410E3CA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 14:53:03 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3321c2a8d4cso135924487b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeruRM6pLf0L2avHjfnGbDq+RAbm6eC6yZuwoRzHAnA=;
 b=iuA6PP+T9uVV7ZG4XlLfplyArIAnLIDkoJqaQysMhRw8M/5NtjlVpvsWpULdCxJsZH
 qkkAKhezpwR6cdXuteUIoNSwD6zX2GN65l6CTQUqDw5A3e3kDeyG2IVB0QfnBVrSm2Np
 jVmYvTfq4DtXeM8qAo5gCXZjZaF5NehUyRX5F/tS8eT7lmCB8dUt6QhqtnLLrxj/BRfV
 8B86BhDVWPN2RKjcw2gFCxdabk4WJRHtDYmIOg1xBVx7+egvQXLwXPhrPL0wvasRYjiu
 3tgLSId9Tcw6yQ3dEiMN7UQnRDThfu1V7fVGXWK3WC+bkhhOiDfq+AKWZ/41VJqki0ur
 lpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeruRM6pLf0L2avHjfnGbDq+RAbm6eC6yZuwoRzHAnA=;
 b=3N8ldCTsthcvejuBiGeg2rFaPpFJ3UMJ2SF8ddaq4GgiYa/V1qHzX6Hkg47eisSZEi
 ZnXJE4J8vt7Dq7Iul/ewfdzmEG+3TxilSlxWZI0zhvQD++d9OFY9MPnliWuSYGCy7ZxJ
 SnozFCPG7JOlLJ7Z1kgILRjBaAuHe98oKpmVlf2FpPkOmtfc4zKiXMddzamRM7oe2vbt
 8t0yc60MvqA6wbzRDC/btgpo9uoBzj8KpXRPgLSTIM2eoMXp/z+OGj0y9De7mTPUzZ4T
 BPyw8VHcd3flzxXev92aZ5zkcl4LywtlcR9wIW38d2NuI4PvDIt42HR4EiYi1oREarwX
 kYDQ==
X-Gm-Message-State: ACrzQf2A9au+sE7XdoFgRUGUhea+SfLhWFbkQZ7nHyBi99465jKdVmdd
 P8CZhvVA3TIMmTXtjcztV+8TENQxV9SMLU2/JZ4rbQ==
X-Google-Smtp-Source: AMsMyM7umw9tL2RgbOU7i+wbmGkatqn7q9n9iSKlRNYjy/7igub4VkhEoChiS0zAcmHPAVfN8dn6fPdtAk0N+fxIX/M=
X-Received: by 2002:a81:468b:0:b0:364:8aa:8196 with SMTP id
 t133-20020a81468b000000b0036408aa8196mr53986180ywa.468.1667919182275; Tue, 08
 Nov 2022 06:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20221103141155.1105961-1-jagan@edgeble.ai>
 <20221103141155.1105961-4-jagan@edgeble.ai>
 <CACRpkdYEW4z6EZ7UC9wT3NtRVnE=0L6AAHJDxtu5Jb-UrB+WSA@mail.gmail.com>
 <CA+VMnFxyx=NP2QUiJ6RnfapZ9c=S4-cj+0kQn8PYyaMTBP3i-g@mail.gmail.com>
 <CACRpkdaZnGgJ3egXEtoH0gTmR0m_-9Q+iGZr2eOx2JVHYgXCXA@mail.gmail.com>
In-Reply-To: <CACRpkdaZnGgJ3egXEtoH0gTmR0m_-9Q+iGZr2eOx2JVHYgXCXA@mail.gmail.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Tue, 8 Nov 2022 20:22:51 +0530
Message-ID: <CA+VMnFz1h0MfwxiQeFCdvMJWQ9uKWvwstJvKnpDTKjaVHN3pYw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: panel: Add Jadard JD9365DA-H3 DSI panel
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Nov 2022 at 20:18, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 8, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> > On Tue, 8 Nov 2022 at 19:31, Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Thu, Nov 3, 2022 at 3:12 PM Jagan Teki <jagan@edgeble.ai> wrote:
> > >
> > > > Jadard JD9365DA-H3 is WXGA MIPI DSI panel and it support TFT
> > > > dot matrix LCD with 800RGBx1280 dots at maximum.
> > > >
> > > > Add support for it.
> > > >
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> > > > ---
> > > > Changes for v3:
> > > > - updatd to WXGA
> > > > - use JD9365DA_CMD_DCS and JD9365DA_CMD_DELAY
> > >
> > > My comments on v2 have not been addressed, for example I asked to
> > > remove the delay from sequences and just use an explicit delay and
> > > to then use the existing sequence sending macro.
> >
> > True, I responded on the same day [1], since I didn't get the reply I
> > have posted by assuming my comment is valid. Would you please check
> > and respond?
> >
> > [1] https://lore.kernel.org/all/CA+VMnFz0w-6O=wt3iuJo1BhQgPZ2XbpX6JdDz6vg_JW9nHTR2A@mail.gmail.com/
>
> OK I see, sorry for not reading close.
>
> The driver just supports one single variant.
>
> What you are doing is preparing the ground for more variants
> that may or may not exist. This creates the antipattern "big upfront design"
> i.e. abstractions added for things that do not yet exist.
>
> I think it is better to strip it down to just open coding the delay after
> the init sequence. When the next variant appears, if ever, they can
> add abstraction. Maybe they need the same delay in the same
> place? Who knows...

I understand your point, but delays are strictly mentioned by the
panel vendor init sequence, cz101b4001 do you think adding in the
generic or common code is still valid since we have code added for
cz101b4001 specifically via driver data?

Thanks,
Jagan.
